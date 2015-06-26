unit MxSelQtdEmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, CentroCusto, DBCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls;

type
  TfMxSelQtdEmbarque = class(TForm)
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit2: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelQtdEmbarque: TfMxSelQtdEmbarque;

implementation
uses UDM, funcoes, MxEmbarque;
{$R *.DFM}

procedure TfMxSelQtdEmbarque.BitBtn2Click(Sender: TObject);
begin
  fMxEmbarque.QtdEmbarque := -1;
  Close;
end;

procedure TfMxSelQtdEmbarque.RadioButton2Click(Sender: TObject);
begin
  if RadioButton2.Checked then
  Begin
    Edit1.Enabled := True;
    Edit1.Color   := clWindow;
    Edit1.Text    := Edit2.Text;
    Edit1.SetFocus;
  end
  else
  Begin
    Edit1.Enabled := False;
    Edit1.Clear;
    Edit1.Color   := AlteraCorComponentes;
  end;
end;

procedure TfMxSelQtdEmbarque.BitBtn1Click(Sender: TObject);
begin
  if not VerificaFloat(Edit1.Text) then
    Raise Exception.Create('Quantidade incorreta');
  if not VerificaFloat(Edit2.Text) then
    Raise Exception.Create('Quantidade incorreta');
  if RadioButton2.Checked then
  Begin
    if not VerificaFloatBranco(Edit1.Text) then
      Raise Exception.Create('Quantidade inválida!')
    else if StrToFloat(Edit1.Text) >= StrToFloat(Edit2.Text) then
      Raise Exception.Create('Quantidade maior ou igual a Total!');
    fMxEmbarque.QtdEmbarque := StrToFloat(Edit1.Text);
  end
  else
    fMxEmbarque.QtdEmbarque := StrToFloat(Edit2.Text);
  Close;
end;

procedure TfMxSelQtdEmbarque.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
