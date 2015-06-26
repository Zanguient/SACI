unit MxControleSerasa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Mask, StdCtrls, Buttons, DB, DBTables, SQuery, Cliente, Gauges,
  DateUtils;

type
  TfMxControleSerasa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Gerar: TSpeedButton;
    Label1: TLabel;
    SB_Fechar: TSpeedButton;
    mskDataInicio: TMaskEdit;
    memDados: TMemo;
    Label2: TLabel;
    edtLocalArquivo: TEdit;
    Label3: TLabel;
    mskDataFIM: TMaskEdit;
    Cliente1: TCliente;
    ckbSomenteFaturado: TCheckBox;
    barProgresso: TGauge;
    SB_MesProximo: TSpeedButton;
    SB_MesAnterior: TSpeedButton;
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_GerarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SB_MesProximoClick(Sender: TObject);
    procedure SB_MesAnteriorClick(Sender: TObject);
  private
    procedure DefinirDatas(pData: TDateTime; Acrescentar: integer=0);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxControleSerasa: TfMxControleSerasa;

implementation

uses UDM, funcoes;

{$R *.DFM}

procedure TfMxControleSerasa.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxControleSerasa.SB_GerarClick(Sender: TObject);
var
  Registro, cFaturado : string;
  TemDados : Boolean;
  iQTDTempoRelacionamento, iQTDPerfilCompras, iQTDPagamentosAVista,
    iQTDPagamentosAPrazo, iQTDVencidosVencer, TotalClientes: integer;
begin
  If MessageDlg('Atenção!!!'+#13+'Esse procedimento irá substituir o arquivo existente!'+#13+
      'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRC_CLI_DTCAD_DTVEN ON TITULO_A_RECEBER (CLI_CODIGO,TRC_DT_CADASTRO,TRC_VENCIMENTO)');
  except
  end;

  iQTDTempoRelacionamento := 0;
  iQTDPerfilCompras       := 0;
  iQTDPagamentosAVista    := 0;
  iQTDPagamentosAPrazo    := 0;
  iQTDVencidosVencer      := 0;

  if ckbSomenteFaturado.Checked then
    cFaturado := ' AND PDV_CODIGO IN (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
      ' WHERE PDV_NOTA_FISCAL>0) '
  else
    cFaturado := '';


  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT COUNT(CLI_CODIGO) AS QUANTIDADE '+
      ' FROM CLIENTE '+
      ' WHERE CLI_PESSOA_FISICA=0 '+
      ' AND CLI_CODIGO IN '+
      ' (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
      ' WHERE ((TRC_DT_CADASTRO>="'+MesDia(mskDataInicio.Text)+'" '+
      ' AND TRC_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'") '+
      ' OR (TRC_PAGAMENTO>="'+MesDia(mskDataInicio.Text)+'" '+
      ' AND TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'") '+
      cFaturado+')) ';
    Open;
    TotalClientes := FieldByName('QUANTIDADE').asInteger;
  end;
  barProgresso.MaxValue := 5 * TotalClientes + 2;
  barProgresso.Progress := 0;

  memDados.Clear;

  with DM.CentroCusto1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
    Open;
    if (Length(RetiraMascara(CGC)) <> 14) then
      Raise exception.Create('CNPJ da Loja inválido!');
  end;

  SB_MesProximo.Enabled := False;
  SB_MesAnterior.Enabled := False;
  edtLocalArquivo.Enabled := False;
  ckbSomenteFaturado.Enabled := False;
  SB_Gerar.Enabled := False;

  try
    //Registro HEADER
    Registro := '';
    //Identificação do Registro HEADER
    Registro := Registro + '00';
    //Constante 'CONV INF COMERCIAL  '
    Registro := Registro + 'CONV INF COMERCIAL  ';
    //CNPJ da Empresa Conveniada 8 primeiros Caracteres
    Registro := Registro + RetiraMascara(DM.CentroCusto1.CGC,8);
    //Dígito Verificador do CNPJ
    Registro := Registro + Copy(RetiraMascara(DM.CentroCusto1.CGC,14),13,2);
    //Data de Início do Período informado AAAAMMDD
    Registro := Registro + Copy(mskDataInicio.Text,7,4) +
                           Copy(mskDataInicio.Text,4,2) +
                           Copy(mskDataInicio.Text,1,2);
    //Data do Fim do Período informado AAAAMMDD
    Registro := Registro + Copy(mskDataFIM.Text,7,4) +
                           Copy(mskDataFIM.Text,4,2) +
                           Copy(mskDataFIM.Text,1,2);
    //Indicativo de Posição do MOVTO (D ou S ou Q ou M) Diário, Semanal,Quinzenal, Mensal
    Registro := Registro + 'M';
    //Espaços em Branco 51
    Registro := Registro + PreencheEspaco(51, ' ');

    memDados.Lines.Add(Registro);
    barProgresso.Progress := barProgresso.Progress + 1;
    /////////////////////////////////////////////////////////////////////////////

    with Cliente1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CLIENTE '+
        ' WHERE CLI_PESSOA_FISICA=0 '+
        ' AND CLI_CODIGO IN '+
        ' (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
        ' WHERE ((TRC_DT_CADASTRO>="'+MesDia(mskDataInicio.Text)+'" '+
        ' AND TRC_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'") '+
        ' OR (TRC_PAGAMENTO>="'+MesDia(mskDataInicio.Text)+'" '+
        ' AND TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'") '+
        cFaturado+')) '+
        ' ORDER BY CLI_RZ_SOCIAL ';
      Open;
      while not EOF do
      Begin
        //Registro DETALHE DE TEMPO DE RELACIONAMENTO
        Registro := '';
        //Identificação do Registro Dados '01'
        Registro := Registro + '01';
        //CNPJ Base da Empresa Cliente 8 primeiros Caracteres
        Registro := Registro + RetiraMascara(Cliente1.CPFCGC,8);
        //Dígito Verificador do CNPJ
        Registro := Registro + Copy(RetiraMascara(Cliente1.CPFCGC,14),13,2);
        //Tipo de Dados - Tempo de Relacionamento '01'
        Registro := Registro + '01';
        //Cliente desde AAAAMMDD
        Registro := Registro + Copy(mskDataInicio.Text,7,4) +
                               Copy(mskDataInicio.Text,4,2) +
                               Copy(mskDataInicio.Text,1,2);
        //Tempo de Relacionamento '01' > um ano, '02' < um ano, '03' inativo
        if Cliente1.DataCadastro < IncMonth(StrToDate(mskDataInicio.Text),-13) then
          Registro := Registro + '01'
        else
          Registro := Registro + '02';
        //Filial da empresa conveniada 4
        Registro := Registro + Copy(RetiraMascara(Cliente1.CPFCGC,14),9,4);
        //Espaços em Branco 73
        Registro := Registro + PreencheEspaco(73, ' ');

        memDados.Lines.Add(Registro);
        inc(iQTDTempoRelacionamento);
        Next;
        barProgresso.Progress := barProgresso.Progress + 1;
      end;
    end;

    /////////////////////////////////////////////////////////////////////////////

    Cliente1.First;
    while not CLiente1.Eof do
    Begin
      TemDados := False;
      //Registro DETALHE DE PERFIL DE COMPRA
      Registro := '';
      //Identificação do Registro Dados '01'
      Registro := Registro + '01';
      //CNPJ Base da Empresa Cliente 8 primeiros Caracteres
      Registro := Registro + RetiraMascara(Cliente1.CPFCGC,8);
      //Dígito Verificador do CNPJ
      Registro := Registro + Copy(RetiraMascara(Cliente1.CPFCGC,14),13,2);
      //Tipo de Dados Perfil de Compras '02'
      Registro := Registro + '02';
      with DM.QR_Consultas do
      Begin
        Close;
        if not ckbSomenteFaturado.Checked then
          SQL.Text := 'SELECT TOP 1 P1.PDV_CODIGO, P1.PDV_DATA_HORA AS DATA,'+
            ' SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND P1.PDV_DATA_HORA>="'+MesDia(IncMonth(StrToDate(mskDataInicio.Text),-13))+'" '+
            ' AND P1.PDV_DATA_HORA<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
            ' GROUP BY P1.PDV_CODIGO, P1.PDV_DATA_HORA '+
            ' ORDER BY PDV_DATA_HORA DESC '
        else
          SQL.Text := 'SELECT TOP 1 P1.PDV_CODIGO,P1.PDV_DT_EMISSAO_VENDA AS DATA,'+
            ' SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_NOTA_FISCAL>0 '+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(IncMonth(StrToDate(mskDataInicio.Text),-13))+'" '+
            ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
            ' GROUP BY P1.PDV_CODIGO, P1.PDV_DT_EMISSAO_VENDA '+
            ' ORDER BY PDV_DT_EMISSAO_VENDA DESC ';
        Open;
        if not IsEmpty then
          TemDados := True;

        //Valor da Última Compra 13 caracteres (duas casas decimais sem ponto ou vírgula)
        Registro := Registro +
          PreencheEspacoEsq(13,RetiraMascara(format('%.2f',[FieldByName('TOTAL').asFloat])),'0');

        //Data da última Compra AAAAMMDD
        if not IsEmpty then
          Registro := Registro + Copy(DateToStr(FieldByName('DATA').AsDateTime),7,4) +
                                 Copy(DateToStr(FieldByName('DATA').AsDateTime),4,2) +
                                 Copy(DateToStr(FieldByName('DATA').AsDateTime),1,2)
        else
          Registro := Registro + '00000000';

        Close;
        if not ckbSomenteFaturado.Checked then
          SQL.Text := 'SELECT TOP 1 P1.PDV_CODIGO,P1.PDV_DATA_HORA AS DATA,'+
            ' SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND P1.PDV_DATA_HORA>="'+MesDia(IncMonth(StrToDate(mskDataInicio.Text),-13))+'" '+
            ' AND P1.PDV_DATA_HORA<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
            ' GROUP BY P1.PDV_CODIGO, P1.PDV_DATA_HORA '+
            ' ORDER BY SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) DESC '
        else
          SQL.Text := 'SELECT TOP 1 P1.PDV_CODIGO,P1.PDV_DT_EMISSAO_VENDA AS DATA,'+
            ' SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_NOTA_FISCAL>0 '+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(IncMonth(StrToDate(mskDataInicio.Text),-13))+'" '+
            ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
            ' GROUP BY P1.PDV_CODIGO, P1.PDV_DT_EMISSAO_VENDA '+
            ' ORDER BY SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*I1.IPV_PRECO_DESC) DESC ';
        Open;
        if not IsEmpty then
          TemDados := True;

        //Valor da Maior Compra 13 caracteres (duas casas decimais sem ponto ou vírgula)
        Registro := Registro +
          PreencheEspacoEsq(13,RetiraMascara(format('%.2f',[FieldByName('TOTAL').asFloat])),'0');

        //Data da Maior Compra AAAAMMDD
        if not IsEmpty then
          Registro := Registro + Copy(DateToStr(FieldByName('DATA').AsDateTime),7,4) +
                                 Copy(DateToStr(FieldByName('DATA').AsDateTime),4,2) +
                                 Copy(DateToStr(FieldByName('DATA').AsDateTime),1,2)
        else
          Registro := Registro + '00000000';


        Close;
        if not ckbSomenteFaturado.Checked then
          SQL.Text := 'SELECT TOP 1 T1.TRC_CODIGO,T1.CLI_CODIGO,T1.TRC_DT_CADASTRO AS DATA, '+
            ' (SELECT SUM(T2.TRC_VALOR) FROM TITULO_A_RECEBER T2 '+
            ' WHERE T2.CLI_CODIGO=T1.CLI_CODIGO '+
            ' AND T2.TRC_DT_CADASTRO<=T1.TRC_DT_CADASTRO '+
            ' AND T2.TRC_VENCIMENTO>=T1.TRC_DT_CADASTRO '+
            ' AND T2.TRC_DT_CADASTRO<>T2.TRC_VENCIMENTO) AS TOTAL '+
            ' FROM TITULO_A_RECEBER T1 '+
            ' WHERE T1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND T1.TRC_DT_CADASTRO>="'+MesDia(IncMonth(StrToDate(mskDataInicio.Text),-13))+'" '+
            ' ORDER BY (SELECT SUM(T3.TRC_VALOR) FROM TITULO_A_RECEBER T3 '+
            ' WHERE T3.CLI_CODIGO=T1.CLI_CODIGO '+
            ' AND T3.TRC_DT_CADASTRO<=T1.TRC_DT_CADASTRO '+
            ' AND T3.TRC_VENCIMENTO>=T1.TRC_DT_CADASTRO '+
            ' AND T3.TRC_DT_CADASTRO<>T3.TRC_VENCIMENTO) DESC '
        else
          SQL.Text := 'SELECT TOP 1 T1.TRC_CODIGO,T1.CLI_CODIGO,T1.TRC_DT_CADASTRO AS DATA, '+
            ' (SELECT SUM(T2.TRC_VALOR) FROM TITULO_A_RECEBER T2 '+
            ' WHERE T2.CLI_CODIGO=T1.CLI_CODIGO '+
            ' AND T2.TRC_DT_CADASTRO<=T1.TRC_DT_CADASTRO '+
            ' AND T2.TRC_VENCIMENTO>=T1.TRC_DT_CADASTRO '+
            ' AND T2.TRC_DT_CADASTRO<>T2.TRC_VENCIMENTO '+
            ' AND T1.PDV_CODIGO IN '+
            ' (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA WHERE PDV_NOTA_FISCAL>0)) AS TOTAL '+
            ' FROM TITULO_A_RECEBER T1 '+
            ' WHERE T1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND T1.TRC_DT_CADASTRO>="'+MesDia(IncMonth(StrToDate(mskDataInicio.Text),-13))+'" '+
            ' AND T1.PDV_CODIGO IN '+
            ' (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA WHERE PDV_NOTA_FISCAL>0) '+
            ' ORDER BY (SELECT SUM(T3.TRC_VALOR) FROM TITULO_A_RECEBER T3 '+
            ' WHERE T3.CLI_CODIGO=T1.CLI_CODIGO '+
            ' AND T3.TRC_DT_CADASTRO<=T1.TRC_DT_CADASTRO '+
            ' AND T3.TRC_VENCIMENTO>=T1.TRC_DT_CADASTRO '+
            ' AND T3.TRC_DT_CADASTRO<>T3.TRC_VENCIMENTO '+
            ' AND T1.PDV_CODIGO IN '+
            ' (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA WHERE PDV_NOTA_FISCAL>0)) DESC ';
        Open;

        //Maior Acúmulo (maior risco assumido pela empresa com o Cliente) nos últimos 13 meses
        Registro := Registro +
          PreencheEspacoEsq(13,RetiraMascara(format('%.2f',[FieldByName('TOTAL').asFloat])),'0');

        //Data do Maior Acúmulo AAAAMMDD
        if not IsEmpty then
          Registro := Registro + Copy(DateToStr(FieldByName('DATA').AsDateTime),7,4) +
                                 Copy(DateToStr(FieldByName('DATA').AsDateTime),4,2) +
                                 Copy(DateToStr(FieldByName('DATA').AsDateTime),1,2)
        else
          Registro := Registro + '00000000';
      end;

      //Filial da empresa conveniada 4
      Registro := Registro + Copy(RetiraMascara(Cliente1.CPFCGC,14),9,4);
      //Espaços em Branco 19
      Registro := Registro + PreencheEspaco(19, ' ');

      if TemDados then
      Begin
        memDados.Lines.Add(Registro);
        inc(iQTDPerfilCompras);
      end;
      Cliente1.Next;
      barProgresso.Progress := barProgresso.Progress + 1;
    end;

    /////////////////////////////////////////////////////////////////////////////

    Cliente1.First;
    while not CLiente1.Eof do
    Begin
      TemDados := False;
      //Registro DETALHE DE PAGAMENTO A VISTA
      Registro := '';
      //Identificação do Registro Dados '01'
      Registro := Registro + '01';
      //CNPJ Base da Empresa Cliente 8 primeiros Caracteres
      Registro := Registro + RetiraMascara(Cliente1.CPFCGC,8);
      //Dígito Verificador do CNPJ
      Registro := Registro + Copy(RetiraMascara(Cliente1.CPFCGC,14),13,2);
      //Tipo de Dados Perfil de Compras '03'
      Registro := Registro + '03';
      //Espaços em Branco 04
      Registro := Registro + PreencheEspaco(4, ' ');
      //Ano e Mês dos Pagamentos AAAAMM
      Registro := Registro + Copy(mskDataInicio.Text,7,4) +
                             Copy(mskDataInicio.Text,4,2);
      with DM.QR_Consultas do
      Begin
        Close;
        if not ckbSomenteFaturado.Checked then
          SQL.Text := 'SELECT COUNT(DISTINCT TRC_CODIGO) AS QUANTIDADE '+
            ' FROM PEDIDO_DE_VENDA P1, TITULO_A_RECEBER T1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND P1.PDV_DATA_HORA>="'+MesDia(mskDataInicio.Text)+'" '+
            ' AND P1.PDV_DATA_HORA<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND P1.FPG_CODIGO=1 '+ //À Vista
            ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND P1.CNC_CODIGO=T1.CNC_CODIGO '
        else
          SQL.Text := 'SELECT COUNT(DISTINCT TRC_CODIGO) AS QUANTIDADE '+
            ' FROM PEDIDO_DE_VENDA P1, TITULO_A_RECEBER T1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_NOTA_FISCAL>0 '+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(mskDataInicio.Text)+'" '+
            ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND P1.FPG_CODIGO=1 '+ //À Vista
            ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND P1.CNC_CODIGO=T1.CNC_CODIGO ';
        Open;
        if FieldByName('QUANTIDADE').asInteger > 0 then
          TemDados := True;
        //Quantidade de Pagamentos À Vista do Mês
        Registro := Registro +
          PreencheZero(13,FieldByName('QUANTIDADE').asInteger);
        Close;
        if not ckbSomenteFaturado.Checked then
          SQL.Text := 'SELECT SUM(T1.TRC_VALOR_PAGO) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, TITULO_A_RECEBER T1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND P1.PDV_DATA_HORA>="'+MesDia(mskDataInicio.Text)+'" '+
            ' AND P1.PDV_DATA_HORA<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND P1.FPG_CODIGO=1 '+ //À Vista
            ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND P1.CNC_CODIGO=T1.CNC_CODIGO '
        else
          SQL.Text := 'SELECT SUM(T1.TRC_VALOR_PAGO) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, TITULO_A_RECEBER T1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_NOTA_FISCAL>0 '+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(mskDataInicio.Text)+'" '+
            ' AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND P1.FPG_CODIGO=1 '+ //À Vista
            ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND P1.CNC_CODIGO=T1.CNC_CODIGO ';
        Open;
        if FieldByName('TOTAL').asFloat > 0 then
          TemDados := True;
        //Valor do Total de Pag. À Vista 13 caracteres (duas casas decimais sem ponto ou vírgula)
        Registro := Registro +
          PreencheEspacoEsq(13,RetiraMascara(format('%.2f',[FieldByName('TOTAL').asFloat])),'0');
      end;
      //Filial da empresa conveniada 4
      Registro := Registro + Copy(RetiraMascara(Cliente1.CPFCGC,14),9,4);

      //Espaços em Branco 54
      Registro := Registro + PreencheEspaco(54, ' ');

      if TemDados then
      Begin
        memDados.Lines.Add(Registro);
        inc(iQTDPagamentosAVista);
      end;
      Cliente1.Next;
      barProgresso.Progress := barProgresso.Progress + 1;
    end;

    /////////////////////////////////////////////////////////////////////////////

    Cliente1.First;
    while not CLiente1.Eof do
    Begin
      TemDados := False;
      with DM.QR_Consultas do
      Begin
        Close;
        if not ckbSomenteFaturado.Checked then
          SQL.Text := 'SELECT T1.TRC_CODIGO,T1.TRC_VENCIMENTO,T1.TRC_PAGAMENTO,'+
            ' T1.TRC_VALOR '+
            ' FROM PEDIDO_DE_VENDA P1, TITULO_A_RECEBER T1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND T1.TRC_PAGAMENTO>="'+MesDia(mskDataInicio.Text)+'" '+
            ' AND T1.TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND P1.FPG_CODIGO<>1 '+ //<> À Vista
            ' AND T1.TRC_SITUACAO=1 '+
            ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND P1.CNC_CODIGO=T1.CNC_CODIGO '
        else
          SQL.Text := 'SELECT T1.TRC_CODIGO,T1.TRC_VENCIMENTO,T1.TRC_PAGAMENTO,'+
            ' T1.TRC_VALOR '+
            ' FROM PEDIDO_DE_VENDA P1, TITULO_A_RECEBER T1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_NOTA_FISCAL>0 '+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND T1.TRC_PAGAMENTO>="'+MesDia(mskDataInicio.Text)+'" '+
            ' AND T1.TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND P1.FPG_CODIGO<>1 '+ //<> À Vista
            ' AND T1.TRC_SITUACAO=1 '+
            ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND P1.CNC_CODIGO=T1.CNC_CODIGO ';
        Open;
        if not IsEmpty then
          TemDados := True;
        while not EOF do
        Begin
          TemDados := False;
          //Registro DETALHE DE PAGAMENTO A PRAZO
          Registro := '';
          //Identificação do Registro Dados '01'
          Registro := Registro + '01';
          //CNPJ Base da Empresa Cliente 8 primeiros Caracteres
          Registro := Registro + RetiraMascara(Cliente1.CPFCGC,8);
          //Dígito Verificador do CNPJ
          Registro := Registro + Copy(RetiraMascara(Cliente1.CPFCGC,14),13,2);
          //Tipo de Dados Perfil de Compras '04'
          Registro := Registro + '04';
          //Espaços em Branco 04
          Registro := Registro + PreencheEspaco(4, ' ');
          //Número da Duplicata (Opcional)
          Registro := Registro +
            PreencheZero(10,FieldByName('TRC_CODIGO').asInteger);
          //Data de Vencimento AAAAMMDD
          Registro := Registro + Copy(DateToStr(FieldByName('TRC_VENCIMENTO').AsDateTime),7,4) +
                                 Copy(DateToStr(FieldByName('TRC_VENCIMENTO').AsDateTime),4,2) +
                                 Copy(DateToStr(FieldByName('TRC_VENCIMENTO').AsDateTime),1,2);
          //Data do Pagamento AAAAMMDD
          Registro := Registro + Copy(DateToStr(FieldByName('TRC_PAGAMENTO').AsDateTime),7,4) +
                                 Copy(DateToStr(FieldByName('TRC_PAGAMENTO').AsDateTime),4,2) +
                                 Copy(DateToStr(FieldByName('TRC_PAGAMENTO').AsDateTime),1,2);
          //Valor da Dulicata 13 caracteres (duas casas decimais sem ponto ou vírgula)
          Registro := Registro +
            PreencheEspacoEsq(13,RetiraMascara(format('%.2f',[FieldByName('TRC_VALOR').asFloat])),'0');
        end;
        //Filial da empresa conveniada 4
        Registro := Registro + Copy(RetiraMascara(Cliente1.CPFCGC,14),9,4);

        //Espaços em Branco 39
        Registro := Registro + PreencheEspaco(39, ' ');

        if TemDados then
        Begin
          memDados.Lines.Add(Registro);
          inc(iQTDPagamentosAPrazo);
        end;
        Next;
      end;
      Cliente1.Next;
      barProgresso.Progress := barProgresso.Progress + 1;
    end;

    /////////////////////////////////////////////////////////////////////////////

    Cliente1.First;
    while not CLiente1.Eof do
    Begin
      TemDados := False;
      //Registro DETALHE DE COMPROMISSOS VENCIDOS E A VENCER
      Registro := '';
      //Identificação do Registro Dados '01'
      Registro := Registro + '01';
      //CNPJ Base da Empresa Cliente 8 primeiros Caracteres
      Registro := Registro + RetiraMascara(Cliente1.CPFCGC,8);
      //Dígito Verificador do CNPJ
      Registro := Registro + Copy(RetiraMascara(Cliente1.CPFCGC,14),13,2);
      //Tipo de Dados Perfil de Compras '07'
      Registro := Registro + '07';
      //Ano e Mês dos Compromissos AAAAMM
      Registro := Registro + Copy(mskDataInicio.Text,7,4) +
                             Copy(mskDataInicio.Text,4,2);
      with DM.QR_Consultas do
      Begin
        Close;
        if not ckbSomenteFaturado.Checked then
          SQL.Text := 'SELECT SUM(T1.TRC_VALOR) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, TITULO_A_RECEBER T1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND T1.TRC_VENCIMENTO>="'+MesDia(mskDataInicio.Text)+'" '+
            ' AND T1.TRC_VENCIMENTO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND T1.TRC_SITUACAO=0 '+
            ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND P1.CNC_CODIGO=T1.CNC_CODIGO '
        else
          SQL.Text := 'SELECT SUM(T1.TRC_VALOR) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, TITULO_A_RECEBER T1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_NOTA_FISCAL>0 '+
            ' AND T1.TRC_VENCIMENTO>="'+MesDia(mskDataInicio.Text)+'" '+
            ' AND T1.TRC_VENCIMENTO<"'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND T1.TRC_SITUACAO=0 '+
            ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND P1.CNC_CODIGO=T1.CNC_CODIGO ';
        Open;
        if not IsEmpty then
          TemDados := True;

        //Valor Compromissos Vencidos 13 caracteres (duas casas decimais sem ponto ou vírgula)
        Registro := Registro +
          PreencheEspacoEsq(13,RetiraMascara(format('%.2f',[FieldByName('TOTAL').asFloat])),'0');

        Close;
        if not ckbSomenteFaturado.Checked then
          SQL.Text := 'SELECT SUM(T1.TRC_VALOR) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, TITULO_A_RECEBER T1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND T1.TRC_VENCIMENTO>="'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND T1.TRC_DT_CADASTRO>="'+MesDia(mskDataInicio.Text)+'" '+
            ' AND T1.TRC_DT_CADASTRO<"'+MesDia(mskDataFim.Text)+'" '+
            ' AND T1.TRC_SITUACAO=0 '+
            ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND P1.CNC_CODIGO=T1.CNC_CODIGO '
        else
          SQL.Text := 'SELECT SUM(T1.TRC_VALOR) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, TITULO_A_RECEBER T1 '+
            ' WHERE P1.CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
            ' AND P1.PDV_NOTA_FISCAL>0 '+
            ' AND T1.TRC_VENCIMENTO>="'+MesDia(StrToDate(mskDataFim.Text)+1)+'" '+
            ' AND T1.TRC_DT_CADASTRO>="'+MesDia(mskDataInicio.Text)+'" '+
            ' AND T1.TRC_DT_CADASTRO<"'+MesDia(mskDataFim.Text)+'" '+
            ' AND T1.TRC_SITUACAO=0 '+
            ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND P1.CNC_CODIGO=T1.CNC_CODIGO ';
        Open;
        if not IsEmpty then
          TemDados := True;
        //Valor Compromissos a Vencer 13 caracteres (duas casas decimais sem ponto ou vírgula)
        Registro := Registro +
          PreencheEspacoEsq(13,RetiraMascara(format('%.2f',[FieldByName('TOTAL').asFloat])),'0');
      end;
      //Filial da empresa conveniada 4
      Registro := Registro + Copy(RetiraMascara(Cliente1.CPFCGC,14),9,4);

      //Espaços em Branco 50
      Registro := Registro + PreencheEspaco(50, ' ');

      if TemDados then
      Begin
        memDados.Lines.Add(Registro);
        inc(iQTDVencidosVencer);
      end;
      Cliente1.Next;
      barProgresso.Progress := barProgresso.Progress + 1;
    end;

    /////////////////////////////////////////////////////////////////////////////

    //Registro TRAILLER
    Registro := '';
    //Identificação do Registro TRAILLER '99'
    Registro := Registro + '99';
    //Quantidade de TEMPO DE RELACIONAMENTO
    Registro := Registro + PreencheZero(11,iQTDTempoRelacionamento);
    //Quantidade de PERFIL DE COMPRAS
    Registro := Registro + PreencheZero(11,iQTDPerfilCompras);
    //Quantidade de PAGAMENTOS À VISTA
    Registro := Registro + PreencheZero(11,iQTDPagamentosAVista);
    //Quantidade de PAGAMENTOS À PRAZO
    Registro := Registro + PreencheZero(11,iQTDPagamentosAPrazo);
    //Quantidade de VENCIDOS E A VENCER
    Registro := Registro + PreencheZero(11,iQTDVencidosVencer);
    //Espaços em Branco 43
    Registro := Registro + PreencheEspaco(43, ' ');

    memDados.Lines.Add(Registro);
    barProgresso.Progress := barProgresso.Progress + 1;

    //Salvar Arquivo Principal
    try
      memDados.Lines.SaveToFile(edtLocalArquivo.Text);
    except
      ShowMessage('Falha ao Salvar o Arquivo!');
    end;

    //Salvar Backup
    try
      memDados.Lines.SaveToFile(DM.Configuracao1.PastaSistema+'\'+
        Copy(mskDataInicio.Text,7,4)+Copy(mskDataInicio.Text,4,2)+'_SERASA.TXT');
    except
      ShowMessage('Falha ao Salvar o Arquivo de Backup!');
    end;
    
    ShowMessage('Arquivo gerado com Sucesso!');
  except
    ShowMessage('Falha ao gerar os Dados para o SERASA!');
  end;
  SB_MesProximo.Enabled := True;
  SB_MesAnterior.Enabled := True;
  edtLocalArquivo.Enabled := True;
  ckbSomenteFaturado.Enabled := True;
  SB_Gerar.Enabled := True;
end;

procedure TfMxControleSerasa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxControleSerasa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxControleSerasa.FormShow(Sender: TObject);
Begin
  DM.Usuario1.AlteraCorComponentes(self);
  ckbSomenteFaturado.Checked := True;
  DefinirDatas(DM.Configuracao1.Data);
  //Definir Local do Arquivo
  edtLocalArquivo.Text := 'C:\SERASA.TXT';
end;

procedure TfMxControleSerasa.DefinirDatas(pData:TDateTime; Acrescentar:integer=0);
var
  PrimeiroDia, UltimoDia: TDateTime;
begin
  if (Trunc(pData) >= IncMonth(DM.Configuracao1.Data,-1)) and (Acrescentar > 0) then
    Raise exception.Create('Data superior a permitida para gerar o Arquivo!');
  PrimeiroDia := IncMonth(pData,Acrescentar-1);
  //Definir 1o dia do Mês
  mskDataInicio.Text := '01/'+formatDateTime('MM',PrimeiroDia)+'/'+
                        formatDateTime('YYYY',PrimeiroDia);

  //Definir Último dia do Mês
  UltimoDia := StrToDate('01/'+formatDateTime('MM',IncMonth(pData,Acrescentar))+'/'+
               formatDateTime('YYYY',IncMonth(pData,Acrescentar)));
  UltimoDia := UltimoDia - 1;
  mskDataFim.Text := DateToStr(UltimoDia);
end;
procedure TfMxControleSerasa.SB_MesProximoClick(Sender: TObject);
begin
  DefinirDatas(StrToDate(mskDataFim.Text),2);
end;

procedure TfMxControleSerasa.SB_MesAnteriorClick(Sender: TObject);
begin
  DefinirDatas(StrToDate(mskDataFim.Text));
end;

end.
