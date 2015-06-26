unit Urpt_bonusvendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Produto, CentroCusto, Funcionario, Direito_de_Bonus;

type
  Trpt_BonusVendedor = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrgGrupoCNC: TSZRGroup;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    Produto1: TProduto;
    zrbRodapeCNC: TSZRBand;
    SZRLabel13: TSZRLabel;
    zrgGrupoFUN: TSZRGroup;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrbRodapeFUN: TSZRBand;
    SZRLabel17: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel20: TSZRLabel;
    zrbSumario: TSZRBand;
    SZRLabel22: TSZRLabel;
    zrlBonus1FUN: TSZRLabel;
    zrlBonus2FUN: TSZRLabel;
    zrlBonus1CNC: TSZRLabel;
    zrlBonus2CNC: TSZRLabel;
    zrlBonus1Geral: TSZRLabel;
    zrlBonus2Geral: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRLabel29: TSZRLabel;
    SZRLabel30: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel12: TSZRLabel;
    zrlBonus1: TSZRLabel;
    zrlBonus2: TSZRLabel;
    SZRDBText1: TSZRDBText;
    Funcionario1: TFuncionario;
    SZRLabel4: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel31: TSZRLabel;
    ZRLabel6: TSZRLabel;
    Direito_de_Bonus1: TDireito_de_Bonus;
    zrlDescricao: TSZRLabel;
    zrlReferencia: TSZRLabel;
    zrlDetalhe: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlQtdVendida: TSZRLabel;
    zrlQtdBonus: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrldataFIM: TSZRLabel;
    zrldataINI: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrgGrupoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrgGrupoFUNBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeFUNBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbSumarioBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade : TDireito_de_Bonus;
    SubTotalFor,SubTotalLoja,SubTotalForCNC,SubTotalLojaCNC,TotalFor,TotalLoja:Double;
  end;

var
  rpt_BonusVendedor: Trpt_BonusVendedor;
const
  vMes : array [1..12] of string = ('Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');

implementation
uses
  UDM, Funcoes, MxSelBonusVendedor;

{$R *.DFM}


procedure Trpt_BonusVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_BonusVendedor.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_BonusVendedor.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_BonusVendedor.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if fMxSelBonusVendedor.ckbSomenteBonus2.Checked then
  Begin
    SZRLabel7.Enabled:=False;
    zrlBonus1.Enabled:=False;
    zrlBonus1FUN.Enabled:=False;
    zrlBonus1CNC.Enabled:=False;
    zrlBonus1Geral.Enabled:=False;
  end
  else if fMxSelBonusVendedor.ckbSomenteBonus1.Checked then
  Begin
    SZRLabel8.Enabled:=False;
    zrlBonus2.Enabled:=False;
    zrlBonus2FUN.Enabled:=False;
    zrlBonus2CNC.Enabled:=False;
    zrlBonus2Geral.Enabled:=False;
  end;
  TotalFor:=0;
  TotalLoja:=0;
end;

procedure Trpt_BonusVendedor.zrgGrupoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with CentroCusto1 do
  Begin
    if CodigoCNC <> Entidade.CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      Open;
    end;
    SZRLabel2.Caption := RazaoSocial;
  end;

  SubTotalForCNC:=0;
  SubTotalLojaCNC:=0;
end;

procedure Trpt_BonusVendedor.zrgGrupoFUNBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Funcionario1 do
  Begin
    if CodigoFUN <> Entidade.CodigoFUN then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
      Open;
    end;
    SZRLabel16.Caption := Apelido;
  end;
  SubTotalFor:=0;
  SubTotalLoja:=0;
end;

procedure Trpt_BonusVendedor.zrbRodapeFUNBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlBonus1FUN.Caption:=format('%.2f',[SubTotalFor]);
  zrlBonus2FUN.Caption:=format('%.2f',[SubTotalLoja]);
end;

procedure Trpt_BonusVendedor.zrbRodapeCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlBonus1CNC.Caption:=format('%.2f',[SubTotalForCNC]);
  zrlBonus2CNC.Caption:=format('%.2f',[SubTotalLojaCNC]);
end;

procedure Trpt_BonusVendedor.zrbSumarioBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlBonus1Geral.Caption:=format('%.2f',[TotalFor]);
  zrlBonus2Geral.Caption:=format('%.2f',[TotalLoja]);
end;

procedure Trpt_BonusVendedor.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if fMxSelBonusVendedor.ckbSomenteBonus1.Checked then
  Begin
    if Entidade.BonusFOR > 0 then
      DoPrint := True
    else
      DoPrint := True;
  end
  else if fMxSelBonusVendedor.ckbSomenteBonus2.Checked then
  Begin
    if Entidade.BonusLoja > 0 then
      DoPrint := True
    else
      DoPrint := True;
  end
  else
    DoPrint := True;

  if DoPrint then
  Begin
    if DM.Configuracao1.Empresa <> empLBM then
    Begin
      zrlQtdVendida.Caption := format('%.2f',[Entidade.QuantidadeVendida]);
      zrlQtdBonus.Caption   := format('%.2f',[Entidade.QuantidadeBonus]);
    end
    else
    Begin
      zrlQtdVendida.Caption := format('%.2f',[Entidade.QuantidadeVendida]);
      zrlQtdBonus.Caption   := format('%.2f',[Entidade.QuantidadeBonus]);
    end;
    zrlBonus1.Caption:= format('%.2f',[Arredonda(Entidade.Preco*Entidade.QuantidadeBonus)*Entidade.BonusFOR/100]);
    SubTotalFor      := SubTotalFor+   Arredonda(Arredonda(Entidade.Preco*Entidade.QuantidadeBonus)*Entidade.BonusFOR/100);
    SubTotalForCNC   := SubTotalForCNC+Arredonda(Arredonda(Entidade.Preco*Entidade.QuantidadeBonus)*Entidade.BonusFOR/100);
    TotalFor         := TotalFor+      Arredonda(Arredonda(Entidade.Preco*Entidade.QuantidadeBonus)*Entidade.BonusFOR/100);

    zrlBonus2.Caption:= format('%.2f',[Entidade.BonusLoja*Entidade.QuantidadeBonus]);
    SubTotalLoja     := SubTotalLoja+   Arredonda(Entidade.BonusLoja*Entidade.QuantidadeBonus);
    SubTotalLojaCNC  := SubTotalLojaCNC+Arredonda(Entidade.BonusLoja*Entidade.QuantidadeBonus);
    TotalLoja        := TotalLoja+      Arredonda(Entidade.BonusLoja*Entidade.QuantidadeBonus);

    if (zrbDetalhe.Height > 0) then
    Begin
      with Produto1 do
      Begin
        if CodigoPRD <> Entidade.CodigoPRD then
        Begin
          Close;
          ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
          Open;
        end;
        zrlDescricao.Caption  := Descricao;
        zrlReferencia.Caption := Referencia;
        zrlDetalhe.Caption    := Detalhe;
      end;
    end;
  end;
end;

procedure Trpt_BonusVendedor.FormCreate(Sender: TObject);
begin
  Entidade := Direito_de_Bonus1;
end;

procedure Trpt_BonusVendedor.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

end.
