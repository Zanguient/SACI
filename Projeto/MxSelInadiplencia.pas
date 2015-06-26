unit MxSelInadiplencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, DB, DBTables, SQuery,
  CentroCusto, Parametro, Forma_de_Pagamento, AgenteFin, Funcionario,
  Vendedor, Cliente;

type
  TfMxSelInadiplencia = class(TForm)
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    DSCentroCusto1: TDataSource;
    CentroCusto1: TCentroCusto;
    Panel3: TPanel;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    ckbSintetico: TCheckBox;
    ckbEspacoExtra: TCheckBox;
    rdgVisualizar: TRadioGroup;
    ComboOrdem: TComboBox;
    Label3: TLabel;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    ckbTipoPagamento: TCheckBox;
    dblTipoPagamento: TDBLookupComboBox;
    cmbTipoPag: TComboBox;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    DSForma_de_Pagamento1: TDataSource;
    ckbCodigoFPG: TCheckBox;
    dblCodigoFPG: TDBLookupComboBox;
    cmbCodigoFPG: TComboBox;
    ckbDiasAtraso: TCheckBox;
    cmbDiasAtraso: TComboBox;
    edtDiasAtraso: TEdit;
    DSAgenteFin1: TDataSource;
    AgenteFin1: TAgenteFin;
    ckbCodigoAGF: TCheckBox;
    dblCodigoAGF: TDBLookupComboBox;
    cmbAgenteFinanceiro: TComboBox;
    Funcionario1: TFuncionario;
    DSFuncionario1: TDataSource;
    dblCobrador: TDBLookupComboBox;
    ckbCobrador: TCheckBox;
    ckbCodigoTRC: TCheckBox;
    edtCodigoTRC: TEdit;
    ckbSuperSintetico: TCheckBox;
    ckbCodigoPDV: TCheckBox;
    edtCodigoPDV: TEdit;
    ckbSomenteExcluidos: TCheckBox;
    ckbNaoExibirExcluidos: TCheckBox;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    ckbCodigoVEN: TCheckBox;
    dblCodigoVEN: TDBLookupComboBox;
    ckbCodigoCLI: TCheckBox;
    edtCodigoCLI: TEdit;
    ckbAgruparVendedor: TCheckBox;
    cbkSaltarPagina: TCheckBox;
    ckbClassificacao: TCheckBox;
    dblClassificacao: TDBLookupComboBox;
    Parametro4: TParametro;
    DSParametro4: TDataSource;
    ckbMalaDireta: TCheckBox;
    edtArquivoMalaDireta: TEdit;
    Etiquetas1: TCliente;
    Parametro2: TParametro;
    CheckBox3: TCheckBox;
    dblTipo: TDBLookupComboBox;
    DSParametro5: TDataSource;
    Parametro5: TParametro;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure ckbSinteticoClick(Sender: TObject);
    procedure ckbEspacoExtraClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbTipoPagamentoClick(Sender: TObject);
    procedure ckbCodigoFPGClick(Sender: TObject);
    procedure ckbCodigoAGFClick(Sender: TObject);
    procedure ckbDiasAtrasoClick(Sender: TObject);
    procedure ckbCobradorClick(Sender: TObject);
    procedure ckbCodigoTRCClick(Sender: TObject);
    procedure ckbCodigoPDVClick(Sender: TObject);
    procedure ckbSuperSinteticoClick(Sender: TObject);
    procedure ckbCodigoVENClick(Sender: TObject);
    procedure ckbCodigoCLIClick(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure ckbAgruparVendedorClick(Sender: TObject);
    procedure ckbClassificacaoClick(Sender: TObject);
    procedure ckbMalaDiretaClick(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    EnderecoCompleto: string;

  end;

var
  fMxSelInadiplencia: TfMxSelInadiplencia;

implementation

uses Urpt_Inadiplencia, UDM, Urpt_InadiplenciaCliente, funcoes,
  UTituloAbertos, Urpt_InadiplenciaEspecial, CdCliente;

{$R *.DFM}

procedure TfMxSelInadiplencia.SB_ConfirmarClick(Sender: TObject);
var
  CdCNC, CdTRC, CdPDV, CdCLI, CdTipoPag, CdFPG, CdAGF, sDias, CdCobrador,
    sExibirFuncionario, Ordem, sFiltros, sClassificacao, CLI_TIPO: string;
begin
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRCCNCTROVENVAL ON TITULO_A_RECEBER (CNC_CODIGO, TRC_SITUACAO, TRC_TRCORIGINAL, TRC_VENCIMENTO, TRC_VALOR, TRC_VALOR_PAGO)');
  Except
  end;
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX TRCCNCTRCVEN ON TITULO_A_RECEBER (CNC_CODIGO, TRC_CODIGO, TRC_SITUACAO, TRC_VENCIMENTO)');
  Except
  end;

  CLI_TIPO := '';
  sClassificacao := '';
  CdTRC := '';
  CdCNC := '';
  CdPDV := '';
  CdCLI := '';
  CdTipoPag := '';
  CdFPG := '';
  CdAGF := '';
  sDias := '';
  CdCobrador := '';
  sExibirFuncionario := '';
  sFiltros := '';


  //TIPO
  if CheckBox3.Checked then
    CLI_TIPO := ' AND T2.CLI_TIPO = ''' +inttostr(dblTipo.Keyvalue) +''' '
  else
    CLI_TIPO := '';
  //

  if not VerificaDataBranco(mskDataINI.Text) then
    mskDataINI.Text := '01/01/1950';

  sFiltros := sFiltros + '(DtINI:'+mskDataINI.Text+')';

  if not VerificaDataBranco(mskDataFIM.Text) then
    mskDataFIM.Text := '31/12/2100';

  sFiltros := sFiltros + '(DtFIM:'+mskDataFIM.Text+')';

  if ckbCodigoTRC.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoTRC.Text) then
      raise Exception.Create('Código do Título inválido!');
    CdTRC:=' AND T1.TRC_CODIGO='+edtCodigoTRC.Text;
    sFiltros := sFiltros + ' (TRC:='+edtCodigoTRC.Text+') ';
  end;

  if ckbCodigoPDV.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
      raise Exception.Create('Código do Pedido inválido!');
    CdPDV:=' AND T1.PDV_CODIGO='+edtCodigoPDV.Text;
    sFiltros := sFiltros + ' (PDV:='+edtCodigoPDV.Text+') ';
  end;

  if ckbCodigoCLI.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
      raise Exception.Create('Código do Cliente inválido!');
    CdCLI:=' AND T1.CLI_CODIGO='+edtCodigoCLI.Text;
    sFiltros := sFiltros + ' (CLI:='+edtCodigoCLI.Text+') ';
  end;

  if ckbCodigoVEN.Checked then
  Begin
    if dblCodigoVEN.Text = '' then
      raise Exception.Create('Vendedor inválido!');
    sFiltros := sFiltros + ' (FUN:='+dblCodigoVEN.Text+') ';
  end;

  if ckbCodigoCNC.Checked then
  Begin
    if dblCodigoCNC.Text = '' then
    Begin
      dblCodigoCNC.SetFocus;
      raise Exception.Create('Centro de Custo inválido!');
    end
    else
      CdCNC:=' AND (T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
    sFiltros := sFiltros + ' (CNC:='+IntToStr(dblCodigoCNC.KeyValue)+') ';
  end;

  if ckbTipoPagamento.Checked then
  Begin
    if dblTipoPagamento.Text = '' then
    Begin
      dblTipoPagamento.SetFocus;
      raise Exception.Create('Tipo de Pagamento inválido!');
    end;
    if cmbTipoPag.ItemIndex = 0 then
    Begin
      CdTipoPag:=' AND (T1.TRC_TIPO_PAG='+IntToStr(dblTipoPagamento.KeyValue)+') ';
      sFiltros := sFiltros + '(TipoPag:='+dblTipoPagamento.Text+')';
    end
    else
    Begin
      CdTipoPag:=' AND (T1.TRC_TIPO_PAG<>'+IntToStr(dblTipoPagamento.KeyValue)+') ';
      sFiltros := sFiltros + '(TipoPag:<>'+dblTipoPagamento.Text+')';
    end;
  end;

  if ckbCodigoFPG.Checked then
  Begin
    if dblCodigoFPG.Text = '' then
    Begin
      dblCodigoFPG.SetFocus;
      raise Exception.Create('Forma de Pagamento inválido!');
    end
    else
    Begin
      if cmbCodigoFPG.ItemIndex = 0 then
      Begin
        CdFPG:=' AND EXISTS (SELECT TOP 1 PDV_CODIGO '+
             ' FROM PEDIDO_DE_VENDA '+
             ' WHERE FPG_CODIGO='+IntToStr(dblCodigoFPG.KeyValue)+
             ' AND CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND PDV_CODIGO=T1.PDV_CODIGO) ';
        sFiltros := sFiltros + '(FPG:='+dblCodigoFPG.Text+')';
      end
      else
      Begin
        CdFPG:=' AND EXISTS (SELECT TOP 1 PDV_CODIGO '+
             ' FROM PEDIDO_DE_VENDA '+
             ' WHERE FPG_CODIGO<>'+IntToStr(dblCodigoFPG.KeyValue)+
             ' AND CNC_CODIGO=T1.CNC_CODIGO '+
             ' AND PDV_CODIGO=T1.PDV_CODIGO) ';
        sFiltros := sFiltros + '(FPG:<>'+dblCodigoFPG.Text+')';
      end;
    end;
  end;

  if ckbCodigoAGF.Checked then
  Begin
    if dblCodigoAGF.Text = '' then
    Begin
      dblCodigoAGF.SetFocus;
      raise Exception.Create('Agente Financeiro inválido!');
    end
    else
    Begin
      if cmbAgenteFinanceiro.ItemIndex = 0 then
      Begin
        CdAGF:=' AND (T1.AGF_CODIGO='+IntToStr(dblCodigoAGF.KeyValue)+') ';
        sFiltros := sFiltros + '(AGF:='+dblCodigoAGF.Text+')';
      end
      else
      Begin
        CdAGF:=' AND (T1.AGF_CODIGO<>'+IntToStr(dblCodigoAGF.KeyValue)+') ';
        sFiltros := sFiltros + '(AGF:<>'+dblCodigoAGF.Text+')';
      end;
    end;
  end;

  if ckbDiasAtraso.Checked then
  Begin
    if not VerificaInteiroBranco(edtDiasAtraso.Text) then
    Begin
      edtDiasAtraso.SetFocus;
      Raise Exception.Create('Dias de Atraso inválido!');
    end
    else
    Begin
      sDias := ' AND T1.TRC_VENCIMENTO<="'+MesDia(DM.Configuracao1.Data)+'" ';
      case cmbDiasAtraso.ItemIndex of
        0: Begin
             sDias := sDias +
                      ' AND (("'+MesDia(DM.Configuracao1.Data)+'"-T1.TRC_VENCIMENTO) < '+VirgPonto(edtDiasAtraso.Text)+') ';
             sFiltros := sFiltros + ' (DiasAtras.<'+edtDiasAtraso.Text+')';
           end;
        1: Begin
             sDias := sDias +
                      ' AND (("'+MesDia(DM.Configuracao1.Data)+'"-T1.TRC_VENCIMENTO) = '+VirgPonto(edtDiasAtraso.Text)+') ';
             sFiltros := sFiltros + ' (DiasAtras.='+edtDiasAtraso.Text+')';
           end;
        2: Begin
             sDias := sDias +
                      ' AND (("'+MesDia(DM.Configuracao1.Data)+'"-T1.TRC_VENCIMENTO) > '+VirgPonto(edtDiasAtraso.Text)+') ';
             sFiltros := sFiltros + ' (DiasAtras.>'+edtDiasAtraso.Text+')';
           end;
        3: Begin
             sDias := sDias +
                      ' AND (("'+MesDia(DM.Configuracao1.Data)+'"-T1.TRC_VENCIMENTO) <= '+VirgPonto(edtDiasAtraso.Text)+') ';
             sFiltros := sFiltros + ' (DiasAtras.<='+edtDiasAtraso.Text+')';
           end;
        4: Begin
             sDias := sDias +
                      ' AND (("'+MesDia(DM.Configuracao1.Data)+'"-T1.TRC_VENCIMENTO) >= '+VirgPonto(edtDiasAtraso.Text)+') ';
             sFiltros := sFiltros + ' (DiasAtras.>='+edtDiasAtraso.Text+')';
           end;
      end;
    end;
  end;

  if ckbCobrador.Checked then
  Begin
    if dblCobrador.Text = '' then
    Begin
      CdCobrador := ' AND NOT EXISTS (SELECT TRC_CODIGO '+
        ' FROM ITEM_DE_COBRANCA_COBRADOR ICC '+
        ' WHERE ICC.TRC_CODIGO=T1.TRC_CODIGO '+
        ' AND ICC.CNC_TITULO=T1.CNC_CODIGO) ';
      sFiltros := sFiltros + ' (SemCobrador) ';
    end
    else
    Begin
      CdCobrador := ' AND EXISTS (SELECT TRC_CODIGO '+
        ' FROM COBRANCA_POR_COBRADOR CPC, ITEM_DE_COBRANCA_COBRADOR ICC '+
        ' WHERE CPC.FUN_CODIGO='+IntToStr(dblCobrador.KeyValue)+
        ' AND ICC.TRC_CODIGO=T1.TRC_CODIGO '+
        ' AND ICC.CNC_TITULO=T1.CNC_CODIGO '+
        ' AND CPC.CNC_CODIGO=ICC.CNC_CODIGO '+
        ' AND CPC.CPC_CODIGO=ICC.CPC_CODIGO) ';
      sFiltros := sFiltros + ' (Cobrador:='+dblCobrador.Text+') ';
    end;
  end;

  if ckbAgruparVendedor.Checked or
     ckbCodigoVEN.Checked then
    sExibirFuncionario := ',(SELECT TOP 1 FUN_CODIGO '+
                          '  FROM ITEM_DE_PEDIDO_DE_VENDA '+
                          '  WHERE CNC_CODIGO=T1.CNC_CODIGO '+
                          '  AND PDV_CODIGO=T1.PDV_CODIGO) AS FUN ';
{
Codigo Cliente
Razão Social
Vencimento
Codigo Pedido
Dias de Atrazo
Tipo de Pagamento
}

  if self.Tag = 1 then //Inadiplência Especial
  Begin
    if ckbAgruparVendedor.Checked then
      Ordem:= ' ORDER BY FUN,'
    else
      Ordem:= ' ORDER BY ';
  end
  else
    Ordem:= ' ORDER BY T1.TRC_SITUACAO,';

  //Alan acrescentado o parametro por razão social.
  {case ComboOrdem.ItemIndex of
    0: Ordem := Ordem + ' T1.CNC_CLIENTE,T1.CLI_CODIGO,T1.TRC_VENCIMENTO ';
    1: if self.Tag = 1 then //Inadiplência Especial
         Ordem := Ordem + ' T1.CNC_CLIENTE,T2.CLI_RZ_SOCIAL,T1.TRC_VENCIMENTO '
       else
         Ordem := Ordem + ' T1.CNC_CLIENTE,T1.CLI_CODIGO,T1.TRC_VENCIMENTO ';
    2: Ordem := Ordem + ' T1.TRC_VENCIMENTO ';
    3: Ordem := Ordem + ' T1.TRC_PAGAMENTO ';
    4: Ordem := Ordem + ' T1.PDV_CODIGO,T1.TRC_SEQUENCIA ';
    5: Ordem := Ordem + ' T1.TRC_PAGAMENTO-T1.TRC_VENCIMENTO ';
    6: Ordem := Ordem + ' T1.TRC_TIPO_PAG ';
  end;}

  case ComboOrdem.ItemIndex of
    0: Ordem := Ordem + ' T1.CNC_CLIENTE,T1.CLI_CODIGO,T1.TRC_VENCIMENTO ';
    1: if self.Tag = 1 then //Inadiplência Especial
         Ordem := Ordem + ' T1.CNC_CLIENTE,T2.CLI_RZ_SOCIAL,T1.TRC_VENCIMENTO '
       else
         Ordem := Ordem + ' T1.CNC_CLIENTE,T1.CLI_CODIGO,T1.TRC_VENCIMENTO ';
    2: Ordem := Ordem + ' T1.CNC_CLIENTE,T2.CLI_RZ_SOCIAL ';
    3: Ordem := Ordem + ' T1.TRC_VENCIMENTO ';
    4: Ordem := Ordem + ' T1.TRC_PAGAMENTO ';
    5: Ordem := Ordem + ' T1.PDV_CODIGO,T1.TRC_SEQUENCIA ';
    6: Ordem := Ordem + ' T1.TRC_PAGAMENTO-T1.TRC_VENCIMENTO ';
    7: Ordem := Ordem + ' T1.TRC_TIPO_PAG ';
  end;


  if ckbClassificacao.Checked then
  begin
    if dblClassificacao.Text = '' then
    begin
      sClassificacao := ' AND T1.CLI_CODIGO IN '+
        ' (SELECT CLI_CODIGO FROM CLIENTE '+
        ' WHERE CLI_CLASSIFICACAO IS NOT NULL '+
        ' AND CNC_CODIGO=T1.CNC_CLIENTE) ';
      sFiltros := sFiltros + '(Claf=0)';
    end
    else
    begin
      sClassificacao := ' AND T1.CLI_CODIGO IN '+
        ' (SELECT CLI_CODIGO FROM CLIENTE '+
        ' WHERE CLI_CLASSIFICACAO='+IntToStr(dblClassificacao.KeyValue)+
        ' AND CNC_CODIGO=T1.CNC_CLIENTE) ';
      sFiltros := sFiltros + '(Claf='+dblClassificacao.Text+')';
    end;
  end;
  
  if self.Tag = 0 then
  Begin
    Application.CreateForm(Trpt_Inadiplencia, rpt_Inadiplencia);
    with rpt_Inadiplencia do
    Begin
      zrlFiltros.Caption := sFiltros;
      ZRLabel2.Caption := 'SIAC - Relatório de Clientes em Atrazo ';
      zrlDetalhe.Height := 1; //Tamanho normal
      if ckbSintetico.Checked then
      Begin
        zrbCabecalho.Height  := 4;
        zrlDetalhe.Height := 0;
      end
      else if ckbEspacoExtra.Checked then
        zrlDetalhe.Height := 2;

      with TRCRenegociadoPago do
      Begin
        Close;
        ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
        ParamByName('DATAINI').AsDateTime := STrToDate(mskDataINI.Text);
        ParamByName('DATAFIM').AsDateTime := STrToDate(mskDataFIM.Text)+1;
        Open;
      end;
      with TRCRenegociadoParcial do
      Begin
        Close;
        ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
        ParamByName('DATAINI').AsDateTime := STrToDate(mskDataINI.Text);
        ParamByName('DATAFIM').AsDateTime := STrToDate(mskDataFIM.Text)+1;
        Open;
      end;
      with Titulo_receber1 do
      Begin
        Close;
        SQL.Text := 'SELECT T1.*, T2.CLI_RZ_SOCIAL '+
          ' FROM TITULO_A_RECEBER T1, CLIENTE T2 '+
          ' WHERE T1.TRC_SITUACAO IN (0,2,4,8) '+
          CdTRC+CdCNC+CdPDV+CdCLI+CdTipoPag+CdFPG+CdAGF+sDias+CdCobrador+sClassificacao+CLI_TIPO+
          ' AND ((T1.TRC_VENCIMENTO>="'+MesDia(mskDataINI.Text)+'" '+
          ' AND   T1.TRC_VENCIMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '+
          ' AND  (T1.TRC_TITULOANT = 0 OR T1.TRC_TITULOANT IS NULL)) '+
          ' OR   (T1.TRC_DTORIGINAL>="'+MesDia(mskDataINI.Text)+'" '+
          ' AND T1.TRC_DTORIGINAL<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'")) '+
          ' AND T1.CLI_CODIGO*=T2.CLI_CODIGO '+
          ' AND T1.CNC_CLIENTE*=T2.CNC_CODIGO '+
          Ordem;
        Open;
      end;
      if Titulo_receber1.IsEmpty then
        Raise Exception.Create('Nenhum título selecionado!');
      report.Preview;
      Close;
    end;
  end
  else if self.Tag = 1 then //Inadiplência Especial
  Begin

    //Mala direta
    if ckbMalaDireta.Checked then
    begin
      with Etiquetas1 do
      Begin
      {
        // Falta colocar somente o Select em Etiquetas1.SQL.Text \\
        LimpaEtiquetas;
        while not Etiquetas1.EOF do
        begin

          if (not Parametro1.Active) or
             (Parametro1.CodigoPAR <> Logradouro) then
          Begin
            Parametro1.Close;
            Parametro1.ParamByName('PAR_CODIGO').asInteger:=Logradouro;
            Parametro1.Open;
          end;
          EnderecoCompleto := Trim(Parametro1.Descricao+' '+Endereco);

          AdicionarEtiqueta(CodigoCLI,Convenio,RazaoSocial,NomeFantasia,Fone,Fax,Celular,EMail,EnderecoCompleto,Bairro,Cidade,Uf,CEP,CGFRG,CPFCGC,OBS);
          Next;
        end;
      }
      end;
    end
    else
    begin

      Application.CreateForm(Trpt_InadiplenciaEspecial, rpt_InadiplenciaEspecial);
      with rpt_InadiplenciaEspecial do
      Begin
        zrlFiltros.Caption := sFiltros;
        ZRLabel2.Caption := 'SIAC - Relatório de Inadiplência Especial';

        if ckbCodigoVEN.Checked then
          vCdFUN := dblCodigoVEN.KeyValue;

        if not ckbAgruparVendedor.Checked then
        Begin
          zrbGrupoFUN.Expression := '';
          zrbGrupoFUN.Height := 0;
          zrbRodapeVendedor.Height := 0;
        end
        else if cbkSaltarPagina.Checked then
          zrbGrupoFUN.ForceNewPage := True;

        if ComboOrdem.ItemIndex > 1 then //Não está ordenado pelo cliente
        Begin
          zrlDescTotalQtdCLI.Enabled := False;
          zrlTotalQtdCLI.Enabled := False;
        end;

        if ckbSintetico.Checked then
        Begin
          zrlLinhaDupla.Top := 5;
          if ckbSuperSintetico.Checked then
          Begin
            zrbCabecalho.Height  := 4;
            zrlDetalhe.Height := 0;
            if not ckbAgruparVendedor.Checked then
              zrlLinhaSumario.Enabled := False;
          end
          else
          Begin
            zrbCabecalho.Height  := 6;
            if ckbEspacoExtra.Checked then
            Begin
              SZRDBText3.Enabled := False;
              zrlDataPedido.Enabled := False;
              zrlTipoPag.Enabled := False;
              zrlFormaPagamento.Enabled := False;
              SZRDBText1.Enabled := False;
              SZRDBText9.Enabled := False;
              zrlCobrador.Enabled := False;
            end
            else
              zrlDetalhe.Height := 1;
          end;
        end
        else if ckbEspacoExtra.Checked then
          zrlDetalhe.Height := 3;

        with Entidade do
        Begin
          //Títulos Abertos ou Recebidos
          Close;
          SQL.Text := '';
          if not ckbSomenteExcluidos.Checked then
            SQL.Text := 'SELECT '+
              ' T1.CNC_CODIGO '+
              ',0 AS TIPO '+ //Título A Receber
              ',T1.TRC_VENCIMENTO AS DATA '+
              ',T1.TRC_CODIGO '+
              ',T1.CNC_CLIENTE '+
              ',T1.CLI_CODIGO '+
              ',T1.TRC_SEQUENCIA '+
              ',T1.TRC_NUMERO '+
              ',T1.TRC_VALOR '+
              ',T1.TRC_DESCONTO '+
              ',T1.TRC_JUROS '+
              ',T1.TRC_VALOR_PAGO '+
              ',T1.TRC_DT_CADASTRO '+
              ',T1.TRC_DT_ALTERADO '+
              ',T1.TRC_VENCIMENTO '+
              ',T1.TRC_PAGAMENTO '+
              ',T1.PDV_CODIGO '+
              ',T1.TRC_TIPO_DOC '+
              ',T1.TRC_TIPO_PAG '+
              ',T1.AGF_CODIGO '+
              ',T1.CCX_CODIGO '+
              ',T1.CCX_CODIGO_REC '+
              ',T1.TRC_CRED_CLI '+
              ',T1.TRC_TITULOANT '+
              ',T1.TRC_TRCORIGINAL '+
              ',T1.TRC_DTORIGINAL '+
              ',T1.CPC_CODIGO '+
              ',T1.USU_CODIGO '+
              ',T1.TRC_GEROU_MOVIMENTO '+
              ',T1.TRC_REABERTURA '+
              ',T1.TRC_PAGAMENTO_PARCIAL '+
              ',T1.TRC_SITUACAO '+
              ',T1.TRC_OBSERVACAO '+
              //',T2.PDV_CLASSIFICACAO '+
              sExibirFuncionario+
              ' FROM TITULO_A_RECEBER T1 '+
              //' INNER JOIN PEDIDO_DE_VENDA T2 ON T1.PDV_CODIGO = T2.PDV_CODIGO '+
              ' WHERE T1.TRC_SITUACAO IN (0,2,4,8) '+
              CdTRC+CdCNC+CdPDV+CdCLI+CdTipoPag+CdFPG+CdAGF+sDias+CdCobrador+sClassificacao+
              ' AND ((T1.TRC_VENCIMENTO>="'+MesDia(mskDataINI.Text)+'" '+
              ' AND   T1.TRC_VENCIMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" '+
              ' AND  (T1.TRC_TITULOANT = 0 OR T1.TRC_TITULOANT IS NULL)) '+
              ' OR   (T1.TRC_DTORIGINAL>="'+MesDia(mskDataINI.Text)+'" '+
              ' AND T1.TRC_DTORIGINAL<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'")) ';

          //Excluídos pela data de Reaberto
          if not ckbNaoExibirExcluidos.Checked then
          Begin
            if SQL.Text <> '' then
              SQL.Add(' UNION ');
            SQL.Add(' SELECT T1.CNC_CODIGO '+
              ',1 AS TIPO '+ //Título Excluído pela data de reaberto
              ',T1.TRC_DT_ALTERADO AS DATA '+
              ',T1.TRC_CODIGO '+
              ',T1.CNC_CLIENTE '+
              ',T1.CLI_CODIGO '+
              ',T1.TRC_SEQUENCIA '+
              ',T1.TRC_NUMERO '+
              ',T1.TRC_VALOR '+
              ',T1.TRC_DESCONTO '+
              ',T1.TRC_JUROS '+
              ',T1.TRC_VALOR_PAGO '+
              ',T1.TRC_DT_CADASTRO '+
              ',T1.TRC_DT_ALTERADO '+
              ',T1.TRC_VENCIMENTO '+
              ',T1.TRC_PAGAMENTO '+
              ',T1.PDV_CODIGO '+
              ',T1.TRC_TIPO_DOC '+
              ',T1.TRC_TIPO_PAG '+
              ',T1.AGF_CODIGO '+
              ',T1.CCX_CODIGO '+
              ',T1.CCX_CODIGO_REC '+
              ',T1.TRC_CRED_CLI '+
              ',T1.TRC_TITULOANT '+
              ',T1.TRC_TRCORIGINAL '+
              ',T1.TRC_DTORIGINAL '+
              ',T1.CPC_CODIGO '+
              ',T1.USU_CODIGO '+
              ',T1.TRC_GEROU_MOVIMENTO '+
              ',T1.TRC_REABERTURA '+
              ',T1.TRC_PAGAMENTO_PARCIAL '+
              ',T1.TRC_SITUACAO '+
              ',T1.TRC_OBSERVACAO '+
              //',T2.PDV_CLASSIFICACAO '+
              sExibirFuncionario+
              ' FROM TITULO_A_RECEBER T1 '+
              //' INNER JOIN PEDIDO_DE_VENDA T2 ON T1.PDV_CODIGO = T2.PDV_CODIGO '+
              ' WHERE T1.TRC_SITUACAO = 5 '+
              CdTRC+CdCNC+CdPDV+CdCLI+CdTipoPag+CdFPG+CdAGF+sDias+CdCobrador+sClassificacao+
              ' AND T1.TRC_DT_ALTERADO>="'+MesDia(mskDataINI.Text)+'" '+
              ' AND T1.TRC_DT_ALTERADO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ');
          end;

          //Excluídos pela data de recebimento
          if not ckbNaoExibirExcluidos.Checked then
          Begin
            if SQL.Text <> '' then
              SQL.Add(' UNION ');
            SQL.Add(' SELECT '+
              ' T1.CNC_CODIGO '+
              ',2 AS TIPO '+ //Título Excluído pela data de recebimento
              ',T1.TRC_VENCIMENTO AS DATA '+
              ',T1.TRC_CODIGO '+
              ',T1.CNC_CLIENTE '+
              ',T1.CLI_CODIGO '+
              ',T1.TRC_SEQUENCIA '+
              ',T1.TRC_NUMERO '+
              ',T1.TRC_VALOR '+
              ',T1.TRC_DESCONTO '+
              ',T1.TRC_JUROS '+
              ',T1.TRC_VALOR_PAGO '+
              ',T1.TRC_DT_CADASTRO '+
              ',T1.TRC_DT_ALTERADO '+
              ',T1.TRC_VENCIMENTO '+
              ',T1.TRC_PAGAMENTO '+
              ',T1.PDV_CODIGO '+
              ',T1.TRC_TIPO_DOC '+
              ',T1.TRC_TIPO_PAG '+
              ',T1.AGF_CODIGO '+
              ',T1.CCX_CODIGO '+
              ',T1.CCX_CODIGO_REC '+
              ',T1.TRC_CRED_CLI '+
              ',T1.TRC_TITULOANT '+
              ',T1.TRC_TRCORIGINAL '+
              ',T1.TRC_DTORIGINAL '+
              ',T1.CPC_CODIGO '+
              ',T1.USU_CODIGO '+
              ',T1.TRC_GEROU_MOVIMENTO '+
              ',T1.TRC_REABERTURA '+
              ',T1.TRC_PAGAMENTO_PARCIAL '+
              ',T1.TRC_SITUACAO '+
              ',T1.TRC_OBSERVACAO '+
              //',T2.PDV_CLASSIFICACAO '+
              sExibirFuncionario+
              ' FROM TITULO_A_RECEBER T1 '+
              //' INNER JOIN PEDIDO_DE_VENDA T2 ON T1.PDV_CODIGO = T2.PDV_CODIGO '+
              ' WHERE T1.TRC_SITUACAO = 5 '+
              CdTRC+CdCNC+CdPDV+CdCLI+CdTipoPag+CdFPG+CdAGF+sDias+CdCobrador+sClassificacao+
              ' AND T1.TRC_PAGAMENTO>="'+MesDia(mskDataINI.Text)+'" '+
              ' AND T1.TRC_PAGAMENTO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'" ');
          end;

          SQL.Add(Ordem);

          Open;
        end;
        if Titulo_receber1.IsEmpty then
          Raise Exception.Create('Nenhum título selecionado!');
        report.Preview;
        Close;
      end;
    end;
  end;
end;

procedure TfMxSelInadiplencia.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelInadiplencia.ckbSinteticoClick(Sender: TObject);
begin
  if ckbSintetico.Checked then
    ckbSuperSintetico.Enabled := True
  else
  Begin
    ckbSuperSintetico.Checked := False;
    ckbSuperSintetico.Enabled := False;
  end;
end;

procedure TfMxSelInadiplencia.ckbEspacoExtraClick(Sender: TObject);
begin
  if ckbEspacoExtra.Checked then
    ckbSuperSintetico.Checked := False;
end;

procedure TfMxSelInadiplencia.ckbCodigoCNCClick(Sender: TObject);
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

procedure TfMxSelInadiplencia.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if DM.Configuracao1.Empresa <> empEletro then
    ckbCodigoCNC.Checked := True;
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    ckbCodigoCNC.Checked := True;
    ckbCodigoCNCClick(Sender);
    mskDataINI.Text := '01/01/2004';
    mskDataFIM.Text := DateToStr(DM.Configuracao1.Data-DM.Configuracao1.QuantDiasSemCobran);
  end;

  if self.Tag = 1 then //Inadiplência Especial
  Begin
    ckbCodigoCNC.Checked := True;
    ckbNaoExibirExcluidos.Checked := True;
  end;

  ComboOrdem.ItemIndex := 0;
  mskDataINI.SetFocus;
end;

procedure TfMxSelInadiplencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxSelInadiplencia.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    SB_ConfirmarClick(sender);
end;

procedure TfMxSelInadiplencia.ckbTipoPagamentoClick(Sender: TObject);
begin
  if ckbTipoPagamento.Checked then
  Begin
    Parametro1.Open;
    cmbTipoPag.Enabled := True;
    cmbTipoPag.Color := clWindow;
    cmbTipoPag.ItemIndex := 0;
    dblTipoPagamento.Color:=clWindow;
    dblTipoPagamento.Enabled:=True;
    dblTipoPagamento.KeyValue:=Parametro1.CodigoPAR;
    dblTipoPagamento.SetFocus;
  end
  else
  Begin
    Parametro1.Close;
    cmbTipoPag.Enabled := False;
    cmbTipoPag.Color := AlteraCorComponentes;
    cmbTipoPag.ItemIndex := -1;
    dblTipoPagamento.Color:=AlteraCorComponentes;
    dblTipoPagamento.KeyValue:=-1;
    dblTipoPagamento.Enabled:=False;
  end;
end;

procedure TfMxSelInadiplencia.ckbCodigoFPGClick(Sender: TObject);
begin
  if ckbCodigoFPG.Checked then
  Begin
    Forma_de_Pagamento1.Open;
    cmbCodigoFPG.Enabled := True;
    cmbCodigoFPG.Color := clWindow;
    cmbCodigoFPG.ItemIndex := 0;
    dblCodigoFPG.Color:=clWindow;
    dblCodigoFPG.Enabled:=True;
    dblCodigoFPG.KeyValue:=Forma_de_Pagamento1.CodigoFPG;
    dblCodigoFPG.SetFocus;
  end
  else
  Begin
    Forma_de_Pagamento1.Close;
    cmbCodigoFPG.Enabled := False;
    cmbCodigoFPG.Color := AlteraCorComponentes;
    cmbCodigoFPG.ItemIndex := -1;
    dblCodigoFPG.Color:=AlteraCorComponentes;
    dblCodigoFPG.KeyValue:=-1;
    dblCodigoFPG.Enabled:=False;
  end;
end;

procedure TfMxSelInadiplencia.ckbCodigoAGFClick(Sender: TObject);
begin
  if ckbCodigoAGF.Checked then
  Begin
    AgenteFin1.Open;
    cmbAgenteFinanceiro.Enabled := True;
    cmbAgenteFinanceiro.Color := clWindow;
    cmbAgenteFinanceiro.ItemIndex := 0;
    dblCodigoAGF.Color:=clWindow;
    dblCodigoAGF.Enabled:=True;
    dblCodigoAGF.KeyValue:=AgenteFin1.CodigoAGF;
    dblCodigoAGF.SetFocus;
  end
  else
  Begin
    AgenteFin1.Close;
    cmbAgenteFinanceiro.Enabled := False;
    cmbAgenteFinanceiro.Color := AlteraCorComponentes;
    cmbAgenteFinanceiro.ItemIndex := -1;
    dblCodigoAGF.Color:=AlteraCorComponentes;
    dblCodigoAGF.KeyValue:=-1;
    dblCodigoAGF.Enabled:=False;
  end;
end;

procedure TfMxSelInadiplencia.ckbDiasAtrasoClick(Sender: TObject);
begin
  if ckbDiasAtraso.Checked then
  Begin
    cmbDiasAtraso.Color:=clWindow;
    cmbDiasAtraso.Enabled:=True;
    cmbDiasAtraso.ItemIndex:=4;
    edtDiasAtraso.Color:=clWindow;
    edtDiasAtraso.Enabled:=True;
    edtDiasAtraso.SetFocus;
  end
  else
  Begin
    cmbDiasAtraso.Color:=AlteraCorComponentes;
    cmbDiasAtraso.Enabled:=False;
    cmbDiasAtraso.ItemIndex:=-1;
    edtDiasAtraso.Color:=AlteraCorComponentes;
    edtDiasAtraso.Clear;
    edtDiasAtraso.Enabled:=False;
  end;
end;

procedure TfMxSelInadiplencia.ckbCobradorClick(Sender: TObject);
begin
  if ckbCobrador.Checked then
  Begin
    Funcionario1.Open;
    dblCobrador.Color:=clWindow;
    dblCobrador.Enabled:=True;
  end
  else
  Begin
    Funcionario1.Close;
    dblCobrador.Color := AlteraCorComponentes;
    dblCobrador.Enabled := False;
    dblCobrador.KeyValue := -1;
  end;
end;

procedure TfMxSelInadiplencia.ckbCodigoTRCClick(Sender: TObject);
begin
  if ckbCodigoTRC.Checked then
  Begin
    edtCodigoTRC.Color:=clWindow;
    edtCodigoTRC.Enabled:=True;
    edtCodigoTRC.SetFocus;
  end
  else
  Begin
    edtCodigoTRC.Color:=AlteraCorComponentes;
    edtCodigoTRC.Enabled:=False;
    edtCodigoTRC.Clear;
  end;
end;

procedure TfMxSelInadiplencia.ckbCodigoPDVClick(Sender: TObject);
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
    edtCodigoPDV.Enabled:=False;
    edtCodigoPDV.Clear;
  end;
end;

procedure TfMxSelInadiplencia.ckbSuperSinteticoClick(Sender: TObject);
begin
  if ckbSuperSintetico.Checked then
    ckbEspacoExtra.Checked := False;
end;

procedure TfMxSelInadiplencia.ckbCodigoVENClick(Sender: TObject);
begin
  if ckbCodigoVEN.Checked then
  Begin
    Vendedor1.Close;
    Vendedor1.SQL.Text := 'SELECT * FROM FUNCIONARIO '+
      ' WHERE (FUN_APARECE_VENDAS=1 '+
      '  OR FUN_APARECE_SERVICOS=1) '+
      ' AND FUN_SITUACAO<>1 ';

    if ckbCodigoCNC.Checked then
      Vendedor1.SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+
        '  OR  FUN_TODOS_CENTROS=1) ');

    Vendedor1.SQL.ADD(' ORDER BY FUN_APELIDO ASC');
    Vendedor1.Open;
    dblCodigoVEN.Color:=clWindow;
    dblCodigoVEN.Enabled:=True;
    dblCodigoVEN.KeyValue:=Vendedor1.CodigoFUN;
    try
      dblCodigoVEN.SetFocus;
    except
    end;      
  end
  else
  Begin
    Vendedor1.Close;
    dblCodigoVEN.Color:=AlteraCorComponentes;
    dblCodigoVEN.KeyValue:=-1;
    dblCodigoVEN.Enabled:=False;
  end;
end;

procedure TfMxSelInadiplencia.ckbCodigoCLIClick(Sender: TObject);
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

procedure TfMxSelInadiplencia.edtCodigoCLIKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=51;
      if DM.Configuracao1.Empresa = empLBM then
        dblCentroDeCusto.KeyValue := 1
      else
        dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
      Showmodal;
    end;
  End;
end;

procedure TfMxSelInadiplencia.ckbAgruparVendedorClick(Sender: TObject);
begin
  if ckbAgruparVendedor.Checked then
    cbkSaltarPagina.Enabled := True
  else
  Begin
    cbkSaltarPagina.Checked := False;
    cbkSaltarPagina.Enabled := False;
  end;
end;

procedure TfMxSelInadiplencia.ckbClassificacaoClick(Sender: TObject);
begin
  if ckbClassificacao.Checked then
  Begin
    Parametro4.Close;
    Parametro4.SQL.Text := 'SELECT * FROM PARAMETRO '+
      ' WHERE TPR_CODIGO=60 '+
      ' AND PAR_SITUACAO<>1 ';
    if ckbCodigoCNC.Checked then
      Parametro4.SQL.ADD(' AND (PAR_INFORMACAO=0 OR PAR_INFORMACAO='+IntToStr(dblCodigoCNC.KeyValue)+')');
    Parametro4.SQL.ADD(' ORDER BY PAR_DESCRICAO ');
    Parametro4.Open;
    dblClassificacao.Color:=clWindow;
    dblClassificacao.Enabled:=True;
    dblClassificacao.SetFocus;
  end
  else
  Begin
    Parametro4.Close;
    dblClassificacao.Color:=AlteraCorComponentes;
    dblClassificacao.Enabled:=False;
    dblClassificacao.KeyValue:=-1;
  end;
end;

procedure TfMxSelInadiplencia.ckbMalaDiretaClick(Sender: TObject);
begin
  if ckbMalaDireta.Checked then
  Begin
    edtArquivoMalaDireta.Enabled:=True;
    edtArquivoMalaDireta.Color:=clWindow;
    edtArquivoMalaDireta.Text := 'C:\SIAC_ClienteInadiplente.txt';
    edtArquivoMalaDireta.SetFocus;
  end
  else
  Begin
    edtArquivoMalaDireta.Enabled:=False;
    edtArquivoMalaDireta.Color:=AlteraCorComponentes;
    edtArquivoMalaDireta.Clear;
  end;
end;

procedure TfMxSelInadiplencia.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  Begin
    Parametro5.Open;
    dblTipo.Color:=clWindow;
    dblTipo.Enabled:=True;
    try
      dblTipo.SetFocus;
    except
    end;
  end
  else
  Begin
    Parametro5.Close;
    dblTipo.Color:=AlteraCorComponentes;
    dblTipo.Enabled:=False;
    dblTipo.KeyValue:=-1;
  end;
end;

end.



