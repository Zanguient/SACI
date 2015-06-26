unit UCadastroExtratificado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Funcionario,
  CentroCusto, Cliente;

type
  Trpt_CadastroExtratificado = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
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
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText8: TSZRDBText;
    Cliente1: TCliente;
    ZRDBText4: TSZRDBText;
    zrlTotalComprado: TSZRLabel;
    zrgCodigoCNC: TSZRGroup;
    SZRLabel2: TSZRLabel;
    SZRLabel3: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel20: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRLabel24: TSZRLabel;
    SZRDBText5: TSZRDBText;
    zrlContatos: TSZRLabel;
    Funcionario1: TFuncionario;
    SZRBand2: TSZRBand;
    SZRLabel34: TSZRLabel;
    zrlTotalRegistros: TSZRLabel;
    zrlFiltros: TSZRLabel;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel13: TSZRLabel;
    ZRLabel12: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel25: TSZRLabel;
    SZRLabel26: TSZRLabel;
    SZRLabel28: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlDescTotal: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrgCodigoFUN: TSZRGroup;
    SZRLabel169: TSZRLabel;
    SZRLabel170: TSZRLabel;
    SZRDBText1: TSZRDBText;
    zrlTotalExibido: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlTotalRegExibidos: TSZRLabel;
    zrlTotalGeral: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrgCodigoCNCBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure SZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrgCodigoFUNBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
    procedure Funcionario1BeforeOpen(DataSet: TDataSet);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    TotalRegistros, TotalRegExibidos : integer;
    TotalExibido, TotalGeral: Double;
  public
    Entidade : TCliente;
    vQtdMaiores : integer;
  end;

var
  rpt_CadastroExtratificado: Trpt_CadastroExtratificado;

implementation
uses
 UDM, funcoes, MxSCadastroExtratificado;

{$R *.DFM}


procedure Trpt_CadastroExtratificado.FormCreate(Sender: TObject);
begin
  Entidade := Cliente1;
  TotalRegistros := 0;
  TotalRegExibidos := 0;
  vQtdMaiores := 0;
  TotalExibido := 0;
  TotalGeral := 0;
end;

procedure Trpt_CadastroExtratificado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cliente1.Close;
  Action := cafree;
end;


procedure Trpt_CadastroExtratificado.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  if not fMxSExtratoExtratificado.ckbExibirTotal.Checked then
    zrlDescTotal.Enabled := False;
  if DM.Configuracao1.Empresa = empLBM then
    SZRLabel28.Caption := 'Vendedor';
end;

procedure Trpt_CadastroExtratificado.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  vTotal1: Double;
begin
  inc(TotalRegistros);
  vTotal1 := 0;
  if zrlDescTotal.Enabled then
  Begin
    vTotal1 := Entidade.FieldByName('TOTAL').asFloat;
    try
//      vTotal1 := vTotal1 + Entidade.FieldByName('TOTALPCT').asFloat;
    except
    end;
    try
//      vTotal1 := vTotal1 + Entidade.FieldByName('TOTALPCR').asFloat;
    except
    end;
    zrlTotalComprado.Caption := format('%.2f',[vTotal1]);
    TotalGeral   := TotalGeral + Arredonda(vTotal1);
  end
  else
    zrlTotalComprado.Caption:='';

  if (TotalRegistros > vQtdMaiores) and
     (vQtdMaiores > 0) then
  Begin
    DoPrint := False;
    Exit;
  end
  else
    DoPrint := True;

  inc(TotalRegExibidos);
  if zrlDescTotal.Enabled then
    TotalExibido := TotalExibido + Arredonda(vTotal1);

  SZRLabel15.Caption := Trim(DM.SelecionaParametro(Cliente1.Logradouro)+' '+Cliente1.Endereco);

  case Cliente1.Situacao of
    0: SZRLabel24.Caption:='Novo';
    1: SZRLabel24.Caption:='Antigo';
    2: SZRLabel24.Caption:='Adiplente';
    3: SZRLabel24.Caption:='Inadiplente';
    4: SZRLabel24.Caption:='Fora Rel.';
  else
    SZRLabel24.Caption:='';
  end;

  zrlContatos.Caption := Trim(Cliente1.Pai);
  if Trim(Cliente1.Mae) <> '' then
    if Trim(Cliente1.Pai) <> '' then
      zrlContatos.Caption := zrlContatos.Caption + '/' + Trim(Cliente1.Mae)
    else
      zrlContatos.Caption := Trim(Cliente1.Mae);
end;


procedure Trpt_CadastroExtratificado.zrgCodigoCNCBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Cliente1.CodigoCNC;
  CentroCusto1.Open;
  SZRLabel3.Caption:=CentroCusto1.RazaoSocial;
  if DM.Configuracao1.Empresa = empLBM then
    SZRLabel28.Caption := 'Vendedor';
end;


procedure Trpt_CadastroExtratificado.SZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalRegExibidos.Caption := IntToStr(TotalRegExibidos);
  zrlTotalRegistros.Caption := IntToStr(TotalRegistros);
  if zrlDescTotal.Enabled then
  Begin
    zrlTotalExibido.Caption := format('%.2f',[TotalExibido]);
    zrlTotalGeral.Caption := format('%.2f',[TotalGeral]);
  end;
end;

procedure Trpt_CadastroExtratificado.zrgCodigoFUNBeforePrint(
  Sender: TObject; var DoPrint: Boolean);
begin
  try
    if DM.Configuracao1.Empresa = empLBM then
      with Funcionario1 do
      Begin
        if (StrToInt(Cliente1.Conjuge) <> CodigoFUN) then
        Begin
          Close;
          ParamByName('FUN_CODIGO').asInteger := StrToInt(Cliente1.Conjuge);
          Open;
        end;
        SZRLabel170.Caption:=Apelido;
      end;
  except
    SZRLabel170.Caption:='Sem Vendedor';  
  end;
end;

procedure Trpt_CadastroExtratificado.Funcionario1BeforeOpen(
  DataSet: TDataSet);
begin
  try
    Funcionario1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
  except
  end;
end;

procedure Trpt_CadastroExtratificado.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
