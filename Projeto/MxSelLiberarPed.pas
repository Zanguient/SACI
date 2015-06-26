unit MxSelLiberarPed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, funcoes;

type
  TfMxSelLiberarReg = class(TForm)
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
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
  fMxSelLiberarReg: TfMxSelLiberarReg;

implementation

uses UDM, MxCobCobrador;

{$R *.DFM}


procedure TfMxSelLiberarReg.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelLiberarReg.BitBtn1Click(Sender: TObject);
begin
  with fMxCobCobrador do
  Begin
    if RadioButton1.Checked then
    Begin
      if Titulo_Receber1.IsEmpty then
        raise Exception.Create('Cobrança sem registros!');
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_RGB_SITUACAO=0 '+
        ',CPC_CODIGO=0 '+
        ',TRC_RGB_DT_SITUACAO="'+MesDia(DM.Configuracao1.Data)+'" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE (TRC_SITUACAO IN (0,1,8)) '+
        ' AND TRC_RGB_DT_PROMESSA<="'+MesDia(DM.Configuracao1.Data)+'" '+
        ' AND CNC_CODIGO='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+
        ' AND CPC_CODIGO='+edtCodigoCPC.Text);
    end
    Else
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_RGB_SITUACAO=0 '+
        ',CPC_CODIGO=0 '+
        ',TRC_RGB_DT_SITUACAO="'+MesDia(DM.Configuracao1.Data)+'" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE (TRC_SITUACAO IN (0,1,8)) '+
        ' AND CNC_CODIGO='+IntToStr(fMxCobCobrador.dblCodigoCNC.KeyValue)+
        ' AND (TRC_RGB_DT_PROMESSA<="'+MesDia(DM.Configuracao1.Data)+'" '+
        ' OR TRC_RGB_DT_PROMESSA IS NULL)');
    Titulo_Receber1.Close;
    Titulo_Receber1.Open;
  end;
end;

procedure TfMxSelLiberarReg.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
