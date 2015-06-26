unit MXSelCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, DBTables, SQuery, CentroCusto, DBCtrls, ExtCtrls,
  IniFiles;

type
  TfMXSelCentroCusto = class(TForm)
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    dblCodigoCNC: TDBLookupComboBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    SpeedButton5: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMXSelCentroCusto: TfMXSelCentroCusto;

implementation

Uses UDM, funcoes, UPrinc2, MxPedCompra;

{$R *.DFM}

procedure TfMXSelCentroCusto.FormCreate(Sender: TObject);
begin
  CentroCusto1.Open;
end;

procedure TfMXSelCentroCusto.BitBtn1Click(Sender: TObject);
var
  ArqConf:TIniFile;
begin
  if tag = 0 then
  Begin
    With DM.Configuracao1 do
    Begin
      DM.CentroCusto1.GeraLog(2050,0,0,'49');
      CodigoCNC := dblCodigoCNC.KeyValue;

      DM.Configuracao1.Close;
      DM.Configuracao1.Open;

      DM.CentroCusto1.Close;
      DM.CentroCusto1.Open;
    End;

    SIAC.StatusBar1.Panels[1].Text:='  '+DM.CentroCusto1.RazaoSocial;
    if DM.Configuracao1.Empresa = empTodas then
    begin
      ArqConf := TIniFile.Create(cArquivoConfiguracao);
      try
        try
          ArqConf.WriteString('MAQUINA', 'CC', IntToStr(dblCodigoCNC.KeyValue));
        except
        end;
      finally
        ArqConf.Free;
      end;

      DM.Configuracao1.Close;
      DM.Configuracao1.Open;
    end;

  end
  else if self.Tag = 1 then
  Begin
    fMxPedComp.CentroTRF := dblCodigoCNC.KeyValue;
  end;
  close;
end;

procedure TfMXSelCentroCusto.SpeedButton5Click(Sender: TObject);
begin
  Close;
end;

procedure TfMXSelCentroCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfMXSelCentroCusto.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  dblCodigoCNC.KeyValue:=DM.Usuario1.CentroDeCusto;
end;

procedure TfMXSelCentroCusto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then
    SpeedButton5Click(sender);
end;

end.
