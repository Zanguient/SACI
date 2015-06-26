unit MxSelRegVisitado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask;

type
  TfmxSelRegVisitado = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Bevel1: TBevel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmxSelRegVisitado: TfmxSelRegVisitado;

implementation

uses UDM, funcoes, MxRetCobrador;

{$R *.DFM}


procedure TfmxSelRegVisitado.BitBtn1Click(Sender: TObject);
begin
  if not VerificaDataBranco(MaskEdit1.Text) then
    Raise Exception.Create(MaskEdit1.Text);
  with fMxRetCobr do
  Begin
    Titulo_Receber2.Close;
    Titulo_Receber2.ParamByName('CNC_CODIGO').asInteger:=Titulo_receber1.CodigoCNC;
    Titulo_Receber2.ParamByName('TRC_CODIGO').asInteger:=Titulo_receber1.CodigoTRC;
    Titulo_Receber2.Open;
    If RadioButton1.Checked then
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_RGB_VISITADO=1 '+
        ',TRC_RGB_DT_VISITADO="'+MesDia(MaskEdit1.Text)+'" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CLI_CODIGO='+IntToStr(fMxRetCobr.Titulo_Receber2.CodigoCLI)+
        ' AND CNC_CODIGO='+IntToStr(fMxRetCobr.Titulo_Receber2.CodigoCNC)+
        ' AND CPC_CODIGO='+IntToStr(fMxRetCobr.Titulo_Receber2.CodigoCPC))
    else If RadioButton2.Checked then
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_RGB_VISITADO=1 '+
        ',TRC_RGB_DT_VISITADO="'+MesDia(MaskEdit1.Text)+'" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(fMxRetCobr.Titulo_Receber2.CodigoCNC)+
        ' AND CPC_CODIGO='+IntToStr(fMxRetCobr.Titulo_Receber2.CodigoCPC));
    Titulo_Receber2.Close;
    Titulo_Receber2.ParamByName('CNC_CODIGO').asInteger:=Titulo_receber1.CodigoCNC;
    Titulo_Receber2.ParamByName('TRC_CODIGO').asInteger:=Titulo_receber1.CodigoTRC;
    Titulo_Receber2.Open;
    CheckBox1.Checked:=Titulo_Receber2.Visitado;
    if Titulo_Receber1.DtPromessa = 0 then
      MaskEdit2.Clear
    else
      MaskEdit2.Text:=FormatDateTime('dd/mm/yyyy', Titulo_Receber2.DtPromessa);
    Memo1.Lines.Text:=Titulo_Receber1.OBS;
  end;
end;

procedure TfmxSelRegVisitado.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmxSelRegVisitado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfmxSelRegVisitado.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  MaskEdit1.Text:=DateToStr(DM.Configuracao1.Data);
end;

end.
