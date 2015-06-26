
unit UComissao2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Titulo_receber, Vendedor, Parametro, funcoes;

type
  Trpt_Comissao2 = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    zrb_detalhe: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRBand5: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel20: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRLabel26: TSZRLabel;
    zrlFiltros: TSZRLabel;
    SZRLabel1: TSZRLabel;
    Titulo_receber1: TTitulo_receber;
    ZRLabel7: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRDBText3: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    Vendedor1: TVendedor;
    SZRLabel4: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRDBText5: TSZRDBText;
    zrlUsuario: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    Parametro1: TParametro;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRDBText4: TSZRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrb_detalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TTitulo_receber;
    Total, TotalCom: Double;
    vVista, vPrazo, vCartao: Double;
  end;

var
  rpt_Comissao2: Trpt_Comissao2;

implementation
Uses
  UDM;
{$R *.DFM}

procedure Trpt_Comissao2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure Trpt_Comissao2.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_Comissao2.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel26.Caption:=Format('%.2f',[Total]);
  SZRLabel1.Caption:=Format('%.2f',[TotalCom]);
  //
  SZRLabel20.Caption:=Format('%.2f',[vVista]);
  SZRLabel21.Caption:=Format('%.2f',[vPrazo]);
  SZRLabel22.Caption:=Format('%.2f',[vCartao]);
end;

procedure Trpt_Comissao2.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  Total:=Total+Entidade.ValorPG+Entidade.CredCli;
  TotalCom:=TotalCom+(Entidade.ValorPG*Vendedor1.PerAbaixo/100);
  //
  if zrb_detalhe.Height = 0 then
    Exit;
  //
  SZRLabel14.Caption :=Format('%.2f',[Entidade.ValorPG+Entidade.CredCli]);
  SZRLabel4.Caption:=Format('%.2f',[Entidade.ValorPG*Vendedor1.PerAbaixo/100]);
  //
  if (Entidade.FieldByName('PDV_TIPO_PAG').AsInteger = 5) or   //Dinheiro
     (Entidade.FieldByName('PDV_TIPO_PAG').AsInteger = 6) then //Cheque
  begin
    if Entidade.FieldByName('FPG_CODIGO').AsInteger = 1 then //A Vista
    begin
      SZRLabel16.Caption := 'A VISTA';
      vVista := vVista + Entidade.ValorPG+Entidade.CredCli;
    end
    else
    begin
      SZRLabel16.Caption := 'A PRAZO';
      vPrazo := vPrazo + Entidade.ValorPG+Entidade.CredCli;
    end;
  end
  else
  begin
    Parametro1.Close;
    Parametro1.ParamByName('PAR_CODIGO').asInteger := Entidade.FieldByName('PDV_TIPO_PAG').AsInteger;
    Parametro1.Open;
    SZRLabel16.Caption := Parametro1.FieldByName('PAR_DESCRICAO').asString;
    vCartao := vCartao + Entidade.ValorPG+Entidade.CredCli;
  end;
end;

procedure Trpt_Comissao2.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;  
end;

procedure Trpt_Comissao2.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  vVista := 0;
  vPrazo := 0;
  vCartao := 0;
end;

end.
