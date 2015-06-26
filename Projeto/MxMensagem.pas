unit MxMensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Printers;

type
  TfMxMensagem = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxMensagem: TfMxMensagem;

implementation

uses UDM;

{$R *.DFM}


procedure TfMxMensagem.BitBtn2Click(Sender: TObject);
begin
  Close;
end;    

procedure TfMxMensagem.BitBtn3Click(Sender: TObject);
Var
  Arquiv:TextFile;
begin
  AssignPrn(Arquiv);
  Rewrite(Arquiv);
  Writeln(Arquiv,Memo1.Text);
  System.CloseFile(Arquiv);
end;

procedure TfMxMensagem.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TfMxMensagem.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
