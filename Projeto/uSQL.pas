unit uSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, funcoes, Buttons, ExtCtrls;

type
  TfrmSQL = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    mmSQL: TMemo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSQL: TfrmSQL;

implementation

uses UDM;

{$R *.dfm}

procedure TfrmSQL.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
end;

procedure TfrmSQL.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmSQL.BitBtn3Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente executar esse SQL?',
                            'SQL',
                            MB_ICONQUESTION+MB_YESNO) = id_Yes then
  begin
    ExecutaSQL(DM.QR_Comandos,mmSQL.Text);
    showmessage('SQL executado com sucesso!');
  end;
end;

procedure TfrmSQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
