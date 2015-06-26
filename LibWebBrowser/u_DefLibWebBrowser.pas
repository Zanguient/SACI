unit u_DefLibWebBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms;

  function WEB_ShowWebBrowser(APP: TApplication; sTelaURL, sTelaCaption: PChar; iTelaWidth, iTelaHeight, iTelaTop, iTelaLeft: integer): Boolean; stdcall; External 'LibWebBrowser.dll';

implementation

end.
