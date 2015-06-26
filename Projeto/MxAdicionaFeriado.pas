unit MxAdicionaFeriado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfMxAdicionaFeriado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Posicao:integer;
    { Public declarations }
  end;

var
  fMxAdicionaFeriado: TfMxAdicionaFeriado;

implementation
uses Funcoes, MxFeriados, UDM;

{$R *.dfm}

procedure TfMxAdicionaFeriado.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxAdicionaFeriado.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir esse feriado?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  fMxFeriados.DatFer[Posicao] := '';
  fMxFeriados.HntFer[Posicao] := '';
  Close;
end;

procedure TfMxAdicionaFeriado.BitBtn3Click(Sender: TObject);
begin
  if not VerificaInteiro(Edit2.Text) then
    Raise Exception.Create('Ano inválido!')
  else if (Edit2.Text <> '') and (Length(Edit2.Text)<4) then
    Raise Exception.Create('Ano inválido!');

  if Edit3.Text = '' then
    Raise Exception.Create('Descrição inválida!');
  if Edit2.Text = '' then
    fMxFeriados.DatFer[Posicao] := Edit1.Text
  else
    fMxFeriados.DatFer[Posicao] := Edit1.Text+'/'+Edit2.Text;
  fMxFeriados.HntFer[Posicao]   := Edit3.Text;
  Close;
end;

procedure TfMxAdicionaFeriado.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Edit3.Text := fMxFeriados.HntFer[Posicao];
end;

procedure TfMxAdicionaFeriado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    BitBtn3Click(BitBtn3);
end;

end.
