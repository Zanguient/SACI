unit MxSelAgenteFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, CentroCusto, DBCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls;

type
  TfMxSelAgenteFinanceiro = class(TForm)
    Panel3: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    Panel2: TPanel;
    ckbCodigoAGF: TCheckBox;
    edtCodigoAGF: TEdit;
    ckbSintetico: TCheckBox;
    ckbSituacao: TCheckBox;
    procedure SB_CancelarClick(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure ckbCodigoAGFClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelAgenteFinanceiro: TfMxSelAgenteFinanceiro;

implementation
uses UDM, funcoes, UAgen_Financeiro;
{$R *.DFM}

procedure TfMxSelAgenteFinanceiro.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelAgenteFinanceiro.SB_ConfirmarClick(Sender: TObject);
var
  CdAGF, sSit, sFiltros:string;
begin
  CdAGF:= '';
  sFiltros:='';

  if ckbCodigoAGF.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoAGF.Text) then
      Raise Exception.Create('Código do Agente Financeiro inválido!')
    else
    Begin
      CdAGF :=' AND AGF.AGF_CODIGO='+edtCodigoAGF.Text;
      sFiltros := sFiltros + '(AGF:'+edtCodigoAGF.Text+')';
    end;
  end;

  if ckbSituacao.Checked then
  Begin
    sSit := ' AND AGF.AGF_SITUACAO=1 ';
    sFiltros := sFiltros + '(Ativados)';
  end
  else
  Begin
    sSit := ' AND AGF.AGF_SITUACAO=0 ';
    sFiltros := sFiltros + '(Desativados)';
  end;

  Application.CreateForm(Trpt_agen_financeiro,rpt_agen_financeiro );
  with rpt_agen_financeiro do
  Begin
    tag:=0;
    zrlFiltros.Caption := sFiltros;

    if ckbSintetico.Checked then
      zrlDetalhe.Height := 0;
      
    Entidade.Close;
    Entidade.SQL.Text:='SELECT * '+
      ' FROM AGENTE_FINANCEIRO AGF, FATOR_DE_FINANCEIRA FAF '+
      ' WHERE AGF.AGF_CODIGO<>-1 '+
      CdAGF+sSit+
      ' AND AGF.AGF_CODIGO*=FAF.AGF_CODIGO '+
      ' ORDER BY AGF.AGF_DESCRICAO, FAF.FAF_NPARC ';
    Entidade.Open;
    if Entidade.IsEmpty then
      Raise Exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxSelAgenteFinanceiro.ckbCodigoAGFClick(Sender: TObject);
begin
  if ckbCodigoAGF.Checked then
  Begin
    edtCodigoAGF.Enabled:=True;
    edtCodigoAGF.Color:=clWindow;
    edtCodigoAGF.SetFocus;
  end
  else
  Begin
    edtCodigoAGF.Enabled:=False;
    edtCodigoAGF.Color:=AlteraCorComponentes;
    edtCodigoAGF.Clear;
  end;
end;

procedure TfMxSelAgenteFinanceiro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    SB_ConfirmarClick(sender)
  else if key =#27 then
    SB_CancelarClick(sender);
end;

procedure TfMxSelAgenteFinanceiro.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

procedure TfMxSelAgenteFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
