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
unit Item_Pedido_Compra;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Extctrls, Variants;

type
  TItem_Pedido_Compra = class(TSQuery)
    private
      { Private fields of TItem_Pedido_Compra }
        { Storage for property Amostra }
        FAmostra : Double;
        { Storage for property Bonificacao }
        FBonificacao : Double;
        { Storage for property CodigoIPC }
        FCodigoIPC : Integer;
        { Storage for property CodigoLOT }
        FCodigoLOT : Integer;
        { Storage for property CodigoPCP }
        FCodigoPCP : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descontos }
        FDescontos : String;
        { Storage for property EAmostra }
        FEAmostra : TEdit;
        { Storage for property EBonificacao }
        FEBonificacao : TEdit;
        { Storage for property ECodigoIPC }
        FECodigoIPC : TEdit;
        { Storage for property ECodigoLOT }
        FECodigoLOT : TEdit;
        { Storage for property ECodigoPCP }
        FECodigoPCP : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDescontos }
        FEDescontos : TEdit;
        { Storage for property EIPI }
        FEIPI : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EPreco }
        FEPreco : TEdit;
        { Storage for property EPrecoFinal }
        FEPrecoFinal : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ETipoICMS }
        FETipoICMS : TComboBox;
        { Storage for property IPI }
        FIPI : Double;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Preco }
        FPreco : Double;
        { Storage for property PrecoFinal }
        FPrecoFinal : Double;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property TipoICMS }
        FTipoICMS : Integer;

      { Private methods of TItem_Pedido_Compra }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Amostra }
        function GetAmostra : Double;
        { Write method for property Amostra }
        procedure SetAmostra(Value : Double);
        { Read method for property Bonificacao }
        function GetBonificacao : Double;
        { Write method for property Bonificacao }
        procedure SetBonificacao(Value : Double);
        { Read method for property CodigoIPC }
        function GetCodigoIPC : Integer;
        { Write method for property CodigoIPC }
        procedure SetCodigoIPC(Value : Integer);
        { Read method for property CodigoLOT }
        function GetCodigoLOT : Integer;
        { Write method for property CodigoLOT }
        procedure SetCodigoLOT(Value : Integer);
        { Read method for property CodigoPCP }
        function GetCodigoPCP : Integer;
        { Write method for property CodigoPCP }
        procedure SetCodigoPCP(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Descontos }
        function GetDescontos : String;
        { Write method for property Descontos }
        procedure SetDescontos(Value : String);
        { Read method for property IPI }
        function GetIPI : Double;
        { Write method for property IPI }
        procedure SetIPI(Value : Double);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Preco }
        function GetPreco : Double;
        { Write method for property Preco }
        procedure SetPreco(Value : Double);
        { Read method for property PrecoFinal }
        function GetPrecoFinal : Double;
        { Write method for property PrecoFinal }
        procedure SetPrecoFinal(Value : Double);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property TipoICMS }
        function GetTipoICMS : Integer;
        { Write method for property TipoICMS }
        procedure SetTipoICMS(Value : Integer);

    protected
      { Protected fields of TItem_Pedido_Compra }

      { Protected methods of TItem_Pedido_Compra }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_Pedido_Compra }

      { Public methods of TItem_Pedido_Compra }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdIPC:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um ítem de pedido de compra }
        function LocalizarCod(CdIPC,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_Pedido_Compra }
        property Amostra : Double read GetAmostra write SetAmostra;
        property Bonificacao : Double read GetBonificacao write SetBonificacao;
        { Código do ítem de pedido de compra }
        property CodigoIPC : Integer read GetCodigoIPC write SetCodigoIPC;
        property CodigoLOT : Integer read GetCodigoLOT write SetCodigoLOT;
        property CodigoPCP : Integer read GetCodigoPCP write SetCodigoPCP;
        { Código de Produto }
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descontos : String read GetDescontos write SetDescontos;
        property EAmostra : TEdit read FEAmostra write FEAmostra;
        property EBonificacao : TEdit read FEBonificacao write FEBonificacao;
        property ECodigoIPC : TEdit read FECodigoIPC write FECodigoIPC;
        property ECodigoLOT : TEdit read FECodigoLOT write FECodigoLOT;
        property ECodigoPCP : TEdit read FECodigoPCP write FECodigoPCP;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDescontos : TEdit read FEDescontos write FEDescontos;
        property EIPI : TEdit read FEIPI write FEIPI;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EPreco : TEdit read FEPreco write FEPreco;
        property EPrecoFinal : TEdit read FEPrecoFinal write FEPrecoFinal;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ETipoICMS : TComboBox read FETipoICMS write FETipoICMS;
        property IPI : Double read GetIPI write SetIPI;
        property Observacao : String read GetObservacao write SetObservacao;
        { Preco do ítem de pedido de compra }
        property Preco : Double read GetPreco write SetPreco;
        property PrecoFinal : Double read GetPrecoFinal write SetPrecoFinal;
        { Quantidade do ítem de pedido de compra }
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property TipoICMS : Integer read GetTipoICMS write SetTipoICMS;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_Pedido_Compra with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_Pedido_Compra]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_Pedido_Compra.AutoInitialize;
begin
     FEAmostra := nil;
     FEBonificacao := nil;
     FECodigoIPC := nil;
     FECodigoLOT := nil;
     FECodigoPCP := nil;
     FECodigoPRD := nil;
     FEDescontos := nil;
     FEIPI := nil;
     FEObservacao := nil;
     FEPreco := nil;
     FEPrecoFinal := nil;
     FEQuantidade := nil;
     FETipoICMS := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_Pedido_Compra.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAmostra then
        FEAmostra := nil;
     if AComponent = FEBonificacao then
        FEBonificacao := nil;
     if AComponent = FECodigoIPC then
        FECodigoIPC := nil;
     if AComponent = FECodigoLOT then
        FECodigoLOT := nil;
     if AComponent = FECodigoPCP then
        FECodigoPCP := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDescontos then
        FEDescontos := nil;
     if AComponent = FEIPI then
        FEIPI := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEPreco then
        FEPreco := nil;
     if AComponent = FEPrecoFinal then
        FEPrecoFinal := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FETipoICMS then
        FETipoICMS := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_Pedido_Compra.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Amostra }
function TItem_Pedido_Compra.GetAmostra : Double;
begin
  try
    Result := Self.fieldByName('IPC_AMOSTRA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Amostra }
procedure TItem_Pedido_Compra.SetAmostra(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_AMOSTRA').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_AMOSTRA"!');
  end;
end;

{ Read method for property Bonificacao }
function TItem_Pedido_Compra.GetBonificacao : Double;
begin
  try
    Result := Self.fieldByName('IPC_BONIFICACAO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Bonificacao }
procedure TItem_Pedido_Compra.SetBonificacao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_BONIFICACAO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_BONIFICACAO"!');
  end;
end;

{ Read method for property CodigoIPC }
function TItem_Pedido_Compra.GetCodigoIPC : Integer;
begin
  try
    Result := Self.fieldByName('IPC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoIPC }
procedure TItem_Pedido_Compra.SetCodigoIPC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_CODIGO"!');
  end;
end;

{ Read method for property CodigoLOT }
function TItem_Pedido_Compra.GetCodigoLOT : Integer;
begin
  try
    Result := Self.fieldByName('LOT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoLOT }
procedure TItem_Pedido_Compra.SetCodigoLOT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_CODIGO"!');
  end;
end;

{ Read method for property CodigoPCP }
function TItem_Pedido_Compra.GetCodigoPCP : Integer;
begin
  try
    Result := Self.fieldByName('PCP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPCP }
procedure TItem_Pedido_Compra.SetCodigoPCP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCP_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCP_CODIGO"!');
  end;
end;

{ Read method for property CodigoPRD }
function TItem_Pedido_Compra.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_Pedido_Compra.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Read method for property DataAlterado }
function TItem_Pedido_Compra.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('IPC_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItem_Pedido_Compra.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TItem_Pedido_Compra.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('IPC_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItem_Pedido_Compra.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_DT_CADASTRO"!');
  end;
end;

{ Read method for property Descontos }
function TItem_Pedido_Compra.GetDescontos : String;
begin
  try
    Result := Self.fieldByName('IPC_DESCONTOS').asString;
  except
    Result := '';
  end;
end;

{ Write method for property Descontos }
procedure TItem_Pedido_Compra.SetDescontos(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_DESCONTOS').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_DESCONTOS"!');
  end;
end;

{ Read method for property IPI }
function TItem_Pedido_Compra.GetIPI : Double;
begin
  try
    result := Self.fieldByName('IPC_IPI').asFloat;
  except
    result := 0
  end;
end;

{ Write method for property IPI }
procedure TItem_Pedido_Compra.SetIPI(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPC_IPI').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPC_IPI"!');
    end;
end;

{ Read method for property Observacao }
function TItem_Pedido_Compra.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('IPC_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TItem_Pedido_Compra.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_OBSERVACAO"!');
  end;
end;

{ Read method for property Preco }
function TItem_Pedido_Compra.GetPreco : Double;
begin
  try
    Result := Self.fieldByName('IPC_PRECO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Preco }
procedure TItem_Pedido_Compra.SetPreco(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPC_PRECO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPC_PRECO"!');
    end;
end;

{ Read method for property PrecoFinal }
function TItem_Pedido_Compra.GetPrecoFinal : Double;
begin
  try
    Result := Self.fieldByName('IPC_PRECO_FINAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoFinal }
procedure TItem_Pedido_Compra.SetPrecoFinal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_PRECO_FINAL').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_PRECO_FINAL"!');
  end;
end;

{ Read method for property Quantidade }
function TItem_Pedido_Compra.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('IPC_QUANTIDADE').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Quantidade }
procedure TItem_Pedido_Compra.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_QUANTIDADE').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_QUANTIDADE"!');
  end;
end;

{ Read method for property TipoICMS }
function TItem_Pedido_Compra.GetTipoICMS : Integer;
begin
  try
    Result := Self.fieldByName('IPC_TIPO_ICMS').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property TipoICMS }
procedure TItem_Pedido_Compra.SetTipoICMS(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_TIPO_ICMS').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_TIPO_ICMS"!');
  end;
end;

function TItem_Pedido_Compra.AlterarAuto:Boolean;
begin
  Result:=false;
  If not (localizarCod(CodigoIPC,CConfiguracao.CodigoCNC)) Then
    ShowMessage('Não foi possível alterar o registro pois o mesmo não existe!')
  Else
  begin
    try
      edit;
      try
         CodigoPRD := StrToInt(ECodigoPRD.Text);
      except
      end;
      try
        CodigoUSU := CConfiguracao.CodigoUSU;
      except
      end;
      try
        CodigoLOT := StrToInt(ECodigoLOT.Text);
      except
      end;      
      try
        DataAlterado := CConfiguracao.DataHora;
      except
      end;
      try
         Quantidade := StrToFloat(EQuantidade.Text);
      except
      end;
      try
         Bonificacao := StrToFloat(EBonificacao.Text);
      except
      end;
      try
         Amostra := StrToFloat(EAmostra.Text);
      except
      end;
      try
         Preco := StrToFloat(EPreco.Text);
      except
      end;
      try
         PrecoFinal := StrToFloat(EPrecoFinal.Text);
      except
      end;
      try
         IPI := StrToFloat(EIPI.Text);
      except
      end;
      try
         Descontos := EDescontos.Text;
      except
      end;
      try
         TipoICMS := ETipoICMS.ItemIndex;
      except
      end;
      try
         Observacao := EObservacao.Text;
      except
      end;
      try
        Post;
        Result:=True;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

procedure TItem_Pedido_Compra.AtualizaControles(Habilitar:Boolean);
begin
  Try
    if Estado = 1 then
      ECodigoPRD.Enabled  :=Habilitar
    else
      ECodigoPRD.Enabled  := False;
  Except
  End;
  Try
   EQuantidade.Enabled    :=Habilitar;
  Except
  End;
  Try
   EBonificacao.Enabled   :=Habilitar;
  Except
  End;
  Try
   EAmostra.Enabled   :=Habilitar;
  Except
  End;
  Try
    EPreco.Enabled         :=Habilitar;
  Except
  End;
  Try
    EPrecoFinal.Enabled         :=Habilitar;
  Except
  End;
  Try
    EIPI.Enabled           :=Habilitar;
  Except
  End;
  Try
    EDescontos.Enabled           :=Habilitar;
  Except
  End;
  Try
    ECodigoLOT.Enabled           :=Habilitar;
  Except
  End;  
  Try
    EObservacao.Enabled           :=Habilitar;
  Except
  End;
end;

procedure TItem_Pedido_Compra.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TItem_Pedido_Compra.CarregaDados;
begin
  Try
   ECodigoIPC.Text                :=IntToStr(CodigoIPC);
   Except
  End;
  Try
    ECodigoPRD.Text         :=IntToStr(CodigoPRD);
  Except
  End;
  Try
    EQuantidade.Text        :=Format('%.2f', [Quantidade]);
  Except
  End;
  Try
    EBonificacao.Text       :=Format('%.2f', [Bonificacao]);
  Except
  End;
  Try
    EAmostra.Text       :=Format('%.2f', [Amostra]);
  Except
  End;
  Try
    EPreco.Text             :=Format('%.4f', [Preco]);
  Except
  End;
  Try
    EPrecoFinal.Text             :=Format('%.4f', [PrecoFinal]);
  Except
  End;
  Try
    EIPI.Text               :=Format('%.2f', [IPI]);
  Except
  End;
  Try
    EDescontos.Text         :=Descontos;
  Except
  End;
  Try
    ETipoICMS.ItemIndex     := TipoICMS;
  Except
  End;
  Try
    ECodigoLOT.Text         := IntToStr(CodigoLOT);
  Except
  End;  
  Try
    EObservacao.Text         :=Observacao;
  Except
  End;
end;

constructor TItem_Pedido_Compra.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ITEM_DE_PEDIDO_DE_COMPRA';

     { Code to perform other tasks when the component is created }

end;

function TItem_Pedido_Compra.Deletar(CdCNC,CdIPC:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdIPC,CdCNC)) Then
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

destructor TItem_Pedido_Compra.Destroy;
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

function TItem_Pedido_Compra.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoPRD.text) then
    mensagem:=mensagem+'Código do Produto digitado incorretamente!'+#13;
  if not VerificaFloatBranco(EQuantidade.Text) then
    mensagem:= mensagem +'Quantidade digitada incorretamente!'+#13;
  if not VerificaFloatBranco(EBonificacao.Text) then
    mensagem:= mensagem +'Bonificação digitada incorretamente!'+#13;
  if not VerificaFloatBranco(EAmostra.Text) then
    mensagem:= mensagem +'Amostra Grátis digitada incorretamente!'+#13;
  if not VerificaFloatBranco(EPreco.Text) then
    mensagem:= mensagem +'Preço unitário digitado incorretamente!'+#13;
  if not VerificaFloatBranco(EPrecoFinal.Text) then
    mensagem:= mensagem +'Preço Final digitado incorretamente!'+#13;
  if not Verificafloat(EIPI.Text) then
    mensagem:= mensagem +'IPI digitado incorretamente!'+#13;
  if not VerificaDesconto(EDescontos.Text) then
    mensagem:= mensagem +'Desconto digitado incorretamente!'+#13;
  if not VerificaInteiroBranco(ECodigoLOT.text) then
    mensagem:=mensagem+'Código do Lote digitado incorretamente!'+#13;    
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    if (StrToFloat(EQuantidade.Text) < (StrToFloat(EBonificacao.Text)+StrToFloat(EAmostra.Text))) or
       (StrToFloat(EQuantidade.Text) <= 0) or
       (StrToFloat(EBonificacao.Text)<0) or
       (StrToFloat(EAmostra.Text)<0) then
    Begin
      ShowMessage('Quantidade/Bonificação/Amostra Inválida!');
      Exit
    end;
    if StrToFloat(EPreco.Text) <= 0 then
    Begin
      ShowMessage('Preço Unitário Inválido!');
      Exit;
    end;
    if StrToFloat(EPrecoFinal.Text) <= 0 then
    Begin
      ShowMessage('Preço Final Inválido!');
      Exit;
    end;
    if StrToFloat(EIPI.text) >= 100 then
    Begin
      ShowMessage('Valores de IPI inválido!');
      Exit;
    end;

    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoIPC;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        AtualizaControles(False);
        Estado:=0;
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TItem_Pedido_Compra.InserirAuto:Boolean;
begin
  Result := False;
  if LocalizarCod(SCodigo,CConfiguracao.CodigoCNC) then
    ShowMessage('Código de Item de Pedido de Compra já Cadastrado!')
  else
  Begin
    try
      append;
      try
         CodigoCNC   := CConfiguracao.CodigoCNC;
      except
      end;
      try
         CNCOrigem   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        codigoIPC := SCodigo;
      except
      end;
      try
         CodigoPCP   := StrToInt(ECodigoPCP.Text);
      except
      end;
      try
         CodigoPRD := StrToInt(ECodigoPRD.text);
      except
      end;
      try
         CodigoUSU := CConfiguracao.CodigoUSU;
      except
      end;
      try
         CodigoLOT := StrToInt(ECodigoLOT.text);
      except
      end;      
      try
         DataCadastro := CConfiguracao.DataHora;
      except
      end;
      try
         Quantidade := StrToFloat(EQuantidade.Text);
      except
      end;
      try
         Bonificacao := StrToFloat(EBonificacao.Text);
      except
      end;
      try
         Amostra := StrToFloat(EAmostra.Text);
      except
      end;
      try
         Preco := StrToFloat(EPreco.Text);
      except
      end;
      try
         PrecoFinal := StrToFloat(EPrecoFinal.Text);
      except
      end;
      try
         IPI := StrToFloat(EIPI.Text);
      except
      end;
      try
         Descontos := EDescontos.Text;
      except
      end;
      try
         TipoICMS := ETipoICMS.ItemIndex;
      except
      end;
      try
         Observacao := EObservacao.Text;
      except
      end;
      try
        Post;
        result:=True;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente. ITEM_DE_PEDIDO_DE_COMPRA');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. ITEM_DE_PEDIDO_DE_COMPRA');
    end;
  end;
end;

procedure TItem_Pedido_Compra.LimpaCampos;
begin
  Try
    ECodigoPRD.Clear;
  Except
  End;
  Try
    EQuantidade.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EBonificacao.Clear
    else
      EBonificacao.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      EAmostra.Clear
    else
      EAmostra.Text := '0';
  Except
  End;
  Try
    EPreco.Clear;
  Except
  End;
  Try
    EPrecoFinal.Clear;
  Except
  End;
  Try
    EDescontos.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoLOT.Clear
    else
      ECodigoLOT.Text := '0';
  Except
  End;  
  Try
    EObservacao.Clear;
  Except
  End;
end;

{ Localiza um ítem de pedido de compra }
function TItem_Pedido_Compra.LocalizarCod(CdIPC,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdIPC<>CodigoIPC) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;IPC_CODIGO', vararrayof([CdCNC, CdIPC]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_Pedido_Compra.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TItem_Pedido_Compra.PreparaInsercao;
begin
  ProximoCodigo('IPC_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TItem_Pedido_Compra.deletarauto:Boolean;
begin
  Result:=False;
  try
    if Delete then
    Begin
      Result:=True;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
