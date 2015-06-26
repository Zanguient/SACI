unit MxCalculadoraFrete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TfMxCalculadoraFrete = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtPrecoPorKilo: TEdit;
    edtSeccat: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtQuantidade: TEdit;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    Label6: TLabel;
    edtDespaxo: TEdit;
    Label9: TLabel;
    edtPedagio: TEdit;
    Label10: TLabel;
    edtSeguro: TEdit;
    Label11: TLabel;
    edtRR: TEdit;
    edtFretePeso: TEdit;
    edtSeguroTotal: TEdit;
    edtRRTotal: TEdit;
    Label12: TLabel;
    edtPesoUnit: TEdit;
    Label4: TLabel;
    edtPrecoUnit: TEdit;
    edtTotalAPagar: TEdit;
    Label5: TLabel;
    edtICMS: TEdit;
    Label7: TLabel;
    edtFrete: TEdit;
    Label8: TLabel;
    edtPercentualFrete: TEdit;
    Label13: TLabel;
    edtPesoTotal: TEdit;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    edtPrecoTotal: TEdit;
    edtFretePorUnidade: TEdit;
    Label17: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CalcularFrete;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxCalculadoraFrete: TfMxCalculadoraFrete;

implementation
uses funcoes, UDM;
{$R *.DFM}

procedure TfMxCalculadoraFrete.SpeedButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxCalculadoraFrete.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close
  else if key='.' then
    Key := ',';
end;

procedure TfMxCalculadoraFrete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxCalculadoraFrete.edtQuantidadeExit(Sender: TObject);
begin
  if not VerificaFloatBranco(TEdit(sender).Text) then
    TEdit(sender).Text := '0,00';

  CalcularFrete;
end;

procedure TfMxCalculadoraFrete.CalcularFrete;
begin
  try
    edtPesoTotal.Text := Format('%.2f',[StrToFloat(edtQuantidade.Text) * StrToFloat(edtPesoUnit.Text)]);
  except
    edtPesoTotal.Text := '0,00';
  end;

  try
    edtPrecoTotal.Text := Format('%.2f',[StrToFloat(edtQuantidade.Text) * StrToFloat(edtPrecoUnit.Text)]);
  except
    edtPrecoTotal.Text := '0,00';
  end;

  try
    edtFretePeso.Text := Format('%.2f',[StrToFloat(edtPrecoPorKilo.Text) * StrToFloat(edtPesoTotal.Text)]);
  except
    edtFretePeso.Text := '0,00';
  end;

  try
    edtSeguroTotal.Text := Format('%.2f',[StrToFloat(edtSeguro.Text) * StrToFloat(edtPrecoTotal.Text) / 100]);
  except
    edtSeguroTotal.Text := '0,00';
  end;

  try
    edtRRTotal.Text := Format('%.2f',[StrToFloat(edtRR.Text) * StrToFloat(edtPrecoTotal.Text) / 100]);
  except
    edtRRTotal.Text := '0,00';
  end;

  try
    edtTotalAPagar.Text := Format('%.2f',[(StrToFloat(edtFretePeso.Text) +
                            StrToFloat(edtSeccat.Text)+
                            StrToFloat(edtDespaxo.Text)+
                            StrToFloat(edtPedagio.Text)+
                            StrToFloat(edtSeguroTotal.Text)+
                            StrToFloat(edtRRTotal.Text))/0.93]);
  except
    edtTotalAPagar.Text := '0,00';
  end;

  try
    edtICMS.Text := Format('%.2f',[StrToFloat(edtTotalAPagar.Text) * 0.07]); //7% ICMS
  except
    edtICMS.Text := '0,00';
  end;

  try
    edtFrete.Text := Format('%.2f',[StrToFloat(edtTotalAPagar.Text) - StrToFloat(edtICMS.Text)]);
  except
    edtFrete.Text := '0,00';
  end;

  try
    edtFretePorUnidade.Text := Format('%.2f',[StrToFloat(edtFrete.Text) / StrToFloat(edtQuantidade.Text)]);
  except
    edtFretePorUnidade.Text := '0,00';
  end;

  try
    edtPercentualFrete.Text := Format('%.2f',[StrToFloat(edtFretePorUnidade.Text) / StrToFloat(edtPrecoUnit.Text) * 100]);
  except
    edtPercentualFrete.Text := '0,00';
  end;
end;

procedure TfMxCalculadoraFrete.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
