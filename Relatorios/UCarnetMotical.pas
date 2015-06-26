unit UCarnetMotical;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, Titulo_receber, ZRCtrls, ZReport, 
  Cliente, CentroCusto;

type
  Trpt_CarnetMotical = class(TForm)
    report: TSZReport;
    ZRBand2: TSZRBand;
    SZRDBText8: TSZRDBText;
    Titulo_receber1: TTitulo_receber;
    SZRDBText1: TSZRDBText;
    zrlEndereco: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlCidade: TSZRLabel;
    zrlUF: TSZRLabel;
    zrlCentroDeCusto: TSZRLabel;
    zrlCNPJ: TSZRLabel;
    zrlCGF: TSZRLabel;
    zrlExtenso: TSZRLabel;
    zrlValorPDV: TSZRLabel;
    zrlValorDoc: TSZRLabel;
    zrlDataEmissao: TSZRLabel;
    Cliente1: TCliente;
    CentroCusto1: TCentroCusto;
    zrlOrdem: TSZRLabel;
    zrlRazaoCNC: TSZRLabel;
    zrlEnderecoCNC: TSZRLabel;
    zrlCidadeCNC: TSZRLabel;
    zrlCNPJCGFCNC: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlJurosDia: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TTitulo_receber;
    vDataEmi: TDateTime;
    vTotalPDV: Double;
  end;

var
  rpt_CarnetMotical: Trpt_CarnetMotical;

implementation
uses UDM, Funcoes;
{$R *.DFM}

procedure Trpt_CarnetMotical.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_CarnetMotical.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  S: string;
begin
  //Dados do Centro de Custo
  with CentroCusto1 do
  Begin
    if (Active) or
       (CodigoCNC <> Entidade.CodigoCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      Open;
    end;
    zrlRazaoCNC.Caption := RazaoSocial;
    zrlEnderecoCNC.Caption := Trim(Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco)+' '+Bairro+' '+CEP);
    zrlCidade.Caption := Cidade+'/'+UF;
    zrlCNPJCGFCNC.Caption := CGC+' CGF:'+IE;
  end;

  if vDataEmi > 0 then
    zrlDataEmissao.Caption := DateToStr(vDataEmi)
  else
    zrlDataEmissao.Caption := '';

  if vTotalPDV = -999 then  //Tem que ser calculado na Promissória
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      if Entidade.CodigoFPE = 0 then
        SQL.Text := 'SELECT SUM(ROUND((IPV_QUANTIDADE-IPV_BONIFICACAO)*IPV_PRECO_DESC,2)) AS TOTAL, '+
          ' MAX(P1.PDV_DT_EMISSAO_VENDA) AS EMISSAO '+
          ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE P1.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
          ' AND P1.PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
          ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
          ' AND P1.PDV_CODIGO=I1.CNC_CODIGO '
      else
        SQL.Text := 'SELECT SUM(ROUND(I1.IPV_PRECO_DESC,2)*(I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)) AS TOTAL, '+
          ' MAX(P1.PDV_DT_EMISSAO_VENDA) AS EMISSAO '+
          ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE P1.CNC_FATURAMENTO_PENDENTE='+IntToStr(Entidade.FaturamentoCNC)+
          ' AND P1.FPE_CODIGO='+IntToStr(Entidade.CodigoFPE)+
          ' AND P1.PDV_SITUACAO=4 '+
          ' AND I1.CNC_CODIGO=P1.CNC_CODIGO '+
          ' AND I1.PDV_CODIGO=P1.PDV_CODIGO ';
      Open;
      zrlValorPDV.Caption    := format('%.2f',[FieldByName('TOTAL').asFloat]);
      if FieldByName('EMISSAO').asDateTime > 0 then
        zrlDataEmissao.Caption := DateToStr(FieldByName('EMISSAO').asDateTime)
      else
        zrlDataEmissao.Caption := '';
    end;
  end
  else
    zrlValorPDV.Caption := format('%.2f',[vTotalPDV]);

  zrlValorDoc.Caption := format('%.2f',[Entidade.Valor]);

  zrlOrdem.Caption := IntToStr(Entidade.CodigoTRC)+'-'+Entidade.Sequencia;

  zrlJurosDia.Caption := format('%.2f',[Entidade.Valor*DM.Configuracao1.TaxaJuros/3000]);

  with Cliente1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Entidade.ClienteCNC) or
       (CodigoCLI <> Entidade.CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    zrlCliente.Caption := RazaoSocial+'('+IntToStr(CodigoCNC)+'-'+IntToStr(CodigoCLI)+')';

    zrlEndereco.Caption := Trim(Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco)+' '+Bairro+' '+CEP);
    zrlCidade.Caption   := Cidade;
    zrlUF.Caption       := Uf;

    zrlCentroDeCusto.Caption := CentroCusto1.RazaoSocial;

    zrlCNPJ.Caption := CPFCGC;
    zrlCGF.Caption  := CGFRG;
  end;

  DM.Extenso1.Valor := Arredonda(Entidade.fieldbyname('TRC_VALOR').asfloat);
  S := DM.Extenso1.Texto;
  zrlExtenso.Caption:='('+UpperCase(S)+')';
end;

procedure Trpt_CarnetMotical.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  vDataEmi := 0;
  vTotalPDV := 0;
end;

end.
