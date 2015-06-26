unit u_ProtecSerial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, u_Serial, ExtCtrls, IniFiles, funcoes, math;

type
  TfrProtecSerial = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox1: TGroupBox;
    edSerial1: TEdit;
    edSerial2: TEdit;
    GroupBox2: TGroupBox;
    edSenha1: TEdit;
    edSenha2: TEdit;
    GroupBox3: TGroupBox;
    edtCOD_01: TEdit;
    edtCOD_02: TEdit;
    edtCOD_03: TEdit;
    edtCOD_04: TEdit;
    edtCOD_05: TEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtNome: TEdit;
    edtCNPJ: TEdit;
    edtIE: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCOD_05Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Fretorno   : boolean;
    FCheckKey3 : boolean;
    procedure LeArquivoSIAC;
    procedure GravaArquivoSIAC;
    { Private declarations }
  public
    class function Execute(bCheckKey3: boolean = false): boolean; overload;
    class function Execute(var skey3: string; bCheckKey3: boolean): boolean; overload;
    { Public declarations }
  end;

var
  frProtecSerial: TfrProtecSerial;
                                              
implementation

uses u_protecao;

{$R *.dfm}

{ TfrProtecSerial }

class function TfrProtecSerial.Execute(bCheckKey3: boolean = false): boolean;
var
  skey3: string;
begin
  Result := Execute(skey3,bCheckKey3);
end;

class function TfrProtecSerial.Execute(var skey3: string;
  bCheckKey3: boolean): boolean;
var
  skey1 : string;
  skey2 : string;
begin
  with TfrProtecSerial.Create(nil) do
  begin
    GeraSerial(skey1, skey2);
    edSerial1.Text := skey1;
    edSerial2.Text := skey2;
    FCheckKey3     := bCheckKey3;
    Fretorno       := false;

    ShowModal;
    skey3  := '';//edSenha3.Text;
    Result := Fretorno;
    Free;
  end;

end;

procedure TfrProtecSerial.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrProtecSerial.edtCOD_05Exit(Sender: TObject);
var
  Serie: TSerial;
  codigo,nome,cnpj,ie,sSerial: string;
begin
  Serie := TSerial.Create;
  sSerial := edtCOD_01.text+'-'+edtCOD_02.text+'-'+edtCOD_03.text+'-'+edtCOD_04.text+'-'+edtCOD_05.text;
  try
    if (sSerial = cSerialUnico) or (Serie.ExisteSerial(sSerial,codigo,nome,cnpj,ie)) then
    begin
      edtNome.Text := nome;
      edtCNPJ.Text := cnpj;
      edtIE.Text   := ie;

      if (sSerial = cSerialUnico) then
        BitBtn3Click(BitBtn3);
    end
    else
    begin
      edtNome.Text := '';
      edtCNPJ.Text := '';
      edtIE.Text   := '';
      edtCOD_01.SetFocus;
      raise Exception.Create('Serial inválido!');
    end;

  finally
    Serie.Free;
  end;
end;

procedure TfrProtecSerial.BitBtn3Click(Sender: TObject);
var
  Serie: TSerial;
  codigo,nome,cnpj,ie,sSerial: string;
begin
  Serie := TSerial.Create;
  try
    sSerial := edtCOD_01.text+'-'+edtCOD_02.text+'-'+edtCOD_03.text+'-'+edtCOD_04.text+'-'+edtCOD_05.text;
    if sSerial <> cSerialUnico then
    begin
      if not (Serie.ExisteSerial(sSerial,codigo,nome,cnpj,ie)) then
      begin
        edtCOD_01.SetFocus;
        raise Exception.Create('Serial inválido!');
      end;
    end;
  finally
    Serie.Free;
  end;

  if sSerial = cSerialUnico then
  begin
    Fretorno := true;
    GravaArquivoSIAC;
    Close;
  end
  else
  begin
    if ValidaSenha(edSenha1.Text, edSenha2.Text, '', true, false) then
    begin
      Fretorno := true;
      GravaArquivoSIAC;
      Close;
    end;
  end;
end;

procedure TfrProtecSerial.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrProtecSerial.FormShow(Sender: TObject);
var
  Serie: TSerial;
  codigo,nome,cnpj,ie,sSerial: string;
begin
  LeArquivoSIAC;
  Serie := TSerial.Create;
  try
    sSerial := edtCOD_01.text+'-'+edtCOD_02.text+'-'+edtCOD_03.text+'-'+edtCOD_04.text+'-'+edtCOD_05.text;
    if (Serie.ExisteSerial(sSerial,codigo,nome,cnpj,ie)) then
    begin
      edtNome.Text := nome;
      edtCNPJ.Text := cnpj;
      edtIE.Text   := ie;
      edSenha1.SetFocus;
    end;
  finally
    Serie.Free;
  end;
end;

procedure TfrProtecSerial.LeArquivoSIAC;
var
  ServerIni: TIniFile;
  arq: String;
begin
  arq := cArquivoConfiguracao;

  if FileExists(arq) then
  begin
    ServerIni := TIniFile.Create(arq);

    edtCOD_01.Text      := ServerIni.ReadString('PROTECAO','COD_01','');
    edtCOD_02.Text      := ServerIni.ReadString('PROTECAO','COD_02','');
    edtCOD_03.Text      := ServerIni.ReadString('PROTECAO','COD_03','');
    edtCOD_04.Text      := ServerIni.ReadString('PROTECAO','COD_04','');
    edtCOD_05.Text      := ServerIni.ReadString('PROTECAO','COD_05','');
    edSenha1.Text       := ServerIni.ReadString('PROTECAO','SENHA_01','');
    edSenha2.Text       := ServerIni.ReadString('PROTECAO','SENHA_02','');

    ServerIni.Free;
  end;
end;

procedure TfrProtecSerial.GravaArquivoSIAC;
var
  ServerIni: TIniFile;
  arq,sSenha01,sSenha02: String;
begin
  arq := cArquivoConfiguracao;

  ServerIni := TIniFile.Create(arq);

  //SOM/IMAGEM
  if not FileExists(cArquivoConfiguracao) then
  begin
    ServerIni.WriteString('IMAGEM', 'PapelDeParede', '.');
    ServerIni.WriteString('SOM', 'Abertura', '.');
    ServerIni.WriteString('SOM', 'Saida', '.');
    ServerIni.WriteString('SOM', 'Erro', '.');
    ServerIni.WriteString('SOM', 'Mensagem', '.');
    ServerIni.WriteString('SOM', 'Registradora', '.');
    ServerIni.WriteString('SOM', 'Sinos', '.');
    //Configurações de Máquina
    ServerIni.WriteString('MAQUINA', 'Caixa', '0');
    ServerIni.WriteString('MAQUINA', 'CAX_CODIGO', '1');
    ServerIni.WriteString('MAQUINA', 'CC', '1');
    ServerIni.WriteString('MAQUINA', 'Daruma', '0');
    ServerIni.WriteString('MAQUINA', 'Empresa', '11');
    ServerIni.WriteString('MAQUINA', 'IdMachine', '1');
    ServerIni.WriteString('MAQUINA', 'IdPath', 'LOCAL');
    ServerIni.WriteString('MAQUINA', 'IdPrintType', '0');
    ServerIni.WriteString('MAQUINA', 'ImpCheque', '0');
    ServerIni.WriteString('MAQUINA', 'LeitoraCheque', '0');
    ServerIni.WriteString('MAQUINA', 'Mafalda', '0');
    ServerIni.WriteString('MAQUINA', 'Maquina', '1');
    ServerIni.WriteString('MAQUINA', 'MaxItensNota', '30');
    ServerIni.WriteString('MAQUINA', 'MaxLinhasImp', '65');
    ServerIni.WriteString('MAQUINA', 'Orcamento', '0');
    ServerIni.WriteString('MAQUINA', 'PastaImagens', 'C:\SACI\Imagens');
    ServerIni.WriteString('MAQUINA', 'PastaSistema', 'C:\SACI');
    ServerIni.WriteString('MAQUINA', 'PastaSons', 'C:\SACI\Sons');
    ServerIni.WriteString('MAQUINA', 'TempoOcioso', '0');
    ServerIni.WriteString('MAQUINA', 'CodigoImpFiscal', '0');
    ServerIni.WriteString('MAQUINA', 'ItemAutomatico', '0');
    ServerIni.WriteString('MAQUINA', 'Magazine', '0');
    ServerIni.WriteString('MAQUINA', 'LocalCPD', '-1');
    ServerIni.WriteString('MAQUINA', 'DiretoImpFiscal', '0');
  end;

  if cSerialUnico = edtCOD_01.Text + '-' + edtCOD_02.Text + '-' + edtCOD_03.Text + '-' + edtCOD_04.Text + '-' + edtCOD_05.Text then
  begin
    sSenha01 := '0';
    sSenha02 := '0'
  end
  else
  begin
    sSenha01 := edSenha1.Text;
    sSenha02 := edSenha2.Text
  end;

  ServerIni.WriteString('PROTECAO','COD_01',edtCOD_01.Text);
  ServerIni.WriteString('PROTECAO','COD_02',edtCOD_02.Text);
  ServerIni.WriteString('PROTECAO','COD_03',edtCOD_03.Text);
  ServerIni.WriteString('PROTECAO','COD_04',edtCOD_04.Text);
  ServerIni.WriteString('PROTECAO','COD_05',edtCOD_05.Text);
  ServerIni.WriteString('PROTECAO','SENHA_01',sSenha01);
  ServerIni.WriteString('PROTECAO','SENHA_02',sSenha02);  

  ServerIni.UpdateFile;
  ServerIni.Free;

  close;
end;

end.
