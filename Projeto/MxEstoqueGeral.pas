unit MxEstoqueGeral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Item_Pre_Recebimento, Db, DBTables, SQuery,
  Item_de_Estoque, Produto, Menus, Item_de_Embarque;

type
  TfMxEstoqueGeral = class(TForm)
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtFisicoLoc: TEdit;
    edtReservaLoc: TEdit;
    edtIndisponivelLoc: TEdit;
    edtSaldoLoc: TEdit;
    Label6: TLabel;
    edtFisicoExt: TEdit;
    edtReservaExt: TEdit;
    edtIndisponivelExt: TEdit;
    edtSaldoExt: TEdit;
    Label7: TLabel;
    edtTotalFisico: TEdit;
    edtTotalReserva: TEdit;
    edtTotalIndisponivel: TEdit;
    edtTotalSaldo: TEdit;
    Bevel1: TBevel;
    Item_de_Estoque1: TItem_de_Estoque;
    Panel2: TPanel;
    Label8: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    edtReferencia: TEdit;
    edtDetalhe: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Produto1: TProduto;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Consulta1: TMenuItem;
    Localizar1: TMenuItem;
    Label12: TLabel;
    Label13: TLabel;
    SB_Loc: TSpeedButton;
    Label15: TLabel;
    edtPrecoVenda: TEdit;
    Label18: TLabel;
    edtEmbarqueLoc: TEdit;
    edtEmbarqueExt: TEdit;
    Label19: TLabel;
    Item_de_Embarque1: TItem_de_Embarque;
    cmbPrevisaoLoc: TComboBox;
    cmbPrevisaoExt: TComboBox;
    edtTotalPrevisao: TEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Item_de_Estoque1BeforeOpen(DataSet: TDataSet);
    procedure Produto1BeforeOpen(DataSet: TDataSet);
    procedure SB_LocClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Pular:Boolean;
  end;

var
  fMxEstoqueGeral: TfMxEstoqueGeral;

implementation

uses UDM, Funcoes, MxSPediProd, UTelaEstoque, MxSPediProdMotCal;

{$R *.DFM}

procedure TfMxEstoqueGeral.SpeedButton2Click(Sender: TObject);
begin
  Pular:=True;
  Close;
end;

procedure TfMxEstoqueGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfMxEstoqueGeral.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Pular:=False;
end;

procedure TfMxEstoqueGeral.SpeedButton1Click(Sender: TObject);
begin
  Pular:=True;
  Application.CreateForm(Trpt_TelaEstoque, rpt_TelaEstoque);
  rpt_TelaEstoque.report.Preview;
  rpt_TelaEstoque.Close;
  Pular:=False;  
end;

procedure TfMxEstoqueGeral.Item_de_Estoque1BeforeOpen(DataSet: TDataSet);
begin
  Item_de_Estoque1.Filtered := False;
end;

procedure TfMxEstoqueGeral.Produto1BeforeOpen(DataSet: TDataSet);
begin
  Produto1.Filtered := False;
end;

procedure TfMxEstoqueGeral.SB_LocClick(Sender: TObject);
var
  CentroExterno:integer;
  Total1,Total2,Total3,Total4, PrevisaoTotal:Double;
  vDataEntrega: string;
begin
  Label12.Visible:=False;
  Label13.Visible:=False;
  PrevisaoTotal := 0;
  Total1 := 0;
  Total2 := 0;
  Total3 := 0;
  Total4 := 0;
  If Pular then
    Exit;
  if not VerificaInteiroBranco(edtCodigoPRD.text) then
  Begin
    edtFisicoLoc.Clear;
    edtReservaLoc.Clear;
    edtIndisponivelLoc.Clear;
    edtSaldoLoc.Clear;
    edtFisicoExt.Clear;
    edtReservaExt.Clear;
    edtIndisponivelExt.Clear;
    edtSaldoExt.Clear;
    edtTotalFisico.Clear;
    edtTotalReserva.Clear;
    edtTotalIndisponivel.Clear;
    edtTotalSaldo.Clear;
    edtCodigoPRD.Clear;
    edtProduto.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
    edtEmbarqueLoc.Clear;
    edtEmbarqueExt.Clear;
    cmbPrevisaoLoc.ItemIndex := -1;
    cmbPrevisaoLoc.Enabled := False;
    cmbPrevisaoExt.ItemIndex := -1;
    cmbPrevisaoExt.Enabled := False;
    edtPrecoVenda.Clear;
    Showmessage('Código de produto inválido');
    try
      edtCodigoPRD.SetFocus;
    except
    end;
    Exit;
  End;
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
  Produto1.Open;
  if Produto1.IsEmpty then
  Begin
    edtFisicoLoc.Clear;
    edtReservaLoc.Clear;
    edtIndisponivelLoc.Clear;
    edtSaldoLoc.Clear;
    edtFisicoExt.Clear;
    edtReservaExt.Clear;
    edtIndisponivelExt.Clear;
    edtSaldoExt.Clear;
    edtTotalFisico.Clear;
    edtTotalReserva.Clear;
    edtTotalIndisponivel.Clear;
    edtTotalSaldo.Clear;
    edtCodigoPRD.Clear;
    edtProduto.Clear;
    edtReferencia.Clear;
    edtDetalhe.Clear;
    edtEmbarqueLoc.Clear;
    edtEmbarqueExt.Clear;
    cmbPrevisaoLoc.ItemIndex := -1;
    cmbPrevisaoLoc.Enabled := False;
    cmbPrevisaoExt.ItemIndex := -1;
    cmbPrevisaoExt.Enabled := False;
    edtPrecoVenda.Clear;
    Showmessage('Código de produto inválido');
    try
      edtCodigoPRD.SetFocus;
    except
    end;
    Exit;
  end;
  with Produto1 do
  Begin
    if Situacao = 1 then
      edtProduto.Text   := Trim(Descricao + ' (DESATIVADO) ' + Caracteristica)
    else
      edtProduto.Text   := Trim(Descricao + ' ' + Caracteristica);
    edtReferencia.Text:= Referencia;
    edtDetalhe.Text   := Detalhe;
    edtPrecoVenda.Text   := Format('%.2f',[Precovenda]);
  end;

  //Loja Local

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3730)) >= 0) or
     (DM.Configuracao1.Empresa = empLBM) then
  Begin
    Item_de_Estoque1.Close;
    Item_de_Estoque1.SQL.Text:='SELECT * FROM ITEM_DE_ESTOQUE '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text;
    Item_de_Estoque1.Open;
    Label12.Visible:=Item_de_Estoque1.IsEmpty;

    //Calcular Pendentes Local
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := ' SELECT P1.PCP_DT_ENTREGA, MIN(P1.PCP_DT_CADASTRO) AS DT_COMPRA, '+
        ' SUM(T1.IPC_QUANTIDADE) AS QTD '+
        ' FROM ITEM_DE_PEDIDO_DE_COMPRA T1, PEDIDO_DE_COMPRA P1 '+
        ' WHERE T1.PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND P1.PCP_SITUACAO=0 AND CNC_ENTREGA='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND P1.PCP_CODIGO=T1.PCP_CODIGO AND P1.CNC_CODIGO=P1.CNC_CODIGO '+
        ' GROUP BY P1.PCP_DT_ENTREGA, P1.PCP_DT_CADASTRO '+
        ' ORDER BY P1.PCP_DT_ENTREGA ';
      Open;
      cmbPrevisaoLoc.Enabled := False;
      cmbPrevisaoLoc.Clear;
      if not IsEmpty then
      Begin
        cmbPrevisaoLoc.Enabled := True;
        while not EOF do
        Begin
          PrevisaoTotal := PrevisaoTotal + FieldByName('QTD').asFloat;
          if FieldByName('DT_COMPRA').asDateTime > 0 then
            vDataEntrega := DateToStr(FieldByName('DT_COMPRA').asDateTime)+' / '
          else
            vDataEntrega := PreencheEspaco(10,'')+' / ';

          if FieldByName('PCP_DT_ENTREGA').asDateTime > 0 then
            vDataEntrega := vDataEntrega + DateToStr(FieldByName('PCP_DT_ENTREGA').asDateTime)
          else
            vDataEntrega := vDataEntrega + 'SEM DATA';

          if DM.Configuracao1.Empresa <> empLBM then
            cmbPrevisaoLoc.Items.Add(PreencheEspaco(6, Format('%.2f',[FieldByName('QTD').asFloat]))+' - '+vDataEntrega)
          else
            cmbPrevisaoLoc.Items.Add(PreencheEspaco(6, IntToStr(FieldByName('QTD').asInteger))+' - '+vDataEntrega);
          Next;
        end;
        cmbPrevisaoLoc.ItemIndex := 0;
      end;
    end;

    edtFisicoLoc.Text:=format('%.2f',[Item_de_Estoque1.SComercial]);
    edtReservaLoc.Text:=format('%.2f',[Item_de_Estoque1.SReservado]);
    edtIndisponivelLoc.Text:=format('%.2f',[Item_de_Estoque1.Indisponivel]);
    edtSaldoLoc.Text:=format('%.2f',[Item_de_Estoque1.SComercial-Item_de_Estoque1.SReservado-Item_de_Estoque1.Indisponivel]);

    with Item_de_Embarque1 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
      ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
      Open;
      if FieldByName('SOMA').asFloat > 0 then
        edtEmbarqueLoc.Text := format('%.2f',[FieldByName('SOMA').asFloat])
      else
        edtEmbarqueLoc.Clear;
    end;
  end
  else
  Begin
    edtFisicoLoc.Clear;
    edtReservaLoc.Clear;
    edtIndisponivelLoc.Clear;
    edtSaldoLoc.Clear;
    edtEmbarqueLoc.Clear;
  end;

  //Loja Externa
  if (DM.Configuracao1.Empresa = empLBM) then
  Begin
    if DM.Configuracao1.CodigoCNC = 1 then
      CentroExterno := 2
    else
      CentroExterno := 1;
  end
  else
    CentroExterno := DM.Configuracao1.Deposito;
  Item_de_Estoque1.Close;
  if (DM.Configuracao1.Empresa = empLBM) then
    Item_de_Estoque1.SQL.Text:='SELECT * FROM ITEM_DE_ESTOQUE '+
        ' WHERE CNC_CODIGO='+IntToStr(CentroExterno)+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text
  else
    Item_de_Estoque1.SQL.Text:='SELECT * FROM ITEM_DE_ESTOQUE_DEPOSITO '+
        ' WHERE CNC_CODIGO='+IntToStr(CentroExterno)+
        ' AND PRD_CODIGO='+edtCodigoPRD.Text;
  Item_de_Estoque1.Open;
  Label13.Visible:=Item_de_Estoque1.IsEmpty;

  //Calcular Pendentes Externo
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := ' SELECT P1.PCP_DT_ENTREGA, MIN(P1.PCP_DT_CADASTRO) AS DT_COMPRA, '+
      ' SUM(T1.IPC_QUANTIDADE) AS QTD '+
      ' FROM ITEM_DE_PEDIDO_DE_COMPRA T1, PEDIDO_DE_COMPRA P1 '+
      ' WHERE T1.PRD_CODIGO='+edtCodigoPRD.Text+
      ' AND P1.PCP_SITUACAO=0 AND CNC_ENTREGA='+IntToStr(CentroExterno)+
      ' AND P1.PCP_CODIGO=T1.PCP_CODIGO AND P1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' GROUP BY P1.PCP_DT_ENTREGA,P1.PCP_DT_CADASTRO '+
      ' ORDER BY P1.PCP_DT_ENTREGA ';
    Open;
    cmbPrevisaoExt.Clear;
    if not IsEmpty then
    Begin
      cmbPrevisaoExt.Enabled := True;
      while not EOF do
      Begin
        PrevisaoTotal := PrevisaoTotal + FieldByName('QTD').asFloat;

        if FieldByName('DT_COMPRA').asDateTime > 0 then
          vDataEntrega := DateToStr(FieldByName('DT_COMPRA').asDateTime)+' / '
        else
          vDataEntrega := PreencheEspaco(10,'')+' / ';

        if FieldByName('PCP_DT_ENTREGA').asDateTime > 0 then
          vDataEntrega := vDataEntrega + DateToStr(FieldByName('PCP_DT_ENTREGA').asDateTime)
        else
          vDataEntrega := vDataEntrega + 'SEM DATA';

        if DM.Configuracao1.Empresa <> empLBM then
          cmbPrevisaoExt.Items.Add(PreencheEspaco(6, Format('%.2f',[FieldByName('QTD').asFloat]))+' - '+vDataEntrega)
        else
          cmbPrevisaoExt.Items.Add(PreencheEspaco(6, IntToStr(FieldByName('QTD').asInteger))+' - '+vDataEntrega);
        Next;
      end;
      cmbPrevisaoExt.ItemIndex := 0;
    end;
  end;

  if CentroExterno <> DM.Configuracao1.CodigoCNC then
  Begin
    edtFisicoExt.Text:=format('%.2f',[Item_de_Estoque1.SComercial]);
    edtReservaExt.Text:=format('%.2f',[Item_de_Estoque1.SReservado]);
    edtIndisponivelExt.Text:=format('%.2f',[Item_de_Estoque1.Indisponivel]);
    edtSaldoExt.Text:=format('%.2f',[Item_de_Estoque1.SComercial-Item_de_Estoque1.SReservado-Item_de_Estoque1.Indisponivel]);
  end
  else
  Begin
    edtFisicoExt.Text:='0,00';
    edtReservaExt.Text:='0,00';
    edtIndisponivelExt.Text:='0,00';
    edtSaldoExt.Text:='0,00';
  end;

  with Item_de_Embarque1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger:=CentroExterno;
    ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
    Open;
    if FieldByName('SOMA').asFloat > 0 then
      edtEmbarqueExt.Text := format('%.2f',[FieldByName('SOMA').asFloat])
    else
      edtEmbarqueExt.Clear;
  end;

  //Totais
  try
    if Trim(edtFisicoLoc.Text) <> '' then
      Total1 := StrToFloat(edtFisicoLoc.Text) + StrToFloat(edtFisicoExt.Text)
    else
      Total1 := StrToFloat(edtFisicoExt.Text);
  except
  end;
  try
    if Trim(edtReservaLoc.Text) <> '' then
      Total2 := StrToFloat(edtReservaLoc.Text) + StrToFloat(edtReservaExt.Text)
    else
      Total2 := StrToFloat(edtReservaExt.Text);
  except
  end;
  try
    if Trim(edtIndisponivelLoc.Text) <> '' then
      Total3 := StrToFloat(edtIndisponivelLoc.Text) + StrToFloat(edtIndisponivelExt.Text)
    else
      Total3 := StrToFloat(edtIndisponivelExt.Text);
  except
  end;
  try
    if Trim(edtSaldoLoc.Text) <> '' then
      Total4 := StrToFloat(edtSaldoLoc.Text) + StrToFloat(edtSaldoExt.Text)
    else
      Total4 := StrToFloat(edtSaldoExt.Text);
  except
  end;

  edtTotalFisico.Text:=format('%.2f',[Total1]);
  edtTotalReserva.Text:=format('%.2f',[Total2]);
  edtTotalIndisponivel.Text:=format('%.2f',[Total3]);
  edtTotalSaldo.Text:=format('%.2f',[Total4]);

  if DM.Configuracao1.Empresa <> empLBM then
    edtTotalPrevisao.Text := format('%.2f',[PrevisaoTotal])
  else
    edtTotalPrevisao.Text := IntToStr(Trunc(PrevisaoTotal));
end;

procedure TfMxEstoqueGeral.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=chr(13) then
  Begin
    SB_LocClick(sender);
  end;
  If key=chr(32) then
  Begin
    edtCodigoPRD.Clear;
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=29;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=29;
        ShowModal;
      end;
    end;
    if edtCodigoPRD.Text <> '' then
      SB_LocClick(sender);
  End
  else
  Begin
    if DM.Configuracao1.Empresa <> empHope then
    Begin
      If key='-' then
        key:='0'
      else If UpperCase(key)='C' then
        key:='0'
      else If UpperCase(key)='D' then
        key:='6';
    end;
  end;
end;

procedure TfMxEstoqueGeral.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxEstoqueGeral.edtCodigoPRDChange(Sender: TObject);
begin
  if Length(edtCodigoPRD.Text) = 6 then
  Begin
    SB_LocClick(sender);
    edtCodigoPRD.Clear;
  end;
end;

end.
