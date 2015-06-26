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
unit Direito_de_Bonus;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TDireito_de_Bonus = class(TSQuery)
    private
      { Private fields of TDireito_de_Bonus }
        { Storage for property BonusFOR }
        FBonusFOR : Double;
        { Storage for property BonusLoja }
        FBonusLoja : Double;
        { Storage for property CodigoDIB }
        FCodigoDIB : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EBonusFOR }
        FEBonusFOR : TEdit;
        { Storage for property EBonusLoja }
        FEBonusLoja : TEdit;
        { Storage for property ECodigoDIB }
        FECodigoDIB : TEdit;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EPreco }
        FEPreco : TEdit;
        { Storage for property EQuantidadeBonus }
        FEQuantidadeBonus : TEdit;
        { Storage for property EQuantidadeVendida }
        FEQuantidadeVendida : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Preco }
        FPreco : Double;
        { Storage for property QuantidadeBonus }
        FQuantidadeBonus : Double;
        { Storage for property QuantidadeVendida }
        FQuantidadeVendida : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TDireito_de_Bonus }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property BonusFOR }
        function GetBonusFOR : Double;
        { Write method for property BonusFOR }
        procedure SetBonusFOR(Value : Double);
        { Read method for property BonusLoja }
        function GetBonusLoja : Double;
        { Write method for property BonusLoja }
        procedure SetBonusLoja(Value : Double);
        { Read method for property CodigoDIB }
        function GetCodigoDIB : Integer;
        { Write method for property CodigoDIB }
        procedure SetCodigoDIB(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Write method for property CodigoPDV }
        procedure SetCodigoPDV(Value : Integer);
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
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Preco }
        function GetPreco : Double;
        { Write method for property Preco }
        procedure SetPreco(Value : Double);
        { Read method for property QuantidadeBonus }
        function GetQuantidadeBonus : Double;
        { Write method for property QuantidadeBonus }
        procedure SetQuantidadeBonus(Value : Double);
        { Read method for property QuantidadeVendida }
        function GetQuantidadeVendida : Double;
        { Write method for property QuantidadeVendida }
        procedure SetQuantidadeVendida(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TDireito_de_Bonus }

      { Protected methods of TDireito_de_Bonus }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TDireito_de_Bonus }

      { Public methods of TDireito_de_Bonus }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdDIB:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function Inserir(CdPDV, CdPRD, CdFUN: integer; PBonusFOR,PBonusLoja, PQtdVendida, PQtdBonus, PPrecoUnit:double; PObs:string=''):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um grupo de consórcio }
        function LocalizarCod(CdDIB:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TDireito_de_Bonus }
        property BonusFOR : Double read GetBonusFOR write SetBonusFOR;
        property BonusLoja : Double read GetBonusLoja write SetBonusLoja;
        property CodigoDIB : Integer read GetCodigoDIB write SetCodigoDIB;
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EBonusFOR : TEdit read FEBonusFOR write FEBonusFOR;
        property EBonusLoja : TEdit read FEBonusLoja write FEBonusLoja;
        property ECodigoDIB : TEdit read FECodigoDIB write FECodigoDIB;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EPreco : TEdit read FEPreco write FEPreco;
        property EQuantidadeBonus : TEdit
             read FEQuantidadeBonus write FEQuantidadeBonus;
        property EQuantidadeVendida : TEdit
             read FEQuantidadeVendida write FEQuantidadeVendida;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property Observacao : String read GetObservacao write SetObservacao;
        property Preco : Double read GetPreco write SetPreco;
        property QuantidadeBonus : Double
             read GetQuantidadeBonus write SetQuantidadeBonus;
        property QuantidadeVendida : Double
             read GetQuantidadeVendida write SetQuantidadeVendida;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TDireito_de_Bonus with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TDireito_de_Bonus]);
end;

{ Method to set variable and property values and create objects }
procedure TDireito_de_Bonus.AutoInitialize;
begin
     FEBonusFOR := nil;
     FEBonusLoja := nil;
     FECodigoDIB := nil;
     FECodigoPDV := nil;
     FECodigoPRD := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEObservacao := nil;
     FEPreco := nil;
     FEQuantidadeBonus := nil;
     FEQuantidadeVendida := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TDireito_de_Bonus.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBonusFOR then
        FEBonusFOR := nil;
     if AComponent = FEBonusLoja then
        FEBonusLoja := nil;
     if AComponent = FECodigoDIB then
        FECodigoDIB := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEPreco then
        FEPreco := nil;
     if AComponent = FEQuantidadeBonus then
        FEQuantidadeBonus := nil;
     if AComponent = FEQuantidadeVendida then
        FEQuantidadeVendida := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TDireito_de_Bonus.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property BonusFOR }
function TDireito_de_Bonus.GetBonusFOR : Double;
begin
  try
    Result := Self.fieldByName('DIB_BONUS_1').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property BonusFOR }
procedure TDireito_de_Bonus.SetBonusFOR(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DIB_BONUS_1').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DIB_BONUS_1"!');
    end;
end;

{ Read method for property BonusLoja }
function TDireito_de_Bonus.GetBonusLoja : Double;
begin
  try
    Result := Self.fieldByName('DIB_BONUS_2').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property BonusLoja }
procedure TDireito_de_Bonus.SetBonusLoja(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DIB_BONUS_2').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DIB_BONUS_2"!');
    end;
end;

{ Read method for property CodigoDIB }
function TDireito_de_Bonus.GetCodigoDIB : Integer;
begin
  try
    Result := Self.fieldByName('DIB_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoDIB }
procedure TDireito_de_Bonus.SetCodigoDIB(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DIB_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DIB_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TDireito_de_Bonus.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFUN }
procedure TDireito_de_Bonus.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoPDV }
function TDireito_de_Bonus.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPDV }
procedure TDireito_de_Bonus.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TDireito_de_Bonus.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TDireito_de_Bonus.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TDireito_de_Bonus.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('DIB_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TDireito_de_Bonus.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('DIB_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "DIB_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TDireito_de_Bonus.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('DIB_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TDireito_de_Bonus.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('DIB_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "DIB_DT_CADASTRO"!');
  end;
end;

{ Read method for property Observacao }
function TDireito_de_Bonus.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('DIB_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TDireito_de_Bonus.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DIB_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DIB_OBSERVACAO"!');
    end;
end;

{ Read method for property Preco }
function TDireito_de_Bonus.GetPreco : Double;
begin
  try
    Result := Self.fieldByName('DIB_PRECO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Preco }
procedure TDireito_de_Bonus.SetPreco(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DIB_PRECO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DIB_PRECO"!');
    end;
end;

{ Read method for property QuantidadeBonus }
function TDireito_de_Bonus.GetQuantidadeBonus : Double;
begin
  try
    Result := Self.fieldByName('DIB_QUANTIDADE_BONUS').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property QuantidadeBonus }
procedure TDireito_de_Bonus.SetQuantidadeBonus(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DIB_QUANTIDADE_BONUS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DIB_QUANTIDADE_BONUS"!');
    end;
end;

{ Read method for property QuantidadeVendida }
function TDireito_de_Bonus.GetQuantidadeVendida : Double;
begin
  try
    Result := Self.fieldByName('DIB_QUANTIDADE_VENDIDA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property QuantidadeVendida }
procedure TDireito_de_Bonus.SetQuantidadeVendida(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DIB_QUANTIDADE_VENDIDA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DIB_QUANTIDADE_VENDIDA"!');
    end;
end;

{ Read method for property Situacao }
function TDireito_de_Bonus.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('DIB_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TDireito_de_Bonus.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DIB_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DIB_SITUACAO"!');
    end;
end;

function TDireito_de_Bonus.AlterarAuto:Boolean;
begin
  try
    edit;
    try
      CodigoPDV := StrToint(ECodigoPDV.Text);
    except
    end;
    try
      CodigoPRD := StrToint(ECodigoPRD.Text);
    except
    end;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      BonusFOR := StrToFloat(EBonusFOR.Text);
    except
    end;
    try
      BonusLoja := StrToFloat(EBonusLoja.Text);
    except
    end;
    try
      QuantidadeVendida := StrToFloat(EQuantidadeVendida.Text);
    except
    end;
    try
      QuantidadeBonus := StrToFloat(EQuantidadeBonus.Text);
    except
    end;
    try
      Preco := StrToFloat(EPreco.Text);
    except
    end;    
    try
      Situacao := ESituacao.ItemIndex;
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

procedure TDireito_de_Bonus.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled            := not Habilitar;
  except
  end;
  try
    ECodigoPDV.Enabled         := Habilitar;
  except
  end;
  try
    ECodigoPRD.Enabled         := Habilitar;
  except
  end;
  try
    EBonusFOR.Enabled          := Habilitar;
  except
  end;
  try
    EBonusLoja.Enabled         := Habilitar;
  except
  end;
  try
    EQuantidadeVendida.Enabled := Habilitar;
  except
  end;
  try
    EQuantidadeBonus.Enabled   := Habilitar;
  except
  end;
  try
    EPreco.Enabled   := Habilitar;
  except
  end;  
  try
    ESituacao.Enabled   := Habilitar;
  except
  end;
  try
    EObservacao.Enabled   := Habilitar;
  except
  end;
end;

procedure TDireito_de_Bonus.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TDireito_de_Bonus.CarregaDados;
begin
  try
    ECodigoDIB.Text  :=IntToStr(CodigoDIB);
  except
  end;
  try
    ECodigoPDV.Text  :=IntToStr(CodigoPDV);
  except
  end;
  try
    ECodigoPRD.Text  :=IntToStr(CodigoPRD);
  except
  end;
  try
    if DataCadastro=0 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text          :=FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro);
    except
  end;
  try
    if DataAlterado=0 then
      EDataAlterado.Clear
    else
      EDataAlterado.Text          :=FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado);
  except
  end;
  try
    EBonusFOR.Text :=format('%.2f',[BonusFOR]);
  except
  end;
  try
    EBonusLoja.Text :=format('%.2f',[BonusLoja]);
  except
  end;
  try
    EQuantidadeVendida.Text :=format('%.2f',[QuantidadeVendida]);
  except
  end;
  try
    EQuantidadeBonus.Text :=format('%.2f',[QuantidadeBonus]);
  except
  end;
  try
    EPreco.Text :=format('%.2f',[Preco]);
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

constructor TDireito_de_Bonus.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'DIREITO_DE_BONUS';

     { Code to perform other tasks when the component is created }

end;

function TDireito_de_Bonus.Deletar(CdDIB:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdDIB)) Then
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

destructor TDireito_de_Bonus.Destroy;
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

function TDireito_de_Bonus.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if EBonusFOR.Text = '' then
    EBonusFOR.Text := '0';
  if EBonusLoja.Text = '' then
    EBonusLoja.Text := '0';
  if not VerificaFloatBranco(EBonusFOR.Text) then
    mensagem:=mensagem+'Bônus 1 incorreto!'+#13;
  if not VerificaFloatBranco(EBonusLoja.Text) then
    mensagem:=mensagem+'Bônus 2 incorreto!'+#13;
  if not VerificaFloatBranco(EQuantidadeVendida.Text) then
    mensagem:=mensagem+'Quantidade Vendida incorreta!'+#13;
  if not VerificaFloatBranco(EQuantidadeBonus.Text) then
    mensagem:=mensagem+'Quantidade Bônus incorreta!'+#13;
  if not VerificaFloatBranco(EPreco.Text) then
    mensagem:=mensagem+'Preço Unitário incorreto!'+#13;    
  If mensagem <>'' Then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
  else if (not VerificaFloatBranco(EBonusLoja.Text)) and
          (not VerificaFloatBranco(EBonusFOR.Text)) then
    ShowMessage('É necessário indica pelo menos um dos Bônus!')
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo);
        CarregaDados;
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoDIB;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        CarregaDados;
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
    AfterScroll:=aux;
  end;
end;

function TDireito_de_Bonus.Inserir(CdPDV, CdPRD, CdFUN: integer; PBonusFOR,PBonusLoja, PQtdVendida, PQtdBonus, PPrecoUnit:double; PObs:string=''):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  Cod    := ProximoCodigo('DIB_CODIGO');
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos, 'INSERT INTO DIREITO_DE_BONUS '+
        '(CNC_CODIGO, DIB_CODIGO, USU_CODIGO, PDV_CODIGO, PRD_CODIGO '+
        ',FUN_CODIGO, DIB_DT_CADASTRO '+
        ',DIB_BONUS_1, DIB_BONUS_2 '+
        ',DIB_QUANTIDADE_VENDIDA, DIB_QUANTIDADE_BONUS '+
        ',DIB_PRECO '+
        ',DIB_SITUACAO, DIB_OBSERVACAO) VALUES ' +
        '( '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(Cod)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ', '+IntToStr(CdPDV)+
        ', '+IntToStr(CdPRD)+
        ', '+IntToStr(CdFUN)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+VirgPonto(PBonusFOR)+
        ', '+VirgPonto(PBonusLoja)+
        ', '+VirgPonto(PQtdVendida)+
        ', '+VirgPonto(PQtdBonus)+
        ', '+VirgPonto(PPrecoUnit)+        
        ',0'+ //Situação
        ',"'+PObs+'") ');
      result := true;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
    end;
  end;
end;

function TDireito_de_Bonus.InserirAuto:Boolean;
begin
  result:=False;
  try
    append;
    try
      CodigoDIB   := SCodigo;
    except
    end;
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      codigoPDV   := StrToInt(ECodigoPDV.Text);
    except
    end;
    try
      codigoPRD   := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      BonusFOR    := StrToFloat(EBonusFOR.Text);
    except
    end;
    try
      BonusLoja   := StrToFloat(EBonusLoja.Text);
    except
    end;
    try
      QuantidadeVendida := StrToFloat(EQuantidadeVendida.Text);
    except
    end;
    try
      QuantidadeBonus   := StrToFloat(EQuantidadeBonus.Text);
    except
    end;
    try
      Preco             := StrToFloat(EPreco.Text);
    except
    end;    
    try
      Situacao := ESituacao.ItemIndex;
    except
    end;
    try
      Observacao        := EObservacao.Text;
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

procedure TDireito_de_Bonus.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoDIB.Clear;
  except
  end;
  try
    ECodigoPDV.Clear;
  except
  end;
  try
    ECodigoPRD.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    EBonusFOR.Clear;
  except
  end;
  try
    EBonusLoja.Clear;
  except
  end;
  try
    EQuantidadeVendida.Clear;
  except
  end;
  try
    EQuantidadeBonus.Clear;
  except
  end;
  try
    EPreco.Clear;
  except
  end;  
end;

{ Localiza um grupo de consórcio }
function TDireito_de_Bonus.LocalizarCod(CdDIB:Integer):Boolean;
begin
  If (CdDIB<>CodigoDIB) Then
    If locate('DIB_CODIGO', CdDIB, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TDireito_de_Bonus.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TDireito_de_Bonus.PreparaInsercao;
begin
  ProximoCodigo('DIB_CODIGO');
  Estado := 1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TDireito_de_Bonus.deletarauto:Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      result:=true;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
