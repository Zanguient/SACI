unit MxCalculoAdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfMxCaluloAdicao = class(TForm)
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    Panel1: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    edtESF_Sup: TEdit;
    edtESF_Inf: TEdit;
    edtCIL: TEdit;
    edtAdicao: TEdit;
    procedure SB_CancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure edtESF_InfChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxCaluloAdicao: TfMxCaluloAdicao;

implementation
uses
  UDM, Funcoes, MxServico;

{$R *.dfm}

procedure TfMxCaluloAdicao.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxCaluloAdicao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  Begin
    Key := #0;
    Close;
  end
  else if Key = #13 then
  Begin
    Key := #0;
    SB_ConfirmarClick(sender);
  end
  else if Key = '.' then
    Key := ',';
end;

procedure TfMxCaluloAdicao.SB_ConfirmarClick(Sender: TObject);
begin
  if tag = 0 then
    fmxServico.edtOD_ADICAO.Text := edtAdicao.Text
  else if tag = 1 then
    fmxServico.edtOE_ADICAO.Text := edtAdicao.Text
end;

procedure TfMxCaluloAdicao.edtESF_InfChange(Sender: TObject);
begin
  try
    if ((StrToFloat(edtESF_Sup.Text)>= 0) and (StrToFloat(edtESF_Inf.Text)>= 0)) or
       ((StrToFloat(edtESF_Sup.Text)<= 0) and (StrToFloat(edtESF_Inf.Text)<= 0)) then
      edtAdicao.Text := format('%.2f',[ABS(StrToFloat(edtESF_Sup.Text)-StrToFloat(edtESF_Inf.Text))])
    else
      edtAdicao.Text := format('%.2f',[ABS(StrToFloat(edtESF_Sup.Text)-StrToFloat(edtESF_Inf.Text))]);
  except
    edtAdicao.Text := '0';
  end;
end;

procedure TfMxCaluloAdicao.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  edtESF_Inf.SetFocus;
end;

procedure TfMxCaluloAdicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
