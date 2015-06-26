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
unit Item_de_Estoque_Detalhe;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Variants, Funcoes;

type
  TItem_de_Estoque_Detalhe = class(TSQuery)
    private
      { Private fields of TItem_de_Estoque_Detalhe }
        { Storage for property CodigoIED }
        FCodigoIED : Integer;
        { Storage for property CodigoLOT }
        FCodigoLOT : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : Tdatetime;
        { Storage for property MaquinaIED }
        FMaquinaIED : Integer;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property QtdFiscal }
        FQtdFiscal : Double;
        { Storage for property QtdFisico }
        FQtdFisico : Double;

      { Private methods of TItem_de_Estoque_Detalhe }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoIED }
        function GetCodigoIED : Integer;
        { Read method for property CodigoLOT }
        function GetCodigoLOT : Integer;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : Tdatetime;
        { Read method for property MaquinaIED }
        function GetMaquinaIED : Integer;
        { Read method for property Observacao }
        function GetObservacao : String;
        { Read method for property QtdFiscal }
        function GetQtdFiscal : Double;
        { Read method for property QtdFisico }
        function GetQtdFisico : Double;

    protected
      { Protected fields of TItem_de_Estoque_Detalhe }

      { Protected methods of TItem_de_Estoque_Detalhe }

    public
      { Public fields and properties of TItem_de_Estoque_Detalhe }

      { Public methods of TItem_de_Estoque_Detalhe }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function Inserir(CdCNC, CdLOT, CdPRD:integer; PQtdFisico:double=0; PQtdFiscal:double=0; PObs:string=''):boolean;

    published
      { Published properties of TItem_de_Estoque_Detalhe }
        property CodigoIED : Integer read GetCodigoIED write FCodigoIED;
        property CodigoLOT : Integer read GetCodigoLOT write FCodigoLOT;
        { Código do Produto }
        property CodigoPRD : Integer read GetCodigoPRD write FCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : Tdatetime
             read GetDataCadastro write FDataCadastro;
        property MaquinaIED : Integer read GetMaquinaIED write FMaquinaIED;
        property Observacao : String read GetObservacao write FObservacao;
        property QtdFiscal : Double read GetQtdFiscal write FQtdFiscal;
        property QtdFisico : Double read GetQtdFisico write FQtdFisico;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Estoque_Detalhe with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Estoque_Detalhe]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Estoque_Detalhe.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Estoque_Detalhe.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoIED }
function TItem_de_Estoque_Detalhe.GetCodigoIED : Integer;
begin
  try
    Result := Self.fieldByName('IED_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoLOT }
function TItem_de_Estoque_Detalhe.GetCodigoLOT : Integer;
begin
  try
    Result := Self.fieldByName('LOT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoPRD }
function TItem_de_Estoque_Detalhe.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DataAlterado }
function TItem_de_Estoque_Detalhe.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('IED_DT_ALTERADO').asDateTime
  except
    Result := 0;
  end;
end;

{ Read method for property DataCadastro }
function TItem_de_Estoque_Detalhe.GetDataCadastro : Tdatetime;
begin
  try
    Result := Self.fieldByName('IED_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property MaquinaIED }
function TItem_de_Estoque_Detalhe.GetMaquinaIED : Integer;
begin
  try
    Result := Self.fieldByName('IED_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Observacao }
function TItem_de_Estoque_Detalhe.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('IED_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property QtdFiscal }
function TItem_de_Estoque_Detalhe.GetQtdFiscal : Double;
begin
  try
    Result := Self.fieldByName('IED_QTD_FISCAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property QtdFisico }
function TItem_de_Estoque_Detalhe.GetQtdFisico : Double;
begin
  try
    Result := Self.fieldByName('IED_QTD_FISICO').asFloat;
  except
    result:= 0;
  end;
end;

constructor TItem_de_Estoque_Detalhe.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ITEM_DE_ESTOQUE_DETALHE';

     { Code to perform other tasks when the component is created }

end;

destructor TItem_de_Estoque_Detalhe.Destroy;
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

function TItem_de_Estoque_Detalhe.Inserir(CdCNC, CdLOT, CdPRD:integer; PQtdFisico:double=0; PQtdFiscal:double=0; PObs:string=''):boolean;
var
  Cod: integer;
begin
  result:=False;

  Cod := CConfiguracao.ProximoCodigo('IED_CODIGO');

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO '+Tabela+
      '(IED_CODIGO,CNC_ORIGEM,CNC_CODIGO,PRD_CODIGO,LOT_CODIGO '+
      ',USU_CODIGO,IED_MAQUINA,IED_DT_CADASTRO '+
      ',IED_QTD_FISICO,IED_QTD_FISCAL '+
      ',IED_OBSERVACAO) VALUES '+
      '( '+IntToStr(Cod)+
      ', '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(CdCNC)+
      ', '+IntToStr(CdPRD)+
      ', '+IntToStr(CdLOT)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ', '+IntToStr(Maquina)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+VirgPonto(PQtdFisico)+
      ', '+VirgPonto(PQtdFiscal)+
      ',"'+PObs+'") ');
    Result := True;
  except
    ShowMessage('Não foi possível incluir o registro corrente!');
  End;
end;


end.
