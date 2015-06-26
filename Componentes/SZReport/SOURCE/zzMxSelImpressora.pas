unit MxSelImpressora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Registry;

type
  TfmxSelImpressora = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    CCRegistrado:integer;
  public
    { Public declarations }
  end;

var
  fmxSelImpressora: TfmxSelImpressora;

implementation

{$R *.DFM}


procedure TfmxSelImpressora.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmxSelImpressora.BitBtn1Click(Sender: TObject);
var
  FIniFile : TRegistry;
  Resultado : string;
begin
  FIniFile:=Nil;
  try
    StrToint(Edit1.Text);
    if StrToInt(Edit1.Text) = 0 then
      Resultado := 'C:\SACI\Texto\'
    else if (StrToInt(Edit1.Text) = CCRegistrado) then
      Resultado := 'C:\Impressao\Origem\'
    Else if StrToInt(Edit1.Text) < 10 then
      Resultado := '\\Micro-0'+IntToStr(StrToInt(Edit1.Text))+'\c\Impressao\Origem\'
    else
      Resultado := '\\Micro-'+IntToStr(StrToInt(Edit1.Text))+'\c\Impressao\Origem\';
    try
      FIniFile:=TRegIniFile.Create;
      FIniFile.RootKey:=HKEY_CURRENT_USER;
      FIniFile.OpenKey('SACI', false);
      FIniFile.OpenKey('Configuracao', false);
      if FIniFile.ReadString('CC') <> '' then
        FIniFile.WriteString('idPath',Resultado)
      else
      Begin
        FIniFile.OpenKey('Software', false);
        FIniFile.OpenKey('SACI', false);
        FIniFile.OpenKey('Configuracao', false);
        FIniFile.WriteString('idPath',Resultado)
      end;
    finally
      FIniFile.Free;
    end;
  except
    ShowMessage('Número do Micro inválido!');
  end;
end;

procedure TfmxSelImpressora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfmxSelImpressora.FormShow(Sender: TObject);
var
  Registro:TRegistry;
begin
  Registro:=TRegistry.Create;
  Registro.RootKey:=HKEY_CURRENT_USER;
  Registro.OpenKey('Saci', false);
  Registro.OpenKey('Configuracao', false);
  if Registro.ReadString('CC') <> '' then
    CCRegistrado := StrToInt(Registro.ReadString('CC'))
  else
  Begin
    Registro.OpenKey('Software', false);
    Registro.OpenKey('Saci', false);
    Registro.OpenKey('Configuracao', false);
    try
      CCRegistrado := StrToInt(Registro.ReadString('CC'));
    except
      CCRegistrado := -1;
    end;
  end;
end;

end.
