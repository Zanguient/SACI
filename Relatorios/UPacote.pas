unit UPacote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls, Cliente, SubGrupo,funcoes,
  Pacote_de_venda;

type
  Trpt_Pacote = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand2: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    zrlNomeEmpresa: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel6: TSZRLabel;
    PACOTE_DE_VENDA1: TPACOTE_DE_VENDA;
    ZRLabel18: TSZRLabel;
    ZRLabel14: TSZRLabel;
    ZRBand5: TSZRBand;
    ZRLabel15: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRDBText6: TSZRDBText;
    ZRLabel19: TSZRLabel;
    ZRDBText8: TSZRDBText;
    ZRDBText11: TSZRDBText;
    ZRLabel1: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel7: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    SZRLabel6: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel9: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlGrupo1: TSZRLabel;
    SubGrupo1: TSubGrupo;
    SZRDBText7: TSZRDBText;
    Cliente1: TCliente;
    zrlCodigoCLI: TSZRLabel;
    zrlCliente: TSZRLabel;
    zrlCPFCNPJ: TSZRLabel;
    zrlRGCGF: TSZRLabel;
    zrlEndereco: TSZRLabel;
    zrlBairro: TSZRLabel;
    zrlFone: TSZRLabel;
    zrlUF: TSZRLabel;
    zrlCidade: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRBand5BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrlNomeEmpresaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure reportBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand2BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TPacote_de_venda;
    total:Double;
  end;

var
  rpt_Pacote: Trpt_Pacote;

implementation
uses
 UDM;

{$R *.DFM}

procedure Trpt_Pacote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Action:=cafree;
end;

procedure Trpt_Pacote.ZRBand5BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel7.Caption := EmpresaDesenvolvedora;
  ZRLabel19.Caption:=Format('%.2f', [Total]);
end;

procedure Trpt_Pacote.zrlNomeEmpresaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlNomeEmpresa.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_Pacote.reportBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  total:=0;
end;

procedure Trpt_Pacote.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  if Entidade.Situacao = 4 then
    SZRLabel7.Caption := 'F'
  else if Entidade.Situacao in [0,3] then
    SZRLabel7.Caption := 'A'
  else
    SZRLabel7.Caption := '';

  with Cliente1 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
    ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
    Open;
    zrlCodigoCLI.Caption  := IntToStr(CodigoCLI);
    zrlCliente.Caption    := RazaoSocial;
    zrlCPFCNPJ.Caption    := CPFCGC;
    zrlRGCGF.Caption      := CGFRG;
    zrlEndereco.Caption := Trim(DM.SelecionaParametro(Logradouro)+' '+Endereco);
    zrlBairro.Caption     := Bairro;
    zrlFone.Caption       := Fone;
    zrlCidade.Caption     := Cidade;
    zrlUF.Caption         := Uf;
  end;
end;

procedure Trpt_Pacote.ZRBand2BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  with SubGrupo1 do
  Begin
    if CodigoSGP <> Entidade.FieldByName('SGP_CODIGO_1').asInteger then
    Begin
      Close;
      ParamByName('SGP_CODIGO').asInteger := Entidade.FieldByName('SGP_CODIGO_1').asInteger;
      Open;
    end;
    zrlGrupo1.Caption := Descricao;
  end;

  SZRLabel8.Caption:=format('%.2f',[Entidade.FieldByName('IPC_PRECO_DESCONTO').asFloat]);

  SZRLabel9.Caption:=format('%.2f',[StrToFloat(SZRLabel8.Caption)*Entidade.FieldByName('IPC_QUANTIDADE').asFloat]);

  Total:=Total+StrToFloat(SZRLabel9.Caption);
end;

procedure Trpt_Pacote.FormCreate(Sender: TObject);
begin
  Entidade := PACOTE_DE_VENDA1;
end;

end.
