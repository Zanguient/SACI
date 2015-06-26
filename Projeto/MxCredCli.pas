unit MxCredCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, SQuery, Cliente, ExtCtrls, Menus, Buttons;

type
  TfMXCredCli = class(TForm)
    Cliente1: TCliente;
    Panel1: TPanel;
    Panel2: TPanel;
    edtCodigoCLI: TEdit;
    edtValor: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    edtCliente: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtCreditoAtual: TEdit;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Credito1: TMenuItem;
    Localizar1: TMenuItem;
    Label5: TLabel;
    edtObservacao: TEdit;
    bitComprovante: TBitBtn;
    bitIncluirCredito: TBitBtn;
    bitExcluirCredito: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoCLIExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Fechar1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMXCredCli: TfMXCredCli;

implementation

uses
  UDM,funcoes, UCredito, CdCliente;

{$R *.DFM}

procedure TfMXCredCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree
end;


procedure TfMXCredCli.edtCodigoCLIExit(Sender: TObject);
begin
  If not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Raise Exception.Create('Código do cliente digitado incorretamente!');
  With Cliente1 do
  Begin
    Close;
    ParamByName('CLI_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
    ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
    open;
    If IsEmpty then
      Raise Exception.Create('Cliente inexistente!')
    else
    Begin
      edtCliente.Text:=Cliente1.RazaoSocial;
      edtCreditoAtual.Text:=format('%.2f',[Cliente1.Credito]);
    end;
  end;
  edtValor.SetFocus;
  edtObservacao.Clear;
end;

procedure TfMXCredCli.FormShow(Sender: TObject);
begin
  edtCodigoCLI.SetFocus;
  DM.Usuario1.AlteraCorComponentes(self);
end;

procedure TfMXCredCli.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close
  else if Key = #32 then
  Begin
    if edtCodigoCLI.Focused then
    Begin
      edtCodigoCLI.Clear;
      edtObservacao.Clear;
      key:=chr(0);
      Application.CreateForm(TfCadCli, fCadCli);
      with fCadCli do
      Begin
        tag:=30;
        CentroCusto2.open;
        if DM.Configuracao1.Empresa = empLBM then
          dblCentroDeCusto.KeyValue := 1
        else
          dblCentroDeCusto.KeyValue := DM.Configuracao1.CodigoCNC;
        dblCentroDeCusto.Enabled := False;
        Showmodal;
        self.edtCodigoCLIExit(sender);
      end;
    end;
  end;
end;

procedure TfMXCredCli.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMXCredCli.BitBtn3Click(Sender: TObject);
var
  Trans:Boolean;
begin
  If not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Raise Exception.Create('Código do cliente digitado incorretamente!');
  If not VerificaFloatBranco(edtValor.Text) then
    Raise Exception.Create('Valor digitado incorretamente!');
  if StrToFloat(edtValor.Text) <= 0 then
    Raise Exception.Create('Valor digitado incorretamente!');
  if Arredonda(StrToFloat(edtValor.Text)) > Arredonda(Cliente1.Credito) then
    Raise Exception.Create('O crédito do cliente é menor do que R$ '+edtValor.Text);
  if Trim(edtObservacao.Text) = '' then
  Begin
    edtObservacao.SetFocus;
    Raise Exception.Create('Motivo inválido!');
  end;

  edtValor.Text := format('%.2f',[StrToFloat(edtValor.Text)]);

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      with Cliente1 do
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
          ' CLI_CREDITO='+VirgPonto(Arredonda(Credito-StrToFloat(edtValor.Text)))+
          ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CLI_CODIGO='+edtCodigoCLI.Text+
          ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC));

        if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,CodigoCNC,
          CodigoCLI,1001(*Tipo MANUAL*),0,0,0,0,'D',Credito,StrToFloat(edtValor.Text),0(*Sit*),edtObservacao.Text) then
        Begin
          ShowMessage('Falha ao Gerar Mov. de Crédito!');
          Raise exception.Create('');
        end;

        if not Cliente1.GeraLog(3460,CodigoCNC,CodigoCLI,'Excluir R$ '+edtValor.Text+
          ' OBS:'+edtObservacao.Text) then
        Begin
          ShowMessage('Falha ao Gerar Log!');
          Raise exception.Create('');
        end;
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          Exit;
        end;
    end;
  End;
  with Cliente1 do
  Begin
    //Verificar o crédito do cliente depois da alteração
    Close;
    ParamByName('CLI_CODIGO').AsInteger:=StrToInt(edtCodigoCLI.Text);
    ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
    open;
    edtCreditoAtual.Text:=format('%.2f',[Credito]);
  end;
  bitComprovante.Enabled:=True; //Comprovante
end;

procedure TfMXCredCli.BitBtn2Click(Sender: TObject);
var
  Trans:Boolean;
begin
  If not VerificaInteiroBranco(edtCodigoCLI.Text) then
    Raise Exception.Create('Código do cliente digitado incorretamente!');
  If not VerificaFloatBranco(edtValor.Text) then
    Raise Exception.Create('Valor digitado incorretamente!');
  if StrToFloat(edtValor.Text) <= 0 then
    Raise Exception.Create('Valor digitado incorretamente!');
  if StrToInt(edtCodigoCLI.Text) = DM.Configuracao1.CodigoCliAVista then
    Raise Exception.Create('Não é possível alterar crédito para o Cliente Balcão!');
  if Trim(edtObservacao.Text) = '' then
  Begin
    edtObservacao.SetFocus;
    Raise Exception.Create('Motivo inválido!');
  end;

  edtValor.Text := format('%.2f',[StrToFloat(edtValor.Text)]);
//  sMotivo := 

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      with Cliente1 do
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
          ' CLI_CREDITO='+VirgPonto(Arredonda(Credito+StrToFloat(edtValor.Text)))+
          ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CLI_CODIGO='+edtCodigoCLI.Text+
          ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC));

        if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,CodigoCNC,
          CodigoCLI,1001(*Tipo MANUAL*),0,0,0,0,'C',Credito,StrToFloat(edtValor.Text),0(*Sit*),edtObservacao.Text) then
        Begin
          ShowMessage('Falha ao Gerar Mov. de Crédito!');
          Raise exception.Create('');
        end;

        if not Cliente1.GeraLog(3460,CodigoCNC,CodigoCLI,'Incluir R$ '+edtValor.Text+
          ' OBS:'+edtObservacao.Text) then
        Begin
          ShowMessage('Falha ao Gerar Log!');
          Raise exception.Create('');
        end;
      end;

      If DM.Configuracao1.ControleTransacao then
        Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          Exit;
        end;
    end;
  End;

  Application.CreateForm(Trpt_Credito,rpt_Credito);
  with rpt_Credito do
  Begin
    Tag:=2;
    Cliente1.Close;
    Cliente1.ParamByName('CNC_CODIGO').asInteger := self.Cliente1.CodigoCNC;
    Cliente1.ParamByName('CLI_CODIGO').asInteger := self.Cliente1.CodigoCLI;
    Cliente1.Open;
    ZRLabel10.Caption:='REFERENTE A CREDITO MANUAL';
    Credi := StrToFloat(edtValor.Text);
    report.Preview;
  end;

  with Cliente1 do
  Begin
    //Reabrir o registro para verificar a inclusão od Crédito
    Close;
    ParamByName('CLI_CODIGO').AsInteger := StrToInt(edtCodigoCLI.Text);
    ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    open;
    edtCreditoAtual.Text:=format('%.2f',[Credito]);
  end;
end;

procedure TfMXCredCli.BitBtn1Click(Sender: TObject);
begin
  if Cliente1.IsEmpty then
    Raise Exception.Create('Selecione o Cliente!');
  if Arredonda(Cliente1.Credito) <= 0 then
    Raise Exception.Create('Cliente sem crédito!');
  Application.CreateForm(Trpt_Credito,rpt_Credito);
  with rpt_Credito do
  Begin
    tag := 3;
    Cliente1.Close;
    Cliente1.ParamByName('CNC_CODIGO').asInteger := self.Cliente1.CodigoCNC;
    Cliente1.ParamByName('CLI_CODIGO').asInteger := self.Cliente1.CodigoCLI;
    Cliente1.Open;
    ZRLabel10.Caption:='CREDITO TOTAL DO CLIENTE';
    Credi := Cliente1.Credito;
    report.Preview;
  end;

end;

end.
