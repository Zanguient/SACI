unit MxCalculaFrete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TfMxCalculaFrete = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Calcular: TSpeedButton;
    edtTotalFrete: TEdit;
    edtICMSFrete: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit18: TEdit;
    Edit35: TEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label6: TLabel;
    Edit2: TEdit;
    Edit19: TEdit;
    Edit36: TEdit;
    Edit3: TEdit;
    Edit20: TEdit;
    Edit37: TEdit;
    Edit4: TEdit;
    Edit21: TEdit;
    Edit38: TEdit;
    Edit5: TEdit;
    Edit22: TEdit;
    Edit39: TEdit;
    Edit6: TEdit;
    Edit23: TEdit;
    Edit40: TEdit;
    Edit7: TEdit;
    Edit24: TEdit;
    Edit41: TEdit;
    Edit8: TEdit;
    Edit25: TEdit;
    Edit42: TEdit;
    Edit9: TEdit;
    Edit26: TEdit;
    Edit43: TEdit;
    Edit10: TEdit;
    Edit27: TEdit;
    Edit44: TEdit;
    Edit11: TEdit;
    Edit28: TEdit;
    Edit45: TEdit;
    Edit12: TEdit;
    Edit46: TEdit;
    edtICMSCalculado: TEdit;
    edtFreteCalculado: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    Edit57: TEdit;
    Edit58: TEdit;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit61: TEdit;
    Edit62: TEdit;
    Edit63: TEdit;
    Label7: TLabel;
    Edit69: TEdit;
    Edit70: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit73: TEdit;
    Edit74: TEdit;
    Edit75: TEdit;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit78: TEdit;
    Edit79: TEdit;
    Edit80: TEdit;
    Label8: TLabel;
    Edit13: TEdit;
    Edit30: TEdit;
    Edit47: TEdit;
    Edit64: TEdit;
    Edit81: TEdit;
    Edit14: TEdit;
    Edit31: TEdit;
    Edit48: TEdit;
    Edit65: TEdit;
    Edit82: TEdit;
    Edit15: TEdit;
    Edit32: TEdit;
    Edit49: TEdit;
    Edit66: TEdit;
    Edit83: TEdit;
    Edit16: TEdit;
    Edit33: TEdit;
    Edit50: TEdit;
    Edit67: TEdit;
    Edit84: TEdit;
    Edit17: TEdit;
    Edit34: TEdit;
    Edit51: TEdit;
    Edit68: TEdit;
    Edit85: TEdit;
    Edit29: TEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SB_CalcularClick(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxCalculaFrete: TfMxCalculaFrete;

implementation

uses funcoes, UTelaCalculaFrete, UDM;

{$R *.DFM}

procedure TfMxCalculaFrete.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxCalculaFrete.SB_CalcularClick(Sender: TObject);
 var
  A, iMaior: Integer;
  WVlrTotNF, WVlrFrt, WVlrIcm, vMaior, vDiferenca, vDiferencaICMS: Double;
begin
  //LimpaCampos
  for A:=1 to self.ComponentCount-1 do
  begin
    if Components[A].Tag=1 then
    begin
      Tedit(Components[A+17]).Text := '';
      Tedit(Components[A+34]).Text := '';
      Tedit(Components[A+51]).Text := '';
      Tedit(Components[A+68]).Text := '';
    end;
  end;

  if not VerificaFloatBranco(edtTotalFrete.Text) then
     Raise Exception.Create('Valor Total do Frete deve ser Digitado!');
  if not VerificaFloatBranco(edtICMSFrete.Text) then
     Raise Exception.Create('Valor do ICMS do Frete deve ser Digitado!');

  edtTotalFrete.Text := format('%.2f',[StrToFloat(edtTotalFrete.Text)]);
  edtICMSFrete.Text := format('%.2f',[StrToFloat(edtICMSFrete.Text)]);

  WVlrTotNF:=0;
  WVlrFrt:=0;
  WVlrIcm:=0;
  Edit1.SetFocus;
  for A:=1 to 17 do
    begin
      if VerificaFloatBranco(TEdit(ActiveControl).Text) then
        if StrToFloat(Tedit(ActiveControl).Text)<>0 then
           begin
            WVlrTotNF:=Arredonda(WVlrTotNF+StrToFloat(Tedit(ActiveControl).Text));
            Perform(WM_NEXTDLGCTL,0,0);
          end;
    end;
  Edit1.SetFocus;
  vMaior := 0;
  iMaior := 0;
  for A:=1 to self.ComponentCount-1 do
  begin
    if Components[A].Tag=1 then
    Begin
      if VerificaFloatBranco(Tedit(Components[A]).Text) then
        if StrToFloat(Tedit(Components[A]).Text)<>0 then
        begin
          Tedit(Components[A]).Text := format('%.2f',[StrToFloat(Tedit(Components[A]).Text)]);
          Tedit(Components[A+17]).Text:=Format('%.2f',[(StrToFloat(edtTotalFrete.Text)*Arredonda(StrToFloat(Tedit(Components[A]).Text)/WVlrTotNF,3))]);
          Tedit(Components[A+34]).Text:=Format('%.2f',[(StrToFloat(edtICMSFrete.Text)*Arredonda(StrToFloat(Tedit(Components[A]).Text)/WVlrTotNF))]);
          Tedit(Components[A+51]).Text:=Format('%.3f',[StrToFloat(Tedit(Components[A+17]).Text)/StrToFloat(Tedit(Components[A]).Text)*100]);
          if StrToFloat(Tedit(Components[A+17]).Text) <> 0 then
            Tedit(Components[A+68]).Text:=Format('%.3f',[StrToFloat(Tedit(Components[A+34]).Text)/StrToFloat(Tedit(Components[A+17]).Text)*100])
          else
            Tedit(Components[A+68]).Text:='0,000';
          WVlrFrt:=WVlrFrt+StrToFloat(Tedit(Components[A+17]).Text);
          WVlrIcm:=WVlrIcm+StrToFloat(Tedit(Components[A+34]).Text);
          if StrToFloat(Tedit(Components[A]).Text) > vMaior then
          Begin
            iMaior := A;
            vMaior := StrToFloat(Tedit(Components[A]).Text);
          end;
        end;
    end;
  end;
  if (WVlrFrt <> StrToFloat(edtTotalFrete.Text)) or
     (WVlrIcm <> StrToFloat(edtICMSFrete.Text)) then
  Begin
    A := iMaior;
    vDiferenca := StrToFloat(edtTotalFrete.Text) - WVlrFrt;
    vDiferencaICMS := StrToFloat(edtICMSFrete.Text) - WVlrIcm;
    WVlrFrt:=WVlrFrt-Arredonda(StrToFloat(Tedit(Components[A+17]).Text));
    WVlrIcm:=WVlrIcm-Arredonda(StrToFloat(Tedit(Components[A+34]).Text));
    //Valor do Frete
    Tedit(Components[A+17]).Text:=Format('%.2f',[StrToFloat(Tedit(Components[A+17]).Text)+vDiferenca]);
    //Percentual do Frete
    Tedit(Components[A+51]).Text:=Format('%.3f',[StrToFloat(Tedit(Components[A+17]).Text)/StrToFloat(Tedit(Components[A]).Text)*100]);
    //Valor do ICMS Frete
    Tedit(Components[A+34]).Text:=Format('%.2f',[StrToFloat(Tedit(Components[A+34]).Text)+vDiferencaICMS]);
    //Percentual do ICMS Frete
    Tedit(Components[A+68]).Text:=Format('%.3f',[StrToFloat(Tedit(Components[A+34]).Text)/StrToFloat(Tedit(Components[A]).Text)*100]);
    WVlrFrt:=WVlrFrt+Arredonda(StrToFloat(Tedit(Components[A+17]).Text));
    WVlrIcm:=WVlrIcm+Arredonda(StrToFloat(Tedit(Components[A+34]).Text));
  end;
  edtFreteCalculado.Text:=Format('%.2f',[WVlrFrt]);
  edtICMSCalculado.Text:=Format('%.2f',[WVlrIcm]);
end;

procedure TfMxCalculaFrete.Edit2Exit(Sender: TObject);
var
  CI: Integer;
begin
  CI:=TEdit(ActiveControl).ComponentIndex-1;
  if (VerificaFloatBranco(TEdit(Components[CI]).Text)) and (not VerificaFloatBranco(TEdit(Components[CI-1]).Text)) then
    begin
      ShowMessage('Valor da Nota Anterior Vazia!');
      TEdit(Components[CI]).Clear;
      TEdit(Components[CI-1]).SetFocus;
    end;
end;

procedure TfMxCalculaFrete.SpeedButton3Click(Sender: TObject);
begin
  SB_CalcularClick(sender);
  Application.CreateForm(Trpt_TelaCalculaFrete, rpt_TelaCalculaFrete);
  rpt_TelaCalculaFrete.report.Preview;
  rpt_TelaCalculaFrete.Close;
end;

procedure TfMxCalculaFrete.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close
  else if key='.' then
    Key := ',';
end;

procedure TfMxCalculaFrete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxCalculaFrete.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
