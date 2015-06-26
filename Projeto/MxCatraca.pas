unit MxCatraca;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Variants;

type
  TfMxCatraca = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtNumero: TEdit;
    edtSelo: TEdit;
    edtSerie: TEdit;
    edtSubSerie: TEdit;
    BitBtn1: TBitBtn;
    Catraca: TQuery;
    Label2: TLabel;
    edtAidf: TEdit;
    Label7: TLabel;
    edtMarca: TEdit;
    Label8: TLabel;
    edtBoleto: TEdit;
    Label9: TLabel;
    Panel3: TPanel;
    rdgNota: TRadioButton;
    rdgSerieD: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgNotaClick(Sender: TObject);
    procedure edtNumeroChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    TravarRadio:Boolean;
    { Public declarations }
  end;

var
  fMxCatraca: TfMxCatraca;

implementation

uses funcoes, UDM;
{$R *.DFM}


procedure TfMxCatraca.FormShow(Sender: TObject);
Begin
  DM.Usuario1.AlteraCorComponentes(self);
  rdgNotaClick(sender);
  edtNumero.SetFocus;
end;

procedure TfMxCatraca.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxCatraca.BitBtn1Click(Sender: TObject);
var
  mensagem:string;
  Trans: Boolean;
begin
  mensagem:='';
  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise Exception.Create('Não pode alterar catracas de outro Centro de Custo!');
  if not VerificaInteiroBranco(edtNumero.Text) then
    mensagem:=mensagem+'Número da Nota Fiscal inválido!'+#13;
  if not VerificaInteiroBranco(edtSelo.Text) then
    mensagem:=mensagem+'Selo da Nota Fiscal inválido!'+#13;
  if edtSerie.Text = '' then
    mensagem:=mensagem+'Série da Nota Fiscal inválido!'+#13;
//  if Edit4.Text = '' then
//    mensagem:=mensagem+'SubSérie da Nota Fiscal inválido!'+#13;
  if not VerificaInteiroBranco(edtAidf.Text) then
    mensagem:=mensagem+'AIDF da Nota Fiscal inválido!'+#13;
//  if Edit6.Text = '' then
//    mensagem:=mensagem+'Marca da Nota Fiscal inválido!'+#13;
  if not VerificaInteiroBranco(edtBoleto.Text) then
    mensagem:=mensagem+'Número do Boleto Bancário inválido!'+#13;
  if mensagem <> '' then
  Begin
    ShowMessage(mensagem);
    exit;
  end;
  if ((StrToFloat(edtNumero.Text)+50) < Catraca.FieldByName('CTR_NOTA_FISCAL').asInteger) and
     (StrToFloat(edtNumero.Text)<>0) and (Catraca.FieldByName('CTR_NOTA_FISCAL').asInteger <> 0) then
    Raise Exception.Create('Número da Nota Fiscal muito diferente do anterior, verifique!');
  if ((StrToFloat(edtNumero.Text)-50) > Catraca.FieldByName('CTR_NOTA_FISCAL').asInteger) and
     (StrToFloat(edtNumero.Text)<>0) and (Catraca.FieldByName('CTR_NOTA_FISCAL').asInteger <> 0) then
    Raise Exception.Create('Número da Nota Fiscal muito diferente do anterior, verifique!');
  if ((StrToFloat(edtSelo.Text)+50) < Catraca.FieldByName('CTR_NOTA_SELO').asInteger) and
     (StrToFloat(edtSelo.Text)<>0) and (Catraca.FieldByName('CTR_NOTA_SELO').asInteger <> 0) then
    Raise Exception.Create('Número do Selo Fiscal muito diferente do anterior, verifique!');
  if ((StrToFloat(edtSelo.Text)-50) > Catraca.FieldByName('CTR_NOTA_SELO').asInteger) and
     (StrToFloat(edtSelo.Text)<>0) and (Catraca.FieldByName('CTR_NOTA_SELO').asInteger <> 0) then
    Raise Exception.Create('Número do Selo Fiscal muito diferente do anterior, verifique!');
  if ((StrToFloat(edtBoleto.Text)+20) < Catraca.FieldByName('CTR_BOLETO').asInteger) and
     (StrToFloat(edtBoleto.Text)<>0) and (Catraca.FieldByName('CTR_BOLETO').asInteger <> 0) then
    Raise Exception.Create('Número do Boleto Bancário muito diferente do anterior, verifique!');
  if ((StrToFloat(edtBoleto.Text)-20) > Catraca.FieldByName('CTR_BOLETO').asInteger) and
     (StrToFloat(edtBoleto.Text)<>0) and (Catraca.FieldByName('CTR_BOLETO').asInteger <> 0) then
    Raise Exception.Create('Número do Boleto Bancário muito diferente do anterior, verifique!');

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if rdgNota.Checked then
        ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
           'CTR_NOTA_FISCAL='+edtNumero.Text+
           ',CTR_NOTA_SELO='+edtSelo.Text+
           ',CTR_NOTA_SERIE="'+edtSerie.Text+'" '+
           ',CTR_NOTA_SUBSERIE="'+edtSubSerie.Text+'" '+
           ',CTR_NOTA_AIDF='+edtAidf.Text+
           ',CTR_NOTA_MARCA="'+edtMarca.Text+'" '+
           ',CTR_BOLETO='+edtBoleto.Text+
           ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
           ' AND CTR_TIPO_NOTA=0')
      else
        ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
           'CTR_NOTA_FISCAL='+edtNumero.Text+
           ',CTR_NOTA_SELO='+edtSelo.Text+
           ',CTR_NOTA_SERIE="'+edtSerie.Text+'" '+
           ',CTR_NOTA_SUBSERIE="'+edtSubSerie.Text+'" '+
           ',CTR_NOTA_AIDF='+edtAidf.Text+
           ',CTR_NOTA_MARCA="'+edtMarca.Text+'" '+
           ',CTR_BOLETO='+edtBoleto.Text+
           ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
           ' AND CTR_TIPO_NOTA=1');

      if not DM.Usuario1.GeraLog(4610, DM.Configuracao1.CodigoCNC, 0,
             'Nota:'+edtNumero.Text+' Selo:'+edtSelo.Text) then
      Begin
        SHowMessage('Falha ao gerar LOG!');
        Raise Exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;

  Close;
end;

procedure TfMxCatraca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Catraca.Close;
  Action:=caFree;
end;

procedure TfMxCatraca.rdgNotaClick(Sender: TObject);
var
  Valor1,Valor2,Valor3,Valor4:Integer;
begin
  Valor1 := 0;
  Valor2 := 0;
  Valor3 := 0;
  Valor4 := 0;

  ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
    ' CTR_TIPO_NOTA=0 '+
    ',CTR_SITUACAO=0 '+
    ' WHERE CTR_TIPO_NOTA IS NULL');

  if rdgNota.Checked then
  Begin
    Catraca.Close;
    Catraca.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
    Catraca.ParamByName('CTR_TIPO_NOTA').asInteger:=0;
    Catraca.Open;
    if Catraca.IsEmpty then
    Begin
      ExecutaSQL(DM.QR_Comandos,'INSERT INTO CATRACA VALUES ('+
        IntToStr(DM.Configuracao1.CodigoCNC)+',1,1,"AC","",1,"",1,0,0)');
      Catraca.Close;
      Catraca.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
      Catraca.ParamByName('CTR_TIPO_NOTA').asInteger:=0;
      Catraca.Open;
    end;
    edtBoleto.Enabled := True; // sem Boleto
    edtSelo.Enabled := True; // com Selo
  end
  else
  Begin
    Catraca.Close;
    Catraca.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
    Catraca.ParamByName('CTR_TIPO_NOTA').asInteger:=1;
    Catraca.Open;
    if Catraca.IsEmpty then
    Begin
      ExecutaSQL(DM.QR_Comandos,'INSERT INTO CATRACA VALUES ('+
        IntToStr(DM.Configuracao1.CodigoCNC)+',1,0,"D","",1,"",1,1,0)');
      Catraca.Close;
      Catraca.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
      Catraca.ParamByName('CTR_TIPO_NOTA').asInteger:=1;
      Catraca.Open;
    end;
    edtBoleto.Enabled := False; // sem Boleto
    edtSelo.Enabled := False; // sem Selo
  end;

  try
    if Catraca.FieldByName('CTR_NOTA_FISCAL').asInteger <> null then
      Valor1:=Catraca.FieldByName('CTR_NOTA_FISCAL').asInteger;
  except
    ShowMessage('Erro em Número Nota Fiscal!');
  end;
  try
    if Catraca.FieldByName('CTR_NOTA_SELO').asInteger <> null then
      Valor2:=Catraca.FieldByName('CTR_NOTA_SELO').asInteger;
  except
    ShowMessage('Erro em Selo Nota Fiscal!');
  end;
  try
    if Catraca.FieldByName('CTR_NOTA_AIDF').asInteger <> null then
      Valor3:=Catraca.FieldByName('CTR_NOTA_AIDF').asInteger;
  except
    ShowMessage('Erro em AIDF Nota Fiscal!');
  end;
  try
    if Catraca.FieldByName('CTR_BOLETO').asInteger <> null then
      Valor4:=Catraca.FieldByName('CTR_BOLETO').asInteger;
  except
    ShowMessage('Erro no Boleto Bancário!');
  end;

  TravarRadio := False;
  edtNumero.Text:=IntToStr(Valor1);
  edtSelo.Text:=IntToStr(Valor2);
  edtSerie.Text:=Catraca.FieldByName('CTR_NOTA_SERIE').asString;
  edtSubSerie.Text:=Catraca.FieldByName('CTR_NOTA_SUBSERIE').asString;
  edtAidf.Text:=IntToStr(Valor3);
  edtMarca.Text:=Catraca.FieldByName('CTR_NOTA_MARCA').asString;
  edtBoleto.Text:=IntToStr(Valor4);
  TravarRadio := True;

end;

procedure TfMxCatraca.edtNumeroChange(Sender: TObject);
begin
  if TravarRadio then
  Begin
    rdgNota.Enabled := False;
    rdgSerieD.Enabled := False;
  end;
end;

procedure TfMxCatraca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn1Click(BitBtn1);

  if key = #27 then
    close;
end;

end.
