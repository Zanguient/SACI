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
unit Movimento_Estoque_Comercial;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Variants, Funcoes;

type
  TMovimento_Estoque_Comercial = class(TSQuery)
    private
      { Private fields of TMovimento_Estoque_Comercial }
        { Storage for property Amostra }
        FAmostra : Double;
        { Storage for property AmostraAnterior }
        FAmostraAnterior : Double;
        { Storage for property Bonificacao }
        FBonificacao : Double;
        { Storage for property BonificacaoAnterior }
        FBonificacaoAnterior : Double;
        { Storage for property CncCodigo }
        FCncCodigo : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoMEC }
        FCodigoMEC : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property EntCodigo }
        FEntCodigo : Integer;
        { Storage for property Es }
        FEs : String;
        { Storage for property Indisponivel }
        FIndisponivel : Double;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Reservado }
        FReservado : Double;
        { Storage for property Saldo }
        FSaldo : Double;
        { Storage for property TipoEnt }
        FTipoEnt : Integer;
        { Storage for property TipoMov }
        FTipoMov : Integer;

      { Private methods of TMovimento_Estoque_Comercial }
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
        { Read method for property CncCodigo }
        function GetCncCodigo : Integer;
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Read method for property CodigoMEC }
        function GetCodigoMEC : Integer;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Read method for property Data }
        function GetData : Tdatetime;
        { Read method for property EntCodigo }
        function GetEntCodigo : Integer;
        { Read method for property Es }
        function GetEs : String;
        { Read method for property Indisponivel }
        function GetIndisponivel : Double;
        { Read method for property Observacao }
        function GetObservacao : String;
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Read method for property Reservado }
        function GetReservado : Double;
        { Read method for property Saldo }
        function GetSaldo : Double;
        { Read method for property TipoEnt }
        function GetTipoEnt : Integer;
        { Read method for property TipoMov }
        function GetTipoMov : Integer;

    protected
      { Protected fields of TMovimento_Estoque_Comercial }

      { Protected methods of TMovimento_Estoque_Comercial }

    public
      { Public fields and properties of TMovimento_Estoque_Comercial }

      { Public methods of TMovimento_Estoque_Comercial }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        { Insere um Cliente }
        function Inserir(CdCNC, CdMEC,CdPRD,CdFUN,PTipomov,PCncCodigo,PEntCodigo: integer; PEs: String;PQuantidade,PSaldoAnt,PReservadoAnt,PIndisponivelAnt,PAmostraAnt,PAmostra,PBonusAnt,PBonus: Double; POBS:String='';DtMov: TDateTime=0):Boolean;

    published
      { Published properties of TMovimento_Estoque_Comercial }
        { Amostra Movimentada }
        property Amostra : Double read GetAmostra write FAmostra;
        property AmostraAnterior : Double
             read GetAmostraAnterior write FAmostraAnterior;
        { Bonificação Movimentada }
        property Bonificacao : Double read GetBonificacao write FBonificacao;
        property BonificacaoAnterior : Double
             read GetBonificacaoAnterior write FBonificacaoAnterior;
        property CncCodigo : Integer read GetCncCodigo write FCncCodigo;
        property CodigoFUN : Integer read GetCodigoFUN write FCodigoFUN;
        property CodigoMEC : Integer read GetCodigoMEC write FCodigoMEC;
        { Código do Produto }
        property CodigoPRD : Integer read GetCodigoPRD write FCodigoPRD;
        property Data : Tdatetime read GetData write FData;
        property EntCodigo : Integer read GetEntCodigo write FEntCodigo;
        property Es : String read GetEs write FEs;
        { Indisponivel no Momento do Movimento }
        property Indisponivel : Double
             read GetIndisponivel write FIndisponivel;
        property Observacao : String read GetObservacao write FObservacao;
        property Quantidade : Double read GetQuantidade write FQuantidade;
        { Reserva no Momento do Movimento }
        property Reservado : Double read GetReservado write FReservado;
        property Saldo : Double read GetSaldo write FSaldo;
        property TipoEnt : Integer read GetTipoEnt write FTipoEnt;
        property TipoMov : Integer read GetTipoMov write FTipoMov;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMovimento_Estoque_Comercial with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMovimento_Estoque_Comercial]);
end;

{ Method to set variable and property values and create objects }
procedure TMovimento_Estoque_Comercial.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TMovimento_Estoque_Comercial.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Amostra }
function TMovimento_Estoque_Comercial.GetAmostra : Double;
begin
  try
    Result := Self.fieldByName('MEC_AMOSTRA').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property AmostraAnterior }
function TMovimento_Estoque_Comercial.GetAmostraAnterior : Double;
begin
  try
    Result := Self.fieldByName('MEC_AMOSTRA_ANTERIOR').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Bonificacao }
function TMovimento_Estoque_Comercial.GetBonificacao : Double;
begin
  try
    Result := Self.fieldByName('MEC_BONIFICACAO').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property BonificacaoAnterior }
function TMovimento_Estoque_Comercial.GetBonificacaoAnterior : Double;
begin
  try
    Result := Self.fieldByName('MEC_BONIFICACAO_ANTERIOR').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property CncCodigo }
function TMovimento_Estoque_Comercial.GetCncCodigo : Integer;
begin
  try
    Result := Self.fieldByName('MEC_CNC_CODIGO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoFUN }
function TMovimento_Estoque_Comercial.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoMEC }
function TMovimento_Estoque_Comercial.GetCodigoMEC : Integer;
begin
  try
    Result := Self.fieldByName('MEC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoPRD }
function TMovimento_Estoque_Comercial.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property Data }
function TMovimento_Estoque_Comercial.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('MEC_DATA_HORA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property EntCodigo }
function TMovimento_Estoque_Comercial.GetEntCodigo : Integer;
begin
  try
    Result := Self.fieldByName('MEC_ENT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property Es }
function TMovimento_Estoque_Comercial.GetEs : String;
begin
  try
    Result := Self.fieldByName('MEC_ES').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Indisponivel }
function TMovimento_Estoque_Comercial.GetIndisponivel : Double;
begin
  try
    Result := Self.fieldByName('MEC_INDISPONIVEL').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Observacao }
function TMovimento_Estoque_Comercial.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('MEC_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Quantidade }
function TMovimento_Estoque_Comercial.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('MEC_QUANTIDADE').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Reservado }
function TMovimento_Estoque_Comercial.GetReservado : Double;
begin
  try
    Result := Self.fieldByName('MEC_RESERVADO').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Saldo }
function TMovimento_Estoque_Comercial.GetSaldo : Double;
begin
  try
    Result := Self.fieldByName('MEC_SALDO_ANT').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property TipoEnt }
function TMovimento_Estoque_Comercial.GetTipoEnt : Integer;
begin
  try
    Result := Self.fieldByName('MEC_TIPO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property TipoMov }
function TMovimento_Estoque_Comercial.GetTipoMov : Integer;
begin
  try
    Result := Self.fieldByName('MEC_TIPO_MOV').asInteger;
  except
    result:= 0
  end;
end;

constructor TMovimento_Estoque_Comercial.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'MOVIMENTO_DE_ESTOQUE_COMERCIAL';

     { Code to perform other tasks when the component is created }

end;

destructor TMovimento_Estoque_Comercial.Destroy;
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
function TMovimento_Estoque_Comercial.Inserir(CdCNC, CdMEC,CdPRD,CdFUN,PTipomov,PCncCodigo,PEntCodigo: integer; PEs: String;PQuantidade,PSaldoAnt,PReservadoAnt,PIndisponivelAnt,PAmostraAnt,PAmostra,PBonusAnt,PBonus: Double; POBS:String='';DtMov: TDateTime=0):Boolean;
Var
  Cod:Integer;
  vData: TDateTime;
begin
  result:=False;
  if DtMov > 0 then
    vData := DtMov    //Usado somente na tela de corrigir o Estoque
  else
    vData := CConfiguracao.DataHora;

  Cod := ProximoCodigo('MEC_CODIGO');

  if vData <= 0 then
  Begin
    ShowMessage('Problema com a Data!');
    Exit;
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO '+Tabela+
      '(CNC_CODIGO,MEC_CODIGO,USU_CODIGO,MEC_MAQUINA,MEC_DATA_HORA '+
      ',PRD_CODIGO,FUN_CODIGO '+
      ',MEC_ES,MEC_TIPO_MOV,MEC_QUANTIDADE '+
      ',MEC_SALDO_ANT,MEC_CNC_CODIGO_ENT,MEC_ENT_CODIGO '+
      ',MEC_RESERVADO,MEC_INDISPONIVEL '+
      ',MEC_AMOSTRA_ANTERIOR,MEC_AMOSTRA,MEC_BONIFICACAO_ANTERIOR,MEC_BONIFICACAO '+
      ',MEC_OBSERVACAO) VALUES '+
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
      ', '+IntToStr(PCncCodigo)+
      ', '+IntToStr(PEntCodigo)+
      ', '+VirgPonto(PReservadoAnt)+
      ', '+VirgPonto(PIndisponivelAnt)+
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
