unit untThreadSACI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, IdBaseComponent,
  IdComponent, IdTCPServer, IdFTPServer, IdTCPConnection, IdTCPClient,
  IdFTP,Gauges, IdUDPBase, IdUDPClient, IdTrivialFTP,dateutils,
  Buttons, Menus, inifiles;

type
  threadSACI = class(TThread)
  private
    function GetArquivo: string;
    function descricao_arquivo(arquivo: string):string;
  protected
    procedure Execute; override;
  public
    procedure Conectar();
    procedure VerificaVersao();
  end;


implementation

uses untDownloadSACI;

procedure threadSACI.Conectar;
var
  ServerIni: TIniFile;
  passivo, arquivo1, arquivo2, arquivo3, arquivo4,
  arquivo5, diretorio_temp, diretorio_sist:string;
  copy: boolean;
begin
  copy := false;
  //Copiando do FTP para a pasta temporária
  while not terminated do
  begin
    ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'PUpdate.ini');
    passivo := ServerIni.ReadString('CONEXAO','PASSIVO','');
    with frmDownloadSACI do
    begin
      ftpupdate.Host:=ServerIni.ReadString('CONEXAO','FTP','');
      ftpupdate.Username:=ServerIni.ReadString('CONEXAO','USUARIO','');
      ftpupdate.Password:=ServerIni.ReadString('CONEXAO','PASSWD','');
      arquivo1:=ServerIni.ReadString('CONEXAO','ARQUIVO1','');
      arquivo2:=ServerIni.ReadString('CONEXAO','ARQUIVO2','');
      arquivo3:=ServerIni.ReadString('CONEXAO','ARQUIVO3','');
      arquivo4:=ServerIni.ReadString('CONEXAO','ARQUIVO4','');
      arquivo5:=ServerIni.ReadString('CONEXAO','ARQUIVO5','');
      diretorio_temp:=ServerIni.ReadString('CONEXAO','SALVARTEMP','');
      diretorio_sist:=ServerIni.ReadString('CONEXAO','SALVARSIST','');
      if passivo='S' then
        ftpupdate.Passive:=true
      else
        ftpupdate.passive:=false;

      ServerIni.Free;
      ftpupdate.Connect();
      ftpupdate.list(memo1.Lines);
      if arquivo1 <> '' then
      begin
        arqCopia := descricao_arquivo(arquivo1);
        BytesToTransfer:=ftpupdate.Size(arquivo1);
        if BytesToTransfer <= 5242880 then //5242880KB = 5MB
        begin
          ftpupdate.get(arquivo1,diretorio_temp + '\' + descricao_arquivo(arquivo1),true);
          copy := true;
          //gauge1.Progress:=100;
          ProgressBar1.Position :=100;
        end;
      end;
      if arquivo2 <> '' then
      begin
        arqCopia := descricao_arquivo(arquivo2);
        BytesToTransfer:=ftpupdate.Size(arquivo2);
        if BytesToTransfer <= 5242880 then //5242880KB = 5MB
        begin
          ftpupdate.get(arquivo2,diretorio_temp + '\' + descricao_arquivo(arquivo2),true);
          copy := true;
          //gauge1.Progress:=100;
          ProgressBar1.Position :=100;
        end;
      end;
      if arquivo3 <> '' then
      begin
        arqCopia := descricao_arquivo(arquivo3);
        BytesToTransfer:=ftpupdate.Size(arquivo3);
        if BytesToTransfer <= 5242880 then //5242880KB = 5MB
        begin
          ftpupdate.get(arquivo3,diretorio_temp + '\' + descricao_arquivo(arquivo3),true);
          copy := true;
          //gauge1.Progress:=100;
          ProgressBar1.Position :=100;
        end;
      end;
      if copy = true then
        Application.MessageBox('Os arquivos já foram copiados para o computador agora atualize o sistema. ' + #13 + 'Mas atenção, todos os usuários devem sair do sistema!', 'A T E N Ç Ã O',MB_OK + MB_ICONINFORMATION)
      else
        Application.MessageBox('A atualização não foi realizada!', 'A T E N Ç Ã O',MB_OK + MB_ICONERROR);
      ftpupdate.Disconnect;
    end;
    terminate;
  end;
end;

function threadSACI.descricao_arquivo(arquivo: string): string;
var
  i: integer;
  aux: string;
begin
   aux:= '';
   for i:=Length(arquivo) downto 1 do
   begin
      if arquivo[i] <> '\' then
         aux:= arquivo[i] + aux
      else
         break;
   end;
   result:= aux;
end;

procedure threadSACI.Execute;
begin
  Conectar();
end;

function threadSACI.GetArquivo: string;
var
  ServerIni: TIniFile;
  arquivo: string ;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'PUpdate.ini');
  arquivo:=ServerIni.ReadString('CONEXAO','ARQUIVO','');
end;

procedure threadSACI.VerificaVersao;
begin
{if FormatDateTime('dd/mm/yyyy HH:mm',FileDateToDateTime(FileAge('vnc.exe'))) <>
FormatDateTime('dd/mm/yyyy HH:mm',
frmproutupdate.ftpupdate.DirectoryListing.Items[0].ModifiedDate)
then
 begin
   if Application.MessageBox(Pchar('Existe uma Nova versão do Prout disponível. ' + #13#13 + 'Data da Versão: ' +Data + #13#13 +
   'É recomendado sempre realizar a atualização. Ela possui melhorias e correção de erros. ' + #13#13 + 'Deseja Atualizar?'),'Atualização Automática XXXX', MB_YESNO + MB_ICONQUESTION) = idyes then
   begin
    RenameFile(ExtractFilePath(ParamStr(0)) + 'XXXX.exe',ExtractFilePath(ParamStr(0)) + 'XXXX_OLD.exe');
    idftp1.get(orig,dest,true,false);
    //Seta a data do arquio baixado, para a mesma data do arquivo do FTP para não baixar novamente
    FileSetDate(dest,DateTimeToFileDate(IdFTP1.FileDate(orig)));
    Application.MessageBox('O Sistema foi Atualizado e será reiniciado.','Atualização Concluída',MB_OK + MB_ICONINFORMATION);
    //executa exe atualizado
    WinExec(Pchar(dest),SW_SHOWNORMAL);
   Application.Terminate;
  end;
 end;}
end;

end.
