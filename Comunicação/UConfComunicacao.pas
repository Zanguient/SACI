unit UConfComunicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmConfComunicacao = class(TForm)
    CheckBox1: TCheckBox;
    btnEnviar: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfComunicacao: TfrmConfComunicacao;

implementation

{$R *.dfm}

procedure TfrmConfComunicacao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
