unit Logon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, Db, DBTables, SQuery, Usuario;

type
  TDigSenha = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Usuario1: TUsuario;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   Entidade : TUsuario;
  end;

var
  DigSenha: TDigSenha;

implementation

{$R *.DFM}

procedure TDigSenha.BitBtn2Click(Sender: TObject);
begin
  Halt;
end;

procedure TDigSenha.BitBtn1Click(Sender: TObject);
begin
 If Entidade.Logar(Edit2.Text, Edit1.Text)<>-1 then
   Usuario:=Entidade.Logar(Edit2.Text, Edit1.Text);
end;

procedure TDigSenha.FormCreate(Sender: TObject);
begin
 Entidade := Usuario1;
 Entidade.Active := true;
end;

end.
