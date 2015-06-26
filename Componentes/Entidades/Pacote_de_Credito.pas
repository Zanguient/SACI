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
unit Pacote_de_Credito;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TPacote_de_Credito = class(TSQuery)
    private
      { Private fields of TPacote_de_Credito }
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodigoAGF }
        FCodigoAGF : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoFPG }
        FCodigoFPG : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoPCR }
        FCodigoPCR : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EClienteCNC }
        FEClienteCNC : TEdit;
        { Storage for property ECodigoAGF }
        FECodigoAGF : TDBLookupComboBox;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoFPG }
        FECodigoFPG : TDBLookupComboBox;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComboBox;
        { Storage for property ECodigoPCR }
        FECodigoPCR : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipoPag }
        FETipoPag : TDBLookupComboBox;
        { Storage for property EValor }
        FEValor : TEdit;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TipoPag }
        FTipoPag : Integer;
        { Storage for property Valor }
        FValor : Double;

      { Private methods of TPacote_de_Credito }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Write method for property ClienteCNC }
        procedure SetClienteCNC(Value : Integer);
        { Read method for property CodigoAGF }
        function GetCodigoAGF : Integer;
        { Write method for property CodigoAGF }
        procedure SetCodigoAGF(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property CodigoFPG }
        function GetCodigoFPG : Integer;
        { Write method for property CodigoFPG }
        procedure SetCodigoFPG(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoPCR }
        function GetCodigoPCR : Integer;
        { Write method for property CodigoPCR }
        procedure SetCodigoPCR(Value : Integer);
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
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property TipoPag }
        function GetTipoPag : Integer;
        { Write method for property TipoPag }
        procedure SetTipoPag(Value : Integer);
        { Read method for property Valor }
        function GetValor : Double;
        { Write method for property Valor }
        procedure SetValor(Value : Double);

    protected
      { Protected fields of TPacote_de_Credito }

      { Protected methods of TPacote_de_Credito }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TPacote_de_Credito }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TPacote_de_Credito }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdPCR:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza uma Conta de Caixa }
        function LocalizarCod(CdPCR,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TPacote_de_Credito }
        property ClienteCNC : Integer read GetClienteCNC write SetClienteCNC;
        property CodigoAGF : Integer read GetCodigoAGF write SetCodigoAGF;
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property CodigoFPG : Integer read GetCodigoFPG write SetCodigoFPG;
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        { Código da Pacote de Crédito }
        property CodigoPCR : Integer read GetCodigoPCR write SetCodigoPCR;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EClienteCNC : TEdit read FEClienteCNC write FEClienteCNC;
        property ECodigoAGF : TDBLookupComboBox
             read FECodigoAGF write FECodigoAGF;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoFPG : TDBLookupComboBox
             read FECodigoFPG write FECodigoFPG;
        property ECodigoFUN : TDBLookupComboBox
             read FECodigoFUN write FECodigoFUN;
        property ECodigoPCR : TEdit read FECodigoPCR write FECodigoPCR;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipoPag : TDBLookupComboBox read FETipoPag write FETipoPag;
        property EValor : TEdit read FEValor write FEValor;
        property Observacao : String read GetObservacao write SetObservacao;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property TipoPag : Integer read GetTipoPag write SetTipoPag;
        property Valor : Double read GetValor write SetValor;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TPacote_de_Credito with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TPacote_de_Credito]);
end;

{ Method to set variable and property values and create objects }
procedure TPacote_de_Credito.AutoInitialize;
begin
     Estado := 0;
     FEClienteCNC := nil;
     FECodigoAGF := nil;
     FECodigoCLI := nil;
     FECodigoFPG := nil;
     FECodigoFUN := nil;
     FECodigoPCR := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEObservacao := nil;
     FESituacao := nil;
     FETipoPag := nil;
     FEValor := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TPacote_de_Credito.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodigoAGF then
        FECodigoAGF := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoFPG then
        FECodigoFPG := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoPCR then
        FECodigoPCR := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipoPag then
        FETipoPag := nil;
     if AComponent = FEValor then
        FEValor := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TPacote_de_Credito.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ClienteCNC }
function TPacote_de_Credito.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property ClienteCNC }
procedure TPacote_de_Credito.SetClienteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodigoAGF }
function TPacote_de_Credito.GetCodigoAGF : Integer;
begin
  try
    Result := Self.fieldByName('AGF_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoAGF }
procedure TPacote_de_Credito.SetCodigoAGF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_CODIGO"!');
    end;
end;

{ Read method for property CodigoCLI }
function TPacote_de_Credito.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCLI }
procedure TPacote_de_Credito.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoFPG }
function TPacote_de_Credito.GetCodigoFPG : Integer;
begin
  try
    Result := Self.fieldByName('FPG_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFPG }
procedure TPacote_de_Credito.SetCodigoFPG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TPacote_de_Credito.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFUN }
procedure TPacote_de_Credito.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoPCR }
function TPacote_de_Credito.GetCodigoPCR : Integer;
begin
  try
    Result := Self.fieldByName('PCR_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPCR }
procedure TPacote_de_Credito.SetCodigoPCR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCR_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TPacote_de_Credito.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('PCR_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TPacote_de_Credito.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCR_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCR_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TPacote_de_Credito.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('PCR_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TPacote_de_Credito.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCR_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCR_DT_CADASTRO"!');
  end;
end;

{ Read method for property Observacao }
function TPacote_de_Credito.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('PCR_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TPacote_de_Credito.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCR_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCR_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TPacote_de_Credito.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('PCR_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TPacote_de_Credito.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCR_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCR_SITUCAO"!');
    end;
end;

{ Read method for property TipoPag }
function TPacote_de_Credito.GetTipoPag : Integer;
begin
  try
    Result := Self.fieldByName('PCR_TIPO_PAG').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TipoPag }
procedure TPacote_de_Credito.SetTipoPag(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCR_TIPO_PAG').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCR_TIPO_PAG"!');
    end;
end;

{ Read method for property Valor }
function TPacote_de_Credito.GetValor : Double;
begin
  try
    Result := Self.fieldByName('PCR_VALOR').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Valor }
procedure TPacote_de_Credito.SetValor(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCR_VALOR').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCR_VALOR"!');
  end;
end;

function TPacote_de_Credito.AlterarAuto:Boolean;
begin
  Result:=false;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE PACOTE_CREDITO SET '+
      ' PCR_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',CNC_CLIENTE="'+EClienteCNC.Text+
      ',CLI_CODIGO="'+ECodigoCLI.Text+
      ',FUN_CODIGO='+IntToStr(ECodigoFUN.KeyValue)+
      ',PCR_TIPO_PAG='+IntToStr(ETipoPag.KeyValue)+
      ',FPG_CODIGO='+IntToStr(ECodigoFPG.KeyValue)+
      ',AGF_CODIGO='+IntToStr(ECodigoAGF.KeyValue)+
      ',PCR_VALOR='+VirgPonto(EValor.Text)+
      ',PCR_OBSERVACAO="'+EObservacao.Text+'" '+
      ' WHERE PCR_CODIGO='+IntToStr(CodigoPCR)+
      ' AND CNC_CODIGO='+IntToStr(CodigoCNC));
      Result:=True;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TPacote_de_Credito.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           := not Habilitar;
  except
  end;
  try
    ECodigoCLI.Enabled               := Habilitar;
  except
  end;
  try
    ECodigoFUN.Enabled           := Habilitar;
  except
  end;
  try
    ETipoPag.Enabled           := Habilitar;
  except
  end;
  try
    ECodigoFPG.Enabled           := Habilitar;
  except
  end;
  try
    ECodigoAGF.Enabled           := Habilitar;
  except
  end;
  try
    EValor.Enabled        := Habilitar;
  except
  end;
  try
    EObservacao.Enabled   := Habilitar;
  except
  end;
end;

procedure TPacote_de_Credito.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TPacote_de_Credito.CarregaDados;
begin
  try
    ECodigoPCR.Text           :=IntToStr(CodigoPCR);
  except
  end;
  try
    EClienteCNC.Text := IntToStr(ClienteCNC);
  except
  end;
  try
    ECodigoCLI.Text := IntToStr(CodigoCLI);
  except
  end;
  try
    if DataCadastro>0 then
      EDataCadastro.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado>0 then
      EDataAlterado.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  Try
    ECodigoFUN.KeyValue      :=CodigoFUN;
  Except
  End;
  Try
    ETipoPag.KeyValue        := TipoPag;
  Except
  End;
  Try
    ECodigoFPG.KeyValue      := CodigoFPG;
  Except
  End;
  Try
    ECodigoAGF.KeyValue      := CodigoAGF;
  Except
  End;
  try
    EValor.Text         :=Format('%.2f',[Valor]);
  except
  end;
  try
    ESituacao.ItemIndex := Situacao;
  except
  end;
  try
    EObservacao.Text := Observacao;
  except
  end;
end;

constructor TPacote_de_Credito.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'PACOTE_DE_CREDITO';

     { Code to perform other tasks when the component is created }

end;

function TPacote_de_Credito.Deletar(CdCNC,CdPCR:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdPCR,CdCNC)) Then
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

destructor TPacote_de_Credito.Destroy;
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

function TPacote_de_Credito.FinalizaEdicao:Boolean;
var
  mensagem:string;
  aux:TDataSetNotifyEvent;  
begin
  Result := False;
  mensagem:='';
  If not VerificaInteiroBranco(EClienteCNC.text) Then
    mensagem:=mensagem+'Centro de Custo do Cliente digitada incorretamente!';
  If not VerificaInteiroBranco(ECodigoCLI.text) Then
    mensagem:=mensagem+'Código do Cliente digitada incorretamente!';
  If ECodigoFUN.Text = '' Then
    mensagem:=mensagem+'Vendedor inválido!';
  If ETipoPag.Text = '' Then
    mensagem:=mensagem+'Tipo Pagamento inválido!';
  If ECodigoFPG.Text = '' Then
    mensagem:=mensagem+'Forma de Pagamento inválido!';
  If ECodigoAGF.Text = '' Then
    mensagem:=mensagem+'Agente Financeiro inválido!';
  If not VerificafloatBranco(EValor.text) Then
    mensagem:=mensagem+'Valor digitado incorretamente!';
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
    else If Estado=2 then
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

function TPacote_de_Credito.InserirAuto:Boolean;
begin
  result:=false;
  try
    append;
    try
      codigoPCR := SCodigo;
    except
    end;
    try
      ClienteCNC := StrToInt(EClienteCNC.Text);
    except
    end;
    try
      codigoCLI := StrToInt(ECodigoCLI.Text);
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      codigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      codigocnc := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoFUN := ECodigoFUN.KeyValue;
    except
    end;
    try
      TipoPag   := ETipopag.KeyValue;
    except
    end;
    try
      CodigoFPG := ECodigoFPG.KeyValue;
    except
    end;
    try
      CodigoAGF := ECodigoAGF.KeyValue;
    except
    end;
    try
      Valor := StrToFloat(EValor.Text);
    except
    end;
    try
      Situacao   := ESituacao.ItemIndex;
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
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TPacote_de_Credito.LimpaCampos;
begin
  try
    if CConfiguracao.Empresa = 3 then
      EClienteCNC.Text := '1'
    else
      EClienteCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  except
  end;
  try
    ECodigoCLI.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := FormatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  Try
    ECodigoFUN.KeyValue := 0;
  Except
  End;
  Try
    ETipoPag.KeyValue := 0;
  Except
  End;
  Try
    ECodigoFPG.KeyValue := 0;
  Except
  End;
  Try
    ECodigoAGF.KeyValue := 0;
  Except
  End;
  try
   EValor.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 0;
  except
  end;
  try
    EObservacao.Clear;
  except
  end;
end;

{ Localiza uma Conta de Caixa }
function TPacote_de_Credito.LocalizarCod(CdPCR,CdCNC:Integer):Boolean;
begin
  If (CdPCR<>CodigoPCR) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;PCR_CODIGO', vararrayof([CdCNC, CdPCR]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TPacote_de_Credito.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := FormatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TPacote_de_Credito.PreparaInsercao;
begin
  ProximoCodigo('PCR_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
