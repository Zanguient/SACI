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
unit Item_Pedido_Venda;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Pedido_de_Venda, Funcionario, Produto, Secao, 
     Tabela_de_Precos, AgenteFin, Movimento_Estoque_Comercial, 
     Movimento_Fisico, Configuracao, Item_de_Embarque, Forma_de_pagamento, 
     Dbgrids, Funcoes, Variants, Windows;



type
  TItem_Pedido_Venda = class(TSQuery)
    private
      { Private fields of TItem_Pedido_Venda }
        { Storage for property AVista }
        FAVista : Boolean;
        { Storage for property Bonificacao }
        FBonificacao : Double;
        { Storage for property CPedido_de_Venda }
        FCPedido_de_Venda : TPedido_de_Venda;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoIEB }
        FCodigoIEB : Integer;
        { Storage for property CodigoIPV }
        FCodigoIPV : Integer;
        { Storage for property CodigoLOT }
        FCodigoLOT : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoSEC }
        FCodigoSEC : Integer;
        { Storage for property CodigoTBP }
        FCodigoTBP : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataEntrada }
        FDataEntrada : TDateTime;
        { Storage for property DataSaida }
        FDataSaida : TDateTime;
        { Storage for property Desconto }
        FDesconto : Double;
        { Storage for property DiasEntrega }
        FDiasEntrega : Integer;
        { Storage for property EAVista }
        FEAVista : tCheckBox;
        { Storage for property EBonificacao }
        FEBonificacao : TEdit;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookUpComboBox;
        { Storage for property ECodigoIPV }
        FECodigoIPV : TEdit;
        { Storage for property ECodigoLOT }
        FECodigoLOT : TEdit;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoSEC }
        FECodigoSEC : TEdit;
        { Storage for property ECodigoTBP }
        FECodigoTBP : TEdit;
        { Storage for property EDesconto }
        FEDesconto : TEdit;
        { Storage for property EDiasEntrega }
        FEDiasEntrega : TEdit;
        { Storage for property EEntImediata }
        FEEntImediata : TCheckBox;
        { Storage for property ELocEst }
        FELocEst : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EPreco }
        FEPreco : TEdit;
        { Storage for property EPrecoDesc }
        FEPrecoDesc : TEdit;
        { Storage for property EPrecoSugerido }
        FEPrecoSugerido : TEdit;
        { Storage for property EPrecoUni }
        FEPrecoUni : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property EUnidade }
        FEUnidade : TEdit;
        { Storage for property EVinculo }
        FEVinculo : TEdit;
        { Storage for property Entrega }
        FEntrega : Boolean;
        { Storage for property EstoqueExterno }
        FEstoqueExterno : Double;
        { Storage for property EstoqueLocal }
        FEstoqueLocal : Double;
        { Storage for property ItemNota }
        FItemNota : Integer;
        { Storage for property LocEst }
        FLocEst : Integer;
        { Storage for property NotaSituacao }
        FNotaSituacao : Integer;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Pendencia }
        FPendencia : Integer;
        { Storage for property Preco }
        FPreco : Double;
        { Storage for property PrecoDesc }
        FPrecoDesc : Double;
        { Storage for property PrecoNota }
        FPrecoNota : Double;
        { Storage for property PrecoSugerido }
        FPrecoSugerido : Double;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Sequencia }
        FSequencia : Integer;
        { Storage for property Servico }
        FServico : Boolean;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Vinculo }
        FVinculo : Integer;

      { Private methods of TItem_Pedido_Venda }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property AVista }
        function GetAVista : Boolean;
        { Write method for property AVista }
        procedure SetAVista(Value : Boolean);
        { Read method for property Bonificacao }
        function GetBonificacao : Double;
        { Write method for property Bonificacao }
        procedure SetBonificacao(Value : Double);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoIEB }
        function GetCodigoIEB : Integer;
        { Write method for property CodigoIEB }
        procedure SetCodigoIEB(Value : Integer);
        { Read method for property CodigoIPV }
        function GetCodigoIPV : Integer;
        { Write method for property CodigoIPV }
        procedure SetCodigoIPV(Value : Integer);
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
        { Read method for property CodigoSEC }
        function GetCodigoSEC : Integer;
        { Write method for property CodigoSEC }
        procedure SetCodigoSEC(Value : Integer);
        { Read method for property CodigoTBP }
        function GetCodigoTBP : Integer;
        { Write method for property CodigoTBP }
        procedure SetCodigoTBP(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property DataEntrada }
        function GetDataEntrada : TDateTime;
        { Read method for property DataSaida }
        function GetDataSaida : TDateTime;
        { Read method for property Desconto }
        function GetDesconto : Double;
        { Write method for property Desconto }
        procedure SetDesconto(Value : Double);
        { Read method for property DiasEntrega }
        function GetDiasEntrega : Integer;
        { Write method for property DiasEntrega }
        procedure SetDiasEntrega(Value : Integer);
        { Read method for property Entrega }
        function GetEntrega : Boolean;
        { Write method for property Entrega }
        procedure SetEntrega(Value : Boolean);
        { Read method for property EstoqueExterno }
        function GetEstoqueExterno : Double;
        { Write method for property EstoqueExterno }
        procedure SetEstoqueExterno(Value : Double);
        { Read method for property EstoqueLocal }
        function GetEstoqueLocal : Double;
        { Write method for property EstoqueLocal }
        procedure SetEstoqueLocal(Value : Double);
        { Read method for property ItemNota }
        function GetItemNota : Integer;
        { Write method for property ItemNota }
        procedure SetItemNota(Value : Integer);
        { Read method for property LocEst }
        function GetLocEst : Integer;
        { Write method for property LocEst }
        procedure SetLocEst(Value : Integer);
        { Read method for property NotaSituacao }
        function GetNotaSituacao : Integer;
        { Write method for property NotaSituacao }
        procedure SetNotaSituacao(Value : Integer);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Pendencia }
        function GetPendencia : Integer;
        { Write method for property Pendencia }
        procedure SetPendencia(Value : Integer);
        { Read method for property Preco }
        function GetPreco : Double;
        { Write method for property Preco }
        procedure SetPreco(Value : Double);
        { Read method for property PrecoDesc }
        function GetPrecoDesc : Double;
        { Write method for property PrecoDesc }
        procedure SetPrecoDesc(Value : Double);
        { Read method for property PrecoNota }
        function GetPrecoNota : Double;
        { Write method for property PrecoNota }
        procedure SetPrecoNota(Value : Double);
        { Read method for property PrecoSugerido }
        function GetPrecoSugerido : Double;
        { Write method for property PrecoSugerido }
        procedure SetPrecoSugerido(Value : Double);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Sequencia }
        function GetSequencia : Integer;
        { Write method for property Sequencia }
        procedure SetSequencia(Value : Integer);
        { Read method for property Servico }
        function GetServico : Boolean;
        { Write method for property Servico }
        procedure SetServico(Value : Boolean);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Vinculo }
        function GetVinculo : Integer;
        { Write method for property Vinculo }
        procedure SetVinculo(Value : Integer);

    protected
      { Protected fields of TItem_Pedido_Venda }

      { Protected methods of TItem_Pedido_Venda }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_Pedido_Venda }
        PServico : Boolean;

      { Public methods of TItem_Pedido_Venda }
        function AlterarAuto(Pend :integer; EstLocal, EstExt :Double; PServico:Boolean=false; POBS:String=''):Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdIPV:Integer; PMotivo: string):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao(Pend :integer; EstLocal, EstExt :Double; PServico:Boolean=false; PSequencia:integer=0; POBS:string=''):Boolean;
        function InserirAuto(Pend :Integer; EstLocal, EstExt :Double; PServico:Boolean=false; PSequencia:integer=0; POBS: string=''):Boolean;
        procedure LimpaCampos;
        { Localiza um ítem de pedido de venda }
        function LocalizarCod(CdIPV,CdCNC:Integer):Boolean;
        function LocalizarProd(CdPRD:integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto(PMotivo: string):Boolean;

    published
      { Published properties of TItem_Pedido_Venda }
        property AVista : Boolean read GetAVista write SetAVista;
        property Bonificacao : Double read GetBonificacao write SetBonificacao;
        property CPedido_de_Venda : TPedido_de_Venda
             read FCPedido_de_Venda write FCPedido_de_Venda;
        { Código do Funcionário }
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property CodigoIEB : Integer read GetCodigoIEB write SetCodigoIEB;
        { Código do ítem de pedido de venda }
        property CodigoIPV : Integer read GetCodigoIPV write SetCodigoIPV;
        property CodigoLOT : Integer read GetCodigoLOT write SetCodigoLOT;
        { Código do Pedido de Venda }
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        { Código de Produto }
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        { Código da Seção }
        property CodigoSEC : Integer read GetCodigoSEC write SetCodigoSEC;
        { Código da tabela de preços }
        property CodigoTBP : Integer read GetCodigoTBP write SetCodigoTBP;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property DataEntrada : TDateTime
             read GetDataEntrada write FDataEntrada;
        property DataSaida : TDateTime read GetDataSaida write FDataSaida;
        property Desconto : Double read GetDesconto write SetDesconto;
        property DiasEntrega : Integer
             read GetDiasEntrega write SetDiasEntrega;
        property EAVista : tCheckBox read FEAVista write FEAVista;
        property EBonificacao : TEdit read FEBonificacao write FEBonificacao;
        property ECodigoFUN : TDBLookUpComboBox
             read FECodigoFUN write FECodigoFUN;
        property ECodigoIPV : TEdit read FECodigoIPV write FECodigoIPV;
        property ECodigoLOT : TEdit read FECodigoLOT write FECodigoLOT;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoSEC : TEdit read FECodigoSEC write FECodigoSEC;
        property ECodigoTBP : TEdit read FECodigoTBP write FECodigoTBP;
        property EDesconto : TEdit read FEDesconto write FEDesconto;
        property EDiasEntrega : TEdit read FEDiasEntrega write FEDiasEntrega;
        property EEntImediata : TCheckBox
             read FEEntImediata write FEEntImediata;
        property ELocEst : TEdit read FELocEst write FELocEst;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EPreco : TEdit read FEPreco write FEPreco;
        property EPrecoDesc : TEdit read FEPrecoDesc write FEPrecoDesc;
        property EPrecoSugerido : TEdit
             read FEPrecoSugerido write FEPrecoSugerido;
        property EPrecoUni : TEdit read FEPrecoUni write FEPrecoUni;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property EUnidade : TEdit read FEUnidade write FEUnidade;
        property EVinculo : TEdit read FEVinculo write FEVinculo;
        property Entrega : Boolean read GetEntrega write SetEntrega;
        property EstoqueExterno : Double
             read GetEstoqueExterno write SetEstoqueExterno;
        property EstoqueLocal : Double
             read GetEstoqueLocal write SetEstoqueLocal;
        property ItemNota : Integer read GetItemNota write SetItemNota;
        property LocEst : Integer read GetLocEst write SetLocEst;
        property NotaSituacao : Integer
             read GetNotaSituacao write SetNotaSituacao;
        property Observacao : String read GetObservacao write SetObservacao;
        property Pendencia : Integer read GetPendencia write SetPendencia;
        property Preco : Double read GetPreco write SetPreco;
        property PrecoDesc : Double read GetPrecoDesc write SetPrecoDesc;
        property PrecoNota : Double read GetPrecoNota write SetPrecoNota;
        property PrecoSugerido : Double
             read GetPrecoSugerido write SetPrecoSugerido;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Sequencia : Integer read GetSequencia write SetSequencia;
        property Servico : Boolean read GetServico write SetServico;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Vinculo : Integer read GetVinculo write SetVinculo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_Pedido_Venda with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_Pedido_Venda]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_Pedido_Venda.AutoInitialize;
begin
     PServico := False;
     FEAVista := nil;
     FEBonificacao := nil;
     FECodigoFUN := nil;
     FECodigoIPV := nil;
     FECodigoLOT := nil;
     FECodigoPDV := nil;
     FECodigoPRD := nil;
     FECodigoSEC := nil;
     FECodigoTBP := nil;
     FEDesconto := nil;
     FEDiasEntrega := nil;
     FEEntImediata := nil;
     FELocEst := nil;
     FEObservacao := nil;
     FEPreco := nil;
     FEPrecoDesc := nil;
     FEPrecoSugerido := nil;
     FEPrecoUni := nil;
     FEQuantidade := nil;
     FEUnidade := nil;
     FEVinculo := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_Pedido_Venda.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAVista then
        FEAVista := nil;
     if AComponent = FEBonificacao then
        FEBonificacao := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoIPV then
        FECodigoIPV := nil;
     if AComponent = FECodigoLOT then
        FECodigoLOT := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoSEC then
        FECodigoSEC := nil;
     if AComponent = FECodigoTBP then
        FECodigoTBP := nil;
     if AComponent = FEDesconto then
        FEDesconto := nil;
     if AComponent = FEDiasEntrega then
        FEDiasEntrega := nil;
     if AComponent = FEEntImediata then
        FEEntImediata := nil;
     if AComponent = FELocEst then
        FELocEst := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEPreco then
        FEPreco := nil;
     if AComponent = FEPrecoDesc then
        FEPrecoDesc := nil;
     if AComponent = FEPrecoSugerido then
        FEPrecoSugerido := nil;
     if AComponent = FEPrecoUni then
        FEPrecoUni := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FEUnidade then
        FEUnidade := nil;
     if AComponent = FEVinculo then
        FEVinculo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_Pedido_Venda.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property AVista }
function TItem_Pedido_Venda.GetAVista : Boolean;
begin
  try
    result := (Self.fieldByName('IPV_AVISTA').asInteger=1);
  except
    try
      Result := Self.fieldByName('IPV_AVISTA').asBoolean;
    except
      result:= False
    end;
  end;
end;

{ Write method for property AVista }
procedure TItem_Pedido_Venda.SetAVista(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('IPV_AVISTA').asInteger := 1
     else
       Self.fieldByName('IPV_AVISTA').asInteger := 0;
   except
      try
        Self.fieldByName('IPV_AVISTA').asBoolean := Value;
      except
        ShowMessage('Não foi possível alterar o campo "IPV_ENTREGA"!');
      end;
   end;
end;


{ Read method for property Bonificacao }
function TItem_Pedido_Venda.GetBonificacao : Double;
begin
  try
    Result := Self.fieldByName('IPV_BONIFICACAO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Bonificacao }
procedure TItem_Pedido_Venda.SetBonificacao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPV_BONIFICACAO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPV_BONIFICACAO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TItem_Pedido_Venda.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TItem_Pedido_Venda.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoIEB }
function TItem_Pedido_Venda.GetCodigoIEB : Integer;
begin
  try
    Result := Self.fieldByName('IEB_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoIEB }
procedure TItem_Pedido_Venda.SetCodigoIEB(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IEB_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IEB_CODIGO"!');
    end;
end;

{ Read method for property CodigoIPV }
function TItem_Pedido_Venda.GetCodigoIPV : Integer;
begin
  try
    Result := Self.fieldByName('IPV_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoIPV }
procedure TItem_Pedido_Venda.SetCodigoIPV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_CODIGO"!');
  end;
end;

{ Read method for property CodigoLOT }
function TItem_Pedido_Venda.GetCodigoLOT : Integer;
begin
  try
    Result := Self.fieldByName('LOT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoLOT }
procedure TItem_Pedido_Venda.SetCodigoLOT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_CODIGO"!');
  end;
end;

{ Read method for property CodigoPDV }
function TItem_Pedido_Venda.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPDV }
procedure TItem_Pedido_Venda.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
  end;
end;

{ Read method for property CodigoPRD }
function TItem_Pedido_Venda.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    Result := 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_Pedido_Venda.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Read method for property CodigoSEC }
function TItem_Pedido_Venda.GetCodigoSEC : Integer;
begin
  try
    Result := Self.fieldByName('SEC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoSEC }
procedure TItem_Pedido_Venda.SetCodigoSEC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SEC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SEC_CODIGO"!');
    end;
end;

{ Read method for property CodigoTBP }
function TItem_Pedido_Venda.GetCodigoTBP : Integer;
begin
  try
    Result := Self.fieldByName('TBP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTBP }
procedure TItem_Pedido_Venda.SetCodigoTBP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItem_Pedido_Venda.GetDataAlterado : TDateTime;
begin
  try
    result := Self.fieldByName('IPV_DT_ALTERADO').asDateTime;
  except
    result := 0;
  end;
end;

{ Read method for property DataCadastro }
function TItem_Pedido_Venda.GetDataCadastro : TDateTime;
begin
  try
    result := Self.fieldByName('IPV_DT_CADASTRO').asDateTime;
  except
    result := 0;
  end;
end;

{ Read method for property DataEntrada }
function TItem_Pedido_Venda.GetDataEntrada : TDateTime;
begin
  try
    result := Self.fieldByName('IPV_DT_ENTRADA').asDateTime;
  except
    result := 0;
  end;
end;

{ Read method for property DataSaida }
function TItem_Pedido_Venda.GetDataSaida : TDateTime;
begin
  try
    result := Self.fieldByName('IPV_DT_SAIDA').asDateTime;
  except
    result := 0;
  end;
end;

{ Read method for property Desconto }
function TItem_Pedido_Venda.GetDesconto : Double;
begin
  try
    result := Self.fieldByName('IPV_DESCONTO').asFloat;
  except
    result := 0
  end;
end;

{ Write method for property Desconto }
procedure TItem_Pedido_Venda.SetDesconto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPV_DESCONTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPV_DESCONTO"!');
    end;
end;

{ Read method for property DiasEntrega }
function TItem_Pedido_Venda.GetDiasEntrega : Integer;
begin
  try
    Result := Self.fieldByName('IPV_DIAS_ENTREGA').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property DiasEntrega }
procedure TItem_Pedido_Venda.SetDiasEntrega(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_DIAS_ENTREGA').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_DIAS_ENTREGA"!');
  end;
end;

{ Read method for property Entrega }
function TItem_Pedido_Venda.GetEntrega : Boolean;
begin
  try
    result := (Self.fieldByName('IPV_ENTREGA').asInteger=1);
  except
    result:= False;
  end;
end;

{ Write method for property Entrega }
procedure TItem_Pedido_Venda.SetEntrega(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('IPV_ENTREGA').asInteger := 1
     else
       Self.fieldByName('IPV_ENTREGA').asInteger := 0;
   except
      ShowMessage('Não foi possível alterar o campo "IPV_ENTREGA"!');
   end;
end;

{ Read method for property EstoqueExterno }
function TItem_Pedido_Venda.GetEstoqueExterno : Double;
begin
  try
    Result := Self.fieldByName('IPV_ESTOQUE_EXTERNO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property EstoqueExterno }
procedure TItem_Pedido_Venda.SetEstoqueExterno(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_ESTOQUE_EXTERNO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_ESTOQUE_EXTERNO"!');
  end;
end;

{ Read method for property EstoqueLocal }
function TItem_Pedido_Venda.GetEstoqueLocal : Double;
begin
  try
    Result := Self.fieldByName('IPV_ESTOQUE_LOCAL').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property EstoqueLocal }
procedure TItem_Pedido_Venda.SetEstoqueLocal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_ESTOQUE_LOCAL').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_ESTOQUE_LOCAL"!');
  end;
end;

{ Read method for property ItemNota }
function TItem_Pedido_Venda.GetItemNota : Integer;
begin
begin
  try
    Result := Self.fieldByName('IPV_ITEMNOTA').asInteger;
  except
    result:= 0
  end;
end;
end;

{ Write method for property ItemNota }
procedure TItem_Pedido_Venda.SetItemNota(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPV_ITEMNOTA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPV_ITEMNOTA"!');
    end;
end;

{ Read method for property LocEst }
function TItem_Pedido_Venda.GetLocEst : Integer;
begin
  try
    Result := Self.fieldByName('CNC_LOCAL_ESTOQUE').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property LocEst }
procedure TItem_Pedido_Venda.SetLocEst(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_LOCAL_ESTOQUE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_LOCAL_ESTOQUE"!');
    end;
end;

{ Read method for property NotaSituacao }
function TItem_Pedido_Venda.GetNotaSituacao : Integer;
begin
  try
    Result := Self.fieldByName('IPV_NOTA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NotaSituacao }
procedure TItem_Pedido_Venda.SetNotaSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPV_NOTA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPV_NOTA"!');
    end;
end;

{ Read method for property Observacao }
function TItem_Pedido_Venda.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('IPV_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TItem_Pedido_Venda.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPV_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPV_OBSERVACAO"!');
    end;
end;

{ Read method for property Pendencia }
function TItem_Pedido_Venda.GetPendencia : Integer;
begin
  try
    Result := Self.fieldByName('IPV_PENDENCIA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Pendencia }
procedure TItem_Pedido_Venda.SetPendencia(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IPV_PENDENCIA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IPV_PENDENCIA"!');
    end;
end;

{ Read method for property Preco }
function TItem_Pedido_Venda.GetPreco : Double;
begin
  try
    Result := Self.fieldByName('IPV_PRECO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Preco }
procedure TItem_Pedido_Venda.SetPreco(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_PRECO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_PRECO"!');
  end;
end;

{ Read method for property PrecoDesc }
function TItem_Pedido_Venda.GetPrecoDesc : Double;
begin
  try
    Result := Self.fieldByName('IPV_PRECO_DESC').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PrecoDesc }
procedure TItem_Pedido_Venda.SetPrecoDesc(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_PRECO_DESC').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_PRECO_DESC"!');
  end;
end;

{ Read method for property PrecoNota }
function TItem_Pedido_Venda.GetPrecoNota : Double;
begin
  try
    Result := Self.fieldByName('IPV_PRECO_NOTA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PrecoNota }
procedure TItem_Pedido_Venda.SetPrecoNota(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_PRECO_NOTA').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_PRECO_NOTA"!');
  end;
end;

{ Read method for property PrecoSugerido }
function TItem_Pedido_Venda.GetPrecoSugerido : Double;
begin
  try
    Result := Self.fieldByName('IPV_PRECO_SUGERIDO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PrecoSugerido }
procedure TItem_Pedido_Venda.SetPrecoSugerido(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_PRECO_SUGERIDO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_PRECO_SUGERIDO"!');
  end;
end;

{ Read method for property Quantidade }
function TItem_Pedido_Venda.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('IPV_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TItem_Pedido_Venda.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_QUANTIDADE').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_QUANTIDADE"!');
  end;
end;

{ Read method for property Sequencia }
function TItem_Pedido_Venda.GetSequencia : Integer;
begin
  try
    Result := Self.fieldByName('IPV_SEQUENCIA').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Sequencia }
procedure TItem_Pedido_Venda.SetSequencia(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_SEQUENCIA').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_SEQUENCIA"!');
  end;
end;

{ Read method for property Servico }
function TItem_Pedido_Venda.GetServico : Boolean;
begin
  try
    result := (Self.fieldByName('IPV_SERVICO').asInteger=1);
  except
    result:= False;
  end;
end;

{ Write method for property Servico }
procedure TItem_Pedido_Venda.SetServico(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('IPV_SERVICO').asInteger := 1
     else
       Self.fieldByName('IPV_SERVICO').asInteger := 0;
   except
      ShowMessage('Não foi possível alterar o campo "IPV_SERVICO"!');
   end;
end;

{ Read method for property Situacao }
function TItem_Pedido_Venda.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('IPV_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TItem_Pedido_Venda.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_SITUACAO"!');
  end;
end;

{ Read method for property Vinculo }
function TItem_Pedido_Venda.GetVinculo : Integer;
begin
  try
    Result := Self.fieldByName('IPV_VINCULO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Vinculo }
procedure TItem_Pedido_Venda.SetVinculo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IPV_VINCULO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IPV_VINCULO"!');
  end;
end;

function TItem_Pedido_Venda.AlterarAuto(Pend :integer; EstLocal, EstExt :Double; PServico:Boolean=false; POBS:String=''):Boolean;
var
  cEntrega,cAVista,Secao,LocalEst,cTBP,cBonificacao,cDesconto,
    cSugerido,cServico,cVinculo,sCodigoLOT:string;
begin
  try
    cVinculo := IntToStr(StrToInt(EVinculo.Text));
  except
    cVinculo := '0';
  end;
  try
    cSugerido := VirgPonto(EPrecoSugerido.Text);
  except
    cSugerido := '0';
  end;
  try
    cDesconto := VirgPonto(EDesconto.Text);
  except
    cDesconto := '0';
  end;
  try
    if ECodigoTBP.Text <> '' then
      cTBP := ECodigoTBP.Text
    else
      cTBP := '0';
  except
    cTBP := '0';
  end;
  try
    if EBonificacao.Text <> '' then
      cBonificacao := EBonificacao.Text
    else
      cBonificacao := '0';
  except
    cBonificacao := '0';
  end;
  try
    if EEntImediata.Checked then
      cEntrega := '1'
    else
      cEntrega := '0';
  except
    cEntrega := '1';
  end;
  try
    if EAVista.Checked then
      cAvista := '1'
    else
      cAvista := '0';
  except
    cAVista := '1';
  end;

  try
    if ECodigoSEC.Text <> '' then
      Secao := ECodigoSEC.Text
    else
      Secao := '0';
  except
    Secao := '0';
  end;

  try
    if ELocEst.Text <> '' then
      LocalEst := ELocEst.Text
    else
      LocalEst := IntToStr(CConfiguracao.CodigoCNC);
  except
    LocalEst := IntToStr(CConfiguracao.CodigoCNC);
  end;
  try
    if PServico then
      cServico := '1'
    else
      cServico := '0';
  except
  end;
  try
    sCodigoLOT := ',LOT_CODIGO='+IntToStr(StrToInt(ECodigoLOT.Text));
  except
    sCodigoLOT := '';
  end;
  try
    POBS := POBS + EObservacao.Text;
  except
  end;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
      '  USU_CODIGO='         +IntToStr(CConfiguracao.CodigoUSU)+
      ' ,IPV_DT_ALTERADO="'   +MesDiaHora(CConfiguracao.DataHora)+'" '+
      ' ,FUN_CODIGO='         +IntToStr(ECodigoFUN.KeyValue)+
      ' ,SEC_CODIGO='         +Secao+
      ' ,TBP_CODIGO='         +cTBP+
      sCodigoLOT+
      ' ,CNC_LOCAL_ESTOQUE='  +LocalEst+
      ' ,IPV_ENTREGA='        +cEntrega+
      ' ,IPV_AVISTA='         +cAVista+
      ' ,IPV_VINCULO='        +cVinculo+
      ' ,IPV_QUANTIDADE='     +VirgPonto(EQuantidade.Text)+
      ' ,IPV_BONIFICACAO='    +VirgPonto(cBonificacao)+
      ' ,IPV_DESCONTO='       +cDesconto+
      ' ,IPV_PRECO='          +VirgPonto(EPreco.Text)+
      ' ,IPV_PRECO_DESC='     +VirgPonto(EPrecoDesc.text)+
      ' ,IPV_PENDENCIA='      +IntToStr(Pend)+
      ' ,IPV_ESTOQUE_LOCAL='  +VirgPonto(EstLocal)+
      ' ,IPV_ESTOQUE_EXTERNO='+VirgPonto(EstExt)+
      ' ,IPV_PRECO_SUGERIDO=' +cSugerido+
      ' ,IPV_DIAS_ENTREGA="'  +EDiasEntrega.Text+'" '+
      ' ,IPV_SERVICO='        +cServico+
      ' ,IPV_OBSERVACAO="'    +POBS+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CConfiguracao.CodigoCNC)+
      ' AND IPV_CODIGO='+IntToStr(CodigoIPV));

    GeraLog(6580, CConfiguracao.CodigoCNC, CodigoPDV, 'IPV:'+IntToStr(CodigoIPV)+
      ' PRD:'+IntToStr(CodigoPRD)+
      ' Qtd:'+EQuantidade.Text+
      ' Preco:'+EPreco.Text+
      ' PrecoDesc:'+EPrecoDesc.Text+
      ' Sug:'+cSugerido+
      ' Bonus:'+EBonificacao.Text);
    Result:=True;
  except
    Result:=False;
    Cancel;
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TItem_Pedido_Venda.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled     :=not Habilitar;
  Except
  End;
  Try
    if not PServico then
      ECodigoFUN.Enabled     :=Habilitar;
  Except
  End;
  Try
    if CConfiguracao.Empresa <> 4 then //Motical
      ECodigoTBP.Enabled   :=Habilitar
    else
      ECodigoTBP.Enabled   := False;
  Except
  End;
  Try
    if Estado = 1 then
      ECodigoPRD.Enabled    := Habilitar
    else
      ECodigoPRD.Enabled    := False;
  Except
  End;
  Try
    if Estado = 1 then
      EVinculo.Enabled    := Habilitar
    else
      EVinculo.Enabled    := False;
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
  Try
    EEntImediata.Enabled   :=Habilitar;
  Except
  End;
  Try
    EBonificacao.Enabled   :=Habilitar;
  Except
  End;
  Try
    EDiasEntrega.Enabled   :=Habilitar;
  Except
  End;
  Try
    ECodigoLOT.Enabled   :=Habilitar;
  Except
  End;  
  Try
    EObservacao.Enabled   :=Habilitar;
  Except
  End;
end;

procedure TItem_Pedido_Venda.CancelaEdicao;
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

procedure TItem_Pedido_Venda.CarregaDados;
Var
  Aux:TNotifyEvent;
begin
  Try
    ECodigoIPV.Text                :=IntToStr(CodigoIPV);
  Except
  End;
  Try
    EPrecoDesc.Text          :=Format('%.2f', [PrecoDesc]);
  Except
  End;
  Try
    if not PServico then
      ECodigoFUN.KeyValue     :=CodigoFUN;
  Except
  End;
  Try
    ECodigoSEC.Text         :=IntToStr(CodigoSEC);
  Except
  End;
  Try
    ECodigoPRD.Text         :=IntToStr(CodigoPRD);
  Except
  End;
  Try
    EVinculo.Text         :=IntToStr(Vinculo);
  Except
  End;
  Try
    ECodigoTBP.Text         :=IntToStr(CodigoTBP);
  Except
  End;
  Try
    EEntImediata.Checked    :=Entrega;
  Except
  End;
  Try
    EAVista.Checked         :=AVista;
  Except
  End;
  Try
    EPrecoSugerido.Text        :=Format('%.2f', [PrecoSugerido]);
  Except
  End;
  Try
    EQuantidade.Text        :=Format('%.2f', [Quantidade]);
  Except
  End;
  Try
    ELocEst.Text            :=IntToStr(LocEst);
  Except
  End;
  Try
    Aux := EDesconto.OnChange;
    EDesconto.OnChange := nil;
    if Desconto <> 0 then
      EDesconto.Text     :=Format('%.4f', [Desconto])
    else
      EDesconto.Text:='0';
    EDesconto.OnChange :=Aux;
  Except
  End;
  Try
    if Bonificacao > 0 then
      EBonificacao.Text       :=format('%.2f',[Bonificacao])
    else
      EBonificacao.Text := '0';
  Except
  End;
  Try
    EPreco.Text             :=Format('%.2f', [Preco]);
  Except
  End;
  Try
    EDiasEntrega.Text       :=IntToStr(DiasEntrega);
  Except
  End;
  Try
    ECodigoLOT.Text       :=IntToStr(CodigoLOT);
  Except
  End;
  try
    EObservacao.Text := Observacao;
  except
  end;
end;

constructor TItem_Pedido_Venda.Create(AOwner: TComponent);
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

function TItem_Pedido_Venda.Deletar(CdCNC,CdIPV:Integer; PMotivo: string):Boolean;
var
  CdPDV, CdPRD: integer;
  vQtd, vPreco, vPrecoDesc, vSugestao: Double;
Begin
  Result := False;
  If not(localizarCod(CdIPV,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdPDV := CodigoPDV;
      CdPRD := CodigoPRD;
      vQtd  := Quantidade;
      vPreco := Preco;
      vPrecoDesc := PrecoDesc;
      vSugestao := PrecoSugerido;
      if Delete then
      Begin
        Result := True;
        RegistrarDel(CdCNC,1640(*ItemDePedidoDeVenda*),CdIPV,'PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+
          ' Qtd:'+format('%.2f',[vQtd])+
          ' Preco:'+format('%.2f',[vPreco])+
          ' PrecoDesc:'+format('%.2f',[vPrecoDesc])+
          ' Sug:'+format('%.2f',[vSugestao]));
        GeraLog(3640, CdCNC, CdPDV, 'IPV:'+IntToStr(CdIPV)+' PRD:'+IntToStr(CdPRD)+
          Trim(' '+PMotivo)+
          ' Qtd:'+format('%.2f',[vQtd])+
          ' Preco:'+format('%.2f',[vPreco])+
          ' PrecoDesc:'+format('%.2f',[vPrecoDesc])+
          ' Sug:'+format('%.2f',[vSugestao]));
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_Pedido_Venda.Destroy;
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

function TItem_Pedido_Venda.FinalizaEdicao(Pend :integer; EstLocal, EstExt :Double; PServico:Boolean=false; PSequencia:integer=0; POBS:string=''):Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux,Aux2:TDataSetNotifyEvent;
begin
  Result:=False;
  try
    if ECodigoTBP.Text = '' then
      ECodigoTBP.Text:='0';
  except
  end;
  try
    if ECodigoSEC.Text = '' then
      ECodigoSEC.Text:='0';
  except
  end;
  try
    if not VerificaFloatBranco(EBonificacao.Text) then
      EBonificacao.Text:='0';
  except
  end;
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
    if not VerificaInteiroBranco(ECodigoLOT.Text) then
      ECodigoLOT.Text := '0';
  except
  end;
  mensagem:='';
  If not verificainteirobranco(ECodigoPRD.Text) then
    mensagem:= mensagem + 'Produto digitado incorretamente!'+#13;
  If not VerificafloatBranco(EQuantidade.text) Then
    mensagem:=mensagem+'Quantidade digitada incorretamente!'+#13;
  if not verificafloat(EDesconto.text) then
    mensagem:= mensagem + 'Desconto digitado incorretamente!'+#13;
  if not verificafloat(EBonificacao.text) then
    mensagem:= mensagem + 'Bonificação digitada incorretamente!'+#13;
  If (ECodigoFUN.Text = '') then
    mensagem:= mensagem + 'Vendedor(a)/Técnico(a) inválido(a)!';
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    if StrToFloat(EQuantidade.Text) < StrToFloat(EBonificacao.Text) then
    Begin
      ShowMessage('Quantidade inferior a Bonificação!');
      Exit;
    end;
    Aux:=AfterScroll;
    AfterScroll:=nil;
    Aux2:=OnCalcFields;
    OnCalcFields:=nil;
    try
      If Estado=1 then
      Begin
        if Inserirauto(Pend,EstLocal,EstExt,PServico, PSequencia, POBS) then
        Begin
          Result := True;
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
        if Alterarauto(Pend,EstLocal,EstExt,PServico,POBS) then
        Begin
          Result := True;
          close;
          open;
          OnCalcFields := Aux2;
          LocalizarCod(cod, cdcnc);
          Estado:=0;
          AtualizaControles(False);
          CarregaDados;
        end;
      End;
    finally
      AfterScroll:=Aux;
      OnCalcFields := Aux2;
    end;
  end;
end;

function TItem_Pedido_Venda.InserirAuto(Pend :Integer; EstLocal, EstExt :Double; PServico:Boolean=false; PSequencia:integer=0; POBS: string=''):Boolean;
var
  cEntrega,cAVista,cSecao,cLocalEst,cTBP,cBonificacao,cSugerido,
    cDesconto,cServico,cVinculo,sCodigoLOT,sCabCodigoLOT:string;
begin
  Result:=False;
  try
    cVinculo := IntToStr(StrToInt(EVinculo.Text));
  except
    cVinculo := '0';
  end;
  try
    cSugerido := VirgPonto(EPrecoSugerido.Text);
  except
    cSugerido := '0';
  end;
  try
    cDesconto := VirgPonto(EDesconto.Text);
  except
    cDesconto := '0';
  end;
  try
    if ECodigoTBP.Text = '' then
      cTBP := '0'
    else
      cTBP := ECodigoTBP.Text;
  except
    cTBP := '0';
  end;
  try
    if EBonificacao.Text = '' then
      cBonificacao := '0'
    else
      cBonificacao := EBonificacao.Text;
  except
    cBonificacao := '0';
  end;
  try
    if EEntImediata.Checked then
      cEntrega := '1'
    else
      cEntrega := '0';
  except
    cEntrega := '1';
  end;
  try
    if EAVista.Checked then
      cAvista := '1'
    else
      cAvista := '0';
  except
    cAVista := '1';
  end;

  try
    if ECodigoSEC.Text <> '' then
      cSecao := ECodigoSEC.Text
    else
      cSecao := '0';
  except
    cSecao := '0';
  end;

  try
    if ELocEst.Text <> '' then
      cLocalEst := ELocEst.Text
    else
      cLocalEst := IntToStr(CConfiguracao.CodigoCNC);
  except
    cLocalEst := IntToStr(CConfiguracao.CodigoCNC);
  end;
  try
    if PServico then
      cServico := '1'
    else
      cServico := '0';
  except
  end;
  try
    sCabCodigoLOT := ',LOT_CODIGO';
    sCodigoLOT := ','+IntToStr(StrToInt(ECodigoLOT.Text));
  except
    sCabCodigoLOT := '';
    sCodigoLOT := '';
  end;
  try
    POBS := POBS + EObservacao.Text;
  except
  end;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT ITEM_DE_PEDIDO_DE_VENDA '+
      '(CNC_CODIGO,USU_CODIGO,IPV_CODIGO,FUN_CODIGO,IEB_CODIGO,PDV_CODIGO '+
      ',IPV_DT_CADASTRO,SEC_CODIGO,PRD_CODIGO,TBP_CODIGO,IPV_ENTREGA '+
      ',IPV_AVISTA,IPV_VINCULO,IPV_QUANTIDADE,IPV_DESCONTO,IPV_BONIFICACAO,CNC_LOCAL_ESTOQUE '+
      ',IPV_PRECO,IPV_SITUACAO,IPV_PRECO_DESC,IPV_NOTA,IPV_ITEMNOTA '+
      ',IPV_PRECO_NOTA,IPV_PENDENCIA,IPV_ESTOQUE_LOCAL '+
      ',IPV_ESTOQUE_EXTERNO,IPV_PRECO_SUGERIDO,IPV_DIAS_ENTREGA '+
      ',IPV_SERVICO,IPV_SEQUENCIA'+sCabCodigoLOT+',IPV_OBSERVACAO) '+
      ' VALUES '+
      '( '+IntToStr(CConfiguracao.CodigoCNC)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ', '+IntToStr(SCodigo)+
      ', '+IntToStr(ECodigoFUN.KeyValue)+
      ',0'+ //IEB_CODIGO
      ', '+ECodigoPDV.Text+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+cSecao+
      ', '+ECodigoPRD.Text+
      ', '+cTBP+
      ', '+cEntrega+
      ', '+cAVista+
      ', '+cVinculo+
      ', '+VirgPonto(EQuantidade.Text)+
      ', '+cDesconto+
      ', '+VirgPonto(cBonificacao)+
      ', '+cLocalEst+
      ', '+VirgPonto(EPreco.Text)+
      ',0'+ //SITUACAO
      ', '+VirgPonto(EPrecoDesc.text)+
      ',0'+ //IPV_NOTA
      ',0'+ //IPV_ITEMNOTA
      ',0'+ //IPV_PRECO_NOTA
      ', '+IntToStr(Pend)+
      ', '+VirgPonto(EstLocal)+
      ', '+VirgPonto(EstExt)+
      ', '+cSugerido+
      ',"'+EDiasEntrega.Text+'" '+
      ', '+cServico+
      ', '+IntToStr(PSequencia)+
      sCodigoLOT+
      ',"'+POBS+'") ');
    Result:=True;
  except
    Cancel;
    ShowMessage('Não foi possível alterar o registro corrente. ITEM_DE_PEDIDO_DE_VENDA');
  end;
{  except on e: Exception do
    ShowMessage('Não foi possível alterar o registro corrente. ITEM_DE_PEDIDO_DE_VENDA'+ #13 + e.Message);
  end;}
end;

procedure TItem_Pedido_Venda.LimpaCampos;
Var
  Aux:TNotifyEvent;
begin
  Try
    ECodigoPRD.Clear;
  Except
  End;
  Try
    Aux:=EPrecoDesc.OnChange;
    EPrecoDesc.OnChange:=nil;
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
    EDesconto.Text:='0';
    EDesconto.OnChange:=Aux;
  Except
  End;
  Try
    if Estado <> 1 then
      EVinculo.Clear
    else if CConfiguracao.Empresa = empLBM then
      EVinculo.Text := '-1'
    else
      EVinculo.Text := '0'
  Except
  End;
  Try
    EPreco.Clear;
  Except
  End;
  Try
    EPrecoSugerido.Clear;
  Except
  End;
  Try
    ELocEst.Text:=IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoTBP.Clear
    else
      ECodigoTBP.Text:='0';
  Except
  End;
  Try
    EPrecoUni.Clear;
  Except
  End;
  Try
    if estado <> 1 then
      EBonificacao.Clear
    else
      EBonificacao.Text:='0';
  Except
  End;
  Try
    if Estado <> 1 then
      EEntImediata.Checked:=False
    else
      EEntImediata.Checked:=True;
  Except
  End;
  Try
    if estado <> 1 then
      ECodigoLOT.Clear
    else
      ECodigoLOT.Text:='0';
  Except
  End;
  try
    EObservacao.Clear;
  except
  end;
end;

{ Localiza um ítem de pedido de venda }
function TItem_Pedido_Venda.LocalizarCod(CdIPV,CdCNC:Integer):Boolean;
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

function TItem_Pedido_Venda.LocalizarProd(CdPRD:integer):Boolean;
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

procedure TItem_Pedido_Venda.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TItem_Pedido_Venda.PreparaInsercao;
begin
  ProximoCodigo('IPV_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TItem_Pedido_Venda.deletarauto(PMotivo: string):Boolean;
var
  CdCNC, CdIPV, CdPDV, CdPRD: integer;
  vQtd, vPreco, vPrecoDesc, vSugestao: Double;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdIPV := CodigoIPV;
    CdPDV := CodigoPDV;
    CdPRD := CodigoPRD;
    vQtd  := Quantidade;
    vPreco := Preco;
    vPrecoDesc := PrecoDesc;
    vSugestao := PrecoSugerido;
    if Delete then
    Begin
      Result := True;
      RegistrarDel(CdCNC,1640(*ItemDePedidoDeVenda*),CdIPV,'PDV:'+IntToStr(CdPDV)+' PRD:'+IntToStr(CdPRD)+
        ' Qtd:'+format('%.2f',[vQtd])+
        ' Preco:'+format('%.2f',[vPreco])+
        ' PrecoDesc:'+format('%.2f',[vPrecoDesc])+
        ' Sug:'+format('%.2f',[vSugestao]));
      GeraLog(3640, CdCNC, CdPDV, 'IPV:'+IntToStr(CdIPV)+' PRD:'+IntToStr(CdPRD)+
        Trim(' '+PMotivo)+
        ' Qtd:'+format('%.2f',[vQtd])+
        ' Preco:'+format('%.2f',[vPreco])+
        ' PrecoDesc:'+format('%.2f',[vPrecoDesc])+
        ' Sug:'+format('%.2f',[vSugestao]));
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
