unit MxLocalizaNotaCupom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Pedido_de_Venda, Cliente, Titulo_receber, DBCtrls, CentroCusto,
  Funcionario, Parametro, NotaFiscal, OperFisc, Item_de_Estoque,
  Item_Nota_Fiscal, Menus, Fornecedor, Transportadora;

type
  TfMxLocalizaNotaCupom = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    DBGrid5: TDBGrid;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    edtLocalizar: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    cmbCampo: TComboBox;
    NotaFiscal1: TNotaFiscal;
    Cliente1: TCliente;
    NotaFiscal1NTF_CODIGO: TIntegerField;
    NotaFiscal1CNC_CODIGO: TIntegerField;
    NotaFiscal1USU_CODIGO: TIntegerField;
    NotaFiscal1CNC_CLIENTE: TIntegerField;
    NotaFiscal1CLI_CODIGO: TIntegerField;
    NotaFiscal1FOR_CODIGO: TIntegerField;
    NotaFiscal1FUN_CODIGO: TIntegerField;
    NotaFiscal1TRN_CODIGO: TIntegerField;
    NotaFiscal1CAG_CODIGO: TIntegerField;
    NotaFiscal1NTF_PEDIDO: TIntegerField;
    NotaFiscal1NTF_DT_CADASTRO: TDateTimeField;
    NotaFiscal1NTF_DT_ALTERADO: TDateTimeField;
    NotaFiscal1NTF_DT_EMISSAO: TDateTimeField;
    NotaFiscal1NTF_DT_ENTRADA_SAIDA: TDateTimeField;
    NotaFiscal1NTF_ENTRADA_SAIDA: TIntegerField;
    NotaFiscal1NTF_TIPO_NOTA: TIntegerField;
    NotaFiscal1NTF_NOTA_FISCAL: TIntegerField;
    NotaFiscal1NTF_SERIE: TStringField;
    NotaFiscal1NTF_SUBSERIE: TStringField;
    NotaFiscal1NTF_SELO: TIntegerField;
    NotaFiscal1NTF_AIDF: TIntegerField;
    NotaFiscal1NTF_CFOP: TIntegerField;
    NotaFiscal1NTF_BASE_ICMS: TFloatField;
    NotaFiscal1NTF_ICMS: TFloatField;
    NotaFiscal1NTF_BASE_ICMS_SUB: TFloatField;
    NotaFiscal1NTF_ICMS_SUB: TFloatField;
    NotaFiscal1NTF_TOTAL_PRODUTO: TFloatField;
    NotaFiscal1NTF_TOTAL_NOTA: TFloatField;
    NotaFiscal1NTF_FRETE: TFloatField;
    NotaFiscal1NTF_SEGURO: TFloatField;
    NotaFiscal1NTF_OUTRAS: TFloatField;
    NotaFiscal1NTF_IPI: TFloatField;
    NotaFiscal1NTF_TIPO_TRANSPORTE: TIntegerField;
    NotaFiscal1NTF_TIPO_FRETE: TIntegerField;
    NotaFiscal1NTF_PLACA: TStringField;
    NotaFiscal1NTF_PLACA_UF: TStringField;
    NotaFiscal1NTF_QUANTIDADE: TFloatField;
    NotaFiscal1NTF_ESPECIE: TStringField;
    NotaFiscal1NTF_MARCA: TStringField;
    NotaFiscal1NTF_NUMERO: TStringField;
    NotaFiscal1NTF_PESO_BRUTO: TFloatField;
    NotaFiscal1NTF_PESO_LIQUIDO: TFloatField;
    NotaFiscal1NTF_SITUACAO: TIntegerField;
    NotaFiscal1NTF_OBSERVACAO: TStringField;
    NotaFiscal1Cliente: TStringField;
    NotaFiscal1Operacao: TStringField;
    NotaFiscal1EntraSai: TStringField;
    NotaFiscal1Tipo: TStringField;
    DSNotaFiscal1: TDataSource;
    Funcionario1: TFuncionario;
    NotaFiscal1Vendedor: TStringField;
    OperFiscal1: TOperFiscal;
    NotaFiscal1Situacao: TStringField;
    NotaFiscal1NTF_ICMS_FRETE: TFloatField;
    NotaFiscal1NTF_CONHECIMENTO: TIntegerField;
    labCancelar: TLabel;
    Item_Nota_Fiscal1: TItem_Nota_Fiscal;
    Item_de_Estoque1: TItem_de_Estoque;
    NotaFiscal1NTF_ISS: TFloatField;
    NotaFiscal1NTF_BASE_ISS: TFloatField;
    NotaFiscal1CNC_PEDIDO: TIntegerField;
    NotaFiscal1NTF_ENDERECO: TStringField;
    NotaFiscal1NTF_BAIRRO: TStringField;
    NotaFiscal1NTF_MUNICIPIO: TStringField;
    NotaFiscal1NTF_UF: TStringField;
    NotaFiscal1NTF_CEP: TStringField;
    NotaFiscal1NTF_NOTA_CUPOM: TIntegerField;
    NotaFiscal1NTF_AVULSA: TIntegerField;
    NotaFiscal1NTF_COD_PAGAMENTO: TIntegerField;
    NotaFiscal1NTF_TOTAL_SERVICO: TFloatField;
    NotaFiscal1Centro: TStringField;
    CentroCusto2: TCentroCusto;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Principal1: TMenuItem;
    Localizar1: TMenuItem;
    ImprimirEspelho1: TMenuItem;
    N1: TMenuItem;
    Fornecedor1: TFornecedor;
    Transportadora1: TTransportadora;
    NotaFiscal1FUN_ARQUITETO: TIntegerField;
    NotaFiscal1CNC_ORIGEM: TIntegerField;
    NotaFiscal1NTF_COD_PAGAMENTO_2: TIntegerField;
    NotaFiscal1NTF_MAQUINA: TIntegerField;
    BitBtn1: TBitBtn;
    SB_Cancelar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NotaFiscal1CalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Fechar1Click(Sender: TObject);
    procedure ImprimirEspelho1Click(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade:TNotaFiscal;
    cancelar: Boolean;
    { Public declarations }
  end;

var
  fMxLocalizaNotaCupom: TfMxLocalizaNotaCupom;

implementation
uses
  UDM, funcoes, UNotaFiscalPetromax, UNotaFiscalLBM,
  UNotaFiscalMotCal, UNotaFiscalLuciano, DigSenha, UNotaFiscalEletro;

{$R *.DFM}

procedure TfMxLocalizaNotaCupom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_LOC_NOTA_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Action:=Cafree;
end;

procedure TfMxLocalizaNotaCupom.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxLocalizaNotaCupom.SB_LocClick(Sender: TObject);
begin
  if edtLocalizar.Text = '*' then
  Begin
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM NOTA_FISCAL '+
      ' ORDER BY NTF_CODIGO DESC ';
    Entidade.Open;
  end
  else if cmbCampo.ItemIndex = 7 then //Código do Produto
  Begin
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      Raise exception.Create('Código do Produto/Serviço inválido!');
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM NOTA_FISCAL N1 '+
      ' WHERE N1.NTF_CODIGO IN (SELECT I1.NTF_CODIGO '+
      ' FROM ITEM_DE_NOTA_FISCAL I1 '+
      ' WHERE I1.PRD_CODIGO='+edtLocalizar.Text+
      ' AND I1.CNC_ORIGEM=N1.CNC_ORIGEM '+
      ' AND I1.CNC_CODIGO=N1.CNC_CODIGO) '+
      ' ORDER BY NTF_CODIGO DESC ';
    Entidade.Open;
  end
  else
    Entidade.Selecionar;
end;

procedure TfMxLocalizaNotaCupom.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
end;

procedure TfMxLocalizaNotaCupom.DBLookupComboBox1Click(Sender: TObject);
begin
  Entidade.Close;
  Entidade.SQL.Text:='SELECT * FROM NOTA_FISCAL '+
    ' WHERE NTF_DT_CADASTRO>="'+MesDia(DM.Configuracao1.Data)+'" '+
    ' AND NTF_DT_CADASTRO<"'+MesDia(DM.Configuracao1.Data+1)+'" '+
    ' ORDER BY NTF_TIPO_NOTA,NTF_NOTA_FISCAL DESC ';
  Entidade.Open;
  edtLocalizar.SetFocus;
end;

procedure TfMxLocalizaNotaCupom.FormCreate(Sender: TObject);
begin
  Entidade := NotaFiscal1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_LOC_NOTA_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxLocalizaNotaCupom.NotaFiscal1CalcFields(DataSet: TDataSet);
begin
  //Definir Centro de Custo
  with DM.CentroCusto2 do
  Begin
    if DM.Configuracao1.Empresa <> empLBM then
    Begin
      if Active = False then
        Open;
      if (Entidade.CodigoCNC > 0) then
      Begin
        if (Entidade.CodigoCNC <> COdigoCNC) then
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
          Open;
        end;
        Entidade.FieldByName('Centro').asString := RazaoSocial;
      end
      else
        Entidade.FieldByName('Centro').asString := '';
    end
    else //LBM
    Begin
      if Entidade.CodigoCNC <= 0 then
        Entidade.FieldByName('Centro').asString := 'ERRO'
      else if Entidade.CodigoCNC = 1 then
        Entidade.FieldByName('Centro').asString := 'Matriz'
      else
        Entidade.FieldByName('Centro').asString := 'Filial'+IntToStr(Entidade.CodigoCNC);
    end;
  end;

  Entidade.FieldByName('Cliente').asString := '';
  if (Entidade.TipoNota <> 360) and  //Diferente Compra
     (Entidade.TipoNota <> 369) and  //Diferente Conhecimento
     (Entidade.TipoNota <> 451) and  //Diferente Imobilizado     
     (Entidade.TipoNota <> 4240) and //Diferente Aquisição
     (Entidade.TipoNota <> 4450) and //Diferente REMESSA DE TROCA     
     (NotaFiscal1.CFOP <> 5202) and     //Dev. Compra
     (NotaFiscal1.CFOP <> 6202) then    //Dev. Compra
  Begin
    with Cliente1 do
    Begin
      if (Entidade.ClienteCNC <> CodigoCNC) or
         (Entidade.CodigoCLI  <> CodigoCLI) then
      Begin
        Close;
        ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
        ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
        Open;
      end;
      Entidade.FieldByName('Cliente').asString := RazaoSocial + '(CLI:'+IntToStr(Entidade.CodigoCLI)+')';
    end;
  end
  else if (Entidade.TipoNota = 369) then //Conhecimento
  Begin
    with Transportadora1 do
    Begin
      if Entidade.CodigoCLI <> CodigoTRN then //O Código da TRN é salvo no Campo Cliente
      Begin
        Close;
        ParamByName('TRN_CODIGO').asInteger := Entidade.CodigoCLI;
        Open;
      end;
      Entidade.FieldByName('Cliente').asString := RazaoSocial + '(TRN:'+IntToStr(Entidade.CodigoCLI)+')';
    end;
  end
  else //Compra ou Dev. Compra ou Aquisição
  Begin
    with Fornecedor1 do
    Begin
      if (Entidade.TipoNota = 360) then //Compra
      Begin
        if Entidade.CodigoFOR <> CodigoFOR then
        Begin
          Close;
          ParamByName('FOR_CODIGO').asInteger := Entidade.CodigoFOR;
          Open;
        end;
      end
      else
      Begin
        if Entidade.CodigoCLI <> CodigoFOR then
        Begin
          Close;
          ParamByName('FOR_CODIGO').asInteger := Entidade.CodigoCLI;
          Open;
        end;
      end;
      Entidade.FieldByName('Cliente').asString := RazaoSocial + '(FOR:'+IntToStr(Entidade.CodigoCLI)+')';
    end;
  end;

  with Funcionario1 do
  Begin
    if (Entidade.CodigoCNC <> CodigoCNC) or
       (Entidade.CodigoFUN <> CodigoFUN) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
      ParamByName('FUN_CODIGO').asInteger := Entidade.CodigoFUN;
      Open;
    end;
    Entidade.FieldByName('Vendedor').asString := NomeFun;
  end;
  with OperFiscal1 do
  Begin
    if Entidade.CFOP <> CodigoOPF then
    Begin
      Close;
      ParamByName('CFOP').asInteger := Entidade.CFOP;
      Open;
    end;
    Entidade.FieldByName('Operacao').asString := Descricao;
  end;

  Entidade.FieldByName('Tipo').asString := DM.SelecionaParametro(Entidade.TipoNota);

  Case Entidade.EntradaSaida of
    0: Entidade.FieldByName('EntraSai').asString:='Entrada';
    1: Entidade.FieldByName('EntraSai').asString:='Saída';
    else
      Entidade.FieldByName('EntraSai').asString:='';
  end;
  Case Entidade.Situacao of
    0: Entidade.FieldByName('Situacao').asString:='Criada';
    1: Entidade.FieldByName('Situacao').asString:='Cancelada';
    2: Entidade.FieldByName('Situacao').asString:='Impressa';
    3: Entidade.FieldByName('Situacao').asString:='Cancelada';
    else
      Entidade.FieldByName('Situacao').asString:='';
  end;
end;

procedure TfMxLocalizaNotaCupom.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Trans:Boolean;
  CdPDVCNC,CdPDV,CdCNC, CdFUN, CdCNCOrigem, CdNTF, iNotaAntiga, CdTRO, CentroLocal, iSelo,
    iNotaFiscal, iConhecimento: integer;
  vDtEmissao: TDateTime;
  FiltrarCentro: string;
begin
  if Entidade.IsEmpty then
    Exit;

  if Key = VK_F3 then
  begin
    SB_LocClick(SB_Loc);
    exit;
  end;

  CdCNC       := Entidade.CodigoCNC;
  CdCNCOrigem := Entidade.CNCOrigem;
  CdNTF       := Entidade.CodigoNTF;
  CdPDVCNC    := Entidade.PedidoCNC;
  CdPDV       := Entidade.Pedido;
  CdTRO       := Entidade.CodigoTRO;
  iNotaAntiga := Entidade.NotaFiscal;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUN := DM.Configuracao1.CodigoCNC
  else
    CdFUN := 0;

  if DM.Configuracao1.Empresa <> empLBM then
    FiltrarCentro := ' AND CNC_CODIGO='+IntToStr(CdPDVCNC)
  else
    FiltrarCentro := '';

  //Alterar dados da Nota
  if Key = VK_F11 then
  Begin
    if (DM.Usuario1.Permissoes.IndexOf(IntToStr(6500)) < 0) then
    Begin
      ShowMessage('Usuário não tem permissão para alterar o Número/Selo/Emissão de uma Nota!');
      Exit;
    end;
    if Entidade.CNCOrigem <> DM.Configuracao1.CodigoCNC then
      Raise Exception.Create('Centro de Custo diferente da Emissão da Nota!');

    iSelo         := -1;
    iNotaFiscal   := -1;
    iConhecimento := -1;
    vDtEmissao    := 0;
    If MessageDlg('Atenção!!!'+#13+
                  'Deseja Alterar o Número da Nota?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      iNotaFiscal := StrToInt(InputBox('Alterar Número', 'Nota Fiscal:', IntToStr(Entidade.NotaFiscal)));
    If MessageDlg('Atenção!!!'+#13+
                  'Deseja Alterar o Selo da Nota?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      iSelo := StrToInt(InputBox('Alterar Selo', 'Selo Fiscal:', IntToStr(Entidade.Selo)));
    If MessageDlg('Atenção!!!'+#13+
                  'Deseja Alterar o Conhecimento da Nota?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      iConhecimento := StrToInt(InputBox('Alterar Conhecimento', 'Conhecimento:', IntToStr(Entidade.Conhecimento)));
    If MessageDlg('Atenção!!!'+#13+
                  'Deseja Alterar a data de Emissão da Nota?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      vDtEmissao := StrToDate(InputBox('Alterar Data Emissão', 'Data de Emissão:', DateToStr(Entidade.DataEmissao)));

    if (iSelo = -1) and
       (iNotaFiscal = -1) and //Não tem nada a ver com LJ3
       (iConhecimento = -1) and
       (vDtEmissao = 0) then
      Exit;

    if iSelo = -1 then
      iSelo := Entidade.Selo;
    if iNotaFiscal = -1 then
      iNotaFiscal := Entidade.NotaFiscal;
    if iConhecimento = -1 then
      iConhecimento := Entidade.Conhecimento;
    if vDtEmissao = 0 then
      vDtEmissao := Entidade.DataEmissao;

    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;
        ExecutaSQL(DM.QR_Comandos,'UPDATE NOTA_FISCAL SET '+
          ' NTF_SELO='+IntToStr(iSelo)+
          ',NTF_NOTA_FISCAL='+IntToStr(iNotaFiscal)+
          ',NTF_CONHECIMENTO='+IntToStr(iConhecimento)+
          ',NTF_DT_EMISSAO="'+MesDia(vDtEmissao)+'" '+
          ',NTF_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'"'+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND CNC_ORIGEM='+IntToStr(CdCNCOrigem)+
          ' AND NTF_CODIGO='+IntToStr(CdNTF));

        if not Entidade.Avulsa then
        Begin
          if ((Entidade.TipoNota = 361) or
             ((Entidade.TipoNota = 364) and //Simples Remessa (Pacote)
                ((Entidade.CFOP = 5117) or
                 (Entidade.CFOP = 6117)))) then
          Begin
            with DM.QR_Consultas do
            Begin
              Close;
              SQL.Text := 'SELECT CNC_FATURAMENTO_PENDENTE,FPE_CODIGO '+
                ' FROM PEDIDO_DE_VENDA '+
                ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
                ' AND PDV_CODIGO='+IntToStr(CdPDV);
              Open;
              if FieldByname('FPE_CODIGO').asInteger > 0 then
                ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
                  ' PDV_NOTA_FISCAL='+IntToStr(iNotaFiscal)+
                  ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE CNC_FATURAMENTO_PENDENTE='+IntToStr(FieldByname('CNC_FATURAMENTO_PENDENTE').asInteger)+
                  ' AND FPE_CODIGO='+IntToStr(FieldByname('FPE_CODIGO').asInteger))
              else
                ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
                  ' PDV_NOTA_FISCAL='+IntToStr(iNotaFiscal)+
                  ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
                  ' AND PDV_CODIGO='+IntToStr(CdPDV));
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_NUMERO="'+IntToStr(iNotaFiscal)+'" '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
              ' AND TRC_NUMERO="'+IntToStr(iNotaAntiga)+'" '+
              FiltrarCentro);
          end
          else if (Entidade.TipoNota = 460) then //Pacote Mãe
            ExecutaSQL(DM.QR_Comandos,'UPDATE PACOTE_DE_VENDA SET '+
              ' PCT_NOTA_FISCAL='+IntToStr(iNotaFiscal)+
              ',PCT_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV))
          else if (Entidade.TipoNota = 362) and (CdTRO > 0) then //Devolução Parcial
            ExecutaSQL(DM.QR_Comandos,'UPDATE TROCA SET '+
              ' TRO_NOTA_FISCAL='+IntToStr(iNotaFiscal)+
              ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
              ' AND TRO_CODIGO='+IntToStr(CdTRO))
          else if Entidade.TipoNota = 365 then                  //Transferência
          Begin
            ExecutaSQL(DM.QR_Comandos,'UPDATE TRANSFERENCIA SET '+
              ' TRF_NOTA_FISCAL='+IntToStr(iNotaFiscal)+
              ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
              ' AND TRF_CODIGO='+IntToStr(CdPDV));

            //Alterar Pre-Recebimento
            ExecutaSQL(DM.QR_Comandos,'UPDATE PRE_RECEBIMENTO SET '+
              ' PRC_NOTA_FISCAL='+IntToStr(iNotaFiscal)+
              ' WHERE PRC_CNC_ORIGEM='+IntToStr(CdPDVCNC)+
              ' AND PRC_COD_ORIGEM='+IntToStr(CdPDV)+
              ' AND PRC_TIPO=0 '); //Transferência
          end
          else if Entidade.TipoNota = 360 then                  //Compra
          Begin
            ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_COMPRA SET '+
              ' PCP_NOTA_FISCAL='+IntToStr(iNotaFiscal)+
              ',PCP_SELO='+IntToStr(iSelo)+
              ',PCP_CONHECIMENTO='+IntToStr(iConhecimento)+
              ',PCP_DT_EMISSAO="'+MesDia(vDtEmissao)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
              ' AND PCP_CODIGO='+IntToStr(CdPDV));

            //Alterar Pre-Recebimento
            ExecutaSQL(DM.QR_Comandos,'UPDATE PRE_RECEBIMENTO SET '+
              ' PRC_NOTA_FISCAL='+IntToStr(iNotaFiscal)+
              ' WHERE PRC_CNC_ORIGEM='+IntToStr(CdPDVCNC)+
              ' AND PRC_COD_ORIGEM='+IntToStr(CdPDV)+
              ' AND PRC_TIPO=2 '); //Compra
          end;
        end;

        if not DM.Usuario1.GeraLog(6500, CdCNC, iNotaAntiga,
           'Nota:'+IntToStr(iNotaFiscal)+
           ' Selo:'+IntToStr(iSelo)+
           ' Conhecimento:'+IntToStr(iConhecimento)+
           ' DataEmissao:'+DateToStr(vDtEmissao)+
           ' Tipo:'+IntToStr(Entidade.TipoNota)) then
        Begin
          ShowMessage('Falha ao gerar LOG!');
          Raise exception.Create('');
        end;

        If DM.Configuracao1.ControleTransacao then
          Commit;
        ShowMessage('Número/Selo/Conhecimento/Emissão Alterado(s)!');
      except
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        If DM.Configuracao1.ControleTransacao then
          if trans then
            RollBack;
        exit;
      end;
      if edtLocalizar.Text<>'' then
        SB_LocClick(sender);
    end;
  end;
  DM.Configuracao1.Close;
  DM.Configuracao1.Open;
  DM.Log1.Open;
end;

procedure TfMxLocalizaNotaCupom.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxLocalizaNotaCupom.ImprimirEspelho1Click(Sender: TObject);
var
  CdCNC, iNota, CdCNCCLI, CdCLI: integer;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione a Nota!');
  if Entidade.NotaCupom = 2 then
    Raise exception.Create('Não é possível re-imprimir Cupom!');
  if Entidade.Situacao = 0 then
    Raise exception.Create('A nota ainda não foi impressa!');
  if Entidade.Situacao = 3 then
    Raise exception.Create('A nota foi cancelada!');

  CdCNC := Entidade.CodigoCNC;
  iNota := Entidade.NotaFiscal;
  CdCNCCLI := Entidade.ClienteCNC;
  CdCLI    := Entidade.CodigoCLI;

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(7890)) < 0) then
  Begin
    ShowMessage('Usuário não tem permissão para Imprimir Espelho de Nota Fiscal!');
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=40;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      Begin
        if (Usuario1.Permissoes.IndexOf(IntToStr(7890)) < 0)then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão Imprimir Espelho de Nota Fiscal!');
        end
        else
          DM.Usuario1.GeraLog(7890, CdCNC, iNota,
            'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
            ' CLI:'+PreencheZero(2,CdCNCCLI)+'-'+IntToStr(CdCLI));
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end
  else
    DM.Usuario1.GeraLog(7890, CdCNC, iNota,
      ' CLI:'+PreencheZero(2,CdCNCCLI)+'-'+IntToStr(CdCLI));

  if DM.Configuracao1.Empresa in [empEletro,empCreator,empAndrea,empHOPE] then // Nota Eletro Guerra / Creator
  Begin
    Application.CreateForm(Trpt_NotaFiscalEletro, rpt_NotaFiscalEletro);
    with rpt_NotaFiscalEletro do
    Begin
      tag := 10;
      Desc1:=0;
      if fMxLocalizaNotaCupom.Entidade.CodPagamento <> 2 then //Diferente de A Vista
        VendaPrazo := True;      
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.SQL.Text := 'SELECT * '+
        ' FROM NOTA_FISCAL T1, ITEM_DE_NOTA_FISCAL T2 '+
        ' WHERE T1.CNC_CODIGO='+IntToStr(fMxLocalizaNotaCupom.Entidade.CodigoCNC)+
        ' AND T1.CNC_ORIGEM='+IntToStr(fMxLocalizaNotaCupom.Entidade.CNCOrigem)+
        ' AND T1.NTF_CODIGO='+IntToStr(fMxLocalizaNotaCupom.Entidade.CodigoNTF)+
        ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
        ' AND T1.CNC_ORIGEM=T2.CNC_ORIGEM '+
        ' AND T1.NTF_CODIGO=T2.NTF_CODIGO '+
        ' ORDER BY T2.INF_SERVICO ASC ';
      Item_Nota_Fiscal10.Open;
      report.Preview;
      Close;
    end;
  end
  else if DM.Configuracao1.Empresa = empPetromax then // Nota Petromax
  Begin
    Application.CreateForm(Trpt_NotaFiscalPetromax, rpt_NotaFiscalPetromax);
    with rpt_NotaFiscalPetromax do
    Begin
      tag := 10;
      Desc1:=0;
      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.SQL.Text := 'SELECT * '+
        ' FROM NOTA_FISCAL T1, ITEM_DE_NOTA_FISCAL T2 '+
        ' WHERE T1.CNC_CODIGO='+IntToStr(fMxLocalizaNotaCupom.Entidade.CodigoCNC)+
        ' AND T1.CNC_ORIGEM='+IntToStr(fMxLocalizaNotaCupom.Entidade.CNCOrigem)+
        ' AND T1.NTF_CODIGO='+IntToStr(fMxLocalizaNotaCupom.Entidade.CodigoNTF)+
        ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
        ' AND T1.CNC_ORIGEM=T2.CNC_ORIGEM '+
        ' AND T1.NTF_CODIGO=T2.NTF_CODIGO '+
        ' ORDER BY T2.INF_SERVICO ASC ';
      Item_Nota_Fiscal10.Open;
      report.Preview;
      Close;
    end;
  end
  else if DM.Configuracao1.Empresa = empLBM then //Nota LBM
  Begin
    Application.CreateForm(Trpt_NotaFiscalLBM, rpt_NotaFiscalLBM);
    with rpt_NotaFiscalLBM do
    Begin
      tag := 10;
      Desc1:=0;
      if fMxLocalizaNotaCupom.Entidade.CodPagamento <> 2 then //Diferente de A Vista
        VendaPrazo := True;

      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.SQL.Text := 'SELECT * '+
        ' FROM NOTA_FISCAL T1, ITEM_DE_NOTA_FISCAL T2 '+
        ' WHERE T1.CNC_CODIGO='+IntToStr(fMxLocalizaNotaCupom.Entidade.CodigoCNC)+
        ' AND T1.CNC_ORIGEM='+IntToStr(fMxLocalizaNotaCupom.Entidade.CNCOrigem)+
        ' AND T1.NTF_CODIGO='+IntToStr(fMxLocalizaNotaCupom.Entidade.CodigoNTF)+
        ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
        ' AND T1.CNC_ORIGEM=T2.CNC_ORIGEM '+
        ' AND T1.NTF_CODIGO=T2.NTF_CODIGO '+
        ' ORDER BY T2.INF_SERVICO ASC ';
      Item_Nota_Fiscal10.Open;

      //Serviço
      zrlNumeroInscricao.Caption := '';
      zrlTotalServico.Caption    := format('%.2f',[fMxLocalizaNotaCupom.Entidade.TotalServico]);
      zrlBaseISS.Caption         := format('%.2f',[fMxLocalizaNotaCupom.Entidade.BaseISS]);
      if fMxLocalizaNotaCupom.Entidade.ISS > 0 then
        zrlALiquotaISS.Caption     := '5,00'
      else
        zrlALiquotaISS.Caption     := '0,00';
      zrlISS.Caption             := format('%.2f',[fMxLocalizaNotaCupom.Entidade.ISS]);

      report.Preview;
    end;
    Close;
  end
  else if DM.Configuracao1.Empresa = empMotical then
  Begin
    Application.CreateForm(Trpt_NotaFiscalMotCal, rpt_NotaFiscalMotCal);
    with rpt_NotaFiscalMotCal do
    Begin
      tag := 11;
      if fMxLocalizaNotaCupom.Entidade.CodPagamento <> 2 then //Diferente de A Vista
        VendaPrazo := True;

      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.SQL.Text := 'SELECT '+
        ' T2.CNC_ORIGEM, T2.CNC_CODIGO, T2.NTF_CODIGO, '+
        ' S1.SGP_DESCRICAO AS INF_SERVICO, '+
        ' S1.SGP_CODIGO AS PRD_CODIGO, '+
        ' MAX(T2.INF_PRECO-T2.INF_DESCONTO) AS INF_PRECO, '+
        ' SUM(T2.INF_QUANTIDADE) AS INF_QUANTIDADE, '+
        ' MAX(T2.INF_ALIQUOTA) AS INF_ALIQUOTA, '+
        ' 0 AS INF_DESCONTO '+
        ' FROM ITEM_DE_NOTA_FISCAL T2, PRODUTO P1, SUBGRUPO S1 '+
        ' WHERE T2.CNC_CODIGO='+IntToStr(fMxLocalizaNotaCupom.Entidade.CodigoCNC)+
        ' AND T2.CNC_ORIGEM='+IntToStr(fMxLocalizaNotaCupom.Entidade.CNCOrigem)+
        ' AND T2.NTF_CODIGO='+IntToStr(fMxLocalizaNotaCupom.Entidade.CodigoNTF)+
        ' AND P1.PRD_CODIGO=T2.PRD_CODIGO '+
        ' AND P1.SGP_CODIGO=S1.SGP_CODIGO '+
        ' GROUP BY T2.CNC_ORIGEM, T2.CNC_CODIGO, T2.NTF_CODIGO, P1.PRD_SERVICO, S1.SGP_DESCRICAO,S1.SGP_CODIGO '+
        ' ORDER BY T2.NTF_CODIGO ASC, P1.PRD_SERVICO ASC, S1.SGP_DESCRICAO ASC ';
      Item_Nota_Fiscal10.Open;

      report.Preview;
    end;
    rpt_NotaFiscalMotCal.Close;
  end
  else //if DM.Configuracao1.Empresa = empLuciano then
  Begin
    Application.CreateForm(Trpt_NotaFiscalLuciano, rpt_NotaFiscalLuciano);
    with rpt_NotaFiscalLuciano do
    Begin
      tag := 11;
      if fMxLocalizaNotaCupom.Entidade.CodPagamento <> 2 then //Diferente de A Vista
        VendaPrazo := True;

      Item_Nota_Fiscal10.Close;
      Item_Nota_Fiscal10.SQL.Text := 'SELECT * '+
        ' FROM NOTA_FISCAL T1, ITEM_DE_NOTA_FISCAL T2 '+
        ' WHERE T1.CNC_CODIGO='+IntToStr(fMxLocalizaNotaCupom.Entidade.CodigoCNC)+
        ' AND T1.CNC_ORIGEM='+IntToStr(fMxLocalizaNotaCupom.Entidade.CNCOrigem)+
        ' AND T1.NTF_CODIGO='+IntToStr(fMxLocalizaNotaCupom.Entidade.CodigoNTF)+
        ' AND T1.CNC_CODIGO=T2.CNC_CODIGO '+
        ' AND T1.CNC_ORIGEM=T2.CNC_ORIGEM '+
        ' AND T1.NTF_CODIGO=T2.NTF_CODIGO '+
        ' ORDER BY T2.INF_SERVICO ASC ';
      Item_Nota_Fiscal10.Open;

      report.Preview;
    end;
    rpt_NotaFiscalLuciano.Close;
  end;
  //else
    //Raise Exception.Create('Empresa sem Nota Cadastrada, ou máquina desconfigurada!');
end;

procedure TfMxLocalizaNotaCupom.SB_CancelarClick(Sender: TObject);
var
  Trans:Boolean;
  CdPDVCNC,CdPDV,CdCNC, CdFUN, CdCNCOrigem, CdNTF, iNotaAntiga,
  CdTRO, CentroLocal: integer;
  FiltrarCentro: string;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione a Nota!');

  CdCNC       := Entidade.CodigoCNC;
  CdCNCOrigem := Entidade.CNCOrigem;
  CdNTF       := Entidade.CodigoNTF;
  CdPDVCNC    := Entidade.PedidoCNC;
  CdPDV       := Entidade.Pedido;
  CdTRO       := Entidade.CodigoTRO;
  iNotaAntiga := Entidade.NotaFiscal;

  if DM.Configuracao1.Empresa in TEmpresasEstFUN then
    CdFUN := DM.Configuracao1.CodigoCNC
  else
    CdFUN := 0;

  if DM.Configuracao1.Empresa <> empLBM then
    FiltrarCentro := ' AND CNC_CODIGO='+IntToStr(CdPDVCNC)
  else
    FiltrarCentro := '';


  if Entidade.Situacao = 3 then
     Raise exception.Create('Nota já cancelada!');
  if Entidade.Situacao = 0 then
     Raise exception.Create('Nota NÃO confirmada!');

  CentroLocal := DM.Configuracao1.CodigoCNC;
  if Entidade.CNCOrigem <> CentroLocal then
    Raise Exception.Create('Centro de Custo diferente da Emissão da Nota!');

  If MessageDlg('Atenção!!!'+#13+'Deseja Cancelar a Nota/Cupom?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6170)) < 0) then
  Begin
    ShowMessage('Usuário não tem permissão para Cancelar Nota!');
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=40;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      Begin
        if (Usuario1.Permissoes.IndexOf(IntToStr(6170)) < 0)then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão Cancelar Nota!');
        end
        else
          DM.Usuario1.GeraLog(6170, CdCNC, iNotaAntiga,
            'AUTORIZADO: '+IntToStr(Usuario1.CodigoCNC)+'-'+IntToStr(Usuario1.CodigoUSU)+
            ' PDV:'+PreencheZero(2,CdPDVCNC)+'-'+IntToStr(CdPDV));
      end
      else
      begin
        free;
        exit;
      end;
      free;
    End;
  end
  else
    DM.Usuario1.GeraLog(6170, CdCNC, iNotaAntiga,
      ' PDV:'+PreencheZero(2,CdPDVCNC)+'-'+IntToStr(CdPDV));

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //Gerar Movimento de Estoque Fiscal
      if (Entidade.TipoNota <> 368) and //Serviço
         (Entidade.TipoNota <> 460) and //Pacote MAE
         (Entidade.TipoNota <> 363) and //Correção de Nota
         ((Entidade.TipoNota <> 364) or //Simples Remessa
          (Entidade.CFOP = 5117) or
          (Entidade.CFOP = 6117)) then
      Begin
        with Item_Nota_Fiscal1 do
        Begin
          Close;
          Item_Nota_Fiscal1.ParamByName('CNC_CODIGO').asInteger := CdCNC;
          Item_Nota_Fiscal1.ParamByName('CNC_ORIGEM').asInteger := CdCNCOrigem;
          Item_Nota_Fiscal1.ParamByName('NTF_CODIGO').asInteger := CdNTF;
          Open;
          First;
          while not EOF do
          Begin
            with Item_de_Estoque1 do
            Begin
              Close;
              ParamByName('CNC_CODIGO').asInteger := CentroLocal;
              ParamByName('PRD_CODIGO').asInteger := Item_Nota_Fiscal1.CodigoPRD;
              ParamByName('FUN_CODIGO').asInteger := CdFUN;
              Open;
              if IsEmpty then
              Begin
                ShowMessage('Produto sem item de estoque!');
                Raise exception.Create('');
              end;
            end;
            if Entidade.EntradaSaida = 0 then //Notas de Entrada
            Begin
              if not DM.Mov_Est_Fiscal1.Inserir(CentroLocal, CodigoPRD,CdFUN,0,
                CodigoCNC, CodigoNTF, Entidade.TipoNota, 'S', Quantidade,
                Item_de_Estoque1.SFiscal,
                Item_de_Estoque1.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque1.SBonificacaoFiscal, 0(*BonusFiscal*),
                'NOTA/CUPOM CANCELADA') then
              Begin
                ShowMessage('Falha ao inserir Movimento Fiscal!');
                Raise  exception.Create('');
              end;
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SFISCAL=IES_SFISCAL-'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CentroLocal)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));                  
            end
            //Diferente de Simples Remessa e Correção de Nota
            else if (CodigoPRD > 0) and
                    (Entidade.TipoNota <> 364) and
                    (Entidade.TipoNota <> 363) then
            Begin
              if (Entidade.TipoNota = 361) then //Venda
              Begin
                // Tipo de Entrada 12: Mov. de Entrada Fiscal; Tipo de Movimento 98: Cancelamento Nota/Cupom
                if not DM.Mov_Est_Fiscal1.Inserir(CentroLocal,CodigoPRD,CdFUN,0,
                   CodigoCNC,CodigoNTF,98,'E', Quantidade,
                   Item_de_Estoque1.SFiscal,
                   Item_de_Estoque1.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque1.SBonificacaoFiscal, 0(*BonusFiscal*),
                   'NOTA/CUPOM CANCELADA') then
                Begin
                  ShowMessage('Falha ao inserir Movimento Fiscal!');
                  Raise  exception.Create('');
                end;
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CentroLocal)+
                  ' AND FUN_CODIGO='+IntToStr(CdFUN));                    
              end
              else
              Begin
                if not DM.Mov_Est_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC,CodigoPRD,CdFUN,0,
                  CodigoCNC,CodigoNTF,Entidade.TipoNota, 'E',Quantidade,
                  Item_de_Estoque1.SFiscal,
                  Item_de_Estoque1.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque1.SBonificacaoFiscal, 0(*BonusFiscal*),
                  'NOTA/CUPOM CANCELADA') then
                Begin
                  ShowMessage('Falha ao inserir Movimento Fiscal!');
                  Raise  exception.Create('');
                end;

                //Se for Devolução de Compra gerar Mov. (Comercial e Física) ou SN
                if (Entidade.CFOP = 5202) or
                   (Entidade.CFOP = 6202) then
                Begin
                  //Movimento Comercial
                  if not DM.Movimento_Estoque_Comercial1.Inserir(CentroLocal,0,CodigoPRD,CdFUN,
                    Entidade.TipoNota,CodigoCNC,CodigoNTF, 'E',Quantidade,
                    Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                    Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
                    'NOTA/CUPOM CANCELADA') then
                  Begin
                    ShowMessage('Falha ao gerar Mov. Estoque Comercial!');
                    raise exception.Create('');
                  end;
                  //Movimento Físico
                  if not DM.Movimento_Fisico1.Inserir(CentroLocal,0,CodigoPRD,CdFUN,
                    CodigoCNC,CodigoNTF,Entidade.TipoNota,
                    'E',Quantidade, Item_de_Estoque1.SFisico,'NOTA/CUPOM CANCELADA') then
                  Begin
                    ShowMessage('Falha ao gerar Mov. Estoque Físico!');
                    raise exception.Create('');
                  end;
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                      ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                      ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                      ',IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                      ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                      ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                      ' AND CNC_CODIGO='+IntToStr(CentroLocal)+
                      ' AND FUN_CODIGO='+IntToStr(CdFUN));                        
                end
                else
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                    ' IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                    ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(CentroLocal)+
                    ' AND FUN_CODIGO='+IntToStr(CdFUN));
              end;
            end;
            Next;
          end;
        end;
      end;

      ExecutaSQL(DM.QR_Comandos,'UPDATE NOTA_FISCAL SET '+
        ' NTF_SITUACAO=3 '+ //Nota Cancelada
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND CNC_ORIGEM='+IntToStr(CdCNCOrigem)+
        ' AND NTF_CODIGO='+IntToStr(CdNTF));

      //Venda
      if Entidade.TipoNota = 361 then
      Begin
        if (DM.Configuracao1.Empresa <> empEletro) or
           (Entidade.Mafalda = 1) or
           (DM.Configuracao1.CodigoCNC <> 10) then //Diferente do Depósito
        Begin
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT CNC_FATURAMENTO_PENDENTE,FPE_CODIGO '+
              ' FROM PEDIDO_DE_VENDA '+
              ' WHERE CNC_CODIGO='+IntToStr(Entidade.PedidoCNC)+
              ' AND PDV_CODIGO='+IntToStr(Entidade.Pedido);
            Open;
            if FieldByname('FPE_CODIGO').asInteger > 0 then
              ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
                ' PDV_LISTADO=0 '+
                ',PDV_NOTA_FISCAL=0 '+
                ',PDV_NOTA_CUPOM=0 '+
                ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_FATURAMENTO_PENDENTE='+IntToStr(FieldByname('CNC_FATURAMENTO_PENDENTE').asInteger)+
                ' AND FPE_CODIGO='+IntToStr(FieldByname('FPE_CODIGO').asInteger))
            else
              ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
                ' PDV_LISTADO=0 '+
                ',PDV_NOTA_FISCAL=0 '+
                ',PDV_NOTA_CUPOM=0 '+
                ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
                ' AND PDV_CODIGO='+IntToStr(CdPDV));
          end;

          // Voltar o Título Colocando o Número do Pedido
          if DM.Configuracao1.Empresa = empLBM then
            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_NUMERO="'+IntToStr(CdPDV)+'" '+
              ',TRC_NOTA_SERVICO=0 '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+FiltrarCentro)
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_NUMERO="" '+
              ',TRC_NOTA_SERVICO=0 '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+FiltrarCentro);
        end
        else //Somente Depósito (Emite nota de venda para transferência)
          ExecutaSQL(DM.QR_Comandos,'UPDATE TRANSFERENCIA SET '+
            ' TRF_NOTA_FISCAL=0 '+
            ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
            ' AND TRF_CODIGO='+IntToStr(CdPDV));
      end
      //Devolução Parcial
      else if (Entidade.TipoNota = 362) and (CdTRO > 0) then
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE TROCA SET '+
          ' TRO_NOTA_FISCAL=0 '+
          ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
          ' AND TRO_CODIGO='+IntToStr(CdTRO));
      end
      else if Entidade.TipoNota = 365 then
        ExecutaSQL(DM.QR_Comandos,'UPDATE TRANSFERENCIA SET '+
          ' TRF_NOTA_FISCAL=0 '+
          ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
          ' AND TRF_CODIGO='+IntToStr(CdPDV));

      if not DM.Usuario1.GeraLog(6170, CdCNC, iNotaAntiga, 'NTF:'+IntToStr(CdNTF)) then
      Begin
        ShowMessage('Falha ao gerar LOG!');
        Raise exception.Create('');
      end;

      If DM.Configuracao1.ControleTransacao then
        if trans then
          Commit;
      ShowMessage('Nota Cancelada!');
      self.Close;
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
        end;
    end;
  end;
end;

end.
