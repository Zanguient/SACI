unit Udownload;

interface

uses
  Classes,Windows,ActnList,ExtActns,Sysutils,dialogs;

type
  download = class(TThread)
  url,filename : string;
  private
    procedure SetName;
    procedure URL_OnDownloadProgress(Sender: TDownLoadURL;
      Progress, ProgressMax: Cardinal;
      StatusCode: TURLDownloadStatus;
      StatusText: String; var Cancel: Boolean);
  protected
    procedure Execute; override;
end;

implementation

uses Main;
type
  TThreadNameInfo = record
  FType: LongWord; // must be 0x1000
  FName: PChar; // pointer to name (in user address space)
  FThreadID: LongWord; // thread ID (-1 indicates caller thread)
  FFlags: LongWord; // reserved for future use, must be zero
end;

{ download }

procedure download.SetName;
var
  ThreadNameInfo: TThreadNameInfo;
begin
  ThreadNameInfo.FType := $1000;
  ThreadNameInfo.FName := 'Tdownload';
  ThreadNameInfo.FThreadID := $FFFFFFFF;
  ThreadNameInfo.FFlags := 0;
  try
    RaiseException( $406D1388, 0, sizeof(ThreadNameInfo) div sizeof
      (LongWord), @ThreadNameInfo );
  except
  end;
end;

procedure download.Execute;
var
  agent: TDownLoadURL;
begin
  SetName;
  agent := TDownLoadURL.Create(nil);
  try
    agent.URL :=url;
    agent.Filename := filename;
    agent.OnDownloadProgress := URL_OnDownloadProgress;
    try
      agent.ExecuteTarget(nil);
    Except on e: Exception do
      // ShowMessage(e.message);
    end;
  finally
    agent.Free;
  end;
end;

procedure download.URL_OnDownloadProgress;
begin
  Cancel:=false;
//  form1.ProgressBar1.Max:= ProgressMax;
//  form1.ProgressBar1.Position:= Progress;
//  form1.status.SimpleText:=StatusText;
end;

end.

