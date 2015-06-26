unit u_Framework;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry;

  function NetFramework_v1: boolean;
  function NetFramework_v1_1: boolean;
  function NetFramework_v2: boolean;
  function NetFramework_v3: boolean;
  function NetFramework_v3_5: boolean;
  function NetFramework_v4: boolean;

implementation

function NetFrameworkInstalled(NetFrameWorkId:String): Boolean;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Result := Reg.KeyExists(NetFrameWorkId);
  finally
    Reg.Free;
  end
end;

function NetFramework_v1: boolean;
begin
  result := NetFrameworkInstalled('SOFTWARE\Microsoft\.NETFramework\policy\v1.0');
end;

function NetFramework_v1_1: boolean;
begin
  result := NetFrameworkInstalled('SOFTWARE\Microsoft\NET Framework Setup\NDP\v1.1.4322');
end;

function NetFramework_v2: boolean;
begin
  result := NetFrameworkInstalled('SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727');
end;

function NetFramework_v3: boolean;
begin
  result := NetFrameworkInstalled('SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.0');
end;

function NetFramework_v3_5: boolean;
begin
  result := NetFrameworkInstalled('SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5');
end;

function NetFramework_v4: boolean;
begin
  result := NetFrameworkInstalled('SOFTWARE\Microsoft\NET Framework Setup\NDP\v4');
end;

end.
 