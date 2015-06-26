unit MxNotaFiscal;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Cliente, DBCtrls, NotaFiscal, Funcionario,Variants, Transferencia,
  Item_de_Transferencia, Item_de_Troca, Item_de_Estoque, Descontos,
  Informacoes, Titulo_receber, Classificacao_fiscal, Produto,
  Item_Nota_Fiscal, Item_Pedido_Venda, Parametro, OperFisc,
  Pedido_de_Venda, Menus, Transportadora, Fornecedor, ActnList,
  XPStyleActnCtrls, ActnMan, ToolWin, ActnCtrls, ActnMenus;

type
  TfMxNotaFiscal = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoNTF: TEdit;
    Label2: TLabel;
    edtNotaFiscal: TEdit;
    edtSeloFiscal: TEdit;
    Label3: TLabel;
    edtCodigoPDV: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    edtCodigoCLI: TEdit;
    Cliente1: TCliente;
    Transportadora1: TTransportadora;
    Funcionario1: TFuncionario;
    NotaFiscal1: TNotaFiscal;
    DSNotaFiscal1: TDataSource;
    mskDataEmissao: TMaskEdit;
    mskDataEntradaSaida: TMaskEdit;
    mskHora: TMaskEdit;
    Label12: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    edtRazaoSocial: TEdit;
    Label22: TLabel;
    edtEndereco: TEdit;
    Label23: TLabel;
    edtBairro: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    mskCEP: TMaskEdit;
    edtMunicipio: TEdit;
    Label26: TLabel;
    edtUF: TEdit;
    Label28: TLabel;
    Label5: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Panel2: TPanel;
    memObservacao: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigoTRN: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    mskPlaca: TMaskEdit;
    Label19: TLabel;
    Label13: TLabel;
    Label35: TLabel;
    edtQuantidadeVolume: TEdit;
    edtEspecie: TEdit;
    edtMarca: TEdit;
    edtNumero: TEdit;
    edtPesoBruto: TEdit;
    edtPesoLiquido: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    edtBaseICMS: TEdit;
    edtICMS: TEdit;
    edtBaseICMSSub: TEdit;
    edtICMSSub: TEdit;
    edtTotalProduto: TEdit;
    edtFrete: TEdit;
    edtSeguro: TEdit;
    edtOutrasDespesas: TEdit;
    edtIPI: TEdit;
    edtTotalNota: TEdit;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    SB_Nov: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Can: TBitBtn;
    SB_Con: TBitBtn;
    bitImprimir: TBitBtn;
    SB_Exc: TSpeedButton;
    mskCNPJ: TMaskEdit;
    mskTransportadoraCNPJ: TMaskEdit;
    edtTransportadoraRazaoSocial: TEdit;
    Pedido_de_Venda1: TPedido_de_Venda;
    bitFechar: TBitBtn;
    OperFiscal1: TOperFiscal;
    DSOperFiscal1: TDataSource;
    dblNaturezaDaOperacao: TDBLookupComboBox;
    Parametro1: TParametro;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_Nota_Fiscal10: TItem_Nota_Fiscal;
    Produto1: TProduto;
    mskCGF: TMaskEdit;
    Parametro2: TParametro;
    Label9: TLabel;
    edtSerie: TEdit;
    bitItens: TBitBtn;
    Label10: TLabel;
    Label27: TLabel;
    cmbTipoTransporte: TComboBox;
    Label29: TLabel;
    cmbTipoFrete: TComboBox;
    Label16: TLabel;
    edtSubSerie: TEdit;
    Label11: TLabel;
    cmbPlacaUF: TComboBox;
    Label20: TLabel;
    Label30: TLabel;
    edtCodigoFOR: TEdit;
    Label34: TLabel;
    edtClienteCNC: TEdit;
    Label56: TLabel;
    edtAIDF: TEdit;
    Label57: TLabel;
    cmbEntradaSaida: TComboBox;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Classificacao_fiscal2: TClassificacao_fiscal;
    dblTipoNota: TDBLookupComboBox;
    Parametro3: TParametro;
    DSParametro3: TDataSource;
    edtVendedor: TEdit;
    Titulo_receber5: TTitulo_receber;
    Informacoes1: TInformacoes;
    Titulo_receber6: TTitulo_receber;
    Titulo_receber6MEDIA: TFloatField;
    Descontos1: TDescontos;
    Item_de_Estoque1: TItem_de_Estoque;
    edtCodigoTRO: TEdit;
    Label58: TLabel;
    Item_de_Troca1: TItem_de_Troca;
    Titulo_receber1: TTitulo_receber;
    ckbServico: TCheckBox;
    ckbManual: TCheckBox;
    Label18: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label60: TLabel;
    edtNumeroInscricao: TEdit;
    edtValorServico: TEdit;
    edtBaseISS: TEdit;
    edtAliquotaISS: TEdit;
    edtISS: TEdit;
    edtPedidoCNC: TEdit;
    edtNotaCupomAntigo: TEdit;
    Titulo_receber3: TTitulo_receber;
    Item_de_Transferencia2: TItem_de_Transferencia;
    Transferencia2: TTransferencia;
    Item_de_Transferencia1: TItem_de_Transferencia;
    Transferencia1: TTransferencia;
    DSTransferencia1: TDataSource;
    Item_de_Estoque2: TItem_de_Estoque;
    edtEmissaoNotaAntiga: TEdit;
    NotaFiscal2: TNotaFiscal;
    Label59: TLabel;
    edtCodPagamento: TEdit;
    Label61: TLabel;
    Titulo_receber2: TTitulo_receber;
    edtCodPagamento2: TEdit;
    Fornecedor1: TFornecedor;
    edtICMSFrete: TEdit;
    Label62: TLabel;
    Image1: TImage;
    OperFiscal1OPF_CODIGO: TIntegerField;
    OperFiscal1CNC_CODIGO: TIntegerField;
    OperFiscal1OPF_DESCRICAO: TStringField;
    OperFiscal1OPF_TIPO: TIntegerField;
    OperFiscal1OPF_OBSERVACAO: TStringField;
    OperFiscal1USU_CODIGO: TIntegerField;
    OperFiscal1OPF_DT_CADASTRO: TDateTimeField;
    OperFiscal1OPF_DT_ALTERADO: TDateTimeField;
    OperFiscal1OPF_ENTRADA: TIntegerField;
    OperFiscal1OPF_SAIDA: TIntegerField;
    OperFiscal1CFOPDescricao: TStringField;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Sair1: TAction;
    MenuItem3: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    cmbSituacao: TComboBox;
    Label55: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SB_CanClick(Sender: TObject);
    procedure SB_ConClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_NovClick(Sender: TObject);
    procedure bitItensClick(Sender: TObject);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure edtCodigoPDVExit(Sender: TObject);
    procedure edtCodigoTRNExit(Sender: TObject);
    procedure bitImprimirClick(Sender: TObject);
    procedure NotaFiscal1AfterScroll(DataSet: TDataSet);
    procedure bitFecharClick(Sender: TObject);
    procedure edtCodigoPDVKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPDVEnter(Sender: TObject);
    procedure edtCodigoCLIEnter(Sender: TObject);
    procedure edtFreteExit(Sender: TObject);
    procedure edtSeguroExit(Sender: TObject);
    procedure edtOutrasDespesasExit(Sender: TObject);
    procedure edtFreteEnter(Sender: TObject);
    procedure edtSeguroEnter(Sender: TObject);
    procedure edtOutrasDespesasEnter(Sender: TObject);
    procedure edtCodigoTRNEnter(Sender: TObject);
    procedure edtCodigoTRNKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure SB_AltClick(Sender: TObject);
    procedure cmbTipoFreteClick(Sender: TObject);
    procedure NotaFiscal1BeforeOpen(DataSet: TDataSet);
    procedure Produto1AfterOpen(DataSet: TDataSet);
    procedure dblTipoNotaClick(Sender: TObject);
    procedure dblNaturezaDaOperacaoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Pedido_de_Venda1BeforeOpen(DataSet: TDataSet);
    procedure Item_Pedido_Venda1BeforeOpen(DataSet: TDataSet);
    procedure edtUFExit(Sender: TObject);
    procedure OperFiscal1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Entidade:TNotaFiscal;
    Cancelar,CancelarLoc,SimplesRemessaCupom:Boolean;
    PedAnt,CliAnt,TransAnt,CdArquiteto:Integer;
    FreteAnt,SeguroAnt,OutrasDespAnt:Double;
    function ConfirmaInclusao: Boolean;
  end;

var
  fMxNotaFiscal: TfMxNotaFiscal;

implementation
Uses
  UDM, MxItemNF,funcoes, MxSPediLoc, MxSTransportadora, MxSNotaCupom,
  CdCliente, DigSenha, UNotaFiscalLBM, UNotaFiscalPetromax,
  UNotaFiscalMotCal, MxSCotaFor, MxPacoteVenda, UNotaFiscalEletro,
  MxLocalizaPacote, UNotaFiscalLuciano;
{$R *.DFM}


procedure TfMxNotaFiscal.FormCreate(Sender: TObject);
begin
  Entidade := NotaFiscal1;
  SimplesRemessaCupom := False;
end;

procedure TfMxNotaFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if SB_Con.Enabled then
    raise Exception.Create('Salve ou cancele as alterações!');
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfMxNotaFiscal.FormShow(Sender: TObject);
var
  iQtdFolhas: integer;
begin
  DM.Usuario1.ConfiguraTela(self);
  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
  Begin
    ckbManual.Visible := False;
    if self.tag <> 2 then //
      ckbServico.Checked := True;
  end
  else
  Begin
    ckbServico.Visible := False;
    ckbServico.Checked := False;
  end;

  with Parametro3 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM PARAMETRO '+
      ' WHERE PAR_SITUACAO=0 '+
      ' AND TPR_CODIGO=14 '+
      ' AND (PAR_CODIGO IN (4450,4490) '+
      ' OR PAR_CODIGO IN '+
      ' (SELECT OPF_TIPO FROM OPERACAO_FISCAL '+
      '  WHERE OPF_SITUACAO=0)) '+
      ' ORDER BY PAR_DESCRICAO '; 
    Open;
  end;

  Entidade.Open;
  Item_Nota_Fiscal10.Close;
  Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asInteger := Entidade.CNCOrigem;
  Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
  Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := Entidade.CodigoNTF;
  Item_Nota_Fiscal10.Open;
  if Entidade.IsEmpty then
    ckbManual.Enabled := True;

  If ((DM.Usuario1.Permissoes.IndexOf(IntToStr(3650)) > 0) and
      (DM.Configuracao1.Empresa = 1)) or
     ((DM.Configuracao1.Empresa = empLBM) and
      (DM.Configuracao1.CodigoCNC<>3))then
    ckbServico.Visible := True;

  bitImprimir.SetFocus;
  CdArquiteto := 0;
  if not Entidade.IsEmpty then
  Begin
    Pedido_de_Venda1.Close;
    Pedido_de_Venda1.Open;
    if (dblTipoNota.KeyValue <> 460) then //Diferente de Pacote de Venda
      CdArquiteto := Pedido_de_Venda1.FieldByName('FUN_ARQUITETO').asInteger;
  end;

  if (self.tag in [1,4]) then //Nota Normal ou Remessa
  Begin
    ckbManual.Checked     := fMxSNotaCupom.ckbManual.Checked;
    SB_NovClick(sender);
    ckbServico.Checked    := fMxSNotaCupom.ckbServico.Checked;
    edtPedidoCNC.Text     := IntToStr(fMxSNotaCupom.Pedido_de_Venda1.CodigoCNC);
    edtClienteCNC.Text    := IntToStr(fMxSNotaCupom.Pedido_de_Venda1.ClienteCNC);
    edtCodigoPDV.Text     := IntToStr(fMxSNotaCupom.Pedido_de_Venda1.CodigoPDV);
    CdArquiteto           := fMxSNotaCupom.Pedido_de_Venda1.FieldByName('FUN_ARQUITETO').asInteger;
    edtCodigoPDVExit(sender);
    ConfirmaInclusao;
    //Carregar Número da Nota e demais informações
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT '+
        ' DISTINCT T2.CNC_CODIGO, T2.NTF_CODIGO, P1.PRD_SERVICO, S1.SGP_DESCRICAO, S1.SGP_CODIGO '+
        ' FROM ITEM_DE_NOTA_FISCAL T2, PRODUTO P1, SUBGRUPO S1 '+
        ' WHERE T2.CNC_ORIGEM='+IntToStr(Entidade.CNCOrigem)+
        ' AND T2.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND T2.NTF_CODIGO='+IntToStr(Entidade.CodigoNTF)+
        ' AND P1.PRD_CODIGO=T2.PRD_CODIGO '+
        ' AND P1.SGP_CODIGO=S1.SGP_CODIGO ';
      Open;
      if RecordCount <= confItensNota[empMotical] then
        iQtdFolhas := 1
      else
      Begin
        iQtdFolhas := (RecordCount div confItensNota[empMotical]);
        if (RecordCount mod confItensNota[empMotical]) > 0 then
          iQtdFolhas := iQtdFolhas + 1;
      end;
      if iQtdFolhas > 1 then
        ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
          ' CTR_NOTA_SELO=CTR_NOTA_SELO+'+IntToStr(iQtdFolhas-1)+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND CTR_TIPO_NOTA=0');
    end;
  end
  else if self.tag = 3 then //Pacote de Venda
  Begin
    Pedido_de_Venda1.SQL.Text := 'SELECT * '+
      ',PCT_SITUACAO AS PDV_SITUACAO '+
      ',PCT_NOTA_FISCAL AS PDV_NOTA_FISCAL '+
      ',PCT_EM_USO AS PDV_EM_USO '+
      ',PCT_TIPO_PAG AS PDV_TIPO_PAG '+
      ',PCT_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
      ',PCT_NOTA_CUPOM AS PDV_NOTA_CUPOM '+
      ',PCT_ENTRADA AS PDV_ENTRADA '+
      ' FROM PACOTE_DE_VENDA '+
      ' WHERE CNC_CODIGO=:CNC_CODIGO '+
      ' AND PDV_CODIGO=:PDV_CODIGO ';
    Item_Pedido_Venda1.SQL.Text := 'SELECT *, '+
      ' (SELECT MAX(P1.PRD_CODIGO) FROM PRODUTO P1 '+
      ' WHERE P1.SGP_CODIGO=I1.SGP_CODIGO_1) AS PRD_CODIGO, '+
      ' IPC_QUANTIDADE AS IPV_QUANTIDADE, '+
      ' IPC_PRECO AS IPV_PRECO, '+
      ' IPC_PRECO_DESCONTO AS IPV_PRECO_DESC '+
      ' FROM ITEM_DE_PACOTE_DE_VENDA I1 '+
      ' WHERE I1.CNC_CODIGO=:CNC_CODIGO '+
      ' AND I1.PDV_CODIGO=:PDV_CODIGO ';
    ckbManual.Checked     := False;
    SB_NovClick(sender);
    ckbServico.Checked    := False;
    edtPedidoCNC.Text     := IntToStr(fMxPacoteVenda.Pacote_de_venda1.CodigoCNC);
    edtClienteCNC.Text    := IntToStr(fMxPacoteVenda.Pacote_de_venda1.ClienteCNC);
    edtCodigoPDV.Text     := IntToStr(fMxPacoteVenda.Pacote_de_venda1.CodigoPDV);
    CdArquiteto           := 0;
    edtCodigoPDVExit(sender);
    ConfirmaInclusao;
  end
  else
    edtCodigoPDV.ReadOnly := False;
end;

procedure TfMxNotaFiscal.SB_CanClick(Sender: TObject);
var
  NTF:Integer;
begin
  edtEndereco.Enabled := False;
  edtBairro.Enabled := False;
  edtMunicipio.Enabled := False;
  edtUF.Enabled := False;
  mskCEP.Enabled := False;

  if self.tag <> 2 then //Não avulso
    if (Entidade.Estado = 1) and (not ckbManual.Checked) then
      ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
          ' CTR_NOTA_FISCAL=CTR_NOTA_FISCAL-1 '+
          ',CTR_NOTA_SELO=CTR_NOTA_SELO-1 '+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND CTR_TIPO_NOTA=0')
    else if (Entidade.Estado = 1) then
      ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
          ' CTR_NOTA_FISCAL=CTR_NOTA_FISCAL-1 '+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND CTR_TIPO_NOTA=1');
  SB_Nov.Enabled:=True;
  Incluir1.Enabled:=True;
  SB_Con.Enabled:=False;
  SB_Can.Enabled:=False;
  bitFechar.Enabled:=True;
  ckbServico.Enabled := False;
  try
    NTF:=StrToInt(edtCodigoNTF.Text);
  except
    NTF := 0;
  end;
  Entidade.CancelaEdicao;
  DM.QR_Comandos.Close;
  DM.QR_Comandos.SQL.Text:='SELECT * FROM NOTA_FISCAL '+
    ' WHERE NTF_CODIGO='+IntToStr(NTF)+
    ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
  DM.QR_Comandos.Open;
  if not DM.QR_Comandos.IsEmpty then
  Begin
    SB_Alt.Enabled:=True;
    Alterar1.Enabled:=True;
    SB_Exc.Enabled:=True;
    Excluir1.Enabled:=True;
    bitItens.Enabled:=True;
    MenuItem3.Enabled:=True;
    bitImprimir.Enabled:=True;
  end
  else
  Begin
    Entidade.LimpaDados;
    edtTransportadoraRazaoSocial.Clear;
    edtRazaoSocial.Clear;
    edtEndereco.Clear;
    edtBairro.Clear;
    edtMunicipio.Clear;
    edtUF.Clear;
    mskCEP.Clear;
    mskCNPJ.Clear;
    mskTransportadoraCNPJ.Clear;
    mskCGF.Clear;
    memObservacao.Clear;
    edtNumeroInscricao.Clear;
    edtValorServico.Clear;
    edtAliquotaISS.Clear;
    ckbManual.Enabled := True;
  end;
end;

procedure TfMxNotaFiscal.SB_ConClick(Sender: TObject);
Begin
  if (self.tag = 2) then
  Begin
    if (not VerificaDataBranco(mskDataEntradaSaida.Text)) then
      Raise Exception.Create('Data de Entrada/Saída inválida!');
  end;
  ConfirmaInclusao;
end;

procedure TfMxNotaFiscal.SB_ExcClick(Sender: TObject);
var
  iNota, CdCNC,CdNTF, iQtdFolhas:Integer;
  trans:boolean;
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há Nota a ser excluída!');
  if Entidade.CentroDeCusto <> DM.Configuracao1.CodigoCNC then
  Begin
    if (DM.Configuracao1.Empresa <> empEletro) or
       (DM.Configuracao1.CodigoCNC <> 11) or //Depósito
       (Entidade.CentroDeCusto <> 0) then //CPD
      Raise exception.Create('Não pode gerar nota nesse centro de custo!');
  end;
      
  if MessageDlg('Deseja excluir esta Nota?', mtConfirmation, [mbYes, mbNo], 0) = mrYES then
  Begin
    CdCNC:=Entidade.CodigoCNC;
    CdNTF:=Entidade.CodigoNTF;
    iNota := Entidade.NotaFiscal;

    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        if not Entidade.Avulsa then //Não Avulsa
        Begin
          //Carregar Número da Nota e demais informações
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT '+
              ' DISTINCT T2.CNC_CODIGO, T2.NTF_CODIGO, P1.PRD_SERVICO, S1.SGP_DESCRICAO, S1.SGP_CODIGO '+
              ' FROM ITEM_DE_NOTA_FISCAL T2, PRODUTO P1, SUBGRUPO S1 '+
              ' WHERE T2.CNC_ORIGEM='+IntToStr(Entidade.CNCOrigem)+
              ' AND T2.CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
              ' AND T2.NTF_CODIGO='+IntToStr(Entidade.CodigoNTF)+
              ' AND P1.PRD_CODIGO=T2.PRD_CODIGO '+
              ' AND P1.SGP_CODIGO=S1.SGP_CODIGO ';
            Open;
            if RecordCount <= confItensNota[empMotical] then
              iQtdFolhas := 1
            else
            Begin
              iQtdFolhas := (RecordCount div confItensNota[empMotical]);
              if (RecordCount mod confItensNota[empMotical]) > 0 then
                iQtdFolhas := iQtdFolhas + 1;
            end;
          end;

          if not ckbManual.Checked then
            ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
              ' CTR_NOTA_FISCAL=CTR_NOTA_FISCAL-1 '+
              ',CTR_NOTA_SELO=CTR_NOTA_SELO-'+IntToStr(iQtdFolhas)+
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND CTR_TIPO_NOTA=0')
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
              ' CTR_NOTA_FISCAL=CTR_NOTA_FISCAL-1 '+
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND CTR_TIPO_NOTA=1');
        end;

        ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_NOTA_FISCAL '+
          ' WHERE CNC_ORIGEM='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND NTF_CODIGO='+IntToStr(CdNTF));
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM NOTA_FISCAL '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND NTF_CODIGO='+IntToStr(CdNTF));

        if not DM.Usuario1.GeraLog(6760, CdCNC, iNota, 'NTF:'+IntToStr(CdNTF)) then
        Begin
          ShowMessage('Falha ao gerar LOG!');
          Raise exception.Create('');
        end;

        If DM.Configuracao1.ControleTransacao then
          Commit;
      except
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          end;
      end;
    End;
  end;

  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaDados;
    edtTransportadoraRazaoSocial.Clear;
    edtRazaoSocial.Clear;
    edtEndereco.Clear;
    edtBairro.Clear;
    edtMunicipio.Clear;
    edtUF.Clear;
    mskCEP.Clear;
    mskCNPJ.Clear;
    mskTransportadoraCNPJ.Clear;
    mskCGF.Clear;
    memObservacao.Clear;
    edtNumeroInscricao.Clear;
    edtValorServico.Clear;
    edtAliquotaISS.Clear;
    ckbManual.Enabled := True;
  end;
end;

procedure TfMxNotaFiscal.SB_NovClick(Sender: TObject);
begin
  if not Entidade.IsEmpty then
    Raise Exception.Create('Imprima ou exclua a nota Nota que está em aberto!');

  if Entidade.CentroDeCusto <> DM.Configuracao1.CodigoCNC then
  Begin
    if (DM.Configuracao1.Empresa <> empEletro) or
       (DM.Configuracao1.CodigoCNC <> 11) or //Depósito
       (Entidade.CentroDeCusto <> 0) then //CPD
      Raise exception.Create('Não pode gerar nota nesse centro de custo!');
  end;

  if self.tag = 2 then //Avulsa
  Begin
    SB_Con.Enabled:=True;
    Entidade.PreparaInsercao(ckbManual.Checked, True);
  end
  else
  Begin
    SB_Con.Enabled:=True;
    Entidade.PreparaInsercao(ckbManual.Checked);
  end;

  if (self.tag in [0,1,3,4]) then
  Begin
    if self.tag = 1 then
    Begin
      if fMxSNotaCupom.SimpRemessa then
        dblTipoNota.KeyValue := 364  //Simples Remessa
      else
        dblTipoNota.KeyValue := 361; //Venda
      dblNaturezaDaOperacaoClick(sender);
    end
    else if tag = 3 then
      dblTipoNota.KeyValue := 460  //Venda Pacote Entrega Futura Nota Mãe
    else if tag = 4 then
      dblTipoNota.KeyValue := 364  //Simples Remessa
    else
      dblTipoNota.KeyValue := 361;  //Venda

    dblTipoNotaClick(sender);
    dblNaturezaDaOperacaoClick(sender);
  end;
  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(4020)) < 0) then
    dblTipoNota.Enabled:=False;
  cmbTipoFreteClick(sender);
  SB_Nov.Enabled:=False;
  Incluir1.Enabled:=False;
  SB_Alt.Enabled:=False;
  Alterar1.Enabled:=False;
  SB_Exc.Enabled:=False;
  Excluir1.Enabled:=False;
  SB_Can.Enabled:=True;
  bitItens.Enabled:=False;
  MenuItem3.Enabled:=False;
  bitImprimir.Enabled:=False;
  bitFechar.Enabled:=False;
  ckbManual.Enabled := False;
  if (DM.Configuracao1.Empresa = empLBM) then
    ckbServico.Enabled := True
  else
    ckbServico.Enabled := False;
  try
    if self.tag <> 2 then
      edtCodigoPDV.SetFocus
    else
      dblTipoNota.SetFocus;
  except
  end;
end;

procedure TfMxNotaFiscal.bitItensClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione a Nota Fiscal!');
  //Correção de Dados
  if dblTipoNota.KeyValue = 363 then
    Raise Exception.Create('Não existe itens para uma nota de Correção!');
  if Entidade.CentroDeCusto <> DM.Configuracao1.CodigoCNC then
  Begin
    if (DM.Configuracao1.Empresa <> empEletro) or
       (DM.Configuracao1.CodigoCNC <> 11) or //Depósito
       (Entidade.CentroDeCusto <> 0) then //CPD
      Raise exception.Create('Não pode gerar nota nesse centro de custo!');
  end;


  Application.CreateForm(TfMxSItemNF, fMxSItemNF);
  //Serviço
  if (dblTipoNota.KeyValue = 368) then
  Begin
    fMxSItemNF.labDescAliqICMS.Visible := False;
    fMxSItemNF.labDescAliqICMS.Top     := 25;
    fMxSItemNF.edtAliquota.Visible := False;    
    fMxSItemNF.edtValorTotal.Width := 103;
    fMxSItemNF.edtProduto.Width := 361;
    fMxSItemNF.labDesTipo.Visible:=False;
    fMxSItemNF.cmbTipoICMS.Visible:=False;
    fMxSItemNF.lblDescProduto.Caption:='Descriçao do Serviço';
    fMxSItemNF.lblDadosDoProduto.Caption:='Dados do Serviço';
    fMxSItemNF.Caption := 'Serviços da Nota Nº: '+IntToStr(Entidade.NotaFiscal)+
       ' - Pedido: '+IntToStr(Entidade.Pedido);
  end
  else
    fMxSItemNF.Caption := 'Produtos da Nota Nº: '+IntToStr(Entidade.NotaFiscal)+
       ' - Pedido: '+IntToStr(Entidade.Pedido);
  fMxSItemNF.NotaFiscal1.Close;
  fMxSItemNF.NotaFiscal1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  fMxSItemNF.NotaFiscal1.ParamByName('NTF_CODIGO').asInteger:=StrToInt(edtCodigoNTF.Text);
  fMxSItemNF.NotaFiscal1.Open;
  fMxSItemNF.Item_Nota_Fiscal1.Close;
  fMxSItemNF.Item_Nota_Fiscal1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  fMxSItemNF.Item_Nota_Fiscal1.ParamByName('NTF_CODIGO').asInteger:=StrToInt(edtCodigoNTF.Text);
  fMxSItemNF.Item_Nota_Fiscal1.Open;
  fMxSItemNF.ShowModal;
  Entidade.AlterarAuto;
end;

procedure TfMxNotaFiscal.edtCodigoCLIExit(Sender: TObject);
begin
  if SB_Can.Focused then
    Exit;

  if edtCodigoCLI.Text <> '' then
    if VerificaInteiro(edtCodigoCLI.Text) then
    Begin
      //Diferente de Devolução de Compra
      if (dblNaturezaDaOperacao.KeyValue <> 5202) and //Dev.Compra
         (dblNaturezaDaOperacao.KeyValue <> 6202) and //Dev.Compra
         (dblTipoNota.KeyValue <> 4240) and //Aquisição
         (dblTipoNota.KeyValue <> 4450) and //Remessa de Troca
         (dblTipoNota.KeyValue <> 4490) and //Remessa em Garantia
         (dblTipoNota.KeyValue <> 360) and  //Compra
         (dblTipoNota.KeyValue <> 451) then //Imobilizado
      Begin
        with Cliente1 do
        Begin
          Close;
          ParamByName('CLI_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
          if (not Pedido_de_Venda1.IsEmpty) and (self.tag <> 2) then
            ParamByName('CNC_CODIGO').asInteger := Pedido_de_Venda1.ClienteCNC
          else
          Begin
            if (edtClienteCNC.Enabled) and (Trim(edtClienteCNC.Text) = '') then
            Begin
              if DM.Configuracao1.Empresa = empLBM then
                edtClienteCNC.Text := '1'
              else
                edtClienteCNC.Text := IntToStr(DM.Configuracao1.codigoCNC);
            end;
            ParamByName('CNC_CODIGO').asInteger := StrToInt(edtClienteCNC.Text);
          end;
          Open;
          If not IsEmpty then
          Begin
            Parametro1.Close;
            Parametro1.ParamByName('PAR_CODIGO').asInteger:=Logradouro;
            Parametro1.Open;
            edtRazaoSocial.Text    := RazaoSocial;
            if PessoaFisica then
              mskCNPJ.EditMask := '999-999-999-99;0;_'
            else
              mskCNPJ.EditMask := '99-999-999/9999-99;0;_';
            mskCNPJ.Text := CPFCGC;
            mskCGF.Text := CGFRG;
            // Diferente de Simples Remessa
            if (dblTipoNota.KeyValue <> 364) or (Trim(edtEndereco.Text) = '') then
            Begin
              edtEndereco.Text  := Trim(Parametro1.Descricao+' '+Endereco);
              edtBairro.Text    := Bairro;
              mskCEP.Text       := CEP;
              edtMunicipio.Text := Cidade;
              edtUF.Text        := Uf;
            end;
          end
          else
          Begin
            edtRazaoSocial.Clear;
            mskCNPJ.Clear;
            edtEndereco.Clear;
            edtBairro.Clear;
            mskCEP.Clear;
            edtMunicipio.Clear;
            edtUF.Clear;
          end;
        end;
      end
      else //Devolução de Compra ou Aquisição ou Imobilizado
      Begin
        with Fornecedor1 do
        Begin
          Close;
          ParamByName('FOR_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
          Open;
          If not IsEmpty then
          Begin
            Parametro1.Close;
            Parametro1.ParamByName('PAR_CODIGO').asInteger:=Logradouro;
            Parametro1.Open;
            edtRazaoSocial.Text    := RazaoSocial;
            mskCNPJ.EditMask := '999-999-999-99;0;_';
            mskCNPJ.Text := CPFCGC;
            mskCGF.Text := IE;
            edtEndereco.Text  := Trim(Parametro1.Descricao+' '+Endereco);
            edtBairro.Text    := Bairro;
            mskCEP.Text       := CEP;
            edtMunicipio.Text := Cidade;
            edtUF.Text        := Uf;
            if (dblTipoNota.KeyValue = 362) then  //Devolução
            Begin
              if Uf <> DM.Configuracao1.UF then
                dblNaturezaDaOperacao.KeyValue := 6202
              else
                dblNaturezaDaOperacao.KeyValue := 5202;
            end
            else if (dblTipoNota.KeyValue = 360) then  //Compra
            Begin
              if Uf <> DM.Configuracao1.UF then
                dblNaturezaDaOperacao.KeyValue := 2102
              else
                dblNaturezaDaOperacao.KeyValue := 1102;
            end;
            dblTipoNota.Enabled := False;
            dblNaturezaDaOperacao.Enabled := False;
          end
          else
          Begin
            edtRazaoSocial.Clear;
            mskCNPJ.Clear;
            edtEndereco.Clear;
            edtBairro.Clear;
            mskCEP.Clear;
            edtMunicipio.Clear;
            edtUF.Clear;
          end;
        end;
      end;
    end
    else
    Begin
      ShowMessage('Código de Cliente/Fornecedor inválido!');
      try
        edtCodigoCLI.SetFocus;
      except
      end;
    end;
end;

procedure TfMxNotaFiscal.edtCodigoPDVExit(Sender: TObject);
var
  PrecoGuerra,ValorICMS,precoP,PrecoS,PrecoPS,PrecoISS,PrecoICMS,PrecoICMSS, PrecoUnitNota,
    ServicoTotal, PrecoUnitario, DescontoUnitario, QuantidadeEmitida, vAliqISS :Double;
  TipoAliq : Integer;
  OBS1,OBS2,OBS3,OBS4,OBS5,OBS6,OBS7,sDescProduto: String;
begin
  OBS1:='';
  OBS2:='';
  OBS3:='';
  OBS4:='';
  OBS5:='';
  OBS6:='';
  OBS7:='';
  CdArquiteto := 0;
  vAliqISS := DM.Configuracao1.AliquotaISS;
  if (edtCodigoPDV.Text = '0') or
     (edtCodigoPDV.Text = '') then
  Begin
    edtCodigoCLI.Enabled := True;
    edtCodigoCLI.SetFocus;
    Exit;
  end;
  TipoAliq := 0;
  ServicoTotal := 0;
  ckbServico.Enabled := False;
  if (edtCodigoPDV.Text <> '') and (SB_Con.Enabled) then //Não Avulso
  Begin
    if (edtCodigoPDV.Text <> '0') then
      dblTipoNota.Enabled := False
    else if SB_Con.Enabled then
      dblTipoNota.Enabled := True;
    if (VerificaInteiro(edtCodigoPDV.Text)) and
       (edtCodigoPDV.Text<>IntToStr(PedAnt)) and
       (self.tag <> 2) then
    Begin
      Pedido_de_Venda1.Close;
      Pedido_de_Venda1.Open;
      //
      if dblTipoNota.KeyValue = 362 then //Devolução
      begin
        DM.QR_Consultas.Close;
        DM.QR_Consultas.SQL.Text := 'SELECT * FROM NOTA_FISCAL '+
          ' WHERE NTF_NOTA_FISCAL='+IntToStr(Pedido_de_Venda1.NotaFiscal)+
          ' AND NTF_TIPO_NOTA=361 '+
          ' ORDER BY NTF_DT_EMISSAO DESC ';
        DM.QR_Consultas.Open;
        if DM.QR_Consultas.IsEmpty then
          Raise Exception.Create('Nota Fiscal deste pedido NÃO Encontrada para Devolução!');
        if (DM.QR_Consultas.FieldByName('NTF_BASE_ISS').asFloat > 0) and (self.tag <> 2) then
          ckbServico.Checked := True
        else
          ckbServico.Checked := False;
      end;
      //
      if (dblTipoNota.KeyValue <> 460) then //Diferente de Pacote de Venda
        CdArquiteto := Pedido_de_Venda1.FieldByName('FUN_ARQUITETO').asInteger;
      if not Pedido_de_Venda1.IsEmpty then
      Begin
        if dblTipoNota.KeyValue = 361 then //Venda
        Begin
          if (Pedido_de_Venda1.Situacao <> 4) or
             (Pedido_de_Venda1.NotaFiscal > 0) or
             (Pedido_de_Venda1.NotaFiscal <= -1) or //LJ3/LJ4
             ((Pedido_de_Venda1.EntregaDeposito) and
              (DM.Configuracao1.CodigoCNC <> 11)) or
             ((Pedido_de_Venda1.EmUsu = 1) AND
              (not self.tag in [1,3,5])) or
              ((DM.Configuracao1.Empresa = empMotical) and       //Se Motical Pedido Pendente não Faturado
               (Pedido_de_Venda1.TipoDeVenda = 1) and   //Faturamento Pendente
               (Pedido_de_Venda1.CodigoFPE = 0)) then   //Não Faturado ainda
          Begin
            edtCodigoPDV.Text:='0';
            Raise Exception.Create('Esse pedido não está disponível para ser faturado!');
          end;
          // 1-Apresentacao    2-A Vista     3-A Prazo      4-Cartao
          //                                 CH/DP/BO       VISA/MASTER/AMERICA/HIPER
          // 0                 0             10/20/30       40  /50    /60     /70
          edtCodPagamento2.Text := '0';
          if (Pedido_de_Venda1.CodigoFPG = 11) and (DM.Configuracao1.Empresa = empLBM) then
            edtCodPagamento.Text := '1'
          else if (Pedido_de_Venda1.TipoPag = 13) then // Cartão
          Begin
            edtCodPagamento.Text := '4';
            if DM.Configuracao1.Empresa = empLBM then
            Begin
              case Pedido_de_Venda1.CodigoAGF of
                7: edtCodPagamento2.Text := '40';
                8: edtCodPagamento2.Text := '50';
                9: edtCodPagamento2.Text := '60';
               10: edtCodPagamento2.Text := '70';
              end;
            end
            else
              edtCodPagamento2.Text := IntToStr(Pedido_de_Venda1.CodigoAGF);
          end
          else if (Pedido_de_Venda1.CodigoFPG = 1) then // AVista
            edtCodPagamento.Text := '2'
          else
          Begin
            edtCodPagamento.Text := '3';
            case Pedido_de_Venda1.TipoPag of
              6: edtCodPagamento2.Text := '10'; //Cheque
            416: edtCodPagamento2.Text := '20'; //Depósito em Conta
            412: edtCodPagamento2.Text := '30'; //Boleto Bancário
            end;
          end;
        end
        else if dblTipoNota.KeyValue = 364 then //Simples Remessa
        Begin
          with NotaFiscal2 do
          Begin
            if SB_Can.Focused then
              Exit;
            Close;
            ParamByName('CNC_PEDIDO').asInteger := Pedido_de_Venda1.CodigoCNC;
            if Pedido_de_Venda1.CodigoPacote > 0 then
            Begin
              ParamByName('NTF_PEDIDO').asInteger := Pedido_de_Venda1.CodigoPacote;
              ParamByName('NTF_TIPO_NOTA').asInteger := 460; //Venda
            end
            else
            Begin
              ParamByName('NTF_PEDIDO').asInteger := Pedido_de_Venda1.CodigoPDV;
              ParamByName('NTF_TIPO_NOTA').asInteger := 361; //Venda
            end;
            Open;
            if CodigoCNC <> DM.Configuracao1.CodigoCNC then
            Begin
              ShowMessage('Nota de Venda emitida em outro Centro de Custo!');
              SB_Can.SetFocus;
              SB_CanClick(sender);
              Exit;
            end;
            if (BaseISS > 0) and (self.tag <> 2) then
              ckbServico.Checked := True
            else
              ckbServico.Checked := False;
            if NotaCupom = 2 then
            Begin
              SimplesRemessaCupom := True;
              dblNaturezaDaOperacao.KeyValue := 5929;
            end;
          end;
        end;

        edtClienteCNC.Text := IntToStr(Pedido_de_Venda1.ClienteCNC);
        edtCodigoCLI.Text  := IntToStr(Pedido_de_Venda1.CodigoCLI);
        if Pedido_de_Venda1.CodigoPacote = 0 then
        Begin
          edtNotaCupomAntigo.Text := IntToStr(Pedido_de_Venda1.NotaFiscal);
          if Pedido_de_Venda1.DataEmissaoVenda > 0 then
            edtEmissaoNotaAntiga.Text := DateToStr(Pedido_de_Venda1.DataEmissaoVenda)
          else
            edtEmissaoNotaAntiga.Clear;
        end
        else //Remessa de Pacote de Venda
        Begin
          edtNotaCupomAntigo.Text := IntToStr(NotaFiscal2.NotaFiscal);
          if NotaFiscal2.DataEmissao > 0 then
            edtEmissaoNotaAntiga.Text := DateToStr(NotaFiscal2.DataEmissao)
          else
            edtEmissaoNotaAntiga.Clear;
        end;

        edtCodigoCLIExit(sender);

        ValorICMS := 0;
        if (dblTipoNota.KeyValue <> 363) and //Correção
           (dblTipoNota.KeyValue <> 364) and
           (dblTipoNota.KeyValue <> 451) and //Imobilizado
           (dblTipoNota.KeyValue <> 4450) and //Remessa de Troca
           (dblTipoNota.KeyValue <> 4490) and //Remessa em Garantia           
           (dblTipoNota.KeyValue <> 4240) then //Simples Remessa
        Begin
          if (not Cliente1.PessoaFisica) and
             (Cliente1.CGFRG <> '') and
             (Cliente1.UF <> DM.Configuracao1.UF) then
            ValorICMS := 12;
        end;

        if UpperCase(edtUF.Text) = DM.Configuracao1.UF then
        Begin
          //Diferente de Simples Remessa e de Devolução
          if (not (DM.Configuracao1.Empresa IN [empEletro,empPetromax])) and
             ((dblTipoNota.KeyValue <> 364) and (dblTipoNota.KeyValue <> 362)) and
             ((Cliente1.CGFRG = '') or (Cliente1.PessoaFisica)) and
             (not ckbManual.Checked) then
          Begin
            if (not Cliente1.PessoaFisica) and (Cliente1.CGFRG = '') then
            Begin
              if MessageDlg('Cliente sem CGF!'+#13+
                            'Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                Exit
              else
              Begin
                If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6350)) < 0) then
                Begin
                  Application.CreateForm(TDigitaSenha, DigitaSenha);
                  With DigitaSenha do
                  Begin
                    onClose:=nil;
                    Tag:=25;
                    Cancelar:=False;
                    Showmodal;
                    If not cancelar Then
                    Begin
                      if (Usuario1.Permissoes.IndexOf(IntToStr(6350)) < 0)then
                      begin
                        free;
                        raise Exception.Create('O usuário não tem permissão para emitir Nota sem CGF!');
                      end;
                    end
                    else
                    begin
                      free;
                      exit;
                    end;
                    free;
                  End;
                end;
//                else
//                  DM.Usuario1.GeraLog(6350, CdCNC, CdPDV,
//                    ' CLI: '+PreencheZero(2,Cliente1.CodigoCNC)+'-'+IntToStr(Cliente1.CodigoCLI)+' VENDA-CLIENTE NO SPC');
              end;
            end;
            {comentado em 08/04/2013
            else if Cliente1.PessoaFisica and
                    (DM.Configuracao1.Empresa <> empTodas) and //Liberar para todas as outras empresas
                    (DM.Configuracao1.Empresa <> empMotical) and //Contadora da MOTICAL liberou Nota para Pessoa Física
                    ((DM.Configuracao1.Empresa <> empLBM) or (DM.Configuracao1.CodigoCNC <> 3)) then
            Begin
              ShowMessage('Pessoa Física!!! Emita um Cupom e depois uma Nota de Simples Remessa.');
              SB_Can.SetFocus;
              SB_CanClick(sender);
              Exit;
            end;
            }


          end;
        end;
        Item_Nota_Fiscal10.Close;
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_NOTA_FISCAL '+
          ' WHERE CNC_ORIGEM='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND NTF_CODIGO='+edtCodigoNTF.Text);
        Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asInteger:=DM.Configuracao1.CodigoCNC;          
        Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
        Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger:=StrToInt(edtCodigoNTF.Text);
        Item_Nota_Fiscal10.Open;
        PrecoP:=0;
        PrecoS:=0;
        PrecoPS:=0;
        PrecoISS:=0;
        PrecoICMS:=0;
        PrecoICMSS:=0;
        //Correção de Dados
        if dblTipoNota.KeyValue = 363 then
          exit;
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3640)) > 0) AND //Cupom Especial ELETRO
           (DM.Configuracao1.Empresa = empEletro) AND //Eletro Guerra
           (ckbServico.Checked) then
        Begin
          With Item_Pedido_Venda1 do //Está filtrando vículo < 0
          Begin
            Close;
            if (DM.Configuracao1.Empresa IN [empMotical, empLuciano]) and
               (self.tag <> 3) and
               (Pedido_de_Venda1.CodigoFPE > 0) then
              SQL.Text := 'SELECT I1.* FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
                ' WHERE I1.CNC_CODIGO=:CNC_CODIGO '+
                ' AND (I1.IPV_VINCULO>=0 OR I1.IPV_VINCULO IS NULL) '+
                ' AND I1.PDV_CODIGO IN (SELECT P1.PDV_CODIGO FROM PEDIDO_DE_VENDA P1 '+
                ' WHERE P1.CNC_CODIGO=I1.CNC_CODIGO '+
                ' AND FPE_CODIGO=:PDV_CODIGO) ';
            Open;
            First;
            edtVendedor.Text:=IntToStr(CodigoFUN);
            While not EOF do
            Begin
              Produto1.Close;
              Produto1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
              Produto1.Open;
              DescontoUnitario := 0;
              if Produto1.Precocompra > 0 then
              Begin
                PrecoGuerra  := Arredonda(Produto1.PrecoCompra*1.25);
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
                  ' IPV_NOTA=2 '+
                  ',IPV_PRECO_NOTA='+VirgPonto(PrecoGuerra)+
                  ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
                  ' AND IPV_CODIGO='+IntToStr(CodigoIPV));
              end
              else
              Begin
                PrecoGuerra  := Arredonda(Preco);

                if (ValorICMS = 0) and
                   (dblTipoNota.KeyValue <> 363) and //Correção de Dados
                   ((dblTipoNota.KeyValue <> 364) or
                    (Pedido_de_Venda1.CodigoPacote <> 0)) then //Simples Remessa
                  ValorICMS := Classificacao_fiscal1.ICMS;


                if Produto1.Servico then
                Begin
                  PrecoS:=PrecoS+PrecoGuerra*Quantidade;
                  PrecoISS := PrecoISS + Arredonda(PrecoGuerra*Quantidade*vAliqISS/100);
                  //Eletro Guerra
                  if not Item_Nota_Fiscal10.Inserir(DM.Configuracao1.CodigoCNC,0,
                     StrToInt(edtCodigoNTF.Text),CodigoPRD,CodigoLOT,TipoAliq,
                     0(*AliquotaICMS*),vAliqISS(*AliquotaISS*),
                     Quantidade,PrecoGuerra,DescontoUnitario,0(*AliquotaIPI*),Bonificacao,0(*Amostra*),
                     Trim(Produto1.Descricao)) then
                  Begin
                    ShowMessage('Falha ao gerar Item de Nota Fiscal! PRD('+IntToStr(CodigoPRD)+')');
                    Raise exception.Create('');
                  end;
                end
                else
                Begin
                  PrecoP:=PrecoP+PrecoGuerra*Quantidade;
                  PrecoICMS:=PrecoICMS + Arredonda((PrecoGuerra*ValorICMS*Quantidade)/100);
                  //Eletro Guerra
                  if not Item_Nota_Fiscal10.Inserir(DM.Configuracao1.CodigoCNC,0,
                     StrToInt(edtCodigoNTF.Text),CodigoPRD,CodigoLOT,TipoAliq,
                     ValorICMS,0(*AliquotaISS*),
                     Quantidade,PrecoGuerra,DescontoUnitario,0(*AliquotaIPI*),Bonificacao,0(*Amostra*),
                     Trim(Produto1.Descricao)) then
                  Begin
                    ShowMessage('Falha ao gerar Item de Nota Fiscal! PRD('+IntToStr(CodigoPRD)+')');
                    Raise exception.Create('');
                  end;
                end;
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
                  ' IPV_NOTA=2 '+
                  ',IPV_PRECO_NOTA='+VirgPonto(PrecoGuerra)+
                  ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
                  ' AND IPV_CODIGO='+IntToStr(CodigoIPV));
              end;
            end;
          end;
        end
        //Diferente de Devolução e Pacote de Venda
        else if ((dblTipoNota.KeyValue <> 362) or (edtCodigoTRO.Text = '')) then
        Begin
          with self.Item_Pedido_Venda1 do
          Begin
            Close;
            if (DM.Configuracao1.Empresa IN [empMotical, empLuciano]) and
               (self.tag <> 3) and
               (Pedido_de_Venda1.CodigoFPE > 0) then
              SQL.Text := 'SELECT I1.* FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
                ' WHERE I1.CNC_CODIGO=:CNC_CODIGO '+
                ' AND (I1.IPV_VINCULO>=0 OR I1.IPV_VINCULO IS NULL) '+
                ' AND I1.PDV_CODIGO IN (SELECT P1.PDV_CODIGO FROM PEDIDO_DE_VENDA P1 '+
                ' WHERE P1.CNC_CODIGO=I1.CNC_CODIGO '+
                ' AND FPE_CODIGO=:PDV_CODIGO) ';
            Open;
            first;
            if self.Tag <> 3 then //Pacote de Venda
              edtVendedor.Text:=IntToStr(CodigoFUN)
            else
              edtVendedor.Text:=IntToStr(Pedido_de_Venda1.FieldByName('FUN_CODIGO').asInteger);
            while not EOF do
            Begin
              //Atribuir o Preco vendido
              DescontoUnitario := 0;
              if (PrecoDesc > 0) and (PrecoDesc > Preco) then
                PrecoUnitario := Arredonda(PrecoDesc)
              else if (PrecoDesc > 0) then
              Begin
                if DM.Configuracao1.Empresa = empLBM then
                  PrecoUnitario := Arredonda(PrecoDesc)
                else
                Begin
                  PrecoUnitario := Arredonda(Preco);
                  DescontoUnitario := Arredonda(Preco - PrecoDesc);
                end;
              end
              else if DM.Configuracao1.Empresa IN [empEletro, empPetromax] then
                PrecoUnitario := Arredonda(Preco)
              else //Preço (0)
                PrecoUnitario := Arredonda(PrecoDesc);

              if (Bonificacao > 0) then
                DescontoUnitario := DescontoUnitario +
                                    Arredonda((PrecoUnitario*self.Item_Pedido_Venda1.Bonificacao)/self.Item_Pedido_Venda1.Quantidade);

              //Nota de Simples Remessa (Definir quantidade que falta entregar
              if dblTipoNota.KeyValue = 364 then
              Begin
                with DM.QR_Consultas do
                Begin
                  Close;
                  SQL.Text := 'SELECT SUM(I1.INF_QUANTIDADE) AS QTD '+
                    ' FROM ITEM_DE_NOTA_FISCAL I1, NOTA_FISCAL N1 '+
                    ' WHERE I1.CNC_CODIGO='+IntToStr(CodigoCNC)+
                    ' AND I1.PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND N1.NTF_PEDIDO='+IntToStr(CodigoPDV)+
                    ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
                    ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
                    ' AND N1.NTF_CODIGO=I1.NTF_CODIGO '+
                    ' AND N1.NTF_TIPO_NOTA=364 '+
                    ' AND N1.NTF_SITUACAO=2 ';
                  Open;
                  QuantidadeEmitida := Quantidade - FieldByName('QTD').AsFloat;
                end;
              end
              else
                QuantidadeEmitida := Quantidade;
              //Definir Preço de Serviço
              if (ckbServico.Checked) and (DM.Configuracao1.Empresa = empLBM) then
              Begin
                PrecoUnitNota := Arredonda((PrecoUnitario)*0.60);
                ServicoTotal := ServicoTotal + Arredonda(QuantidadeEmitida*(Arredonda(PrecoUnitario)-PrecoUnitNota));
                PrecoISS := PrecoISS + Arredonda(QuantidadeEmitida*(Arredonda(PrecoUnitario)-PrecoUnitNota)*vAliqISS/100);
              end
              else
                PrecoUnitNota := PrecoUnitario;

              Produto1.Close;
              Produto1.ParamByName('PRD_CODIGO').asInteger:=FieldByName('PRD_CODIGO').asInteger;
              Produto1.Open;

              if (ValorICMS = 0) and
                 (dblTipoNota.KeyValue <> 363) and //Correção de Dados
                 ((dblTipoNota.KeyValue <> 364) or //Simples Remessa
                  (Pedido_de_Venda1.CodigoPacote <> 0)) and
                 (dblTipoNota.KeyValue <> 460) then //Pacote Mãe
                ValorICMS := Classificacao_fiscal1.ICMS
              else if (dblTipoNota.KeyValue = 460) then
              Begin
                ValorICMS := 0;
                vAliqISS  := 0;
              end;

              if Produto1.Servico then
              Begin
                TipoAliq := 0; //Normal
                PrecoS:=PrecoS+(PrecoUnitNota-DescontoUnitario)*QuantidadeEmitida;
                PrecoISS:=PrecoISS+Arredonda(((PrecoUnitNota-DescontoUnitario)*vAliqISS/100*QuantidadeEmitida));
              end
              else
              Begin
                if Classificacao_fiscal1.CodigoCLF = 5 then
                Begin
                  TipoAliq := 1;  //Substituto
                  PrecoPS:=PrecoPS+Arredonda(PrecoUnitNota-DescontoUnitario)*QuantidadeEmitida;
                  PrecoICMSS:=PrecoICMSS+Arredonda(((PrecoUnitNota-DescontoUnitario)*Classificacao_fiscal2.ICMS*QuantidadeEmitida)/100);
                  OBS1:=Classificacao_fiscal1.Observacao+#13;
                end
                else
                Begin
                  TipoAliq := 0; //Normal
                  PrecoP:=PrecoP+Arredonda((PrecoUnitNota-DescontoUnitario)*QuantidadeEmitida);
                  PrecoICMS:=PrecoICMS+Arredonda(((PrecoUnitNota-DescontoUnitario)*ValorICMS*QuantidadeEmitida)/100);
                  if Classificacao_fiscal1.CodigoCLF = 1 then
                    OBS2:=Classificacao_fiscal1.Observacao
                  else if Classificacao_fiscal1.CodigoCLF = 2 then
                    OBS3:=Classificacao_fiscal1.Observacao
                  else if Classificacao_fiscal1.CodigoCLF = 3 then
                    OBS4:=Classificacao_fiscal1.Observacao
                  else if Classificacao_fiscal1.CodigoCLF = 4 then
                    OBS5:=Classificacao_fiscal1.Observacao
                  else if Classificacao_fiscal1.CodigoCLF = 6 then
                    OBS6:=Classificacao_fiscal1.Observacao
                  else if Classificacao_fiscal1.CodigoCLF = 7 then
                    OBS7:=Classificacao_fiscal1.Observacao;
                end;
              end;
              if DM.Configuracao1.empresa <> empLBM then
                sDescProduto := Produto1.Descricao
              else
                sDescProduto := Trim(Produto1.Descricao)+' '+Trim(Produto1.Referencia)+' '+Trim(Produto1.Marca);
              if QuantidadeEmitida > 0 then
              Begin
                if Produto1.Servico then
                Begin
                  if not Item_Nota_Fiscal10.Inserir(DM.Configuracao1.CodigoCNC,0,
                     StrToInt(edtCodigoNTF.Text),CodigoPRD,CodigoLOT,TipoAliq,
                     0(*AliquotaICMS*),vAliqISS,
                     QuantidadeEmitida,PrecoUnitNota,DescontoUnitario,
                     0(*AliquotaIPI*),Bonificacao,0(*Amostra*),sDescProduto) then
                  Begin
                    ShowMessage('Falha ao gerar Item de Nota Fiscal! PRD('+IntToStr(CodigoPRD)+')');
                    Raise exception.Create('');
                  end;
                end
                else
                  if not Item_Nota_Fiscal10.Inserir(DM.Configuracao1.CodigoCNC,0,
                     StrToInt(edtCodigoNTF.Text),CodigoPRD,CodigoLOT,TipoAliq,
                     ValorICMS(*AliquotaICMS*),0(*AliquotaISS*),
                     QuantidadeEmitida,PrecoUnitNota,DescontoUnitario,0(*AliquotaIPI*),Bonificacao,0(*Amostra*),
                     sDescProduto) then
                  Begin
                    ShowMessage('Falha ao gerar Item de Nota Fiscal! PRD('+IntToStr(CodigoPRD)+')');
                    Raise exception.Create('');
                  end;
              end;
              Next;
            end;
            //Inserir Servico de 60%
            if ServicoTotal > 0 then
            Begin
              if not Item_Nota_Fiscal10.Inserir(DM.Configuracao1.CodigoCNC,0,
                StrToInt(edtCodigoNTF.Text),0,0(*CodigoPRD*),0(*CodigoLOT*),
                0(*AliquotaICMS*),vAliqISS(*AliqutoaISS*),
                1(*Quantidade*),ServicoTotal,0,
                0(*AliquotaIPI*),0(*Bonificação*),0(*Amostra*),'PROJETO,MONTAGEM') then
              Begin
                ShowMessage('Falha ao gerar Item de Nota Fiscal! (Serviço)');
                Raise exception.Create('');
              end;
            end;
          end;
        end
        //Devolução Parcial
        else if (dblTipoNota.KeyValue = 362) and (edtCodigoTRO.Text <> '') then
        Begin
          with Item_de_Troca1 do
          Begin
            Close;
            ParamByName('CNC_CODIGO').asInteger:=StrToInt(edtPedidoCNC.Text);
            ParamByName('TRO_CODIGO').asInteger:=StrToInt(edtCodigoTRO.Text);
            Open;
            first;
            edtVendedor.Text:=IntToStr(CodigoFUN);
            while not EOF do
            Begin
              PrecoUnitario := Arredonda(Preco);
              DescontoUnitario := 0;


              //Definir Preço de Serviço
              if (ckbServico.Checked) and (DM.Configuracao1.Empresa = empLBM) then
              Begin
                PrecoUnitNota := Arredonda(PrecoUnitario*0.60);
                ServicoTotal := ServicoTotal + Arredonda(Quantidade*(PrecoUnitario-PrecoUnitNota));
                PrecoISS := PrecoISS + Arredonda(Quantidade*(PrecoUnitario-PrecoUnitNota)*vAliqISS/100);
              end
              else
                PrecoUnitNota := PrecoUnitario;

              Produto1.Close;
              Produto1.ParamByName('PRD_CODIGO').asInteger:=FieldByName('PRD_CODIGO').asInteger;
              Produto1.Open;

              if (ValorICMS = 0) then
                ValorICMS := Classificacao_fiscal1.ICMS;


              if Produto1.Servico then
              Begin
                TipoAliq := 0; //Normal
                PrecoS:=PrecoS+Arredonda((PrecoUnitNota-DescontoUnitario)*Quantidade);
                PrecoISS:=PrecoISS+(((PrecoUnitNota-DescontoUnitario)*vAliqISS/100*Quantidade));
              end
              else
              Begin
                if Classificacao_fiscal1.CodigoCLF = 5 then
                Begin
                  TipoAliq := 1;  //Substituto
                  OBS1:=Classificacao_fiscal1.Observacao+#13;
                  PrecoPS:=PrecoPS+((PrecoUnitNota-DescontoUnitario)*Quantidade);
                  PrecoICMSS:=PrecoICMSS+(((PrecoUnitNota-DescontoUnitario)*Classificacao_fiscal2.ICMS*Quantidade)/100);
                end
                else
                Begin
                  TipoAliq := 0; //Normal
                  PrecoP:=PrecoP+(PrecoUnitNota-DescontoUnitario)*Quantidade;
                  PrecoICMS:=PrecoICMS+(((PrecoUnitNota-DescontoUnitario)*ValorICMS*Quantidade)/100);
                  if Classificacao_fiscal1.CodigoCLF = 1 then
                    OBS2:=Classificacao_fiscal1.Observacao
                  else if Classificacao_fiscal1.CodigoCLF = 2 then
                    OBS3:=Classificacao_fiscal1.Observacao
                  else if Classificacao_fiscal1.CodigoCLF = 3 then
                    OBS4:=Classificacao_fiscal1.Observacao
                  else if Classificacao_fiscal1.CodigoCLF = 4 then
                    OBS5:=Classificacao_fiscal1.Observacao
                  else if Classificacao_fiscal1.CodigoCLF = 6 then
                    OBS6:=Classificacao_fiscal1.Observacao
                  else if Classificacao_fiscal1.CodigoCLF = 7 then
                    OBS7:=Classificacao_fiscal1.Observacao;
                end;
              end;

              if DM.Configuracao1.empresa <> empLBM then
                sDescProduto := Produto1.Descricao
              else
                sDescProduto := Trim(Produto1.Descricao)+' '+Trim(Produto1.Referencia)+' '+Trim(Produto1.Marca);
              if not Item_Nota_Fiscal10.Inserir(DM.Configuracao1.CodigoCNC,0,
                 StrToInt(edtCodigoNTF.Text),CodigoPRD,CodigoLOT,TipoAliq,
                 ValorICMS(*AliquotdaICMS*),0(*AliquotaISS*),
                 Quantidade,PrecoUnitNota,DescontoUnitario,0(*AliquotaIPI*),0(*BonificacaoTroca*),0(*Amostra*),
                 sDescProduto) then
              Begin
                ShowMessage('Falha ao gerar Item de Nota Fiscal! PRD('+IntToStr(CodigoPRD)+')');
                Raise exception.Create('');
              end;
              Next;
            end;
            //Inserir Servico de 60%
            if ServicoTotal > 0 then
            Begin
              if not Item_Nota_Fiscal10.Inserir(DM.Configuracao1.CodigoCNC,0,
                StrToInt(edtCodigoNTF.Text),0(*CodigoPRD*),0(*CodigoLOT*),0,0(*Aliquota*),vAliqISS(*AliqotaISS*),
                1,ServicoTotal,0,
                0(*AliquotaIPI*),0(*Bonificação*),0(*Amostra*),'PROJETO,MONTAGEM') then
              Begin
                ShowMessage('Falha ao gerar Item de Nota Fiscal! (Serviço)');
                Raise exception.Create('');
              end;
            end;
          end;
        end;

        //Serviço
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT CNC_IE FROM CENTRO_DE_CUSTO '+
            ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC);
          Open;
          edtNumeroInscricao.Text := FieldByName('CNC_IE').asString;
        end;

        if (dblTipoNota.KeyValue <> 363) and //Correção de Dados
           ((dblTipoNota.KeyValue <> 364) or //Simples Remessa
            (Pedido_de_Venda1.CodigoPacote <> 0)) and
           (dblNaturezaDaOperacao.KeyValue <> 5922) and   //Pacote de Venda Mãe
           (dblNaturezaDaOperacao.KeyValue <> 6922) then  //Pacote de Venda Mãe
        Begin
          edtBaseISS.Text := format('%.2f',[PrecoS+ServicoTotal]);
          edtAliquotaISS.Text := format('%.2f',[vAliqISS]); //Valor da Alíquota ISS
          edtISS.Text := format('%.2f',[PrecoISS]);
          edtBaseICMS.Text:=format('%.2f',[PrecoP]);
          edtICMS.Text:=format('%.2f',[PrecoICMS]);
          edtBaseICMSSub.Text:=format('%.2f',[PrecoPS]);
          edtICMSSub.Text:=format('%.2f',[PrecoICMSS]);
        end
        else
        Begin
          edtBaseISS.Text := '0,00';
          edtAliquotaISS.Text := '0,00'; //Valor da Alíquota ISS
          edtISS.Text := '0,00';
          edtBaseICMS.Text := '0,00';
          edtICMS.Text := '0,00';
          edtBaseICMSSub.Text := '0,00';
          edtICMSSub.Text := '0,00';
        end;
        edtValorServico.Text := format('%.2f',[PrecoS+ServicoTotal]);
        edtTotalProduto.Text:=format('%.2f',[PrecoP+PrecoPS]);
        edtFrete.Text:='0,00';
        edtSeguro.Text:='0,00';
        edtOutrasDespesas.Text:='0,00';
        edtIPI.Text:='0,00';
        edtTotalNota.Text:=format('%.2f',[PrecoP+PrecoS+PrecoPS+ServicoTotal]);
        if Cliente1.Uf = DM.Configuracao1.UF then
        Begin
          if dblTipoNota.KeyValue = 361 then //Venda dentro do Estado
          Begin
            if self.Tag = 3 then
              dblNaturezaDaOperacao.KeyValue := 5922 //Venda Futura (Nota Mãe)
            else
              dblNaturezaDaOperacao.KeyValue := 5102;
          end
          else if dblTipoNota.KeyValue = 364 then //Simples Remessa dentro do Estado
          Begin
            if self.Tag = 4 then //Remessa
              dblNaturezaDaOperacao.KeyValue := 5117 //Venda Entraga Futura (Nota Filha)
            else if SimplesRemessaCupom then
              dblNaturezaDaOperacao.KeyValue := 5929
            else
              dblNaturezaDaOperacao.KeyValue := 5923;
          end
          else if dblTipoNota.KeyValue = 362 then //Devolução dentro do Estado
            dblNaturezaDaOperacao.KeyValue := 1202;
        end
        else
        Begin
          if dblTipoNota.KeyValue = 361 then //Venda Fora do Estado
          Begin
            if self.Tag = 3 then //Pacote de Venda
              dblNaturezaDaOperacao.KeyValue := 6922 //Venda Futura (Nota Mãe)
            else
            Begin
              if (Trim(Cliente1.CGFRG) = '') or
                 (Cliente1.PessoaFisica) then //Nova Lei Fora do Estado sem CGF
                dblNaturezaDaOperacao.KeyValue := 6108
              else
                dblNaturezaDaOperacao.KeyValue := 6102;
            end;
          end
          else if dblTipoNota.KeyValue = 364 then //Simples Remessa Fora do Estado
          Begin
            if self.Tag = 4 then
              dblNaturezaDaOperacao.KeyValue := 6117 //Venda Entrega Futura (Nota Filha)
            else
              dblNaturezaDaOperacao.KeyValue := 6923
          end
          else if dblTipoNota.KeyValue = 362 then //Devolução Fora do Estado
            dblNaturezaDaOperacao.KeyValue := 2202;
        end;


      end
      else
      Begin
        ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_NOTA_FISCAL '+
          ' WHERE CNC_ORIGEM='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND NTF_CODIGO='+edtCodigoNTF.Text);
        edtVendedor.Clear;
        edtClienteCNC.Clear;
        edtCodigoCLI.Clear;
        edtRazaoSocial.Clear;
        edtEndereco.Clear;
        edtBairro.Clear;
        edtMunicipio.Clear;
        edtUF.Clear;
        edtPesoBruto.Text:='0,00';
        edtPesoLiquido.Text:='0,00';

        //Serviço
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT CNC_IE FROM CENTRO_DE_CUSTO '+
            ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC);
          Open;
          edtNumeroInscricao.Text := FieldByName('CNC_IE').asString;
        end;

        if (dblTipoNota.KeyValue <> 363) and //Correção de Dados
           ((dblTipoNota.KeyValue <> 364) or //Simples Remessa
            (Pedido_de_Venda1.CodigoPacote <> 0)) then
        Begin
          edtBaseISS.Text := format('%.2f',[0.00]);
          edtAliquotaISS.Text := format('%.2f',[5.00]); //Valor da Alíquota ISS
          edtISS.Text := format('%.2f',[0.00]);

          edtBaseICMS.Text:='0,00';
          edtICMS.Text:='0,00';
          edtBaseICMSSub.Text:='0,00';
          edtICMSSub.Text:='0,00';
        end
        else
        Begin
          edtBaseISS.Text := '0,00';
          edtAliquotaISS.Text := '0,00'; //Valor da Alíquota ISS
          edtISS.Text := '0,00';

          edtBaseICMS.Text := '0,00';
          edtICMS.Text := '0,00';
          edtBaseICMSSub.Text := '0,00';
          edtICMSSub.Text := '0,00';
        end;
        edtValorServico.Text := '0,00';
        edtTotalProduto.Text:='0,00';
        edtFrete.Text:='0,00';
        edtSeguro.Text:='0,00';
        edtOutrasDespesas.Text:='0,00';
        edtIPI.Text:='0,00';
        edtTotalNota.Text:='0,00';
        mskCEP.Clear;
        mskCNPJ.Clear;
        mskCGF.Clear;
        memObservacao.Clear;
        if (DM.Configuracao1.Empresa = empMotical) and
           (edtCodigoPDV.Text = '0') then
        Begin
          edtCodigoCLI.Enabled := True;
          edtCodigoCLI.SetFocus;
        end
        else if edtCodigoPDV.Text = '0' then
        Begin
          try
            edtCodigoPDV.SetFocus;
          except
          end;
          Raise Exception.Create('Pedido inválido!');
        end;
      end;
    end
    else if not VerificaInteiro(edtCodigoPDV.Text) then
    Begin
      ShowMessage('Código do Pedido inválido!');
      try
        edtCodigoPDV.SetFocus;
      except
      end;
    end
    else if (dblNaturezaDaOperacao.KeyValue = 5202) or //Devolução de Compra
            (dblNaturezaDaOperacao.KeyValue = 6202) then
    Begin
      with NotaFiscal2 do
      Begin
        if SB_Can.Focused then
          Exit;
        Close;
        ParamByName('CNC_PEDIDO').asInteger := StrToInt(edtPedidoCNC.Text);
        ParamByName('NTF_PEDIDO').asInteger := StrToInt(edtCodigoPDV.Text);
        ParamByName('NTF_TIPO_NOTA').asInteger := 360; //Compra
        Open;
        if IsEmpty then
        Begin
          try
            edtPedidoCNC.SetFocus;
          except
          end;
          ShowMessage('Nota de Compra não encontrada!'+#13+
                      'Verifique se o Campo CNC está identificando '+#13+
                      'o Centro em que o Pedido foi gerado!');
          Exit;
        end;
        if CodigoCNC <> DM.Configuracao1.CodigoCNC then
        Begin
          ShowMessage('Nota de Compra emitida em outro Centro de Custo! ('+IntToStr(CodigoCNC)+')');
          SB_Can.SetFocus;
          SB_CanClick(sender);
          Exit;
        end;
        ckbServico.Checked := False;
        //Centro de Custo dos Fornecedores
        if DM.Configuracao1.Empresa = 1 then
          edtClienteCNC.Text := '0'
        else
          edtClienteCNC.Text := '1';
        edtCodigoCLI.Text  := IntToStr(CodigoFOR);
        edtNotaCupomAntigo.Text := IntToStr(NotaFiscal);
        edtEmissaoNotaAntiga.Text := DateToStr(DataEmissao);
        edtCodigoCLIExit(sender);
      end;
    end;
  end
  else if self.tag = 2 then //Avulso
  Begin
    edtCodigoCLI.Enabled := True;
  end;

  if (VerificaInteiro(edtCodigoPDV.Text)) and
     ((edtCodigoPDV.Text<>IntToStr(PedAnt)) or ((PedAnt = -1) AND (memObservacao.Text = ''))) and
     (not SB_Can.Focused) then
  Begin
    memObservacao.Clear;
    // Simples Remessa
    if dblTipoNota.KeyValue = 364 then
    Begin
      if (Pedido_de_Venda1.NotaCupom = 1) or
         (Pedido_de_Venda1.CodigoPacote > 0) then
      Begin
        if Pedido_de_Venda1.CodigoPacote > 0 then
          memObservacao.Lines.Add('NOTA FISCAL DE ORIGEM '+edtNotaCupomAntigo.Text+' DATADA EM '+edtEmissaoNotaAntiga.Text)
        else
        Begin
          memObservacao.Text := 'SIMPLES REMESSA EMITIDA POR CONTA E ORDEM DO DEST. DA NOTA';
          memObservacao.Lines.Add(edtNotaCupomAntigo.Text+' DATADA EM '+edtEmissaoNotaAntiga.Text+' CONFORME ART.705 DEC. 24569/97.');
        end;
      end
      else
      Begin
        memObservacao.Text := 'SIMPLES REMESSA EMITIDA POR CONTA E ORDEM DO DEST. DO CUPOM';
        memObservacao.Lines.Add(edtNotaCupomAntigo.Text+' DATADO EM '+edtEmissaoNotaAntiga.Text+' CONFORME ART.705 DEC. 24569/97.');
      end;
      if Trim(OBS1) <> '' then
        memObservacao.Lines.Add(OBS1);
    end
    // Devolução
    else if dblTipoNota.KeyValue = 362 then
    Begin
      if not Pedido_de_Venda1.Active then
        Pedido_de_Venda1.Open;
      if (dblTipoNota.KeyValue <> 460) then //Diferente de Pacote de Venda
        CdArquiteto := Pedido_de_Venda1.FieldByName('FUN_ARQUITETO').asInteger;
      if (dblNaturezaDaOperacao.KeyValue = 5202) or  //Diferente Devolução de Compra
         (dblNaturezaDaOperacao.KeyValue = 6202) then
        memObservacao.Text := 'DEV. REFERENTE A NOTA '+edtNotaCupomAntigo.Text+' DATADA EM '+edtEmissaoNotaAntiga.Text
      else
      Begin
        if edtCodigoTRO.Text = '' then //Decolução Total
        Begin
          if (Pedido_de_Venda1.NotaCupom = 1) then
            memObservacao.Text := 'DEV. REFERENTE A NOTA '+edtNotaCupomAntigo.Text+' DATADA EM '+edtEmissaoNotaAntiga.Text
          else
            memObservacao.Text := 'DEV. REFERENTE AO CUPOM '+edtNotaCupomAntigo.Text+' DATADO EM '+edtEmissaoNotaAntiga.Text;
        end
        else //Troca
        Begin
          if Pedido_de_Venda1.NotaCupom = 1 then
            memObservacao.Text := 'DEV. REFERENTE A PARTE DA NOTA '+edtNotaCupomAntigo.Text+' DATADA EM '+edtEmissaoNotaAntiga.Text
          else
            memObservacao.Text := 'DEV. REFERENTE A PARTE DO CUPOM '+edtNotaCupomAntigo.Text+' DATADO EM '+edtEmissaoNotaAntiga.Text;
        end;
      end;
      if Trim(OBS1) <> '' then
        memObservacao.Lines.Add(OBS1);
    end
    else
      memObservacao.Text:=OBS1;

    if memObservacao.Text = '' then
      memObservacao.Text:=OBS2
    else if OBS2 <> '' then
      memObservacao.Lines.Add(OBS2);
    if memObservacao.Text = '' then
      memObservacao.Text:=OBS3
    else if OBS3 <> '' then
      memObservacao.Lines.Add(OBS3);
    if memObservacao.Text = '' then
      memObservacao.Text:=OBS4
    else if OBS4 <> '' then
      memObservacao.Lines.Add(OBS4);
    if memObservacao.Text = '' then
      memObservacao.Text:=OBS5
    else if OBS5 <> '' then
      memObservacao.Lines.Add(OBS5);
    if memObservacao.Text = '' then
      memObservacao.Text:=OBS6
    else if OBS6 <> '' then
      memObservacao.Lines.Add(OBS6);
    if memObservacao.Text = '' then
      memObservacao.Text:=OBS7
    else if OBS7 <> '' then
      memObservacao.Lines.Add(OBS7);
    if (DM.Configuracao1.Empresa <> 2) and
       (dblNaturezaDaOperacao.KeyValue <> 5202) and //Diferente de Devolução de Compra
       (dblNaturezaDaOperacao.KeyValue <> 6202) and
       (dblTipoNota.KeyValue <> 4450) and //Remessa de Troca
       (dblTipoNota.KeyValue <> 4490) and //Remessa em Garantia       
       (dblTipoNota.KeyValue <> 360) then
    Begin
      if edtCodigoPDV.Text <> '' then
      Begin
        if memObservacao.Text = '' then
          memObservacao.Text := 'Toda Mercadoria deve ser conferida no recebimento.'
        else
          memObservacao.Lines.Add('Toda Mercadoria deve ser conferida no recebimento.');
        memObservacao.Lines.Add('Exija sua Nota Fiscal, ela e a seguranca de qualidade '+edtMarca.Text+'.');
      end;
    end;
  end;
  //Simples Remessa
  if (dblTipoNota.KeyValue = 364) and
     (edtCodigoPDV.Text <> '0') then
  Begin
    edtEndereco.Enabled := True;
    edtBairro.Enabled := True;
    edtMunicipio.Enabled := True;
    edtUF.Enabled := True;
    mskCEP.Enabled := True;
    try
      edtEndereco.SetFocus;
    except
    end;
  end
  else if self.tag = 2 then
  Begin
    try
      memObservacao.Lines.Strings[0];
      edtVendedor.SetFocus;
    except
    end;
  end;
  if (dblTipoNota.KeyValue = 361) and //Venda
     (Pedido_de_Venda1.Active) and
     (Pedido_de_Venda1.CodigoPDV>0) then
  Begin
    edtFrete.Text := Format('%.2f',[Pedido_de_Venda1.Frete]);
    edtFreteExit(sender);
  end;
end;

procedure TfMxNotaFiscal.edtCodigoTRNExit(Sender: TObject);
begin
  if VerificaInteiroBranco(edtCodigoTRN.Text) then
  Begin
    if (edtCodigoTRN.Text<>IntToStr(TransAnt)) then
    Begin
      with Transportadora1 do
      Begin
        Close;
        ParamByName('TRN_CODIGO').asInteger:=StrToInt(edtCodigoTRN.Text);
        Open;
        if not IsEmpty then
        Begin
          Parametro2.Close;
          Parametro2.ParamByName('PAR_CODIGO').asInteger:=Logradouro;
          Parametro2.Open;
          edtTransportadoraRazaoSocial.Text :=RazaoSocial;
          mskTransportadoraCNPJ.Text        :=CPFCGC;
        end
        else
        Begin
          edtTransportadoraRazaoSocial.Clear;
          mskPlaca.Clear;
          mskTransportadoraCNPJ.Clear;
        end;
      end;
    end;
  end
  else
  Begin
    edtCodigoTRN.Text := '0';
    edtTransportadoraRazaoSocial.Clear;
    mskPlaca.Clear;
    mskTransportadoraCNPJ.Clear;
  end;
end;

procedure TfMxNotaFiscal.bitImprimirClick(Sender: TObject);
var
  mensagem, FiltrarCentro, sFiltrarTitulo:string;
  vDataEmissao: TDateTime;
  // CaixaCNC,
    CentroLocal, CentroExterno, CdCNCPDV, CdPDV, vNotaFiscal,iTRFEletro:integer;
  trans, Lib3790, Lib3540, Lib3830, Lib3740, Lib3820, Lib3930, Lib6230, Lib6240 :boolean;
  QuantidadeVendida, EstLocal, EstExterno : Double;
begin
  if Entidade.CentroDeCusto <> DM.Configuracao1.CodigoCNC then
  Begin
    if (DM.Configuracao1.Empresa <> empEletro) or
       (DM.Configuracao1.CodigoCNC <> 11) or //Depósito
       (Entidade.CentroDeCusto <> 0) then //CPD
      Raise exception.Create('Não pode gerar nota nesse centro de custo!');
  end;

  Lib3790:=False; //Liberar Venda Cliente Inadiplente
  Lib3540:=False; //Liberar Juros Total
  Lib3830:=False; //Entrada Menor que a Prestação
  Lib3740:=False; //Abaixo do Preço Mínimo
  Lib3820:=False; //Venda sem Estoque
  Lib3930:=False; //Desconto Gerente
  Lib6230:=False; //Venda Boleto
  Lib6240:=False; //Média Acima do LimiteMediaVenda dias

  iTRFEletro := 0;
  
  mensagem:='';
  if DM.Configuracao1.Empresa = empLBM then
  Begin
    if DM.Configuracao1.CodigoCNC = 1 then
    Begin
      CentroLocal   := 1;
      CentroExterno := 2;
    end
    else if DM.Configuracao1.CodigoCNC = 3 then
    Begin
      CentroLocal   := 3;
      CentroExterno := 3;
    end
    else
    Begin
      CentroLocal   := 2;
      CentroExterno := 1;
    end;
  end
  else
  Begin
    CentroLocal   := DM.Configuracao1.CodigoCNC;
    CentroExterno := DM.Configuracao1.CodigoCNC;
  end;

  if Entidade.Situacao = 2 then
    Raise Exception.Create('Esta Nota já foi impressa!');
  if Entidade.IsEmpty then
    Raise Exception.Create('Nenhuma Nota criada!');
  if (not VerificaCPFCNPJBranco(mskCNPJ.Text)) and
     (not ckbManual.Checked) and (dblTipoNota.KeyValue <> 362) then
    mensagem:=mensagem+'Cliente sem CNPJ/CPF!'+#13;
  if (not VerificaDataBranco(mskDataEntradaSaida.Text)) then
    mensagem:=mensagem+'Data de Entrada/Saída inválida!'+#13;
  if mensagem <> '' then
    Raise Exception.Create(mensagem);
  //Correção de Dados
  if dblTipoNota.KeyValue = 363 then
  Begin
    if memObservacao.Text = '' then
      Raise Exception.Create('É necessário colocar a correção na Observação');
  end
  else if Item_Nota_Fiscal10.IsEmpty then
  Begin
    Item_Nota_Fiscal10.Close;
    Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asInteger:=Entidade.CNCOrigem;    
    Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
    Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger:=Entidade.CodigoNTF;
    Item_Nota_Fiscal10.Open;
    if Item_Nota_Fiscal10.IsEmpty then
      Raise Exception.Create('Nota sem Itens!');
  end;

  /////////////////////////////// LBM
  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then  //LBM SERVICO NAO ENTRA NO "PENTE FINO"
  Begin
    //Verificar Informações para Venda não avulsa
    if (dblTipoNota.KeyValue = 361) and (self.tag <> 2) then
    Begin
      if Cliente1.SPC = 1 then
      Begin
        if MessageDlg('Cliente no SPC !!!'+#13+
            'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=25;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para vender a Cliente no SPC!');
              end;
            end
            else
            begin
              free;
              exit;
            end;
            free;
          End;
        end;
      end;
      Informacoes1.Close;
      Informacoes1.ParamByName('CNC_CODIGO').asInteger:=Cliente1.CodigoCNC;
      Informacoes1.ParamByName('CLI_CODIGO').asInteger:=Cliente1.CodigoCLI;
      Informacoes1.Open;
      Pedido_de_Venda1.Close;
      Pedido_de_Venda1.Open;
      //Verificar Inadiplência se não for Cliente Balcão e se não for à Vista e não for Cartão
      if (Pedido_de_Venda1.CodigoCLI <> DM.Configuracao1.CodigoCliAVista) and
         (Pedido_de_Venda1.CodigoFPG <> 1) and (Pedido_de_Venda1.TipoPag <> 13) then
      Begin
        if not Informacoes1.IsEmpty then
        Begin
          if ((Informacoes1.LimiteCredito-Informacoes1.CreditoUtil)<0) then
            Raise Exception.Create('Limite de Crédito Ultrapassado!')
          else if ((Informacoes1.DataAlterado) <
                  (incMonth(DM.Configuracao1.Data,-6))) then
          Begin
            Titulo_receber3.Close; //Verificar Títulos alterados a mais de 6 meses
            Titulo_receber3.ParamByName('CNC_CLIENTE').asInteger := Pedido_de_Venda1.ClienteCNC;
            Titulo_receber3.ParamByName('CLI_CODIGO').asInteger := Pedido_de_Venda1.CodigoCLI;
            Titulo_receber3.Open;
            if Titulo_receber3.DataAlterado < incMonth(DM.Configuracao1.Data,-6) then
              Raise Exception.Create('Inf. de Crédto com mais de 6 meses!');
          end;
        end
        else
          Raise Exception.Create('Cliente sem Limite de crédito!');

        //Verificar Inadiplência
        Titulo_receber5.Close;
        Titulo_receber5.ParamByName('CNC_CODIGO').asInteger:=Cliente1.CodigoCNC;
        Titulo_receber5.ParamByName('CLI_CODIGO').asInteger:=Cliente1.CodigoCLI;
        Titulo_receber5.ParamByName('DATA').asDate:=DM.Configuracao1.Data;
        Titulo_receber5.Open;
        if (not Titulo_receber5.IsEmpty) then
        Begin
          if MessageDlg('Cliente Inadiplente !!!'+#13+
              'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit;
          If (not Informacoes1.LiberaInadiplencia) and
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0) and
             (not Lib3790) then
          Begin
            Application.CreateForm(TDigitaSenha, DigitaSenha);
            With DigitaSenha do
            Begin
              onClose:=nil;
              Tag:=25;
              Cancelar:=False;
              Showmodal;
              If not cancelar Then
              Begin
                if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0)then
                begin
                  free;
                  raise Exception.Create('O usuário não tem permissão para vender a Cliente Inadiplente!');
                end
                else
                begin
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                    Lib3790 := True;
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                    Lib3540 := True;
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                    Lib3830 := True;
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                    Lib3740 := True;
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                    Lib3820 := True;
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                    Lib3930 := True;
                  if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                    Lib6230 := True;
                  if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                    Lib6240 := True;
                  if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                     Lib6230 AND Lib6240 AND
                     (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                    ShowMessage('');
                end;
              end
              else
              begin
                free;
                exit;
              end;
              free;
            End;
          end;
        end;
      end;
      if Informacoes1.Proibido then
        Raise Exception.Create('Cliente Bloqueado!'+#13+
                               'Procure a gerência!');

      Titulo_receber6.Close;
      Titulo_receber6.Open;
      if (Titulo_receber6.FieldByName('MEDIA').asFloat > Pedido_de_Venda1.Entrada) and
         (Pedido_de_Venda1.Entrada > 0) then
      Begin
        if MessageDlg('Entrada menor que a prestação mensal !!!'+#13+
            'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3830)) < 0) AND
           (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
           (not Lib3830) and (not Lib3540) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=25;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) < 0) AND
                 (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para faturar com Entrada menor que a prestação!');
              end
              else
              begin
                if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                  Lib3790 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                  Lib3540 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                  Lib3830 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                  Lib3740 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                  Lib3820 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                  Lib3930 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                  Lib6230 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                  Lib6240 := True;
                if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                   Lib6230 AND Lib6240 AND
                   (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                  ShowMessage('');
              end;
            end
            else
            Begin
              free;
              exit;
            end;
            free;
          End;
        end;
      end;
      Item_Pedido_Venda1.Close;
      Pedido_de_Venda1.Close;
      Pedido_de_Venda1.Open;
      Item_Pedido_Venda1.Open;
      //Verificar Venda com Boleto
      if Pedido_de_Venda1.TipoPag = 412 then //Boleto Bancário
      Begin
        if MessageDlg('Venda com Boleto Bancário !!!'+#13+
                      'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6230)) < 0) and
           (not Lib6230) and (not Informacoes1.Boleto) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=25;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para venda com Boleto!');
              end
              else
              begin
                if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                  Lib3790 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                  Lib3540 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                  Lib3830 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                  Lib3740 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                  Lib3820 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                  Lib3930 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                  Lib6230 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                  Lib6240 := True;
                if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                   Lib6230 AND Lib6240 AND
                   (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                  ShowMessage('');
              end;
            end
            else
            Begin
              free;
              exit;
            end;
            free;
          End;
        end;
      end;
      //Verificar Média Acima do LimiteMediaVenda dias
      if Pedido_de_Venda1.MediaPagamento > DM.Configuracao1.LimiteMediaVenda then
      Begin
        if MessageDlg('Média de Venda '+IntToStr(Pedido_de_Venda1.MediaPagamento)+' dias !!!'+#13+
                      'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6240)) < 0) and
           (not Lib6240) then
        Begin
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=25;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) < 0)then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para média acima de '+IntToStr(DM.Configuracao1.LimiteMediaVenda)+' dias!');
              end
              else
              begin
                if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                  Lib3790 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                  Lib3540 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                  Lib3830 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                  Lib3740 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                  Lib3820 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                  Lib3930 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                  Lib6230 := True;
                if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                  Lib6240 := True;
                if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                   Lib6230 AND Lib6240 AND
                   (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                  ShowMessage('');
              end;
            end
            else
            begin
              free;
              exit;
            end;
            free;
          End;
        end;
      end;
      With Item_Pedido_Venda1 do
      Begin
        First;
        While not EOF do
        Begin
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
          Produto1.Open;
          Descontos1.Close;
          Descontos1.SQL.Text:='SELECT * FROM DESCONTOS '+
            ' WHERE PRD_CODIGO='+IntToStr(Produto1.CodigoPRD);
          Descontos1.Open;
          if Descontos1.IsEmpty then
          Begin
            Descontos1.Close;
            Descontos1.SQL.Text:='SELECT * FROM DESCONTOS '+
              ' WHERE GRP_CODIGO='+IntToStr(Produto1.CodigoGRP)+
              ' AND FOR_CODIGO='+IntToStr(Produto1.CodigoFOR)+
              ' AND (PRD_CODIGO=0 OR PRD_CODIGO IS NULL)';
            Descontos1.Open;
          end;
          if Descontos1.IsEmpty then
          Begin
            Descontos1.Close;
            Descontos1.SQL.Text:='SELECT * FROM DESCONTOS '+
              ' WHERE FOR_CODIGO='+IntToStr(Produto1.CodigoFOR)+
              ' AND (GRP_CODIGO=0 OR GRP_CODIGO IS NULL)'+
              ' AND (PRD_CODIGO=0 OR PRD_CODIGO IS NULL)';
            Descontos1.Open;
          end;
          if (Pendencia > 1) then
          Begin
            If MessageDlg('O Produto '+Produto1.Descricao+' '+Produto1.Referencia+#13+
                          'está com pendência de estoque !!!'+#13+
                          'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              Exit;
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3820)) < 0) and
               (not Lib3820) then
            Begin
              Application.CreateForm(TDigitaSenha, DigitaSenha);
              With DigitaSenha do
              Begin
                onClose:=nil;
                Tag:=25;
                Cancelar:=False;
                Showmodal;
                If not cancelar Then
                Begin
                  if Usuario1.Permissoes.IndexOf(IntToStr(3820)) < 0 then
                  begin
                    free;
                    raise Exception.Create('O usuário não tem permissão para venda sem estoque!');
                  end
                  else
                  begin
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                      Lib3790 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                      Lib3540 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                      Lib3830 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                      Lib3740 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                      Lib3820 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                      Lib3930 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                      Lib6230 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                      Lib6240 := True;
                    if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                       Lib6230 AND Lib6240 AND
                       (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                      ShowMessage('');
                  end;
                end
                else
                begin
                  free;
                  exit;
                end;
                free;
              End;
            end;
          end;

          if (PrecoDesc < Arredonda(Produto1.Precomedio)) and
             (Produto1.Precomedio > 0) then
          Begin
            If MessageDlg('Produto '+Trim(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                          'Preço R$'+format('%.2f',[PrecoDesc-Produto1.Precomedio])+#13+
                          'Abaixo do mínimo (R$ '+format('%.2f',[PrecoDesc-Produto1.Precomedio])+') !!!'+#13+
                          'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              Exit;
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
               (not Lib3540) and (not Lib3740) then
            Begin
              Application.CreateForm(TDigitaSenha, DigitaSenha);
              With DigitaSenha do
              Begin
                onClose:=nil;
                Tag:=25;
                Cancelar:=False;
                Showmodal;
                If not cancelar Then
                Begin
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND
                     (Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) then
                  begin
                    free;
                    raise Exception.Create('O usuário não tem permissão para venda com Preço abaixo do Mínimo!');
                  end
                  else
                  begin
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                      Lib3790 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                      Lib3540 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                      Lib3830 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                      Lib3740 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                      Lib3820 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                      Lib3930 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                      Lib6230 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                      Lib6240 := True;
                    if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                       Lib6230 AND Lib6240 AND
                       (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                      ShowMessage('');
                  end;
                end
                else
                begin
                  free;
                  exit;
                end;
                free;
              End;
            end;
          End;

          // Verifica se o usuário tem permissão para liberar desconto
          if (PrecoDesc<PrecoSugerido) and
             ((100-(PrecoDesc/PrecoSugerido*100))<Descontos1.DescontoGerente) then
          Begin
            If MessageDlg('Produto '+Trim(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                          'Preço R$'+format('%.2f',[PrecoDesc])+#13+
                          'Abaixo do Sugerido ('+format('%.4f',[100-(PrecoDesc/PrecoSugerido*100)])+' %) !!!'+#13+
                          'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              Exit;
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3930)) < 0) AND
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
               (not Lib3930) and (not Lib3540) then
            Begin
              Application.CreateForm(TDigitaSenha, DigitaSenha);
              With DigitaSenha do
              Begin
                onClose:=nil;
                Tag:=25;
                Cancelar:=False;
                Showmodal;
                If not cancelar Then
                Begin
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) < 0) AND
                     (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
                  begin
                    free;
                    raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
                  end
                  else
                  begin
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                      Lib3790 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                      Lib3540 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                      Lib3830 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                      Lib3740 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                      Lib3820 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                      Lib3930 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                      Lib6230 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                      Lib6240 := True;
                    if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                       Lib6230 AND Lib6240 AND
                       (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                      ShowMessage('');
                  end;
                end
                else
                begin
                  free;
                  exit;
                end;
                free;
              End;
            end;
          end
          //Preço abaixo do sugerido de forma que o gerente não tem permissão
          else if (PrecoDesc<PrecoSugerido) then
          Begin
            If MessageDlg('Produto '+Trim(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                          'Preço R$'+format('%.2f',[PrecoDesc])+#13+
                          'Abaixo do Sugerido (Gerente) ('+format('%.4f',[100-PrecoDesc/PrecoSugerido*100])+' %) !!!'+#13+
                          'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              Exit;
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
               (not Lib3540) then
            Begin
              Application.CreateForm(TDigitaSenha, DigitaSenha);
              With DigitaSenha do
              Begin
                onClose:=nil;
                Tag:=25;
                Cancelar:=False;
                Showmodal;
                If not cancelar Then
                Begin
                  if Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then
                  begin
                    free;
                    raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
                  end
                  else
                  begin
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                      Lib3790 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                      Lib3540 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                      Lib3830 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                      Lib3740 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                      Lib3820 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                      Lib3930 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                      Lib6230 := True;
                    if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                      Lib6240 := True;
                    if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                       Lib6230 AND Lib6240 AND
                       (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                      ShowMessage('');
                  end;
                end
                else
                begin
                  free;
                  exit;
                end;
                free;
              End;
            end;
          end;
          next;
        End;
      End;
    end;
    if Lib3930 and (DM.Configuracao1.CodigoUSU = -10) then
      ShowMessage('');

    /////////////////////////////
    //Nota LBM
    Application.CreateForm(Trpt_NotaFiscalLBM, rpt_NotaFiscalLBM);
    with rpt_NotaFiscalLBM do
    Begin
      tag := 0;
      Desc1:=0;
      if Pedido_de_Venda1.CodigoFPG <> 1 then
        VendaPrazo := True;

      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := self.Entidade.CNCOrigem;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := self.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := StrToInt(self.edtCodigoNTF.Text);
      Item_Nota_Fiscal10.Open;

      //Serviço
      zrlNumeroInscricao.Caption := '';
      zrlTotalServico.Caption    := edtValorServico.Text;
      zrlBaseISS.Caption         := edtBaseISS.Text;
      if StrToFloat(edtISS.Text) > 0 then
        zrlALiquotaISS.Caption     := edtAliquotaISS.Text
      else
        zrlALiquotaISS.Caption     := '0,00';
      zrlISS.Caption             := edtISS.Text;

      report.Preview;
    end;
    Close;
  end
  else if (DM.Configuracao1.Empresa = empLBM) and
          (DM.Configuracao1.CodigoCNC = 3) then  //LBM SERVICO NAO ENTRA NO "PENTE FINO"
  Begin
    Application.CreateForm(Trpt_NotaFiscalLBM, rpt_NotaFiscalLBM);
    with rpt_NotaFiscalLBM do
    Begin
      tag := 0;
      Desc1:=0;
      if Pedido_de_Venda1.CodigoFPG <> 1 then
        VendaPrazo := True;

      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := self.Entidade.CNCOrigem;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := self.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := StrToInt(self.edtCodigoNTF.Text);
      Item_Nota_Fiscal10.Open;

      //Serviço
      zrlNumeroInscricao.Caption := '';
      zrlTotalServico.Caption    := edtValorServico.Text;
      zrlBaseISS.Caption         := edtBaseISS.Text;
      if StrToFloat(edtISS.Text) > 0 then
        zrlALiquotaISS.Caption     := edtAliquotaISS.Text
      else
        zrlALiquotaISS.Caption     := '0,00';
      zrlISS.Caption             := edtISS.Text;

      report.Preview;
    end;
    Close;
  end
  else if DM.Configuracao1.Empresa = empPetromax then
  Begin
    // Nota Petromax
    Application.CreateForm(Trpt_NotaFiscalPetromax, rpt_NotaFiscalPetromax);
    with rpt_NotaFiscalPetromax do
    Begin
      tag := 0;
      Desc1:=0;
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := self.Entidade.CNCOrigem;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := self.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := StrToInt(self.edtCodigoNTF.Text);
      Item_Nota_Fiscal10.Open;
      report.Preview;
      Close;
    end;
  end
  else if (DM.Configuracao1.Empresa in [empEletro,empCreator,empAndrea,empHOPE]) then //Eletro ou Creator ou Andrea ou HOPE
  Begin
    // Nota Eletro Guerra
    Application.CreateForm(Trpt_NotaFiscalEletro, rpt_NotaFiscalEletro);
    with rpt_NotaFiscalEletro do
    Begin
      tag := 0;
      Desc1:=0;
      if self.Pedido_de_Venda1.CodigoFPG <> 1 then
        VendaPrazo := True;
      Entidade.Close;
      Entidade.ParamByName('CNC_ORIGEM').asinteger:= self.Entidade.CNCOrigem;
      Entidade.ParamByName('CNC_CODIGO').asinteger:= self.Entidade.CodigoCNC;
      Entidade.ParamByName('NTF_CODIGO').asInteger := StrToInt(self.edtCodigoNTF.Text);
      Entidade.Open;
      report.Preview;
      Close;
    end;
  end
  else if (DM.Configuracao1.Empresa = empMotical) then
  Begin
    Application.CreateForm(Trpt_NotaFiscalMotCal, rpt_NotaFiscalMotCal);
    with rpt_NotaFiscalMotCal do
    Begin
      tag := 0;
      if Pedido_de_Venda1.CodigoFPG <> 1 then
        VendaPrazo := True;

      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := self.Entidade.CNCOrigem;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := self.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := StrToInt(self.edtCodigoNTF.Text);
      Item_Nota_Fiscal10.Open;

      {//Serviço
      zrlNumeroInscricao.Caption := '';
      zrlTotalServico.Caption    := format('%.2f',[self.Entidade.TotalServico]);
      zrlBaseISS.Caption         := format('%.2f',[self.Entidade.BaseISS]);
      if fMxLocalizaNotaCupom.Entidade.ISS > 0 then
        zrlALiquotaISS.Caption     := '5,00'
      else
        zrlALiquotaISS.Caption     := '0,00';
      zrlISS.Caption             := format('%.2f',[self.Entidade.ISS]);
      }

      report.Preview;
    end;
    rpt_NotaFiscalMotCal.Close;
  end
  else //if (DM.Configuracao1.Empresa = empLuciano) then
  Begin
    Application.CreateForm(Trpt_NotaFiscalLuciano, rpt_NotaFiscalLuciano);
    with rpt_NotaFiscalLuciano do
    Begin
      tag := 0;
      if Pedido_de_Venda1.CodigoFPG <> 1 then
        VendaPrazo := True;

      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := self.Entidade.CNCOrigem;
      Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := self.Entidade.CodigoCNC;
      Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := StrToInt(self.edtCodigoNTF.Text);
      Item_Nota_Fiscal10.Open;

      {//Serviço
      zrlNumeroInscricao.Caption := '';
      zrlTotalServico.Caption    := format('%.2f',[self.Entidade.TotalServico]);
      zrlBaseISS.Caption         := format('%.2f',[self.Entidade.BaseISS]);
      if fMxLocalizaNotaCupom.Entidade.ISS > 0 then
        zrlALiquotaISS.Caption     := '5,00'
      else
        zrlALiquotaISS.Caption     := '0,00';
      zrlISS.Caption             := format('%.2f',[self.Entidade.ISS]);
      }

      report.Preview;
    end;
    Close;
  end;
  //else
    //Raise Exception.Create('Empresa sem Nota Cadastrada, ou máquina desconfigurada!');

  while True do
  Begin
    if MessageDlg('A Nota foi Registrada?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Begin
      If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6420)) < 0) then
      Begin
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        with DigitaSenha do
        Begin
          Tag:=25;
          onClose:=nil;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if (DigitaSenha.Usuario1.Permissoes.IndexOf(IntToStr(6420)) < 0)then
            Begin
              Free;
              ShowMessage('O usuário não tem permissão para ignorar Impressão de Nota!');
            end
            else
            Begin
              Free;
              Exit;
            end;
          end
          else
            Free;
        end;
      end
      else
        Exit;
    end
    else
      Break;
  end;

  with Item_Nota_Fiscal10 do
  Begin
    Close;
    ParamByName('CNC_ORIGEM').asInteger := Entidade.CNCOrigem;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    ParamByName('NTF_CODIGO').asInteger := Entidade.CodigoNTF;
    Open;
    while not EOF do
    Begin
      if CodigoPRD > 0 then
      Begin
        Item_de_Estoque1.Close;
        Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CentroLocal;
        Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
        Item_de_Estoque1.Open;
        if Item_de_Estoque1.IsEmpty then
        Begin
          if not Item_de_Estoque1.Inserir(CentroLocal, CodigoPRD, 0(*CdFUN*),0,0,0,0,0,
              DM.Configuracao1.DataHora,0,0,0,0,0,0) then
            Raise exception.Create('Falha ao gerar Item de Estoque!');
        end;
        if (DM.Configuracao1.Empresa = empLBM) and
           (CentroLocal <> CentroExterno) then
        Begin
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CentroExterno;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
          Item_de_Estoque1.Open;
          if Item_de_Estoque1.IsEmpty then
          Begin
            if not Item_de_Estoque1.Inserir(CentroExterno, CodigoPRD, 0(*CdFUN*),0,0,0,0,0,
                DM.Configuracao1.DataHora,0,0,0,0,0,0) then
              Raise exception.Create('Falha ao gerar Item de Estoque!');
          end;
        end;
      end;
      Next;
    end;
  end;

  Entidade.Close;
  Entidade.Open;
  CdCNCPDV := Entidade.PedidoCNC;
  CdPDV := Entidade.Pedido;
  vNotaFiscal := Entidade.NotaFiscal;
  vDataEmissao := Entidade.DataEmissao;
  Trans:=false;
  try
    If DM.Configuracao1.ControleTransacao then
    Begin
      DM.Database2.StartTransaction;
      Trans:=True;
    end;

    //Não Gerar Movimento de Estoque
    if (dblTipoNota.KeyValue <> 368) and //Serviço
       (dblTipoNota.KeyValue <> 460) and //Pacote MAE
       (dblTipoNota.KeyValue <> 363) and //Correção de Nota
       ((dblTipoNota.KeyValue <> 364) or //Simples Remessa
        (dblNaturezaDaOperacao.KeyValue = 5117) or    //Venda Entraga Futura (Nota Filha)
        (dblNaturezaDaOperacao.KeyValue = 6117)) then //Venda Entrega Futura (Nota Filha)
    Begin
      with Item_Nota_Fiscal10 do
      Begin
        Close;
        Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asInteger:=Entidade.CNCOrigem;
        Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asInteger:=Entidade.CodigoCNC;
        Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger:=Entidade.CodigoNTF;
        Open;
        if not self.Pedido_de_Venda1.Active then
          self.Pedido_de_Venda1.Open;
        if (DM.Configuracao1.Empresa = empEletro) and
           (dblTipoNota.KeyValue = 361) and //Venda
           (self.Pedido_de_Venda1.EntregaDeposito) and
           (self.Pedido_de_Venda1.CodigoCNC <> 11) and //Pedido feito na Loja
           (DM.Configuracao1.CodigoCNC = 11) then //Depósito
        Begin
          If not Transferencia2.Active then
            Transferencia2.Open;
          //Não pode ter número de nota para não gerar Mov. Fiscal na Loja
          if not Transferencia2.Inserir(CentroLocal, 0, Item_Nota_Fiscal10.RecordCount,
              CentroLocal, Pedido_de_Venda1.CodigoCNC,0(*CdFUNOrigem*),0(*CdFUNDestino*),
              'PDV:'+IntToStr(Pedido_de_Venda1.CodigoPDV)+' CLI:'+IntToStr(Pedido_de_Venda1.CodigoCLI),
              True, 0(*PCP*), 1(*Processada*), 0(*TipoDoc*), 0(*FormaPag*)) then
          Begin
            ShowMessage('Falha ao gerar Transferência!');
            raise exception.Create('');
          end;
          iTRFEletro := Transferencia2.SCodigo;
        end;
        First;
        while not EOF do
        Begin
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CentroLocal;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
          Item_de_Estoque1.Open;

          if (CodigoPRD > 0) then
          Begin
            if (dblTipoNota.KeyValue = 361) then //Venda
            Begin
              EstLocal   := 0;
              EstExterno := 0;
              //Somente LBM
              if DM.Configuracao1.Empresa = empLBM then //Movimentar Estoque Externo
              Begin
                with Item_de_Estoque2 do
                Begin
                  Close;
                  ParamByName('CNC_CODIGO').asInteger:=CentroExterno;
                  ParamByName('PRD_CODIGO').asInteger:=Item_Nota_Fiscal10.CodigoPRD;
                  Open;
                  if IsEmpty then
                  Begin
                    if not Inserir(CentroExterno,Item_Nota_Fiscal10.CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                      DM.Configuracao1.DataHora,0,0,0,0,0,0) then
                    Begin
                      ShowMessage('Falha ao gerar Item de Estoque!');
                      raise exception.Create('');
                    end;
                    Close;
                    ParamByName('CNC_CODIGO').asInteger:=CentroExterno;
                    ParamByName('PRD_CODIGO').asInteger:=Item_Nota_Fiscal10.CodigoPRD;
                    Open;
                  end;
                end;
                QuantidadeVendida := Quantidade;
                if QuantidadeVendida <= Item_de_Estoque1.SFiscal then
                Begin
                  EstLocal := QuantidadeVendida;
                  QuantidadeVendida := 0;
                end
                else if Item_de_Estoque1.SFiscal > 0 then
                Begin
                  EstLocal := Item_de_Estoque1.SFiscal;
                  QuantidadeVendida := QuantidadeVendida - Item_de_Estoque1.SFiscal;
                end;

                if (QuantidadeVendida > 0) and
                   (QuantidadeVendida <= Item_de_Estoque2.SFiscal) then
                Begin
                  EstExterno := QuantidadeVendida;
                  QuantidadeVendida := 0;
                end
                else if (QuantidadeVendida > 0) and (Item_de_Estoque2.SFiscal > 0) then
                Begin
                  EstExterno := Item_de_Estoque2.SFiscal;
                  QuantidadeVendida := QuantidadeVendida - Item_de_Estoque2.SFiscal;
                end;

                if (QuantidadeVendida > 0) and (DM.Configuracao1.CodigoCNC = 1) then
                  EstExterno := EstExterno + QuantidadeVendida
                else
                  EstLocal := EstLocal + QuantidadeVendida;

                if EstExterno > 0 then
                Begin
                  //Criar a transferência Automática
                  Item_de_Transferencia1.Close;
                  Transferencia1.Close;
                  Transferencia1.ParamByName('CNC_CODIGO').asInteger:=CentroExterno;
                  Transferencia1.ParamByName('INI').asDate:=DM.Configuracao1.Data;
                  Transferencia1.ParamByName('FIM').asDate:=DM.Configuracao1.Data+1;
                  Transferencia1.Open;
                  if Transferencia1.IsEmpty then
                  Begin
                    If not Transferencia2.Active then
                      Transferencia2.Open;
                    if not Transferencia2.Inserir(CentroExterno, 0, 0,
                        CentroExterno, CentroLocal,0(*CdFUNOrigem*),0(*CdFUNDestino*),
                        '', True, 0(*PCP*), 0(*Sit*), 0(*TipoDoc*), 0(*FormaPag*)) then
                    Begin
                      ShowMessage('Falha ao gerar Transferência!');
                      raise exception.Create('');
                    end;
                    Transferencia1.Close;
                    Transferencia1.ParamByName('CNC_CODIGO').asInteger:=CentroExterno;
                    Transferencia1.ParamByName('INI').asDate:=DM.Configuracao1.Data;
                    Transferencia1.ParamByName('FIM').asDate:=DM.Configuracao1.Data+1;
                    Transferencia1.Open;
                  end;
                  Item_de_Transferencia1.Open;
                  if not Item_de_Transferencia2.Active then
                    Item_de_Transferencia2.Open;
                  if Item_de_Transferencia1.LocalizarProd(CentroExterno,Transferencia1.CodigoTRF,CodigoPRD) then
                    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TRANSFERENCIA SET ITR_QUANTIDADE=ITR_QUANTIDADE+'+
                      VirgPonto(EstExterno)+' WHERE CNC_CODIGO='+IntToStr(CentroExterno)+
                      ' AND ITR_CODIGO='+IntToStr(Item_de_Transferencia1.CodigoITR))
                  else
                  Begin
                    if not Item_de_Transferencia2.Inserir(CentroExterno,0,Transferencia1.CodigoTRF,
                      CodigoPRD,CodigoLOT,EstExterno,0) then
                    Begin
                      ShowMessage('Falha ao gerar Item de Transferência!');
                      raise exception.Create('');
                    end;
                  end;
                end;
              end
              else //Diferente de LBM
              Begin
                EstLocal := Quantidade;
              end;

              // Tipo de Entrada 13: Mov. de Saída Fiscal; Tipo de Movimento 361: Venda
              if EstLocal > 0 then
              Begin
                if not DM.Mov_Est_Fiscal1.Inserir(CentroLocal,CodigoPRD,0(*CdFUN*),0,
                   CodigoCNC,StrToInt(edtNotaFiscal.Text),361,'S', EstLocal,
                   Item_de_Estoque1.SFiscal,
                   Item_de_Estoque1.SAmostraFiscal, Amostra, Item_de_Estoque1.SBonificacaoFiscal, Bonificacao) then
                Begin
                  ShowMessage('Falha ao gerar Mov. Estoque Fiscal Local!');
                  raise exception.Create('');
                end;
                if (DM.Configuracao1.Empresa = empEletro) and
                   (Pedido_de_Venda1.EntregaDeposito) and
                   (Pedido_de_Venda1.CodigoCNC <> 11) and //Pedido feito na Loja
                   (DM.Configuracao1.CodigoCNC = 11) then //Depósito
                Begin
                  if not Item_de_Transferencia2.Active then
                    Item_de_Transferencia2.Open;
                  if not Item_de_Transferencia2.Inserir(CentroLocal,0,iTRFEletro,
                    CodigoPRD,CodigoLOT,Quantidade,0) then
                  Begin
                    ShowMessage('Falha ao gerar Item de Transferência!');
                    raise exception.Create('');
                  end;

                  //Movimento Comercial
                  if not DM.Movimento_Estoque_Comercial1.Inserir(CentroLocal,0,CodigoPRD,0(*CdFUN*),
                    361,CodigoCNC,Pedido_de_Venda1.CodigoPDV, 'S',Quantidade,
                    Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                    Item_de_Estoque1.SAmostra, Amostra, Item_de_Estoque1.SBonificacao, Bonificacao,
                    'Nota:'+edtNotaFiscal.Text) then
                  Begin
                    ShowMessage('Falha ao gerar Mov. Estoque Comercial!');
                    raise exception.Create('');
                  end;
                  //Movimento Físico
                  if not DM.Movimento_Fisico1.Inserir(CentroLocal,0,CodigoPRD,0(*CdFUN*),
                    CodigoCNC,Pedido_de_Venda1.CodigoPDV,361,
                    'S',Quantidade, Item_de_Estoque1.SFisico,
                    'Nota:'+edtNotaFiscal.Text) then
                  Begin
                    ShowMessage('Falha ao gerar Mov. Estoque Físico!');
                    raise exception.Create('');
                  end;
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                      ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
                      ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
                      ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
                      ',IES_SAMOSTRA=IES_SAMOSTRA-'+VirgPonto(Amostra)+
                      ',IES_SFISCAL=IES_SFISCAL-'+VirgPonto(Quantidade)+
                      ',IES_SBONIFICACAO_FISCAL=IES_SBONIFICACAO_FISCAL-'+VirgPonto(Bonificacao)+
                      ',IES_SAMOSTRA_FISCAL=IES_SAMOSTRA_FISCAL-'+VirgPonto(Amostra)+
                      ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                      ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                      ' AND CNC_CODIGO='+IntToStr(CentroLocal));
                end
                else
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                     ' IES_SFISCAL=IES_SFISCAL-'+VirgPonto(EstLocal)+
                     ',IES_SBONIFICACAO_FISCAL=IES_SBONIFICACAO_FISCAL+'+VirgPonto(Bonificacao)+
                     ',IES_SAMOSTRA_FISCAL=IES_SAMOSTRA_FISCAL+'+VirgPonto(Amostra)+
                     ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                     ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                     ' AND CNC_CODIGO='+IntToStr(CentroLocal));
              end;

              if EstExterno > 0 then
              Begin
                if not DM.Mov_Est_Fiscal1.Inserir(CentroExterno,CodigoPRD,0(*CdFUN*),0,
                   CodigoCNC,StrToInt(edtNotaFiscal.Text),361,'S', EstExterno,
                   Item_de_Estoque2.SFiscal,
                   Item_de_Estoque2.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque2.SBonificacaoFiscal, 0(*BonusFiscal*)) then
                Begin
                  ShowMessage('Falha ao gerar Mov. Estoque Fiscal Ext.!');
                  raise exception.Create('');
                end;
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                    ' IES_SFISCAL=IES_SFISCAL-'+VirgPonto(EstExterno)+
                    ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(CentroExterno));
              end;
            end
            else if Entidade.EntradaSaida = 1 then //Notas de Saída
            Begin
              if Item_de_Estoque1.IsEmpty then
              Begin
                ShowMessage('Produto sem Item de Estoque!');
                Raise exception.Create('');
              end;

              if not DM.Mov_Est_Fiscal1.Inserir(CentroLocal,CodigoPRD,0(*CdFUN*),0,
                CodigoCNC,StrToInt(edtNotaFiscal.Text),dblTipoNota.KeyValue, 'S',Quantidade,
                Item_de_Estoque1.SFiscal,
                Item_de_Estoque1.SAmostraFiscal, Amostra, Item_de_Estoque1.SBonificacaoFiscal, Bonificacao) then
              Begin
                ShowMessage('Falha ao gerar Mov. Estoque Fiscal!');
                raise exception.Create('');
              end;

              //Se for Devolução de Compra gerar Mov. (Comercial e Física) ou SN
              if (dblNaturezaDaOperacao.KeyValue = 5202) or
                 (dblNaturezaDaOperacao.KeyValue = 6202) or
                 (dblTipoNota.KeyValue = 4450) or //REMESSA DE TROCA
                 (dblTipoNota.KeyValue = 4490) or //REMESSA EM GARANTIA
                 (dblTipoNota.KeyValue = 4480) or //REMESSA DE AMOSTRA GRATIS
                 (dblTipoNota.KeyValue = 4470) then //REMESSA EM BONIFICACAO
              Begin
                //Movimento Comercial
                if not DM.Movimento_Estoque_Comercial1.Inserir(CentroLocal,0,CodigoPRD,0(*CdFUN*),
                  dblTipoNota.KeyValue,CodigoCNC,StrToInt(edtNotaFiscal.Text), 'S',Quantidade,
                  Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                  Item_de_Estoque1.SAmostra, Amostra, Item_de_Estoque1.SBonificacao, Bonificacao) then
                Begin
                  ShowMessage('Falha ao gerar Mov. Estoque Comercial!');
                  raise exception.Create('');
                end;
                //Movimento Físico
                if not DM.Movimento_Fisico1.Inserir(CentroLocal,0,CodigoPRD,0(*CdFUN*),
                  CodigoCNC,StrToInt(edtNotaFiscal.Text),dblTipoNota.KeyValue,
                  'S',Quantidade, Item_de_Estoque1.SFisico) then
                Begin
                  ShowMessage('Falha ao gerar Mov. Estoque Físico!');
                  raise exception.Create('');
                end;
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                    ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
                    ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
                    ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
                    ',IES_SAMOSTRA=IES_SAMOSTRA-'+VirgPonto(Amostra)+
                    ',IES_SFISCAL=IES_SFISCAL-'+VirgPonto(Quantidade)+
                    ',IES_SBONIFICACAO_FISCAL=IES_SBONIFICACAO_FISCAL-'+VirgPonto(Bonificacao)+
                    ',IES_SAMOSTRA_FISCAL=IES_SAMOSTRA_FISCAL-'+VirgPonto(Amostra)+
                    ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(CentroLocal));
              end
              else //Não gerou mov. Física e Comercial
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                    ' IES_SFISCAL=IES_SFISCAL-'+VirgPonto(Quantidade)+
                    ',IES_SBONIFICACAO_FISCAL=IES_SBONIFICACAO_FISCAL-'+VirgPonto(Bonificacao)+
                    ',IES_SAMOSTRA_FISCAL=IES_SAMOSTRA_FISCAL-'+VirgPonto(Amostra)+
                    ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(CentroLocal));

            end
            else if (cmbEntradaSaida.ItemIndex = 0) then //Entrada
            Begin
              if Item_de_Estoque1.IsEmpty then
              Begin
                ShowMessage('Produto sem Item de Estoque!');
                Raise exception.Create('');
              end;

              if not DM.Mov_Est_Fiscal1.Inserir(CentroLocal, CodigoPRD,0(*CdFUN*),0,CodigoCNC,
                StrToInt(edtNotaFiscal.Text),dblTipoNota.KeyValue,'E',Quantidade,
                Item_de_Estoque1.SFiscal,
                Item_de_Estoque1.SAmostraFiscal, Amostra, Item_de_Estoque1.SBonificacaoFiscal, Bonificacao) then
              Begin
                ShowMessage('Falha ao gerar Mov. Fiscal!');
                Raise exception.Create('');
              end;

              //Se for Devolução de Compra gerar Mov. (Comercial e Física) ou SN
              if (dblNaturezaDaOperacao.KeyValue = 5202) or //Dev. Compra
                 (dblNaturezaDaOperacao.KeyValue = 6202) or //Dev. Compra
                 (dblTipoNota.KeyValue = 4450) or //REMESSA DE TROCA
                 (dblTipoNota.KeyValue = 4490) or //REMESSA EM GARANTIA
                 (dblTipoNota.KeyValue = 4480) or //REMESSA DE AMOSTRA GRATIS
                 (dblTipoNota.KeyValue = 4470) then //REMESSA EM BONIFICACAO
              Begin
                //Movimento Comercial
                if not DM.Movimento_Estoque_Comercial1.Inserir(CentroLocal,0,CodigoPRD,0(*CdFUN*),
                  dblTipoNota.KeyValue,CodigoCNC,StrToInt(edtNotaFiscal.Text), 'E',Quantidade,
                  Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                  Item_de_Estoque1.SAmostra, Amostra, Item_de_Estoque1.SBonificacao, Bonificacao) then
                Begin
                  ShowMessage('Falha ao gerar Mov. Estoque Comercial!');
                  raise exception.Create('');
                end;
                //Movimento Físico
                if not DM.Movimento_Fisico1.Inserir(CentroLocal,0,CodigoPRD,0(*CdFUN*),
                  CodigoCNC,StrToInt(edtNotaFiscal.Text),dblTipoNota.KeyValue,
                  'E',Quantidade, Item_de_Estoque1.SFisico) then
                Begin
                  ShowMessage('Falha ao gerar Mov. Estoque Físico!');
                  raise exception.Create('');
                end;
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                    ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                    ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                    ',IES_SBONIFICACAO=IES_SBONIFICACAO+'+VirgPonto(Bonificacao)+
                    ',IES_SAMOSTRA=IES_SAMOSTRA+'+VirgPonto(Amostra)+
                    ',IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                    ',IES_SBONIFICACAO_FISCAL=IES_SBONIFICACAO_FISCAL+'+VirgPonto(Bonificacao)+
                    ',IES_SAMOSTRA_FISCAL=IES_SAMOSTRA_FISCAL+'+VirgPonto(Amostra)+
                    ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(CentroLocal));
              end
              else //Não gerou mov. Física e Comercial
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                    ' IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                    ',IES_SBONIFICACAO_FISCAL=IES_SBONIFICACAO_FISCAL+'+VirgPonto(Bonificacao)+
                    ',IES_SAMOSTRA_FISCAL=IES_SAMOSTRA_FISCAL+'+VirgPonto(Amostra)+
                    ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(CentroLocal));
            end;
          end;
          Next;
        end;

        sFiltrarTitulo := ' AND TRC_SITUACAO=0 '; //Somente em aberto
        //Venda
        if (dblTipoNota.KeyValue = 361) and  //Venda
           (self.tag <> 2)then //Não avulsa
        Begin
          if DM.Configuracao1.Empresa = empLBM then
          Begin
            with Titulo_receber1 do
            Begin
              Close;
              ParamByName('PDV_CODIGO').asInteger:=StrToInt(edtCodigoPDV.Text);
              Open;
              if not IsEmpty then
              Begin
                if Trunc(Pagamento) >= Trunc(Entidade.DataEmissao) then
                Begin
                  sFiltrarTitulo := '';
                  while not EOF do
                  Begin
                    if GerouMovimento then
                      //Mudar CCX_CODIGO,TIT_NUMERO do movimento de caixa
                      ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_CAIXA '+
                        ' SET MVC_TIT_NUMERO="'+edtNotaFiscal.Text+'" '+
                        ',CCX_CODIGO=CCX_CODIGO_REC '+
                        ' WHERE MVC_FLAG="1" '+
                        ' AND TIT_CODIGO='+IntToStr(CodigoTRC));
                    Next;
                  end;
                end;
              end;
            end;
          end;

          if DM.Configuracao1.Empresa <> empLBM then
            FiltrarCentro := ' AND CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)
          else
            FiltrarCentro := '';

          // Tornar o Título Oficial colocando o Número do Nota
          if ckbServico.Checked then
            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_NUMERO="'+edtNotaFiscal.Text+'" '+
              ',TRC_NOTA_SERVICO=1 '+
              ',CCX_CODIGO=CCX_CODIGO_REC '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PDV_CODIGO='+edtCodigoPDV.Text+
              ' AND (TRC_TIPO_PEDIDO=0 OR TRC_TIPO_PEDIDO IS NULL) '+ //Pedido de Venda
              FiltrarCentro+sFiltrarTitulo)
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_NUMERO="'+edtNotaFiscal.Text+'" '+
              ',CCX_CODIGO=CCX_CODIGO_REC '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PDV_CODIGO='+edtCodigoPDV.Text+
              ' AND (TRC_TIPO_PEDIDO=0 OR TRC_TIPO_PEDIDO IS NULL) '+ //Pedido de Venda
              FiltrarCentro+sFiltrarTitulo);
        end;
      end;
    end;
    ExecutaSQL(DM.QR_Comandos,'UPDATE NOTA_FISCAL SET '+
      ' NTF_SITUACAO=2 '+
      ',FUN_ARQUITETO='+IntToStr(CdArquiteto)+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
      ' AND NTF_CODIGO='+edtCodigoNTF.Text);

    if (DM.Configuracao1.Empresa = 1) and
       (DM.Configuracao1.CodigoCNC = 11) and //Depósito
       (DM.Usuario1.Mafalda <> 1) and //Não Mafalda
       (CdCNCPDV <> 11) then
      //Gerar Registro na Tabela de Envia_Dados_Nota
      ExecutaSQL(DM.QR_Comandos,'INSERT INTO ENVIA_DADOS_NOTA '+
        ' (CNC_CODIGO, CDN_CODIGO, CNC_DESTINO, USU_CODIGO, '+
        ' CDN_TIPO, CDN_DT_CADASTRO, PDV_CODIGO, CDN_NOTA_FISCAL, '+
        ' CDN_DT_EMISSAO, CDN_SITUACAO, CDN_OBSERVACAO) VALUES '+
        '( '+IntToStr(DM.Configuracao1.CodigoCNC)+
        ', '+IntToStr(DM.Configuracao1.ProximoCodigo('CDN_CODIGO'))+
        ', '+IntToStr(CdCNCPDV)+ //Centro de Custo do Pedido
        ', '+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',1'+ //Tipo Nota/Cupom
        ',"'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ', '+IntToStr(CdPDV)+
        ', '+IntToStr(vNotaFiscal)+
        ',"'+MesDia(vDataEmissao)+'" '+
        ',0,"")'); //Situação e Observação

    if (self.tag <> 2) then //não avulsa
    Begin
      if (dblTipoNota.KeyValue = 361) or //Venda
         ((dblTipoNota.KeyValue = 364) and //Simples Remessa (Pacote)
          ((dblNaturezaDaOperacao.KeyValue = 5117) or
           (dblNaturezaDaOperacao.KeyValue = 6117))) then
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
          ' PDV_LISTADO=5 '+
          ',PDV_NOTA_FISCAL='+edtNotaFiscal.text+
          ',PDV_NOTA_CUPOM=1 '+
          ',PDV_DT_EMISSAO_VENDA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNCPDV)+
          ' AND PDV_CODIGO='+IntToStr(CdPDV));
      end
      else if (dblTipoNota.KeyValue = 460) then //Pacote Mãe
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
          ' PCT_NOTA_FISCAL='+edtNotaFiscal.text+
          ',PCT_NOTA_CUPOM=1 '+
          ',PCT_DT_EMISSAO_VENDA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNCPDV)+
          ' AND PDV_CODIGO='+IntToStr(CdPDV));

        ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
          ' TRC_NUMERO="'+edtNotaFiscal.Text+'" '+
          ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE PDV_CODIGO='+edtCodigoPDV.Text+
          ' AND TRC_TIPO_PEDIDO=1 '+ //Pacote de Venda
          FiltrarCentro+sFiltrarTitulo);
      end
      else if (dblTipoNota.KeyValue = 362) and (Trim(edtCodigoTRO.Text) <> '') then //Devolução Parcial
        ExecutaSQL(DM.QR_Comandos,'UPDATE TROCA SET '+
          ' TRO_NOTA_FISCAL='+edtNotaFiscal.text+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNCPDV)+
          ' AND TRO_CODIGO='+edtCodigoTRO.Text);
    end;

    if (dblTipoNota.KeyValue = 368) then //Serviço
    Begin
      if not Titulo_receber2.Active then
        Titulo_receber2.Open;
      if not Titulo_receber2.Inserir(DM.Configuracao1.CodigoCNC,0, Entidade.CodigoCLI,
         0(*CodigoPDV*), DM.Configuracao1.ContRecServico,DM.Configuracao1.ContRecServico,
         5 (*TipoPag Dinheiro*),DM.Configuracao1.TipoDocumento,0(*TRF*),0(*Reabertura*),
         DM.Configuracao1.Data,0(*DtPag*),0(*DtOrigem*),0(*DtVerificad*),''(*Obs*),'1',
         IntToStr(Entidade.NotaFiscal), ''(*CartãoCV*), Entidade.TotalNota, 0(*ValorPag*),0(*Credito*),
         1(*AGF Carteira*),Entidade.ClienteCNC,0(*Situacao*),0(*TitAnt*),0(*TitOring*),
         0(*TipoPedido*),False(*MovCaixa*), False(*CHQDev*)) then
      Begin
        ShowMessage('Falha ao gerar Título a Receber!');
        Raise Exception.Create('');
      end;
    end;

    If DM.Configuracao1.ControleTransacao then
      DM.Database2.Commit;
  except
    If DM.Configuracao1.ControleTransacao then
      if trans then
      Begin
        DM.Database2.RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
  end;
  
  Entidade.Close;
  Entidade.Open;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaDados;
    edtTransportadoraRazaoSocial.Clear;
    edtRazaoSocial.Clear;
    edtEndereco.Clear;
    edtBairro.Clear;
    edtMunicipio.Clear;
    edtUF.Clear;
    mskCEP.Clear;
    mskCNPJ.Clear;
    mskTransportadoraCNPJ.Clear;
    mskCGF.Clear;
    memObservacao.Clear;
    edtNumeroInscricao.Clear;
    edtValorServico.Clear;
    edtAliquotaISS.Clear;
    ckbManual.Enabled := True;
  end;
end;

procedure TfMxNotaFiscal.NotaFiscal1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  dblTipoNotaClick(dblTipoNota);
  dblNaturezaDaOperacao.KeyValue:=Entidade.CFOP;
  edtCodigoCLIExit(edtCodigoCLI);
  cmbTipoFreteClick(edtCodigoCLI);
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT CNC_IE FROM CENTRO_DE_CUSTO '+
      ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC);
    Open;
    edtNumeroInscricao.Text := FieldByName('CNC_IE').asString;
  end;
  if (Entidade.ISS > 0) or (dblTipoNota.KeyValue = 368) then
    edtAliquotaISS.Text  := format('%.2f',[5.00])
  else
    edtAliquotaISS.Text  := '0,00';
end;

procedure TfMxNotaFiscal.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxNotaFiscal.edtCodigoPDVKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if self.tag = 2 then //Avulso
      Exit;
    cancelarloc:=false;
    if dblTipoNota.KeyValue <> 460 then //Diferente de Pacote Mãe
    Begin
      Application.CreateForm(TfMxSPedLoc, fMxSPedLoc);
      fMxSPedLoc.tag:=4;
      fMxSPedLoc.Showmodal;
      If cancelarloc Then
      Begin
        if PedAnt >= 0 then
          edtCodigoPDV.Text:=IntToStr(PedAnt)
        else
          edtCodigoPDV.Clear;
        try
          edtCodigoPDV.SetFocus;
        except
        end;
      end
      else
        try
          if dblTipoNota.KeyValue = 363 then //Correção de Dados
            memObservacao.SetFocus
          else
            edtFrete.SetFocus;
        except
        end;
    end
    else
    Begin
      Application.CreateForm(TfMxLocalizaPacote, fMxLocalizaPacote);
      fMxLocalizaPacote.tag:=2;
      fMxLocalizaPacote.Showmodal;
      If cancelarloc Then
      Begin
        if PedAnt >= 0 then
          edtCodigoPDV.Text:=IntToStr(PedAnt)
        else
          edtCodigoPDV.Clear;
        try
          edtCodigoPDV.SetFocus;
        except
        end;
      end
      else
        try
          if dblTipoNota.KeyValue = 363 then //Correção de Dados
            memObservacao.SetFocus
          else
            edtFrete.SetFocus;
        except
        end;
    end;
  end;
end;

procedure TfMxNotaFiscal.edtCodigoPDVEnter(Sender: TObject);
begin
  if edtCodigoPDV.Text <> '' then
    PedAnt:=StrToInt(edtCodigoPDV.Text)
  else
    PedAnt:=-1;
end;

procedure TfMxNotaFiscal.edtCodigoCLIEnter(Sender: TObject);
begin
  if edtCodigoCLI.Text <> '' then
    CliAnt:=StrToInt(edtCodigoCLI.Text)
  else
    CliAnt:=0;
end;

procedure TfMxNotaFiscal.edtFreteExit(Sender: TObject);
begin
  if not VerificaFloatBranco(edtFrete.Text) then
  Begin
    edtFrete.Text := '0,00';
    edtICMSFrete.Text := '0,00';
  end;

  if Arredonda(StrToFloat(edtFrete.Text)) = Arredonda(FreteAnt) then
    Exit;

  if StrToFloat(edtFrete.Text) < 0 then
  Begin
    ShowMessage('Valor de Frete inválido!');
    try
      edtFrete.SetFocus;
    except
    end;
  end
  else
  Begin
    if not VerificaFloatBranco(edtValorServico.Text) then
      edtValorServico.Text := '0,00';
    if (not VerificaFloatBranco(edtICMSFrete.Text)) then
      edtICMSFrete.Text := '7,00';
    edtFrete.Text:=format('%.2f',[StrToFloat(edtFrete.Text)]);
    edtTotalNota.Text:=format('%.2f',[StrToFloat(edtTotalProduto.Text)+
      StrToFloat(edtFrete.Text)+StrToFloat(edtSeguro.Text)+StrToFloat(edtOutrasDespesas.Text)+
      StrToFloat(edtValorServico.Text)]);
    if (Entidade.BaseICMS > 0) and
       (Entidade.Frete=0) then
    Begin
      edtBaseICMS.Text := format('%.2f',[Entidade.BaseICMS+StrToFloat(edtFrete.Text)]);
      edtICMS.Text := format('%.2f',[Entidade.ICMS+Arredonda(StrToFloat(edtFrete.Text)*StrToFloat(edtICMSFrete.Text)/100)]);
    end
    else if (Entidade.BaseICMS > 0) then
    Begin
      edtBaseICMS.Text := format('%.2f',[Entidade.BaseICMS-Entidade.Frete+StrToFloat(edtFrete.Text)]);
      edtICMS.Text := format('%.2f',[Entidade.ICMS-Entidade.ICMSFrete+Arredonda(StrToFloat(edtFrete.Text)*StrToFloat(edtICMSFrete.Text)/100)]);
    end
    else
    Begin
      edtBaseICMS.Text := format('%.2f',[StrToFloat(edtBaseICMS.Text)+StrToFloat(edtFrete.Text)]);
      edtICMS.Text := format('%.2f',[StrToFloat(edtICMS.Text)+Arredonda(StrToFloat(edtFrete.Text)*StrToFloat(edtICMSFrete.Text)/100)]);
    end;
  end;
end;

procedure TfMxNotaFiscal.edtSeguroExit(Sender: TObject);
begin
  if not VerificaFloatBranco(edtSeguro.Text) then
    edtSeguro.Text := '0,00';

  if Arredonda(StrToFloat(edtSeguro.Text)) = Arredonda(SeguroAnt) then
    Exit;

  if StrToFloat(edtSeguro.Text) < 0 then
  Begin
    ShowMessage('Valor do Seguro inválido!');
    try
      edtSeguro.SetFocus;
    except
    end;
  end
  else
  Begin
    if edtValorServico.Text = '' then
      edtValorServico.Text := '0,00';
    edtTotalNota.Text:=format('%.2f',[StrToFloat(edtTotalProduto.Text)+
      StrToFloat(edtFrete.Text)+StrToFloat(edtSeguro.Text)+StrToFloat(edtOutrasDespesas.Text)+
      StrToFloat(edtValorServico.Text)]);
    edtSeguro.Text:=format('%.2f',[StrToFloat(edtSeguro.Text)]);
  end;
end;

procedure TfMxNotaFiscal.edtOutrasDespesasExit(Sender: TObject);
begin
  if not VerificaFloatBranco(edtOutrasDespesas.Text) then
    edtOutrasDespesas.Text := '0,00';

  if Arredonda(StrToFloat(edtOutrasDespesas.Text)) = Arredonda(OutrasDespAnt) then
    Exit;

  if StrToFloat(edtOutrasDespesas.Text) < 0 then
  Begin
    ShowMessage('Valor de outras despesas inválido!');
    try
      edtOutrasDespesas.SetFocus;
    except
    end;      
  end
  else
  Begin
    if edtValorServico.Text = '' then
      edtValorServico.Text := '0,00';
    edtTotalNota.Text:=format('%.2f',[StrToFloat(edtTotalProduto.Text)+
      StrToFloat(edtFrete.Text)+StrToFloat(edtSeguro.Text)+StrToFloat(edtOutrasDespesas.Text)+
      StrToFloat(edtValorServico.Text)]);
    edtOutrasDespesas.Text:=format('%.2f',[StrToFloat(edtOutrasDespesas.Text)]);
  end;
end;

procedure TfMxNotaFiscal.edtFreteEnter(Sender: TObject);
begin
  if edtFrete.Text <> '' then
    FreteAnt:=StrToFloat(edtFrete.Text)
  else
    FreteAnt:=0;
end;

procedure TfMxNotaFiscal.edtSeguroEnter(Sender: TObject);
begin
  if edtSeguro.Text <> '' then
    SeguroAnt:=StrToFloat(edtSeguro.Text)
  else
    SeguroAnt:=0;
end;

procedure TfMxNotaFiscal.edtOutrasDespesasEnter(Sender: TObject);
begin
  if edtOutrasDespesas.Text <> '' then
    OutrasDespAnt:=StrToFloat(edtOutrasDespesas.Text)
  else
    OutrasDespAnt:=0;
end;

procedure TfMxNotaFiscal.edtCodigoTRNEnter(Sender: TObject);
begin
  if edtCodigoTRN.Text <> '' then
    TransAnt:=StrToInt(edtCodigoTRN.Text)
  else
    TransAnt:=0;
end;

procedure TfMxNotaFiscal.edtCodigoTRNKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    cancelarloc:=false;
    Application.CreateForm(TfMxSTransportadora, fMxSTransportadora);
    fMxSTransportadora.tag:=0;
    fMxSTransportadora.Transportadora1.Close;
    fMxSTransportadora.Transportadora1.Open;
    fMxSTransportadora.Showmodal;
    If cancelarloc Then
      try
        edtCodigoTRN.SetFocus;
      except
      end
    else
      edtCodigoTRNExit(sender);
  end;
end;

procedure TfMxNotaFiscal.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    //Diferente Compra e Devolução de Compra
    if (dblNaturezaDaOperacao.KeyValue <> 5202) and
       (dblNaturezaDaOperacao.KeyValue <> 6202) and
       (dblTipoNota.KeyValue <> 360) and            //Dif.Compra
       (dblTipoNota.KeyValue <> 4240) and          //Dif.Aquisição
       (dblTipoNota.KeyValue <> 451) and          //Dif.Imobilizado
       (dblTipoNota.KeyValue <> 4450) and //Remessa de Troca
       (dblTipoNota.KeyValue <> 4490) then //Remessa em Garantia
    Begin
      edtCodigoCLI.Text:='';
      key:=chr(0);
      Application.CreateForm(TfCadCli, fCadCli);
      fCadCli.tag:=9;
      fCadCli.CentroCusto2.open;
      fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
      fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
      With fCadCli.Cliente1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM CLIENTE '+
          ' WHERE CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
          ' AND CNC_CODIGO='+IntToStr(Cliente1.CodigoCNC);
        Open;
      End;
      fCadCli.Showmodal;
      if edtCodigoCLI.Text <> '' then
        edtCodigoCLIExit(Sender);
    End
    else //Devolução de Compra ou Compra ou Imobilizado
    Begin
      edtCodigoCLI.Text:='';
      key:=chr(0);
      Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
      with fMxSCotaFor do
      Begin
        Fornecedor1.Close;
        if DM.Configuracao1.Empresa = 2 then
          Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_NOME_FAN'
        else
          Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
        Fornecedor1.Open;
        tag:=31;
        ShowModal;
        if edtCodigoCLI.Text <> '' then
          edtCodigoCLIExit(Sender);
      end;
    end;
  end;
end;

procedure TfMxNotaFiscal.SB_AltClick(Sender: TObject);
begin
  if edtCodigoNTF.Text = '' then
    raise Exception.Create('Selecione a Nota primeiro!');
  if Entidade.Situacao > 0 then
    raise Exception.Create('Esta Nota não pode ser alterada!');
  if Entidade.CentroDeCusto <> DM.Configuracao1.CodigoCNC then
  Begin
    if (DM.Configuracao1.Empresa <> empEletro) or
       (DM.Configuracao1.CodigoCNC <> 11) or //Depósito
       (Entidade.CentroDeCusto <> 0) then //CPD
      Raise exception.Create('Não pode gerar nota nesse centro de custo!');
  end;

  Entidade.PreparaAlteracao;    
  SB_Nov.Enabled:=False;
  Incluir1.Enabled:=False;
  SB_Alt.Enabled:=False;
  Alterar1.Enabled:=False;
  SB_Exc.Enabled:=False;
  Excluir1.Enabled:=False;
  SB_Con.Enabled:=True;
  SB_Can.Enabled:=True;
  bitItens.Enabled:=False;
  MenuItem3.Enabled:=False;
  bitImprimir.Enabled:=False;
  bitFechar.Enabled:=False;
  try
    edtCodigoPDV.SetFocus;
  except
  end;
end;

procedure TfMxNotaFiscal.cmbTipoFreteClick(Sender: TObject);
begin
  if cmbTipoFrete.ItemIndex = 0 then //CIF
  Begin
    Transportadora1.Close;
    if VerificaInteiroBranco(edtCodigoTRN.Text) then
      Transportadora1.ParamByName('TRN_CODIGO').asInteger := StrToInt(edtCodigoTRN.Text)
    else
      Transportadora1.ParamByName('TRN_CODIGO').asInteger := 1;
    Transportadora1.Open;
    edtCodigoTRN.Text:=IntToStr(Transportadora1.CodigoTRN);
    edtTransportadoraRazaoSocial.Text := Transportadora1.RazaoSocial;
    edtCodigoTRNExit(sender);
  end
  else //FOB
    edtCodigoTRN.Enabled:=True;
end;

procedure TfMxNotaFiscal.NotaFiscal1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
end;

procedure TfMxNotaFiscal.Produto1AfterOpen(DataSet: TDataSet);
begin
  Classificacao_fiscal1.Close;
  if Produto1.CodigoCLF = 0 then
    Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=1
  else
    Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCLF;
  Classificacao_fiscal1.Open;
  Classificacao_fiscal2.Close;
  if Produto1.CodigoCTP = 0 then
    Classificacao_fiscal2.ParamByName('CLF_CODIGO').asInteger:=1
  else
    Classificacao_fiscal2.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCTP;
  Classificacao_fiscal2.Open;
end;

procedure TfMxNotaFiscal.dblTipoNotaClick(Sender: TObject);
begin
  if self.Tag <> 2 then
    edtVendedor.Enabled := False;
  if dblTipoNota.KeyValue = 460 then //Pacote Mãe
  Begin
    if tag <> 3 then //Já foi alterado
    Begin
      Pedido_de_Venda1.SQL.Text := 'SELECT * '+
        ',PCT_SITUACAO AS PDV_SITUACAO '+
        ',PCT_NOTA_FISCAL AS PDV_NOTA_FISCAL '+
        ',PCT_EM_USO AS PDV_EM_USO '+
        ',PCT_TIPO_PAG AS PDV_TIPO_PAG '+
        ',PCT_DT_EMISSAO_VENDA AS PDV_DT_EMISSAO_VENDA '+
        ',PCT_NOTA_CUPOM AS PDV_NOTA_CUPOM '+
        ',PCT_ENTRADA AS PDV_ENTRADA '+
        ' FROM PACOTE_DE_VENDA '+
        ' WHERE CNC_CODIGO=:CNC_CODIGO '+
        ' AND PDV_CODIGO=:PDV_CODIGO ';
      Item_Pedido_Venda1.SQL.Text := 'SELECT *, '+
        ' (SELECT MAX(P1.PRD_CODIGO) FROM PRODUTO P1 '+
        ' WHERE P1.SGP_CODIGO=I1.SGP_CODIGO_1) AS PRD_CODIGO, '+
        ' IPC_QUANTIDADE AS IPV_QUANTIDADE, '+
        ' IPC_PRECO AS IPV_PRECO, '+
        ' IPC_PRECO_DESCONTO AS IPV_PRECO_DESC '+
        ' FROM ITEM_DE_PACOTE_DE_VENDA I1 '+
        ' WHERE I1.CNC_CODIGO=:CNC_CODIGO '+
        ' AND I1.PDV_CODIGO=:PDV_CODIGO ';
    end;
  end
  else
  Begin
    Pedido_de_Venda1.SQL.Text := 'SELECT * FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO=:CNC_CODIGO '+
      ' AND PDV_CODIGO=:PDV_CODIGO ';
    Item_Pedido_Venda1.SQL.Text := 'SELECT * FROM ITEM_DE_PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO=:CNC_CODIGO '+
      ' AND PDV_CODIGO=:PDV_CODIGO ';
  end;
  //Diferente Simples Remessa
  if (dblTipoNota.KeyValue <> 364) then
  Begin
    edtEndereco.Enabled := False;
    edtBairro.Enabled := False;
    edtMunicipio.Enabled := False;
    edtUF.Enabled := False;
    mskCEP.Enabled := False;
  end;

  if SB_Con.Enabled then
  Begin
    cmbTipoTransporte.enabled :=true;
    cmbTipoFrete.enabled      :=true;
    cmbPlacaUF.enabled        :=true;
    edtCodigoTRN.enabled      :=true;
    mskPlaca.enabled          :=true;
  end;

  OperFiscal1.Close;
  if (dblTipoNota.KeyValue = 363) or //Correção de Dados
     (dblTipoNota.KeyValue = 368) then //Serviço
  Begin
    OperFiscal1.SQL.Text := 'SELECT * FROM OPERACAO_FISCAL '+
      ' WHERE OPF_TIPO IN (363,368) '+
      ' ORDER BY OPF_DESCRICAO ';
    if SB_Con.Enabled and (dblTipoNota.KeyValue = 368) then
      edtVendedor.Enabled := True;
  end
  else if (dblTipoNota.KeyValue = 4450) or   //REMESSA DE TROCA
          (dblTipoNota.KeyValue = 4490) then //REMESSA EM GARANTIA
    OperFiscal1.SQL.Text := 'SELECT * FROM OPERACAO_FISCAL '+
      ' WHERE OPF_CODIGO IN (1949, 2949, 5949, 6949) '+
      ' ORDER BY OPF_DESCRICAO '
  else
    OperFiscal1.SQL.Text := 'SELECT * FROM OPERACAO_FISCAL '+
      ' WHERE OPF_TIPO='+IntToStr(dblTipoNota.KeyValue)+
      ' ORDER BY OPF_DESCRICAO ';
  OperFiscal1.Open;
  dblNaturezaDaOperacao.KeyValue:=OperFiscal1.CodigoOPF;
  dblNaturezaDaOperacaoClick(sender);

  //Servico ou Ativo Imobilizado ou Beneficiamento
  if (dblTipoNota.KeyValue = 367)  OR   //Conserto
     (dblTipoNota.KeyValue = 368)  OR   //Serviço
     (dblTipoNota.KeyValue = 369)  OR   //Ativo Imobilizado
     (dblTipoNota.KeyValue = 1020) OR   //Beneficiamento
     (dblTipoNota.KeyValue = 1030) OR   //Monstruário
     (dblTipoNota.KeyValue = 1040) OR   //Demonstração Externa
     (dblTipoNota.KeyValue = 4020) OR   //Consignação
     (dblTipoNota.KeyValue = 4450) OR   //Remessa de Troca
     (dblTipoNota.KeyValue = 4490) OR   //Remessa em Garantia
     (dblTipoNota.KeyValue = 4000) then //Comodato
  Begin
    ckbServico.Checked := False;
    edtCodigoPDV.Text := '0';
    edtCodigoPDV.Enabled := False;
    if SB_Con.Enabled then
    Begin
      edtCodigoCLI.Enabled := True;
      if edtClienteCNC.Text = '' then
        if DM.Configuracao1.Empresa = empLBM then
          edtClienteCNC.Text:='1'
        else
          edtClienteCNC.Text:=IntToStr(DM.Configuracao1.CodigoCNC);
      try
        if edtVendedor.Enabled then
          edtVendedor.SetFocus
        else
          edtCodigoCLI.SetFocus;
      except
      end;
    end;
  end
  else if SB_Con.Enabled then
    edtCodigoPDV.Enabled := True;

  //Venda
  if (dblTipoNota.KeyValue = 361) and (SB_Con.Enabled) then
  Begin
    if self.Tag = 3 then
      dblNaturezaDaOperacao.KeyValue := 5922 //Venda Entrega Futura (Nota Mãe) (UF)
    else
      dblNaturezaDaOperacao.KeyValue := 5102; //Venda de Mercadoria (UF)
    dblNaturezaDaOperacaoClick(sender);
  end
  else if (dblTipoNota.KeyValue = 1030) then //Mostruário
  Begin
    OperFiscal1.SQL.Text := 'SELECT * FROM OPERACAO_FISCAL '+
      ' WHERE OPF_CODIGO IN (5949,6949,1949,2949) '+
      ' ORDER BY OPF_DESCRICAO ';
    OperFiscal1.Open;
    dblNaturezaDaOperacao.KeyValue := OperFiscal1.CodigoOPF;
    dblNaturezaDaOperacaoClick(sender);
  end
  //Simples Remessa
  else if (dblTipoNota.KeyValue = 364) and (SB_Con.Enabled) then
  Begin
    if self.Tag = 4 then
      dblNaturezaDaOperacao.KeyValue := 5117 //Venda Entrega Futura (Nota Filha) (UF)
    else
      dblNaturezaDaOperacao.KeyValue := 5923; //Simples Remessa (UF)
    dblNaturezaDaOperacaoClick(sender);
  end
  //Devolução
  Else if (dblTipoNota.KeyValue = 362) and (SB_Con.Enabled) then
  Begin
    dblNaturezaDaOperacao.KeyValue := 1202; // 132; //Operação de Devolução (UF)
    dblNaturezaDaOperacaoClick(sender);
  end
  //Correção de Dados
  else if (dblTipoNota.KeyValue = 363) and (SB_Con.Enabled) then
  Begin
    dblNaturezaDaOperacao.KeyValue := 5949; //Operação de Saída não especificada (UF)
    dblNaturezaDaOperacaoClick(sender);
  end
  //Nota de Serviço
  else if (dblTipoNota.KeyValue = 368) and (SB_Con.Enabled) then
  Begin
    dblNaturezaDaOperacao.KeyValue:=5949;
    cmbEntradaSaida.itemIndex:=1; //Saída
    edtCodigoPDVExit(sender);
  end
  //Beneficiamento / Mostruário / Demonstração Ext / Comodato
  else if (SB_Con.Enabled) and
          ((dblTipoNota.KeyValue = 1020) or
           (dblTipoNota.KeyValue = 1030) or
           (dblTipoNota.KeyValue = 1040) or
           (dblTipoNota.KeyValue = 4000) or //Comodato
           (dblTipoNota.KeyValue = 4020)) then //Consignação
  Begin
    dblNaturezaDaOperacaoClick(sender);
  end
  else if (dblTipoNota.KeyValue = 460) then //Pacote Nota Mãe  5922
  Begin
    OperFiscal1.SQL.Text := 'SELECT * FROM OPERACAO_FISCAL '+
      ' WHERE OPF_CODIGO IN (5922,6922) '+
      ' ORDER BY OPF_DESCRICAO ';
    OperFiscal1.Open;
    dblNaturezaDaOperacao.KeyValue := OperFiscal1.CodigoOPF;
    dblNaturezaDaOperacaoClick(sender);
  end
  //Venda
  else if (dblTipoNota.KeyValue = 361) then
    cmbEntradaSaida.itemIndex:=1; //Saída
  try
    if self.tag <> 2 then
      edtCodigoPDV.SetFocus
    else
      edtNotaFiscal.SetFocus;
  except
  end;
end;

procedure TfMxNotaFiscal.dblNaturezaDaOperacaoClick(Sender: TObject);
begin
  if (OperFiscal1.Entrada) and (OperFiscal1.Saida) then
  Begin
    if dblTipoNota.Enabled then
      cmbEntradaSaida.Enabled   := True;
    cmbEntradaSaida.ItemIndex := 0;
  end
  else if (OperFiscal1.Entrada) then
  Begin
    cmbEntradaSaida.Enabled   := False;
    cmbEntradaSaida.ItemIndex := 0;
  end
  else if (OperFiscal1.Saida) then
  Begin
    cmbEntradaSaida.Enabled   := False;
    cmbEntradaSaida.ItemIndex := 1;
  end;

  if (dblNaturezaDaOperacao.KeyValue = 5202) or    //Dev. de Compra
     (dblNaturezaDaOperacao.KeyValue = 6202) or
     (dblTipoNota.KeyValue = 360) then
  Begin
    edtCodigoPDV.Enabled := False;
    edtCodigoPDV.Text := '0';
    edtCodigoCLI.Enabled := True;
  end;
end;

procedure TfMxNotaFiscal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Can.Enabled then
    Begin
      SB_Can.SetFocus;
      SB_CanClick(sender);
    end
    else
      Close;
  end
  else if key=chr(13) then
  Begin
    if memObservacao.Focused then
      exit;
    if SB_Con.Enabled then
    Begin
      SB_Con.SetFocus;
      SB_ConClick(sender);
    end;
  end;
end;

procedure TfMxNotaFiscal.Pedido_de_Venda1BeforeOpen(DataSet: TDataSet);
begin
  try
    Pedido_de_Venda1.ParamByName('CNC_CODIGO').asinteger := StrToInt(edtPedidoCNC.Text);
  except
    Pedido_de_Venda1.ParamByName('CNC_CODIGO').asinteger := 0;
  end;
  try
    Pedido_de_Venda1.ParamByName('PDV_CODIGO').asinteger := StrToInt(edtCodigoPDV.Text);
  except
    Pedido_de_Venda1.ParamByName('PDV_CODIGO').asinteger := 0;
  end;
end;

procedure TfMxNotaFiscal.Item_Pedido_Venda1BeforeOpen(DataSet: TDataSet);
begin
  try
    Item_Pedido_Venda1.ParamByName('CNC_CODIGO').asinteger := StrToInt(edtPedidoCNC.Text);
  except
    Item_Pedido_Venda1.ParamByName('CNC_CODIGO').asinteger := 0;
  end;
  try
    if (DM.Configuracao1.Empresa in [empMotical, empLuciano]) and
       (self.tag <> 3) and
       (Pedido_de_Venda1.CodigoFPE > 0) then
      Item_Pedido_Venda1.ParamByName('PDV_CODIGO').asinteger := Pedido_de_Venda1.CodigoFPE
    else
      Item_Pedido_Venda1.ParamByName('PDV_CODIGO').asinteger := StrToInt(edtCodigoPDV.Text);
  except
    Item_Pedido_Venda1.ParamByName('PDV_CODIGO').asinteger := 0;
  end;
end;

function TfMxNotaFiscal.ConfirmaInclusao:Boolean;
var
  mensagem:string;
begin
  Result := False;
  mensagem:='';
  if edtCodigoPDV.Text = '' then
    edtCodigoPDV.Text := '0';
  if not (VerificaInteiroBranco(edtCodigoPDV.Text)) then
    mensagem:=mensagem+'Código de Pedido inválido!'+#13;
  if not (VerificaInteiroBranco(edtCodigoCLI.Text)) then
    mensagem:=mensagem+'Código de Cliente inválido!'+#13;
  if (dblNaturezaDaOperacao.Text = '') then
    mensagem:=mensagem+'Natureza da Operação inválida!'+#13;
  if Not (VerificaDataBranco(mskDataEmissao.Text)) then
    mensagem:=mensagem+'Data de Emissão inválida!'+#13;
  if edtSeloFiscal.Text = '' then
    mensagem:=mensagem+'Selo Fiscal inválido!'+#13;
  if dblTipoNota.KeyValue = 368 then //Serviço
  Begin
    if not (VerificaInteiroBranco(edtVendedor.Text)) then
      mensagem:=mensagem+'Código de Pedido inválido!'+#13
    else
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT * FROM FUNCIONARIO '+
          ' WHERE FUN_CODIGO='+edtVendedor.Text;
        Open;
        if IsEmpty then
          mensagem:=mensagem+'Vendedor não cadastrado!'+#13;
      end;
    end;
  end;
  //Correção de Dados
  if (dblTipoNota.KeyValue = 363) and (memObservacao.Text = '') then
    mensagem:=mensagem+'Especifique a correção!!'+#13;
  if mensagem <> '' then
  Begin
    ShowMessage(mensagem);
    Exit;
  end;
  if VerificaDataBranco(mskDataEmissao.Text) and VerificaDataBranco(mskDataEntradaSaida.Text) then
    if StrToDate(mskDataEntradaSaida.Text) < StrToDate(mskDataEmissao.Text) then
      Raise exception.Create('Data de Entrada e Saída inferior a data de emissão!');

  edtEndereco.Enabled := False;
  edtBairro.Enabled := False;
  edtMunicipio.Enabled := False;
  edtUF.Enabled := False;
  mskCEP.Enabled := False;

  //Venda
  if (dblTipoNota.KeyValue = 361) or ((dblTipoNota.KeyValue = 364)) then
  Begin
    if edtUF.Text = DM.Configuracao1.UF then
    Begin
      if StrToInt(Copy(IntToStr(dblNaturezaDaOperacao.KeyValue),1,1)) in [2,6] then
        Raise Exception.Create('Operação Fiscal inválida para Cliente Dentro do estado!');
    end
    else
    Begin
      if StrToInt(Copy(IntToStr(dblNaturezaDaOperacao.KeyValue),1,1)) in [1,5] then
        Raise Exception.Create('Operação Fiscal inválida para Cliente Fora do estado!');
    end;
  end;

  if Entidade.FinalizaEdicao(self.tag = 2) then //Se for avulsa finaliza True
  Begin
    SB_Nov.Enabled:=True;
    Incluir1.Enabled:=True;
    SB_Alt.Enabled:=True;
    Alterar1.Enabled:=True;
    SB_Exc.Enabled:=True;
    Excluir1.Enabled:=True;
    SB_Con.Enabled:=False;
    SB_Can.Enabled:=False;
    bitItens.Enabled:=True;
    MenuItem3.Enabled:=True;
    bitImprimir.Enabled:=True;
    bitFechar.Enabled:=True;
    Entidade.Close;
    Entidade.Open;
    Result := True;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxNotaFiscal.edtUFExit(Sender: TObject);
begin
  if edtUF.Text = DM.Configuracao1.UF then
  Begin
    if StrToInt(Copy(IntToStr(dblNaturezaDaOperacao.KeyValue),1,1)) in [2,6] then
      if SB_Con.Enabled and (dblTipoNota.KeyValue = 364) then //Simples Remessa
      Begin
        if self.Tag = 4 then
          dblNaturezaDaOperacao.KeyValue := 5117 //Venda Entrega Futura (Nota Filha) (UF)
        else
          dblNaturezaDaOperacao.KeyValue := 5923;
        ShowMessage('Natureza de Operação alterada. Verifique!');
      end
      else
        Raise Exception.Create('Operação Fiscal inválida para Cliente Dentro do estado!');
  end
  else
  Begin
    if StrToInt(Copy(IntToStr(dblNaturezaDaOperacao.KeyValue),1,1)) in [1,5] then
      if SB_Con.Enabled and (dblTipoNota.KeyValue = 364) then //Simples Remessa
      Begin
        if self.Tag = 4 then
          dblNaturezaDaOperacao.KeyValue := 6117 //Venda Entrega Futura (Nota Filha) (UF)
        else
          dblNaturezaDaOperacao.KeyValue := 6102;
        ShowMessage('Natureza de Operação alterada. Verifique!');
      end
      else
        Raise Exception.Create('Operação Fiscal inválida para Cliente Fora do estado!');
  end;
end;

procedure TfMxNotaFiscal.OperFiscal1CalcFields(DataSet: TDataSet);
begin
  OperFiscal1.FieldByName('CFOPDescricao').asString := IntToStr(OperFiscal1.CodigoOPF)+' - '+OperFiscal1.Descricao;
end;

end.
