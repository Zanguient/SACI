unit MxCalculaTroco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfMxCalculaTroco = class(TForm)
    Panel3: TPanel;
    edtPago: TEdit;
    Panel2: TPanel;
    SB_Fechar: TBitBtn;
    Label1: TLabel;
    edtCompra: TEdit;
    Label2: TLabel;
    edtTroco: TEdit;
    Label3: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtPagoChange(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxCalculaTroco: TfMxCalculaTroco;

implementation

uses UDM;

{$R *.dfm}

procedure TfMxCalculaTroco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) or (key=#27) then
    Close;
end;

procedure TfMxCalculaTroco.edtPagoChange(Sender: TObject);
begin
  try
    edtTroco.Text := format('%.2f',[StrToFloat(edtPago.Text)-StrToFloat(edtCompra.Text)]);
    if StrToFloat(edtTroco.Text) < 0 then
      edtTroco.Text := '-';
  except
    edtTroco.Text := '-';
  end;
end;

procedure TfMxCalculaTroco.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxCalculaTroco.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
