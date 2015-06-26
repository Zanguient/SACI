unit MxSTransportadora;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, Transportadora, Grids, DBGrids, ExtCtrls, Buttons,
  StdCtrls;

type
  TfMxSTransportadora = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Transportadora1: TTransportadora;
    DSTransportadora1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    SB_Loc: TSpeedButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSTransportadora: TfMxSTransportadora;

implementation

uses MxNotaFiscal, funcoes, MxEmprestimo, MxSTituloPagar, MxTransferencia,
  CdComunicacao, UDM;

{$R *.DFM}


procedure TfMxSTransportadora.BitBtn2Click(Sender: TObject);
begin
  if tag = 0 then
    fMxNotaFiscal.CancelarLoc:=True;
  Close;
end;

procedure TfMxSTransportadora.SB_LocClick(Sender: TObject);
begin
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Transportadora1.Localizar;
end;

procedure TfMxSTransportadora.BitBtn1Click(Sender: TObject);
begin
  if Transportadora1.IsEmpty then
    raise Exception.Create('Selecione a transportadora!');
  if tag = 0 then //Nota Fiscal
    fMxNotaFiscal.edtCodigoTRN.Text:=IntToStr(Transportadora1.CodigoTRN)
  else if tag = 1 then //Emprestimo
    fMxEmprestimo.CdTRN := Transportadora1.CodigoTRN
  else if tag = 2 then //Rel. Título a pagar/pagos
    fMxSTituloPagar.edtCodigoTRN.Text := IntToStr(Transportadora1.CodigoTRN)
  else if tag = 3 then //Transferência
    fMxTransfer.CdTRN := Transportadora1.CodigoTRN
  else if tag = 4 then //Comunicação
  Begin
    fCadComunicacao.edtCodEntrada.Text := IntToStr(Transportadora1.CodigoTRN);
    fCadComunicacao.edtRazaoSocial.Text := Transportadora1.RazaoSocial;
  end;
  Close;
end;

procedure TfMxSTransportadora.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbCampo.ItemIndex := 3;
  edtLocalizar.SetFocus;
end;

end.
