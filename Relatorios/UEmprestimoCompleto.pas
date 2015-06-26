unit UEmprestimoCompleto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, DateUtils, Parametro,
  Produto, Cliente, Emprestimo, CentroCusto;

type
  Trpt_EmprestimoCompleto = class(TForm)
    report: TSZReport;
    zrbCabecalho: TSZRBand;
    zrbDetalhe: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    zrlTitulo: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRDBText4: TSZRDBText;
    CentroCusto1: TCentroCusto;
    SZRDBText1: TSZRDBText;
    SZRLabel20: TSZRLabel;
    Emprestimo1: TEmprestimo;
    zrbGrupoCLI: TSZRGroup;
    Cliente1: TCliente;
    Produto1: TProduto;
    SZRDBText10: TSZRDBText;
    zrlUsuario: TSZRLabel;
    zrlProduto: TSZRLabel;
    zrlDetalhe: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlDescProduto: TSZRLabel;
    SZRLabel17: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel23: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlApelido: TSZRLabel;
    SZRLabel15: TSZRLabel;
    SZRLabel16: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlCidade: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel26: TSZRLabel;
    zrlContato: TSZRLabel;
    SZRLabel32: TSZRLabel;
    zrlRGCGF: TSZRLabel;
    SZRLabel34: TSZRLabel;
    zrlCPFCNPJ: TSZRLabel;
    SZRLabel36: TSZRLabel;
    zrlFone: TSZRLabel;
    SZRLabel38: TSZRLabel;
    zrlDataNascimento: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel11: TSZRLabel;
    SZRDBText3: TSZRDBText;
    zrlCEP: TSZRLabel;
    SZRLabel12: TSZRLabel;
    SZRLabel27: TSZRLabel;
    zrlFax: TSZRLabel;
    SZRLabel46: TSZRLabel;
    zrlCelular: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrbRodapeGrupo: TSZRBand;
    SZRLabel4: TSZRLabel;
    SZRLabel19: TSZRLabel;
    SZRLabel24: TSZRLabel;
    zrlSituacao: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRDBText2: TSZRDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbDetalheBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbGrupoCLIBeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TEmprestimo;
  end;

var
  rpt_EmprestimoCompleto: Trpt_EmprestimoCompleto;

implementation
uses
 UDM, Funcoes, MxSelEmprestimo;

{$R *.DFM}


procedure Trpt_EmprestimoCompleto.FormCreate(Sender: TObject);
begin
  Entidade := Emprestimo1;
  if DM.Configuracao1.Empresa = empLBM then
    with Cliente1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CLIENTE WHERE CLI_CODIGO=:CLI_CODIGO';
    end;
  Entidade.Open;
end;

procedure Trpt_EmprestimoCompleto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action := cafree;
end;

procedure Trpt_EmprestimoCompleto.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
 ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_EmprestimoCompleto.zrbCabecalhoBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
end;

procedure Trpt_EmprestimoCompleto.zrbDetalheBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with Produto1 do
  Begin
    if CodigoPRD <> Entidade.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    if Length(Descricao+' '+Referencia) <= zrlProduto.Width then
      zrlProduto.Caption := Descricao+' '+Referencia
    else
      zrlProduto.Caption := Copy(Descricao+' '+Referencia,1,zrlProduto.Width);

    if Length(Detalhe) <= zrlDetalhe.Width then
      zrlDetalhe.Caption := Detalhe
    else
      zrlDetalhe.Caption := Copy(Detalhe,1,zrlDetalhe.Width);
  end;

  case Entidade.Situacao of
    0: zrlSituacao.Caption := 'Emprestado';
    1: zrlSituacao.Caption := 'Devolvido';
  end;

  zrlQuantidade.Caption := format('%.2f',[Entidade.Quantidade]);
end;

procedure Trpt_EmprestimoCompleto.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  zrLabel4.Caption := EmpresaDesenvolvedora;  
end;

procedure Trpt_EmprestimoCompleto.zrbGrupoCLIBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
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
    zrlApelido.Caption:=NomeFantasia;
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

    if Trim(Pai) <> '' then
      if Trim(Mae) <> '' then
        zrlContato.Caption:=Trim(Pai)+'/'+Trim(Mae)
      else
        zrlContato.Caption:=Trim(Pai)
    else
      zrlContato.Caption:=Trim(Mae);
  end;
end;

end.
