unit MxSelBonus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, CentroCusto, DBCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls;

type
  TfMxSelBonus = class(TForm)
    Panel3: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    Panel2: TPanel;
    mskPeriodo: TMaskEdit;
    Label7: TLabel;
    ckbPeriodo: TCheckBox;
    ckbCodigoPRD: TCheckBox;
    edtCodigoPRD: TEdit;
    ckbSomenteBonus1: TCheckBox;
    ckbSomenteBonus2: TCheckBox;
    procedure SB_CancelarClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure ckbPeriodoClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbSomenteBonus1Click(Sender: TObject);
    procedure ckbSomenteBonus2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelBonus: TfMxSelBonus;

implementation
uses UDM, funcoes, MxSPediProd, Urpt_bonus, MxSPediProdMotCal;
{$R *.DFM}

procedure TfMxSelBonus.SB_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelBonus.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPRD.Text:='';
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=33;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=33;
        ShowModal;
      end;
    end;
  End;
end;

procedure TfMxSelBonus.SB_ConfirmarClick(Sender: TObject);
var
  cMes,cAno,PRD,PRD2,CNC,Loja,Loja2,sFiltros:string;
begin
  cMes:='';
  cAno:='';
  PRD:='';
  PRD2:='';
  CNC:='';
  Loja:='';
  Loja2:='';
  sFiltros:='';

  if ckbPeriodo.Checked then
  Begin
    try
      strToInt(Copy(mskPeriodo.Text,1,2));
      strToInt(Copy(mskPeriodo.Text,4,4));
    except
      ShowMessage('Período inválido!');
      Exit;
    end;
    if (StrToInt(Copy(mskPeriodo.Text,1,2))>12) or
       (StrToInt(Copy(mskPeriodo.Text,1,2))<0) then
      Raise Exception.Create('Mês inválido!')
    else if Copy(mskPeriodo.Text,1,2) <> '00' then
      cMes:=' AND (T1.BON_MES='+IntToStr(StrToInt(Copy(mskPeriodo.Text,1,2)))+') ';

    if (StrToInt(Copy(mskPeriodo.Text,4,4))<1900) then
      Raise Exception.Create('Ano inválido!')
    else
      cAno:=' AND (T1.BON_ANO='+IntToStr(StrToInt(Copy(mskPeriodo.Text,4,4)))+') ';
    sFiltros := sFiltros + '(Periodo:'+mskPeriodo.Text+')';
  end;

  if ckbCodigoPRD.Checked then
  Begin
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
      Raise Exception.Create('Código de Produto inválido!')
    else
    Begin
      PRD:=' AND BON_CODIGO IN (SELECT BON_CODIGO FROM ITEM_DE_BONUS T2 '+
        'WHERE T2.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      PRD2:=' AND (T1.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + '(PRD:'+edtCodigoPRD.Text+')';
    end;
  end;

  if ckbSomenteBonus1.Checked then
  Begin
    Loja:=' AND BON_CODIGO IN (SELECT BON_CODIGO FROM ITEM_DE_BONUS T2 '+
      'WHERE T2.IBN_BONUS_FOR>0) ';
    Loja2:=' AND (T1.IBN_BONUS_FOR>0) ';
    sFiltros := sFiltros + '(Bonus 1)';
  end
  Else if ckbSomenteBonus2.Checked then
  Begin
    Loja:=' AND BON_CODIGO IN (SELECT BON_CODIGO FROM ITEM_DE_BONUS T2 '+
      'WHERE T2.IBN_BONUS_LOJA>0) ';
    Loja2:=' AND (T1.IBN_BONUS_LOJA>0) ';
    sFiltros := sFiltros + '(Bonus 2)';
  end;

  Application.CreateForm(Trpt_Bonus,rpt_Bonus);
  with rpt_Bonus do
  Begin
    tag:=0;
    zrlFiltros.Caption := sFiltros;
    Bonus1.Close;
    Item_de_Bonus1.Close;
    Bonus1.SQL.Text:='SELECT * FROM BONUS T1 '+
      ' WHERE BON_CODIGO<>-1 '+cMes+cAno+CNC+PRD+Loja+
      ' ORDER BY T1.BON_ANO,T1.BON_MES ';
    Item_de_Bonus1.SQL.Text:='SELECT * FROM ITEM_DE_BONUS T1 '+
      ' WHERE T1.BON_CODIGO=:BON_CODIGO '+PRD2+Loja2+
      ' ORDER BY T1.PRD_CODIGO ';
    Bonus1.Open;
    Item_de_Bonus1.Open;
    if Bonus1.IsEmpty then
      Raise Exception.Create('Consulta vazia!');
    report.Preview;
    Close;
  end;
end;

procedure TfMxSelBonus.ckbPeriodoClick(Sender: TObject);
begin
  if ckbPeriodo.Checked then
  Begin
    mskPeriodo.Enabled:=True;
    mskPeriodo.Color:=clWindow;
    mskPeriodo.SetFocus;
  end
  else
  Begin
    mskPeriodo.Enabled:=False;
    mskPeriodo.Color:=AlteraCorComponentes;
    mskPeriodo.Clear;
  end;
end;

procedure TfMxSelBonus.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Enabled:=False;
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Clear;
  end;
end;

procedure TfMxSelBonus.ckbSomenteBonus1Click(Sender: TObject);
begin
  if ckbSomenteBonus1.Checked then
    ckbSomenteBonus2.Checked := False;
end;

procedure TfMxSelBonus.ckbSomenteBonus2Click(Sender: TObject);
begin
  if ckbSomenteBonus2.Checked then
    ckbSomenteBonus1.Checked := False;
end;

procedure TfMxSelBonus.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    SB_ConfirmarClick(sender)
  else if key =#27 then
    SB_CancelarClick(sender);
end;

procedure TfMxSelBonus.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

procedure TfMxSelBonus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
