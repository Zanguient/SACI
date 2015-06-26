unit MxS_Tpreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, DBTables, SQuery;

type
  TfMxSTPreco = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    edtDescricao: TEdit;
    edtMarca: TEdit;
    Label18: TLabel;
    Label3: TLabel;
    edtUnidade: TEdit;
    Label21: TLabel;
    edtReferencia: TEdit;
    Label12: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    edtPreco: TEdit;
    edtBonificacao: TEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSTPreco: TfMxSTPreco;

implementation
Uses
  MxTabPreco,UDM,funcoes, MxTabPrecoSubGrupo, Item_Tabela_de_Precos,
  Item_Tabela_de_Precos_SubGrupo;
{$R *.DFM}

procedure TfMxSTPreco.BitBtn1Click(Sender: TObject);
var
  mensagem:string;
  CdCNC, CdCod, CdPRD, CdSGP: integer;
  vPreco: Double;
begin
  mensagem:='';
  if edtPreco.Text='' Then
    edtPreco.Text:='0';
  if edtBonificacao.Text='' Then
    edtBonificacao.Text:='0';

  if not VerificafloatBranco(edtPreco.Text) then
    mensagem :=mensagem + 'Preço digitado incorretamente!'+#13;
  if not VerificafloatBranco(edtBonificacao.Text) then
    mensagem :=mensagem + 'Bonificação digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise Exception.Create(mensagem);
  if StrToFloat(edtPreco.Text) <= 0 then
    Raise exception.Create('Preço inválido!');

  if tag = 0 then //Tabela de Preço
  Begin
    CdCNC := fMxTabPreco.Item_Tabela_de_Precos1.CodigoCNC;
    CdCod := fMxTabPreco.Item_Tabela_de_Precos1.CodigoITP;
    CdPRD := fMxTabPreco.Item_Tabela_de_Precos1.CodigoPRD;
    vPreco:= fMxTabPreco.Item_Tabela_de_Precos1.Preco;
    fMxTabPreco.Entidade.GeraLog(6920,CdCNC,CdCod,'PRD:'+IntToStr(CdPRD)+
                        ' Preco:'+format('%.2f',[vPreco]));
    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TABELA_DE_PRECO SET '+
      ' ITP_PRECO='+VirgPonto(edtPreco.Text)+
      ',ITP_BONIFICACAO='+VirgPonto(edtBonificacao.Text)+
      ',ITP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE ITP_CODIGO='+IntToStr(fMxTabPreco.Item_Tabela_de_Precos1.CodigoITP)+
      ' AND CNC_CODIGO='+IntToStr(fMxTabPreco.Item_Tabela_de_Precos1.CodigoCNC));
    fMxTabPreco.Item_Tabela_de_Precos1.Close;
    fMxTabPreco.Item_Tabela_de_Precos1.Open;
    fMxTabPreco.Item_Tabela_de_Precos1.LocalizarCod(CdCod, CdCNC);
  end
  else if tag = 1 then //Tabela de Preço SubGrupo
  Begin
    CdCNC := fMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1.CodigoCNC;
    CdCod := fMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1.CodigoITS;
    CdSGP := fMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1.CodigoSGP;
    vPreco:= fMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1.Preco;
    fMxTabPrecoSubGrupo.Entidade.GeraLog(6920,CdCNC,CdCod,'SGP:'+IntToStr(CdSGP)+
                                ' Preco:'+format('%.2f',[vPreco]));
    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TABELA_DE_PRECO_SUBGRUPO SET '+
      ' ITS_PRECO_VENDA='+VirgPonto(edtPreco.Text)+
      ',ITS_BONIFICACAO='+VirgPonto(edtBonificacao.Text)+
      ',ITS_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE ITS_CODIGO='+IntToStr(fMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1.CodigoITS)+
      ' AND CNC_CODIGO='+IntToStr(fMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1.CodigoCNC));
    fMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1.Close;
    fMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1.Open;
    fMxTabPrecoSubGrupo.Item_Tabela_de_Precos_SubGrupo1.LocalizarCod(CdCod, CdCNC);
  end;
  Close;
end;

procedure TfMxSTPreco.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  edtPreco.SetFocus;
end;

procedure TfMxSTPreco.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
