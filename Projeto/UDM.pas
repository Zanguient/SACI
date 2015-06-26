unit UDM;
               
interface                        
                    
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBTables, Db, SQuery, Cliente, Avalista, Agencia, Transportadora,
  Funcionario, Fornecedor, Contato, Conta, Banco, Vendedor, Secao, RegProc,
  Configuracao, funcoes, Permissao, Usuario, Log, CentroCusto, MMSystem,
  Mensagem, Tarefa, ImgList, Titulo_receber, Movimento_Estoque_Comercial,
  Movimento_caixa, Movimento_Fisico, Mov_Est_Fiscal, Item_de_Embarque,
  Produto, Descontos, Classificacao_fiscal, AgenteFin, Caixa,
  Movimento_Estoque_SN, Parametro, Conta_de_Caixa, Grau, Item_Pedido_Venda,
  NotaFiscal, Movimento_de_Credito, Indexador_Economico, Baixa_Titulo,
  Movimento_de_Cheque, Registro_Deletado, Extenso, Forma_de_Pagamento,
  Cod_Barr, Movimento_Estoque_LJ4, Item_de_Estoque_Detalhe{, ImpFiscB};

type
  TDM = class(TDataModule)
    Configuracao1: TConfiguracao;
    DSConfiguracao1: TDataSource;
    Usuario1: TUsuario;
    Permissao1: TPermissao;
    DSUsuario: TDataSource;
    Database2: TDatabase;
    Log1: TLog;
    CentroCusto1: TCentroCusto;
    qr_consultas2: TQuery;
    QR_Comandos: TQuery;
    QR_Consultas: TQuery;
    tmrMensagem: TTimer;
    Mensagem1: TMensagem;
    DatabaseCEP: TDatabase;
    Tarefa1: TTarefa;
    ImageList1: TImageList;
    Movimento_caixa1: TMovimento_caixa;
    Movimento_Estoque_Comercial1: TMovimento_Estoque_Comercial;
    Movimento_Fisico1: TMovimento_Fisico;
    Mov_Est_Fiscal1: TMov_Est_Fiscal;
    Item_de_Embarque1: TItem_de_Embarque;
    Avalista1: TAvalista;
    Produto1: TProduto;
    Produto1PRD_CODIGO: TIntegerField;
    Produto1CNC_CODIGO: TIntegerField;
    Produto1FOR_CODIGO: TIntegerField;
    Produto1CTP_CODIGO: TIntegerField;
    Produto1SGP_CODIGO: TIntegerField;
    Produto1GRP_CODIGO: TIntegerField;
    Produto1CLF_CODIGO: TIntegerField;
    Produto1ORF_CODIGO: TIntegerField;
    Produto1PRD_DESCRICAO: TStringField;
    Produto1PRD_UNIDADE: TStringField;
    Produto1PRD_MARCA: TStringField;
    Produto1PRD_PRECO_COMPRA: TFloatField;
    Produto1PRD_REFERENCIA: TStringField;
    Produto1PRD_DT_ULT_COMPRA: TDateTimeField;
    Produto1PRD_CUSTO: TFloatField;
    Produto1PRD_PRECO_MEDIO: TFloatField;
    Produto1PRD_PRECO_VENDA: TFloatField;
    Produto1PRD_EST_MINIMO: TFloatField;
    Produto1PRD_EST_MEDIO: TFloatField;
    Produto1PRD_COMISSAO: TFloatField;
    Produto1PRD_SITUACAO: TIntegerField;
    Produto1USU_CODIGO: TIntegerField;
    Produto1PRD_DT_ALTERADO: TDateTimeField;
    Produto1PRD_LOCAL: TStringField;
    Produto1PRD_DETALHE: TStringField;
    Produto1PRD_DT_CADASTRO: TDateTimeField;
    Produto1Aliquota: TStringField;
    Produto1PRD_CARACTERISTICA: TStringField;
    Produto1PRD_OBSERVACAO: TStringField;
    Produto1PRD_PESO_LIQUIDO: TFloatField;
    Descontos1: TDescontos;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Mensagem3: TMensagem;
    CentroCusto2: TCentroCusto;
    AgenteFin1: TAgenteFin;
    Caixa1: TCaixa;
    Usuario2: TUsuario;
    Movimento_Estoque_SN1: TMovimento_Estoque_SN;
    Cliente1: TCliente;
    DataBase3: TDatabase;
    FortesCliente1: TQuery;
    Parametro1: TParametro;
    Conta_de_Caixa1: TConta_de_Caixa;
    Grau1: TGrau;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    NotaFiscal1: TNotaFiscal;
    Movimento_de_Credito1: TMovimento_de_Credito;
    Indexador_Economico1: TIndexador_Economico;
    Baixa_Titulo1: TBaixa_Titulo;
    Titulo_receber1: TTitulo_receber;
    Movimento_de_Cheque1: TMovimento_de_Cheque;
    Registro_Deletado1: TRegistro_Deletado;
    Extenso1: TValorPorExtenso;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    Codigo_Barras1: TCodigo_Barras;
    Produto1PRD_FORA_TABELA: TIntegerField;
    Produto1PRD_FORA_PREVISAO: TIntegerField;
    Produto1PRD_INSUMO: TIntegerField;
    Produto1PRD_BASE_REAL: TFloatField;
    Produto1PRD_SERVICO: TIntegerField;
    Produto1PRD_TEMPO_MEDIO: TIntegerField;
    Produto1PRD_NIVEL: TIntegerField;
    Produto1PRD_FORA_DE_LINHA: TIntegerField;
    Produto1PRD_CATALOGO: TIntegerField;
    Produto1PRD_PREVISAO: TIntegerField;
    Movimento_Estoque_LJ41: TMovimento_Estoque_LJ4;
    Produto1PRD_CLASSIFICACAO: TIntegerField;
    Produto1PRD_ESTOQUE_DETALHADO: TIntegerField;
    Fornecedor1: TFornecedor;
    CentroCusto3: TCentroCusto;
    Item_de_Estoque_Detalhe1: TItem_de_Estoque_Detalhe;
    Funcionario1: TFuncionario;
    QuerySelect: TQuery;
    QueryExec: TQuery;
    imlCadMenu: TImageList;
    ImageListPDV: TImageList;
    ImageListSER: TImageList;
    procedure DMCreate(Sender: TObject);
    procedure tmrMensagemTimer(Sender: TObject);
    procedure CentroCusto1BeforeOpen(DataSet: TDataSet);
    procedure Produto1CalcFields(DataSet: TDataSet);
    procedure Configuracao1BeforeOpen(DataSet: TDataSet);
    function NomeUsuario(CdUSU: integer):string;
    function SelecionaParametro(CdPAR: integer): string;
    function SelecionaFormaPagamento(CdFPG: integer): string;
    function SelecionaAgenteFinanceiro(CdAGF: integer): string;
    function SelecionaContaDeCaixa(CdCCX: integer): string;
    function SelecionaCentroDeCusto(CdCNC: integer): string;
    function SelecionaFuncionario(CdFUN: integer): string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

Uses cdCliente,cdAvalista,cdContato,cdAgencia,cdTransportador,cdBanco,
     cdConta,cdFornecedor,cdFuncionario,cdSecao,CdRegProcura, DigSenha;

{$R *.DFM}

procedure TDM.DMCreate(Sender: TObject);
Begin
  Application.HelpFile := DM.Configuracao1.PastaSistema+'\AJUDASACI.HLP';

  //Configurações Regionais
  ThousandSeparator:='.';
  DecimalSeparator :=',';
  DateSeparator    :='/';
  ShortDateFormat  :='DD/MM/YYYY';
  TimeSeparator    :=':';
  ShortTimeFormat  :='hh:mm:ss';

  try
    if not Database2.Connected then
      Database2.Connected:=True;
  except
    ShowMessage('Falha no BDE Administrator!');
    Halt;
  end;


  Configuracao1.Open;

  
  if Configuracao1.IsEmpty then
  Begin
    ShowMessage('Não existe registro de Configuração para esse Centro!');
    Raise exception.Create('');
  end;
  Configuracao1.CodigoCNC := DM.Usuario1.CentroDeCusto;
  Configuracao1.CodigoUSU:=UsuLogin;
  CentroCusto1.Open;
  Usuario1.Open;
  Usuario1.LocalizarCod(UsuLogin);
  Usuario1.CarregaPermissoes(UsuLogin);
  (*Anderson Gonçalves 01-05-2010*)
  f_codigoCaixa      := DM.Configuracao1.CodigoCAX;
  f_codigoFechaCaixa := DM.Configuracao1.ContaFechaCaixa;
  f_codigoAbreCaixa  := DM.Configuracao1.ContaAbreCaixa;
  f_DataHora         := DM.Configuracao1.Data;

  try
    QR_Consultas.Close;
    QR_Consultas.SQL.Text := ' SELECT CAX_CODIGO,FUN_CODIGO FROM CAIXA '+
                             ' WHERE CAX_CODIGO ='+IntToStr(f_codigoCaixa);
    QR_Consultas.Open;
    f_codigoUSUCaixa := QR_Consultas.FieldByName('FUN_CODIGO').AsInteger;
  except
  end;
end;

procedure TDM.tmrMensagemTimer(Sender: TObject);
var
  QTD:integer;
begin
  try
    Mensagem1.Close;
    Mensagem1.ParamByName('USU_DESTINO').asInteger := Configuracao1.CodigoUSU;
    Mensagem1.Open;
    if not Mensagem1.IsEmpty then
    Begin
      tmrMensagem.Enabled := False;
      try
        sndPlaySound(PChar(cSomMensagem),SND_ASYNC);
      except
      end;
      QTD:=0;
      while not Mensagem1.Eof do
      Begin
        Inc(QTD);
        Mensagem1.Next;
      end;
      Mensagem1.First;
      if Mensagem1.Urgente then
        ShowMessage('Tem Mensagem pra Você - URGENTE !!! ('+IntToStr(QTD)+') ')
      else
      Begin
        ShowMessage('Tem Mensagem pra Você !!! ('+IntToStr(Mensagem1.RecordCount)+') ');
        ExecutaSQL(DM.QR_Comandos,'UPDATE MENSAGEM SET MSG_ALERTADO = 1, '+
          'MSG_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
          ' WHERE MSG_USU_DESTINO='+IntToStr(Configuracao1.CodigoUSU)+
          ' AND MSG_ALERTADO <> 1 AND MSG_SITUACAO_RECEBER = 0 '+
          ' AND MSG_SITUACAO_ENVIAR = 1');
      end;
    end;
  finally
    Screen.Cursor:=crArrow;
  end;
end;

procedure TDM.CentroCusto1BeforeOpen(DataSet: TDataSet);
begin
  try
    CentroCusto1.ParamByName('CNC_CODIGO').asInteger := Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TDM.Produto1CalcFields(DataSet: TDataSet);
begin
  Classificacao_fiscal1.Close;
  if Produto1.CodigoCLF = 0 then
    Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=1
  else
    Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCLF;
  Classificacao_fiscal1.Open;

  if not Classificacao_fiscal1.IsEmpty then
  begin
    if Classificacao_fiscal1.FieldByname('CLF_CODIGO').asFloat = 5 then       //Substituicao Tributaria
      Produto1.FieldByname('Aliquota').asFloat:=1013
    else if Classificacao_fiscal1.FieldByname('CLF_CODIGO').asFloat = 3 then  //Isento
      Produto1.FieldByname('Aliquota').asFloat:=1014
    else
      Produto1.FieldByname('Aliquota').asFloat:=Classificacao_fiscal1.ICMS
  end
  else
    Produto1.FieldByname('Aliquota').asFloat:=17;
end;

procedure TDM.Configuracao1BeforeOpen(DataSet: TDataSet);
begin
  if (not (Configuracao1.Empresa IN TEmpresasConfiguracaoUnica)) then
  begin
    Configuracao1.SQL.Text := 'SELECT * FROM CONFIGURACAO'+
      ' WHERE CNC_CODIGO='+IntToStr(Usuario1.CentroDeCusto);
  end;
end;

function TDM.NomeUsuario(CdUSU: integer): string;
begin
  Result := '';

  with Usuario2 do
  Begin
    if (not Active) or
       (CodigoUSU <> CdUSU) then
    Begin
      Close;
      ParamByName('USU_CODIGO').asInteger := CdUSU;
      Open;
    end;
    Result := NomeUSU;
  end;
end;

function TDM.SelecionaParametro(CdPAR: integer): string;
begin
  Result := '';

  with Parametro1 do
  Begin
    if (not Active) or
       (CodigoPAR <> CdPAR) then
    Begin
      Close;
      ParamByName('PAR_CODIGO').asInteger := CdPAR;
      Open;
    end;

    Result := Descricao;
  end;
end;

function TDM.SelecionaFormaPagamento(CdFPG: integer): string;
begin
  Result := '';

  with Forma_de_Pagamento1 do
  Begin
    if (not Active) or
       (CodigoFPG <> CdFPG) then
    Begin
      Close;
      ParamByName('FPG_CODIGO').asInteger := CdFPG;
      Open;
    end;
    Result := Descricao;
  end;
end;

function TDM.SelecionaAgenteFinanceiro(CdAGF: integer): string;
begin
  Result := '';

  with AgenteFin1 do
  Begin
    if (not Active) or
       (CodigoAGF <> CdAGF) then
    Begin
      Close;
      ParamByName('AGF_CODIGO').asInteger := CdAGF;
      Open;
    end;
    Result := Descricao;
  end;
end;

function TDM.SelecionaContaDeCaixa(CdCCX: integer): string;
begin
  Result := '';

  with Conta_de_Caixa1 do
  Begin
    if (not Active) or
       (CodigoCCX <> CdCCX) then
    Begin
      Close;
      ParamByName('CCX_CODIGO').asInteger := CdCCX;
      Open;
    end;
    Result := Descricao;
  end;
end;

function TDM.SelecionaCentroDeCusto(CdCNC: integer): string;
begin
  Result := '';

  with CentroCusto3 do
  Begin
    if (not Active) or
       (CodigoCNC <> CdCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := CdCNC;
      Open;
    end;
    Result := RazaoSocial;
  end;
end;

function TDM.SelecionaFuncionario(CdFUN: integer): string;
begin
  Result := '';

  with Funcionario1 do
  Begin
    if (not Active) or
       (CodigoFUN <> CdFUN) then
    Begin
      Close;
      ParamByName('FUN_CODIGO').asInteger := CdFUN;
      Open;
    end;
    Result := Apelido;
  end;
end;

end.
