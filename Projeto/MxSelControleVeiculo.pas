unit MxSelControleVeiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, 
  DBCtrls, Menus, Variants, Parametro,
  CentroCusto;

type
  TfMxSelControleVeiculo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    ckbCodigoVEI: TCheckBox;
    edtCodigoVEI: TEdit;
    DSParametro2: TDataSource;
    Parametro2: TParametro;
    ckbSintetico: TCheckBox;
    DSCentroCusto1: TDataSource;
    CentroCusto1: TCentroCusto;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    ckbSituacao: TCheckBox;
    cmbSituacao: TComboBox;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    rdgDataCadastro: TRadioButton;
    rdgDataAlterado: TRadioButton;
    rdgDataInicial: TRadioButton;
    rdgDataFinal: TRadioButton;
    Bevel1: TBevel;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoVEIClick(Sender: TObject);
    procedure edtCodigoVEIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    Centro: string;
  end;

var
  fMxSelControleVeiculo: TfMxSelControleVeiculo;

implementation

uses
  UDM, Funcoes, UControleVeiculo, CdVeiculo;

{$R *.DFM}


procedure TfMxSelControleVeiculo.SB_ConfirmarClick(Sender: TObject);
var
  DtINI, DtFIM, CdCNC, CdVEI, sSituacao, Ordem, sFiltros:string;
begin
  CdCNC:='';
  CdVEI:='';
  sSituacao:='';
  sFiltros:='';

  if not VerificaData(mskDataINI.Text) then
    Raise exception.Create('Data inicial inválida!')
  else if VerificaDataBranco(mskDataINI.Text) then
  Begin
    if rdgDataCadastro.Checked then
    Begin
      DtINI := ' AND MTV_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'" ';
      sFiltros := sFiltros + '(DtCadINI:'+mskDataINI.Text+')';
    end
    else if rdgDataAlterado.Checked then
    Begin
      DtINI := ' AND MTV_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'" ';
      sFiltros := sFiltros + '(DtAltINI:'+mskDataINI.Text+')';
    end
    else if rdgDataInicial.Checked then
    Begin
      DtINI := ' AND MTV_DT_INICIAL>="'+MesDia(mskDataINI.Text)+'" ';
      sFiltros := sFiltros + '(DtINI:'+mskDataINI.Text+')';
    end
    else if rdgDataFinal.Checked then
    Begin
      DtINI := ' AND MTV_DT_FINAL>="'+MesDia(mskDataINI.Text)+'" ';
      sFiltros := sFiltros + '(DtINI:'+mskDataINI.Text+')';
    end;
  end;

  if not VerificaData(mskDataFIM.Text) then
    Raise exception.Create('Data final inválida!')
  else if VerificaDataBranco(mskDataFIM.Text) then
  Begin
    if rdgDataCadastro.Checked then
    Begin
      DtFIM := ' AND MTV_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      sFiltros := sFiltros + '(DtCadFIM:'+mskDataFIM.Text+')';
    end
    else if rdgDataAlterado.Checked then
    Begin
      DtFIM := ' AND MTV_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ';
      sFiltros := sFiltros + '(DtAltFIM:'+mskDataFIM.Text+')';
    end;
  end;


  if ckbCodigoVEI.Checked then
    if not VerificaInteiroBranco(edtCodigoVEI.Text) then
      Raise Exception.Create('Código do Veículo inválido!')
    else
    Begin
      CdVEI := ' AND (VEI_CODIGO='+edtCodigoVEI.Text+') ';
      sFiltros := sFiltros + '(VEI='+edtCodigoVEI.Text+') ';
    end;

  if ckbCodigoCNC.Checked then
  Begin
    if dblCodigoCNC.Text = '' then
      Raise exception.Create('Centro de Custo inválido!');
    CdCNC := ' AND CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+' ';
    sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
  end;

  if ckbSituacao.Checked then
  Begin
    sSituacao := ' AND MTV_SITUACAO='+IntToStr(cmbSituacao.ItemIndex);
    sFiltros := sFiltros + '(Sit:'+cmbSituacao.text+') ';
  end;

  Ordem := ' ORDER BY CNC_CODIGO, MTV_CODIGO ';

  if tag = 0 then
  begin
    Application.CreateForm(Trpt_ControleVeiculo, rpt_ControleVeiculo);
    with rpt_ControleVeiculo do
    Begin
      Tag := 0;
      zrlfiltros.Caption := sFiltros;

      if ckbSintetico.Checked then
      Begin
        zrbDetalhe.Height   := 1;
      end;

      Entidade.Close;
      Entidade.SQL.Text:='SELECT * '+
        ' FROM  CONTROLE_VEICULO '+
        ' WHERE MTV_CODIGO>0 '+
        CdCNC+DtINI+DtFIM+CdVEI+sSituacao+
        Ordem;
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelControleVeiculo.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelControleVeiculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Parametro2.Close;
  Action := caFree;
end;

procedure TfMxSelControleVeiculo.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  mskDataINI.SetFocus;
end;

procedure TfMxSelControleVeiculo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    SB_ConfirmarClick(sender);
end;

procedure TfMxSelControleVeiculo.ckbCodigoVEIClick(Sender: TObject);
begin
  if ckbCodigoVEI.Checked then
  Begin
    edtCodigoVEI.Color:=clWindow;
    edtCodigoVEI.Enabled:=True;
    edtCodigoVEI.SetFocus;
  end
  else
  Begin
    edtCodigoVEI.Color:=AlteraCorComponentes;
    edtCodigoVEI.Clear;
    edtCodigoVEI.Enabled:=False;
  end;
end;

procedure TfMxSelControleVeiculo.edtCodigoVEIKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #32 then
  Begin
    Key := #0;
    Application.CreateForm(TfCadVeiculo, fCadVeiculo);
    with fCadVeiculo do
    Begin
      Tag := 2;
      ShowModal;
    end;
  end;
end;

procedure TfMxSelControleVeiculo.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCodigoCNC.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfMxSelControleVeiculo.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbSituacao.Enabled:=True;
    cmbSituacao.Color:=clWindow;
    cmbSituacao.ItemIndex:=0;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbSituacao.Enabled:=False;
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
  end;
end;

end.
