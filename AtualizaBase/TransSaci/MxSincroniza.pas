unit MxSincroniza;

interface

//Falta Filtrar TROCA e ITEM_DE_TROCA. É necessário criar o campo TRO_DT_ALTERADO e atualizá-lo
//quando a nota for emitida

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, StdCtrls, Db, inifiles, ExtCtrls, SQuery, Variants,
  Configuracao, Parametro, Mensagem, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, IdBaseComponent,
  IdAntiFreezeBase, IdAntiFreeze;

type
  TfmxSincroniza = class(TForm)
    tblOrigem: TTable;
    tblDestino: TTable;
    BatchMove1: TBatchMove;
    qryDestino1: TQuery;
    Database1: TDatabase;
    Database2: TDatabase;
    lsbTabelas: TListBox;
    Timer1: TTimer;
    QueryOrigem: TQuery;
    qryDestino2: TQuery;
    QueryOrigem2: TQuery;
    DatabaseSACI: TDatabase;
    Configuracao1: TConfiguracao;
    QR_Consulta: TQuery;
    QR_Comandos: TQuery;
    Parametro1: TParametro;
    Mensagem1: TMensagem;
    IdAntiFreeze1: TIdAntiFreeze;
    IdFTP1: TIdFTP;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
  private
    iCPD: integer;
    sFTPHost, sFTPUsu, sFTPSenha,sFTPProxyHost,
      sFTPProxyUsu, sFTPProxySenha, sFTPProxyPorta, sPastaRaizFTP: string;
    vTabelaFiltrada, vFalhaLocal, vMagazine: Boolean;
    CdCECCNC, CdCEC, CdCEFCNC, CdCEF: integer;
    sPastaParaCompactar, sPastaRecep: string;
    procedure DeletarRegistroDestino(PSigla, PCC: string;
      PCodigo: integer; CNCOrigem:Boolean=False);
    procedure DeletarRegistrosDestino(PSigla, PCampoData, PCC: string;
  CNCOrigem:Boolean=False);
    procedure EnviarArquivoFTP;
    function BaixarArquivoFTP(PPastaFTP, PArquivoFTP, PPastaDestino, PArquivoDestino: string):Boolean;
  public
    conf,conf2:TIniFile;
    CC, vTabelaAtual, sSomenteTabela: String;
    T1: TextFile;
    vDataReferencia: TDateTime;
    iDiasEnvio: integer;
    procedure Sincronizar;
  end;

const
  cTransSACIEnviar  = 1; //Filial-CPD (Filial)
  cPFase2           = 2; //Filial-CPD (CPD)
  cPFase3           = 3; //CPD-Filial (CPD)
  cTransSACIReceber = 4; //CPD-Filial (Filial)

var
  fmxSincroniza: TfmxSincroniza;

implementation
uses Funcoes, Main;
{$R *.DFM}


//Anderson Gonçalves
function DifDias(DataVenc:TDateTime; DataAtual:TDateTime): String;
Var Data: TDateTime;
dia, mes, ano: Word;
begin
  if DataAtual < DataVenc then
    Result := 'A data data atual não pode ser menor que a data inicial'
  else
  begin
    Data := DataAtual - DataVenc;
    DecodeDate( Data, ano, mes, dia);
    Result := FloatToStr(Data)+' Dias';
  end;
end;
////////////

procedure TfmxSincroniza.FormShow(Sender: TObject);
var
  arquivo, Linha, sArqTabela, sNomeArq, sParametro, sAliasLocal, sPastaMafalda:String;
  vHoraINI: TDateTime;
begin
  if not DirectoryExists('C:\SACI') then
    CreateDir('C:\SACI');
  if not DirectoryExists('C:\SACI\LOG') then
    CreateDir('C:\SACI\LOG');

  if self.Tag = cPFase2 then
    sPastaRecep := ExtractFilePath(ParamStr(0))
  else
    sPastaRecep := '';

  sPastaParaCompactar := '';

  vHoraINI := Now;

  if (self.Tag IN [cPFase2, cPFase3]) then
    AssignFile(T1, 'C:\SACI\LOG\LOG_PFase'+IntToStr(self.Tag)+'_'+formatDateTime('YYYYMMDDHHNNSS',vHoraINI)+'.txt')
  else if self.Tag = cTransSACIEnviar then
    AssignFile(T1, 'C:\SACI\LOG\LOG_TransSACIEnvia'+'_'+formatDateTime('YYYYMMDDHHNNSS',vHoraINI)+'.txt')
  else
    AssignFile(T1, 'C:\SACI\LOG\LOG_TransSACIRecebe'+'_'+formatDateTime('YYYYMMDDHHNNSS',vHoraINI)+'.txt');
  Rewrite(T1);
  Linha := 'Arquivo: '+sPastaRecep;
  Writeln(T1, Linha);
  Linha := 'Processo Iniciado : '+formatDateTime('DD/MM/YYYY HH:MM:SS',vHoraINI);
  Writeln(T1, Linha);
  try
    if self.Tag = cTransSACIEnviar then
      arquivo:=ExtractFilePath(ParamStr(0))+'confEnviaFILIAL.ini'
    else if self.Tag = cTransSACIReceber then
      arquivo:=ExtractFilePath(ParamStr(0))+'confRecebeFILIAL.ini'
    else if self.Tag = cPFase2 then
      arquivo:=ExtractFilePath(ParamStr(0))+'confRecebeCPD.ini'
    else if self.Tag = cPFase3 then
      arquivo:=ExtractFilePath(ParamStr(0))+'confEnviaCPD.ini';

    if not FileExists(arquivo) then
    Begin
      vFalhaLocal := True;
      Writeln(T1, 'Arquivo não encontrado <<'+arquivo+'>>');
      if self.Tag in [cTransSACIEnviar, cTransSACIReceber] then
      Begin
        fMxPrincipal.vFalha := True;
        ShowMessage('Arquivo não encontrado <<'+arquivo+'>>');
      end;
      Raise exception.Create('');
    end;

    if self.Tag = cTransSACIEnviar then
      sArqTabela := ExtractFilePath(ParamStr(0))+'tabelasEnviaFILIAL.txt'
    else if self.Tag = cTransSACIReceber then
      sArqTabela := ExtractFilePath(ParamStr(0))+'tabelasRecebeFILIAL.txt'
    else if self.Tag = cPFase2 then
      sArqTabela := ExtractFilePath(ParamStr(0))+'tabelasRecebeCPD.txt'
    else if self.Tag = cPFase3 then
      sArqTabela := ExtractFilePath(ParamStr(0))+'tabelasEnviaCPD.txt';

    if not FileExists(sArqTabela) then
    Begin
      vFalhaLocal := True;
      Writeln(T1, 'Arquivo não encontrado <<'+sArqTabela+'>>');
      if self.Tag in [cTransSACIEnviar, cTransSACIReceber] then
      Begin
        fMxPrincipal.vFalha := True;
        ShowMessage('Arquivo não encontrado <<'+sArqTabela+'>>');
      end;
      Raise exception.Create('');
    end;

    conf:=TIniFile.Create(arquivo);

    if sSomenteTabela = '' then
      lsbTabelas.Items.LoadFromFile(sArqTabela)
    else
      lsbTabelas.Items.Add(sSomenteTabela); //As tabelas de controle também serão enviadas

    //Para enviar as tabelas de controle devem ser enviadas no final, mas para receber tem que ser no início
    if self.Tag in [cTransSACIEnviar, cPFase2] then
    Begin
      //Precisam ser enviados pela FILIAL e recebidos pelo CPD
      if self.Tag = cPFase2 then
      Begin
        lsbTabelas.Items.Insert(0,'CONTROLE_ENVIO_FILIAL');    //Ordem obrigatória
        lsbTabelas.Items.Insert(1,'CONTROLE_RECEBIMENTO_CPD'); //Não interessa a ordem
        lsbTabelas.Items.Insert(2,'REGISTRO_DELETADO');        //Processar antes de receber a tabela.
      end
      else
      Begin
        lsbTabelas.Items.Add('CONTROLE_RECEBIMENTO_CPD'); //Não interessa a ordem
        lsbTabelas.Items.Add('REGISTRO_DELETADO');        //Não interessa a ordem
        lsbTabelas.Items.Add('CONTROLE_ENVIO_FILIAL');    //Ordem obrigatória. Não colocar nada abaixo.
      end;
    end
    else if self.Tag in [cTransSACIReceber, cPFase3] then
    Begin
      //Precisam ser enviados pelo CPD e recebidos pela FILIAL
      if self.Tag = cTransSACIReceber then
      Begin
        lsbTabelas.Items.Insert(0,'CONTROLE_ENVIO_CPD');          //Ordem obrigatória
        lsbTabelas.Items.Insert(1,'CONTROLE_RECEBIMENTO_FILIAL'); //Nao interessa a ordem
      end
      else
      Begin
        lsbTabelas.Items.Add('CONTROLE_RECEBIMENTO_FILIAL');      //Nao interessa a ordem
        lsbTabelas.Items.Add('CONTROLE_ENVIO_CPD');               //Ordem obrigatória
      end;
    end;

    CC := conf.ReadString('dborigem', 'CC', '');
    sFTPHost  := conf.ReadString('internet', 'HOST', '');
    sFTPUsu   := conf.ReadString('internet', 'USUARIO', '');
    sFTPSenha := conf.ReadString('internet', 'SENHA', 'guerra');
    sFTPProxyHost  := conf.ReadString('internet', 'ProxyHOST', '');
    sFTPProxyPorta := conf.ReadString('internet', 'ProxyPORTA', '21');
    sFTPProxyUsu   := conf.ReadString('internet', 'ProxyUSUARIO', '');
    sFTPProxySenha := conf.ReadString('internet', 'ProxySenha', '');
    iCPD := StrToInt(conf.ReadString('Configuracao', 'CPD', '0')); //1 Russas; 2 Aracati; 3 Mafalda; 4 Itapipoca; 5 Luciano
    vMagazine := (conf.ReadString('Configuracao', 'Magazine', '0') = '1'); //0 Eletro; 1 Magazine

    if self.Tag = cPFase2 then
      Application.Title := 'PFase2 - '+CC
    else if self.Tag = cPFase3 then
      Application.Title := 'PFase3';

    with Database1 do
    begin
      DriverName:=conf.ReadString('dborigem', 'DRIVER NAME', '');
      if DriverName='MSSQL' then
      begin
        Params.Add('SERVER NAME='+conf.ReadString('dborigem', 'SERVER NAME', ''));
        Params.Add('DATABASE NAME='+conf.ReadString('dborigem', 'DATABASE NAME', ''));
      end
      else if DriverName='STANDARD' then
      begin
        Params.Clear;
        Params.Add('PATH='+conf.ReadString('dborigem', 'PATH', ''));
        if self.Tag = cPFase2 then
        Begin
          sPastaRecep := conf.ReadString('dborigem', 'PATH', '');

          //Descompactar
          sNomeArq := 'C:\SACI\SISTEMA\UNRAR.EXE';  //UNRAR.EXE

          if not FileExists(sNomeArq) then
          Begin
            vFalhaLocal := True;
            Writeln(T1, 'Arquivo não encontrado <<'+sNomeArq+'>>');
            Raise exception.Create('');
          end;

          //Apagar tabelas antigas (sem apagar o SACI_FILIAL.RAR e SACI_FILIAL2.RAR)
          ApagarArquivos(sPastaRecep, '*.*', 'SACI_FILIAL.RAR', 'SACI_FILIAL2.RAR');

          if iCPD = 3 then //Mafalda
            sPastaMafalda := 'MAF'
          else
            sPastaMafalda := '';

          if not FileExists(sPastaRecep+'\SACI_FILIAL.rar') then
          Begin
            Application.Title := 'PFase2 - '+CC+' BAIXANDO';

            //Nas lojas que não têm Internet o confRecebeCPD não tem HOST definido estão não haverá conexão
            BaixarArquivoFTP('/'+sPastaMafalda+'LOJA_'+PreencheZero(2,CC),'SACI_FILIAL.rar',sPastaRecep,'SACI_FILIAL.rar');
            if not FileExists(sPastaRecep+'\SACI_FILIAL.rar') then
            Begin
              vFalhaLocal := True;
              Writeln(T1, 'Arquivo não encontrado <<SACI_FILIAL.RAR>>');
              Raise exception.Create('');
            end;
          end;

          sParametro := ' E -Y '+sPastaRecep+'\SACI_FILIAL.RAR '+sPastaRecep+'\. ';

          Application.Title := 'PFase2 - '+CC+' DESCOMPACTANDO';

          ExecutarEXEAguardando(sNomeArq, sParametro);
        end;
      end;
      try
        open;
      except
        vFalhaLocal := True;
        Writeln(T1, 'Falha ao Conectar com o Banco (Origem):');
        if DriverName='MSSQL' then
        Begin
          Writeln(T1, 'SERVER NAME: '+conf.ReadString('dborigem', 'SERVER NAME', ''));
          Writeln(T1, 'DATABASE NAME: '+conf.ReadString('dborigem', 'DATABASE NAME', ''));
        end
        else
          Writeln(T1, 'PATH='+conf.ReadString('dborigem', 'PATH', ''));

        if self.Tag in [cTransSACIEnviar, cTransSACIReceber] then
        Begin
          fMxPrincipal.vFalha := True;
          ShowMessage('Falha ao Conectar com o Banco (Origem)!');
        end;
        Raise exception.Create('');
      end;
    end;
    with Database2 do
    begin
      DriverName:=conf.ReadString('dbdestino', 'DRIVER NAME', '');
      if DriverName='MSSQL' then
      begin
        Params.Add('SERVER NAME='+conf.ReadString('dbdestino', 'SERVER NAME', ''));
        Params.Add('DATABASE NAME='+conf.ReadString('dbdestino', 'DATABASE NAME', ''));
      end
      else if DriverName='STANDARD' then
      begin
        Params.Clear;
        Params.Add('PATH='+conf.ReadString('dbdestino', 'PATH', ''));
        //Apagar tabelas antigas
        ApagarArquivos(conf.ReadString('dbdestino', 'PATH', ''), '*.*');
        if self.Tag = cPFase3 then
          sPastaParaCompactar := conf.ReadString('dbdestino', 'PATH', '');
      end;
      try
        open;
      except
        vFalhaLocal := True;
        Writeln(T1, 'Falha ao Conectar com o Banco (Destino):');
        if DriverName='MSSQL' then
        Begin
          Writeln(T1, 'SERVER NAME: '+conf.ReadString('dbdestino', 'SERVER NAME', ''));
          Writeln(T1, 'DATABASE NAME: '+conf.ReadString('dbdestino', 'DATABASE NAME', ''));
        end
        else
          Writeln(T1, 'PATH='+conf.ReadString('dbdestino', 'PATH', ''));
        if self.Tag in [cTransSACIEnviar, cTransSACIReceber] then
        Begin
          fMxPrincipal.vFalha := True;
          ShowMessage('Falha ao Conectar com o Banco (Destino)');
        end;
        Raise exception.Create('');
      end;
      sAliasLocal := conf.ReadString('dbLocal', 'ALIAS', 'SACI');
      if self.Tag = cPFase3 then
        try
          iDiasEnvio := StrToInt(conf.ReadString('dbLocal', 'DIAS', '2'));
        except
          iDiasEnvio := 2;
        end;
    end;

    ApagarArquivos(sPastaRecep, '*.*', 'SACI_FILIAL.RAR', 'SACI_FILIAL2.RAR');

    try
      DatabaseSACI.Connected := False;
      DatabaseSACI.AliasName := sAliasLocal;  //SACI ou SACI_T
      DatabaseSACI.Connected := True;
      Configuracao1.Open;
    except
      vFalhaLocal := True;
      if self.Tag in [cTransSACIEnviar, cTransSACIReceber] then
      Begin
        fMxPrincipal.vFalha := True;
        ShowMessage('Falha ao Conectar com o Banco SACI');
      end;
      Raise exception.Create('');
    end;
    if self.tag = cTransSACIReceber then
      BatchMove1.Mode:=batAppend;
    Timer1.Enabled:=true;
  except
    try
      CloseFile(T1);
    except
    end;
    Application.Terminate;
  end;
end;

procedure TfmxSincroniza.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  lsbTabelas.Refresh;
  if not vFalhaLocal then
    Sincronizar;
  try
    CloseFile(T1);
  except
  end;
  Close;
end;

procedure TfmxSincroniza.Sincronizar;
var
  i, j, iQtdRegistros, iQtdRegistrosFalha, vVersao, vVersaoIncluirOper, iCod,
    iCodTabela, iQtdDeletados: Integer;
  Linha, sCampos, sValores, sNomeArq, sParametro, sDtAlterado: string;
  vHoraFIM, vData: TDateTime;
  sErroSQL: ShortString;
begin
  vData   := StrToDate('01/01/2004');
  vVersao := 0;
  vVersaoIncluirOper := 0;

  for i:=0 to lsbTabelas.Items.Count-1 do
  try
    lsbTabelas.ItemIndex:=i;
    lsbTabelas.Refresh;

    vTabelaAtual := Trim(UpperCase(Trim(lsbTabelas.Items[lsbTabelas.ItemIndex])));

    if self.Tag = cPFase2 then
      Application.Title := 'PFase2 - '+CC+' '+vTabelaAtual
    else if self.Tag = cPFase3 then
      Application.Title := 'PFase3 '+vTabelaAtual;

    if vTabelaAtual <> '' then
    Begin
      Writeln(T1, '');
      Linha := 'Tabela ('+FormatDateTime('HH:MM:SS',Now)+') : '+vTabelaAtual;
      Writeln(T1, Linha);
      CloseFile(T1);
      Append(T1);

      if (Configuracao1.Empresa = empEletro) and
         (self.Tag = cPFase3) and
         (vTabelaAtual = 'ITEM_DE_ESTOQUE_DEPOSITO') then
      Begin
        ExecutaSQL(QR_Comandos,'DROP TABLE ITEM_DE_ESTOQUE_DEPOSITO');
        ExecutaSQL(QR_Comandos,'SELECT * INTO ITEM_DE_ESTOQUE_DEPOSITO '+
          ' FROM ITEM_DE_ESTOQUE '+
          ' WHERE CNC_CODIGO=11 '+
          ' AND PRD_CODIGO IN (SELECT PRD_CODIGO FROM PRODUTO '+
          ' WHERE PRD_SITUACAO=0)');
      end;

      //Pegar o Código da Tabela
      Parametro1.Close;
      Parametro1.ParamByName('PAR_DESCRICAO').asString := vTabelaAtual;
      Parametro1.Open;
      iCodTabela := Parametro1.CodigoPAR;

      CdCECCNC := -1;
      CdCEC    := -1;
      CdCEFCNC := -1;
      CdCEF    := -1;
      vDataReferencia := StrToDate('01/01/1910'); //Significa todos os registros (não terá filtro)

      if (self.Tag = cTransSACIReceber) and
         (vTabelaAtual = 'PRODUTO') then
      Begin
        with QR_Consulta do
        Begin
          Close;
          SQL.Text := 'SELECT TOP 1 CEC.CEC_DT_DADOS_INICIAL AS DATA '+ //A data em que os dados foram gerados
            ' FROM CONTROLE_ENVIO_CPD CEC '+
            ' WHERE CEC.CEC_TABELA='+IntToStr(iCodTabela)+
            ' ORDER BY CEC.CEC_DT_CADASTRO DESC ';
          Open;
          if not IsEmpty then
            vDataReferencia := Trunc(FieldByName('DATA').asDateTime);
        end;
      end;


      if iDiasEnvio <> 0 then
      Begin
        if self.Tag = cTransSACIEnviar then
        Begin
          //Verificar útimo envio confirmado pelo CPD
          with QR_Consulta do
          Begin
            Close;
            SQL.Text := 'SELECT TOP 1 CEF.CNC_CODIGO, CEF.CEF_CODIGO, CEF.CEF_DT_CADASTRO AS DATA '+ //A data em que os dados foram gerados
              ' FROM CONTROLE_RECEBIMENTO_FILIAL CRF, CONTROLE_ENVIO_FILIAL CEF '+
              ' WHERE CRF.CNC_CODIGO='+CC+
              ' AND CRF.CRF_TABELA='+IntToStr(iCodTabela)+
              ' AND CRF.CNC_CONTROLE_ENVIO=CEF.CNC_CODIGO '+
              ' AND CRF.CEF_CODIGO=CEF.CEF_CODIGO '+
              ' ORDER BY CRF.CRF_DT_CADASTRO DESC ';
            Open;
            if not IsEmpty then
            Begin
              vDataReferencia := (Trunc(FieldByName('DATA').asDateTime)-iDiasEnvio);
            end
            else
              vDataReferencia := StrToDate('01/09/2004');
          end;
        end
        else if self.Tag = cPFase2 then
        Begin
          //Verificar data do início da consulta do envio dessa tabela
          //verificar a tentatica de receber dados mais antigos do que o do último recebimento
          with QueryOrigem2 do
          Begin
            Close;
            SQL.Text := 'SELECT CNC_CODIGO, CEF_CODIGO, CEF_DT_CADASTRO, CEF_DT_DADOS_INICIAL AS DATA '+ //A data de referência dos dados
              ' FROM CONTROLE_ENVIO_FILIAL  '+
              ' WHERE CNC_CODIGO='+CC+
              ' AND CEF_TABELA='+IntToStr(iCodTabela)+
              ' ORDER BY CEF_DT_CADASTRO DESC ';
            try
              Open;
              if not IsEmpty then
              Begin
                CdCEFCNC := FieldByName('CNC_CODIGO').asInteger;
                CdCEF    := FieldByName('CEF_CODIGO').asInteger;
                vDataReferencia := Trunc(FieldByName('DATA').asDateTime);
                //Verificar se já foi recebido dados mais novos
                with QR_Consulta do
                Begin
                  Close;
                  SQL.Text := 'SELECT * '+
                    ' FROM CONTROLE_ENVIO_FILIAL  '+
                    ' WHERE CNC_CODIGO='+CC+
                    ' AND CEF_TABELA='+IntToStr(iCodTabela)+
                    ' ORDER BY CEF_DT_CADASTRO DESC ';
                  Open;
                  if QueryOrigem2.FieldByName('CEF_DT_CADASTRO').asDateTime < FieldByName('CEF_DT_CADASTRO').asDateTime then
                  Begin
                    Writeln(T1, 'Dados anteriores ao do último recebimento. ULTIMO:'+DateTimeToStr(FieldByName('CEF_DT_CADASTRO').asDateTime)+' ATUAL:'+DateTimeToStr(QueryOrigem2.FieldByName('CEF_DT_CADASTRO').asDateTime));
                    Raise exception.Create('');
                  end;
                end;
              end
              else
                vDataReferencia := StrToDate('01/09/2004');
            except
              Writeln(T1, 'Tabela de Controle não encontrada. '+DateTimeToStr(Now));
              Raise exception.Create('');
            end;
          end;
        end
        else if (self.Tag = cPFase3) and
                (vTabelaAtual = 'PRODUTO') and
                (iDiasEnvio > 0) then
          vDataReferencia := (Now-iDiasEnvio-60);
      end;

      Linha := 'DataReferencia: '+formatDateTime('DD/MM/YYYY',vDataReferencia);
      Writeln(T1, Linha);
      CloseFile(T1);
      Append(T1);

      if (vTabelaAtual='TITULO_A_RECEBER') or
         (vTabelaAtual='TITULO_A_PAGAR') or
         (vTabelaAtual='CONTROLE_ENVIO_FILIAL') or
         (vTabelaAtual='MOVIMENTO_DE_CAIXA') or
         (vTabelaAtual='MENSAGEM') or
         (vTabelaAtual='PENDENCIA') or         
         (vTabelaAtual='CLIENTE') OR
         (vTabelaAtual='PEDIDO_DE_VENDA') OR
         (vTabelaAtual='ITEM_DE_PEDIDO_DE_VENDA') OR
         (vTabelaAtual='ITEM_DE_ESTOQUE') OR
         (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_FISICO') OR
         (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_COMERCIAL') OR
         (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_FISCAL') OR
         (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_SN') OR
         (vTabelaAtual='TRANSFERENCIA') OR
         (vTabelaAtual='ITEM_DE_TRANSFERENCIA') OR
         (vTabelaAtual='INVENTARIO') OR
         (vTabelaAtual='ITEM_DE_INVENTARIO') OR
         (vTabelaAtual='RECEBIMENTO') OR
         (vTabelaAtual='ITEM_DE_RECEBIMENTO') OR
         (vTabelaAtual='NOTA_FISCAL') OR
         (vTabelaAtual='ITEM_DE_NOTA_FISCAL') or
         (vTabelaAtual='USUARIO_SENHA') or
         (vTabelaAtual='REGISTRO_DELETADO') or
         (vTabelaAtual='LOG') or
         (vTabelaAtual='MENSAGEM_CPD') or                //PFase3
         (vTabelaAtual='PENDENCIA_CPD') or                //PFase3         
         (vTabelaAtual='CONTROLE_ENVIO_CPD') or          //PFase3 OU TranSACI Recebe
         (vTabelaAtual='CONTROLE_RECEBIMENTO_FILIAL') or //PFase3 OU TranSACI Recebe
         (vTabelaAtual='PRE_RECEBIMENTO') or             //PFase3
         (vTabelaAtual='ITEM_DE_PRE_RECEBIMENTO') or     //PFase3
         (vTabelaAtual='TABELA_DE_PRECO') or             //PFase3
         (vTabelaAtual='ITEM_DE_TABELA_DE_PRECO') or     //PFase3
         (vTabelaAtual='PRODUTO') then                   //PFase3
        vTabelaFiltrada := True
      else
        vTabelaFiltrada := False;

      //O TransSACIReceber não está filtrando o que recebe, logo não pode entrar nessa condição abaixo
      if (self.Tag in [cTransSACIEnviar, cPFase3])  then
      Begin
        BatchMove1.Source := QueryOrigem2;
        QueryOrigem2.Close;
        if vTabelaFiltrada then
        Begin
          if (iDiasEnvio <> 0) and
             (vTabelaAtual = 'TITULO_A_RECEBER') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_ORIGEM='+CC+
                ' AND (TRC_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '  OR  TRC_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'TITULO_A_PAGAR') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_ORIGEM='+CC+
                ' AND (TPG_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '  OR  TPG_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (vTabelaAtual = 'CONTROLE_ENVIO_FILIAL') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_ORIGEM='+CC+
                ' AND (CEF_DT_CADASTRO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'MOVIMENTO_DE_CAIXA') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (MVC_DATA>="'+MesDia(vDataReferencia)+'"'+
                '  OR  MVC_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'CLIENTE') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (CLI_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '  OR  CLI_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'PEDIDO_DE_VENDA') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (PDV_DATA_HORA>="'+MesDia(vDataReferencia)+'"'+
                '  OR  PDV_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'ITEM_DE_PEDIDO_DE_VENDA') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (IPV_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '  OR  IPV_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'ITEM_DE_ESTOQUE') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND IES_DH_ATUALIZADO>="'+MesDia(vDataReferencia)+'"'
          else if (vTabelaAtual = 'MENSAGEM') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (MSG_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '   OR MSG_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (vTabelaAtual = 'PENDENCIA') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND PEN_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'MOVIMENTO_DE_ESTOQUE_COMERCIAL') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND MEC_DATA_HORA>="'+MesDia(vDataReferencia)+'"'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'MOVIMENTO_DE_ESTOQUE_FISICO') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND MEF_DATA>="'+MesDia(vDataReferencia)+'"'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'MOVIMENTO_DE_ESTOQUE_FISCAL') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND MES_DATA_HORA>="'+MesDia(vDataReferencia)+'"'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'MOVIMENTO_DE_ESTOQUE_SN') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND MSN_DATA_HORA>="'+MesDia(vDataReferencia)+'"'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'TRANSFERENCIA') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (TRF_DATA>="'+MesDia(vDataReferencia)+'"'+
                '  OR  TRF_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'ITEM_DE_TRANSFERENCIA') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (ITR_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '  OR  ITR_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'INVENTARIO') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (INV_DATA>="'+MesDia(vDataReferencia)+'"'+
                '  OR  INV_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'ITEM_DE_INVENTARIO') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (IIV_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '  OR  IIV_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'RECEBIMENTO') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (REC_DATA>="'+MesDia(vDataReferencia)+'"'+
                '  OR  REC_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'ITEM_DE_RECEBIMENTO') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_CODIGO='+CC+
                ' AND (IRC_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '  OR  IRC_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'NOTA_FISCAL') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_ORIGEM='+CC+
                ' AND (NTF_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '  OR  NTF_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'ITEM_DE_NOTA_FISCAL') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_ORIGEM='+CC+
                ' AND (INF_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '  OR  INF_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'REGISTRO_DELETADO') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_ORIGEM='+CC+
                ' AND RDL_DT_CADASTRO>="'+MesDia(vDataReferencia)+'" '
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'LOG') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_ORIGEM='+CC+
                ' AND LOG_DATA_HORA>="'+MesDia(vDataReferencia)+'" '
          else if (iDiasEnvio <> 0) and
                  (vTabelaAtual = 'USUARIO_SENHA') then
            QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
                ' WHERE CNC_ORIGEM='+CC+
                ' AND (SNH_DT_CADASTRO>="'+MesDia(vDataReferencia)+'"'+
                '  OR  SNH_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          //PFase3
          else if (vTabelaAtual = 'MENSAGEM_CPD') then
          Begin
            if self.Tag = cPFase3 then
              QueryOrigem2.SQL.Text := 'SELECT * '+
                  ' FROM MENSAGEM M1 '+
                  ' WHERE M1.MSG_DT_CADASTRO>="'+MesDia(Now-10)+'" '+
                  '    OR M1.MSG_DT_ALTERADO>="'+MesDia(Now-10)+'" '
            else
              QueryOrigem2.SQL.Text := 'SELECT * '+
                  ' FROM MENSAGEM_CPD M1 '+
                  ' WHERE M1.MSG_DT_CADASTRO>="'+MesDia(Now-10)+'" '+
                  '    OR M1.MSG_DT_ALTERADO>="'+MesDia(Now-10)+'" ';
          end
          else if (vTabelaAtual = 'PENDENCIA_CPD') then
            QueryOrigem2.SQL.Text := 'SELECT * '+
                ' FROM PENDENCIA_CPD M1 '+
                ' WHERE M1.PEC_DT_CADASTRO>="'+MesDia(Now-20)+'" '
          //PFase3
          else if (vTabelaAtual = 'CONTROLE_ENVIO_CPD') then
            QueryOrigem2.SQL.Text := 'SELECT * '+
                ' FROM CONTROLE_ENVIO_CPD C1 '+
                ' WHERE C1.CEC_CODIGO=(SELECT MAX(C2.CEC_CODIGO)  '+
                ' FROM CONTROLE_ENVIO_CPD C2 '+
                ' WHERE C1.CEC_TABELA=C2.CEC_TABELA) '
          //PFase3 ou TransSACI Recebe
          else if (vTabelaAtual = 'CONTROLE_RECEBIMENTO_FILIAL') then
            QueryOrigem2.SQL.Text := 'SELECT * '+
                ' FROM CONTROLE_RECEBIMENTO_FILIAL C1 '+
                ' WHERE C1.CRF_CODIGO=(SELECT MAX(C2.CRF_CODIGO)  '+
                ' FROM CONTROLE_RECEBIMENTO_FILIAL C2 '+
                ' WHERE C1.CRF_TABELA=C2.CRF_TABELA '+
                ' AND C1.CNC_CODIGO=C2.CNC_CODIGO) '
          //PFase3
          else if (vTabelaAtual = 'PRE_RECEBIMENTO') then
            QueryOrigem2.SQL.Text := 'SELECT P1.* '+
                ' FROM PRE_RECEBIMENTO P1 '+
                ' WHERE P1.PRC_SITUACAO<>1 '+
                ' AND NOT EXISTS (SELECT PRC_CODIGO '+
                ' FROM RECEBIMENTO R1 '+
                ' WHERE R1.CNC_CODIGO=P1.CNC_CODIGO '+
                ' AND R1.REC_COD_ORIGEM=P1.PRC_COD_ORIGEM '+
                ' AND R1.REC_CNC_ORIGEM=P1.PRC_CNC_ORIGEM '+
                ' AND R1.REC_TIPO=P1.PRC_TIPO) '
          //PFase3
          else if (vTabelaAtual = 'ITEM_DE_PRE_RECEBIMENTO') then
            QueryOrigem2.SQL.Text := 'SELECT I1.* '+
                ' FROM PRE_RECEBIMENTO P1, ITEM_DE_PRE_RECEBIMENTO I1 '+
                ' WHERE P1.PRC_SITUACAO<>1 '+
                ' AND NOT EXISTS (SELECT PRC_CODIGO '+
                ' FROM RECEBIMENTO R1 '+
                ' WHERE R1.CNC_CODIGO=P1.CNC_CODIGO '+
                ' AND R1.REC_COD_ORIGEM=P1.PRC_COD_ORIGEM '+
                ' AND R1.REC_CNC_ORIGEM=P1.PRC_CNC_ORIGEM '+
                ' AND R1.REC_TIPO=P1.PRC_TIPO) '+
                ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
                ' AND P1.PRC_CODIGO=I1.PRC_CODIGO '
          //PFase3
          else if (vTabelaAtual = 'TABELA_DE_PRECO') then
          QueryOrigem2.SQL.Text := 'SELECT * '+
              ' FROM TABELA_DE_PRECO '+
              ' WHERE TBP_VALIDADE>="'+MesDia(Now-2)+'" '
          //PFase3
          else if (vTabelaAtual = 'ITEM_DE_TABELA_DE_PRECO') then
          QueryOrigem2.SQL.Text := 'SELECT I1.* '+
              ' FROM TABELA_DE_PRECO T1, ITEM_DE_TABELA_DE_PRECO I1 '+
              ' WHERE T1.TBP_VALIDADE>="'+MesDia(Now-2)+'" '+
              ' AND T1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND T1.TBP_CODIGO=I1.TBP_CODIGO '
          //PFase3
          else if (vTabelaAtual = 'PRODUTO') then
            QueryOrigem2.SQL.Text := 'SELECT * '+
                ' FROM PRODUTO '+
                ' WHERE PRD_CODIGO>0 '+
                ' AND (PRD_DT_CADASTRO>="'+MesDia(vDataReferencia)+'" '+
                '   OR PRD_DT_ALTERADO>="'+MesDia(vDataReferencia)+'")'
          else
            Raise exception.Create('Tabela não esperada como filtrada!');
        end
        else if self.Tag = cPFase3 then
          QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual
        else
          QueryOrigem2.SQL.Text := 'SELECT * FROM '+vTabelaAtual+
            ' WHERE CNC_CODIGO='+CC;
        //Não precisa abrir QueryOrigem2
      end
      else
      Begin
        tblOrigem.Close;
        tblOrigem.TableName:= vTabelaAtual;
        tblOrigem.open;
      end;

      if not tblOrigem.IsEmpty then
      Begin
        if (self.tag in [cTransSACIReceber, cPFase2]) then
        Begin
          if (self.tag = cPFase2) or //CPD Recebendo Dados
             (vTabelaAtual='PRODUTO') then //Loja recebendo Tabela de Produtos
          Begin
            //Deletar no Destino o que será copiado. Somente os cadastrados no período
            //Para evitar que por erro um título tenha sido alterado no cpd e não seja mais recebido
            if (vTabelaAtual='TITULO_A_RECEBER') then
              DeletarRegistrosDestino('TRC', 'TRC_DT_CADASTRO', CC, True)
            else if (vTabelaAtual='TITULO_A_PAGAR') then
              DeletarRegistrosDestino('TPG', 'TPG_DT_CADASTRO', CC, True)
            else if (vTabelaAtual='CONTROLE_ENVIO_FILIAL') then
              DeletarRegistrosDestino('CEF', 'CEF_DT_CADASTRO', CC, True)
            else if (vTabelaAtual='CLIENTE') then
              DeletarRegistrosDestino('CLI', 'CLI_DT_CADASTRO', CC)
            else if (vTabelaAtual='MOVIMENTO_DE_CAIXA') then
              DeletarRegistrosDestino('MVC', 'MVC_DATA', CC)
            else if (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_COMERCIAL') then
              DeletarRegistrosDestino('MEC', 'MEC_DATA_HORA', CC)
            else if (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_FISICO') then
              DeletarRegistrosDestino('MEF', 'MEF_DATA', CC)
            else if (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_FISCAL') then
              DeletarRegistrosDestino('MES', 'MES_DATA_HORA', CC)
            else if (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_SN') then
              DeletarRegistrosDestino('MSN', 'MSN_DATA_HORA', CC)
            else if (vTabelaAtual='ITEM_DE_ESTOQUE') then
              DeletarRegistrosDestino('PRD', 'IES_DH_ATUALIZADO', CC)
            else if (vTabelaAtual='NOTA_FISCAL') then
              DeletarRegistrosDestino('NTF', 'NTF_DT_CADASTRO', CC, True)
            else if (vTabelaAtual='ITEM_DE_NOTA_FISCAL') then
              DeletarRegistrosDestino('INF', 'INF_DT_CADASTRO', CC, True)
            else if (vTabelaAtual='USUARIO_SENHA') then
              DeletarRegistrosDestino('USU', 'SNH_DT_CADASTRO', CC, True)
            else if (vTabelaAtual='MENSAGEM') then
              DeletarRegistrosDestino('MSG', 'MSG_DT_CADASTRO', CC)
            else if (vTabelaAtual='PENDENCIA') then
              DeletarRegistrosDestino('PEN', 'PEN_DT_CADASTRO', CC, True)
            else if (vTabelaAtual='PEDIDO_DE_VENDA') then
              DeletarRegistrosDestino('PDV', 'PDV_DATA_HORA', CC)
            else if (vTabelaAtual='ITEM_DE_PEDIDO_DE_VENDA') then
              DeletarRegistrosDestino('IPV', 'IPV_DT_CADASTRO', CC)
            else if (vTabelaAtual='TRANSFERENCIA') then
              DeletarRegistrosDestino('TRF', 'TRF_DATA', CC)
            else if (vTabelaAtual='ITEM_DE_TRANSFERENCIA') then
              DeletarRegistrosDestino('ITR', 'ITR_DT_CADASTRO', CC)
            else if (vTabelaAtual='INVENTARIO') then
              DeletarRegistrosDestino('INV', 'INV_DATA', CC)
            else if (vTabelaAtual='ITEM_DE_INVENTARIO') then
              DeletarRegistrosDestino('IIV', 'IIV_DT_CADASTRO', CC)
            else if (vTabelaAtual='RECEBIMENTO') then
              DeletarRegistrosDestino('REC', 'REC_DATA', CC)
            else if (vTabelaAtual='ITEM_DE_RECEBIMENTO') then
              DeletarRegistrosDestino('IRC', 'IRC_DT_CADASTRO', CC)
            else if (vTabelaAtual='USUARIO_SENHA') then
              DeletarRegistrosDestino('USU', 'SNH_DT_CADASTRO', CC, True)
            else if (vTabelaAtual='REGISTRO_DELETADO') then
              DeletarRegistrosDestino('RDL', 'RDL_DT_CADASTRO', CC, True)
            else if (vTabelaAtual='LOG') then
              DeletarRegistrosDestino('LOG', 'LOG_DATA_HORA', CC, True)
            else if (vTabelaAtual='PRODUTO') then //Não tem controle do que foi enviado
            Begin
//              DeletarRegistrosDestino('PRODUTO', 'PRD_DT_CADASTRO', '');
            end
            else
            Begin
              //Deletar no Destino o que será copiado
              sErroSQL := ExecutaSQL(qryDestino1,'DELETE FROM '+vTabelaAtual+
                            ' WHERE CNC_CODIGO='+CC);
              Writeln(T1, 'DEL NAO FILTRADA Destino Todos'+' '+sErroSQL);
            end;
          end
          else if self.tag=cTransSACIReceber then
          Begin
            if vTabelaAtual = 'CONFIGURACAO' then
            Begin
              qryDestino1.Close;
              qryDestino1.SQL.Text := 'SELECT DATA, CNF_VERSAO_BASE, CNF_VERSAO_INCLUIROPER '+
                ' FROM CONFIGURACAO '+
                ' ORDER BY CNF_VERSAO_BASE DESC, DATA DESC ';
              qryDestino1.Open;
              if qryDestino1.FieldByName('CNF_VERSAO_BASE').asInteger <> 0 then
              Begin
                vData   := qryDestino1.FieldByName('DATA').asDateTime;
                vVersao := qryDestino1.FieldByName('CNF_VERSAO_BASE').asInteger;
                vVersaoIncluirOper := qryDestino1.FieldByName('CNF_VERSAO_INCLUIROPER').asInteger;
              end
              else
              Begin
                vData   := Date;
                vVersao := 78;
                vVersaoIncluirOper := 14;
              end;
            end;
            sErroSQL := ExecutaSQL(qryDestino1,'DELETE FROM '+vTabelaAtual);
            Writeln(T1, 'DEL NAO FILTRADA Destino Todos'+' '+sErroSQL);
          end;
          tblOrigem.Close;
          tblOrigem.TableName := vTabelaAtual;
          tblOrigem.open;
        end;
      end;
      tblDestino.Close;
      tblDestino.TableName := vTabelaAtual;
      if (self.tag IN [cTransSACIReceber, cPFase2]) and
         (not vTabelaFiltrada) then
        tblDestino.open;
      if (self.tag = cPFase2) or
         ((self.tag = cTransSACIReceber) and
          (vTabelaAtual='PRODUTO')) then //Loja recebendo Tabela de Produtos
      Begin
        with tblOrigem do
        begin
          first;
          iQtdRegistros      := 0;
          iQtdRegistrosFalha := 0;
          lsbTabelas.Refresh;
          while not eof do
          begin
            if (iQtdRegistros div 50) = 0 then
              lsbTabelas.Refresh;
            try
              if vTabelaFiltrada then
              Begin
                sCampos  := '';
                sValores := '';
                for j:=0 to FieldCount-1 do
                Begin
                  if (Fields[j].Value<>null) then
                  Begin
                    if sCampos <> '' then
                    Begin
                      sCampos  := sCampos  + ',';
                      sValores := sValores + ',';
                    end;

                    if Fields[j].FieldName = 'CNC_MOVIMENTO_CONTA_CORRE' then
                      sCampos  := sCampos  + 'CNC_MOVIMENTO_CONTA_CORRENTE'
                    else
                      sCampos  := sCampos  + Fields[j].FieldName;

                    if (Fields[j].DataType=ftString) or (Fields[j].DataType=ftMemo) then
                      sValores := sValores + '"'+RetiraAspas(Fields[j].Value)+'"'
                    else if (Fields[j].DataType=ftDate) or (Fields[j].DataType=ftTime) or (Fields[j].DataType=ftDateTime) then
                      sValores := sValores + '"'+MesDiaHora(Fields[j].Value)+'"'
                    else if (Fields[j].DataType=ftSmallInt) or (Fields[j].DataType=ftInteger) or (Fields[j].DataType=ftWord) then
                      sValores := sValores + IntToStr(Fields[j].Value)
                    else if (Fields[j].DataType=ftFloat) or (Fields[j].DataType=ftCurrency) then
                      sValores := sValores + VirgPonto(Fields[j].Value)
                    else
                      sValores := sValores + Fields[j].Value;
                  end;
                end;
                try
                  //Tentar inserir, se já existir vai entrar no except para apagar e depois inserir novamente
                  ExecutaSQL(qryDestino1, 'INSERT '+vTabelaAtual+
                              ' ('+sCampos+') VALUES '+
                              ' ('+sValores+')');
                  inc(iQtdRegistros);
                except
                  try
                    if (vTabelaAtual='TITULO_A_RECEBER') then
                      DeletarRegistroDestino('TRC',CC,FieldByName('TRC_CODIGO').asInteger, True)
                    else if (vTabelaAtual='TITULO_A_PAGAR') then
                      DeletarRegistroDestino('TPG',CC,FieldByName('TPG_CODIGO').asInteger,True)
                    else if (vTabelaAtual='CONTROLE_ENVIO_FILIAL') then
                      DeletarRegistroDestino('CEF',CC,FieldByName('CEF_CODIGO').asInteger,True)
                    else if (vTabelaAtual='MOVIMENTO_DE_CAIXA') then
                      DeletarRegistroDestino('MVC',CC,FieldByName('MVC_CODIGO').asInteger)
                    else if (vTabelaAtual='MENSAGEM') then
                      DeletarRegistroDestino('MSG',CC,FieldByName('MSG_CODIGO').asInteger)
                    else if (vTabelaAtual='PENDENCIA') then
                      DeletarRegistroDestino('PEN',CC,FieldByName('PEN_CODIGO').asInteger, True)
                    else if (vTabelaAtual='CLIENTE') then
                      DeletarRegistroDestino('CLI',CC,FieldByName('CLI_CODIGO').asInteger)
                    else if (vTabelaAtual='PEDIDO_DE_VENDA') then
                      DeletarRegistroDestino('PDV',CC,FieldByName('PDV_CODIGO').asInteger)
                    else if (vTabelaAtual='ITEM_DE_PEDIDO_DE_VENDA') then
                      DeletarRegistroDestino('IPV',CC,FieldByName('IPV_CODIGO').asInteger)
                    else if (vTabelaAtual='ITEM_DE_ESTOQUE') then
                      DeletarRegistroDestino('PRD',CC,FieldByName('PRD_CODIGO').asInteger)
                    else if (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_FISICO') then
                      DeletarRegistroDestino('MEF',CC,FieldByName('MEF_CODIGO').asInteger)
                    else if (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_COMERCIAL') then
                      DeletarRegistroDestino('MEC',CC,FieldByName('MEC_CODIGO').asInteger)
                    else if (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_FISCAL') then
                      DeletarRegistroDestino('MES',CC,FieldByName('MES_CODIGO').asInteger)
                    else if (vTabelaAtual='MOVIMENTO_DE_ESTOQUE_SN') then
                      DeletarRegistroDestino('MSN',CC,FieldByName('MSN_CODIGO').asInteger)
                    else if (vTabelaAtual='TRANSFERENCIA') then
                      DeletarRegistroDestino('TRF',CC,FieldByName('TRF_CODIGO').asInteger)
                    else if (vTabelaAtual='ITEM_DE_TRANSFERENCIA') then
                      DeletarRegistroDestino('ITR',CC,FieldByName('ITR_CODIGO').asInteger)
                    else if (vTabelaAtual='INVENTARIO') then
                      DeletarRegistroDestino('INV',CC,FieldByName('INV_CODIGO').asInteger)
                    else if (vTabelaAtual='ITEM_DE_INVENTARIO') then
                      DeletarRegistroDestino('IIV',CC,FieldByName('IIV_CODIGO').asInteger)
                    else if (vTabelaAtual='RECEBIMENTO') then
                      DeletarRegistroDestino('REC',CC,FieldByName('REC_CODIGO').asInteger)
                    else if (vTabelaAtual='ITEM_DE_RECEBIMENTO') then
                      DeletarRegistroDestino('IRC',CC,FieldByName('IRC_CODIGO').asInteger)
                    else if (vTabelaAtual='NOTA_FISCAL') then
                      DeletarRegistroDestino('NTF',CC,FieldByName('NTF_CODIGO').asInteger,True)
                    else if (vTabelaAtual='ITEM_DE_NOTA_FISCAL') then
                      DeletarRegistroDestino('INF',CC,FieldByName('INF_CODIGO').asInteger,True)
                    else if (vTabelaAtual='USUARIO_SENHA') then
                      DeletarRegistroDestino('USU',CC,FieldByName('USU_CODIGO').asInteger,True)
                    else if (vTabelaAtual='REGISTRO_DELETADO') then
                      DeletarRegistroDestino('RDL',CC,FieldByName('RDL_CODIGO').asInteger, True)
                    else if (vTabelaAtual='LOG') then
                      DeletarRegistroDestino('LOG',CC,FieldByName('LOG_CODIGO').asInteger, True)
                    else if (vTabelaAtual='PRODUTO') then
                      DeletarRegistroDestino('PRD','',FieldByName('PRD_CODIGO').asInteger);

                    sErroSQL := ExecutaSQL(qryDestino1, 'INSERT '+vTabelaAtual+
                                  ' ('+sCampos+') VALUES '+
                                  ' ('+sValores+')');
                    inc(iQtdRegistros);
                  except
                    Writeln(T1, 'Falha na insercao ERRO: '+sErroSQL);
                    inc(iQtdRegistrosFalha);
                  end;
                end;
              end
              else //Utilizando Append / Post
              Begin
                tblDestino.Append;
                for j:=0 to FieldCount-1 do
                  try
                    tblDestino.FindField(Fields[j].FieldName).Value := Fields[j].Value;
                  except
                  end;
                try
                  tblDestino.Post;
                  inc(iQtdRegistros);
                except
                  tblDestino.Cancel;
                end;
              end;
            except
              Writeln(T1, 'Falha na identificacao dos campos/valores '+sCampos+' '+sValores);
              inc(iQtdRegistrosFalha);
            end;
            tblOrigem.next;
          end;
          Linha := 'Quantidade de Registros ('+IntToStr(iQtdRegistros)+')';
          Writeln(T1, Linha);

          if iQtdRegistros > 0 then
          Begin
            //Gerar registro de controle de Recebimento
            if self.Tag = cPFase2 then
            Begin
              iCod := Configuracao1.ProximoCodigo('CRF_CODIGO');
              ExecutaSQL(QR_Comandos, 'INSERT CONTROLE_RECEBIMENTO_FILIAL '+
                '(CNC_CODIGO,CRF_CODIGO,CNC_ORIGEM,USU_CODIGO,CRF_MAQUINA '+
                ',CRF_DT_CADASTRO,CNC_CONTROLE_ENVIO,CEF_CODIGO '+
                ',CRF_DT_DADOS_INICIAL,CRF_TABELA '+
                ',CRF_SITUACAO,CRF_OBSERVACAO) VALUES '+
                '( '+CC+
                ', '+IntToStr(iCod)+
                ', '+IntToStr(Parametro1.CentroDeCusto)+
                ',1'+ //O usuário não loga para entrar no TransSACI
                ', '+IntToStr(Parametro1.Maquina)+
                ',"'+MesDiaHora(Now)+'" '+
                ', '+IntToStr(CdCEFCNC)+
                ', '+IntToStr(CdCEF)+
                ',"'+MesDia(vDataReferencia)+'" '+ //Data inicial da consulta
                ', '+IntToStr(iCodTabela)+
                ',0'+ //Situação
                ',"'+vTabelaAtual+'")'); //OBS

              if (vTabelaAtual='USUARIO_SENHA') then
              Begin
                QR_Consulta.SQL.Text := 'SELECT SNH.* '+
                    ' FROM USUARIO_SENHA SNH, USUARIO USU '+
                    ' WHERE SNH.CNC_ORIGEM='+CC+
                    ' AND SNH.SNH_SITUACAO=0 '+ //Não foi desativada
                    ' AND USU.USU_CODIGO=SNH.USU_USUARIO '+
                    ' AND SNH.SNH_DT_CADASTRO>USU.USU_DT_SENHA_ALTERADA '+
                    ' ORDER BY SNH.SNH_DT_CADASTRO ASC ';
                QR_Consulta.Open;
                while not QR_Consulta.Eof do
                Begin
                  //Mesmo que o mesmo usuário tenha altera várias vezes a última senha é que vale
                  //A data de alteração da senha na tabela de Usuario será 5 minutos depois da hora em que a senha foi alterada
                  ExecutaSQL(QR_Comandos, 'UPDATE USUARIO SET '+
                    ' USU_SENHA="'+QR_Consulta.FieldByName('SNH_SENHA').asString+'" '+
                    ',USU_DT_SENHA_ALTERADA="'+MesDiaHora(QR_Consulta.FieldByName('SNH_DT_CADASTRO').asDateTime+StrToTime('00:05:00'))+'" '+
                    ' WHERE USU_CODIGO='+QR_Consulta.FieldByName('USU_USUARIO').asString);
                  QR_Consulta.Next;
                end;
              end;
              if (self.Tag = cPFase2) then
              Begin
                iQtdDeletados:= 0;
                if (vTabelaAtual='REGISTRO_DELETADO') then
                Begin
                  //Processar a tabela de registros deletados
                  with QR_Consulta do
                  Begin
                    Close;
                    SQL.Text := 'SELECT * FROM REGISTRO_DELETADO '+
                      ' WHERE CNC_ORIGEM='+CC+
                      ' AND RDL_DT_CADASTRO>="'+MesDia(vDataReferencia)+'" ';
                    Open;
                    while not Eof do
                    Begin
                      inc(iQtdDeletados);
                      ExecutaRegistroDeletado(QR_Comandos, FieldByName('RDL_CODIGO_TABELA').asInteger,
                        FieldByName('CNC_ORIGEM').asInteger, FieldByName('RDL_CODIGO_REGISTRO').asInteger);
                      Next;
                    end;
                  end;
                  Writeln(T1, 'REGISTRO_DELETADO: '+IntToStr(iQtdDeletados));
                end;
              end;
            end;
            if iQtdRegistrosFalha > 0 then
            Begin
              Linha := 'Quantidade de Registros com Falha ('+IntToStr(iQtdRegistrosFalha)+')';
              Writeln(T1, Linha);
            end;
          end;
        end;
      end
      else //TransSACI-Enviar , TransSACI-Receber , PFase3 ,
      Begin
        sErroSQL := '';
        if self.Tag = cTransSACIEnviar then
        Begin
          iCod := Configuracao1.ProximoCodigo('CEF_CODIGO');
          sErroSQL := ExecutaSQL(QR_Comandos, 'INSERT CONTROLE_ENVIO_FILIAL '+
            '(CNC_CODIGO,CEF_CODIGO,CNC_ORIGEM,USU_CODIGO,CEF_MAQUINA '+
            ',CEF_DT_CADASTRO,CEF_DT_DADOS_INICIAL,CEF_TABELA '+
            ',CEF_SITUACAO,CEF_OBSERVACAO) VALUES '+
            '( '+CC+
            ', '+IntToStr(iCod)+
            ', '+IntToStr(Parametro1.CentroDeCusto)+
            ',1'+ //O usuário não loga para entrar no TransSACI
            ', '+IntToStr(Parametro1.Maquina)+
            ',"'+MesDiaHora(Now)+'" '+
            ',"'+MesDia(vDataReferencia)+'" '+
            ', '+IntToStr(iCodTabela)+
            ',0'+ //Situação
            ',"'+vTabelaAtual+'")'); //OBS
        end
        else if self.Tag = cPFase3 then
        Begin
          iCod := Configuracao1.ProximoCodigo('CEC_CODIGO');
          sErroSQL := ExecutaSQL(QR_Comandos, 'INSERT CONTROLE_ENVIO_CPD '+
            '(CNC_CODIGO,CEC_CODIGO,CNC_ORIGEM,USU_CODIGO,CEC_MAQUINA '+
            ',CEC_DT_CADASTRO,CEC_DT_DADOS_INICIAL,CEC_TABELA '+
            ',CEC_SITUACAO,CEC_OBSERVACAO) VALUES '+
            '( '+CC+
            ', '+IntToStr(iCod)+
            ', '+IntToStr(Parametro1.CentroDeCusto)+
            ',1'+ //O usuário não loga para entrar no TransSACI
            ', '+IntToStr(Parametro1.Maquina)+
            ',"'+MesDiaHora(Now)+'" '+
            ',"'+MesDia(vDataReferencia)+'" '+
            ', '+IntToStr(iCodTabela)+
            ',0'+ //Situação
            ',"'+vTabelaAtual+'")'); //OBS
        end;
        if sErroSQL <> '' then
        Begin
          Writeln(T1, 'Falha na insercao ERRO: '+sErroSQL);
          sErroSQL := '';
        end;

        ////
        if (vTabelaAtual='FUNCIONARIO') and (fmxSincroniza.Tag = cTransSACIReceber) then
        begin
          tblOrigem.Close;
          tblOrigem.TableName:= vTabelaAtual;
          tblOrigem.open;
        end
        else
        begin
          tblOrigem.Close;
          tblOrigem.TableName:= vTabelaAtual;
          tblOrigem.Filter := '';
          tblOrigem.open;
        end;
        BatchMove1.Execute;
        ////


        if (self.tag = cTransSACIReceber) then
        Begin
          if (vTabelaAtual='CONFIGURACAO') then
          Begin
            //No destino
            sErroSQL := ExecutaSQL(qryDestino1,'UPDATE CONFIGURACAO SET '+
              ' DATA="'+MesDia(vData)+'" '+
              ',CNF_VERSAO_BASE='+IntToStr(vVersao)+
              ',CNF_VERSAO_INCLUIROPER='+IntToStr(vVersaoIncluirOper));
          end;
        end;

        //Gerar Registro de Controle de Recebimento e de Envio

        if self.Tag = cTransSACIReceber then
        Begin
          iCod := Configuracao1.ProximoCodigo('CRC_CODIGO');
          sErroSQL := ExecutaSQL(QR_Comandos, 'INSERT CONTROLE_RECEBIMENTO_CPD '+
            '(CNC_CODIGO,CRC_CODIGO,CNC_ORIGEM,USU_CODIGO,CRC_MAQUINA '+
            ',CRC_DT_CADASTRO,CNC_CONTROLE_ENVIO,CEC_CODIGO '+
            ',CRC_DT_DADOS_INICIAL,CRC_TABELA '+
            ',CRC_SITUACAO,CRC_OBSERVACAO) VALUES '+
            '( '+CC+
            ', '+IntToStr(iCod)+
            ', '+IntToStr(Parametro1.CentroDeCusto)+
            ',1'+ //O usuário não loga para entrar no TransSACI
            ', '+IntToStr(Parametro1.Maquina)+
            ',"'+MesDiaHora(Now)+'" '+
            ', '+IntToStr(CdCECCNC)+
            ', '+IntToStr(CdCEC)+
            ',"'+MesDia(vDataReferencia)+'" '+
            ', '+IntToStr(iCodTabela)+
            ',0'+ //Situação
            ',"'+vTabelaAtual+'")'); //OBS
        end;
      end;
      tblOrigem.close;
      tblDestino.close;
    end;
  except
    Writeln(T1, 'FALHA TABELA '+vTabelaAtual+' '+DateTimeToStr(Now));
    //if self.Tag in [cTransSACIEnviar, cTransSACIReceber] then
    //  ShowMessage('Falha no Processo!');
  end;

  if self.Tag = cPFase2 then
  Begin
    //Evitar receber duas vezes
    ApagarArquivos(sPastaRecep, 'SACI_FILIAL2.RAR');
    try
      RenameFile(sPastaRecep+'\SACI_FILIAL.RAR',sPastaRecep+'\SACI_FILIAL2.RAR');
    except
    end;
  end
  else if self.Tag = cPFase3 then
  Begin
    //Compactar
    sNomeArq := 'C:\SACI\SISTEMA\RAR.EXE';

    if not FileExists(sNomeArq) then
      Writeln(T1, 'Arquivo não encontrado <<'+sNomeArq+'>>');

    Writeln(T1, '');
    Writeln(T1, 'COMPACTANDO '+DateTimeToStr(Now));
    sParametro := ' a -y '+sPastaParaCompactar+'\SACI_CPD.rar '+sPastaParaCompactar+'\*.*';
    self.Caption := 'Sincronizar Tabelas - COMPACTANDO';
    self.Refresh;
    ExecutarEXEAguardando(sNomeArq, sParametro);

    EnviarArquivoFTP;
  end
  else if (self.Tag = cTransSACIReceber) then
  Begin
    //Liberar Usuários
    ExecutaSQL(QR_Comandos, 'UPDATE USUARIO SET '+
      ' USU_SITUACAO=0 '+
      ' WHERE USU_SITUACAO=2 ');

    //Processar as Mensagens
    with QR_Consulta do
    Begin
      //Inserir as Mensagens com destino nesse centro
      Close;
      SQL.Text := 'SELECT * '+
        ' FROM MENSAGEM_CPD '+
        ' WHERE MSG_CNC_DESTINO='+IntToStr(Mensagem1.CentroDeCusto);
      Open;
      while not Eof do
      Begin
        QR_Comandos.Close;
        QR_Comandos.SQL.Text := 'SELECT MSG_CODIGO '+
          ' FROM MENSAGEM '+
          ' WHERE MSG_CNC_DESTINO='+FieldByName('MSG_CNC_DESTINO').asString+
          ' AND MSG_CODIGO='+FieldByName('MSG_CODIGO').asString;
        QR_Comandos.Open;
        if QR_Comandos.isEmpty then
        Begin
          try
            if FieldByName('MSG_DT_ALTERADO').asDateTime > 0 then
              sDtAlterado := '"'+MesDiaHora(FieldByName('MSG_DT_ALTERADO').asDateTime)+'" '
            else
              sDtAlterado := 'NULL';
            ExecutaSQL(QR_Comandos, 'INSERT MENSAGEM '+
              '(CNC_CODIGO,USU_CODIGO,MSG_CODIGO,MSG_DT_CADASTRO,MSG_DT_ALTERADO '+
              ',MSG_CNC_DESTINO,MSG_USU_DESTINO '+
              ',MSG_SITUACAO_ENVIAR,MSG_SITUACAO_RECEBER,MSG_ASSUNTO '+
              ',MSG_MENSAGEM,MSG_PUBLICA,MSG_URGENTE,MSG_APAGADA,MSG_ALERTADO '+
              ',MSG_AVISO_LEITURA,MSG_OBSERVACAO) VALUES '+
              '( '+FieldByName('CNC_CODIGO').asString+
              ', '+FieldByName('USU_CODIGO').asString+
              ', '+FieldByName('MSG_CODIGO').asString+
              ',"'+MesDiaHora(FieldByName('MSG_DT_CADASTRO').asDateTime)+'" '+
              ','+sDtAlterado+
              ', '+FieldByName('MSG_CNC_DESTINO').asString+
              ', '+FieldByName('MSG_USU_DESTINO').asString+
              ', '+FieldByName('MSG_SITUACAO_ENVIAR').asString+
              ', '+FieldByName('MSG_SITUACAO_RECEBER').asString+
              ',"'+FieldByName('MSG_ASSUNTO').asString+'" '+
              ',"'+FieldByName('MSG_MENSAGEM').asString+'" '+
              ', '+FieldByName('MSG_PUBLICA').asString+
              ', '+FieldByName('MSG_URGENTE').asString+
              ', '+FieldByName('MSG_APAGADA').asString+
              ', '+FieldByName('MSG_ALERTADO').asString+
              ', '+FieldByName('MSG_AVISO_LEITURA').asString+
              ',"'+FieldByName('MSG_OBSERVACAO').asString+'") ');
          except
          end;
        end;
        Next;
      end;

      //Alterar as mensagens com origem nesse centro (verificar as respostas)
      Close;
      SQL.Text := 'SELECT * '+
        ' FROM MENSAGEM_CPD '+
        ' WHERE CNC_CODIGO='+IntToStr(Mensagem1.CentroDeCusto);
      Open;
      while not Eof do
      Begin
        ExecutaSQL(QR_Comandos, 'UPDATE MENSAGEM SET '+
          ' MSG_SITUACAO_RECEBER='+FieldByName('MSG_SITUACAO_RECEBER').asString+
          ' WHERE CNC_CODIGO='+FieldByName('CNC_CODIGO').asString+
          ' AND MSG_CODIGO='+FieldByName('MSG_CODIGO').asString);
        Next;
      end;

      try
        //Inserir as Pendencias com CNC_CODIGO nesse centro e CNC_ORIGEM do CPD
        Close;
        SQL.Text := 'SELECT * '+
          ' FROM PENDENCIA_CPD PEC '+
          ' WHERE PEC.CNC_CODIGO='+IntToStr(Mensagem1.CentroDeCusto)+
          ' AND PEC.CNC_ORIGEM<>'+IntToStr(Mensagem1.CentroDeCusto)+
          ' AND NOT EXISTS (SELECT PEN.PEN_CODIGO '+
          ' FROM PENDENCIA PEN '+
          ' WHERE PEN.CNC_CODIGO=PEC.CNC_PENDENCIA '+
          ' AND PEN.PEN_CODIGO=PEC.PEN_CODIGO '+
          ' AND PEN.CNC_ORIGEM=PEC.CNC_ORIGEM)';
        Open;
        while not Eof do
        Begin
          try
            if FieldByName('PEN_DT_ALTERADO').asDateTime > 0 then
              sDtAlterado := '"'+MesDiaHora(FieldByName('PEN_DT_ALTERADO').asDateTime)+'" '
            else
              sDtAlterado := 'NULL';

            ExecutaSQL(QR_Comandos, 'INSERT PENDENCIA '+
              '(CNC_ORIGEM,CNC_CODIGO,PEN_CODIGO,USU_CODIGO,FUN_CODIGO '+
              ',PEN_DT_CADASTRO,PEN_DT_ALTERADO,PEN_DT_REFERENCIA '+
              ',PEN_TIPO,PEN_DESCRICAO,PEN_CREDITO_EXTORNO '+
              ',CLI_CODIGO,CNC_CLIENTE,PDV_CODIGO,CNC_PEDIDO '+
              ',PEN_TIPO_PAG,FPG_CODIGO,AGF_CODIGO,PRD_CODIGO_1 '+
              ',PEN_PRECO_PRD1,PRD_CODIGO_2,PEN_PRECO_PRD2 '+
              ',PRD_CODIGO_3,PEN_PRECO_PRD3,TRC_CODIGO '+
              ',PEN_VALOR_TRC,PEN_USU_LIBEROU,PEN_CAMPO_VERIFICADOR '+
              ',PEN_SITUACAO,PEN_OBSERVACAO) VALUES '+
              '( '+FieldByName('CNC_ORIGEM').asString+
              ', '+FieldByName('CNC_PENDENCIA').asString+
              ', '+FieldByName('PEN_CODIGO').asString+
              ', '+FieldByName('USU_CODIGO').asString+
              ', '+FieldByName('FUN_CODIGO').asString+
              ',"'+MesDiaHora(FieldByName('PEN_DT_CADASTRO').asDateTime)+'" '+
              ','+sDtAlterado+
              ',"'+MesDiaHora(FieldByName('PEN_DT_REFERENCIA').asDateTime)+'" '+
              ', '+FieldByName('PEN_TIPO').asString+
              ',"'+FieldByName('PEN_DESCRICAO').asString+'" '+
              ', '+FieldByName('PEN_CREDITO_EXTORNO').asString+
              ', '+FieldByName('CLI_CODIGO').asString+
              ', '+FieldByName('CNC_CLIENTE').asString+
              ', '+FieldByName('PDV_CODIGO').asString+
              ', '+FieldByName('CNC_PEDIDO').asString+
              ', '+FieldByName('PEN_TIPO_PAG').asString+
              ', '+FieldByName('FPG_CODIGO').asString+
              ', '+FieldByName('AGF_CODIGO').asString+
              ', '+FieldByName('PRD_CODIGO_1').asString+
              ', '+FieldByName('PEN_PRECO_PRD1').asString+
              ', '+FieldByName('PRD_CODIGO_2').asString+
              ', '+FieldByName('PEN_PRECO_PRD2').asString+
              ', '+FieldByName('PRD_CODIGO_3').asString+
              ', '+FieldByName('PEN_PRECO_PRD3').asString+
              ', '+FieldByName('TRC_CODIGO').asString+
              ', '+FieldByName('PEN_VALOR_TRC').asString+
              ', '+FieldByName('USU_CODIGO').asString+
              ',"'+FieldByName('PEN_CAMPO_VERIFICADOR').asString+'" '+
              ', '+FieldByName('PEN_SITUACAO').asString+
              ',"'+FieldByName('PEN_OBSERVACAO').asString+'") ');
          except
          end;
          Next;
        end;

        //Autorizar as pendências com origem nesse centro
        Close;
        SQL.Text := 'SELECT * '+
          ' FROM PENDENCIA_CPD '+
          ' WHERE CNC_CODIGO='+IntToStr(Mensagem1.CentroDeCusto);
        Open;
        while not Eof do
        Begin
          try
            ExecutaSQL(QR_Comandos, 'UPDATE PENDENCIA SET '+
              ' PEN_SITUACAO='+FieldByName('PEC_SITUACAO').asString+  //Pode ser 2 (liberado) ou 1 (desativado)
              ',PEN_USU_LIBEROU='+FieldByName('USU_CODIGO').asString+
              ',PEN_DT_ALTERADO='+FieldByName('PEC_DT_CADASTRO').asString+
              ' WHERE CNC_CODIGO='+FieldByName('CNC_CODIGO').asString+
              ' AND PEN_CODIGO='+FieldByName('PEN_CODIGO').asString);
          except
          end;
          Next;
        end;
      except
      end;
    end;

    //Atualizar e Pedidos com Nota Impressa no Depósito
    ExecutaSQL(QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' PDV_LISTADO=1 '+
      ',PDV_DT_ALTERADO="'+MesDiaHora(Now)+'" '+
      ',PDV_NOTA_FISCAL=(SELECT MAX(CDN_NOTA_FISCAL) '+
      ' FROM ENVIA_DADOS_NOTA '+
      ' WHERE CNC_DESTINO=PEDIDO_DE_VENDA.CNC_CODIGO '+
      ' AND PDV_CODIGO=PEDIDO_DE_VENDA.PDV_CODIGO) '+
      ',PDV_DT_EMISSAO_VENDA=(SELECT MAX(CDN_DT_EMISSAO) '+
      ' FROM ENVIA_DADOS_NOTA '+
      ' WHERE CNC_DESTINO=PEDIDO_DE_VENDA.CNC_CODIGO '+
      ' AND PDV_CODIGO=PEDIDO_DE_VENDA.PDV_CODIGO) '+
      ',PDV_NOTA_CUPOM=(SELECT MAX(CDN_TIPO) '+
      ' FROM ENVIA_DADOS_NOTA '+
      ' WHERE CNC_DESTINO=PEDIDO_DE_VENDA.CNC_CODIGO '+
      ' AND PDV_CODIGO=PEDIDO_DE_VENDA.PDV_CODIGO) '+
      ' WHERE PDV_NOTA_FISCAL=0 '+
      ' AND EXISTS (SELECT TOP 1 CDN_CODIGO '+
      ' FROM ENVIA_DADOS_NOTA '+
      ' WHERE CNC_DESTINO=PEDIDO_DE_VENDA.CNC_CODIGO '+
      ' AND PDV_CODIGO=PEDIDO_DE_VENDA.PDV_CODIGO) ');
  end;

  vHoraFIM := Now;
  Writeln(T1, '');
  Linha := 'Processo Encerrado: '+formatDateTime('DD/MM/YYYY HH:MM:SS',vHoraFIM);
  Writeln(T1, Linha);
  CloseFile(T1);
end;



procedure TfmxSincroniza.DeletarRegistroDestino(PSigla, PCC: string;
  PCodigo: integer; CNCOrigem:Boolean=False);
var
  sErroSQL: AnsiString;
  sCNC:string;
begin
  sErroSQL := '';
  sCNC := '';
  if PCC <> '' then
  Begin
    if CNCOrigem then
      sCNC := ' AND CNC_ORIGEM='+PCC
    else
      sCNC := ' AND CNC_CODIGO='+PCC;
  end;

  sErroSQL := ExecutaSQL(qryDestino1,'DELETE FROM '+vTabelaAtual+
    ' WHERE '+PSigla+'_CODIGO='+IntToStr(PCodigo)+
    sCNC);
    
  if sErroSQL <> '' then
    Writeln(T1, 'Erro ao Deletar '+sErroSQL);
end;

procedure TfmxSincroniza.DeletarRegistrosDestino(PSigla, PCampoData, PCC: string;
  CNCOrigem:Boolean=False);
var
  sCNC: string;
  sErroSQL: AnsiString;
begin
  sCNC := '';

  if vDataReferencia > StrToDate('01/01/1910') then
  Begin
    if PCC <> '' then
    Begin
      if CNCOrigem then
        sCNC := ' AND CNC_ORIGEM='+PCC
      else
        sCNC := ' AND CNC_CODIGO='+PCC;
    end;

    //Deletar no Destino o que será copiado
    try
      sErroSQL := ExecutaSQL(qryDestino1,'DELETE FROM '+vTabelaAtual+
        ' WHERE '+PCampoData+'>="'+MesDia(vDataReferencia)+'" '+
        sCNC);
    except
    end;
    Writeln(T1, 'DEL '+PSigla+' Destino '+DateTimeToStr(vDataReferencia)+' '+sErroSQL);
  end
  else
  Begin
    if PCC <> '' then
    Begin
      if CNCOrigem then
        sCNC := 'WHERE CNC_ORIGEM='+PCC
      else
        sCNC := 'WHERE CNC_CODIGO='+PCC;
    end;

    try
      sErroSQL := ExecutaSQL(qryDestino1,'DELETE FROM '+vTabelaAtual+
        sCNC);
    except
    end;
    Writeln(T1, 'DEL '+PSigla+' Destino Todos'+' '+sErroSQL);
  end;
end;

procedure TfmxSincroniza.FormCreate(Sender: TObject);
begin
  //Configurações Regionais
  ThousandSeparator:='.';
  DecimalSeparator :=',';
  DateSeparator    :='/';
  ShortDateFormat  :='DD/MM/YYYY';
  TimeSeparator    :=':';
  ShortTimeFormat  :='hh:mm:ss';

  sSomenteTabela := '';
  iDiasEnvio     := 2;

  CdCECCNC := -1;
  CdCEC    := -1;
  CdCEFCNC := -1;
  CdCEF    := -1;

  vFalhaLocal := False;
end;

procedure TfmxSincroniza.EnviarArquivoFTP;
var
  arquivo, PastaTransm, sCC, sNomeArquivo, sArquivoOrigem: string;
  conf:TIniFile;
begin
  try
    try
      CloseFile(T1);
    except
    end;
    Append(T1);
    arquivo:=ExtractFilePath(ParamStr(0))+'confEnviaCPD.ini';

    if not FileExists(arquivo) then
    Begin
      Writeln(T1, 'Arquivo não encontrado <<'+arquivo+'>>');
      Exit;
    end;

    conf:=TIniFile.Create(arquivo);
    PastaTransm := conf.ReadString('dbDestino', 'PATH', '');
    sCC := PreencheZero(2,conf.ReadString('dbOrigem', 'CC', '0'));
    sFTPHost  := conf.ReadString('internet', 'HOST', '');
    sFTPUsu   := conf.ReadString('internet', 'USUARIO', '');
    sFTPSenha := conf.ReadString('internet', 'SENHA', 'guerra');
    sFTPProxyHost  := conf.ReadString('internet', 'ProxyHOST', '');
    sFTPProxyPorta := conf.ReadString('internet', 'ProxyPORTA', '21');
    sFTPProxyUsu   := conf.ReadString('internet', 'ProxyUSUARIO', '');
    sFTPProxySenha := conf.ReadString('internet', 'ProxySenha', '');
    iCPD := StrToInt(conf.ReadString('Configuracao', 'CPD', '0')); //1 Russas; 2 Aracati; 3 Mafalda; 4 Itapipoca; 5 Luciano
    vMagazine := (conf.ReadString('Configuracao', 'Magazine', '0') = '1'); //0 Eletro; 1 Magazine

    if sFTPHost = '' then
    Begin
      Writeln(T1, 'NÃO ENVIAR SACI_CPD POR FTP');
      Exit;
    end
    else
      Writeln(T1, 'ENVIAR SACI_CPD.RAR POR FTP');

    if not DirectoryExists(PastaTransm) then
    Begin
      Writeln(T1, 'Pasta '+PastaTransm+' não encontrada');
      Exit;
    end;

    IdFTP1.Host := sFTPHost;
    IdFTP1.Username := sFTPUsu;
    IdFTP1.Password := sFTPSenha;

    if sFTPProxyHost <> '' then
    Begin
      IdFTP1.ProxySettings.Host := sFTPProxyHost;
      IdFTP1.ProxySettings.Port := StrToInt(sFTPProxyPorta);
      IdFTP1.ProxySettings.ProxyType := fpcmOpen;
    end
    else
      IdFTP1.ProxySettings.ProxyType := fpcmNone;

    try
      IdFTP1.Connect;
    except
    end;
    try
      if not IdFTP1.Connected then
      Begin
        Writeln(T1, 'Não foi possível conectar com o servidor de FTP!');
        Exit;
      end;

      if iCPD = 1 then //Russas
        IdFTP1.ChangeDir('CPD_RUSSAS')
      else if iCPD = 2 then //Aracati
        IdFTP1.ChangeDir('CPD_ARACATI')
      else if iCPD = 3 then //Mafalda
        IdFTP1.ChangeDir('CPD_MAFALDA')
      else if iCPD = 4 then //Itapipoca
        IdFTP1.ChangeDir('CPD_ITAPIPOCA')
      else
        Raise exception.Create('Configuração do CPD inválida!');

      if vMagazine then
        IdFTP1.ChangeDir('SACI_T')
      else
        IdFTP1.ChangeDir('SACI');

      sNomeArquivo := 'SACI_CPD.rar';
      sArquivoOrigem := PastaTransm+'\SACI_CPD.rar';

      if not FileExists(sArquivoOrigem) then
      Begin
        Writeln(T1, 'Arquivo '+sArquivoOrigem+' não encontrado!');
        Exit;
      end;

      self.Caption := 'Sincronizar Tabelas - ENVIANDO ARQUIVO';
      self.Refresh;

      IdFTP1.Put(sArquivoOrigem, sNomeArquivo);
      Writeln(T1, 'ARQUIVO ENVIADO');

    finally
      try
        IdFTP1.Quit;
      except
      end;
      try
        IdFTP1.Disconnect;
      except
      end;
    end;
  except
    Writeln(T1, 'Falha desconhecida');
  end;
end;

function TfmxSincroniza.BaixarArquivoFTP(PPastaFTP, PArquivoFTP, PPastaDestino, PArquivoDestino: string):Boolean;
var
  arquivo: string;
  conf:TIniFile;
begin
  Result := False;
  try
    try
      CloseFile(T1);
    except
    end;
    Append(T1);
    arquivo:=ExtractFilePath(ParamStr(0))+'confRecebeCPD.ini';

    conf:=TIniFile.Create(arquivo);
    sFTPHost  := conf.ReadString('internet', 'HOST', '');
    sFTPUsu   := conf.ReadString('internet', 'USUARIO', '');
    sFTPSenha := conf.ReadString('internet', 'SENHA', 'guerra');
    sFTPProxyHost  := conf.ReadString('internet', 'ProxyHOST', '');
    sFTPProxyPorta := conf.ReadString('internet', 'ProxyPORTA', '21');
    sFTPProxyUsu   := conf.ReadString('internet', 'ProxyUSUARIO', '');
    sFTPProxySenha := conf.ReadString('internet', 'ProxySenha', '');
    iCPD := StrToInt(conf.ReadString('Configuracao', 'CPD', '0')); //1 Russas; 2 Aracati; 3 Mafalda; 4 Itapipoca; 5 Luciano
    vMagazine := (conf.ReadString('Configuracao', 'Magazine', '0') = '1'); //0 Eletro; 1 Magazine

    if sFTPHost = '' then
    Begin
      Writeln(T1, 'NÃO RECEBER SACI_FILIAL POR FTP');
      Exit;
    end
    else
      Writeln(T1, 'RECEBER SACI_FILIAL POR FTP');

    if not DirectoryExists(PPastaDestino) then
    Begin
      Writeln(T1, 'Pasta '+pPastaDestino+' não encontrada');
      Exit;
    end;

    IdFTP1.Host := sFTPHost;
    IdFTP1.Username := sFTPUsu;
    IdFTP1.Password := sFTPSenha;

    if sFTPProxyHost <> '' then
    Begin
      IdFTP1.ProxySettings.Host := sFTPProxyHost;
      IdFTP1.ProxySettings.Port := StrToInt(sFTPProxyPorta);
      IdFTP1.ProxySettings.ProxyType := fpcmOpen;
    end
    else
      IdFTP1.ProxySettings.ProxyType := fpcmNone;

    try
      IdFTP1.Connect;
    except
    end;
    try
      if not IdFTP1.Connected then
      Begin
        Writeln(T1, 'Não foi possível conectar com o servidor de FTP!');
        Exit;
      end;

      if vMagazine then
        sPastaRaizFTP := 'SACI_T'
      else
        sPastaRaizFTP := 'SACI';

      IdFTP1.ChangeDir(sPastaRaizFTP);

      IdFTP1.ChangeDir(Copy(PPastaFTP,2,Length(PPastaFTP)-1)); //EX:  LOJA_02  ou MAFLOJA_02

      {if not ArquivoFTPExiste(IdFTP1, '', PArquivoFTP) then
      Begin
        ApagarArquivos(PPastaDestino, PArquivoDestino);
        Writeln(T1, 'Arquivo não encontrado '+PArquivoFTP+'!');
        Exit;
      end;}

      try
        IdFTP1.Get(PArquivoFTP, PPastaDestino+'\'+PArquivoDestino, True);
      except
        ApagarArquivos(PPastaDestino, PArquivoDestino);
        Writeln(T1, 'Falha ao Baixar o arquivo!');
        Exit;
      end;
      try
        IdFTP1.Delete(PArquivoFTP+'1');
      except
      end;
      try
        IdFTP1.Rename(PArquivoFTP,PArquivoFTP+'1');
      except
      end;
      Writeln(T1, 'ARQUIVO RECEBIDO');
      Result := True;
    finally
      try
        IdFTP1.Quit;
      except
      end;
      try
        IdFTP1.Disconnect;
      except
      end;
    end;
  except
    Writeln(T1, 'Falha desconhecida');
  end;
end;

procedure TfmxSincroniza.IdFTP1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
// Para não aparecer mensagens
end;

end.
