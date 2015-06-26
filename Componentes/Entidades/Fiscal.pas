unit fiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //Declare Function IniPortaStr Lib "mp20fi.dll" (byVal porta as string) as integer
  function IniPortaStr(Porta:string):integer; stdcall; external 'Mp20fi32';

  //Declare Function FormataTX Lib "mp20fi.dll" (byVal BUFFER as string) as integer
  function FormataTX(BUFFER:string):integer; stdcall; external 'Mp20fi32';

  function FechaPorta: integer; stdcall; external 'Mp20fi32';
  // NÃO TEM PARÂMETRO -> função nome_função:tipo_retorno_da_função      //function ComandoTX (BufTrans:string;TamBufTrans:integer):integer; stdcall; external 'Mp2032';

  //function BematechTX(BufTrans:string):integer; stdcall; external 'Mp2032';

var
  Form1: TForm1;

implementation


{$R *.DFM}


procedure TForm1.Button1Click(Sender: TObject);
var
   iRetorno : integer;
   Buffer : string;
begin
   iRetorno := IniPortaStr('COM2');
   if iRetorno = 0 then
     ShowMessage('Erro ao inicializar porta.')
   else  
     ShowMessage('Porta aberta com sucesso.');
    
   Buffer := #27 + '|06|' + #27;
    
   iRetorno := FormataTX(Buffer);
   if iRetorno = 1 then
      ShowMessage('Erro de comunucação física.')
   else  
      ShowMessage('Comando enviado para a impressora.');

   iRetorno := FechaPorta();
   if iRetorno = 0 then
      ShowMessage('Erro ao tentar liberar porta.')
   else
      ShowMessage('Porta liberada.');			   
end;

procedure TForm1.Button2Click(Sender: TObject);
var 
   iRetorno : integer;
   Buffer : string;
begin
   iRetorno := IniPortaStr('COM2');
   if iRetorno = 0 then
     ShowMessage('Erro ao inicializar porta.')
   else  
     ShowMessage('Porta aberta com sucesso.');
    
   Buffer := #27 + '|00|' + #27;
    
   iRetorno := FormataTX(Buffer);
   if iRetorno = 1 then
      ShowMessage('Erro de comunucação física.')
   else  
      ShowMessage('Comando enviado para a impressora.');

   iRetorno := FechaPorta();
   if iRetorno = 0 then
      ShowMessage('Erro ao tentar liberar porta.')
   else  
      ShowMessage('Porta liberada.');
end;

procedure TForm1.Button3Click(Sender: TObject);
var 
   iRetorno : integer;          
   Buffer : string;
begin
   iRetorno := IniPortaStr('COM2');
   if iRetorno = 0 then
     ShowMessage('Erro ao inicializar porta.')
   else  
     ShowMessage('Porta aberta com sucesso.');
    
   Buffer := #27 + '|09|0000000000001|Impressora Fiscal Bematech|FF|0001|00000010|0000|' + #27;
    
   iRetorno := FormataTX(Buffer);
   if iRetorno = 1 then
      ShowMessage('Erro de comunucação física.')
   else  
      ShowMessage('Comando enviado para a impressora.');

   iRetorno := FechaPorta();
   if iRetorno = 0 then
      ShowMessage('Erro ao tentar liberar porta.')
   else  
      ShowMessage('Porta liberada.');
end;

procedure TForm1.Button4Click(Sender: TObject);
var 
   iRetorno : integer;
   Buffer : string;
begin
iRetorno := IniPortaStr('COM2');
   if iRetorno = 0 then
     ShowMessage('Erro ao inicializar porta.')
   else  
     ShowMessage('Porta aberta com sucesso.');
    
   Buffer := #27 + '|10|0000|00000000010000|A|Bematech - Sempre presente nas melhores soluções'+ #13#10+'|'+ #27;
    
   iRetorno := FormataTX(Buffer);
   if iRetorno = 1 then
      ShowMessage('Erro de comunucação física.')
   else  
      ShowMessage('Comando enviado para a impressora.');

   iRetorno := FechaPorta();
   if iRetorno = 0 then
      ShowMessage('Erro ao tentar liberar porta.')
   else  
      ShowMessage('Porta liberada.');
end;

end.













      
