unit UComisCobr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Item_Pedido_Venda, Funcionario,
  Secao, Produto, Titulo_receber, Cobranca_por_Cobrador, funcoes;

type
  Trpt_ComisCobr = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRGroup1: TSZRGroup;
    ZRBand5: TSZRBand;
    ZRLabel7: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRDBText5: TSZRDBText;
    ZRLabel20: TSZRLabel;
    ZRLabel26: TSZRLabel;
    Cliente1: TCliente;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    SZRLabel3: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRDBText1: TSZRDBText;
    zrbGrupoCLI: TSZRGroup;
    ZRLabel14: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel19: TSZRLabel;
    ZRLabel28: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel8: TSZRLabel;
    ZRLabel17: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel14: TSZRLabel;
    Cobranca_por_Cobrador1: TCobranca_por_Cobrador;
    SZRDBText2: TSZRDBText;
    SZRLabel12: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel19: TSZRLabel;
    SZRDBText4: TSZRDBText;
    ZRLabel24: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlUsuario: TSZRLabel;
    Copia_de_Cobranca_por_Cobrador1: TCobranca_por_Cobrador;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCLIBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Total,Comissao,TotalGeral,ComissaoGeral:Double;
    Entidade:TTitulo_Receber;
  end;

var
  rpt_ComisCobr: Trpt_ComisCobr;

implementation
Uses
  UDM;
{$R *.DFM}

procedure Trpt_ComisCobr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Titulo_receber1.Close;
  Cobranca_por_Cobrador1.Close;
  Cliente1.Close;
  Action := cafree;
end;

procedure Trpt_ComisCobr.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel3.Caption:='0';
  If Titulo_receber1.Situacao IN [2,3] then
  Begin
    Total:=Total+Titulo_receber1.ValorPG;
    TotalGeral:=TotalGeral+Titulo_receber1.ValorPG;
    If Titulo_receber1.Vencimento+60<Titulo_receber1.Pagamento then
    Begin
      Comissao := Comissao+Titulo_receber1.ValorPG*Cobranca_Por_Cobrador1.fieldbyname('FUN_Perc_Acima').AsFloat/100;
      SZRLabel3.Caption:=Format('%.2f',[Titulo_receber1.ValorPG*Cobranca_Por_Cobrador1.fieldbyname('FUN_Perc_Acima').AsFloat/100]);
      ComissaoGeral:=ComissaoGeral+Titulo_receber1.ValorPG*Cobranca_Por_Cobrador1.fieldbyname('FUN_Perc_Acima').AsFloat/100;
    End
    Else
    Begin
      Comissao := Comissao+Titulo_receber1.ValorPG*Cobranca_Por_Cobrador1.fieldbyname('FUN_Perc_Abaixo').AsFloat/100;
      SZRLabel3.Caption:=Format('%.2f',[Titulo_receber1.ValorPG*Cobranca_Por_Cobrador1.fieldbyname('FUN_Perc_Abaixo').AsFloat/100]);
      ComissaoGeral:=ComissaoGeral+Titulo_receber1.ValorPG*Cobranca_Por_Cobrador1.fieldbyname('FUN_Perc_Abaixo').AsFloat/100;
    End;
    SZRLabel9.Caption:='N';
  End
  Else
    SZRLabel9.Caption:='S';
  SZRLabel17.Caption:=format('%.2f',[Titulo_receber1.Valor]);
  SZRLabel10.Caption:=format('%.2f',[Titulo_receber1.ValorPG]);
end;


procedure Trpt_ComisCobr.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel26.Caption:=Format('%.2f',[Total]);
  SZRLabel2.Caption:=Format('%.2f',[Comissao]);
  Total:=0;
  Comissao:=0;
end;

procedure Trpt_ComisCobr.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_ComisCobr.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalGeral:=0;
  ComissaoGeral:=0;
end;

procedure Trpt_ComisCobr.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=0;
  Comissao:=0;
  Cobranca_por_Cobrador1.Close;

  //Cobranca_por_Cobrador1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  {T1.CNC_CODIGO=:CNC_CODIGO AND}

  Cobranca_por_Cobrador1.ParamByName('CPC_CODIGO').asInteger:=Titulo_receber1.CodigoCPC;
  Cobranca_por_Cobrador1.Open;
  SZRLabel14.Caption:=Cobranca_por_Cobrador1.FieldByName('FUN_NOME').asString;
end;

procedure Trpt_ComisCobr.zrbGrupoCLIBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Cliente1.Close;
  Cliente1.ParamByName('CNC_CODIGO').asInteger := Titulo_receber1.ClienteCNC;
  Cliente1.ParamByName('CLI_CODIGO').asInteger := Titulo_receber1.CodigoCLI;
  Cliente1.Open;
  SZRLabel13.Caption:=Cliente1.RazaoSocial;
  SZRLabel16.Caption:=Cliente1.Endereco;
  SZRLabel15.Caption:=Cliente1.Bairro;

end;

procedure Trpt_ComisCobr.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel22.Caption:=Format('%.2f',[TotalGeral]);
  SZRLabel24.Caption:=Format('%.2f',[ComissaoGeral]);
end;

procedure Trpt_ComisCobr.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;  
end;

procedure Trpt_ComisCobr.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
end;

end.
