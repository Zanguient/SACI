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
unit Cheque;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Agencia, Banco, Conta, Configuracao, Extctrls, 
     Funcoes, Variants;

type
  TCheque = class(TSQuery)
    private
      { Private fields of TCheque }
        { Storage for property Agencia }
        FAgencia : Integer;
        { Storage for property Banco }
        FBanco : Integer;
        { Storage for property C1 }
        FC1 : Integer;
        { Storage for property C2 }
        FC2 : Integer;
        { Storage for property C3 }
        FC3 : Integer;
        { Storage for property CNCTitulo }
        FCNCTitulo : Integer;
        { Storage for property CODTitulo }
        FCODTitulo : Integer;
        { Storage for property CPFCNPJ }
        FCPFCNPJ : String;
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodigoBarras }
        FCodigoBarras : String;
        { Storage for property CodigoCHQ }
        FCodigoCHQ : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoFCT }
        FCodigoFCT : Integer;
        { Storage for property Comp }
        FComp : Integer;
        { Storage for property Conta }
        FConta : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataEnviado }
        FDataEnviado : TDateTime;
        { Storage for property DonoCheque }
        FDonoCheque : String;
        { Storage for property EAgencia }
        FEAgencia : TMaskEdit;
        { Storage for property EBanco }
        FEBanco : TMaskEdit;
        { Storage for property EC1 }
        FEC1 : TMaskEdit;
        { Storage for property EC2 }
        FEC2 : TMaskEdit;
        { Storage for property EC3 }
        FEC3 : TMaskEdit;
        { Storage for property ECNCTitulo }
        FECNCTitulo : TEdit;
        { Storage for property ECODTitulo }
        FECODTitulo : TEdit;
        { Storage for property ECPFCNPJ }
        FECPFCNPJ : TMaskEdit;
        { Storage for property EClienteCNC }
        FEClienteCNC : TEdit;
        { Storage for property ECodigoBarras }
        FECodigoBarras : TEdit;
        { Storage for property ECodigoCHQ }
        FECodigoCHQ : TEdit;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoFCT }
        FECodigoFCT : TEdit;
        { Storage for property EComp }
        FEComp : TMaskEdit;
        { Storage for property EConta }
        FEConta : TMaskEdit;
        { Storage for property EData }
        FEData : TMaskEdit;
        { Storage for property EDonoCheque }
        FEDonoCheque : TEdit;
        { Storage for property EER }
        FEER : TComboBox;
        { Storage for property EFactoringCNC }
        FEFactoringCNC : TEdit;
        { Storage for property ENominal }
        FENominal : TEdit;
        { Storage for property ENumero }
        FENumero : TMaskEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ER }
        FER : String;
        { Storage for property ESituacao }
        FESituacao : TCombobox;
        { Storage for property ETerceiro }
        FETerceiro : TCheckBox;
        { Storage for property EValor }
        FEValor : TEdit;
        { Storage for property Enviado }
        FEnviado : Boolean;
        { Storage for property FactoringCNC }
        FFactoringCNC : Integer;
        { Storage for property Nominal }
        FNominal : String;
        { Storage for property Numero }
        FNumero : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Terceiro }
        FTerceiro : Integer;
        { Storage for property Utilizado }
        FUtilizado : Boolean;
        { Storage for property Valor }
        FValor : Double;

      { Private methods of TCheque }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Agencia }
        function GetAgencia : Integer;
        { Write method for property Agencia }
        procedure SetAgencia(Value : Integer);
        { Read method for property Banco }
        function GetBanco : Integer;
        { Write method for property Banco }
        procedure SetBanco(Value : Integer);
        { Read method for property C1 }
        function GetC1 : Integer;
        { Write method for property C1 }
        procedure SetC1(Value : Integer);
        { Read method for property C2 }
        function GetC2 : Integer;
        { Write method for property C2 }
        procedure SetC2(Value : Integer);
        { Read method for property C3 }
        function GetC3 : Integer;
        { Write method for property C3 }
        procedure SetC3(Value : Integer);
        { Read method for property CNCTitulo }
        function GetCNCTitulo : Integer;
        { Write method for property CNCTitulo }
        procedure SetCNCTitulo(Value : Integer);
        { Read method for property CODTitulo }
        function GetCODTitulo : Integer;
        { Write method for property CODTitulo }
        procedure SetCODTitulo(Value : Integer);
        { Read method for property CPFCNPJ }
        function GetCPFCNPJ : String;
        { Write method for property CPFCNPJ }
        procedure SetCPFCNPJ(Value : String);
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Write method for property ClienteCNC }
        procedure SetClienteCNC(Value : Integer);
        { Read method for property CodigoBarras }
        function GetCodigoBarras : String;
        { Write method for property CodigoBarras }
        procedure SetCodigoBarras(Value : String);
        { Read method for property CodigoCHQ }
        function GetCodigoCHQ : Integer;
        { Write method for property CodigoCHQ }
        procedure SetCodigoCHQ(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property CodigoFCT }
        function GetCodigoFCT : Integer;
        { Write method for property CodigoFCT }
        procedure SetCodigoFCT(Value : Integer);
        { Read method for property Comp }
        function GetComp : Integer;
        { Write method for property Comp }
        procedure SetComp(Value : Integer);
        { Read method for property Conta }
        function GetConta : Integer;
        { Write method for property Conta }
        procedure SetConta(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property DataEnviado }
        function GetDataEnviado : TDateTime;
        { Write method for property DataEnviado }
        procedure SetDataEnviado(Value : TDateTime);
        { Read method for property DonoCheque }
        function GetDonoCheque : String;
        { Write method for property DonoCheque }
        procedure SetDonoCheque(Value : String);
        { Read method for property ER }
        function GetER : String;
        { Write method for property ER }
        procedure SetER(Value : String);
        { Read method for property Enviado }
        function GetEnviado : Boolean;
        { Write method for property Enviado }
        procedure SetEnviado(Value : Boolean);
        { Read method for property FactoringCNC }
        function GetFactoringCNC : Integer;
        { Write method for property FactoringCNC }
        procedure SetFactoringCNC(Value : Integer);
        { Read method for property Nominal }
        function GetNominal : String;
        { Write method for property Nominal }
        procedure SetNominal(Value : String);
        { Read method for property Numero }
        function GetNumero : String;
        { Write method for property Numero }
        procedure SetNumero(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Terceiro }
        function GetTerceiro : Integer;
        { Write method for property Terceiro }
        procedure SetTerceiro(Value : Integer);
        { Read method for property Utilizado }
        function GetUtilizado : Boolean;
        { Write method for property Utilizado }
        procedure SetUtilizado(Value : Boolean);
        { Read method for property Valor }
        function GetValor : Double;
        { Write method for property Valor }
        procedure SetValor(Value : Double);

    protected
      { Protected fields of TCheque }

      { Protected methods of TCheque }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TCheque }

      { Public methods of TCheque }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdCHQ:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function Inserir(CdCLICNC,CdCLI,PTituloCNC,PTitulo,iTerceiro: integer; DtData:TDateTime; PValor:Double; PER,PComp,PBanco,PAgencia,PConta,PNumero,PC1,PC2,PC3,PDono,PCPF,PNominal,POBS:string):Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cheque }
        function LocalizarCod(CdCHQ,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TCheque }
        property Agencia : Integer read GetAgencia write SetAgencia;
        property Banco : Integer read GetBanco write SetBanco;
        property C1 : Integer read GetC1 write SetC1;
        property C2 : Integer read GetC2 write SetC2;
        property C3 : Integer read GetC3 write SetC3;
        property CNCTitulo : Integer read GetCNCTitulo write SetCNCTitulo;
        property CODTitulo : Integer read GetCODTitulo write SetCODTitulo;
        property CPFCNPJ : String read GetCPFCNPJ write SetCPFCNPJ;
        property ClienteCNC : Integer read GetClienteCNC write SetClienteCNC;
        property CodigoBarras : String
             read GetCodigoBarras write SetCodigoBarras;
        { Código do Cheque }
        property CodigoCHQ : Integer read GetCodigoCHQ write SetCodigoCHQ;
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property CodigoFCT : Integer read GetCodigoFCT write SetCodigoFCT;
        property Comp : Integer read GetComp write SetComp;
        property Conta : Integer read GetConta write SetConta;
        property Data : Tdatetime read GetData write SetData;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataEnviado : TDateTime
             read GetDataEnviado write SetDataEnviado;
        property DonoCheque : String read GetDonoCheque write SetDonoCheque;
        property EAgencia : TMaskEdit read FEAgencia write FEAgencia;
        property EBanco : TMaskEdit read FEBanco write FEBanco;
        property EC1 : TMaskEdit read FEC1 write FEC1;
        property EC2 : TMaskEdit read FEC2 write FEC2;
        property EC3 : TMaskEdit read FEC3 write FEC3;
        property ECNCTitulo : TEdit read FECNCTitulo write FECNCTitulo;
        property ECODTitulo : TEdit read FECODTitulo write FECODTitulo;
        property ECPFCNPJ : TMaskEdit read FECPFCNPJ write FECPFCNPJ;
        property EClienteCNC : TEdit read FEClienteCNC write FEClienteCNC;
        property ECodigoBarras : TEdit
             read FECodigoBarras write FECodigoBarras;
        property ECodigoCHQ : TEdit read FECodigoCHQ write FECodigoCHQ;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoFCT : TEdit read FECodigoFCT write FECodigoFCT;
        property EComp : TMaskEdit read FEComp write FEComp;
        property EConta : TMaskEdit read FEConta write FEConta;
        property EData : TMaskEdit read FEData write FEData;
        property EDonoCheque : TEdit read FEDonoCheque write FEDonoCheque;
        property EER : TComboBox read FEER write FEER;
        property EFactoringCNC : TEdit
             read FEFactoringCNC write FEFactoringCNC;
        property ENominal : TEdit read FENominal write FENominal;
        property ENumero : TMaskEdit read FENumero write FENumero;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ER : String read GetER write SetER;
        property ESituacao : TCombobox read FESituacao write FESituacao;
        property ETerceiro : TCheckBox read FETerceiro write FETerceiro;
        property EValor : TEdit read FEValor write FEValor;
        property Enviado : Boolean read GetEnviado write SetEnviado;
        property FactoringCNC : Integer
             read GetFactoringCNC write SetFactoringCNC;
        property Nominal : String read GetNominal write SetNominal;
        { Numero do Cheque }
        property Numero : String read GetNumero write SetNumero;
        property OBS : String read GetOBS write SetOBS;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Terceiro : Integer read GetTerceiro write SetTerceiro;
        property Utilizado : Boolean read GetUtilizado write SetUtilizado;
        property Valor : Double read GetValor write SetValor;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCheque with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCheque]);
end;

{ Method to set variable and property values and create objects }
procedure TCheque.AutoInitialize;
begin
     FEAgencia := nil;
     FEBanco := nil;
     FEC1 := nil;
     FEC2 := nil;
     FEC3 := nil;
     FECNCTitulo := nil;
     FECODTitulo := nil;
     FECPFCNPJ := nil;
     FEClienteCNC := nil;
     FECodigoBarras := nil;
     FECodigoCHQ := nil;
     FECodigoCLI := nil;
     FECodigoFCT := nil;
     FEComp := nil;
     FEConta := nil;
     FEData := nil;
     FEDonoCheque := nil;
     FEER := nil;
     FEFactoringCNC := nil;
     FENominal := nil;
     FENumero := nil;
     FEOBS := nil;
     FESituacao := nil;
     FETerceiro := nil;
     FEValor := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCheque.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAgencia then
        FEAgencia := nil;
     if AComponent = FEBanco then
        FEBanco := nil;
     if AComponent = FEC1 then
        FEC1 := nil;
     if AComponent = FEC2 then
        FEC2 := nil;
     if AComponent = FEC3 then
        FEC3 := nil;
     if AComponent = FECNCTitulo then
        FECNCTitulo := nil;
     if AComponent = FECODTitulo then
        FECODTitulo := nil;
     if AComponent = FECPFCNPJ then
        FECPFCNPJ := nil;
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodigoBarras then
        FECodigoBarras := nil;
     if AComponent = FECodigoCHQ then
        FECodigoCHQ := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoFCT then
        FECodigoFCT := nil;
     if AComponent = FEComp then
        FEComp := nil;
     if AComponent = FEConta then
        FEConta := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEDonoCheque then
        FEDonoCheque := nil;
     if AComponent = FEER then
        FEER := nil;
     if AComponent = FEFactoringCNC then
        FEFactoringCNC := nil;
     if AComponent = FENominal then
        FENominal := nil;
     if AComponent = FENumero then
        FENumero := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETerceiro then
        FETerceiro := nil;
     if AComponent = FEValor then
        FEValor := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCheque.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Agencia }
function TCheque.GetAgencia : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_AGENCIA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Agencia }
procedure TCheque.SetAgencia(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_AGENCIA').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_AGENCIA"!');
  end;
end;

{ Read method for property Banco }
function TCheque.GetBanco : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_BANCO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Banco }
procedure TCheque.SetBanco(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_BANCO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_BANCO"!');
  end;
end;

{ Read method for property C1 }
function TCheque.GetC1 : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_C1').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property C1 }
procedure TCheque.SetC1(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_C1').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_C1"!');
  end;
end;

{ Read method for property C2 }
function TCheque.GetC2 : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_C2').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property C2 }
procedure TCheque.SetC2(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_C2').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_C2"!');
  end;
end;

{ Read method for property C3 }
function TCheque.GetC3 : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_C3').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property C3 }
procedure TCheque.SetC3(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_C3').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_C3"!');
  end;
end;

{ Read method for property CNCTitulo }
function TCheque.GetCNCTitulo : Integer;
begin
  try
    result := Self.fieldByName('CHQ_CNC_TITULO').asInteger;
  except
    result := 0
  end;
end;

{ Write method for property CNCTitulo }
procedure TCheque.SetCNCTitulo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CHQ_CNC_TITULO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CHQ_CNC_TITULO"!');
    end;
end;

{ Read method for property CODTitulo }
function TCheque.GetCODTitulo : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_COD_TITULO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CODTitulo }
procedure TCheque.SetCODTitulo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_COD_TITULO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_COD_TITULO"!');
  end;
end;

{ Read method for property CPFCNPJ }
function TCheque.GetCPFCNPJ : String;
begin
  try
    Result := Self.fieldByName('CHQ_CPF_CNPJ').asString;
  except
    result:= '';
  end;
end;

{ Write method for property CPFCNPJ }
procedure TCheque.SetCPFCNPJ(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_CPD_CNPJ').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_CPD_CNPJ"!');
  end;
end;

{ Read method for property ClienteCNC }
function TCheque.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property ClienteCNC }
procedure TCheque.SetClienteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_CLIENTE').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
  end;
end;

{ Read method for property CodigoBarras }
function TCheque.GetCodigoBarras : String;
begin
  try
    Result := Self.fieldByName('CHQ_CODIGO_BARRAS').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CodigoBarras }
procedure TCheque.SetCodigoBarras(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_CODIGO_BARRAS').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_CODIGO_BARRAS"!');
  end;
end;

{ Read method for property CodigoCHQ }
function TCheque.GetCodigoCHQ : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCHQ }
procedure TCheque.SetCodigoCHQ(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CHQ_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CHQ_CODIGO"!');
    end;
end;

{ Read method for property CodigoCLI }
function TCheque.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCLI }
procedure TCheque.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
  end;
end;

{ Read method for property CodigoFCT }
function TCheque.GetCodigoFCT : Integer;
begin
  try
    Result := Self.fieldByName('FCT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFCT }
procedure TCheque.SetCodigoFCT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FCT_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FCT_CODIGO"!');
  end;
end;

{ Read method for property Comp }
function TCheque.GetComp : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_COMP').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Comp }
procedure TCheque.SetComp(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_COMP').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_COMP"!');
  end;
end;

{ Read method for property Conta }
function TCheque.GetConta : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_CONTA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Conta }
procedure TCheque.SetConta(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_CONTA').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_CONTA"!');
  end;
end;

{ Read method for property Data }
function TCheque.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('CHQ_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TCheque.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_DATA"!');
  end;
end;

{ Read method for property DataAlterado }
function TCheque.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CHQ_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TCheque.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TCheque.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('CHQ_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TCheque.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_DT_CADASTRO"!');
  end;
end;

{ Read method for property DataEnviado }
function TCheque.GetDataEnviado : TDateTime;
begin
  try
    Result := Self.fieldByName('CHQ_DT_ENVIADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataEnviado }
procedure TCheque.SetDataEnviado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_DT_ENVIADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_DT_ENVIADO"!');
  end;
end;

{ Read method for property DonoCheque }
function TCheque.GetDonoCheque : String;
begin
  try
    Result := Self.fieldByName('CHQ_DONO_CHEQUE').asString;
  except
    result:= '';
  end;
end;

{ Write method for property DonoCheque }
procedure TCheque.SetDonoCheque(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_DONO_CHEQUE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_DONO_CHEQUE"!');
  end;
end;

{ Read method for property ER }
function TCheque.GetER : String;
begin
  try
    Result := Self.fieldByName('CHQ_ER').asString;
  except
    result:= ''
  end;
end;

{ Write method for property ER }
procedure TCheque.SetER(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_ER').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_ER"!');
  end;
end;

{ Read method for property Enviado }
function TCheque.GetEnviado : Boolean;
begin
  try
    Result := (Self.fieldByName('CHQ_ENVIADO').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property Enviado }
procedure TCheque.SetEnviado(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('CHQ_ENVIADO').asInteger := 1
      else
        Self.fieldByName('CHQ_ENVIADO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CHQ_ENVIADO"!');
    end;
end;

{ Read method for property FactoringCNC }
function TCheque.GetFactoringCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_FACTORING').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property FactoringCNC }
procedure TCheque.SetFactoringCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CNC_FACTORING').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CNC_FACTORING"!');
  end;
end;

{ Read method for property Nominal }
function TCheque.GetNominal : String;
begin
  try
    Result := Self.fieldByName('CHQ_NOMINAL').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Nominal }
procedure TCheque.SetNominal(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_NOMINAL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_NOMINAL"!');
  end;
end;

{ Read method for property Numero }
function TCheque.GetNumero : String;
begin
  try
    Result := Self.fieldByName('CHQ_NUMERO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Numero }
procedure TCheque.SetNumero(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_NUMERO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_NUMERO"!');
  end;
end;

{ Read method for property OBS }
function TCheque.GetOBS : String;
begin
  try
    Result := Self.fieldByName('CHQ_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TCheque.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TCheque.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TCheque.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_SITUACAO"!');
  end;
end;

{ Read method for property Terceiro }
function TCheque.GetTerceiro : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_TERCEIRO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Terceiro }
procedure TCheque.SetTerceiro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_TERCEIRO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_TERCEIRO"!');
  end;
end;

{ Read method for property Utilizado }
function TCheque.GetUtilizado : Boolean;
begin
  try
    Result := (Self.fieldByName('CHQ_UTILIZADO').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property Utilizado }
procedure TCheque.SetUtilizado(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('CHQ_UTILIZADO').asInteger := 1
      else
        Self.fieldByName('CHQ_UTILIZADO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CHQ_UTILIZADO"!');
    end;
end;

{ Read method for property Valor }
function TCheque.GetValor : Double;
begin
  try
    Result := Self.fieldByName('CHQ_VALOR').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Valor }
procedure TCheque.SetValor(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CHQ_VALOR').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CHQ_VALOR"!');
  end;
end;

function TCheque.AlterarAuto:Boolean;
var
  sValor, sTerceiro, sCNCTitulo, sCODTitulo, sSituacao: string;
begin
  Result := False;
  try
    sValor      := VirgPonto(StrToFloat(EValor.Text));
  except
    sValor      := '0';
  end;
  try
    If ETerceiro.Checked then
      sTerceiro   := '1'
    else
      sTerceiro   := '0'
  except
    sTerceiro     := '0';
  end;
  try
    sCNCTitulo    := IntToStr(StrToInt(ECNCTitulo.Text));
  except
    sCNCTitulo    := '0';
  end;
  try
    sCODTitulo    := IntToStr(StrToInt(ECODTitulo.Text));
  except
    sCODTitulo    := '0';
  end;
  try
    sSituacao     := IntToStr(ESituacao.ItemIndex);
  except
    sSituacao     := '0';
  end;
  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT CHQ_CODIGO '+
      ' FROM CHEQUE '+
      ' WHERE CHQ_CODIGO<>'+IntToStr(CodigoCHQ)+
      ' AND CHQ_BANCO='+EBanco.Text+
      ' AND CHQ_AGENCIA='+EAgencia.Text+
      ' AND CHQ_CONTA='+EConta.Text+
      ' AND CHQ_NUMERO="'+ENumero.Text+'" ';
    Open;
    if not isEmpty then
    Begin
      ShowMessage('Cheque (Banco/Agencia/Conta/Número) já cadastrado!');
      Exit;
    end;
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE CHEQUE SET '+
      ' CHQ_DT_ALTERADO="'   +MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',USU_CODIGO='         +IntToStr(CConfiguracao.CodigoUSU)+
      ',CNC_CLIENTE='        +EClienteCNC.Text+
      ',CLI_CODIGO='         +ECodigoCLI.Text+
      ',CHQ_CODIGO_BARRAS="' +ECodigoBarras.Text+'" '+
      ',CHQ_COMP="'          +EComp.Text+'" '+
      ',CHQ_BANCO="'         +EBanco.Text+'" '+
      ',CHQ_AGENCIA="'       +EAgencia.Text+'" '+
      ',CHQ_C1="'            +EC1.Text+'" '+
      ',CHQ_CONTA="'         +EConta.Text+'" '+
      ',CHQ_C2="'            +EC2.Text+'" '+
      ',CHQ_NUMERO="'        +ENumero.Text+'" '+
      ',CHQ_C3="'            +EC3.Text+'" '+
      ',CHQ_VALOR='          +sValor+
      ',CHQ_DATA="'          +MesDia(EData.Text)+'" '+
      ',CHQ_ER="'            +EER.Text[1]+'" '+
      ',CHQ_TERCEIRO="'      +sTerceiro+'" '+
      ',CHQ_CNC_TITULO='     +sCNCTitulo+
      ',CHQ_COD_TITULO='     +sCODTitulo+
      ',CHQ_DONO_CHEQUE="'   +EDonoCheque.Text+'" '+
      ',CHQ_CPF_CNPJ="'      +ECPFCNPJ.Text+'" '+
      ',CHQ_NOMINAL="'       +ENominal.Text+'" '+
      ',CHQ_SITUACAO='       +sSituacao+
      ',CHQ_OBSERVACAO="'    +EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
      ' AND CHQ_CODIGO='+IntToStr(CodigoCHQ));

    GeraLog(6670,CodigoCNC,CodigoCHQ);
    Result:=True;
  except
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TCheque.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EER.Enabled          :=not Habilitar;
  Except
  End;
  Try
    ECodigoCLI.Enabled        :=Habilitar;
  Except
  End;
  Try
    EComp.Enabled        :=Habilitar;
  Except
  End;
  Try
    EBanco.Enabled       :=Habilitar;
  Except
  End;
  Try
    EAgencia.Enabled     :=Habilitar;
  Except
  End;
  Try
    EC1.Enabled          :=Habilitar;
  Except
  End;
  Try
    EConta.Enabled       :=Habilitar;
  Except
  End;
  Try
    EC2.Enabled          :=Habilitar;
  Except
  End;
  Try
    ENumero.Enabled      :=Habilitar;
  Except
  End;
  Try
    EC3.Enabled          :=Habilitar;
  Except
  End;
  Try
    EData.Enabled        :=Habilitar;
  Except
  End;
  Try
    EValor.Enabled       :=Habilitar;
  Except
  End;
  Try
    ETerceiro.Enabled    :=Habilitar;
  Except
  End;
  Try
    ENominal.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodTitulo.Enabled   :=Habilitar;
  Except
  End;
  Try
    if ETerceiro.Checked then
    Begin
      EDonoCheque.Enabled  := Habilitar;
      ECPFCNPJ.Enabled     := Habilitar;
    end
    else
    Begin
      EDonoCheque.Enabled  := False;
      ECPFCNPJ.Enabled  := False;
    end;
  Except
  End;
  Try
    EOBS.Enabled         :=Habilitar;
  Except
  End;
end;

procedure TCheque.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TCheque.CarregaDados;
begin
  Try
    EER.Text             := ER;
  Except
  End;
  Try
    ECodigoCHQ.Text      := IntToStr(CodigoCHQ);
  Except
  End;
  Try
    EClienteCNC.Text      := IntToStr(ClienteCNC);
  Except
  End;
  Try
    ECodigoCLI.Text      := IntToStr(CodigoCLI);
  Except
  End;
  Try
    EFactoringCNC.Text      := IntToStr(FactoringCNC);
  Except
  End;
  Try
    ECodigoFCT.Text      := IntToStr(CodigoFCT);
  Except
  End;
  Try
    ECodigoBarras.Text   := CodigoBarras;
  Except
  End;
  Try
    EComp.Text           := PreencheZero(3,Comp);
  Except
  End;
  Try
    EBanco.Text          := PreencheZero(3,Banco);
  Except
  End;
  Try
    EAgencia.Text        := PreencheZero(4,Agencia);
  Except
  End;
  Try
    EC1.Text             := IntToStr(C1);
  Except
  End;
  Try
    EConta.Text          := PreencheZero(12,Conta);
  Except
  End;
  Try
    EC2.Text             := IntToStr(C2);
  Except
  End;
  Try
    ENumero.Text         := Numero;
  Except
  End;
  Try
    EC3.Text             := IntToStr(C3);
  Except
  End;
  Try
   if Data=0 then
     EData.Text:=''
   else
     EData.Text          := FormatDateTime('dd/mm/yyyy', Data);
  Except
  End;
  Try
    EValor.Text          := Format('%.2f', [Valor]);
  Except
  End;
  Try
    If Terceiro=0 then
      ETerceiro.Checked  := False
    Else
      ETerceiro.Checked  := True;
  Except
  End;
  Try
    ENominal.Text        := Nominal;
  Except
  End;
  Try
    ECODTitulo.Text      := IntToStr(CODTitulo);
  Except
  End;
  Try
    ECNCTitulo.Text      := IntToStr(CNCTitulo);
  Except
  End;
  Try
    EDonoCheque.Text     := DonoCheque;
  Except
  End;
  Try
    ECPFCNPJ.Text     := CPFCNPJ;
  Except
  End;
  Try
    ESituacao.itemindex  := Situacao;
  Except
  End;
  Try
    EOBS.Text            := OBS;
  Except
  End;
end;

constructor TCheque.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CHEQUE';

     { Code to perform other tasks when the component is created }

end;

function TCheque.Deletar(CdCNC,CdCHQ:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdCHQ,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        RegistrarDel(CdCNC,1230,CdCHQ);
        GeraLog(6680,CdCNC,CdCHQ);
        if TQuery(Self).IsEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TCheque.Destroy;
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

function TCheque.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem:='';
  if EComp.Text = '' then
    EComp.Text := '000';
  if EBanco.Text = '' then
    EBanco.Text := '000';
  if EAgencia.Text = '' then
    EAgencia.Text := '0000';
  if EC1.Text = '' then
    EC1.Text := '0';
  if EConta.Text = '' then
    EConta.Text := '000000000000';
  if EC2.Text = '' then
    EC2.Text := '0';
  if EC3.Text = '' then
    EC3.Text := '0';

  if CConfiguracao.Empresa = empMOTICAL then
  Begin
    if not VerificaCPFCNPJBranco(ECPFCNPJ.Text) then
      mensagem:=mensagem+'CPF/CNPJ inválido!'+#13;
  end
  else
  Begin
    if not VerificaCPFCNPJ(ECPFCNPJ.Text) then
      mensagem:=mensagem+'CPF/CNPJ inválido!'+#13;
  end;
  if ETerceiro.Checked and (Trim(EDonoCheque.Text) = '') then
    mensagem:=mensagem+'Defina o Dono do Cheque!'+#13;
  if not VerificaDataBranco(EData.text) then
    mensagem:=mensagem+'Data digitada incorretamente!'+#13;
  if not VerificaFloatBranco(EValor.text) then
    mensagem:=mensagem+'Valor incorreto!'+#13
  else if StrToFloat(EValor.Text) < 0 then
    mensagem:=mensagem+'Valor incorreto!'+#13;
  if not VerificaInteiroBranco(EClienteCNC.Text) then
    mensagem:=mensagem+'Centro de Custo do Cliente inválido!'+#13;
  if not VerificaInteiroBranco(ECodigoCLI.Text) then
    mensagem:=mensagem+'Código do Cliente inválido!'+#13;
  if mensagem <> '' then
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
        close;
        open;
        LocalizarCod(SCodigo, CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      End
      else
        Result := False;
    end
    Else If Estado=2 then
    Begin
      cod:=codigoCHQ;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      End
      else
        Result := False;
    end
    else
      Result := False;
    AfterScroll:=Aux;
  End;
end;

function TCheque.Inserir(CdCLICNC,CdCLI,PTituloCNC,PTitulo,iTerceiro: integer; DtData:TDateTime; PValor:Double; PER,PComp,PBanco,PAgencia,PConta,PNumero,PC1,PC2,PC3,PDono,PCPF,PNominal,POBS:string):Boolean;
begin
  SCodigo := CConfiguracao.ProximoCodigo('CHQ_CODIGO');
  
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO CHEQUE '+
        '(CNC_CODIGO,CHQ_CODIGO,USU_CODIGO,CNC_CLIENTE,CLI_CODIGO'+
        ',CHQ_DT_CADASTRO'+
        ',CHQ_CODIGO_BARRAS,CHQ_COMP,CHQ_BANCO,CHQ_AGENCIA'+
        ',CHQ_C1,CHQ_CONTA,CHQ_C2,CHQ_NUMERO,CHQ_C3'+
        ',CHQ_VALOR,CHQ_DATA,CHQ_ER,CHQ_TERCEIRO'+
        ',CHQ_CNC_TITULO,CHQ_COD_TITULO,CHQ_DONO_CHEQUE,CHQ_CPF_CNPJ '+
        ',CHQ_NOMINAL,CHQ_SITUACAO,CHQ_OBSERVACAO)'+
        ' VALUES ( '+
        '  '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(SCodigo)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ', '+IntToStr(CdCLICNC)+
        ', '+IntToStr(CdCLI)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ',"" '+ //Código de Barras
        ',"'+PComp+'" '+
        ',"'+PBanco+'" '+
        ',"'+PAgencia+'" '+
        ',"'+PC1+'" '+
        ',"'+PConta+'" '+
        ',"'+PC2+'" '+
        ',"'+PNumero+'" '+
        ',"'+PC3+'" '+
        ', '+VirgPonto(PValor)+
        ',"'+MesDia(DtData)+'" '+
        ',"'+PER+'" '+
        ', '+IntToStr(iTerceiro)+
        ', '+IntToStr(PTituloCNC)+
        ', '+IntToStr(PTitulo)+
        ',"'+PDono+'" '+
        ',"'+PCPF+'" '+
        ',"'+PNominal+'" '+
        ',0'+ //Situacao
        ',"'+POBS+'")');

      GeraLog(6650,CConfiguracao.CodigoCNC,SCodigo);

      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
end;

function TCheque.InserirAuto:Boolean;
var
  iTerceiro:integer;
begin
  result:=false;
  if not VerificaInteiroBranco(ECNCTitulo.Text) then
    ECNCTitulo.Text := '0';
  if not VerificaInteiroBranco(ECODTitulo.Text) then
    ECODTitulo.Text := '0';
  iTerceiro:=0;
  try
    If ETerceiro.Checked then
     iTerceiro := 1
  except
  end;

  If (localizarCod(SCodigo,CodigoCNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  begin
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT CHQ_CODIGO '+
        ' FROM CHEQUE '+
        ' WHERE CHQ_CODIGO<>'+ECodigoCHQ.Text+
        ' AND CHQ_BANCO='+EBanco.Text+
        ' AND CHQ_AGENCIA='+EAgencia.Text+
        ' AND CHQ_CONTA='+EConta.Text+
        ' AND CHQ_NUMERO="'+ENumero.Text+'" ';
      Open;
      if not isEmpty then
      Begin
        ShowMessage('Cheque (Banco/Agencia/Conta/Número) já cadastrado!');
        Exit;
      end;
    end;

    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO CHEQUE '+
        '(CNC_CODIGO,CHQ_CODIGO,USU_CODIGO,CNC_CLIENTE,CLI_CODIGO'+
        ',CHQ_DT_CADASTRO'+
        ',CHQ_CODIGO_BARRAS,CHQ_COMP,CHQ_BANCO,CHQ_AGENCIA'+
        ',CHQ_C1,CHQ_CONTA,CHQ_C2,CHQ_NUMERO,CHQ_C3'+
        ',CHQ_VALOR,CHQ_DATA,CHQ_ER,CHQ_TERCEIRO'+
        ',CHQ_CNC_TITULO,CHQ_COD_TITULO,CHQ_DONO_CHEQUE,CHQ_CPF_CNPJ '+
        ',CHQ_NOMINAL,CHQ_SITUACAO,CHQ_OBSERVACAO)'+
        ' VALUES ( '+
        '  '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(SCodigo)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ', '+EClienteCNC.Text+
        ', '+ECodigoCLI.Text+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ',"'+ECodigoBarras.Text+'" '+
        ',"'+EComp.Text+'" '+
        ',"'+EBanco.Text+'" '+
        ',"'+EAgencia.Text+'" '+
        ',"'+EC1.Text+'" '+
        ',"'+EConta.Text+'" '+
        ',"'+EC2.Text+'" '+
        ',"'+ENumero.Text+'" '+
        ',"'+EC3.Text+'" '+
        ', '+VirgPonto(EValor.Text)+
        ',"'+MesDia(EData.Text)+'" '+
        ',"'+EER.Text[1]+'" '+
        ', '+IntToStr(iTerceiro)+
        ', '+ECNCTitulo.Text+
        ', '+ECODTitulo.Text+
        ',"'+EDonoCheque.Text+'" '+
        ',"'+ECPFCNPJ.Text+'" '+
        ',"'+ENominal.Text+'" '+
        ', '+IntToStr(ESituacao.ItemIndex)+
        ',"'+EOBS.Text+'")');

      GeraLog(6650,CConfiguracao.CodigoCNC,SCodigo);

      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  end;
end;

procedure TCheque.LimpaCampos;
begin
  Try
    if estado <> 1 then
      ECodigoCHQ.Clear;
  Except
  End;
  Try
    ECodigoBarras.Clear;
  Except
  End;
  Try
    if CConfiguracao.Empresa = 3 then
      EClienteCNC.Text := '1'
    else if EClienteCNC.Text = '' then 
      EClienteCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado = 0 then
      ECodigoCLI.Clear;
  Except
  End;
  Try
    if CConfiguracao.Empresa = 3 then
      EFactoringCNC.Text := '1'
    else if EFactoringCNC.Text = '' then 
      EFactoringCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado = 0 then
      ECodigoFCT.Clear;
  Except
  End;
  Try
    if estado <> 1 then
      EComp.Clear
    else if EComp.Text = '' then 
      EComp.Text := '008';
  Except
  End;
  Try
    if Estado = 0 then
      EBanco.Clear;
  Except
  End;
  Try
    if Estado = 0 then  
      EAgencia.Clear;
  Except
  End;
  Try
    if Estado = 0 then  
      EC1.Clear;
  Except
  End;
  Try
    if Estado = 0 then  
      EConta.Clear;
  Except
  End;
  Try
    if Estado = 0 then  
      EC2.Clear;
  Except
  End;
  Try
    if Estado = 0 then  
      ENumero.Clear;
  Except
  End;
  Try
    if Estado = 0 then  
      EC3.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EData.Clear
    else if EData.Text = '' then 
      EData.Text := DateToStr(CConfiguracao.Data);
  Except
  End;
  Try
    EValor.Clear;
  Except
  End;
  Try
    if Estado = 0 then
      ETerceiro.Checked:=False;
  Except
  End;
  Try
    if Estado = 0 then
      ENominal.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ECNCTitulo.Clear
    else if ECNCTitulo.Text = '' then 
      ECNCTitulo.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado = 0 then
      ECODTitulo.Clear;
  Except
  End;
  Try
    if Estado = 0 then
      EDonoCheque.Clear;
  Except
  End;
  Try
    if Estado = 0 then
      ECPFCNPJ.Clear;
  Except
  End;
  Try
    if Estado = 0 then
      EOBS.Clear;
  Except
  End;
end;

{ Localiza um cheque }
function TCheque.LocalizarCod(CdCHQ,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdCHQ<>CodigoCHQ) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;CHQ_CODIGO', vararrayof([CdCNC, CdCHQ]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TCheque.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TCheque.PreparaInsercao;
begin
  ProximoCodigo('CHQ_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TCheque.deletarauto:Boolean;
var
  CdCNC, CdCHQ: integer;
  sNumero: string;
begin
  Result:=False;
  try
    CdCNC := CodigoCNC;
    CdCHQ := CodigoCHQ;
    sNumero := Numero;
    if Delete then
    Begin
      result:=true;
      RegistrarDel(CdCNC,1230,CdCHQ,'Numero:'+Numero);
      GeraLog(6680,CdCNC,CdCHQ,'Numero: '+sNumero);
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
