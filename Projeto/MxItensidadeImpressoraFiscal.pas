unit MxItensidadeImpressoraFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfMxItensidadeImpressoraFiscal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxItensidadeImpressoraFiscal: TfMxItensidadeImpressoraFiscal;

implementation

uses UPrinc2, UDM;

{$R *.DFM}

procedure TfMxItensidadeImpressoraFiscal.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxItensidadeImpressoraFiscal.BitBtn1Click(Sender: TObject);
Var
  iForca: Integer;
Begin
  If RadioButton1.Checked = True Then
    iForca := 1
  Else If RadioButton2.Checked = True Then
    iForca := 2
  Else
    iForca := 3;
//  SIAC.ImpFiscalB1.ProgramaQualidadeImpressao(iForca);
//  if SIAC.ImpFiscalB1.IRetorno = 1 then
//    Close;
end;

procedure TfMxItensidadeImpressoraFiscal.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
