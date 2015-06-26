unit MxSelMapaTributos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, CentroCusto, Db, DBTables,
  SQuery, Vendedor, AgenteFin, Forma_de_Pagamento, Parametro, Variants, DateUtils;

type
  TfMxSelMapaTributos = class(TForm)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Panel3: TPanel;
    CentroCusto1: TCentroCusto;
    Label3: TLabel;
    ckbValorTotal: TCheckBox;
    cmbValorTotal: TComboBox;
    edtValorTotal: TEdit;
    DSCentroCusto1: TDataSource;
    dblCentroDeCusto: TDBLookupComboBox;
    ckbCentroDeCusto: TCheckBox;
    ckbVencimentoPIS: TCheckBox;
    ckbVencimentoISSMt: TCheckBox;
    ckbVencimentoISSF1: TCheckBox;
    ckbVencimentoCOFINS: TCheckBox;
    mskVencimentoPIS: TMaskEdit;
    mskVencimentoISSMt: TMaskEdit;
    mskVencimentoISSF1: TMaskEdit;
    mskVencimentoCOFINS: TMaskEdit;
    GroupBox1: TGroupBox;
    ckbDeducaoPIS: TCheckBox;
    ckbDeducaoCOFINS: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    edtDeducaoPISMt: TEdit;
    edtDeducaoPISF1: TEdit;
    edtDeducaoCOFINSMt: TEdit;
    edtDeducaoCOFINSF1: TEdit;
    ckbDeducaoIRPJ: TCheckBox;
    edtDeducaoIRPJ: TEdit;
    ckbDeducaoContribuicaoSocial: TCheckBox;
    edtDeducaoContribuicaoSocial: TEdit;
    memObservacao: TMemo;
    Label6: TLabel;
    edtDeducaoIRAdicional: TEdit;
    ckbDeducaoIRAdicional: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbCentroDeCustoClick(Sender: TObject);
    procedure ckbValorTotalClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckbVencimentoPISClick(Sender: TObject);
    procedure ckbVencimentoISSMtClick(Sender: TObject);
    procedure ckbVencimentoISSF1Click(Sender: TObject);
    procedure ckbVencimentoCOFINSClick(Sender: TObject);
    procedure ckbDeducaoPISClick(Sender: TObject);
    procedure ckbDeducaoCOFINSClick(Sender: TObject);
    procedure ckbDeducaoIRPJClick(Sender: TObject);
    procedure ckbDeducaoContribuicaoSocialClick(Sender: TObject);
    procedure ckbDeducaoIRAdicionalClick(Sender: TObject);
  private
    { Private declarations }
  public
    sCNC,sValor : string;
    vTotalIRPJ, vTotalContSocial, vTotalConfins, vTotalIRRecolher: Double;
  end;

var
  fMxSelMapaTributos: TfMxSelMapaTributos;

implementation

uses UDM, funcoes, UNotaFiscalAgruparAgente, UMapaTributos, UMapaTributosGeral;


{$R *.DFM}

procedure TfMxSelMapaTributos.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  vTotalIRPJ := 0;
  vTotalContSocial := 0;
  vTotalConfins := 0;
  vTotalIRRecolher := 0;
  if DM.Configuracao1.Empresa = empLBM then
    ckbCentroDeCusto.Enabled := False
  else
  Begin
    Label4.Visible := False;
    Label5.Visible := False;
    ckbVencimentoISSF1.Enabled := False;
    ckbCentroDeCusto.Enabled := False;
    ckbCentroDeCusto.Checked := True;
  end;
  mskDataINI.SetFocus;  
end;

procedure TfMxSelMapaTributos.BitBtn1Click(Sender: TObject);
var
  mensagem,DataINI,DataFIM:string;
  F: TextFile;
begin
  if DM.Configuracao1.Empresa <> empLBM then
    sCNC := ''
  else
    sCNC := ' AND N1.CNC_CODIGO=1 ';  //Matriz
  sValor:='';
  mensagem:='';
  if not VerificaDataBranco(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13
  else
    DataINI := ' AND (NTF_DT_EMISSAO>="'+MesDia(mskDataINI.Text)+'") ';

  if not VerificaDataBranco(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13
  else
    DataFIM := ' AND (NTF_DT_EMISSAO<"'+MesDia(StrToDate(mskDataFIM.Text)+1)+'") ';

  if mensagem<>'' then
    raise exception.Create(mensagem);

  if ckbCentroDeCusto.Checked then
  Begin
    if dblCentroDeCusto.Text = '' then
    Begin
      dblCentroDeCusto.SetFocus;
      raise Exception.Create('Centro de Custo inválido!');
    end;
    sCNC:=' AND (N1.CNC_CODIGO='+IntToStr(dblCentroDeCusto.KeyValue)+') ';
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
        0: sValor:=' AND (N1.NTF_TOTAL_NOTA < '+VirgPonto(edtValorTotal.Text)+') ';
        1: sValor:=' AND (N1.NTF_TOTAL_NOTA = '+VirgPonto(edtValorTotal.Text)+') ';
        2: sValor:=' AND (N1.NTF_TOTAL_NOTA > '+VirgPonto(edtValorTotal.Text)+') ';
        3: sValor:=' AND (N1.NTF_TOTAL_NOTA <='+VirgPonto(edtValorTotal.Text)+') ';
        4: sValor:=' AND (N1.NTF_TOTAL_NOTA >='+VirgPonto(edtValorTotal.Text)+') ';
      end;
  end;

  if tag = 0 then
  Begin
    if DM.Configuracao1.Empresa = empLBM then
    Begin
      Application.CreateForm(Trpt_MapaTributos, rpt_MapaTributos);
      with rpt_MapaTributos do
      Begin
        tag := 0;

        vDataINI := StrToDate(mskDataINI.Text);
        vDataFIM := StrToDate(mskDataFIM.Text);
        Entidade.Close;
        if DM.Configuracao1.Empresa <> empLBM then
          Entidade.SQL.Text:='SELECT TOP 1 N1.NTF_CODIGO '+
            ' FROM NOTA_FISCAL N1 '+
            ' WHERE N1.NTF_CODIGO > 0 '+
            ' AND N1.NTF_SITUACAO = 2 '+
            DataINI+DataFIM+sCNC+sValor
        else
          Entidade.SQL.Text:='SELECT TOP 1 N1.NTF_CODIGO '+
            ' FROM NOTA_FISCAL N1 '+
            ' WHERE N1.NTF_CODIGO > 0 '+
            ' AND N1.NTF_SITUACAO = 2 '+
            ' AND (N1.CNC_CODIGO=1 OR N1.CNC_CODIGO=2) '+
            DataINI+DataFIM+sValor;

        Entidade.Open;

        qrmObservacao.Lines         := memObservacao.Lines;
        qrlVencimentoPIS.Caption    := mskVencimentoPIS.Text;
        qrlVencimentoISSMt.Caption  := mskVencimentoISSMt.Text;
        qrlVencimentoISSF1.Caption  := mskVencimentoISSF1.Text;
        qrlVencimentoCOFINS.Caption := mskVencimentoCOFINS.Text;
        if edtDeducaoPISMt.Text <> '' then
          qrlMtDeducaoPIS.Caption := edtDeducaoPISMt.Text;
        if edtDeducaoCOFINSMt.Text <> '' then
          qrlMtDeducaoCOFINS.Caption := edtDeducaoCOFINSMt.Text;
        if edtDeducaoPISF1.Text <> '' then
          qrlF1DeducaoPIS.Caption := edtDeducaoPISF1.Text;
        if edtDeducaoCOFINSF1.Text <> '' then
          qrlF1DeducaoCOFINS.Caption := edtDeducaoCOFINSF1.Text;
        if edtDeducaoIRPJ.Text <> '' then
          qrlIRPJDeducoes.Caption := edtDeducaoIRPJ.Text;
        if edtDeducaoContribuicaoSocial.Text <> '' then
          qrlContribuicaoSocialDeducoes.Caption := edtDeducaoContribuicaoSocial.Text;
        if MonthOf(StrToDate(mskDataINI.Text)) <= 3 then
        Begin
          qrlPrimeiroMes.Caption := 'JAN/'+Copy(mskDataINI.Text,7,4);
          qrlSegundoMes.Caption  := 'FEV/'+Copy(mskDataINI.Text,7,4);
          qrlTerceiroMes.Caption := 'MAR/'+Copy(mskDataINI.Text,7,4);
        end
        else if MonthOf(StrToDate(mskDataINI.Text)) <= 6 then
        Begin
          qrlPrimeiroMes.Caption := 'ABR/'+Copy(mskDataINI.Text,7,4);
          qrlSegundoMes.Caption  := 'MAI/'+Copy(mskDataINI.Text,7,4);
          qrlTerceiroMes.Caption := 'JUN/'+Copy(mskDataINI.Text,7,4);
        end
        else if MonthOf(StrToDate(mskDataINI.Text)) <= 9 then
        Begin
          qrlPrimeiroMes.Caption := 'JUL/'+Copy(mskDataINI.Text,7,4);
          qrlSegundoMes.Caption  := 'AGO/'+Copy(mskDataINI.Text,7,4);
          qrlTerceiroMes.Caption := 'SET/'+Copy(mskDataINI.Text,7,4);
        end
        else
        Begin
          qrlPrimeiroMes.Caption := 'OUT/'+Copy(mskDataINI.Text,7,4);
          qrlSegundoMes.Caption  := 'NOV/'+Copy(mskDataINI.Text,7,4);
          qrlTerceiroMes.Caption := 'DEZ/'+Copy(mskDataINI.Text,7,4);
        end;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');

        qrlDescricaoPeriodo.Caption := mskDataINI.Text + ' a '+mskDataFIM.Text;
        report.preview;
        Close;
        If MessageDlg('Deseja salvar dados?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit
        else
        Begin
          try
            AssignFile(F, DM.Configuracao1.PastaSistema+'\TRB_'+Copy(mskDataINI.Text,4,2)+Copy(mskDataINI.Text,7,4)+'.sac');
            Rewrite(F);
            Writeln(F, format('%.2f',[vTotalIRPJ]));
            Writeln(F, format('%.2f',[vTotalContSocial]));
            Writeln(F, format('%.2f',[vTotalConfins]));
            Writeln(F, format('%.2f',[vTotalIRRecolher]));
          finally
            try
              CloseFile(F);
            except
            end;
          end;
        end;
      end;
    end
    else //Diferente de LBM
    Begin

      Application.CreateForm(Trpt_MapaTributosGeral, rpt_MapaTributosGeral);
      with rpt_MapaTributosGeral do
      Begin
        tag := 0;

        qrlMtAliqPIS.Caption := Format('%.2f',[DM.Configuracao1.AliquotaPIS]);
        qrlMtAliqCOFINS.Caption := Format('%.2f',[DM.Configuracao1.AliquotaCOFINS]);
        vDataINI := StrToDate(mskDataINI.Text);
        vDataFIM := StrToDate(mskDataFIM.Text);
        Entidade.Close;
        if DM.Configuracao1.Empresa <> empLBM then
          Entidade.SQL.Text:='SELECT TOP 1 N1.NTF_CODIGO '+
            ' FROM NOTA_FISCAL N1 '+
            ' WHERE N1.NTF_CODIGO > 0 '+
            ' AND N1.NTF_SITUACAO = 2 '+
            DataINI+DataFIM+sCNC+sValor
        else
          Entidade.SQL.Text:='SELECT TOP 1 N1.NTF_CODIGO '+
            ' FROM NOTA_FISCAL N1 '+
            ' WHERE N1.NTF_CODIGO > 0 '+
            ' AND N1.NTF_SITUACAO = 2 '+
            ' AND (N1.CNC_CODIGO=1 OR N1.CNC_CODIGO=2) '+
            DataINI+DataFIM+sValor;

        Entidade.Open;

        qrmObservacao.Lines         := memObservacao.Lines;
        qrlVencimentoPIS.Caption    := mskVencimentoPIS.Text;
        qrlVencimentoISSMt.Caption  := mskVencimentoISSMt.Text;
        qrlVencimentoISSF1.Caption  := mskVencimentoISSF1.Text;
        qrlVencimentoCOFINS.Caption := mskVencimentoCOFINS.Text;
        if edtDeducaoPISMt.Text <> '' then
          qrlMtDeducaoPIS.Caption := edtDeducaoPISMt.Text;
        if edtDeducaoCOFINSMt.Text <> '' then
          qrlMtDeducaoCOFINS.Caption := edtDeducaoCOFINSMt.Text;
        if edtDeducaoIRPJ.Text <> '' then
          qrlIRPJDeducoes.Caption := edtDeducaoIRPJ.Text;
        if edtDeducaoContribuicaoSocial.Text <> '' then
          qrlContribuicaoSocialDeducoes.Caption := edtDeducaoContribuicaoSocial.Text;
        if MonthOf(StrToDate(mskDataINI.Text)) <= 3 then
        Begin
          qrlPrimeiroMes.Caption := 'JAN/'+Copy(mskDataINI.Text,7,4);
          qrlSegundoMes.Caption  := 'FEV/'+Copy(mskDataINI.Text,7,4);
          qrlTerceiroMes.Caption := 'MAR/'+Copy(mskDataINI.Text,7,4);
        end
        else if MonthOf(StrToDate(mskDataINI.Text)) <= 6 then
        Begin
          qrlPrimeiroMes.Caption := 'ABR/'+Copy(mskDataINI.Text,7,4);
          qrlSegundoMes.Caption  := 'MAI/'+Copy(mskDataINI.Text,7,4);
          qrlTerceiroMes.Caption := 'JUN/'+Copy(mskDataINI.Text,7,4);
        end
        else if MonthOf(StrToDate(mskDataINI.Text)) <= 9 then
        Begin
          qrlPrimeiroMes.Caption := 'JUL/'+Copy(mskDataINI.Text,7,4);
          qrlSegundoMes.Caption  := 'AGO/'+Copy(mskDataINI.Text,7,4);
          qrlTerceiroMes.Caption := 'SET/'+Copy(mskDataINI.Text,7,4);
        end
        else
        Begin
          qrlPrimeiroMes.Caption := 'OUT/'+Copy(mskDataINI.Text,7,4);
          qrlSegundoMes.Caption  := 'NOV/'+Copy(mskDataINI.Text,7,4);
          qrlTerceiroMes.Caption := 'DEZ/'+Copy(mskDataINI.Text,7,4);
        end;
        if Entidade.IsEmpty then
          Raise Exception.Create('Consulta Vazia!');

        qrlDescricaoPeriodo.Caption := mskDataINI.Text + ' a '+mskDataFIM.Text;
        report.preview;
        Close;
        If MessageDlg('Deseja salvar dados?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit
        else
        Begin
          try
            AssignFile(F, DM.Configuracao1.PastaSistema+'\TRB_'+Copy(mskDataINI.Text,4,2)+Copy(mskDataINI.Text,7,4)+'.sac');
            Rewrite(F);
            Writeln(F, format('%.2f',[vTotalIRPJ]));
            Writeln(F, format('%.2f',[vTotalContSocial]));
            Writeln(F, format('%.2f',[vTotalConfins]));
            Writeln(F, format('%.2f',[vTotalIRRecolher]));
          finally
            try
              CloseFile(F);
            except
            end;
          end;
        end;
      end;
      
    end;
  end;
end;

procedure TfMxSelMapaTributos.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelMapaTributos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CentroCusto1.Active := False;
  Action := cafree;
end;

procedure TfMxSelMapaTributos.ckbCentroDeCustoClick(Sender: TObject);
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

procedure TfMxSelMapaTributos.ckbValorTotalClick(Sender: TObject);
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

procedure TfMxSelMapaTributos.FormDestroy(Sender: TObject);
begin
  SalvarPreferencias(self,DM.Configuracao1.PastaSistema+'\MapaContribuicao.cfg',
    ['ckbValorTotal.Checked','cmbValorTotal.ItemIndex','edtValorTotal.Text',
    'ckbDeducoes1.Checked','edtDeducoes1.Text',
    'ckbVencimentoPIS.Checked','mskVencimentoPIS.Text',
    'ckbVencimentoISSMt.Checked','mskVencimentoISSMt.Text',
    'ckbVencimentoISSF1.Checked','mskVencimentoISSF1.Text',
    'ckbVencimentoCOFINS.Checked','mskVencimentoCOFINS.Text',
    'ckbDeducaoPIS.Checked','edtDeducaoPISMt.Text','edtDeducaoPISF1.Text',
    'ckbDeducaoCOFINS.Checked','edtDeducaoCOFINSMt.Text','edtDeducaoCOFINSF1.Text',
    'ckbDeducaoIRPJ.Checked','edtDeducaoIRPJ.Text',
    'ckbDeducaoContribuicaoSocial.Checked','edtDeducaoContribuicaoSocial.Text']);
end;

procedure TfMxSelMapaTributos.FormCreate(Sender: TObject);
begin
  LendoProps := False;
  LerPreferencias(self,DM.Configuracao1.PastaSistema+'\MapaContribuicao.cfg');
  LendoProps := True;
end;

procedure TfMxSelMapaTributos.ckbVencimentoPISClick(Sender: TObject);
begin
  if ckbVencimentoPIS.Checked then
  Begin
    mskVencimentoPIS.Color := clWindow;
    mskVencimentoPIS.Enabled := True;
    try
      mskVencimentoPIS.SetFocus;
    except
    end;
  end
  else
  Begin
    mskVencimentoPIS.Color := AlteraCorComponentes;
    mskVencimentoPIS.Enabled := False;
    mskVencimentoPIS.Clear;
  end;
end;

procedure TfMxSelMapaTributos.ckbVencimentoISSMtClick(Sender: TObject);
begin
  if ckbVencimentoISSMt.Checked then
  Begin
    mskVencimentoISSMt.Color := clWindow;
    mskVencimentoISSMt.Enabled := True;
    try
      mskVencimentoISSMt.SetFocus;
    except
    end;
  end
  else
  Begin
    mskVencimentoISSMt.Color := AlteraCorComponentes;
    mskVencimentoISSMt.Enabled := False;
    mskVencimentoISSMt.Clear;
  end;
end;

procedure TfMxSelMapaTributos.ckbVencimentoISSF1Click(Sender: TObject);
begin
  if ckbVencimentoISSF1.Checked then
  Begin
    mskVencimentoISSF1.Color := clWindow;
    mskVencimentoISSF1.Enabled := True;
    try
      mskVencimentoISSF1.SetFocus;
    except
    end;
  end
  else
  Begin
    mskVencimentoISSF1.Color := AlteraCorComponentes;
    mskVencimentoISSF1.Enabled := False;
    mskVencimentoISSF1.Clear;
  end;
end;

procedure TfMxSelMapaTributos.ckbVencimentoCOFINSClick(Sender: TObject);
begin
  if ckbVencimentoCOFINS.Checked then
  Begin
    mskVencimentoCOFINS.Color := clWindow;
    mskVencimentoCOFINS.Enabled := True;
    try
      mskVencimentoCOFINS.SetFocus;
    except
    end;
  end
  else
  Begin
    mskVencimentoCOFINS.Color := AlteraCorComponentes;
    mskVencimentoCOFINS.Enabled := False;
    mskVencimentoCOFINS.Clear;
  end;
end;

procedure TfMxSelMapaTributos.ckbDeducaoPISClick(Sender: TObject);
begin
  if ckbDeducaoPIS.Checked then
  Begin
    edtDeducaoPISMt.Color := clWindow;
    edtDeducaoPISMt.Enabled := True;
    if DM.Configuracao1.Empresa = empLBM then
    Begin
      edtDeducaoPISF1.Color := clWindow;
      edtDeducaoPISF1.Enabled := True;
    end;
    try
      edtDeducaoPISMt.SetFocus;
    except
    end;
  end
  else
  Begin
    edtDeducaoPISMt.Color := AlteraCorComponentes;
    edtDeducaoPISMt.Enabled := False;
    edtDeducaoPISMt.Clear;
    if DM.Configuracao1.Empresa = empLBM then
    Begin
      edtDeducaoPISF1.Color := AlteraCorComponentes;
      edtDeducaoPISF1.Enabled := False;
      edtDeducaoPISF1.Clear;
    end;
  end;
end;

procedure TfMxSelMapaTributos.ckbDeducaoCOFINSClick(Sender: TObject);
begin
  if ckbDeducaoCOFINS.Checked then
  Begin
    edtDeducaoCOFINSMt.Color := clWindow;
    edtDeducaoCOFINSMt.Enabled := True;
    if DM.Configuracao1.Empresa = empLBM then
    Begin
      edtDeducaoCOFINSF1.Color := clWindow;
      edtDeducaoCOFINSF1.Enabled := True;
    end;
    try
      edtDeducaoCOFINSMt.SetFocus;
    except
    end;
  end
  else
  Begin
    edtDeducaoCOFINSMt.Color := AlteraCorComponentes;
    edtDeducaoCOFINSMt.Enabled := False;
    edtDeducaoCOFINSMt.Clear;
    if DM.Configuracao1.Empresa = empLBM then
    Begin
      edtDeducaoCOFINSF1.Color := AlteraCorComponentes;
      edtDeducaoCOFINSF1.Enabled := False;
      edtDeducaoCOFINSF1.Clear;
    end;
  end;
end;

procedure TfMxSelMapaTributos.ckbDeducaoIRPJClick(Sender: TObject);
begin
  if ckbDeducaoIRPJ.Checked then
  Begin
    edtDeducaoIRPJ.Color := clWindow;
    edtDeducaoIRPJ.Enabled := True;
    try
      edtDeducaoIRPJ.SetFocus;
    except
    end;
  end
  else
  Begin
    edtDeducaoIRPJ.Color := AlteraCorComponentes;
    edtDeducaoIRPJ.Enabled := False;
    edtDeducaoIRPJ.Clear;
  end;
end;

procedure TfMxSelMapaTributos.ckbDeducaoContribuicaoSocialClick(Sender: TObject);
begin
  if ckbDeducaoContribuicaoSocial.Checked then
  Begin
    edtDeducaoContribuicaoSocial.Color := clWindow;
    edtDeducaoContribuicaoSocial.Enabled := True;
    try
      edtDeducaoContribuicaoSocial.SetFocus;
    except
    end;
  end
  else
  Begin
    edtDeducaoContribuicaoSocial.Color := AlteraCorComponentes;
    edtDeducaoContribuicaoSocial.Enabled := False;
    edtDeducaoContribuicaoSocial.Clear;
  end;
end;

procedure TfMxSelMapaTributos.ckbDeducaoIRAdicionalClick(Sender: TObject);
begin
  if ckbDeducaoIRAdicional.Checked then
  Begin
    edtDeducaoIRAdicional.Color := clWindow;
    edtDeducaoIRAdicional.Enabled := True;
    edtDeducaoIRAdicional.Text := '60000';
    try
      edtDeducaoIRAdicional.SetFocus;
    except
    end;
  end
  else
  Begin
    edtDeducaoIRAdicional.Color := AlteraCorComponentes;
    edtDeducaoIRAdicional.Enabled := False;
    edtDeducaoIRAdicional.Clear;
  end;
end;

end.


