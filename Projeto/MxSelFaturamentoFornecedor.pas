unit MxSelFaturamentoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, ComCtrls, funcoes, Db,
  DBTables, SQuery, SubGrupo, DBCtrls, CentroCusto, Grupo, Variants;

type
  TfMxSelFaturamentoFornecedor = class(TForm)
    Panel2: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Cancelar: TBitBtn;
    Panel3: TPanel;
    edtCodigoFOR1: TEdit;
    ckbCodigoCNC: TCheckBox;
    dblCodigoCNC: TDBLookupComboBox;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    ckbCodigoFOR1: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    mskDataINI: TMaskEdit;
    mskDataFIM: TMaskEdit;
    Label6: TLabel;
    Label8: TLabel;
    edtCodigoFOR2: TEdit;
    ckbCodigoFOR2: TCheckBox;
    edtCodigoFOR3: TEdit;
    ckbCodigoFOR3: TCheckBox;
    edtCodigoFOR4: TEdit;
    ckbCodigoFOR4: TCheckBox;
    edtCodigoFOR5: TEdit;
    ckbCodigoFOR5: TCheckBox;
    edtCodigoFOR6: TEdit;
    ckbCodigoFOR6: TCheckBox;
    edtCodigoFOR7: TEdit;
    ckbCodigoFOR7: TCheckBox;
    rdgAgrupar: TRadioGroup;
    edtCodigoFOR8: TEdit;
    ckbCodigoFOR8: TCheckBox;
    edtCodigoFOR9: TEdit;
    ckbCodigoFOR9: TCheckBox;
    edtCodigoFOR10: TEdit;
    ckbCodigoFOR10: TCheckBox;
    edtCodigoFOR11: TEdit;
    ckbCodigoFOR11: TCheckBox;
    edtCodigoFOR12: TEdit;
    ckbCodigoFOR12: TCheckBox;
    edtCodigoFOR13: TEdit;
    ckbCodigoFOR13: TCheckBox;
    edtCodigoFOR14: TEdit;
    ckbCodigoFOR14: TCheckBox;
    edtCodigoFOR15: TEdit;
    ckbCodigoFOR15: TCheckBox;
    edtCodigoFOR16: TEdit;
    ckbCodigoFOR16: TCheckBox;
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure SB_CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoFOR1KeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoCNCClick(Sender: TObject);
    procedure ckbCodigoFOR1Click(Sender: TObject);
    procedure ckbCodigoFOR2Click(Sender: TObject);
    procedure ckbCodigoFOR3Click(Sender: TObject);
    procedure ckbCodigoFOR4Click(Sender: TObject);
    procedure ckbCodigoFOR5Click(Sender: TObject);
    procedure ckbCodigoFOR6Click(Sender: TObject);
    procedure ckbCodigoFOR7Click(Sender: TObject);
    procedure edtCodigoFOR2KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFOR3KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFOR4KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFOR5KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFOR6KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFOR7KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCodigoFOR8Click(Sender: TObject);
    procedure ckbCodigoFOR9Click(Sender: TObject);
    procedure ckbCodigoFOR10Click(Sender: TObject);
    procedure ckbCodigoFOR11Click(Sender: TObject);
    procedure ckbCodigoFOR12Click(Sender: TObject);
    procedure ckbCodigoFOR13Click(Sender: TObject);
    procedure ckbCodigoFOR14Click(Sender: TObject);
    procedure ckbCodigoFOR15Click(Sender: TObject);
    procedure ckbCodigoFOR16Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelFaturamentoFornecedor: TfMxSelFaturamentoFornecedor;
  CNC:string;

implementation

uses UDM, UFaturamentoFornecedor, MxSCotaFor, UFaturamentoFornecedor2;

{$R *.DFM}


procedure TfMxSelFaturamentoFornecedor.SB_ConfirmarClick(Sender: TObject);
var
  mensagem,CdGRP,CdSGP,CdFOR,CdCNC,sFiltros,sIntervalo :string;
begin
  sFiltros := '';
  CdFOR := '';
  CdCNC := '';
  mensagem:='';
  if not VerificaDataBranco(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;
  if not VerificaDataBranco(mskDataFIM.Text) then
    mensagem:=mensagem+'Data final digitada incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.Create(mensagem);

  if ckbCodigoFOR1.Checked or
     ckbCodigoFOR2.Checked or
     ckbCodigoFOR3.Checked or
     ckbCodigoFOR4.Checked or
     ckbCodigoFOR5.Checked or
     ckbCodigoFOR6.Checked or
     ckbCodigoFOR7.Checked or
     ckbCodigoFOR8.Checked or
     ckbCodigoFOR9.Checked or
     ckbCodigoFOR10.Checked or
     ckbCodigoFOR11.Checked or
     ckbCodigoFOR12.Checked or
     ckbCodigoFOR13.Checked or
     ckbCodigoFOR14.Checked or
     ckbCodigoFOR15.Checked or
     ckbCodigoFOR16.Checked then
  Begin
    CdFOR := ' AND (FOR_CODIGO=-10 ';

    if ckbCodigoFOR1.Checked then
    Begin
      if not VerificaInteiroBranco(edtCodigoFOR1.Text) then
      Begin
        edtCodigoFOR1.SetFocus;
        Raise Exception.Create('Fornecedor 1 inválido!');
      end;
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR1.Text+') ';
      sFiltros := sFiltros + '(FOR1:'+edtCodigoFOR1.Text+')';
    end;

    if ckbCodigoFOR2.Checked then
    Begin
      if not ckbCodigoFOR1.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR2.Text) then
      Begin
        edtCodigoFOR2.SetFocus;
        Raise Exception.Create('Fornecedor 2 inválido!');
      end;
      if StrToInt(edtCodigoFOR2.Text) = StrToInt(edtCodigoFOR1.Text) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR2.Text+') ';
      sFiltros := sFiltros + '(FOR2:'+edtCodigoFOR2.Text+')';
    end;

    if ckbCodigoFOR3.Checked then
    Begin
      if not ckbCodigoFOR2.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR3.Text) then
      Begin
        edtCodigoFOR3.SetFocus;
        Raise Exception.Create('Fornecedor 3 inválido!');
      end;
      if (StrToInt(edtCodigoFOR3.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR3.Text) = StrToInt(edtCodigoFOR2.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR3.Text+') ';
      sFiltros := sFiltros + '(FOR3:'+edtCodigoFOR3.Text+')';
    end;

    if ckbCodigoFOR4.Checked then
    Begin
      if not ckbCodigoFOR3.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR4.Text) then
      Begin
        edtCodigoFOR4.SetFocus;
        Raise Exception.Create('Fornecedor 4 inválido!');
      end;
      if (StrToInt(edtCodigoFOR4.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR4.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR4.Text) = StrToInt(edtCodigoFOR3.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR4.Text+') ';
      sFiltros := sFiltros + '(FOR4:'+edtCodigoFOR4.Text+')';
    end;

    if ckbCodigoFOR5.Checked then
    Begin
      if not ckbCodigoFOR4.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR5.Text) then
      Begin
        edtCodigoFOR5.SetFocus;
        Raise Exception.Create('Fornecedor 5 inválido!');
      end;
      if (StrToInt(edtCodigoFOR5.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR5.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR5.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR5.Text) = StrToInt(edtCodigoFOR4.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR5.Text+') ';
      sFiltros := sFiltros + '(FOR5:'+edtCodigoFOR5.Text+')';
    end;

    if ckbCodigoFOR6.Checked then
    Begin
      if not ckbCodigoFOR5.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR6.Text) then
      Begin
        edtCodigoFOR6.SetFocus;
        Raise Exception.Create('Fornecedor 6 inválido!');
      end;
      if (StrToInt(edtCodigoFOR6.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR6.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR6.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR6.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR6.Text) = StrToInt(edtCodigoFOR5.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR6.Text+') ';
      sFiltros := sFiltros + '(FOR6:'+edtCodigoFOR6.Text+')';
    end;

    if ckbCodigoFOR7.Checked then
    Begin
      if not ckbCodigoFOR6.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR7.Text) then
      Begin
        edtCodigoFOR7.SetFocus;
        Raise Exception.Create('Fornecedor 7 inválido!');
      end;
      if (StrToInt(edtCodigoFOR7.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR7.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR7.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR7.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR7.Text) = StrToInt(edtCodigoFOR5.Text)) or
         (StrToInt(edtCodigoFOR7.Text) = StrToInt(edtCodigoFOR6.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR7.Text+') ';
      sFiltros := sFiltros + '(FOR7:'+edtCodigoFOR7.Text+')';
    end;

    if ckbCodigoFOR8.Checked then
    Begin
      if not ckbCodigoFOR7.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR8.Text) then
      Begin
        edtCodigoFOR8.SetFocus;
        Raise Exception.Create('Fornecedor 8 inválido!');
      end;
      if (StrToInt(edtCodigoFOR8.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR8.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR8.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR8.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR8.Text) = StrToInt(edtCodigoFOR5.Text)) or
         (StrToInt(edtCodigoFOR8.Text) = StrToInt(edtCodigoFOR6.Text)) or
         (StrToInt(edtCodigoFOR8.Text) = StrToInt(edtCodigoFOR7.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR8.Text+') ';
      sFiltros := sFiltros + '(FOR8:'+edtCodigoFOR8.Text+')';
    end;

    if ckbCodigoFOR9.Checked then
    Begin
      if not ckbCodigoFOR8.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR9.Text) then
      Begin
        edtCodigoFOR9.SetFocus;
        Raise Exception.Create('Fornecedor 9 inválido!');
      end;
      if (StrToInt(edtCodigoFOR9.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR9.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR9.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR9.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR9.Text) = StrToInt(edtCodigoFOR5.Text)) or
         (StrToInt(edtCodigoFOR9.Text) = StrToInt(edtCodigoFOR6.Text)) or
         (StrToInt(edtCodigoFOR9.Text) = StrToInt(edtCodigoFOR7.Text)) or
         (StrToInt(edtCodigoFOR9.Text) = StrToInt(edtCodigoFOR8.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR9.Text+') ';
      sFiltros := sFiltros + '(FOR9:'+edtCodigoFOR9.Text+')';
    end;

    if ckbCodigoFOR10.Checked then
    Begin
      if not ckbCodigoFOR9.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR10.Text) then
      Begin
        edtCodigoFOR10.SetFocus;
        Raise Exception.Create('Fornecedor 10 inválido!');
      end;
      if (StrToInt(edtCodigoFOR10.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR10.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR10.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR10.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR10.Text) = StrToInt(edtCodigoFOR5.Text)) or
         (StrToInt(edtCodigoFOR10.Text) = StrToInt(edtCodigoFOR6.Text)) or
         (StrToInt(edtCodigoFOR10.Text) = StrToInt(edtCodigoFOR7.Text)) or
         (StrToInt(edtCodigoFOR10.Text) = StrToInt(edtCodigoFOR8.Text)) or
         (StrToInt(edtCodigoFOR10.Text) = StrToInt(edtCodigoFOR9.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR10.Text+') ';
      sFiltros := sFiltros + '(FOR10:'+edtCodigoFOR10.Text+')';
    end;

    if ckbCodigoFOR11.Checked then
    Begin
      if not ckbCodigoFOR10.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR11.Text) then
      Begin
        edtCodigoFOR11.SetFocus;
        Raise Exception.Create('Fornecedor 11 inválido!');
      end;
      if (StrToInt(edtCodigoFOR11.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR11.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR11.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR11.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR11.Text) = StrToInt(edtCodigoFOR5.Text)) or
         (StrToInt(edtCodigoFOR11.Text) = StrToInt(edtCodigoFOR6.Text)) or
         (StrToInt(edtCodigoFOR11.Text) = StrToInt(edtCodigoFOR7.Text)) or
         (StrToInt(edtCodigoFOR11.Text) = StrToInt(edtCodigoFOR8.Text)) or
         (StrToInt(edtCodigoFOR11.Text) = StrToInt(edtCodigoFOR9.Text)) or
         (StrToInt(edtCodigoFOR11.Text) = StrToInt(edtCodigoFOR10.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR11.Text+') ';
      sFiltros := sFiltros + '(FOR11:'+edtCodigoFOR11.Text+')';
    end;

    if ckbCodigoFOR12.Checked then
    Begin
      if not ckbCodigoFOR11.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR12.Text) then
      Begin
        edtCodigoFOR12.SetFocus;
        Raise Exception.Create('Fornecedor 12 inválido!');
      end;
      if (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR5.Text)) or
         (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR6.Text)) or
         (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR7.Text)) or
         (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR8.Text)) or
         (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR9.Text)) or
         (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR10.Text)) or
         (StrToInt(edtCodigoFOR12.Text) = StrToInt(edtCodigoFOR11.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR12.Text+') ';
      sFiltros := sFiltros + '(FOR12:'+edtCodigoFOR12.Text+')';
    end;

    if ckbCodigoFOR13.Checked then
    Begin
      if not ckbCodigoFOR12.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR13.Text) then
      Begin
        edtCodigoFOR13.SetFocus;
        Raise Exception.Create('Fornecedor 13 inválido!');
      end;
      if (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR5.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR6.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR7.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR8.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR9.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR10.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR11.Text)) or
         (StrToInt(edtCodigoFOR13.Text) = StrToInt(edtCodigoFOR12.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR13.Text+') ';
      sFiltros := sFiltros + '(FOR13:'+edtCodigoFOR13.Text+')';
    end;

    if ckbCodigoFOR14.Checked then
    Begin
      if not ckbCodigoFOR13.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR14.Text) then
      Begin
        edtCodigoFOR14.SetFocus;
        Raise Exception.Create('Fornecedor 14 inválido!');
      end;
      if (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR5.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR6.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR7.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR8.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR9.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR10.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR11.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR12.Text)) or
         (StrToInt(edtCodigoFOR14.Text) = StrToInt(edtCodigoFOR13.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR14.Text+') ';
      sFiltros := sFiltros + '(FOR14:'+edtCodigoFOR14.Text+')';
    end;

    if ckbCodigoFOR15.Checked then
    Begin
      if not ckbCodigoFOR14.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR15.Text) then
      Begin
        edtCodigoFOR15.SetFocus;
        Raise Exception.Create('Fornecedor 15 inválido!');
      end;
      if (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR5.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR6.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR7.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR8.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR9.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR10.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR11.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR12.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR13.Text)) or
         (StrToInt(edtCodigoFOR15.Text) = StrToInt(edtCodigoFOR14.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR15.Text+') ';
      sFiltros := sFiltros + '(FOR15:'+edtCodigoFOR15.Text+')';
    end;

    if ckbCodigoFOR16.Checked then
    Begin
      if not ckbCodigoFOR15.Checked then
        Raise exception.Create('Fornecedor anterior inválido!');
      if not VerificaInteiroBranco(edtCodigoFOR16.Text) then
      Begin
        edtCodigoFOR16.SetFocus;
        Raise Exception.Create('Fornecedor 16 inválido!');
      end;
      if (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR1.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR2.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR3.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR4.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR5.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR6.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR7.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR8.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR9.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR10.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR11.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR12.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR13.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR14.Text)) or
         (StrToInt(edtCodigoFOR16.Text) = StrToInt(edtCodigoFOR15.Text)) then
        Raise exception.Create('Fornecedor Repetido!');
      CdFOR := CdFOR + ' OR (FOR_CODIGO='+edtCodigoFOR16.Text+') ';
      sFiltros := sFiltros + '(FOR16:'+edtCodigoFOR16.Text+')';
    end;

    CdFOR := CdFOR + ')';
  end;

  if ckbCodigoCNC.Checked then
    if dblCodigoCNC.Text = '' then
      Raise exception.Create('Centro de Custo inválido!')
    else
    Begin
      CdCNC:=' AND (F.CNC_CODIGO='+IntToStr(dblCodigoCNC.KeyValue)+') ';
      sFiltros := sFiltros + '(CNC:'+IntToStr(dblCodigoCNC.KeyValue)+')';
    end;

  If Tag=0 then
  begin
    Application.CreateForm(Trpt_FaturamentoFornecedor2,rpt_FaturamentoFornecedor2);
    with rpt_FaturamentoFornecedor2 do
    Begin
      zrlFiltros.Caption := sFiltros;
      zrlDataINI.Caption  := mskDataINI.Text;
      zrlDataFIM.Caption  := mskDataFIM.Text;
      vDiaMesAno          := rdgAgrupar.ItemIndex;
      sDataINI            := mskDataINI.Text;
      sDataFIM            := mskDataFIM.Text;
      sCodigoGRP          := CdGRP;
      sCodigoSGP          := CdSGP;
      sCodigoFOR          := CdFOR;
      sCodigoCNC          := CdCNC;

      case rdgAgrupar.ItemIndex of
        0: sIntervalo := '(0:'+IntToStr(Trunc(StrToDate(mskDataFIM.Text)-StrToDate(mskDataINI.Text)))+') ';
      end;
      Entidade.Close;
      Entidade.SQL.Text:='SELECT * '+
        ' FROM FORNECEDOR '+
        ' WHERE FOR_CODIGO>0 '+
        CdFOR+
        ' ORDER BY FOR_RZ_SOCIAL ';
      Entidade.Open;
      if Entidade.isEmpty then
      Begin
        ShowMessage('Consulta vazia!');
        Exit;
      end;
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.SB_CancelarClick(Sender: TObject);
begin
 Close;
end;

procedure TfMxSelFaturamentoFornecedor.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  mskDataINI.SetFocus;
end;

procedure TfMxSelFaturamentoFornecedor.edtCodigoFOR1KeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(1);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    with fMxSCotaFor do
    Begin
      Fornecedor1.Close;
      Fornecedor1.SQL.Text := 'SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      Fornecedor1.Open;
      tag:=21;
      ShowModal;
    end;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoCNCClick(Sender: TObject);
begin
  if ckbCodigoCNC.Checked then
  Begin
    CentroCusto1.Open;
    dblCodigoCNC.Color:=clWindow;
    dblCodigoCNC.Enabled:=True;
    dblCodigoCNC.KeyValue:=DM.Configuracao1.CodigoCNC;
  end
  else
  Begin
    dblCodigoCNC.Color:=AlteraCorComponentes;
    dblCodigoCNC.Enabled:=False;
    dblCodigoCNC.KeyValue:=-1;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR1Click(Sender: TObject);
begin
  if ckbCodigoFOR1.Checked then
  Begin
    edtCodigoFOR1.Color:=clWindow;
    edtCodigoFOR1.Enabled:=True;
    edtCodigoFOR1.SetFocus;
  end
  else
  Begin
    edtCodigoFOR1.Color:=AlteraCorComponentes;
    edtCodigoFOR1.Enabled:=False;
    edtCodigoFOR1.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR2Click(Sender: TObject);
begin
  if ckbCodigoFOR2.Checked then
  Begin
    edtCodigoFOR2.Color:=clWindow;
    edtCodigoFOR2.Enabled:=True;
    edtCodigoFOR2.SetFocus;
  end
  else
  Begin
    edtCodigoFOR2.Color:=AlteraCorComponentes;
    edtCodigoFOR2.Enabled:=False;
    edtCodigoFOR2.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR3Click(Sender: TObject);
begin
  if ckbCodigoFOR3.Checked then
  Begin
    edtCodigoFOR3.Color:=clWindow;
    edtCodigoFOR3.Enabled:=True;
    edtCodigoFOR3.SetFocus;
  end
  else
  Begin
    edtCodigoFOR3.Color:=AlteraCorComponentes;
    edtCodigoFOR3.Enabled:=False;
    edtCodigoFOR3.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR4Click(Sender: TObject);
begin
  if ckbCodigoFOR4.Checked then
  Begin
    edtCodigoFOR4.Color:=clWindow;
    edtCodigoFOR4.Enabled:=True;
    edtCodigoFOR4.SetFocus;
  end
  else
  Begin
    edtCodigoFOR4.Color:=AlteraCorComponentes;
    edtCodigoFOR4.Enabled:=False;
    edtCodigoFOR4.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR5Click(Sender: TObject);
begin
  if ckbCodigoFOR5.Checked then
  Begin
    edtCodigoFOR5.Color:=clWindow;
    edtCodigoFOR5.Enabled:=True;
    edtCodigoFOR5.SetFocus;
  end
  else
  Begin
    edtCodigoFOR5.Color:=AlteraCorComponentes;
    edtCodigoFOR5.Enabled:=False;
    edtCodigoFOR5.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR6Click(Sender: TObject);
begin
  if ckbCodigoFOR6.Checked then
  Begin
    edtCodigoFOR6.Color:=clWindow;
    edtCodigoFOR6.Enabled:=True;
    edtCodigoFOR6.SetFocus;
  end
  else
  Begin
    edtCodigoFOR6.Color:=AlteraCorComponentes;
    edtCodigoFOR6.Enabled:=False;
    edtCodigoFOR6.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR7Click(Sender: TObject);
begin
  if ckbCodigoFOR7.Checked then
  Begin
    edtCodigoFOR7.Color:=clWindow;
    edtCodigoFOR7.Enabled:=True;
    edtCodigoFOR7.SetFocus;
  end
  else
  Begin
    edtCodigoFOR7.Color:=AlteraCorComponentes;
    edtCodigoFOR7.Enabled:=False;
    edtCodigoFOR7.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.edtCodigoFOR2KeyPress(
  Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(1);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    with fMxSCotaFor do
    Begin
      Fornecedor1.Close;
      Fornecedor1.SQL.Text := 'SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      Fornecedor1.Open;
      tag:=22;
      ShowModal;
    end;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.edtCodigoFOR3KeyPress(
  Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(1);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    with fMxSCotaFor do
    Begin
      Fornecedor1.Close;
      Fornecedor1.SQL.Text := 'SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      Fornecedor1.Open;
      tag:=23;
      ShowModal;
    end;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.edtCodigoFOR4KeyPress(
  Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(1);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    with fMxSCotaFor do
    Begin
      Fornecedor1.Close;
      Fornecedor1.SQL.Text := 'SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      Fornecedor1.Open;
      tag:=24;
      ShowModal;
    end;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.edtCodigoFOR5KeyPress(
  Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(1);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    with fMxSCotaFor do
    Begin
      Fornecedor1.Close;
      Fornecedor1.SQL.Text := 'SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      Fornecedor1.Open;
      tag:=25;
      ShowModal;
    end;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.edtCodigoFOR6KeyPress(
  Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(1);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    with fMxSCotaFor do
    Begin
      Fornecedor1.Close;
      Fornecedor1.SQL.Text := 'SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      Fornecedor1.Open;
      tag:=26;
      ShowModal;
    end;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.edtCodigoFOR7KeyPress(
  Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(1);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    with fMxSCotaFor do
    Begin
      Fornecedor1.Close;
      Fornecedor1.SQL.Text := 'SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
      Fornecedor1.Open;
      tag:=27;
      ShowModal;
    end;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    SB_ConfirmarClick(sender);
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR8Click(Sender: TObject);
begin
  if ckbCodigoFOR8.Checked then
  Begin
    edtCodigoFOR8.Color:=clWindow;
    edtCodigoFOR8.Enabled:=True;
    edtCodigoFOR8.SetFocus;
  end
  else
  Begin
    edtCodigoFOR8.Color:=AlteraCorComponentes;
    edtCodigoFOR8.Enabled:=False;
    edtCodigoFOR8.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR9Click(Sender: TObject);
begin
  if ckbCodigoFOR9.Checked then
  Begin
    edtCodigoFOR9.Color:=clWindow;
    edtCodigoFOR9.Enabled:=True;
    edtCodigoFOR9.SetFocus;
  end
  else
  Begin
    edtCodigoFOR9.Color:=AlteraCorComponentes;
    edtCodigoFOR9.Enabled:=False;
    edtCodigoFOR9.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR10Click(
  Sender: TObject);
begin
  if ckbCodigoFOR10.Checked then
  Begin
    edtCodigoFOR10.Color:=clWindow;
    edtCodigoFOR10.Enabled:=True;
    edtCodigoFOR10.SetFocus;
  end
  else
  Begin
    edtCodigoFOR10.Color:=AlteraCorComponentes;
    edtCodigoFOR10.Enabled:=False;
    edtCodigoFOR10.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR11Click(
  Sender: TObject);
begin
  if ckbCodigoFOR11.Checked then
  Begin
    edtCodigoFOR11.Color:=clWindow;
    edtCodigoFOR11.Enabled:=True;
    edtCodigoFOR11.SetFocus;
  end
  else
  Begin
    edtCodigoFOR11.Color:=AlteraCorComponentes;
    edtCodigoFOR11.Enabled:=False;
    edtCodigoFOR11.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR12Click(
  Sender: TObject);
begin
  if ckbCodigoFOR12.Checked then
  Begin
    edtCodigoFOR12.Color:=clWindow;
    edtCodigoFOR12.Enabled:=True;
    edtCodigoFOR12.SetFocus;
  end
  else
  Begin
    edtCodigoFOR12.Color:=AlteraCorComponentes;
    edtCodigoFOR12.Enabled:=False;
    edtCodigoFOR12.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR13Click(
  Sender: TObject);
begin
  if ckbCodigoFOR13.Checked then
  Begin
    edtCodigoFOR13.Color:=clWindow;
    edtCodigoFOR13.Enabled:=True;
    edtCodigoFOR13.SetFocus;
  end
  else
  Begin
    edtCodigoFOR13.Color:=AlteraCorComponentes;
    edtCodigoFOR13.Enabled:=False;
    edtCodigoFOR13.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR14Click(
  Sender: TObject);
begin
  if ckbCodigoFOR14.Checked then
  Begin
    edtCodigoFOR14.Color:=clWindow;
    edtCodigoFOR14.Enabled:=True;
    edtCodigoFOR14.SetFocus;
  end
  else
  Begin
    edtCodigoFOR14.Color:=AlteraCorComponentes;
    edtCodigoFOR14.Enabled:=False;
    edtCodigoFOR14.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR15Click(
  Sender: TObject);
begin
  if ckbCodigoFOR15.Checked then
  Begin
    edtCodigoFOR15.Color:=clWindow;
    edtCodigoFOR15.Enabled:=True;
    edtCodigoFOR15.SetFocus;
  end
  else
  Begin
    edtCodigoFOR15.Color:=AlteraCorComponentes;
    edtCodigoFOR15.Enabled:=False;
    edtCodigoFOR15.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.ckbCodigoFOR16Click(
  Sender: TObject);
begin
  if ckbCodigoFOR16.Checked then
  Begin
    edtCodigoFOR16.Color:=clWindow;
    edtCodigoFOR16.Enabled:=True;
    edtCodigoFOR16.SetFocus;
  end
  else
  Begin
    edtCodigoFOR16.Color:=AlteraCorComponentes;
    edtCodigoFOR16.Enabled:=False;
    edtCodigoFOR16.Clear;;
  end;
end;

procedure TfMxSelFaturamentoFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
