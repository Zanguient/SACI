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
unit Custo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TCusto = class(TSQuery)
    private
      { Private fields of TCusto }
        { Storage for property CodigoCUS }
        FCodigoCUS : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoPCP }
        FCodigoPCP : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CustoAnterior }
        FCustoAnterior : Double;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoCUS }
        FECodigoCUS : TEdit;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TEdit;
        { Storage for property ECodigoPCP }
        FECodigoPCP : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECustoAnterior }
        FECustoAnterior : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EFrete }
        FEFrete : TEdit;
        { Storage for property EICMS }
        FEICMS : TEdit;
        { Storage for property EICMSFrete }
        FEICMSFrete : TEdit;
        { Storage for property EIPI }
        FEIPI : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EPrecoFinal }
        FEPrecoFinal : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property EQuantidadeAnterior }
        FEQuantidadeAnterior : TEdit;
        { Storage for property EValorCompra }
        FEValorCompra : TEdit;
        { Storage for property EValorCusto }
        FEValorCusto : TEdit;
        { Storage for property EValorMedio }
        FEValorMedio : TEdit;
        { Storage for property Frete }
        FFrete : Double;
        { Storage for property ICMS }
        FICMS : Double;
        { Storage for property ICMSFrete }
        FICMSFrete : Double;
        { Storage for property IPI }
        FIPI : Double;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property PedidoCNC }
        FPedidoCNC : Integer;
        { Storage for property PrecoCompra }
        FPrecoCompra : Double;
        { Storage for property PrecoCusto }
        FPrecoCusto : Double;
        { Storage for property PrecoFinal }
        FPrecoFinal : Double;
        { Storage for property PrecoMedio }
        FPrecoMedio : Double;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property QuantidadeAnterior }
        FQuantidadeAnterior : Double;

      { Private methods of TCusto }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCUS }
        function GetCodigoCUS : Integer;
        { Write method for property CodigoCUS }
        procedure SetCodigoCUS(Value : Integer);
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Write method for property CodigoFOR }
        procedure SetCodigoFOR(Value : Integer);
        { Read method for property CodigoPCP }
        function GetCodigoPCP : Integer;
        { Write method for property CodigoPCP }
        procedure SetCodigoPCP(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CustoAnterior }
        function GetCustoAnterior : Double;
        { Write method for property CustoAnterior }
        procedure SetCustoAnterior(Value : Double);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property EFrete }
        function GetEFrete : TEdit;
        { Write method for property EFrete }
        procedure SetEFrete(Value : TEdit);
        { Read method for property Frete }
        function GetFrete : Double;
        { Write method for property Frete }
        procedure SetFrete(Value : Double);
        { Read method for property ICMS }
        function GetICMS : Double;
        { Write method for property ICMS }
        procedure SetICMS(Value : Double);
        { Read method for property ICMSFrete }
        function GetICMSFrete : Double;
        { Write method for property ICMSFrete }
        procedure SetICMSFrete(Value : Double);
        { Read method for property IPI }
        function GetIPI : Double;
        { Write method for property IPI }
        procedure SetIPI(Value : Double);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property PedidoCNC }
        function GetPedidoCNC : Integer;
        { Write method for property PedidoCNC }
        procedure SetPedidoCNC(Value : Integer);
        { Read method for property PrecoCompra }
        function GetPrecoCompra : Double;
        { Write method for property PrecoCompra }
        procedure SetPrecoCompra(Value : Double);
        { Read method for property PrecoCusto }
        function GetPrecoCusto : Double;
        { Write method for property PrecoCusto }
        procedure SetPrecoCusto(Value : Double);
        { Read method for property PrecoFinal }
        function GetPrecoFinal : Double;
        { Write method for property PrecoFinal }
        procedure SetPrecoFinal(Value : Double);
        { Read method for property PrecoMedio }
        function GetPrecoMedio : Double;
        { Write method for property PrecoMedio }
        procedure SetPrecoMedio(Value : Double);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property QuantidadeAnterior }
        function GetQuantidadeAnterior : Double;
        { Write method for property QuantidadeAnterior }
        procedure SetQuantidadeAnterior(Value : Double);

    protected
      { Protected fields of TCusto }

      { Protected methods of TCusto }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TCusto }

      { Public methods of TCusto }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCUS:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function Inserir(CdCUS,CdPCP,CdCNCPCP,CdPRD,CdFOR: integer;PCustoAnt,PQtdAnt,PQtd,PCompra,PFinal,PCusto,PMedio,PFrete,PICMS,PICMSFrete,PIPI:double):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Custo }
        function LocalizarCod(CdCUS:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TCusto }
        property CodigoCUS : Integer read GetCodigoCUS write SetCodigoCUS;
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        property CodigoPCP : Integer read GetCodigoPCP write SetCodigoPCP;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CustoAnterior : Double
             read GetCustoAnterior write SetCustoAnterior;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoCUS : TEdit read FECodigoCUS write FECodigoCUS;
        property ECodigoFOR : TEdit read FECodigoFOR write FECodigoFOR;
        property ECodigoPCP : TEdit read FECodigoPCP write FECodigoPCP;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECustoAnterior : TEdit
             read FECustoAnterior write FECustoAnterior;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EFrete : TEdit read GetEFrete write SetEFrete;
        property EICMS : TEdit read FEICMS write FEICMS;
        property EICMSFrete : TEdit read FEICMSFrete write FEICMSFrete;
        property EIPI : TEdit read FEIPI write FEIPI;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EPrecoFinal : TEdit read FEPrecoFinal write FEPrecoFinal;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property EQuantidadeAnterior : TEdit
             read FEQuantidadeAnterior write FEQuantidadeAnterior;
        property EValorCompra : TEdit read FEValorCompra write FEValorCompra;
        property EValorCusto : TEdit read FEValorCusto write FEValorCusto;
        property EValorMedio : TEdit read FEValorMedio write FEValorMedio;
        property Frete : Double read GetFrete write SetFrete;
        property ICMS : Double read GetICMS write SetICMS;
        property ICMSFrete : Double read GetICMSFrete write SetICMSFrete;
        property IPI : Double read GetIPI write SetIPI;
        property Observacao : String read GetObservacao write SetObservacao;
        property PedidoCNC : Integer read GetPedidoCNC write SetPedidoCNC;
        property PrecoCompra : Double read GetPrecoCompra write SetPrecoCompra;
        property PrecoCusto : Double read GetPrecoCusto write SetPrecoCusto;
        property PrecoFinal : Double read GetPrecoFinal write SetPrecoFinal;
        property PrecoMedio : Double read GetPrecoMedio write SetPrecoMedio;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property QuantidadeAnterior : Double
             read GetQuantidadeAnterior write SetQuantidadeAnterior;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCusto with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCusto]);
end;

{ Method to set variable and property values and create objects }
procedure TCusto.AutoInitialize;
begin
     FECodigoCUS := nil;
     FECodigoFOR := nil;
     FECodigoPCP := nil;
     FECodigoPRD := nil;
     FECustoAnterior := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEFrete := nil;
     FEICMS := nil;
     FEICMSFrete := nil;
     FEIPI := nil;
     FEObservacao := nil;
     FEPrecoFinal := nil;
     FEQuantidade := nil;
     FEQuantidadeAnterior := nil;
     FEValorCompra := nil;
     FEValorCusto := nil;
     FEValorMedio := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCusto.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCUS then
        FECodigoCUS := nil;
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FECodigoPCP then
        FECodigoPCP := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECustoAnterior then
        FECustoAnterior := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEFrete then
        FEFrete := nil;
     if AComponent = FEICMS then
        FEICMS := nil;
     if AComponent = FEICMSFrete then
        FEICMSFrete := nil;
     if AComponent = FEIPI then
        FEIPI := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEPrecoFinal then
        FEPrecoFinal := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FEQuantidadeAnterior then
        FEQuantidadeAnterior := nil;
     if AComponent = FEValorCompra then
        FEValorCompra := nil;
     if AComponent = FEValorCusto then
        FEValorCusto := nil;
     if AComponent = FEValorMedio then
        FEValorMedio := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCusto.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCUS }
function TCusto.GetCodigoCUS : Integer;
begin
  try
    Result := Self.fieldByName('CUS_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCUS }
procedure TCusto.SetCodigoCUS(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_CODIGO"!');
    end;
end;

{ Read method for property CodigoFOR }
function TCusto.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFOR }
procedure TCusto.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property CodigoPCP }
function TCusto.GetCodigoPCP : Integer;
begin
  try
    Result := Self.fieldByName('PCP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPCP }
procedure TCusto.SetCodigoPCP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TCusto.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TCusto.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property CustoAnterior }
function TCusto.GetCustoAnterior : Double;
begin
  try
    Result := Self.fieldByName('CUS_CUSTO_ANT').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property CustoAnterior }
procedure TCusto.SetCustoAnterior(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_CUSTO_ANT').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_CUSTO_ANT"!');
    end;
end;

{ Read method for property DataAlterado }
function TCusto.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CUS_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TCusto.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CUS_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CUS_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TCusto.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('CUS_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TCusto.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CUS_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CUS_DT_CADASTRO"!');
  end;
end;

{ Read method for property EFrete }
function TCusto.GetEFrete : TEdit;
begin
     Result := FEFrete;
end;

{ Write method for property EFrete }
procedure TCusto.SetEFrete(Value : TEdit);
begin
     FEFrete := Value;
end;

{ Read method for property Frete }
function TCusto.GetFrete : Double;
begin
  try
    Result := Self.fieldByName('CUS_FRETE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Frete }
procedure TCusto.SetFrete(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_FRETE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_FRETE"!');
    end;
end;

{ Read method for property ICMS }
function TCusto.GetICMS : Double;
begin
  try
    Result := Self.fieldByName('CUS_ICMS').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property ICMS }
procedure TCusto.SetICMS(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_ICMS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_ICMS"!');
    end;
end;

{ Read method for property ICMSFrete }
function TCusto.GetICMSFrete : Double;
begin
  try
    Result := Self.fieldByName('CUS_ICMS_FRETE').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property ICMSFrete }
procedure TCusto.SetICMSFrete(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_ICMS_FRETE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_ICMS_FRETE"!');
    end;
end;

{ Read method for property IPI }
function TCusto.GetIPI : Double;
begin
  try
    Result := Self.fieldByName('CUS_IPI').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property IPI }
procedure TCusto.SetIPI(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_IPI').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_IPI"!');
    end;
end;

{ Read method for property Observacao }
function TCusto.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('CUS_OBSERVACA').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TCusto.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_OBSERVACAO"!');
    end;
end;

{ Read method for property PedidoCNC }
function TCusto.GetPedidoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_PEDIDO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property PedidoCNC }
procedure TCusto.SetPedidoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_PEDIDO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_PEDIDO"!');
    end;
end;

{ Read method for property PrecoCompra }
function TCusto.GetPrecoCompra : Double;
begin
  try
    Result := Self.fieldByName('CUS_VALOR_COMPRA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PrecoCompra }
procedure TCusto.SetPrecoCompra(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_VALOR_COMPRA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_VALOR_COMPRA"!');
    end;
end;

{ Read method for property PrecoCusto }
function TCusto.GetPrecoCusto : Double;
begin
  try
    Result := Self.fieldByName('CUS_VALOR_CUSTO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoCusto }
procedure TCusto.SetPrecoCusto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_VALOR_CUSTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_VALOR_CUSTO"!');
    end;
end;

{ Read method for property PrecoFinal }
function TCusto.GetPrecoFinal : Double;
begin
  try
    Result := Self.fieldByName('CUS_PRECO_FINAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoFinal }
procedure TCusto.SetPrecoFinal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_PRECO_FINAL').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_PRECO_FINAL"!');
    end;
end;

{ Read method for property PrecoMedio }
function TCusto.GetPrecoMedio : Double;
begin
  try
    Result := Self.fieldByName('CUS_VALOR_MEDIO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PrecoMedio }
procedure TCusto.SetPrecoMedio(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_VALOR_MEDIO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_VALOR_MEDIO"!');
    end;
end;

{ Read method for property Quantidade }
function TCusto.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('CUS_QUANTIDADE').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Quantidade }
procedure TCusto.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_QUANTIDADE"!');
    end;
end;

{ Read method for property QuantidadeAnterior }
function TCusto.GetQuantidadeAnterior : Double;
begin
  try
    Result := Self.fieldByName('CUS_QUANTIDADE_ANT').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property QuantidadeAnterior }
procedure TCusto.SetQuantidadeAnterior(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CUS_QUANTIDADE_ANT').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CUS_QUANTIDADE_ANT"!');
    end;
end;

function TCusto.AlterarAuto:Boolean;
var
  CdCNC, CdCUS:integer;
begin
  Result:=False;
  CdCUS := CodigoCUS;
  CdCNC := CodigoCNC;
  try
    edit;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro := Trunc(StrToDateTime(EDataCadastro.Text));
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      CodigoFOR := StrToInt(ECodigoFOR.Text);
    except
    end;
    try
      CodigoPCP := StrToInt(ECodigoPCP.Text);
    except
    end;
    try
      Quantidade := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      QuantidadeAnterior := StrToFloat(EQuantidadeAnterior.Text);
    except
    end;
    try
      CustoAnterior := StrToFloat(ECustoAnterior.Text);
    except
    end;
    try
      PrecoCompra := StrToFloat(EValorCompra.Text);
    except
    end;
    try
      PrecoFinal := StrToFloat(EPrecoFinal.Text);
    except
    end;    
    try
      PrecoCusto := StrToFloat(EValorCusto.Text);
    except
    end;
    try
      PrecoMedio := StrToFloat(EValorMedio.Text);
    except
    end;
    try
      ICMS := StrToFloat(EICMS.Text);
    except
    end;
    try
      ICMSFrete := StrToFloat(EICMSFrete.Text);
    except
    end;
    try
      IPI := StrToFloat(EIPI.Text);
    except
    end;
    try
      Frete := StrToFloat(EFrete.Text);
    except
    end;
    try
      Observacao := EObservacao.Text;
    except
    end;
    try
      Post;
      Result:=True;
      GeraLog(6870, CdCNC, CdCUS);
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TCusto.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled          :=not Habilitar;
  except
  end;
  Try
    EDataCadastro.Enabled    := Habilitar;
  except
  end;
  Try
    ECodigoPRD.Enabled       := Habilitar;
  except
  end;
  Try
    ECodigoFOR.Enabled       := Habilitar;
  except
  end;
  Try
    ECodigoPCP.Enabled       := Habilitar;
  except
  end;
  Try
    EQuantidade.Enabled       := Habilitar;
  except
  end;
  Try
    EQuantidadeAnterior.Enabled       := Habilitar;
  except
  end;
  Try
    ECustoAnterior.Enabled       := Habilitar;
  except
  end;
  Try
    EValorCompra.Enabled       := Habilitar;
  except
  end;
  Try
    EPrecoFinal.Enabled        := Habilitar;
  except
  end;  
  Try
    EValorCusto.Enabled       := Habilitar;
  except
  end;
  Try
    EValorMedio.Enabled       := Habilitar;
  except
  end;
  Try
    EICMS.Enabled       := Habilitar;
  except
  end;
  Try
    EICMSFrete.Enabled       := Habilitar;
  except
  end;
  Try
    EIPI.Enabled       := Habilitar;
  except
  end;
  Try
    EFrete.Enabled       := Habilitar;
  except
  end;
  Try
    EObservacao.Enabled  := Habilitar;
  except
  end;
end;

procedure TCusto.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TCusto.CarregaDados;
begin
 try
   ECodigoCUS.Text           :=IntToStr(CodigoCUS);
 except
 end;
 try
   if DataCadastro=0 then
     EDataCadastro.Clear
   else
     EDataCadastro.Text          :=FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro);
   except
 end;
 try
   if DataAlterado=0 then
     EDataAlterado.Clear
   else
     EDataAlterado.Text          :=FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado);
 except
 end;
 try
   ECodigoPRD.Text           :=IntToStr(CodigoPRD);
 except
 end;
 try
   ECodigoFOR.Text           :=IntToStr(CodigoFOR);
 except
 end;
 try
   ECodigoPCP.Text           :=IntToStr(CodigoPCP);
 except
 end;
 try
   EQuantidade.Text           :=format('%.2f',[Quantidade]);
 except
 end;
 try
   EQuantidadeAnterior.Text           :=format('%.2f',[QuantidadeAnterior]);
 except
 end;
 try
   ECustoAnterior.Text           :=format('%.2f',[CustoAnterior]);
 except
 end;
 try
   EValorCompra.Text           :=format('%.2f',[PrecoCompra]);
 except
 end;
 try
   EPrecoFinal.Text            :=format('%.2f',[PrecoFinal]);
 except
 end; 
 try
   EValorCusto.Text           :=format('%.2f',[PrecoCusto]);
 except
 end;
 try
   EValorMedio.Text           :=format('%.2f',[PrecoMedio]);
 except
 end;
 try
   EICMS.Text           :=format('%.2f',[ICMS]);
 except
 end;
 try
   EICMSFrete.Text           :=format('%.2f',[ICMSFrete]);
 except
 end;
 try
   EIPI.Text           :=format('%.2f',[IPI]);
 except
 end;
 try
   EFrete.Text           :=format('%.2f',[Frete]);
 except
 end;
end;

constructor TCusto.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CUSTO';

     { Code to perform other tasks when the component is created }

end;

function TCusto.Deletar(CdCUS:Integer):Boolean;
var
  CdCNC: integer;
begin
  Result := False;
  If not(localizarCod(CdCUS)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      if Delete then
      Begin
        GeraLog(6880, CdCNC, CdCUS);
        Result := True;
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TCusto.Destroy;
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

function TCusto.FinalizaEdicao:Boolean;
var
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if not VerificaDataBranco(EDataCadastro.Text) then
    mensagem := mensagem + 'Data de Cadastro inválida!'+#13;
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    mensagem := mensagem + 'Código do Produto inválido!'+#13;
  if not VerificaInteiroBranco(ECodigoFOR.Text) then
    mensagem := mensagem + 'Código do Fornecedor inválido!'+#13;
  if not VerificaInteiroBranco(ECodigoPCP.Text) then
    mensagem := mensagem + 'Código do Pedido inválido!'+#13;
  if not VerificaFloatBranco(EQuantidade.Text) then
    mensagem := mensagem + 'Quantidade inválida!'+#13;
  if not VerificaFloatBranco(EQuantidadeAnterior.Text) then
    mensagem := mensagem + 'Quantidade Anterior inválida!'+#13;
  if not VerificaFloatBranco(ECustoAnterior.Text) then
    mensagem := mensagem + 'Custo Anterior inválida!'+#13;
  if not VerificaFloatBranco(EValorCompra.Text) then
    mensagem := mensagem + 'Valor de Compra inválido!'+#13;
  if not VerificaFloatBranco(EPrecoFinal.Text) then
    mensagem := mensagem + 'Preco Final inválido!'+#13;    
  if not VerificaFloatBranco(EValorCusto.Text) then
    mensagem := mensagem + 'Valor de Custo inválido!'+#13;
  if not VerificaFloatBranco(EValorMedio.Text) then
    mensagem := mensagem + 'Valor de Medio inválido!'+#13;
  if not VerificaFloatBranco(EICMS.Text) then
    mensagem := mensagem + 'Valor de ICMS inválido!'+#13;
  if not VerificaFloatBranco(EICMSFrete.Text) then
    mensagem := mensagem + 'Valor de ICMS Frete inválido!'+#13;
  if not VerificaFloatBranco(EIPI.Text) then
    mensagem := mensagem + 'Valor de IPI inválido!'+#13;
  if not VerificaFloatBranco(EFrete.Text) then
    mensagem := mensagem + 'Valor de Frete inválido!'+#13;
  If mensagem <>'' Then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    Else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        Result := True;
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
    AfterScroll:=aux;
  end;
end;

function TCusto.Inserir(CdCUS,CdPCP,CdCNCPCP,CdPRD,CdFOR: integer;PCustoAnt,PQtdAnt,PQtd,PCompra,PFinal,PCusto,PMedio,PFrete,PICMS,PICMSFrete,PIPI:double):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdCUS=0 then
    Cod    := ProximoCodigo('CUS_CODIGO')
  else
    Cod      := CdCUS;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     if Estado=3 then
     begin
       result:=true;
       exit;
     end;
     Insert;
     try
       CodigoCUS      := Cod;
       CodigoCNC      := CConfiguracao.CodigoCNC;
       CodigoUSU      := CConfiguracao.CodigoUSU;
       DataCadastro   := CConfiguracao.DataHora;
       CodigoPCP      := CdPCP;
       PedidoCNC      := CdCNCPCP;
       CodigoPRD      := CdPRD;
       CodigoFOR      := CdFOR;
       Quantidade     := PQtd;
       QuantidadeAnterior := PQtdAnt;
       CustoAnterior := PCustoAnt;
       PrecoCompra    := PCompra;
       PrecoFinal     := PFinal;       
       PrecoCusto     := PCusto;
       PrecoMedio     := PMedio;
       IPI            := PIPI;
       ICMS           := PICMS;
       ICMSFrete      := PICMSFrete;
       Frete          := PFrete;

       try
         Post;
         result := true;

       except
         Cancel;
         ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
       end;
     except
       ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TCusto.InserirAuto:Boolean;
begin
  Result := False;
  try
    append;
    try
      CodigoCUS   := SCodigo;
    except
    end;
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro := Trunc(StrToDateTime(EDataCadastro.Text));
    except
    end;
    try
      CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      CodigoFOR := StrToInt(ECodigoFOR.Text);
    except
    end;
    try
      CodigoPCP := StrToInt(ECodigoPCP.Text);
    except
    end;
    try
      Quantidade := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      QuantidadeAnterior := StrToFloat(EQuantidadeAnterior.Text);
    except
    end;
    try
      CustoAnterior := StrToFloat(ECustoAnterior.Text);
    except
    end;
    try
      PrecoCompra := StrToFloat(EValorCompra.Text);
    except
    end;
    try
      PrecoFinal  := StrToFloat(EPrecoFinal.Text);
    except
    end;    
    try
      PrecoCusto := StrToFloat(EValorCusto.Text);
    except
    end;
    try
      PrecoMedio := StrToFloat(EValorMedio.Text);
    except
    end;
    try
      ICMS := StrToFloat(EICMS.Text);
    except
    end;
    try
      ICMSFrete := StrToFloat(EICMSFrete.Text);
    except
    end;
    try
      IPI := StrToFloat(EIPI.Text);
    except
    end;
    try
      Frete := StrToFloat(EFrete.Text);
    except
    end;
    try
      Observacao := EObservacao.Text;
    except
    end;
    try
      Post;
      GeraLog(6860, CConfiguracao.CodigoCNC, sCodigo);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TCusto.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoCUS.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := '31/12/2002 00:00';
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    ECodigoPRD.Clear;
  except
  end;
  try
    ECodigoFOR.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoPCP.Clear
    else
      ECodigoPCP.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      EQuantidade.Clear
    else
      EQuantidade.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EQuantidadeAnterior.Clear
    else
      EQuantidadeAnterior.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EValorCompra.Clear
    else
      EValorCompra.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EPrecoFinal.Clear
    else
      EPrecoFinal.Text := '0,00';
  except
  end;  
  try
    if Estado <> 1 then
      EValorCusto.Clear
    else
      EValorCusto.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EValorMedio.Clear
    else
      EValorMedio.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EICMS.Clear
    else
      EICMS.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EICMSFrete.Clear
    else
      EICMSFrete.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EIPI.Clear
    else
      EIPI.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EFrete.Clear
    else
      EFrete.Text := '0,00';
  except
  end;
end;


{ Localiza um Custo }
function TCusto.LocalizarCod(CdCUS:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdCUS<>CodigoCUS) Then
    If locate('CUS_CODIGO', CdCUS, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TCusto.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TCusto.PreparaInsercao;
begin
  ProximoCodigo('CUS_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TCusto.deletarauto:Boolean;
var
  CdCNC, CdCUS: integer;
begin
  Result:=False;
  try
    CdCNC := CodigoCNC;
    CdCUS := CodigoCUS;
    if Delete then
    Begin
      GeraLog(6880, CdCNC, CdCUS);
      Result := True;
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
