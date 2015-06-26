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
unit Item_de_Bonus;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TItem_de_Bonus = class(TSQuery)
    private
      { Private fields of TItem_de_Bonus }
        { Storage for property BonusFOR }
        FBonusFOR : Double;
        { Storage for property BonusLoja }
        FBonusLoja : Double;
        { Storage for property CodigoBON }
        FCodigoBON : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoIBN }
        FCodigoIBN : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EBonusFOR }
        FEBonusFOR : TEdit;
        { Storage for property EBonusLoja }
        FEBonusLoja : TEdit;
        { Storage for property ECodigoBON }
        FECodigoBON : TEdit;
        { Storage for property ECodigoIBN }
        FECodigoIBN : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;

      { Private methods of TItem_de_Bonus }
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
        { Read method for property CodigoBON }
        function GetCodigoBON : Integer;
        { Write method for property CodigoBON }
        procedure SetCodigoBON(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoIBN }
        function GetCodigoIBN : Integer;
        { Write method for property CodigoIBN }
        procedure SetCodigoIBN(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);

    protected
      { Protected fields of TItem_de_Bonus }

      { Protected methods of TItem_de_Bonus }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_de_Bonus }

      { Public methods of TItem_de_Bonus }
        { Altera uma Desconto }
        function Alterar(CdIBN,CdBON,CdPRD: integer; DTAlterado:TDateTime;PBonusFOR,PBonusLoja:real):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdIBN:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function Inserir(CdIBN,CdBON,CdPRD: integer; DTCadastro:TDateTime;PBonusFOR,PBonusLoja:real):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um grupo de consórcio }
        function LocalizarCod(CdIBN:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_de_Bonus }
        property BonusFOR : Double read GetBonusFOR write SetBonusFOR;
        property BonusLoja : Double read GetBonusLoja write SetBonusLoja;
        property CodigoBON : Integer read GetCodigoBON write SetCodigoBON;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoIBN : Integer read GetCodigoIBN write SetCodigoIBN;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EBonusFOR : TEdit read FEBonusFOR write FEBonusFOR;
        property EBonusLoja : TEdit read FEBonusLoja write FEBonusLoja;
        property ECodigoBON : TEdit read FECodigoBON write FECodigoBON;
        property ECodigoIBN : TEdit read FECodigoIBN write FECodigoIBN;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Bonus with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Bonus]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Bonus.AutoInitialize;
begin
     FEBonusFOR := nil;
     FEBonusLoja := nil;
     FECodigoBON := nil;
     FECodigoIBN := nil;
     FECodigoPRD := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_de_Bonus.Notification(AComponent : TComponent; Operation : TOperation);
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
     if AComponent = FECodigoBON then
        FECodigoBON := nil;
     if AComponent = FECodigoIBN then
        FECodigoIBN := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Bonus.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property BonusFOR }
function TItem_de_Bonus.GetBonusFOR : Double;
begin
  try
    Result := Self.fieldByName('IBN_BONUS_FOR').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property BonusFOR }
procedure TItem_de_Bonus.SetBonusFOR(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IBN_BONUS_FOR').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IBN_BONUS_FOR"!');
    end;
end;

{ Read method for property BonusLoja }
function TItem_de_Bonus.GetBonusLoja : Double;
begin
  try
    Result := Self.fieldByName('IBN_BONUS_LOJA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property BonusLoja }
procedure TItem_de_Bonus.SetBonusLoja(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IBN_BONUS_LOJA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IBN_BONUS_LOJA"!');
    end;
end;

{ Read method for property CodigoBON }
function TItem_de_Bonus.GetCodigoBON : Integer;
begin
  try
    Result := Self.fieldByName('BON_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoBON }
procedure TItem_de_Bonus.SetCodigoBON(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BON_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BON_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TItem_de_Bonus.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TItem_de_Bonus.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoIBN }
function TItem_de_Bonus.GetCodigoIBN : Integer;
begin
  try
    Result := Self.fieldByName('IBN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoIBN }
procedure TItem_de_Bonus.SetCodigoIBN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IBN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IBN_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItem_de_Bonus.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_de_Bonus.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TItem_de_Bonus.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TItem_de_Bonus.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItem_de_Bonus.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('IBN_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItem_de_Bonus.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IBN_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IBN_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TItem_de_Bonus.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('IBN_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItem_de_Bonus.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IBN_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IBN_DT_CADASTRO"!');
  end;
end;

{ Altera uma Desconto }
function TItem_de_Bonus.Alterar(CdIBN,CdBON,CdPRD: integer; DTAlterado:TDateTime;PBonusFOR,PBonusLoja:real):boolean;
begin
  result := False;
  If not(localizarCod(CdIBN)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      CodigoBON      := CdBON;
      CodigoPRD      := CdPRD;
      CodigoCNC      := CConfiguracao.CodigoCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := DTAlterado;
      BonusFOR       := PBonusFOR;
      BonusLoja      := PBonusLoja;

      try
        Post;
        result := false;

      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TItem_de_Bonus.AlterarAuto:Boolean;
begin
  result := false;
  try
    edit;
    try
      CodigoPRD := StrToint(ECodigoPRD.Text);
    except
    end;
    try
      CodigoCNC := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
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
      DataAlterado := StrToDateTime(EDataAlterado.Text);
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

procedure TItem_de_Bonus.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled          :=not Habilitar;
  except
  end;
  try
    if Estado = 1 then
      ECodigoPRD.Enabled    := Habilitar
    else
      ECodigoPRD.Enabled    := False;
  except
  end;
  try
    EBonusFOR.Enabled       :=Habilitar;
  except
  end;
  try
    EBonusLoja.Enabled      :=Habilitar;
  except
  end;
end;

procedure TItem_de_Bonus.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TItem_de_Bonus.CarregaDados;
begin
  try
    ECodigoIBN.Text  :=IntToStr(CodigoIBN);
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
end;

constructor TItem_de_Bonus.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ITEM_DE_BONUS';

     { Code to perform other tasks when the component is created }

end;

function TItem_de_Bonus.Deletar(CdIBN:Integer):Boolean;
var
  CdCNC: integer;
begin
  Result := False;
  If not(localizarCod(CdIBN)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      if Delete then
      Begin
        Result := True;
        GeraLog(3880,CdCNC,CdIBN);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_de_Bonus.Destroy;
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

function TItem_de_Bonus.FinalizaEdicao:Boolean;
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
  if not VerificaFloat(EBonusFOR.Text) then
    mensagem:=mensagem+'Bônus 1 incorreto!'+#13;
  if not VerificaFloat(EBonusLoja.Text) then
    mensagem:=mensagem+'Bônus 2 incorreto!'+#13;
  If mensagem <>'' Then
    ShowMessage(mensagem)
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
      cod:=codigoIBN;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        CarregaDados;
        AtualizaControles(False);
        Estado:=0;
      end;
    End;
    AfterScroll:=aux;
  end;
end;

function TItem_de_Bonus.Inserir(CdIBN,CdBON,CdPRD: integer; DTCadastro:TDateTime;PBonusFOR,PBonusLoja:real):boolean;
Var
  Cod: Integer;
begin
  Result := False;
  if CdIBN=0 then
    Cod    := ProximoCodigo('IBN_CODIGO')
  else
    Cod      := CdIBN;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    if Estado=3 then
    begin
      result:=true;
      exit;
    end;
    try
      Insert;
      CodigoIBN      := Cod;
      CodigoCNC      := CConfiguracao.CodigoCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      CodigoBON      := CdBON;
      CodigoPRD      := CdPRD;
      BonusFOR       := PBonusFOR;
      BonusLoja      := PBonusLoja;
      DataCadastro   := DTCadastro;
      try
        Post;
        result := true;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

function TItem_de_Bonus.InserirAuto:Boolean;
begin
  Result := False;
  try
    append;
    try
      CodigoIBN   := SCodigo;
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
      codigoBON   := StrToInt(ECodigoBON.Text);
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
      DataCadastro := StrToDateTime(EDataCadastro.Text);
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

procedure TItem_de_Bonus.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoIBN.Clear;
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
end;

{ Localiza um grupo de consórcio }
function TItem_de_Bonus.LocalizarCod(CdIBN:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdIBN<>CodigoIBN) Then
    If locate('IBN_CODIGO', CdIBN, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_de_Bonus.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  Estado:=2;
end;

procedure TItem_de_Bonus.PreparaInsercao;
begin
  ProximoCodigo('IBN_CODIGO');
  Estado := 1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TItem_de_Bonus.deletarauto:Boolean;
var
  CdCNC, IBN:integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    IBN:=CodigoIBN;
    if Delete then
    Begin
      result:=true;
      GeraLog(3880,CdCNC,IBN);
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
