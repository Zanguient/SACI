unit untTransferirCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, DB, DBTables, SQuery, Funcionario, Buttons,
  Cobranca_por_Cobrador, Grids, DBGrids, ExtCtrls;

type
  TfrmTransferirCobranca = class(TForm)
    DBGrid1: TDBGrid;
    Cobranca_por_Cobrador1: TCobranca_por_Cobrador;
    DSCobranca_por_Cobrador1: TDataSource;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransferirCobranca: TfrmTransferirCobranca;

implementation

uses UDM, MxCobCobrador;

{$R *.dfm}

procedure TfrmTransferirCobranca.FormCreate(Sender: TObject);
begin
  Cobranca_por_Cobrador1.Close;
  Cobranca_por_Cobrador1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
  Cobranca_por_Cobrador1.Open;
end;

procedure TfrmTransferirCobranca.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    close;
end;

procedure TfrmTransferirCobranca.BitBtn1Click(Sender: TObject);
begin
  try
    if DM.Configuracao1.TipoCobranca = 1 then  //Centralizado
    begin
      DM.QueryExec.Close;
      DM.QueryExec.SQL.Text := 'UPDATE ITEM_DE_COBRANCA_COBRADOR SET CPC_CODIGO = '''+inttostr(Cobranca_por_Cobrador1.FieldByName('CPC_CODIGO').AsInteger)+''''+
                               ', CNC_CODIGO = '''+inttostr(Cobranca_por_Cobrador1.FieldByName('CNC_CODIGO').AsInteger)+''' WHERE ICC_CODIGO = '''+inttostr(fMxCobCobrador.Titulo_receber1.FieldByName('ICC_CODIGO').AsInteger)+'''';
      DM.QueryExec.ExecSQL;
    end
    else
    begin
      DM.QueryExec.Close;
      DM.QueryExec.SQL.Text := 'UPDATE TITULO_A_RECEBER SET CPC_CODIGO = '''+inttostr(Cobranca_por_Cobrador1.FieldByName('CPC_CODIGO').AsInteger)+''''+
                               ', CNC_CODIGO = '''+inttostr(Cobranca_por_Cobrador1.FieldByName('CNC_CODIGO').AsInteger)+'''  WHERE CLI_CODIGO = '''+inttostr(fMxCobCobrador.Titulo_receber1.FieldByName('CLI_CODIGO').AsInteger)+''''+
                               ' AND TRC_SITUACAO < 2';
      DM.QueryExec.ExecSQL;
    end;
  except
  end;
  close;
end;

procedure TfrmTransferirCobranca.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
