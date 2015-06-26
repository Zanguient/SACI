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
unit Caixa;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Funcionario, Configuracao, Dbgrids, Variants;

type
  TCaixa = class(TSQuery)
    private
      { Private fields of TCaixa }
        { Storage for property CFuncionario }
        FCFuncionario : TFuncionario;
        { Storage for property CodigoCAX }
        FCodigoCAX : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoCAX }
        FECodigoCAX : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBOX;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookUpComboBox;
        { Storage for property EData }
        FEData : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;

      { Private methods of TCaixa }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCAX }
        function GetCodigoCAX : Integer;
        { Write method for property CodigoCAX }
        procedure SetCodigoCAX(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);

    protected
      { Protected fields of TCaixa }

      { Protected methods of TCaixa }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TCaixa }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TCaixa }
        { Altera um Caixa }
        function Alterar(CdCNC, CdCAX, CdFUN: integer; PDescricao: String;PData :TDateTime):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdCAX:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Caixa }
        function Inserir(CdCNC, CdCAX, CdFUN: integer; PDescricao: String; PData: TDateTime):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Caixa }
        function LocalizarCod(CdCAX,CdCNC:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TCaixa }
        property CFuncionario : TFuncionario
             read FCFuncionario write FCFuncionario;
        property CodigoCAX : Integer read GetCodigoCAX write SetCodigoCAX;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Funcionário }
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property Data : Tdatetime read GetData write SetData;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoCAX : TEdit read FECodigoCAX write FECodigoCAX;
        property ECodigoCNC : TDBLookupComboBOX
             read FECodigoCNC write FECodigoCNC;
        property ECodigoFUN : TDBLookUpComboBox
             read FECodigoFUN write FECodigoFUN;
        property EData : TMaskEdit read FEData write FEData;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCaixa with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCaixa]);
end;

{ Method to set variable and property values and create objects }
procedure TCaixa.AutoInitialize;
begin
     Estado := 0;
     FECodigoCAX := nil;
     FECodigoCNC := nil;
     FECodigoFUN := nil;
     FEData := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCaixa.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCAX then
        FECodigoCAX := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCaixa.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCAX }
function TCaixa.GetCodigoCAX : Integer;
begin
  try
    Result := Self.fieldByName('CAX_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCAX }
procedure TCaixa.SetCodigoCAX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CAX_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CAX_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TCaixa.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TCaixa.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TCaixa.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TCaixa.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TCaixa.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TCaixa.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TCaixa.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('CAX_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TCaixa.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CAX_DATA').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CAX_DATA"!');
    end;
end;


{ Read method for property DataAlterado }
function TCaixa.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CAX_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TCaixa.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CAX_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CAX_DT_ALTERADO"!');
    end;
end;

{ Read method for property Descricao }
function TCaixa.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('CAX_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TCaixa.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CAX_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CAX_DESCRICAO"!');
  end;
end;

{ Altera um Caixa }
function TCaixa.Alterar(CdCNC, CdCAX, CdFUN: integer; PDescricao: String;PData :TDateTime):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdCAX,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      Descricao      := PDescricao;
      CodigoFUN      := CdFUN;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := CConfiguracao.DataHora;
      try
        Post;
        Result := True;
      except
        result := false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result := false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TCaixa.AlterarAuto:Boolean;
begin
  Result:=False;
  try
    edit;
    try
       CodigoFUN := ECodigoFUN.KeyValue;
    except
    end;
    try
       CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
       Descricao := EDescricao.Text;
    except
    end;
    try
       DataAlterado := CConfiguracao.DataHora;
    except
    end;

    try
      Post;
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifiqu se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TCaixa.AtualizaControles(Habilitar:Boolean);
begin
 Try
   EDbgrid.Enabled           :=not Habilitar;
 except
 end;
 Try
   ECodigoFUN.Enabled       :=Habilitar;
 except
 end;
 try
   EDescricao.Enabled       :=Habilitar;
 except
 end;
end;

procedure TCaixa.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TCaixa.CarregaDados;
begin
 try
   ECodigoCAX.Text           :=IntToStr(CodigoCAX);
 except
 end;
 try
   ECodigoFUN.KeyValue       :=CodigoFun;
 except
 end;
 try
   EDescricao.Text           :=Descricao;
 except
 end;
 try
   if Data=0 then
     EData.Text:=''
   else
     EData.Text            :=FormatDateTime('dd/mm/yyyy', Data);
 except
  end;
end;

constructor TCaixa.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CAIXA';

     { Code to perform other tasks when the component is created }

end;

function TCaixa.Deletar(CdCNC,CdCAX:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdCAX,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        GeraLog(1310,CdCNC,CdCAX);
        RegistrarDel(CdCNC,1200(*Caixa*),CdCAX);
        if TQuery(Self).IsEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TCaixa.Destroy;
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

function TCaixa.FinalizaEdicao:Boolean;
var
  cdcax, cdcnc:Integer;
  mensagem :string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem := '';
  if ECodigoCNC.Text = '' then
    mensagem:=mensagem+'Centro de Custo inválido!'+#13;
  if EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  if ECodigoFUN.Text = '' then
    mensagem:=mensagem+'Funcionário inválido!'+#13;
  if mensagem <> '' then
    ShowMessage(mensagem)
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
        LocalizarCod(SCodigo, CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    Else If Estado=2 then
    Begin
      cdcax:=codigoCAX;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        close;
        open;
        LocalizarCod(cdcax, cdcnc);
        Estado:=0;
        AtualizaControles(False);
        Result := True;
      end;
    End;
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

{ Insere um Caixa }
function TCaixa.Inserir(CdCNC, CdCAX, CdFUN: integer; PDescricao: String; PData: TDateTime):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdCAX=0 then
    Cod    := ProximoCodigo('CAX_CODIGO')
  else
    Cod    := CdCAX;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
    try
      Insert;
      CodigoCAX      := Cod;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      CodigoCNC      := CdCNC;
      CodigoFUN      := CdFUN;
      Descricao      := PDescricao;
      Data           := PData;
      try
        Post;
        Result := True;
      except
        result := false;
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      result := false;
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

function TCaixa.InserirAuto:Boolean;
begin
  result:=false;
  If (localizarCod(SCodigo,CodigoCNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  begin
    try
      append;
      try
        CodigoCAX   := SCodigo;
      except
      end;
      try
        CodigoUSU   := CConfiguracao.CodigoUSU;
      except
      end;
      try
        codigocnc := ECodigoCNC.KeyValue;
      except
      end;
      try
         CodigoFUN := ECodigoFUN.KeyValue;
      except
      end;
      try
         Descricao := EDescricao.Text;
      except
      end;
      try
         Data := CConfiguracao.Data;
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
end;

procedure TCaixa.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoCAX.Clear;
  except
  end;
  try
    ECodigoFUN.KeyValue := 0;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    EData.Clear;
  except
  end;
end;

{ Localiza um Caixa }
function TCaixa.LocalizarCod(CdCAX,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdCAX<>CodigoCAX) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;CAX_CODIGO', vararrayof([CdCNC, CdCAX]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TCaixa.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>Descricao Then
    If locate('CAX_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TCaixa.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TCaixa.PreparaInsercao;
begin
  ProximoCodigo('CAX_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TCaixa.deletarauto:Boolean;
var
  CdCNC,CdCAX:integer;
begin
  Result := False;
  try
    CdCNC:=CodigoCNC;
    CdCAX:=CodigoCAX;
    if Delete then
    Begin
      result:=true;
      GeraLog(1310,CdCNC,CdCAX);
      RegistrarDel(CdCNC,1200(*Caixa*),CdCAX);
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
