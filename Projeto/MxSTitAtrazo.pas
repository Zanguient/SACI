unit MxSTitAtrazo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask;

type
  TfMxTitAtrazo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxTitAtrazo: TfMxTitAtrazo;

implementation
Uses
  Funcoes, UTitAtrazo, UDM;
{$R *.DFM}



procedure TfMxTitAtrazo.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxTitAtrazo.BitBtn1Click(Sender: TObject);
begin
  If not VerificaInteiroBranco(Edit1.Text) then
    raise Exception.Create('Quantidade de dias inválida!');
  If not VerificaDataBranco(MaskEdit1.Text) then
    raise Exception.Create('Data de início inválida!');
  Application.CreateForm(Trpt_TitAtrazo, rpt_TitAtrazo);
  rpt_TitAtrazo.Titulo_receber1.Close;
  rpt_TitAtrazo.Titulo_receber1.ParamByName('TOTDIAS').AsDateTime := DM.Configuracao1.Data-StrToInt(Edit1.text);
  rpt_TitAtrazo.Titulo_receber1.ParamByName('DATAINI').AsDateTime := StrToDate(MaskEdit1.text);
  rpt_TitAtrazo.Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
  rpt_TitAtrazo.Titulo_receber1.Open;
  rpt_TitAtrazo.report.Preview;
end;

procedure TfMxTitAtrazo.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
