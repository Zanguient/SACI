unit u_BancoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmBancoContas = class(TForm)
    cbxBancos: TComboBox;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBancoContas: TfrmBancoContas;

implementation

{$R *.dfm}

end.
