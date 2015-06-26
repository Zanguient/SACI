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
unit AssistenciaTecnica;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Variants, Funcoes;

type
  TAssistenciaTecnica = class(TSQuery)
    private
      { Private fields of TAssistenciaTecnica }
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodigoAST }
        FCodigoAST : Integer;
        { Storage for property CodigoAUT }
        FCodigoAUT : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataAssistenciaEnviado }
        FDataAssistenciaEnviado : TDateTime;
        { Storage for property DataAssistenciaRetornado }
        FDataAssistenciaRetornado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataDepositoDevolvido }
        FDataDepositoDevolvido : TDateTime;
        { Storage for property DataDepositoEnviado }
        FDataDepositoEnviado : TDateTime;
        { Storage for property DataDepositoRecebido }
        FDataDepositoRecebido : TDateTime;
        { Storage for property DataEntrega }
        FDataEntrega : TDateTime;
        { Storage for property DataLojaRecebido }
        FDataLojaRecebido : TDateTime;
        { Storage for property DataPrevisao }
        FDataPrevisao : TDateTime;
        { Storage for property Defeito }
        FDefeito : String;
        { Storage for property EClienteCNC }
        FEClienteCNC : TEdit;
        { Storage for property ECodigoAST }
        FECodigoAST : TEdit;
        { Storage for property ECodigoAUT }
        FECodigoAUT : TEdit;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataAssistenciaEnviado }
        FEDataAssistenciaEnviado : TMaskEdit;
        { Storage for property EDataAssistenciaRetornado }
        FEDataAssistenciaRetornado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataDepositoDevolvido }
        FEDataDepositoDevolvido : TMaskEdit;
        { Storage for property EDataDepositoEnviado }
        FEDataDepositoEnviado : TMaskEdit;
        { Storage for property EDataDepositoRecebido }
        FEDataDepositoRecebido : TMaskEdit;
        { Storage for property EDataEntrega }
        FEDataEntrega : TMaskEdit;
        { Storage for property EDataLojaRecebido }
        FEDataLojaRecebido : TMaskEdit;
        { Storage for property EDataPrevisao }
        FEDataPrevisao : TMaskEdit;
        { Storage for property EDefeito }
        FEDefeito : TEdit;
        { Storage for property EEstadoProduto }
        FEEstadoProduto : TEdit;
        { Storage for property ENumeroSerie }
        FENumeroSerie : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EPedidoCNC }
        FEPedidoCNC : TEdit;
        { Storage for property ERetorno }
        FERetorno : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property EstadoProduto }
        FEstadoProduto : String;
        { Storage for property NumeroSerie }
        FNumeroSerie : String;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property PedidoCNC }
        FPedidoCNC : Integer;
        { Storage for property Retorno }
        FRetorno : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TAssistenciaTecnica }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Read method for property CodigoAST }
        function GetCodigoAST : Integer;
        { Read method for property CodigoAUT }
        function GetCodigoAUT : Integer;
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataAssistenciaEnviado }
        function GetDataAssistenciaEnviado : TDateTime;
        { Read method for property DataAssistenciaRetornado }
        function GetDataAssistenciaRetornado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property DataDepositoDevolvido }
        function GetDataDepositoDevolvido : TDateTime;
        { Read method for property DataDepositoEnviado }
        function GetDataDepositoEnviado : TDateTime;
        { Read method for property DataDepositoRecebido }
        function GetDataDepositoRecebido : TDateTime;
        { Read method for property DataEntrega }
        function GetDataEntrega : TDateTime;
        { Read method for property DataLojaRecebido }
        function GetDataLojaRecebido : TDateTime;
        { Read method for property DataPrevisao }
        function GetDataPrevisao : TDateTime;
        { Read method for property Defeito }
        function GetDefeito : String;
        { Read method for property EstadoProduto }
        function GetEstadoProduto : String;
        { Read method for property NumeroSerie }
        function GetNumeroSerie : String;
        { Read method for property Observacao }
        function GetObservacao : String;
        { Read method for property PedidoCNC }
        function GetPedidoCNC : Integer;
        { Read method for property Retorno }
        function GetRetorno : Integer;
        { Read method for property Situacao }
        function GetSituacao : Integer;

    protected
      { Protected fields of TAssistenciaTecnica }

      { Protected methods of TAssistenciaTecnica }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TAssistenciaTecnica }

      { Public methods of TAssistenciaTecnica }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function LocalizarCod(CdAST,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TAssistenciaTecnica }
        property ClienteCNC : Integer read GetClienteCNC write FClienteCNC;
        { Código da Assistência Técnica }
        property CodigoAST : Integer read GetCodigoAST write FCodigoAST;
        property CodigoAUT : Integer read GetCodigoAUT write FCodigoAUT;
        property CodigoCLI : Integer read GetCodigoCLI write FCodigoCLI;
        property CodigoPDV : Integer read GetCodigoPDV write FCodigoPDV;
        property CodigoPRD : Integer read GetCodigoPRD write FCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataAssistenciaEnviado : TDateTime
             read GetDataAssistenciaEnviado write FDataAssistenciaEnviado;
        property DataAssistenciaRetornado : TDateTime
             read GetDataAssistenciaRetornado write FDataAssistenciaRetornado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property DataDepositoDevolvido : TDateTime
             read GetDataDepositoDevolvido write FDataDepositoDevolvido;
        property DataDepositoEnviado : TDateTime
             read GetDataDepositoEnviado write FDataDepositoEnviado;
        property DataDepositoRecebido : TDateTime
             read GetDataDepositoRecebido write FDataDepositoRecebido;
        property DataEntrega : TDateTime
             read GetDataEntrega write FDataEntrega;
        property DataLojaRecebido : TDateTime
             read GetDataLojaRecebido write FDataLojaRecebido;
        property DataPrevisao : TDateTime
             read GetDataPrevisao write FDataPrevisao;
        property Defeito : String read GetDefeito write FDefeito;
        property EClienteCNC : TEdit read FEClienteCNC write FEClienteCNC;
        property ECodigoAST : TEdit read FECodigoAST write FECodigoAST;
        property ECodigoAUT : TEdit read FECodigoAUT write FECodigoAUT;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataAssistenciaEnviado : TMaskEdit
             read FEDataAssistenciaEnviado write FEDataAssistenciaEnviado;
        property EDataAssistenciaRetornado : TMaskEdit
             read FEDataAssistenciaRetornado write FEDataAssistenciaRetornado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataDepositoDevolvido : TMaskEdit
             read FEDataDepositoDevolvido write FEDataDepositoDevolvido;
        property EDataDepositoEnviado : TMaskEdit
             read FEDataDepositoEnviado write FEDataDepositoEnviado;
        property EDataDepositoRecebido : TMaskEdit
             read FEDataDepositoRecebido write FEDataDepositoRecebido;
        property EDataEntrega : TMaskEdit
             read FEDataEntrega write FEDataEntrega;
        property EDataLojaRecebido : TMaskEdit
             read FEDataLojaRecebido write FEDataLojaRecebido;
        property EDataPrevisao : TMaskEdit
             read FEDataPrevisao write FEDataPrevisao;
        property EDefeito : TEdit read FEDefeito write FEDefeito;
        property EEstadoProduto : TEdit
             read FEEstadoProduto write FEEstadoProduto;
        property ENumeroSerie : TEdit read FENumeroSerie write FENumeroSerie;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EPedidoCNC : TEdit read FEPedidoCNC write FEPedidoCNC;
        property ERetorno : TEdit read FERetorno write FERetorno;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property EstadoProduto : String
             read GetEstadoProduto write FEstadoProduto;
        property NumeroSerie : String read GetNumeroSerie write FNumeroSerie;
        property Observacao : String read GetObservacao write FObservacao;
        property PedidoCNC : Integer read GetPedidoCNC write FPedidoCNC;
        property Retorno : Integer read GetRetorno write FRetorno;
        property Situacao : Integer read GetSituacao write FSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TAssistenciaTecnica with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TAssistenciaTecnica]);
end;

{ Method to set variable and property values and create objects }
procedure TAssistenciaTecnica.AutoInitialize;
begin
     FEClienteCNC := nil;
     FECodigoAST := nil;
     FECodigoAUT := nil;
     FECodigoCLI := nil;
     FECodigoCNC := nil;
     FECodigoPDV := nil;
     FECodigoPRD := nil;
     FEDataAlterado := nil;
     FEDataAssistenciaEnviado := nil;
     FEDataAssistenciaRetornado := nil;
     FEDataCadastro := nil;
     FEDataDepositoDevolvido := nil;
     FEDataDepositoEnviado := nil;
     FEDataDepositoRecebido := nil;
     FEDataEntrega := nil;
     FEDataLojaRecebido := nil;
     FEDataPrevisao := nil;
     FEDefeito := nil;
     FEEstadoProduto := nil;
     FENumeroSerie := nil;
     FEObservacao := nil;
     FEPedidoCNC := nil;
     FERetorno := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TAssistenciaTecnica.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodigoAST then
        FECodigoAST := nil;
     if AComponent = FECodigoAUT then
        FECodigoAUT := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataAssistenciaEnviado then
        FEDataAssistenciaEnviado := nil;
     if AComponent = FEDataAssistenciaRetornado then
        FEDataAssistenciaRetornado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataDepositoDevolvido then
        FEDataDepositoDevolvido := nil;
     if AComponent = FEDataDepositoEnviado then
        FEDataDepositoEnviado := nil;
     if AComponent = FEDataDepositoRecebido then
        FEDataDepositoRecebido := nil;
     if AComponent = FEDataEntrega then
        FEDataEntrega := nil;
     if AComponent = FEDataLojaRecebido then
        FEDataLojaRecebido := nil;
     if AComponent = FEDataPrevisao then
        FEDataPrevisao := nil;
     if AComponent = FEDefeito then
        FEDefeito := nil;
     if AComponent = FEEstadoProduto then
        FEEstadoProduto := nil;
     if AComponent = FENumeroSerie then
        FENumeroSerie := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEPedidoCNC then
        FEPedidoCNC := nil;
     if AComponent = FERetorno then
        FERetorno := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TAssistenciaTecnica.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ClienteCNC }
function TAssistenciaTecnica.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoAST }
function TAssistenciaTecnica.GetCodigoAST : Integer;
begin
  try
    Result := Self.fieldByName('AST_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoAUT }
function TAssistenciaTecnica.GetCodigoAUT : Integer;
begin
  try
    Result := Self.fieldByName('AUT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCLI }
function TAssistenciaTecnica.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoPDV }
function TAssistenciaTecnica.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoPRD }
function TAssistenciaTecnica.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property DataAlterado }
function TAssistenciaTecnica.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('AST_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataAssistenciaEnviado }
function TAssistenciaTecnica.GetDataAssistenciaEnviado : TDateTime;
begin
  try
    Result := Self.fieldByName('AST_DT_ASSISTENCIA_ENVIADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataAssistenciaRetornado }
function TAssistenciaTecnica.GetDataAssistenciaRetornado : TDateTime;
begin
  try
    Result := Self.fieldByName('AST_DT_ASSISTENCIA_RETORNADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataCadastro }
function TAssistenciaTecnica.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('AST_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataDepositoDevolvido }
function TAssistenciaTecnica.GetDataDepositoDevolvido : TDateTime;
begin
  try
    Result := Self.fieldByName('AST_DT_DEPOSITO_DEVOLVIDO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataDepositoEnviado }
function TAssistenciaTecnica.GetDataDepositoEnviado : TDateTime;
begin
  try
    Result := Self.fieldByName('AST_DT_DEPOSITO_ENVIADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataDepositoRecebido }
function TAssistenciaTecnica.GetDataDepositoRecebido : TDateTime;
begin
  try
    Result := Self.fieldByName('AST_DT_DEPOSITO_RECEBIDO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataEntrega }
function TAssistenciaTecnica.GetDataEntrega : TDateTime;
begin
  try
    Result := Self.fieldByName('AST_DT_ENTREGA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataLojaRecebido }
function TAssistenciaTecnica.GetDataLojaRecebido : TDateTime;
begin
  try
    Result := Self.fieldByName('AST_DT_LOJA_RECEBIDO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataPrevisao }
function TAssistenciaTecnica.GetDataPrevisao : TDateTime;
begin
  try
    Result := Self.fieldByName('AST_DT_PREVISAO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property Defeito }
function TAssistenciaTecnica.GetDefeito : String;
begin
  try
    Result := Self.fieldByName('AST_DEFEITO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property EstadoProduto }
function TAssistenciaTecnica.GetEstadoProduto : String;
begin
  try
    Result := Self.fieldByName('AST_ESTADO_PRODUTO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property NumeroSerie }
function TAssistenciaTecnica.GetNumeroSerie : String;
begin
  try
    Result := Self.fieldByName('AST_NUMERO_SERIE').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Observacao }
function TAssistenciaTecnica.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('AST_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property PedidoCNC }
function TAssistenciaTecnica.GetPedidoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_PEDIDO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Retorno }
function TAssistenciaTecnica.GetRetorno : Integer;
begin
  try
    Result := Self.fieldByName('AST_RETORNO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Situacao }
function TAssistenciaTecnica.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('AST_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

function TAssistenciaTecnica.AlterarAuto:Boolean;
var
  CdCNC, CdAST: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdAST := CodigoAST;

    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE ASSISTENCIA_TECNICA SET '+
      ' USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',CNC_PEDIDO='+EPedidoCNC.Text+
      ',PDV_CODIGO='+ECodigoPDV.Text+
      ',CNC_CLIENTE='+EClienteCNC.Text+
      ',CLI_CODIGO='+ECodigoCLI.Text+
      ',PRD_CODIGO='+ECodigoPRD.Text+
      ',AUT_CODIGO='+ECodigoAUT.Text+
      ',AST_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',AST_DT_PREVISAO="'+MesDiaHora(EDataPrevisao.Text)+'" '+
      ',AST_NUMERO_SERIE="'+ENumeroSerie.Text+'" '+
      ',AST_ESTADO_PRODUTO="'+EEstadoProduto.Text+'" '+
      ',AST_DEFEITO="'+EDefeito.Text+'" '+
      ',AST_OBSERVACAO="'+EObservacao.Text+'" '+
      '  WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      '  AND AST_CODIGO='+IntToStr(CdAST));

    GeraLog(8320,CdCNC,CdAST,'PDV:'+ECodigoPDV.Text+' PRD:'+ECodigoPRD.Text+' OBS:'+EObservacao.Text);
    result:=True;
  except
    ShowMessage('Não foi possível alterar registro corrente.');
  end;
end;

procedure TAssistenciaTecnica.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled        := not Habilitar;
  Except
  End;
  Try
    EDataPrevisao.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoPDV.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoCLI.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoPRD.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoAUT.Enabled     :=Habilitar;
  Except
  End;  
  Try
    ENumeroSerie.Enabled  :=Habilitar;
  Except
  End;
  Try
    EEstadoProduto.Enabled    :=Habilitar;
  Except
  End;
  Try
    EDefeito.Enabled    :=Habilitar;
  Except
  End;
  Try
    EObservacao.Enabled    :=Habilitar;
  Except
  End;
end;

procedure TAssistenciaTecnica.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TAssistenciaTecnica.CarregaDados;
begin
  Try
    ECodigoAST.Text    :=IntToStr(CodigoAST);
  Except
  End;
  Try
    EPedidoCNC.Text    :=IntToStr(PedidoCNC);
  Except
  End;
  Try
    ECodigoPDV.Text    :=IntToStr(CodigoPDV);
  Except
  End;
  Try
    EClienteCNC.Text    :=IntToStr(ClienteCNC);
  Except
  End;
  Try
    ECodigoCLI.Text    :=IntToStr(CodigoCLI);
  Except
  End;
  Try
    ECodigoPRD.Text    :=IntToStr(CodigoPRD);
  Except
  End;
  Try
    ECodigoAUT.Text    :=IntToStr(CodigoAUT);
  Except
  End;  
  Try
    ERetorno.Text    :=IntToStr(Retorno);
  Except
  End;
  Try
    If DataCadastro > 0 then
      EDataCadastro.Text             :=FormatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  Except
  End;
  Try
    If DataAlterado > 0 then
      EDataAlterado.Text             :=FormatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  Except
  End;
  Try
    If DataDepositoEnviado > 0 then
      EDataDepositoEnviado.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataDepositoEnviado)
    else
      EDataDepositoEnviado.Clear;
  Except
  End;
  Try
    If DataDepositoRecebido > 0 then
      EDataDepositoRecebido.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataDepositoRecebido)
    else
      EDataDepositoRecebido.Clear;
  Except
  End;
  Try
    If DataAssistenciaEnviado > 0 then
      EDataAssistenciaEnviado.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataAssistenciaEnviado)
    else
      EDataAssistenciaEnviado.Clear;
  Except
  End;
  Try
    If DataAssistenciaRetornado > 0 then
      EDataAssistenciaRetornado.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataAssistenciaRetornado)
    else
      EDataAssistenciaRetornado.Clear;
  Except
  End;
  Try
    If DataDepositoDevolvido > 0 then
      EDataDepositoDevolvido.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataDepositoDevolvido)
    else
      EDataDepositoDevolvido.Clear;
  Except
  End;
  Try
    If DataLojaRecebido > 0 then
      EDataLojaRecebido.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataLojaRecebido)
    else
      EDataLojaRecebido.Clear;
  Except
  End;
  Try
    If DataPrevisao > 0 then
      EDataPrevisao.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataPrevisao)
    else
      EDataPrevisao.Clear;
  Except
  End;
  Try
    If DataEntrega > 0 then
      EDataEntrega.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataEntrega)
    else
      EDataEntrega.Clear;
  Except
  End;
  Try
    ECodigoCNC.KeyValue := CodigoCNC;
  Except
  End;
  Try
    ENumeroSerie.Text       := NumeroSerie;
  Except
  End;
  Try
    EEstadoProduto.Text       := EstadoProduto;
  Except
  End;
  Try
    EDefeito.Text       :=Defeito;
  Except
  End;
  Try
    ESituacao.ItemIndex := Situacao;
  Except
  End;
  Try
    EObservacao.Text       :=Observacao;
  Except
  End;
end;

constructor TAssistenciaTecnica.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ASSISTENCIA_TECNICA';

     { Code to perform other tasks when the component is created }

end;

destructor TAssistenciaTecnica.Destroy;
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

function TAssistenciaTecnica.FinalizaEdicao:Boolean;
var
  mensagem: string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  if not VerificaInteiroBranco(ERetorno.Text) then
    ERetorno.Text := '0';

  mensagem := '';
  if not VerificaInteiro(ECodigoPDV.Text) then
    mensagem := 'Código do Pedido inválido!'+#13
  else if not VerificaInteiroBranco(ECodigoPDV.Text) then
    ECodigoPDV.Text := '0';
  if not VerificaInteiro(ECodigoCLI.Text) then
    mensagem := 'Código do Cliente inválido!'+#13
  else if not VerificaInteiroBranco(ECodigoCLI.Text) then
    ECodigoCLI.Text := '0';
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    mensagem := 'Código do Produto inválido!'+#13;
  if not VerificaInteiroBranco(ECodigoAUT.Text) then
    mensagem := 'Código da Autorizada inválido!'+#13;    
  if not VerificaDataBranco(EDataPrevisao.Text) then
    mensagem := 'Data de Previsão inválida!'+#13;
  if mensagem <> '' then
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
        AfterScroll:=Aux;
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        Result := True;
        AfterScroll:=Aux;
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
  end;
end;

function TAssistenciaTecnica.InserirAuto:Boolean;
var
  CdCNC, CdAST: integer;
begin
  result:=false;
  try
    CdCNC := CConfiguracao.CodigoCNC;
    CdAST := SCodigo;

    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT ASSISTENCIA_TECNICA ( '+
      ' CNC_ORIGEM, CNC_CODIGO, AST_CODIGO, USU_CODIGO '+
      ',CNC_PEDIDO, PDV_CODIGO, CNC_CLIENTE, CLI_CODIGO '+
      ',PRD_CODIGO, AUT_CODIGO, AST_RETORNO '+
      ',AST_DT_CADASTRO, AST_DT_PREVISAO '+
      ',AST_NUMERO_SERIE, AST_ESTADO_PRODUTO, AST_DEFEITO '+
      ',AST_SITUACAO, AST_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(CConfiguracao.CodigoCNC)+
      ', '+IntToStr(CdAST)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ', '+EPedidoCNC.Text+
      ', '+ECodigoPDV.Text+
      ', '+EClienteCNC.Text+
      ', '+ECodigoCLI.Text+
      ', '+ECodigoPRD.Text+
      ', '+ECodigoAUT.Text+      
      ', '+ERetorno.Text+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',"'+MesDiaHora(EDataPrevisao.Text)+'" '+
      ',"'+ENumeroSerie.Text+'" '+
      ',"'+EEstadoProduto.Text+'" '+
      ',"'+EDefeito.Text+'" '+
      ',0'+//Situação
      ',"'+EObservacao.Text+'") ');

    GeraLog(8310,CdCNC,CdAST,'PDV:'+ECodigoPDV.Text+' PRD:'+ECodigoPRD.Text+' OBS:'+EObservacao.Text);
    result:=True;
  except
    ShowMessage('Não foi possível alterar registro corrente.');
  end;
end;

procedure TAssistenciaTecnica.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoAST.Clear;
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
    EPedidoCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoPDV.Clear
    else
      ECodigoPDV.Text := '0';
  Except
  End;
  Try
    EClienteCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoCLI.Clear
    else
      ECodigoCLI.Text := '0';
  Except
  End;
  Try
    ECodigoPRD.Clear;
  Except
  End;
  Try
    ECodigoAUT.Clear;
  Except
  End;  
  Try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text:=FormatDatetime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  Except
  End;
  Try
    EDataAlterado.Clear
  Except
  End;
  Try
    EDataDepositoEnviado.Clear
  Except
  End;
  Try
    EDataDepositoRecebido.Clear
  Except
  End;
  Try
    EDataAssistenciaEnviado.Clear
  Except
  End;
  Try
    EDataAssistenciaRetornado.Clear
  Except
  End;
  Try
    EDataDepositoDevolvido.Clear
  Except
  End;
  Try
    EDataLojaRecebido.Clear
  Except
  End;
  Try
    if Estado <> 1 then
      EDataPrevisao.Clear
    else
      EDataPrevisao.Text:=FormatDatetime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora+30);
  Except
  End;
  Try
    EDataEntrega.Clear
  Except
  End;
  Try
    if Estado <> 1 then
      ERetorno.Clear
    else
      ERetorno.Text := '0';
  Except
  End;
  Try
    ENumeroSerie.Clear;
  Except
  End;
  Try
    EEstadoProduto.Clear;
  Except
  End;
  Try
    EDefeito.Clear;
  Except
  End;
  try
    if Estado <> 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 0;
  Except
  end;
  Try
    EObservacao.Clear;
  Except
  End;
end;

function TAssistenciaTecnica.LocalizarCod(CdAST,CdCNC:Integer):Boolean;
begin
  If (CdAST<>CodigoAST) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;AST_CODIGO', vararrayof([CdCNC, CdAST]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TAssistenciaTecnica.PreparaAlteracao;
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TAssistenciaTecnica.PreparaInsercao;
begin
  ProximoCodigo('AST_CODIGO');
  AtualizaControles(True);
  Estado:=1;
  LimpaCampos;
end;

function TAssistenciaTecnica.deletarauto:Boolean;
var
  CdCNC, CdAST, CdPDV, CdPRD: integer;
begin
  Result:=False;
  CdCNC := CodigoCNC;
  CdAST := CodigoAST;
  CdPDV := CodigoPDV;
  CdPRD := CodigoPRD;
  try
    if Delete then
    Begin
      GeraLog(8330, CdCNC, CdAST, 'PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD));
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
