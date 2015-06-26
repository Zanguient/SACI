unit MxMudarSituacaoServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, CentroCusto, DBCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls;

type
  TfMxMudarSituacaoServico = class(TForm)
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    edtCodigoPDS: TEdit;
    Label1: TLabel;
    Label20: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure edtCodigoPDSKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxMudarSituacaoServico: TfMxMudarSituacaoServico;

implementation
uses UDM, funcoes, MxSPediProd, Urpt_bonus, MxSPedServico;
{$R *.DFM}

procedure TfMxMudarSituacaoServico.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxMudarSituacaoServico.edtCodigoPDSKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    edtCodigoPDS.Text:='';
    key:=chr(0);
    Application.CreateForm(TfMxSPedServico, fMxSPedServico);
    fMxSPedServico.Tag:=1;
    fMxSPedServico.ShowModal;
  End;
end;

end.
