unit untCarta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmCarta = class(TForm)
    Panel5: TPanel;
    SB_Retorno: TSpeedButton;
    RichEdit1: TRichEdit;
    procedure SB_RetornoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCarta: TfrmCarta;

implementation

{$R *.dfm}

procedure TfrmCarta.SB_RetornoClick(Sender: TObject);
begin
  Close;
end;

end.
