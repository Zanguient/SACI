unit uLivro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ComCtrls, ExtCtrls, DB, ADODB;

type
  TfrmLivro = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    dtpData: TDateTimePicker;
    btnConsultar: TBitBtn;
    DBGridOcorrencia: TDBGrid;
    Label2: TLabel;
    btnNovo: TBitBtn;
    mmMensagem: TMemo;
    ConnectionLagoa: TADOConnection;
    ADOOcorrencia: TADOQuery;
    dsOcorrencia: TDataSource;
    ADOOcorrenciaID: TAutoIncField;
    ADOOcorrenciaDataOcorrencia: TDateTimeField;
    ADOOcorrenciaOcorrencia: TMemoField;
    ADOOcorrenciaIMPORTANTE: TStringField;
    Label3: TLabel;
    cbxPorteiro: TComboBox;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    ADOOcorrenciaPorteiro: TStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure dsOcorrenciaDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure DBGridOcorrenciaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure CarregaOcorrencia;
    procedure ConsultaOcorrencia(aData: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    function MesDia(Dat: string): String; overload;
    function MesDia(Dat:TDate):String; overload;
  end;

var
  frmLivro: TfrmLivro;

implementation

uses uLivroOcorrencia;

{$R *.dfm}

procedure TfrmLivro.btnNovoClick(Sender: TObject);
begin
  if cbxPorteiro.Text = '' then
  begin
    cbxPorteiro.SetFocus;
    raise Exception.Create('Informe o nome do porteiro!');
  end;

  Application.CreateForm(TfrmOcorrencia, frmOcorrencia);
  frmOcorrencia.sPorteiro := cbxPorteiro.Text;
  frmOcorrencia.ShowModal;
  frmOcorrencia.Free;

  ConsultaOcorrencia(dtpData.Date);
  DBGridOcorrencia.SetFocus;
end;

procedure TfrmLivro.CarregaOcorrencia;
begin
  mmMensagem.Lines.Clear;
  if ADOOcorrencia.FieldByName('OCORRENCIA').AsString <> '' then
  begin
    mmMensagem.Lines.Add('Porteiro: ' + ADOOcorrencia.FieldByName('PORTEIRO').AsString);
    mmMensagem.Lines.Add('Data/Hora: ' + ADOOcorrencia.FieldByName('DataOcorrencia').AsString);
    mmMensagem.Lines.Add('');
    mmMensagem.Lines.Add(ADOOcorrencia.FieldByName('OCORRENCIA').AsString);

    if ADOOcorrencia.FieldByName('IMPORTANTE').AsString = 'S' then
      mmMensagem.Font.Color := clRed
    else
      mmMensagem.Font.Color := clBlack;
  end;
end;

procedure TfrmLivro.ConsultaOcorrencia(aData: TDateTime);
begin
  mmMensagem.Clear;
  ADOOcorrencia.Close;
  ADOOcorrencia.SQL.Text :=  'SELECT * FROM OCORRENCIA ' +
                             ' WHERE DATAOCORRENCIA >= ''' + MesDia(aData - 1) + ''' AND DATAOCORRENCIA <= '''+ MesDia(aData + 1)+ ''' ORDER BY DATAOCORRENCIA';
  ADOOcorrencia.Open;
end;

procedure TfrmLivro.dsOcorrenciaDataChange(Sender: TObject; Field: TField);
begin
  CarregaOcorrencia;
end;

procedure TfrmLivro.FormShow(Sender: TObject);
var
  ArquivoPorteiro: string;
begin
  ConnectionLagoa.Connected := True;
  ArquivoPorteiro := 'C:\Lagoa\Porteiros.txt';
  if FileExists(ArquivoPorteiro) then
    cbxPorteiro.Items.LoadFromFile(ArquivoPorteiro);

  dtpData.Date := Now;
  ConsultaOcorrencia(dtpData.Date);
end;

function TfrmLivro.MesDia(Dat:string):String;
begin
  Result := Copy(Dat,4,3) + Copy(Dat,1,3) + Copy(Dat,7,4);
end;

function TfrmLivro.MesDia(Dat: TDate): String;
var
  Datastr:string;
begin
  Datastr := formatDateTime('dd/mm/yyyy',Dat);
  Result  := MesDia(Datastr);
end;

procedure TfrmLivro.btnConsultarClick(Sender: TObject);
begin
  ConsultaOcorrencia(dtpData.Date);
end;

procedure TfrmLivro.DBGridOcorrenciaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   if DBGridOcorrencia.DataSource.DataSet.FieldByName('IMPORTANTE').Value = 'S'   then
  begin
    DBGridOcorrencia.Canvas.Font.Color := clWhite;
    DBGridOcorrencia.Canvas.Brush.Color := clRed;
    DBGridOcorrencia.Canvas.FillRect(Rect);
    DBGridOcorrencia.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
    DBGridOcorrencia.Canvas.Font.Color := clNavy;
    DBGridOcorrencia.Canvas.Brush.Color := clSkyBlue;
    DBGridOcorrencia.Canvas.FillRect(Rect);
    DBGridOcorrencia.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmLivro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F2 then
    btnNovoClick(btnNovo);

  if key = VK_F5 then
    ConsultaOcorrencia(dtpData.Date);
end;

end.
