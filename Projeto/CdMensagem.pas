unit CdMensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Fornecedor, CentroCusto, DBCtrls, Parametro, ComCtrls, Menus, Mensagem,
  MensagemCPD, Usuario;

type
  TfCadMensag = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel14: TPanel;
    DBGrid5: TDBGrid;
    Panel1: TPanel;
    SB_Exc: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Loc: TSpeedButton;
    SB_Novo: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    ComboBox2: TComboBox;
    Panel13: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit6: TEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Memo2: TMemo;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    Edit7: TEdit;
    ComboBox1: TComboBox;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Edit11: TEdit;
    Label12: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Mensagem1: TMensagem;
    DSMensagem1: TDataSource;
    DSMensagemCPD1: TDataSource;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    CentroCusto1: TCentroCusto;
    CentroCusto2: TCentroCusto;
    DSCentroCusto2: TDataSource;
    Edit2: TEdit;
    Edit3: TEdit;
    MensagemCPD1: TMensagemCPD;
    MensagemCPD1MSC_CODIGO: TIntegerField;
    MensagemCPD1MSG_CODIGO: TIntegerField;
    MensagemCPD1CNC_CODIGO: TIntegerField;
    MensagemCPD1MSG_DATA_HORA: TDateTimeField;
    MensagemCPD1FUN_DE: TStringField;
    MensagemCPD1CNC_CODIGO_DE: TIntegerField;
    MensagemCPD1FUN_PARA: TStringField;
    MensagemCPD1MSG_ASSUNTO: TStringField;
    MensagemCPD1MSG_TEXTO: TStringField;
    MensagemCPD1MSG_PUBLICA: TSmallintField;
    MensagemCPD1Origem: TStringField;
    Mensagem1MSG_CODIGO: TIntegerField;
    Mensagem1CNC_CODIGO: TIntegerField;
    Mensagem1MSG_DATA_HORA: TDateTimeField;
    Mensagem1FUN_DE: TStringField;
    Mensagem1CNC_CODIGO_PARA: TIntegerField;
    Mensagem1FUN_PARA: TStringField;
    Mensagem1MSG_ASSUNTO: TStringField;
    Mensagem1MSG_TEXTO: TStringField;
    Mensagem1MSG_PUBLICA: TSmallintField;
    Mensagem1Destino: TStringField;
    SpeedButton9: TSpeedButton;
    Edit8: TEdit;
    Label15: TLabel;
    SB_Ult: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_Ult2: TSpeedButton;
    SB_Prox2: TSpeedButton;
    SB_Ant2: TSpeedButton;
    SB_Prim2: TSpeedButton;
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CentroCusto1AfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Mensagem1AfterScroll(DataSet: TDataSet);
    procedure MensagemCPD1AfterScroll(DataSet: TDataSet);
    procedure Mensagem1CalcFields(DataSet: TDataSet);
    procedure MensagemCPD1CalcFields(DataSet: TDataSet);
    procedure SB_ExcClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SB_Prim2Click(Sender: TObject);
    procedure SB_Ant2Click(Sender: TObject);
    procedure SB_Prox2Click(Sender: TObject);
    procedure SB_Ult2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadMensag: TfCadMensag;

implementation
Uses UDM,funcoes, MxMensagem;
{$R *.DFM}



procedure TfCadMensag.SB_PrimClick(Sender: TObject);
begin
 if MensagemCPD1.IsEmpty then
   abort;
 If MensagemCPD1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    MensagemCPD1.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not MensagemCPD1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfCadMensag.SB_AntClick(Sender: TObject);
begin
 if MensagemCPD1.IsEmpty then
   abort;
 If MensagemCPD1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    MensagemCPD1.Prior;
    If MensagemCPD1.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not MensagemCPD1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfCadMensag.SB_ProxClick(Sender: TObject);
begin
  if MensagemCPD1.IsEmpty then
   abort;
  If MensagemCPD1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    MensagemCPD1.Next;
    If MensagemCPD1.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not MensagemCPD1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfCadMensag.SB_UltClick(Sender: TObject);
begin
  if MensagemCPD1.IsEmpty then
   abort;
  If MensagemCPD1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    MensagemCPD1.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not MensagemCPD1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfCadMensag.SB_NovoClick(Sender: TObject);
begin
  SB_Prim2.Enabled:=False;
  SB_Ant2.Enabled:=False;
  SB_Prox2.Enabled:=False;
  SB_Ult2.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Edit11.Enabled:=False;
  Edit11.Color:=clMenu;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=clMenu;
  DBGrid5.Enabled:=False;
  Mensagem1.PreparaInsercao;
  DBLookupComboBox3.SetFocus;  
end;

procedure TfCadMensag.SB_AltClick(Sender: TObject);
begin
  if Mensagem1.IsEmpty then
    raise exception.Create('Não há dados a serem alterados!');
  if Trunc(Mensagem1.DataHora) < Trunc(DM.Configuracao1.Data) then
    raise exception.Create('Mensagem já enviada!');
  SB_Prim2.Enabled:=False;
  SB_Ant2.Enabled:=False;
  SB_Prox2.Enabled:=False;
  SB_Ult2.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Edit11.Enabled:=False;
  Edit11.Color:=clMenu;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=clMenu;
  DBGrid5.Enabled:=False;
  Mensagem1.PreparaAlteracao;
  DBLookupComboBox3.SetFocus;
end;

procedure TfCadMensag.SB_SalvaClick(Sender: TObject);
var
  mensagem:string;
begin
  mensagem:='';
  if DBLookupComboBox3.KeyValue = Null then
    mensagem:=mensagem+'Selecione o Centro de Custo!'+#13;
  if DBLookupComboBox3.KeyValue = DM.Configuracao1.CodigoCNC then
    mensagem:=mensagem+'Não mande mensagem para esse centro de custo (é o seu)!'+#13;
  if Edit6.Text = '' then
    mensagem:=mensagem+'Defina o Assunto!'+#13;
  if Edit2.Text = '' then
    mensagem:=mensagem+'Usuário inválido!'+#13;
  if mensagem <> '' then
    Raise Exception.Create(mensagem);
  SB_Prim2.Enabled:=True;
  SB_Ant2.Enabled:=True;
  SB_Prox2.Enabled:=True;
  SB_Ult2.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  DBGrid5.Enabled:=True;  
  Mensagem1.FinalizaEdicao;
end;

procedure TfCadMensag.SB_CancClick(Sender: TObject);
begin
  SB_Prim2.Enabled:=True;
  SB_Ant2.Enabled:=True;
  SB_Prox2.Enabled:=True;
  SB_Ult2.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  DBGrid5.Enabled:=True;  
  Mensagem1.CancelaEdicao;
end;

procedure TfCadMensag.FormCreate(Sender: TObject);
begin
  MensagemCPD1.Close;
  MensagemCPD1.SQL.Clear;
  MensagemCPD1.SQL.ADD('SELECT * FROM MENSAGEM_CPD '+
     'WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
     ' ORDER BY MSG_DATA_HORA DESC');
  Mensagem1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
  Mensagem1.Open;
  MensagemCPD1.Open;
  CentroCusto2.Open;
end;

procedure TfCadMensag.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfCadMensag.SB_LocClick(Sender: TObject);
begin
  If ComboBox2.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit11.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  Mensagem1.Localizar;
end;


procedure TfCadMensag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Mensagem1.Active:=False;
  Action:=Cafree;
end;

procedure TfCadMensag.CentroCusto1AfterScroll(DataSet: TDataSet);
begin
  Mensagem1.CarregaDados;
end;















procedure TfCadMensag.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled=true then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfCadMensag.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(fCadMensag);
end;




procedure TfCadMensag.Mensagem1AfterScroll(DataSet: TDataSet);
begin
  Mensagem1.CarregaDados;
end;

procedure TfCadMensag.MensagemCPD1AfterScroll(DataSet: TDataSet);
begin
  MensagemCPD1.CarregaDados;
end;


procedure TfCadMensag.Mensagem1CalcFields(DataSet: TDataSet);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Mensagem1.CNC_Codigo_para;
  CentroCusto1.Open;
  Mensagem1.FieldByName('Destino').asString:=CentroCusto1.RazaoSocial;
end;


procedure TfCadMensag.MensagemCPD1CalcFields(DataSet: TDataSet);
begin
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=MensagemCPD1.CNC_Codigo_de;
  CentroCusto1.Open;
  MensagemCPD1.FieldByName('Origem').asString:=CentroCusto1.RazaoSocial;
end;

procedure TfCadMensag.SB_ExcClick(Sender: TObject);
begin
  Mensagem1.deletarauto;
  if Mensagem1.IsEmpty then
  Begin
    Edit1.Clear;
    MaskEdit1.Clear;
    DBLookupComboBox3.KeyValue:=-1;
    Edit2.Clear;
    Edit6.Clear;
    Memo1.Clear;
    CheckBox1.Checked:=False;
  end;
end;


procedure TfCadMensag.SpeedButton9Click(Sender: TObject);
var
  i,tam:integer;
  temp,temp2:string;
begin
  if MensagemCPD1.IsEmpty then
    raise Exception.Create('Selecione a mensagem!');
  Application.CreateForm(TfMxMensagem, fMxMensagem);
  with fMxMensagem do
  Begin
    temp:='';
    temp2:='';
    tam:=Length(Edit3.Text);
    for i:=1 to 40-tam do
      temp:=temp+' ';
    tam:=Length(Edit8.Text);
    for i:=1 to 40-tam do
      temp2:=temp2+' ';
    Memo1.Lines.Add('');
    Memo1.Lines.Add('MENSAGEM RECEBIDA');
    Memo1.Lines.Add('');
    Memo1.Lines.Add('_________________________________________________________________________________');
    Memo1.Lines.Add('Data: '+MaskEdit2.Text);
    Memo1.Lines.Add('De  : '+Edit3.Text+Temp+' Centro: '+DBLookupComboBox2.Text);
    Memo1.Lines.Add('Para: '+Edit8.Text+Temp2+' Centro: '+DM.CentroCusto1.RazaoSocial);
    Memo1.Lines.Add('Assunto: '+Edit5.Text);
    Memo1.Lines.Add('_________________________________________________________________________________');
    For i:=0 to Memo2.Lines.Count-1 do
      Memo1.Lines.Add(Memo2.Lines[i]);
    Memo1.Lines.Add('_________________________________________________________________________________');
  End;
  fMxMensagem.ShowModal;
end;



procedure TfCadMensag.SB_Prim2Click(Sender: TObject);
begin
 if Mensagem1.IsEmpty then
   abort;
 If Mensagem1.bof Then
  begin
    SB_Ant2.Enabled:=False;
    SB_Prim2.Enabled:=False;
  end
  Else
  begin
    Mensagem1.First;
    SB_Ant2.Enabled:=False;
    SB_Prim2.Enabled:=False;
  end;
  If not Mensagem1.eof Then
  begin
    SB_Prox2.Enabled:=True;
    SB_Ult2.Enabled:=True;
  end;
end;

procedure TfCadMensag.SB_Ant2Click(Sender: TObject);
begin
 if Mensagem1.IsEmpty then
   abort;
 If Mensagem1.bof Then
  begin
    SB_Ant2.Enabled:=False;
    SB_Prim2.Enabled:=False;
  end
  Else
  begin
    Mensagem1.Prior;
    If Mensagem1.bof Then
    begin
     SB_Ant2.Enabled:=False;
     SB_Prim2.Enabled:=False;
    end;
  end;
  If not Mensagem1.eof Then
  begin
    SB_Prox2.Enabled:=True;
    SB_Ult2.Enabled:=True;
  end;
end;

procedure TfCadMensag.SB_Prox2Click(Sender: TObject);
begin
  if Mensagem1.IsEmpty then
   abort;
  If Mensagem1.eof Then
  begin
    SB_Prox2.Enabled:=False;
    SB_Ult2.Enabled:=False;
  end
  Else
  begin
    Mensagem1.Next;
    If Mensagem1.eof Then
    begin
     SB_Prox2.Enabled:=False;
     SB_Ult2.Enabled:=False;
    end;
  end;
  If not Mensagem1.bof Then
  begin
    SB_Ant2.Enabled:=True;
    SB_Prim2.Enabled:=True;
  end;
end;

procedure TfCadMensag.SB_Ult2Click(Sender: TObject);
begin
  if Mensagem1.IsEmpty then
   abort;
  If Mensagem1.eof Then
  begin
    SB_Prox2.Enabled:=False;
    SB_Ult2.Enabled:=False;
  end
  Else
  begin
    Mensagem1.Last;
    SB_Prox2.Enabled:=False;
    SB_Ult2.Enabled:=False;
  end;
  If not Mensagem1.bof Then
  begin
    SB_Ant2.Enabled:=True;
    SB_Prim2.Enabled:=True;
  end;
end;

procedure TfCadMensag.SpeedButton3Click(Sender: TObject);
begin
  If ComboBox1.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit7.Text) then
      raise Exception.create('Código a ser localizado inválido!');
  MensagemCPD1.Localizar;
end;

end.
