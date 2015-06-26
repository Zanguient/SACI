unit UAux;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, AdvGrid, StdCtrls, ExtCtrls, Gabarito;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    Button1: TButton;
    Gabarito1: TGabarito;
    procedure tadvstringgrid1GetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}


procedure TForm1.tadvstringgrid1GetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
//  if (Acol>0) and (ARow>0) then
//    abrush.Color:=clBlue;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Gabarito1.Insere(5);
end;


end.
