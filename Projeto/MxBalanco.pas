unit MxBalanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Menus, Usuario, Variants, CentroCusto, Balanco, Funcionario;

type
  TfMxBalanco = class(TForm)
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    Label1: TLabel;
    edtTotalCusto: TEdit;
    Panel1: TPanel;
    SB_ExcCab: TSpeedButton;
    SB_AltCab: TSpeedButton;
    SB_LocCab: TSpeedButton;
    SB_NovoCab: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_SalvaCab: TBitBtn;
    SB_CancCab: TBitBtn;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Cabecalho1: TMenuItem;
    IncluirCab: TMenuItem;
    AlterarCab: TMenuItem;
    ExcluirCab: TMenuItem;
    N1: TMenuItem;
    SalvarCab: TMenuItem;
    CancelarCab: TMenuItem;
    N2: TMenuItem;
    LocalizarCab: TMenuItem;
    Label6: TLabel;
    Label27: TLabel;
    mskDataCadastro: TMaskEdit;
    mskDataAlterado: TMaskEdit;
    CentroCusto2: TCentroCusto;
    DSCentroCusto: TDataSource;
    Balanco1: TBalanco;
    Label4: TLabel;
    edtCodigoBLC: TEdit;
    Funcionario1: TFuncionario;
    DSFuncionario1: TDataSource;
    Label5: TLabel;
    dblResponsavel: TDBLookupComboBox;
    Label22: TLabel;
    Label14: TLabel;
    cmbSituacao: TComboBox;
    Label26: TLabel;
    edtObservacao: TEdit;
    DSBalanco1: TDataSource;
    Balanco1BLC_CODIGO: TIntegerField;
    Balanco1CNC_CODIGO: TIntegerField;
    Balanco1USU_CODIGO: TIntegerField;
    Balanco1BLC_DT_CADASTRO: TDateTimeField;
    Balanco1BLC_DT_ALTERADO: TDateTimeField;
    Balanco1FUN_RESPONSAVEL: TIntegerField;
    Balanco1BLC_TOTAL_PR_CUSTO: TFloatField;
    Balanco1BLC_TOTAL_PR_CUSTO_SIS: TFloatField;
    Balanco1BLC_TOTAL_VENDIDO: TFloatField;
    Balanco1BLC_TOTAL_VENDIDO_SIS: TFloatField;
    Balanco1BLC_TOTAL_INDISPONIVEL: TFloatField;
    Balanco1BLC_TOTAL_INDISPONIVEL_SIS: TFloatField;
    Balanco1BLC_A_RECEBER: TFloatField;
    Balanco1BLC_A_RECEBER_SIS: TFloatField;
    Balanco1BLC_A_PAGAR: TFloatField;
    Balanco1BLC_A_PAGAR_SIS: TFloatField;
    Balanco1BLC_SALDO_CAIXA: TFloatField;
    Balanco1BLC_SALDO_CAIXA_SIS: TFloatField;
    Balanco1BLC_SITUACAO: TIntegerField;
    Balanco1BLC_OBSERVACAO: TStringField;
    Label2: TLabel;
    edtTotalCustoSis: TEdit;
    Label3: TLabel;
    edtTotalVendido: TEdit;
    Label7: TLabel;
    edtTotalVendidoSis: TEdit;
    Label44: TLabel;
    dblCodigoCNC: TDBLookupComboBox;
    Label8: TLabel;
    edtSaldoCaixa: TEdit;
    Label9: TLabel;
    edtSaldoCaixaSis: TEdit;
    Label10: TLabel;
    edtTotalIndisponivel: TEdit;
    Label11: TLabel;
    edtTotalIndisponivelSis: TEdit;
    Label12: TLabel;
    edtTotalAReceber: TEdit;
    Label13: TLabel;
    edtTotalAReceberSis: TEdit;
    Label15: TLabel;
    edtTotalAPagar: TEdit;
    Label16: TLabel;
    edtTotalAPagarSis: TEdit;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoCabClick(Sender: TObject);
    procedure SB_AltCabClick(Sender: TObject);
    procedure SB_SalvaCabClick(Sender: TObject);
    procedure SB_CancCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure SB_ExcCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Balanco1AfterScroll(DataSet: TDataSet);
    procedure Balanco1CalcFields(DataSet: TDataSet);
    procedure dblCodigoCNCClick(Sender: TObject);
  private
    vCalcular: Boolean;
    procedure AtualizaControles(Habilitar: Boolean);
    procedure CalcularBalanco(CdCNC: integer);
  public
    { Public declarations }
    Entidade:TBalanco;
  end;

var
  fMxBalanco: TfMxBalanco;

implementation
Uses UDM, funcoes, SysConst;
{$R *.DFM}

procedure TfMxBalanco.AtualizaControles(Habilitar: Boolean);
begin
  IncluirCab.Enabled:=not Habilitar;
  AlterarCab.Enabled:=not Habilitar;
  ExcluirCab.Enabled:=not Habilitar;
  LocalizarCab.Enabled:=not Habilitar;
  SalvarCab.Enabled:=Habilitar;
  CancelarCab.Enabled:=Habilitar;
  SB_Prim.Enabled:=not Habilitar;
  SB_Ant.Enabled:=not Habilitar;
  SB_Prox.Enabled:=not Habilitar;
  SB_Ult.Enabled:=not Habilitar;
  SB_NovoCab.Enabled:=not Habilitar;
  SB_LocCab.Enabled:=not Habilitar;
  SB_AltCab.Enabled:=not Habilitar;
  SB_ExcCab.Enabled:=not Habilitar;
  SB_SalvaCab.Enabled:=Habilitar;
  SB_CancCab.Enabled:=Habilitar;

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
end;

procedure TfMxBalanco.SB_PrimClick(Sender: TObject);
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

procedure TfMxBalanco.SB_AntClick(Sender: TObject);
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

procedure TfMxBalanco.SB_ProxClick(Sender: TObject);
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

procedure TfMxBalanco.SB_UltClick(Sender: TObject);
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



procedure TfMxBalanco.SB_NovoCabClick(Sender: TObject);
begin
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(660)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir registro!');

  Entidade.PreparaInsercao;
  AtualizaControles(True);
//  edtUsuario.Text := DM.NomeUsuario(DM.Configuracao1.CodigoUSU);
  dblCodigoCNC.SetFocus;
end;

procedure TfMxBalanco.SB_AltCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(680)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');

  Entidade.PreparaAlteracao;
  AtualizaControles(True);
  edtTotalCusto.SetFocus;
end;

procedure TfMxBalanco.SB_SalvaCabClick(Sender: TObject);
var
  CdCNC, CdBLC: integer;
begin
  if not Entidade.Active then
    Entidade.Open;

  CdCNC := dblCodigoCNC.KeyValue;
  CdBLC := StrToInt(edtCodigoBLC.Text);

  if vCalcular then
    CalcularBalanco(CdCNC);

  if Entidade.FinalizaEdicao then
  Begin
    AtualizaControles(False);
//    edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM BALANCO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND BLC_CODIGO='+IntToStr(CdBLC);
    Entidade.Open;
  end
  else
    ShowMessage('As alterações não foram salvas!');
End;

procedure TfMxBalanco.SB_CancCabClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(False);
end;

procedure TfMxBalanco.FormCreate(Sender: TObject);
begin
  Entidade := Balanco1;
  vCalcular := False;
end;

procedure TfMxBalanco.SB_LocCabClick(Sender: TObject);
begin
  Entidade.Selecionar;
  if Entidade.IsEmpty then
    Entidade.LimpaCampos;
end;

procedure TfMxBalanco.SB_ExcCabClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Não há dados a serem excluídos!');
  if (not DM.Configuracao1.CPD) then
    raise Exception.Create('Somente no CPD!')
  else if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(670)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Entidade.deletarauto;
end;

procedure TfMxBalanco.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Funcionario1.Close;
  CentroCusto2.Close;
  Action:=cafree;
end;

procedure TfMxBalanco.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxBalanco.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if SB_SalvaCab.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxBalanco.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  CentroCusto2.Open;
  Funcionario1.Open;
  Entidade.Open;
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;  
end;

procedure TfMxBalanco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
  Begin
    Key:=#0;
    if SB_CancCab.Enabled then
    Begin
      SB_CancCab.SetFocus;
      SB_CancCabClick(sender);
    end
    else
      Close;
  end
  else if Key=chr(13) then
  Begin
    if SB_SalvaCab.Enabled then
    Begin
      Key:=#0;
      SB_SalvaCab.SetFocus;
      SB_SalvaCabClick(sender);
    end;
  end;
end;

procedure TfMxBalanco.Balanco1AfterScroll(DataSet: TDataSet);
begin
  Entidade.carregadados;
//  edtUsuario.Text:=Entidade.FieldByName('Usuario').asString;
end;

procedure TfMxBalanco.Balanco1CalcFields(DataSet: TDataSet);
begin
  Entidade.FieldByName('Usuario').asString := DM.NomeUsuario(Entidade.CodigoUSU);
end;

procedure TfMxBalanco.dblCodigoCNCClick(Sender: TObject);
begin
  vCalcular := True;
  if MessageDlg('Deseja Realizar os Cálculos?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    CalcularBalanco(dblCodigoCNC.KeyValue);
end;

procedure TfMxBalanco.CalcularBalanco(CdCNC: integer);
var
  vSaldoCaixa, vPrecoCusto, vTituloAReceber, vTotalVendido, vIndisponivel,
    vTituloAPagar: Double;
  sUltimoBalanco,sFiltroData: string;
begin
  sUltimoBalanco := '';
  with DM.QR_Consultas do
  Begin
    //Verificar data do Último Balanço
    Close;
    SQL.Text := 'SELECT MAX(BLC_DT_CADASTRO) AS ULTIMO '+
      ' FROM BALANCO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC);
    Open;
    if not IsEmpty then
      sUltimoBalanco := formatDateTime('dd/mm/yyyy',FieldByName('ULTIMO').AsDateTime);

    //Saldo Geral do Caixa
    Close;
    SQL.Text := 'SELECT SUM(MVC_VALOR) AS CREDITO '+
      ' FROM MOVIMENTO_DE_CAIXA T1 '+
      ' WHERE MVC_DC="C" '+
      ' AND CNC_CODIGO='+IntToStr(CdCNC);
    Open;
    vSaldoCaixa := FieldByName('CREDITO').asFloat;

    Close;
    SQL.Text := 'SELECT SUM(MVC_VALOR) AS DEBITO '+
      ' FROM MOVIMENTO_DE_CAIXA T1 '+
      ' WHERE MVC_DC="D" '+
      ' AND CNC_CODIGO='+IntToStr(CdCNC);
    Open;
    vSaldoCaixa := vSaldoCaixa - FieldByName('DEBITO').asFloat;

    //Calcular Patrimônio da Empresa (Preço de Custo)
    Close;
    SQL.Text := 'SELECT SUM((I1.IES_SCOMERCIAL-I1.IES_SRESERVADO-I1.IES_INDISPONIVEL)*P1.PRD_CUSTO) AS TOTAL '+
      ' FROM PRODUTO P1, ITEM_DE_ESTOQUE I1 '+
      ' WHERE I1.CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND P1.PRD_CODIGO=I1.PRD_CODIGO ';
    Open;
    vPrecoCusto := FieldByName('TOTAL').asFloat;

    //Calcular Indisponível da Empresa (Preço de Custo)
    Close;
    SQL.Text := 'SELECT SUM(I1.IES_INDISPONIVEL*P1.PRD_CUSTO) AS TOTAL '+
      ' FROM PRODUTO P1, ITEM_DE_ESTOQUE I1 '+
      ' WHERE I1.CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND P1.PRD_CODIGO=I1.PRD_CODIGO ';
    Open;
    vIndisponivel := FieldByName('TOTAL').asFloat;

    //Títulos a Receber
    Close;
    SQL.Text := 'SELECT SUM(TRC_VALOR) AS TOTAL '+
      ' FROM TITULO_A_RECEBER '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND TRC_SITUACAO IN (0,1,8,9) ';
    Open;
    vTituloAReceber := FieldByName('TOTAL').asFloat;

    //Títulos a Pagar
    Close;
    SQL.Text := 'SELECT SUM(TPG_VALOR) AS TOTAL '+
      ' FROM TITULO_A_PAGAR '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND TPG_SITUACAO=0 ';
    Open;
    vTituloAPagar := FieldByName('TOTAL').asFloat;

    //Total Vendido (Vendas)
    if sUltimoBalanco <> '' then
    Begin
      if DM.Configuracao1.Empresa = empLBM then
        sFiltroData := ' AND PDV_NOTA_FISCAL<>0 '+
                       ' AND PDV_DT_EMISSAO_VENDA>"'+MesDia(sUltimoBalanco)+'" '
      else
        sFiltroData := ' AND PDV_DATA_HORA>"'+MesDia(sUltimoBalanco)+'" ';
    end
    else
      sFiltroData := '';
    Close;
    SQL.Text := 'SELECT SUM(PDV_TOTAL+PDV_ACRESCIMO) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_SITUACAO=4 '+
      sFiltroData;
    Open;
    vTotalVendido := FieldByName('TOTAL').asFloat;

    //Total Vendido (Devoluções - Totais)
    if sUltimoBalanco <> '' then
    Begin
      if DM.Configuracao1.Empresa = empLBM then
        sFiltroData := ' AND PDV_NOTA_FISCAL<>0 '+
                       ' AND PDV_DT_DEVOLUCAO>"'+MesDia(sUltimoBalanco)+'" '
      else
        sFiltroData := ' AND PDV_DT_DEVOLUCAO>"'+MesDia(sUltimoBalanco)+'" ';
    end
    else
      sFiltroData := '';
    Close;
    SQL.Text := 'SELECT SUM(PDV_TOTAL+PDV_ACRESCIMO) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND PDV_SITUACAO=8 '+
      sFiltroData;
    Open;
    vTotalVendido := vTotalVendido - FieldByName('TOTAL').asFloat;

    //Total Vendido (Devoluções - Parciais)
    if sUltimoBalanco <> '' then
    Begin
      if DM.Configuracao1.Empresa = empLBM then
        sFiltroData := ' AND P1.PDV_NOTA_FISCAL<>0 '+
                       ' AND T1.TRO_DATA>"'+MesDia(sUltimoBalanco)+'" '
      else
        sFiltroData := ' AND T1.TRO_DATA>"'+MesDia(sUltimoBalanco)+'" ';
    end
    else
      sFiltroData := '';
    Close;
    SQL.Text := 'SELECT SUM(I1.ITO_QUANTIDADE*ROUND(I1.ITO_VALOR,2)) AS TOTAL '+
      ' FROM TROCA T1, ITEM_DE_TROCA I1, PEDIDO_DE_VENDA P1 '+
      ' WHERE I1.ITO_SITUACAO=1 '+
      sFiltroData+
      ' AND P1.PDV_CODIGO=T1.PDV_CODIGO '+
      ' AND T1.TRO_CODIGO=I1.TRO_CODIGO ';
    Open;
    vTotalVendido := vTotalVendido - FieldByName('TOTAL').asFloat;
  end;
  edtTotalCustoSis.Text        := format('%.2f',[vPrecoCusto]);
  edtTotalVendidoSis.Text      := format('%.2f',[vTotalVendido]);
  edtSaldoCaixaSis.Text        := format('%.2f',[vSaldoCaixa]);
  edtTotalIndisponivelSis.Text := format('%.2f',[vIndisponivel]);
  edtTotalAReceberSis.Text     := format('%.2f',[vTituloAReceber]);
  edtTotalAPagarSis.Text       := format('%.2f',[vTituloAPagar]);
  vCalcular := False;
end;

end.
