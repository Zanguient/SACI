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
unit Titulo_a_Pagar;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Forma_de_pagamento, Configuracao, Conta_de_Caixa, 
     Fornecedor, Funcoes, Variants;

type
  TTitulo_a_pagar = class(TSQuery)
    private
      { Private fields of TTitulo_a_pagar }
        { Storage for property CConta_de_Caixa }
        FCConta_de_Caixa : TConta_de_Caixa;
        { Storage for property CFormaPagamento }
        FCFormaPagamento : TForma_de_pagamento;
        { Storage for property ChequeCNC }
        FChequeCNC : Integer;
        { Storage for property CodigoBNF }
        FCodigoBNF : Integer;
        { Storage for property CodigoCCX }
        FCodigoCCX : Integer;
        { Storage for property CodigoCCXRecebimento }
        FCodigoCCXRecebimento : Integer;
        { Storage for property CodigoCHQ }
        FCodigoCHQ : String;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoMCC }
        FCodigoMCC : Integer;
        { Storage for property CodigoPCP }
        FCodigoPCP : Integer;
        { Storage for property CodigoTPG }
        FCodigoTPG : Integer;
        { Storage for property CodigoTRN }
        FCodigoTRN : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property Custodia }
        FCustodia : String;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataCompetencia }
        FDataCompetencia : TDateTime;
        { Storage for property Desconto }
        FDesconto : Double;
        { Storage for property ECodigoBNF }
        FECodigoBNF : TDBLookupComboBox;
        { Storage for property ECodigoCCX }
        FECodigoCCX : TDBLookupComboBox;
        { Storage for property ECodigoCCXRecebimento }
        FECodigoCCXRecebimento : TDBLookupComboBox;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TDBLookupComboBox;
        { Storage for property ECodigoPCP }
        FECodigoPCP : TEdit;
        { Storage for property ECodigoTPG }
        FECodigoTPG : TEdit;
        { Storage for property ECodigoTRN }
        FECodigoTRN : TDBLookupComboBox;
        { Storage for property ECustodia }
        FECustodia : TEdit;
        { Storage for property EDataCompetencia }
        FEDataCompetencia : TMaskEdit;
        { Storage for property EFormaPgto }
        FEFormaPgto : TEdit;
        { Storage for property EGerouMovimento }
        FEGerouMovimento : TCheckBox;
        { Storage for property ENumero }
        FENumero : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property EPagamento }
        FEPagamento : TMaskEdit;
        { Storage for property EPeriodo }
        FEPeriodo : TComboBox;
        { Storage for property ESequencia }
        FESequencia : TEdit;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property ETipoDoc }
        FETipoDoc : TDBLookupComboBox;
        { Storage for property ETipoPag }
        FETipoPag : TDBLookupComboBox;
        { Storage for property EValor }
        FEValor : TEdit;
        { Storage for property EValorPago }
        FEValorPago : TEdit;
        { Storage for property EVencimento }
        FEVencimento : TMaskEdit;
        { Storage for property FormaPgto }
        FFormaPgto : String;
        { Storage for property GerouMovimento }
        FGerouMovimento : Boolean;
        { Storage for property Juros }
        FJuros : Double;
        { Storage for property MovimentoContaCorrenteCNC }
        FMovimentoContaCorrenteCNC : Integer;
        { Storage for property Numero }
        FNumero : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Pagamento }
        FPagamento : TDateTime;
        { Storage for property Periodo }
        FPeriodo : Integer;
        { Storage for property Sequencia }
        FSequencia : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TipoDoc }
        FTipoDoc : Integer;
        { Storage for property TipoPag }
        FTipoPag : Integer;
        { Storage for property TituloAnt }
        FTituloAnt : Integer;
        { Storage for property TituloOri }
        FTituloOri : Integer;
        { Storage for property Valor }
        FValor : Double;
        { Storage for property ValorPago }
        FValorPago : Double;
        { Storage for property Vencimento }
        FVencimento : TDateTime;
        { Storage for property VencimentoORI }
        FVencimentoORI : TDateTime;

      { Private methods of TTitulo_a_pagar }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ChequeCNC }
        function GetChequeCNC : Integer;
        { Read method for property CodigoBNF }
        function GetCodigoBNF : Integer;
        { Write method for property CodigoBNF }
        procedure SetCodigoBNF(Value : Integer);
        { Read method for property CodigoCCX }
        function GetCodigoCCX : Integer;
        { Write method for property CodigoCCX }
        procedure SetCodigoCCX(Value : Integer);
        { Read method for property CodigoCCXRecebimento }
        function GetCodigoCCXRecebimento : Integer;
        { Write method for property CodigoCCXRecebimento }
        procedure SetCodigoCCXRecebimento(Value : Integer);
        { Read method for property CodigoCHQ }
        function GetCodigoCHQ : String;
        { Write method for property CodigoCHQ }
        procedure SetCodigoCHQ(Value : String);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Write method for property CodigoFOR }
        procedure SetCodigoFOR(Value : Integer);
        { Read method for property CodigoMCC }
        function GetCodigoMCC : Integer;
        { Write method for property CodigoMCC }
        procedure SetCodigoMCC(Value : Integer);
        { Read method for property CodigoPCP }
        function GetCodigoPCP : Integer;
        { Write method for property CodigoPCP }
        procedure SetCodigoPCP(Value : Integer);
        { Read method for property CodigoTPG }
        function GetCodigoTPG : Integer;
        { Write method for property CodigoTPG }
        procedure SetCodigoTPG(Value : Integer);
        { Read method for property CodigoTRN }
        function GetCodigoTRN : Integer;
        { Write method for property CodigoTRN }
        procedure SetCodigoTRN(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property Custodia }
        function GetCustodia : String;
        { Write method for property Custodia }
        procedure SetCustodia(Value : String);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property DataCompetencia }
        function GetDataCompetencia : TDateTime;
        { Write method for property DataCompetencia }
        procedure SetDataCompetencia(Value : TDateTime);
        { Read method for property Desconto }
        function GetDesconto : Double;
        { Write method for property Desconto }
        procedure SetDesconto(Value : Double);
        { Read method for property FormaPgto }
        function GetFormaPgto : String;
        { Write method for property FormaPgto }
        procedure SetFormaPgto(Value : String);
        { Read method for property GerouMovimento }
        function GetGerouMovimento : Boolean;
        { Write method for property GerouMovimento }
        procedure SetGerouMovimento(Value : Boolean);
        { Read method for property Juros }
        function GetJuros : Double;
        { Write method for property Juros }
        procedure SetJuros(Value : Double);
        { Read method for property MovimentoContaCorrenteCNC }
        function GetMovimentoContaCorrenteCNC : Integer;
        { Write method for property MovimentoContaCorrenteCNC }
        procedure SetMovimentoContaCorrenteCNC(Value : Integer);
        { Read method for property Numero }
        function GetNumero : String;
        { Write method for property Numero }
        procedure SetNumero(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Pagamento }
        function GetPagamento : TDateTime;
        { Write method for property Pagamento }
        procedure SetPagamento(Value : TDateTime);
        { Read method for property Periodo }
        function GetPeriodo : Integer;
        { Write method for property Periodo }
        procedure SetPeriodo(Value : Integer);
        { Read method for property Sequencia }
        function GetSequencia : String;
        { Write method for property Sequencia }
        procedure SetSequencia(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property TipoDoc }
        function GetTipoDoc : Integer;
        { Write method for property TipoDoc }
        procedure SetTipoDoc(Value : Integer);
        { Read method for property TipoPag }
        function GetTipoPag : Integer;
        { Write method for property TipoPag }
        procedure SetTipoPag(Value : Integer);
        { Read method for property TituloAnt }
        function GetTituloAnt : Integer;
        { Write method for property TituloAnt }
        procedure SetTituloAnt(Value : Integer);
        { Read method for property TituloOri }
        function GetTituloOri : Integer;
        { Write method for property TituloOri }
        procedure SetTituloOri(Value : Integer);
        { Read method for property Valor }
        function GetValor : Double;
        { Write method for property Valor }
        procedure SetValor(Value : Double);
        { Read method for property ValorPago }
        function GetValorPago : Double;
        { Write method for property ValorPago }
        procedure SetValorPago(Value : Double);
        { Read method for property Vencimento }
        function GetVencimento : TDateTime;
        { Write method for property Vencimento }
        procedure SetVencimento(Value : TDateTime);
        { Read method for property VencimentoORI }
        function GetVencimentoORI : TDateTime;
        { Write method for property VencimentoORI }
        procedure SetVencimentoORI(Value : TDateTime);

    protected
      { Protected fields of TTitulo_a_pagar }

      { Protected methods of TTitulo_a_pagar }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TTitulo_a_pagar }

      { Public methods of TTitulo_a_pagar }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdTPG:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Abastecimento }
        function Inserir(CdCNC,CdTPG,CdPCP,CdBNF,CdCCX,CdCCXRec,CdFOR,CdTRN,PTipo,PPeriodo: Integer;POBS,PCustodia,PNumero:String;PVencimento, DtPag,DeOri,DtCom:TDateTime; PValor, PValorPago:Double;PFormaPgto,PSeq:String;PTipoPag,PAnt,POri:Integer;PMov:Boolean):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um abastecimeto }
        function LocalizarCod(CdTPG, CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function QtdeTitulos(Temp:String):Integer;
        function ReabreTitulo:Boolean;
        function deletarauto:Boolean;

    published
      { Published properties of TTitulo_a_pagar }
        property CConta_de_Caixa : TConta_de_Caixa
             read FCConta_de_Caixa write FCConta_de_Caixa;
        property CFormaPagamento : TForma_de_pagamento
             read FCFormaPagamento write FCFormaPagamento;
        property ChequeCNC : Integer read GetChequeCNC write FChequeCNC;
        property CodigoBNF : Integer read GetCodigoBNF write SetCodigoBNF;
        property CodigoCCX : Integer read GetCodigoCCX write SetCodigoCCX;
        property CodigoCCXRecebimento : Integer
             read GetCodigoCCXRecebimento write SetCodigoCCXRecebimento;
        property CodigoCHQ : String read GetCodigoCHQ write SetCodigoCHQ;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        { Movimento de Conta Corrente }
        property CodigoMCC : Integer read GetCodigoMCC write SetCodigoMCC;
        { Código do Abastecimento }
        property CodigoPCP : Integer read GetCodigoPCP write SetCodigoPCP;
        property CodigoTPG : Integer read GetCodigoTPG write SetCodigoTPG;
        property CodigoTRN : Integer read GetCodigoTRN write SetCodigoTRN;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property Custodia : String read GetCustodia write SetCustodia;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataCompetencia : TDateTime
             read GetDataCompetencia write SetDataCompetencia;
        property Desconto : Double read GetDesconto write SetDesconto;
        property ECodigoBNF : TDBLookupComboBox
             read FECodigoBNF write FECodigoBNF;
        property ECodigoCCX : TDBLookupComboBox
             read FECodigoCCX write FECodigoCCX;
        property ECodigoCCXRecebimento : TDBLookupComboBox
             read FECodigoCCXRecebimento write FECodigoCCXRecebimento;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoFOR : TDBLookupComboBox
             read FECodigoFOR write FECodigoFOR;
        property ECodigoPCP : TEdit read FECodigoPCP write FECodigoPCP;
        property ECodigoTPG : TEdit read FECodigoTPG write FECodigoTPG;
        property ECodigoTRN : TDBLookupComboBox
             read FECodigoTRN write FECodigoTRN;
        property ECustodia : TEdit read FECustodia write FECustodia;
        property EDataCompetencia : TMaskEdit
             read FEDataCompetencia write FEDataCompetencia;
        property EFormaPgto : TEdit read FEFormaPgto write FEFormaPgto;
        property EGerouMovimento : TCheckBox
             read FEGerouMovimento write FEGerouMovimento;
        property ENumero : TEdit read FENumero write FENumero;
        property EOBS : TMemo read FEOBS write FEOBS;
        property EPagamento : TMaskEdit read FEPagamento write FEPagamento;
        property EPeriodo : TComboBox read FEPeriodo write FEPeriodo;
        property ESequencia : TEdit read FESequencia write FESequencia;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property ETipoDoc : TDBLookupComboBox read FETipoDoc write FETipoDoc;
        property ETipoPag : TDBLookupComboBox read FETipoPag write FETipoPag;
        property EValor : TEdit read FEValor write FEValor;
        property EValorPago : TEdit read FEValorPago write FEValorPago;
        property EVencimento : TMaskEdit read FEVencimento write FEVencimento;
        property FormaPgto : String read GetFormaPgto write SetFormaPgto;
        property GerouMovimento : Boolean
             read GetGerouMovimento write SetGerouMovimento;
        property Juros : Double read GetJuros write SetJuros;
        property MovimentoContaCorrenteCNC : Integer
             read GetMovimentoContaCorrenteCNC write SetMovimentoContaCorrenteCNC;
        property Numero : String read GetNumero write SetNumero;
        property OBS : String read GetOBS write SetOBS;
        property Pagamento : TDateTime read GetPagamento write SetPagamento;
        property Periodo : Integer read GetPeriodo write SetPeriodo;
        property Sequencia : String read GetSequencia write SetSequencia;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property TipoDoc : Integer read GetTipoDoc write SetTipoDoc;
        property TipoPag : Integer read GetTipoPag write SetTipoPag;
        property TituloAnt : Integer read GetTituloAnt write SetTituloAnt;
        property TituloOri : Integer read GetTituloOri write SetTituloOri;
        property Valor : Double read GetValor write SetValor;
        property ValorPago : Double read GetValorPago write SetValorPago;
        property Vencimento : TDateTime read GetVencimento write SetVencimento;
        property VencimentoORI : TDateTime
             read GetVencimentoORI write SetVencimentoORI;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTitulo_a_pagar with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTitulo_a_pagar]);
end;

{ Method to set variable and property values and create objects }
procedure TTitulo_a_pagar.AutoInitialize;
begin
     FECodigoBNF := nil;
     FECodigoCCX := nil;
     FECodigoCCXRecebimento := nil;
     FECodigoCNC := nil;
     FECodigoFOR := nil;
     FECodigoPCP := nil;
     FECodigoTPG := nil;
     FECodigoTRN := nil;
     FECustodia := nil;
     FEDataCompetencia := nil;
     FEFormaPgto := nil;
     FEGerouMovimento := nil;
     FENumero := nil;
     FEOBS := nil;
     FEPagamento := nil;
     FEPeriodo := nil;
     FESequencia := nil;
     FESituacao := nil;
     FETipoDoc := nil;
     FETipoPag := nil;
     FEValor := nil;
     FEValorPago := nil;
     FEVencimento := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TTitulo_a_pagar.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoBNF then
        FECodigoBNF := nil;
     if AComponent = FECodigoCCX then
        FECodigoCCX := nil;
     if AComponent = FECodigoCCXRecebimento then
        FECodigoCCXRecebimento := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FECodigoPCP then
        FECodigoPCP := nil;
     if AComponent = FECodigoTPG then
        FECodigoTPG := nil;
     if AComponent = FECodigoTRN then
        FECodigoTRN := nil;
     if AComponent = FECustodia then
        FECustodia := nil;
     if AComponent = FEDataCompetencia then
        FEDataCompetencia := nil;
     if AComponent = FEFormaPgto then
        FEFormaPgto := nil;
     if AComponent = FEGerouMovimento then
        FEGerouMovimento := nil;
     if AComponent = FENumero then
        FENumero := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEPagamento then
        FEPagamento := nil;
     if AComponent = FEPeriodo then
        FEPeriodo := nil;
     if AComponent = FESequencia then
        FESequencia := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipoDoc then
        FETipoDoc := nil;
     if AComponent = FETipoPag then
        FETipoPag := nil;
     if AComponent = FEValor then
        FEValor := nil;
     if AComponent = FEValorPago then
        FEValorPago := nil;
     if AComponent = FEVencimento then
        FEVencimento := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TTitulo_a_pagar.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ChequeCNC }
function TTitulo_a_pagar.GetChequeCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CHEQUE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoBNF }
function TTitulo_a_pagar.GetCodigoBNF : Integer;
begin
  try
    Result := Self.fieldByName('BNF_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoBNF }
procedure TTitulo_a_pagar.SetCodigoBNF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BNF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BNF_CODIGO"!');
    end;
end;

{ Read method for property CodigoCCX }
function TTitulo_a_pagar.GetCodigoCCX : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCCX }
procedure TTitulo_a_pagar.SetCodigoCCX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_CODIGO"!');
    end;
end;

{ Read method for property CodigoCCXRecebimento }
function TTitulo_a_pagar.GetCodigoCCXRecebimento : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO_REC').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCCXRecebimento }
procedure TTitulo_a_pagar.SetCodigoCCXRecebimento(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_CODIGO_REC').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_CODIGO_REC"!');
    end;
end;

{ Read method for property CodigoCHQ }
function TTitulo_a_pagar.GetCodigoCHQ : String;
begin
  try
    Result := Self.fieldByName('CHQ_CODIGO').asString;
  except
    result:= '0'
  end;
end;

{ Write method for property CodigoCHQ }
procedure TTitulo_a_pagar.SetCodigoCHQ(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CHQ_CODIGO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CHQ_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TTitulo_a_pagar.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TTitulo_a_pagar.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFOR }
function TTitulo_a_pagar.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property CodigoFOR }
procedure TTitulo_a_pagar.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property CodigoMCC }
function TTitulo_a_pagar.GetCodigoMCC : Integer;
begin
  try
    Result := Self.fieldByName('MCC_TIPO_PERIODO').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property CodigoMCC }
procedure TTitulo_a_pagar.SetCodigoMCC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCC_CODIGO"!');
    end;
end;

{ Read method for property CodigoPCP }
function TTitulo_a_pagar.GetCodigoPCP : Integer;
begin
  try
    Result := Self.fieldByName('PCP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPCP }
procedure TTitulo_a_pagar.SetCodigoPCP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_CODIGO"!');
    end;
end;

{ Read method for property CodigoTPG }
function TTitulo_a_pagar.GetCodigoTPG : Integer;
begin
  try
    Result := Self.fieldByName('TPG_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTPG }
procedure TTitulo_a_pagar.SetCodigoTPG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_CODIGO"!');
    end;
end;

{ Read method for property CodigoTRN }
function TTitulo_a_pagar.GetCodigoTRN : Integer;
begin
  try
    Result := Self.fieldByName('TRN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTRN }
procedure TTitulo_a_pagar.SetCodigoTRN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRN_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TTitulo_a_pagar.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TTitulo_a_pagar.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property Custodia }
function TTitulo_a_pagar.GetCustodia : String;
begin
  try
    Result := Self.fieldByName('TPG_CUSTODIA').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Custodia }
procedure TTitulo_a_pagar.SetCustodia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_CUSTODIA').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_CUSTODIA"!');
    end;
end;


{ Read method for property DataAlterado }
function TTitulo_a_pagar.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('TPG_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TTitulo_a_pagar.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_DT_ALTERADO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TTitulo_a_pagar.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('TPG_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TTitulo_a_pagar.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_DT_CADASTRO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_DT_CADASTRO"!');
    end;
end;

{ Read method for property DataCompetencia }
function TTitulo_a_pagar.GetDataCompetencia : TDateTime;
begin
  try
    Result := Self.fieldByName('TPG_DT_COMPETENCIA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCompetencia }
procedure TTitulo_a_pagar.SetDataCompetencia(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_DT_COMPETENCIA').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_DT_COMPETENCIA"!');
    end;
end;

{ Read method for property Desconto }
function TTitulo_a_pagar.GetDesconto : Double;
begin
  try
    Result := Self.fieldByName('TPG_DESCONTO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Desconto }
procedure TTitulo_a_pagar.SetDesconto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_DESCONTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_DESCONTO"!');
    end;
end;

{ Read method for property FormaPgto }
function TTitulo_a_pagar.GetFormaPgto : String;
begin
  try
    Result := Self.fieldByName('TPG_FORMA_PGTO').asString;
  except
    result:= ''
  end;
end;


{ Write method for property FormaPgto }
procedure TTitulo_a_pagar.SetFormaPgto(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_FORMA_PGTO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_FORMA_PGTO"!');
    end;
end;

{ Read method for property GerouMovimento }
function TTitulo_a_pagar.GetGerouMovimento : Boolean;
begin
  try
    result := (Self.fieldByName('TPG_GEROU_MOVIMENTO').asInteger=1);
  except
    try
      result := Self.fieldByName('TPG_GEROU_MOVIMENTO').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Write method for property GerouMovimento }
procedure TTitulo_a_pagar.SetGerouMovimento(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('TPG_GEROU_MOVIMENTO').asInteger := 1
      else
        Self.fieldByName('TPG_GEROU_MOVIMENTO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_GEROU_MOVIMENTO"!');
    end;
end;

{ Read method for property Juros }
function TTitulo_a_pagar.GetJuros : Double;
begin
  try
    Result := Self.fieldByName('TPG_JUROS').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Juros }
procedure TTitulo_a_pagar.SetJuros(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_JUROS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_JUROS"!');
    end;
end;

{ Read method for property MovimentoContaCorrenteCNC }
function TTitulo_a_pagar.GetMovimentoContaCorrenteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_MOVIMNETO_CONTA_CORRENTE').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property MovimentoContaCorrenteCNC }
procedure TTitulo_a_pagar.SetMovimentoContaCorrenteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_MOVIMENTO_CONTA_CORRENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_MOVIMENTO_CONTA_CORRENTE"!');
    end;
end;

{ Read method for property Numero }
function TTitulo_a_pagar.GetNumero : String;
begin
  try
    Result := Self.fieldByName('TPG_NUMERO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Numero }
procedure TTitulo_a_pagar.SetNumero(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TPG_NUMERO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TPG_NUMERO"!');
  end;
end;

{ Read method for property OBS }
function TTitulo_a_pagar.GetOBS : String;
begin
  try
    Result := Self.fieldByName('TPG_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TTitulo_a_pagar.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TPG_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TPG_OBSERVACAO"!');
  end;
end;

{ Read method for property Pagamento }
function TTitulo_a_pagar.GetPagamento : TDateTime;
begin
  try
    Result := Self.fieldByName('TPG_PAGAMENTO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Pagamento }
procedure TTitulo_a_pagar.SetPagamento(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_PAGAMENTO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_PAGAMENTO"!');
    end;
end;

{ Read method for property Periodo }
function TTitulo_a_pagar.GetPeriodo : Integer;
begin
  try
    Result := Self.fieldByName('TPG_TIPO_PERIODO').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property Periodo }
procedure TTitulo_a_pagar.SetPeriodo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_TIPO_PERIODO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_TIPO_PERIODO"!');
    end;
end;

{ Read method for property Sequencia }
function TTitulo_a_pagar.GetSequencia : String;
begin
  try
    Result := Self.fieldByName('TPG_SEQUENCIA').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Sequencia }
procedure TTitulo_a_pagar.SetSequencia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_SEQUENCIA').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_SEQUENCIA"!');
    end;
end;

{ Read method for property Situacao }
function TTitulo_a_pagar.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('TPG_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TTitulo_a_pagar.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_SITUACAO"!');
    end;
end;

{ Read method for property TipoDoc }
function TTitulo_a_pagar.GetTipoDoc : Integer;
begin
  try
    Result := Self.fieldByName('TPG_TIPO_DOC').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoDoc }
procedure TTitulo_a_pagar.SetTipoDoc(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_TIPO_DOC').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_TIPO_DOC"!');
    end;
end;

{ Read method for property TipoPag }
function TTitulo_a_pagar.GetTipoPag : Integer;
begin
  try
    Result := Self.fieldByName('TPG_TIPO_PAG').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoPag }
procedure TTitulo_a_pagar.SetTipoPag(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_TIPO_PAG').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_TIPO_PAG"!');
    end;
end;

{ Read method for property TituloAnt }
function TTitulo_a_pagar.GetTituloAnt : Integer;
begin
  try
    Result := Self.fieldByName('TPG_TITULOANT').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TituloAnt }
procedure TTitulo_a_pagar.SetTituloAnt(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_TITULOANT').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_TITULOANT"!');
    end;
end;

{ Read method for property TituloOri }
function TTitulo_a_pagar.GetTituloOri : Integer;
begin
  try
    Result := Self.fieldByName('TPG_TPGORIGINAL').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TituloOri }
procedure TTitulo_a_pagar.SetTituloOri(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_TPGORIGINAL').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_TPGORIGINAL"!');
    end;
end;

{ Read method for property Valor }
function TTitulo_a_pagar.GetValor : Double;
begin
  try
    Result := Self.fieldByName('TPG_VALOR').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Valor }
procedure TTitulo_a_pagar.SetValor(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_VALOR').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_VALOR"!');
    end;
end;


{ Read method for property ValorPago }
function TTitulo_a_pagar.GetValorPago : Double;
begin
  try
    Result := Self.fieldByName('TPG_VALOR_PAGO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ValorPago }
procedure TTitulo_a_pagar.SetValorPago(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_VALOR_PAGO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_VALOR_PAGO"!');
    end;
end;


{ Read method for property Vencimento }
function TTitulo_a_pagar.GetVencimento : TDateTime;
begin
  try
    Result := Self.fieldByName('TPG_VENCIMENTO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Vencimento }
procedure TTitulo_a_pagar.SetVencimento(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_VENCIMENTO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_VENCIMENTO"!');
    end;
end;

{ Read method for property VencimentoORI }
function TTitulo_a_pagar.GetVencimentoORI : TDateTime;
begin
  try
    Result := Self.fieldByName('TPG_DTORIGINAL').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property VencimentoORI }
procedure TTitulo_a_pagar.SetVencimentoORI(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_DTORIGINAL').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_DTORIGINAL"!');
    end;
end;

function TTitulo_a_pagar.AlterarAuto:Boolean;
var
  sCodigoFOR, sCodigoTRN, sCodigoUSU, sDataAlterado,
    sCodigoCCX, sCodigoCCXRec, sCodigoPCP, sValor, sVencimento,
    sCompetencia, sTipoDoc, sTipoPag, sPeriodo : string;
begin
  Result:=False;
  try
    sDataAlterado := '"'+MesDiaHora(CConfiguracao.DataHora)+'" ';
  except
    sDataAlterado := 'NULL';
  end;
  try
    sCodigoUSU := IntToStr(CConfiguracao.CodigoUSU);
  except
    sCodigoUSU := '-1';
  end;
  try
    sCodigoFOR := IntToStr(ECodigoFOR.KeyValue);
  except
    sCodigoFOR := '0';
  end;
  try
    sCodigoTRN := IntToStr(ECodigoTRN.KeyValue);
  except
    sCodigoTRN := '0';
  end;
  try
    sCodigoCCX := IntToStr(ECodigoCCX.KeyValue);
  except
    sCodigoCCX := '0';
  end;
  try
    sCodigoCCXRec := IntToStr(ECodigoCCXRecebimento.KeyValue);
  except
    sCodigoCCXRec := '0';
  end;
  try
    sCodigoPCP := IntToStr(StrToInt(ECodigoPCP.Text));
  except
    sCodigoPCP := '0';
  end;
  try
    sValor  := VirgPonto(StrToFloat(EValor.Text));
  except
    sValor  := '0';
  end;
  try
    sCompetencia := '"'+MesDiaHora(StrToDateTime(EDataCompetencia.Text))+'" ';
  except
    sCompetencia := 'NULL';
  end;
  try
    sVencimento := '"'+MesDiaHora(StrToDateTime(EVencimento.Text))+'" ';
  except
    sVencimento := 'NULL';
  end;
  try
    sPeriodo := IntToStr(EPeriodo.ItemIndex);
  except
    sPeriodo := '0';
  end;
  try
    sTipoDoc := IntToStr(ETipoDoc.KeyValue);
  except
    sTipoDoc := '0';
  end;
  try
    sTipoPag := IntToStr(ETipoPag.KeyValue);
  except
    sTipoPag := '0';
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE TITULO_A_PAGAR SET '+
      ' TPG_DT_ALTERADO='+sDataAlterado+
      ',USU_CODIGO='+sCodigoUSU+
      ',FOR_CODIGO='+sCodigoFOR+
      ',TRN_CODIGO='+sCodigoTRN+
      ',CCX_CODIGO='+sCodigoCCX+
      ',CCX_CODIGO_REC='+sCodigoCCXRec+
      ',PCP_CODIGO='+sCOdigoPCP+
      ',TPG_VALOR='+sValor+
      ',TPG_VENCIMENTO='+sVencimento+
      ',TPG_TIPO_PERIODO='+sPeriodo+
      ',TPG_TIPO_DOC='+sTipoDoc+
      ',TPG_TIPO_PAG='+sTipoPag+
      ',TPG_SEQUENCIA="'+ESequencia.Text+'" '+
      ',TPG_NUMERO="'+ENumero.Text+'" '+
      ',TPG_OBSERVACAO="'+EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
      ' AND TPG_CODIGO='+IntToStr(CodigoTPG));
    GeraLog(4540,CodigoCNC,CodigoTPG,'R$ '+format('%.2f',[Valor]));
    Result:=True;
  except
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TTitulo_a_pagar.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
   ECodigoCCX.Enabled    :=Habilitar;
  Except
  End;
  Try
   ECodigoCCXRecebimento.Enabled    :=Habilitar;
  Except
  End;
  Try
   ECodigoFOR.Enabled    :=Habilitar;
  Except
  End;
  Try
   ECodigoTRN.Enabled    :=Habilitar;
  Except
  End;
  Try
   ECodigoPCP.Enabled    :=Habilitar;
  Except
  End;
  Try
   ETipoDoc.Enabled      :=Habilitar;
  Except
  End;
  Try
   ETipoPag.Enabled      :=Habilitar;
  Except
  End;
  Try
   EDataCompetencia.Enabled    :=Habilitar;
  Except
  End;
  Try
   EVencimento.Enabled   :=Habilitar;
  Except
  End;
  Try
   ENumero.Enabled       :=Habilitar;
  Except
  End;
  Try
   EValor.Enabled        :=Habilitar;
  Except
  End;
  Try
   EOBS.Enabled          :=Habilitar;
  Except
  End;
  Try
   ESequencia.Enabled    :=Habilitar;
  Except
  End;
end;

procedure TTitulo_a_pagar.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TTitulo_a_pagar.CarregaDados;
begin
  Try
   Case Situacao of
    0: ESituacao.Text:='Em Aberto';
    1: ESituacao.Text:='Liquidado';
    2: ESituacao.Text:='Cancelado';
   End;
  Except
  End;
  Try
    ECodigoCNC.KeyValue       := CodigoCNC;
  Except
  End;
  Try
    ECodigoTPG.Text           := IntToStr(CodigoTPG);
  Except
  End;
  Try
    ECodigoFOR.KeyValue       := CodigoFOR;
  Except
  End;
  Try
    ECodigoTRN.KeyValue       := CodigoTRN;
  Except
  End;
  Try
    ECodigoCCX.KeyValue       := CodigoCCX;
  Except
  End;
  Try
    ECodigoCCXRecebimento.KeyValue       := CodigoCCXRecebimento;
  Except
  End;
  Try
    ECodigoPCP.Text           := IntToStr(CodigoPCP);
  Except
  End;
  Try
    EFormaPgto.Text           := FormaPgto;
  Except
  End;
  Try
    if DataCompetencia=0 then
      EDataCompetencia.Text:=''
    else
      EDataCompetencia.Text      :=FormatDateTime('dd/mm/yyyy', DataCompetencia);
  Except
  End;
  Try
    if Vencimento=0 then
      EVencimento.Text:=''
    else
      EVencimento.Text      :=FormatDateTime('dd/mm/yyyy', Vencimento);
  Except
  End;
  Try
    EValor.Text               :=Format('%.2f', [Valor]);
  Except
  End;
  Try
    ESequencia.Text           := Sequencia;
  Except
  End;
  Try
    ENumero.Text              := Numero;
  Except
  End;
  Try
    EPeriodo.ItemIndex        := Periodo;
  Except
  End;
  Try
    ETipoDoc.KeyValue        := TipoDoc;
  Except
  End;
  Try
    ETipoPag.KeyValue        := TipoPag;
  Except
  End;
  Try
    EValorPago.Text           :=Format('%.2f', [ValorPago]);
  Except
  End;
  Try
    if Pagamento=0 then
      EPagamento.Text:=''
    else
      EPagamento.Text           := DateTimeToStr(Pagamento);
  Except
  End;
  try
    EGerouMovimento.Checked := GerouMovimento;
  except
  end;
  Try
    EOBS.Text                 := OBS;
  Except
  End;
end;

constructor TTitulo_a_pagar.Create(AOwner: TComponent);
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

function TTitulo_a_pagar.Deletar(CdCNC,CdTPG:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdTPG,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        GeraLog(4550,CdCNC,CdTPG);
        RegistrarDel(CdCNC,2020(*TituloAPagar*),CdTPG);
        Result := True;
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TTitulo_a_pagar.Destroy;
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

function TTitulo_a_pagar.FinalizaEdicao:Boolean;
var
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  if ECOdigoPCP.Text = '' then
    ECodigoPCP.Text := '0';
  mensagem:='';
  If not Verificadata(EVencimento.text) Then
    mensagem:=mensagem+'Data do vencimento incorreta!'+#13;
  If not Verificadata(EDataCompetencia.text) Then
    mensagem:=mensagem+'Data de Competência incorreta!'+#13;
  if not verificafloat(EValor.text) then
    mensagem:= mensagem + 'Valor digitado incorretamente!';
  if not VerificaInteiroBranco(ECodigoPCP.text) then
    mensagem:= mensagem + 'Codigo do Pedido digitado incorretamente!';
  If mensagem <>'' Then
  Begin
    ShowMessage(mensagem);
    Result := False;
    Exit;
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
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        Result := True;
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Abastecimento }
function TTitulo_a_pagar.Inserir(CdCNC,CdTPG,CdPCP,CdBNF,CdCCX,CdCCXRec,CdFOR,CdTRN,PTipo,PPeriodo: Integer;POBS,PCustodia,PNumero:String;PVencimento, DtPag,DeOri,DtCom:TDateTime; PValor, PValorPago:Double;PFormaPgto,PSeq:String;PTipoPag,PAnt,POri:Integer;PMov:Boolean):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdTPG=0 then
    Cod    := ProximoCodigo('TPG_CODIGO')
  else
    Cod    := CdTPG;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     try
       Insert;
       DataCadastro        := CConfiguracao.DataHora;
       CodigoTPG           := Cod;
       CodigoFOR           := CdFOR;
       CodigoTRN           := CdTRN;
       CodigoCNC           := CdCNC;
       CNCOrigem           := CentroDeCusto;
       CodigoBNF           := CdBNF;
       CodigoCCX           := CdCCX;
       CodigoCCXRecebimento:= CdCCXRec;
       CodigoPCP           := CdPCP;
       CodigoUSU           := CConfiguracao.CodigoUSU;
       DataAlterado        := CConfiguracao.DataHora;
       Sequencia           := PSeq;
       FormaPgto           := PFormaPgto;
       Numero              := PNumero;
       Valor               := PValor;
       ValorPago           := PValorPago;
       Desconto            := 0;
       Juros               := 0;
       TipoDoc             := PTipo;
       DataCompetencia     := DtCom;
       Vencimento          := PVencimento;
       TituloANT           := PAnt;
       TituloORI           := POri;
       VencimentoORI       := DeORI;
       If Pagamento<>0 Then
         Pagamento           := DtPag;

       OBS                 := POBS;
       Custodia            := PCustodia;
       Periodo             := PPeriodo;
       Situacao            := 0;
       TipoPag             := PTipoPag;
       GerouMovimento      := PMov;

       try
         Post;
         result := true;
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

function TTitulo_a_pagar.InserirAuto:Boolean;
begin
    try
      append;
      try
         DataCadastro:= CConfiguracao.DataHora;
      except
      end;
      try
         codigoCNC   := ECodigoCNC.KeyValue;
      except
      end;
      try
         CNCOrigem   := CentroDeCusto;
      except
      end;
      try
        CodigoTPG   := SCodigo;
      except
      end;
      try
        if ECodigoBNF <> nil then
          CodigoBNF := ECodigoBNF.KeyValue
        else
          CodigoBNF := 0;
      except
      end;
      try
        CodigoFOR := ECodigoFOR.KeyValue;
      except
      end;
      try
        CodigoTRN := ECodigoTRN.KeyValue;
      except
      end;
      try
        CodigoCCX := ECodigoCCX.KeyValue;
      except
      end;
      try
        CodigoCCXRecebimento := ECodigoCCXRecebimento.KeyValue;
      except
      end;
      try
        CodigoUSU := CConfiguracao.CodigoUSU;
      except
      end;
      try
        CodigoPCP := StrToInt(ECodigoPCP.Text);
      except
      end;
      try
        DataAlterado := CConfiguracao.DataHora;
      except
      end;
      try
        Valor  := StrToFloat(EValor.Text);
      except
      end;
      try
         DataCompetencia:= StrToDate(EDataCompetencia.Text);
      except
      end;
      try
        Vencimento := StrToDateTime(EVencimento.Text);
      except
      end;
      try
         OBS := EOBS.Text;
      except
      end;
      try
         Sequencia := ESequencia.Text;
      except
      end;
      try
         TipoDoc := ETipoDoc.KeyValue;
      except
      end;
      try
         TipoPag := ETipoPag.KeyValue;
      except
      end;
      try
        Numero  := ENumero.Text;
      except
      end;
      try
        Situacao  := 0;
      except
      end;
      try
        CodigoCHQ := '0';
      except
      end;
      try
        GerouMovimento  := False;
      except
      end;


      try
        Post;
        result:=True;
      except
        result:=False;
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
end;

procedure TTitulo_a_pagar.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoCNC.KeyValue := -1;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoTPG.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ETipoDoc.KeyValue := 0
    else
      ETipoDoc.KeyValue := CConfiguracao.TipoDocumento;
  Except
  End;
  Try
    if Estado <> 1 then
      ETipoPag.KeyValue := 0
    else
      ETipoPag.KeyValue := 6; //Cheque
  Except
  End;
  Try
    ECodigoFOR.KeyValue := 0;
  Except
  End;
  Try
    ECodigoTRN.KeyValue := 0;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoPCP.Clear
    else
      ECodigoPCP.Text := '0';
  except
  End;
  Try
    ECodigoCCX.KeyValue := 0;
  Except
  End;
  Try
    ECodigoCCXRecebimento.KeyValue := 0;
  Except
  End;
  Try
    ENumero.Clear;
  Except
  End;
  Try
    if Estado = 1 then
    Begin
      if not VerificaDataBranco(EDataCompetencia.Text) then
        EDataCompetencia.Text := formatDateTime('DD/MM/YYYY',CConfiguracao.Data);
    end
    else
      EDataCompetencia.Clear;

  Except
  End;
  Try
    EVencimento.Clear;
  Except
  End;
  Try
    EValor.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ESequencia.Clear
    else
      ESequencia.Text := '1';
  Except
  End;
  Try
    EGerouMovimento.Checked := False;
  Except
  End;
  Try
    if Estado <> 1 then
      ESituacao.Clear
    else
      ESituacao.Text:='Em Aberto';
  Except
  End;
  Try
    EOBS.Clear;
  Except
  End;
end;

{ Localiza um abastecimeto }
function TTitulo_a_pagar.LocalizarCod(CdTPG, CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdTPG<>CodigoTPG) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; TPG_CODIGO', vararrayof([CdCNC, CdTPG]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TTitulo_a_pagar.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TTitulo_a_pagar.PreparaInsercao;
begin
  ProximoCodigo('TPG_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TTitulo_a_pagar.QtdeTitulos(Temp:String):Integer;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  QtdTit,i:Integer;
begin
  i:=1;
  QtdTit:=0;

  While i<length(Temp)+2 do
  Begin
    if (temp[i]=';') or (temp[i]='')then
      QtdTit:=QtdTit+1;
    i:=i+1;
  End;

  Result:=QtdTit;
end;

function TTitulo_a_pagar.ReabreTitulo:Boolean;
begin
  Result := False;
  ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE TITULO_A_PAGAR '+
    ' SET TPG_SITUACAO=0 '+
    ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
    ',TPG_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'"'+
    ',CHQ_CODIGO=0 '+
    ',CCX_CODIGO_REC=0 '+
    ',TPG_GEROU_MOVIMENTO=0 '+
    ' WHERE TPG_CODIGO='+IntToStr(CodigoTPG)+
    ' AND CNC_CODIGO='+IntToStr(CodigoCNC));
  GeraLog(3940,CodigoCNC,CodigoTPG);
  Result := True;
end;

function TTitulo_a_pagar.deletarauto:Boolean;
var
  CdCNC, CdTPG : integer;
begin
  Result:=False;
  try
    CdCNC := CodigoCNC;
    CdTPG := CodigoTPG;
    if Delete then
    Begin
      Result := True;
      GeraLog(4550,CdCNC,CdTPG);
      RegistrarDel(CdCNC,2020(*TituloAPagar*),CdTPG);
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
