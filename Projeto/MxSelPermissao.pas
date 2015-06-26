unit MxSelPermissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, DB, Configuracao,
  Operacao_do_Sistema, Submodulo, Modulo, DBTables, SQuery, Usuario,
  CentroCusto, SiacReport_TLB;

type
  TfMxSelPermissao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ckbCodigoUSU: TCheckBox;
    ckbCodigoMDL: TCheckBox;
    ckbCodigoSML: TCheckBox;
    ckbCodigoOPS: TCheckBox;
    dblCodigoOPS: TDBLookupComboBox;
    dblCodigoSML: TDBLookupComboBox;
    mdlCodigoMDL: TDBLookupComboBox;
    dblCodigoUSU: TDBLookupComboBox;
    Usuario1: TUsuario;
    Modulo1: TModulo;
    Submodulo1: TSubmodulo;
    Operacao_do_Sistema1: TOperacao_do_Sistema;
    DSUsuario1: TDataSource;
    DSModulo1: TDataSource;
    DSSubmodulo1: TDataSource;
    DSOperacao_do_Sistema1: TDataSource;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    dblCodigoCNC: TDBLookupComboBox;
    ckbCodigoCNC: TCheckBox;
    cbxRelatorioGrafico: TCheckBox;
    procedure ckbCodigoUSUClick(Sender: TObject);
    procedure ckbCodigoMDLClick(Sender: TObject);
    procedure ckbCodigoSMLClick(Sender: TObject);
    procedure ckbCodigoOPSClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure dblCodigoSMLClick(Sender: TObject);
    procedure mdlCodigoMDLClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelPermissao: TfMxSelPermissao;

implementation
uses
  UDM, Funcoes, Urpt_Permissao;

{$R *.dfm}

procedure TfMxSelPermissao.ckbCodigoUSUClick(Sender: TObject);
begin
  if ckbCodigoUSU.Checked then
  Begin
    Usuario1.Close;
    Usuario1.SQL.Text := 'SELECT USU_CODIGO, USU_NOME '+
      ' FROM USUARIO '+
      ' WHERE USU_SITUACAO<>1 ';
    if ckbCodigoCNC.Checked then
      Usuario1.SQL.Add(' AND CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue));
    Usuario1.SQL.Add(' ORDER BY USU_NOME');
    Usuario1.Open;
    dblCodigoUSU.Color:=clWindow;
    dblCodigoUSU.Enabled:=True;
    dblCodigoUSU.KeyValue:=Usuario1.CodigoUSU;
    dblCodigoUSU.SetFocus;
  end
  else
  Begin
    Usuario1.Close;
    dblCodigoUSU.Color:=AlteraCorComponentes;
    dblCodigoUSU.KeyValue:=-1;
    dblCodigoUSU.Enabled:=False;
  end;
end;

procedure TfMxSelPermissao.ckbCodigoMDLClick(Sender: TObject);
begin
  if ckbCodigoMDL.Checked then
  Begin
    Modulo1.Close;
    Modulo1.Open;
    ckbCodigoSML.Enabled := True;
    mdlCodigoMDL.Color:=clWindow;
    mdlCodigoMDL.Enabled:=True;
    mdlCodigoMDL.KeyValue:=Modulo1.CodigoMDL;
    mdlCodigoMDL.SetFocus;
  end
  else
  Begin
    Modulo1.Close;
    ckbCodigoSML.Checked := False;
    ckbCodigoSML.Enabled := False;
    mdlCodigoMDL.Color:=AlteraCorComponentes;
    mdlCodigoMDL.KeyValue:=-1;
    mdlCodigoMDL.Enabled:=False;
  end;
end;

procedure TfMxSelPermissao.ckbCodigoSMLClick(Sender: TObject);
begin
  if ckbCodigoSML.Checked then
  Begin
    SubModulo1.Close;  
    SubModulo1.Open;
    ckbCodigoOPS.Enabled := True;
    dblCodigoSML.Color:=clWindow;
    dblCodigoSML.Enabled:=True;
    dblCodigoSML.KeyValue:=SubModulo1.CodigoSML;
    dblCodigoSML.SetFocus;
  end
  else
  Begin
    SubModulo1.Close;
    ckbCodigoOPS.Checked := False;
    ckbCodigoOPS.Enabled := False;
    dblCodigoSML.Color:=AlteraCorComponentes;
    dblCodigoSML.KeyValue:=-1;
    dblCodigoSML.Enabled:=False;
  end;
end;

procedure TfMxSelPermissao.ckbCodigoOPSClick(Sender: TObject);
begin
  if ckbCodigoOPS.Checked then
  Begin
    Operacao_do_Sistema1.Close;  
    Operacao_do_Sistema1.Open;
    dblCodigoOPS.Color:=clWindow;
    dblCodigoOPS.Enabled:=True;
    dblCodigoOPS.KeyValue:=Operacao_do_Sistema1.CodigoOPS;
    dblCodigoOPS.SetFocus;
  end
  else
  Begin
    Operacao_do_Sistema1.Close;
    dblCodigoOPS.Color:=AlteraCorComponentes;
    dblCodigoOPS.KeyValue:=-1;
    dblCodigoOPS.Enabled:=False;
  end;
end;

procedure TfMxSelPermissao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelPermissao.BitBtn1Click(Sender: TObject);
var
  mensagem, DataINI, DataFIM, CdUSU, CdMDL, CdSML, CdOPS, CdCNC, CdENT, sNaoEntraSai,
  sObs, sOrdem, sFiltros :string;
  SQL: string;
  stiReport: CoSiacReport_; //TSiacReport;
begin
  DataINI:='';
  DataFIM:='';
  CdUSU:='';
  CdMDL:='';
  CdSML:='';
  CdOPS:='';
  CdCNC := '';
  CdENT := '';
  sObs  := '';
  sNaoEntraSai := '';
  sOrdem:='';
  sFiltros := '';
  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaData(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if VerificaDataBranco(mskDataINI.Text)then
    DataINI := ' AND (T1.PRM_DT_CADASTRO>='''+MesDia(mskDataINI.Text)+''') ';
  if VerificaDataBranco(mskDataFIM.Text)then
    DataFIM := ' AND (T1.PRM_DT_CADASTRO<'''+MesDia(StrToDate(mskDataFIM.Text)+1)+''') ';

  if ckbCodigoUSU.Checked then
    if dblCodigoUSU.Text = '' then
      mensagem := mensagem+'Usuário inválido!'+#13
    else
    Begin
      CdUSU:=' AND (T1.USU_CODIGO='+IntToStr(dblCodigoUSU.KeyValue)+') ';
      sFiltros := sFiltros + '(USU:'+dblCodigoUSU.Text+')';
    end;

  if ckbCodigoMDL.Checked then
    if mdlCodigoMDL.Text = '' then
      mensagem := mensagem+'Módulo inválido!'+#13
    else
    Begin
      CdMDL:=' AND (T2.MDL_CODIGO='+IntToStr(mdlCodigoMDL.KeyValue)+') ';
      sFiltros := sFiltros + '(MDL:'+mdlCodigoMDL.Text+')';
    end;

  if ckbCodigoSML.Checked then
    if dblCodigoSML.Text = '' then
      mensagem := mensagem+'SubMódulo inválido!'+#13
    else
    Begin
      CdSML:=' AND (T2.SML_CODIGO='+IntToStr(dblCodigoSML.KeyValue)+') ';
      sFiltros := sFiltros + '(SML:'+dblCodigoSML.Text+')';
    end;

  if ckbCodigoOPS.Checked then
    if dblCodigoOPS.Text = '' then
      mensagem := mensagem+'Operação do Sistema inválida!'+#13
    else
    Begin
      CdOPS:=' AND (T2.OPS_CODIGO='+IntToStr(dblCodigoOPS.KeyValue)+') ';
      sFiltros := sFiltros + '(OPS:'+dblCodigoOPS.Text+')';
    end;

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      mensagem := mensagem+'Centro de Custo inválido!'+#13
    else
    Begin
      CdCNC:=' AND T5.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue); //Centro do Usuário
      sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  if mensagem<>'' then
    raise exception.Create(mensagem);

  if tag = 0 then
  Begin

    if cbxRelatorioGrafico.Checked then //if RelatorioGrafico then
    begin
      SQL := 'SELECT DISTINCT T1.*, T2.OPS_OPERACAO, T3.MDL_DESCRICAO,'+
             ' T4.SML_DESCRICAO, T5.USU_NOME, T2.MDL_CODIGO, T2.SML_CODIGO, T5.USU_CODIGO ' +
             ' FROM Permissao T1, Operacao_do_Sistema T2, Modulo T3, Submodulo T4, Usuario T5 '+
             ' WHERE T1.PRM_CODIGO <> -1 '+
             CdCNC+DataINI+DataFIM+CdUSU+CdMDL+CdSML+CdOPS+CdENT+sNaoEntraSai+sObs+
             ' AND T1.OPS_CODIGO=T2.OPS_CODIGO '+
             ' AND T2.SML_CODIGO=T4.SML_CODIGO '+
             ' AND T4.MDL_CODIGO=T3.MDL_CODIGO '+
             ' AND T1.USU_CODIGO=T5.USU_CODIGO '+
             ' ORDER BY T5.USU_CODIGO, T3.MDL_DESCRICAO, T4.SML_DESCRICAO, T2.OPS_OPERACAO ';

      stiReport.Create.ReportPermissoes(false,
                                        false,
                                        SQL,
                                        EmpresaDesenvolvedora,
                                        'Relatório de Permissões de Usuários',
                                        DM.CentroCusto1.RazaoSocial,
                                        '',//DM.Configuracao1.LojaNome
                                        'Relatório de Permissões de Usuários',
                                        DM.Usuario1.NomeUSU,
                                        sFiltros,//Filtros
                                        rptArquivoLogo);
    end
    else
    begin
      Application.CreateForm(Trpt_Permissao, rpt_Permissao);
      with rpt_Permissao do
      Begin
        Tag := 0;
        sOrdem := ' T5.USU_NOME, T3.MDL_DESCRICAO, T4.SML_DESCRICAO, T2.OPS_OPERACAO ';

        zrlDataINI.Caption := mskDataINI.Text;
        zrlDataFIM.Caption := mskDataFIM.Text;
        zrlFiltros.Caption := sFiltros;
        Entidade.Close;
        Entidade.SQL.Text:=' SELECT DISTINCT T1.*, T2.OPS_OPERACAO, T3.MDL_DESCRICAO,'+
          ' T4.SML_DESCRICAO, T5.USU_NOME '+
          ' FROM Permissao T1, Operacao_do_Sistema T2, Modulo T3, Submodulo T4, Usuario T5 '+
          ' WHERE T1.PRM_CODIGO <> -1 '+
          CdCNC+DataINI+DataFIM+CdUSU+CdMDL+CdSML+CdOPS+CdENT+sNaoEntraSai+sObs+
          ' AND T1.OPS_CODIGO=T2.OPS_CODIGO '+
          ' AND T2.SML_CODIGO=T4.SML_CODIGO '+
          ' AND T4.MDL_CODIGO=T3.MDL_CODIGO '+
          ' AND T1.USU_CODIGO=T5.USU_CODIGO '+
          ' ORDER BY '+sOrdem;
        Entidade.Open;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');
        if (report.Height > DM.Configuracao1.MaxLinhasImp) and
           (DM.Configuracao1.MaxLinhasImp <> 65) then
          report.Height := DM.Configuracao1.MaxLinhasImp;
        report.Preview;
        Close;
      end;
    end;
  end;
end;

procedure TfMxSelPermissao.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  mskDataINI.SetFocus;
end;

procedure TfMxSelPermissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Usuario1.Close;
  Modulo1.Close;
  Submodulo1.Close;
  Operacao_do_Sistema1.Close;
  CentroCusto1.Close;
  Action := caFree;
end;

procedure TfMxSelPermissao.ckbCodigoCNCClick(Sender: TObject);
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

procedure TfMxSelPermissao.dblCodigoSMLClick(Sender: TObject);
begin
  if ckbCodigoOPS.Checked then
    ckbCodigoOPSClick(sender);
end;

procedure TfMxSelPermissao.mdlCodigoMDLClick(Sender: TObject);
begin
  if ckbCodigoSML.Checked then
    ckbCodigoSMLClick(sender);
  if ckbCodigoOPS.Checked then
    ckbCodigoOPSClick(sender);
end;

procedure TfMxSelPermissao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    BitBtn1Click(sender);
end;

end.
