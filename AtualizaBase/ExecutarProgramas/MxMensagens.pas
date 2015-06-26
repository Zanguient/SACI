unit MxMensagens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfMxMensagens = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxMensagens: TfMxMensagens;

implementation

{$R *.DFM}

procedure TfMxMensagens.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
