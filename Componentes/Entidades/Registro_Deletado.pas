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
unit Registro_Deletado;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Dbtables, Dialogs, Db, Stdctrls, Mask, 
     Dbctrls, Configuracao, Funcoes, Variants;

type
  TRegistro_Deletado = class(TQuery)
    private
      { Private fields of TRegistro_Deletado }
        { Storage for property CConfiguracao }
        FCConfiguracao : TConfiguracao;
        { Storage for property CPD }
        FCPD : Boolean;
        { Storage for property CodigoRDL }
        FCodigoRDL : Integer;
        { Storage for property CodigoRegistro }
        FCodigoRegistro : Integer;
        { Storage for property CodigoTabela }
        FCodigoTabela : Integer;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TRegistro_Deletado }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CPD }
        function GetCPD : Boolean;
        { Write method for property CPD }
        procedure SetCPD(Value : Boolean);
        { Read method for property CodigoRDL }
        function GetCodigoRDL : Integer;
        { Read method for property CodigoRegistro }
        function GetCodigoRegistro : Integer;
        { Read method for property CodigoTabela }
        function GetCodigoTabela : Integer;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property Situacao }
        function GetSituacao : Integer;

    protected
      { Protected fields of TRegistro_Deletado }

      { Protected methods of TRegistro_Deletado }

    public
      { Public fields and properties of TRegistro_Deletado }

      { Public methods of TRegistro_Deletado }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function Inserir(CdCNCRegistro,CdTabela,CdRegistro:Integer; POBS: String=''):boolean;
        function LocalizarCod(CdRDL, CdCNC:Integer):Boolean;

    published
      { Published properties of TRegistro_Deletado }
        property CConfiguracao : TConfiguracao
             read FCConfiguracao write FCConfiguracao;
        property CPD : Boolean read GetCPD write SetCPD;
        property CodigoRDL : Integer read GetCodigoRDL write FCodigoRDL;
        property CodigoRegistro : Integer
             read GetCodigoRegistro write FCodigoRegistro;
        property CodigoTabela : Integer
             read GetCodigoTabela write FCodigoTabela;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property OBS : String read GetOBS write FOBS;
        property Situacao : Integer read GetSituacao write FSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TRegistro_Deletado with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TRegistro_Deletado]);
end;

{ Method to set variable and property values and create objects }
procedure TRegistro_Deletado.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TRegistro_Deletado.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CPD }
function TRegistro_Deletado.GetCPD : Boolean;
begin
     Result := FCPD;
end;

{ Write method for property CPD }
procedure TRegistro_Deletado.SetCPD(Value : Boolean);
begin
     FCPD := Value;
end;

{ Read method for property CodigoRDL }
function TRegistro_Deletado.GetCodigoRDL : Integer;
begin
  try
    Result := Self.fieldByName('RDL_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoRegistro }
function TRegistro_Deletado.GetCodigoRegistro : Integer;
begin
  try
    Result := Self.fieldByName('RDL_CODIGO_REGISTRO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoTabela }
function TRegistro_Deletado.GetCodigoTabela : Integer;
begin
  try
    Result := Self.fieldByName('RDL_CODIGO_TABELA').asInteger;
    //Parametro TPR=
  except
    result:= -1;
  end;
end;

{ Read method for property DataCadastro }
function TRegistro_Deletado.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('RDL_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property OBS }
function TRegistro_Deletado.GetOBS : String;
begin
  try
    Result := Self.fieldByName('RDL_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Situacao }
function TRegistro_Deletado.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('RDL_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

constructor TRegistro_Deletado.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;

     { Code to perform other tasks when the component is created }

end;

destructor TRegistro_Deletado.Destroy;
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

function TRegistro_Deletado.Inserir(CdCNCRegistro,CdTabela,CdRegistro:Integer; POBS: String=''):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  Cod    := CConfiguracao.ProximoCodigo('RDL_CODIGO',1);
  
  If (localizarCod(Cod,CConfiguracao.CodigoCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT REGISTRO_DELETADO '+
        '(CNC_ORIGEM,CNC_CODIGO,RDL_CODIGO,USU_CODIGO,RDL_MAQUINA,RDL_DT_CADASTRO '+
        ',RDL_CODIGO_TABELA,RDL_CODIGO_REGISTRO '+
        ',RDL_SITUACAO,RDL_OBSERVACAO) VALUES '+
        '( '+IntToStr(CConfiguracao.CodigoCNC)+ //Não herdou de SQuery, logo não tem a propriedade CentroDeCusto
        ', '+IntToStr(CdCNCRegistro)+
        ', '+IntToStr(Cod)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ', '+IntToStr(CConfiguracao.Maquina)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(CdTabela)+
        ', '+IntToStr(CdRegistro)+
        ',0'+
        ',"'+POBS+'") ');
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
    end;
  end;
end;

function TRegistro_Deletado.LocalizarCod(CdRDL, CdCNC:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT RDL_CODIGO FROM REGISTRO_DELETADO '+
      ' WHERE CNC_ORIGEM='+IntToStr(CdCNC)+
      ' AND RDL_CODIGO='+IntToStr(CdRDL);
    Open;
    Result := (not isEmpty);
  end;
end;


end.
