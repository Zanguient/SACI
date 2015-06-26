unit u_WebBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw;

type
  TfrmWebBrowser = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    class function ShowWebBrowser(sTelaURL, sTelaCaption: PChar; iTelaWidth, iTelaHeight, iTelaTop, iTelaLeft: integer): boolean;
  end;

var
  frmWebBrowser: TfrmWebBrowser;

implementation

{$R *.dfm}

{ TfrmWebBrowser }

class function TfrmWebBrowser.ShowWebBrowser(sTelaURL, sTelaCaption: PChar;
  iTelaWidth, iTelaHeight, iTelaTop, iTelaLeft: integer): boolean;
begin
  try
    frmWebBrowser := TfrmWebBrowser.Create(Application.MainForm);
    with frmWebBrowser do
    begin
      FormStyle    := fsMDIChild;
      Caption      := sTelaCaption;
      ClientWidth  := iTelaWidth;
      ClientHeight := iTelaHeight;
      Top          := iTelaTop;
      Left         := iTelaLeft;
      WebBrowser1.Navigate(sTelaURL);
      Show;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TfrmWebBrowser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
