unit MxSelIntMemFisc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfMxSelIntMemFisc = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit2: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelIntMemFisc: TfMxSelIntMemFisc;

implementation

uses funcoes, UPrinc2, UDM;

{$R *.DFM}



procedure TfMxSelIntMemFisc.BitBtn1Click(Sender: TObject);
var
  mensagem:string;
begin
  mensagem:='';
  if RadioButton1.Checked then
  begin
    if not VerificaData(MaskEdit1.Text) then
      mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
    if not VerificaData(MaskEdit2.Text) then
      mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
    if not VerificaDataBranco(MaskEdit1.Text)then
      mensagem:=mensagem+'Data inicial não pode ser em branco!'+#13;
    if not VerificaDataBranco(MaskEdit2.Text)then
      mensagem:=mensagem+'Data final não pode ser em branco!'+#13;
    if mensagem<>'' then
      raise exception.Create(mensagem);
    if StrToDateTime(MaskEdit2.Text) < StrToDateTime(MaskEdit1.Text) then
      raise exception.Create('Data final não pode ser menor que data inicial!');
//    SIAC.ImpFiscalB1.ImprimeMemoriaData(MaskEdit1.Text, MaskEdit2.Text);
  end
  else
  begin
    if not VerificaInteiroBranco(Edit1.Text) then
      mensagem:=mensagem+'Número de Início inválido!'+#13;
    if not VerificaInteiroBranco(Edit1.Text) then
      mensagem:=mensagem+'Número de Final inválido!'+#13;
    if mensagem<>'' then
      raise exception.Create(mensagem);
//    SIAC.ImpFiscalB1S.ImprimeMemoriaReducao(Edit1.Text , Edit2.Text);
  end
end;

procedure TfMxSelIntMemFisc.RadioButton1Click(Sender: TObject);
begin
  RadioButton2.Checked := False;
  Edit1.Color := AlteraCorComponentes;
  Edit1.Text := '';
  Edit1.Enabled := False;
  Edit2.Color := AlteraCorComponentes;
  Edit2.Text := '';
  Edit2.Enabled := False;
  MaskEdit1.Enabled := True;
  MaskEdit1.Color := clWhite;
  MaskEdit1.Text := '';
  MaskEdit2.Enabled := True;
  MaskEdit2.Color := clWhite;
  MaskEdit2.Text := '';
  MaskEdit1.SetFocus;
end;

procedure TfMxSelIntMemFisc.RadioButton2Click(Sender: TObject);
begin
  RadioButton1.Checked := False;
  Edit2.Color := clWhite;
  Edit2.Text := '';
  Edit2.Enabled := True;
  Edit1.Color := clWhite;
  Edit1.Text := '';
  Edit1.Enabled := True;
  MaskEdit2.Enabled := False;
  MaskEdit2.Color := AlteraCorComponentes;
  MaskEdit2.Text := '';
  MaskEdit1.Enabled := False;
  MaskEdit1.Color := AlteraCorComponentes;
  MaskEdit1.Text := '';
  Edit1.SetFocus;
end;


procedure TfMxSelIntMemFisc.FormShow(Sender: TObject);
begin
  MaskEdit1.SetFocus;
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
