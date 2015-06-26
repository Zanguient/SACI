library LibWebBrowser;

uses
  SysUtils,
  Classes,
  Windows,
  Forms,
  Controls,
  u_WebBrowser in 'u_WebBrowser.pas' {frmWebBrowser},
  u_Framework in '..\Projeto\u_Framework.pas';

{$R *.res}

function WEB_ShowWebBrowser(APP: TApplication; sTelaURL, sTelaCaption: PChar; iTelaWidth, iTelaHeight, iTelaTop, iTelaLeft: integer): Boolean; stdcall;
begin
  Application := APP;
  Result := TfrmWebBrowser.ShowWebBrowser(sTelaURL, sTelaCaption, iTelaWidth, iTelaHeight, iTelaTop, iTelaLeft);
end;

Exports
  WEB_ShowWebBrowser;

begin
end.
