unit MxBoletimFechaCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, CentroCusto, DBCtrls, Parametro, Menus, Boletim_Diario, Caixa,
  Funcionario, Conta_de_Caixa, Movimento_caixa, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, ActnList, XPStyleActnCtrls;

type
  TfMxBoletimFechaCaixa = class(TForm)
    Panel13: TPanel;
    Label1: TLabel;
    edtCodigoBDL: TEdit;
    Label8: TLabel;
    Label2: TLabel;
    dblResponsavel: TDBLookupComboBox;
    Label4: TLabel;
    Label3: TLabel;
    mskDataHora: TMaskEdit;
    Panel1: TPanel;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_CancPed: TBitBtn;
    SB_SalvaPed: TBitBtn;
    SB_NovoPed: TSpeedButton;
    Boletim_Diario1: TBoletim_Diario;
    Funcionario1: TFuncionario;
    DSFuncionario1: TDataSource;
    Boletim_Diario1Funcionario: TStringField;
    Boletim_Diario1BLD_CODIGO: TIntegerField;
    Boletim_Diario1CNC_CODIGO: TIntegerField;
    Boletim_Diario1FUN_CODIGO: TIntegerField;
    Boletim_Diario1CAX_CODIGO: TIntegerField;
    Boletim_Diario1BLD_DATA: TDateTimeField;
    Boletim_Diario1BLD_TOTAL_DINHEIRO: TFloatField;
    DSBoletim_Diario1: TDataSource;
    Boletim_Diario1BLD_TOTAL_CARTAO: TFloatField;
    Boletim_Diario1BLD_TOTAL_CHEQUE: TFloatField;
    SB_Imp: TSpeedButton;
    Caixa1: TCaixa;
    DSCaixa1: TDataSource;
    Label7: TLabel;
    dblCaixa: TDBLookupComboBox;
    Label5: TLabel;
    edtTotalDinheiro: TEdit;
    edtTotalCheque: TEdit;
    Label6: TLabel;
    Label15: TLabel;
    edtTotalCartao: TEdit;
    Label9: TLabel;
    edtTipo: TEdit;
    Boletim_Diario1BLD_TIPO: TStringField;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    edtPreDatado: TEdit;
    Boletim_Diario1BLD_TOTAL_PREDATADO: TFloatField;
    Boletim_Diario1BLD_OBSERVACAO: TStringField;
    edtObservacao: TEdit;
    SB_SelecionarCheques: TSpeedButton;
    ActionManager1: TActionManager;
    IncluirPed: TAction;
    SalvarPed: TAction;
    CancelarPed: TAction;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoPedClick(Sender: TObject);
    procedure SB_SalvaPedClick(Sender: TObject);
    procedure SB_CancPedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CentroCusto1AfterScroll(DataSet: TDataSet);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Boletim_Diario1AfterScroll(DataSet: TDataSet);
    procedure SB_ImpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Boletim_Diario1BeforeOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Caixa1BeforeOpen(DataSet: TDataSet);
    procedure SB_SelecionarChequesClick(Sender: TObject);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
    { Private declarations }
  public
    Entidade: TBoletim_Diario;
  end;

var
  fMxBoletimFechaCaixa: TfMxBoletimFechaCaixa;

implementation
Uses
  UDM, Funcoes, UBoletim, MxSelecionaCheques;
{$R *.DFM}

procedure TfMxBoletimFechaCaixa.SB_PrimClick(Sender: TObject);
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

procedure TfMxBoletimFechaCaixa.SB_AntClick(Sender: TObject);
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

procedure TfMxBoletimFechaCaixa.SB_ProxClick(Sender: TObject);
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

procedure TfMxBoletimFechaCaixa.SB_UltClick(Sender: TObject);
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

procedure TfMxBoletimFechaCaixa.SB_NovoPedClick(Sender: TObject);
begin
  if (DM.Configuracao1.Empresa = empMotical) then
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 LOG_DATA_HORA '+
        ' FROM LOG '+
        ' WHERE LOG_DATA_HORA>="'+MesDia(DM.Configuracao1.Data+1)+'" ';
      Open;
      if not IsEmpty then
        Raise exception.Create('Já existe Log com data superior a atual do sistema!');
    end;
  end;
  
  Entidade.PreparaInsercao;
  dblCaixa.KeyValue := DM.Configuracao1.CodigoCAX;
  AtualizaControles(1, True);
  if dblCaixa.Text = '' then
  Begin
    SB_CancPedClick(sender);
    ShowMessage('Máquina configurada para Caixa inválido!');
    Exit;
  end;
  dblResponsavel.SetFocus;
end;

procedure TfMxBoletimFechaCaixa.SB_SalvaPedClick(Sender: TObject);
Var
  Mensagem:String;
  vTotalDinheiro, vTotalCheque, vTotalPreDatado, vTotalCartao: Double;
  trans:boolean;
  CdCNC, CdBLD: integer;    
begin
  Mensagem := '';
  If not VerificaFloatBranco(edtTotalDinheiro.Text) then
    Mensagem:='Total em dinheiro digitado incorretamente!'+#13;
  If not VerificaFloatBranco(edtTotalCheque.Text) then
    Mensagem:=mensagem+'Total em cheque digitado incorretamente!'+#13;
  If not VerificaFloatBranco(edtPreDatado.Text) then
    Mensagem:=mensagem+'Total em PréDatados digitado incorretamente!'+#13;
  If not VerificaFloatBranco(edtTotalCartao.Text) then
    Mensagem:=mensagem+'Total em outros digitado incorretamente!'+#13;
  If Mensagem<>'' then
    Raise Exception.Create(Mensagem);

  CdCNC := Entidade.CodigoCNC;
  CdBLD := Entidade.CodigoBLD;
  vTotalDinheiro  := StrToFloat(edtTotalDinheiro.Text);
  vTotalCheque    := StrToFloat(edtTotalCheque.Text);
  vTotalPreDatado := StrToFloat(edtPreDatado.Text);
  vTotalCartao    := StrToFloat(edtTotalCartao.Text);

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      if not Entidade.FinalizaEdicao then
        Raise exception.Create('');

      If vTotalDinheiro<>0 then
      Begin
        //Incluir o movimento de caixa
        if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,DM.Configuracao1.ContaFechaCaixa,
             DM.Configuracao1.ContaFechaCaixa,DM.Configuracao1.CodigoCAX,
             5,68,0,0 (*CdCHQCNC*),0 (*CdCHQ*),
             'FECHAMENTO CAIXA'+IntToStr(DM.Configuracao1.CodigoCAX)+'(DI)'+
             formatDateTime('hh:mm',DM.Configuracao1.DataHora),'0',
             '','','','D',vTotalDinheiro,0(*Desconto*),0(*Juros*),
             0(*CredCli*),vTotalDinheiro(*ValorDoc*),
             DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
             0(*DtCheque*),0,0,'F') then
        Begin
          ShowMessage('Falha ao Gerar Mov. de Caixa!');
          Raise exception.Create('');
        end;
      end;

      If vTotalCheque<>0 then
      Begin
        //Incluir o movimento de caixa
        if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,DM.Configuracao1.ContaFechaCaixa,
             DM.Configuracao1.ContaFechaCaixa,DM.Configuracao1.CodigoCAX,
             6,68,0,0 (*CdCHQCNC*),0 (*CdCHQ*),
             'FECHAMENTO CAIXA'+IntToStr(DM.Configuracao1.CodigoCAX)+'(CH)'+
             formatDateTime('hh:mm',DM.Configuracao1.DataHora),'0',
             '','','','D',vTotalCheque,0(*Desconto*),0(*Juros*),
             0(*CredCli*),vTotalCheque(*ValorDoc*),
             DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
             0(*DtCheque*),0(*CdTIT*),0(*CdCNCTit*),'F') then
        Begin
          ShowMessage('Falha ao Gerar Mov. de Caixa!');
          Raise exception.Create('');
        end;
      end;

      If vTotalPreDatado<>0 then
      Begin
        if DM.Configuracao1.Empresa <> empMotical then //Não alterar Saldo do Caixa
        Begin
          //Incluir o movimento de caixa
          if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,DM.Configuracao1.ContaFechaCaixa,
               DM.Configuracao1.ContaFechaCaixa,DM.Configuracao1.CodigoCAX,
               6,68,0,0 (*CdCHQCNC*),0 (*CdCHQ*),
               'FECHAMENTO CAIXA'+IntToStr(DM.Configuracao1.CodigoCAX)+
               '(Pre:'+format('%.2f',[vTotalPreDatado])+')'+
               formatDateTime('hh:mm',DM.Configuracao1.DataHora),'0'(*Flag*),
               ''(*Numero*),''(*Obs*),''(*Seq*),'D',0(*Valor*),0(*Desconto*),0(*Juros*),
               0(*CredCli*),vTotalPreDatado(*ValorDoc*),
               DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
               0(*DtCheque*),0,0,'F') then
          Begin
            ShowMessage('Falha ao Gerar Mov. de Caixa!');
            Raise exception.Create('');
          end;
        end
        else //Alterar o Saldo do Caixa (MOTICAL)
        Begin
          //Incluir o movimento de caixa
          if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,DM.Configuracao1.ContaFechaCaixa,
               DM.Configuracao1.ContaFechaCaixa,DM.Configuracao1.CodigoCAX,
               6,68,0,0 (*CdCHQCNC*),0 (*CdCHQ*),
               'FECHAMENTO CAIXA'+IntToStr(DM.Configuracao1.CodigoCAX)+
               '(Pre-Datado)'+
               formatDateTime('hh:mm',DM.Configuracao1.DataHora),'0'(*Flag*),
               ''(*Numero*),''(*Obs*),''(*Seq*),'D',vTotalPreDatado(*Valor*),0(*Desconto*),0(*Juros*),
               0(*CredCli*),vTotalPreDatado(*ValorDoc*),
               DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
               0(*DtCheque*),0,0,'F') then
          Begin
            ShowMessage('Falha ao Gerar Mov. de Caixa!');
            Raise exception.Create('');
          end;
        end;
      end;

      If vTotalCartao<>0 then
      Begin
        //Incluir o movimento de caixa
        if DM.Configuracao1.Empresa <> empPetromax then
        Begin
          if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,DM.Configuracao1.ContaFechaCaixa,
               DM.Configuracao1.ContaFechaCaixa,DM.Configuracao1.CodigoCAX,
               13,68,0,0 (*CdCHQCNC*),0 (*CdCHQ*),
               'FECHAMENTO CAIXA'+IntToStr(DM.Configuracao1.CodigoCAX)+
               '(Outros='+format('%.2f',[vTotalCartao])+')'+
               formatDateTime('hh:mm',DM.Configuracao1.DataHora),'0',
               ''(*Número*),''(*Obs*),''(*Seq*),'D',0(*Valor*),0(*Desconto*),0(*Juros*),
               0(*CredCli*),vTotalCartao(*ValorDoc*),
               DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
               0(*DtCheque*),0(*CdTit*),0(*CdCNCTit*),'F') then
          Begin
            ShowMessage('Falha ao Gerar Mov. de Caixa!');
            Raise exception.Create('');
          end;
        end
        else //Alterar saldo do caixa (Petromax)
        Begin
          if not DM.Movimento_caixa1.Inserir(DM.Configuracao1.CodigoCNC,0,DM.Configuracao1.ContaFechaCaixa,
               DM.Configuracao1.ContaFechaCaixa,DM.Configuracao1.CodigoCAX,
               13,68,0,0 (*CdCHQCNC*),0 (*CdCHQ*),
               'FECHAMENTO CAIXA'+IntToStr(DM.Configuracao1.CodigoCAX)+'(CA)'+
               formatDateTime('hh:mm',DM.Configuracao1.DataHora),'0',
               '','','','D',vTotalCartao(*Valor*),0(*Desconto*),0(*Juros*),
               0(*CredCli*),vTotalCartao(*ValorDoc*),
               DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
               0(*DtCheque*),0(*CdTit*),0(*CdCNCTit*),'F') then
          Begin
            ShowMessage('Falha ao Gerar Mov. de Caixa!');
            Raise exception.Create('');
          end;
        end;
      end;

      If DM.Configuracao1.ControleTransacao then
         Commit;
      AtualizaControles(1, False);
      Entidade.Close;
      Entidade.Open;
      Entidade.LocalizarCod(CdBLD,CdCNC);
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
          RollBack;
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
    end;
  End;

end;

procedure TfMxBoletimFechaCaixa.SB_CancPedClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  AtualizaControles(1, False);
end;

procedure TfMxBoletimFechaCaixa.FormCreate(Sender: TObject);
begin
  Entidade:=Boletim_Diario1;
end;

procedure TfMxBoletimFechaCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Entidade.Close;
  Funcionario1.Close;
  Caixa1.Close;
  Action:=Cafree;
end;

procedure TfMxBoletimFechaCaixa.CentroCusto1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxBoletimFechaCaixa.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxBoletimFechaCaixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_SalvaPed.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxBoletimFechaCaixa.Boletim_Diario1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxBoletimFechaCaixa.SB_ImpClick(Sender: TObject);
begin
  if edtCodigoBDL.Text <> '' then
  Begin
    Application.CreateForm(Trpt_Boletim,rpt_Boletim);
    with rpt_Boletim do
    Begin
      Tag := 0;
      zrlTituloBoletim.Caption := 'SIAC - Boletim Diario FECHAMENTO'; 
      Boletim_Diario1.ParamByName('BLDCOD').AsInteger:=StrToInt(self.edtCodigoBDL.Text);
      Boletim_Diario1.ParamByName('CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
      Boletim_Diario1.Open;
      if Boletim_Diario1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      report.Preview;
      Close;
    end;
  end
  else
    ShowMessage('Efetue o Fechamento de Caixa!');
end;

procedure TfMxBoletimFechaCaixa.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Open;

  Funcionario1.Close;
  if f_Sistema = tsGerenciador then
    Funcionario1.SQL.Text := ' SELECT * FROM FUNCIONARIO '+
                             ' WHERE FUN_FUNCAO=60 OR FUN_FUNCAO=56 '+
                             ' AND FUN_SITUACAO <> 1 ' + //Não mostrar funcionarios desativados
                             ' ORDER BY FUNCIONARIO.FUN_NOME';
  Funcionario1.Open;

  with Caixa1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CAIXA ';
    Open;
  end;
end;

procedure TfMxBoletimFechaCaixa.Boletim_Diario1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('DATAINI').AsDate:=DM.Configuracao1.Data;
  Entidade.ParamByName('DATAFIM').AsDate:=DM.Configuracao1.Data+1;
  Entidade.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
end;

procedure TfMxBoletimFechaCaixa.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_CancPed.Enabled then
    Begin
      SB_CancPed.SetFocus;
      SB_CancPedClick(sender);
    end
    else
      Close;
  end
  else If key=chr(13) then
  Begin
    if SB_SalvaPed.Enabled then
    Begin
      SB_SalvaPed.SetFocus;
      SB_SalvaPedClick(sender);
    end;
  end
  else if ((edtTotalDinheiro.Focused)or(edtTotalCheque.Focused)or(edtPreDatado.Focused)or(edtTotalCartao.Focused))and(Key = '.') then
    Key := ',';
end;

procedure TfMxBoletimFechaCaixa.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  IncluirPed.Enabled    := not Habilitar;
  SalvarPed.Enabled     := ((Cabecalho=1) and Habilitar);
  CancelarPed.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_Prim.Enabled       := not Habilitar;
  SB_Ant.Enabled        := not Habilitar;
  SB_Prox.Enabled       := not Habilitar;
  SB_Ult.Enabled        := not Habilitar;
  SB_NovoPed.Enabled    := not Habilitar;
  SB_SalvaPed.Enabled   := ((Cabecalho=1) and Habilitar);
  SB_CancPed.Enabled    := ((Cabecalho=1) and Habilitar);

  SB_SelecionarCheques.Enabled := Habilitar;  
  SB_Imp.Enabled               := not Habilitar;

  DBGrid1.Enabled       := not Habilitar;
end;

procedure TfMxBoletimFechaCaixa.Caixa1BeforeOpen(DataSet: TDataSet);
begin
  try
    Caixa1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
  except
  end;
end;

procedure TfMxBoletimFechaCaixa.SB_SelecionarChequesClick(Sender: TObject);
begin
  Application.CreateForm(TfMxSelecionaCheques,fMxSelecionaCheques);
  with fMxSelecionaCheques do
  Begin
    Tag := 0;
    CdCNC := self.Entidade.CodigoCNC;
    CdBLD := self.Entidade.CodigoBLD;    
    ShowModal;
  end;
end;

end.
