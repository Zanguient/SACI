unit UFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Fornecedor;

type
  Trpt_fornecedor = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbDetalhe: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRDBText5: TSZRDBText;
    ZRDBText6: TSZRDBText;
    ZRDBText8: TSZRDBText;
    zrlLinhaDupla: TSZRLabel;
    Fornecedor1: TFornecedor;
    ZRLabel7: TSZRLabel;
    ZRLabel10: TSZRLabel;
    ZRLabel11: TSZRLabel;
    ZRLabel12: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRLabel15: TSZRLabel;
    ZRDBText2: TSZRDBText;
    ZRDBText3: TSZRDBText;
    ZRDBText9: TSZRDBText;
    ZRDBText10: TSZRDBText;
    ZRLabel13: TSZRLabel;
    ZRLabel16: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel3: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRDBText3: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRDBText4: TSZRDBText;
    SZRLabel9: TSZRLabel;
    SZRLabel10: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlBanco: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRDBText6: TSZRDBText;
    zrlUsuario: TSZRLabel;
    zrlFiltros: TSZRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject;
      var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade : TFornecedor;
    { Public declarations }
  end;

var
  rpt_fornecedor: Trpt_fornecedor;

implementation
uses
  UDM, Funcoes;

{$R *.DFM}

procedure Trpt_fornecedor.FormCreate(Sender: TObject);
begin
  Entidade := Fornecedor1;
  Entidade.Active := true;  
end;

procedure Trpt_fornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Active := false;
  Action             := cafree;
end;

procedure Trpt_fornecedor.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_fornecedor.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  SZRLabel5.Caption := Trim(DM.SelecionaParametro(Entidade.Logradouro)+' '+Entidade.Endereco);

  if Entidade.Banco > 0 then
    zrlBanco.Caption := PreencheZero(3, Entidade.Banco)
end;

procedure Trpt_fornecedor.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;
end;

end.
