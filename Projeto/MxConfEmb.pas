unit MxConfEmb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfMxConfEmb = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Panel2: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit5: TEdit;
    Label5: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxConfEmb: TfMxConfEmb;

implementation
Uses
  funcoes, MxEmbarque, UDM;
{$R *.DFM}

procedure TfMxConfEmb.SpeedButton2Click(Sender: TObject);
Var
  mensagem:String;
begin
  mensagem:='';
  If not VerificafloatBranco(Edit5.Text) then
    mensagem := 'Quantidade desejada digitada incorretamente!'+#13;
  If StrToFloat(Edit3.Text)<StrToFloat(Edit5.Text) then
    mensagem := mensagem+'Quantidade a embarcar maior que a quantidade disponível!'+#13;
  If StrToFloat(Edit4.Text)<StrToFloat(Edit5.Text) then
    mensagem := mensagem+'Quantidade a embarcar maior que a quantidade desejada!';
  If mensagem<>'' then
    raise Exception.Create(mensagem);
//  fMxEmbarque.QntEmb:=StrToFloat(Edit5.Text);
  Close;
end;


procedure TfMxConfEmb.SpeedButton5Click(Sender: TObject);
begin
  fMxEmbarque.Cancelar:=True;
  Close;
end;

procedure TfMxConfEmb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfMxConfEmb.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
