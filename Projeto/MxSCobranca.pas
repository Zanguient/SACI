unit MxSCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Transportadora, DBCtrls, Parametro, Solicitacao_de_Garantia, AgenteFin,
  Forma_de_Pagamento, Vendedor, Pedido_de_Venda, Item_Pedido_Venda, Produto,
  Compra, Item_de_Cotacao, MapaCotacao, Item_de_Intencao_de_Compra,
  Int_de_compra, CentroCusto, Menus;

type
  TfMxCobCobrador = class(TForm)
    Panel5: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    DBGrid5: TDBGrid;
    Label20: TLabel;
    SpeedButton4: TSpeedButton;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    Memo2: TMemo;
    Label27: TLabel;
    Label10: TLabel;
    Edit7: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Edit8: TEdit;
    Label6: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Edit9: TEdit;
    Edit14: TEdit;
    Label18: TLabel;
    Label11: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label13: TLabel;
    Label24: TLabel;
    Edit15: TEdit;
    Label17: TLabel;
    Edit16: TEdit;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Exc: TSpeedButton;
    Edit1: TEdit;
    Label2: TLabel;
    SB_Alt: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    MainMenu2: TMainMenu;
    MenuItem1: TMenuItem;
    Itens1: TMenuItem;
    ItensdaCobrana1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    Inserir1: TMenuItem;
    Adicionar1: TMenuItem;
    AdicionarTodos1: TMenuItem;
    Salvar2: TMenuItem;
    N2: TMenuItem;
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure EntidadeAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Int_de_compra1AfterScroll(DataSet: TDataSet);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Item_de_Intencao_de_Compra1AfterScroll(DataSet: TDataSet);
    procedure Edit9Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TItem_de_Intencao_de_Compra;
  end;

var
  fMxCobCobrador: TfMxCobCobrador;

implementation
Uses
  UDM, MxCompra, MxSPediProd, MxPedido, MxSubIntCompra;
{$R *.DFM}



procedure TfMxCobCobrador.SB_SalvaClick(Sender: TObject);
begin
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  DbGrid5.Enabled:=True;
{  Item_de_Intencao_de_Compra1.Inserir(1,Entidade.CodigoCMP,
  StrToInt(Entidade.ECodigoPPF.Text),StrToInt(Entidade.EQuantidade.Text),
  StrToInt(Entidade.EEntrega.Text),Entidade.EPagamento.Text,
  StrToFloat(Entidade.EBonificacao.Text),StrToFloat(Entidade.EPreco.Text),
  StrToFloat(Entidade.EFrete.Text),StrToFloat(Entidade.EIPI.Text),StrToFloat(Entidade.EICM.text));}
  Item_de_Intencao_de_Compra1.FinalizaEdicao;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
end;

procedure TfMxCobCobrador.SB_CancClick(Sender: TObject);
begin
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  DbGrid5.Enabled:=True;
  Entidade.CancelaEdicao;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
end;

procedure TfMxCobCobrador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=false;
  Int_de_compra1.Active:=false;
  MapaCotacao1.Active:=false;
  Item_de_Cotacao1.Active:=false;
  Produto1.Active:=False;

  Action:=Cafree;
end;

procedure TfMxCobCobrador.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(8);
    Application.CreateForm(TfMxSPedProd, fMxSPedProd);
    fMxSPedProd.tag:=2;
    fMxSPedProd.ShowModal;
  End;
  Edit16.SetFocus;
end;

procedure TfMxCobCobrador.SB_PrimClick(Sender: TObject);
begin
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxCobCobrador.SB_AntClick(Sender: TObject);
begin
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.Prior;
    If Entidade.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxCobCobrador.SB_ProxClick(Sender: TObject);
begin
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Next;
    If Entidade.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxCobCobrador.SB_UltClick(Sender: TObject);
begin
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxCobCobrador.SB_NovoClick(Sender: TObject);
begin
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  DbGrid5.Enabled:=False;
  Entidade.PreparaInsercao;
  ActiveControl:=Edit9;
end;

procedure TfMxCobCobrador.SB_AltClick(Sender: TObject);
begin
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  DbGrid5.Enabled:=False;
  Entidade.PreparaAlteracao;
end;

procedure TfMxCobCobrador.SB_ExcClick(Sender: TObject);
begin
  Entidade.deletarauto;
end;

procedure TfMxCobCobrador.EntidadeAfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxCobCobrador.FormShow(Sender: TObject);
begin
  Edit7.Text:=fMxCompra.Edit1.Text;
  Edit17.Text:=fMxCompra.MaskEdit1.Text;
  Edit18.Text:=fMxCompra.Edit2.Text;

  Int_de_compra1.Active:=True;
  MapaCotacao1.Active:=True;
  Item_de_Cotacao1.Active:=True;
  Produto1.Active:=True;
  Entidade:=Item_de_Intencao_de_Compra1;
  Entidade.Active:=True;

  MaskEdit1.Text:=FormatDateTime('dd/mm/yyyy hh:nn:ss',MapaCotacao1.Data);
end;

procedure TfMxCobCobrador.SpeedButton4Click(Sender: TObject);
begin
  Int_de_compra1.InserirAuto;
  FMxCompra.Compra1.Alterar(FMxCompra.Compra1.CodigoCNC,FMxCompra.Compra1.CodigoCMP,
                            2,FMxCompra.Compra1.Motivo,FMxCompra.Compra1.Sugestao,
                            FMxCompra.Compra1.Historico,FMxCompra.Compra1.PrevVend,
                            FMxCompra.Compra1.PendRep,FMxCompra.Compra1.Procura);
end;

procedure TfMxCobCobrador.Int_de_compra1AfterScroll(DataSet: TDataSet);
begin
  If fMxCompra.Compra1.Situacao>=2 Then
  Int_de_compra1.CarregaDados;
end;

procedure TfMxCobCobrador.SpeedButton6Click(Sender: TObject);
begin
  If not Item_de_Intencao_de_Compra1.Locate('PPF_CODIGO',Item_de_Cotacao1.CodigoPPF,[]) Then
    Item_de_Intencao_de_Compra1.Inserir(1,Int_de_compra1.CodigoCMP,
    Item_de_Cotacao1.CodigoPPF,Item_de_Cotacao1.Quantidade,Item_de_Cotacao1.Entrega,
    Item_de_Cotacao1.Pagamento,Item_de_Cotacao1.Bonificacao,Item_de_Cotacao1.Preco,
    Item_de_Cotacao1.Frete,Item_de_Cotacao1.IPI,Item_de_Cotacao1.ICM)
  Else
    Showmessage('O item já foi inserido!');
end;

procedure TfMxCobCobrador.SpeedButton7Click(Sender: TObject);
begin
  Item_de_Cotacao1.First;
  While not Item_de_Cotacao1.eof do
  Begin
    If not Item_de_Intencao_de_Compra1.Locate('PPF_CODIGO',Item_de_Cotacao1.CodigoPPF,[]) Then
      Item_de_Intencao_de_Compra1.Inserir(1,Int_de_compra1.CodigoCMP,
      Item_de_Cotacao1.CodigoPPF,Item_de_Cotacao1.Quantidade,Item_de_Cotacao1.Entrega,
      Item_de_Cotacao1.Pagamento,Item_de_Cotacao1.Bonificacao,Item_de_Cotacao1.Preco,
      Item_de_Cotacao1.Frete,Item_de_Cotacao1.IPI,Item_de_Cotacao1.ICM)
    Else
      Showmessage('O item já foi inserido!');

    Item_de_Cotacao1.Next;
  End;
end;

procedure TfMxCobCobrador.Item_de_Intencao_de_Compra1AfterScroll(
  DataSet: TDataSet);
begin
  Item_de_Intencao_de_Compra1.CarregaDados;

  If Produto1.Locate('PRD_CODIGO',Edit9.Text,[]) Then
  Begin
    Item_de_Intencao_de_Compra1.ENomePRD.text:=Produto1.Descricao;
    Item_de_Intencao_de_Compra1.EUNPRD.text:=Produto1.Unidade;
    Item_de_Intencao_de_Compra1.ERefPRD.text:=Produto1.Referencia;
    Item_de_Intencao_de_Compra1.EMarca.text:=Produto1.Marca;
  End
  Else
  Begin
    Item_de_Intencao_de_Compra1.ENomePRD.text:='0';
    Item_de_Intencao_de_Compra1.EUNPRD.text:='0';
    Item_de_Intencao_de_Compra1.ERefPRD.text:='0';
    Item_de_Intencao_de_Compra1.EMarca.text:='0';
  End;
end;


procedure TfMxCobCobrador.Edit9Exit(Sender: TObject);
begin
  If (TEdit(Sender).text<>'') and(Item_de_Intencao_de_Compra1.Locate('IIC_CODIGO;PPF_CODIGO',
  VarArrayof([IntToStr(Item_de_Intencao_de_Compra1.CodigoIIC) ,Edit9.Text]),[])) Then
  Begin
      Item_de_Intencao_de_Compra1.CancelaEdicao;
      Item_de_Intencao_de_Compra1.PreparaAlteracao;
  End
  Else
    If TEdit(Sender).text<>'' then
      If Produto1.Locate('PRD_CODIGO',Edit9.Text,[]) Then
      Begin
        Edit10.text:=Produto1.Descricao;
        Edit11.text:=Produto1.Unidade;
        Edit12.text:=Produto1.Referencia;
        Edit13.text:=Produto1.Marca;
      End;
  Edit9.Enabled:=False;
end;

procedure TfMxCobCobrador.SpeedButton2Click(Sender: TObject);
begin
  FMxCompra.Compra1.Alterar(FMxCompra.Compra1.CodigoCNC,FMxCompra.Compra1.CodigoCMP,
                            1,FMxCompra.Compra1.Motivo,FMxCompra.Compra1.Sugestao,
                            FMxCompra.Compra1.Historico,FMxCompra.Compra1.PrevVend,
                            FMxCompra.Compra1.PendRep,FMxCompra.Compra1.Procura);
end;



procedure TfMxCobCobrador.DBGrid5DblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxSubIntCompra, fMxSubIntCompra);
  FMxSubIntCompra.Edit1.Text:=IntToStr(Item_de_Intencao_de_Compra1.CodigoIIC);
  FMxSubIntCompra.Edit3.text:=Produto1.Descricao;
  fMxSubIntCompra.ShowModal;
end;


procedure TfMxCobCobrador.BitBtn1Click(Sender: TObject);
begin
  Int_de_compra1.Alterar(Int_de_compra1.CodigoCNC,Int_de_compra1.CodigoCMP,Memo2.Text);
end;








procedure TfMxCobCobrador.MenuItem1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxCobCobrador.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If (SB_Salva.Enabled=true) or (BitBtn1.Enabled=true) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

end.
