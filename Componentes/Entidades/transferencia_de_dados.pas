////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO.....: PSACI                                                //
//============================================================================//
// REVISÃO.............: 2.0                                                  //
// MÓDULO..............: PSACI                                                //
// UNIT................: Cadastro de Bancos                                   //
// ANALISTA............: Anderson Gonçalves                                   //
// DESENVOLVEDOR.......: Anderson Gonçalves                                   //
// DATA DAS ALTERAÇÕES.: 02/10/2010                                           //
//============================================================================//
// COMENTÁRIOS..:                                                             //
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
unit Transferencia_De_Dados;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Variants;

type
  TTransferencia_De_Dados = class(TSQuery)
    private
      { Private fields of TTransferencia_De_Dados }
        { Storage for property CodigoTRD }
        FCodigoTRD : Integer;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataFIM }
        FDataFIM : TDateTime;
        { Storage for property DataINI }
        FDataINI : TDateTime;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;

      { Private methods of TTransferencia_De_Dados }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoTRD }
        function GetCodigoTRD : Integer;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property DataFIM }
        function GetDataFIM : TDateTime;
        { Read method for property DataINI }
        function GetDataINI : TDateTime;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Read method for property Tipo }
        function GetTipo : Integer;

    protected
      { Protected fields of TTransferencia_De_Dados }

      { Protected methods of TTransferencia_De_Dados }

    public
      { Public fields and properties of TTransferencia_De_Dados }

      { Public methods of TTransferencia_De_Dados }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function Inserir(CdCNC,PTipo:Integer; DtINI,DtFIM:TDateTime; POBS: String=''):boolean;
        function LocalizarCod(CdTRD, CdCNC:Integer):Boolean;

    published
      { Published properties of TTransferencia_De_Dados }
        property CodigoTRD : Integer read GetCodigoTRD write FCodigoTRD;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property DataFIM : TDateTime read GetDataFIM write FDataFIM;
        property DataINI : TDateTime read GetDataINI write FDataINI;
        property OBS : String read GetOBS write FOBS;
        property Situacao : Integer read GetSituacao write FSituacao;
        property Tipo : Integer read GetTipo write FTipo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTransferencia_De_Dados with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTransferencia_De_Dados]);
end;

{ Method to set variable and property values and create objects }
procedure TTransferencia_De_Dados.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TTransferencia_De_Dados.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoTRD }
function TTransferencia_De_Dados.GetCodigoTRD : Integer;
begin
  try
    Result := Self.fieldByName('TRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DataCadastro }
function TTransferencia_De_Dados.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('BXT_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataFIM }
function TTransferencia_De_Dados.GetDataFIM : TDateTime;
begin
  try
    Result := Self.fieldByName('TRD_DT_FIM').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataINI }
function TTransferencia_De_Dados.GetDataINI : TDateTime;
begin
  try
    Result := Self.fieldByName('TRD_DT_INI').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property OBS }
function TTransferencia_De_Dados.GetOBS : String;
begin
  try
    Result := Self.fieldByName('TRD_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Situacao }
function TTransferencia_De_Dados.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('TRD_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Tipo }
function TTransferencia_De_Dados.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('TRD_TIPO').asInteger;
    //0 - CPD Recebeu Dados da Loja (Gerado no CPD
    //1 - Loja Recebeu Dados do CPD (Gerado na Loja)
  except
    result:= -1;
  end;
end;

constructor TTransferencia_De_Dados.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'TRANSFERENCIA_DE_DADOS';

     { Code to perform other tasks when the component is created }

end;

destructor TTransferencia_De_Dados.Destroy;
begin
     { AutoDestroy, which is generated by Component Create, frees any   }
     { objects created by AutoInitialize.                               }
     AutoDestroy;

     { Here, free any other dynamic objects that the component methods  }
     { created but have not yet freed.  Also perform any other clean-up }
     { operations needed before the component is destroyed.             }

     { Last, free the component by calling the Destroy method of the    }
     { parent class.                                                    }
     inherited Destroy;
end;

function TTransferencia_De_Dados.Inserir(CdCNC,PTipo:Integer; DtINI,DtFIM:TDateTime; POBS: String=''):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  Cod    := ProximoCodigo('TRD_CODIGO');
  If (localizarCod(Cod,CConfiguracao.CodigoCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT '+Tabela+
        '(CNC_ORIGEM,CNC_CODIGO,TRD_CODIGO,USU_CODIGO,TRD_DT_CADASTRO '+
        ',TRD_TIPO,TRD_DT_INI,TRD_DT_FIM '+
        ',TRD_SITUACAO,TRD_OBSERVACAO) VALUES '+
        '( '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(CdCNC)+
        ', '+IntToStr(Cod)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(PTipo)+
        ',"'+MesDiaHora(DtINI)+'" '+
        ',"'+MesDiaHora(DtFIM)+'" '+
        ',0'+
        ',"'+POBS+'") ');
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
    end;
  end;
end;

function TTransferencia_De_Dados.LocalizarCod(CdTRD, CdCNC:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT TRD_CODIGO FROM '+Tabela+
      ' WHERE CNC_ORIGEM='+IntToStr(CdCNC)+
      ' AND TRD_CODIGO='+IntToStr(CdTRD);
    Open;
    Result := (not isEmpty);
  end;
end;


end.
