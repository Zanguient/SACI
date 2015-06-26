unit MxSelCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask,
  Cobranca_por_Cobrador, SQuery, Grids, DBGrids, Funcionario;

type
  TfmxSelCobranca = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Cobranca_por_Cobrador1: TCobranca_por_Cobrador;
    DSCobranca_por_Cobrador: TDataSource;
    Cobranca_por_Cobrador1CPC_CODIGO: TIntegerField;
    Cobranca_por_Cobrador1CNC_CODIGO: TIntegerField;
    Cobranca_por_Cobrador1CPC_DATA: TDateTimeField;
    Cobranca_por_Cobrador1FUN_CODIGO: TIntegerField;
    Cobranca_por_Cobrador1CPC_SITUACAO: TIntegerField;
    Funcionario1: TFuncionario;
    Cobranca_por_Cobrador1Funcionario: TStringField;
    Cobranca_por_Cobrador1CPC_OBSERVACAO: TStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure Cobranca_por_Cobrador1BeforeOpen(DataSet: TDataSet);
    procedure Funcionario1BeforeOpen(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmxSelCobranca: TfmxSelCobranca;

implementation

uses UDM, funcoes, MxCobCobrador;

{$R *.DFM}

procedure TfmxSelCobranca.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmxSelCobranca.Cobranca_por_Cobrador1BeforeOpen(
  DataSet: TDataSet);
begin
  Cobranca_por_Cobrador1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
end;

procedure TfmxSelCobranca.Funcionario1BeforeOpen(DataSet: TDataSet);
begin
  Funcionario1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
end;

procedure TfmxSelCobranca.BitBtn1Click(Sender: TObject);
begin
  If not Cobranca_por_Cobrador1.IsEmpty then
  Begin
    fMxCobCobrador.Cobranca_por_Cobrador1.LocalizarCod(Cobranca_por_Cobrador1.CodigoCPC,Cobranca_por_Cobrador1.CodigoCNC);
    fMxCobCobrador.Cobranca_por_Cobrador1.CarregaDados;
  end
  Else
    raise Exception.Create('Registro não selecionado!');
end;

procedure TfmxSelCobranca.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Funcionario1.Active := True;
  Cobranca_por_Cobrador1.Active := True;
  Cobranca_por_Cobrador1.First;
end;

procedure TfmxSelCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cobranca_por_Cobrador1.Active := False;
  Funcionario1.Active := False;
end;

end.
