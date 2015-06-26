unit MxSelNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, CentroCusto, Db, DBTables,
  SQuery, Vendedor, AgenteFin, Forma_de_Pagamento, Parametro, Variants;

type
  TfMxSelNotaFiscal = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Vendedor1: TVendedor;
    DSVendedor1: TDataSource;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    Parametro1: TParametro;
    DSParametro1: TDataSource;
    DSParametro3: TDataSource;
    Parametro3: TParametro;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    RadioGroup1: TRadioGroup;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    ckbExibirItens: TCheckBox;
    ckbNotasCancelada: TCheckBox;
    ckbAgruparAgente: TCheckBox;
    ckbSintetico: TCheckBox;
    ckbAvulsas: TCheckBox;
    ckbNotasComServico: TCheckBox;
    cmbOrdem: TComboBox;
    ckbAgruparCodigoCNC: TCheckBox;
    ckbNomeFornecedor: TCheckBox;
    Label3: TLabel;
    ckbCliente: TCheckBox;
    edtCodigoCLI: TEdit;
    dblVendedor: TDBLookupComboBox;
    ckbVendedor: TCheckBox;
    dblCentroDeCusto: TDBLookupComboBox;
    CheckBox4: TCheckBox;
    edtCodigoPDV: TEdit;
    ckbCentroDeCusto: TCheckBox;
    CheckBox13: TCheckBox;
    edtNotaFiscal: TEdit;
    CheckBox2: TCheckBox;
    edtCFOP: TEdit;
    ckbTipoNota: TCheckBox;
    dblTipoNota: TDBLookupComboBox;
    ckbEntradaSaida: TCheckBox;
    cmbEntradaSaida: TComboBox;
    ckbValorTotal: TCheckBox;
    cmbValorTotal: TComboBox;
    edtValorTotal: TEdit;
    ckbConhecimento: TCheckBox;
    edtConhecimento: TEdit;
    ckbAgruparConhecimento: TCheckBox;
    ckbAgruparAgenteFin: TCheckBox;
    ckbNotasSemServico: TCheckBox;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    ckbNotaCupom: TCheckBox;
    cmbNotaCupom: TComboBox;
    ckbNotasComAmostra: TCheckBox;
    ckbNotasComBonificacao: TCheckBox;
    procedure ckbClienteClick(Sender: TObject);
    procedure ckbVendedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox4Click(Sender: TObject);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ckbTipoNotaClick(Sender: TObject);
    procedure dblCentroDeCustoClick(Sender: TObject);
    procedure ckbExibirItensClick(Sender: TObject);
    procedure ckbAgruparAgenteClick(Sender: TObject);
    procedure ckbEntradaSaidaClick(Sender: TObject);
    procedure ckbValorTotalClick(Sender: TObject);
    procedure ckbConhecimentoClick(Sender: TObject);
    procedure ckbAgruparAgenteFinClick(Sender: TObject);
    procedure ckbNotasSemServicoClick(Sender: TObject);
    procedure ckbNotasComServicoClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure ckbNotaCupomClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelNotaFiscal: TfMxSelNotaFiscal;

implementation

uses UDM, funcoes, CdCliente, UNotaFiscalRel, UNotaFiscalCompleta,
  UNotaFiscalAgruparAgente, MxSPediProd, MxSPediProdMotCal;

{$R *.DFM}

procedure TfMxSelNotaFiscal.ckbClienteClick(Sender: TObject);
begin
  if ckbCliente.Checked then
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

procedure TfMxSelNotaFiscal.ckbVendedorClick(Sender: TObject);
begin
  if ckbVendedor.Checked then
  Begin
    Vendedor1.Close;
    Vendedor1.SQL.Text := 'SELECT * FROM FUNCIONARIO '+
      ' WHERE FUN_APARECE_VENDAS=1 '+
      ' AND FUN_SITUACAO<>1 ';
    if ckbCentroDeCusto.Checked then
      Vendedor1.SQL.Add(' AND (CNC_CODIGO='+IntToStr(dblCentroDeCusto.KeyValue)+
                        '  OR  FUN_TODOS_CENTROS=1) ');
    Vendedor1.SQL.Add(' ORDER BY FUN_APELIDO ASC ');
    Vendedor1.Open;
    dblVendedor.Color:=clWindow;
    dblVendedor.Enabled:=True;
    dblVendedor.SetFocus;
  end
  else
  Begin
    Vendedor1.Close;
    dblVendedor.Color:=AlteraCorComponentes;
    dblVendedor.KeyValue:=-1;
    dblVendedor.Enabled:=False;
  end;
end;

procedure TfMxSelNotaFiscal.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if DM.Configuracao1.Empresa <> empLBM then
    ckbCentroDeCusto.Checked := True;

  cmbOrdem.ItemIndex := 1;

  mskDataINI.SetFocus;
end;

procedure TfMxSelNotaFiscal.BitBtn1Click(Sender: TObject);
var
  mensagem,CNC,CLI,CdPRD,CdSomentePRD,FUN,PDV,NTF,CFO,DataINI,DataFIM,Tipo,cSit,cEntradaSaida,
    Valor, sConhecimento, sAvulsa, sComServico, sComBonificacao, sComAmostra, sNotaCupom, sFiltros, Ordem:string;
begin
  CNC:='';
  CLI:='';
  CdPRD := '';
  CdSomentePRD := '';
  FUN:='';
  PDV:='';
  NTF:='';
  CFO:='';
  Tipo:='';
  sAvulsa:='';
  cEntradaSaida:='';
  sConhecimento:='';
  sComServico := '';
  sComBonificacao := '';
  sComAmostra := '';
  Valor:='';
  sNotaCupom:='';
  sFiltros:='';

  if ckbAgruparCodigoCNC.Checked then
    Ordem := ' T1.CNC_CODIGO,';

  if ckbAgruparAgente.Checked then
    Ordem := Ordem + ' T1.NTF_CFOP,T1.NTF_COD_PAGAMENTO,';

  if ckbAgruparAgenteFin.Checked then
    Ordem := Ordem + ' T1.NTF_COD_PAGAMENTO,T1.NTF_COD_PAGAMENTO_2,';

  if ckbAgruparConhecimento.Checked then
    Ordem := Ordem + ' T1.NTF_CONHECIMENTO,';

  case cmbOrdem.ItemIndex of
    0: Ordem := Ordem + ' T1.NTF_CODIGO';
    1: Ordem := Ordem + ' T1.NTF_NOTA_FISCAL';
    2: Ordem := Ordem + ' T1.NTF_PEDIDO';
    3: Ordem := Ordem + ' T1.CLI_CODIGO';
    4: Ordem := Ordem + ' T1.NTF_DT_EMISSAO,T1.NTF_NOTA_FISCAL';
    5: Ordem := Ordem + ' T1.NTF_DT_ENTRADA_SAIDA,T1.NTF_NOTA_FISCAL';
  end;

  mensagem:='';
  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if not VerificaDataBranco(mskDataINI.Text)then
    DataINI := ''
  else if RadioGroup1.ItemIndex = 0 then
    DataINI := ' AND (NTF_DT_CADASTRO>="'+MesDia(mskDataINI.Text)+'") '
  else if RadioGroup1.ItemIndex = 1 then
    DataINI := ' AND (NTF_DT_EMISSAO>="'+MesDia(mskDataINI.Text)+'") '
  else
    DataINI := ' AND (NTF_DT_ENTRADA_SAIDA>="'+MesDia(mskDataINI.Text)+'") ';
  if not VerificaDataBranco(mskDataFIM.Text)then
    DataFIM := ''
  else if RadioGroup1.ItemIndex = 0 then
    DataFIM := ' AND (NTF_DT_CADASTRO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else if RadioGroup1.ItemIndex = 1 then
    DataFIM := ' AND (NTF_DT_EMISSAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") '
  else
    DataFIM := ' AND (NTF_DT_ENTRADA_SAIDA<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';
  if mensagem<>'' then
    raise exception.Create(mensagem);

  case RadioGroup1.ItemIndex of
    0: sFiltros := sFiltros + '(Cad) ';
    1: sFiltros := sFiltros + '(Emi) ';
    2: sFiltros := sFiltros + '(Ent) ';
  end;

  if ckbCliente.Checked then
    if not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Begin
      edtCodigoCLI.SetFocus;
      raise Exception.Create('Código do Cliente inválido!');
    end
    else
    Begin
      CLI:=' AND (CLI_CODIGO='+edtCodigoCLI.Text+') ';
      sFiltros := sFiltros + ' (CLI:'+edtCodigoCLI.Text+')';
    end;

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Begin
      edtCodigoPRD.SetFocus;
      raise Exception.Create('Código do Produto/Serviço inválido!');
    end
    else
    Begin
      CdPRD:=' AND T1.NTF_CODIGO IN (SELECT NTF_CODIGO '+
        ' FROM ITEM_DE_NOTA_FISCAL '+
        ' WHERE PRD_CODIGO='+edtCodigoPRD.Text+
        ' AND CNC_CODIGO=T1.CNC_CODIGO '+
        ' AND CNC_ORIGEM=T1.CNC_ORIGEM) ';
      CdSomentePRD := ' AND T2.PRD_CODIGO='+edtCodigoPRD.Text;
      sFiltros := sFiltros + ' (PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbVendedor.Checked then
    if dblVendedor.Text = '' then
    Begin
      dblVendedor.SetFocus;
      raise Exception.Create('Vendedor(a) inválido(a)!');
    end
    else
    Begin
      FUN:=' AND (FUN_CODIGO='+IntToStr(dblVendedor.KeyValue)+') ';
      sFiltros := sFiltros + ' (VEN:'+IntToStr(dblVendedor.KeyValue)+')';
    end;
  if CheckBox4.Checked then
    if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    Begin
      edtCodigoPDV.SetFocus;
      raise Exception.Create('Código do pedido inválido!');
    end
    else
    Begin
      PDV:=' AND (NTF_PEDIDO='+edtCodigoPDV.Text+') ';
      sFiltros := sFiltros + ' (PDV:'+edtCodigoPDV.Text+')';
    end;

  if ckbCentroDeCusto.Checked then
    if dblCentroDeCusto.Text = '' then
    Begin
      dblCentroDeCusto.SetFocus;
      raise Exception.Create('Centro de Custo inválido!');
    end
    else
    Begin
      CNC:=' AND (T1.CNC_CODIGO='+IntToStr(dblCentroDeCusto.KeyValue)+') ';
      sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCentroDeCusto.KeyValue)+')';
    end;

  if ckbTipoNota.Checked then
    if dblTipoNota.Text = '' then
    Begin
      dblTipoNota.SetFocus;
      raise Exception.Create('Tipo de Nota inválido!');
    end
    else
    Begin
      if (DM.Configuracao1.Empresa = empLBM) and
         (dblTipoNota.KeyValue = 361) then
        Tipo:=' AND (T1.NTF_TIPO_NOTA='+IntToStr(dblTipoNota.KeyValue)+
          ' OR T1.NTF_TIPO_NOTA=368 ) '
      else
        Tipo:=' AND (T1.NTF_TIPO_NOTA='+IntToStr(dblTipoNota.KeyValue)+') ';
      sFiltros := sFiltros + ' (Tipo:'+dblTipoNota.Text+')';
    end;

  if ckbEntradaSaida.Checked then
    if (not cmbEntradaSaida.ItemIndex >= 0) then
    Begin
      cmbEntradaSaida.SetFocus;
      raise Exception.Create('Defina se é de Entrada ou Saída!');
    end
    else
    Begin
      cEntradaSaida:=' AND (T1.NTF_ENTRADA_SAIDA='+IntToStr(cmbEntradaSaida.ItemIndex)+') ';
      sFiltros := sFiltros + ' ('+cmbEntradaSaida.Text+')';
    end;

  if ckbValorTotal.Checked then
  Begin
    if not VerificaFloatBranco(edtValorTotal.Text) then
    Begin
      edtValorTotal.SetFocus;
      Raise Exception.Create('Valor Total do pedido inválido!');
    end
    else
      case cmbValorTotal.ItemIndex of
        0: Begin
             Valor:=' AND (T1.NTF_TOTAL_NOTA < '+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Valor:<'+edtValorTotal.Text+') ';
           end;
        1: Begin
             Valor:=' AND (T1.NTF_TOTAL_NOTA = '+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Valor:='+edtValorTotal.Text+') ';
           end;
        2: Begin
             Valor:=' AND (T1.NTF_TOTAL_NOTA > '+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Valor:>'+edtValorTotal.Text+') ';
           end;
        3: Begin
             Valor:=' AND (T1.NTF_TOTAL_NOTA <='+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Valor:<='+edtValorTotal.Text+') ';
           end;
        4: Begin
             Valor:=' AND (T1.NTF_TOTAL_NOTA >='+VirgPonto(edtValorTotal.Text)+') ';
             sFiltros := sFiltros + ' (Valor:>='+edtValorTotal.Text+') ';
           end;
      end;
  end;

  if ckbNotaCupom.Checked then
  Begin
    if cmbNotaCupom.ItemIndex = 0 then
    Begin
      sNotaCupom := ' AND T1.NTF_NOTA_CUPOM=1 ';
      sFiltros := sFiltros + '(Nota)';
    end
    else
    Begin
      sNotaCupom := ' AND T1.NTF_NOTA_CUPOM=2 ';
      sFiltros := sFiltros + '(Cupom)';
    end;
  end;

  if CheckBox13.Checked then
    if not VerificaInteiroBranco(edtNotaFiscal.Text) then
    Begin
      edtNotaFiscal.SetFocus;
      raise Exception.Create('Número da Nota inválido!');
    end
    else
    Begin
      NTF:=' AND (NTF_NOTA_FISCAL='+edtNotaFiscal.Text+') ';
      sFiltros := sFiltros + ' (Nota:'+edtNotaFiscal.Text+')';
    end;

  if CheckBox2.Checked then
    if not VerificaInteiroBranco(edtCFOP.Text) then
    Begin
      edtCFOP.SetFocus;
      raise Exception.Create('CFOP inválido!');
    end
    else
    Begin
      CFO:=' AND (NTF_CFOP='+edtCFOP.Text+') ';
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT OPF_DESCRICAO FROM OPERACAO_FISCAL '+
          ' WHERE OPF_CODIGO='+edtCFOP.Text;
        Open;
        if not IsEmpty then
          sFiltros := sFiltros + ' (CFOP:'+FieldByName('OPF_DESCRICAO').asString+')'
        else
          sFiltros := sFiltros + ' (CFOP:'+edtCFOP.Text+')';
      end;
    end;


  if ckbConhecimento.Checked then
    if not VerificaInteiroBranco(edtConhecimento.Text) then
    Begin
      edtConhecimento.SetFocus;
      raise Exception.Create('Conhecimento inválido!');
    end
    else
    Begin
      sConhecimento:=' AND (NTF_CONHECIMENTO='+edtConhecimento.Text+') ';
      sFiltros := sFiltros + ' (Conhecimento:'+edtConhecimento.Text+')';
    end;

  if ckbNotasCancelada.Checked then
  Begin
    cSit := ' AND T1.NTF_SITUACAO = 3 ';
    sFiltros := sFiltros + ' (Canceladas)';
  end
  else
    cSit := ' AND T1.NTF_SITUACAO = 2 ';

  if ckbAvulsas.Checked then
  Begin
    sAvulsa := ' AND T1.NTF_AVULSA=1 ';
    sFiltros := sFiltros + ' (Avulsas)';
  end
  else
    sAvulsa := '';

  if ckbNotasComServico.Checked then
  Begin
    sComServico := ' AND T1.NTF_CODIGO IN (SELECT NTF_CODIGO FROM ITEM_DE_NOTA_FISCAL '+
      ' WHERE (PRD_CODIGO=0 '+
      '   OR EXISTS (SELECT PRD_CODIGO FROM PRODUTO PRD '+
      '   WHERE PRD.PRD_CODIGO=INF.PRD_CODIGO '+
      '   AND PRD_SERVICO=1)) '+
      ' AND NTF_CODIGO=T1.NTF_CODIGO '+
      ' AND CNC_ORIGEM=T1.CNC_ORIGEM '+
      ' AND CNC_CODIGO=T1.CNC_CODIGO) ';
    sFiltros := sFiltros + ' (C/Serviço)';
  end
  else if ckbNotasSemServico.Checked then
  Begin
    sComServico := ' AND T1.NTF_CODIGO NOT IN (SELECT NTF_CODIGO FROM ITEM_DE_NOTA_FISCAL INF '+
      ' WHERE (PRD_CODIGO=0 '+
      '   OR EXISTS (SELECT PRD_CODIGO FROM PRODUTO PRD '+
      '   WHERE PRD.PRD_CODIGO=INF.PRD_CODIGO '+
      '   AND PRD_SERVICO=1)) '+
      ' AND NTF_CODIGO=T1.NTF_CODIGO '+
      ' AND CNC_ORIGEM=T1.CNC_ORIGEM '+
      ' AND CNC_CODIGO=T1.CNC_CODIGO) ';
    sFiltros := sFiltros + ' (S/Serviço)';
  end;

  if ckbNotasComBonificacao.Checked then
  Begin
    sComBonificacao := ' AND T1.NTF_CODIGO IN (SELECT NTF_CODIGO FROM ITEM_DE_NOTA_FISCAL '+
      ' WHERE INF_BONIFICACAO>0 '+
      ' AND NTF_CODIGO=T1.NTF_CODIGO '+
      ' AND CNC_ORIGEM=T1.CNC_ORIGEM '+
      ' AND CNC_CODIGO=T1.CNC_CODIGO) ';
    sFiltros := sFiltros + ' (C/Bonificacao)';
  end;

  if ckbNotasComAmostra.Checked then
  Begin
    sComAmostra := ' AND T1.NTF_CODIGO IN (SELECT NTF_CODIGO FROM ITEM_DE_NOTA_FISCAL '+
      ' WHERE INF_AMOSTRA>0 '+
      ' AND NTF_CODIGO=T1.NTF_CODIGO '+
      ' AND CNC_ORIGEM=T1.CNC_ORIGEM '+
      ' AND CNC_CODIGO=T1.CNC_CODIGO) ';
    sFiltros := sFiltros + ' (C/Amostra)';
  end;

  Dt_ini := mskDataINI.Text;
  Dt_fim := mskDataFIM.Text;
  if (not ckbExibirItens.Checked) then
  Begin
    if tag = 0 then
    Begin
      if ckbAgruparAgente.Checked or ckbAgruparAgenteFin.Checked then
      Begin
        Application.CreateForm(Trpt_NotaFiscalAgruparAgente, rpt_NotaFiscalAgruparAgente);
        with rpt_NotaFiscalAgruparAgente do
        Begin
          tag := 0;
          zrlFiltros.Caption := sFiltros;
          SZRGroup1.Height := 0;
          if ckbAgruparAgenteFin.Checked then
            SZRGroup1.Expression := 'NTF_COD_PAGAMENTO+NTF_COD_PAGAMENTO_2';

          if RadioGroup1.ItemIndex = 2 then
            SZRLabel1.Caption := 'Entrada';

          if ckbSintetico.Checked then
          Begin
            ZRLabel10.Enabled := False;
            ZRLabel7.Enabled := False;
            SZRLabel1.Enabled := False;
            SZRLabel2.Enabled := False;
            SZRLabel3.Enabled := False;
            SZRLabel4.Enabled := False;
            SZRLabel22.Caption := 'ISS';
            ZRBand2.Height := 0;
          end;

          if ckbAgruparCodigoCNC.Checked then
            zrgCodigoCNC.Expression := 'CNC_CODIGO'
          else
            zrgCodigoCNC.Height := 0;

          Entidade.Close;
          if ckbAgruparAgente.Checked then
            Entidade.SQL.Text:='SELECT * '+
              ' FROM NOTA_FISCAL T1 '+
              ' WHERE NTF_CODIGO > 0 '+
              DataINI+DataFIM+CNC+CLI+FUN+PDV+NTF+CFO+Tipo+cSit+cEntradaSaida+CdPRD+
              Valor+sAvulsa+sComServico+sComBonificacao+sComAmostra+sConhecimento+sNotaCupom+
              ' ORDER BY '+Ordem
          else
            Entidade.SQL.Text:='SELECT * '+
              ' FROM NOTA_FISCAL T1, PEDIDO_DE_VENDA T2 '+
              ' WHERE NTF_CODIGO > 0 '+
              DataINI+DataFIM+CNC+CLI+FUN+PDV+NTF+CFO+Tipo+cSit+cEntradaSaida+CdPRD+
              Valor+sAvulsa+sComServico+sComBonificacao+sComAmostra+sConhecimento+sNotaCupom+
              ' AND T1.NTF_PEDIDO*=T2.PDV_CODIGO '+
              ' ORDER BY '+Ordem;
          Entidade.Open;
          if Entidade.IsEmpty then
            Raise Exception.Create('Consulta Vazia!');
          SZRLabel15.Caption := mskDataINI.Text;
          SZRLabel17.Caption := mskDataFIM.Text;
          report.preview;
          Close;
        end;
      end
      else
      Begin
        Application.CreateForm(Trpt_NotaFiscalRel, rpt_NotaFiscalRel);
        with rpt_NotaFiscalRel do
        Begin
          tag := 0;
          zrlFiltros.Caption := sFiltros;
          if ckbNotasComServico.Checked then
          Begin
            SZRLabel9.Caption := 'Base ISS';
            zrlConhecimento.DataField := 'NTF_BASE_ISS';
          end;
          if ckbAgruparCodigoCNC.Checked then
            zrbGrupoCentroDeCusto.Expression := 'CNC_CODIGO'
          else
            zrbGrupoCentroDeCusto.Height := 0;

          zrbGrupoConhecimento.Height := 0;
          if ckbAgruparConhecimento.Checked then
          Begin
            zrbGrupoConhecimento.Expression := 'NTF_CONHECIMENTO';
            zrbSumario.Height := 3;
          end
          else
          Begin
            zrbGrupoConhecimento.Expression := '';
            zrbRodapeConhecimento.Height := 0;
          end;

          Entidade.Close;
          Entidade.SQL.Text:='SELECT * '+
            ' FROM NOTA_FISCAL T1 '+
            ' WHERE NTF_CODIGO > 0 '+
            DataINI+DataFIM+CNC+CLI+FUN+PDV+NTF+CFO+Tipo+cSit+cEntradaSaida+Valor+CdPRD+
            sAvulsa+sComServico+sComBonificacao+sComAmostra+sConhecimento+sNotaCupom+
            ' ORDER BY '+Ordem;
          Entidade.Open;
          if Entidade.IsEmpty then
            Raise Exception.Create('Consulta Vazia!');
          SZRLabel15.Caption := mskDataINI.Text;
          SZRLabel17.Caption := mskDataFIM.Text;
          report.preview;
          Close;
        end;
      end;
    end;
  end
  else
  Begin
    if tag = 0 then
    Begin
      Application.CreateForm(Trpt_NotaFiscalCompleta, rpt_NotaFiscalCompleta);
      with rpt_NotaFiscalCompleta do
      Begin
        tag := 0;
        zrlFiltros.Caption := sFiltros;
        Entidade.Close;
        Entidade.SQL.Text:='SELECT * '+
          ' FROM NOTA_FISCAL T1, ITEM_DE_NOTA_FISCAL T2 '+
          ' WHERE T1.NTF_CODIGO > 0 '+
          DataINI+DataFIM+CNC+CLI+FUN+PDV+NTF+CFO+Tipo+cSit+cEntradaSaida+Valor+CdSomentePRD+
          sAvulsa+sComServico+sComBonificacao+sComAmostra+sConhecimento+sNotaCupom+
          ' AND T1.NTF_CODIGO=T2.NTF_CODIGO '+
          ' AND T1.CNC_ORIGEM=T2.CNC_ORIGEM '+
          ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
          ' ORDER BY '+Ordem;
        Entidade.Open;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        SZRLabel5.Caption := mskDataINI.Text;
        SZRLabel7.Caption := mskDataFIM.Text;
        report.preview;
        rpt_NotaFiscalCompleta.Close;
      end;
    end;
  end;
end;

procedure TfMxSelNotaFiscal.edtCodigoCLIKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoCLI.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    with fCadCli do
    Begin
      tag:=25;
      CentroCusto2.open;
      if DM.Configuracao1.Empresa <> empLBM then
        dblCentroDeCusto.KeyValue := self.dblCentroDeCusto.KeyValue
      else
        dblCentroDeCusto.KeyValue := 1;      
      Showmodal;
    end;
  End;
end;

procedure TfMxSelNotaFiscal.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Vendedor1.Close;
  CentroCusto1.Close;
  Action := cafree;
end;

procedure TfMxSelNotaFiscal.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then
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

procedure TfMxSelNotaFiscal.ckbCentroDeCustoClick(Sender: TObject);
begin
  if ckbCentroDeCusto.Checked then
  Begin
    CentroCusto1.Open;
    dblCentroDeCusto.Color:=clWindow;
    dblCentroDeCusto.Enabled:=True;
    dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCentroDeCusto.SetFocus;
  end
  else
  Begin
    CentroCusto1.Close;
    dblCentroDeCusto.Color:=AlteraCorComponentes;
    dblCentroDeCusto.KeyValue:=-1;
    dblCentroDeCusto.Enabled:=False;
  end;
end;

procedure TfMxSelNotaFiscal.CheckBox13Click(Sender: TObject);
begin
  if CheckBox13.Checked then
  Begin
    edtNotaFiscal.Color:=clWindow;
    edtNotaFiscal.Enabled:=True;
    edtNotaFiscal.SetFocus;
  end
  else
  Begin
    edtNotaFiscal.Color:=AlteraCorComponentes;
    edtNotaFiscal.Text:='';
    edtNotaFiscal.Enabled:=False;
  end;
end;

procedure TfMxSelNotaFiscal.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  Begin
    edtCFOP.Color:=clWindow;
    edtCFOP.Enabled:=True;
    edtCFOP.SetFocus;
  end
  else
  Begin
    edtCFOP.Color:=AlteraCorComponentes;
    edtCFOP.Text:='';
    edtCFOP.Enabled:=False;
  end;
end;

procedure TfMxSelNotaFiscal.ckbTipoNotaClick(Sender: TObject);
begin
  if ckbTipoNota.Checked then
  Begin
    Parametro3.Open;
    dblTipoNota.Color:=clWindow;
    dblTipoNota.Enabled:=True;
    dblTipoNota.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblTipoNota.SetFocus;
  end
  else
  Begin
    Parametro3.Close;
    dblTipoNota.Color:=AlteraCorComponentes;
    dblTipoNota.KeyValue:=-1;
    dblTipoNota.Enabled:=False;
  end;
end;

procedure TfMxSelNotaFiscal.dblCentroDeCustoClick(Sender: TObject);
begin
  if DM.Configuracao1.Empresa <> empLBM then
    ckbVendedor.Checked := False;
end;

procedure TfMxSelNotaFiscal.ckbExibirItensClick(Sender: TObject);
begin
  if ckbExibirItens.Checked then
  Begin
    ckbAgruparAgente.Checked := False;
    ckbAgruparAgente.Enabled := False;
    cmbOrdem.ItemIndex := 0;
    cmbOrdem.Enabled := False;
    ckbAgruparCodigoCNC.Checked := True;
    ckbAgruparCodigoCNC.Enabled := False;
    ckbAgruparConhecimento.Checked := False;
    ckbAgruparConhecimento.Enabled := False;
  end
  else
  Begin
    cmbOrdem.Enabled := True;
    ckbAgruparAgente.Enabled := True;
    ckbAgruparCodigoCNC.Enabled := True;
    ckbAgruparConhecimento.Enabled := True;    
  end;
end;

procedure TfMxSelNotaFiscal.ckbAgruparAgenteClick(Sender: TObject);
begin
  if ckbAgruparAgente.Checked then
  Begin
    ckbAgruparAgenteFin.Checked := False;
    ckbExibirItens.Checked := False;
    ckbSintetico.Checked := True;
    ckbSintetico.Enabled := True;
    ckbAgruparConhecimento.Checked := False;
    ckbAgruparConhecimento.Enabled := False;
  end
  else
  Begin
    ckbSintetico.Checked := False;
    ckbSintetico.Enabled := False;
    ckbAgruparConhecimento.Enabled := True;
  end;
end;

procedure TfMxSelNotaFiscal.ckbEntradaSaidaClick(Sender: TObject);
begin
  if ckbEntradaSaida.Checked then
  Begin
    cmbEntradaSaida.Color:=clWindow;
    cmbEntradaSaida.Enabled:=True;
    cmbEntradaSaida.ItemIndex := 1;
    cmbEntradaSaida.SetFocus;
  end
  else
  Begin
    cmbEntradaSaida.Color:=AlteraCorComponentes;
    cmbEntradaSaida.Enabled:=False;
    cmbEntradaSaida.ItemIndex := -1;
  end;
end;

procedure TfMxSelNotaFiscal.ckbValorTotalClick(Sender: TObject);
begin
  if ckbValorTotal.Checked then
  Begin
    cmbValorTotal.Color:=clWindow;
    cmbValorTotal.Enabled:=True;
    cmbValorTotal.ItemIndex:=4;
    edtValorTotal.Color:=clWindow;
    edtValorTotal.Enabled:=True;
    edtValorTotal.SetFocus;
  end
  else
  Begin
    cmbValorTotal.Color:=AlteraCorComponentes;
    cmbValorTotal.Enabled:=False;
    cmbValorTotal.ItemIndex:=-1;
    edtValorTotal.Color:=AlteraCorComponentes;
    edtValorTotal.Text:='';
    edtValorTotal.Enabled:=False;
  end;
end;

procedure TfMxSelNotaFiscal.ckbConhecimentoClick(Sender: TObject);
begin
  if ckbConhecimento.Checked then
  Begin
    edtConhecimento.Color:=clWindow;
    edtConhecimento.Enabled:=True;
    edtConhecimento.SetFocus;
  end
  else
  Begin
    edtConhecimento.Color:=AlteraCorComponentes;
    edtConhecimento.Text:='';
    edtConhecimento.Enabled:=False;
  end;
end;

procedure TfMxSelNotaFiscal.ckbAgruparAgenteFinClick(Sender: TObject);
begin
  if ckbAgruparAgenteFin.Checked then
  Begin
    ckbAgruparAgente.Checked := False;
    ckbTipoNota.Checked := True;
    ckbTipoNota.Enabled := False;
    dblTipoNota.Enabled := False;
    dblTipoNota.KeyValue := 361; //Venda
    ckbExibirItens.Checked := False;
    ckbSintetico.Checked := True;
    ckbSintetico.Enabled := True;
    ckbAgruparConhecimento.Checked := False;
    ckbAgruparConhecimento.Enabled := False;
  end
  else
  Begin
    ckbSintetico.Checked := False;
    ckbSintetico.Enabled := False;
    ckbAgruparConhecimento.Enabled := True;
    ckbTipoNota.Enabled := True;
    dblTipoNota.Enabled := True;
  end;
end;

procedure TfMxSelNotaFiscal.ckbNotasSemServicoClick(Sender: TObject);
begin
  if ckbNotasSemServico.Checked then
    ckbNotasComServico.Checked := false;

end;

procedure TfMxSelNotaFiscal.ckbNotasComServicoClick(Sender: TObject);
begin
  if ckbNotasComServico.Checked then
    ckbNotasSemServico.Checked := false;
end;

procedure TfMxSelNotaFiscal.ckbCodigoPRDClick(Sender: TObject);
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
    edtCodigoPRD.Clear;
    edtCodigoPRD.Enabled:=False;
  end;
end;

procedure TfMxSelNotaFiscal.edtCodigoPRDKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=54;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=54;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxSelNotaFiscal.ckbNotaCupomClick(Sender: TObject);
begin
  if ckbNotaCupom.Checked then
  Begin
    cmbNotaCupom.Color:=clWindow;
    cmbNotaCupom.Enabled:=True;
    cmbNotaCupom.ItemIndex := 0;
    cmbNotaCupom.SetFocus;
  end
  else
  Begin
    cmbNotaCupom.Color:=AlteraCorComponentes;
    cmbNotaCupom.Enabled:=False;
    cmbNotaCupom.ItemIndex := -1;
  end;
end;

end.
