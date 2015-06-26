unit CdEnviarFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Menus, Variants, Envia_Fornecedor, Cliente, Produto, Fornecedor,
  Pedido_de_Venda, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfCadEnviarFornecedor = class(TForm)
    Panel14: TPanel;
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoENF: TEdit;
    Label2: TLabel;
    Label15: TLabel;
    Panel1: TPanel;
    SB_ExcPed: TSpeedButton;
    SB_AltPed: TSpeedButton;
    SB_NovoPed: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_SalvaPed: TBitBtn;
    SB_CancPed: TBitBtn;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    Label27: TLabel;
    Label6: TLabel;
    cmbSituacao: TComboBox;
    Label12: TLabel;
    DBGrid5: TDBGrid;
    DSEnvia_Fornecedor1: TDataSource;
    SB_LocPed: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Envia_Fornecedor1: TEnvia_Fornecedor;
    Label4: TLabel;
    Label5: TLabel;
    mskDataEnviado: TMaskEdit;
    mskDataRecebido: TMaskEdit;
    edtObservacao: TEdit;
    Label3: TLabel;
    edtCodigoPDV: TEdit;
    Label7: TLabel;
    Label10: TLabel;
    edtCodigoFOR: TEdit;
    edtFornecedor: TEdit;
    edtCliente: TEdit;
    Label8: TLabel;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    Label9: TLabel;
    Label11: TLabel;
    edtPedidoCNC: TEdit;
    Label13: TLabel;
    edtQuantidade: TEdit;
    Panel3: TPanel;
    bitFechar: TBitBtn;
    bitEnviar: TBitBtn;
    Envia_Fornecedor1CNC_ORIGEM: TIntegerField;
    Envia_Fornecedor1CNC_CODIGO: TIntegerField;
    Envia_Fornecedor1ENF_CODIGO: TIntegerField;
    Envia_Fornecedor1USU_CODIGO: TIntegerField;
    Envia_Fornecedor1ENF_DT_CADASTRO: TDateTimeField;
    Envia_Fornecedor1ENF_DT_ALTERADO: TDateTimeField;
    Envia_Fornecedor1ENF_DT_ENVIADO: TDateTimeField;
    Envia_Fornecedor1ENF_DT_RECEBIDO: TDateTimeField;
    Envia_Fornecedor1FOR_CODIGO: TIntegerField;
    Envia_Fornecedor1ENF_CNC_PEDIDO: TIntegerField;
    Envia_Fornecedor1PDV_CODIGO: TIntegerField;
    Envia_Fornecedor1PRD_CODIGO: TIntegerField;
    Envia_Fornecedor1ENF_QUANTIDADE: TFloatField;
    Envia_Fornecedor1ENF_SITUACAO: TIntegerField;
    Envia_Fornecedor1ENF_OBSERVACAO: TStringField;
    Envia_Fornecedor1Fornecedor: TStringField;
    Envia_Fornecedor1Cliente: TStringField;
    Envia_Fornecedor1Produto: TStringField;
    Envia_Fornecedor1Situacao: TStringField;
    Fornecedor1: TFornecedor;
    Produto1: TProduto;
    Cliente1: TCliente;
    Pedido_de_Venda1: TPedido_de_Venda;
    ckbFiltroSituacao: TCheckBox;
    cmbFiltroSituacao: TComboBox;
    ActionManager1: TActionManager;
    Incluir1: TAction;
    Alterar1: TAction;
    Excluir1: TAction;
    Salvar1: TAction;
    Cancelar1: TAction;
    Localizar1: TAction;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_AltPedClick(Sender: TObject);
    procedure SB_ExcPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocPedClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Envia_Fornecedor1AfterScroll(DataSet: TDataSet);
    procedure bitFecharClick(Sender: TObject);
    procedure bitEnviarClick(Sender: TObject);
    procedure Envia_Fornecedor1CalcFields(DataSet: TDataSet);
    procedure edtCodigoFORExit(Sender: TObject);
    procedure edtCodigoPDVExit(Sender: TObject);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure ckbFiltroSituacaoClick(Sender: TObject);
    procedure cmbFiltroSituacaoClick(Sender: TObject);
    procedure Envia_Fornecedor1BeforeOpen(DataSet: TDataSet);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade : TEnvia_Fornecedor;
  end;

var
  fCadEnviarFornecedor: TfCadEnviarFornecedor;

implementation

Uses
  UDM,funcoes, MxSCotaFor, MxSPediProdMotCal, MxSPediProd;

{$R *.DFM}

procedure TfCadEnviarFornecedor.SB_PrimClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfCadEnviarFornecedor.SB_AntClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.Prior;
    If Entidade.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfCadEnviarFornecedor.SB_ProxClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Next;
    If Entidade.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfCadEnviarFornecedor.SB_UltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfCadEnviarFornecedor.SB_NovoPedClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8160)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para inserir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao;
  AtualizaControles(1,True);
  edtCodigoFOR.SetFocus;
end;

procedure TfCadEnviarFornecedor.SB_AltPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8170)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para alterar registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaAlteracao;
  AtualizaControles(1,True);
  edtCodigoFOR.SetFocus;
end;

procedure TfCadEnviarFornecedor.SB_ExcPedClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(8180)) < 0 then
    Raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.Deletarauto;
  if Entidade.IsEmpty then
  Begin
    edtFornecedor.Clear;
    edtCliente.Clear;
    edtProduto.Clear;
  end;
end;

procedure TfCadEnviarFornecedor.SB_SalvaPedClick(Sender: TObject);
begin
  if not Entidade.FinalizaEdicao then
    Exit;
    
  AtualizaControles(1,False);
end;

procedure TfCadEnviarFornecedor.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1,False);
  if Entidade.IsEmpty then
  Begin
    edtFornecedor.Clear;
    edtCliente.Clear;
    edtProduto.Clear;
  end;
  edtLocalizar.SetFocus;
end;

procedure TfCadEnviarFornecedor.FormCreate(Sender: TObject);
begin
  Entidade := Envia_Fornecedor1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_CadEnviaFor_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfCadEnviarFornecedor.SB_LocPedClick(Sender: TObject);
begin
  if Trim(edtLocalizar.Text) = '' then
    Exit;
    
  If cmbCampo.ItemIndex=0 then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Selecionar;
  if Entidade.IsEmpty then
  Begin
    Entidade.LimpaCampos;
    edtFornecedor.Clear;
    edtCliente.Clear;
    edtProduto.Clear;
  end;
end;

procedure TfCadEnviarFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_CadEnviaFor_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfCadEnviarFornecedor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaPed.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadEnviarFornecedor.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  ckbFiltroSituacao.Checked := True;
  cmbCampo.ItemIndex:=1;
  edtLocalizar.SetFocus;
end;

procedure TfCadEnviarFornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  Begin
    key:=chr(0);
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else
      Close;
  end
  else if key = #13 then
  Begin
    key:=chr(0);
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end;
  end
  else if key = #32 then
  Begin
    if edtCodigoFOR.Focused then
    Begin
      key:=chr(0);
      Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
      fMxSCotaFor.Fornecedor1.Close;
      fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      fMxSCotaFor.Fornecedor1.Open;
      fMxSCotaFor.tag:=38;
      fMxSCotaFor.ShowModal;
    end
    else if edtCodigoPRD.Focused then
    Begin
      key:=chr(0);
      if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
      Begin
        Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
        with fMxSPedProdMotcal do
        Begin
          Tag:=63;
          ShowModal;
        end;
      end
      else
      Begin
        Application.CreateForm(TfMxSPedProd, fMxSPedProd);
        with fMxSPedProd do
        Begin
          Tag:=63;
          ShowModal;
        end;
      end;
    end;
  end
  else if key=',' then
    key:='.'
  else if (Key = '"') then
    Key := #0;
end;

procedure TfCadEnviarFornecedor.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  Incluir1.Enabled      := not Habilitar;
  Alterar1.Enabled      := not Habilitar;
  Excluir1.Enabled      := not Habilitar;
  Salvar1.Enabled       := ((Cabecalho=1) and Habilitar);
  Cancelar1.Enabled     := ((Cabecalho=1) and Habilitar);
  Localizar1.Enabled    := not Habilitar;
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoPed.Enabled    := not Habilitar;
  SB_LocPed.Enabled     := not Habilitar;
  SB_AltPed.Enabled     := not Habilitar;
  SB_ExcPed.Enabled     := not Habilitar;
  SB_SalvaPed.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancPed.Enabled    := ((Cabecalho=1) and Habilitar);

  edtLocalizar.Enabled := not Habilitar;
  if Habilitar then
    edtLocalizar.Color := AlteraCorComponentes
  else
    edtLocalizar.Color := clWindow;
  cmbCampo.Enabled     := not Habilitar;
  if Habilitar then
    cmbCampo.Color     :=AlteraCorComponentes
  else
    cmbCampo.Color     :=clWindow;

  DBGrid5.Enabled    := not Habilitar;
end;

procedure TfCadEnviarFornecedor.Envia_Fornecedor1AfterScroll(
  DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtFornecedor.Text := Entidade.FieldByName('Fornecedor').asString;
  edtCliente.Text    := Entidade.FieldByName('Cliente').asString;
  edtProduto.Text    := Entidade.FieldByName('Produto').asString;
end;

procedure TfCadEnviarFornecedor.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadEnviarFornecedor.bitEnviarClick(Sender: TObject);
var
  CdCNC, CdFOR, iItem,CdRepresentante: integer;
  NomeArquivo, Linha, sNomeRepresentante, sCodigosENF, sCodCLIFornecedor: string;
  ConteudoArquivo: TStringList;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione os Itens!');

  if not ckbFiltroSituacao.Checked then
    Raise exception.Create('Filtro somente aguardando Envio!');

  if cmbFiltroSituacao.ItemIndex <> 0 then
    Raise exception.Create('Filtro somente aguardando Envio!');

  If MessageDlg('ATENÇÃO!!!'+#13+
                'Deseja gerar o arquivo com os itens selecionados?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  CdCNC := Entidade.CodigoCNC;
  CdFOR := Entidade.CodigoFOR;

  //Dados da Empresa
  CdRepresentante := 1;
  sNomeRepresentante := 'MOTICAL';


  ConteudoArquivo := TStringList.Create;
  try
    ConteudoArquivo.Text := '';

    //Nome do Arquivo
    NomeArquivo := 'C:\FOR_'+PreencheZero(8,CdFOR)+
                   '_'+FormatDateTime('DDMMYYYY',DM.Configuracao1.Data)+'.txt';

    //Registro Arquivo
    Linha := '0|'+                                      //Identificação do registro - deve ser ( 0 )
             PreencheZero(4,CdRepresentante)+'|'+       //Código do representante - para clientes é o próprio código do cliente na BL
             PreencheEspaco(20,sNomeRepresentante)+'|'+ //Nome do representante - para clientes é o nome abreviado do cliente na BL.
             PreencheZero(3,1)+'|'+                     //Número de pedidos que estão gravados no arquivo.
             PreencheEspaco(20,'SIAC '+IntToStr(DM.Configuracao1.VersaoBase)+'.0')+'|';//Nome do sistema e versão atual que gerou o arquivo.
    ConteudoArquivo.Add(Linha);

    with Entidade do
    Begin
      sCodigosENF := '0';
      First;
      iItem := 1;
      while not Eof do
      Begin
        sCodigosENF := sCodigosENF + ',' + IntToStr(CodigoENF);

        if (not Produto1.Active) or
           (Produto1.CodigoPRD <> CodigoPRD) then
        Begin
          Produto1.Close;
          Produto1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
          Produto1.Open;
        end;

        if (not Pedido_de_Venda1.Active) or
           (Pedido_de_Venda1.CodigoCNC <> PedidoCNC) or
           (Pedido_de_Venda1.CodigoPDV <> CodigoPDV) then
        Begin
          Pedido_de_Venda1.Close;
          Pedido_de_Venda1.ParamByName('CNC_CODIGO').asInteger := PedidoCNC;
          Pedido_de_Venda1.ParamByName('PDV_CODIGO').asInteger := CodigoPDV;
          Pedido_de_Venda1.Open;
        end;
        if (not Cliente1.Active) or
           (Cliente1.CodigoCNC <> Pedido_de_Venda1.FieldByName('CNC_CLIENTE').asInteger) or
           (Cliente1.CodigoCLI <> Pedido_de_Venda1.FieldByName('CLI_CODIGO').asInteger) then
        Begin
          Cliente1.Close;
          Cliente1.ParamByName('CNC_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('CNC_CLIENTE').asInteger;
          Cliente1.ParamByName('CLI_CODIGO').asInteger := Pedido_de_Venda1.FieldByName('CLI_CODIGO').asInteger;
          Cliente1.Open;
        end;
        if Trim(Cliente1.Identificacao) <> '' then
          sCodCLIFornecedor := Cliente1.Identificacao
        else
          sCodCLIFornecedor := '1';

        //Registro Pedido
        Linha := '1|'+                                     //Identificador do Registro
                 PreencheZero(7,0)+'|'+                    //Código do pedido - para clientes observar a seqüência fornecida pela BL.
                 PreencheEspaco(20,sCodCLIFornecedor)+'|'+//Código do cliente no cadastro da BL.
                 PreencheEspaco(12,IntToStr(CodigoPDV))+'|'+//Código do pedido no sistema do cliente - OPCIONAL
                 PreencheEspaco(5,'')+'|'+                 //Código da lista  - para lentes de contato fica branco
                 PreencheEspaco(2,'')+'|'+                 //Código da condição de pagamento -  - para lentes de contato fica branco
                 PreencheEspaco(2,'')+'|'+                 //Percentual de desconto 1 - utilizado para informação do repasse -  - para lentes de contato fica branco
                 PreencheEspaco(2,'')+'|'+                 //Percentual de desconto 2 - utilizado para informação do desconto negociado -  - para lentes de contato fica branco
                 '|'+                                      //Valor líquido do pedido - campo opcional
                 '|'+                                      //Data base de faturamento negociada  - para lentes de contato fica branco
                 DateToStr(Entidade.DataCadastro)+'|'+     //Data de emissão do pedido.
                 '|'+                                      //Código da transportadora - OPCIONAL
                 '|'+                                      //Aprovação de desconto - OPCIONAL
                 '|'+                                      //Modificação lista de preço - OPCIONAL
                 '|'+                                      //Modificação condição pagamento - OPCIONAL
                 'False|'+                                 //Indicador de aceite de faturamento parcial
                 'LC|'+                                    //Identificador do tipo de pedido: LC= Lente de contato; SO=Soluções; FA=Farmaceuticos; CI=Cirúrgico.
                 '|'+                                      //Campo reserva - 0  -  OPCIONAL.
                 '|';                                      //Código do representante responsável - opcional para clientes.
        ConteudoArquivo.Add(Linha);


        //Item do Pedido
        Linha := '2|'+                                  //Identificação do registro - deve ser ( 2 )
                 PreencheZero(3,iItem)+'|'+             //Código de seqüência do item no pedido. Incremental de 10 em 10.
                 PreencheZero(3,Produto1.Referencia)+'|'+   //Código do item no cadastro BL.
                 '|'+                                   //Valor unitário líquido - OPCIONAL.
                 PreencheZero(3,Trunc(Quantidade))+'|'+ //Quantidade pedida do item.
                 '|'+                                   //Valor total líquido do item. - OPCIONAL.
                 '|'+                                   //Percentual de desconto do item - - para lentes de contato fica branco
                 '1|';                                  //Indicador de tipo de item.
                                                        //Para item pronto (qq lente) => 1
                                                        //Para caixa de prova: no item de código da caixa de prova => 2
                                                        //Componentes => 3.
        ConteudoArquivo.Add(Linha);
        iItem := iItem + 10;
        Next;
      end;
    end;

    //Registro Observação 1
    Linha := '3|'+                                     //Identificação do registro - deve ser ( 3 )
             PreencheEspaco(60,'');                    //Descrição da observação. Neste registro deverão estar as observações referentes a condição comercial.
    ConteudoArquivo.Add(Linha);

    //Registro Observação 2
    Linha := '3|'+                                     //Identificação do registro - deve ser ( 3 )
             PreencheEspaco(60,'');                    //Descrição da observação. Neste registro deverão estar as observações genéricas do pedido.
    ConteudoArquivo.Add(Linha);

    if ConteudoArquivo.Text <> '' then
    Begin
      try
        ConteudoArquivo.SaveToFile(NomeArquivo);
        ExecutaSQL(DM.QR_Comandos,'UPDATE ENVIA_FORNECEDOR SET '+
          ' ENF_SITUACAO=2 '+
          ',ENF_DT_ENVIADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND ENF_CODIGO IN ('+sCodigosENF+')');
        ShowMessage('Arquivo Gerado com Sucesso!'+#13+NomeArquivo);
        SB_LocPedClick(sender);
      except
        ShowMessage('Falha ao Gerar o Arquivo!'+#13+NomeArquivo);
      end;
    end;
  finally
    ConteudoArquivo.Free;
  end;
end;

procedure TfCadEnviarFornecedor.Envia_Fornecedor1CalcFields(
  DataSet: TDataSet);
begin
  with Fornecedor1 do
  Begin
    if (not Active) or
       (CodigoFOR <> Entidade.CodigoFOR) then
    Begin
      Close;
      ParamByName('FOR_CODIGO').asInteger := Entidade.CodigoFOR;
      Open;
    end;
    Entidade.FieldByName('Fornecedor').asString := RazaoSocial;
  end;

  with Pedido_de_Venda1 do
  Begin
    if (not Active) or
       (CodigoCNC <> Entidade.PedidoCNC) or
       (CodigoPDV <> Entidade.CodigoPDV) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.PedidoCNC;
      ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
      Open;
    end;
    if (not Cliente1.Active) or
       (Cliente1.CodigoCNC <> FieldByName('CNC_CLIENTE').asInteger) or
       (Cliente1.CodigoCLI <> FieldByName('CLI_CODIGO').asInteger) then
    Begin
      Cliente1.Close;
      Cliente1.ParamByName('CNC_CODIGO').asInteger := FieldByName('CNC_CLIENTE').asInteger;
      Cliente1.ParamByName('CLI_CODIGO').asInteger := FieldByName('CLI_CODIGO').asInteger;
      Cliente1.Open;
    end;
    Entidade.FieldByName('Cliente').asString := Cliente1.RazaoSocial;
  end;

  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> Entidade.CodigoPRD) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Entidade.CodigoPRD;
      Open;
    end;
    Entidade.FieldByName('Produto').asString := Referencia+'-'+Descricao;
  end;

  case Entidade.Situacao of
    0: Entidade.FieldByName('Situacao').asString := 'Aguardando Enviar';
    1: Entidade.FieldByName('Situacao').asString := 'Cancelado';
    2: Entidade.FieldByName('Situacao').asString := 'Enviado';
    3: Entidade.FieldByName('Situacao').asString := 'Recebido';
  end;
end;

procedure TfCadEnviarFornecedor.edtCodigoFORExit(Sender: TObject);
begin
  if SB_CancPed.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodigoFOR.Text) then
    edtCodigoFOR.Text := '0';

  edtFornecedor.Clear;

  if StrToInt(edtCodigoFOR.Text) = 0 then
    Exit;

  with Fornecedor1 do
  Begin
    if (not Active) or
      (CodigoFOR <> StrToInt(edtCodigoFOR.Text)) then
    Begin
      Close;
      ParamByName('FOR_CODIGO').AsInteger := StrToInt(edtCodigoFOR.Text);
      Open;
      if edtCodigoFOR.Enabled and
         IsEmpty then
      Begin
        ShowMessage('Fornecedor inválido');
        edtCodigoFOR.Text := '0';
        edtCodigoFOR.SetFocus;
        Exit;
      end;
    end;
    edtFornecedor.Text := RazaoSocial;
  end;
end;

procedure TfCadEnviarFornecedor.edtCodigoPDVExit(Sender: TObject);
begin
  if SB_CancPed.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPDV.Text) then
    edtCodigoPDV.Text := '0';

  edtCliente.Clear;

  if StrToInt(edtCodigoPDV.Text) = 0 then
    Exit;

  with Pedido_de_Venda1 do
  Begin
    if (not Active) or
       (CodigoCNC <> StrToInt(edtPedidoCNC.Text)) or
       (CodigoPDV <> StrToInt(edtCodigoPDV.Text)) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := StrToInt(edtPedidoCNC.Text);
      ParamByName('PDV_CODIGO').asInteger := StrToInt(edtCodigoPDV.Text);
      Open;
    end;
    if (not Cliente1.Active) or
       (Cliente1.CodigoCNC <> FieldByName('CNC_CLIENTE').asInteger) or
       (Cliente1.CodigoCLI <> FieldByName('CLI_CODIGO').asInteger) then
    Begin
      Cliente1.Close;
      Cliente1.ParamByName('CNC_CODIGO').asInteger := FieldByName('CNC_CLIENTE').asInteger;
      Cliente1.ParamByName('CLI_CODIGO').asInteger := FieldByName('CLI_CODIGO').asInteger;
      Cliente1.Open;
      if edtCodigoPDV.Enabled and
         IsEmpty then
      Begin
        ShowMessage('Pedido inválido');
        edtCodigoPDV.Text := '0';
        edtCodigoPDV.SetFocus;
        Exit;
      end;
    end;
    edtCliente.Text := Cliente1.RazaoSocial;
  end;
end;

procedure TfCadEnviarFornecedor.edtCodigoPRDExit(Sender: TObject);
begin
  if SB_CancPed.Focused then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    edtCodigoPRD.Text := '0';

  edtProduto.Clear;

  if StrToInt(edtCodigoPRD.Text) = 0 then
    Exit;

  with Produto1 do
  Begin
    if (not Active) or
       (CodigoPRD <> StrToInt(edtCodigoPRD.Text)) then
    Begin
      Close;
      ParamByName('PRD_CODIGO').AsInteger := StrToInt(edtCodigoPRD.Text);
      Open;
      if edtCodigoPRD.Enabled and
         IsEmpty then
      Begin
        ShowMessage('Produto inválido');
        edtCodigoPRD.Text := '0';
        edtCodigoPRD.SetFocus;
        Exit;
      end;
    end;
    edtProduto.Text := Descricao;
  end;
end;

procedure TfCadEnviarFornecedor.ckbFiltroSituacaoClick(Sender: TObject);
begin
  if ckbFiltroSituacao.Checked then
  Begin
    cmbFiltroSituacao.Enabled:=True;
    cmbFiltroSituacao.Color:=clWindow;
    cmbFiltroSituacao.ItemIndex:=0;
  end
  else
  Begin
    Entidade.Selecao.Text := ' AND CNC_CODIGO=:CNC_CODIGO ';
    cmbFiltroSituacao.Enabled:=False;
    cmbFiltroSituacao.Color:=AlteraCorComponentes;
    cmbFiltroSituacao.ItemIndex:=-1;
  end;
  SB_LocPedClick(sender);
end;

procedure TfCadEnviarFornecedor.cmbFiltroSituacaoClick(Sender: TObject);
begin
  Entidade.Selecao.Text := ' AND CNC_CODIGO=:CNC_CODIGO '+
                           ' AND ENF_SITUACAO='+IntToStr(cmbFiltroSituacao.ItemIndex);
  SB_LocPedClick(sender);
end;

procedure TfCadEnviarFornecedor.Envia_Fornecedor1BeforeOpen(
  DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
end;

end.
