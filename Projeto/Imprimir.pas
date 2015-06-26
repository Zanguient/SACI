unit Imprimir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Spin, StdCtrls, ExtCtrls, Buttons;

type
  TMxImprimir = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    SpinEdit1: TSpinEdit;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MxImprimir: TMxImprimir;

implementation

{$R *.DFM}


procedure TMxImprimir.RadioButton2Click(Sender: TObject);
begin
   Edit1.Enabled:=False;
   Edit2.Enabled:=False;
   Edit1.Color:=clMenu;
   Edit2.Color:=clMenu;
end;

procedure TMxImprimir.RadioButton1Click(Sender: TObject);
begin
   Edit1.Enabled:=True;
   Edit2.Enabled:=True;
   Edit1.Color:=clWindow;
   Edit2.Color:=clWindow;
end;

end.
