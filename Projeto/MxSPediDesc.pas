unit MxSPediDesc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TfMxSPedDesc = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    edtProduto: TEdit;
    edtMarca: TEdit;
    Label18: TLabel;
    Label3: TLabel;
    edtUnidade: TEdit;
    Label21: TLabel;
    edtReferencia: TEdit;
    GroupBox1: TGroupBox;
    edtDescontoPercentual: TEdit;
    edtDescontoReal: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    edtPreco: TEdit;
    edtPrecoComDesconto: TEdit;
    Label4: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure edtDescontoPercentualChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure edtDescontoRealChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Temp:String;
    Cancelar:Boolean;
  end;

var
  fMxSPedDesc: TfMxSPedDesc;

implementation

uses
  DigSenha, UDM, MxSRecParcela, funcoes,
  MxPedidoRapido, MxPedidoMotCal, MxPacoteVenda;

{$R *.DFM}

procedure TfMxSPedDesc.edtDescontoPercentualChange(Sender: TObject);
Var
  Descont,Resultado:Double;
  Aux : TNotifyEvent;
begin
  Resultado := 0;
  Aux := edtDescontoReal.OnChange;
  edtDescontoReal.OnChange := nil;
  If TEdit(Sender).Text<>'' Then
  Begin
    If not VerificaFloatBranco(TEdit(Sender).Text) then
      Raise Exception.Create('Valor digitado incorretamente!');
    Descont := StrToFloat(TEdit(Sender).text);
  End
  Else
    Descont:=0;

  If Tag IN [4,5,6,7,8] then
  Begin
    Resultado := StrToFloat(edtPreco.Text)-StrToFloat(edtPreco.Text)*Descont/100;
    edtDescontoReal.Text :=Format('%.3f', [Descont*StrToFloat(edtPreco.Text)/100]);
  End
  Else If Tag=3 then
    Resultado := StrToFloat(fMxSRecPParc.edtValorDocumento.Text)-StrToFloat(fMxSRecPParc.edtValorDocumento.Text)*Descont/100;

  edtPrecoComDesconto.Text:= Format('%.2f', [Resultado]);
  edtDescontoReal.OnChange := Aux;
end;

procedure TfMxSPedDesc.BitBtn1Click(Sender: TObject);
Var
  Aux : TNotifyEvent;
begin
  Cancelar:=False;
//////////////////////////////////////////////////
  If Tag=3 then
  Begin
    fMxSRecPParc.edtDesconto.Text := Format('%.4f', [StrToFloat(fMxSRecPParc.edtValorDocumento.Text)-StrToFloat(edtDescontoReal.Text)]);
  End
///////////////////////////////////////////////////
  Else If Tag=4 then
  Begin
    If not cancelar Then
    Begin
      fMxPedidoRapido.edtPrecoDesconto.Text := edtPrecoComDesconto.Text;
      Aux:=fMxPedidoRapido.edtDesconto.OnChange;
      fMxPedidoRapido.edtDesconto.OnChange:=nil;
      fMxPedidoRapido.edtDesconto.Text := edtDescontoPercentual.Text;
      fMxPedidoRapido.edtDesconto.OnChange:=Aux;
      Close;
    End;
  end
  Else If Tag=5 then //Pedido Motical
  Begin
    If not cancelar Then
    Begin
      fMxPedidoMotCal.edtPrecoDesconto.Text := edtPrecoComDesconto.Text;
      Aux:=fMxPedidoMotCal.edtDesconto.OnChange;
      fMxPedidoMotCal.edtDesconto.OnChange:=nil;
      fMxPedidoMotCal.edtDesconto.Text := edtDescontoPercentual.Text;
      fMxPedidoMotCal.edtDesconto.OnChange:=Aux;
      Close;
    End;
  end
///////////////////////////////////////////////////
  Else If Tag=8 then
  Begin
    If not cancelar Then
    Begin
      fMxPacoteVenda.edtPrecoDesconto.Text := edtPrecoComDesconto.Text;
      Aux:=fMxPacoteVenda.edtDesconto.OnChange;
      fMxPacoteVenda.edtDesconto.OnChange:=nil;
      fMxPacoteVenda.edtDesconto.Text := edtDescontoPercentual.Text;
      fMxPacoteVenda.edtDesconto.OnChange:=Aux;
      Close;
    End;
  end;
end;

procedure TfMxSPedDesc.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  edtDescontoPercentual.SetFocus;
end;

procedure TfMxSPedDesc.RadioButton1Click(Sender: TObject);
begin
   edtDescontoPercentual.Color   := AlteraCorComponentes;
   edtDescontoPercentual.Enabled := false;
   edtDescontoReal.Color   := clwindow;
   edtDescontoReal.Enabled := true;
   edtDescontoReal.SetFocus;
end;

procedure TfMxSPedDesc.RadioButton2Click(Sender: TObject);
begin
  edtDescontoReal.Color   := AlteraCorComponentes;
  edtDescontoReal.Enabled := false;
  edtDescontoPercentual.Color   := clwindow;
  edtDescontoPercentual.Enabled := true;
  edtDescontoPercentual.SetFocus;
end;

procedure TfMxSPedDesc.edtDescontoRealChange(Sender: TObject);
Var
  Valor:Double;
  Aux:TNotifyEvent;
begin
  Aux := edtDescontoPercentual.OnChange;
  edtDescontoPercentual.OnChange := nil;
  If TEdit(Sender).Text<>'' then
  Begin
    If not VerificaFloatBranco(TEdit(Sender).Text) then
      Raise Exception.Create('Valor digitado incorretamente!');
    Valor := StrToFloat(TEdit(Sender).Text);
  End
  Else
    Valor := 0;

  If Tag IN [4,5,6,8] then
    If Valor<StrTofloat(edtPreco.Text) then
    Begin
      edtDescontoPercentual.Text := Format('%.4f', [100*Valor/StrToFloat(edtPreco.Text)]);
      edtPrecoComDesconto.Text := Format('%.2f', [StrToFloat(edtPreco.Text)-(StrToFloat(edtDescontoPercentual.Text)*StrToFloat(edtPreco.Text)/100)]);
    End
    Else
    Begin
      edtPreco.Text:=Temp;
      Showmessage('O valor em desconto não pode ser maior que o valor total!');
    End;

  edtDescontoPercentual.OnChange := Aux;
end;

procedure TfMxSPedDesc.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSPedDesc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close
  else if ((edtDescontoReal.Focused)or(edtDescontoPercentual.Focused))and(Key = '.') then
    Key := ',';
end;

end.
