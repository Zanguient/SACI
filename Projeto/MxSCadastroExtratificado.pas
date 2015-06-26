unit MxSCadastroExtratificado;
//  193 -> 194  
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, CentroCusto, Db, DBTables,
  Variants, AgenteFin, Forma_de_Pagamento, Parametro, SQuery, Vendedor,
  SubGrupo, Grupo;

type
  TfMxSExtratoExtratificado = class(TForm)
    Panel2: TPanel;
    bitConfirma: TBitBtn;
    bitCancelar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Panel3: TPanel;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    AgenteFin1: TAgenteFin;
    DSAgenteFin1: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    DSGrupo: TDataSource;
    Grupo1: TGrupo;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    GroupBox1: TGroupBox;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    ckbCodigoFOR: TCheckBox;
    edtCodigoFOR: TEdit;
    dblCodigoGRP: TDBLookupComboBox;
    ckbCodigoSGP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    ckbCodigoGRP: TCheckBox;
    dblCodigoVEN: TDBLookupComboBox;
    ckbCodigoVEN: TCheckBox;
    GroupBox2: TGroupBox;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    ckbQuantidadeAcima: TCheckBox;
    Label3: TLabel;
    ckbSituacao: TCheckBox;
    ckbTipoPagamento: TCheckBox;
    ckbCodigoFPG: TCheckBox;
    dblTipoPagamento: TDBLookupComboBox;
    dblCodigoFPG: TDBLookupComboBox;
    cmbSituacao: TComboBox;
    ckbNumeroNota: TCheckBox;
    edtNumeroNota: TEdit;
    ckbVendasPorFaturar: TCheckBox;
    ckbValorTotal1: TCheckBox;
    cmbValorTotal1: TComboBox;
    edtValorTotal1: TEdit;
    ckbVendasFaturadas: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    GroupBox3: TGroupBox;
    ckbSintetico: TCheckBox;
    ckbMalaDireta: TCheckBox;
    GroupBox4: TGroupBox;
    rdgPedidoInteiro: TRadioButton;
    rdgQualquerParcela: TRadioButton;
    ckbSomenteInadiplentes: TCheckBox;
    GroupBox5: TGroupBox;
    ckbSomenteAdiplentes: TCheckBox;
    rdgSemParcelas: TRadioButton;
    rdgTodasParcelas: TRadioButton;
    ckbDataOrigemAdiplente: TCheckBox;
    ckbDataOrigemInadiplente: TCheckBox;
    ckbLJ3: TCheckBox;
    rdgDataCadastro1: TRadioButton;
    rdgDataAlterado: TRadioButton;
    rdgDataEmissao: TRadioButton;
    rdgDataDevolucao: TRadioButton;
    ckbCodigoAGF: TCheckBox;
    dblCodigoAGF: TDBLookupComboBox;
    cmbAgenteFinanceiro: TComboBox;
    ckbUltimaCompra: TCheckBox;
    cmbUltimaCompra: TComboBox;
    mskUltimaCompra: TMaskEdit;
    Label6: TLabel;
    ckbValorTotal2: TCheckBox;
    cmbValorTotal2: TComboBox;
    edtValorTotal2: TEdit;
    ckbExibirTotal: TCheckBox;
    ckbAgruparVendedor: TCheckBox;
    ckbAgruparCentro: TCheckBox;
    MalaDireta1: TQuery;
    ckbMaioresClientes: TCheckBox;
    edtQuantidadeMaiores: TEdit;
    ckbComPacotes: TCheckBox;
    ckbFormaPagCliente: TCheckBox;
    dblFormaPagCliente: TDBLookupComboBox;
    cmbFormaPagCliente: TComboBox;
    Forma_de_Pagamento2: TForma_de_Pagamento;
    DSForma_de_Pagamento2: TDataSource;
    ckbSomenteBloqueados: TCheckBox;
    ckbSomenteNaoBloqueados: TCheckBox;
    ckbClassificacao: TCheckBox;
    dblClassificacao: TDBLookupComboBox;
    ckbTipo: TCheckBox;
    dblTipo: TDBLookupComboBox;
    Parametro2: TParametro;
    DSParametro2: TDataSource;
    Parametro3: TParametro;
    DSParametro3: TDataSource;
    rdgDataEntrega: TRadioButton;
    ckbConvenio: TCheckBox;
    edtConvenio: TEdit;
    ckbTipoPessoa: TCheckBox;
    cmbTipoPessoa: TComboBox;
    ckbLJ4: TCheckBox;
    Bevel1: TBevel;
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbCodigoVENClick(Sender: TObject);
    procedure dblCodigoCNCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitConfirmaClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure ckbTipoPagamentoClick(Sender: TObject);
    procedure ckbCodigoFPGClick(Sender: TObject);
    procedure ckbCodigoAGFClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure ckbNumeroNotaClick(Sender: TObject);
    procedure ckbValorTotal1Click(Sender: TObject);
    procedure ckbVendasPorFaturarClick(Sender: TObject);
    procedure ckbVendasFaturadasClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure ckbSomenteAdiplentesClick(Sender: TObject);
    procedure ckbSomenteInadiplentesClick(Sender: TObject);
    procedure ckbLJ3Click(Sender: TObject);
    procedure ckbValorTotal2Click(Sender: TObject);
    procedure ckbUltimaCompraClick(Sender: TObject);
    procedure ckbMaioresClientesClick(Sender: TObject);
    procedure ckbExibirTotalClick(Sender: TObject);
    procedure ckbComPacotesClick(Sender: TObject);
    procedure ckbFormaPagClienteClick(Sender: TObject);
    procedure ckbSomenteBloqueadosClick(Sender: TObject);
    procedure ckbSomenteNaoBloqueadosClick(Sender: TObject);
    procedure ckbClassificacaoClick(Sender: TObject);
    procedure ckbTipoClick(Sender: TObject);
    procedure ckbConvenioClick(Sender: TObject);
    procedure ckbTipoPessoaClick(Sender: TObject);
    procedure ckbLJ4Click(Sender: TObject);
  private
    function GerarMalaDireta: integer;
    { Private declarations }
  public

  end;

var
  fMxSExtratoExtratificado: TfMxSExtratoExtratificado;

implementation

uses UDM, UVendasCliente, funcoes, MxSPediProd, CdCliente, MxSCotaFor,
  UVendasClienteProduto, MxGraficoProdutosMaisVendidos,
  UCadastroExtratificado, MxSPediProdMotCal;

{$R *.DFM}

procedure TfMxSExtratoExtratificado.ckbCodigoCLIClick(Sender: TObject);
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
    edtCodigoCLI.Text:='';
    edtCodigoCLI.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Text:='';
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbCodigoVENClick(Sender: TObject);
begin
  if ckbCodigoVEN.Checked then
  Begin
    Vendedor1.Close;
    try
      Vendedor1.ParamByName('CNC_CODIGO').asInteger:=dblCodigoCNC.KeyValue;
    except
    end;
    Vendedor1.Open;
    dblCodigoVEN.Color:=clWindow;
    dblCodigoVEN.Enabled:=True;
    dblCodigoVEN.KeyValue:=Vendedor1.CodigoFUN;
    dblCodigoVEN.SetFocus;
  end
  else
  Begin
    Vendedor1.Close;
    dblCodigoVEN.Color:=AlteraCorComponentes;
    dblCodigoVEN.KeyValue:=-1;
    dblCodigoVEN.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.dblCodigoCNCClick(Sender: TObject);
begin
  if (DM.Configuracao1.Empresa = empEletro) and (ckbCodigoVEN.Checked) then
  Begin
    Vendedor1.Close;
    Vendedor1.ParamByName('CNC_CODIGO').asInteger:=dblCodigoCNC.KeyValue;
    Vendedor1.Open;
  end;
end;

procedure TfMxSExtratoExtratificado.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if DM.Configuracao1.Empresa = empEletro then
  Begin
    ckbCodigoCNC.Checked := True;
    ckbAgruparVendedor.Enabled := False;
  end
  else
  Begin
    with Vendedor1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM FUNCIONARIO '+
        ' WHERE FUN_SITUACAO<>1 '+
        ' AND (FUN_APARECE_VENDAS=1 '+
        '  OR FUN_APARECE_SERVICOS=1) ';
      if ckbCodigoCNC.Checked then
        SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCOdigoCNC.KeyValue)+
                '  OR  FUN_TODOS_CENTROS=1) ');
      SQL.Add(' ORDER BY FUN_APELIDO ASC ');
    end;
    ckbCodigoCNC.Checked := False;
    ckbSintetico.Checked := True;
    ckbExibirTotal.Checked := True;
    if DM.Configuracao1.Empresa = empLBM then
    Begin
      rdgDataEmissao.Checked := True;
      ckbVendasFaturadas.Checked := True;
      ckbUltimaCompra.Checked := True;
    end;
  end;

  ckbSituacao.Checked:=True;
  mskDataINI.SetFocus;
end;

procedure TfMxSExtratoExtratificado.bitConfirmaClick(Sender: TObject);
var
  mensagem, CdCNC,CdCNC2,CdPRD,CdFOR,CdCLI,CdCLI1,sTipoPessoa,sConvenio,sVendasConvenio,sVendasConvenio2,CdFUN,CdFUN2,CdFUN3,CdPDV,SIT,CdTPG,CdFPG,
      CdAGF,CdNTF,Valor1,Valor2,DataINI,DataFIM,DataINIPCT,
      DataFIMPCT,DataINIPCR,DataFIMPCR,AcimaNormal, CdGRP, CdSGP, Devedor,
      sUltimaCompra, sExibirTota, sComPacotes, sFPGCliente, sBloquados, sClassificacao, sTipo, sOrdem, sFiltros:string;
begin
  DataINI    :='';
  DataINI    :='';
  DataINIPCT :='';
  DataINIPCT :='';
  DataINIPCR :='';
  DataINIPCR :='';
  CdCNC      :='';
  CdCNC2     :='';
  CdPRD      :='';
  CdFOR      :='';
  CdCLI      :='';
  CdCLI1     :='';
  sTipoPessoa:='';
  sConvenio  :='';
  sVendasConvenio:='';
  sVendasConvenio2:='';
  CdFUN      :='';
  CdFUN2     :='';
  CdFUN3     :='';
  CdPDV      :='';
  SIT        :='';
  CdTPG      :='';
  CdFPG      :='';
  sFPGCliente:='';
  CdAGF      :='';
  CdNTF      :='';
  Valor1     :='';
  Valor2     :='';
  sUltimaCompra := '';
  AcimaNormal:='';
  CdGRP      :='';
  CdSGP      :='';
  Devedor    :='';
  sComPacotes:='';
  sBloquados :='';
  sClassificacao := '';
  sTipo := '';
  mensagem   :='';
  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;

  if VerificaDataBranco(mskDataINI.Text)then
  Begin
    if rdgDataAlterado.Checked then
    Begin
      DataINI    := ' AND (PDV_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") ';
      DataINIPCT := ' AND (PCT_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") ';
      DataINIPCR := ' AND (PCR_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") ';
    end
    else if rdgDataCadastro1.Checked then
    Begin
      DataINI    := ' AND (PDV_DATA_HORA>="'+MesDia(mskDataINI.Text)+'") ';
      DataINIPCT := ' AND (PCT_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") ';
      DataINIPCR := ' AND (PCR_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") ';
    end
    else if rdgDataEmissao.Checked then
    Begin
      DataINI    := ' AND (PDV_DT_EMISSAO_VENDA>="'+MesDia(mskDataINI.Text)+'") ';
      DataINIPCT := ' AND (PCT_DT_EMISSAO_VENDA>="'+MesDia(mskDataINI.Text)+'") ';
      DataINIPCR := ' AND (PCR_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") ';
    end
    else if rdgDataDevolucao.Checked then
    Begin
      DataINI    := ' AND (PDV_DT_DEVOLUCAO>="'+MesDia(mskDataINI.Text)+'") ';
      DataINIPCT := ' AND (PCT_DT_DEVOLUCAO>="'+MesDia(mskDataINI.Text)+'") ';
      DataINIPCR := ' AND (PCR_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") ';
    end
    else if rdgDataEntrega.Checked then
    Begin
      DataINI    := ' AND (PDV_DT_ENTREGA>="'+MesDia(mskDataINI.Text)+'") ';
      DataINIPCT := ' AND (PCT_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") ';
      DataINIPCR := ' AND (PCR_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'") ';
    end;
  end;

  if VerificaDataBranco(mskDataFIM.Text)then
  Begin
    if rdgDataAlterado.Checked then
    Begin
      DataFIM    := ' AND (PDV_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DataFIMPCT := ' AND (PCT_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DataFIMPCR := ' AND (PCR_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    end
    else if rdgDataCadastro1.Checked then
    Begin
      DataFIM := ' AND (PDV_DATA_HORA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DataFIMPCT := ' AND (PCT_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DataFIMPCR := ' AND (PCR_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    end
    else if rdgDataEmissao.Checked then
    Begin
      DataFIM := ' AND (PDV_DT_EMISSAO_VENDA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DataFIMPCT := ' AND (PCT_DT_EMISSAO_VENDA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DataFIMPCR := ' AND (PCR_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    end
    else if rdgDataDevolucao.Checked then
    Begin
      DataFIM := ' AND (PDV_DT_DEVOLUCAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DataFIMPCT := ' AND (PCT_DT_DEVOLUCAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DataFIMPCR := ' AND (PCR_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    end
    else if rdgDataEntrega.Checked then
    Begin
      DataFIM := ' AND (PDV_DT_ENTREGA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DataFIMPCT := ' AND (PCT_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
      DataFIMPCR := ' AND (PCR_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
    end;
  end;

  if mensagem<>'' then
    raise exception.Create(mensagem);

  if ckbCodigoCLI.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Código do Cliente inválido!');
    end
    else
    Begin
      CdCLI  := ' AND (T2.CLI_CODIGO='+edtCodigoCLI.Text+') ';
      CdCLI1 := ' AND (T1.CLI_CODIGO='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + ' (CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbConvenio.Checked then
    if not VerificaInteiroBranco(edtConvenio.Text) then
    Begin
      edtConvenio.SetFocus;
      raise Exception.Create('Código do Convênio inválido!');
    end
    else
    Begin
      sConvenio:= ' AND C1.CLI_CONVENIO='+edtConvenio.Text;
      if edtConvenio.Text <> '0' then
      Begin
        sVendasConvenio  := ' AND T2.PDV_TIPO_VENDA=1 '; //Pendente
        sVendasConvenio2 := ' AND P1.PDV_TIPO_VENDA=1 '; //Pendente
      end;
      sFiltros := sFiltros + '(Convenio:'+edtConvenio.Text+')';
    end;

  //Filtrar Tipo Pessora
  if ckbTipoPessoa.Checked then
    if cmbTipoPessoa.ItemIndex = 0 then
    Begin
      STipoPessoa := ' AND C1.CLI_PESSOA_FISICA=1 ';
      sFiltros := sFiltros + '(P.Fisico)';
    end
    else if cmbTipoPessoa.ItemIndex = 1 then
    Begin
      sTipoPessoa := ' AND C1.CLI_PESSOA_FISICA=0 ';
      sFiltros := sFiltros + '(P.Juridica)';
    end
    else
    Begin
      sTipoPessoa := ' AND C1.CLI_VENDA_ATACADO=1 ';
      sFiltros := sFiltros + '(Atacado)';
    end;

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Begin
      edtCodigoPRD.SetFocus;
      raise Exception.Create('Código do produto inválido!');
    end
    else
    Begin
      CdPRD:=' AND (T1.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + ' (PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbCodigoFOR.Checked then
    sFiltros := sFiltros + ' (FOR:'+edtCodigoFOR.Text+')';

  if ckbCodigoGRP.Checked then
    sFiltros := sFiltros + ' (GRP:'+IntToStr(dblCodigoGRP.KeyValue)+')';

  if ckbCodigoSGP.Checked then
    sFiltros := sFiltros + ' (SGP:'+IntToStr(dblCodigoSGP.KeyValue)+')';

  if ckbCodigoFOR.Checked then //Fornecedor
  Begin
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
    Begin
      edtCodigoFOR.SetFocus;
      raise Exception.Create('Código do Fornecedor inválido!');
    end
    else if ckbCodigoGRP.Checked then //Grupo
    Begin
      if ckbCodigoSGP.Checked then //SubGrupo
      Begin
        if not (dblCodigoSGP.KeyValue > 0) then
          Raise Exception.Create('SubGrupo inválido!')
        else //Com Grupo e SubGrupo
          CdFOR:=' AND (T1.PRD_CODIGO IN (SELECT T5.PRD_CODIGO FROM PRODUTO T5 '+
            ' WHERE T5.FOR_CODIGO='+edtCodigoFOR.Text+
            ' AND T5.GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue)+
            ' AND T5.SGP_CODIGO='+IntToStr(dblCodigoSGP.KeyValue)+')) ';
      end
      else //Com Grupo e Sem SubGrupo
        CdFOR:=' AND (T1.PRD_CODIGO IN (SELECT T5.PRD_CODIGO FROM PRODUTO T5 '+
          ' WHERE T5.FOR_CODIGO='+edtCodigoFOR.Text+
          ' AND T5.GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue)+')) ';
    end
    else //Sem Grupo
      CdFOR:=' AND (T1.PRD_CODIGO IN (SELECT T5.PRD_CODIGO FROM PRODUTO T5 '+
        ' WHERE T5.FOR_CODIGO='+edtCodigoFOR.Text+')) ';
  end
  else if ckbCodigoGRP.Checked then //Com Grupo e Sem Fornecedor
  Begin
    if ckbCodigoSGP.Checked then //Com SubGrupo
    Begin
      if not (dblCodigoSGP.KeyValue > 0) then
        Raise Exception.Create('SubGrupo inválido!')
      else
        CdFOR:=' AND (T1.PRD_CODIGO IN (SELECT T5.PRD_CODIGO FROM PRODUTO T5 '+
          ' WHERE T5.GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue)+
          ' AND T5.SGP_CODIGO='+IntToStr(dblCodigoSGP.KeyValue)+')) ';
    end
    else //Com Grupo e Sem SubGrupo
      CdFOR:=' AND (T1.PRD_CODIGO IN (SELECT T5.PRD_CODIGO FROM PRODUTO T5 '+
        ' WHERE T5.GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue)+')) ';
  end;

  if ckbCodigoVEN.Checked then
    if not (dblCodigoVEN.KeyValue > 0) then
    Begin
      dblCodigoVEN.SetFocus;
      raise Exception.Create('Vendedor(a) inválido(a)!');
    end
    else
    Begin
      CdFUN :=' AND (T1.FUN_CODIGO='+IntToStr(dblCodigoVEN.KeyValue)+') ';
      CdFUN2:=' AND (I1.FUN_CODIGO='+IntToStr(dblCodigoVEN.KeyValue)+') ';
      CdFUN3:=' AND (P1.FUN_CODIGO='+IntToStr(dblCodigoVEN.KeyValue)+') ';      
      sFiltros := sFiltros + ' (FUN:'+IntToStr(dblCodigoVEN.KeyValue)+')';
    end;

  if ckbCodigoPDV.Checked then
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Begin
      edtCodigoPDV.SetFocus;
      raise Exception.Create('Código do pedido inválido!');
    end
    else
    Begin
      CdPDV:=' AND (T1.PDV_CODIGO='+edtCodigoPDV.Text+') ';
      sFiltros := sFiltros + ' (PDV:'+edtCodigoPDV.Text+')';
    end;

  if ckbSituacao.Checked then
  Begin
    case cmbSituacao.ItemIndex of
      0: Begin
           SIT:=' AND (T2.PDV_SITUACAO < 4) ';
           sFiltros := sFiltros + ' (Em Aberto)';
         end;
      1: Begin
           SIT:=' AND (T2.PDV_SITUACAO=4) ';
           sFiltros := sFiltros + ' (Finalizado)';
         end;
      2: Begin
           SIT:=' AND (T2.PDV_SITUACAO=6) ';
           sFiltros := sFiltros + ' (Cancelado)';
         end;
      3: Begin
           SIT:=' AND (T2.PDV_SITUACAO=8) ';
           sFiltros := sFiltros + ' (Devolvido)';
         end;
      4: Begin
           SIT:=' AND (T2.PDV_SITUACAO < 4 AND T2.PDV_DIAS_RESERV > 0) '; //Orçamento
           sFiltros := sFiltros + ' (Orçamento)';
         end;
    end;
  end
  else
    Sit := '';

  if ckbTipoPagamento.Checked then
    if dblTipoPagamento.Text = '' then
    Begin
      dblTipoPagamento.SetFocus;
      raise Exception.Create('Tipo de Pagamento inválido!');
    end
    else
    Begin
      CdTPG:=' AND (T2.PDV_TIPO_PAG='+IntToStr(dblTipoPagamento.KeyValue)+') ';
      sFiltros := sFiltros + ' (TipoPag:'+IntToStr(dblTipoPagamento.KeyValue)+')';
    end;

  if ckbCodigoFPG.Checked then
    if dblCodigoFPG.Text = '' then
    Begin
      dblCodigoFPG.SetFocus;
      raise Exception.Create('Forma de Pagamento inválido!');
    end
    else
    Begin
      CdFPG:=' AND (T2.FPG_CODIGO='+IntToStr(dblCodigoFPG.KeyValue)+') ';
      sFiltros := sFiltros + ' (FPG:'+IntToStr(dblCodigoFPG.KeyValue)+')';
    end;

  if ckbUltimaCompra.Checked then
  Begin
    if not VerificaDataBranco(mskUltimaCompra.Text) then
    Begin
      mskUltimaCompra.SetFocus;
      Raise Exception.Create('Data da Última Compra inválida!');
    end
    else
      if DM.Configuracao1.Empresa <> empLBM then
      Begin
        case cmbUltimaCompra.ItemIndex of
          //Última Compra < que a data solicitada
          0: Begin
               sUltimaCompra:=' AND NOT EXISTS (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
                 ' WHERE CLI_CODIGO=C1.CLI_CODIGO '+
                 ' AND CNC_CLIENTE=C1.CNC_CODIGO '+
                 ' AND PDV_DATA_HORA>= "'+MesDia(mskUltimaCompra.Text)+'") ';
               sFiltros := sFiltros + ' (Ult.Compra:<'+mskUltimaCompra.Text+')';
             end;
          //Última Fatura > que a data solicitada
          1: Begin
               sUltimaCompra:=' AND EXISTS (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
                 ' WHERE CLI_CODIGO=C1.CLI_CODIGO '+
                 ' AND CNC_CLIENTE=C1.CNC_CODIGO '+
                 ' AND PDV_DATA_HORA> "'+MesDia(mskUltimaCompra.Text)+'") ';
               sFiltros := sFiltros + ' (Ult.Compra:>'+mskUltimaCompra.Text+')';
             end;
          //Última Fatura <= que a data Solicitada
          2: Begin
               sUltimaCompra:=' AND NOT EXISTS (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
                 ' WHERE CLI_CODIGO=C1.CLI_CODIGO '+
                 ' AND CNC_CLIENTE=C1.CNC_CODIGO '+
                 ' AND PDV_DATA_HORA>"'+MesDia(mskUltimaCompra.Text)+'") ';
               sFiltros := sFiltros + ' (Ult.Compra:<='+mskUltimaCompra.Text+')';
             end;
          //Última Fatura >= que a data solicitada
          3: Begin
               sUltimaCompra:=' AND EXISTS (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
                 ' WHERE CLI_CODIGO=C1.CLI_CODIGO '+
                 ' AND CNC_CLIENTE=C1.CNC_CODIGO '+
                 ' AND PDV_DATA_HORA>="'+MesDia(mskUltimaCompra.Text)+'") ';
               sFiltros := sFiltros + ' (Ult.Compra:>='+mskUltimaCompra.Text+')';
             end;
        end;
      end
      else
      Begin
        case cmbUltimaCompra.ItemIndex of
          //Última Fatura < que a data solicitada
          0: Begin
               sUltimaCompra:=' AND NOT EXISTS (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
                 ' WHERE CLI_CODIGO=C1.CLI_CODIGO '+
                 ' AND CNC_CLIENTE=C1.CNC_CODIGO '+
                 ' AND PDV_DT_EMISSAO_VENDA>= "'+MesDia(mskUltimaCompra.Text)+'") ';
               sFiltros := sFiltros + ' (Ult.Compra:<'+mskUltimaCompra.Text+')';
             end;
          //Última Fatura > que a data solicitada
          1: Begin
               sUltimaCompra:=' AND EXISTS (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
                 ' WHERE CLI_CODIGO=C1.CLI_CODIGO '+
                 ' AND CNC_CLIENTE=C1.CNC_CODIGO '+
                 ' AND PDV_DT_EMISSAO_VENDA> "'+MesDia(mskUltimaCompra.Text)+'") ';
               sFiltros := sFiltros + ' (Ult.Compra:>'+mskUltimaCompra.Text+')';
             end;
          //Última Fatura <= que a data Solicitada
          2: Begin
               sUltimaCompra:=' AND NOT EXISTS (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
                 ' WHERE CLI_CODIGO=C1.CLI_CODIGO '+
                 ' AND CNC_CLIENTE=C1.CNC_CODIGO '+
                 ' AND PDV_DT_EMISSAO_VENDA>"'+MesDia(mskUltimaCompra.Text)+'") ';
               sFiltros := sFiltros + ' (Ult.Compra:<='+mskUltimaCompra.Text+')';
             end;
          //Última Fatura >= que a data solicitada
          3: Begin
               sUltimaCompra:=' AND EXISTS (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
                 ' WHERE CLI_CODIGO=C1.CLI_CODIGO '+
                 ' AND CNC_CLIENTE=C1.CNC_CODIGO '+
                 ' AND PDV_DT_EMISSAO_VENDA>="'+MesDia(mskUltimaCompra.Text)+'") ';
               sFiltros := sFiltros + ' (Ult.Compra:>='+mskUltimaCompra.Text+')';
             end;
        end;
      end;
  end;

  if ckbCodigoAGF.Checked then
    if dblCodigoAGF.Text = '' then
    Begin
      dblCodigoAGF.SetFocus;
      raise Exception.Create('Agente Financeiro inválido!');
    end
    else
      Case cmbAgenteFinanceiro.ItemIndex of
        0: Begin
             CdAGF:=' AND (T2.AGF_CODIGO='+IntToStr(dblCodigoAGF.KeyValue)+') ';
             sFiltros := sFiltros + ' (AGF:='+dblCodigoAGF.Text+')';
           end;
        1: Begin
             CdAGF:=' AND (T2.AGF_CODIGO<>'+IntToStr(dblCodigoAGF.KeyValue)+') ';
             sFiltros := sFiltros + ' (AGF:<>'+dblCodigoAGF.Text+')';
           end;
      end;

  if ckbFormaPagCliente.Checked then
  Begin
    if dblFormaPagCliente.Text = '' then
    Begin
      dblFormaPagCliente.SetFocus;
      raise Exception.Create('Forma Pagamento Cliente inválido!');
    end
    else
    Begin
      Case cmbFormaPagCliente.ItemIndex of
        0: Begin
             sFiltros := sFiltros + ' (FPGCliente:='+dblFormaPagCliente.Text+')';
             sFPGCliente:=' AND (EXISTS (SELECT CLI_CODIGO '+
               ' FROM INFORMACOES_DE_CREDITO I45 '+
               ' WHERE I45.CNC_CODIGO=C1.CNC_CODIGO '+
               ' AND I45.CLI_CODIGO=C1.CLI_CODIGO '+
               ' AND I45.FPG_CODIGO='+IntToStr(dblFormaPagCliente.KeyValue)+')) ';
           end;
        1: Begin
             sFiltros := sFiltros + ' (FPGCliente:<>'+dblFormaPagCliente.Text+')';
             sFPGCliente:=' AND (NOT EXISTS (SELECT CLI_CODIGO '+
               ' FROM INFORMACOES_DE_CREDITO I45 '+
               ' WHERE I45.CNC_CODIGO=C1.CNC_CODIGO '+
               ' AND I45.CLI_CODIGO=C1.CLI_CODIGO '+
               ' AND I45.FPG_CODIGO='+IntToStr(dblFormaPagCliente.KeyValue)+')) ';
           end;
      end;
    end;
  end;

  if ckbSomenteBloqueados.Checked then
  Begin
    sFiltros := sFiltros + ' (Bloqueados)';
    sBloquados:=' AND (EXISTS (SELECT CLI_CODIGO '+
      ' FROM INFORMACOES_DE_CREDITO I45 '+
      ' WHERE I45.CNC_CODIGO=C1.CNC_CODIGO '+
      ' AND I45.CLI_CODIGO=C1.CLI_CODIGO '+
      ' AND I45.ICR_PROIBIDO=1)) ';
  end
  else if ckbSomenteNaoBloqueados.Checked then
  Begin
    sFiltros := sFiltros + ' (Desbloqueados)';
    sBloquados:=' AND (NOT EXISTS (SELECT CLI_CODIGO '+
      ' FROM INFORMACOES_DE_CREDITO I45 '+
      ' WHERE I45.CNC_CODIGO=C1.CNC_CODIGO '+
      ' AND I45.CLI_CODIGO=C1.CLI_CODIGO '+
      ' AND I45.ICR_PROIBIDO=1)) ';
  end;

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
    Begin
      dblCodigoCNC.SetFocus;
      raise Exception.Create('Centro de Custo inválido!');
    end
    else
    Begin
      CdCNC :=' AND (T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      CdCNC2:=' AND (P1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  if ckbNumeroNota.Checked then
    if not VerificaInteiroBranco(edtNumeroNota.Text) then
    Begin
      edtNumeroNota.SetFocus;
      raise Exception.Create('Número da Nota inválido!');
    end
    else
    Begin
      CdNTF:=' AND (PDV_NOTA_FISCAL='+edtNumeroNota.Text+') ';
      sFiltros := sFiltros + ' (Nota:'+edtNumeroNota.Text+')';
    end;

  if ckbVendasPorFaturar.Checked then
  Begin
    CdNTF:=' AND (PDV_NOTA_FISCAL=0 OR PDV_NOTA_FISCAL IS NULL) ';
    sFiltros := sFiltros + ' (Por Fat)';
  end;

  if ckbVendasFaturadas.Checked then
  Begin
    if ckbLJ3.Checked and
       ckbLJ4.Checked then
    Begin
      CdNTF:=' AND (PDV_NOTA_FISCAL>0 OR PDV_NOTA_FISCAL=-1 OR PDV_NOTA_FISCAL=-2) ';
      sFiltros := sFiltros + ' (Fat/LJ3/LJ4)';
    end
    else if ckbLJ3.Checked then
    Begin
      CdNTF:=' AND (PDV_NOTA_FISCAL>0 OR PDV_NOTA_FISCAL=-1) ';
      sFiltros := sFiltros + ' (Fat/LJ3)';
    end
    else if ckbLJ4.Checked then
    Begin
      CdNTF:=' AND (PDV_NOTA_FISCAL>0 OR PDV_NOTA_FISCAL=-4) ';
      sFiltros := sFiltros + ' (Fat/LJ4)';
    end
    else
    Begin
      CdNTF:=' AND (PDV_NOTA_FISCAL>0) ';
      sFiltros := sFiltros + ' (NTF>0)';
    end
  end
  else if ckbLJ3.Checked and
          ckbLJ4.Checked then
  Begin
    CdNTF:=' AND (PDV_NOTA_FISCAL=-1 OR PDV_NOTA_FISCAL=-2) ';
    sFiltros := sFiltros + ' (LJ3/LJ4)';
  end
  else if ckbLJ3.Checked then
  Begin
    CdNTF:=' AND (PDV_NOTA_FISCAL=-1) ';
    sFiltros := sFiltros + ' (LJ3)';
  end
  else if ckbLJ4.Checked then
  Begin
    CdNTF:=' AND (PDV_NOTA_FISCAL=-2) ';
    sFiltros := sFiltros + ' (LJ4)';
  end;

  if ckbQuantidadeAcima.Checked then
    AcimaNormal:=
      //Verificar com PRD
      ' AND (EXISTS (SELECT T4.QNV_CODIGO FROM QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T4.PRD_CODIGO=T1.PRD_CODIGO) OR '+
      //Verificar com SGP
      ' EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T4.FOR_CODIGO=T3.FOR_CODIGO '+
      ' AND T4.GRP_CODIGO=T3.GRP_CODIGO AND T4.SGP_CODIGO=T3.SGP_CODIGO AND T4.PRD_CODIGO=0) '+
      //Verificar com GRP
      ' OR EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T4.FOR_CODIGO=T3.FOR_CODIGO '+
      ' AND T4.GRP_CODIGO=T3.GRP_CODIGO AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0) '+
      //Verificar com FOR
      ' OR EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T4.FOR_CODIGO=T3.FOR_CODIGO '+
      ' AND T4.GRP_CODIGO=0 AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0)) '+

      //Verificar Quantidade com PRD
      ' AND (NOT EXISTS (SELECT T4.QNV_CODIGO FROM QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T4.PRD_CODIGO) '+
      ' OR T1.IPV_QUANTIDADE>(SELECT MAX(T4.QNV_QUANTIDADE) '+
      ' FROM QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T4.PRD_CODIGO)) '+

      //Verificar Quantidade com SGP
      ' AND (NOT EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
      ' AND T3.GRP_CODIGO=T4.GRP_CODIGO AND T3.SGP_CODIGO=T4.SGP_CODIGO AND T4.PRD_CODIGO=0) '+
      ' OR T1.IPV_QUANTIDADE>(SELECT MAX(T4.QNV_QUANTIDADE) '+
      ' FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
      ' AND T3.GRP_CODIGO=T4.GRP_CODIGO AND T3.SGP_CODIGO=T4.SGP_CODIGO AND T4.PRD_CODIGO=0)) '+

      //Verificar Quantidade com GRP
      ' AND (NOT EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
      ' AND T3.GRP_CODIGO=T4.GRP_CODIGO AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0) '+
      ' OR T1.IPV_QUANTIDADE>(SELECT MAX(T4.QNV_QUANTIDADE) '+
      ' FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
      ' AND T3.GRP_CODIGO=T4.GRP_CODIGO AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0)) '+

      //Verificar Quantidade com FOR
      ' AND (NOT EXISTS (SELECT T4.QNV_CODIGO FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T3.FOR_CODIGO=T4.FOR_CODIGO AND T4.GRP_CODIGO=0 '+
      ' AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0) '+
      ' OR T1.IPV_QUANTIDADE>(SELECT MAX(T4.QNV_QUANTIDADE) '+
      ' FROM PRODUTO T3, QUANTIDADE_NORMAL_VENDA T4 '+
      ' WHERE T1.PRD_CODIGO=T3.PRD_CODIGO AND T3.FOR_CODIGO=T4.FOR_CODIGO '+
      ' AND T4.GRP_CODIGO=0 AND T4.SGP_CODIGO=0 AND T4.PRD_CODIGO=0)) ';

  if ckbClassificacao.Checked then
    if dblClassificacao.Text = '' then
    Begin
      sClassificacao := ' AND C1.CLI_CLASSIFICACAO=0 ';
      sFiltros := sFiltros + '(Claf=0)';
    end
    else
    Begin
      sClassificacao := ' AND C1.CLI_CLASSIFICACAO='+IntToStr(dblClassificacao.KeyValue)+' ';
      sFiltros := sFiltros + '(Claf='+dblClassificacao.Text+')';
    end;

  if ckbTipo.Checked then
    if dblTipo.Text = '' then
    Begin
      sTipo := ' AND C1.CLI_TIPO=0 ';
      sFiltros := sFiltros + '(Tipo=0)';
    end
    else
    Begin
      sTipo := ' AND C1.CLI_TIPO='+IntToStr(dblTipo.KeyValue)+' ';
      sFiltros := sFiltros + '(Tipo='+dblTipo.Text+')';
    end;

  if ckbValorTotal1.Checked then
  Begin
    if not VerificaFloatBranco(edtValorTotal1.Text) then
    Begin
      edtValorTotal1.SetFocus;
      Raise Exception.Create('Valor Total 1 do pedido inválido!');
    end
    else
      case cmbValorTotal1.ItemIndex of
        0: Begin
             Valor1:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO < '+VirgPonto(edtValorTotal1.Text)+') ';
             sFiltros := sFiltros + ' (Valor1:<'+edtValorTotal1.Text+')';
           end;
        1: Begin
             Valor1:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO = '+VirgPonto(edtValorTotal1.Text)+') ';
             sFiltros := sFiltros + ' (Valor1:='+edtValorTotal1.Text+')';
           end;
        2: Begin
             Valor1:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO > '+VirgPonto(edtValorTotal1.Text)+') ';
             sFiltros := sFiltros + ' (Valor1:>'+edtValorTotal1.Text+')';
           end;
        3: Begin
             Valor1:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO <='+VirgPonto(edtValorTotal1.Text)+') ';
             sFiltros := sFiltros + ' (Valor1:<='+edtValorTotal1.Text+')';
           end;
        4: Begin
             Valor1:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO >='+VirgPonto(edtValorTotal1.Text)+') ';
             sFiltros := sFiltros + ' (Valor1:>='+edtValorTotal1.Text+')';
           end;
      end;
  end;

  if ckbValorTotal2.Checked then
  Begin
    if not VerificaFloatBranco(edtValorTotal2.Text) then
    Begin
      edtValorTotal2.SetFocus;
      Raise Exception.Create('Valor Total 2 do pedido inválido!');
    end
    else
      case cmbValorTotal2.ItemIndex of
        0: Begin
             Valor2:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO < '+VirgPonto(edtValorTotal2.Text)+') ';
             sFiltros := sFiltros + ' (Valor2:<'+edtValorTotal2.Text+')';
           end;
        1: Begin
             Valor2:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO = '+VirgPonto(edtValorTotal2.Text)+') ';
             sFiltros := sFiltros + ' (Valor2:='+edtValorTotal2.Text+')';
           end;
        2: Begin
             Valor2:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO > '+VirgPonto(edtValorTotal2.Text)+') ';
             sFiltros := sFiltros + ' (Valor2:>'+edtValorTotal2.Text+')';
           end;
        3: Begin
             Valor2:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO <='+VirgPonto(edtValorTotal2.Text)+') ';
             sFiltros := sFiltros + ' (Valor2:<='+edtValorTotal2.Text+')';
           end;
        4: Begin
             Valor2:=' AND (T2.PDV_TOTAL+T2.PDV_ACRESCIMO >='+VirgPonto(edtValorTotal2.Text)+') ';
             sFiltros := sFiltros + ' (Valor2:>='+edtValorTotal2.Text+')';
           end;
      end;
  end;

  if ckbSomenteAdiplentes.Checked then //Adiplente
  Begin
    if rdgSemParcelas.Checked then //Sem nenhuma parcela em aberto
      Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
          ' WHERE TRC_SITUACAO IN (0,8)) '
    else if ckbDataOrigemAdiplente.Checked then //Data de Origem
      Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
          ' WHERE TRC_SITUACAO IN (0,8) AND (TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'" '+
          ' OR TRC_DTORIGINAL<"'+MesDia(DM.Configuracao1.Data)+'")) '
    else
      Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
          ' WHERE TRC_SITUACAO IN (0,8) AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") ';
  end
  else if ckbSomenteInadiplentes.Checked then //Inadiplente
  Begin
    if rdgQualquerParcela.Checked then // Inadiplente qualquer título
      if ckbDataOrigemInadiplente.Checked then //Data de Origem
        Devedor:=' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
            ' WHERE TRC_SITUACAO IN (0,8) AND CNC_CODIGO=T2.CNC_CLIENTE '+
            ' AND (TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'" '+
            ' OR TRC_DTORIGINAL<"'+MesDia(DM.Configuracao1.Data)+'")) '
      else
        Devedor:=' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER '+
            ' WHERE TRC_SITUACAO IN (0,8) AND CNC_CODIGO=T2.CNC_CLIENTE '+
            ' AND TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'") '
    else  //Inadiplente Pedido Inteiro
      if ckbDataOrigemInadiplente.Checked then //Data de Origem
        Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER T4 '+
            ' WHERE T4.TRC_SITUACAO IN (1,2) AND (T4.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'"'+
            ' OR T4.TRC_DTORIGINAL<"'+MesDia(DM.Configuracao1.Data)+'") '+
            ' AND T4.CNC_CODIGO=T2.CNC_CLIENTE AND T4.PDV_CODIGO=T2.PDV_CODIGO) '+
            ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER T6 '+
            ' WHERE T4.TRC_SITUACAO IN (0,8) '+
            ' AND T6.CNC_CODIGO=T2.CNC_CODIGO AND T6.PDV_CODIGO=T2.PDV_CODIGO) '
      else
        Devedor:=' AND T2.CLI_CODIGO NOT IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER T4 '+
            ' WHERE T4.TRC_SITUACAO IN (1,2) AND T4.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data)+'"'+
            ' AND T4.CNC_CODIGO=T2.CNC_CLIENTE AND T4.PDV_CODIGO=T2.PDV_CODIGO) '+
            ' AND T2.CLI_CODIGO IN (SELECT CLI_CODIGO FROM TITULO_A_RECEBER T6 '+
            ' WHERE T4.TRC_SITUACAO IN (0,8) '+
            ' AND T4.CNC_CODIGO=T2.CNC_CLIENTE AND T4.PDV_CODIGO=T2.PDV_CODIGO) ';
  end;

  if ckbExibirTotal.Checked then
  Begin
    if ckbComPacotes.Checked then
    Begin
      sFiltros := sFiltros + '(ComPacotes)';
      sComPacotes := ',((SELECT ISNULL(SUM(I1.IPC_QUANTIDADE*ROUND(I1.IPC_PRECO_DESCONTO,2)),0) '+
        ' FROM PACOTE_DE_VENDA P1, ITEM_DE_PACOTE_DE_VENDA I1 '+
        ' WHERE P1.PCT_SITUACAO=4 '+
        ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO '+
        ' AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
        CdCNC2+DataINIPCT+DataFIMPCT+CdNTF+CdFUN3+
        ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
        ' AND P1.PDV_CODIGO=I1.PDV_CODIGO)+ '+ //AS TOTALPCT ,
        '(SELECT ISNULL(SUM(ROUND(PCR_VALOR,2)),0) '+
        ' FROM PACOTE_DE_CREDITO P1 '+
        ' WHERE P1.PCR_SITUACAO=0 '+
        ' AND P1.CNC_CLIENTE=C1.CNC_CODIGO '+
        ' AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
        CdCNC2+DataINIPCR+DataFIMPCR+CdNTF+CdFUN3+')+'; //AS TOTALPCR
    end
    else
      sComPacotes := ',(';
    if sVendasConvenio <> '' then
      sComPacotes := '';
    sExibirTota := sComPacotes+'(SELECT ISNULL(SUM((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2)),0) '+
        ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
        ' WHERE P1.CNC_CLIENTE=C1.CNC_CODIGO '+
        ' AND P1.CLI_CODIGO=C1.CLI_CODIGO '+
        ' AND P1.PDV_SITUACAO=4 '+
        ' AND (P1.PDV_TIPO_VENDA<>2 AND P1.PDV_TIPO_VENDA<>3) '+
        DataINI+DataFIM+CdNTF+CdFUN2+sVendasConvenio2+
        ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
        ' AND P1.PDV_CODIGO=I1.PDV_CODIGO)) AS TOTAL ';
  end;

  if ckbMaioresClientes.Checked then
  Begin
    if not VerificaInteiro(edtQuantidadeMaiores.Text) then
      Raise exception.Create('Quantidade de Maiores inválida!');
//    if ckbComPacotes.Checked then
//      sOrdem := ' (TOTAL+TOTALPCR) DESC,'
//    else
      sOrdem := ' TOTAL DESC,';
  end;

  if ckbAgruparCentro.Checked then
    sOrdem := sOrdem + ' C1.CNC_CODIGO,';
  if ckbAgruparVendedor.Checked then
    sOrdem := sOrdem + ' C1.CLI_CONJUGE,C1.CLI_RZ_SOCIAL '
  else
    sOrdem := sOrdem + ' C1.CLI_RZ_SOCIAL ';

  Dt_ini := mskDataINI.Text;
  Dt_fim := mskDataFIM.Text;
  if (tag = 0) then
  Begin
    if ckbMalaDireta.Checked then
    Begin
      with MalaDireta1 do
      Begin
        Close;
        SQL.Text:='SELECT DISTINCT C1.* '+sExibirTota+
          ' FROM CLIENTE C1,Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
          ' WHERE (T2.CLI_CODIGO<>0) '+
          ' AND (T2.PDV_TIPO_VENDA<>2 AND T2.PDV_TIPO_VENDA<>3) '+
          DataINI+DataFIM+CdFOR+CdGRP+CdSGP+Devedor+
          CdCNC+SIT+CdCLI+sTipoPessoa+CdPRD+CdFUN+CdPDV+CdTPG+CdFPG+CdAGF+CdNTF+sVendasConvenio+
          Valor1+Valor2+AcimaNormal+sUltimaCompra+sFPGCliente+sBloquados+sClassificacao+sTipo+
          ' AND (T2.CNC_CODIGO=T1.CNC_CODIGO) '+
          ' AND (T1.PDV_CODIGO=T2.PDV_CODIGO) '+
          ' AND (C1.CLI_CODIGO=T2.CLI_CODIGO) '+
          ' AND (C1.CNC_CODIGO=T2.CNC_CLIENTE) '+
          ' ORDER BY '+sOrdem;
        Open;
        if IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        ShowMessage('Gerado '+IntToStr(GerarMalaDireta)+' registros!');
      end;
    end
    else
    Begin
      Application.CreateForm(Trpt_CadastroExtratificado, rpt_CadastroExtratificado);
      with rpt_CadastroExtratificado do
      Begin
        tag := 0;
        try
          if VerificaInteiroBranco(edtQuantidadeMaiores.Text) then
            vQtdMaiores := StrToInt(edtQuantidadeMaiores.Text)
          else
            vQtdMaiores := 0;
        except
          vQtdMaiores := 0;
        end;

        if rdgDataCadastro1.Checked then
          zrlFiltros.Caption := '(Cad)'+sFiltros
        else if rdgDataAlterado.Checked then
          zrlFiltros.Caption := '(Alt)'+sFiltros
        else if rdgDataEmissao.Checked then
          zrlFiltros.Caption := '(Emi)'+sFiltros
        else if rdgDataDevolucao.Checked then
          zrlFiltros.Caption := '(Dev)'+sFiltros
        else if rdgDataEntrega.Checked then
          zrlFiltros.Caption := '(Ent)'+sFiltros;

        if ckbSintetico.Checked then
        Begin
          zrbCabecalho.Height := 4;
          zrbDetalhe.Height := 1;
        end;

        if ckbAgruparCentro.Checked then
          zrgCodigoCNC.Expression := 'CNC_CODIGO'
        else
        Begin
          zrgCodigoCNC.Height := 0;
          zrgCodigoCNC.Expression := ''
        end;

        if ckbAgruparVendedor.Checked then
          zrgCodigoFUN.Expression := 'FUN_CODIGO'
        else
        Begin
          zrgCodigoFUN.Height := 0;
          zrgCodigoFUN.Expression := '';
        end;

        if ckbQuantidadeAcima.Checked then
          zrlFiltros.Caption := zrlFiltros.Caption+'(Quantidade Acima do Normal - Vendas Especiais) ';

        try
          ExecutaSQL(DM.QR_Comandos, 'CREATE INDEX PCRCNCCLIDTCAD ON PACOTE_DE_CREDITO (CNC_CLIENTE,CLI_CODIGO,PCR_DT_CADASTRO)');
        except
        end;
        try
          ExecutaSQL(DM.QR_Comandos, 'CREATE INDEX PCTCNCCLIDTCAD ON PACOTE_DE_VENDA (CNC_CLIENTE,CLI_CODIGO,PCT_DT_CADASTRO)');
        except
        end;

        Entidade.Close;
        Entidade.SQL.Text:='SELECT DISTINCT C1.* '+sExibirTota+
          ' FROM CLIENTE C1 '+
          ' WHERE (C1.CLI_CODIGO<>0) '+
          sUltimaCompra+sFPGCliente+sClassificacao+sTipo+sTipoPessoa+
          ' AND ( EXISTS(SELECT TOP 1 CLI_CODIGO FROM PEDIDO_DE_VENDA T2, ITEM_DE_PEDIDO_DE_VENDA T1 '+
          '       WHERE  T2.PDV_TIPO_VENDA<>2 AND T2.PDV_TIPO_VENDA<>3 '+
                  DataINI+DataFIM+CdFOR+CdGRP+CdSGP+Devedor+
                  CdCNC+SIT+CdCLI+CdPRD+CdPDV+CdFUN+CdTPG+CdFPG+CdAGF+CdNTF+
                  Valor1+Valor2+AcimaNormal+sVendasConvenio+
          '       AND C1.CLI_CODIGO=T2.CLI_CODIGO '+
          '       AND C1.CNC_CODIGO=T2.CNC_CLIENTE '+
          '       AND T2.CNC_CODIGO=T1.CNC_CODIGO '+
          '       AND T2.PDV_CODIGO=T1.PDV_CODIGO) '+

          '       OR (EXISTS (SELECT TOP 1 CLI_CODIGO FROM PACOTE_DE_CREDITO T1 '+
          '       WHERE PCR_SITUACAO=0 '+ //Pacote Ativo
                  CdCNC+DataINIPCR+DataFIMPCR+CdFUN+CdCLI1+
          '       AND C1.CNC_CODIGO=T1.CNC_CLIENTE  AND C1.CLI_CODIGO=T1.CLI_CODIGO)) '+

          '       OR (EXISTS (SELECT TOP 1 CLI_CODIGO FROM PACOTE_DE_VENDA T1 '+
          '       WHERE PCT_SITUACAO=4  '+ //Pacote Finalizado
                  CdCNC+DataINIPCT+DataFIMPCT+CdFUN+CdCLI1+
          '       AND C1.CNC_CODIGO=T1.CNC_CLIENTE  AND C1.CLI_CODIGO=T1.CLI_CODIGO)) '+
          '     ) '+
          ' ORDER BY '+sOrdem;
        Entidade.Open;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        SZRLabel5.Caption := mskDataINI.Text;
        SZRLabel7.Caption := mskDataFIM.Text;
        report.preview;
        Close;
      end;
    end;
  end;
end;

procedure TfMxSExtratoExtratificado.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=41;
    fCadCli.CentroCusto2.open;
    if DM.Configuracao1.Empresa = empLBM then
      fCadCli.CentroCusto2.LocalizarCod(0)
    else
      fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
    fCadCli.dblCentroDeCusto.KeyValue:=fCadCli.CentroCusto2.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure TfMxSExtratoExtratificado.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      begin
        Tag:=59;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      begin
        Tag:=59;
        ShowModal;
      end;
    end;
  End;
end;

procedure TfMxSExtratoExtratificado.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSExtratoExtratificado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Vendedor1.Active := False;
  CentroCusto1.Active := False;
  Action := cafree;
end;

procedure TfMxSExtratoExtratificado.ckbCodigoPDVClick(Sender: TObject);
begin
  if ckbCodigoPDV.Checked then
  Begin
    edtCodigoPDV.Color:=clWindow;
    edtCodigoPDV.Enabled:=True;
    edtCodigoPDV.SetFocus;
  end
  else
  Begin
    edtCodigoPDV.Color:=AlteraCorComponentes;
    edtCodigoPDV.Text:='';
    edtCodigoPDV.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbTipoPagamentoClick(Sender: TObject);
begin
  if ckbTipoPagamento.Checked then
  Begin
    Parametro1.Open;
    dblTipoPagamento.Color:=clWindow;
    dblTipoPagamento.Enabled:=True;
    dblTipoPagamento.KeyValue:=Parametro1.CodigoPAR;
    dblTipoPagamento.SetFocus;
  end
  else
  Begin
    Parametro1.Close;
    dblTipoPagamento.Color:=AlteraCorComponentes;
    dblTipoPagamento.KeyValue:=-1;
    dblTipoPagamento.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbCodigoFPGClick(Sender: TObject);
begin
  if ckbCodigoFPG.Checked then
  Begin
    Forma_de_Pagamento1.Open;
    dblCodigoFPG.Color:=clWindow;
    dblCodigoFPG.Enabled:=True;
    dblCodigoFPG.KeyValue:=Forma_de_Pagamento1.CodigoFPG;
    dblCodigoFPG.SetFocus;
  end
  else
  Begin
    Forma_de_Pagamento1.Close;
    dblCodigoFPG.Color:=AlteraCorComponentes;
    dblCodigoFPG.KeyValue:=-1;
    dblCodigoFPG.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbCodigoAGFClick(Sender: TObject);
begin
  if ckbCodigoAGF.Checked then
  Begin
    AgenteFin1.Open;
    cmbAgenteFinanceiro.Enabled := True;
    cmbAgenteFinanceiro.ItemIndex := 0;
    cmbAgenteFinanceiro.Color := clWindow;
    dblCodigoAGF.Color:=clWindow;
    dblCodigoAGF.Enabled:=True;
    dblCodigoAGF.KeyValue:=AgenteFin1.CodigoAGF;
    dblCodigoAGF.SetFocus;
  end
  else
  Begin
    AgenteFin1.Close;
    cmbAgenteFinanceiro.Enabled := False;
    cmbAgenteFinanceiro.ItemIndex := -1;
    cmbAgenteFinanceiro.Color := AlteraCorComponentes;
    dblCodigoAGF.Color:=AlteraCorComponentes;
    dblCodigoAGF.KeyValue:=-1;
    dblCodigoAGF.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbCodigoCNCClick(Sender: TObject);
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
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbSituacao.Color:=clWindow;
    cmbSituacao.Enabled:=True;
    cmbSituacao.ItemIndex:=1;
    cmbSituacao.SetFocus;
  end
  else
  Begin
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
    cmbSituacao.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbNumeroNotaClick(Sender: TObject);
begin
  if ckbNumeroNota.Checked then
  Begin
    ckbVendasPorFaturar.Checked := False;
    edtNumeroNota.Color:=clWindow;
    edtNumeroNota.Enabled:=True;
    edtNumeroNota.SetFocus;
  end
  else
  Begin
    edtNumeroNota.Color:=AlteraCorComponentes;
    edtNumeroNota.Text:='';
    edtNumeroNota.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbValorTotal1Click(Sender: TObject);
begin
  if ckbValorTotal1.Checked then
  Begin
    cmbValorTotal1.Color:=clWindow;
    cmbValorTotal1.Enabled:=True;
    cmbValorTotal1.ItemIndex:=4;
    edtValorTotal1.Color:=clWindow;
    edtValorTotal1.Enabled:=True;
    edtValorTotal1.SetFocus;
  end
  else
  Begin
    cmbValorTotal1.Color:=AlteraCorComponentes;
    cmbValorTotal1.Enabled:=False;
    cmbValorTotal1.ItemIndex:=-1;
    edtValorTotal1.Color:=AlteraCorComponentes;
    edtValorTotal1.Text:='';
    edtValorTotal1.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbVendasPorFaturarClick(Sender: TObject);
begin
  if ckbVendasPorFaturar.Checked then
  Begin
    ckbNumeroNota.Checked := False;
    ckbVendasFaturadas.Checked := False;
    ckbLJ3.Checked := False;
    ckbLJ4.Checked := False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbVendasFaturadasClick(Sender: TObject);
begin
  if ckbVendasFaturadas.Checked then
  Begin
    ckbVendasPorFaturar.Checked := False;
    ckbLJ3.Checked := True;
    ckbLJ4.Checked := True;    
  end;
end;

procedure TfMxSExtratoExtratificado.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.Color:=clWindow;
    edtCodigoFOR.Enabled:=True;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.Color:=AlteraCorComponentes;
    edtCodigoFOR.Text:='';
    edtCodigoFOR.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.tag:=35;
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxSExtratoExtratificado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=chr(27) then
    Close;
end;

procedure TfMxSExtratoExtratificado.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    Grupo1.Open;
    dblCodigoGRP.Enabled:=True;
    dblCodigoGRP.Color:=clWindow;
    dblCodigoGRP.KeyValue:=Grupo1.CodigoGRP;
    ckbCodigoSGP.Enabled:=True;
    dblCodigoGRP.SetFocus;
  end
  else
  Begin
    Grupo1.Close;
    dblCodigoGRP.Enabled:=False;
    dblCodigoGRP.Color:=AlteraCorComponentes;
    ckbCodigoSGP.Enabled:=False;
    dblCodigoGRP.KeyValue := 0;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    SubGrupo1.Open;
    dblCodigoSGP.Enabled:=True;
    dblCodigoSGP.color:=clWindow;
    dblCodigoSGP.KeyValue:=SubGrupo1.CodigoSGP;
  end
  else
  Begin
    SubGrupo1.Close;
    dblCodigoSGP.Enabled:=False;
    dblCodigoSGP.color:=AlteraCorComponentes;
    dblCodigoSGP.KeyValue:=0;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbSomenteAdiplentesClick(Sender: TObject);
begin
  if ckbSomenteAdiplentes.Checked then
  Begin
    ckbSomenteInadiplentes.Checked := False;
    ckbDataOrigemAdiplente.Enabled := True;
    rdgSemParcelas.Enabled := True;
    rdgTodasParcelas.Enabled := True;
  end
  else
  Begin
    ckbDataOrigemAdiplente.Enabled := False;
    ckbDataOrigemAdiplente.Checked := False;
    rdgSemParcelas.Enabled := False;
    rdgTodasParcelas.Enabled := False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbSomenteInadiplentesClick(Sender: TObject);
begin
  if ckbSomenteInadiplentes.Checked then
  Begin
    ckbSomenteAdiplentes.Checked := False;
    ckbDataOrigemInadiplente.Enabled := True;
    rdgPedidoInteiro.Enabled := True;
    rdgQualquerParcela.Enabled := True;
  end
  else
  Begin
    ckbDataOrigemInadiplente.Enabled := False;
    ckbDataOrigemInadiplente.Checked := False;
    rdgPedidoInteiro.Enabled := False;
    rdgQualquerParcela.Enabled := False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbLJ3Click(Sender: TObject);
begin
  if ckbLJ3.Checked then
    ckbVendasPorFaturar.Checked := False;
end;

procedure TfMxSExtratoExtratificado.ckbValorTotal2Click(Sender: TObject);
begin
  if ckbValorTotal2.Checked then
  Begin
    cmbValorTotal2.Color:=clWindow;
    cmbValorTotal2.Enabled:=True;
    cmbValorTotal2.ItemIndex:=3;
    edtValorTotal2.Color:=clWindow;
    edtValorTotal2.Enabled:=True;
    edtValorTotal2.SetFocus;
  end
  else
  Begin
    cmbValorTotal2.Color:=AlteraCorComponentes;
    cmbValorTotal2.Enabled:=False;
    cmbValorTotal2.ItemIndex:=-1;
    edtValorTotal2.Color:=AlteraCorComponentes;
    edtValorTotal2.Text:='';
    edtValorTotal2.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbUltimaCompraClick(Sender: TObject);
begin
  if ckbUltimaCompra.Checked then
  Begin
    cmbUltimaCompra.Enabled := True;
    cmbUltimaCompra.ItemIndex := 2;
    cmbUltimaCompra.Color := clWindow;
    mskUltimaCompra.Color:=clWindow;
    mskUltimaCompra.Enabled:=True;
    mskUltimaCompra.Text := DateToStr(DM.Configuracao1.Data);
    mskUltimaCompra.SetFocus;
  end
  else
  Begin
    cmbUltimaCompra.Enabled := False;
    cmbUltimaCompra.ItemIndex := -1;
    cmbUltimaCompra.Color := AlteraCorComponentes;
    mskUltimaCompra.Color:=AlteraCorComponentes;
    mskUltimaCompra.Clear;
    mskUltimaCompra.Enabled:=False;
  end;
end;

function TfMxSExtratoExtratificado.GerarMalaDireta:integer;
var
  F: TextFile;
  Linha:String;
  Cont:integer;
begin
  Cont := 0;
  AssignFile(F, 'C:\CadastroExtratificado.txt');
  Rewrite(F);
  if ckbExibirTotal.Checked then
    Writeln(F, 'Codigo;RazaoSocial;Fone;Fax;Celular;Contato1;Contato2;Endereco;Bairro;Cidade;UF;CEP;EMail;Sit;Obs;Total')
  else
    Writeln(F, 'Codigo;RazaoSocial;Fone;Fax;Celular;Contato1;Contato2;Endereco;Bairro;Cidade;UF;CEP;EMail;Sit;Obs');
  with MalaDireta1 do
  begin
    first;
    while not eof do
    begin
      if ckbExibirTotal.Checked then
        Linha:='"'+PreencheE(FieldByName('CLI_CODIGO').asString, '0', 6)+'";"'+
          FieldByName('CLI_RZ_SOCIAL').asString+'";"'+
          FieldByName('CLI_FONE').asString+'";"'+
          FieldByName('CLI_FAX').asString+'";"'+
          FieldByName('CLI_CELULAR').asString+'";"'+
          FieldByName('CLI_PAI').asString+'";"'+
          FieldByName('CLI_MAE').asString+'";"'+
          FieldByName('CLI_ENDERECO').asString+'";"'+
          FieldByName('CLI_BAIRRO').asString+'";"'+
          FieldByName('CLI_CIDADE').asString+'";"'+
          FieldByName('CLI_UF').asString+'";"'+
          FieldByName('CLI_CEP').asString+'";"'+
          FieldByName('CLI_EMAIL').asString+'";"'+
          FieldByName('CLI_SITUACAO').asString+'";"'+
          FieldByName('CLI_OBS1').asString+'";"'+
          FieldByName('TOTAL').asString+'"'
      else
        Linha:='"'+PreencheE(FieldByName('CLI_CODIGO').asString, '0', 6)+'";"'+
          FieldByName('CLI_RZ_SOCIAL').asString+'";"'+
          FieldByName('CLI_FONE').asString+'";"'+
          FieldByName('CLI_FAX').asString+'";"'+
          FieldByName('CLI_CELULAR').asString+'";"'+
          FieldByName('CLI_PAI').asString+'";"'+
          FieldByName('CLI_MAE').asString+'";"'+
          FieldByName('CLI_ENDERECO').asString+'";"'+
          FieldByName('CLI_BAIRRO').asString+'";"'+
          FieldByName('CLI_CIDADE').asString+'";"'+
          FieldByName('CLI_UF').asString+'";"'+
          FieldByName('CLI_CEP').asString+'";"'+
          FieldByName('CLI_EMAIL').asString+'";"'+
          FieldByName('CLI_SITUACAO').asString+'";"'+
          FieldByName('CLI_OBS1').asString+'"';
      Writeln(F, linha);
      inc(Cont);
      next;
    end;
  end;
  CloseFile(F);
  Result := Cont;
end;

procedure TfMxSExtratoExtratificado.ckbMaioresClientesClick(
  Sender: TObject);
begin
  if ckbMaioresClientes.Checked then
  Begin
    edtQuantidadeMaiores.Color:=clWindow;
    edtQuantidadeMaiores.Enabled:=True;
    edtQuantidadeMaiores.SetFocus;
    edtQuantidadeMaiores.Text := '10';
    ckbExibirTotal.Checked := True;
    ckbExibirTotal.Enabled := False;
    ckbAgruparCentro.Checked := False;
    ckbAgruparCentro.Enabled := False;
    ckbAgruparVendedor.Checked := False;
    ckbAgruparVendedor.Enabled := False;
  end
  else
  Begin
    edtQuantidadeMaiores.Color:=AlteraCorComponentes;
    edtQuantidadeMaiores.Clear;
    edtQuantidadeMaiores.Enabled:=False;
    ckbExibirTotal.Enabled := True;
    ckbAgruparCentro.Enabled := True;
    if not (DM.Configuracao1.Empresa in [empEletro,empPetromax]) then
      ckbAgruparVendedor.Enabled := True;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbExibirTotalClick(Sender: TObject);
begin
  if ckbExibirTotal.Checked and
     ckbExibirTotal.Enabled then
    ckbComPacotes.Enabled := True
  else
  Begin
    ckbComPacotes.Enabled := False;
    if ckbMaioresClientes.Checked then
      ckbComPacotes.Checked := True    
    else
      ckbComPacotes.Checked := False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbComPacotesClick(Sender: TObject);
begin
  if ckbComPacotes.Checked then
  Begin
    ckbVendasPorFaturar.Checked := False;
    ckbVendasPorFaturar.Enabled := False;
    ckbVendasFaturadas.Checked := False;
    ckbVendasFaturadas.Enabled := False;
    ckbLJ3.Checked := False;
    ckbLJ3.Enabled := False;
    ckbLJ4.Checked := False;
    ckbLJ4.Enabled := False;
    ckbSituacao.Checked := True;
    cmbSituacao.Enabled := False;
    ckbSituacao.Enabled := False;
  end
  else
  Begin
    ckbVendasPorFaturar.Enabled := True;
    ckbVendasFaturadas.Enabled := True;
    ckbLJ3.Enabled := True;
    ckbLJ4.Enabled := True;
    ckbSituacao.Enabled := True;
    cmbSituacao.Enabled := True;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbFormaPagClienteClick(
  Sender: TObject);
begin
  if ckbFormaPagCliente.Checked then
  Begin
    Forma_de_Pagamento2.Open;
    cmbFormaPagCliente.Enabled := True;
    cmbFormaPagCliente.ItemIndex := 0;
    cmbFormaPagCliente.Color := clWindow;
    dblFormaPagCliente.Color:=clWindow;
    dblFormaPagCliente.Enabled:=True;
    dblFormaPagCliente.KeyValue:=Forma_de_Pagamento2.CodigoFPG;
    dblFormaPagCliente.SetFocus;
  end
  else
  Begin
    Forma_de_Pagamento2.Close;
    cmbFormaPagCliente.Enabled := False;
    cmbFormaPagCliente.ItemIndex := -1;
    cmbFormaPagCliente.Color := AlteraCorComponentes;
    dblFormaPagCliente.Color:=AlteraCorComponentes;
    dblFormaPagCliente.KeyValue:=-1;
    dblFormaPagCliente.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbSomenteBloqueadosClick(
  Sender: TObject);
begin
  if ckbSomenteBloqueados.Checked then
    ckbSomenteNaoBloqueados.Checked := False;
end;

procedure TfMxSExtratoExtratificado.ckbSomenteNaoBloqueadosClick(
  Sender: TObject);
begin
  if ckbSomenteNaoBloqueados.Checked then
    ckbSomenteBloqueados.Checked := False;
end;

procedure TfMxSExtratoExtratificado.ckbClassificacaoClick(Sender: TObject);
begin
  if ckbClassificacao.Checked then
  Begin
    Parametro2.Close;
    Parametro2.SQL.Text := 'SELECT * FROM PARAMETRO '+
      ' WHERE TPR_CODIGO=60 '+
      ' AND PAR_SITUACAO<>1 ';
    if DM.Configuracao1.Empresa = empLuciano then
      Parametro2.SQL.ADD(' AND (PAR_INFORMACAO=0 OR PAR_INFORMACAO='+IntToStr(dblCodigoCNC.KeyValue)+')');
    Parametro2.SQL.ADD(' ORDER BY PAR_DESCRICAO ');
    Parametro2.Open;
    dblClassificacao.Color:=clWindow;
    dblClassificacao.Enabled:=True;
    dblClassificacao.KeyValue:=Parametro1.CodigoPAR;
    dblClassificacao.SetFocus;
  end
  else
  Begin
    Parametro2.Close;
    dblClassificacao.Color:=AlteraCorComponentes;
    dblClassificacao.KeyValue:=-1;
    dblClassificacao.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbTipoClick(Sender: TObject);
begin
  if ckbTipo.Checked then
  Begin
    Parametro3.Open;
    dblTipo.Color:=clWindow;
    dblTipo.Enabled:=True;
    dblTipo.KeyValue:=Parametro1.CodigoPAR;
    dblTipo.SetFocus;
  end
  else
  Begin
    Parametro3.Close;
    dblTipo.Color:=AlteraCorComponentes;
    dblTipo.KeyValue:=-1;
    dblTipo.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbConvenioClick(Sender: TObject);
begin
  if ckbConvenio.Checked then
  Begin
    edtConvenio.Color:=clWindow;
    edtConvenio.Enabled:=True;
    edtConvenio.SetFocus;
  end
  else
  Begin
    edtConvenio.Color:=AlteraCorComponentes;
    edtConvenio.Clear;
    edtConvenio.Enabled:=False;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbTipoPessoaClick(Sender: TObject);
begin
  if ckbTipoPessoa.Checked then
  Begin
    cmbTipoPessoa.Enabled:=True;
    cmbTipoPessoa.Color:=clWindow;
    cmbTipoPessoa.ItemIndex:=0;
    cmbTipoPessoa.SetFocus;
  end
  else
  Begin
    cmbTipoPessoa.Enabled:=False;
    cmbTipoPessoa.Color:=AlteraCorComponentes;
    cmbTipoPessoa.ItemIndex:=-1;
  end;
end;

procedure TfMxSExtratoExtratificado.ckbLJ4Click(Sender: TObject);
begin
  if ckbLJ4.Checked then
    ckbVendasPorFaturar.Checked := False;
end;

end.




