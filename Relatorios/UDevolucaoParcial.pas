unit UDevolucaoParcial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls,
  Funcionario, CentroCusto, Item_de_Troca, Produto, Cliente;

type
  Trpt_DevolucaoParcial = class(TForm)
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
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    ZRGroup1: TSZRGroup;
    SZRLabel11: TSZRLabel;
    SZRLabel2: TSZRLabel;
    Funcionario1: TFuncionario;
    SZRLabel4: TSZRLabel;
    Item_de_Troca1: TItem_de_Troca;
    zrlProduto: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRDBText4: TSZRDBText;
    Produto1: TProduto;
    Item_de_Troca1TRO_CODIGO: TIntegerField;
    Item_de_Troca1PDV_CODIGO: TIntegerField;
    Item_de_Troca1CNC_CODIGO: TIntegerField;
    Item_de_Troca1USU_CODIGO: TIntegerField;
    Item_de_Troca1TRO_DATA: TDateTimeField;
    Item_de_Troca1TRO_MOTIVO: TStringField;
    Item_de_Troca1TRO_SITUACAO: TIntegerField;
    Item_de_Troca1TRO_NOTA_FISCAL: TIntegerField;
    Item_de_Troca1CNC_CODIGO_1: TIntegerField;
    Item_de_Troca1ITO_CODIGO: TIntegerField;
    Item_de_Troca1TRO_CODIGO_1: TIntegerField;
    Item_de_Troca1PRD_CODIGO: TIntegerField;
    Item_de_Troca1FUN_CODIGO: TIntegerField;
    Item_de_Troca1ITO_QUANTIDADE: TFloatField;
    Item_de_Troca1ITO_VALOR: TFloatField;
    Item_de_Troca1ITO_SITUACAO: TIntegerField;
    Item_de_Troca1ITO_ENTRASAI: TSmallintField;
    Item_de_Troca1PDV_CODIGO_1: TIntegerField;
    Item_de_Troca1ITO_DATA: TDateTimeField;
    Item_de_Troca1PDV_DATA_HORA: TDateTimeField;
    SZRLabel13: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    Item_de_Troca1CLI_CODIGO: TIntegerField;
    SZRGroup1: TSZRGroup;
    SZRDBText1: TSZRDBText;
    zrlCliente: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel17: TSZRLabel;
    Cliente1: TCliente;
    Item_de_Troca1CNC_CLIENTE: TIntegerField;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlTotalVendedor: TSZRLabel;
    SZRBand2: TSZRBand;
    SZRLabel21: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    zrlDescNota: TSZRLabel;
    SZRDBText6: TSZRDBText;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlDataTroca: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrb_detalheBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    TotalVendedor, TotalGeral:Double;
  end;

var
  rpt_DevolucaoParcial: Trpt_DevolucaoParcial;

implementation
Uses
  UDM, Funcoes, MxSelPedido;
{$R *.DFM}

procedure Trpt_DevolucaoParcial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Item_de_Troca1.Active := False;
  Action := cafree;
end;

procedure Trpt_DevolucaoParcial.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_DevolucaoParcial.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_DevolucaoParcial.ZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  TotalVendedor := 0;
  Funcionario1.Close;
  Funcionario1.ParamByName('FUN_CODIGO').asInteger:=Item_de_Troca1.CodigoFUN;
  Funcionario1.Open;
  SZRLabel2.Caption:=Funcionario1.Apelido+' ('+IntToStr(Funcionario1.CodigoFUN)+')';
end;

procedure Trpt_DevolucaoParcial.zrb_detalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlDataTroca.Caption := FormatDateTime('DD/MM/YYYY HH:MM',Item_de_Troca1.FieldByName('TRO_DATA').asDateTime);

  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> Item_de_Troca1.CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Item_de_Troca1.CodigoPRD;
      Open;
    end;
    zrlProduto.Caption := '('+IntToStr(CodigoPRD)+')'+Descricao+' '+Referencia;
  end;

  zrlQuantidade.Caption := format('%.2f',[Item_de_Troca1.Quantidade]);
  TotalVendedor:=TotalVendedor+(Item_de_Troca1.Quantidade*Item_de_Troca1.Preco);
  TotalGeral:=TotalGeral+(Item_de_Troca1.Quantidade*Item_de_Troca1.Preco);
  zrlTotalItem.Caption := format('%.2f',[Item_de_Troca1.Quantidade*Item_de_Troca1.Preco]);
end;

procedure Trpt_DevolucaoParcial.SZRGroup1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Cliente1 do
  Begin
    if (Item_de_Troca1.FieldByName('CNC_CLIENTE').AsInteger <> CodigoCNC) or
       (Item_de_Troca1.FieldByName('CLI_CODIGO').AsInteger <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=Item_de_Troca1.FieldByName('CNC_CLIENTE').AsInteger;
      ParamByName('CLI_CODIGO').asInteger:=Item_de_Troca1.FieldByName('CLI_CODIGO').AsInteger;
      Open;
    end;
    zrlCliente.Caption := '('+IntToStr(Item_de_Troca1.FieldByName('CLI_CODIGO').AsInteger)+')'+RazaoSocial;
  end;

end;

procedure Trpt_DevolucaoParcial.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalVendedor.Caption := format('%.2f',[TotalVendedor]);
  TotalVendedor := 0;
end;

procedure Trpt_DevolucaoParcial.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalGeral.Caption := format('%.2f',[TotalGeral]);
  TotalGeral := 0;
end;

procedure Trpt_DevolucaoParcial.FormCreate(Sender: TObject);
begin
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    with Funcionario1 do
    Begin
      Close;
      SQL.Text := 'SELECT FUN_CODIGO,FUN_APELIDO '+
        ' FROM FUNCIONARIO '+
        ' WHERE FUN_CODIGO=:FUN_CODIGO ';
    end;
  end;
end;

procedure Trpt_DevolucaoParcial.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption   := EmpresaDesenvolvedora;  
end;

end.
