unit MxTestarImpressora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, DB, Configuracao,
  Operacao_do_Sistema, Submodulo, Modulo, DBTables, SQuery, Usuario,
  CentroCusto;

type
  TfMxTestarImpressora = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtAltura: TEdit;
    edtLargura: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxTestarImpressora: TfMxTestarImpressora;

implementation
uses
  UDM, Funcoes, Urpt_TestarImpressora, ZReport;

{$R *.dfm}

procedure TfMxTestarImpressora.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxTestarImpressora.BitBtn1Click(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtAltura.Text) then
    Raise exception.Create('Altura inválida!');
  if not VerificaInteiroBranco(edtLargura.Text) then
    Raise exception.Create('Largura inválida!');

  if tag = 0 then
  Begin
    Application.CreateForm(Trpt_TestarImpressora, rpt_TestarImpressora);
    with rpt_TestarImpressora do
    Begin
      Tag := 0;
      report.Height := StrToInt(edtAltura.Text);
      report.Width  := StrToInt(edtLargura.Text);
      zrbCabecalhoPagina.Height := report.Height;
      zrbCabecalhoPagina.Width  := report.Width;

      zrlInicio.Width  := report.Width;
      zrlInicio.Caption := PreencheEspaco(report.Width, '', '-');

      zrlFinal.Width    := report.Width;
      zrlFinal.Top      := report.Height-1;
      zrlFinal.Caption  := PreencheEspaco(report.Width, '', '-');

      zrlEsquerda.Height  := report.Height;
      zrlEsquerda.Caption := PreencheEspaco(report.Height, '', '-');

      zrlDireita.Height   := report.Height;
      zrlDireita.Left     := report.Width-1;
      zrlDireita.Caption  := PreencheEspaco(report.Height, '', '-');
      
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxTestarImpressora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxTestarImpressora.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #27 then
    Close
  else if key = #13 then
    BitBtn1Click(sender);
end;

procedure TfMxTestarImpressora.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
