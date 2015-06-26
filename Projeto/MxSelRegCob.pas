unit MxSelRegCob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, SQuery,
  Cliente, Titulo_receber;

type
  TfmxSelRegCob = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    Cliente1: TCliente;
    Titulo_receber1: TTitulo_receber;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmxSelRegCob: TfmxSelRegCob;

implementation

uses UEnviaCobrador, UDM, funcoes, MxCobCobrador, CdCliente;

{$R *.DFM}


procedure TfmxSelRegCob.RadioButton2Click(Sender: TObject);
begin
  MaskEdit1.Enabled:=False;
  MaskEdit1.Color:=AlteraCorComponentes;
  MaskEdit2.Enabled:=False;
  MaskEdit2.Color:=AlteraCorComponentes;
  Edit1.Enabled     :=False;
  Edit1.Color       :=AlteraCorComponentes;  
end;

procedure TfmxSelRegCob.RadioButton1Click(Sender: TObject);
begin
  MaskEdit1.Enabled :=False;
  MaskEdit1.Color   :=AlteraCorComponentes;
  MaskEdit2.Enabled :=False;
  MaskEdit2.Color   :=AlteraCorComponentes;
  Edit1.Enabled     :=False;
  Edit1.Color       :=AlteraCorComponentes;
end;

procedure TfmxSelRegCob.BitBtn1Click(Sender: TObject);
var
  Data_INI, Data_FIM:string;
begin
  If RadioButton2.Checked then
  Begin
    If fMxSelRegCob.Tag = 0 then
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_RGB_SITUACAO=2 '+
        ',TRC_RGB_DT_SITUACAO="'+MesDia(DM.Configuracao1.Data)+'" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND TRC_RGB_SITUACAO<2 ');
  End
  Else If RadioButton3.Checked then
  begin
    If fMxSelRegCob.Tag = 0 then
    Begin
      If Edit1.Text = '' then
        Raise Exception.Create('Cliente não selecionado!');
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
        ' TRC_RGB_SITUACAO=2 '+
        ',TRC_RGB_DT_SITUACAO="'+MesDia(DM.Configuracao1.Data)+'" '+
        ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND TRC_RGB_SITUACAO<2 AND CLI_CODIGO='+Edit1.Text);
    End;
  End
  Else If RadioButton4.Checked then
  begin
    If not VerificaDataBranco(MaskEdit1.Text) then
      raise Exception.Create('Data inicial inválida!');
    If not VerificaDataBranco(MaskEdit2.Text) then
      raise Exception.Create('Data final inválida!');
    Data_INI:='"'+MesDia(StrToDate(MaskEdit1.Text))+'"';
    Data_FIM:='"'+MesDia(StrToDate(MaskEdit2.Text)+1)+'"';
    Titulo_receber1.Close;
    Titulo_receber1.SQL.Text:='SELECT TRC_CODIGO,TRC_VENCIMENTO FROM TITULO_A_RECEBER WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
         ' AND TRC_VENCIMENTO>='+Data_INI+' AND TRC_VENCIMENTO<'+Data_FIM;
    Titulo_receber1.Open;
    Titulo_receber1.First;
    If fMxSelRegCob.Tag = 0 then
    Begin
      While not Titulo_receber1.EOF do
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
          ' TRC_RGB_SITUACAO=2 '+
          ',TRC_RGB_DT_SITUACAO="'+MesDia(DM.Configuracao1.Data)+'" '+
          ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
          ' AND TRC_RGB_SITUACAO<2 '+
          ' AND TRC_CODIGO='+IntToStr(Titulo_receber1.CodigoTRC));
        Titulo_receber1.Next;
      End;
    End;                                
  end;
end;

procedure TfmxSelRegCob.BitBtn2Click(Sender: TObject);
begin
  Close;
end;



procedure TfmxSelRegCob.RadioButton3Click(Sender: TObject);
begin
  MaskEdit1.Enabled:=False;
  MaskEdit1.Color:=AlteraCorComponentes;
  MaskEdit2.Enabled:=False;
  MaskEdit2.Color:=AlteraCorComponentes;
  Edit1.Enabled     :=True;
  Edit1.Color       :=ClWindow;
  Edit1.SetFocus;
end;

procedure TfmxSelRegCob.RadioButton4Click(Sender: TObject);
begin
  Edit1.Enabled     :=False;
  Edit1.Color       :=AlteraCorComponentes;
  MaskEdit1.Enabled:=True;
  MaskEdit1.Color:=clWindow;
  MaskEdit2.Enabled:=True;
  MaskEdit2.Color:=clWindow;
  MaskEdit1.SetFocus;
end;

procedure TfmxSelRegCob.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    Edit1.Text:='';
    key:=chr(0);
    Application.CreateForm(TfCadCli, fCadCli);
    fCadCli.tag:=5;
    fCadCli.CentroCusto2.open;
    fCadCli.CentroCusto2.LocalizarCod(DM.Configuracao1.CodigoCNC);
    fCadCli.dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    fCadCli.Cliente1.Open;
    fCadCli.Showmodal;
  End;
end;

procedure TfmxSelRegCob.Edit1Exit(Sender: TObject);
begin
  If edit1.Text<>'' then
  Begin
    Cliente1.Close;
    Cliente1.ParamByName('CLI_CODIGO').AsInteger:=StrToInt(Edit1.Text);
    Cliente1.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
    Cliente1.Open;
    If Cliente1.IsEmpty then
    Begin
      TEdit(Sender).SetFocus;
      raise Exception.Create('Cliente não cadastrado');
    End;
  End;
end;

procedure TfmxSelRegCob.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
