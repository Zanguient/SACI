unit MxSelConsignacaoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Funcoes,
  item_de_consignacao, DB, DBTables, SQuery, consignacao, Mask, Produto,
  Funcionario, Menus, DBClient;

type
  TfMxSelConsignacaoVenda = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label18: TLabel;
    edtCodigoCSG: TEdit;
    edtResponsavel: TEdit;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    edtCodigoPRD: TEdit;
    edtQuantiade: TEdit;
    edtProduto: TEdit;
    edtPrecoUnitario: TEdit;
    edtValor: TEdit;
    btnDevolver: TBitBtn;
    Panel3: TPanel;
    bitProcessar: TBitBtn;
    BitBtn2: TBitBtn;
    Consignacao1: TConsignacao;
    Item_de_Consignacao1: TItem_de_Consignacao;
    DSConsignacao: TDataSource;
    mskDataHora: TMaskEdit;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    DSItemConsignacao: TDataSource;
    Consignacao1CNC_CODIGO: TIntegerField;
    Consignacao1CSG_CODIGO: TIntegerField;
    Consignacao1USU_CODIGO: TIntegerField;
    Consignacao1FUN_CODIGO: TIntegerField;
    Consignacao1CSG_DATA: TDateTimeField;
    Consignacao1CSG_DT_ALTERADO: TDateTimeField;
    Consignacao1CSG_VALOR: TFloatField;
    Consignacao1CSG_SITUACAO: TIntegerField;
    Consignacao1CSG_OBSERVACAO: TStringField;
    Item_de_Consignacao1CNC_CODIGO: TIntegerField;
    Item_de_Consignacao1ICS_CODIGO: TIntegerField;
    Item_de_Consignacao1CSG_CODIGO: TIntegerField;
    Item_de_Consignacao1PRD_CODIGO: TIntegerField;
    Item_de_Consignacao1USU_CODIGO: TIntegerField;
    Item_de_Consignacao1ICS_DATA: TDateTimeField;
    Item_de_Consignacao1ICS_QUANTIDADE: TFloatField;
    Item_de_Consignacao1ICS_VALOR: TFloatField;
    Item_de_Consignacao1ICS_OBSERVACAO: TStringField;
    Produto1: TProduto;
    Item_de_Consignacao1Produto: TStringField;
    Consignacao1Responsavel: TStringField;
    Funcionario1: TFuncionario;
    PopupMenu1: TPopupMenu;
    AlterarValorUnit1: TMenuItem;
    btnAlterarValor: TBitBtn;
    Devolver1: TMenuItem;
    cdItemConsignacao: TClientDataSet;
    cdItemConsignacaoCODIGO: TIntegerField;
    cdItemConsignacaoPRODUTO: TStringField;
    cdItemConsignacaoQUANTIDADE: TFloatField;
    cdItemConsignacaoVALOR: TFloatField;
    cdItemConsignacaoICS_CODIGO: TIntegerField;
    cdItemConsignacaoCSG_CODIGO: TIntegerField;
    cdItemConsignacaoCNC_CODIGO: TIntegerField;
    cdItemConsignacaoVALOR_TOTAL: TFloatField;
    Desfazer1: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure Consignacao1AfterOpen(DataSet: TDataSet);
    procedure Item_de_Consignacao1CalcFields(DataSet: TDataSet);
    procedure Consignacao1CalcFields(DataSet: TDataSet);
    procedure Devolver1Click(Sender: TObject);
    procedure btnDevolverClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bitProcessarClick(Sender: TObject);
    procedure cdItemConsignacaoCalcFields(DataSet: TDataSet);
    procedure edtQuantiadeKeyPress(Sender: TObject; var Key: Char);
    procedure Desfazer1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CancelaAlteracoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelConsignacaoVenda: TfMxSelConsignacaoVenda;

implementation

uses UDM, MxPedidoMotCal, MxSConsignacao;

{$R *.dfm}

procedure TfMxSelConsignacaoVenda.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelConsignacaoVenda.Consignacao1AfterOpen(DataSet: TDataSet);
begin
  edtCodigoCSG.Text := Consignacao1.FieldByName('CSG_CODIGO').AsString;
  mskDataHora.Text  := FormatDateTime('dd/mm/yyyy',Consignacao1.FieldByName('CSG_DATA').AsDateTime);
  edtResponsavel.Text := Consignacao1.FieldByName('Responsavel').AsString;
end;

procedure TfMxSelConsignacaoVenda.Item_de_Consignacao1CalcFields(
  DataSet: TDataSet);
begin
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_de_Consignacao1.CodigoPRD;
  Produto1.Open;
  Item_de_Consignacao1.FieldByName('Produto').asString := Produto1.Descricao;
end;

procedure TfMxSelConsignacaoVenda.Consignacao1CalcFields(
  DataSet: TDataSet);
begin
  Funcionario1.Close;
  Funcionario1.ParamByName('FUN_CODIGO').asInteger:=Consignacao1.CodigoFUN;
  Funcionario1.Open;
  Consignacao1.FieldByName('Responsavel').asString := Funcionario1.Apelido;
end;

procedure TfMxSelConsignacaoVenda.Devolver1Click(Sender: TObject);
begin
  edtCodigoPRD.Text     := cdItemConsignacao.FieldByName('CODIGO').AsString;
  edtProduto.Text       := cdItemConsignacao.FieldByName('PRODUTO').AsString;
  edtQuantiade.Text     := '0,00';
  edtPrecoUnitario.Text := Format('%.2f',[cdItemConsignacao.FieldByName('VALOR').AsFloat]);
  edtValor.Text         := Format('%.2f',[cdItemConsignacao.FieldByName('VALOR_TOTAL').AsFloat]);
  
  bitProcessar.Enabled := false;
  DBGrid1.Enabled := false;
  if sender = Devolver1 then
  begin
    edtQuantiade.Enabled     := true;
    edtPrecoUnitario.Enabled := true;
    btnDevolver.Enabled      := true;
    btnAlterarValor.Enabled  := false;
    edtQuantiade.Color       := clWindow;
    edtPrecoUnitario.Color   := clWindow;
    edtQuantiade.SetFocus;
  end
  else if sender = AlterarValorUnit1 then
  begin
    edtQuantiade.Enabled     := false;
    edtPrecoUnitario.Enabled := true;
    btnDevolver.Enabled      := false;
    btnAlterarValor.Enabled  := true;
    edtQuantiade.Color       := clMenu;
    edtPrecoUnitario.Color   := clWindow;
    edtPrecoUnitario.SetFocus;
  end;
end;

procedure TfMxSelConsignacaoVenda.btnDevolverClick(Sender: TObject);
begin
  if edtQuantiade.Text = '' then
    Raise Exception.Create('Quantidade informada inválida!');

  if edtPrecoUnitario.Text = '' then
    Raise Exception.Create('Preço unitário informado inválido!');


  cdItemConsignacao.Edit;

  if sender = btnDevolver then
  begin
    if StrToFloat(edtQuantiade.Text) <= cdItemConsignacao.FieldByName('QUANTIDADE').AsFloat then
    begin
      cdItemConsignacao.FieldByName('VALOR').AsFloat      := StrToFloat(edtPrecoUnitario.Text);
      cdItemConsignacao.FieldByName('QUANTIDADE').AsFloat := cdItemConsignacao.FieldByName('QUANTIDADE').AsFloat -
                                                             StrToFloat(edtQuantiade.Text);
    end
    else
      Raise Exception.Create('Valor inválido!');
  end;

  if sender = btnAlterarValor then
    cdItemConsignacao.FieldByName('VALOR').AsFloat := StrToFloat(edtPrecoUnitario.Text);

  cdItemConsignacao.Post;

  CancelaAlteracoes;
end;

procedure TfMxSelConsignacaoVenda.CancelaAlteracoes;
begin
  edtQuantiade.Enabled     := false;
  edtPrecoUnitario.Enabled := false;
  btnDevolver.Enabled      := false;
  btnAlterarValor.Enabled  := false;

  edtCodigoPRD.Text     := '';
  edtQuantiade.Text     := '';
  edtPrecoUnitario.Text := '';
  edtValor.Text         := '';
  edtProduto.Text       := '';

  edtQuantiade.Color       := clMenu;
  edtPrecoUnitario.Color   := clMenu;

  btnDevolver.Enabled      := false;
  btnAlterarValor.Enabled  := false;

  bitProcessar.Enabled := true;
  DBGrid1.Enabled      := true;

  DBGrid1.SetFocus;
end;

procedure TfMxSelConsignacaoVenda.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
  begin
    if (btnDevolver.Enabled) or (btnAlterarValor.Enabled) then
      CancelaAlteracoes
    else
      BitBtn2Click(BitBtn2);
  end;

  if key = #13 then
  begin
    if (btnDevolver.Enabled) or (btnAlterarValor.Enabled) then
    begin
      if (btnDevolver.Enabled) then
        btnDevolverClick(btnDevolver);

      if (btnAlterarValor.Enabled) then
        btnDevolverClick(btnAlterarValor);
    end
    else
      bitProcessarClick(bitProcessar);
  end;
end;

procedure TfMxSelConsignacaoVenda.bitProcessarClick(Sender: TObject);
var
  iSequencia: integer;
  Trans:Boolean;
begin

  if cdItemConsignacao.IsEmpty then
    raise exception.Create('Não existe itens nessa consignação');

  Trans:=false;
  with DM.Database2 do
  begin
    try
      if DM.Configuracao1.ControleTransacao then
      begin
        StartTransaction;
        Trans := True;
      end;

      //exclui todos os itens do pedido
      ExecutaSQL(DM.QueryExec,'DELETE FROM ITEM_DE_PEDIDO_DE_VENDA'+
                              ' WHERE CNC_CODIGO = '+IntToStr(cdItemConsignacao.FieldByName('CNC_CODIGO').AsInteger)+
                              ' AND PDV_CODIGO = '+fMxPedidoMotCal.edtCodigoPDV.Text);

      //inclui os itens da consignação no pedido
      iSequencia := 1;
      cdItemConsignacao.first;
      while not cdItemConsignacao.Eof do
      begin
        if cdItemConsignacao.FieldByName('QUANTIDADE').AsFloat > 0 then
        begin
          //Transferido para a tela de pedido em 09/09/2011
          {with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT ICS_QUANTIDADE '+
              ' FROM ITEM_DE_CONSIGNACAO '+
              ' WHERE CSG_CODIGO = ' + edtCodigoCSG.Text +
              ' AND PRD_CODIGO = ' + IntToStr(cdItemConsignacao.FieldByName('CODIGO').AsInteger);
            Open;

            if DM.QR_Consultas.FieldByName('ICS_QUANTIDADE').AsFloat - cdItemConsignacao.FieldByName('QUANTIDADE').AsFloat = 0 then
              ExecutaSQL(DM.QueryExec,'DELETE FROM ITEM_DE_CONSIGNACAO'+
                                      ' WHERE CSG_CODIGO = ' + edtCodigoCSG.Text +
                                      ' AND PRD_CODIGO = ' + IntToStr(cdItemConsignacao.FieldByName('CODIGO').AsInteger))
            else
              ExecutaSQL(DM.QueryExec,'UPDATE ITEM_DE_CONSIGNACAO SET'+
                                      ' ICS_QUANTIDADE = ICS_QUANTIDADE - ' + VirgPonto(cdItemConsignacao.FieldByName('QUANTIDADE').AsString) +
                                      ' WHERE CSG_CODIGO = ' + edtCodigoCSG.Text +
                                      ' AND PRD_CODIGO = ' + IntToStr(cdItemConsignacao.FieldByName('CODIGO').AsInteger));
          end;}
          //

          ExecutaSQL(DM.QueryExec,'INSERT ITEM_DE_PEDIDO_DE_VENDA '+
            '(CNC_CODIGO,USU_CODIGO,IPV_CODIGO,FUN_CODIGO,IEB_CODIGO,PDV_CODIGO '+
            ',IPV_DT_CADASTRO,SEC_CODIGO,PRD_CODIGO,TBP_CODIGO,IPV_ENTREGA '+
            ',IPV_AVISTA,IPV_VINCULO,IPV_QUANTIDADE,IPV_DESCONTO,IPV_BONIFICACAO,CNC_LOCAL_ESTOQUE '+
            ',IPV_PRECO,IPV_SITUACAO,IPV_PRECO_DESC,IPV_NOTA,IPV_ITEMNOTA '+
            ',IPV_PRECO_NOTA,IPV_PENDENCIA,IPV_ESTOQUE_LOCAL '+
            ',IPV_ESTOQUE_EXTERNO,IPV_PRECO_SUGERIDO,IPV_DIAS_ENTREGA '+
            ',IPV_SERVICO,IPV_SEQUENCIA,IPV_OBSERVACAO) '+
            ' VALUES '+
            '( '+IntToStr(cdItemConsignacao.FieldByName('CNC_CODIGO').AsInteger)+
            ', '+IntToStr(DM.Configuracao1.CodigoUSU)+
            ', '+IntToStr(Item_de_Consignacao1.ProximoCodigo('IPV_CODIGO'))+
            ', '+IntToStr(Consignacao1.CodigoFUN)+
            ',0'+ //IEB_CODIGO
            ', '+fMxPedidoMotCal.edtCodigoPDV.Text+
            ',"'+MesDia(DM.Configuracao1.Data)+'" '+
            ',0'+ //SEQ_CODIGO
            ', '+IntToStr(cdItemConsignacao.FieldByName('CODIGO').AsInteger)+
            ',0'+ //TBP_CODIGO
            ',1'+ //IPV_ENTREGA
            ',1'+ //IPV_AVISTA
            ',0'+ //IPV_VINCULO
            ', '+VirgPonto(cdItemConsignacao.FieldByName('QUANTIDADE').AsString)+
            ',0'+ //IPV_DESCONTO
            ',0'+ //IPV_BONIFICACAO
            ', '+IntToStr(cdItemConsignacao.FieldByName('CNC_CODIGO').AsInteger)+
            ', '+VirgPonto(cdItemConsignacao.FieldByName('VALOR').AsString)+
            ',0'+ //SITUACAO
            ', '+VirgPonto(cdItemConsignacao.FieldByName('VALOR').AsString)+
            ',0'+ //IPV_NOTA
            ',0'+ //IPV_ITEMNOTA
            ',0'+ //IPV_PRECO_NOTA
            ',0'+ //IPV_PENDENCIA
            ',0'+ //IPV_ESTOQUE_LOCAL
            ',0'+ //IPV_ESTOQUE_EXTERNO
            ', '+VirgPonto(cdItemConsignacao.FieldByName('VALOR').AsString)+
            ',0'+ //IPV_DIAS_ENTREGA
            ',0'+ //IPV_SERVICO
            ', '+IntToStr(iSequencia)+
            ',"CONSIGNAÇÃO") ');      //TODO

          inc(iSequencia);
        end;
        cdItemConsignacao.Next;
      end;

      //inclui o codigo da consignação no pedido
      ExecutaSQL(DM.QueryExec,'UPDATE PEDIDO_DE_VENDA'+
                              ' SET CSG_CODIGO = '+cdItemConsignacao.FieldByName('CSG_CODIGO').AsString+
                              ' WHERE CNC_CODIGO = '+IntToStr(cdItemConsignacao.FieldByName('CNC_CODIGO').AsInteger)+
                              ' AND PDV_CODIGO = '+fMxPedidoMotCal.edtCodigoPDV.Text);

      if DM.Configuracao1.ControleTransacao then
      begin
        if trans then
          Commit;
      end;
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      if DM.Configuracao1.ControleTransacao then
      begin
        if trans then
        begin
          RollBack;
          Exit;
        end;
      end;
    end;
  end;

  Close;
  try
    fMxSConsignacao.Close;

    fMxPedidoMotCal.Pedido_de_Venda1.Close;
    fMxPedidoMotCal.Pedido_de_Venda1.Open;

    fMxPedidoMotCal.Item_Pedido_Venda1.Close;
    fMxPedidoMotCal.Item_Pedido_Venda1.Open;
  except
  end;
end;

procedure TfMxSelConsignacaoVenda.cdItemConsignacaoCalcFields(
  DataSet: TDataSet);
begin
  cdItemConsignacao.FieldByName('VALOR_TOTAL').AsFloat := cdItemConsignacao.FieldByName('QUANTIDADE').AsFloat *
                                                          cdItemConsignacao.FieldByName('VALOR').AsFloat
end;

procedure TfMxSelConsignacaoVenda.edtQuantiadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',',',#8]) then
    Key := #0; 
end;

procedure TfMxSelConsignacaoVenda.Desfazer1Click(Sender: TObject);
begin
  Item_de_Consignacao1.Locate('ICS_CODIGO',cdItemConsignacao.FieldByName('ICS_CODIGO').AsInteger,[]);
  cdItemConsignacao.Edit;

  cdItemConsignacao.FieldByName('VALOR').AsFloat      := Item_de_Consignacao1.FieldByName('ICS_VALOR').AsFloat;
  cdItemConsignacao.FieldByName('QUANTIDADE').AsFloat := Item_de_Consignacao1.FieldByName('ICS_QUANTIDADE').AsFloat;

  cdItemConsignacao.Post;
end;

procedure TfMxSelConsignacaoVenda.FormShow(Sender: TObject);
begin
  cdItemConsignacao.First;
end;

end.
