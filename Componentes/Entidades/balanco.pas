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
unit Balanco;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Extctrls, 
     Variants;

type
  TBalanco = class(TSQuery)
    private
      { Private fields of TBalanco }
        { Storage for property CodigoBLC }
        FCodigoBLC : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoBLC }
        FECodigoBLC : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComboBox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property ESaldoCaixa }
        FESaldoCaixa : TEdit;
        { Storage for property ESaldoCaixaSistema }
        FESaldoCaixaSistema : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETotalAPagar }
        FETotalAPagar : TEdit;
        { Storage for property ETotalAPagarSistema }
        FETotalAPagarSistema : TEdit;
        { Storage for property ETotalAReceber }
        FETotalAReceber : TEdit;
        { Storage for property ETotalAReceberSistema }
        FETotalAReceberSistema : TEdit;
        { Storage for property ETotalIndisponivel }
        FETotalIndisponivel : TEdit;
        { Storage for property ETotalIndisponivelSistema }
        FETotalIndisponivelSistema : TEdit;
        { Storage for property ETotalPrecoCusto }
        FETotalPrecoCusto : TEdit;
        { Storage for property ETotalPrecoCustoSistema }
        FETotalPrecoCustoSistema : TEdit;
        { Storage for property ETotalVendido }
        FETotalVendido : TEdit;
        { Storage for property ETotalVendidoSistema }
        FETotalVendidoSistema : TEdit;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property SaldoCaixa }
        FSaldoCaixa : Double;
        { Storage for property SaldoCaixaSistema }
        FSaldoCaixaSistema : Double;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TotalAPagar }
        FTotalAPagar : Double;
        { Storage for property TotalAPagarSistema }
        FTotalAPagarSistema : Double;
        { Storage for property TotalAReceber }
        FTotalAReceber : Double;
        { Storage for property TotalAReceberSistema }
        FTotalAReceberSistema : Double;
        { Storage for property TotalIndisponivel }
        FTotalIndisponivel : Double;
        { Storage for property TotalIndisponivelSistema }
        FTotalIndisponivelSistema : Double;
        { Storage for property TotalPrecoCusto }
        FTotalPrecoCusto : Double;
        { Storage for property TotalPrecoCustoSistema }
        FTotalPrecoCustoSistema : Double;
        { Storage for property TotalVendido }
        FTotalVendido : Double;
        { Storage for property TotalVendidoSistema }
        FTotalVendidoSistema : Double;

      { Private methods of TBalanco }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoBLC }
        function GetCodigoBLC : Integer;
        { Write method for property CodigoBLC }
        procedure SetCodigoBLC(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property SaldoCaixa }
        function GetSaldoCaixa : Double;
        { Write method for property SaldoCaixa }
        procedure SetSaldoCaixa(Value : Double);
        { Read method for property SaldoCaixaSistema }
        function GetSaldoCaixaSistema : Double;
        { Write method for property SaldoCaixaSistema }
        procedure SetSaldoCaixaSistema(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property TotalAPagar }
        function GetTotalAPagar : Double;
        { Write method for property TotalAPagar }
        procedure SetTotalAPagar(Value : Double);
        { Read method for property TotalAPagarSistema }
        function GetTotalAPagarSistema : Double;
        { Write method for property TotalAPagarSistema }
        procedure SetTotalAPagarSistema(Value : Double);
        { Read method for property TotalAReceber }
        function GetTotalAReceber : Double;
        { Write method for property TotalAReceber }
        procedure SetTotalAReceber(Value : Double);
        { Read method for property TotalAReceberSistema }
        function GetTotalAReceberSistema : Double;
        { Write method for property TotalAReceberSistema }
        procedure SetTotalAReceberSistema(Value : Double);
        { Read method for property TotalIndisponivel }
        function GetTotalIndisponivel : Double;
        { Write method for property TotalIndisponivel }
        procedure SetTotalIndisponivel(Value : Double);
        { Read method for property TotalIndisponivelSistema }
        function GetTotalIndisponivelSistema : Double;
        { Write method for property TotalIndisponivelSistema }
        procedure SetTotalIndisponivelSistema(Value : Double);
        { Read method for property TotalPrecoCusto }
        function GetTotalPrecoCusto : Double;
        { Write method for property TotalPrecoCusto }
        procedure SetTotalPrecoCusto(Value : Double);
        { Read method for property TotalPrecoCustoSistema }
        function GetTotalPrecoCustoSistema : Double;
        { Write method for property TotalPrecoCustoSistema }
        procedure SetTotalPrecoCustoSistema(Value : Double);
        { Read method for property TotalVendido }
        function GetTotalVendido : Double;
        { Write method for property TotalVendido }
        procedure SetTotalVendido(Value : Double);
        { Read method for property TotalVendidoSistema }
        function GetTotalVendidoSistema : Double;
        { Write method for property TotalVendidoSistema }
        procedure SetTotalVendidoSistema(Value : Double);

    protected
      { Protected fields of TBalanco }

      { Protected methods of TBalanco }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TBalanco }

      { Public methods of TBalanco }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CDBLC:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Produto }
        function LocalizarCod(CdBLC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TBalanco }
        property CodigoBLC : Integer read GetCodigoBLC write SetCodigoBLC;
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoBLC : TEdit read FECodigoBLC write FECodigoBLC;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoFUN : TDBLookupComboBox
             read FECodigoFUN write FECodigoFUN;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property ESaldoCaixa : TEdit read FESaldoCaixa write FESaldoCaixa;
        property ESaldoCaixaSistema : TEdit
             read FESaldoCaixaSistema write FESaldoCaixaSistema;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETotalAPagar : TEdit read FETotalAPagar write FETotalAPagar;
        property ETotalAPagarSistema : TEdit
             read FETotalAPagarSistema write FETotalAPagarSistema;
        property ETotalAReceber : TEdit
             read FETotalAReceber write FETotalAReceber;
        property ETotalAReceberSistema : TEdit
             read FETotalAReceberSistema write FETotalAReceberSistema;
        property ETotalIndisponivel : TEdit
             read FETotalIndisponivel write FETotalIndisponivel;
        property ETotalIndisponivelSistema : TEdit
             read FETotalIndisponivelSistema write FETotalIndisponivelSistema;
        property ETotalPrecoCusto : TEdit
             read FETotalPrecoCusto write FETotalPrecoCusto;
        property ETotalPrecoCustoSistema : TEdit
             read FETotalPrecoCustoSistema write FETotalPrecoCustoSistema;
        property ETotalVendido : TEdit
             read FETotalVendido write FETotalVendido;
        property ETotalVendidoSistema : TEdit
             read FETotalVendidoSistema write FETotalVendidoSistema;
        property Observacao : String read GetObservacao write SetObservacao;
        property SaldoCaixa : Double read GetSaldoCaixa write SetSaldoCaixa;
        property SaldoCaixaSistema : Double
             read GetSaldoCaixaSistema write SetSaldoCaixaSistema;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property TotalAPagar : Double read GetTotalAPagar write SetTotalAPagar;
        property TotalAPagarSistema : Double
             read GetTotalAPagarSistema write SetTotalAPagarSistema;
        property TotalAReceber : Double
             read GetTotalAReceber write SetTotalAReceber;
        property TotalAReceberSistema : Double
             read GetTotalAReceberSistema write SetTotalAReceberSistema;
        property TotalIndisponivel : Double
             read GetTotalIndisponivel write SetTotalIndisponivel;
        property TotalIndisponivelSistema : Double
             read GetTotalIndisponivelSistema write SetTotalIndisponivelSistema;
        property TotalPrecoCusto : Double
             read GetTotalPrecoCusto write SetTotalPrecoCusto;
        property TotalPrecoCustoSistema : Double
             read GetTotalPrecoCustoSistema write SetTotalPrecoCustoSistema;
        property TotalVendido : Double
             read GetTotalVendido write SetTotalVendido;
        property TotalVendidoSistema : Double
             read GetTotalVendidoSistema write SetTotalVendidoSistema;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TBalanco with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TBalanco]);
end;

{ Method to set variable and property values and create objects }
procedure TBalanco.AutoInitialize;
begin
     FECodigoBLC := nil;
     FECodigoCNC := nil;
     FECodigoFUN := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEObservacao := nil;
     FESaldoCaixa := nil;
     FESaldoCaixaSistema := nil;
     FESituacao := nil;
     FETotalAPagar := nil;
     FETotalAPagarSistema := nil;
     FETotalAReceber := nil;
     FETotalAReceberSistema := nil;
     FETotalIndisponivel := nil;
     FETotalIndisponivelSistema := nil;
     FETotalPrecoCusto := nil;
     FETotalPrecoCustoSistema := nil;
     FETotalVendido := nil;
     FETotalVendidoSistema := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TBalanco.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoBLC then
        FECodigoBLC := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FESaldoCaixa then
        FESaldoCaixa := nil;
     if AComponent = FESaldoCaixaSistema then
        FESaldoCaixaSistema := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETotalAPagar then
        FETotalAPagar := nil;
     if AComponent = FETotalAPagarSistema then
        FETotalAPagarSistema := nil;
     if AComponent = FETotalAReceber then
        FETotalAReceber := nil;
     if AComponent = FETotalAReceberSistema then
        FETotalAReceberSistema := nil;
     if AComponent = FETotalIndisponivel then
        FETotalIndisponivel := nil;
     if AComponent = FETotalIndisponivelSistema then
        FETotalIndisponivelSistema := nil;
     if AComponent = FETotalPrecoCusto then
        FETotalPrecoCusto := nil;
     if AComponent = FETotalPrecoCustoSistema then
        FETotalPrecoCustoSistema := nil;
     if AComponent = FETotalVendido then
        FETotalVendido := nil;
     if AComponent = FETotalVendidoSistema then
        FETotalVendidoSistema := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TBalanco.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoBLC }
function TBalanco.GetCodigoBLC : Integer;
begin
  try
    Result := Self.fieldByName('BLC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoBLC }
procedure TBalanco.SetCodigoBLC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TBalanco.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_RESPONSAVEL').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFUN }
procedure TBalanco.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_RESPONSAVEL').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_RESPONSAVEL"!');
    end;
end;


{ Read method for property DataAlterado }
function TBalanco.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('BLC_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TBalanco.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BLC_DT_ALTERADO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BLC_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TBalanco.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('BLC_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TBalanco.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BLC_DT_CADASTRO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BLC_DT_CADASTRO"!');
  end;
end;

{ Read method for property Observacao }
function TBalanco.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('BLC_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TBalanco.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BLC_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BLC_OBSERVACAO"!');
  end;
end;

{ Read method for property SaldoCaixa }
function TBalanco.GetSaldoCaixa : Double;
begin
  try
    Result := Self.fieldByName('BLC_SALDO_CAIXA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property SaldoCaixa }
procedure TBalanco.SetSaldoCaixa(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_SALDO_CAIXA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_SALDO_CAIXA"!');
    end;
end;

{ Read method for property SaldoCaixaSistema }
function TBalanco.GetSaldoCaixaSistema : Double;
begin
  try
    Result := Self.fieldByName('BLC_SALDO_CAIXA_SIS').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property SaldoCaixaSistema }
procedure TBalanco.SetSaldoCaixaSistema(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_SALDO_CAIXA_SIS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_SALDO_CAIXA_SIS"!');
    end;
end;

{ Read method for property Situacao }
function TBalanco.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('BLC_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TBalanco.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_SITUACAO"!');
    end;
end;

{ Read method for property TotalAPagar }
function TBalanco.GetTotalAPagar : Double;
begin
  try
    Result := Self.fieldByName('BLC_A_PAGAR').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TotalAPagar }
procedure TBalanco.SetTotalAPagar(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_A_PAGAR').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_A_PAGAR"!');
    end;
end;

{ Read method for property TotalAPagarSistema }
function TBalanco.GetTotalAPagarSistema : Double;
begin
  try
    Result := Self.fieldByName('BLC_A_PAGAR_SIS').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TotalAPagarSistema }
procedure TBalanco.SetTotalAPagarSistema(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_A_PAGAR_SIS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_A_PAGAR_SIS"!');
    end;
end;

{ Read method for property TotalAReceber }
function TBalanco.GetTotalAReceber : Double;
begin
  try
    Result := Self.fieldByName('BLC_A_RECEBER').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TotalAReceber }
procedure TBalanco.SetTotalAReceber(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_A_RECEBER').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_A_RECEBER"!');
    end;
end;


{ Read method for property TotalAReceberSistema }
function TBalanco.GetTotalAReceberSistema : Double;
begin
     Result := FTotalAReceberSistema;
end;

{ Write method for property TotalAReceberSistema }
procedure TBalanco.SetTotalAReceberSistema(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BLC_A_RECEBER_SIS').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BLC_A_RECEBER_SIS"!');
  end;
end;

{ Read method for property TotalIndisponivel }
function TBalanco.GetTotalIndisponivel : Double;
begin
  try
    Result := Self.fieldByName('BLC_TOTAL_INDISPONIVEL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TotalIndisponivel }
procedure TBalanco.SetTotalIndisponivel(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BLC_TOTAL_INDISPONIVEL').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BLC_TOTAL_INDISPONIVEL"!');
  end;
end;

{ Read method for property TotalIndisponivelSistema }
function TBalanco.GetTotalIndisponivelSistema : Double;
begin
  try
    Result := Self.fieldByName('BLC_TOTAL_INDISPONIVEL').asFloat;
  except
    result:= 0;
  end;
end;


{ Write method for property TotalIndisponivelSistema }
procedure TBalanco.SetTotalIndisponivelSistema(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BLC_TOTAL_INDISPONIVEL').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BLC_TOTAL_INDISPONIVEL"!');
  end;
end;

{ Read method for property TotalPrecoCusto }
function TBalanco.GetTotalPrecoCusto : Double;
begin
  try
    Result := Self.fieldByName('BLC_TOTAL_PR_CUSTO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TotalPrecoCusto }
procedure TBalanco.SetTotalPrecoCusto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_TOTAL_PR_CUSTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_TOTAL_PR_CUSTO"!');
    end;
end;

{ Read method for property TotalPrecoCustoSistema }
function TBalanco.GetTotalPrecoCustoSistema : Double;
 begin
  try
    Result := Self.fieldByName('BLC_TOTAL_PR_CUSTO_SIS').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TotalPrecoCustoSistema }
procedure TBalanco.SetTotalPrecoCustoSistema(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_TOTAL_PR_CUSTO_SIS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_TOTAL_PR_CUSTO_SIS"!');
    end;
end;

{ Read method for property TotalVendido }
function TBalanco.GetTotalVendido : Double;
begin
  try
    Result := Self.fieldByName('BLC_TOTAL_VENDIDO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TotalVendido }
procedure TBalanco.SetTotalVendido(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_TOTAL_VENDIDO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_TOTAL_VENDIDO"!');
    end;
end;

{ Read method for property TotalVendidoSistema }
function TBalanco.GetTotalVendidoSistema : Double;
begin
  try
    Result := Self.fieldByName('BLC_TOTAL_VENDIDO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TotalVendidoSistema }
procedure TBalanco.SetTotalVendidoSistema(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLC_TOTAL_VENDIDO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLC_TOTAL_VENDIDO"!');
    end;
end;

function TBalanco.AlterarAuto:Boolean;
begin
  Result := False;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE BALANCO SET '+
       ' USU_CODIGO='                 +IntToStr(CConfiguracao.CodigoUSU)+
       ',CNC_CODIGO='                 +IntToStr(ECodigoCNC.KeyValue)+
       ',BLC_DT_ALTERADO="'           +MesDiaHora(CConfiguracao.DataHora)+'" '+
       ',FUN_RESPONSAVEL='            +IntToStr(ECodigoFUN.KeyValue)+
       ',BLC_TOTAL_PR_CUSTO='         +VirgPonto(ETotalPrecoCusto.Text)+
       ',BLC_TOTAL_PR_CUSTO_SIS='     +VirgPonto(ETotalPrecoCustoSistema.Text)+
       ',BLC_TOTAL_VENDIDO='          +VirgPonto(ETotalVendido.Text)+
       ',BLC_TOTAL_VENDIDO_SIS='      +VirgPonto(ETotalVendidoSistema.Text)+
       ',BLC_TOTAL_INDISPONIVEL='     +VirgPonto(ETotalIndisponivel.Text)+
       ',BLC_TOTAL_INDISPONIVEL_SIS=' +VirgPonto(ETotalIndisponivelSistema.Text)+
       ',BLC_A_RECEBER='              +VirgPonto(ETotalAReceber.Text)+
       ',BLC_A_RECEBER_SIS='          +VirgPonto(ETotalAReceberSistema.Text)+
       ',BLC_A_PAGAR='                +VirgPonto(ETotalAPagar.Text)+
       ',BLC_A_PAGAR_SIS='            +VirgPonto(ETotalAPagarSistema.Text)+
       ',BLC_SALDO_CAIXA='            +VirgPonto(ESaldoCaixa.Text)+
       ',BLC_SALDO_CAIXA_SIS='        +VirgPonto(ESaldoCaixaSistema.Text)+
       ',BLC_SITUACAO='               +IntToStr(ESituacao.ItemIndex)+
       ',BLC_OBSERVACAO="'            +EObservacao.Text+'" '+
       ' WHERE BLC_CODIGO='+ECodigoBLC.Text+
       ' AND CNC_CODIGO='+IntToStr(CConfiguracao.CodigoCNC));
    Result := True;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TBalanco.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled                   := not Habilitar;
  except
  end;
  try
    ECodigoCNC.Enabled                := Habilitar;
  except
  end;
  try
    ECodigoFUN.Enabled                := Habilitar;
  except
  end;
  try
    ETotalPrecoCusto.Enabled          := Habilitar;
  except
  end;
  try
//    ETotalPrecoCustoSistema.Enabled   := Habilitar;
  except
  end;
  try
    ETotalVendido.Enabled             := Habilitar;
  except
  end;
  try
//    ETotalVendidoSistema.Enabled      := Habilitar;
  except
  end;
  try
    ETotalIndisponivel.Enabled        := Habilitar;
  except
  end;
  try
//    ETotalIndisponivelSistema.Enabled := Habilitar;
  except
  end;
  try
    ETotalAReceber.Enabled            := Habilitar;
  except
  end;
  try
//    ETotalAReceberSistema.Enabled     := Habilitar;
  except
  end;
  try
    ETotalAPagar.Enabled              := Habilitar;
  except
  end;
  try
//    ETotalAPagarSistema.Enabled       := Habilitar;
  except
  end;
  try
    ESaldoCaixa.Enabled               := Habilitar;
  except
  end;
  try
//    ESaldoCaixaSistema.Enabled        := Habilitar;
  except
  end;
  try
    ESituacao.Enabled                 := Habilitar;
  except
  end;
  try
    EObservacao.Enabled               := Habilitar;
  except
  end;
end;



procedure TBalanco.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TBalanco.CarregaDados;
begin
  Try
    ECodigoBLC.Text                := IntToStr(CodigoBLC);
  Except
  End;
  Try
    if DataCadastro=0 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text           := FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro);
  Except
  End;
  Try
    if DataAlterado=0 then
      EDataAlterado.Clear
    else
      EDataAlterado.Text           := FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado);
  Except
  End;
  Try
    ECodigoFUN.KeyValue            := CodigoFUN;
  Except
  End;
  Try
    ETotalPrecoCusto.Text          := Format('%.2f',[TotalPrecoCusto]);
  Except
  End;
  Try
    ETotalPrecoCustoSistema.Text   := Format('%.2f',[TotalPrecoCustoSistema]);
  Except
  End;
  Try
    ETotalVendido.Text             := Format('%.2f',[TotalVendido]);
  Except
  End;
  Try
    ETotalVendidoSistema.Text      := Format('%.2f',[TotalVendidoSistema]);
  Except
  End;
  Try
    ETotalIndisponivel.Text        := Format('%.2f',[TotalIndisponivel]);
  Except
  End;
  Try
    ETotalIndisponivelSistema.Text := Format('%.2f',[TotalIndisponivelSistema]);
  Except
  End;
  Try
    ETotalAReceber.Text            := Format('%.2f',[TotalAReceber]);
  Except
  End;
  Try
    ETotalAReceberSistema.Text     := Format('%.2f',[TotalAReceberSistema]);
  Except
  End;
  Try
    ETotalAPagar.Text              := Format('%.2f',[TotalAPagar]);
  Except
  End;
  Try
    ETotalAPagarSistema.Text       := Format('%.2f',[TotalAPagarSistema]);
  Except
  End;
  Try
    ESaldoCaixa.Text               := Format('%.2f',[SaldoCaixa]);
  Except
  End;
  Try
    ESaldoCaixaSistema.Text        := Format('%.2f',[SaldoCaixaSistema]);
  Except
  End;
  Try
    ESituacao.ItemIndex            := Situacao;
  Except
  End;
  Try
    EObservacao.Text               := Observacao;
  Except
  End;
end;

constructor TBalanco.Create(AOwner: TComponent);
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

function TBalanco.Deletar(CdCNC,CDBLC:Integer):Boolean;
begin
  Result := False;
  If not localizarCod(CdBLC) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TBalanco.Destroy;
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

function TBalanco.FinalizaEdicao:Boolean;
var
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if ECodigoCNC.Text = '' then
    mensagem:= mensagem + 'Centro de Custo inválido!'+#13;
  if ECodigoFUN.Text = '' then
    mensagem:= mensagem + 'Responsável inválido!'+#13;
  if not verificafloatBranco(ETotalPrecoCusto.text) then
    mensagem:= mensagem + 'Total Preço de Custo digitado incorretamente!'+#13;
  if not verificafloatBranco(ETotalPrecoCustoSistema.text) then
    mensagem:= mensagem + 'Total Preço de Custo Sistema digitado incorretamente!'+#13;
  if not verificafloatBranco(ETotalVendido.text) then
    mensagem:= mensagem + 'Total Vendido digitado incorretamente!'+#13;
  if not verificafloatBranco(ETotalVendidoSistema.text) then
    mensagem:= mensagem + 'Total Vendido Sistema digitado incorretamente!'+#13;
  if not verificafloatBranco(ETotalIndisponivel.text) then
    mensagem:= mensagem + 'Total Indisponível digitado incorretamente!'+#13;
  if not verificafloatBranco(ETotalIndisponivelSistema.text) then
    mensagem:= mensagem + 'Total Indisponível Sistema digitado incorretamente!'+#13;
  if not verificafloatBranco(ETotalAReceber.text) then
    mensagem:= mensagem + 'Total A Receber digitado incorretamente!'+#13;
  if not verificafloatBranco(ETotalAReceberSistema.text) then
    mensagem:= mensagem + 'Total A Receber Sistema digitado incorretamente!'+#13;
  if not verificafloatBranco(ETotalAPagar.text) then
    mensagem:= mensagem + 'Total A Pagar digitado incorretamente!'+#13;
  if not verificafloatBranco(ETotalAPagarSistema.text) then
    mensagem:= mensagem + 'Total A Pagar Sistema digitado incorretamente!'+#13;
  if not verificafloatBranco(ESaldoCaixa.text) then
    mensagem:= mensagem + 'Saldo de Caixa digitado incorretamente!'+#13;
  if not verificafloatBranco(ESaldoCaixaSistema.text) then
    mensagem:= mensagem + 'Saldo de Caixa Sistema digitado incorretamente!'+#13;
  If mensagem <>'' Then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
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
    AfterScroll:=Aux;
  end;
end;

function TBalanco.InserirAuto:Boolean;
begin
  Result := False;
  if LocalizarCod(StrToInt(ECodigoBLC.Text)) then
    ShowMessage('Código de Balanço já Cadastrado!')
  else
  Begin
    try
      append;
      try
        CodigoBLC                := SCodigo;
      except
      end;
      try
        CodigoUSU                := CConfiguracao.CodigoUSU;
      except
      end;
      try
        CodigoCNC                := ECodigoCNC.KeyValue;
      except
      end;
      try
        DataCadastro             := CConfiguracao.DataHora;
      except
      end;
      try
        CodigoFUN                := ECodigoFUN.KeyValue;
      except
      end;
      try
        TotalPrecoCusto          := StrToFloat(ETotalPrecoCusto.Text);
      except
      end;
      try
        TotalPrecoCustoSistema   := StrToFloat(ETotalPrecoCustoSistema.Text);
      except
      end;
      try
        TotalVendido             := StrToFloat(ETotalVendido.Text);
      except
      end;
      try
        TotalVendidoSistema      := StrToFloat(ETotalVendidoSistema.Text);
      except
      end;
      try
        TotalIndisponivel        := StrToFloat(ETotalIndisponivel.Text);
      except
      end;
      try
        TotalIndisponivelSistema := StrToFloat(ETotalIndisponivelSistema.Text);
      except
      end;
      try
        TotalAReceber            := StrToFloat(ETotalAReceber.Text);
      except
      end;
      try
        TotalAReceberSistema     := StrToFloat(ETotalAReceberSistema.Text);
      except
      end;
      try
        TotalAPagar              := StrToFloat(ETotalAPagar.Text);
      except
      end;
      try
        TotalAPagarSistema       := StrToFloat(ETotalAPagarSistema.Text);
      except
      end;
      try
        SaldoCaixa               := StrToFloat(ESaldoCaixa.Text);
      except
      end;
      try
        SaldoCaixaSistema        := StrToFloat(ESaldoCaixaSistema.Text);
      except
      end;
      try
        Situacao                 := ESituacao.ItemIndex;
      except
      end;
      try
        Observacao               := EObservacao.Text;
      except
      end;
      try
        Post;
        result:=True;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

procedure TBalanco.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoBLC.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatdateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  Except
  End;
  Try
    EDataAlterado.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoCNC.KeyValue := -1
    else
      ECodigoCNC.KeyValue := CConfiguracao.CodigoCNC;
  Except
  End;
  Try
    ECodigoFUN.KeyValue := -1;
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalPrecoCusto.Clear
    else
      ETotalPrecoCusto.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalPrecoCustoSistema.Clear
    else
      ETotalPrecoCustoSistema.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalVendido.Clear
    else
      ETotalVendido.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalVendidoSistema.Clear
    else
      ETotalVendidoSistema.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalIndisponivel.Clear
    else
      ETotalIndisponivel.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalIndisponivelSistema.Clear
    else
      ETotalIndisponivelSistema.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalAReceber.Clear
    else
      ETotalAReceber.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalAReceberSistema.Clear
    else
      ETotalAReceberSistema.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalAPagar.Clear
    else
      ETotalAPagar.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalAPagarSistema.Clear
    else
      ETotalAPagarSistema.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ESaldoCaixa.Clear
    else
      ESaldoCaixa.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ESaldoCaixaSistema.Clear
    else
      ESaldoCaixaSistema.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 0;
  Except
  End;
  Try
    EObservacao.Clear;
  Except
  End;
end;

{ Localiza um Produto }
function TBalanco.LocalizarCod(CdBLC:Integer):Boolean;
begin
  If CdBLC<>CodigoBLC Then
  Begin
    If locate('BLC_CODIGO', CdBLC, []) Then
      Result:=True
    else
      Result:=False
  End
  Else
    Result:=True;
end;

procedure TBalanco.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TBalanco.PreparaInsercao;
begin
  ProximoCodigo('BLC_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TBalanco.deletarauto:Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      result:=true;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
