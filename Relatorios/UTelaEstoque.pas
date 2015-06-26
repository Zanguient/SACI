unit UTelaEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo;

type
  Trpt_TelaEstoque = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel3: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel13: TSZRLabel;
    SZRLabel14: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel27: TSZRLabel;
    SZRLabel28: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_TelaEstoque: Trpt_TelaEstoque;

implementation
uses
  UDM, MxEstoqueGeral;

{$R *.DFM}

procedure Trpt_TelaEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := cafree;
end;

procedure Trpt_TelaEstoque.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_TelaEstoque.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  with fMxEstoqueGeral do
  Begin
    ZRLabel7.Caption  := edtCodigoPRD.Text;
    SZRLabel2.Caption := edtProduto.Text;
    SZRLabel4.Caption := edtPrecoVenda.Text;
    SZRLabel3.Caption := edtReferencia.Text;
    SZRLabel6.Caption := edtDetalhe.Text;
    SZRLabel16.Caption:= edtFisicoLoc.Text;
    SZRLabel17.Caption:= edtReservaLoc.Text;
    SZRLabel18.Caption:= edtIndisponivelLoc.Text;
    SZRLabel19.Caption:= edtSaldoLoc.Text;
    SZRLabel20.Caption:= edtFisicoExt.Text;
    SZRLabel21.Caption:= edtReservaExt.Text;
    SZRLabel22.Caption:= edtIndisponivelExt.Text;
    SZRLabel23.Caption:= edtSaldoExt.Text;
    SZRLabel24.Caption:= edtTotalFisico.Text;
    SZRLabel25.Caption:= edtTotalReserva.Text;
    SZRLabel26.Caption:= edtTotalIndisponivel.Text;
    SZRLabel27.Caption:= edtTotalSaldo.Text;
  end;
end;

end.
