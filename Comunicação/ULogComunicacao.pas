unit ULogComunicacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmLogComunicacao = class(TForm)
    Status: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    btnReceber: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnReceberClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogComunicacao: TfrmLogComunicacao;

implementation

uses UPrincComunicacao;

{$R *.dfm}

procedure TfrmLogComunicacao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogComunicacao.FormShow(Sender: TObject);
begin
  Memo1.Text := '';
  Memo1.Text := frmPrincComunicacao.sLog.Text;
end;

procedure TfrmLogComunicacao.btnReceberClick(Sender: TObject);
begin
  frmPrincComunicacao.sLog.SaveToFile('Comunicação\LOG\Log-' + FormatDateTime('ddmmyyyyhhnnss',now) + '.txt');
end;

end.
