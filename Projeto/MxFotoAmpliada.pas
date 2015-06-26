unit MxFotoAmpliada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, JPEG;

type
  TfMxFotoAmpliada = class(TForm)
    Panel1: TPanel;
    imgFotoAmpliada: TImage;
    lblSemFoto: TLabel;
    memRodapeFoto: TMemo;
    procedure imgFotoAmpliadaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxFotoAmpliada: TfMxFotoAmpliada;

implementation

uses UDM;

{$R *.DFM}

procedure TfMxFotoAmpliada.imgFotoAmpliadaClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxFotoAmpliada.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfMxFotoAmpliada.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Close;
end;

procedure TfMxFotoAmpliada.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
