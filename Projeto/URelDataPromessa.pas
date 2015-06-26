unit URelDataPromessa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, MxRetCobrador, ComCtrls, funcoes, Db,
  DBTables, SQuery, CentroCusto, DBCtrls, Menus, Parametro;

type
  Trpt_DataPromessa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Label8: TLabel;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    Label17: TLabel;
    CheckBox2: TCheckBox;
    Label20: TLabel;
    Edit3: TEdit;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    dblTipo: TDBLookupComboBox;
    Parametro5: TParametro;
    DSParametro5: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    DataOk: Boolean;
  end;

var
  rpt_DataPromessa: Trpt_DataPromessa;
  CNC:string;

implementation

uses UDM, UPrinc2, MxCobCobrador, URetornoCobrador, CdCliente;

{$R *.DFM}


procedure Trpt_DataPromessa.BitBtn1Click(Sender: TObject);
var
  mensagem,TRC,CLI,CPC,DTINI_VEN,DTFIM_VEN,DTINI_VIS,DTFIM_VIS,DTINI_PRO,DTFIM_PRO,Sit,CLI_TIPO, OBS :string;
begin
  OBS := '';
  CLI_TIPO := '';
  mensagem:='';
  TRC:='';
  CLI:='';
  CPC:='';
  Sit:='';
  DTINI_VEN:='';
  DTFIM_VEN:='';
  DTINI_VIS:='';
  DTFIM_VIS:='';
  DTINI_PRO:='';
  DTFIM_PRO:='';

  //TIPO
  if CheckBox3.Checked then
    CLI_TIPO := ' AND T2.CLI_TIPO = ''' +inttostr(dblTipo.Keyvalue) +''' '
  else
    CLI_TIPO := '';
  //OBSERVACAO
  if Edit3.Text <> '' then
    OBS := ' AND (TRC_OBSERVACAO LIKE "%'+Edit3.Text+'%") '
  else
    OBS := '';


  if CheckBox2.Checked then
    Sit := ' AND (T1.TRC_SITUACAO IN (2,3)) '
  else
    Sit := ' AND (T1.TRC_SITUACAO IN (0,1,8)) ';
  if not VerificaInteiro(Edit1.text) then
     Mensagem:=mensagem+'Código do cliente inválido!'+#13;
  if not VerificaInteiro(Edit2.text) then
     Mensagem:=mensagem+'Código do título inválido!'+#13;
  if not VerificaData(MaskEdit1.Text) then
    mensagem:=mensagem+'Data inicial do vencimento digitada incorretamente!'+#13;
  if not VerificaData(MaskEdit2.Text) then
    mensagem:=mensagem+'Data final do vencimento digitada incorretamente!'+#13;
  if VerificaDataBranco(MaskEdit1.Text)then
    DTINI_VEN:=' AND T1.TRC_VENCIMENTO>="'+MesDia(MaskEdit1.Text)+'" ';
  if VerificaDataBranco(MaskEdit2.Text)then
    DTFIM_VEN:=' AND T1.TRC_VENCIMENTO<"'+MesDia(StrToDate(MaskEdit2.Text)+1)+'" ';
  if not VerificaData(MaskEdit3.Text) then
    mensagem:=mensagem+'Data inicial da visita digitada incorretamente!'+#13;
  if not VerificaData(MaskEdit4.Text) then
    mensagem:=mensagem+'Data final da visita digitada incorretamente!'+#13;
  if VerificaDataBranco(MaskEdit3.Text)then
    DTINI_VIS:=' AND T1.TRC_RGB_DT_VISITADO>="'+MesDia(MaskEdit3.Text)+'" ';
  if VerificaDataBranco(MaskEdit4.Text)then
    DTFIM_VIS:=' AND T1.TRC_RGB_DT_VISITADO<"'+MesDia(StrToDate(MaskEdit4.Text)+1)+'" ';
  if not VerificaData(MaskEdit5.Text) then
    mensagem:=mensagem+'Data inicial da promessa digitada incorretamente!'+#13;
  if not VerificaData(MaskEdit6.Text) then
    mensagem:=mensagem+'Data final da promessa digitada incorretamente!'+#13;
  if VerificaDataBranco(MaskEdit5.Text)then
    DTINI_PRO:=' AND T1.TRC_RGB_DT_PROMESSA>="'+MesDia(MaskEdit5.Text)+'" ';
  if VerificaDataBranco(MaskEdit6.Text)then
    DTFIM_PRO:=' AND T1.TRC_RGB_DT_PROMESSA<"'+MesDia(StrToDate(MaskEdit6.Text)+1)+'" ';
  if mensagem<>'' then
    raise exception.Create(mensagem);
  if Edit1.Text <> '' then
    CLI:=' AND (T1.CLI_CODIGO='+Edit1.Text+') ';
  if Edit2.Text <> '' then
    TRC:=' AND (T1.TRC_CODIGO='+Edit2.Text+') ';
  if not CheckBox1.Checked then
    CPC:=' AND (T1.CPC_CODIGO='+fMxCobCobrador.edtCodigoCPC.Text+') ';
  If Tag=0 then
  begin
    Application.CreateForm(Trpt_RetornoCobrador, rpt_RetornoCobrador);
    rpt_RetornoCobrador.SZRLabel23.Caption := MaskEdit1.Text;
    rpt_RetornoCobrador.SZRLabel25.Caption := MaskEdit2.Text;
    rpt_RetornoCobrador.SZRLabel28.Caption := MaskEdit3.Text;
    rpt_RetornoCobrador.SZRLabel30.Caption := MaskEdit4.Text;
    rpt_RetornoCobrador.SZRLabel32.Caption := MaskEdit5.Text;
    rpt_RetornoCobrador.SZRLabel34.Caption := MaskEdit6.Text;
    rpt_RetornoCobrador.Titulo_receber1.Close;
    rpt_RetornoCobrador.Titulo_receber1.SQL.Text:='SELECT T1.*, T2.CLI_RZ_SOCIAL,'+
       'T2.CLI_NOME_FAN,T2.CLI_ENDERECO,T2.CLI_BAIRRO,T2.CLI_PAI,T2.CLI_MAE,T2.CLI_OBS1 '+
       'FROM TITULO_A_RECEBER T1, CLIENTE T2 '+
       'WHERE T1.CLI_CODIGO=T2.CLI_CODIGO AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
       'AND T1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+CPC+CLI+TRC+
       DTINI_VEN+DTFIM_VEN+DTINI_VIS+DTFIM_VIS+DTINI_PRO+DTFIM_PRO+Sit+CLI_TIPO+OBS+
       'ORDER BY T1.CLI_CODIGO,T1.PDV_CODIGO,T1.TRC_CODIGO ASC ';
    rpt_RetornoCobrador.Titulo_receber1.Open;
    if rpt_RetornoCobrador.Titulo_receber1.IsEmpty then
      Raise Exception.Create('Consulta Vazia!');


    if CheckBox4.Checked then
    begin
      rpt_RetornoCobrador.SZRGroup1.Height := 2;
    end
    else
    begin
      rpt_RetornoCobrador.SZRGroup1.Height := 4;
    end;

    rpt_RetornoCobrador.report.Preview;
    rpt_RetornoCobrador.Close;
  end;
end;

procedure Trpt_DataPromessa.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure Trpt_DataPromessa.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Edit1.SetFocus;
end;

procedure Trpt_DataPromessa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Trpt_DataPromessa.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    Edit1.Clear;
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=10;
    fCadCli.CentroCusto2.open;
    fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
    fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    fCadCli.Showmodal;
  End;
end;

procedure Trpt_DataPromessa.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
  Begin
    Parametro5.Open;
    dblTipo.Color:=clWindow;
    dblTipo.Enabled:=True;
    try
      dblTipo.SetFocus;
    except
    end;
  end
  else
  Begin
    Parametro5.Close;
    dblTipo.Color:=AlteraCorComponentes;
    dblTipo.Enabled:=False;
    dblTipo.KeyValue:=-1;
  end;
end;

end.
