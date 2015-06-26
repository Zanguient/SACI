unit MxSobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, DrLabel, Dialogs, DB, DBTables, SQuery,
  Titulo_a_Pagar;

type
  TfMxSobre = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    lblDataCompilacao: TLabel;
    Image1: TImage;
    Label3: TLabel;
    ListBox1: TListBox;
    Label6: TLabel;
    Timer1: TTimer;
    Query1: TQuery;
    Titulo_a_pagar1: TTitulo_a_pagar;
    Label2: TLabel;
    lblDataLimite: TLabel;
    Label4: TLabel;
    bitApagarPreferencias: TSpeedButton;
    bitFechar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bitFecharClick(Sender: TObject);
    procedure bitApagarPreferenciasClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
  public

  end;

var
  fMxSobre: TfMxSobre;

implementation

uses funcoes, UDM;

{$R *.DFM}

procedure TfMxSobre.FormShow(Sender: TObject);
var
  SearchRec: TSearchRec;
begin
  DM.Usuario1.AlteraCorComponentes(self);
  FindFirst(ParamStr(0),0,SearchRec);
  lblDataCompilacao.Caption := formatDateTime('dd/mm/yyyy hh:mm',FileDateToDateTime(SearchRec.Time));
  lblDataLimite.Caption := formatDateTime('dd/mm/yyyy hh:mm',StrToDate(DataLimite));
  FindClose(SearchRec);

  (*</ QUANDO COLOCAR IMAGEM REMOVER ESSAS LINHAS*)
{
  Label1.Left := Image1.Left;
  Label6.Left := Image1.Left;
  Label4.Left := Image1.Left;

  Label3.Left := Image1.Left;
  lblDataCompilacao.Left := Label3.width + 10 + Image1.Left;

  Label2.Left := Image1.Left;
  lblDataLimite.Left := Label2.width + 10 + Image1.Left;
}
  (*/>*)

  bitApagarPreferencias.Visible := dm.Usuario1.CodigoUSU = 1;
end;

procedure TfMxSobre.FormCreate(Sender: TObject);
begin
  f_InformacoesProduto(ListBox1);
end;

procedure TfMxSobre.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Close
  else if Key = #27 then
    Close;
end;

procedure TfMxSobre.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSobre.bitApagarPreferenciasClick(Sender: TObject);
var
  sr: TSearchRec;
  i: integer;
  ListaArquivos: TStringList;
begin
  ListaArquivos := TStringList.Create;
  try
    if FindFirst(DM.Configuracao1.PastaSistema+'\*_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.txt', 0, sr) = 0 then
    begin
      repeat
        ListaArquivos.Add(DM.Configuracao1.PastaSistema+'\'+sr.Name);
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
    if ListaArquivos.Count > 0 then
    Begin
      for i:=0 to ListaArquivos.Count-1 do
      Begin
        if not DeleteFile(ListaArquivos[i]) then
        Begin
          ShowMessage('Não foi possível apagar o arquivo ('+ListaArquivos[i]+' !');
          Exit;
        end;
      end;
      ShowMessage('Arquivos excluídos com sucesso!');
    end
    else
      ShowMessage('Não foi encontrado nenhum arquivo!');
  finally
    ListaArquivos.Free;
  end;
end;

procedure TfMxSobre.Label4Click(Sender: TObject);
begin
  VisiteNossoSite;
end;

end.

