 unit u_ImportaProdutos;

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
  TfrmImportaProdutos = class(TForm)
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
  frmImportaProdutos: TfrmImportaProdutos;

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
var
  i:Integer;
begin
   Result:='';
   for i := 1 to pP2 do
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

procedure TfrmImportaProdutos.FormCreate(Sender: TObject);
begin
  self.Height  :=  25;
  self.Width   :=  400;
  self.Position:= poScreenCenter;
end;

procedure TfrmImportaProdutos.FormActivate(Sender: TObject);
var
  sLinha, sDirAtual, sValores, sBanco : String;
  Inifile : tIniFile;
  iAlte, iNovo, iMaxReg, iMaxCod : Integer;
  fArq :TextFile;
begin
  //
  GetDir(0,sDirAtual);
  //
  // Pede pelo nome do arquivo TXT
  //
  OpenDialog1.FileName := '';
  OpenDialog1.Title    := 'Selecionar o arquivo a ser importado!';
  OpenDialog1.Filter   := 'Produtos (PRODUTOS.TXT)|PRODUTOS.TXT';
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
          IBQuery1.SQL.Add('select LIVRE1 from estoque where LIVRE1='+QuotedStr(AllTrim(Copy(sLinha,166,30))));
          IBQuery1.Open;
          //
          if not IBQuery1.IsEmpty then
          begin
            //
            // Já esta cadastrada
            //
            IBQuery1.close;
            IBQuery1.SQL.Clear;
            //IBQuery1.SQL.Add('update ESTOQUE set PRECO='+QuotedStr(Strtran(Copy(sLinha,133,10),',','.'))+',');
            IBQuery1.SQL.Add('update ESTOQUE set PRECO='+QuotedStr(Strtran(Alltrim(Copy(sLinha,133,10)),',','.'))+',');

            //Alterar a descrição em 14/12/2012
            IBQuery1.SQL.Add('DESCRICAO='+QuotedStr(Alltrim(Copy(sLinha, 21,45)))+',');
            IBQuery1.SQL.Add('NOME='+QuotedStr(Alltrim(Copy(sLinha, 67,25)))+',');
            IBQuery1.SQL.Add('CUSTOCOMPR='+QuotedStr(Strtran(Alltrim(Copy(sLinha,155,10)),',','.'))+'');
            //

            IBQuery1.SQL.Add('where LIVRE1='+QuotedStr(AllTrim(Copy(sLinha,166,30))));
            IBQuery1.ExecSQL;
            //
            // + 1 Registro alterado
            //
            iAlte:= iAlte +1;
            //
          end
          else
          begin
            //
            // Não está cadastrado
            //
            IBQuery1.Close;
            IBQuery1.SQL.Clear;
            IBQuery1.SQL.Add('select gen_id(G_CODIGO,1) from rdb$database');
            IBQuery1.Open;
            iMaxCod := StrToInt(StrZero(StrtoFloat(AllTrim(IBQuery1.FieldByname('GEN_ID').AsString)),5,0));
            IBQuery1.Close;
            //
            IBQuery1.Close;
            IBQuery1.Sql.Clear;
            IBQuery1.Sql.Add('select gen_id(G_ESTOQUE,1) from rdb$database');
            IBQuery1.Open;
            iMaxReg := strtoInt(StrZero(StrToInt(IBQuery1.FieldByname('GEN_ID').AsString),10,0));
            IBQuery1.Close;
            //
            sValores :=  QuotedStr(StrZero(iMaxCOD,5,0))+', '+
                         QuotedStr(Alltrim(Copy(sLinha,  7,13)))+', '+
                         QuotedStr(Alltrim(Copy(sLinha, 21,45)))+', '+
                         QuotedStr(Alltrim(Copy(sLinha, 67,25)))+', '+
                         QuotedStr(Alltrim(Copy(sLinha, 93,35)))+', '+
                         QuotedStr(Alltrim(Copy(sLinha,129, 3)))+', '+
                         QuotedStr(Strtran(Alltrim(Copy(sLinha,133,10)),',','.'))+', '+
                         QuotedStr(Strtran(Alltrim(Copy(sLinha,144,10)),',','.'))+', '+
                         QuotedStr(Strtran(Alltrim(Copy(sLinha,155,10)),',','.'))+', '+
                         //QuotedStr(Strtran(Alltrim(Copy(sLinha,166,10)),',','.'))+', '+
                         QuotedStr(Alltrim(Copy(sLinha,166,30)))+', '+
                         QuotedStr(Alltrim(Copy(sLinha,197,30)))+', '+
                         QuotedStr(Alltrim(Copy(sLinha,228,30)))+', '+
                         QuotedStr(Alltrim(Copy(sLinha,259,30)))+', '+
                         QuotedStr(Strtran(Alltrim(Copy(sLinha,290,10)),',','.'))+', '+
                         QuotedStr(Alltrim(Copy(sLinha,301,10)))+', '+
                         QuotedStr(Alltrim(Copy(sLinha,312,13)))+', '+
                         QuotedStr(Strtran(Alltrim(Copy(sLinha,326,10)),',','.'))+', '+
                         QuotedStr(Alltrim(Copy(sLinha,337, 3)))+', '+
                         QuotedStr(Alltrim(Copy(sLinha,341, 3)))+', '+
                         QuotedStr(Strtran(Alltrim(Copy(sLinha,345,10)),',','.'))+', '+
                         QuotedStr(StrZero(iMaxREG,10,0));
            //

            IBQuery1.close;
            IBQuery1.SQL.Clear;
            IBQuery1.SQL.Add('insert into ESTOQUE (CODIGO, '+
                                                  'REFERENCIA, '+
                                                  'DESCRICAO, '+
                                                  'NOME, '+
                                                  'FORNECEDOR, '+
                                                  'MEDIDA, '+
                                                  'PRECO, '+
                                                  'INDEXADOR, '+
                                                  'CUSTOCOMPR, '+
                                                  'LIVRE1, '+
                                                  'LIVRE2, '+
                                                  'LIVRE3, '+
                                                  'LIVRE4, '+
                                                  'PESO, '+
                                                  'LOCAL, '+
                                                  'CF, '+
                                                  'IPI, '+
                                                  'CST, '+
                                                  'ST, '+
                                                  'COMISSAO, '+
                                                  'REGISTRO) values ('+sValores+')');
            IBQuery1.ExecSQL;                                                                                                              (*QTD_ATUAL,*)
            //
            iNovo:= iNovo +1;
            //
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
    'Registros de preços alterados: '+IntToStr(iAlte)+chr(13)+
    'Novos itens importados: '+IntToStr(iNovo)+chr(13)),'Informações sobre a importação',MB_ICONWARNING+mb_Ok);
    //
  end;
  //
  Close;
  //
end;

end.
