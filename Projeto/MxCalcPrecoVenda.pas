unit MxCalcPrecoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfMxCalcPrecoVenda = class(TForm)
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label20: TLabel;
    Label27: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit14: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    BitBtn1: TBitBtn;
    Label23: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxCalcPrecoVenda: TfMxCalcPrecoVenda;

implementation
Uses funcoes, UDM;
{$R *.DFM}

procedure TfMxCalcPrecoVenda.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxCalcPrecoVenda.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
  DM.Usuario1.AlteraCorComponentes(self);
end;

procedure TfMxCalcPrecoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfMxCalcPrecoVenda.BitBtn1Click(Sender: TObject);
Var
  mensagem:String;
begin
  Mensagem:='';
  If not VerificaFloatBranco(Edit1.Text) then
    mensagem:=mensagem+'Valor Bruto da nota inválido!'+#13;
  If not VerificaFloatBranco(Edit2.Text) then
    Edit2.Text:='0,00';
  If not VerificaFloatBranco(Edit3.Text) then
    Edit3.Text:='0,00';
  If not VerificaFloatBranco(Edit5.Text) then
    mensagem:=mensagem+'Valor de ICM da nota inválido'+#13;
  If not VerificaFloatBranco(Edit4.Text) then
    mensagem:=mensagem+'Valor da Margem de lucro inválida!'+#13;
  If not VerificaFloatBranco(Edit7.Text) then
    mensagem:=mensagem+'Valor do preço bruto do item inválido'+#13;
  If not VerificaFloatBranco(Edit8.Text) then
    Edit8.Text:='0,00';
  If not VerificaFloatBranco(Edit9.Text) then
    Edit9.Text:='0,00';

  If mensagem<>'' then
    Raise Exception.Create(mensagem);

  Edit1.Text:=format('%.2f',[StrToFloat(Edit1.Text)]);
  Edit2.Text:=format('%.2f',[StrToFloat(Edit2.Text)]);
  Edit3.Text:=format('%.2f',[StrToFloat(Edit3.Text)]);
  Edit4.Text:=format('%.2f',[StrToFloat(Edit4.Text)]);
  Edit5.Text:=format('%.2f',[StrToFloat(Edit5.Text)]);
  Edit7.Text:=format('%.2f',[StrToFloat(Edit7.Text)]);
  Edit8.Text:=format('%.2f',[StrToFloat(Edit8.Text)]);
  Edit9.Text:=format('%.2f',[StrToFloat(Edit9.Text)]);

  Edit14.Text := Format('%.2f',[StrToFloat(Edit1.Text)-StrToFloat(Edit2.Text)+StrToFloat(Edit3.Text)]);
  Edit6.Text  := Format('%.2f',[((StrToFloat(Edit14.Text)+(((StrToFloat(Edit14.Text)-StrToFloat(Edit5.Text))*StrToFloat(Edit4.Text)/100)))/StrToFloat(Edit14.Text))]);
  Edit10.Text := Format('%.2f',[(StrToFloat(Edit7.Text)-StrToFloat(Edit8.Text)+StrToFloat(Edit9.Text))]);
  Edit12.text := Edit6.Text;
  Edit11.text := Edit10.Text;
  Edit13.Text := Format('%.2f',[StrToFloat(Edit11.Text)*StrToFloat(Edit12.Text)]);
end;

end.
