unit UReciboPagamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Extenso, CentroCusto;

type
  Trpt_ReciboPagamento = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRBand3: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    ZRDBText1: TSZRDBText;
    ZRLabel9: TSZRLabel;
    zrlExtenso: TSZRLabel;
    ZRDBText13: TSZRDBText;
    ZRLabel17: TSZRLabel;
    ZRLabel22: TSZRLabel;
    ZRLabel11: TSZRLabel;
    CentroCusto1: TCentroCusto;
    SZRLabel1: TSZRLabel;
    Movimento_caixa1: TMovimento_caixa;
    SZRDBText3: TSZRDBText;
    SZRLabel2: TSZRLabel;
    zrlContaDeCaixa: TSZRLabel;
    SZRLabel4: TSZRLabel;
    zrlTipoDocumento: TSZRLabel;
    SZRLabel6: TSZRLabel;
    zrlTipoPagamento: TSZRLabel;
    zrlValor: TSZRLabel;
    SZRDBText1: TSZRDBText;
    SZRLabel5: TSZRLabel;
    SZRDBText2: TSZRDBText;
    SZRDBText4: TSZRDBText;
    SZRLabel7: TSZRLabel;
    SZRDBText5: TSZRDBText;
    SZRLabel8: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZRBand3BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    Entidade: TMovimento_caixa;
  end;

var
  rpt_ReciboPagamento: Trpt_ReciboPagamento;

implementation

uses  MxMovCaixa, UDM, Funcoes, MxSRecPedido, MxBaixaRec, MxReceber,
  Parametro;
{$R *.DFM}

procedure Trpt_ReciboPagamento.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
var
  S, sCidade: string;
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;

  zrlValor.Caption := Format('%.2f',[Entidade.Valor]);
  DM.Extenso1.Valor := Arredonda(Entidade.Valor);
  S := DM.Extenso1.Texto;
  zrlExtenso.Caption:='('+UpperCase(S)+')';

  with DM.Parametro1 do
  Begin
    if (not Active) or
       (CodigoPAR <> Entidade.Tipo) then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Entidade.Tipo;
      Open;
    end;
    zrlTipoDocumento.Caption := Descricao;

    if (not Active) or
       (CodigoPAR <> Entidade.TipoPGTO) then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := Entidade.TipoPGTO;
      Open;
    end;
    zrlTipoPagamento.Caption := Descricao;
  end;

  with DM.Conta_de_Caixa1 do
  begin
    //Descricao da Conta Agendada
    if (not Active) or
       (CodigoCCX <> Entidade.CodigoCCX) then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCX;
      Open;
    end;
    zrlContaDeCaixa.Caption := Descricao;

    if (Entidade.CodigoCCX <> Entidade.CodigoCCXRecebimento) then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := Entidade.CodigoCCXRecebimento;
      Open;
      zrlContaDeCaixa.Caption := zrlContaDeCaixa.Caption + ' / ' + Descricao;
    end;
  end;


  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
  CentroCusto1.Open;
  sCidade := CentroCusto1.Cidade;
  SZRLabel1.Caption:= sCidade+', '+
    FormatDateTime('dd',Entidade.Data)+' DE '+cMes[StrToInt(FormatDateTime('mm',Entidade.Data))]+
    ' DE '+FormatDateTime('yyyy',Entidade.Data);

end;

procedure Trpt_ReciboPagamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Close;
  CentroCusto1.Close;
  action:=cafree;
end;

procedure Trpt_ReciboPagamento.FormCreate(Sender: TObject);
begin
  Entidade := Movimento_caixa1;
end;

procedure Trpt_ReciboPagamento.ZRBand3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

end.
