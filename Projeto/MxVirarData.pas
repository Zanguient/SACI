unit MxVirarData;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Db, DBTables, ExtCtrls, MMSystem, DateUtils, 
  ComCtrls;

type
  TfMxVirarData = class(TForm)
    Panel1: TPanel;
    lblDescData: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    cancelar:Boolean;
  end;

var
  fMxVirarData: TfMxVirarData;

implementation

Uses
  UDM, Funcoes, DigSenha, MxSelResumo;

{$R *.DFM}

procedure TfMxVirarData.BitBtn1Click(Sender: TObject);
var
  CdUSU:integer;
begin
  If DateTimePicker1.Date>StrToDate(DataLimite) then
  Begin
    try
      sndPlaySound(PChar(cSomErro),SND_ASYNC);
    except
    end;
    //essa msg aparece quando o cliente ta com a chave.dll expirada e quando vai virar a data, coloca uma data maior que o limite
    Application.MessageBox(PChar('Atenção!'#13+#13+#13+
                           'A data informada: ''' +DateToStr(DateTimePicker1.Date)+ ''','#13+
                           'é maior que a data limite do sistema: ''' +DataLimite+ ''''#13+
                           'Atualize a chave do sistema ou entre em contato com o Suporte!'#13+#13),
                           'SIAC',MB_OK+MB_ICONINFORMATION);

    Halt;
  end;
{  If self.Tag=0 then
  Begin
    with DM.Configuracao1 do
    begin
      try
        CdUSU := DM.Usuario1.CodigoUSU;
        DM.Usuario1.GeraLog(2340,0,0,'Data Escolhida: '+DateToStr(DateTimePicker1.Date));
        if (not (DM.Configuracao1.Empresa IN TEmpresasConfiguracaoUnica)) then
          ExecutaSQL(DM.QR_Comandos,'UPDATE CONFIGURACAO SET '+
            ' DATA="'+MesDia(DateTimePicker1.Date)+'"'+
            ' WHERE CNC_CODIGO='+IntToStr(DM.Usuario1.CentroDeCusto))
        else
          ExecutaSQL(DM.QR_Comandos,'UPDATE CONFIGURACAO SET '+
            ' DATA="'+MesDia(DateTimePicker1.Date)+'"');
        Close;
        Open;
        CodigoCNC := DM.Usuario1.CentroDeCusto;
        CodigoUSU := CdUSU;
      except
        ShowMessage('Não foi possível alterar o campo corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    end;
  end
}
  If Self.Tag=1 then
  begin
    if DateTimePicker1.Date < TDigitaSenha(formLogin).Configuracao1.Data then
      if TDigitaSenha(formLogin).usuario1.Permissoes.IndexOf(IntToStr(8120)) < 0 then
        raise exception.Create('Usuário não pode retroceder a data!')
      else
        TDigitaSenha(formLogin).usuario1.GeraLog(8120, 0, 0, 'USU:'+IntToStr(UsuLogin)+' Dt Nova:'+DateTimeToStr(DateTimePicker1.Date));
    if Trunc(DateTimePicker1.Date) <> Trunc(Date) then
      raise exception.Create('Data Diferente do Windows!');
    with TDigitaSenha(formLogin).Configuracao1 do
    begin
      try
        CdUSU:=TDigitaSenha(formLogin).Usuario1.CodigoUSU;
        if (not (TDigitaSenha(formLogin).Configuracao1.Empresa IN TEmpresasConfiguracaoUnica)) then
          ExecutaSQL(TDigitaSenha(formLogin).QR_Comandos,'UPDATE CONFIGURACAO SET '+
            ' DATA="'+MesDia(DateTimePicker1.Date)+'"'+
            ' WHERE CNC_CODIGO='+IntToStr(TDigitaSenha(formLogin).Usuario1.CentroDeCusto))
        else
          ExecutaSQL(TDigitaSenha(formLogin).QR_Comandos,'UPDATE CONFIGURACAO SET '+
            ' DATA="'+MesDia(DateTimePicker1.Date)+'"');
        TDigitaSenha(formLogin).Configuracao1.Close;
        TDigitaSenha(formLogin).Configuracao1.Open;
        TDigitaSenha(formLogin).Configuracao1.CodigoCNC:=TDigitaSenha(formLogin).Usuario1.CentroDeCusto;
        TDigitaSenha(formLogin).Configuracao1.CodigoUSU:=CdUSU;
      except
        ShowMessage('Não foi possível alterar a data. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    end;
  end
  else if self.tag = 2 then //Resumo de Compra de Cliente
  Begin
    fmxSelResumo.vDataINI := DateTimePicker1.Date;
  end;
end;


procedure TfMxVirarData.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxVirarData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;


procedure TfMxVirarData.FormShow(Sender: TObject);
var
  vData: TDateTime;
begin
  vData := Date;
  if self.Tag = 2 then
    DateTimePicker1.Date := IncYear(vData, -2)
  else
    DateTimePicker1.Date := Date;
end;

procedure TfMxVirarData.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn1Click(BitBtn1);
end;

end.
