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
unit Movimento_caixa;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Caixa, Conta_de_Caixa, Configuracao, Funcoes, 
     Variants;

type
  TMovimento_caixa = class(TSQuery)
    private
      { Private fields of TMovimento_caixa }
        { Storage for property CCaixa }
        FCCaixa : TCaixa;
        { Storage for property CContaCaixa }
        FCContaCaixa : TConta_de_Caixa;
        { Storage for property CNCTitulo }
        FCNCTitulo : Integer;
        { Storage for property Cc }
        FCc : Integer;
        { Storage for property ChequeCNC }
        FChequeCNC : Integer;
        { Storage for property CodigoCAX }
        FCodigoCAX : Integer;
        { Storage for property CodigoCCX }
        FCodigoCCX : Integer;
        { Storage for property CodigoCCXRecebimento }
        FCodigoCCXRecebimento : Integer;
        { Storage for property CodigoCHQ }
        FCodigoCHQ : Integer;
        { Storage for property CodigoMVC }
        FCodigoMVC : Integer;
        { Storage for property CodigoTIT }
        FCodigoTIT : Integer;
        { Storage for property Competencia }
        FCompetencia : TDatetime;
        { Storage for property CreditoCliente }
        FCreditoCliente : Double;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCheque }
        FDataCheque : TDateTime;
        { Storage for property Dc }
        FDc : String;
        { Storage for property Desconto }
        FDesconto : Double;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoCAX }
        FECodigoCAX : TDBLookupComboBox;
        { Storage for property ECodigoCCX }
        FECodigoCCX : TDBLookupComboBox;
        { Storage for property ECodigoCCXRecebimento }
        FECodigoCCXRecebimento : TDBLookupComboBox;
        { Storage for property ECodigoMVC }
        FECodigoMVC : TEdit;
        { Storage for property ECompetencia }
        FECompetencia : TMaskedit;
        { Storage for property ECreditoCliente }
        FECreditoCliente : TEdit;
        { Storage for property EData }
        FEData : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCheque }
        FEDataCheque : TMaskEdit;
        { Storage for property EDc }
        FEDc : tComboBox;
        { Storage for property EDesconto }
        FEDesconto : TEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EJuros }
        FEJuros : TEdit;
        { Storage for property ENumero }
        FENumero : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TMemo;
        { Storage for property ESequencia }
        FESequencia : TEdit;
        { Storage for property ETipo }
        FETipo : TDBLookupComboBox;
        { Storage for property ETipoPGTO }
        FETipoPGTO : TDBLookupcomboBox;
        { Storage for property EValor }
        FEValor : TEdit;
        { Storage for property EValorDocumento }
        FEValorDocumento : TEdit;
        { Storage for property Flag }
        FFlag : String;
        { Storage for property Juros }
        FJuros : Double;
        { Storage for property MaquinaMVC }
        FMaquinaMVC : Integer;
        { Storage for property NaoContabil }
        FNaoContabil : Boolean;
        { Storage for property Numero }
        FNumero : String;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property OrigemExtorno }
        FOrigemExtorno : Integer;
        { Storage for property PT }
        FPT : String;
        { Storage for property Sequencia }
        FSequencia : String;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property TipoPGTO }
        FTipoPGTO : Integer;
        { Storage for property Valor }
        FValor : Double;
        { Storage for property ValorDocumento }
        FValorDocumento : Double;

      { Private methods of TMovimento_caixa }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CNCTitulo }
        function GetCNCTitulo : Integer;
        { Write method for property CNCTitulo }
        procedure SetCNCTitulo(Value : Integer);
        { Read method for property Cc }
        function GetCc : Integer;
        { Write method for property Cc }
        procedure SetCc(Value : Integer);
        { Read method for property ChequeCNC }
        function GetChequeCNC : Integer;
        { Read method for property CodigoCAX }
        function GetCodigoCAX : Integer;
        { Write method for property CodigoCAX }
        procedure SetCodigoCAX(Value : Integer);
        { Read method for property CodigoCCX }
        function GetCodigoCCX : Integer;
        { Write method for property CodigoCCX }
        procedure SetCodigoCCX(Value : Integer);
        { Read method for property CodigoCCXRecebimento }
        function GetCodigoCCXRecebimento : Integer;
        { Write method for property CodigoCCXRecebimento }
        procedure SetCodigoCCXRecebimento(Value : Integer);
        { Read method for property CodigoCHQ }
        function GetCodigoCHQ : Integer;
        { Read method for property CodigoMVC }
        function GetCodigoMVC : Integer;
        { Write method for property CodigoMVC }
        procedure SetCodigoMVC(Value : Integer);
        { Read method for property CodigoTIT }
        function GetCodigoTIT : Integer;
        { Write method for property CodigoTIT }
        procedure SetCodigoTIT(Value : Integer);
        { Read method for property Competencia }
        function GetCompetencia : TDatetime;
        { Write method for property Competencia }
        procedure SetCompetencia(Value : TDatetime);
        { Read method for property CreditoCliente }
        function GetCreditoCliente : Double;
        { Write method for property CreditoCliente }
        procedure SetCreditoCliente(Value : Double);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCheque }
        function GetDataCheque : TDateTime;
        { Read method for property Dc }
        function GetDc : String;
        { Write method for property Dc }
        procedure SetDc(Value : String);
        { Read method for property Desconto }
        function GetDesconto : Double;
        { Write method for property Desconto }
        procedure SetDesconto(Value : Double);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Flag }
        function GetFlag : String;
        { Write method for property Flag }
        procedure SetFlag(Value : String);
        { Read method for property Juros }
        function GetJuros : Double;
        { Write method for property Juros }
        procedure SetJuros(Value : Double);
        { Read method for property MaquinaMVC }
        function GetMaquinaMVC : Integer;
        { Read method for property NaoContabil }
        function GetNaoContabil : Boolean;
        { Write method for property NaoContabil }
        procedure SetNaoContabil(Value : Boolean);
        { Read method for property Numero }
        function GetNumero : String;
        { Write method for property Numero }
        procedure SetNumero(Value : String);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property OrigemExtorno }
        function GetOrigemExtorno : Integer;
        { Write method for property OrigemExtorno }
        procedure SetOrigemExtorno(Value : Integer);
        { Read method for property PT }
        function GetPT : String;
        { Write method for property PT }
        procedure SetPT(Value : String);
        { Read method for property Sequencia }
        function GetSequencia : String;
        { Write method for property Sequencia }
        procedure SetSequencia(Value : String);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);
        { Read method for property TipoPGTO }
        function GetTipoPGTO : Integer;
        { Write method for property TipoPGTO }
        procedure SetTipoPGTO(Value : Integer);
        { Read method for property Valor }
        function GetValor : Double;
        { Write method for property Valor }
        procedure SetValor(Value : Double);
        { Read method for property ValorDocumento }
        function GetValorDocumento : Double;
        { Write method for property ValorDocumento }
        procedure SetValorDocumento(Value : Double);

    protected
      { Protected fields of TMovimento_caixa }

      { Protected methods of TMovimento_caixa }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TMovimento_caixa }

      { Public methods of TMovimento_caixa }
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdMVC:Integer):Boolean;
        destructor Destroy; override;
        { Insere um Cliente }
        function Inserir(CNC,MVC,CCX,CCXRec,CAX,PTipoPgt,PTipo,PCc,CHQCNC,CHQ:integer;PDesc,PFlag,PNum,PObs,PSeq,PDC:String;PVl,PDesco,PJur,PCrdCli,PVlrDoc:Double;PDt,PComp,PDtCHQ:TdateTime;PTIT,PCNCTit:Integer;PPT:String;POriExt:integer=0;PNCont:boolean=False):Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdMVC,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;

    published
      { Published properties of TMovimento_caixa }
        property CCaixa : TCaixa read FCCaixa write FCCaixa;
        property CContaCaixa : TConta_de_Caixa
             read FCContaCaixa write FCContaCaixa;
        property CNCTitulo : Integer read GetCNCTitulo write SetCNCTitulo;
        property Cc : Integer read GetCc write SetCc;
        property ChequeCNC : Integer read GetChequeCNC write FChequeCNC;
        property CodigoCAX : Integer read GetCodigoCAX write SetCodigoCAX;
        property CodigoCCX : Integer read GetCodigoCCX write SetCodigoCCX;
        property CodigoCCXRecebimento : Integer
             read GetCodigoCCXRecebimento write SetCodigoCCXRecebimento;
        property CodigoCHQ : Integer read GetCodigoCHQ write FCodigoCHQ;
        { Código do Produto }
        property CodigoMVC : Integer read GetCodigoMVC write SetCodigoMVC;
        property CodigoTIT : Integer read GetCodigoTIT write SetCodigoTIT;
        property Competencia : TDatetime
             read GetCompetencia write SetCompetencia;
        property CreditoCliente : Double
             read GetCreditoCliente write SetCreditoCliente;
        property Data : Tdatetime read GetData write SetData;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCheque : TDateTime read GetDataCheque write FDataCheque;
        property Dc : String read GetDc write SetDc;
        property Desconto : Double read GetDesconto write SetDesconto;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoCAX : TDBLookupComboBox
             read FECodigoCAX write FECodigoCAX;
        property ECodigoCCX : TDBLookupComboBox
             read FECodigoCCX write FECodigoCCX;
        property ECodigoCCXRecebimento : TDBLookupComboBox
             read FECodigoCCXRecebimento write FECodigoCCXRecebimento;
        property ECodigoMVC : TEdit read FECodigoMVC write FECodigoMVC;
        property ECompetencia : TMaskedit
             read FECompetencia write FECompetencia;
        property ECreditoCliente : TEdit
             read FECreditoCliente write FECreditoCliente;
        property EData : TEdit read FEData write FEData;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCheque : TMaskEdit read FEDataCheque write FEDataCheque;
        property EDc : tComboBox read FEDc write FEDc;
        property EDesconto : TEdit read FEDesconto write FEDesconto;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EJuros : TEdit read FEJuros write FEJuros;
        property ENumero : TEdit read FENumero write FENumero;
        property EObservacao : TMemo read FEObservacao write FEObservacao;
        property ESequencia : TEdit read FESequencia write FESequencia;
        property ETipo : TDBLookupComboBox read FETipo write FETipo;
        property ETipoPGTO : TDBLookupcomboBox
             read FETipoPGTO write FETipoPGTO;
        property EValor : TEdit read FEValor write FEValor;
        property EValorDocumento : TEdit
             read FEValorDocumento write FEValorDocumento;
        property Flag : String read GetFlag write SetFlag;
        property Juros : Double read GetJuros write SetJuros;
        property MaquinaMVC : Integer read GetMaquinaMVC write FMaquinaMVC;
        property NaoContabil : Boolean
             read GetNaoContabil write SetNaoContabil;
        property Numero : String read GetNumero write SetNumero;
        property Observacao : String read GetObservacao write SetObservacao;
        property OrigemExtorno : Integer
             read GetOrigemExtorno write SetOrigemExtorno;
        property PT : String read GetPT write SetPT;
        property Sequencia : String read GetSequencia write SetSequencia;
        property Tipo : Integer read GetTipo write SetTipo;
        property TipoPGTO : Integer read GetTipoPGTO write SetTipoPGTO;
        property Valor : Double read GetValor write SetValor;
        property ValorDocumento : Double
             read GetValorDocumento write SetValorDocumento;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMovimento_caixa with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMovimento_caixa]);
end;

{ Method to set variable and property values and create objects }
procedure TMovimento_caixa.AutoInitialize;
begin
     FECodigoCAX := nil;
     FECodigoCCX := nil;
     FECodigoCCXRecebimento := nil;
     FECodigoMVC := nil;
     FECompetencia := nil;
     FECreditoCliente := nil;
     FEData := nil;
     FEDataAlterado := nil;
     FEDataCheque := nil;
     FEDc := nil;
     FEDesconto := nil;
     FEDescricao := nil;
     FEJuros := nil;
     FENumero := nil;
     FEObservacao := nil;
     FESequencia := nil;
     FETipo := nil;
     FETipoPGTO := nil;
     FEValor := nil;
     FEValorDocumento := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TMovimento_caixa.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCAX then
        FECodigoCAX := nil;
     if AComponent = FECodigoCCX then
        FECodigoCCX := nil;
     if AComponent = FECodigoCCXRecebimento then
        FECodigoCCXRecebimento := nil;
     if AComponent = FECodigoMVC then
        FECodigoMVC := nil;
     if AComponent = FECompetencia then
        FECompetencia := nil;
     if AComponent = FECreditoCliente then
        FECreditoCliente := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCheque then
        FEDataCheque := nil;
     if AComponent = FEDc then
        FEDc := nil;
     if AComponent = FEDesconto then
        FEDesconto := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEJuros then
        FEJuros := nil;
     if AComponent = FENumero then
        FENumero := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FESequencia then
        FESequencia := nil;
     if AComponent = FETipo then
        FETipo := nil;
     if AComponent = FETipoPGTO then
        FETipoPGTO := nil;
     if AComponent = FEValor then
        FEValor := nil;
     if AComponent = FEValorDocumento then
        FEValorDocumento := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TMovimento_caixa.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CNCTitulo }
function TMovimento_caixa.GetCNCTitulo : Integer;
begin
  try
    Result := Self.fieldByName('CNC_TITULO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CNCTitulo }
procedure TMovimento_caixa.SetCNCTitulo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_TITULO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_TITULO"!');
  end;
end;

{ Read method for property Cc }
function TMovimento_caixa.GetCc : Integer;
begin
  try
    Result := Self.fieldByName('MVC_TIT_CC').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Cc }
procedure TMovimento_caixa.SetCc(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_TIT_CC').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_TIT_CC"!');
  end;
end;

{ Read method for property ChequeCNC }
function TMovimento_caixa.GetChequeCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CHEQUE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCAX }
function TMovimento_caixa.GetCodigoCAX : Integer;
begin
  try
    Result := Self.fieldByName('CAX_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCAX }
procedure TMovimento_caixa.SetCodigoCAX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CAX_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CAX_CODIGO"!');
  end;
end;

{ Read method for property CodigoCCX }
function TMovimento_caixa.GetCodigoCCX : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCCX }
procedure TMovimento_caixa.SetCodigoCCX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_CODIGO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_CODIGO"!');
    end;
end;

{ Read method for property CodigoCCXRecebimento }
function TMovimento_caixa.GetCodigoCCXRecebimento : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO_REC').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCCXRecebimento }
procedure TMovimento_caixa.SetCodigoCCXRecebimento(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_CODIGO_REC').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_CODIGO_REC"!');
    end;
end;

{ Read method for property CodigoCHQ }
function TMovimento_caixa.GetCodigoCHQ : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoMVC }
function TMovimento_caixa.GetCodigoMVC : Integer;
begin
  try
    Result := Self.fieldByName('MVC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoMVC }
procedure TMovimento_caixa.SetCodigoMVC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MVC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MVC_CODIGO"!');
    end;
end;

{ Read method for property CodigoTIT }
function TMovimento_caixa.GetCodigoTIT : Integer;
begin
  try
    Result := Self.fieldByName('TIT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTIT }
procedure TMovimento_caixa.SetCodigoTIT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TIT_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TIT_CODIGO"!');
  end;
end;

{ Read method for property Competencia }
function TMovimento_caixa.GetCompetencia : TDatetime;
begin
  try
    Result := Self.fieldByName('MVC_COMPETENCIA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Competencia }
procedure TMovimento_caixa.SetCompetencia(Value : TDatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_COMPETENCIA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_COMPETENCIA"!');
  end;
end;

{ Read method for property CreditoCliente }
function TMovimento_caixa.GetCreditoCliente : Double;
begin
  try
    Result := Self.fieldByName('MVC_CRED_CLI').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property CreditoCliente }
procedure TMovimento_caixa.SetCreditoCliente(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_CRED_CLI').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_CRED_CLI"!');
  end;
end;

{ Read method for property Data }
function TMovimento_caixa.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('MVC_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TMovimento_caixa.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_DATA"!');
  end;
end;

{ Read method for property DataAlterado }
function TMovimento_caixa.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('MVC_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TMovimento_caixa.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCheque }
function TMovimento_caixa.GetDataCheque : TDateTime;
begin
  try
    Result := Self.fieldByName('MVC_DT_CHEQUE').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property Dc }
function TMovimento_caixa.GetDc : String;
begin
  try
    Result := Self.fieldByName('MVC_DC').asString;
  except
  end;
end;

{ Write method for property Dc }
procedure TMovimento_caixa.SetDc(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_DC').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_DC"!');
  end;
end;

{ Read method for property Desconto }
function TMovimento_caixa.GetDesconto : Double;
begin
  try
    Result := Self.fieldByName('MVC_DESCONTO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Desconto }
procedure TMovimento_caixa.SetDesconto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_DESCONTO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_DESCONTO"!');
  end;
end;

{ Read method for property Descricao }
function TMovimento_caixa.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('MVC_DESCRICAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Descricao }
procedure TMovimento_caixa.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MVC_DESCRICAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MVC_DESCRICAO"!');
    end;
end;

{ Read method for property Flag }
function TMovimento_caixa.GetFlag : String;
begin
  try
    Result := Self.fieldByName('MVC_FLAG').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Flag }
procedure TMovimento_caixa.SetFlag(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_FLAG').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_FLAG"!');
  end;
end;

{ Read method for property Juros }
function TMovimento_caixa.GetJuros : Double;
begin
  try
    Result := Self.fieldByName('MVC_JUROS').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Juros }
procedure TMovimento_caixa.SetJuros(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_JUROS').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_JUROS"!');
  end;
end;

{ Read method for property MaquinaMVC }
function TMovimento_caixa.GetMaquinaMVC : Integer;
begin
  try
    Result := Self.fieldByName('MVC_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property NaoContabil }
function TMovimento_caixa.GetNaoContabil : Boolean;
begin
  try
    result := (Self.fieldByName('MVC_NAO_CONTABIL').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property NaoContabil }
procedure TMovimento_caixa.SetNaoContabil(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('MVC_NAO_CONTABIL').asInteger := 1
      else
        Self.fieldByName('MVC_NAO_CONTABIL').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "MVC_NAO_CONTABIL"!');
    end;
end;

{ Read method for property Numero }
function TMovimento_caixa.GetNumero : String;
begin
  try
    Result := Self.fieldByName('MVC_TIT_NUMERO').asString;
  except
    result:= '';
  end;
end;


{ Write method for property Numero }
procedure TMovimento_caixa.SetNumero(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_TIT_NUMERO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_TIT_NUMERO"!');
  end;
end;

{ Read method for property Observacao }
function TMovimento_caixa.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('MVC_OBSERVACAO1').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TMovimento_caixa.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_OBSERVACAO1').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_OBSERVACAO1"!');
  end;
end;

{ Read method for property OrigemExtorno }
function TMovimento_caixa.GetOrigemExtorno : Integer;
begin
  try
    Result := Self.fieldByName('MVC_ORIGEM_EXTORNO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property OrigemExtorno }
procedure TMovimento_caixa.SetOrigemExtorno(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MVC_ORIGEM_EXTORNO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MVC_ORIGEM_EXTORNO"!');
    end;
end;

{ Read method for property PT }
function TMovimento_caixa.GetPT : String;
begin
  try
    Result := Self.fieldByName('MVC_PT').asString;
  except
    result:= '';
  end;
end;

{ Write method for property PT }
procedure TMovimento_caixa.SetPT(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_PT').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_PT"!');
  end;
end;

{ Read method for property Sequencia }
function TMovimento_caixa.GetSequencia : String;
begin
  try
    Result := Self.fieldByName('MVC_TIT_SEQUENCIA').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Sequencia }
procedure TMovimento_caixa.SetSequencia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_TIT_SEQUENCIA').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_TIT_SEQUENCIA"!');
  end;
end;

{ Read method for property Tipo }
function TMovimento_caixa.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('MVC_TIT_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Tipo }
procedure TMovimento_caixa.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_TIT_TIPO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_TIT_TIPO"!');
  end;
end;

{ Read method for property TipoPGTO }
function TMovimento_caixa.GetTipoPGTO : Integer;
begin
  try
    Result := Self.fieldByName('MVC_TIPO_PGTO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoPGTO }
procedure TMovimento_caixa.SetTipoPGTO(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MVC_TIPO_PGTO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MVC_TIPO_PGTO"!');
    end;
end;

{ Read method for property Valor }
function TMovimento_caixa.GetValor : Double;
begin
  try
    Result := Self.fieldByName('MVC_VALOR').asFloat;
  except
    result:= 0;
  end;
end;


{ Write method for property Valor }
procedure TMovimento_caixa.SetValor(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_VALOR').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_VALOR"!');
  end;
end;

{ Read method for property ValorDocumento }
function TMovimento_caixa.GetValorDocumento : Double;
begin
  try
    Result := Self.fieldByName('MVC_VALOR_DOC').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property ValorDocumento }
procedure TMovimento_caixa.SetValorDocumento(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MVC_VALOR_DOC').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MVC_VALOR_DOC"!');
  end;
end;

procedure TMovimento_caixa.AtualizaControles(Habilitar:Boolean);
begin
  try
    ECodigoCAX.Enabled := not Habilitar;
  except
  end;
  try
    EDataCheque.Enabled := Habilitar;
  except
  end;
  try
    ECodigoCCX.Enabled := Habilitar;
  except
  end;
  try
    ECodigoCCXRecebimento.Enabled := Habilitar;
  except
  end;
  try
    ETipoPGTO.Enabled := Habilitar;
  except
  end;
  try
    EDescricao.Enabled := Habilitar;
  except
  end;
  try
    if CConfiguracao.Empresa = 1 then
      EValor.Enabled := Habilitar;
  except
  end;
  try
    ETipo.Enabled := Habilitar;
  except
  end;
  try
    ENumero.Enabled := Habilitar;
  except
  end;
  try
    if CConfiguracao.Empresa = 1 then
      EDC.Enabled := Habilitar;
  except
  end;
  try
    ESequencia.Enabled := Habilitar;
  except
  end;
  try
    ECompetencia.Enabled := Habilitar;
  except
  end;
  try
    EObservacao.Enabled := Habilitar;
  except
  end;
end;

procedure TMovimento_caixa.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TMovimento_caixa.CarregaDados;
begin
  try
    ECodigoMVC.Text := IntToStr(CodigoMVC);
  except
  end;
  try
    ECodigoCCX.KeyValue := CodigoCCX;
  except
  end;
  try
    ECodigoCCXRecebimento.KeyValue := CodigoCCXRecebimento;
  except
  end;
  try
     ETipo.KeyValue := Tipo;
  except
  end;
  try
    ETipoPGTO.KeyValue := TipoPGTO;
  except
  end;
  try
     EDescricao.Text := Descricao;
  except
  end;
  try
     EValor.Text := Format('%.2f', [Valor]);
  except
  end;
  try
     ECreditoCliente.Text := Format('%.2f', [CreditoCliente]);
  except
  end;
  try
     EValorDocumento.Text := Format('%.2f', [ValorDocumento]);
  except
  end;
  try
     EDesconto.Text := Format('%.2f', [Desconto]);
  except
  end;
  try
     EJuros.Text := Format('%.2f', [Juros]);
  except
  end;
  try
    ENumero.Text :=  Numero;
  except
  end;
  try
    ESequencia.Text := Sequencia;
  except
  end;
  try
     ItemComboBox(EDC,DC);
  except
  end;
  try
    if Data=0 then
      EData.Clear
    else
      EData.Text            :=FormatDateTime('dd/mm/yyyy hh:mm:ss', Data);
  except
  end;
  try
    if DataCheque=0 then
      EDataCheque.Clear
    else
      EDataCheque.Text            :=FormatDateTime('dd/mm/yyyy', DataCheque);
  except
  end;
  try
    if DataAlterado=0 then
      EDataAlterado.Clear
    else
      EDataAlterado.Text            :=FormatDateTime('dd/mm/yyyy hh:mm:ss', DataAlterado);
  except
  end;
  try
    if Competencia=0 then
      ECompetencia.Clear
    else
      ECompetencia.Text            :=FormatDateTime('dd/mm/yyyy', Competencia);
  except
  end;
  try
     EObservacao.Text := Observacao;
  except
  end;
end;

constructor TMovimento_caixa.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'MOVIMENTO_DE_CAIXA';

     { Code to perform other tasks when the component is created }

end;

function TMovimento_caixa.Deletar(CdCNC,CdMVC:Integer):Boolean;
var
  sTIT, sNumero, sDescricao, sDC, sValor: string;
begin
  Result := False;
  if CConfiguracao.Empresa <> 1 then
  Begin
    ShowMessage('Processo não autorizado!');
    Exit;
  end;
  If not(localizarCod(CdMVC,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      sDescricao := Descricao;
      sValor     := format('%.2f',[Valor]);
      sNumero    := Numero;
      sDC        := DC;
      If MessageDlg('ATENÇÃO!!!'+#13+'Esse processo irá alterar o saldo do caixa!'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        Exit
      else
      Begin
        ExecutaSQL(CConfiguracao.QueryComandos,'DELETE FROM MOVIMENTO_DE_CAIXA '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND MVC_CODIGO='+IntToStr(CdMVC));
        Result := True;
        Close;
        Open;
        if TQuery(Self).isEmpty then
          LimpaCampos;
        GeraLog(2390,CdCNC,CdMVC,'Exc. '+sDescricao+' R$ '+sValor+
          ' '+sDC+' Num:'+sNumero+' Tit:'+sTit);
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TMovimento_caixa.Destroy;
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
function TMovimento_caixa.Inserir(CNC,MVC,CCX,CCXRec,CAX,PTipoPgt,PTipo,PCc,CHQCNC,CHQ:integer;PDesc,PFlag,PNum,PObs,PSeq,PDC:String;PVl,PDesco,PJur,PCrdCli,PVlrDoc:Double;PDt,PComp,PDtCHQ:TdateTime;PTIT,PCNCTit:Integer;PPT:String;POriExt:integer=0;PNCont:boolean=False):Boolean;
Var
  Cod,iNCont:Integer;
  vDtCheque: string;
begin
  result:=false;
  if MVC=0 then
    Cod    := ProximoCodigo('MVC_CODIGO')
  else
    Cod    := MVC;
  if PDtCHQ = 0 then
    vDtCheque := 'NULL'
  else
    vDtCheque := '"'+MesDia(PDtCHQ)+'" ';

  if VerificaRegistroExiste('CNC_CODIGO='+IntToStr(CNC)+' AND MVC_CODIGO='+IntToStr(Cod)) then
    ShowMessage('Não foi possível inserir o registro da tabela '+Tabela+'. Já existe!')
  else
  Begin
    if PNCont then
      iNCont := 1
    else
      iNCont := 0;
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO '+Tabela+
        '(CNC_CODIGO,MVC_CODIGO,USU_CODIGO,MVC_DT_ALTERADO,MVC_DATA,MVC_DT_CHEQUE '+
        ',CAX_CODIGO,MVC_MAQUINA,CNC_CHEQUE,CHQ_CODIGO '+
        ',CCX_CODIGO,CCX_CODIGO_REC,MVC_TIPO_PGTO,MVC_DESCRICAO,MVC_VALOR '+
        ',MVC_DESCONTO,MVC_JUROS,MVC_VALOR_DOC,MVC_CRED_CLI,MVC_FLAG '+
        ',MVC_TIT_TIPO,MVC_TIT_NUMERO,MVC_DC,MVC_TIT_SEQUENCIA,MVC_TIT_CC '+
        ',CNC_TITULO,TIT_CODIGO,MVC_PT,MVC_COMPETENCIA,MVC_NAO_CONTABIL '+
        ',MVC_ORIGEM_EXTORNO,MVC_OBSERVACAO1) VALUES '+
        '( '+IntToStr(CNC)+
        ', '+IntToStr(Cod)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ',"'+MesDiaHora(PDt)+'" '+
        ', '+vDtCheque+ //Já tem as aspas e o MesDia ou NULL
        ', '+IntToStr(CAX)+
        ', '+IntToStr(Maquina)+
        ', '+IntToStr(CHQCNC)+
        ', '+IntToStr(CHQ)+        
        ', '+IntToStr(CCX)+
        ', '+IntToStr(CCXRec)+
        ', '+IntToStr(PTipoPgt)+
        ',"'+PDesc+'" '+
        ', '+VirgPonto(PVl)+
        ', '+VirgPonto(PDesco)+
        ', '+VirgPonto(PJur)+
        ', '+VirgPonto(PVlrDoc)+
        ', '+VirgPonto(PCrdCli)+
        ',"'+PFlag+'" '+
        ', '+IntToStr(PTipo)+
        ',"'+PNum+'" '+
        ',"'+PDc+'" '+
        ',"'+PSeq+'" '+
        ', '+IntToStr(PCc)+
        ', '+IntToStr(PCNCTit)+
        ', '+IntToStr(PTIT)+
        ',"'+PPt+'" '+
        ',"'+MesDiaHora(PComp)+'" '+
        ', '+IntToStr(iNCont)+
        ', '+IntToStr(POriExt)+
        ',"'+PObs+'") ');
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente!');
    End;
  end;
end;

procedure TMovimento_caixa.LimpaCampos;
begin
  try
    ECodigoMVC.Clear;
  except
  end;
  try
    ECodigoCCX.KeyValue := -1;
  except
  end;
  try
    ECodigoCCXRecebimento.KeyValue := -1;
  except
  end;
  try
     ETipo.KeyValue := -1;
  except
  end;
  try
    ETipoPGTO.KeyValue := -1;
  except
  end;
  try
     EDescricao.Clear;
  except
  end;
  try
     EValor.Clear;
  except
  end;
  try
     EValorDocumento.Clear;
  except
  end;
  try
     ECreditoCliente.Clear;
  except
  end;
  try
     EDesconto.Clear;
  except
  end;
  try
     EJuros.Clear;
  except
  end;
  try
    ENumero.Clear;
  except
  end;
  try
    ESequencia.Clear;
  except
  end;
  try
     EDC.ItemIndex := -1;
  except
  end;
  try
    EData.Clear;
  except
  end;
  try
    EDataCheque.Clear;
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    ECompetencia.Clear;
  except
  end;
  try
    EObservacao.Clear;
  except
  end;
end;

{ Localiza um cliente }
function TMovimento_caixa.LocalizarCod(CdMVC,CdCNC:Integer):Boolean;
begin
  If (CdMVC<>CodigoMVC) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;MVC_CODIGO', vararrayof([CdCNC, CdMVC]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TMovimento_caixa.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;


end.
