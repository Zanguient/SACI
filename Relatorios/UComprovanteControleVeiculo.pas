unit UComprovanteControleVeiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls,
  Movimento_caixa, Extenso, Pedido_de_Venda, Titulo_receber, CentroCusto,
  Movimento_Fisico, Movimento_Estoque_Comercial, Parametro, Produto,
  Controle_de_Veiculo;

type
  Trpt_ComprovanteControleVeiculo = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlVeiculo: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlCodigoMTV: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlDataCadastro: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlDataAlterado: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlDetalhe: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlObservacao: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlTipo: TSZRLabel;
    SZRLabel13: TSZRLabel;
    zrlOdometro: TSZRLabel;
    zrlDescQuantidade: TSZRLabel;
    zrlQuantidade: TSZRLabel;
    zrlDescValorTotal: TSZRLabel;
    zrlValorTotal: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlSituacao: TSZRLabel;
    Controle_de_Veiculo1: TControle_de_Veiculo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TControle_de_Veiculo;
  end;

var
  rpt_ComprovanteControleVeiculo: Trpt_ComprovanteControleVeiculo;

implementation

uses UDM, Funcoes;
{$R *.DFM}

procedure Trpt_ComprovanteControleVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Trpt_ComprovanteControleVeiculo.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrLabel4.Caption := EmpresaDesenvolvedora;
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

procedure Trpt_ComprovanteControleVeiculo.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;

  with Entidade do
  Begin
    zrlCodigoMTV.Caption := IntToStr(CodigoMTV);
    zrlDataCadastro.Caption := DateTimeToStr(DataCadastro);
    if DataAlterado > 0 then
      zrlDataAlterado.Caption := DateTimeToStr(DataAlterado)
    else
      zrlDataAlterado.Caption := '';

    zrlVeiculo.Caption := '('+IntToStr(COdigoVEI)+') Placa: '+Placa;
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM VEICULO '+
        ' WHERE VEI_CODIGO='+IntToStr(CodigoVEI);
      Open;
      if not isEmpty then
        zrlVeiculo.Caption := zrlVeiculo.Caption + '  Marca:'+FieldByName('VEI_MARCA').asString+'  Modelo: '+FieldByName('VEI_MODELO').asString;
    end;
    zrlDetalhe.Caption := Detalhe;
    case Entidade.Tipo of
      0: zrlTipo.Caption := 'KILOMETRAGEM';
      1: zrlTipo.Caption := 'GASOLINA';
      2: zrlTipo.Caption := 'ALCOOL';
      3: zrlTipo.Caption := 'DISEL';
      4: zrlTipo.Caption := 'OLEO';
      5: zrlTipo.Caption := 'MANUTENCAO';
    end;
    if Quantidade > 0 then
      zrlQuantidade.Caption := Format('%.2f',[Quantidade])
    else
    Begin
      zrlDescQuantidade.Enabled := False;
      zrlQuantidade.Enabled := False;
    end;

    if ValorTotal > 0 then
      zrlValorTotal.Caption := Format('%.2f',[ValorTotal])
    else
    Begin
      zrlDescValorTotal.Enabled := False;
      zrlValorTotal.Enabled := False;
    end;

    zrlOdometro.Caption := IntToStr(KilometragemINI);
    if KilometragemFIM > 0 then
      zrlOdometro.Caption := zrlOdometro.Caption + ' A '+ IntToStr(KilometragemFIM);

    case Situacao of
      0: zrlSituacao.Caption := 'ATIVADO';
      1: zrlSituacao.Caption := 'DESATIVADO';
      2: zrlSituacao.Caption := 'PENDENTE';
      3: zrlSituacao.Caption := 'FINALIZADO';
    end;

    zrlObservacao.Caption := OBS;
  end;
end;

procedure Trpt_ComprovanteControleVeiculo.FormCreate(Sender: TObject);
begin
  Entidade := Controle_de_Veiculo1;
end;

end.
