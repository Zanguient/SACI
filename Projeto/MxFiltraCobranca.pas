unit MxFiltraCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Menus, Variants, Parametro,
  CentroCusto;

type
  TfMxFiltraCobranca = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    rdgDataVencimento: TRadioButton;
    rdgDataCobranca: TRadioButton;
    ckbEndereco: TCheckBox;
    edtEndereco: TEdit;
    ckbBairro: TCheckBox;
    edtBairro: TEdit;
    edtCidade: TEdit;
    ckbCidade: TCheckBox;
    Bevel1: TBevel;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbEnderecoClick(Sender: TObject);
    procedure ckbBairroClick(Sender: TObject);
    procedure ckbCidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    Centro: string;
  end;

var
  fMxFiltraCobranca: TfMxFiltraCobranca;

implementation

uses
  UDM, Funcoes, MxSFuncionario, UAtendimentosPorVendedor,
  MxGraficoAtendimentosPorVendedor, MxCobCobrador;

{$R *.DFM}


procedure TfMxFiltraCobranca.SB_ConfirmarClick(Sender: TObject);
var
  DtINI, DtFIM, CdCLI, sEndereco, sBairro, sCidade, sFiltros:string;
begin
  CdCLI:='';
  sEndereco := '';
  sBairro := '';
  sCidade := '';
  sFiltros:='';

  if not VerificaData(mskDataINI.Text) then
    Raise exception.Create('Data inicial inválida!')
  else if VerificaDataBranco(mskDataINI.Text) then
  Begin
    if rdgDataVencimento.Checked then
    Begin
      DtINI := ' AND T1.TRC_VENCIMENTO>="'+MesDia(mskDataINI.Text)+'" ';
      sFiltros := sFiltros + '(DtVenINI='+mskDataINI.Text+') ';
    end
    else if rdgDataCobranca.Checked then
    Begin
      DtINI := ' AND T1.TRC_RGB_DT_SITUACAO>="'+MesDia(mskDataINI.Text)+'" ';
      sFiltros := sFiltros + '(DtCobINI='+mskDataINI.Text+') ';
    end;
  end;

  if not VerificaData(mskDataFIM.Text) then
    Raise exception.Create('Data final inválida!')
  else if VerificaDataBranco(mskDataFIM.Text) then
  Begin
    if rdgDataVencimento.Checked then
    Begin
      DtFIM := ' AND T1.TRC_VENCIMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      sFiltros := sFiltros + '(DtVenFIM='+mskDataFIM.Text+') ';
    end
    else if rdgDataCobranca.Checked then
    Begin
      DtFIM := ' AND T1.TRC_RGB_DT_SITUACAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      sFiltros := sFiltros + '(DtCobFIM='+mskDataFIM.Text+') ';
    end;
  end;

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
      Raise Exception.Create('Código do Cliente inválido!')
    else
    Begin
      CdCLI := ' AND (T1.CLI_CODIGO='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + '(CLI='+edtCodigoCLI.Text+') ';
    end;

  if ckbEndereco.Checked then
  Begin
    sEndereco := ' AND T2.CLI_ENDERECO LIKE "%'+edtEndereco.Text+'%" ';
    sFiltros := sFiltros + '(End='+edtEndereco.Text+') ';
  end;

  if ckbBairro.Checked then
  Begin
    sBairro := ' AND T2.CLI_BAIRRO LIKE "%'+edtBairro.Text+'%" ';
    sFiltros := sFiltros + '(Bairro='+edtBairro.Text+') ';
  end;

  if ckbCidade.Checked then
  Begin
    sCidade := ' AND T2.CLI_CIDADE LIKE "%'+edtCidade.Text+'%" ';
    sFiltros := sFiltros + '(Cidade='+edtCidade.Text+') ';
  end;

  if tag = 0 then
  begin
    fMxCobCobrador.sFiltrosCobranca := DtINI+DtFIM+CdCLI+sEndereco+sBairro+sCidade;
    fMxCobCobrador.sDescricaoFiltro := sFiltros;
  end;
  Close;
end;

procedure TfMxFiltraCobranca.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxFiltraCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxFiltraCobranca.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  mskDataINI.SetFocus;
end;

procedure TfMxFiltraCobranca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    SB_ConfirmarClick(sender);
end;

procedure TfMxFiltraCobranca.ckbCodigoCLIClick(Sender: TObject);
begin
  if ckbCodigoCLI.Checked then
  Begin
    edtCodigoCLI.Color:=clWindow;
    edtCodigoCLI.Enabled:=True;
    edtCodigoCLI.SetFocus;
  end
  else
  Begin
    edtCodigoCLI.Color:=AlteraCorComponentes;
    edtCodigoCLI.Clear;
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure TfMxFiltraCobranca.ckbEnderecoClick(Sender: TObject);
begin
  if ckbEndereco.Checked then
  Begin
    edtEndereco.Color:=clWindow;
    edtEndereco.Enabled:=True;
    edtEndereco.SetFocus;
  end
  else
  Begin
    edtEndereco.Color:=AlteraCorComponentes;
    edtEndereco.Clear;
    edtEndereco.Enabled:=False;
  end;
end;

procedure TfMxFiltraCobranca.ckbBairroClick(Sender: TObject);
begin
  if ckbBairro.Checked then
  Begin
    edtBairro.Color:=clWindow;
    edtBairro.Enabled:=True;
    edtBairro.SetFocus;
  end
  else
  Begin
    edtBairro.Color:=AlteraCorComponentes;
    edtBairro.Clear;
    edtBairro.Enabled:=False;
  end;
end;

procedure TfMxFiltraCobranca.ckbCidadeClick(Sender: TObject);
begin
  if ckbCidade.Checked then
  Begin
    edtCidade.Color:=clWindow;
    edtCidade.Enabled:=True;
    edtCidade.SetFocus;
  end
  else
  Begin
    edtCidade.Color:=AlteraCorComponentes;
    edtCidade.Clear;
    edtCidade.Enabled:=False;
  end;
end;

end.
