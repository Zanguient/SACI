unit MxVerificaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, ComCtrls, StdCtrls, SQuery, Cliente,
  Menus, WinSkinData, funcoes;

type
  TfMxVerificaCliente = class(TForm)
    Animate1: TAnimate;
    bitProcessar: TButton;
    bitFechar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTotalClientes: TEdit;
    edtClientesExaminados: TEdit;
    edtQtdProblemas: TEdit;
    memClientes: TMemo;
    Cliente1: TCliente;
    Database2: TDatabase;
    PopupMenu1: TPopupMenu;
    SalvarArquivo1: TMenuItem;
    Imprimir1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Cliente2: TCliente;
    bitParar: TButton;
    Label4: TLabel;
    bitRetirarMascaras: TButton;
    QueryAux: TQuery;
    SkinData1: TSkinData;
    procedure bitFecharClick(Sender: TObject);
    procedure SalvarArquivo1Click(Sender: TObject);
    procedure bitProcessarClick(Sender: TObject);
    procedure bitPararClick(Sender: TObject);
    procedure bitRetirarMascarasClick(Sender: TObject);
  private
    Parar : Boolean;
    procedure IncluirFalha(Motivo: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxVerificaCliente: TfMxVerificaCliente;

implementation

{$R *.dfm}

procedure TfMxVerificaCliente.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxVerificaCliente.SalvarArquivo1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    memClientes.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TfMxVerificaCliente.bitProcessarClick(Sender: TObject);
var
  Falhou : Boolean;
  ContarClientes, ContarFalha: integer;
begin
  memClientes.Clear;
  Parar := False;
  Animate1.Active:=True;
  with Cliente1 do
  Begin
    Cliente2.Close;
    Cliente2.SQL.Text := 'SELECT COUNT(*) AS QTD FROM CLIENTE ';
    CLiente2.Open;
    edtTotalClientes.Text := Cliente2.FieldByName('QTD').asString;
    edtTotalClientes.Refresh;
    Close;
    SQL.Text := 'SELECT * FROM CLIENTE '+
      ' ORDER BY CLI_RZ_SOCIAL ';
    Open;
    ContarClientes := 0;
    ContarFalha := 0;
    while not EOF do
    Begin
      Falhou := False;
      if (not PessoaFisica) and (Uf = 'CE') then
        if not VerificaCGF_CE(CGFRG) then
        Begin
          IncluirFalha('CGF inválido');
          Falhou := True;
        end;

      if (not Falhou) and (not VerificaCPFCNPJ(CPFCGC)) then
      Begin
        if PessoaFisica then
          IncluirFalha('CPF inválido')
        else
          IncluirFalha('CNPJ inválido');
        Falhou := True;
      end;

      if (not Falhou) and (PessoaFisica) and (Length(CPFCGC) > 11) then
      Begin
        IncluirFalha('Pessoa Jurídica');
        Falhou := True;
      end;

      if Falhou then
      Begin
        inc(ContarFalha);
        edtQtdProblemas.Text := IntToStr(ContarFalha);
        edtQtdProblemas.Refresh;
      end;

      inc(ContarClientes);
      edtClientesExaminados.Text := IntToStr(ContarClientes);
      edtClientesExaminados.Refresh;

      Application.ProcessMessages;
      if Parar then
        Break;

      Next;
    end;
  end;
  Animate1.Active:=False;
end;

procedure TfMxVerificaCliente.IncluirFalha(Motivo: string);
var
  Tele, Pessoa: string;
begin
  with Cliente1 do
  Begin
    if PessoaFisica then
      Pessoa := 'F'
    else
      Pessoa := 'J';

    if Fone <> '' then
      Tele := Fone
    else if Fax <> '' then
      Tele := Fax
    else
      Tele := Celular;

    memClientes.Lines.Add(
      PreencheZero(6,IntToStr(CodigoCLI))+' '+
      PreencheEspaco(40, RazaoSocial)+' '+
      Pessoa+' '+
      PreencheEspaco(20, CPFCGC)+' '+
      PreencheEspaco(20, CGFRG)+' '+
      PreencheEspaco(20, Tele)+' '+
      Motivo);
  end;
end;

procedure TfMxVerificaCliente.bitPararClick(Sender: TObject);
begin
  Parar := True;
end;

procedure TfMxVerificaCliente.bitRetirarMascarasClick(Sender: TObject);
var
  ContarClientes, i: integer;
  RG : string;
begin
  memClientes.Clear;
  Parar := False;
  Animate1.Active:=True;
  with Cliente1 do
  Begin
    Cliente2.Close;
    Cliente2.SQL.Text := 'SELECT COUNT(*) AS QTD FROM CLIENTE '+
      ' WHERE CLI_CGF_RG LIKE "%.%" '+
      ' OR CLI_CGF_RG LIKE "%-%" '+
      ' OR CLI_CGF_RG LIKE "%/%" '+
      ' OR CLI_CGF_RG LIKE "%\%" '+
      ' OR CLI_CGF_RG LIKE "%-%" '+
      ' OR CLI_CGF_RG LIKE "%S%" '+
      ' OR CLI_CGF_RG LIKE "%P%" '+
      ' OR CLI_CGF_RG LIKE "%C%" '+
      ' OR CLI_CGF_RG LIKE "%E%" ';
    CLiente2.Open;
    edtTotalClientes.Text := Cliente2.FieldByName('QTD').asString;
    edtTotalClientes.Refresh;
    Close;
    SQL.Text := 'SELECT * FROM CLIENTE '+
      ' WHERE CLI_CGF_RG LIKE "%.%" '+
      ' OR CLI_CGF_RG LIKE "%-%" '+
      ' OR CLI_CGF_RG LIKE "%/%" '+
      ' OR CLI_CGF_RG LIKE "%\%" '+
      ' OR CLI_CGF_RG LIKE "%-%" '+
      ' OR CLI_CGF_RG LIKE "%S%" '+
      ' OR CLI_CGF_RG LIKE "%P%" '+
      ' OR CLI_CGF_RG LIKE "%C%" '+
      ' OR CLI_CGF_RG LIKE "%E%" '+
      ' ORDER BY CLI_RZ_SOCIAL ';
    Open;
    ContarClientes := 0;
    while not EOF do
    Begin
      RG := '';
      for i := 1 to Length(CGFRG) do
        if CGFRG[i] in ['0','1','2','3','4','5','6','7','8','9'] then
          RG := RG + CGFRG[i];

      ExecutaSQL(QueryAux,'UPDATE CLIENTE '+
        ' SET CLI_CGF_RG="'+RG+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
        ' AND CLI_CODIGO='+IntToStr(CodigoCLI));

      inc(ContarClientes);
      edtClientesExaminados.Text := IntToStr(ContarClientes);
      edtClientesExaminados.Refresh;

      Application.ProcessMessages;
      if Parar then
        Break;

      Next;
    end;
  end;
  Animate1.Active:=False;
end;

end.
