unit MxImportarDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Mask, StdCtrls, Buttons, DB, DBTables, SQuery, Cliente, Gauges,
  DateUtils, Menus, Informacoes;

type
  TVetorSegmento = array[0..5] of string;
  TfMxImportarDados = class(TForm)
    Panel1: TPanel;
    panBotoes: TPanel;
    SB_Importar: TSpeedButton;
    SB_Fechar: TSpeedButton;
    memDados: TMemo;
    Cliente1: TCliente;
    lblProcesso: TLabel;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Principal1: TMenuItem;
    Importar1: TMenuItem;
    N1: TMenuItem;
    Leiaute1: TMenuItem;
    VerificarArquivo1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    edtLocalArquivo: TEdit;
    cmbTabela: TComboBox;
    SB_LocArquivo: TSpeedButton;
    barProgresso: TGauge;
    Informacoes1: TInformacoes;
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ImportarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmbTabelaClick(Sender: TObject);
    procedure Leiaute1Click(Sender: TObject);
    procedure VerificarArquivo1Click(Sender: TObject);
    procedure SB_LocArquivoClick(Sender: TObject);
  private
    Arquivo: TextFile;
    iUltimaLinha: integer;
    iCodEmpresa, iEntradaSaida, iNumeroSeqArq, iVersaoLeiaute, iTipoOperacao,
      iQtdRegPrincipais, iQtdRegPrincipaisReal, iQtdRegGeral, iMenorCodSACI, iMaiorCodSACI,
      iUltSeqSegmento :integer;
    sNomeProgExp, sObsArquivo, sCodSegmento :string;
    vDataHoraGeracao, vDataImportacao: TDateTime;
    vVetorSegmento : array of TVetorSegmento;
    function VerificarArquivo: Boolean;
    function ImportarArquivo: Boolean;
    function VerificarCabecalho(PLinha:string): String;
    function VerificarRodape(PLinha:string): string;
    function VerificarDetalhe(PLinha: string): string;
    function ColocarMascaraData(PData: string): string;
    function VerificaParametro(CdPAR:integer; PFiltro: string): string;
    function ImportarCliente(PSegmento0, PSegmento1, PSegmento2,
      PSegmento3, PSegmento4: String): string;
    function VerificaParametroDescricao(PDescricao, PFiltro: string): integer;
  public
    { Public declarations }
  end;
  procedure CarregaLayout(var Memo1: TMemo); StdCall; External 'SACIFuncoesDLL.dll';

var
  fMxImportarDados: TfMxImportarDados;

implementation

uses UDM, funcoes, MxMensagem;

{$R *.DFM}

procedure TfMxImportarDados.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxImportarDados.SB_ImportarClick(Sender: TObject);
var
  sLinha: string;
  iLinha: integer;
begin
  if cmbTabela.Items.Count <= 0 then
    Raise exception.Create('Usuário não tem permissão para inserir registros (produto,fornecedor,...)');

  if not FileExists(edtLocalArquivo.Text) then
    Raise exception.Create('Arquivo não encontrado!');

  If MessageDlg('Atenção!!!'+#13+
      'Deseja importar o arquivo indicado?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  SetLength(vVetorSegmento, 0);
  iQtdRegPrincipaisReal := 0;

  SB_Importar.Enabled := False;
  SB_Fechar.Enabled   := False;
  barProgresso.Progress := 0;

  vDataImportacao := DM.Configuracao1.DataHora;

  try
    try
      AssignFile(Arquivo, edtLocalArquivo.Text);
      Reset(Arquivo);
      iLinha := 0;
      while not Eof(Arquivo) do
      Begin
        Readln(Arquivo, sLinha);
        inc(iLinha);
      end;
      if iLinha<=2 then
        Raise exception.Create('Arquivo sem registros ou inválido!');
      iUltimaLinha := iLinha;
      barProgresso.MaxValue := 10 + (iLinha * 2); //10-Inicio + Verificar e Importar
    except
      ShowMessage('Falha ao abrir o arquivo!');
      Exit;
    end;

    barProgresso.Progress := 10;

    lblProcesso.Caption := 'Verificando Arquivo...';
    panBotoes.Refresh;

    if VerificarArquivo then
    Begin
      lblProcesso.Caption := 'Iniciando Importação...';
      panBotoes.Refresh;

      if ImportarArquivo then
      Begin
        lblProcesso.Caption := 'Concluída com Sucesso!';
        panBotoes.Refresh;
      end
      else
      Begin
        lblProcesso.Caption := 'Falha na Improtação!';
        panBotoes.Refresh;
      end;
    end
    else
    Begin
      lblProcesso.Caption := 'Arquivo com problema(s)!';
      panBotoes.Refresh;
    end;
  finally
    try
      CloseFile(Arquivo);
    except
    end;
    SB_Importar.Enabled := True;
    SB_Fechar.Enabled   := True;
  end;
end;

procedure TfMxImportarDados.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxImportarDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    CloseFile(Arquivo);
  except
  end;
  Action := caFree;
end;

procedure TfMxImportarDados.FormShow(Sender: TObject);
Begin
  DM.Usuario1.AlteraCorComponentes(self);
  edtLocalArquivo.Text := '';

  cmbTabela.Clear;
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(20)) > 0 then  //Inserir Cliente
    cmbTabela.Items.Add('Cliente');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(460)) > 0 then  //Inserir Produto
    cmbTabela.Items.Add('Produto');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(140)) > 0 then  //Inserir Fornecedor
    cmbTabela.Items.Add('Fornecedor');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(220)) > 0 then  //Inserir Transportadora
    cmbTabela.Items.Add('Transportadora');
  cmbTabela.ItemIndex := 0;
  cmbTabelaClick(sender);
end;

procedure TfMxImportarDados.cmbTabelaClick(Sender: TObject);
var
  sPasta: string;
begin
  if cmbTabela.Items.Count <= 0 then
  Begin
    cmbTabela.ItemIndex := -1;
    Exit;
  end;

  sPasta := DM.Configuracao1.PastaSistema+'\IMPORTACAO';

  if not DirectoryExists(sPasta) then
    CreateDir(sPasta);

  if UpperCase(cmbTabela.Items[cmbTabela.ItemIndex]) = 'CLIENTE' then
    edtLocalArquivo.Text := sPasta+'\IMP_CLIENTES.TXT'
  else if UpperCase(cmbTabela.Items[cmbTabela.ItemIndex]) = 'PRODUTO' then
    edtLocalArquivo.Text := sPasta+'\IMP_PRODUTOS.TXT'
  else if UpperCase(cmbTabela.Items[cmbTabela.ItemIndex]) = 'FORNECEDOR' then
    edtLocalArquivo.Text := sPasta+'\IMP_FORNECEDORES.TXT'
  else if UpperCase(cmbTabela.Items[cmbTabela.ItemIndex]) = 'TRANSPORTADORA' then
    edtLocalArquivo.Text := sPasta+'\IMP_TRANSPORTADORAS.TXT'
  else
  Begin
    cmbTabela.ItemIndex := -1;
    Raise exception.Create('Processo não preparado!');
  end;
end;

function TfMxImportarDados.VerificarArquivo:Boolean;
var
  sMensagemFalha, sLinha, sMensagem: string;
  iLinha, iFalhas: integer;
Begin
  memDados.Clear;
  sMensagemFalha := '';

  SetLength(vVetorSegmento, 0);
  iQtdRegPrincipaisReal := 0;

  iFalhas := 0;
  iLinha := 1;
  iUltSeqSegmento := -1;

  try
    Reset(Arquivo);
    while not Eof(Arquivo) do
    Begin
      barProgresso.Progress := barProgresso.Progress + 1;
      Readln(Arquivo, sLinha);
      if iLinha = 1 then //Cabecalho
      Begin
        sMensagem := VerificarCabecalho(sLinha);
        if sMensagem <> '' then
        Begin
          inc(iFalhas);
          memDados.Lines.Add(PreencheZero(8,iLinha)+'*'+sLinha);
          memDados.Lines.Add(sMensagem);
        end
        else
          memDados.Lines.Add(PreencheZero(8,iLinha)+'-'+sLinha);
      end
      else if iLinha = iUltimaLinha then
      Begin
        sMensagem := VerificarRodape(sLinha);
        if sMensagem <> '' then
        Begin
          inc(iFalhas);
          memDados.Lines.Add(PreencheZero(8,iLinha)+'*'+sLinha);
          memDados.Lines.Add(sMensagem);
        end
        else
          memDados.Lines.Add(PreencheZero(8,iLinha)+'-'+sLinha);
      end
      else //Segmentos
      Begin
        sMensagem := VerificarDetalhe(sLinha);
        if sMensagem <> '' then
        Begin
          inc(iFalhas);
          memDados.Lines.Add(PreencheZero(8,iLinha)+'*'+sLinha);
          memDados.Lines.Add(sMensagem);
        end
        else
          memDados.Lines.Add(PreencheZero(8,iLinha)+'-'+sLinha);
      end;
      inc(iLinha);
    end;
  finally
    if iFalhas > 0 then
    Begin
      Result := False;
      ShowMessage('Falha em '+IntToStr(iFalhas)+'/'+IntToStr(iLinha-1)+' linhas(s)!');
    end
    else
      Result := True;
  end;
end;

function TfMxImportarDados.ImportarArquivo:Boolean;
var
  i: integer;
Begin
  Result := False;
  for i := 0 to High(vVetorSegmento) do
  Begin
    case iTipoOperacao of
      //Cliente
      1:Begin
          ImportarCliente(vVetorSegmento[i][0],vVetorSegmento[i][1],vVetorSegmento[i][2],vVetorSegmento[i][3],vVetorSegmento[i][4]);
        end;
      //Produto
      2:Begin
        end;
      //Fornecedor
      3:Begin
        end;
      //Transportadora
      4:Begin
        end;
    end;
  end;
end;

function TfMxImportarDados.VerificarCabecalho(PLinha:string):string;
var
  sMensagemFalha: string;
Begin
  sMensagemFalha := '';

  if Length(PLinha) <> 312 then
  Begin
    Result := sMensagemFalha+'Tamanho do Cabecalho inválido!'+#13+#10;
    Exit;
  end;

  if PLinha[1] <> '0' then
    sMensagemFalha := sMensagemFalha + 'Identificação de Cabeçalho inválida!'+#13+#10;

  try
    iCodEmpresa := StrToInt(Trim(Copy(PLinha,2,2)));
    if not (iCodEmpresa in [empEletro,empPetromax,empLBM,empMotical,empCreator,
                            empAndrea,empLuciano,empHope]) then
      Raise exception.Create('');
  except
    sMensagemFalha := sMensagemFalha + 'Código da Empresa inválido!'+#13+#10;
  end;

  sNomeProgExp := Trim(Copy(PLinha,4,30));
  if sNomeProgExp = '' then
    sNomeProgExp := 'NAO IDENTIFICADO';

  try
    iEntradaSaida := StrToInt(PLinha[34]);
    if iEntradaSaida <> 1 then //Entrada
      Raise exception.Create('');
  except
    sMensagemFalha := sMensagemFalha + 'Código de Entrada/Saída inválido!'+#13+#10;
  end;

  try
    vDataHoraGeracao := StrToDateTime(ColocarMascaraData(Copy(PLinha,35,12)));
    if (vDataHoraGeracao = 0) or
       (vDataHoraGeracao > DM.Configuracao1.DataHora) then
      Raise exception.Create('');
  except
    sMensagemFalha := sMensagemFalha + 'Data/Hora de Geração do arquivo inválida!'+#13+#10;
  end;

  try
    iNumeroSeqArq := StrToInt(Trim(Copy(PLinha,47,6)));
    if iNumeroSeqArq <= 0 then
      Raise exception.Create('');
  except
    sMensagemFalha := sMensagemFalha + 'Número seqüêncial do arquivo inválido!'+#13+#10;
  end;

  try
    iVersaoLeiaute := StrToInt(Trim(Copy(PLinha,53,3)));
    if iVersaoLeiaute <> 10 then
      Raise exception.Create('');
  except
    sMensagemFalha := sMensagemFalha + 'Versão do leiaute inválida!'+#13+#10;
  end;

  try
    iTipoOperacao := StrToInt(Trim(Copy(PLinha,56,2)));
    if (UpperCase(cmbTabela.Items[cmbTabela.ItemIndex]) = 'CLIENTE') and
       (iTipoOperacao <> 1) then //Importação de Cliente
      Raise exception.Create('')
    else if (UpperCase(cmbTabela.Items[cmbTabela.ItemIndex]) = 'PRODUTO') and
       (iTipoOperacao <> 2) then //Importação de Produto
      Raise exception.Create('')
    else if (UpperCase(cmbTabela.Items[cmbTabela.ItemIndex]) = 'FORNECEDOR') and
       (iTipoOperacao <> 3) then //Importação de Fornecedor
      Raise exception.Create('')
    else if (UpperCase(cmbTabela.Items[cmbTabela.ItemIndex]) = 'TRANSPORTADORA') and
       (iTipoOperacao <> 4) then //Importação de Transportadora
      Raise exception.Create('')
    else if not (iTipoOperacao in [1,2,3,4]) then
      Raise exception.Create('');
  except
    iTipoOperacao := -1;
    sMensagemFalha := sMensagemFalha + 'Tipo de Operacao inválido/incompatível!'+#13+#10;
  end;

  sObsArquivo := Trim(Copy(PLinha,58,255));

  Result := sMensagemFalha;
end;

function TfMxImportarDados.VerificarRodape(PLinha:string):string;
var
  sMensagemFalha: string;
Begin
  sMensagemFalha := '';

  if Length(PLinha) <> 33 then
  Begin
    Result := sMensagemFalha+'Tamanho do Rodape inválido!'+#13+#10;
    Exit;
  end;

  if PLinha[1] <> '2' then
    sMensagemFalha := sMensagemFalha + 'Identificação de Rodape inválida!'+#13+#10;

  try
    iQtdRegPrincipais := StrToInt(Trim(Copy(PLinha,2,8)));
    if (iQtdRegPrincipais) <> iQtdRegPrincipaisReal then
      Raise exception.Create('');
  except
    sMensagemFalha := sMensagemFalha + 'Quantidade de registros A0 ou B0 ou C0 ou D0 inválida!'+#13+#10;
  end;

  try
    iQtdRegGeral := StrToInt(Trim(Copy(PLinha,10,8)));
    if iQtdRegGeral <> iUltimaLinha then
      Raise exception.Create('');
  except
    sMensagemFalha := sMensagemFalha + 'Quantidade de Registros Gerais inválida!'+#13+#10;
  end;

  try
    iMenorCodSACI := StrToInt(Trim(Copy(PLinha,18,8)));
  except
    iMenorCodSACI := -1;
    sMensagemFalha := sMensagemFalha + 'Menor Código do SIAC inválido!'+#13+#10;
  end;

  try
    iMaiorCodSACI := StrToInt(Trim(Copy(PLinha,26,8)));
    if iMaiorCodSACI < iMaiorCodSACI then
      Raise exception.Create('');
  except
    sMensagemFalha := sMensagemFalha + 'Maior Código do SIAC inválido!'+#13+#10;
  end;

  Result := sMensagemFalha;
end;

Function TfMxImportarDados.VerificarDetalhe(PLinha:string):string;
var
  sMensagemFalha, sCPFCNPJREFERENCIA: string;
  iSeqSegmento, iInserirAlterar, iCodSACI, iSituacao: integer;
Begin
  sMensagemFalha := '';

  if iTipoOperacao = -1 then
  Begin
    Result := sMensagemFalha+'Tipo de Operação inválido!'+#13+#10;
    Exit;
  end;

  if Length(PLinha) < 11 then
  Begin
    Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
    Exit;
  end;

  if PLinha[1] <> '1' then
    sMensagemFalha := sMensagemFalha + 'Identificação de Detalhe inválida!'+#13+#10;

  sCodSegmento := Trim(Copy(PLinha,2,2));

  try
    iSeqSegmento := StrToInt(Trim(Copy(PLinha,4,8)));
  except
    iSeqSegmento := -1;
    sMensagemFalha := sMensagemFalha + 'Sequência do Segmento inválida!'+#13+#10;
  end;

  iCodSACI := -1;
  iInserirAlterar := -1;

  if (sCodSegmento = 'A0') or
     (sCodSegmento = 'B0') or
     (sCodSegmento = 'C0') or
     (sCodSegmento = 'D0') then
  Begin
    inc(iQtdRegPrincipaisReal);
    if (iSeqSegmento <= iUltSeqSegmento) then
      sMensagemFalha := sMensagemFalha + 'Sequência do Segmento inferior ou repetida!'+#13+#10;

    if Length(PLinha) <> 41 then
    Begin
      Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
      Exit;
    end;

    try
      iInserirAlterar := StrToInt(Trim(PLinha[12]));
      if not (iInserirAlterar in [1,2]) then
        Raise exception.Create('');
    except
      sMensagemFalha := sMensagemFalha + 'Opção de Inserir/Alterar inválida!'+#13+#10;
    end;

    try
      iCodSACI := StrToInt(Trim(Copy(PLinha,13,8)));
    except
      sMensagemFalha := sMensagemFalha + 'Código no SIAC inválido!'+#13+#10;
    end;

    sCPFCNPJREFERENCIA := Trim(Copy(PLinha,21,20));

    if iTipoOperacao <> 2 then //Diferente de Produto
      if not VerificaCPFCNPJ(sCPFCNPJREFERENCIA) then
        sMensagemFalha := sMensagemFalha + 'CPF/CNPJ inválido!'+#13+#10;

    if (iCodSACI = 0) and
       (sCPFCNPJREFERENCIA = '') then
      sMensagemFalha := sMensagemFalha + 'Ausência de Código e/ou CPF/CNPJ/Referência!'+#13+#10;

    try
      iSituacao := StrToInt(Trim(PLinha[41]));
    except
      iSituacao := -1;
    end;
    if iSituacao < 0 then
      sMensagemFalha := sMensagemFalha + 'Situação inválida!'+#13+#10;

  end
  else //Não é A0, B0, C0, D0
  Begin
    if (iSeqSegmento <> iUltSeqSegmento) then
      sMensagemFalha := sMensagemFalha + 'Sequência do Segmento diferente do A0!'+#13+#10;
  end;

  case iTipoOperacao of
    //Importar Cliente
    1:Begin
        if sCodSegmento = 'A0' then
        Begin
          SetLength(vVetorSegmento, High(vVetorSegmento)+2);
          vVetorSegmento[High(vVetorSegmento)][0] := PLinha;
          with DM.QR_Consultas do
          Begin
            Close;
            if (iCodSACI > 0) then
            Begin
              SQL.Text := 'SELECT CLI_CODIGO '+
                ' FROM CLIENTE '+
                ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND CLI_CODIGO='+IntToStr(iCodSACI);
              Open;
            end
            else if (sCPFCNPJREFERENCIA <> '') then
            Begin
              SQL.Text := 'SELECT CLI_CODIGO '+
                ' FROM CLIENTE '+
                ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND CLI_CGC_CPF="'+sCPFCNPJREFERENCIA+'" ';
              Open;
            end;
            if (not Active) then
               //Falha já notificada anteriormente
            else if (not IsEmpty) and
                    (iInserirAlterar = 1) then //Inserir
              sMensagemFalha := sMensagemFalha + 'Código/CPF/CNPJ do Cliente já existe!'+#13+#10
            else if (IsEmpty) and
                    (iInserirAlterar = 2) then //Alteração
              sMensagemFalha := sMensagemFalha + 'Código/CPF/CNPJ do Cliente não existe!'+#13+#10
          end;
        end
        else if sCodSegmento = 'A1' then
        Begin
          vVetorSegmento[High(vVetorSegmento)][1] := PLinha;
          if Length(PLinha) <> 869 then
          Begin
            Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
            Exit;
          end;

          //Verificar Data de Nascimento
          if not VerificaData(ColocarMascaraData(Trim(Copy(PLinha,12,8)))) then
            sMensagemFalha := sMensagemFalha + 'Data de Nascimento inválida!'+#13+#10;

          //Verificar Pessoa Física ou Jurídica
          if (PLinha[20] <> '0') and
             (PLinha[20] <> '1') then
            sMensagemFalha := sMensagemFalha + 'Não foi definido Física ou Jurídica corretamente!'+#13+#10;

          //Verificar se é tipo Atacado
          if (PLinha[21] <> '0') and
             (PLinha[21] <> '1') then
            sMensagemFalha := sMensagemFalha + 'Não foi definido tipo Atacado corretamente!'+#13+#10;

          //Verificar Desconto no Cadastro
          try
            StrToInt(Copy(PLinha,22,8));
            StrToInt(Copy(PLinha,30,2));
          except
            sMensagemFalha := sMensagemFalha + 'Desconto no cadastro inválido!'+#13+#10;
          end;

          //Verificar Órgão
          try
            if not (StrToInt(PLinha[32]) in [0,1,2,3]) then
              Raise exception.Create('');
            if (PLinha[20] = '1') and   //Pessoa Física
               (PLinha[32] <> '0') then //Órgão
              Raise exception.Create('');
          except
            sMensagemFalha := sMensagemFalha + 'Órgão inválido!'+#13+#10;
          end;

          //Verificar Razão Social
          if  Pos(' ', Trim(Copy(PLinha,33,60))) <= 0 then
            sMensagemFalha := sMensagemFalha + 'Razão Social com menos de 2 palavras!'+#13+#10;

          //Nome Fantasia

          //RG/CGF
          if (PLinha[20] = '0') and                 //Pessoa Jurídica
             (Trim(Copy(PLinha,153,20)) <> '') and  //CGF Definido
             (Trim(Copy(PLinha,283,2)) <> '') then  //UF definido
          Begin
            if not VerificaCGFBranco(Trim(Copy(PLinha,153,20)), Trim(Copy(PLinha,283,2)), False) then
              sMensagemFalha := sMensagemFalha + 'CGF inválido!'+#13+#10;
          end;

          //Logradouro

          //Endereço

          //Bairro

          //Cidade

          //UF

          //CEP

          //Fone

          //Fax

          //Celular

          //Nome do Pai

          //Nome da Mãe

          //Cônjuge / Cód.Vendedor
          if (DM.Configuracao1.Empresa IN [empLBM,empMotical]) then //Código do Vendedor
          Begin
            try
              with DM.QR_Consultas do
              Begin
                Close;
                SQL.Text := 'SELECT FUN_CODIGO '+
                  ' FROM FUNCIONARIO '+
                  ' WHERE FUN_CODIGO='+IntToStr(StrToInt(Trim(Copy(PLinha,465,50))));
                Open;
                if IsEmpty then
                  Raise exception.Create('');
              end;
            except
              sMensagemFalha := sMensagemFalha + 'Código do Vendedor inválido!'+#13+#10;
            end;
          end;

          //Observação

        end
        else if sCodSegmento = 'A2' then
        Begin
          vVetorSegmento[High(vVetorSegmento)][2] := PLinha;
          if Length(PLinha) <> 884 then
          Begin
            Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
            Exit;
          end;

          //Verificar Tipo de Faturamento
          try
            if not (StrToInt(PLinha[12]) in [0,1,2,3]) then
              Raise exception.Create('');
          except
            sMensagemFalha := sMensagemFalha + 'Tipo da Faturamento Pendente inválido!'+#13+#10;
          end;

          //Verificar Nota
          try
            StrToInt(PLinha[13]);
          except
            sMensagemFalha := sMensagemFalha + 'Definição Nota inválida!'+#13+#10;
          end;

          //Verificar Classificação
          try
            if StrToInt(Copy(PLinha,14,8)) <> 0 then //Código da Classificação
              if VerificaParametro(StrToInt(Copy(PLinha,14,8)),' AND TPR_CODIGO=60 ') = '' then
                Raise exception.Create('');
          except
            sMensagemFalha := sMensagemFalha + 'Código da Classificação inválido!'+#13+#10;
          end;

          //Verificar Tipo
          try
            if StrToInt(Copy(PLinha,22,8)) <> 0 then //Código do Tipo
              if VerificaParametro(StrToInt(Copy(PLinha,22,8)),' AND TPR_CODIGO=110 ') = ''  then
                Raise exception.Create('');
          except
            sMensagemFalha := sMensagemFalha + 'Código do Tipo inválido!'+#13+#10;
          end;

          //Local de Trabalho

          //Profissão/Ramo de Atividade

          //Site

          //EMail

          //Referencia1

          //Referencia2

          //Referencia3

        end
        else if sCodSegmento = 'A3' then
        Begin
          vVetorSegmento[High(vVetorSegmento)][3] := PLinha;
          if Length(PLinha) <> 33 then
          Begin
            Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
            Exit;
          end;

          //Verificar CNC Convênio e Código Convênio
          try
            if StrToInt(Copy(PLinha,16,8)) <> 0 then //Código Convênio
            Begin
              with DM.QR_Consultas do
              Begin
                CLose;
                SQL.Text := 'SELECT CLI_CODIGO '+
                  ' FROM CLIENTE '+
                  ' WHERE CNC_CODIGO='+IntToStr(StrToInt(Copy(PLinha,12,4)))+
                  ' AND CLI_CODIGO='+IntToStr(StrToInt(Copy(PLinha,16,8)));
                Open;
                if IsEmpty then
                  Raise exception.Create('');
              end;
            end;
          except
            sMensagemFalha := sMensagemFalha + 'Código do CNC e/ou Cód.Convênio inválido!'+#13+#10;
          end;

          //Verificar Limite de Crédito Convênio
          try
            StrToInt(Copy(PLinha,24,8));
            StrToInt(Copy(PLinha,32,2));
          except
            sMensagemFalha := sMensagemFalha + 'Limite de Crédito inválido!'+#13+#10;
          end;
        end
        else if sCodSegmento = 'A4' then
        Begin
          vVetorSegmento[High(vVetorSegmento)][4] := PLinha;
          if Length(PLinha) <> 179 then
          Begin
            Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
            Exit;
          end;

          //Código do Avalista
          try
            if StrToInt(Copy(PLinha,12,8)) <> 0 then //Código do Avalista
            Begin
              with DM.QR_Consultas do
              Begin
                CLose;
                SQL.Text := 'SELECT AVL_CODIGO '+
                  ' FROM AVALISTA '+
                  ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                  ' AND AVL_CODIGO='+IntToStr(StrToInt(Copy(PLinha,12,8)));
                Open;
                if IsEmpty then
                  Raise exception.Create('');
              end;
            end;
          except
            sMensagemFalha := sMensagemFalha + 'Código do Avalista inválido!'+#13+#10;
          end;

          //Verificar Código da Forma de Pagamento
          try
            if StrToInt(Copy(PLinha,20,8)) <> 0 then //Código da Forma de Pagamento
            Begin
              with DM.QR_Consultas do
              Begin
                CLose;
                SQL.Text := 'SELECT FPG_CODIGO '+
                  ' FROM FORMA_DE_PAGAMENTO '+
                  ' WHERE FPG_CODIGO='+IntToStr(StrToInt(Copy(PLinha,20,8)));
                Open;
                if IsEmpty then
                  Raise exception.Create('');
              end;
            end;
          except
            sMensagemFalha := sMensagemFalha + 'Código da Forma de pagamento inválido!'+#13+#10;
          end;

          //Verificar Renda Mensal
          try
            StrToInt(Copy(PLinha,28,8));
            StrToInt(Copy(PLinha,36,2));
          except
            sMensagemFalha := sMensagemFalha + 'Renda Mensal inválida!'+#13+#10;
          end;

          //Verificar Limite de Crédito
          try
            StrToInt(Copy(PLinha,38,8));
            StrToInt(Copy(PLinha,46,2));
          except
            sMensagemFalha := sMensagemFalha + 'Limite de Crédito inválido!'+#13+#10;
          end;

          //Logradouro Cob

          //Endereco Cob

          //Bairro Cob

          //Cidade Cob

          //UF Cob

          //CEP Cob

        end
        else
          sMensagemFalha := sMensagemFalha + 'Código do Segmento inválido!'+#13+#10;
      end;
    //Importar Produto
    2:Begin
        if sCodSegmento = 'B0' then
        Begin

        end
        else if sCodSegmento = 'B1' then
        Begin
          if Length(PLinha) <> 821 then
          Begin
            Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
            Exit;
          end;
        end
        else if sCodSegmento = 'B2' then
        Begin
          if Length(PLinha) <> 71 then
          Begin
            Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
            Exit;
          end;
        end
        else if sCodSegmento = 'B3' then
        Begin
          if Length(PLinha) <> 111 then
          Begin
            Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
            Exit;
          end;
        end
        else
          sMensagemFalha := sMensagemFalha + 'Código do Segmento inválido!'+#13+#10;
      end;
    //Importar Fornecedor
    3:Begin
        if sCodSegmento = 'C0' then
        Begin

        end
        else if sCodSegmento = 'C1' then
        Begin
          if Length(PLinha) <> 980 then
          Begin
            Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
            Exit;
          end;
        end
        else
          sMensagemFalha := sMensagemFalha + 'Código do Segmento inválido!'+#13+#10;
      end;
    //Importar Transportadora
    4:Begin
        if sCodSegmento = 'D0' then
        Begin

        end
        else if sCodSegmento = 'D1' then
        Begin
          if Length(PLinha) <> 794 then
          Begin
            Result := sMensagemFalha+'Tamanho do Detalhe inválido!'+#13+#10;
            Exit;
          end;
        end
        else
          sMensagemFalha := sMensagemFalha + 'Código do Segmento inválido!'+#13+#10;
      end;
  end;

  if iSeqSegmento >= 0 then
    iUltSeqSegmento := iSeqSegmento;

  Result := sMensagemFalha;
end;

Function TfMxImportarDados.ColocarMascaraData(PData:string):string;
Begin
  Result := '-1';

  if Length(PData) < 4 then
    Exit;

  if (PData = '0000') or            //DDMM
     (PData = '00000000') or        //DDMMYYYY
     (PData = '000000000000') then  //DDMMYYYYHHMM
  Begin
    Result := '';
    Exit;
  end;

  if Length(PData) = 4 then
    Result := Copy(PData,1,2) + '/' + Copy(PData,3,2) + '/' + '1900'
  else if Length(PData) = 8 then
    Result := Copy(PData,1,2) + '/' + Copy(PData,3,2) + '/' + Copy(PData,5,4)
  else
    Result := Copy(PData,1,2) + '/' + Copy(PData,3,2) + '/' + Copy(PData,5,4) + Copy(PData,9,2) + ':' + Copy(PData,11,2);
end;

Function TfMxImportarDados.VerificaParametro(CdPAR:integer; PFiltro: string):string;
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PAR_DESCRICAO '+
      ' FROM PARAMETRO '+
      ' WHERE PAR_CODIGO='+IntToStr(CdPAR)+
      PFiltro;
    Open;
    Result := Trim(FieldByName('PAR_DESCRICAO').asString);
  end;
end;

Function TfMxImportarDados.VerificaParametroDescricao(PDescricao, PFiltro: string):integer;
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT PAR_CODIGO '+
      ' FROM PARAMETRO '+
      ' WHERE PAR_DESCRICAO="'+Trim(UpperCase(PDescricao))+'" '+
      PFiltro;
    Open;
    Result := FieldByName('PAR_CODIGO').asInteger;
  end;
end;

procedure TfMxImportarDados.VerificarArquivo1Click(Sender: TObject);
var
  sLinha: string;
  iLinha: integer;
begin
  if not FileExists(edtLocalArquivo.Text) then
    Raise exception.Create('Arquivo não encontrado!');

  SB_Importar.Enabled := False;
  SB_Fechar.Enabled   := False;
  barProgresso.Progress := 0;

  try
    try
      AssignFile(Arquivo, edtLocalArquivo.Text);
      Reset(Arquivo);
      iLinha := 0;
      while not Eof(Arquivo) do
      Begin
        Readln(Arquivo, sLinha);
        inc(iLinha);
      end;
      if iLinha<=2 then
        Raise exception.Create('Arquivo sem registros ou inválido!');
      iUltimaLinha := iLinha;
      barProgresso.MaxValue := 10 + iLinha; //10-Inicio + Verificar
    except
      ShowMessage('Falha ao abrir o arquivo!');
      Exit;
    end;

    barProgresso.Progress := 10;

    lblProcesso.Caption := 'Verificando Arquivo...';
    panBotoes.Refresh;

    if VerificarArquivo then
    Begin
      lblProcesso.Caption := 'Arquivo Verificado! OK!!!';
      panBotoes.Refresh;
    end
    else
    Begin
      lblProcesso.Caption := 'Arquivo com problema(s)!';
      panBotoes.Refresh;
    end;
  finally
    try
      CloseFile(Arquivo);
    except
    end;
    SB_Importar.Enabled := True;
    SB_Fechar.Enabled   := True;
  end;
end;

procedure TfMxImportarDados.SB_LocArquivoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edtLocalArquivo.Text := OpenDialog1.FileName;
end;

function TfMxImportarDados.ImportarCliente(PSegmento0, PSegmento1, PSegmento2, PSegmento3, PSegmento4:String):string;
var
  sMensagemFalha, sCPFCNPJREFERENCIA, sRGCGF, sLocalTrabalho, sProfissao, sSite,
    sEMail, sReferencia1, sReferencia2, sReferencia3, sEnderecoCob,
    sBairroCob, sCidadeCob, sUFCob, sCEPCob, sSegmento1, sSegmento2, sSegmento3, sSegmento4, sLimiteConvenio: string;
  CdCNC, CdAVL, CdFPG, iInserirAlterar, iCodSACI, iSituacao, iLogradouro, iLogradouroCob,
    iFisicaJuridica, iAtacado, iQuinzenal, iMensal, iNota, iClassificacao, iTipo,
    iConvenioCNC, iConvenio : integer;
  vDtNascimento: TDateTime;
  vDesconto, vRendaMensal, vLimitePessoal, vLimiteConvenio: Double;
Begin
  sMensagemFalha := '';

  CdCNC := DM.Configuracao1.CodigoCNC;

  iInserirAlterar    := StrToInt(Trim(PSegmento0[12]));
  sCPFCNPJREFERENCIA := Trim(Copy(PSegmento0,21,20));
  iSituacao          := StrToInt(Trim(PSegmento0[41]));

  iCodSACI           := StrToInt(Trim(Copy(PSegmento0,13,8)));

  if (iInserirAlterar = 1) and    //Inserir
     (Trim(PSegmento1) = '') then //Segmento que contem a Razão social, Endereço
  Begin
    Result := sMensagemFalha + 'Tentativa de inserção sem o segmento1. (Cliente Cód:'+IntToStr(iCodSACI)+' CPF/CNPJ:'+sCPFCNPJREFERENCIA+')!'+#13+#10;
    Exit;
  end;

  if PSegmento1 <> '' then
  Begin
    iLogradouro     := VerificaParametroDescricao(Trim(Copy(PSegmento1,173,30)), ' AND TPR_CODIGO=3 ');
    iFisicaJuridica := StrToInt(PSegmento1[20]);
    iAtacado        := StrToInt(PSegmento1[21]);
    vDtNascimento   := StrToDate(ColocarMascaraData(Trim(Copy(PSegmento1,12,8))));
    sRGCGF          := Trim(Copy(PSegmento1,153,20));
    vDesconto       := StrToFloat(Copy(PSegmento1,22,8)+','+Copy(PSegmento1,30,2));
  end
  else
  Begin
    iLogradouro     := 0;
    iFisicaJuridica := 0;
    iAtacado        := 0;
    vDtNascimento   := 0;
    sRGCGF          := '';
    vDesconto       := 0;
  end;

  iQuinzenal     := 0;
  iMensal        := 0;
  if Trim(PSegmento2) <> '' then
  Begin
    case StrToInt(PSegmento2[12]) of  //TipoFaturamentoPendente
      1: iQuinzenal := 1;
      2: iMensal    := 1;
    end;
    iNota          := StrToInt(PSegmento2[13]);
    iClassificacao := StrToInt(Copy(PSegmento2,14,8));
    iTipo          := StrToInt(Copy(PSegmento2,22,8));
    sLocalTrabalho := Trim(Copy(PSegmento2,30 ,255));
    sProfissao     := Trim(Copy(PSegmento2,285,100));
    sSite          := Trim(Copy(PSegmento2,385,100));
    sEMail         := Trim(Copy(PSegmento2,485,100));
    sReferencia1   := Trim(Copy(PSegmento2,585,100));
    sReferencia2   := Trim(Copy(PSegmento2,685,100));
    sReferencia3   := Trim(Copy(PSegmento2,785,100));
  end
  else
  Begin
    iNota          := 0;
    iClassificacao := 0;
    iTipo          := 0;
    sLocalTrabalho := '';
    sProfissao     := '';
    sSite          := '';
    sEMail         := '';
    sReferencia1   := '';
    sReferencia1   := '';
    sReferencia1   := '';
  end;

  if Trim(PSegmento3) <> '' then
  Begin
    iConvenioCNC := StrToInt(Copy(PSegmento2,12,4));
    iConvenio    := StrToInt(Copy(PSegmento2,16,8));
    vLimiteConvenio := StrToFloat(Copy(PSegmento4,24,8)+','+Copy(PSegmento4,32,2));
  end
  else
  Begin
    iConvenioCNC := 0;
    iConvenio    := 0;
    vLimiteConvenio := 0;
  end;

  if Trim(PSegmento4) <> '' then
  Begin
    CdAVL := StrToInt(Copy(PSegmento4,12,8));
    CdFPG := StrToInt(Copy(PSegmento4,20,8));
    vRendaMensal   := StrToFloat(Copy(PSegmento4,28,8)+','+Copy(PSegmento4,36,2));
    vLimitePessoal := StrToFloat(Copy(PSegmento4,38,8)+','+Copy(PSegmento4,36,2));
    iLogradouroCob := VerificaParametroDescricao(Trim(Copy(PSegmento4,48,30)), ' AND TPR_CODIGO=3 ');
    sEnderecoCob   := Trim(Copy(PSegmento4,78,40));
    sBairroCob     := Trim(Copy(PSegmento4,118,20));
    sCidadeCob     := Trim(Copy(PSegmento4,138,20));
    sUFCob         := Trim(Copy(PSegmento4,158,2));
    sCEPCob        := Trim(Copy(PSegmento4,160,20));
  end
  else
  Begin
    CdAVL := 0;
    CdFPG := 0;
    vRendaMensal := 0;
    vLimitePessoal := 0;
    iLogradouroCob := 0;
    sEnderecoCob   := '';
    sBairroCob     := '';
    sCidadeCob     := '';
    sUFCob         := '';
    sCEPCob        := '';
  end;

  if (iInserirAlterar = 1) then    //Inserir
  Begin
    if iCodSACI = 0 then
      iCodSACI := DM.Configuracao1.ProximoCodigo('CLI_CODIGO');

    ExecutaSQL(DM.QR_Comandos, 'INSERT CLIENTE '+
      '(CNC_CODIGO, CNC_ORIGEM, USU_CODIGO, CLI_CODIGO, CLI_DT_CADASTRO, CLI_MAQUINA '+
      ',CLI_CGC_CPF, CLI_SITUACAO '+
      ',CLI_DATA_NASC, CLI_PESSOA_FISICA, CLI_VENDA_ATACADO, CLI_DESCONTO '+
      ',CLI_ORGAO, CLI_RZ_SOCIAL, CLI_NOME_FAN, CLI_CGF_RG, CLI_LOGRADOURO '+
      ',CLI_ENDERECO, CLI_BAIRRO, CLI_CIDADE, CLI_UF, CLI_CEP, CLI_FONE, CLI_FAX, CLI_CELULAR '+
      ',CLI_PAI, CLI_MAE, CLI_CONJUGE, CLI_IDENTIFICACAO, CLI_OBS1 '+
      ',CLI_QUINZENAL, CLI_MENSAL, CLI_NOTA, CLI_CLASSIFICACAO, CLI_TIPO '+
      ',CLI_LOCALTRABALHO, CLI_PROFISSAO, CLI_SITE, CLI_EMAIL '+
      ',CLI_REFERENCIA1, CLI_REFERENCIA2, CLI_REFERENCIA3 '+
      ',CNC_CONVENIO, CLI_CONVENIO, CLI_CREDITO, CLI_SPC, CLI_DT_IMPORTACAO_INS) '+
      ' VALUES '+
      '( '+IntToStr(CdCNC)+
      ', '+IntToStr(Cliente1.CentroDeCusto)+
      ', '+IntToStr(DM.Configuracao1.CodigoUSU)+
      ', '+IntToStr(iCodSACI)+
      ', '+MesDiaHora(DM.Configuracao1.DataHora)+
      ', '+IntToStr(Cliente1.Maquina)+
      ',"'+sCPFCNPJREFERENCIA+'"'+
      ', '+IntToStr(iSituacao)+
      ',"'+MesDia(vDtNascimento)+'" '+
      ', '+IntToStr(iFisicaJuridica)+
      ', '+IntToStr(iAtacado)+
      ', '+VirgPonto(vDesconto)+
      ', '+PSegmento1[32]+
      ',"'+Trim(Copy(PSegmento1,33,60))+'" '+ //Razão Social
      ',"'+Trim(Copy(PSegmento1,93,60))+'" '+ //Nome Fantasia
      ',"'+sRGCGF+'" '+
      ', '+IntToStr(iLogradouro)+
      ',"'+Trim(Copy(PSegmento1,203,40))+'" '+  //Endereço
      ',"'+Trim(Copy(PSegmento1,243,20))+'" '+  //Bairro
      ',"'+Trim(Copy(PSegmento1,263,20))+'" '+  //Cidade
      ',"'+Trim(Copy(PSegmento1,283,2))+'" '+   //UF
      ',"'+Trim(Copy(PSegmento1,285,20))+'" '+  //CEP
      ',"'+Trim(Copy(PSegmento1,305,20))+'" '+  //Fone
      ',"'+Trim(Copy(PSegmento1,325,20))+'" '+  //Fax
      ',"'+Trim(Copy(PSegmento1,345,20))+'" '+  //Celular
      ',"'+Trim(Copy(PSegmento1,365,50))+'" '+  //Pai
      ',"'+Trim(Copy(PSegmento1,415,50))+'" '+  //Mae
      ',"'+Trim(Copy(PSegmento1,465,50))+'" '+  //Conjuge
      ',"'+Trim(Copy(PSegmento1,515,100))+'" '+ //Identificação
      ',"'+Trim(Copy(PSegmento1,615,255))+'" '+ //OBS
      ', '+IntToStr(iQuinzenal)+
      ', '+IntToStr(iMensal)+
      ', '+IntToStr(iNota)+
      ', '+IntToStr(iClassificacao)+
      ', '+IntToStr(iTipo)+
      ',"'+sLocalTrabalho+'" '+ //LocalTrabalho
      ',"'+sProfissao+'" '+ //Profissao
      ',"'+sSite+'" '+ //Site
      ',"'+sEMail+'" '+ //EMail
      ',"'+sReferencia1+'" '+ //Referência
      ',"'+sReferencia2+'" '+ //Referência
      ',"'+sReferencia3+'" '+ //Referência
      ', '+IntToStr(iConvenioCNC)+
      ', '+IntToStr(iConvenio)+
      ',0'+ //Crédito
      ',0'+ //SPC
      ',"'+MesDiaHora(vDataImportacao)+'") ');

    if not Informacoes1.Inserir(CdCNC, iCodSACI, CdAVL, 0 (*Atrazo*),
           iLogradouroCob,
           CdFPG,
           0 (*ValorültimaCompra*),
           0 (*ValorInadiplente*),
           vLimitePessoal,
           vRendaMensal,
           0 (*DtÚltimaCompra*),
           '' (*MotivoBloqueio*),
           sEnderecoCob,
           sBairroCob,
           sCidadeCob,
           sUFCob,
           sCEPCob,
           False (*Bloqueio*),
           False (*Boleto*),
           0 (*Credito Ultilizado*),
           vLimiteConvenio) then
    Begin
      sMensagemFalha := sMensagemFalha + 'Falha ao inserir Informações de Crédito!'+#13+#10;
    end;
  end
  else //Alterar Cliente
  Begin
    if iCodSACI = 0 then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT CLI_CODIGO '+
          ' FROM CLIENTE '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND CLI_CGC_CPF="'+sCPFCNPJREFERENCIA+'" ';
        Open;
        iCodSACI := FieldByName('CLI_CODIGO').asInteger;
      end;
    end;

    if Trim(PSegmento1) <> '' then
      sSegmento1 := ',CLI_DATA_NASC="'+MesDia(vDtNascimento)+'" '+
                    ',CLI_PESSOA_FISICA='+IntToStr(iFisicaJuridica)+
                    ',CLI_VENDA_ATACADO='+IntToStr(iAtacado)+
                    ',CLI_DESCONTO='+VirgPonto(vDesconto)+
                    ',CLI_ORGAO='+PSegmento1[32]+
                    ',CLI_RZ_SOCIAL="'+Trim(Copy(PSegmento1,33,60))+'" '+
                    ',CLI_NOME_FAN="'+Trim(Copy(PSegmento1,93,60))+'" '+
                    ',CLI_CGF_RG="'+sRGCGF+'" '+
                    ',CLI_LOGRADOURO='+IntToStr(iLogradouro)+
                    ',CLI_ENDERECO="'+Trim(Copy(PSegmento1,203,40))+'" '+  //Endereço
                    ',CLI_BAIRRO="'+Trim(Copy(PSegmento1,243,20))+'" '+  //Bairro
                    ',CLI_CIDADE="'+Trim(Copy(PSegmento1,263,20))+'" '+  //Cidade
                    ',CLI_UF="'+Trim(Copy(PSegmento1,283,2))+'" '+   //UF
                    ',CLI_CEP="'+Trim(Copy(PSegmento1,285,20))+'" '+  //CEP
                    ',CLI_FONE="'+Trim(Copy(PSegmento1,305,20))+'" '+  //Fone
                    ',CLI_FAX="'+Trim(Copy(PSegmento1,325,20))+'" '+  //Fax
                    ',CLI_CELULAR="'+Trim(Copy(PSegmento1,345,20))+'" '+  //Celular
                    ',CLI_PAI="'+Trim(Copy(PSegmento1,365,50))+'" '+  //Pai
                    ',CLI_MAE="'+Trim(Copy(PSegmento1,415,50))+'" '+  //Mae
                    ',CLI_CONJUGE="'+Trim(Copy(PSegmento1,465,50))+'" '+  //Conjuge
                    ',CLI_IDENTIFICACAO="'+Trim(Copy(PSegmento1,515,100))+'" '+
                    ',CLI_OBS1="'+Trim(Copy(PSegmento1,615,255))+'" '
    else
      sSegmento1 := '';

    if Trim(PSegmento2) <> '' then
      sSegmento2 := ',CLI_QUINZENAL='+IntToStr(iQuinzenal)+
                    ',CLI_MENSAL='+IntToStr(iMensal)+
                    ',CLI_NOTA='+IntToStr(iNota)+
                    ',CLI_CLASSIFICACAO='+IntToStr(iClassificacao)+
                    ',CLI_TIPO='+IntToStr(iTipo)+
                    ',CLI_LOCALTRABALHO="'+sLocalTrabalho+'" '+
                    ',CLI_PROFISSAO="'+sProfissao+'" '+
                    ',CLI_SITE="'+sSite+'" '+
                    ',CLI_EMAIL="'+sEMail+'" '+
                    ',CLI_REFERENCIA1="'+sReferencia1+'" '+
                    ',CLI_REFERENCIA2="'+sReferencia2+'" '+
                    ',CLI_REFERENCIA3="'+sReferencia3+'" '
    else
      sSegmento2 := '';

    if Trim(PSegmento3) <> '' then
    Begin
      sSegmento3 := ',CNC_CONVENIO='+IntToStr(iConvenioCNC)+
                    ',CLI_CONVENIO='+IntToStr(iConvenio);

      sLimiteConvenio := ',ICR_LIM_CRD_CONVENIO='+VirgPonto(vLimiteConvenio);
    end
    else
    Begin
      sSegmento3 := '';
      sLimiteConvenio := '';
    end;

    if Trim(PSegmento4) <> '' then
      sSegmento4 := ',AVL_CODIGO='+IntToStr(CdAVL)+
                    ',FPG_CODIGO='+IntToStr(CdFPG)+
                    ',ICR_RENDA_MENSAL='+VirgPonto(vRendaMensal)+
                    ',ICR_LIM_CRD='+VirgPonto(vLimitePessoal)+
                    ',ICR_LOGRADOURO='+IntToStr(iLogradouroCob)+
                    ',ICR_ENDERECO="'+sEnderecoCob+'" '+
                    ',ICR_BAIRRO="'+sBairroCob+'" '+
                    ',ICR_CIDADE`="'+sCidadeCob+'" '+
                    ',ICR_UF="'+sUFCob+'" '+
                    ',ICR_CEP="'+sCEPCob+'" '
    else
      sSegmento4 := '';

    ExecutaSQL(DM.QR_Comandos, 'UPDATE CLIENTE SET '+
      ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
      ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ',CLI_MAQUINA='+IntToStr(Cliente1.Maquina)+
      ',CLI_CGC_CPF="'+sCPFCNPJREFERENCIA+'" '+
      ',CLI_SITUACAO='+IntToStr(iSituacao)+
      sSegmento1+
      sSegmento2+
      sSegmento3+
      ',0'+ //Crédito
      ',0'+ //SPC
      ',CLI_DT_IMPORTACAO_ALT="'+MesDiaHora(vDataImportacao)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND CLI_CODIGO='+IntToStr(iCodSACI));

    //Apesar de ser alteração pode não existir o registro de Informacoes de Credito
    with DM.QR_Consultas do
    Begin
      CLose;
      SQL.Text := 'SELECT CLI_CODIGO '+
        ' FROM INFORMACOES_DE_CREDITO '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND CLI_CODIGO='+IntToStr(iCodSACI);
      Open;
      if IsEmpty then
        if not Informacoes1.Inserir(CdCNC, iCodSACI, 0, 0, 0, 0,
                 0,0,0,0(*Renda*),0,'','','','','','',False,False,0) then
          sMensagemFalha := sMensagemFalha + 'Falha ao inserir Informações de Crédito!'+#13+#10;
    end;

    ExecutaSQL(DM.QR_Comandos, 'UPDATE INFORMACOES_DE_CREDITO SET '+
      ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
      ',ICR_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      sLimiteConvenio+
      sSegmento4+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND CLI_CODIGO='+IntToStr(iCodSACI));
  end;
end;

procedure TfMxImportarDados.Leiaute1Click(Sender: TObject);
begin
  Application.CreateForm(TfMxMensagem, fMxMensagem);
  with fMxMensagem do
  Begin
    Tag := 1;
    Caption := 'Leiaute de Importação';
    CarregaLayout(Memo1);
    ShowModal;
  end;
end;

end.
