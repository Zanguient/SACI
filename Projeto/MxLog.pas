unit MxLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Log, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, SQuery,
  Usuario, DBCtrls, Buttons;

type
  TfMxLog = class(TForm)
    DBGrid1: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DSLog: TDataSource;
    Log1: TLog;
    RadioGroup1: TRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    Usuario1: TUsuario;
    DSUsuario1: TDataSource;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Log1BeforeOpen(DataSet: TDataSet);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure Usuario1BeforeOpen(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxLog: TfMxLog;

implementation
Uses
  UDM, Urpt_Log;

{$R *.DFM}


procedure TfMxLog.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date:=DM.Configuracao1.Data;
  Log1.Open;
end;

procedure TfMxLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Log1.Close;
 Usuario1.Close;
 Action := cafree;
end;

procedure TfMxLog.DateTimePicker1Change(Sender: TObject);
begin
  Log1.Close;
  Log1.Open;
end;

procedure TfMxLog.Log1BeforeOpen(DataSet: TDataSet);
begin
  Log1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
  Log1.ParamByName('DATAINI').AsDateTime := Trunc(DateTimePicker1.Date);
  Log1.ParamByName('DATAFIM').AsDateTime := Trunc(DateTimePicker1.Date+1);
end;

procedure TfMxLog.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1 then
  Begin
    Usuario1.Close;
    Usuario1.Open;
    DBLookupComboBox1.KeyValue:=0;
    DBLookupComboBox1.Enabled:=True;
    DBLookupComboBox1.SetFocus;
    Log1.Close;
  end
  else
  Begin
    Usuario1.Close;
    DBLookupComboBox1.Enabled:=False;
    Log1.Close;
    Log1.SQL.Text:='SELECT DISTINCT T1.*, T2.OPS_OPERACAO, T3.MDL_DESCRICAO,'+
      'T4.SML_DESCRICAO, T5.USU_NOME '+
      'FROM Log T1, Operacao_do_Sistema T2, Modulo T3, Submodulo T4, Usuario T5 '+
      'WHERE(T1.CNC_CODIGO=:CNC_CODIGO) AND (T5.CNC_CODIGO=T1.CNC_CODIGO) AND '+
      '(T1.OPS_CODIGO = T2.OPS_CODIGO) AND (T2.SML_CODIGO = T4.SML_CODIGO) AND '+
      '(T4.MDL_CODIGO = T3.MDL_CODIGO) AND (T1.USU_CODIGO = T5.USU_CODIGO) AND '+
      '(T1.LOG_DATA_HORA>=:DATAINI) AND (T1.LOG_DATA_HORA<:DATAFIM) '+
      'ORDER BY T1.LOG_CODIGO DESC ';
    Log1.Open;
  end;
end;

procedure TfMxLog.DBLookupComboBox1Click(Sender: TObject);
begin
  if DBLookupComboBox1.KeyValue > 0 then
  Begin
    Log1.Close;
    Log1.SQL.Text:='SELECT DISTINCT T1.*, T2.OPS_OPERACAO, T3.MDL_DESCRICAO,'+
      'T4.SML_DESCRICAO, T5.USU_NOME '+
      'FROM Log T1, Operacao_do_Sistema T2, Modulo T3, Submodulo T4, Usuario T5 '+
      'WHERE(T1.CNC_CODIGO=:CNC_CODIGO) AND (T5.CNC_CODIGO=T1.CNC_CODIGO) AND '+
      '(T1.USU_CODIGO='+IntToStr(DBLookupComboBox1.KeyValue)+') AND '+
      '(T1.OPS_CODIGO = T2.OPS_CODIGO) AND (T2.SML_CODIGO = T4.SML_CODIGO) AND '+
      '(T4.MDL_CODIGO = T3.MDL_CODIGO) AND (T1.USU_CODIGO = T5.USU_CODIGO) AND '+
      '(T1.LOG_DATA_HORA>=:DATAINI) AND (T1.LOG_DATA_HORA<:DATAFIM) '+
      'ORDER BY T1.LOG_CODIGO DESC ';
    Log1.Open;
  end;
end;

procedure TfMxLog.Usuario1BeforeOpen(DataSet: TDataSet);
begin
  Try
    Usuario1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxLog.SpeedButton1Click(Sender: TObject);
begin
  if Log1.IsEmpty then
    Raise Exception.Create('Relatório vazio!');
  Application.CreateForm(Trpt_Log, rpt_Log);
  rpt_Log.Log1.Close;
  if RadioGroup1.ItemIndex = 1 then
  Begin
    rpt_Log.Log1.SQL.Text:='SELECT DISTINCT T1.*, T2.OPS_OPERACAO, T3.MDL_DESCRICAO,'+
      'T4.SML_DESCRICAO, T5.USU_NOME '+
      'FROM Log T1, Operacao_do_Sistema T2, Modulo T3, Submodulo T4, Usuario T5 '+
      'WHERE(T1.CNC_CODIGO=:CNC_CODIGO) AND (T5.CNC_CODIGO=T1.CNC_CODIGO) AND '+
      '(T1.USU_CODIGO='+IntToStr(DBLookupComboBox1.KeyValue)+') AND '+
      '(T1.OPS_CODIGO = T2.OPS_CODIGO) AND (T2.SML_CODIGO = T4.SML_CODIGO) AND '+
      '(T4.MDL_CODIGO = T3.MDL_CODIGO) AND (T1.USU_CODIGO = T5.USU_CODIGO) AND '+
      '(T1.LOG_DATA_HORA>=:DATAINI) AND (T1.LOG_DATA_HORA<:DATAFIM) '+
      'ORDER BY T1.LOG_CODIGO DESC';
  end;
  rpt_Log.Log1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
  rpt_Log.Log1.ParamByName('DATAINI').AsDateTime := Trunc(DateTimePicker1.Date);
  rpt_Log.Log1.ParamByName('DATAFIM').AsDateTime := Trunc(DateTimePicker1.Date+1);
  rpt_Log.Log1.Open;
  rpt_Log.report.Preview;
  rpt_Log.Close;
end;

procedure TfMxLog.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

end.
