////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO..: Chave.dll                                               //
//============================================================================//
// REVIS�O..........: 1.0                                                     //
// M�DULO...........: Chave                                                   //
// UNIT.............: Unit de expira��o do sistema PSACI                      //
// ANALISTA.........: Anderson Gon�alves                                      //
// DESENVOLVEDOR....: Anderson Gon�alves                                      //
// DATA DE CRIA��O..: 07/04/2010                                              //
//============================================================================//
// COMENT�RIOS..:                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//============================================================================//
////////////////////////////////////////////////////////////////////////////////
library Chave;

uses
  SysUtils,
  Classes;

const
  DataLimite = '31/10/2017';

//var
  //DataLimite: string;

function GetDataLimite: ShortString; stdcall;
begin
  Result := DataLimite;
end;

{$R *.res}

exports
  GetDataLimite;

begin
  //DataLimite := Encrypt('01/08/2011');
end.
