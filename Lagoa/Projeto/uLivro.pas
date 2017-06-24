unit uLivro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ComCtrls, ExtCtrls, DB, ADODB,
  Menus, StrUtils,uVariaveis;

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
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    ADOOcorrenciaPorteiro: TStringField;
    btnSair: TBitBtn;
    pmOcorrencia: TPopupMenu;
    EnviarEmailparaoSndico1: TMenuItem;
    procedure btnNovoClick(Sender: TObject);
    procedure dsOcorrenciaDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure DBGridOcorrenciaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EnviarEmailparaoSndico1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

uses uLivroOcorrencia, uMenu;

{$R *.dfm}

procedure TfrmLivro.btnNovoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmOcorrencia, frmOcorrencia);
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
var
  filtro: string;
begin
//  if NomeUsuarioLogado = 'ADM' then
//    filtro := ''
  mmMensagem.Clear;
  ADOOcorrencia.Close;
  ADOOcorrencia.SQL.Text :=  'SELECT * FROM OCORRENCIA ' +
                             ' WHERE DATAOCORRENCIA >= ''' + MesDia(aData - 1) + ''' AND DATAOCORRENCIA <= '''+ MesDia(aData + 1)+ ''' ORDER BY DATAOCORRENCIA DESC';
  ADOOcorrencia.Open;
end;

procedure TfrmLivro.dsOcorrenciaDataChange(Sender: TObject; Field: TField);
begin
  CarregaOcorrencia;
end;

procedure TfrmLivro.FormShow(Sender: TObject);
begin
  ConnectionLagoa.Connected := True;
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
  end
  else
  begin
    DBGridOcorrencia.Canvas.Font.Color := clNavy;
    DBGridOcorrencia.Canvas.Brush.Color := clSkyBlue;
  end;

  if gdSelected in State then
  begin
    DBGridOcorrencia.Canvas.Font.Color := clCream;
    DBGridOcorrencia.Canvas.Brush.Color := clNavy;
  end;   

  DBGridOcorrencia.Canvas.FillRect(Rect);
  DBGridOcorrencia.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmLivro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F2 then
    btnNovoClick(btnNovo);

  if key = VK_F5 then
    ConsultaOcorrencia(dtpData.Date);

  if key = VK_ESCAPE then
    Close;
end;

procedure TfrmLivro.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLivro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ConnectionLagoa.Connected := False;
  Action := cafree;
end;

procedure TfrmLivro.EnviarEmailparaoSndico1Click(Sender: TObject);
var
  bImportante: Boolean;
begin
  bImportante := ADOOcorrencia.FieldByName('IMPORTANTE').AsString = 'S';

  EnviaEmail(ADOOcorrencia.FieldByName('Porteiro').AsString,
             FormatDateTime('dd/mm/yyyy',ADOOcorrencia.FieldByName('DataOcorrencia').AsDatetime),
             FormatDateTime('hh:mm',ADOOcorrencia.FieldByName('DataOcorrencia').AsDatetime),
             ADOOcorrencia.FieldByName('Ocorrencia').AsString,
             bImportante, nil);
end;

procedure TfrmLivro.FormCreate(Sender: TObject);
begin
  ConnectionLagoa.ConnectionString := StringConexao;
  ConnectionLagoa.Connected := True;
end;

end.
