unit MxFrete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, ComCtrls, Buttons, Mask, Db, Transportadora,
  DBTables, SQuery, Contato, Forma_de_Pagamento, Variants;

type
  TfMxFrete = class(TForm)
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    bitConfirmar: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    rdgTipoFrete: TRadioGroup;
    Label1: TLabel;
    edtValorPerc: TEdit;
    Label5: TLabel;
    dblTransportadora: TDBLookupComboBox;
    edtICMSPerc: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    mskTelefone: TMaskEdit;
    Label9: TLabel;
    mskFax: TMaskEdit;
    Label11: TLabel;
    edtEMail: TEdit;
    Transportadora1: TTransportadora;
    DSTransportadora1: TDataSource;
    Edit5: TEdit;
    Label2: TLabel;
    Label10: TLabel;
    edtConhecimento: TEdit;
    Bevel1: TBevel;
    Label23: TLabel;
    dblFormaDePagamento: TDBLookupComboBox;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    Label7: TLabel;
    edtValor: TEdit;
    ckbFreteNota: TCheckBox;
    Bevel2: TBevel;
    procedure BitBtn2Click(Sender: TObject);
    procedure rdgTipoFreteClick(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure dblTransportadoraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorPercChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxFrete: TfMxFrete;

implementation
uses UDM, Funcoes, MxPedCompra;
{$R *.DFM}

procedure TfMxFrete.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxFrete.rdgTipoFreteClick(Sender: TObject);
begin
  case rdgTipoFrete.ItemIndex of
    0:Begin
        dblTransportadora.Enabled := False;
        dblTransportadora.Color   := AlteraCorComponentes;
        dblTransportadora.KeyValue:= 0;
        dblFormaDePagamento.Enabled := False;
        dblFormaDePagamento.Color   := AlteraCorComponentes;
        dblFormaDePagamento.KeyValue:= 0;
        mskTelefone.Clear;
        mskFax.Clear;
        edtValorPerc.Enabled := False;
        edtValorPerc.Color   := AlteraCorComponentes;
        edtValorPerc.Text    := '0';
        edtValor.Enabled := False;
        edtValor.Color   := AlteraCorComponentes;
        edtValor.Text    := '0';
        edtICMSPerc.Enabled := False;
        edtICMSPerc.Color   := AlteraCorComponentes;
        edtICMSPerc.Text    :='0';
        edtValor.Text    :='0';
        edtEMail.Clear;
        edtConhecimento.Clear;
        edtConhecimento.Color   := AlteraCorComponentes;
        ckbFreteNota.Checked := False;
        ckbFreteNota.Enabled := False;
      end;
    1:Begin
        if rdgTipoFrete.Enabled then
        Begin
          dblTransportadora.Enabled := True;
          dblTransportadora.Color   := clWindow;
          dblFormaDePagamento.Enabled := True;
          dblFormaDePagamento.Color   := clWindow;
          if dblFormaDePagamento.Text = '' then
            dblFormaDePagamento.KeyValue := 1;
          edtValorPerc.Enabled := True;
          edtValorPerc.Color   := clWindow;
          edtValor.Enabled := True;
          edtValor.Color   := clWindow;
          edtICMSPerc.Enabled := True;
          edtICMSPerc.Color   := clWindow;
          ckbFreteNota.Enabled := True;
          edtConhecimento.Enabled := True;
          edtConhecimento.Color   := clWindow;
          try
            edtConhecimento.SetFocus;
          except
          end;
        end;
      end;
  end;
end;

procedure TfMxFrete.bitConfirmarClick(Sender: TObject);
var
  CdCNC,CdPCP,iFreteNota:integer;
begin
  CdCNC := fMxPedComp.Entidade.CodigoCNC;
  CdPCP := fMxPedComp.Entidade.CodigoPCP;
  if ckbFreteNota.Checked then
    iFreteNota := 1
  else
    iFreteNota := 0;

  if rdgTipoFrete.ItemIndex = 1 then
  Begin
    if not VerificaInteiroBranco(edtConhecimento.Text) then
    Begin
      edtConhecimento.SetFocus;
      Raise Exception.Create('Número do Conhecimento invalido!');
    end
    Else if (dblFormaDePagamento.Text = '') then
    Begin
      dblFormaDePagamento.SetFocus;
      Raise Exception.Create('Número do Conhecimento invalido!');
    end
    Else if not VerificaFloatBranco(edtValorPerc.Text) then
    Begin
      edtValorPerc.SetFocus;
      Raise Exception.Create('Valor do Frete invalido!');
    end
    Else if StrToFloat(edtValorPerc.Text)<=0 then
    Begin
      edtValorPerc.SetFocus;
      Raise Exception.Create('Valor do Frete invalido!');
    end
    Else if not VerificaFloatBranco(edtValor.Text) then
    Begin
      edtValor.SetFocus;
      Raise Exception.Create('Valor do Frete invalido!');
    end
    Else if StrToFloat(edtValor.Text)<=0 then
    Begin
      edtValor.SetFocus;
      Raise Exception.Create('Valor do Frete invalido!');
    end
    Else if not VerificaFloatBranco(edtICMSPerc.Text) then
    Begin
      edtICMSPerc.SetFocus;
      Raise Exception.Create('Valor do ICMS do Frete invalido!');
    end
    Else if (StrToFloat(edtICMSPerc.Text)<0) or (StrToFloat(edtICMSPerc.Text)>100)then
    Begin
      edtICMSPerc.SetFocus;
      Raise Exception.Create('Valor do ICMS do Frete invalido!');
    end
    Else if (dblTransportadora.Text = '') then
    Begin
      dblTransportadora.SetFocus;
      Raise Exception.Create('Transportadora inválida');
    end
    Else if (dblFormaDePagamento.Text = '') then
    Begin
      dblFormaDePagamento.SetFocus;
      Raise Exception.Create('Forma de Pagamento do Frete inválido');
    end;
  end;

  if rdgTipoFrete.ItemIndex = 1 then
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_COMPRA SET '+
      ' PCP_CONHECIMENTO='+edtConhecimento.Text+
      ',PCP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ',FPG_CODIGO_TRN='+IntToStr(dblFormaDePagamento.KeyValue)+
      ',TRN_CODIGO='+IntToStr(dblTransportadora.KeyValue)+
      ',PCP_FRETE_NOTA='+IntToStr(iFreteNota)+
      ',PCP_FRETE='+VirgPonto(edtValorPerc.Text)+
      ',PCP_ICMS_FRETE='+VirgPonto(edtICMSPerc.Text)+
      ',PCP_TIPO_FRETE=1 '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PCP_CODIGO='+IntToStr(CdPCP))
  else
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_COMPRA SET '+
      ' TRN_CODIGO=0 '+
      ',PCP_FRETE_NOTA=0 '+
      ',PCP_FRETE=0 '+
      ',PCP_ICMS_FRETE=0 '+
      ',PCP_TIPO_FRETE=0 '+
      ',PCP_CONHECIMENTO=0 '+
      ',FPG_CODIGO_TRN=0 '+
      ',PCP_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PCP_CODIGO='+IntToStr(CdPCP));

  fMxPedComp.Entidade.Close;
  fMxPedComp.Entidade.Open;
  fMxPedComp.Entidade.CarregaDados;
  fMxPedComp.edtFretePercChange(sender);
  fMxPedComp.Recalcula;
  Close;
end;

procedure TfMxFrete.dblTransportadoraClick(Sender: TObject);
begin
  mskTelefone.Text :=Transportadora1.Fone;
  mskFax.Text      :=Transportadora1.Fax;
  edtEMail.Text    :=Transportadora1.EMail;
  Edit5.Text       :=Transportadora1.Uf;  
end;

procedure TfMxFrete.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Transportadora1.Close;
  Action := caFree;
end;

procedure TfMxFrete.FormShow(Sender: TObject);
begin
  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3670)) >= 0) and
     (fMxPedComp.Entidade.Situacao = 0)  then
  Begin
    rdgTipoFrete.Enabled := True;
    BitConfirmar.Enabled := True;
  end;
  if fMxPedComp.Entidade.TipoFrete = 1 then
  Begin
    rdgTipoFrete.ItemIndex       := 1;
    dblTransportadora.KeyValue   := fMxPedComp.Entidade.CodigoTRN;
    dblTransportadoraClick(sender);
    dblFormaDePagamento.KeyValue := fMxPedComp.Entidade.CodigoFPGTRN;
    edtConhecimento.Text         := IntToStr(fMxPedComp.Entidade.Conhecimento);
    edtValorPerc.Text            := format('%.4f',[fMxPedComp.Entidade.Frete]);
    edtValor.Text                := format('%.2f',[fMxPedComp.Entidade.Frete*fMxPedComp.Entidade.TotalProduto/100]);
    edtICMSPerc.Text             := format('%.2f',[fMxPedComp.Entidade.ICMSFrete]);
//    edtPrecoCusto.Text           := format('%.2f',[fMxPedComp.Entidade.TotalProduto*fMxPedComp.Entidade.Frete/100]);
  end
  else
    rdgTipoFrete.ItemIndex      := 0;
  rdgTipoFreteClick(sender);
  if edtConhecimento.Enabled then
    edtConhecimento.SetFocus;
end;

procedure TfMxFrete.FormCreate(Sender: TObject);
begin
  Transportadora1.Open;
  Forma_de_Pagamento1.Open;
end;

procedure TfMxFrete.edtValorPercChange(Sender: TObject);
begin
  try
    if edtValorPerc.Focused then
      edtValor.Text := format('%.2f',[StrToFloat(edtValorPerc.Text)*fMxPedComp.Entidade.TotalProduto/100]);
  except
    edtValor.Text := '0,00';
  end;
end;

procedure TfMxFrete.edtValorChange(Sender: TObject);
begin
  try
    if edtValor.Focused then
    Begin
      if DM.Configuracao1.Empresa = empEletro then
        edtValorPerc.Text := format('%.2f',[StrToFloat(edtValor.Text)/StrToFloat(fMxPedComp.edtTotalNota.Text)*100])
      else
        edtValorPerc.Text := format('%.2f',[StrToFloat(edtValor.Text)/StrToFloat(fMxPedComp.edtTotalProduto.Text)*100]);
    end;
  except
    edtValorPerc.Text := '0,00';
  end;
end;

end.
