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
unit Item_Pacote_Venda;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Pedido_de_Venda, Funcionario, Produto, Secao, 
     Tabela_de_Precos, AgenteFin, Movimento_Estoque_Comercial, 
     Movimento_Fisico, Configuracao, Item_de_Embarque, Forma_de_pagamento, 
     Dbgrids, Funcoes, Variants;

type
  TItem_Pacote_Venda = class(TSQuery)
    private
      { Private fields of TItem_Pacote_Venda }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoGRP }
        FCodigoGRP : Integer;
        { Storage for property CodigoIPV }
        FCodigoIPV : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoSGP1 }
        FCodigoSGP1 : Integer;
        { Storage for property CodigoSGP2 }
        FCodigoSGP2 : Integer;
        { Storage for property CodigoSGP3 }
        FCodigoSGP3 : Integer;
        { Storage for property CodigoSGP4 }
        FCodigoSGP4 : Integer;
        { Storage for property Desconto }
        FDesconto : Double;
        { Storage for property ECodigoGRP }
        FECodigoGRP : TDBLookupComboBox;
        { Storage for property ECodigoIPV }
        FECodigoIPV : TEdit;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoSGP1 }
        FECodigoSGP1 : TDBLookUpComboBox;
        { Storage for property ECodigoSGP2 }
        FECodigoSGP2 : TDBLookUpComboBox;
        { Storage for property ECodigoSGP3 }
        FECodigoSGP3 : TDBLookUpComboBox;
        { Storage for property ECodigoSGP4 }
        FECodigoSGP4 : TDBLookUpComboBox;
        { Storage for property EDesconto }
        FEDesconto : TEdit;
        { Storage for property EPreco }
        FEPreco : TEdit;
        { Storage for property EPrecoDesc }
        FEPrecoDesc : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property Preco }
        FPreco : Double;
        { Storage for property PrecoDesc }
        FPrecoDesc : Double;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property QuantidadeEntregue }
        FQuantidadeEntregue : Double;
        { Storage for property Saldo }
        FSaldo : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TItem_Pacote_Venda }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoGRP }
        function GetCodigoGRP : Integer;
        { Write method for property CodigoGRP }
        procedure SetCodigoGRP(Value : Integer);
        { Read method for property CodigoIPV }
        function GetCodigoIPV : Integer;
        { Write method for property CodigoIPV }
        procedure SetCodigoIPV(Value : Integer);
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Write method for property CodigoPDV }
        procedure SetCodigoPDV(Value : Integer);
        { Read method for property CodigoSGP1 }
        function GetCodigoSGP1 : Integer;
        { Write method for property CodigoSGP1 }
        procedure SetCodigoSGP1(Value : Integer);
        { Read method for property CodigoSGP2 }
        function GetCodigoSGP2 : Integer;
        { Write method for property CodigoSGP2 }
        procedure SetCodigoSGP2(Value : Integer);
        { Read method for property CodigoSGP3 }
        function GetCodigoSGP3 : Integer;
        { Write method for property CodigoSGP3 }
        procedure SetCodigoSGP3(Value : Integer);
        { Read method for property CodigoSGP4 }
        function GetCodigoSGP4 : Integer;
        { Write method for property CodigoSGP4 }
        procedure SetCodigoSGP4(Value : Integer);
        { Read method for property Desconto }
        function GetDesconto : Double;
        { Write method for property Desconto }
        procedure SetDesconto(Value : Double);
        { Read method for property Preco }
        function GetPreco : Double;
        { Write method for property Preco }
        procedure SetPreco(Value : Double);
        { Read method for property PrecoDesc }
        function GetPrecoDesc : Double;
        { Write method for property PrecoDesc }
        procedure SetPrecoDesc(Value : Double);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property QuantidadeEntregue }
        function GetQuantidadeEntregue : Double;
        { Write method for property QuantidadeEntregue }
        procedure SetQuantidadeEntregue(Value : Double);
        { Read method for property Saldo }
        function GetSaldo : Double;
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TItem_Pacote_Venda }

      { Protected methods of TItem_Pacote_Venda }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_Pacote_Venda }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TItem_Pacote_Venda }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdIPV:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um ítem de pedido de venda }
        function LocalizarCod(CdIPV,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_Pacote_Venda }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoGRP : Integer read GetCodigoGRP write SetCodigoGRP;
        { Código do ítem de pedido de venda }
        property CodigoIPV : Integer read GetCodigoIPV write SetCodigoIPV;
        { Código do Pedido de Venda }
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        { Código de Produto }
        property CodigoSGP1 : Integer read GetCodigoSGP1 write SetCodigoSGP1;
        property CodigoSGP2 : Integer read GetCodigoSGP2 write SetCodigoSGP2;
        property CodigoSGP3 : Integer read GetCodigoSGP3 write SetCodigoSGP3;
        property CodigoSGP4 : Integer read GetCodigoSGP4 write SetCodigoSGP4;
        property Desconto : Double read GetDesconto write SetDesconto;
        property ECodigoGRP : TDBLookupComboBox
             read FECodigoGRP write FECodigoGRP;
        property ECodigoIPV : TEdit read FECodigoIPV write FECodigoIPV;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoSGP1 : TDBLookUpComboBox
             read FECodigoSGP1 write FECodigoSGP1;
        property ECodigoSGP2 : TDBLookUpComboBox
             read FECodigoSGP2 write FECodigoSGP2;
        property ECodigoSGP3 : TDBLookUpComboBox
             read FECodigoSGP3 write FECodigoSGP3;
        property ECodigoSGP4 : TDBLookUpComboBox
             read FECodigoSGP4 write FECodigoSGP4;
        property EDesconto : TEdit read FEDesconto write FEDesconto;
        property EPreco : TEdit read FEPreco write FEPreco;
        property EPrecoDesc : TEdit read FEPrecoDesc write FEPrecoDesc;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property Preco : Double read GetPreco write SetPreco;
        property PrecoDesc : Double read GetPrecoDesc write SetPrecoDesc;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property QuantidadeEntregue : Double
             read GetQuantidadeEntregue write SetQuantidadeEntregue;
        property Saldo : Double read GetSaldo write FSaldo;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_Pacote_Venda with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_Pacote_Venda]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_Pacote_Venda.AutoInitialize;
begin
     Estado := 0;
     FECodigoGRP := nil;
     FECodigoIPV := nil;
     FECodigoPDV := nil;
     FECodigoSGP1 := nil;
     FECodigoSGP2 := nil;
     FECodigoSGP3 := nil;
     FECodigoSGP4 := nil;
     FEDesconto := nil;
     FEPreco := nil;
     FEPrecoDesc := nil;
     FEQuantidade := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_Pacote_Venda.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoGRP then
        FECodigoGRP := nil;
     if AComponent = FECodigoIPV then
        FECodigoIPV := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoSGP1 then
        FECodigoSGP1 := nil;
     if AComponent = FECodigoSGP2 then
        FECodigoSGP2 := nil;
     if AComponent = FECodigoSGP3 then
        FECodigoSGP3 := nil;
     if AComponent = FECodigoSGP4 then
        FECodigoSGP4 := nil;
     if AComponent = FEDesconto then
        FEDesconto := nil;
     if AComponent = FEPreco then
        FEPreco := nil;
     if AComponent = FEPrecoDesc then
        FEPrecoDesc := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_Pacote_Venda.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TItem_Pacote_Venda.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TItem_Pacote_Venda.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoGRP }
function TItem_Pacote_Venda.GetCodigoGRP : Integer;
begin
  try
    Result := Self.fieldByName('GRP_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoGRP }
procedure TItem_Pacote_Venda.SetCodigoGRP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('GRP_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "GRP_CODIGO"!');
  end;
end;

{ Read method for property CodigoIPV }
function TItem_Pacote_Venda.GetCodigoIPV : Integer;
begin
  try
    Result := Self.fieldByName('IPV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoIPV }
procedure TItem_Pacote_Venda.SetCodigoIPV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_CODIGO"!');
  end;
end;

{ Read method for property CodigoPDV }
function TItem_Pacote_Venda.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPDV }
procedure TItem_Pacote_Venda.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
  end;
end;

{ Read method for property CodigoSGP1 }
function TItem_Pacote_Venda.GetCodigoSGP1 : Integer;
begin
  try
    Result := Self.fieldByName('SGP_CODIGO_1').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property CodigoSGP1 }
procedure TItem_Pacote_Venda.SetCodigoSGP1(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_CODIGO_1').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_CODIGO_1"!');
  end;
end;

{ Read method for property CodigoSGP2 }
function TItem_Pacote_Venda.GetCodigoSGP2 : Integer;
begin
  try
    Result := Self.fieldByName('SGP_CODIGO_2').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property CodigoSGP2 }
procedure TItem_Pacote_Venda.SetCodigoSGP2(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_CODIGO_2').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_CODIGO_2"!');
  end;
end;

{ Read method for property CodigoSGP3 }
function TItem_Pacote_Venda.GetCodigoSGP3 : Integer;
begin
  try
    Result := Self.fieldByName('SGP_CODIGO_3').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property CodigoSGP3 }
procedure TItem_Pacote_Venda.SetCodigoSGP3(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_CODIGO_3').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_CODIGO_3"!');
  end;
end;

{ Read method for property CodigoSGP4 }
function TItem_Pacote_Venda.GetCodigoSGP4 : Integer;
begin
  try
    Result := Self.fieldByName('SGP_CODIGO_4').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property CodigoSGP4 }
procedure TItem_Pacote_Venda.SetCodigoSGP4(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_CODIGO_4').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_CODIGO_4"!');
  end;
end;

{ Read method for property Desconto }
function TItem_Pacote_Venda.GetDesconto : Double;
begin
  try
    result := Self.fieldByName('IPC_DESCONTO').asFloat;
  except
    result := 0;
  end;
end;

{ Write method for property Desconto }
procedure TItem_Pacote_Venda.SetDesconto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPC_DESCONTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPC_DESCONTO"!');
    end;
end;

{ Read method for property Preco }
function TItem_Pacote_Venda.GetPreco : Double;
begin
  try
    Result := Self.fieldByName('IPC_PRECO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Preco }
procedure TItem_Pacote_Venda.SetPreco(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_PRECO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_PRECO"!');
  end;
end;

{ Read method for property PrecoDesc }
function TItem_Pacote_Venda.GetPrecoDesc : Double;
begin
  try
    Result := Self.fieldByName('IPC_PRECO_DESCONTO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoDesc }
procedure TItem_Pacote_Venda.SetPrecoDesc(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_PRECO_DESCONTO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_PRECO_DESCONTO"!');
  end;
end;

{ Read method for property Quantidade }
function TItem_Pacote_Venda.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('IPC_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TItem_Pacote_Venda.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_QUANTIDADE').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_QUANTIDADE"!');
  end;
end;

{ Read method for property QuantidadeEntregue }
function TItem_Pacote_Venda.GetQuantidadeEntregue : Double;
begin
  try
    Result := Self.fieldByName('IPC_QUANTIDADE_ENTREGUE').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property QuantidadeEntregue }
procedure TItem_Pacote_Venda.SetQuantidadeEntregue(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_QUANTIDADE_ENTREGUE').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_QUANTIDADE_ENTREGUE"!');
  end;
end;

{ Read method for property Saldo }
function TItem_Pacote_Venda.GetSaldo : Double;
begin
  try
    Result := Self.fieldByName('IPC_QUANTIDADE').asFloat-
              Self.fieldByName('IPC_QUANTIDADE_ENTREGUE').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Situacao }
function TItem_Pacote_Venda.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('IPC_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TItem_Pacote_Venda.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPC_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPC_SITUACAO"!');
  end;
end;

function TItem_Pacote_Venda.AlterarAuto:Boolean;
begin
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE ITEM_DE_PACOTE_DE_VENDA SET '+
      ' IPC_DT_ALTERADO="'   +MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',GRP_CODIGO='         +IntToStr(ECodigoGRP.KeyValue)+
      ',SGP_CODIGO_1='       +IntToStr(ECodigoSGP1.KeyValue)+
      ',SGP_CODIGO_2='       +IntToStr(ECodigoSGP2.KeyValue)+
      ',SGP_CODIGO_3='       +IntToStr(ECodigoSGP3.KeyValue)+
      ',SGP_CODIGO_4='       +IntToStr(ECodigoSGP4.KeyValue)+
      ',IPC_QUANTIDADE='     +VirgPonto(EQuantidade.Text)+
      ',IPC_DESCONTO='       +VirgPonto(EDesconto.Text)+
      ',IPC_PRECO='          +VirgPonto(EPreco.Text)+
      ',IPC_PRECO_DESC='     +VirgPonto(EPrecoDesc.text)+
      ' WHERE CNC_CODIGO='+IntToStr(CConfiguracao.CodigoCNC)+
      ' AND IPV_CODIGO='+IntToStr(CodigoIPV));
    Result:=True;
  except
    Result:=False;
    Cancel;
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TItem_Pacote_Venda.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled     :=not Habilitar;
  Except
  End;
  Try
    ECodigoGRP.Enabled      :=Habilitar;
  Except
  End;
  Try
    ECodigoSGP1.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoSGP2.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoSGP3.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoSGP4.Enabled     :=Habilitar;
  Except
  End;
  Try
    EQuantidade.Enabled    :=Habilitar;
  Except
  End;
  Try
    EDesconto.Enabled      :=Habilitar;
  Except
  End;
end;

procedure TItem_Pacote_Venda.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  CarregaDados;
end;

procedure TItem_Pacote_Venda.CarregaDados;
Var
  Aux:TNotifyEvent;
begin
  Try
    ECodigoIPV.Text                :=IntToStr(CodigoIPV);
  Except
  End;
  Try
    ECodigoGRP.KeyValue      :=CodigoGRP;
  Except
  End;
  Try
    ECodigoSGP1.KeyValue     :=CodigoSGP1;
  Except
  End;
  Try
    ECodigoSGP2.KeyValue     :=CodigoSGP2;
  Except
  End;
  Try
    ECodigoSGP3.KeyValue     :=CodigoSGP3;
  Except
  End;
  Try
    ECodigoSGP4.KeyValue     :=CodigoSGP4;
  Except
  End;
  Try
    EQuantidade.Text        :=Format('%.2f', [Quantidade]);
  Except
  End;
  Try
    EPreco.Text             :=Format('%.2f', [Preco]);
  Except
  End;
  Try
    Aux := EDesconto.OnChange;
    EDesconto.OnChange := nil;
    if Desconto > 0 then
      EDesconto.Text     :=Format('%.4f', [Desconto])
    else
      EDesconto.Text:='0';
    EDesconto.OnChange :=Aux;
  Except
  End;
  Try
    EPrecoDesc.Text          :=Format('%.2f', [PrecoDesc]);
  Except
  End;
end;

constructor TItem_Pacote_Venda.Create(AOwner: TComponent);
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

function TItem_Pacote_Venda.Deletar(CdCNC,CdIPV:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdIPV,CdCNC)) Then
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

destructor TItem_Pacote_Venda.Destroy;
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

function TItem_Pacote_Venda.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux,Aux2:TDataSetNotifyEvent;
begin
  Result := False;
  try
    if EDesconto.Text = '' then
      EDesconto.Text:='0';
  except
  end;
  try
    if EPrecoDesc.Text = '' then
      EPrecoDesc.Text:='0';
  except
  end;
  try
    if ECodigoSGP2.Text = '' then
      ECodigoSGP2.KeyValue := 0;
  except
  end;
  try
    if ECodigoSGP3.Text = '' then
      ECodigoSGP3.KeyValue := 0;
  except
  end;
  try
    if ECodigoSGP4.Text = '' then
      ECodigoSGP4.KeyValue := 0;
  except
  end;
  mensagem:='';
  If ECodigoGRP.Text = '' then
    mensagem:= mensagem + 'Código do Gupo inválido!'+#13;
  If ECodigoSGP1.Text = '' then
    mensagem:= mensagem + 'Código do SubGupo inválido!'+#13;
  If not VerificafloatBranco(EPreco.text) Then
    mensagem:=mensagem+'Preço inválido!'+#13;
  If not VerificafloatBranco(EPrecoDesc.text) Then
    mensagem:=mensagem+'Preço com desconto inválido!'+#13;
  If not VerificafloatBranco(EQuantidade.text) Then
    mensagem:=mensagem+'Quantidade digitada incorretamente!'+#13;
  if not verificafloat(EDesconto.text) then
    mensagem:= mensagem + 'Desconto digitado incorretamente!'+#13;
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
    Aux2:=OnCalcFields;
    OnCalcFields:=nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result:=True;
        close;
        open;
        OnCalcFields := Aux2;
        LocalizarCod(SCodigo,CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoIPV;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        Result:=True;
        close;
        open;
        OnCalcFields := Aux2;
        LocalizarCod(cod, cdcnc);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
    OnCalcFields := Aux2;
  end;
end;

function TItem_Pacote_Venda.InserirAuto:Boolean;
begin
  Result:=False;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO ITEM_DE_PACOTE_DE_VENDA '+
      '(CNC_CODIGO,IPV_CODIGO,PDV_CODIGO,USU_CODIGO'+
      ',GRP_CODIGO,SGP_CODIGO_1,SGP_CODIGO_2,SGP_CODIGO_3'+
      ',SGP_CODIGO_4,IPC_DT_CADASTRO,IPC_QUANTIDADE'+
      ',IPC_QUANTIDADE_ENTREGUE '+
      ',IPC_PRECO,IPC_DESCONTO,IPC_PRECO_DESCONTO'+
      ',IPC_SITUACAO,IPC_OBSERVACAO)'+
      ' VALUES ('+IntToStr(CConfiguracao.CodigoCNC)+
      ','+IntToStr(SCodigo)+
      ','+ECodigoPDV.Text+
      ','+IntToStr(CConfiguracao.CodigoUSU)+
      ','+IntToStr(ECodigoGRP.KeyValue)+
      ','+IntToStr(ECodigoSGP1.KeyValue)+
      ','+IntToStr(ECodigoSGP2.KeyValue)+
      ','+IntToStr(ECodigoSGP3.KeyValue)+
      ','+IntToStr(ECodigoSGP4.KeyValue)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ','+VirgPonto(EQuantidade.Text)+
      ',0'+ //Quantidade Entregue
      ','+VirgPonto(EPreco.Text)+
      ','+VirgPonto(EDesconto.Text)+
      ','+VirgPonto(EPrecoDesc.text)+
      ',0'+ //Situacao
      ',"") ');
    Result:=True;
  except
    Cancel;
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TItem_Pacote_Venda.LimpaCampos;
Var
  Aux:TNotifyEvent;
begin
  Try
    ECodigoGRP.KeyValue := -1;
  Except
  End;
  Try
    ECodigoSGP1.KeyValue := -1;
  Except
  End;
  Try
    ECodigoSGP2.KeyValue := -1;
  Except
  End;
  Try
    ECodigoSGP3.KeyValue := -1;
  Except
  End;
  Try
    ECodigoSGP4.KeyValue := -1;
  Except
  End;
  Try
    if Estado <> 1 then
      EPreco.Clear
    else
      EPreco.Text := '0';
  Except
  End;
  Try
    Aux:=EPrecoDesc.OnChange;
    EPrecoDesc.OnChange:=nil;
    if Estado <> 1 then
      EPrecoDesc.Clear
    else
      EPrecoDesc.Text := '0';
    EPrecoDesc.OnChange:=Aux;
  Except
  End;
  Try
    EQuantidade.Clear;
  Except
  End;
  Try
    Aux:=EDesconto.OnChange;
    EDesconto.OnChange:=nil;
    if Estado <> 1 then
      EDesconto.Clear
    else
      EDesconto.Text:='0';
    EDesconto.OnChange:=Aux;
  Except
  End;
  Try
    EPreco.Clear;
  Except
  End;
end;

{ Localiza um ítem de pedido de venda }
function TItem_Pacote_Venda.LocalizarCod(CdIPV,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
// Colocado em comentário para executar o onCalcFields no Finalizar com 1 item
//  If (CdIPV<>CodigoIPV) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;IPV_CODIGO', vararrayof([CdCNC, CdIPV]), []) Then
      Result:=True
    else
      Result:=False
//  Else
//    Result:=True;
end;

procedure TItem_Pacote_Venda.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TItem_Pacote_Venda.PreparaInsercao;
begin
  ProximoCodigo('IPV_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TItem_Pacote_Venda.deletarauto:Boolean;
begin
  Result := False;
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
end;


end.
