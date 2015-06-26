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
unit Movimento_de_Credito;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Variants, Funcoes;

type
  TMovimento_de_Credito = class(TSQuery)
    private
      { Private fields of TMovimento_de_Credito }
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoMCR }
        FCodigoMCR : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : Tdatetime;
        { Storage for property Dc }
        FDc : String;
        { Storage for property EntCodigo }
        FEntCodigo : Integer;
        { Storage for property EntCodigoCNC }
        FEntCodigoCNC : Integer;
        { Storage for property MaquinaMCR }
        FMaquinaMCR : Integer;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property PedidoCNC }
        FPedidoCNC : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property Valor }
        FValor : Double;
        { Storage for property ValorAnterior }
        FValorAnterior : Double;

      { Private methods of TMovimento_de_Credito }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Write method for property ClienteCNC }
        procedure SetClienteCNC(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property CodigoMCR }
        function GetCodigoMCR : Integer;
        { Write method for property CodigoMCR }
        procedure SetCodigoMCR(Value : Integer);
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Write method for property CodigoPDV }
        procedure SetCodigoPDV(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : Tdatetime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : Tdatetime);
        { Read method for property Dc }
        function GetDc : String;
        { Write method for property Dc }
        procedure SetDc(Value : String);
        { Read method for property EntCodigo }
        function GetEntCodigo : Integer;
        { Write method for property EntCodigo }
        procedure SetEntCodigo(Value : Integer);
        { Read method for property EntCodigoCNC }
        function GetEntCodigoCNC : Integer;
        { Write method for property EntCodigoCNC }
        procedure SetEntCodigoCNC(Value : Integer);
        { Read method for property MaquinaMCR }
        function GetMaquinaMCR : Integer;
        { Write method for property MaquinaMCR }
        procedure SetMaquinaMCR(Value : Integer);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property PedidoCNC }
        function GetPedidoCNC : Integer;
        { Write method for property PedidoCNC }
        procedure SetPedidoCNC(Value : Integer);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);
        { Read method for property Valor }
        function GetValor : Double;
        { Write method for property Valor }
        procedure SetValor(Value : Double);
        { Read method for property ValorAnterior }
        function GetValorAnterior : Double;
        { Write method for property ValorAnterior }
        procedure SetValorAnterior(Value : Double);

    protected
      { Protected fields of TMovimento_de_Credito }

      { Protected methods of TMovimento_de_Credito }

    public
      { Public fields and properties of TMovimento_de_Credito }

      { Public methods of TMovimento_de_Credito }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        { Insere um Cliente }
        function Inserir(CdCNC,CdCLICNC,CdCLI,PTipo,PEntCodigoCNC,PEntCodigo,CdCNCPDV,CdPDV:integer; PDc:String;PValorAnt,PValor: Double; PSit:integer=0;POBS:string=''):Boolean;
        { Localiza um cliente }
        function LocalizarCod(CdMCR,CdCNC:Integer):Boolean;

    published
      { Published properties of TMovimento_de_Credito }
        property ClienteCNC : Integer read GetClienteCNC write SetClienteCNC;
        { Código do Cliente }
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property CodigoMCR : Integer read GetCodigoMCR write SetCodigoMCR;
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : Tdatetime
             read GetDataCadastro write SetDataCadastro;
        property Dc : String read GetDc write SetDc;
        property EntCodigo : Integer read GetEntCodigo write SetEntCodigo;
        property EntCodigoCNC : Integer
             read GetEntCodigoCNC write SetEntCodigoCNC;
        property MaquinaMCR : Integer read GetMaquinaMCR write SetMaquinaMCR;
        property Observacao : String read GetObservacao write SetObservacao;
        property PedidoCNC : Integer read GetPedidoCNC write SetPedidoCNC;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;
        property Valor : Double read GetValor write SetValor;
        property ValorAnterior : Double
             read GetValorAnterior write SetValorAnterior;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMovimento_de_Credito with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMovimento_de_Credito]);
end;

{ Method to set variable and property values and create objects }
procedure TMovimento_de_Credito.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TMovimento_de_Credito.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ClienteCNC }
function TMovimento_de_Credito.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property ClienteCNC }
procedure TMovimento_de_Credito.SetClienteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodigoCLI }
function TMovimento_de_Credito.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCLI }
procedure TMovimento_de_Credito.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoMCR }
function TMovimento_de_Credito.GetCodigoMCR : Integer;
begin
  try
    Result := Self.fieldByName('MCR_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoMCR }
procedure TMovimento_de_Credito.SetCodigoMCR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCR_CODIGO"!');
    end;
end;

{ Read method for property CodigoPDV }
function TMovimento_de_Credito.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPDV }
procedure TMovimento_de_Credito.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TMovimento_de_Credito.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('MCR_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TMovimento_de_Credito.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MCR_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MCR_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TMovimento_de_Credito.GetDataCadastro : Tdatetime;
begin
  try
    Result := Self.fieldByName('MCR_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TMovimento_de_Credito.SetDataCadastro(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MCR_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MCR_DT_CADASTRO"!');
  end;
end;

{ Read method for property Dc }
function TMovimento_de_Credito.GetDc : String;
begin
  try
    Result := Self.fieldByName('MCR_DC').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Dc }
procedure TMovimento_de_Credito.SetDc(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCR_DC').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCR_DC"!');
    end;
end;

{ Read method for property EntCodigo }
function TMovimento_de_Credito.GetEntCodigo : Integer;
begin
  try
    Result := Self.fieldByName('MSN_ENT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property EntCodigo }
procedure TMovimento_de_Credito.SetEntCodigo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MSN_ENT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MSN_ENT_CODIGO"!');
    end;
end;

{ Read method for property EntCodigoCNC }
function TMovimento_de_Credito.GetEntCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_ENT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property EntCodigoCNC }
procedure TMovimento_de_Credito.SetEntCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_ENT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_ENT_CODIGO"!');
    end;
end;

{ Read method for property MaquinaMCR }
function TMovimento_de_Credito.GetMaquinaMCR : Integer;
begin
  try
    Result := Self.fieldByName('MCR_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property MaquinaMCR }
procedure TMovimento_de_Credito.SetMaquinaMCR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCR_MAQUINA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCR_MAQUINA"!');
    end;
end;

{ Read method for property Observacao }
function TMovimento_de_Credito.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('MCR_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TMovimento_de_Credito.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCR_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCR_OBSERVACAO"!');
    end;
end;

{ Read method for property PedidoCNC }
function TMovimento_de_Credito.GetPedidoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_PEDIDO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property PedidoCNC }
procedure TMovimento_de_Credito.SetPedidoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_PEDIDO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_PEDIDO"!');
    end;
end;

{ Read method for property Situacao }
function TMovimento_de_Credito.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('MCR_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TMovimento_de_Credito.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCR_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCR_SITUACAO"!');
    end;
end;

{ Read method for property Tipo }
function TMovimento_de_Credito.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('MCR_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Tipo }
procedure TMovimento_de_Credito.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCR_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCR_TIPO"!');
    end;
end;

{ Read method for property Valor }
function TMovimento_de_Credito.GetValor : Double;
begin
  try
    Result := Self.fieldByName('MCR_VALOR').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Valor }
procedure TMovimento_de_Credito.SetValor(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCR_VALOR').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCR_VALOR"!');
    end;
end;

{ Read method for property ValorAnterior }
function TMovimento_de_Credito.GetValorAnterior : Double;
begin
  try
    Result := Self.fieldByName('MCR_VALOR_ANT').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property ValorAnterior }
procedure TMovimento_de_Credito.SetValorAnterior(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCR_VALOR_ANT').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCR_VALOR_ANT"!');
    end;
end;

constructor TMovimento_de_Credito.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'MOVIMENTO_DE_CREDITO';

     { Code to perform other tasks when the component is created }

end;

destructor TMovimento_de_Credito.Destroy;
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
function TMovimento_de_Credito.Inserir(CdCNC,CdCLICNC,CdCLI,PTipo,PEntCodigoCNC,PEntCodigo,CdCNCPDV,CdPDV:integer; PDc:String;PValorAnt,PValor: Double; PSit:integer=0;POBS:string=''):Boolean;
Var
  Cod:Integer;
begin
  result:=false;
  Cod := ProximoCodigo('MCR_CODIGO');
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO MOVIMENTO_DE_CREDITO '+
        '(CNC_CODIGO,MCR_CODIGO,USU_CODIGO,MCR_DT_CADASTRO,MCR_MAQUINA'+
        ',CNC_CLIENTE,CLI_CODIGO,MCR_TIPO,MCR_DC'+
        ',MCR_VALOR_ANT,MCR_VALOR'+
        ',CNC_ENT_CODIGO,MCR_ENT_CODIGO,CNC_PEDIDO,PDV_CODIGO'+
        ',MCR_SITUACAO,MCR_OBSERVACAO) VALUES '+
        '( '+IntToStr(CdCNC)+
        ', '+IntToStr(Cod)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(Maquina)+
        ', '+IntToStr(CdCLICNC)+
        ', '+IntToStr(CdCLI)+
        ', '+IntToStr(PTipo)+
        ',"'+PDc+'" '+
        ', '+VirgPonto(PValorAnt)+
        ', '+VirgPonto(PValor)+
        ', '+IntToStr(PEntCodigoCNC)+
        ', '+IntToStr(PEntCodigo)+
        ', '+IntToStr(CdCNCPDV)+
        ', '+IntToStr(CdPDV)+
        ', '+IntToStr(PSit)+
        ',"'+PObs+'") ');
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro!'+Tabela);
    end;
  end;
end;

{ Localiza um cliente }
function TMovimento_de_Credito.LocalizarCod(CdMCR,CdCNC:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 MCR_CODIGO '+
      ' FROM MOVIMENTO_DE_CREDITO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND MCR_CODIGO='+IntToStr(CdMCR);
    Open;
    Result := (not isEmpty);
  end;
end;


end.
