unit CdConhecimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, Menus, JPEG, NotaFiscal, OperFisc, DBCtrls, Usuario,
  Transportadora, Titulo_a_Pagar;

type
  TfCadConhecimento = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label1: TLabel;
    edtConhecimento: TEdit;
    edtCodigoNTF: TEdit;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    Label3: TLabel;
    Label19: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Label2: TLabel;
    memOBS: TMemo;
    Label15: TLabel;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    Label4: TLabel;
    Label12: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    cmbSituacao: TComboBox;
    mskDataAlterado: TMaskEdit;
    Label13: TLabel;
    edtUsuario: TEdit;
    Label5: TLabel;
    mskDataEmissao: TMaskEdit;
    Label6: TLabel;
    mskDataEntrada: TMaskEdit;
    Label7: TLabel;
    edtBaseICMS: TEdit;
    Label8: TLabel;
    edtAliquotaICMS: TEdit;
    Label9: TLabel;
    edtICMS: TEdit;
    Label10: TLabel;
    edtOutros: TEdit;
    Label11: TLabel;
    edtTotalNota: TEdit;
    Label14: TLabel;
    Label21: TLabel;
    edtCodigoTRN: TEdit;
    edtRazaoSocial: TEdit;
    mskCNPJ: TMaskEdit;
    Label16: TLabel;
    Label17: TLabel;
    NotaFiscal1: TNotaFiscal;
    DSNotaFiscal1: TDataSource;
    edtUF: TEdit;
    Label18: TLabel;
    dblNaturezaDaOperacao: TDBLookupComboBox;
    OperFiscal1: TOperFiscal;
    DSOperFiscal1: TDataSource;
    Transportadora1: TTransportadora;
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
    NotaFiscal1NTF_ICMS_FRETE: TFloatField;
    NotaFiscal1NTF_CONHECIMENTO: TIntegerField;
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
    NotaFiscal1FUN_ARQUITETO: TIntegerField;
    NotaFiscal1RazaoSocial: TStringField;
    NotaFiscal1CNPJ: TStringField;
    NotaFiscal1AliquotaICMS: TStringField;
    edtTransportadoraCNC: TEdit;
    SB_Processar: TSpeedButton;
    Titulo_a_pagar1: TTitulo_a_pagar;
    NotaFiscal1CNC_ORIGEM: TIntegerField;
    NotaFiscal1NTF_COD_PAGAMENTO_2: TIntegerField;
    NotaFiscal1NTF_MAQUINA: TIntegerField;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbCampoEnter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure NotaFiscal1AfterScroll(DataSet: TDataSet);
    procedure edtCodigoTRNExit(Sender: TObject);
    procedure NotaFiscal1CalcFields(DataSet: TDataSet);
    procedure edtBaseICMSChange(Sender: TObject);
    procedure SB_ProcessarClick(Sender: TObject);
  private
    procedure AtualizaControles(Habilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Entidade:TNotaFiscal;
  end;

var
  fCadConhecimento: TfCadConhecimento;

implementation

Uses UDM,funcoes, MxFotoAmpliada, CdTransportador;

{$R *.DFM}

procedure TfCadConhecimento.SB_PrimClick(Sender: TObject);
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

procedure TfCadConhecimento.SB_AntClick(Sender: TObject);
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

procedure TfCadConhecimento.SB_ProxClick(Sender: TObject);
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

procedure TfCadConhecimento.SB_UltClick(Sender: TObject);
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

procedure TfCadConhecimento.AtualizaControles(Habilitar:Boolean);
begin
  edtConhecimento.Enabled := habilitar;
  dblNaturezaDaOperacao.Enabled := habilitar;
  edtBaseICMS.Enabled := habilitar;
  edtAliquotaICMS.Enabled := habilitar;
  edtOutros.Enabled := habilitar;
  edtUF.Enabled := habilitar;
  
  Incluir1.Enabled     := not habilitar;
  Alterar1.Enabled     := not habilitar;
  Excluir1.Enabled     := not habilitar;
  Localizar1.Enabled   := not habilitar;
  Salvar1.Enabled      := habilitar;
  Cancelar1.Enabled    := habilitar;
  SB_Prim.Enabled      := not habilitar;
  SB_Ant.Enabled       := not habilitar;
  SB_Prox.Enabled      := not habilitar;
  SB_Ult.Enabled       := not habilitar;
  SB_Novo.Enabled      := not habilitar;
  SB_Loc.Enabled       := not habilitar;
  SB_Alt.Enabled       := not habilitar;
  SB_Exc.Enabled       := not habilitar;
  SB_Salva.Enabled     := habilitar;
  SB_Canc.Enabled      := habilitar;
  SB_Processar.Enabled := not habilitar;

  if habilitar then
  Begin
    edtLocalizar.Color := AlteraCorComponentes;
    cmbCampo.Color := AlteraCorComponentes;
  end
  else
  Begin
    edtLocalizar.Color := clWindow;
    cmbCampo.Color := clWindow;
  end;

  edtLocalizar.Enabled := not habilitar;
  cmbCampo.Enabled     := not habilitar;
end;

procedure TfCadConhecimento.SB_NovoClick(Sender: TObject);
begin
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir registro deste centro de custo.');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  Entidade.PreparaInsercao(True, True);
  AtualizaControles(true);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  dblNaturezaDaOperacao.KeyValue := OperFiscal1.CodigoOPF;
  mskDataEmissao.Text := DateToStr(DM.Configuracao1.Data);
  edtAliquotaICMS.Text := '7,00';
  edtConhecimento.SetFocus;
end;

procedure TfCadConhecimento.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode alterar registro deste centro de custo.');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if Entidade.Situacao <> 0 then
    Raise exception.Create('Conhecimento não está em aberto!');    
  Entidade.PreparaAlteracao;
  AtualizaControles(true);
  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  edtConhecimento.SetFocus;
end;

procedure TfCadConhecimento.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode excluir registro deste centro de custo.');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!');
  if Entidade.Situacao <> 0 then
    Raise exception.Create('Conhecimento não está em aberto!');    
  Entidade.Deletarauto;
  if Entidade.IsEmpty then
  Begin
    edtCodigoNTF.Clear;
    cmbSituacao.ItemIndex := -1;
    edtUsuario.Clear;
    edtRazaoSocial.Clear;
    mskCNPJ.Clear;
    edtAliquotaICMS.Text := '0,00';    
  end;
end;

procedure TfCadConhecimento.SB_SalvaClick(Sender: TObject);
var
  CdCNC, CdNTF, CdTRNCNC, CdTRN, CdConhecimento: integer;
  DtEmissao, DtEntrada: TDateTime;
  mensagem: string;
  vBaseICMS, vICMS, vOutras, vTotalNota: Double;
begin
  CdCNC := DM.Configuracao1.CodigoCNC;
  CdNTF := 0;
  CdTRNCNC := 0;
  CdTRN := 0;
  CdConhecimento := 0;
  DtEmissao := 0;
  DtEntrada := 0;
  vBaseICMS := 0;
  vICMS := 0;
  vOutras := 0;
  vTotalNota := 0;
  mensagem := '';
  if not VerificaInteiroBranco(edtCodigoNTF.Text) then
    mensagem := mensagem + 'Código da Nota inválido!'+#13
  else
    CdNTF := StrToInt(edtCodigoNTF.Text);
  if not VerificaInteiroBranco(edtConhecimento.Text) then
    mensagem := mensagem + 'Conhecimento inválido!'+#13
  else
    CdConhecimento := StrToInt(edtConhecimento.Text);
  if not VerificaInteiroBranco(edtTransportadoraCNC.Text) then
    mensagem := mensagem + 'CNC da Transportadora inválido!'+#13
  else
    CdTRNCNC := StrToInt(edtTransportadoraCNC.Text);
  if not VerificaInteiroBranco(edtCodigoTRN.Text) then
    mensagem := mensagem + 'Código da Transportadora inválido!'+#13
  else
    CdTRN := StrToInt(edtCodigoTRN.Text);
  if not VerificaDataBranco(mskDataEmissao.Text) then
    mensagem := mensagem + 'Data de Emissão inválida!'+#13
  else
    DtEmissao := StrToDate(mskDataEmissao.Text);
  if not VerificaDataBranco(mskDataEntrada.Text) then
    mensagem := mensagem + 'Data de Entrada inválida!'+#13
  else
    DtEntrada := StrToDate(mskDataEntrada.Text);
  if not VerificaFloatBranco(edtBaseICMS.Text) then
    mensagem := mensagem + 'Base de ICMS inválida!'+#13
  else
    vBaseICMS := StrToFloat(edtBaseICMS.Text);
  if not VerificaFloatBranco(edtICMS.Text) then
    mensagem := mensagem + 'ICMS inválido!'+#13
  else
    vICMS := StrToFloat(edtICMS.Text);
  if not VerificaFloatBranco(edtOutros.Text) then
    mensagem := mensagem + 'Outras Despesas inválida!'+#13
  else
    vOutras := StrToFloat(edtOutros.Text);
  if not VerificaFloatBranco(edtTotalNota.Text) then
    mensagem := mensagem + 'Total da Nota inválida!'+#13
  else
    vTotalNota := StrToFloat(edtTotalNota.Text);

  if StrToDate(mskDataEntrada.Text) < StrToDate(mskDataEmissao.Text) then
    Raise Exception.Create('Data de Entrada menor que a data de Emissão!');
    
  if mensagem <> '' then
  Begin
    ShowMessage(mensagem);
    Exit;
  end;
  if Entidade.Estado = 1 then //Inserir
  Begin
    If Entidade.Inserir(CdCNC,CdNTF, CdCNC, 0, dblNaturezaDaOperacao.KeyValue,
      0 (*FOR*),0 (*TRN*), CdCNC, CdTRN (*CLI*), 0, CdConhecimento, 0, 0(*Entrada*), 369(*TipoNota*),
      0(*TipoTransporta*), 0 (*TipoFrete*),0(*Selo*), 0(*Situação*),
      0(*Conhecimento*), 1(*NotaCupom*), 0(*CodPagamento*), 0(*CodPagamento2*), 0(*Arquiteto*),
      vBaseICMS, vICMS, 0 (*BaseSub.*), 0 (*ICMSSub*), 0(*TotalServ*),
      0(*TotalProduto*), vTotalNota, 0 (*IPI*), 0(*Frete*), 0(*ICMSFrete*), 0(*Quantidade*),
      0 (*BaseISS*), 0 (*ISS*), vOutras, '' (*Serie*), '' (*SubSerie*), memOBS.Text, edtUF.Text,
      DtEmissao, DtEntrada) then
    Begin
      Entidade.AtualizaControles(False, True);
      AtualizaControles(False);
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM NOTA_FISCAL '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND NTF_CODIGO='+IntToStr(CdNTF);
      Entidade.Open;
    end
    else
      ShowMessage('As alterações não foram salvas!');
  end
  else if Entidade.Estado = 2 then //Alterar
  Begin
    If Entidade.Alterar(dblNaturezaDaOperacao.KeyValue,
      CdTRNCNC, CdTRN, CdConhecimento, vBaseICMS, vICMS, vTotalNota,
      vOutras, edtUF.Text, memOBS.Text, DtEmissao, DtEntrada) then
    Begin
      Entidade.AtualizaControles(False, True);
      AtualizaControles(False);
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM NOTA_FISCAL '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND NTF_CODIGO='+IntToStr(CdNTF);
      Entidade.Open;
    end
    else
      ShowMessage('As alterações não foram salvas!');
  end;
end;

procedure TfCadConhecimento.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  edtLocalizar.Color:=clWindow;
  AtualizaControles(False);
  cmbCampo.Color:=clWindow;
  if Entidade.IsEmpty then
  Begin
    edtCodigoNTF.Clear;
    edtUsuario.Clear;
    cmbSituacao.ItemIndex := -1;
    edtRazaoSocial.Clear;
    mskCNPJ.Clear;
    edtAliquotaICMS.Text := '0,00';
  end;
end;

procedure TfCadConhecimento.FormCreate(Sender: TObject);
begin
  Entidade:=NotaFiscal1;
end;

procedure TfCadConhecimento.cmbCampoEnter(Sender: TObject);
begin
  cmbCampo.Text:='';
end;

procedure TfCadConhecimento.SB_LocClick(Sender: TObject);
begin
  If (edtLocalizar.Text <> '*') and (cmbCampo.ItemIndex=0) then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Entidade.Selecionar;
end;

procedure TfCadConhecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Action:=Cafree;
end;

procedure TfCadConhecimento.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfCadConhecimento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
  if (not Entidade.IsEmpty) and (Entidade.Situacao = 0) then
    If MessageDlg('Atenção!!!'+#13+'Existe conhecimento não confirmado, impossibilitando que os vendedores gerem notas.'+#13+'Deseja sair sem Confirmar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Canclose:=False;
end;

procedure TfCadConhecimento.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  with OperFiscal1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM OPERACAO_FISCAL '+
      ' WHERE OPF_CODIGO IN (1353,2353) '+
      ' ORDER BY OPF_DESCRICAO ';
    Open;
  end;
  Entidade.Open;
  cmbCampo.ItemIndex := 2;
  edtLocalizar.SetFocus;
end;

procedure TfCadConhecimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Canc.Enabled then
    Begin
      SB_Canc.SetFocus;
      SB_CancClick(sender);
    end
    else
      Close;
  end
  else if key = #13 then
  Begin
    if SB_Salva.Enabled then
    Begin
      SB_Salva.SetFocus;
      SB_SalvaClick(sender);
    end;
  end
  else if (key = #32) and (edtCodigoTRN.Focused) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfCadTran, fCadTran);
    with fCadTran do
    Begin
      tag:=1;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * FROM TRANSPORTADORA ORDER BY TRN_RZ_SOCIAL';
      Entidade.Open;
      ShowModal;
    end;
  end;
end;

procedure TfCadConhecimento.NotaFiscal1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtUsuario.Text := DM.NomeUsuario(Entidade.CodigoUSU);
  edtRazaoSocial.Text := Entidade.FieldByName('RazaoSocial').asString;
  mskCNPJ.Text := Entidade.FieldByName('CNPJ').asString;
  edtAliquotaICMS.Text := Entidade.FieldByName('AliquotaICMS').asString;
end;

procedure TfCadConhecimento.edtCodigoTRNExit(Sender: TObject);
begin
  if SB_Canc.Focused then
    Exit;
  edtTransportadoraCNC.Clear;
  edtRazaoSocial.Clear;
  mskCNPJ.Clear;
  edtUF.Clear;
  if edtCodigoTRN.Text <> '' then
    if VerificaInteiro(edtCodigoTRN.Text) then
    Begin
      with Transportadora1 do
      Begin
        Close;
        ParamByName('TRN_CODIGO').AsInteger:=StrToInt(edtCodigoTRN.Text);
        Open;
        If not IsEmpty then
        Begin
          if COdigoCCX <= 0 then
          Begin
            ShowMessage('Transportadora sem Conta de Caixa!');
            try
              edtCodigoTRN.SetFocus;
            except
            end;
          end;
          edtTransportadoraCNC.Text := IntToStr(CodigoCNC);
          edtRazaoSocial.Text    := RazaoSocial;
          mskCNPJ.Text := CPFCGC;
          edtUF.Text   := Uf;
        end
        else
        Begin
          ShowMessage('Código de Transportadora inválida!');
          try
            edtCodigoTRN.SetFocus;
          except
          end;
        end;
      end;
    end
    else
    Begin
      ShowMessage('Código de Transportadora inválido!');
      try
        edtCodigoTRN.SetFocus;
      except
      end;
    end;
end;

procedure TfCadConhecimento.NotaFiscal1CalcFields(DataSet: TDataSet);
begin
  with Transportadora1 do
  Begin
    if Entidade.CodigoCLI <> CodigoTRN then
    Begin
      Close;
      ParamByName('TRN_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    Entidade.FieldByName('RazaoSocial').asString := RazaoSocial;
    Entidade.FieldByName('CNPJ').asString := CPFCGC;
  end;
  try
    Entidade.FieldByName('AliquotaICMS').asString:=format('%.2f',[
      Entidade.ICMS/Entidade.BaseICMS*100]);
  except
    Entidade.FieldByName('AliquotaICMS').asString:='0,00';
  end;
end;

procedure TfCadConhecimento.edtBaseICMSChange(Sender: TObject);
begin
  if SB_Salva.Enabled then
  Begin
    try
      edtICMS.Text := format('%.2f',[StrToFloat(edtBaseICMS.Text)*StrToFloat(edtAliquotaICMS.Text)/100]);
    except
      edtICMS.Text := '0,00';
    end;
    try
      edtTotalNota.Text := format('%.2f',[StrToFloat(edtBaseICMS.Text)+StrToFloat(edtOutros.Text)]);
    except
      edtTotalNota.Text := '0,00';
    end;
  end;
end;

procedure TfCadConhecimento.SB_ProcessarClick(Sender: TObject);
var
  CdCNC, CdNTF, CdTRN, CdCCX: integer;
  trans:boolean;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Conhecimento!');
  if Entidade.Situacao <> 0 then
    Raise exception.Create('Conhecimento não está em aberto!');
  CdCNC := Entidade.CodigoCNC;
  CdNTF := Entidade.CodigoNTF;
  CdTRN := Entidade.CodigoCLI;

  with Transportadora1 do
  Begin
    if CdTRN <> CodigoTRN then
    Begin
      Close;
      ParamByName('TRN_CODIGO').asInteger := CdTRN;
      Open;
    end;
    CdCCX := CodigoCCX;
  end;

  If MessageDlg('Atenção!!!'+#13+'Processo irreverssível.'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      StartTransaction;
      Trans:=True;

      //Gerar Títulos
      with Titulo_a_pagar1 do
      Begin
        if not Active then
          Open;
        if not Inserir(CdCNC,0,0,0,CdCCX,0,0,CdTRN, DM.Configuracao1.TipoDocumento,0 (*Período*),
            ''(*OBS*), ''(*Custodia*), edtConhecimento.Text, StrToDate(mskDataEntrada.Text)+30,
            0(*DtPag*), 0(*DtOri*), DM.Configuracao1.data(*Competência*), Entidade.TotalNota, 0, '0'(*FormaPag.*),
            '1'(*Seq.*), 6(*TipoPag Cheque.*),0(*TitAnt*),0(*TitORI*), False) then
          Raise exception.Create('');
      end;

      //Mudar Situação da Nota
      ExecutaSQL(DM.QR_Comandos,'UPDATE NOTA_FISCAL SET '+
        ' USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',NTF_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',NTF_SITUACAO=2 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND NTF_CODIGO='+IntToStr(CdNTF));

      Commit;
    except
      if trans then
      Begin
        RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      end;
    end;
  End;
  Entidade.Close;
  Entidade.Open;
end;

end.
