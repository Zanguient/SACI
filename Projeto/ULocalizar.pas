unit ULocalizar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfLocalizar = class(TForm)
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Button1: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLocalizar: TfLocalizar;

implementation
Uses CdCliente;
{$R *.DFM}

procedure TfLocalizar.Edit1Change(Sender: TObject);
begin
  If Edit1.text<>'' then
    If RadioGroup1.ItemIndex=0 then
      fCadCli.cliente1.LocalizarCod(1,StrToInt(Edit1.text))
    Else
      fCadCli.cliente1.Localizarnome(Edit1.text);
end;

procedure TfLocalizar.Button1Click(Sender: TObject);
begin
  close;
end;

end.
