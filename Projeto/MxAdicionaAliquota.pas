unit MxAdicionaAliquota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask;

type
  TfMxAdicionaAliquota = class(TForm)
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Bevel1: TBevel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxAdicionaAliquota: TfMxAdicionaAliquota;

implementation

uses UPrinc2, UDM;

{$R *.DFM}

procedure TfMxAdicionaAliquota.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxAdicionaAliquota.BitBtn1Click(Sender: TObject);
var
  iSituacao:Integer;
begin
  If RadioButton1.Checked = True Then
    iSituacao := 0
  Else 
    iSituacao := 1;
//  SIAC.ImpFiscalB1.AdicionaAliquota(StrToFloat(MaskEdit1.Text),iSituacao);
//  if SIAC.ImpFiscalB1.IRetorno = 1 then
//    Close;
end;

procedure TfMxAdicionaAliquota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfMxAdicionaAliquota.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
