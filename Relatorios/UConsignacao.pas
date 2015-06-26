unit UConsignacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Variants, Titulo_receber,
  AgenteFin, Forma_de_Pagamento, Funcionario, Parametro, Cliente, Produto,
  Item_de_Consignacao, CentroCusto, consignacao;

type
  Trpt_Consignacao = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrlTituloRelatorio: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel5: TSZRLabel;
    zrbDetalhe: TSZRBand;
    ZRDBText10: TSZRDBText;
    zrlProduto: TSZRLabel;
    zrlCodigoPRD: TSZRLabel;
    zrlTotalItem: TSZRLabel;
    zrlbRodapePagina: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrbParcelas: TSZRBand;
    ZRLabel4: TSZRLabel;
    ZRLabel11: TSZRLabel;
    zrlAssinatura: TSZRLabel;
    zrbCabecalhoPedido: TSZRGroup;
    ZRLabel24: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel19: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlDescEndereco: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCidade: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    zrlDescObservacao: TSZRLabel;
    zrlDescRG: TSZRLabel;
    zrlRGCGF: TSZRLabel;
    SZRLabel34: TSZRLabel;
    zrlCPFCNPJ: TSZRLabel;
    SZRLabel36: TSZRLabel;
    zrlFone: TSZRLabel;
    SZRLabel38: TSZRLabel;
    zrlDataNascimento: TSZRLabel;
    zrlDescSituacao: TSZRLabel;
    zrlSituacao: TSZRLabel;
    SZRLabel47: TSZRLabel;
    zrlDescCliente: TSZRLabel;
    zrlDescCodigoPDV: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel64: TSZRLabel;
    zrlCEP: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel27: TSZRLabel;
    zrlFax: TSZRLabel;
    SZRLabel46: TSZRLabel;
    zrlCelular: TSZRLabel;
    zrlObservacao: TSZRLabel;
    szrVendedor: TSZRLabel;
    zrlVendedor: TSZRLabel;
    Item_de_Consignacao1: TItem_de_Consignacao;
    Consignacao1: TConsignacao;
    Cliente1: TCliente;
    Produto1: TProduto;
    Funcionario1: TFuncionario;
    zrlTotalConsignacao: TSZRLabel;
    zrlValorItem: TSZRLabel;
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrlbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbCabecalhoPedidoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbParcelasBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TItem_de_Consignacao;
  end;

var
  rpt_Consignacao: Trpt_Consignacao;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_Consignacao.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Consignacao.zrlbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption  := EmpresaDesenvolvedora;
end;

procedure Trpt_Consignacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Produto1.Close;
  Cliente1.Close;
  Action := cafree;
end;

procedure Trpt_Consignacao.FormCreate(Sender: TObject);
begin
  Entidade := Item_de_Consignacao1;
end;

procedure Trpt_Consignacao.zrbCabecalhoPedidoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Funcionario1 do
  Begin
    if (Consignacao1.CodigoFUN <> CodigoFUN) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Consignacao1.CodigoFUN;
      Open;
    end;
    zrlVendedor.Caption := Apelido;
  end;
  
  with Cliente1 do
  Begin
    if (Consignacao1.FieldByName('CLI_CODIGO').asInteger <> CodigoCLI)  then
    Begin
      Close;
      ParamByName('CLI_CODIGO').asInteger:=Consignacao1.FieldByName('CLI_CODIGO').asInteger;
      ParamByName('CNC_CODIGO').asInteger:=Consignacao1.FieldByName('CNC_CODIGO').asInteger;
      Open;
    end;
    zrlCliente.Caption:=RazaoSocial+' ('+IntToStr(CodigoCLI)+')';
    zrlFone.Caption:=Fone;
    zrlFax.Caption:=Fax;
    zrlCelular.Caption:=Celular;
    zrlRGCGF.Caption:=CGFRG;
    zrlCPFCNPJ.Caption:=CPFCGC;
    if DataNascimento > 0 then
      zrlDataNascimento.Caption:=formatDateTime('dd/mm/yyyy',DataNascimento)
    else
      zrlDataNascimento.Caption:='';

    zrlEndereco.Caption := Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);

    zrlBairro.Caption:=Bairro;
    zrlCidade.Caption:=Trim(Cidade)+'/'+Trim(Uf);
    zrlCEP.Caption := CEP;

    zrlObservacao.Caption := Consignacao1.FieldByName('CSG_OBSERVACAO').asString;

    if DM.Configuracao1.Empresa = 1 then
    Begin
      zrlObservacao.Caption := zrlObservacao.Caption + Trim(Referencia1);
      if (zrlObservacao.Caption <> '') then
        zrlObservacao.Caption := zrlObservacao.Caption + ' / ';
      zrlObservacao.Caption := zrlObservacao.Caption + Referencia2;
      if (zrlObservacao.Caption <> '') then
        zrlObservacao.Caption := zrlObservacao.Caption + ' / ';
      zrlObservacao.Caption := zrlObservacao.Caption + Referencia3;
      if (zrlObservacao.Caption <> '') then
        zrlObservacao.Caption := zrlObservacao.Caption + ' / ';
      zrlObservacao.Caption := zrlObservacao.Caption + OBS + ' ';
    end;
  end;
end;

procedure Trpt_Consignacao.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
  Begin
    if Entidade.CodigoPRD <> CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
      Open;
    end;
    zrlProduto.Caption := Descricao;
    zrlCodigoPRD.Caption := IntToStr(CodigoPRD);
  end;

  zrlValorItem.Caption := Format('%.2f',[Item_de_Consignacao1.Valor]);
  zrlTotalItem.Caption := Format('%.2f',[Item_de_Consignacao1.Quantidade * Item_de_Consignacao1.Valor]);
end;

procedure Trpt_Consignacao.zrbParcelasBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  //zrlTotalConsignacao.Caption := Format('%.2f',[Consignacao1.Valor]);
  zrlTotalConsignacao.Caption := Format('%.2f',[ GetTotalConsignacao(DM.QR_Consultas, DM.Configuracao1.CodigoCNC, Consignacao1.CodigoCSG) ]);
end;

end.
