unit MxSaldoDev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Printers;

type
  TfMxSaldoDev = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    bitImprimir: TBitBtn;
    bitFechar: TBitBtn;
    procedure bitFecharClick(Sender: TObject);
    procedure bitImprimirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSaldoDev: TfMxSaldoDev;

implementation

uses UDM;

{$R *.DFM}


procedure TfMxSaldoDev.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSaldoDev.bitImprimirClick(Sender: TObject);
Var
  Arquiv:TextFile;
begin
  AssignPrn(Arquiv);
  Rewrite(Arquiv);
  Writeln(Arquiv,Memo1.Text);
  System.CloseFile(Arquiv);
end;

procedure TfMxSaldoDev.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  Begin
    key:=#0;
    bitFechar.SetFocus;
    bitFecharClick(sender);
  end;
end;

procedure TfMxSaldoDev.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
