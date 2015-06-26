unit MxRecebPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Pedido_de_Venda, Cliente, ComCtrls, CentroCusto, DBCtrls, Menus;

type
  TfMxRecPed = class(TForm)
    Pedido_de_Venda1: TPedido_de_Venda;
    DSPedido_de_Venda1: TDataSource;                                                
    PageControl1: TPageControl;
    tabPorPedido: TTabSheet;
    tabPorCliente: TTabSheet;
    Panel4: TPanel;
    Panel3: TPanel;
    SB_Fechar: TSpeedButton;
    SB_Avancar: TSpeedButton;
    Panel5: TPanel;
    SB_Loc: TSpeedButton;
    edtLocalizar: TEdit;
    Label19: TLabel;
    cmbCampo: TComboBox;
    Label20: TLabel;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    Cliente1: TCliente;
    DSCliente1: TDataSource;
    DBGrid5: TDBGrid;
    Pedido_de_Venda2: TPedido_de_Venda;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Cliente2: TMenuItem;
    Localizar1: TMenuItem;
    Pedido_de_Venda1Valor: TStringField;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1USU_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_TOTAL: TFloatField;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1PDV_DIAS_RESERV: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_FISCAL: TSmallintField;
    Pedido_de_Venda1AGF_CODIGO: TIntegerField;
    Pedido_de_Venda1FPG_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda1PDV_ENTRADA: TFloatField;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1CLI_RZ_SOCIAL: TStringField;
    Pedido_de_Venda1CLI_CGC_CPF: TStringField;
    Pedido_de_Venda1CLI_CGF_RG: TStringField;
    Pedido_de_Venda1PDV_LISTADO: TIntegerField;
    Pedido_de_Venda1PDV_EM_USO: TIntegerField;
    Pedido_de_Venda1CLI_OBS1: TStringField;
    N1: TMenuItem;
    Avanar1: TMenuItem;
    Pedido_de_Venda1PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda1CLI_PESSOA_FISICA: TSmallintField;
    DBGrid1: TDBGrid;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Pedido_de_Venda1PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda1PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_CUPOM: TIntegerField;
    SB_HistoricoPagamento: TSpeedButton;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda1PDV_CONTATO: TStringField;
    Pedido_de_Venda1PDV_CREDITO: TFloatField;
    Pedido_de_Venda1FUN_ARQUITETO: TIntegerField;
    Pedido_de_Venda1PDV_TITULO_GERADO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_VENDA: TIntegerField;
    Pedido_de_Venda1PDV_PACOTE: TIntegerField;
    Pedido_de_Venda1PDV_GRUPO_ESPECIAL: TIntegerField;
    Pedido_de_Venda1PDV_DT_PREVISAO: TDateTimeField;
    Pedido_de_Venda1PDV_DT_ENTREGA: TDateTimeField;
    Pedido_de_Venda1PDV_DOCUMENTO: TStringField;
    Pedido_de_Venda1PDV_CAIXA: TStringField;
    Pedido_de_Venda1PDV_SERVICO: TIntegerField;
    Pedido_de_Venda1PDV_FONE_CONTATO: TStringField;
    Pedido_de_Venda1FPE_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Pedido_de_Venda1PDV_DT_FPE: TDateTimeField;
    Pedido_de_Venda1CNT_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_GARANTIA: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO_ORIGEM: TIntegerField;
    Pedido_de_Venda1PDV_FRETE: TFloatField;
    SB_CadastroCLiente: TSpeedButton;
    Panel1: TPanel;
    SB_LocPorPedido: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edtLocalizarPorPedido: TEdit;
    cmbCampoPorPedido: TComboBox;
    procedure SB_AvancarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Pedido_de_Venda1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SB_HistoricoPagamentoClick(Sender: TObject);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure dblCodigoCNCClick(Sender: TObject);
    procedure SB_CadastroCLienteClick(Sender: TObject);
    procedure SB_LocPorPedidoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxRecPed: TfMxRecPed;

implementation
Uses
 UDM, MxSRecPedido, UCarnet, MxSPediCliHist,
  UPedidoVendaItemPDVRed2, UPedidoVendaItemPDV, funcoes,
  MxSaldoDev, CdCliente, MxSelResumo;
{$R *.DFM}


procedure TfMxRecPed.SB_AvancarClick(Sender: TObject);
begin
  If PageControl1.ActivePage = tabPorPedido then
  Begin
    If not Pedido_de_Venda1.IsEmpty Then
    Begin
      Application.CreateForm(TfMxSRecPed, fMxSRecPed);
      fMxSRecPed.Tag := 0;
      fMxSRecPed.edtCodigoCLI.Text     :=  IntToStr(Pedido_de_Venda1.CodigoCLI);
      fMxSRecPed.edtRazaoSocial.Text     :=  Pedido_de_Venda1.FieldByName('CLI_RZ_SOCIAL').AsString;
      if Pedido_de_Venda1.FieldByName('CLI_PESSOA_FISICA').asInteger = 1 then
        fMxSRecPed.mskCNPJ_CPF.EditMask:='999-999-999-99;0;_'
      else
        fMxSRecPed.mskCNPJ_CPF.EditMask:='99-999-999/9999-99;0;_';
      fMxSRecPed.mskCNPJ_CPF.Text :=  Pedido_de_Venda1.FieldByName('CLI_CGC_CPF').AsString;
      fMxSRecPed.edtCGF_RG.Text    :=  Pedido_de_Venda1.FieldByName('CLI_CGF_RG').AsString;
      fMxSRecPed.Cliente1.ParamByName('CLI_CODIGO').AsInteger := Pedido_de_Venda1.FieldByName('CLI_CODIGO').AsInteger;
      fMxSRecPed.Cliente1.ParamByName('CNC_CODIGO').AsInteger := Pedido_de_Venda1.FieldByName('CNC_CLIENTE').AsInteger;
      fMxSRecPed.Cliente1.Open;
      fMxSRecPed.edtObservacaoCLI.Text:=fMxSRecPed.Cliente1.OBS;
      fMxSRecPed.ShowModal;
    End
    Else
      ShowMessage('Selecione um registro antes de continuar!');
  End
  Else
  Begin
    if not Cliente1.IsEmpty then
    Begin
      Application.CreateForm(TfMxSRecPed, fMxSRecPed);
      fMxSRecPed.Tag := 0;
      fMxSRecPed.edtCodigoCLI.Text  := IntToStr(Cliente1.CodigoCLI);
      fMxSRecPed.edtRazaoSocial.Text  := Cliente1.RazaoSocial;
      fMxSRecPed.edtObservacaoCLI.Text  := Cliente1.OBS;
      if Cliente1.PessoaFisica then
        fMxSRecPed.mskCNPJ_CPF.EditMask:='999-999-999-99;0;_'
      else
        fMxSRecPed.mskCNPJ_CPF.EditMask:='99-999-999/9999-99;0;_';
      fMxSRecPed.mskCNPJ_CPF.Text  :=  Cliente1.CPFCGC;
      fMxSRecPed.edtCGF_RG.Text  :=  Cliente1.CGFRG;
      With fMxSRecPed.Titulo_receber1 do
      Begin
        Close;
        SQL.Text:='SELECT * FROM TITULO_A_RECEBER '+
          ' WHERE CLI_CODIGO='+IntToStr(Cliente1.CodigoCLI)+
          ' AND CNC_CLIENTE='+IntToStr(Cliente1.CodigoCNC)+
          ' AND (TRC_SITUACAO=0 OR '+
          ' TRC_SITUACAO=1 OR TRC_SITUACAO=8) '+
          ' ORDER BY TRC_CODIGO';
        Open;
      End;
      fMxSRecPed.Cliente1.ParamByName('CLI_CODIGO').AsInteger := Cliente1.CodigoCLI;
      fMxSRecPed.Cliente1.ParamByName('CNC_CODIGO').AsInteger := Cliente1.CodigoCNC;
      fMxSRecPed.Cliente1.Open;
      fMxSRecPed.ShowModal;
    end
    else
      ShowMessage('Selecione um registro antes de continuar!');    
  End;
end;

procedure TfMxRecPed.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := tabPorCliente;
  ckbCodigoCNC.Visible := true;
  dblCodigoCNC.Visible := true;

  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_REC_PED_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxRecPed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_REC_PED_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Pedido_de_Venda1.Active:=False;
  Action:=Cafree;
end;

procedure TfMxRecPed.SB_FecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfMxRecPed.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  CentroCusto2.Open;
  try
    if (DM.Configuracao1.Empresa = 3) and    //LBM
       (DM.Configuracao1.CodigoCNC = 3) then //LBM Serviço
      cmbCampo.ItemIndex := 9 //CodigoPDV
    else
      cmbCampo.ItemIndex := 1; //Razão Social
  except
  end;

  Pedido_de_Venda1.Close;
  Pedido_de_Venda1.ParamByName('PDV_SITUACAO').AsInteger:=4;
  if DM.Configuracao1.Empresa IN [1,2,3] then //Eletro, Petromax
    Pedido_de_Venda1.ParamByName('CLI_AVISTA').AsInteger:=DM.Configuracao1.CodigoCliAVista
  else
    Pedido_de_Venda1.ParamByName('CLI_AVISTA').AsInteger:=-10;
  Pedido_de_Venda1.ParamByName('DATAINI').AsdateTime:=DM.Configuracao1.Data;
  Pedido_de_Venda1.ParamByName('DATAFIM').AsDateTime:=DM.Configuracao1.Data+1;
  Pedido_de_Venda1.Open;

  if DM.Configuracao1.Empresa in [empEletro, empLuciano] then
    ckbCodigoCNC.Checked := True;

  if PageControl1.ActivePage = tabPorPedido then
  begin
    edtLocalizarPorPedido.SetFocus;
    SB_CadastroCLiente.Enabled := false;
  end
  else
  begin
    edtLocalizar.SetFocus;
    SB_CadastroCLiente.Enabled := true;
  end;
end;

procedure TfMxRecPed.SB_LocClick(Sender: TObject);
var
  CdCNC: String;
begin
  if (VerificaInteiroBranco(edtLocalizar.Text)) and (cmbCampo.ItemIndex = 1) then
  Begin
    if DM.Configuracao1.Empresa <> empLBM then
      cmbCampo.ItemIndex := 0;
  end
  else if (not VerificaInteiroBranco(edtLocalizar.Text)) and (cmbCampo.ItemIndex = 0) then
    cmbCampo.ItemIndex := 1;

  if ckbCodigoCNC.Checked then
    CdCNC := ' AND T1.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)
  else
    CdCNC := '';

  if cmbCampo.ItemIndex = 5 then //Cartão p/ Hoje
  Begin
    Cliente1.Close;
    Cliente1.SQL.Text:='SELECT T1.* '+
      ' FROM CLIENTE T1 '+
      ' WHERE T1.CLI_CODIGO IN '+
      ' (SELECT T2.CLI_CODIGO '+
      ' FROM TITULO_A_RECEBER T2 '+
      ' WHERE T2.TRC_TIPO_PAG=13 '+
      ' AND T2.CNC_CLIENTE=T1.CNC_CODIGO '+
      ' AND (T2.TRC_SITUACAO=0 OR T2.TRC_SITUACAO=1 OR T2.TRC_SITUACAO=8) AND '+
      ' T2.TRC_VENCIMENTO>="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' AND T2.TRC_VENCIMENTO<"'+MesDia(DM.Configuracao1.Data+1)+'")'+
      CdCNC;
    Cliente1.Open;
  end
  else if cmbCampo.ItemIndex = 6 then //Cartão Todos
  Begin
    Cliente1.Close;
    Cliente1.SQL.Text:='SELECT T1.* '+
      ' FROM CLIENTE T1 '+
      ' WHERE T1.CLI_CODIGO IN '+
      ' (SELECT T2.CLI_CODIGO '+
      ' FROM TITULO_A_RECEBER T2 '+
      ' WHERE T2.CNC_CLIENTE=T1.CNC_CODIGO '+
      ' AND T2.TRC_TIPO_PAG=13 '+
      ' AND (T2.TRC_SITUACAO=0 OR T2.TRC_SITUACAO=1 OR T2.TRC_SITUACAO=8)) '+
      CdCNC;
    Cliente1.Open;
  end
  else if cmbCampo.ItemIndex = 7 then //Cartão CV
  Begin
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      Raise Exception.Create('Código Boleto Bancário inválido!');
    Cliente1.Close;
    Cliente1.SQL.Text:='SELECT T1.* '+
      ' FROM CLIENTE T1 '+
      ' WHERE T1.CLI_CODIGO IN '+
      ' (SELECT T2.CLI_CODIGO '+
      ' FROM TITULO_A_RECEBER T2 '+
      ' WHERE T2.CNC_CLIENTE=T1.CNC_CODIGO '+
      ' AND (T2.TRC_SITUACAO=0 OR T2.TRC_SITUACAO=1 OR T2.TRC_SITUACAO=8)'+
      ' AND T2.TRC_CV="'+edtLocalizar.Text+'") '+
      CdCNC;
    Cliente1.Open;
  end
  else if cmbCampo.ItemIndex = 8 then //Boleto Bancário
  Begin
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      Raise Exception.Create('Código Boleto Bancário inválido!');
    Cliente1.Close;
    Cliente1.SQL.Text:='SELECT T1.* '+
      ' FROM CLIENTE T1 '+
      ' WHERE T1.CLI_CODIGO IN '+
      ' (SELECT T2.CLI_CODIGO '+
      ' FROM TITULO_A_RECEBER T2 '+
      ' WHERE T2.CNC_CLIENTE=T1.CNC_CODIGO '+
      ' AND (T2.TRC_SITUACAO=0 OR T2.TRC_SITUACAO=1 OR T2.TRC_SITUACAO=8)'+
      ' AND T2.BOL_CODIGO='+edtLocalizar.Text+') '+
      CdCNC;
    Cliente1.Open;
  end
  else if cmbCampo.ItemIndex = 9 then //Código do Pedido
  Begin
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      Raise Exception.Create('Código do Pedido inválido!');
    Cliente1.Close;
    Cliente1.SQL.Text:='SELECT T1.* '+
      ' FROM CLIENTE T1 '+
      ' WHERE T1.CLI_CODIGO IN '+
      ' (SELECT T2.CLI_CODIGO '+
      ' FROM PEDIDO_DE_VENDA T2 '+
      ' WHERE T2.CNC_CLIENTE=T1.CNC_CODIGO '+
      ' AND T2.PDV_CODIGO='+edtLocalizar.Text+') '+
      CdCNC;
    Cliente1.Open;
  end
  else
  Begin
    if not Cliente1.Active then
      Cliente1.Open;
    Cliente1.Selecionar;
  end;
end;

procedure TfMxRecPed.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = tabPorCliente then
  begin
    SB_CadastroCLiente.Enabled := true;
    try
      edtLocalizar.SetFocus;
    except
    end;
  end
  else
  begin
    SB_CadastroCLiente.Enabled := false;
    try
      edtLocalizarPorPedido.SetFocus;
    except
    end;
  end;
end;

procedure TfMxRecPed.Pedido_de_Venda1CalcFields(DataSet: TDataSet);
begin
  Pedido_de_Venda1.FieldByName('Valor').asString:=format('%.2f',[Pedido_de_Venda1.Total]);
end;

procedure TfMxRecPed.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close
  else if key=chr(13) then
    SB_AvancarClick(sender);
end;

procedure TfMxRecPed.SB_HistoricoPagamentoClick(Sender: TObject);
begin
  if PageControl1.ActivePage = tabPorPedido then
  Begin
    If Pedido_de_Venda1.IsEmpty then
      raise Exception.Create('Selecione um Pedido antes de continuar!');
    with Cliente1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM CLIENTE '+
        ' WHERE CNC_CODIGO='+IntToStr(Pedido_de_Venda1.ClienteCNC)+
        ' AND CLI_CODIGO='+IntToStr(Pedido_de_Venda1.CodigoCLI);
      Open;
    end;
  end
  else
  Begin
    If Cliente1.IsEmpty then
      raise Exception.Create('Selecione um cliente antes de continuar!');
  end;
  If Cliente1.IsEmpty then
    raise Exception.Create('Selecione um cliente antes de continuar!');

  Application.CreateForm(TfMxSelResumo,fMxSelResumo);
  with fMxSelResumo do
  Begin
    Tag := 1;
    CdCNC := Cliente1.CodigoCNC;
    CdCLI := Cliente1.CodigoCLI;
    sRazaoSocial := Cliente1.RazaoSocial;
    vCredito := Cliente1.Credito;
    ShowModal;
  end;
end;

procedure TfMxRecPed.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
    try
      dblCodigoCNC.SetFocus;
    except
    end;
    dblCodigoCNCClick(sender);
  end
  else
  Begin
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.KeyValue:=-1;
    dblCodigoCNC.Enabled:=False;
    Cliente1.Selecao.Text := '';
    SB_LocClick(sender);
  end;
end;

procedure TfMxRecPed.dblCodigoCNCClick(Sender: TObject);
begin
  if VerificaInteiroBranco(dblCodigoCNC.KeyValue) then
  Begin
    Cliente1.Selecao.Text := ' AND CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue);
    SB_LocClick(sender);
  end;
end;

procedure TfMxRecPed.SB_CadastroCLienteClick(Sender: TObject);
begin
  Application.CreateForm(TfCadCli, fCadCli);
  with fCadCli do
  Begin
    tag := 49;
    HelpContext:=3700;
    dblCentroDeCusto.KeyValue := self.Cliente1.CodigoCNC;
    edtLocalizar.Text := IntToStr(self.Cliente1.CodigoCLI);
    cmbCampo.ItemIndex := 0;
    showmodal;
  end;
end;

procedure TfMxRecPed.SB_LocPorPedidoClick(Sender: TObject);
var
  sCampo: String;
begin
  if cmbCampoPorPedido.ItemIndex = 0 then //Pedido
    sCampo := 'PDV_CODIGO'
  else if cmbCampoPorPedido.ItemIndex = 1 then //Cliente
    sCampo := 'CLI_CODIGO';

  if not Pedido_de_Venda1.Locate(sCampo,edtLocalizarPorPedido.Text,[]) then
    Raise Exception.Create('Pedido de Venda não localizado');
end;

procedure TfMxRecPed.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F3 then
  begin
    if PageControl1.ActivePage = tabPorPedido then
      SB_LocPorPedidoClick(SB_LocPorPedido)
    else if PageControl1.ActivePage = tabPorCliente then
      SB_LocClick(SB_Loc);
  end;
end;

end.
