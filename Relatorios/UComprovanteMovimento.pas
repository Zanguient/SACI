unit UComprovanteMovimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Extenso, Pedido_de_Venda, Titulo_receber, CentroCusto,
  Movimento_Fisico, Movimento_Estoque_Comercial, Parametro, Produto;

type
  Trpt_ComprovanteMovimento = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlCodigo: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlTipoMEC: TSZRLabel;
    zrlSaldoMEC: TSZRLabel;
    zrlCodigoMEC: TSZRLabel;
    zrlDataMEC: TSZRLabel;
    zrlESMec: TSZRLabel;
    zrlCodigoEntradaMEC: TSZRLabel;
    zrlQuantidadeAntMEC: TSZRLabel;
    zrlQuantidadeMEC: TSZRLabel;
    zrlOBSMec: TSZRLabel;
    zrlTipoMEF: TSZRLabel;
    zrlSaldoMEF: TSZRLabel;
    zrlCodigoMEF: TSZRLabel;
    zrlDataMEF: TSZRLabel;
    zrlESMef: TSZRLabel;
    zrlCodigoEntradaMEF: TSZRLabel;
    zrlQuantidadeAntMEF: TSZRLabel;
    zrlQuantidadeMEF: TSZRLabel;
    zrlOBSMef: TSZRLabel;
    Parametro1: TParametro;
    Produto1: TProduto;
    zrlCodigoPRD: TSZRLabel;
    Movimento_Fisico1: TMovimento_Fisico;
    Movimento_Estoque_Comercial1: TMovimento_Estoque_Comercial;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_ComprovanteMovimento: Trpt_ComprovanteMovimento;

implementation

uses UDM, Funcoes;
{$R *.DFM}

procedure Trpt_ComprovanteMovimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Trpt_ComprovanteMovimento.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_ComprovanteMovimento.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;

  with Produto1 do
    zrlProduto.Caption   := '('+IntToStr(CodigoPRD)+')'+Descricao+' '+Unidade+' '+Referencia+' '+Marca;

  with Movimento_Fisico1 do
  Begin
    if not IsEmpty then
    Begin
      if Parametro1.CodigoPAR <> TipoMov then
      Begin
        Parametro1.Close;
        Parametro1.ParamByName('PAR_CODIGO').asInteger := TipoMov;
        Parametro1.Open;
      end;
      zrlCodigoMEF.Caption        := IntToStr(CodigoMEF);
      zrlDataMEF.Caption          := formatDateTime('DD/MM/YYYY HH:MM:SS',Data);
      zrlESMef.Caption            := Es;
      zrlTipoMEF.Caption          := Parametro1.Descricao;
      zrlCodigoEntradaMEF.Caption := IntToStr(CodigoEntrada);
      zrlQuantidadeAntMEF.Caption :=  format('%.2f',[Saldo]);
      zrlQuantidadeMEF.Caption    :=  format('%.2f',[Quantidade]);
      if Es = 'E' then
        zrlSaldoMEF.Caption := format('%.2f',[Saldo+Quantidade])
      else
        zrlSaldoMEF.Caption := format('%.2f',[Saldo-Quantidade]);
      zrlOBSMef.Caption := Observacao;
    end;
  end;

  with Movimento_Estoque_Comercial1 do
  Begin
    if not IsEmpty then
    Begin
      if Parametro1.CodigoPAR <> TipoMov then
      Begin
        Parametro1.Close;
        Parametro1.ParamByName('PAR_CODIGO').asInteger := TipoMov;
        Parametro1.Open;
      end;
      zrlCodigoMEC.Caption        := IntToStr(CodigoMEC);
      zrlDataMEC.Caption          := formatDateTime('DD/MM/YYYY HH:MM:SS',Data);
      zrlESMec.Caption            := Es;
      zrlTipoMEC.Caption          := Parametro1.Descricao;
      zrlCodigoEntradaMEC.Caption := IntToStr(EntCodigo);
      zrlQuantidadeAntMEC.Caption :=  format('%.2f',[Saldo]);
      zrlQuantidadeMEC.Caption    :=  format('%.2f',[Quantidade]);
      if Es = 'E' then
        zrlSaldoMEC.Caption := format('%.2f',[Saldo+Quantidade])
      else
        zrlSaldoMEC.Caption := format('%.2f',[Saldo-Quantidade]);
      zrlOBSMec.Caption := Observacao;
    end
    else
      SZRLabel1.Enabled := False;
  end;
end;

end.
