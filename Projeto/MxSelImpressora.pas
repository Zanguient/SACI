unit MxSelImpressora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, IniFiles;

type
  TfmxSelImpressora = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    Label1: TLabel;
    edtNomeMicro: TEdit;
    Label2: TLabel;
    procedure bitCancelarClick(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmxSelImpressora: TfmxSelImpressora;

implementation

uses funcoes;//, UDM;

{$R *.DFM}


procedure TfmxSelImpressora.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmxSelImpressora.bitConfirmarClick(Sender: TObject);
var
  F: TextFile;
  ArqConf:TIniFile;
  Resultado : string;
begin
  if not FileExists(cArquivoConfiguracao) then
  Begin
    AssignFile(F, cArquivoConfiguracao);
    Rewrite(F);
    CloseFile(F);
  end;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);  
  try
    Resultado := '';
    if (Trim(edtNomeMicro.Text) <> '') and
       (UpperCase(Trim(edtNomeMicro.Text)) <> 'LOCAL') then
    Begin
      Resultado := '\\'+UpperCase(Trim(edtNomeMicro.Text))+'\Impressao\Origem\';
      ArqConf.WriteString('MAQUINA', 'IdPath', Resultado);
      ArqConf.WriteString('MAQUINA', 'IdPrintType', '1');
    end
    else
    Begin
      ArqConf.WriteString('MAQUINA', 'IdPath', '');
      ArqConf.WriteString('MAQUINA', 'IdPrintType', '0');
    end;
  finally
    ArqConf.Free;
  end;
end;

procedure TfmxSelImpressora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfmxSelImpressora.FormShow(Sender: TObject);
var
  ArqConf:TIniFile;
  Endereco, Tipo : string;
begin
  //DM.Usuario1.AlteraCorComponentes(self);
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    Endereco := ArqConf.ReadString('MAQUINA', 'IdPath', '');
    Tipo     := ArqConf.ReadString('MAQUINA', 'IdPrintType', '0');
  finally
    ArqConf.Free;
  end;
  if Tipo = '1' then
  Begin
    if Endereco = 'C:\Impressao\Origem\' then
      edtNomeMicro.Text := 'LOCAL'
    else if Length(Endereco) > 2 then
    Begin
      Endereco := Copy(Endereco,3,Length(Endereco)-2);
      edtNomeMicro.Text := Copy(Endereco, 1, Pos('\', Endereco)-1);
    end
    else
      edtNomeMicro.Clear;
  end
  else
    edtNomeMicro.Clear;
end;

procedure TfmxSelImpressora.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    bitConfirmarClick(bitConfirmar);
end;

end.
