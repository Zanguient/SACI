unit UNotaFiscalAgruparAgente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, NotaFiscal,
  OperFisc, CentroCusto;

type
  Trpt_NotaFiscalAgruparAgente = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRDBText3: TSZRDBText;
    NotaFiscal1: TNotaFiscal;
    SZRLabel1: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel2: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel80: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRBand1: TSZRBand;
    SZRLabel10: TSZRLabel;
    zrlGeralProdutos: TSZRLabel;
    zrlGeralICMS: TSZRLabel;
    zrlGeralServico: TSZRLabel;
    zrlGeralNota: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlGeralBaseICMS: TSZRLabel;
    zrlGeralIPI: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRDBText12: TSZRDBText;
    SZRGroup1: TSZRGroup;
    SZRBand2: TSZRBand;
    zrlDescricaoOperacao: TSZRLabel;
    zrdCFOP: TSZRDBText;
    zrlSubTotPRD: TSZRLabel;
    zrlSubTotICMS: TSZRLabel;
    zrlSubTotSer: TSZRLabel;
    zrlSubTotNota: TSZRLabel;
    zrlSubTotBase: TSZRLabel;
    zrlSubTotIPI: TSZRLabel;
    OperFiscal1: TOperFiscal;
    zrlTotalBaseISS: TSZRLabel;
    zrlTotalISS: TSZRLabel;
    zrlGeralBaseISS: TSZRLabel;
    zrlGeralISS: TSZRLabel;
    zrgCodigoCNC: TSZRGroup;
    zrlCentroDeCusto: TSZRLabel;
    CentroCusto2: TCentroCusto;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlTipo: TSZRLabel;
    zrlBaseISS: TSZRLabel;
    zrlServico: TSZRLabel;
    zrlICMS: TSZRLabel;
    zrlBaseICMS: TSZRLabel;
    zrlProdutos: TSZRLabel;
    zrlIPI: TSZRLabel;
    zrlNota: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRGroup1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrgCodigoCNCBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade:TNotaFiscal;
    SubTotPRD, SubTotSer, SubTotBase, SubTotICMS, SubTotFrete, SubTotIPI, SubTotNota,
       GeralProduto,TotBase,GeralICMS,TotFrete,GeralIPI,GeralNota,SubTotBaseISS,SubTotISS,
       GeralServico,GeralBaseISS,GeralISS:Double;
    { Public declarations }
  end;

var
  rpt_NotaFiscalAgruparAgente: Trpt_NotaFiscalAgruparAgente;

implementation
uses
  UDM, Funcoes, MxSelNotaFiscal;

{$R *.DFM}


procedure Trpt_NotaFiscalAgruparAgente.FormCreate(Sender: TObject);
begin
  Entidade   := NotaFiscal1;
  GeralNota  :=0;
  TotFrete   :=0;
  GeralICMS  :=0;
  GeralProduto :=0;
  TotBase    :=0;
  GeralIPI     :=0;
  GeralServico := 0;
  GeralBaseISS := 0;
  GeralISS     := 0;
end;

procedure Trpt_NotaFiscalAgruparAgente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Entidade.Active := false;
 Action := cafree;
end;

procedure Trpt_NotaFiscalAgruparAgente.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_NotaFiscalAgruparAgente.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  if Tag = 0 then
  Begin
    if fMxSelNotaFiscal.ckbAgruparAgenteFin.Checked then
    Begin
      zrdCFOP.Enabled := False;
    end;
  end;
end;

procedure Trpt_NotaFiscalAgruparAgente.FormShow(Sender: TObject);
begin
  Entidade.Active := true;
end;

procedure Trpt_NotaFiscalAgruparAgente.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  //Definir Tipo
  case Entidade.EntradaSaida of
    0 : zrlTipo.Caption := 'E';
    1 : zrlTipo.Caption := 'S';
  else
    zrlTipo.Caption := '';
  end;

  zrlBaseISS.Caption  := format('%.2f',[Entidade.BaseISS]);
  zrlServico.Caption  := format('%.2f',[Entidade.TotalServico]);
  zrlICMS.Caption     := format('%.2f',[Entidade.ICMS]);
  zrlBaseICMS.Caption := format('%.2f',[Entidade.BaseICMS]);
  zrlProdutos.Caption := format('%.2f',[Entidade.TotalProduto]);
  zrlIPI.Caption      := format('%.2f',[Entidade.IPI]);
  zrlNota.Caption     := format('%.2f',[Entidade.TotalNota]);

  SubTotNota    := SubTotNota    + Arredonda(Entidade.TotalNota);
  GeralNota     := GeralNota     + Arredonda(Entidade.TotalNota);
  SubTotFrete   := SubTotFrete   + Arredonda(Arredonda(Entidade.Frete)*Arredonda(Entidade.TotalProduto)/100);
  TotFrete      := TotFrete      + Arredonda(Arredonda(Entidade.Frete)*Arredonda(Entidade.TotalProduto)/100);
  SubTotBase    := SubTotBase    + Arredonda(Entidade.BaseICMS);
  TotBase       := TotBase       + Arredonda(Entidade.BaseICMS);
  SubTotICMS    := SubTotICMS    + Arredonda(Entidade.ICMS);
  GeralICMS     := GeralICMS     + Arredonda(Entidade.ICMS);
  SubTotIPI     := SubTotIPI     + Arredonda(Entidade.IPI);
  GeralIPI      := GeralIPI      + Arredonda(Entidade.IPI);
  SubTotPRD     := SubTotPRD     + Arredonda(Entidade.TotalProduto);
  GeralProduto  := GeralProduto  + Arredonda(Entidade.TotalProduto);
  SubTotSER     := SubTotSER     + Arredonda(Entidade.TotalServico);
  GeralServico  := GeralServico  + Arredonda(Entidade.TotalServico);
  SubTotBaseISS := SubTotBaseISS + Arredonda(Entidade.BaseISS);
  GeralBaseISS  := GeralBaseISS  + Arredonda(Entidade.BaseISS);
  SubTotISS     := SubTotISS     + Arredonda(Entidade.ISS);
  GeralISS      := GeralISS      + Arredonda(Entidade.ISS);
end;

procedure Trpt_NotaFiscalAgruparAgente.SZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlGeralServico.Caption := format('%.2f',[GeralServico]);
  zrlGeralBaseISS.Caption := format('%.2f',[GeralBaseISS]);
  zrlGeralISS.Caption := format('%.2f',[GeralISS]);
  zrlGeralProdutos.Caption  := format('%.2f',[GeralProduto]);
  zrlGeralBaseICMS.Caption  := format('%.2f',[TotBase]);
  zrlGeralICMS.Caption  := format('%.2f',[GeralICMS]);
  zrlGeralIPI.Caption  := format('%.2f',[GeralIPI]);
  zrlGeralNota.Caption  := format('%.2f',[GeralNota]);
end;

procedure Trpt_NotaFiscalAgruparAgente.SZRGroup1BeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  SubTotNota  := 0;
  SubTotFrete := 0;
  SubTotICMS  := 0;
  SubTotPRD   := 0;
  SubTotBase  := 0;
  SubTotIPI   := 0;
  SubTotSER   := 0;
  SubTotBaseISS := 0;
  SubTotISS   := 0;
end;

procedure Trpt_NotaFiscalAgruparAgente.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescricao: string;
begin
  with OperFiscal1 do
  Begin
    Close;
    ParamByName('OPF_CODIGO').asInteger := Entidade.CFOP;
    Open;
    if Tag = 0 then
    Begin
      if fMxSelNotaFiscal.ckbAgruparAgente.Checked then
      Begin
        // 1-Apresentacao    2-A Vista     3-A Prazo      4-Cartao
        //                                 CH/DP/BO       VISA/MASTER/AMERICA/HIPER
        // 0                 0             10/20/30       40  /50    /60     /70
        case Entidade.CodPagamento of
          1: sDescricao := Descricao+' (APRES.)';
          2: sDescricao := Descricao+' (AVista)';
          3: sDescricao := Descricao+' (APrazo)';
          4: sDescricao := Descricao+' (Cartao)';
          else
            sDescricao := Descricao;
        end;
      end
      else
      Begin
        // 1-Apresentacao    2-A Vista     3-A Prazo      4-Cartao
        //                                 CH/DB/BO       VISA/MASTER/AMERICA/HIPER
        // 0                 0             10/20/30       40  /50    /60     /70
        case Entidade.CodPagamento of
          1: sDescricao := 'VENDA (APRES.)';
          2: sDescricao := 'VENDA (AVista)';
          3: Begin
               if Entidade.CodPagamento2 = 10 then
                 sDescricao := 'VENDA (Prazo - Cheque)'
               else if Entidade.CodPagamento2 = 20 then
                 sDescricao := 'VENDA (Prazo - Deposito)'
               else if Entidade.CodPagamento2 = 30 then
                 sDescricao := 'VENDA (Prazo - Boleto)'
               else
                 sDescricao := 'VENDA (Prazo - Outros)';
             end;
          4: Begin
               if Entidade.CodPagamento2 = 40 then
                 sDescricao := 'VENDA (Cartao - VISA)'
               else if Entidade.CodPagamento2 = 50 then
                 sDescricao := 'VENDA (Cartao - MATERCARD)'
               else if Entidade.CodPagamento2 = 60 then
                 sDescricao := 'VENDA (Cartao - AMERICANCARD)'
               else if Entidade.CodPagamento2 = 70 then
                 sDescricao := 'VENDA (Cartao - HIPERCARD)'
               else
                 sDescricao := 'VENDA (Cartao - Outros)';                 
             end;
          else
            if Entidade.TipoNota = 368 then
              sDescricao := 'SERVICO '
            else
              sDescricao := 'VENDA ';
        end;
      end;
    end;
  end;

  if Length(sDescricao) <= zrlDescricaoOperacao.Width then
    zrlDescricaoOperacao.Caption := sDescricao
  else
    zrlDescricaoOperacao.Caption := Copy(sDescricao,1,zrlDescricaoOperacao.Width);

  zrlSubTotSer.Caption := format('%.2f',[SubTotSer]);
  zrlTotalBaseISS.Caption := format('%.2f',[SubTotBaseISS]);
  zrlTotalISS.Caption := format('%.2f',[SubTotISS]);
  zrlSubTotPRD.Caption := format('%.2f',[SubTotPRD]);
  zrlSubTotBase.Caption := format('%.2f',[SubTotBase]);
  zrlSubTotICMS.Caption := format('%.2f',[SubTotICMS]);
  zrlSubTotIPI.Caption := format('%.2f',[SubTotIPI]);
  zrlSubTotNota.Caption := format('%.2f',[SubTotNota]);
end;

procedure Trpt_NotaFiscalAgruparAgente.zrgCodigoCNCBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  if zrgCodigoCNC.Height > 0 then
  Begin
    with CentroCusto2 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      Open;
      zrlCentroDeCusto.Caption := IntToStr(CodigoCNC) + ' - ' + RazaoSocial;
    end;
  end;
end;

procedure Trpt_NotaFiscalAgruparAgente.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
