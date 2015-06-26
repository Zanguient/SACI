unit MxAjustaPrecoCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, DBCtrls, ExtCtrls, Buttons, Db,
  Movimento_Estoque_Comercial, Produto, CentroCusto, DBTables, SQuery,
  Parametro, Item_de_Estoque, Usuario, Menus, Movimento_Fisico;

type
  TfMxAjustaPrecoCusto = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Label7: TLabel;
    edtPrecoCusto: TEdit;
    bitConfirmar: TBitBtn;
    BitBtn2: TBitBtn;
    Produto1: TProduto;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    edtReferencia: TEdit;
    edtMarca: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure bitConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure edtPrecoCustoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxAjustaPrecoCusto: TfMxAjustaPrecoCusto;

implementation
Uses
  UDM, MxSPediProd, funcoes, MxSPediProdMotCal;

{$R *.DFM}


procedure TfMxAjustaPrecoCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;


procedure TfMxAjustaPrecoCusto.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then 
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=37;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=37;
        ShowModal;
      end;
    end;
    edtPrecoCusto.SetFocus;
  End;
end;

procedure TfMxAjustaPrecoCusto.bitConfirmarClick(Sender: TObject);
var
  mensagem:string;
begin
  mensagem:='';
  If not VerificaInteiroBranco(edtCodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto Inválido!'+#13;
  If not VerificaFloatBranco(edtPrecoCusto.Text) then
    mensagem:=mensagem+'Preço Inválido!'+#13;
  if mensagem<>'' then
    raise Exception.Create(mensagem);

  if StrToFloat(edtPrecoCusto.Text) <= 0 then
  Begin
    If MessageDlg('Esse processo irá alterar o Preço de custo e Desativar o Produto!'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO SET '+
      ' PRD_CUSTO='+VirgPonto(edtPrecoCusto.Text)+
      ',PRD_SITUACAO=1 '+
      ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD.Text);
  end
  else
  Begin
    If MessageDlg('Esse processo irá alterar o Preço de custo do Produto!'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
    ExecutaSQL(DM.QR_Comandos,'UPDATE PRODUTO SET '+
      ' PRD_CUSTO='+VirgPonto(edtPrecoCusto.Text)+
      ',PRD_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE PRD_CODIGO='+edtCodigoPRD.Text);
  end;

  edtPrecoCusto.Clear;
  edtCodigoPRD.Clear;
  edtProduto.Clear;
  edtReferencia.Clear;
  edtMarca.Clear;
  edtCodigoPRD.SetFocus;
end;

procedure TfMxAjustaPrecoCusto.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxAjustaPrecoCusto.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    Label7.Caption := 'Preço Tabela';
    Caption := 'Ajustar Preço de Tabela';
  end;
  edtCodigoPRD.SetFocus;
end;

procedure TfMxAjustaPrecoCusto.edtCodigoPRDExit(Sender: TObject);
begin
  if BitBtn2.Focused then
    Exit;
  If not VerificaInteiroBranco(edtCodigoPRD.Text) then
    edtCodigoPRD.Text := '0';
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
  Produto1.Open;
  if not Produto1.IsEmpty then
  Begin
    edtProduto.text:=Produto1.Descricao;
    edtReferencia.text:=Produto1.Referencia;
    edtMarca.text:=Produto1.Marca;
    edtPrecoCusto.Text := format('%.2f',[Produto1.Custo]);
  End
  else
  begin
    edtProduto.Clear;
    edtReferencia.Clear;
    edtMarca.Clear;
    edtPrecoCusto.Clear;
    Showmessage('Produto inexistente!');
    edtCodigoPRD.SetFocus;
    Exit;
  end;
end;

procedure TfMxAjustaPrecoCusto.edtPrecoCustoKeyPress(Sender: TObject; var Key: Char);
begin
  if (edtPrecoCusto.Focused) and (Key = '.') then
    Key := ',';
end;

procedure TfMxAjustaPrecoCusto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  Begin
    if (edtCodigoPRD.Focused) then
      edtPrecoCusto.SetFocus
    else
      bitConfirmarClick(sender);
  end;
end;

procedure TfMxAjustaPrecoCusto.edtCodigoPRDChange(Sender: TObject);
begin
  edtPrecoCusto.Clear;
end;

end.
