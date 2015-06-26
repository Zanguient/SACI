unit MxMensagemTempo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DrLabel;

type
  TfMxMensagemTempo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DRLabel1: TDRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    mensagem:string;
  end;

var
  fMxMensagemTempo: TfMxMensagemTempo;

implementation

{$R *.DFM}

procedure TfMxMensagemTempo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfMxMensagemTempo.FormShow(Sender: TObject);
begin
  DRLabel1.Caption:=Mensagem;
end;

end.
