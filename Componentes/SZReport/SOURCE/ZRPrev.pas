unit ZRPrev;

interface

uses Windows, Messages, SysUtils, Classes, Controls, Forms, Graphics, Dialogs,
  Buttons, ExtCtrls, ComCtrls, ZRPrntr, ComObj, ShellAPI,
  ActnCtrls, ToolWin, ActnMan, ActnMenus, ActnList, Menus, ImgList,
  CustomizeDlg, XPStyleActnCtrls, StdCtrls, IniFiles, Funcoes;

type
  TSZRPreviewForm = class(TForm)
    StatusPanel: TPanel;
    InfoPanel: TPanel;
    Status: TLabel;
    ProgressBar: TProgressBar;
    ZRPreview: TSZRPreview;
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ToolBar1: TToolBar;
    ToolButton11: TToolButton;
    tbuPrimeiro: TToolButton;
    tbuAnterior: TToolButton;
    tbuProximo: TToolButton;
    tbuUltimo: TToolButton;
    ToolButton12: TToolButton;
    tbuImprimir: TToolButton;
    ToolButton13: TToolButton;
    tbuSalvar: TToolButton;
    tbuAbrir: TToolButton;
    tbuLocalizarImpressora: TToolButton;
    ToolButton10: TToolButton;
    tbuFechar: TToolButton;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Relatrios1: TMenuItem;
    Primeiro1: TMenuItem;
    Anterior1: TMenuItem;
    Prximo1: TMenuItem;
    ltimo1: TMenuItem;
    N1: TMenuItem;
    Imprimir1: TMenuItem;
    N2: TMenuItem;
    Salvar1: TMenuItem;
    Abrir1: TMenuItem;
    LocalizarImpressora1: TMenuItem;
    N3: TMenuItem;
    Calculadora1: TMenuItem;
    pnlMenu: TPanel;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    bvMenu: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    AbrirBlocodeNotas1: TMenuItem;
    ActionManager1: TActionManager;
    AC_PRIMEIRO: TAction;
    AC_ANTERIOR: TAction;
    AC_PROXIMO: TAction;
    AC_ULTIMO: TAction;
    AC_IMPRIMIR: TAction;
    AC_SALVAR: TAction;
    AC_WORD: TAction;
    AC_BLOCO_NOTAS: TAction;
    AC_IMPRESSORA: TAction;
    AC_CALCULADORA: TAction;
    AC_SAIR: TAction;
    ImageList2: TImageList;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRPreviewPageAvailable(Sender: TObject; PageNum: Integer);
    procedure ZRPreviewProgressUpdate(Sender: TObject; Progress: Integer);
    procedure FormCreate(Sender: TObject);
    procedure aConfiguracao2Execute(Sender: TObject);
    procedure aAbrir2Execute(Sender: TObject);
    procedure tbuPrimeiroClick(Sender: TObject);
    procedure tbuAnteriorClick(Sender: TObject);
    procedure tbuProximoClick(Sender: TObject);
    procedure tbuUltimoClick(Sender: TObject);
    procedure tbuImprimirClick(Sender: TObject);
    procedure tbuSalvarClick(Sender: TObject);
    procedure tbuAbrirClick(Sender: TObject);
    procedure tbuLocalizarImpressoraClick(Sender: TObject);
    procedure tbuFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Fechar1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure WMWindowPosChanging (var Msg :
       TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
    procedure FormResize(Sender: TObject);
    procedure AbrirBlocodeNotas1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function  GetPrinter: TSZRPrinter;
    procedure SetPrinter(Value: TSZRPrinter);
  public
    constructor CreatePreview(AOwner : TComponent; aZRPrinter : TSZRPrinter); virtual;
    procedure UpdateInfo;
    property ZRPrinter : TSZRPrinter read GetPrinter write SetPrinter;
  end;

implementation

{$R *.DFM}

uses ZRConst, MxSelImpressora, MxEditorTexto;

{ TSZRPreviewForm }

procedure TSZRPreviewForm.WMWindowPosChanging(var Msg:TWMWindowPosChanged);
Begin
  with Msg.WindowPos^ do
  Begin
    x := -4;
    y := -4;
    Msg.Result := 0;
  end;
end;

constructor TSZRPreviewForm.CreatePreview(AOwner : TComponent; aZRPrinter : TSZRPrinter);
const
  CONST_CAPTION = 'SIAC - Relatório';
begin
  inherited Create(AOwner);
  ZRPrinter   := aZRPrinter;
  WindowState := wsMaximized;

  (*Anderson Gonçalves*)
  if (f_SkinGerenciador) then
  begin
    pnlMenu.Color := $00E0E4E8;
    ZRPreview.Color := clInfoBk;
  end
  else
  begin
    pnlMenu.Color := clBtnFace;
    ZRPreview.Color := clWindow;
  end;

  if ZRPrinter <> nil then
  begin
    if ZRPrinter.Title <> '' then
      Caption := ZRPrinter.Title
    else
      Caption := CONST_CAPTION;
  end
  else
    Caption := CONST_CAPTION;
end;

procedure TSZRPreviewForm.FormCreate(Sender: TObject);
begin
  Status.Caption:= LoadStr(SzrProcessing);
end;

procedure TSZRPreviewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TSZRPreviewForm.UpdateInfo;
begin
  Status.Caption := LoadStr(SzrPage) + ' ' + IntToStr(ZRPreview.PageNumber) + ' ' +
    LoadStr(SzrOf) + ' ' + IntToStr(ZRPreview.ZRPrinter.PageCount);
end;

procedure TSZRPreviewForm.ZRPreviewPageAvailable(Sender: TObject; PageNum: Integer);
begin
  UpdateInfo;
end;

procedure TSZRPreviewForm.ZRPreviewProgressUpdate(Sender: TObject; Progress: Integer);
begin
  ProgressBar.Position := Progress;
  ProgressBar.Visible  := (ProgressBar.Position > 0) and (ProgressBar.Position < 100);
end;

function TSZRPreviewForm.GetPrinter: TSZRPrinter;
begin
  Result:= ZRPreview.ZRPrinter;
end;
procedure TSZRPreviewForm.SetPrinter(Value: TSZRPrinter);
begin
  ZRPreview.ZRPrinter:= Value;
end;

procedure TSZRPreviewForm.aConfiguracao2Execute(Sender: TObject);
begin
  ZRPrinter.Setup;
end;

procedure TSZRPreviewForm.aAbrir2Execute(Sender: TObject);
begin
{  if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
      begin
        ZRPrinter.Load(OpenDialog1.FileName);
        ZRPreview.PageNumber := 1;
        ZRPreview.PreviewImage.PageNumber := 1;
        UpdateInfo;
      end
    else
      ShowMessage(LoadStr(SzrFileNotExist));
}
end;

procedure TSZRPreviewForm.tbuPrimeiroClick(Sender: TObject);
begin
  ZRPreview.PageNumber := 1;
  UpdateInfo;
end;

procedure TSZRPreviewForm.tbuAnteriorClick(Sender: TObject);
begin
  ZRPreview.PageNumber := ZRPreview.PageNumber - 1;
  UpdateInfo;
end;

procedure TSZRPreviewForm.tbuProximoClick(Sender: TObject);
begin
  ZRPreview.PageNumber := ZRPreview.PageNumber + 1;
  UpdateInfo;
end;

procedure TSZRPreviewForm.tbuUltimoClick(Sender: TObject);
begin
  ZRPreview.PageNumber := ZRPrinter.PageCount;
  UpdateInfo;
end;

procedure TSZRPreviewForm.tbuImprimirClick(Sender: TObject);
var  idMachine, idPrint, idPath, tmp:string;
     Year, Month, Day: Word;
     ArqConf:TIniFile;
begin
 // Aqui está o código original...
 // with ZRPrinter do if Setup then Print;
 // ... e aqui o novo código!
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    { Alterado: se existir id de arquivo faz o processamento abaixo. Caso contrário,
     não cria chave, não faz processamento e imprime direto para porta LPT1}
    if ArqConf.ReadString('MAQUINA', 'IdPrintType', '0') <> '1' then
    begin
      with ZRPrinter do
      begin
      Options.Destination:= zrdLPT1;
      // Finalmente imprime se passar pelo Setup
      if Setup then
        Print;
      System.Exit;
      end;
    end;
    // Copia o valor da chave de impressão
    // Alterado: Se não achar tenta criar
    DecodeDate(Now, Year, Month, Day);
    idMachine := ArqConf.ReadString('MAQUINA', 'IdMachine', '11111');
    if Length(idMachine) < 5 then
      idMachine := '11111';
    idPath    := ArqConf.ReadString('MAQUINA', 'IdPath', 'C:\');
    idPrint   := IdMachine;
    // Atualiza o valor, conforme a data. Atenção: Só imprime 999 vezes por dia por máquina!!!
    if Day>StrToInt(Copy(idMachine,3,2)) then
    begin
     Delete(idMachine,3,5);
     if Day>9 then
      Insert(IntToStr(Day)+'001',idMachine,3)
     else
      Insert('0'+IntToStr(Day)+'001',idMachine,3);
    end
    else
    begin
      Case StrToInt(Copy(idMachine,5,3))+1 of
        1..9:     tmp:='00'+IntToStr(StrToInt(Copy(idMachine,5,3))+1);
        10..99:   tmp:='0'+IntToStr(StrToInt(Copy(idMachine,5,3))+1);
        100..999: tmp:=IntToStr(StrToInt(Copy(idMachine,5,3))+1);
      else
        tmp:='001';
      end;
      Delete(idMachine,5,3);
      Insert(tmp,idMachine,5);
    end;
    // Atualiza o valor da chave
    ArqConf.WriteString('MAQUINA', 'IdMachine', idMachine);
  finally
    ArqConf.Free;
  end;
  with ZRPrinter do
  Begin
    Options.Destination:= zrdFile;
    Options.FileName   := idPath+idMachine+'.txt';
    // Finalmente imprime se passar pelo Setup
    if Setup then
      Print;
  end;
end;

procedure TSZRPreviewForm.tbuSalvarClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    ZRPrinter.SaveToFile(SaveDialog1.FileName);
end;

procedure TSZRPreviewForm.tbuAbrirClick(Sender: TObject);
var
  word : Variant;
  i : integer;
begin
  word := CreateOleObject('word.Application');
  word.Documents.Add;
  ZRPrinter.SaveToFile('C:\RelTemp.txt');
  for i := 1 to ZRPrinter.PageCount do
  Begin
    ZRPreview.PageNumber := i;
    UpdateInfo;
    word.Selection.InsertAfter(ZRPreview.Text);
  end;
  word.Selection.Font.Name := 'Courier New';
  word.Visible := True;
end;

procedure TSZRPreviewForm.tbuLocalizarImpressoraClick(Sender: TObject);
begin
  Application.CreateForm(TfmxSelImpressora, fmxSelImpressora);
  fmxSelImpressora.ShowModal;
end;

procedure TSZRPreviewForm.tbuFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TSZRPreviewForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TSZRPreviewForm.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TSZRPreviewForm.Calculadora1Click(Sender: TObject);
var
  Hand1 : HWND;
begin
  Hand1 := FindWindow('SciCalc',nil);
  if Hand1 <> 0 then
  Begin
    SetForegroundWindow(Hand1);
    ShowWindow(Hand1, SW_RESTORE);
  end
  else if FileExists('C:\WINDOWS\CALC.EXE') then
    ShellExecute(0,nil,'C:\WINDOWS\CALC.EXE','',NIL,SW_NORMAL)
  else if FileExists('C:\WINDOWS\SYSTEM32\CALC.EXE') then
    ShellExecute(0,nil,'C:\WINDOWS\SYSTEM32\CALC.EXE','',NIL,SW_NORMAL)
  else
    ShowMessage('Arquivo <Calc.exe> não encontrado!');
end;

procedure TSZRPreviewForm.FormResize(Sender: TObject);
begin
  if Width < 800 then
    Width := 800;
  if Height < 600 then
    Height := 600;
end;

procedure TSZRPreviewForm.AbrirBlocodeNotas1Click(Sender: TObject);
var
  i: integer;
begin
  Application.CreateForm(TfMxEditorTexto, fMxEditorTexto);

  for i := 1 to ZRPreview.ZRPrinter.PageCount do
  begin
    ZRPreview.PageNumber := i;
    fMxEditorTexto.Editor.Text := fMxEditorTexto.Editor.Text + ZRPreview.Text;
  end;

  fMxEditorTexto.ShowModal;
end;

procedure TSZRPreviewForm.FormShow(Sender: TObject);
begin
  (*Desativando o MENU antigo*)
  try
    Self.Menu := nil;
    MainMenu1.Destroy;          //MENU ANTIGO
  except
  end;

  {
  try
    ActionMainMenuBar1.Destroy; //MENU NOVO
  except
  end;
  }
end;

end.

