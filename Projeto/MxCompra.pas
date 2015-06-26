unit MxCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, Compra, Menus;

type
  TfMxCompra = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    DSCompra1: TDataSource;
    Edit3: TEdit;
    Label4: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Panel3: TPanel;
    DBGrid5: TDBGrid;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    Compra1: TCompra;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Bevel1: TBevel;
    BitBtn8: TBitBtn;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Compras1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    N3: TMenuItem;
    Cotacao1: TMenuItem;
    Intencao1: TMenuItem;
    Pedido1: TMenuItem;
    Relatorio1: TMenuItem;
    Previsao1: TMenuItem;
    Pendencias1: TMenuItem;
    Procura1: TMenuItem;
    Historico1: TMenuItem;
    Sugestao1: TMenuItem;
    Compra1CMP_CODIGO: TIntegerField;
    Compra1CNC_CODIGO: TIntegerField;
    Compra1CMP_MOTIVO: TStringField;
    Compra1CMP_DATA: TDateTimeField;
    Compra1CMP_SUGESTAO: TSmallIntField;
    Compra1CMP_HISTORICO: TSmallIntField;
    Compra1CMP_PREV_VEND: TSmallIntField;
    Compra1CMP_SITUACAO: TIntegerField;
    Compra1CMP_PEND_REP: TSmallIntField;
    Compra1CMP_PROCURA: TSmallIntField;
    BitBtn3: TBitBtn;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure Cliente1AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Compra1AfterScroll(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TCompra;
  end;

var
  fMxCompra: TfMxCompra;

implementation
Uses
  UDM, MxCotacao, MxIntencao, MxPedCompra,funcoes, UPrev_vendas,
  UPendencia_reposicao, UProcura_Mercadoria, UHistorCompras,
  USugestaoCmp,URelData;
{$R *.DFM}



procedure TfMxCompra.SB_PrimClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxCompra.SB_AntClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxCompra.SB_ProxClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxCompra.SB_UltClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
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

procedure TfMxCompra.SB_NovoClick(Sender: TObject);
begin
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Localizar1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  DbGrid5.Enabled:=False;
  Edit11.Enabled:=False;
  Edit11.Color:=clMenu;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=clMenu;
  BitBtn1.Enabled:=false;
  BitBtn3.Enabled:=false;
  BitBtn2.Enabled:=false;
  BitBtn4.Enabled:=false;
  BitBtn5.Enabled:=false;
  BitBtn8.Enabled:=false;
  BitBtn7.Enabled:=false;
  BitBtn6.Enabled:=false;
  Entidade.PreparaInsercao;
  Edit2.SetFocus;
end;

procedure TfMxCompra.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Localizar1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  DbGrid5.Enabled:=False;
  Edit11.Enabled:=False;
  Edit11.Color:=clMenu;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=clMenu;
  BitBtn1.Enabled:=false;
  BitBtn3.Enabled:=false;
  BitBtn2.Enabled:=false;
  BitBtn4.Enabled:=false;
  BitBtn5.Enabled:=false;
  BitBtn8.Enabled:=false;
  BitBtn7.Enabled:=false;
  BitBtn6.Enabled:=false;
  Entidade.PreparaAlteracao;
  Edit2.SetFocus;
end;

procedure TfMxCompra.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if Compra1.Situacao<>0 then
    raise exception.Create('Não é possível deletar esta compra pois ela já foi processada!');
  Entidade.deletarauto;
end;

procedure TfMxCompra.SB_SalvaClick(Sender: TObject);
begin
  Entidade.FinalizaEdicao;
  Incluir1.Enabled:=true;
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Localizar1.Enabled:=true;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  DbGrid5.Enabled:=True;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  BitBtn1.Enabled:=true;
  BitBtn3.Enabled:=true;
  BitBtn2.Enabled:=true;
  BitBtn4.Enabled:=true;
  BitBtn5.Enabled:=true;
  BitBtn8.Enabled:=true;
  BitBtn7.Enabled:=true;
  BitBtn6.Enabled:=true;
end;

procedure TfMxCompra.SB_CancClick(Sender: TObject);
begin
  Incluir1.Enabled:=true;
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Localizar1.Enabled:=true;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  DbGrid5.Enabled:=True;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  BitBtn1.Enabled:=true;
  BitBtn3.Enabled:=true;
  BitBtn2.Enabled:=true;
  BitBtn4.Enabled:=true;
  BitBtn5.Enabled:=true;
  BitBtn8.Enabled:=true;
  BitBtn7.Enabled:=true;
  BitBtn6.Enabled:=true;
  Entidade.CancelaEdicao;
end;


procedure TfMxCompra.FormCreate(Sender: TObject);
begin
  Entidade:=Compra1;
  If Entidade.State <> dsInactive Then
    Entidade.Active:=False;
  Entidade.Active:=true;
end;

procedure TfMxCompra.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfMxCompra.SB_LocClick(Sender: TObject);
begin
 If ComboBox2.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit11.Text) then
      raise Exception.create('Código a ser localizado inválido!');
 Entidade.Localizar;
end;


procedure TfMxCompra.Cliente1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfMxCompra.BitBtn1Click(Sender: TObject);
begin
  If not Compra1.IsEmpty Then
  Begin
    Application.CreateForm(TfMxCotacao, fMxCotacao);
    fMxCotacao.Tag:=0;
    fMxCotacao.ShowModal;
  End
  Else
    ShowMessage('Selecione uma compra antes de continuar!');
end;

procedure TfMxCompra.BitBtn3Click(Sender: TObject);
begin
  If not Compra1.IsEmpty Then
  Begin
    Application.CreateForm(TfMxIntenc, fMxIntenc);
    fMxIntenc.Tag:=0;
    fMxIntenc.ShowModal;
  End
  Else
    ShowMessage('Selecione uma compra antes de continuar!');
end;

procedure TfMxCompra.Compra1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end; 

procedure TfMxCompra.BitBtn2Click(Sender: TObject);
begin
  If Compra1.IsEmpty Then
  Begin
    ShowMessage('Selecione uma compra antes de continuar!');
    Exit;
  End;
  Application.CreateForm(TfMxPedComp, fMxPedComp);
  fMxPedComp.Tag:=0;
  fMxPedComp.Showmodal;
end;


procedure TfMxCompra.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxCompra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   If SB_Salva.Enabled=true then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxCompra.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
 key := chr(8);
end;

procedure TfMxCompra.FormShow(Sender: TObject);
begin
DM.Usuario1.ConfiguraTela(fMxCompra);
end;

procedure TfMxCompra.BitBtn4Click(Sender: TObject);
begin
  Application.CreateForm(Trpt_prev_vendas, rpt_prev_vendas);
  rpt_prev_vendas.report.Preview;
end;

procedure TfMxCompra.BitBtn5Click(Sender: TObject);
begin
  Application.CreateForm(Trpt_pendencia_reposicao, rpt_pendencia_reposicao);
  rpt_pendencia_reposicao.report.Preview;
end;

procedure TfMxCompra.BitBtn8Click(Sender: TObject);
begin
  Application.CreateForm(Trpt_Procura_Mercadoria, rpt_Procura_Mercadoria);
  rpt_Procura_Mercadoria.report.Preview;
end;

procedure TfMxCompra.BitBtn7Click(Sender: TObject);
begin
 Application.CreateForm(Trpt_Data,rpt_Data);
 rpt_Data.Tag:=10;
 rpt_Data.ShowModal;
end;

procedure TfMxCompra.BitBtn6Click(Sender: TObject);
begin
  Application.CreateForm(Trpt_SugestaoCmp, rpt_SugestaoCmp);
  rpt_SugestaoCmp.report.Preview;
end;


end.
