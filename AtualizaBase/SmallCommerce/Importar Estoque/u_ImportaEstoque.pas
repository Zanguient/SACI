unit u_ImportaEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBDatabase, ShellApi,
  Buttons, IBQuery, Gauges, DB, IniFiles, IBCustomDataSet;

  function AllTrim(pP1:String):String;
  function Replicate(pP1:String; pP2:Integer):String;
  function StrZero(Num : Double ; Zeros,Deci: integer): string;
  function StrTran(sP1,sP2,sP3 : string):String;

type
  TfrmImportaEstoque = class(TForm)
    Gauge1: TGauge;
    OpenDialog1: TOpenDialog;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    IBDataSet1: TIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaEstoque: TfrmImportaEstoque;

implementation

{$R *.dfm}

function AllTrim(pP1:String):String;
begin
   While Copy(pP1,Length(pP1),1) = ' ' do
      pP1:=Copy(pP1,1,Length(pP1)-1);
   While Copy(pP1,1,1) = ' ' do
      pP1:=Copy(pP1,2,Length(pP1)-1);
   Result:=pP1;
end;

function Replicate(pP1:String; pP2:Integer):String;
Var I:Integer;
begin
   Result:='';
   For I := 1 to pP2 do
      Result:=Copy(Result+pP1,1,I);
end;

function StrZero(Num : Double ; Zeros,Deci: integer): string;
begin
   Result:='';
   Result:=Result+StrTran(Format('%'+intToStr(Zeros)+'.'+intToStr(Deci)+'f',[Num]),' ','0');
   if pos('-',Result) > 0 then begin
      Delete(Result,pos('-',Result),1);
      Result:='-'+Result;
   end;
end;

function StrTran(sP1,sP2,sP3 : string):String;
var
  I : Integer;
begin
  //
  for I := 1 to 100 do
  begin
   if (Pos(sP2,sP1)<>0) then
   begin
     Insert(sP3,sP1,pos(sP2,sP1));
     Delete(sP1,pos(sP2,sP1),length(sP2));
   end;
  end;
  Result := sP1;
  //
end;

procedure TfrmImportaEstoque.FormCreate(Sender: TObject);
begin
  self.Height  :=  25;
  self.Width   :=  400;
  self.Position:= poScreenCenter;
end;

procedure TfrmImportaEstoque.FormActivate(Sender: TObject);
var
  sLinha, sDirAtual, sBanco, sCampo, sAtual : String;
  Inifile : tIniFile;
  iAlte, iNovo: Integer;
  fArq :TextFile;
begin
  //
  GetDir(0,sDirAtual);
  //
  // Pede pelo nome do arquivo TXT
  //
  OpenDialog1.FileName := '';
  OpenDialog1.Title    := 'Selecionar o arquivo a ser importado!';
  OpenDialog1.Filter   := 'Estoque (TRANSF*.TXT;AVULSO.TXT)|TRANSF*.TXT;AVULSO.TXT';
  OpenDialog1.Execute;
  //
  if FileExists(pChar(OpenDialog1.FileName)) then
  begin
    //
    //GetDir(0,sDirAtual);
    //
    if not(FileExists(sDirAtual+'\small.ini')) then
    begin
      Application.MessageBox('Não foi encontrado o banco de dados do small commerce!'+CHR(13)+'Coloque este programa na pasta do small commerce 2008.','Atenção',mb_IconError+mb_Ok);
      Close;
      Abort;
    end;
    //
    // Conecta ao GDB
    //
    try
      IniFile := TIniFile.create(sDirAtual+'\small.ini');
      sBanco := IniFile.ReadString('Firebird','Server IP','')+':'+IniFile.ReadString('Firebird','Server URL','')+'\small.gdb';
      IniFile.Free;
      //
      IBDatabase1.Close;
      IBDatabase1.Params.Clear;
      IBDatabase1.Params.Add('user_name=SYSDBA');
      IBDatabase1.Params.Add('password=masterkey');
      IBDatabase1.DatabaseName := sBanco;
      IBDatabase1.Open;
      IBTransaction1.Active := true;
    except
      Application.MessageBox(
      '1 - Verifique se o arquivo não esta sendo usado;'+chr(13)+
      '2 - Verifique se Firebird esta instalado no microcomputador;'+chr(13)+
      '3 - Verifique se o usuário do windows tem permissão de Administrador;'+chr(13)+
      '4 - Verifique Antivírus e Firewall do seu microcomputador;','Erro ao abrir o banco de dados',mb_IconError+mb_Ok);
      Close;
      Abort;
    end;
    //
    // Cursor
    //
    Screen.Cursor:= crHourGlass;
    //
    // Abre o arquivo TEXTO
    //
    AssignFile(fArq,OpenDialog1.FileName);
    //
    // Conta o número de linhas para o maximo do Gauge
    //
    Reset(fArq);
    Gauge1.MaxValue := 0;
    while not eof(fArq) do
    begin
      ReadLn(fArq,slinha);
      Gauge1.MaxValue := Gauge1.MaxValue +1;
    end;
    CloseFile(fArq);
    //
    // Atualiza o ESTOQUE com o preço novo ou inclui o novo item
    //
    Reset(fArq);
    //
    // Zera as variáveis de controle
    //
    iAlte           := 0;
    iNovo           := 0;
    Gauge1.Progress := 1;
    //
    while not eof(fArq) do
    begin
      Try
          //
          // Lê uma linha do arquivo TXT
          //
          ReadLn(fArq,sLinha);
          //
          // Verifica se a DESCRICAO já está cadastrada
          //
          IBQuery1.Close;
          IBQuery1.SQL.Clear;
          IBQuery1.SQL.Add('select LIVRE1,QTD_ATUAL from estoque where LIVRE1='+QuotedStr(AllTrim(Copy(sLinha,0,5))));
          IBQuery1.Open;
          sAtual := IBQuery1.FieldByName('QTD_ATUAL').AsString;
          //
          if not IBQuery1.IsEmpty then
          begin
            //
            // Já esta cadastrada
            //
            //showmessage(Copy(sLinha,7,1));
            //showmessage(Copy(sLinha,9,10));
            //
            IBQuery1.close;
            IBQuery1.SQL.Clear;

            if sAtual = '' then
              sCampo := '0'
            else
              sCampo := sAtual;

            if Copy(sLinha,7,1) = 'E' then
              IBQuery1.SQL.Add('update ESTOQUE set QTD_ATUAL = '+sCampo+' + '+Copy(sLinha,9,10)+' where LIVRE1='+QuotedStr(AllTrim(Copy(sLinha,0,5))))
            else if Copy(sLinha,7,1) = 'S' then
              IBQuery1.SQL.Add('update ESTOQUE set QTD_ATUAL = '+sCampo+' - '+Copy(sLinha,9,10)+' where LIVRE1='+QuotedStr(AllTrim(Copy(sLinha,0,5))));

            //Showmessage(IBQuery1.SQL.GetText);

            IBQuery1.ExecSQL;
            //
            // + 1 Registro alterado
            //
            iAlte:= iAlte +1;
            //
          end
          else
          begin
            iNovo:= iNovo +1;
          end;
          //
      except on e:exception do
        begin
          ShowMessage('Ocorreu erro na linha '+IntToStr(Gauge1.Progress)+' - '+Alltrim(Copy(sLinha, 21,45))
          +CHR(13)+CHR(13)+e.Message
          +CHR(13)+CHR(13)+IBQuery1.SQL.Text
          );
          Screen.Cursor := crDefault;
          self.Close;
          exit;
        end;
      end;

      Gauge1.Progress  := Gauge1.Progress + 1;
      Gauge1.Repaint;
      //
    end;
    //
    CloseFile(fArq);
    Application.MessageBox(Pchar(Chr(13)+Chr(13)+Chr(13)+
    'Fim da importação, reinicie o sistema!'+Chr(13)+
    'Registros de estoque alterados: '+IntToStr(iAlte)+chr(13)+
    'Não alterados (não cadastrado): '+IntToStr(iNovo)+chr(13)),'Informações sobre a importação',MB_ICONWARNING+mb_Ok);
    //
  end;
  //
  Close;
  //
end;

end.
