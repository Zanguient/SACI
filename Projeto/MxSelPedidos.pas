unit MxSelPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, Funcionario, Db, DBTables,
  SQuery, CentroCusto, Variants, Cliente, Parametro, DateUtils;

type
  TfMxSelPedidos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Panel3: TPanel;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    CheckBox10: TCheckBox;
    ckbCodigoCNC: TCheckBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dblCodigoFUN: TDBLookupComboBox;
    ckbCodigoFUN: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox6: TCheckBox;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Funcionario1: TFuncionario;
    DSFuncionario1: TDataSource;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    CheckBox7: TCheckBox;
    Etiquetas1: TCliente;
    CheckBox8: TCheckBox;
    Parametro1: TParametro;
    GroupBox1: TGroupBox;
    ckbSomenteAdiplente: TCheckBox;
    rdbSemParcelas: TRadioButton;
    rdbComParcelas: TRadioButton;
    GroupBox2: TGroupBox;
    rdbPedidoInteiro: TRadioButton;
    rdbQualquerParcela: TRadioButton;
    ckbSomenteInadiplente: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox13: TCheckBox;
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoFUNClick(Sender: TObject);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox3Click(Sender: TObject);
    procedure ckbSomenteAdiplenteClick(Sender: TObject);
    procedure ckbSomenteInadiplenteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelPedidos: TfMxSelPedidos;

implementation

uses UDM, Funcoes, CdCliente, UVendasVendedor, MxSPediProd,
  MxGraficoVendasVendedor, MxSPediProdMotCal, MxGraficoFaturamentoVendas,
  MxGraficoMediaAnual, MxGraficoMetaPorVendedor;

{$R *.DFM}

procedure TfMxSelPedidos.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Enabled:=False;
  end;
end;

procedure TfMxSelPedidos.ckbCodigoFUNClick(Sender: TObject);
begin
  if ckbCodigoFUN.Checked then
  Begin
    Funcionario1.Close;
    Funcionario1.SQL.Text := 'SELECT FUN_CODIGO,FUN_NOME,CNC_CODIGO,FUN_APELIDO '+
      ' FROM FUNCIONARIO '+
      ' WHERE FUN_APARECE_VENDAS=1 '+
      ' AND FUN_SITUACAO <> 1 ';
    if ckbCodigoCNC.Checked then
      Funcionario1.SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+
                           '  OR  FUN_TODOS_CENTROS=1) ');
    Funcionario1.SQL.Add(' ORDER BY FUN_APELIDO ASC ');
    Funcionario1.Open;
    dblCodigoFUN.Color:=clWindow;
    dblCodigoFUN.Enabled:=True;
    dblCodigoFUN.KeyValue:=Funcionario1.CodigoFUN;
    dblCodigoFUN.SetFocus;
  end
  else
  Begin
    Funcionario1.Close;
    dblCodigoFUN.Color:=AlteraCorComponentes;
    dblCodigoFUN.KeyValue:=-1;
    dblCodigoFUN.Enabled:=False;
  end;
end;

procedure TfMxSelPedidos.ckbCodigoPDVClick(Sender: TObject);
begin
  if ckbCodigoPDV.Checked then
  Begin
    edtCodigoPDV.Color:=clWindow;
    edtCodigoPDV.Enabled:=True;
    edtCodigoPDV.SetFocus;
  end
  else
  Begin
    edtCodigoPDV.Color:=AlteraCorComponentes;
    edtCodigoPDV.Clear;
    edtCodigoPDV.Enabled:=False;
  end;
end;

procedure TfMxSelPedidos.ckbCodigoCLIClick(Sender: TObject);
begin
  if ckbCodigoCLI.Checked then
  Begin
    edtCodigoCLI.Color:=clWindow;
    edtCodigoCLI.Enabled:=True;
    edtCodigoCLI.SetFocus;
  end
  else
  Begin
    edtCodigoCLI.Color:=AlteraCorComponentes;
    edtCodigoCLI.Clear;
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure TfMxSelPedidos.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelPedidos.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if tag = 0 then
  Begin
    CheckBox8.Enabled := True;
    ckbSomenteAdiplente.Checked := True;
  end
  else if (tag = 1) or (tag = 2) or (tag = 3) or (tag = 4) then
  Begin
    CheckBox3.Enabled := False;
    CheckBox6.Enabled := False;
    CheckBox7.Enabled := False;
    CheckBox10.Enabled := False;
    ckbSomenteAdiplente.Enabled := False;
    ckbSomenteInadiplente.Enabled := False;
    if self.tag = 4 then //Meta por Vendedor
      ckbCodigoCNC.Enabled := False;
  end;
  ckbCodigoCNC.Checked := True;
  mskDataINI.SetFocus;
end;

procedure TfMxSelPedidos.BitBtn1Click(Sender: TObject);
var
  mensagem,EnderecoCompleto,CNC,PRD,CLI,FUN,PDV,Ultimo,DataINI,DataFIM,Devedor: String;
  QtdEtiquetas, iQtdFUN: Integer;
  NewDatIni, NewDatFim, CarMes, Med, IT1, NF1: String;
  Dif, i, iDiasUteis, iDiasUteisTotal: Integer;
  FATUR, FATURNF, FATPARC, DEVOLNF, DEVOLSN, DEVOLTROCA, vMeta, vMetaDiaria1,
    vMetaDiaria2, vMetaQuinzena1, vMetaQuinzena2: Double;
  vDtAux, DtINI, DtFIM: TDateTime;
begin
  Dif:=0;
  CNC:='';
  PRD:='';
  CLI:='';
  FUN:='';
  PDV:='';
  Ultimo:='';
  Devedor:='';

  mensagem:='';
  QtdEtiquetas := 0;
  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if not VerificaDataBranco(mskDataINI.Text)then
    mskDataINI.Text:='01/01/1900';
  if not VerificaDataBranco(mskDataFIM.Text)then
    mskDataFIM.Text:= FormatDateTime('dd/mm/yyyy',DM.Configuracao1.Data);

  if not VerificaDataBranco(mskDataINI.Text)then
    DataINI := ''
  else
    DataINI := ' AND (T2.PDV_DT_ENTREGA>="'+MesDia(mskDataINI.Text)+'") ';

  if not VerificaDataBranco(mskDataFIM.Text)then
    DataFIM := ''
  else
    DataFIM := ' AND (T2.PDV_DT_ENTREGA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';

  if mensagem<>'' then
    raise exception.Create(mensagem);

  DtINI := 0;
  DtFIM := 0;

  if tag = 4 then //Meta por Vendedor
  Begin
    if not VerificaDataBranco(mskDataINI.Text) then
      Raise exception.Create('Data inicial obrigatória');

    if not VerificaDataBranco(mskDataFIM.Text) then
      Raise exception.Create('Data final obrigatória');

    if (Copy(mskDataINI.Text, 1, 2) <> '01') and
       (Copy(mskDataINI.Text, 1, 2) <> '16') then
      Raise exception.Create('Dia da data inicial precisa ser 01 ou 16');

    if StrToDate(mskDataFIM.Text) < StrToDate(mskDataINI.Text) then
      raise exception.Create('Data final menor que a data inicial!');

    if MonthOf(StrToDate(mskDataINI.Text)) <> MonthOf(StrToDate(mskDataFIM.Text)) then
      Raise exception.Create('Datas de meses diferentes!');

    DtINI := StrToDate(mskDataINI.Text);
    DtFIM := StrToDate(mskDataFIM.Text);    
  end;

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Código do Cliente inválido!');
    end
    else
      CLI:=' AND (T2.CLI_CODIGO='+edtCodigoCLI.Text+') ';

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Begin
      edtCodigoPRD.SetFocus;
      raise Exception.Create('Código do produto inválido!');
    end
    else
      PRD:=' AND (T1.PRD_CODIGO='+edtCodigoPRD.Text+') ';

  if ckbCodigoFUN.Checked then
    if dblCodigoFUN.Text = '' then
    Begin
      dblCodigoFUN.SetFocus;
      raise Exception.Create('Vendedor(a) inválido(a)!');
    end
    else
    begin
      IT1 := ' AND (I1.FUN_CODIGO='+IntToStr(dblCodigoFUN.KeyValue)+') ';
      NF1 := ' AND (N1.FUN_CODIGO='+IntToStr(dblCodigoFUN.KeyValue)+') ';
      FUN := ' AND (T1.FUN_CODIGO='+IntToStr(dblCodigoFUN.KeyValue)+') ';
    end;

  if ckbCodigoPDV.Checked then
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Begin
      edtCodigoPDV.SetFocus;
      raise Exception.Create('Código do pedido inválido!');
    end
    else
      PDV:=' AND (T1.PDV_CODIGO='+edtCodigoPDV.Text+') ';

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
    Begin
      dblCodigoCNC.SetFocus;
      raise Exception.Create('Centro de Custo inválido!');
    end
    else
      CNC:=' AND (T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';

  if CheckBox3.Checked then
     Ultimo:=' AND T2.PDV_CODIGO = (SELECT MAX(T4.PDV_CODIGO) FROM PEDIDO_DE_VENDA T4 '+
      ' WHERE T4.CNC_CODIGO=T2.CNC_CODIGO AND T4.CLI_CODIGO=T2.CLI_CODIGO AND '+
      ' T4.PDV_SITUACAO=4) ';

  if ckbSomenteAdiplente.Checked then
  Begin
    if rdbSemParcelas.Checked then //Sem nenhuma parcela em aberto
      Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
          ' WHERE (TRC_SITUACAO IN (0,8)) AND T2.CNC_CLIENTE=CNC_CODIGO) '
    else //Adiplente
      if CheckBox27.Checked then
        Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
            ' WHERE (TRC_SITUACAO IN (0,8)) AND T2.CNC_CLIENTE=CNC_CODIGO '+
            ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") '
      else
        Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
            ' WHERE (TRC_SITUACAO IN (0,8)) AND T2.CNC_CLIENTE=CNC_CODIGO '+
            ' AND (TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'" OR '+
            ' TRC_DTORIGINAL<"'+MesDia(DM.Configuracao1.Data)+'")) ';
  end
  else if ckbSomenteInadiplente.Checked then
  Begin
    if rdbQualquerParcela.Checked then // Inadiplente qualquer título
      if CheckBox13.Checked then
        Devedor:=' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
            ' WHERE (TRC_SITUACAO IN (0,8)) AND T2.CNC_CLIENTE=CNC_CODIGO '+
            ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") '
      else
        Devedor:=' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
            ' WHERE (TRC_SITUACAO IN (0,8)) AND T2.CNC_CLIENTE=CNC_CODIGO '+
            ' AND (TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'" OR '+
            ' TRC_DTORIGINAL<"'+MesDia(DM.Configuracao1.Data)+'")) '
    else  //Inadiplente Pedido Inteiro
      if CheckBox13.Checked then
        Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER T4 '+
            ' WHERE T4.TRC_SITUACAO IN (1,2) AND T4.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'"'+
            ' AND T4.PDV_CODIGO=T2.PDV_CODIGO AND T4.CNC_CODIGO=T2.CNC_CLIENTE) '+
            ' AND T2.CLI_CODIGO IN (SELECT T5.CLI_CODIGO FROM TITULO_A_RECEBER T5 '+
            ' WHERE T5.TRC_SITUACAO IN (0,8) '+
            ' AND T5.PDV_CODIGO=T2.PDV_CODIGO AND T5.CNC_CODIGO=T2.CNC_CLIENTE) '
      else
        Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER T4 '+
            ' WHERE T4.TRC_SITUACAO IN (1,2) AND (T4.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'" OR '+
            ' T4.TRC_DTORIGINAL<"'+MesDia(DM.Configuracao1.Data)+'") '+
            ' AND T4.PDV_CODIGO=T2.PDV_CODIGO AND T4.CNC_CODIGO=T2.CNC_CLIENTE) '+
            ' AND T2.CLI_CODIGO IN (SELECT T5.CLI_CODIGO FROM TITULO_A_RECEBER T5 '+
            ' WHERE T5.TRC_SITUACAO IN (0,8) '+
            ' AND T5.PDV_CODIGO=T2.PDV_CODIGO AND T5.CNC_CODIGO=T2.CNC_CLIENTE) ';
  end;


  Dt_ini := mskDataINI.Text;
  Dt_fim := mskDataFIM.Text;
  if tag = 0 then //Histórico de Vendas por Vendedor
  Begin
    if not CheckBox8.Checked then
    Begin
      Application.CreateForm(Trpt_VendasVendedor, rpt_VendasVendedor);
      with rpt_VendasVendedor do
      Begin
        tag := 0;
        if not CheckBox6.Checked then
        Begin
          if CheckBox10.Checked then
            if CheckBox7.Checked then
              ZRBand5.Height := 0
            else
              ZRBand5.Height := 2
          else
          Begin
            ZRBand5.Height := 4;
            ZRLabel8.top := 3;
          end;
        end;
        if ckbCodigoPRD.Checked then
        Begin
          SZRLabel13.Caption:=edtCodigoPRD.Text;
          SZRLabel54.Enabled:=True;
          SZRLabel55.Enabled:=True;
        end
        else
        Begin
          SZRLabel12.Enabled:=False;
          SZRLabel54.Enabled:=False;
          SZRLabel55.Enabled:=False;
        end;

        if CheckBox10.Checked then
        Begin
          SZRGroup1.Expression := 'CNC_CODIGO+FUN_CODIGO ';
          SZRLabel4.Enabled  := False; //Label do PDV
          SZRDBText3.Left    := 0;     //PDV
          SZRLabel8.Enabled  := False; //Label da Data
          SZRLabel11.Left    := 8;     //Data
          SZRLabel11.Width   := 10;    //Data
          SZRLabel164.Left   := 19;    //Valor
          SZRLabel164.Enabled:= True;
          SZRLabel56.Enabled := True;  //Vendedor
          SZRLabel56.Left    := 29;    //Vendedor
          SZRLabel57.Enabled := True;  //Forma de Pagamento
          SZRLabel57.Left    := 33;    //Forma de Pagamento
          SZRLabel10.Top     := 0;     //Cliente
          SZRLabel10.Left    := 36;    //Cliente
          SZRLabel10.Width   := 40;    //Cliente
          SZRLabel61.Enabled := False; //Label Nota
          SZRLabel89.Left    := 77;    //TipoNota
          SZRLabel62.Left    := 79;    //Nota
          SZRLabel37.Top     := 0;     //Telefone
          SZRLabel37.Left    := 88;    //Telefone
          SZRLabel27.Top     := 0;     //Contato
          SZRLabel27.Left    := 104;   //Contato
          SZRLabel27.Width   := 15;    //Contato
          if DM.Configuracao1.Empresa <> empLBM then
          Begin
            SZRLabel27.Enabled   := False;    //Contato
            SZRLabel160.Enabled  := False;    //Contato
          end;
          ZRGroup1.Height    :=1;
        end
        else
        Begin
          SZRLabel168.Enabled := True;
          if ckbCodigoPDV.Checked then
          Begin
            ZRBand1.Height := 3;
            ZRLabel5.Top   := 2;
            ZRLabel21.Enabled := False;
            ZRLabel25.Enabled := False;
            ZRLabel4.Caption := 'Total:';
          end
          else
          Begin
            ZRBand1.Height := 4;
            ZRLabel5.Top   := 3;
          end;
          ZRGroup1.Height:= 11;
        end;
        if CheckBox7.Checked then  //Esconder itens
        Begin
          zrb_detalhe.Height := 0;
          if not CheckBox10.Checked then
            ZRGroup1.Height    := 9; //Esconde Cabeçalho de Produto
        end;
        Item_Pedido_Venda1.Close;
        Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
          ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2, Cliente T20 '+
          ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) AND '+
          ' (T20.CNC_CODIGO=*T2.CNC_CLIENTE) AND (T20.CLI_CODIGO=*T2.CLI_CODIGO) AND '+
          ' (T1.PDV_CODIGO = T2.PDV_CODIGO) AND (T2.PDV_SITUACAO=4) '+
          DataINI+DataFIM+CNC+CLI+PRD+FUN+PDV+Ultimo+Devedor+
          ' ORDER BY T1.CNC_CODIGO,T1.FUN_CODIGO,T20.CLI_RZ_SOCIAL,T1.PDV_CODIGO ASC ';
        Item_Pedido_Venda1.Open;
        if Item_Pedido_Venda1.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        SZRLabel5.Caption := mskDataINI.Text;
        SZRLabel7.Caption := mskDataFIM.Text;
        report.preview;
        rpt_VendasVendedor.Close;
      end;
    end
    else
    Begin
      with Etiquetas1 do
      Begin
        Close;
        SQL.Text:='SELECT DISTINCT T0.* '+
          ' FROM Cliente T0, Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
          ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND (T2.CLI_CODIGO<>0) AND '+
          ' (T1.PDV_CODIGO = T2.PDV_CODIGO) AND (T2.PDV_SITUACAO=4) AND '+
          ' (T0.CNC_CODIGO=T2.CNC_CLIENTE) AND (T0.CLI_CODIGO=T2.CLI_CODIGO) '+
          DataINI+DataFIM+CNC+CLI+PRD+FUN+PDV+Ultimo+Devedor+
          ' ORDER BY T0.CLI_RZ_SOCIAL ASC';
        Open;
        try
          LimpaEtiquetas;
          while not Etiquetas1.EOF do
          begin
            QtdEtiquetas:=QtdEtiquetas+1;
            Parametro1.Close;
            Parametro1.ParamByName('PAR_CODIGO').asInteger:=Logradouro;
            Parametro1.Open;
            if not Parametro1.IsEmpty then
              EnderecoCompleto:=Parametro1.Descricao+' '+Endereco
            else
              EnderecoCompleto:=Endereco;
            AdicionarEtiqueta(CodigoCLI,Convenio,RazaoSocial,NomeFantasia,Fone,Fax,Celular,EMail,EnderecoCompleto,Bairro,Cidade,Uf,CEP,CGFRG,CPFCGC,OBS);
            Next;
          end;
          FechaEtiquetas;
        except
          ShowMessage('Falha ao gerar etiquetas.'+#13+'O arquivo deve está em uso!');
          Exit;
        end;
        Close;
        ShowMessage('Arquivo gerado com sucesso !'+#13+IntToStr(QtdEtiquetas)+' registros!');
      end;
    end;
  end
  else if tag = 1 then //Gráfico Vendas Por Vendedor
  Begin
    Application.CreateForm(TfMxGraficoVendasVendedor, fMxGraficoVendasVendedor);
    with fMxGraficoVendasVendedor do
    Begin
      DBChart1.Title.Text.Text := 'Vendas por Vendedor - '+mskDataINI.Text+' a '+mskDataFIM.Text;
      tag := 0;
      if DM.Configuracao1.Empresa IN [empEletro,empPetromax] then
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_PRECO_DESC=IPV_PRECO '+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE ((IPV_PRECO_DESC IS NULL) OR (IPV_PRECO_DESC=0))');

      Query1.SQL.Text:='SELECT T3.FUN_APELIDO AS DESCRICAO,'+
        'SUM(ROUND(T1.IPV_PRECO_DESC,2)*(T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)) AS TOTAL,'+
        'SUM(ROUND(T1.IPV_PRECO-T1.IPV_PRECO_DESC,2)*(T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)) AS TOTAL2, '+
        'COUNT(DISTINCT T2.PDV_CODIGO) AS QUANTIDADEVENDA '+
        'FROM ITEM_DE_PEDIDO_DE_VENDA T1,PEDIDO_DE_VENDA T2,FUNCIONARIO T3 '+
        'WHERE T1.CNC_CODIGO=T2.CNC_CODIGO AND T2.CNC_CODIGO=T3.CNC_CODIGO '+
        'AND (T2.CLI_CODIGO<>0) AND (T2.PDV_SITUACAO=4) AND '+
        'T2.PDV_CODIGO=T1.PDV_CODIGO AND T3.FUN_CODIGO=T1.FUN_CODIGO '+
        'AND (T3.FUN_SITUACAO<>1 OR T3.FUN_SITUACAO IS NULL) '+
        CLI+PRD+FUN+PDV+CNC+DataINI+DataFIM+
        'GROUP BY T3.FUN_APELIDO '+
        'HAVING SUM(T1.IPV_QUANTIDADE*T1.IPV_PRECO) > 0 '+
        'ORDER BY T3.FUN_APELIDO ';
      ShowModal;
    end;
  end
  else if tag = 2 then //Gráfico Faturamento Mensal
  Begin
    Application.CreateForm(TfMxGraficoFaturamentoVendas, fMxGraficoFaturamentoVendas);
    with fMxGraficoFaturamentoVendas do
    Begin
      tag := 0;
      if DM.Configuracao1.Empresa IN [empEletro,empPetromax] then
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_PRECO_DESC=IPV_PRECO '+
          ' WHERE ((IPV_PRECO_DESC IS NULL) OR (IPV_PRECO_DESC=0))');
      //
      if DM.Configuracao1.Empresa = empLBM then
      begin
        Dif := MonthsBetween(StrToDateTime(Dt_Ini),StrToDateTime(Dt_Fim));
        NewDatIni := '21/'+Copy(DateTimeToStr(IncDay(StrToDateTime(Dt_Ini), -30)),4,7);
        NewDatFim := '21/'+Copy(Dt_Ini,4,7);
        for i := 0 to Dif do
        begin
          if i = 0 then
          begin
            Query1.SQL.Text := '';
            NewDatIni := '21/'+Copy(DateTimeToStr(IncDay(StrToDateTime(NewDatIni), 30*i)),4,7);
            NewDatFim := '21/'+Copy(DateTimeToStr(IncDay(StrToDateTime(NewDatFim), 30*i)),4,7);
          end
          else
          begin
            Query1.SQL.Text := Query1.SQL.Text +#13+ ' UNION '+#13;
            NewDatIni := '21/'+Copy(DateTimeToStr(IncDay(StrToDateTime(NewDatIni), 30)),4,7);
            NewDatFim := '21/'+Copy(DateTimeToStr(IncDay(StrToDateTime(NewDatFim), 30)),4,7);
          end;
          DataINI := ' AND (T2.PDV_DT_EMISSAO_VENDA>="'+MesDia(NewdatIni)+'") ';
          DataFIM := ' AND (T2.PDV_DT_EMISSAO_VENDA<"'+MesDia(NewdatFim)+'") ';
          CarMes := Copy(NewdatFim,7,4)+'/'+Copy(NewdatFim,4,2)+' '+cMes[StrToInt(Copy(NewdatFim,4,2))];
          //
          DM.QR_Consultas.Close;
          DM.QR_Consultas.SQL.Text := 'SELECT SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2)) AS FATUR '+
              ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(NewDatINI)+
              '" AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(NewDatFim)+'" '+IT1+
              ' AND (P1.PDV_SITUACAO=4 OR P1.PDV_SITUACAO=8) '+
              ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
              ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND P1.PDV_CODIGO=I1.PDV_CODIGO';
          DM.QR_Consultas.Open;
          if DM.QR_Consultas.IsEmpty then
            FATUR := 0
          else
            FATUR := DM.QR_Consultas.FieldByName('FATUR').asFloat;

          //
          DM.QR_Consultas.Close;
          DM.QR_Consultas.SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS FATURNF '+
            ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 WHERE N1.NTF_DT_EMISSAO>="'+MesDia(NewDatIni)+
            '" AND N1.NTF_DT_EMISSAO<"'+MesDia(NewDatFim)+'" '+NF1+
            ' AND ((N1.NTF_TIPO_NOTA=361) or (N1.NTF_TIPO_NOTA=368)) '+ //Vendas e Serviços
            ' AND N1.NTF_SITUACAO=2 '+
            ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND N1.NTF_CODIGO=I1.NTF_CODIGO';
          DM.QR_Consultas.Open;
          if DM.QR_Consultas.IsEmpty then
            FATURNF := 0
          else
            FATURNF := DM.QR_Consultas.FieldByName('FATURNF').asFloat;
          //
          DM.QR_Consultas.Close;
          DM.QR_Consultas.SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE*ROUND(I1.ITO_VALOR,2)) AS FATPARC '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_TROCA I1 WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(NewdatIni)+
            '" AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(NewdatFim)+'" '+IT1+
            ' AND ((P1.PDV_SITUACAO=4) OR (P1.PDV_SITUACAO=8)) AND (P1.PDV_NOTA_FISCAL=-1  OR P1.PDV_NOTA_FISCAL=-2) AND I1.ITO_SITUACAO=1 '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO';
          DM.QR_Consultas.Open;
          if DM.QR_Consultas.IsEmpty then
            FATPARC := 0
          else
            FATPARC := DM.QR_Consultas.FieldByName('FATPARC').asFloat;
          //
          DM.QR_Consultas.Close;
          DM.QR_Consultas.SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS DEVOLNF '+
            ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1  WHERE N1.NTF_DT_EMISSAO>="'+MesDia(NewdatIni)+
            '" AND N1.NTF_DT_EMISSAO<"'+MesDia(NewdatFim)+'" '+NF1+
            ' AND (N1.NTF_TIPO_NOTA=362) AND N1.NTF_SITUACAO=2'+
            ' AND N1.CNC_CODIGO=I1.CNC_CODIGO AND N1.NTF_CODIGO=I1.NTF_CODIGO';
          DM.QR_Consultas.Open;
          if DM.QR_Consultas.IsEmpty then
            DEVOLNF := 0
          else
            DEVOLNF := DM.QR_Consultas.FieldByName('DEVOLNF').asFloat;
          //
          DM.QR_Consultas.Close;
          DM.QR_Consultas.SQL.Text := 'SELECT SUM(I1.IPV_QUANTIDADE*ROUND(I1.IPV_PRECO_DESC,2)) AS DEVOLSN '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1  WHERE P1.PDV_DT_DEVOLUCAO>="'+MesDia(NewdatIni)+
            '" AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(NewdatFim)+'"  AND (P1.PDV_SITUACAO=8) '+IT1+
            ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) AND P1.CNC_CODIGO=I1.CNC_CODIGO  AND P1.PDV_CODIGO=I1.PDV_CODIGO';
          DM.QR_Consultas.Open;
          if DM.QR_Consultas.IsEmpty then
            DEVOLSN := 0
          else
            DEVOLSN := DM.QR_Consultas.FieldByName('DEVOLSN').asFloat;
          //
          DM.QR_Consultas.Close;
          DM.QR_Consultas.SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE*ROUND(I1.ITO_VALOR,2)) AS DEVOLTROCA '+
            ' FROM TROCA T1, ITEM_DE_TROCA I1, PEDIDO_DE_VENDA P1  WHERE T1.TRO_DATA>="'+MesDia(NewdatIni)+
            '" AND T1.TRO_DATA<"'+MesDia(NewdatFim)+'"  AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+IT1+
            ' AND I1.ITO_SITUACAO=1  AND P1.PDV_CODIGO=T1.PDV_CODIGO AND T1.TRO_CODIGO=I1.TRO_CODIGO';
          DM.QR_Consultas.Open;
          if DM.QR_Consultas.IsEmpty then
            DEVOLTROCA := 0
          else
            DEVOLTROCA := DM.QR_Consultas.FieldByName('DEVOLTROCA').asFloat;
          //
          //  ' (SUM(T1.IPV_QUANTIDADE*ROUND(T1.IPV_PRECO_DESC,2)) + '+
          Query1.SQL.Text := Query1.SQL.Text+'(SELECT T2.CNC_CODIGO, ('''+CarMes+''') AS DESCRICAO, '+
            '( '+VirgPonto(FATUR)+' + '+
            VirgPonto(FATURNF)+' + '+
            VirgPonto(FATPARC)+' - '+
            VirgPonto(DEVOLNF)+' -'+
            VirgPonto(DEVOLSN)+' -'+
            VirgPonto(DEVOLTROCA)+' ) AS TOTAL, '+
            ' SUM(T1.IPV_QUANTIDADE*(T1.IPV_PRECO_SUGERIDO-T1.IPV_PRECO_DESC)) AS TOTAL2, '+
            ' COUNT(DISTINCT T2.PDV_CODIGO) AS QUANTIDADEVENDA,  COUNT(DISTINCT T1.PRD_CODIGO) AS QUANTIDADEITEM '+
            ' FROM PEDIDO_DE_VENDA T2, ITEM_DE_PEDIDO_DE_VENDA T1, PRODUTO R  WHERE T2.PDV_CODIGO=T1.PDV_CODIGO '+
            ' AND T2.CNC_CODIGO=T1.CNC_CODIGO AND T1.PRD_CODIGO=R.PRD_CODIGO '+DataINI+DataFIM+CNC+PRD+FUN+CLI+PDV+
            ' AND (T2.PDV_SITUACAO = 4  OR T2.PDV_SITUACAO = 8) AND (T2.PDV_NOTA_FISCAL=-1 OR T2.PDV_NOTA_FISCAL=-2) '+
            ' GROUP BY T2.CNC_CODIGO  HAVING SUM(T1.IPV_QUANTIDADE*ROUND(T1.IPV_PRECO_DESC,2)) > 0) ';
        end;
        //
      end
      else
        Query1.SQL.Text:= 'SELECT T2.CNC_CODIGO, YEAR(T2.PDV_DT_ENTREGA) AS ANO, MONTH(T2.PDV_DT_ENTREGA) AS MES, '+
          ' CAST(MONTH(T2.PDV_DT_ENTREGA) AS VARCHAR)+''/''+CAST(YEAR(T2.PDV_DT_ENTREGA) AS VARCHAR) AS DESCRICAO, '+
          ' SUM(T1.IPV_QUANTIDADE*T1.IPV_PRECO_DESC) AS TOTAL, '+
          ' SUM(T1.IPV_QUANTIDADE*(T1.IPV_PRECO_SUGERIDO-T1.IPV_PRECO_DESC)) AS TOTAL2, '+
          ' COUNT(DISTINCT T2.PDV_CODIGO) AS QUANTIDADEVENDA, '+
          ' COUNT(DISTINCT T1.PRD_CODIGO) AS QUANTIDADEITEM '+
          ' FROM PEDIDO_DE_VENDA T2, ITEM_DE_PEDIDO_DE_VENDA T1, PRODUTO R '+
          ' WHERE T2.PDV_CODIGO=T1.PDV_CODIGO AND T2.CNC_CODIGO=T1.CNC_CODIGO AND T1.PRD_CODIGO=R.PRD_CODIGO '+DataINI+DataFIM+CNC+PRD+FUN+CLI+PDV+
          ' AND (T2.PDV_SITUACAO = 4)  '+  //AND (T1.IPV_SITUACAO NOT IN (8,12))
          ' GROUP BY T2.CNC_CODIGO, YEAR(T2.PDV_DT_ENTREGA), MONTH(T2.PDV_DT_ENTREGA), CAST(MONTH(T2.PDV_DT_ENTREGA) AS VARCHAR)+''/''+CAST(YEAR(T2.PDV_DT_ENTREGA) AS VARCHAR) '+
          ' HAVING SUM(T1.IPV_QUANTIDADE*T1.IPV_PRECO) > 0 '+
          ' ORDER BY T2.CNC_CODIGO,  YEAR(T2.PDV_DT_ENTREGA), MONTH(T2.PDV_DT_ENTREGA) ';
      //
      if (Dif > 1) and (DM.Configuracao1.Empresa = empLBM) then
        Query1.SQL.Text := Query1.SQL.Text + ' ORDER BY DESCRICAO ';
      ShowModal;
    end;
  end
  else if tag = 3 then //Gráfico Media Anual
  Begin
    if MonthsBetween(StrToDateTime(Dt_Ini),StrToDateTime(Dt_Fim)) < 3 then
      Raise Exception.Create('Quantidade de Meses Compreendidos entre Datas Insuficiente!');
    //
    Application.CreateForm(TfMxGraficoMediaAnual, fMxGraficoMediaAnual);
    with fMxGraficoMediaAnual do
    Begin
      tag := 0;
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
        ' IPV_PRECO_DESC=IPV_PRECO '+
        ' WHERE ((IPV_PRECO_DESC IS NULL) OR (IPV_PRECO_DESC=0))');
      //
      for i := 1 to 3 do
      begin
        if i = 1 then
        begin
          Query1.SQL.Text := '';
          Med := '/3';
          NewDatIni := '21/'+Copy(DateTimeToStr(IncDay(StrToDateTime(Dt_Fim), -90)),4,7);
          NewDatFim := '21/'+Copy(Dt_Fim,4,7);
          CarMes := 'M1 - Trimestral';
        end
        else if i = 2 then
        begin
          Query1.SQL.Text := Query1.SQL.Text +#13+ ' UNION '+#13;
          Med := '/6';
          NewDatIni := '21/'+Copy(DateTimeToStr(IncDay(StrToDateTime(Dt_Fim), -180)),4,7);
          NewDatFim := '21/'+Copy(Dt_Fim,4,7);
          CarMes := 'M2 - Semestral';
        end
        else if i = 3 then
        begin
          Query1.SQL.Text := Query1.SQL.Text +#13+ ' UNION '+#13;
          Med := '/12';
          NewDatIni := '21/'+Copy(DateTimeToStr(IncDay(StrToDateTime(Dt_Fim), -360)),4,7);
          NewDatFim := '21/'+Copy(Dt_Fim,4,7);
          CarMes := 'M3 - Anual';
        end;

        DataINI := ' AND (T2.PDV_DT_ENTREGA>="'+MesDia(NewdatIni)+'") ';
        DataFIM := ' AND (T2.PDV_DT_ENTREGA<"'+MesDia(NewdatFim)+'") ';

        //          ' (SUM(T1.IPV_QUANTIDADE*T1.IPV_PRECO_DESC)'+Med+') AS TOTAL, '+
        Query1.SQL.Text := Query1.SQL.Text+'(SELECT T2.CNC_CODIGO, ('''+CarMes+''') AS DESCRICAO, '+

            '( ((SELECT SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2)) AS FATUR '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(NewDatINI)+
            '" AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(NewDatFim)+'" '+IT1+
            ' AND (P1.PDV_SITUACAO=4 OR P1.PDV_SITUACAO=8) '+
            ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+
            ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO) + '+

            ' (SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS FATURNF '+
            ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 WHERE N1.NTF_DT_EMISSAO>="'+MesDia(NewDatIni)+
            '" AND N1.NTF_DT_EMISSAO<"'+MesDia(NewDatFim)+'" '+NF1+
            ' AND ((N1.NTF_TIPO_NOTA=361) or (N1.NTF_TIPO_NOTA=368)) '+ //Vendas e Serviços
            ' AND N1.NTF_SITUACAO=2 '+
            ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND N1.NTF_CODIGO=I1.NTF_CODIGO) + '+

            ' (SELECT SUM(I1.ITO_QUANTIDADE*ROUND(I1.ITO_VALOR,2)) AS FATPARC '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_TROCA I1 WHERE P1.PDV_DT_EMISSAO_VENDA>="'+MesDia(NewdatIni)+
            '" AND P1.PDV_DT_EMISSAO_VENDA<"'+MesDia(NewdatFim)+'" '+IT1+
            ' AND ((P1.PDV_SITUACAO=4) OR (P1.PDV_SITUACAO=8)) AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) AND I1.ITO_SITUACAO=1 '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO) - '+

            ' (SELECT SUM(I1.INF_QUANTIDADE*ROUND(I1.INF_PRECO-I1.INF_DESCONTO,2)) AS DEVOLNF '+
            ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1  WHERE N1.NTF_DT_EMISSAO>="'+MesDia(NewdatIni)+
            '" AND N1.NTF_DT_EMISSAO<"'+MesDia(NewdatFim)+'" '+NF1+
            ' AND (N1.NTF_TIPO_NOTA=362) AND N1.NTF_SITUACAO=2'+
            ' AND N1.CNC_CODIGO=I1.CNC_CODIGO AND N1.NTF_CODIGO=I1.NTF_CODIGO) -'+

            ' (SELECT SUM(I1.IPV_QUANTIDADE*ROUND(I1.IPV_PRECO_DESC,2)) AS DEVOLSN '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1  WHERE P1.PDV_DT_DEVOLUCAO>="'+MesDia(NewdatIni)+
            '" AND P1.PDV_DT_DEVOLUCAO<"'+MesDia(NewdatFim)+'"  AND (P1.PDV_SITUACAO=8) '+IT1+
            ' AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) AND P1.CNC_CODIGO=I1.CNC_CODIGO  AND P1.PDV_CODIGO=I1.PDV_CODIGO) -'+

            ' (SELECT SUM(I1.ITO_QUANTIDADE*ROUND(I1.ITO_VALOR,2)) AS DEVOLTROCA '+
            ' FROM TROCA T1, ITEM_DE_TROCA I1, PEDIDO_DE_VENDA P1  WHERE T1.TRO_DATA>="'+MesDia(NewdatIni)+
            '" AND T1.TRO_DATA<"'+MesDia(NewdatFim)+'"  AND (P1.PDV_NOTA_FISCAL=-1 OR P1.PDV_NOTA_FISCAL=-2) '+IT1+
            ' AND I1.ITO_SITUACAO=1  AND P1.PDV_CODIGO=T1.PDV_CODIGO AND T1.TRO_CODIGO=I1.TRO_CODIGO ))'+Med+')'+

            ' AS TOTAL, '+

          ' ( SUM(T1.IPV_QUANTIDADE*(T1.IPV_PRECO_SUGERIDO-T1.IPV_PRECO_DESC))'+Med+') AS TOTAL2, '+
          ' ( COUNT(DISTINCT T2.PDV_CODIGO) '+Med+') AS QUANTIDADEVENDA, '+
          ' ( COUNT(DISTINCT T1.PRD_CODIGO) '+Med+') AS QUANTIDADEITEM '+
          ' FROM PEDIDO_DE_VENDA T2, ITEM_DE_PEDIDO_DE_VENDA T1, PRODUTO R  WHERE T2.PDV_CODIGO=T1.PDV_CODIGO '+
          ' AND T2.CNC_CODIGO=T1.CNC_CODIGO AND T1.PRD_CODIGO=R.PRD_CODIGO '+DataINI+DataFIM+CNC+PRD+FUN+CLI+PDV+
          ' AND T2.PDV_SITUACAO=4 '+
          ' GROUP BY T2.CNC_CODIGO  HAVING SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*T1.IPV_PRECO) > 0) ';
      end;
      //
      Query1.SQL.Text := Query1.SQL.Text + ' ORDER BY DESCRICAO DESC';
      ShowModal;
    end;
  end
  else if tag = 4 then //Meta por Vendedor
  Begin
    Application.CreateForm(TfMxGraficoMetaPorVendedor, fMxGraficoMetaPorVendedor);
    with fMxGraficoMetaPorVendedor do
    Begin
      DBChart1.Title.Text.Text := 'Metas por Vendedor - '+mskDataINI.Text+' a '+mskDataFIM.Text;
      tag := 0;

      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM CENTRO_DE_CUSTO '+
          ' WHERE CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue);
        Open;
        vMetaQuinzena1 := FieldByName('CNC_META_QUINZENA_1').asFloat;
        vMetaQuinzena2 := FieldByName('CNC_META_QUINZENA_2').asFloat;

        Close;
        SQL.Text := 'SELECT COUNT(FUN_CODIGO) AS TOTAL '+
          ' FROM FUNCIONARIO '+
          ' WHERE (FUN_SITUACAO<>1 OR FUN_SITUACAO IS NULL) '+
          ' AND CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
          ' AND (FUN_APARECE_VENDAS=1 '+
          '  OR FUN_APARECE_SERVICOS=1) ';
        Open;
        iQtdFUN := FieldByName('TOTAL').asInteger;
        if iQtdFUN <= 0 then
          raise exception.Create('Centro sem funcionários!');
      end;



      //Calcular dias úteis do período  (O dia só pode ser 01 ou 15)
      vMetaDiaria1 := 0;
      vMetaDiaria2 := 0;
      if Copy(mskDataINI.Text,1,2) = '01' then
      Begin
        iDiasUteisTotal := 0;
        vDtAux := DtINI;
        while vDtAux <= StrToDate('15/'+IntToStr(MonthOf(DtFIM))+'/'+IntToStr(YearOf(DtFIM))) do
        Begin
          if vDtAux = StrToDate(RetornaDataValidaUtil(DM.Configuracao1.PastaSistema, DateToStr(vDtAux))) then
            inc(iDiasUteisTotal);
          vDtAux := vDtAux + 1;
        end;
        if iDiasUteisTotal <= 0 then
          raise exception.Create('Período sem dias úteis!');
        vMetaDiaria1 := vMetaQuinzena1/iDiasUteisTotal/iQtdFUN;

        if StrToInt(Copy(mskDataFIM.Text,1,2)) > 15 then
        Begin
          iDiasUteisTotal := 0;
          vDtAux := StrToDate('16/'+IntToStr(MonthOf(DtFIM))+'/'+IntToStr(YearOf(DtFIM)));
          while vDtAux <= StrToDate(IntToStr(DaysInMonth(MonthOf(DtFIM)))+'/'+IntToStr(MonthOf(DtFIM))+'/'+IntToStr(YearOf(DtFIM))) do
          Begin
            if vDtAux = StrToDate(RetornaDataValidaUtil(DM.Configuracao1.PastaSistema, DateToStr(vDtAux))) then
              inc(iDiasUteisTotal);
            vDtAux := vDtAux + 1;
          end;
          if iDiasUteisTotal <= 0 then
            raise exception.Create('Período sem dias úteis!');
          vMetaDiaria2 := vMetaQuinzena2/iDiasUteisTotal/iQtdFUN;
        end;
      end
      else
      Begin
        iDiasUteisTotal := 0;
        vDtAux := DtINI; // 16/??/????
        while vDtAux <= StrToDate(IntToStr(DaysInMonth(MonthOf(DtFIM)))+'/'+IntToStr(MonthOf(DtFIM))+'/'+IntToStr(YearOf(DtFIM))) do
        Begin
          if vDtAux = StrToDate(RetornaDataValidaUtil(DM.Configuracao1.PastaSistema, DateToStr(vDtAux))) then
            inc(iDiasUteisTotal);
          vDtAux := vDtAux + 1;
        end;
        if iDiasUteisTotal <= 0 then
          raise exception.Create('Período sem dias úteis!');        
        vMetaDiaria2 := vMetaQuinzena1/iDiasUteisTotal/iQtdFUN;
      end;

      vMeta := 0;
      if Copy(mskDataINI.Text,1,2) = '01' then
      Begin
        if StrToInt(Copy(mskDataFIM.Text,1,2)) > 15 then
        Begin
          iDiasUteis := 0;
          vDtAux := DtINI;
          while vDtAux <= StrToDate('15/'+IntToStr(MonthOf(DtFIM))+'/'+IntToStr(YearOf(DtFIM))) do
          Begin
            if vDtAux = StrToDate(RetornaDataValidaUtil(DM.Configuracao1.PastaSistema, DateToStr(vDtAux))) then
              inc(iDiasUteis);
            vDtAux := vDtAux + 1;
          end;
          vMeta := vMeta + iDiasUteis*vMetaDiaria1;

          iDiasUteis := 0;
          vDtAux := StrToDate('16/'+IntToStr(MonthOf(DtFIM))+'/'+IntToStr(YearOf(DtFIM)));
          while vDtAux <= DtFIM do
          Begin
            if vDtAux = StrToDate(RetornaDataValidaUtil(DM.Configuracao1.PastaSistema, DateToStr(vDtAux))) then
              inc(iDiasUteis);
            vDtAux := vDtAux + 1;
          end;
          vMeta := vMeta + iDiasUteis*vMetaDiaria2;
        end
        else
        Begin
          iDiasUteis := 0;
          vDtAux := DtINI;
          while vDtAux <= DtFIM do
          Begin
            if vDtAux = StrToDate(RetornaDataValidaUtil(DM.Configuracao1.PastaSistema, DateToStr(vDtAux))) then
              inc(iDiasUteis);
            vDtAux := vDtAux + 1;
          end;
          vMeta := vMeta + iDiasUteis*vMetaDiaria1;
        end;
      end
      else //Somente segunda quinzena
      Begin
        iDiasUteis := 0;
        vDtAux := DtINI;
        while vDtAux <= DtFIM do
        Begin
          if vDtAux = StrToDate(RetornaDataValidaUtil(DM.Configuracao1.PastaSistema, DateToStr(vDtAux))) then
            inc(iDiasUteis);
          vDtAux := vDtAux + 1;
        end;
        vMeta := vMeta + iDiasUteis*vMetaDiaria2;
      end;

      Query1.SQL.Text:='SELECT T3.FUN_APELIDO AS DESCRICAO '+
        ',SUM(ROUND(T1.IPV_PRECO_DESC,2)*(T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO))/'+VirgPonto(vMeta)+'*100 AS TOTAL '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA T1 '+
        ' INNER JOIN PEDIDO_DE_VENDA T2 '+
        ' ON T2.PDV_SITUACAO=4 '+
        ' AND T2.CLI_CODIGO<>0 '+
        CLI+PRD+FUN+PDV+CNC+DataINI+DataFIM+
        ' AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND T2.PDV_CODIGO=T1.PDV_CODIGO '+

        ' RIGHT JOIN FUNCIONARIO T3 '+
        ' ON T3.FUN_CODIGO=T1.FUN_CODIGO '+

        ' WHERE T3.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
        ' AND (T3.FUN_SITUACAO<>1 OR T3.FUN_SITUACAO IS NULL) '+
        ' AND (FUN_APARECE_VENDAS=1 '+
        '  OR FUN_APARECE_SERVICOS=1) '+
        
        'GROUP BY T3.FUN_APELIDO '+
        
//        'HAVING SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*T1.IPV_PRECO) > 0 '+

        'ORDER BY SUM((T1.IPV_QUANTIDADE-T1.IPV_BONIFICACAO)*T1.IPV_PRECO) DESC ';
      ShowModal;
    end;
  end;
end;

procedure TfMxSelPedidos.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Text:='';
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxSelPedidos.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=19;
    fCadCli.CentroCusto2.open;
    try
      fCadCli.CentroCusto2.LocalizarCod(dblCodigoCNC.KeyValue);
      fCadCli.dblCentroDeCusto.KeyValue:=dblCodigoCNC.KeyValue;
    except
    end;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxSelPedidos.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=35;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=35;
        ShowModal;
      end;
    end;
  End;
end;

procedure TfMxSelPedidos.CheckBox3Click(Sender: TObject);
begin
{
  if CheckBox3.Checked then
  Begin
    mskDataINI.Clear;
    mskDataINI.Enabled := False;
    mskDataINI.Color   := AlteraCorComponentes;
    mskDataFIM.Clear;
    mskDataFIM.Enabled := False;
    mskDataFIM.Color   := AlteraCorComponentes;
  end
  else
  Begin
    mskDataINI.Enabled := True;
    mskDataINI.Color   := clWindow;
    mskDataFIM.Enabled := True;
    mskDataFIM.Color   := clWindow;
  end;
}
end;

procedure TfMxSelPedidos.ckbSomenteAdiplenteClick(Sender: TObject);
begin
  if ckbSomenteAdiplente.Checked then
  Begin
    ckbSomenteInadiplente.Checked := False;
    CheckBox27.Enabled := True;
    rdbSemParcelas.Enabled := True;
    rdbComParcelas.Enabled := True;
  end
  else
  Begin
    CheckBox27.Enabled := False;
    CheckBox27.Checked := False;
    rdbSemParcelas.Enabled := False;
    rdbComParcelas.Enabled := False;
  end;
end;

procedure TfMxSelPedidos.ckbSomenteInadiplenteClick(Sender: TObject);
begin
  if ckbSomenteInadiplente.Checked then
  Begin
    ckbSomenteAdiplente.Checked := False;
    CheckBox13.Enabled := True;
    rdbPedidoInteiro.Enabled := True;
    rdbQualquerParcela.Enabled := True;
  end
  else
  Begin
    CheckBox13.Enabled := False;
    CheckBox13.Checked := False;
    rdbPedidoInteiro.Enabled := False;
    rdbQualquerParcela.Enabled := False;
  end;
end;

procedure TfMxSelPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxSelPedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
end;

end.


