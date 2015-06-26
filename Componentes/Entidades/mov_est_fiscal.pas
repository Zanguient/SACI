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
unit Mov_Est_Fiscal;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Variants, Funcoes;

type
  TMov_Est_Fiscal = class(TSQuery)
    private
      { Private fields of TMov_Est_Fiscal }
        { Storage for property Amostra }
        FAmostra : Double;
        { Storage for property AmostraAnterior }
        FAmostraAnterior : Double;
        { Storage for property Bonificacao }
        FBonificacao : Double;
        { Storage for property BonificacaoAnterior }
        FBonificacaoAnterior : Double;
        { Storage for property CodigoCNCENT }
        FCodigoCNCENT : Integer;
        { Storage for property CodigoENT }
        FCodigoENT : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoMES }
        FCodigoMES : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property ES }
        FES : String;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property SaldoAnt }
        FSaldoAnt : Double;
        { Storage for property TipoEnt }
        FTipoEnt : Integer;
        { Storage for property TipoMov }
        FTipoMov : Integer;

      { Private methods of TMov_Est_Fiscal }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Amostra }
        function GetAmostra : Double;
        { Read method for property AmostraAnterior }
        function GetAmostraAnterior : Double;
        { Read method for property Bonificacao }
        function GetBonificacao : Double;
        { Read method for property BonificacaoAnterior }
        function GetBonificacaoAnterior : Double;
        { Read method for property CodigoCNCENT }
        function GetCodigoCNCENT : Integer;
        { Read method for property CodigoENT }
        function GetCodigoENT : Integer;
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Read method for property CodigoMES }
        function GetCodigoMES : Integer;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Read method for property Data }
        function GetData : Tdatetime;
        { Read method for property ES }
        function GetES : String;
        { Read method for property Observacao }
        function GetObservacao : String;
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Read method for property SaldoAnt }
        function GetSaldoAnt : Double;
        { Read method for property TipoEnt }
        function GetTipoEnt : Integer;
        { Read method for property TipoMov }
        function GetTipoMov : Integer;

    protected
      { Protected fields of TMov_Est_Fiscal }

      { Protected methods of TMov_Est_Fiscal }

    public
      { Public fields and properties of TMov_Est_Fiscal }

      { Public methods of TMov_Est_Fiscal }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        { Insere um Cliente }
        function Inserir(CdCNC,CdPRD,CdFUN, CdMES, CdCNCENT,CdENT,PTipoMov: integer; PES: String; PQuantidade,PSaldoAnt,PAmostraAnt,PAmostra,PBonusAnt,PBonus: Double; POBS:string=''; DtMov:TDateTime=0):boolean;

    published
      { Published properties of TMov_Est_Fiscal }
        property Amostra : Double read GetAmostra write FAmostra;
        property AmostraAnterior : Double
             read GetAmostraAnterior write FAmostraAnterior;
        property Bonificacao : Double read GetBonificacao write FBonificacao;
        property BonificacaoAnterior : Double
             read GetBonificacaoAnterior write FBonificacaoAnterior;
        property CodigoCNCENT : Integer
             read GetCodigoCNCENT write FCodigoCNCENT;
        property CodigoENT : Integer read GetCodigoENT write FCodigoENT;
        property CodigoFUN : Integer read GetCodigoFUN write FCodigoFUN;
        property CodigoMES : Integer read GetCodigoMES write FCodigoMES;
        { Código do Produto }
        property CodigoPRD : Integer read GetCodigoPRD write FCodigoPRD;
        property Data : Tdatetime read GetData write FData;
        property ES : String read GetES write FES;
        property Observacao : String read GetObservacao write FObservacao;
        property Quantidade : Double read GetQuantidade write FQuantidade;
        property SaldoAnt : Double read GetSaldoAnt write FSaldoAnt;
        property TipoEnt : Integer read GetTipoEnt write FTipoEnt;
        property TipoMov : Integer read GetTipoMov write FTipoMov;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMov_Est_Fiscal with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMov_Est_Fiscal]);
end;

{ Method to set variable and property values and create objects }
procedure TMov_Est_Fiscal.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TMov_Est_Fiscal.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Amostra }
function TMov_Est_Fiscal.GetAmostra : Double;
begin
  try
    Result := Self.fieldByName('MES_AMOSTRA').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property AmostraAnterior }
function TMov_Est_Fiscal.GetAmostraAnterior : Double;
begin
  try
    Result := Self.fieldByName('MES_AMOSTRA_ANTERIOR').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Bonificacao }
function TMov_Est_Fiscal.GetBonificacao : Double;
begin
  try
    Result := Self.fieldByName('MES_BONIFICACAO').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property BonificacaoAnterior }
function TMov_Est_Fiscal.GetBonificacaoAnterior : Double;
begin
  try
    Result := Self.fieldByName('MES_BONIFICACAO_ANTERIOR').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCNCENT }
function TMov_Est_Fiscal.GetCodigoCNCENT : Integer;
begin
  try
    Result := Self.fieldByName('MES_CNC_CODIGO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoENT }
function TMov_Est_Fiscal.GetCodigoENT : Integer;
begin
  try
    Result := Self.fieldByName('MES_ENT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoFUN }
function TMov_Est_Fiscal.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoMES }
function TMov_Est_Fiscal.GetCodigoMES : Integer;
begin
  try
    Result := Self.fieldByName('MES_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoPRD }
function TMov_Est_Fiscal.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property Data }
function TMov_Est_Fiscal.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('MES_DATA_HORA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property ES }
function TMov_Est_Fiscal.GetES : String;
begin
  try
    Result := Self.fieldByName('MES_ES').asString;
  except
    result:= ''
  end;
end;

{ Read method for property Observacao }
function TMov_Est_Fiscal.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('MES_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Read method for property Quantidade }
function TMov_Est_Fiscal.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('MES_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property SaldoAnt }
function TMov_Est_Fiscal.GetSaldoAnt : Double;
begin
  try
    Result := Self.fieldByName('MES_SALDO_ANT').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property TipoEnt }
function TMov_Est_Fiscal.GetTipoEnt : Integer;
begin
  try
    Result := Self.fieldByName('MES_TIPO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property TipoMov }
function TMov_Est_Fiscal.GetTipoMov : Integer;
begin
  try
    result := Self.fieldByName('MES_TIPO_MOV').asInteger;
  except
    Result := 0;
  end;
end;

constructor TMov_Est_Fiscal.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'MOVIMENTO_DE_ESTOQUE_FISCAL';

     { Code to perform other tasks when the component is created }

end;

destructor TMov_Est_Fiscal.Destroy;
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

{ Insere um Cliente }
function TMov_Est_Fiscal.Inserir(CdCNC,CdPRD,CdFUN, CdMES, CdCNCENT,CdENT,PTipoMov: integer; PES: String; PQuantidade,PSaldoAnt,PAmostraAnt,PAmostra,PBonusAnt,PBonus: Double; POBS:string=''; DtMov:TDateTime=0):boolean;
Var
  Cod: Integer;
  vData: TDateTime;
begin
  Result := False;
  if DtMov > 0 then
    vData := DtMov    //Usado somente na tela de corrigir o Estoque
  else
    vData := CConfiguracao.DataHora;

  Cod    := ProximoCodigo('MES_CODIGO');

  if vData <= 0 then
  Begin
    ShowMessage('Problema com a Data!');
    Exit;
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO '+Tabela+
      '(CNC_CODIGO,MES_CODIGO,USU_CODIGO,MES_MAQUINA,MES_DATA_HORA '+
      ',PRD_CODIGO,FUN_CODIGO '+
      ',MES_ES,MES_TIPO_MOV,MES_QUANTIDADE '+
      ',MES_SALDO_ANT,MES_CNC_CODIGO_ENT,MES_ENT_CODIGO '+
      ',MES_AMOSTRA_ANTERIOR,MES_AMOSTRA,MES_BONIFICACAO_ANTERIOR,MES_BONIFICACAO '+
      ',MES_OBSERVACAO) VALUES '+
      '( '+IntToStr(CdCNC)+
      ', '+IntToStr(Cod)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ', '+IntToStr(Maquina)+
      ',"'+MesDiaHora(vData)+'" '+
      ', '+IntToStr(CdPRD)+
      ', '+IntToStr(CdFUN)+      
      ',"'+PEs+'" '+
      ', '+IntToStr(PTipoMov)+
      ', '+VirgPonto(PQuantidade)+
      ', '+VirgPonto(PSaldoAnt)+
      ', '+IntToStr(CdCNCENT)+
      ', '+IntToStr(CdENT)+
      ', '+VirgPonto(PAmostraAnt)+
      ', '+VirgPonto(PAmostra)+
      ', '+VirgPonto(PBonusAnt)+
      ', '+VirgPonto(PBonus)+
      ',"'+PObs+'") ');
    Result := True;
  except
    ShowMessage('Não foi possível incluir o registro corrente!');
  End;
end;


end.
