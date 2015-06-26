unit UEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, DateUtils, Produto,
  Cliente, Emprestimo, CentroCusto;

type
  Trpt_Emprestimo = class(TForm)
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
    ZRDBText4: TSZRDBText;
    CentroCusto1: TCentroCusto;
    SZRDBText1: TSZRDBText;
    SZRDBText2: TSZRDBText;
    SZRLabel20: TSZRLabel;
    Emprestimo1: TEmprestimo;
    zrbGrupoCLI: TSZRGroup;
    SZRDBText7: TSZRDBText;
    Cliente1: TCliente;
    Produto1: TProduto;
    SZRLabel15: TSZRLabel;
    SZRDBText9: TSZRDBText;
    ZRLabel7: TSZRLabel;
    ZRLabel13: TSZRLabel;
    SZRLabel18: TSZRLabel;
    SZRLabel24: TSZRLabel;
    SZRDBText10: TSZRDBText;
    zrlDiasEmprestimo: TSZRLabel;
    zrlFiltros: TSZRLabel;
    zrlUsuario: TSZRLabel;
    zrlEmprestimo: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlDetalhe: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlCPFCNPJ: TSZRLabel;
    zrlSituacao: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlDescProduto: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel21: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel22: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel23: TSZRLabel;
    zrlObservacaoItem: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    zrlTotalQuantidade: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlTotalVenda: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlTotalCusto: TSZRLabel;
    SZRLabel6: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCLIBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapeGrupoBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    vTotalQtd, vTotalVenda, vTotalCusto: Double;
  public
    Entidade: TEmprestimo;
  end;

var
  rpt_Emprestimo: Trpt_Emprestimo;

implementation
uses
 UDM, Funcoes, MxSelEmprestimo;

{$R *.DFM}


procedure Trpt_Emprestimo.FormCreate(Sender: TObject);
begin
  vTotalQtd := 0;
  vTotalVenda := 0;
  vTotalCusto := 0;

  Entidade := Emprestimo1;
  if DM.Configuracao1.Empresa = empLBM then
    with Cliente1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CLIENTE WHERE CLI_CODIGO=:CLI_CODIGO';
    end;
end;

procedure Trpt_Emprestimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_Emprestimo.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Emprestimo.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Emprestimo.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  sDescricao: string;
begin
  with Produto1 do
  Begin
    if CodigoPRD <> Entidade.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    sDescricao := Trim(Descricao+' '+Caracteristica);
    if Length(sDescricao) <= zrlProduto.Width then
      zrlProduto.Caption := sDescricao
    else
      zrlProduto.Caption := Copy(sDescricao,1,zrlProduto.Width);

    if Length(Detalhe) <= zrlDetalhe.Width then
      zrlDetalhe.Caption := Detalhe
    else
      zrlDetalhe.Caption := Copy(Detalhe,1,zrlDetalhe.Width);

    //Preço de Venda
    zrlObservacaoItem.Caption := 'Venda:R$ '+PreencheEspacoEsq(7, Format('%.2f',[Precovenda]));
    //Preço de Custo
    zrlObservacaoItem.Caption := zrlObservacaoItem.Caption + ' Custo:R$ '+PreencheEspacoEsq(7, Format('%.2f',[Custo]));

    vTotalQtd   := vTotalQtd   + Arredonda(Entidade.Quantidade);
    vTotalVenda := vTotalVenda + Arredonda(Arredonda(Precovenda)*Arredonda(Entidade.Quantidade));
    vTotalCusto := vTotalCusto + Arredonda(Arredonda(Custo)*Arredonda(Entidade.Quantidade));
  end;

  zrlObservacaoItem.Caption := Trim(zrlObservacaoItem.Caption + ' ' + Entidade.Obs);

  case Entidade.Situacao of
    0: zrlSituacao.Caption := 'Emprestado';
    1: zrlSituacao.Caption := 'Devolvido';
  end;

  if Entidade.Situacao = 0 then
    try
      zrlDiasEmprestimo.Caption := IntToStr(Trunc(DM.Configuracao1.Data-Trunc(Entidade.DataCadastro)));
    except
      zrlDiasEmprestimo.Caption := '-';
    end
  else
    try
      zrlDiasEmprestimo.Caption := IntToStr(Trunc(Entidade.DataAlterado)-Trunc(Entidade.DataCadastro));
    except
      zrlDiasEmprestimo.Caption := '-';
    end;

  zrlQuantidade.Caption := format('%.2f',[Entidade.Quantidade]);
end;

procedure Trpt_Emprestimo.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

procedure Trpt_Emprestimo.zrbGrupoCLIBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.Demonstracao then
    zrlEmprestimo.Caption := 'Demonstracao'
  else
    zrlEmprestimo.Caption := '';

  with Cliente1 do
  Begin
    Close;
    try
      ParamByName('CNC_CODIGO').asInteger := Entidade.CNCCliente;
    except
    end;
    ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
    Open;

    zrlCliente.Caption := RazaoSocial;
    zrlCPFCNPJ.Caption := CPFCGC;
  end;
end;

procedure Trpt_Emprestimo.zrbRodapeGrupoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlTotalVenda.Caption := Format('%.2f',[vTotalVenda]);
  zrlTotalCusto.Caption := Format('%.2f',[vTotalCusto]);
  zrlTotalQuantidade.Caption := Format('%.2f',[vTotalQtd]);
end;

end.
