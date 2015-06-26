unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Registry,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Registro:TRegIniFile;
  end;

var
  Form1: TForm1;

implementation
Const
  SECAO='Guerra';
{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Registro := TRegIniFile.Create('Guerra');

  Edit1.Text := Registro.ReadString(SECAO, 'caixa', '');


//  Edit1.text:=Registro.ReadString(HKEY_CURRENT_USER/Guerra, 'Caixa'; '0');

end;

end.
