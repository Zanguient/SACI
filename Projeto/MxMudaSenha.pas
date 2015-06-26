unit MxMudaSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, SQuery, Usuario, ExtCtrls;

type
  TfMxMudaSenha = class(TForm)
    Usuario1: TUsuario;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtSenhaNova1: TEdit;
    edtSenhaNova2: TEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edtSenhaAtual: TEdit;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxMudaSenha: TfMxMudaSenha;

implementation
Uses UDM, Funcoes;
{$R *.DFM}


procedure TfMxMudaSenha.BitBtn1Click(Sender: TObject);
var
  CdCNC, CdUSU: integer;
  Trans: Boolean;
  sSenhaBanco: string;
begin
  If (edtSenhaNova1.Text<>edtSenhaNova2.Text) or (edtSenhaNova1.Text='') then
    Raise Exception.Create('A senha está diferente da senha confirmada!');
  With Usuario1 do
  Begin
    Close;
    ParamByName('USU_CODIGO').AsInteger := DM.Configuracao1.CodigoUSU;
    Open;
    CdCNC := CodigoCNC;
    CdUSU := CodigoUSU;
  end;

  if edtSenhaNova1.Text = '1234' then
    Raise Exception.Create('Senha padrão deve ser alterada!');
  if Length(edtSenhaNova1.Text) < 4 then
    Raise Exception.Create('A senha precisa ter no mínimo 4(quatro) caracteres!')
  else if UpperCase(edtSenhaNova1.Text) = UpperCase(DM.Usuario1.NomeUSU) then
    Raise Exception.Create('A senha não pode ser igual ao nome do usuário!')
  else if (edtSenhaAtual.Text = edtSenhaNova1.Text) then
    Raise Exception.Create('Senha Nova igual a antiga!');

  sSenhaBanco := Usuario1.Senha;
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM USUARIO_SENHA '+
      ' WHERE CNC_USUARIO='+IntToStr(Usuario1.CodigoCNC)+
      ' AND USU_USUARIO='+IntToStr(Usuario1.CodigoUSU)+
      ' AND SNH_SITUACAO=0 '+
      ' AND SNH_DT_CADASTRO>"'+MesDiaHora(Usuario1.DataSenhaAlterada)+'" ';
    Open;
    if not isEmpty then
      sSenhaBanco := FieldByName('SNH_SENHA').asString;
  end;
  if Encrypt(edtSenhaAtual.Text) <> sSenhaBanco then
    Raise Exception.Create('Senha Atual inválida!');

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      ExecutaSQL(DM.QR_Comandos,'UPDATE USUARIO SET '+
        ' USU_SENHA="'+Encrypt(edtSenhaNova1.Text)+'" '+
        ',USU_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',USU_DT_SENHA_ALTERADA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+        
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND USU_CODIGO='+IntToStr(CdUSU));

      ExecutaSQL(DM.QR_Comandos,'UPDATE USUARIO_SENHA SET '+
        ' SNH_SITUACAO=1 '+ //Desativar as senhas antigas
        ',SNH_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',SNH_OBSERVACAO=SNH_OBSERVACAO+"(ALTERAR SENHA)"'+
        ' WHERE CNC_USUARIO='+IntToStr(CdCNC)+
        ' AND USU_USUARIO='+IntToStr(CdUSU)+
        ' AND SNH_SITUACAO<>1 ');

      ExecutaSQL(DM.QR_Comandos,'INSERT USUARIO_SENHA '+
        '(CNC_ORIGEM, CNC_CODIGO, USU_CODIGO '+
        ',CNC_USUARIO, USU_USUARIO, SNH_DT_CADASTRO, SNH_SENHA '+
        ',SNH_SITUACAO,SNH_OBSERVACAO) VALUES '+
        ' ('+IntToStr(DM.Usuario1.CentroDeCusto)+
        ', '+IntToStr(DM.Configuracao1.CodigoCNC)+
        ', '+IntToStr(DM.Configuracao1.CodigoUSU)+
        ', '+IntToStr(CdCNC)+
        ', '+IntToStr(CdUSU)+
        ',"'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',"'+Encrypt(edtSenhaNova1.Text)+'" '+
        ',0'+ //Situacao
        ',"(ALTERAR SENHA)")');

      Usuario1.GeraLog(2070,CdCNC,CdUSU,'ALTERAR SENHA');

      If DM.Configuracao1.ControleTransacao then
        Commit;
      Trans := False;

      DM.Usuario1.Close;
      DM.Usuario1.Open;
      DM.Usuario1.LocalizarCod(DM.Configuracao1.CodigoUSU);
      self.Close;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
    end;
  End;
end;

procedure TfMxMudaSenha.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxMudaSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 SNH_DT_CADASTRO AS DATA '+
      ' FROM USUARIO_SENHA '+
      ' WHERE USU_CODIGO='+IntToStr(DM.Usuario1.CodigoUSU)+
      ' ORDER BY SNH_DT_CADASTRO DESC ';
    Open;
    if FieldByName('DATA').AsDateTime < DM.Usuario1.DataSenhaAlterada then
      if DM.Usuario1.Senha = Encrypt('1234') then
      Begin
        ShowMessage('Senha padrão deve ser alterada!');
        Action := caNone;
      end
      else
        Action := caFree;
  end;
end;

procedure TfMxMudaSenha.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

procedure TfMxMudaSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn1Click(BitBtn1);
end;

end.
