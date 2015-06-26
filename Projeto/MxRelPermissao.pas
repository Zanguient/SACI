unit MxRelPermissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Buttons, Operacao_do_Sistema, Submodulo,
  Modulo, Db, DBTables, SQuery, Usuario, Permissao, ComCtrls, Menus,
  CentroCusto;

type
  TfMxRelPermis = class(TForm)
    Panel3: TPanel;
    SB_Fechar: TSpeedButton;
    Usuario1: TUsuario;
    DSUsuario1: TDataSource;
    Permissao2: TPermissao;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    PageControl1: TPageControl;
    tabGrafico: TTabSheet;
    trvArvoreOperacao: TTreeView;
    dblUsuarioGrafico: TDBLookupComboBox;
    Label4: TLabel;
    Submodulo2: TSubmodulo;
    Operacao_do_Sistema2: TOperacao_do_Sistema;
    Permissao3: TPermissao;
    Permissao2PRM_DT_CADASTRO: TDateTimeField;
    Permissao4: TPermissao;
    PopupMenu1: TPopupMenu;
    Ajuda1: TMenuItem;
    IncluirTodos1: TMenuItem;
    ExcluirTodos1: TMenuItem;
    N1: TMenuItem;
    QueryAux: TQuery;
    DSCentroCusto2: TDataSource;
    CentroCusto2: TCentroCusto;
    dblCodigoCNC: TDBLookupComboBox;
    Label8: TLabel;
    Modulo1: TModulo;
    Query1: TQuery;
    SB_Perfil: TSpeedButton;
    SB_ExcluirPermissoes: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_PerfilClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblUsuarioGraficoClick(Sender: TObject);
    procedure trvArvoreOperacaoDblClick(Sender: TObject);
    procedure SB_ExcluirPermissoesClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure ExcluirTodos1Click(Sender: TObject);
    procedure IncluirTodos1Click(Sender: TObject);
    procedure dblCodigoCNCClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Usuario1BeforeOpen(DataSet: TDataSet);
    procedure AlterarPermissaoCabClick(Sender: TObject);
    procedure Permissao2BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  cImagemTrue = 8;
  cImagemFalse = 9;
var
  fMxRelPermis: TfMxRelPermis;

implementation
Uses UDM, Funcoes, MxPerfil, UPrinc2;

{$R *.DFM}


procedure TfMxRelPermis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    Usuario1.Close;
    Permissao2.Close;
    DM.Usuario1.CarregaPermissoes(DM.Usuario1.CodigoUSU);

    try
      DM.Usuario1.ConfiguraTela(self);
    except
    end;

  except
  end;
  Action:=caFree;
end;


procedure TfMxRelPermis.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxRelPermis.SB_PerfilClick(Sender: TObject);
begin
  if dblUsuarioGrafico.Text = '' then
    Raise exception.Create('Selecione um usuário para atribuir as permissões!');

  Application.CreateForm(TfMxPerfil, fMxPerfil);
  fMxPerfil.ShowModal;
  dblUsuarioGraficoClick(sender);
end;

procedure TfMxRelPermis.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  PageControl1.ActivePage := tabGrafico;

  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX MDLDESC ON MODULO (MDL_DESCRICAO)');
  Except
  end;
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX SMLDESC ON SUBMODULO (SML_DESCRICAO)');
  Except
  end;
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX OPSDESC ON OPERACAO_DO_SISTEMA (OPS_OPERACAO)');
  Except
  end;
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX PRMUSUOPS ON PERMISSAO (USU_CODIGO,OPS_OPERACAO)');
  Except
  end;

  dblUsuarioGrafico.SetFocus;
end;

procedure TfMxRelPermis.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxRelPermis.dblUsuarioGraficoClick(Sender: TObject);
Var
  Pai, Filho, Neto : TtreeNode;
begin
  trvArvoreOperacao.Items.Clear;
  if dblUsuarioGrafico.Text = '' then
    Exit;
  if not Modulo1.Active then
    Modulo1.Open;
  Modulo1.First;
  with Modulo1 do
  begin
    while not eof do
    begin
      Pai := trvArvoreOperacao.Items.AddChild(nil,PreencheZero(5,CodigoMDL)+'-'+Descricao);
      Pai.ImageIndex := 31;
      Pai.SelectedIndex := 31;
      //
      SubModulo2.Close;
      SubModulo2.ParamByName('MDL_CODIGO').asInteger := CodigoMDL;
      SubModulo2.Open;
      SubModulo2.First;
      while not SubModulo2.Eof do
      begin
        Filho := trvArvoreOperacao.Items.AddChild(Pai, PreencheZero(5,SubModulo2.CodigoSML)+'-'+SubModulo2.Descricao);
        Filho.ImageIndex := 30;
        Filho.SelectedIndex := 30;
        //
        Operacao_do_Sistema2.Close;
        Operacao_do_Sistema2.ParamByName('SML_CODIGO').asInteger := SubModulo2.CodigoSML;
        Operacao_do_Sistema2.Open;
        Operacao_do_Sistema2.First;
        while not Operacao_do_Sistema2.Eof do
        begin
          Neto := trvArvoreOperacao.Items.AddChild(Filho, PreencheZero(5,Operacao_do_Sistema2.CodigoOPS)+'-'+Operacao_do_Sistema2.Operacao);
          Permissao3.Close;
          Permissao3.ParamByName('USU_CODIGO').asInteger := dblUsuarioGrafico.KeyValue;
          Permissao3.ParamByName('OPS_CODIGO').asInteger := Operacao_do_Sistema2.CodigoOPS;
          Permissao3.Open;
          if Permissao3.IsEmpty then
          begin
            Neto.ImageIndex := cImagemFalse;
            Neto.SelectedIndex := cImagemFalse;
          end
          else
          begin
            Neto.ImageIndex := cImagemTrue;
            Neto.SelectedIndex := cImagemTrue;
          end;
          Operacao_do_Sistema2.Next;
        end;
        SubModulo2.Next;
      end;
      Next;
    end;
  end;
end;

procedure TfMxRelPermis.trvArvoreOperacaoDblClick(Sender: TObject);
var
  TN:TTreeNode;
  CdCNCUSU, CdUSU, CdOPS: integer;
  vPerfil, vInserir: Boolean;
  sOperacao: string;
begin
  if trvArvoreOperacao.Items.Count <= 0 then
    Exit;
  if trvArvoreOperacao.Selected = nil then
    Exit;

  TN := trvArvoreOperacao.Selected;
  if TN.ImageIndex >= 30 then //Não é item
    Exit;

  CdCNCUSU  := Usuario1.CodigoCNC;
  vPerfil   := Usuario1.Perfil;
  CdUSU     := dblUsuarioGrafico.KeyValue;
  CdOPS     := StrToInt(Copy(TN.Text,1,5));
  sOperacao := Copy(TN.Text,7,Length(TN.Text)-6);

  vInserir := False;
  if (TN.ImageIndex = cImagemFalse) then //Não tem a permissão
  Begin
    vInserir := True;
    trvArvoreOperacao.Selected.ImageIndex := cImagemTrue;
    trvArvoreOperacao.Selected.SelectedIndex := cImagemTrue;
    Permissao2.Inserir(0,1,CdOPS,CdUSU,0(*Perfil*));

    Permissao2.GeraLog(2000,0,CdOPS,'USU:'+PreencheZero(2,CdCNCUSU)+'-'+IntToStr(CdUSU)+
                       ' Permissao:'+sOperacao);
  end
  else if (TN.ImageIndex = cImagemTrue) then //Tem a permissão
  Begin
    if not Permissao2.DeletaForcado(DM.QR_Comandos,-1(*Ignorar CNC*),CdOPS,CdUSU,False) then
      Exit;
    trvArvoreOperacao.Selected.ImageIndex := cImagemFalse;
    trvArvoreOperacao.Selected.SelectedIndex := cImagemFalse;
    Permissao2.GeraLog(2020,0,CdOPS,'USU:'+PreencheZero(2,CdCNCUSU)+'-'+IntToStr(CdUSU)+
                       ' Permissao:'+sOperacao);
  end;

  if (DM.Configuracao1.Empresa = empEletro) and
     vPerfil then
  Begin
    with Query1 do
    Begin
      Close;
      SQL.Text := 'SELECT DISTINCT USU_CODIGO '+
        ' FROM PERMISSAO PRM '+
        ' WHERE PRM_PERFIL='+IntToStr(CdUSU);
      Open;
      if not isEmpty then
      Begin
        if MessageDlg('Deseja propagar essa alteração para demais usuários do perfil?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
        while not Eof do
        Begin
          Permissao3.Close;
          Permissao3.ParamByName('USU_CODIGO').asInteger := FieldByName('USU_CODIGO').asInteger;
          Permissao3.ParamByName('OPS_CODIGO').asInteger := CdOPS;
          Permissao3.Open;
          if vInserir then
          Begin
            if Permissao3.IsEmpty then
            Begin
              Permissao2.Inserir(0,1,CdOPS,FieldByName('USU_CODIGO').asInteger,CdUSU(*Perfil*));
              Permissao2.GeraLog(2000,0,CdOPS,'USU:'+PreencheZero(2,CdCNCUSU)+'-'+FieldByName('USU_CODIGO').asString+
                                 ' Permissao:'+sOperacao+
                                 ' PERFIL:'+IntToStr(CdUSU));
            end;
          end
          else //Excluir
          Begin
            if not Permissao3.IsEmpty then
            Begin
              if not Permissao2.DeletaForcado(DM.QR_Comandos,-1(*Ignorar CNC*),CdOPS,FieldByName('USU_CODIGO').asInteger,False) then
                Exit;
              Permissao2.GeraLog(2020,0,CdOPS,'USU:'+PreencheZero(2,CdCNCUSU)+'-'+FieldByName('USU_CODIGO').asString+
                                 ' Permissao:'+sOperacao+
                                 ' PERFIL:'+IntToStr(CdUSU));
            end;
          end;
          Next;
        end;
      end;
    end;
  end;

  trvArvoreOperacao.Refresh;
end;

procedure TfMxRelPermis.SB_ExcluirPermissoesClick(Sender: TObject);
begin
  if dblUsuarioGrafico.Text = '' then
    Raise exception.Create('Selecione um usuário para atribuir as permissões!');

  if MessageDlg('Deseja remover todas as operações deste usuário?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  with Permissao4 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM PERMISSAO P1, OPERACAO_DO_SISTEMA O1 '+
      ' WHERE P1.USU_CODIGO='+IntToStr(dblUsuarioGrafico.KeyValue)+
      ' AND P1.OPS_CODIGO=O1.OPS_CODIGO ';
    Open;
    first;
    While not eof do
    Begin
      Permissao2.GeraLog(2020,0,CodigoOPS,'USU:'+
                         PreencheZero(2,Usuario1.CodigoCNC)+'-'+IntToStr(CodigoUSU)+
                         ' Permissao:'+FieldByName('OPS_OPERACAO').asString);
      ExecutaSQL(DM.QR_Comandos, 'DELETE FROM PERMISSAO '+
        ' WHERE OPS_CODIGO='+IntToStr(CodigoOPS)+
        ' AND USU_CODIGO='+IntToStr(CodigoUSU));
      next;
    end;
  end;
  Permissao2.Close;
  Permissao2.open;
  dblUsuarioGraficoClick(sender);
end;

procedure TfMxRelPermis.Ajuda1Click(Sender: TObject);
var
  TN:TTreeNode;
  CdOPS: integer;
begin
  if trvArvoreOperacao.Items.Count <= 0 then
    Exit;
  if trvArvoreOperacao.Selected = nil then
    Exit;

  TN := trvArvoreOperacao.Selected;
  if TN.ImageIndex >= 30 then //Não é item
    Exit;

  CdOPS     := StrToInt(Copy(TN.Text,1,5));

  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM OPERACAO_DO_SISTEMA '+
      ' WHERE OPS_CODIGO='+IntToStr(CdOPS);
    Open;
    ShowMessage(Trim(FieldByName('OPS_OPERACAO').asString)+#13+#13+ //Descrição da Operação
                Trim(FieldByName('OPS_COMPONENTE').asString)); //Observação da Operação
  end;
end;

procedure TfMxRelPermis.ExcluirTodos1Click(Sender: TObject);
var
  TN, TNFilho:TTreeNode;
  i, CdCNCUSU, CdUSU: integer;
  sMDLSML: string;
begin
  if trvArvoreOperacao.Items.Count <= 0 then
    Exit;
  if trvArvoreOperacao.Selected = nil then
    Exit;

  sMDLSML := '';
  TN := trvArvoreOperacao.Selected;
  if TN.ImageIndex = 30 then //É um SubGrupo
  Begin
    sMDLSML := ' AND O1.SML_CODIGO='+Copy(TN.Text,1,5);
    TNFilho := TN.GetNext;
  end
  else if TN.ImageIndex = 31 then //É um Grupo
  Begin
    sMDLSML := ' AND O1.MDL_CODIGO='+Copy(TN.Text,1,5);
    TNFilho := TN.GetNext;
    trvArvoreOperacao.Select(TNFilho);
    if TNFilho.ImageIndex = 30 then
      TNFilho := TNFilho.GetNext;
  end
  else
    Exit;

  CdCNCUSU  := Usuario1.CodigoCNC;
  CdUSU     := dblUsuarioGrafico.KeyValue;

  trvArvoreOperacao.Select(TNFilho);

  with QueryAux do
  Begin
    Close;
    SQL.Text := 'SELECT O1.* '+
      ' FROM PERMISSAO P1, SUBMODULO S1, OPERACAO_DO_SISTEMA O1 '+
      ' WHERE P1.USU_CODIGO='+IntToStr(CdUSU)+
      sMDLSML+
      ' AND P1.OPS_CODIGO=O1.OPS_CODIGO '+
      ' AND S1.SML_CODIGO=O1.SML_CODIGO '+
      ' ORDER BY S1.SML_DESCRICAO, O1.OPS_OPERACAO ';
    Open;
    while not Eof do
    Begin
      Permissao2.DeletaForcado(DM.QR_Comandos,-1(*Ignorar CNC*),FieldByName('OPS_CODIGO').asInteger,CdUSU, False);
      Permissao2.GeraLog(2020,0,FieldByName('OPS_CODIGO').asInteger,'USU:'+PreencheZero(2,CdCNCUSU)+'-'+IntToStr(CdUSU)+
                         ' Permissao:'+FieldByName('OPS_OPERACAO').asString);
      for i:=1 to 50 do
      Begin
        if TNFilho.ImageIndex = 30 then //É um SubGrupo
        Begin
          TNFilho := TNFilho.GetNext;
          trvArvoreOperacao.Select(TNFilho);
        end;
        if PreencheZero(5,FieldByName('OPS_CODIGO').asInteger) <> Copy(TNFilho.Text,1,5) then
        Begin
          TNFilho := TNFilho.GetNext;
          trvArvoreOperacao.Select(TNFilho);
          if TNFilho.ImageIndex = 30 then //É um SubGrupo
          Begin
            TNFilho := TNFilho.GetNext;
            trvArvoreOperacao.Select(TNFilho);
          end;
        end
        else
        Begin
          trvArvoreOperacao.Selected.ImageIndex := cImagemFalse;
          trvArvoreOperacao.Selected.SelectedIndex := cImagemFalse;
          Break;
        end;
      end;
      Next;
    end;
  end;
  trvArvoreOperacao.Select(TN);
  trvArvoreOperacao.Refresh;
end;

procedure TfMxRelPermis.IncluirTodos1Click(Sender: TObject);
var
  TN, TNFilho:TTreeNode;
  i, CdCNC, CdCNCUSU, CdUSU, CdSML: integer;
begin
  if trvArvoreOperacao.Items.Count <= 0 then
    Exit;
  if trvArvoreOperacao.Selected = nil then
    Exit;

  TN := trvArvoreOperacao.Selected;
  if TN.ImageIndex <> 30 then //Não é um SubGrupo
    Exit;

  CdCNC     := DM.Configuracao1.CodigoCNC;
  CdCNCUSU  := Usuario1.CodigoCNC;
  CdUSU     := dblUsuarioGrafico.KeyValue;
  CdSML     := StrToInt(Copy(TN.Text,1,5));

  TNFilho := TN.GetNext;
  trvArvoreOperacao.Select(TNFilho);
  with QueryAux do
  Begin
    Close;
    SQL.Text := 'SELECT * '+
      ' FROM OPERACAO_DO_SISTEMA O1 '+
      ' WHERE O1.SML_CODIGO='+IntToStr(CdSML)+
      ' AND O1.OPS_CODIGO NOT IN '+
      ' (SELECT OPS_CODIGO '+
      ' FROM PERMISSAO P1 '+
      ' WHERE P1.OPS_CODIGO=O1.OPS_CODIGO '+
      ' AND P1.USU_CODIGO='+IntToStr(CdUSU)+') '+
      ' ORDER BY O1.OPS_OPERACAO ';
    Open;
    while not Eof do
    Begin
      Permissao2.Inserir(0,CdCNC,FieldByName('OPS_CODIGO').asInteger,CdUSU,0(*Perfil*));
      Permissao2.GeraLog(2000,0,FieldByName('OPS_CODIGO').asInteger,'USU:'+PreencheZero(2,CdCNCUSU)+'-'+IntToStr(CdUSU)+
                         ' Permissao:'+FieldByName('OPS_OPERACAO').asString);
      for i:=1 to 50 do
      Begin
        if PreencheZero(5,FieldByName('OPS_CODIGO').asInteger) <> Copy(TNFilho.Text,1,5) then
        Begin
          TNFilho := TNFilho.GetNextChild(TNFilho);
          trvArvoreOperacao.Select(TNFilho);
        end
        else
        Begin
          trvArvoreOperacao.Selected.ImageIndex := cImagemTrue;
          trvArvoreOperacao.Selected.SelectedIndex := cImagemTrue;
          Break;
        end;
      end;
      Next;
    end;
  end;
  trvArvoreOperacao.Select(TN);
  trvArvoreOperacao.Refresh;
end;

procedure TfMxRelPermis.dblCodigoCNCClick(Sender: TObject);
begin
  trvArvoreOperacao.Items.Clear;
  Usuario1.Close;
  Usuario1.Open;
end;

procedure TfMxRelPermis.FormCreate(Sender: TObject);
begin
  CentroCusto2.Open;
  dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
  dblCodigoCNCClick(sender);
end;

procedure TfMxRelPermis.Usuario1BeforeOpen(DataSet: TDataSet);
begin
  try
    Usuario1.ParamByName('CNC_CODIGO').asInteger := dblCodigoCNC.KeyValue;
  except
    Usuario1.ParamByName('CNC_CODIGO').asInteger := -1; 
  end;
end;

procedure TfMxRelPermis.AlterarPermissaoCabClick(Sender: TObject);
begin
  trvArvoreOperacaoDblClick(sender);
end;

procedure TfMxRelPermis.Permissao2BeforeOpen(DataSet: TDataSet);
begin
  Permissao2.ParamByName('USU_CODIGO').asInteger := dblUsuarioGrafico.KeyValue; 
end;

end.
