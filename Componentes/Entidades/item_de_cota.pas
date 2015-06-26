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
unit Item_de_Cota;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Configuracao, Dbgrids, Funcoes, 
     Cota, Variants;

type
  TItem_de_Cota = class(TSQuery)
    private
      { Private fields of TItem_de_Cota }
        { Storage for property CCota }
        FCCota : TCota;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoCOT }
        FCodigoCOT : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoICA }
        FCodigoICA : Integer;
        { Storage for property Comissao1 }
        FComissao1 : Double;
        { Storage for property Comissao10 }
        FComissao10 : Double;
        { Storage for property Comissao2 }
        FComissao2 : Double;
        { Storage for property Comissao20 }
        FComissao20 : Double;
        { Storage for property Comissao3 }
        FComissao3 : Double;
        { Storage for property Comissao30 }
        FComissao30 : Double;
        { Storage for property Comissao4 }
        FComissao4 : Double;
        { Storage for property Comissao40 }
        FComissao40 : Double;
        { Storage for property Cota1 }
        FCota1 : Double;
        { Storage for property Cota10 }
        FCota10 : Double;
        { Storage for property Cota2 }
        FCota2 : Double;
        { Storage for property Cota20 }
        FCota20 : Double;
        { Storage for property Cota3 }
        FCota3 : Double;
        { Storage for property Cota30 }
        FCota30 : Double;
        { Storage for property Cota4 }
        FCota4 : Double;
        { Storage for property Cota40 }
        FCota40 : Double;
        { Storage for property ECodigoCOT }
        FECodigoCOT : TEdit;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComBoBox;
        { Storage for property ECodigoICA }
        FECodigoICA : TEdit;
        { Storage for property EComissao1 }
        FEComissao1 : TEdit;
        { Storage for property EComissao10 }
        FEComissao10 : TEdit;
        { Storage for property EComissao2 }
        FEComissao2 : TEdit;
        { Storage for property EComissao20 }
        FEComissao20 : TEdit;
        { Storage for property EComissao3 }
        FEComissao3 : TEdit;
        { Storage for property EComissao30 }
        FEComissao30 : TEdit;
        { Storage for property EComissao4 }
        FEComissao4 : TEdit;
        { Storage for property EComissao40 }
        FEComissao40 : TEdit;
        { Storage for property ECota1 }
        FECota1 : TEdit;
        { Storage for property ECota10 }
        FECota10 : TEdit;
        { Storage for property ECota2 }
        FECota2 : TEdit;
        { Storage for property ECota20 }
        FECota20 : TEdit;
        { Storage for property ECota3 }
        FECota3 : TEdit;
        { Storage for property ECota30 }
        FECota30 : TEdit;
        { Storage for property ECota4 }
        FECota4 : TEdit;
        { Storage for property ECota40 }
        FECota40 : TEdit;

      { Private methods of TItem_de_Cota }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoCOT }
        function GetCodigoCOT : Integer;
        { Write method for property CodigoCOT }
        procedure SetCodigoCOT(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoICA }
        function GetCodigoICA : Integer;
        { Write method for property CodigoICA }
        procedure SetCodigoICA(Value : Integer);
        { Read method for property Comissao1 }
        function GetComissao1 : Double;
        { Write method for property Comissao1 }
        procedure SetComissao1(Value : Double);
        { Read method for property Comissao10 }
        function GetComissao10 : Double;
        { Write method for property Comissao10 }
        procedure SetComissao10(Value : Double);
        { Read method for property Comissao2 }
        function GetComissao2 : Double;
        { Write method for property Comissao2 }
        procedure SetComissao2(Value : Double);
        { Read method for property Comissao20 }
        function GetComissao20 : Double;
        { Write method for property Comissao20 }
        procedure SetComissao20(Value : Double);
        { Read method for property Comissao3 }
        function GetComissao3 : Double;
        { Write method for property Comissao3 }
        procedure SetComissao3(Value : Double);
        { Read method for property Comissao30 }
        function GetComissao30 : Double;
        { Write method for property Comissao30 }
        procedure SetComissao30(Value : Double);
        { Read method for property Comissao4 }
        function GetComissao4 : Double;
        { Write method for property Comissao4 }
        procedure SetComissao4(Value : Double);
        { Read method for property Comissao40 }
        function GetComissao40 : Double;
        { Write method for property Comissao40 }
        procedure SetComissao40(Value : Double);
        { Read method for property Cota1 }
        function GetCota1 : Double;
        { Write method for property Cota1 }
        procedure SetCota1(Value : Double);
        { Read method for property Cota10 }
        function GetCota10 : Double;
        { Write method for property Cota10 }
        procedure SetCota10(Value : Double);
        { Read method for property Cota2 }
        function GetCota2 : Double;
        { Write method for property Cota2 }
        procedure SetCota2(Value : Double);
        { Read method for property Cota20 }
        function GetCota20 : Double;
        { Write method for property Cota20 }
        procedure SetCota20(Value : Double);
        { Read method for property Cota3 }
        function GetCota3 : Double;
        { Write method for property Cota3 }
        procedure SetCota3(Value : Double);
        { Read method for property Cota30 }
        function GetCota30 : Double;
        { Write method for property Cota30 }
        procedure SetCota30(Value : Double);
        { Read method for property Cota4 }
        function GetCota4 : Double;
        { Write method for property Cota4 }
        procedure SetCota4(Value : Double);
        { Read method for property Cota40 }
        function GetCota40 : Double;
        { Write method for property Cota40 }
        procedure SetCota40(Value : Double);

    protected
      { Protected fields of TItem_de_Cota }

      { Protected methods of TItem_de_Cota }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_de_Cota }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TItem_de_Cota }
        { Altera um Ítem de Cota }
        function Alterar(CdCNC, CdICA, CdCOT, CdFUN:Integer;PCota1,PCota2,PCota3,PCota4,PCota10,PCota20,PCota30,PCota40,PComissao1,PComissao2,PComissao3,PComissao4,PComissao10,PComissao20,PComissao30,PComissao40:Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdICA:Integer):Boolean;
        function FinalizaEdicao:Boolean;
        { Insere um item de Cota }
        function Inserir(CdCNC, CdICA, CdCOT, CdFUN: integer;PCota1,PCota2,PCota3,PCota4,PCota10,PCota20,PCota30,PCota40,PComissao1,PComissao2,PComissao3,PComissao4,PComissao10,PComissao20,PComissao30,PComissao40:real):boolean;
        function InserirAuto:Boolean;
        { Localiza um ítem de pedido de venda }
        function LocalizarCod(CdICA,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_de_Cota }
        property CCota : TCota read FCCota write FCCota;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Pedido de Venda }
        property CodigoCOT : Integer read GetCodigoCOT write SetCodigoCOT;
        { Código de Funcionario }
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        { Código do item de Cota }
        property CodigoICA : Integer read GetCodigoICA write SetCodigoICA;
        property Comissao1 : Double read GetComissao1 write SetComissao1;
        property Comissao10 : Double read GetComissao10 write SetComissao10;
        property Comissao2 : Double read GetComissao2 write SetComissao2;
        property Comissao20 : Double read GetComissao20 write SetComissao20;
        property Comissao3 : Double read GetComissao3 write SetComissao3;
        property Comissao30 : Double read GetComissao30 write SetComissao30;
        property Comissao4 : Double read GetComissao4 write SetComissao4;
        property Comissao40 : Double read GetComissao40 write SetComissao40;
        property Cota1 : Double read GetCota1 write SetCota1;
        property Cota10 : Double read GetCota10 write SetCota10;
        property Cota2 : Double read GetCota2 write SetCota2;
        property Cota20 : Double read GetCota20 write SetCota20;
        property Cota3 : Double read GetCota3 write SetCota3;
        property Cota30 : Double read GetCota30 write SetCota30;
        property Cota4 : Double read GetCota4 write SetCota4;
        property Cota40 : Double read GetCota40 write SetCota40;
        property ECodigoCOT : TEdit read FECodigoCOT write FECodigoCOT;
        property ECodigoFUN : TDBLookupComBoBox
             read FECodigoFUN write FECodigoFUN;
        property ECodigoICA : TEdit read FECodigoICA write FECodigoICA;
        property EComissao1 : TEdit read FEComissao1 write FEComissao1;
        property EComissao10 : TEdit read FEComissao10 write FEComissao10;
        property EComissao2 : TEdit read FEComissao2 write FEComissao2;
        property EComissao20 : TEdit read FEComissao20 write FEComissao20;
        property EComissao3 : TEdit read FEComissao3 write FEComissao3;
        property EComissao30 : TEdit read FEComissao30 write FEComissao30;
        property EComissao4 : TEdit read FEComissao4 write FEComissao4;
        property EComissao40 : TEdit read FEComissao40 write FEComissao40;
        property ECota1 : TEdit read FECota1 write FECota1;
        property ECota10 : TEdit read FECota10 write FECota10;
        property ECota2 : TEdit read FECota2 write FECota2;
        property ECota20 : TEdit read FECota20 write FECota20;
        property ECota3 : TEdit read FECota3 write FECota3;
        property ECota30 : TEdit read FECota30 write FECota30;
        property ECota4 : TEdit read FECota4 write FECota4;
        property ECota40 : TEdit read FECota40 write FECota40;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Cota with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Cota]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Cota.AutoInitialize;
begin
     Estado := 0;
     FECodigoCOT := nil;
     FECodigoFUN := nil;
     FECodigoICA := nil;
     FEComissao1 := nil;
     FEComissao10 := nil;
     FEComissao2 := nil;
     FEComissao20 := nil;
     FEComissao3 := nil;
     FEComissao30 := nil;
     FEComissao4 := nil;
     FEComissao40 := nil;
     FECota1 := nil;
     FECota10 := nil;
     FECota2 := nil;
     FECota20 := nil;
     FECota3 := nil;
     FECota30 := nil;
     FECota4 := nil;
     FECota40 := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_de_Cota.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCOT then
        FECodigoCOT := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoICA then
        FECodigoICA := nil;
     if AComponent = FEComissao1 then
        FEComissao1 := nil;
     if AComponent = FEComissao10 then
        FEComissao10 := nil;
     if AComponent = FEComissao2 then
        FEComissao2 := nil;
     if AComponent = FEComissao20 then
        FEComissao20 := nil;
     if AComponent = FEComissao3 then
        FEComissao3 := nil;
     if AComponent = FEComissao30 then
        FEComissao30 := nil;
     if AComponent = FEComissao4 then
        FEComissao4 := nil;
     if AComponent = FEComissao40 then
        FEComissao40 := nil;
     if AComponent = FECota1 then
        FECota1 := nil;
     if AComponent = FECota10 then
        FECota10 := nil;
     if AComponent = FECota2 then
        FECota2 := nil;
     if AComponent = FECota20 then
        FECota20 := nil;
     if AComponent = FECota3 then
        FECota3 := nil;
     if AComponent = FECota30 then
        FECota30 := nil;
     if AComponent = FECota4 then
        FECota4 := nil;
     if AComponent = FECota40 then
        FECota40 := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Cota.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TItem_de_Cota.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TItem_de_Cota.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoCOT }
function TItem_de_Cota.GetCodigoCOT : Integer;
begin
  try
    Result := Self.fieldByName('COT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCOT }
procedure TItem_de_Cota.SetCodigoCOT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('COT_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "COT_CODIGO"!');
  end;
end;

{ Read method for property CodigoFUN }
function TItem_de_Cota.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    Result := 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TItem_de_Cota.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FUN_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
  end;
end;

{ Read method for property CodigoICA }
function TItem_de_Cota.GetCodigoICA : Integer;
begin
  try
    Result := Self.fieldByName('ICA_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoICA }
procedure TItem_de_Cota.SetCodigoICA(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_CODIGO"!');
  end;
end;

{ Read method for property Comissao1 }
function TItem_de_Cota.GetComissao1 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COMISSAO1').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Comissao1 }
procedure TItem_de_Cota.SetComissao1(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COMISSAO1').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COMISSAO1"!');
  end;
end;

{ Read method for property Comissao10 }
function TItem_de_Cota.GetComissao10 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COMISSAO10').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Comissao10 }
procedure TItem_de_Cota.SetComissao10(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COMISSAO10').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COMISSAO10"!');
  end;
end;

{ Read method for property Comissao2 }
function TItem_de_Cota.GetComissao2 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COMISSAO2').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Comissao2 }
procedure TItem_de_Cota.SetComissao2(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COMISSAO2').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COMISSAO2"!');
  end;
end;

{ Read method for property Comissao20 }
function TItem_de_Cota.GetComissao20 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COMISSAO20').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Comissao20 }
procedure TItem_de_Cota.SetComissao20(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COMISSAO20').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COMISSAO20"!');
  end;
end;

{ Read method for property Comissao3 }
function TItem_de_Cota.GetComissao3 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COMISSAO3').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Comissao3 }
procedure TItem_de_Cota.SetComissao3(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COMISSAO3').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COMISSAO3"!');
  end;
end;

{ Read method for property Comissao30 }
function TItem_de_Cota.GetComissao30 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COMISSAO30').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Comissao30 }
procedure TItem_de_Cota.SetComissao30(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COMISSAO30').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COMISSAO30"!');
  end;
end;

{ Read method for property Comissao4 }
function TItem_de_Cota.GetComissao4 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COMISSAO4').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Comissao4 }
procedure TItem_de_Cota.SetComissao4(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COMISSAO4').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COMISSAO4"!');
  end;
end;

{ Read method for property Comissao40 }
function TItem_de_Cota.GetComissao40 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COMISSAO40').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Comissao40 }
procedure TItem_de_Cota.SetComissao40(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COMISSAO40').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COMISSAO40"!');
  end;
end;

{ Read method for property Cota1 }
function TItem_de_Cota.GetCota1 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COTA1').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cota1 }
procedure TItem_de_Cota.SetCota1(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COTA1').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COTA1"!');
  end;
end;

{ Read method for property Cota10 }
function TItem_de_Cota.GetCota10 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COTA10').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cota10 }
procedure TItem_de_Cota.SetCota10(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COTA10').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COTA10"!');
  end;
end;

{ Read method for property Cota2 }
function TItem_de_Cota.GetCota2 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COTA2').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cota2 }
procedure TItem_de_Cota.SetCota2(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COTA2').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COTA2"!');
  end;
end;

{ Read method for property Cota20 }
function TItem_de_Cota.GetCota20 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COTA20').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cota20 }
procedure TItem_de_Cota.SetCota20(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COTA20').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COTA20"!');
  end;
end;

{ Read method for property Cota3 }
function TItem_de_Cota.GetCota3 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COTA3').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cota3 }
procedure TItem_de_Cota.SetCota3(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COTA3').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COTA3"!');
  end;
end;

{ Read method for property Cota30 }
function TItem_de_Cota.GetCota30 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COTA30').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cota30 }
procedure TItem_de_Cota.SetCota30(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COTA30').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COTA30"!');
  end;
end;

{ Read method for property Cota4 }
function TItem_de_Cota.GetCota4 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COTA4').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cota4 }
procedure TItem_de_Cota.SetCota4(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COTA4').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COTA4"!');
  end;
end;

{ Read method for property Cota40 }
function TItem_de_Cota.GetCota40 : Double;
begin
  try
    Result := Self.fieldByName('ICA_COTA40').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cota40 }
procedure TItem_de_Cota.SetCota40(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICA_COTA40').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICA_COTA40"!');
  end;
end;

{ Altera um Ítem de Cota }
function TItem_de_Cota.Alterar(CdCNC, CdICA, CdCOT, CdFUN:Integer;PCota1,PCota2,PCota3,PCota4,PCota10,PCota20,PCota30,PCota40,PComissao1,PComissao2,PComissao3,PComissao4,PComissao10,PComissao20,PComissao30,PComissao40:Double):boolean;
begin
  If not(localizarCod(CdICA,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoCOT      := CdCOT;
      CodigoFUN      := CdFUN;
      Cota1          := PCota1;
      Cota2          := PCota2;
      Cota3          := PCota3;
      Cota4          := PCota4;
      Cota10         := PCota10;
      Cota20         := PCota20;
      Cota30         := PCota30;
      Cota40         := PCota40;
      Comissao1      := PComissao1;
      Comissao2      := PComissao2;
      Comissao3      := PComissao3;
      Comissao4      := PComissao4;
      Comissao10     := PComissao10;
      Comissao20     := PComissao20;
      Comissao30     := PComissao30;
      Comissao40     := PComissao40;
      try
        Post;
        result:=true;

      except
        result:=false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TItem_de_Cota.AlterarAuto:Boolean;
begin
    try
      edit;
      try
        CodigoFUN := ECodigoFUN.KeyValue;
      except
      end;
      try
        Cota1 := StrToFloat(ECota1.Text);
      except
      end;
      try
        Cota2 := StrToFloat(ECota2.Text);
      except
      end;
      try
        Cota3 := StrToFloat(ECota3.Text);
      except
      end;
      try
        Cota4 := StrToFloat(ECota4.Text);
      except
      end;
      try
        Cota10 := StrToFloat(ECota10.Text);
      except
      end;
      try
        Cota20 := StrToFloat(ECota20.Text);
      except
      end;
      try
        Cota30 := StrToFloat(ECota30.Text);
      except
      end;
      try
        Cota40 := StrToFloat(ECota40.Text);
      except
      end;
      try
        Comissao1 := StrToFloat(EComissao1.Text);
      except
      end;
      try
        Comissao2 := StrToFloat(EComissao2.Text);
      except
      end;
      try
        Comissao3 := StrToFloat(EComissao3.Text);
      except
      end;
      try
        Comissao4 := StrToFloat(EComissao4.Text);
      except
      end;
      try
        Comissao10 := StrToFloat(EComissao10.Text);
      except
      end;
      try
        Comissao20 := StrToFloat(EComissao20.Text);
      except
      end;
      try
        Comissao30 := StrToFloat(EComissao30.Text);
      except
      end;
      try
        Comissao40 := StrToFloat(EComissao40.Text);
      except
      end;
      try
        Post;
        Result:=True;
      except
        Result:=False;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      Result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
end;

procedure TItem_de_Cota.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled     :=not Habilitar;
  Except
  End;
  try
    ECodigoFUN.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECota1.Enabled    :=Habilitar;
  Except
  End;
  Try
    ECota2.Enabled    :=Habilitar;
  Except
  End;
  Try
    ECota3.Enabled    :=Habilitar;
  Except
  End;
  Try
    ECota4.Enabled    :=Habilitar;
  Except
  End;
  Try
    ECota10.Enabled    :=Habilitar;
  Except
  End;
  Try
    ECota20.Enabled    :=Habilitar;
  Except
  End;
  Try
    ECota30.Enabled    :=Habilitar;
  Except
  End;
  Try
    ECota40.Enabled    :=Habilitar;
  Except
  End;
  Try
    EComissao1.Enabled    :=Habilitar;
  Except
  End;
  Try
    EComissao2.Enabled    :=Habilitar;
  Except
  End;
  Try
    EComissao3.Enabled    :=Habilitar;
  Except
  End;
  Try
    EComissao4.Enabled    :=Habilitar;
  Except
  End;
  Try
    EComissao10.Enabled    :=Habilitar;
  Except
  End;
  Try
    EComissao20.Enabled    :=Habilitar;
  Except
  End;
  Try
    EComissao30.Enabled    :=Habilitar;
  Except
  End;
  Try
    EComissao40.Enabled    :=Habilitar;
  Except
  End;
end;

procedure TItem_de_Cota.CancelaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(False);
  Estado:=0;
  CarregaDados;
end;

procedure TItem_de_Cota.CarregaDados;
begin
  Try
   ECodigoICA.Text                :=IntToStr(CodigoICA);
  Except
  End;
  Try
    ECodigoFUN.KeyValue         :=CodigoFUN;
  Except
  End;
  Try
    ECota1.Text        :=Format('%.2f', [Cota1]);
  Except
  End;
  Try
    ECota2.Text        :=Format('%.2f', [Cota2]);
  Except
  End;
  Try
    ECota3.Text        :=Format('%.2f', [Cota3]);
  Except
  End;
  Try
    ECota4.Text        :=Format('%.2f', [Cota4]);
  Except
  End;
  Try
    ECota10.Text       :=Format('%.2f', [Cota10]);
  Except
  End;
  Try
    ECota20.Text       :=Format('%.2f', [Cota20]);
  Except
  End;
  Try
    ECota30.Text       :=Format('%.2f', [Cota30]);
  Except
  End;
  Try
    ECota40.Text       :=Format('%.2f', [Cota40]);
  Except
  End;
  Try
    EComissao1.Text        :=Format('%.2f', [Comissao1]);
  Except
  End;
  Try
    EComissao2.Text        :=Format('%.2f', [Comissao2]);
  Except
  End;
  Try
    EComissao3.Text        :=Format('%.2f', [Comissao3]);
  Except
  End;
  Try
    EComissao4.Text        :=Format('%.2f', [Comissao4]);
  Except
  End;
  Try
    EComissao10.Text       :=Format('%.2f', [Comissao10]);
  Except
  End;
  Try
    EComissao20.Text       :=Format('%.2f', [Comissao20]);
  Except
  End;
  Try
    EComissao30.Text       :=Format('%.2f', [Comissao30]);
  Except
  End;
  Try
    EComissao40.Text       :=Format('%.2f', [Comissao40]);
  Except
  End;
end;

constructor TItem_de_Cota.Create(AOwner: TComponent);
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

function TItem_de_Cota.Deletar(CdCNC,CdICA:Integer):Boolean;
begin
  If not(localizarCod(CdICA,CdCNC)) Then
  Begin
    Result := False;
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        begin
          Try
            ECodigoICA.Clear;
          Except
          End;
          Try
            ECodigoFUN.KeyValue:=0;
          Except
          End;
          Try
            ECota1.Clear;
          Except
          End;
          Try
            ECota2.Clear;
          Except
          End;
          Try
            ECota3.Clear;
          Except
          End;
          Try
            ECota4.Clear;
          Except
          End;
          Try
            ECota10.Clear;
          Except
          End;
          Try
            ECota20.Clear;
          Except
          End;
          Try
            ECota30.Clear;
          Except
          End;
          Try
            ECota40.Clear;
          Except
          End;
          Try
            EComissao1.Clear;
          Except
          End;
          Try
            EComissao2.Clear;
          Except
          End;
          Try
            EComissao3.Clear;
          Except
          End;
          Try
            EComissao4.Clear;
          Except
          End;
          Try
            EComissao10.Clear;
          Except
          End;
          Try
            EComissao20.Clear;
          Except
          End;
          Try
            EComissao30.Clear;
          Except
          End;
          Try
            EComissao40.Clear;
          Except
          End;
        end;
      end
      else
        Result := True;
    Except
      Result := False;
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

function TItem_de_Cota.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  If (ECodigoFUN.KeyValue = NULL) OR (ECodigoFUN.KeyValue = 0) then
    mensagem:= mensagem + 'Funcionário incorreto!'+#13;
  If not VerificafloatBranco(ECota1.text) Then
    mensagem:=mensagem+'Cota1 digitada incorretamente!'+#13;
  If not VerificafloatBranco(ECota2.text) Then
    mensagem:=mensagem+'Cota2 digitada incorretamente!'+#13;
  If not VerificafloatBranco(ECota3.text) Then
    mensagem:=mensagem+'Cota3 digitada incorretamente!'+#13;
  If not VerificafloatBranco(ECota4.text) Then
    mensagem:=mensagem+'Cota4 digitada incorretamente!'+#13;
  If not VerificafloatBranco(ECota10.text) Then
    mensagem:=mensagem+'Cota10 digitada incorretamente!'+#13;
  If not VerificafloatBranco(ECota20.text) Then
    mensagem:=mensagem+'Cota20 digitada incorretamente!'+#13;
  If not VerificafloatBranco(ECota30.text) Then
    mensagem:=mensagem+'Cota30 digitada incorretamente!'+#13;
  If not VerificafloatBranco(ECota40.text) Then
    mensagem:=mensagem+'Cota40 digitada incorretamente!'+#13;
  If not VerificafloatBranco(EComissao1.text) Then
    mensagem:=mensagem+'Comissao1 digitada incorretamente!'+#13;
  If not VerificafloatBranco(EComissao2.text) Then
    mensagem:=mensagem+'Comissao2 digitada incorretamente!'+#13;
  If not VerificafloatBranco(EComissao3.text) Then
    mensagem:=mensagem+'Comissao3 digitada incorretamente!'+#13;
  If not VerificafloatBranco(EComissao4.text) Then
    mensagem:=mensagem+'Comissao4 digitada incorretamente!'+#13;
  If not VerificafloatBranco(EComissao10.text) Then
    mensagem:=mensagem+'Comissao10 digitada incorretamente!'+#13;
  If not VerificafloatBranco(EComissao20.text) Then
    mensagem:=mensagem+'Comissao20 digitada incorretamente!'+#13;
  If not VerificafloatBranco(EComissao30.text) Then
    mensagem:=mensagem+'Comissao30 digitada incorretamente!'+#13;
  If not VerificafloatBranco(EComissao40.text) Then
    mensagem:=mensagem+'Comissao40 digitada incorretamente!'+#13;
  if mensagem <> '' then
  Begin
    Result:=False;
    ShowMessage(mensagem);
  end
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CConfiguracao.CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result:=False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoICA;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result:=False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
  end;
end;

{ Insere um item de Cota }
function TItem_de_Cota.Inserir(CdCNC, CdICA, CdCOT, CdFUN: integer;PCota1,PCota2,PCota3,PCota4,PCota10,PCota20,PCota30,PCota40,PComissao1,PComissao2,PComissao3,PComissao4,PComissao10,PComissao20,PComissao30,PComissao40:real):boolean;
Var
  Cod:Integer;
begin
  if CdICA=0 then
    Cod    := ProximoCodigo('ICA_CODIGO')
  else
    Cod    := CdICA;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
      Insert;
      try
        CodigoICA      := Cod;
        CodigoCNC      := CdCNC;
        CodigoCOT      := CdCOT;
        CodigoFUN      := CdFUN;
        Cota1          := PCota1;
        Cota2          := PCota2;
        Cota3          := PCota3;
        Cota4          := PCota4;
        Cota10         := PCota10;
        Cota20         := PCota20;
        Cota30         := PCota30;
        Cota40         := PCota40;
        Comissao1      := PComissao1;
        Comissao2      := PComissao2;
        Comissao3      := PComissao3;
        Comissao4      := PComissao4;
        Comissao10     := PComissao10;
        Comissao20     := PComissao20;
        Comissao30     := PComissao30;
        Comissao40     := PComissao40;
        try
          Post;
          Result:=true;
        except
          result:=false;
          Cancel;
          ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
        end;
      except
        result:=false;
        ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
      end;
  end;
end;

function TItem_de_Cota.InserirAuto:Boolean;
begin
  try
    append;
    try
       CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoICA := SCodigo;
    except
    end;
    try
       CodigoCOT := StrToInt(ECodigoCOT.Text);
    except
    end;
    try
       CodigoFUN := ECodigoFUN.KeyValue;
    except
    end;
    try
      Cota1 := StrToFloat(ECota1.Text);
    except
    end;
    try
      Cota2 := StrToFloat(ECota2.Text);
    except
    end;
    try
      Cota3 := StrToFloat(ECota3.Text);
    except
    end;
    try
      Cota4 := StrToFloat(ECota4.Text);
    except
    end;
    try
      Cota10:= StrToFloat(ECota10.Text);
    except
    end;
    try
      Cota20:= StrToFloat(ECota20.Text);
    except
    end;
    try
      Cota30:= StrToFloat(ECota30.Text);
    except
    end;
    try
      Cota40:= StrToFloat(ECota40.Text);
    except
    end;
    try
      Comissao1 := StrToFloat(EComissao1.Text);
    except
    end;
    try
      Comissao2 := StrToFloat(EComissao2.Text);
    except
    end;
    try
      Comissao3 := StrToFloat(EComissao3.Text);
    except
    end;
    try
      Comissao4 := StrToFloat(EComissao4.Text);
    except
    end;
    try
      Comissao10:= StrToFloat(EComissao10.Text);
    except
    end;
    try
      Comissao20:= StrToFloat(EComissao20.Text);
    except
    end;
    try
      Comissao30:= StrToFloat(EComissao30.Text);
    except
    end;
    try
      Comissao40:= StrToFloat(EComissao40.Text);
    except
    end;
    try
      Post;
      result:=True;
    except
      result:=False;
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se já existe um registro para esse Funcionário.');
    end;
  except
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;

end;

{ Localiza um ítem de pedido de venda }
function TItem_de_Cota.LocalizarCod(CdICA,CdCNC:Integer):Boolean;
begin
  If (CdICA<>CodigoICA) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;ICA_CODIGO', vararrayof([CdCNC, CdICA]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_de_Cota.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TItem_de_Cota.PreparaInsercao;
begin
  ProximoCodigo('ICA_CODIGO');
  Try
    ECodigoFUN.KeyValue:=0;
  Except
  End;
{  Try
    ECota1.Clear;
  Except
  End;
  Try
    ECota2.Clear;
  Except
  End;
  Try
    ECota3.Clear;
  Except
  End;
  Try
    ECota4.Clear;
  Except
  End;
  Try
    ECota10.Clear;
  Except
  End;
  Try
    ECota20.Clear;
  Except
  End;
  Try
    ECota30.Clear;
  Except
  End;
  Try
    ECota40.Clear;
  Except
  End;
  Try
    EComissao1.Clear;
  Except
  End;
  Try
    EComissao2.Clear;
  Except
  End;
  Try
    EComissao3.Clear;
  Except
  End;
  Try
    EComissao4.Clear;
  Except
  End;
  Try
    EComissao10.Clear;
  Except
  End;
  Try
    EComissao20.Clear;
  Except
  End;
  Try
    EComissao30.Clear;
  Except
  End;
  Try
    EComissao40.Clear;
  Except
  End;
}  
  Estado:=1;
  AtualizaControles(True);
end;

function TItem_de_Cota.deletarauto:Boolean;
begin
  try
    Result := Delete;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
