unit UTransferenciaNecessaria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Item_de_Estoque;

type
  Trpt_TransferenciaNecessaria = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRBand4: TSZRBand;
    ZRSysData3: TSZRSysData;
    ZRLabel15: TSZRLabel;
    ZRLabel16: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel19: TSZRLabel;
    Item_de_Estoque1: TItem_de_Estoque;
    ZRGroup2: TSZRGroup;
    ZRDBText4: TSZRDBText;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    ZRLabel6: TSZRLabel;
    zrlOrigem: TSZRLabel;
    zrlProduto: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlDestino: TSZRLabel;
    Item_de_Estoque2: TItem_de_Estoque;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand4BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    CdCNCDestino: integer;
  end;

var
  rpt_TransferenciaNecessaria: Trpt_TransferenciaNecessaria;

implementation
Uses
  UDM, Funcoes, UOp_RelatProd;
{$R *.DFM}

procedure Trpt_TransferenciaNecessaria.Button1Click(Sender: TObject);
begin
  report.report.Preview;
end;

procedure Trpt_TransferenciaNecessaria.FormCreate(Sender: TObject);
begin
  CdCNCDestino := 0;
end;

procedure Trpt_TransferenciaNecessaria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Item_de_Estoque1.Close;
  Action:=caFree;
end;

procedure Trpt_TransferenciaNecessaria.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_TransferenciaNecessaria.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_TransferenciaNecessaria.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Item_de_Estoque1 do
    zrlProduto.Caption := Trim(FieldByName('PRD_DESCRICAO').asString+' '+
                          FieldByName('PRD_CARACTERISTICA').asString)+' '+
                          FieldByName('PRD_REFERENCIA').asString+' '+
                          FieldByName('PRD_MARCA').asString;

{  if DM.Configuracao1.Empresa <> empLBM then
  Begin
    if Op_RelatProd.rdbEstoqueFisico1.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.SFisico])
    else if Op_RelatProd.rdbEstoqueLJ3.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.SSN])
    else if Op_RelatProd.rdbEstoqueLJ4.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.SLJ4])
    else if Op_RelatProd.rdbEstoqueComercial.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.Saldo])
    else if Op_RelatProd.rdbEstoqueFiscal.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.SFiscal])
    else if Op_RelatProd.rdbEstoqueIndisponivel.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.Indisponivel])
    else if Op_RelatProd.rdbEstoqueReserva.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.SReservado])
    else if Op_RelatProd.rdbEstoqueBonificacao.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.SBonificacao])
    else if Op_RelatProd.rdbEstoqueAmostra.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.SAmostra])
    else if Op_RelatProd.rdbEstoqueBonificacaoF1.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.SBonificacaoFiscal])
    else if Op_RelatProd.rdbEstoqueAmostraF1.Checked then
      zrlOrigem.Caption:=format('%.2f',[Item_de_Estoque1.SAmostraFiscal]);
  end
  else
}  
  Begin
    with Item_de_Estoque2 do
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := CdCNCDestino;
      ParamByName('PRD_CODIGO').asInteger := Item_de_Estoque1.CodigoPRD;
      Open;
      if Op_RelatProd.rdbEstoqueFisico1.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.SFisico))
      else if Op_RelatProd.rdbEstoqueLJ3.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.SSN))
      else if Op_RelatProd.rdbEstoqueLJ4.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.SLJ4))
      else if Op_RelatProd.rdbEstoqueComercial.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.Saldo))
      else if Op_RelatProd.rdbEstoqueFiscal.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.SFiscal))
      else if Op_RelatProd.rdbEstoqueIndisponivel.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.Indisponivel))
      else if Op_RelatProd.rdbEstoqueReserva.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.SReservado))
      else if Op_RelatProd.rdbEstoqueBonificacao.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.SBonificacao))
      else if Op_RelatProd.rdbEstoqueAmostra.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.SAmostra))
      else if Op_RelatProd.rdbEstoqueBonificacaoF1.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.SBonificacaoFiscal))
      else if Op_RelatProd.rdbEstoqueAmostraF1.Checked then
        zrlDestino.Caption := IntToStr(Trunc(Item_de_Estoque2.SAmostraFiscal));
    end;

    if Op_RelatProd.rdbEstoqueFisico1.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.SFisico))
    else if Op_RelatProd.rdbEstoqueLJ3.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.SSN))
    else if Op_RelatProd.rdbEstoqueLJ4.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.SLJ4))
    else if Op_RelatProd.rdbEstoqueComercial.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.Saldo))
    else if Op_RelatProd.rdbEstoqueFiscal.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.SFiscal))
    else if Op_RelatProd.rdbEstoqueIndisponivel.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.Indisponivel))
    else if Op_RelatProd.rdbEstoqueReserva.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.SReservado))
    else if Op_RelatProd.rdbEstoqueBonificacao.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.SBonificacao))
    else if Op_RelatProd.rdbEstoqueAmostra.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.SAmostra))
    else if Op_RelatProd.rdbEstoqueBonificacaoF1.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.SBonificacaoFiscal))
    else if Op_RelatProd.rdbEstoqueAmostraF1.Checked then
      zrlOrigem.Caption:=IntToStr(Trunc(Item_de_Estoque1.SAmostraFiscal));
  end;


end;

procedure Trpt_TransferenciaNecessaria.ZRBand4BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption  := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel16.Caption   := EmpresaDesenvolvedora;
end;

end.
