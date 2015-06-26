unit UMudaDataAPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFMXMudaDataAPagar = class(TForm)
    Panel1: TPanel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMXMudaDataAPagar: TFMXMudaDataAPagar;

implementation
Uses
  Funcoes,MxRetCobrador;
{$R *.DFM}


procedure TFMXMudaDataAPagar.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFMXMudaDataAPagar.BitBtn1Click(Sender: TObject);
begin
  If not VerificaDataBranco(MaskEdit1.Text) then
    raise Exception.Create('Data Inválida!');
  With fMxRetCobr.Registro_de_Cobranca1 do
  Begin
    Close;
    ParamByName('TRC_CODIGO').AsInteger :=fMxRetCobr.Titulo_receber1.CodigoTRC;
    ParamByName('CNC_TITULO').AsInteger :=fMxRetCobr.Titulo_receber1.CodigoCNC;
    Open;
    Edit;
    DtAPagar:=StrToDate(MaskEdit1.Text);
    Post;
  End;
  Close;
end;

procedure TFMXMudaDataAPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
