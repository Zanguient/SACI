unit MxImpresoraCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImpCheque, ExtCtrls, Buttons;

type
  TfMxImpressoraCheque = class(TForm)
    ImpCheque1: TImpCheque;
    Timer1: TTimer;
    Panel1: TPanel;
    Panel3: TPanel;
    SB_Confirmar: TSpeedButton;
    SB_Fechar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    Banco : integer;
    Favorecido, Cidade, VersoCheque: string;
    Data : TDateTime;
    Valor : Double;
    Fechar : Boolean;
  end;

var
  fMxImpressoraCheque: TfMxImpressoraCheque;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure TfMxImpressoraCheque.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if tag = 0 then //Imprimir Cheque
    try
      ImpCheque1.ImprimirCheque(Banco, Favorecido, Cidade, Data, Valor);
    except
      ShowMessage('Falha na Conexão com a Impressora de Cheques!');
    end
  else if tag = 1 then
    try
      ImpCheque1.ImprimirCopiaDeCheque;
    except
      ShowMessage('Falha na Conexão com a Impressora de Cheques (Cópia)!');
    end
  else if tag = 2 then
    try
      ImpCheque1.ImprimirTextoFormatado(VersoCheque, 2, 13);
    except
      ShowMessage('Falha na Conexão com a Impressora de Cheques (VersoCheque)!');    
    end;

  Timer1.Enabled := True;
  Fechar := True;
end;

procedure TfMxImpressoraCheque.FormCreate(Sender: TObject);
begin
  Fechar := False;
  Banco      := 0;
  Favorecido := '';
  Cidade     := '';
  Data       := 0;
  Valor      := 0;
  VersoCheque:= '';
end;

procedure TfMxImpressoraCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxImpressoraCheque.Timer1Timer(Sender: TObject);
begin
  if Fechar then
    Close;
end;

procedure TfMxImpressoraCheque.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

end.
