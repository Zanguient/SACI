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
unit Item_de_Troca;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Pedido_de_Venda, Configuracao, Troca, Usuario, 
     Variants;

type
  TItem_de_Troca = class(TSQuery)
    private
      { Private fields of TItem_de_Troca }
        { Storage for property CTroca }
        FCTroca : TTroca;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoITO }
        FCodigoITO : Integer;
        { Storage for property CodigoLOT }
        FCodigoLOT : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoTRO }
        FCodigoTRO : Integer;
        { Storage for property DataItem }
        FDataItem : TDateTime;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComboBox;
        { Storage for property ECodigoITR }
        FECodigoITR : TEdit;
        { Storage for property ECodigoLOT }
        FECodigoLOT : TEdit;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataItem }
        FEDataItem : TMaskEdit;
        { Storage for property EPreco }
        FEPreco : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property EntraSai }
        FEntraSai : Boolean;
        { Storage for property Preco }
        FPreco : Double;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TItem_de_Troca }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoITO }
        function GetCodigoITO : Integer;
        { Write method for property CodigoITO }
        procedure SetCodigoITO(Value : Integer);
        { Read method for property CodigoLOT }
        function GetCodigoLOT : Integer;
        { Write method for property CodigoLOT }
        procedure SetCodigoLOT(Value : Integer);
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Write method for property CodigoPDV }
        procedure SetCodigoPDV(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoTRO }
        function GetCodigoTRO : Integer;
        { Write method for property CodigoTRO }
        procedure SetCodigoTRO(Value : Integer);
        { Read method for property DataItem }
        function GetDataItem : TDateTime;
        { Write method for property DataItem }
        procedure SetDataItem(Value : TDateTime);
        { Read method for property EntraSai }
        function GetEntraSai : Boolean;
        { Write method for property EntraSai }
        procedure SetEntraSai(Value : Boolean);
        { Read method for property Preco }
        function GetPreco : Double;
        { Write method for property Preco }
        procedure SetPreco(Value : Double);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TItem_de_Troca }

      { Protected methods of TItem_de_Troca }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_de_Troca }

      { Public methods of TItem_de_Troca }
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC,CdITR:Integer);
        destructor Destroy; override;
        { Insere um item de Troca }
        function Inserir(CdCNC, CdITO, CdPDV, CdTRO, CdPRD, CdLOT, CdFUN: integer; PPreco: Double;PSituacao:Integer;PQuantidade:Double;PEntraSai:Boolean;PDataItem:TDateTime):boolean;
        { Localiza um item de troca }
        function LocalizarCod(CdITO,CdCNC:Integer):Boolean;
        function LocalizarProd(CdPRD:integer):Boolean;
        function deletarauto:Boolean;
        { Altera um Item de Troca }
        function zzAlterar(CdCNC, CdITR, CdPDV, CdTRO, CdPRD, CdLOT, CdFUN: integer; PPreco: Double;PSituacao:Integer;PQuantidade:Double; PEntraSai:Boolean;PDataItem:TDateTime):boolean;

    published
      { Published properties of TItem_de_Troca }
        property CTroca : TTroca read FCTroca write FCTroca;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        { Código do item de troca }
        property CodigoITO : Integer read GetCodigoITO write SetCodigoITO;
        property CodigoLOT : Integer read GetCodigoLOT write SetCodigoLOT;
        { Código do Pedido de Venda }
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        { Código de Produto }
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoTRO : Integer read GetCodigoTRO write SetCodigoTRO;
        property DataItem : TDateTime read GetDataItem write SetDataItem;
        property ECodigoFUN : TDBLookupComboBox
             read FECodigoFUN write FECodigoFUN;
        property ECodigoITR : TEdit read FECodigoITR write FECodigoITR;
        property ECodigoLOT : TEdit read FECodigoLOT write FECodigoLOT;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataItem : TMaskEdit read FEDataItem write FEDataItem;
        property EPreco : TEdit read FEPreco write FEPreco;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property EntraSai : Boolean read GetEntraSai write SetEntraSai;
        property Preco : Double read GetPreco write SetPreco;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Troca with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Troca]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Troca.AutoInitialize;
begin
     FECodigoFUN := nil;
     FECodigoITR := nil;
     FECodigoLOT := nil;
     FECodigoPDV := nil;
     FECodigoPRD := nil;
     FEDataItem := nil;
     FEPreco := nil;
     FEQuantidade := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_de_Troca.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoITR then
        FECodigoITR := nil;
     if AComponent = FECodigoLOT then
        FECodigoLOT := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataItem then
        FEDataItem := nil;
     if AComponent = FEPreco then
        FEPreco := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Troca.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TItem_de_Troca.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TItem_de_Troca.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TItem_de_Troca.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TItem_de_Troca.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoITO }
function TItem_de_Troca.GetCodigoITO : Integer;
begin
  try
    Result := Self.fieldByName('ITO_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoITO }
procedure TItem_de_Troca.SetCodigoITO(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITO_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITO_CODIGO"!');
  end;
end;

{ Read method for property CodigoLOT }
function TItem_de_Troca.GetCodigoLOT : Integer;
begin
  try
    Result := Self.fieldByName('LOT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoLOT }
procedure TItem_de_Troca.SetCodigoLOT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_CODIGO"!');
  end;
end;

{ Read method for property CodigoPDV }
function TItem_de_Troca.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPDV }
procedure TItem_de_Troca.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
  end;
end;

{ Read method for property CodigoPRD }
function TItem_de_Troca.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    Result := 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_de_Troca.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Read method for property CodigoTRO }
function TItem_de_Troca.GetCodigoTRO : Integer;
begin
  try
    Result := Self.fieldByName('TRO_CODIGO').asInteger;
  except
    Result := 0
  end;
end;

{ Write method for property CodigoTRO }
procedure TItem_de_Troca.SetCodigoTRO(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRO_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRO_CODIGO"!');
  end;
end;

{ Read method for property DataItem }
function TItem_de_Troca.GetDataItem : TDateTime;
begin
  try
    Result := Self.fieldByName('ITO_DATA').asDateTime;
  except
    Result :=0;
  end;
end;

{ Write method for property DataItem }
procedure TItem_de_Troca.SetDataItem(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITO_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITO_DATA"!');
  end;
end;

{ Read method for property EntraSai }
function TItem_de_Troca.GetEntraSai : Boolean;
begin
  try
    if Self.fieldByName('ITO_ENTRASAI').AsInteger = 1 then
      Result := True
    else
      Result := False;
  except
    result:= False
  end;
end;

{ Write method for property EntraSai }
procedure TItem_de_Troca.SetEntraSai(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('ITO_ENTRASAI').asInteger := 1
      else
        Self.fieldByName('ITO_ENTRASAI').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "ITO_ENTRASAI"!');
    end;
end;

{ Read method for property Preco }
function TItem_de_Troca.GetPreco : Double;
begin
  try
    Result := Self.fieldByName('ITO_VALOR').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Preco }
procedure TItem_de_Troca.SetPreco(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITO_VALOR').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITO_VALOR"!');
  end;
end;

{ Read method for property Quantidade }
function TItem_de_Troca.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('ITO_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TItem_de_Troca.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITO_QUANTIDADE').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITO_QUANTIDADE"!');
  end;
end;

{ Read method for property Situacao }
function TItem_de_Troca.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('ITO_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TItem_de_Troca.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITO_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITO_SITUACAO"!');
  end;
end;

constructor TItem_de_Troca.Create(AOwner: TComponent);
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

procedure TItem_de_Troca.Deletar(CdCNC,CdITR:Integer);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdITR,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      if TQuery(Self).isEmpty then
      begin
        Try
          ECodigoITR.Clear;
        Except
        End;
        Try
          ECodigoPRD.Clear;
        Except
        End;
        Try
          ECodigoFUN.KeyValue:=0;
        Except
        End;
        Try
          EQuantidade.Clear;
        Except
        End;
        Try
          EPreco.Clear;
        Except
        End;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_de_Troca.Destroy;
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

{ Insere um item de Troca }
function TItem_de_Troca.Inserir(CdCNC, CdITO, CdPDV, CdTRO, CdPRD, CdLOT, CdFUN: integer; PPreco: Double;PSituacao:Integer;PQuantidade:Double;PEntraSai:Boolean;PDataItem:TDateTime):boolean;
Var
  Cod:Integer;
begin
  if CdITO=0 then
    Cod    := ProximoCodigo('ITO_CODIGO')
  else
    Cod    := CdITO;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o ITEM DE TROCA, pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
      result:=true;
      Insert;
      try
        CodigoITO      := Cod;
        CodigoCNC      := CdCNC;
        CodigoTRO      := CdTRO;
        CodigoPDV      := CdPDV;
        CodigoPRD      := CdPRD;
        CodigoLOT      := CdLOT;
        CodigoFUN      := CdFUN;
        Quantidade     := PQuantidade;
        Preco          := PPreco;
        Situacao       := PSituacao;
        EntraSai       := PEntraSai;
        DataItem       := PDataItem;
        try
          Post;

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

{ Localiza um item de troca }
function TItem_de_Troca.LocalizarCod(CdITO,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdITO<>CodigoITO) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;ITO_CODIGO', vararrayof([CdCNC, CdITO]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TItem_de_Troca.LocalizarProd(CdPRD:integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdPRD<>CodigoPRD) Then
    If locate('PRD_CODIGO', CdPRD, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TItem_de_Troca.deletarauto:Boolean;
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

{ Altera um Item de Troca }
function TItem_de_Troca.zzAlterar(CdCNC, CdITR, CdPDV, CdTRO, CdPRD, CdLOT, CdFUN: integer; PPreco: Double;PSituacao:Integer;PQuantidade:Double; PEntraSai:Boolean;PDataItem:TDateTime):boolean;
begin
  result:=true;
  If not(localizarCod(CdITR,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoTRO      := CdTRO;
      CodigoPDV      := CdPDV;
      CodigoPRD      := CdPRD;
      CodigoLOT      := CdLOT;
      CodigoFUN      := CdFUN;
      Quantidade     := PQuantidade;
      Preco          := PPreco;
      Situacao       := PSituacao;
      EntraSai       := PEntraSai;
      DataItem       := PDataItem;
      try
        Post;

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


end.
