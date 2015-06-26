unit MxReducaoUltima;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DrLabel, Printers;

type
  TfMxReducaoUltima = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Tempo:TDateTime;
  end;

var
  fMxReducaoUltima: TfMxReducaoUltima;

implementation
uses UPrinc2, funcoes, UDM;
{$R *.DFM}

procedure TfMxReducaoUltima.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfMxReducaoUltima.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxReducaoUltima.FormShow(Sender: TObject);
var
  Recebe:string;
  i : integer;
begin
  DM.Usuario1.AlteraCorComponentes(self);
//  Recebe := Trim(SIAC.ImpFiscalB1.RetornoReducaoZUltima);
//  Memo1.Lines.Text := Recebe;
//  exit;
  if Recebe = '' then
    Exit;
  Memo1.Lines.Add(' #################### REDUÇÃO #####################');
  if copy(Recebe,1,2) = '00' then
    Memo1.Lines.Add(' Redução Executada por Comando')
  else
    Memo1.Lines.Add(' Redução Executada Automaticamente');
  try
    Memo1.Lines.Add(' Data do Movimento:'+PreencheEspacoEsq(10,formatDateTime('dd/mm/yyyy',StrToDate(copy(Recebe,596,2)+'/'+copy(Recebe,598,2)+'/'+copy(Recebe,600,2)))));
  except
    Memo1.Lines.Add(' Data do Movimento:                      00/00/0000');
  end;
  Memo1.Lines.Add(' ------------------- CONTADORES -------------------');
  Memo1.Lines.Add(' Contador de ordem de operação:'+PreencheEspacoEsq(20,IntToStr(StrToInt(copy(Recebe,579,6)))));
  Memo1.Lines.Add(' Contador de operações não sujeitas ao ICMS:'+PreencheEspacoEsq(7,IntToStr(StrToInt(copy(Recebe,586,6)))));
  Memo1.Lines.Add(' ------------- TOTALIZADORES  FISCAIS -------------');
  Memo1.Lines.Add(' GRANDE TOTAL     (GT) R$'+PreencheEspacoEsq(26,format('%.2f',[StrToFloat(copy(Recebe,04,18))/100])));
  Memo1.Lines.Add(' Cancelamentos     (*) R$'+PreencheEspacoEsq(26,format('%.2f',[StrToFloat(copy(Recebe,23,14))/100])));
  Memo1.Lines.Add(' Descontos         (*) R$'+PreencheEspacoEsq(26,format('%.2f',[StrToFloat(copy(Recebe,38,14))/100])));
  Memo1.Lines.Add(' Acréscimo IOF     (*) R$'+PreencheEspacoEsq(26,format('%.2f',[StrToFloat(copy(Recebe,618,14))/100])));
  Memo1.Lines.Add(' Acréscimos        (*) R$'+PreencheEspacoEsq(26,format('%.2f',[StrToFloat(copy(Recebe,603,14))/100])));
  Memo1.Lines.Add(' ------------------- Tributados -------------------');
  Memo1.Lines.Add(' Valor         Acumulado( R$)          Imposto( R$)');
  Memo1.Lines.Add(PreencheEspacoEsq(6,format('%.2f',[StrToFloat(copy(Recebe,53,4))/100]))+'%*'+
    PreencheEspacoEsq(21,format('%.2f',[StrToFloat(copy(Recebe,118,14))/100]))+
    PreencheEspacoEsq(22,format('%.2f',[(StrToFloat(copy(Recebe,53,4))/100*StrToFloat(copy(Recebe,118,14))/100)/100])));
  For i := 1 to StrToInt(copy(Recebe,593,2))-1 do
    Memo1.Lines.Add(PreencheEspacoEsq(6,format('%.2f',[StrToFloat(copy(Recebe,53+(i*4),4))/100]))+'%*'+
      PreencheEspacoEsq(21,format('%.2f',[StrToFloat(copy(Recebe,118+(i*14),14))/100]))+
      PreencheEspacoEsq(22,format('%.2f',[(StrToFloat(copy(Recebe,53+(i*4),4))/100*StrToFloat(copy(Recebe,118+(i*14),14))/100)/100])));

  Memo1.Lines.Add(' ----------------- Não Tributados -----------------');
  Memo1.Lines.Add(' SUBSTITUIÇÃO TRIB.(*) R$'+PreencheEspacoEsq(26,format('%.2f',[StrToFloat(copy(Recebe,342,14))/100])));
  Memo1.Lines.Add(' ISENÇÃO           (*) R$'+PreencheEspacoEsq(26,format('%.2f',[StrToFloat(copy(Recebe,356,14))/100])));
  Memo1.Lines.Add(' NÃO INCIDÊNCIA    (*) R$'+PreencheEspacoEsq(26,format('%.2f',[StrToFloat(copy(Recebe,370,14))/100])));
  Memo1.Lines.Add(' ----------- TOTALIZADORES NÃO  FISCAIS -----------');
  Memo1.Lines.Add(' Nº Totalizador           CNF        Acumulado( R$)');
  Memo1.Lines.Add(' SANGRIA          '+PreencheEspacoEsq(33,format('%.2f',[StrToFloat(copy(Recebe,385,14))/100])));
  Memo1.Lines.Add(' SU SUPRIMENTO    '+PreencheEspacoEsq(33,format('%.2f',[StrToFloat(copy(Recebe,400,14))/100])));
  for i:=0 to 8 do
  Begin
    if StrToFloat(copy(Recebe,415+(i*14),14)) > 0 then
    Begin
      Memo1.Lines.Add(' '+PreencheZero(2,i+1)+
        PreencheEspacoEsq(26,'*'+copy(Recebe,542+(i*4),4))+
        PreencheEspacoEsq(22,format('%.2f',[StrToFloat(copy(Recebe,415+(i*14),14))/100])));
    end;
  end;
  Memo1.Lines.Add(' ##################################################');
end;

procedure TfMxReducaoUltima.SpeedButton1Click(Sender: TObject);
Var
  Arquiv:TextFile;
begin
  AssignPrn(Arquiv);
  Rewrite(Arquiv);
  Writeln(Arquiv,Memo1.Text);
  System.CloseFile(Arquiv);
end;

procedure TfMxReducaoUltima.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.
