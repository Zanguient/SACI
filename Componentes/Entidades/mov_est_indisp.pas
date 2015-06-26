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
unit Mov_Est_Indisp;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Variants;

type
  TMov_Est_Indisp = class(TSQuery)
    private
      { Private fields of TMov_Est_Indisp }
        { Storage for property CProduto }
        FCProduto : TProduto;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoCNCENT }
        FCodigoCNCENT : Integer;
        { Storage for property CodigoENT }
        FCodigoENT : Integer;
        { Storage for property CodigoMEI }
        FCodigoMEI : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property ES }
        FES : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property SaldoAnt }
        FSaldoAnt : Double;
        { Storage for property TipoEnt }
        FTipoEnt : Integer;
        { Storage for property TipoMov }
        FTipoMov : Integer;

      { Private methods of TMov_Est_Indisp }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoCNCENT }
        function GetCodigoCNCENT : Integer;
        { Write method for property CodigoCNCENT }
        procedure SetCodigoCNCENT(Value : Integer);
        { Read method for property CodigoENT }
        function GetCodigoENT : Integer;
        { Write method for property CodigoENT }
        procedure SetCodigoENT(Value : Integer);
        { Read method for property CodigoMEI }
        function GetCodigoMEI : Integer;
        { Write method for property CodigoMEI }
        procedure SetCodigoMEI(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property ES }
        function GetES : String;
        { Write method for property ES }
        procedure SetES(Value : String);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property SaldoAnt }
        function GetSaldoAnt : Double;
        { Write method for property SaldoAnt }
        procedure SetSaldoAnt(Value : Double);
        { Read method for property TipoEnt }
        function GetTipoEnt : Integer;
        { Write method for property TipoEnt }
        procedure SetTipoEnt(Value : Integer);
        { Read method for property TipoMov }
        function GetTipoMov : Integer;
        { Write method for property TipoMov }
        procedure SetTipoMov(Value : Integer);

    protected
      { Protected fields of TMov_Est_Indisp }

      { Protected methods of TMov_Est_Indisp }
        procedure Loaded; override;

    public
      { Public fields and properties of TMov_Est_Indisp }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TMov_Est_Indisp }
        { Altera um Cliente }
        function Alterar(CdCNC, CdPRD, CdMEI, CdCNCENT,CdENT,PTipoMov, PTipoEnt: integer; PData:TDateTime;PES: String; PQuantidade, PSaldoAnt: Double):boolean;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC,CdPRD:Integer);
        destructor Destroy; override;
        { Insere um Cliente }
        function Inserir(CdCNC, CdPRD, CdMEI, CdCNCENT,CdENT,PTipoMov, PTipoEnt: integer; PData:TDateTime;PES: String; PQuantidade, PSaldoAnt: Double):boolean;
        { Localiza um cliente }
        function LocalizarCod(CdMEI,CdCNC:Integer):Boolean;
        function deletarauto:Boolean;

    published
      { Published properties of TMov_Est_Indisp }
        property CProduto : TProduto read FCProduto write FCProduto;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoCNCENT : Integer
             read GetCodigoCNCENT write SetCodigoCNCENT;
        property CodigoENT : Integer read GetCodigoENT write SetCodigoENT;
        property CodigoMEI : Integer read GetCodigoMEI write SetCodigoMEI;
        { Código do Produto }
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property Data : Tdatetime read GetData write SetData;
        property ES : String read GetES write SetES;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property SaldoAnt : Double read GetSaldoAnt write SetSaldoAnt;
        property TipoEnt : Integer read GetTipoEnt write SetTipoEnt;
        property TipoMov : Integer read GetTipoMov write SetTipoMov;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMov_Est_Indisp with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMov_Est_Indisp]);
end;

{ Method to set variable and property values and create objects }
procedure TMov_Est_Indisp.AutoInitialize;
begin
     Estado := 0;
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TMov_Est_Indisp.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TMov_Est_Indisp.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TMov_Est_Indisp.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNCENT }
function TMov_Est_Indisp.GetCodigoCNCENT : Integer;
begin
  try
    Result := Self.fieldByName('MEI_CNC_CODIGO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNCENT }
procedure TMov_Est_Indisp.SetCodigoCNCENT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MEI_CNC_CODIGO_ENT').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MEI_CNC_CODIGO_ENT"!');
    end;
end;

{ Read method for property CodigoENT }
function TMov_Est_Indisp.GetCodigoENT : Integer;
begin
  try
    Result := Self.fieldByName('MEI_ENT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoENT }
procedure TMov_Est_Indisp.SetCodigoENT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MEI_ENT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MEI_ENT_CODIGO"!');
    end;
end;

{ Read method for property CodigoMEI }
function TMov_Est_Indisp.GetCodigoMEI : Integer;
begin
  try
    Result := Self.fieldByName('MEI_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoMEI }
procedure TMov_Est_Indisp.SetCodigoMEI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MEI_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MEI_CODIGO"!');
  end;
end;

{ Read method for property CodigoPRD }
function TMov_Est_Indisp.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TMov_Est_Indisp.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TMov_Est_Indisp.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('MEI_DATA_HORA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TMov_Est_Indisp.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MEI_DATA_HORA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MEI_DATA_HORA"!');
  end;
end;

{ Read method for property ES }
function TMov_Est_Indisp.GetES : String;
begin
  try
    Result := Self.fieldByName('MEI_ES').asString;
  except
    result:= ''
  end;
end;

{ Write method for property ES }
procedure TMov_Est_Indisp.SetES(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MEI_ES').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MEI_ES"!');
    end;
end;

{ Read method for property Quantidade }
function TMov_Est_Indisp.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('MEI_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TMov_Est_Indisp.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MEI_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MEI_QUANTIDADE"!');
    end;
end;

{ Read method for property SaldoAnt }
function TMov_Est_Indisp.GetSaldoAnt : Double;
begin
  try
    Result := Self.fieldByName('MEI_SALDO_ANT').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property SaldoAnt }
procedure TMov_Est_Indisp.SetSaldoAnt(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MEI_SALDO_ANT').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MEI_SALDO_ANT"!');
    end;
end;

{ Read method for property TipoEnt }
function TMov_Est_Indisp.GetTipoEnt : Integer;
begin
  try
    Result := Self.fieldByName('MEI_TIPO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoEnt }
procedure TMov_Est_Indisp.SetTipoEnt(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MEI_TIPO_ENT').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MEI_TIPO_ENT"!');
  end;
end;

{ Read method for property TipoMov }
function TMov_Est_Indisp.GetTipoMov : Integer;
begin
  try
    result := Self.fieldByName('MEI_TIPO_MOV').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property TipoMov }
procedure TMov_Est_Indisp.SetTipoMov(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MEI_TIPO_MOV').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MEI_TIPO_MOV"!');
    end;
end;

{ Altera um Cliente }
function TMov_Est_Indisp.Alterar(CdCNC, CdPRD, CdMEI, CdCNCENT,CdENT,PTipoMov, PTipoEnt: integer; PData:TDateTime;PES: String; PQuantidade, PSaldoAnt: Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdMEI,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoPRD      := CdPRD;
      CodigoCNCENT   := CdCNCENT;
      CodigoENT      := CdENT;
      TipoMOV        := PTipoMov;
      Quantidade     := PQuantidade;
      SaldoAnt       := PSaldoAnt;
      TipoEnt        := PTipoEnt;
      ES             := PES;
      Data           := PData;
      try
        Post;
        result := true;
      except
        result := false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result := false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

constructor TMov_Est_Indisp.Create(AOwner: TComponent);
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

procedure TMov_Est_Indisp.Deletar(CdCNC,CdPRD:Integer);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdPRD,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TMov_Est_Indisp.Destroy;
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
function TMov_Est_Indisp.Inserir(CdCNC, CdPRD, CdMEI, CdCNCENT,CdENT,PTipoMov, PTipoEnt: integer; PData:TDateTime;PES: String; PQuantidade, PSaldoAnt: Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod: Integer;
begin
  if CdMEI=0 then
    Cod    := ProximoCodigo('MEI_CODIGO')
  else
    Cod    := CdMEI;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
  end
  Else
  begin
    try
      Insert;
      CodigoMEI      := Cod;
      CodigoCNC      := CdCNC;
      CodigoPRD      := CdPRD;
      CodigoCNCENT   := CdCNCENT;
      CodigoENT      := CdENT;
      TipoMOV        := PTipoMov;
      Quantidade     := PQuantidade;
      SaldoAnt       := PSaldoAnt;
      TipoEnt        := PTipoEnt;
      ES             := PES;
      Data           := PData;

      try
        Post;
        result := true;
      except
        result := false;
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      result := false;
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

procedure TMov_Est_Indisp.Loaded;
begin
     inherited Loaded;

     { Perform any component setup that depends on the property
       values having been set }

end;

{ Localiza um cliente }
function TMov_Est_Indisp.LocalizarCod(CdMEI,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdMEI<>CodigoMEI) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;MEI_CODIGO', vararrayof([CdCNC, CdMEI]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TMov_Est_Indisp.deletarauto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    Delete;
    result:=true;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
