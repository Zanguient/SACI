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
unit Indexador_Economico;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TIndexador_Economico = class(TSQuery)
    private
      { Private fields of TIndexador_Economico }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoIDE }
        FCodigoIDE : Integer;
        { Storage for property DataAtualizacao }
        FDataAtualizacao : Tdatetime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoIDE }
        FECodigoIDE : TEdit;
        { Storage for property EDataAtualizacao }
        FEDataAtualizacao : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EPeriodo }
        FEPeriodo : TComboBox;
        { Storage for property ETaxa }
        FETaxa : TEdit;
        { Storage for property Periodo }
        FPeriodo : Integer;
        { Storage for property Taxa }
        FTaxa : Double;

      { Private methods of TIndexador_Economico }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoIDE }
        function GetCodigoIDE : Integer;
        { Write method for property CodigoIDE }
        procedure SetCodigoIDE(Value : Integer);
        { Read method for property DataAtualizacao }
        function GetDataAtualizacao : Tdatetime;
        { Write method for property DataAtualizacao }
        procedure SetDataAtualizacao(Value : Tdatetime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Periodo }
        function GetPeriodo : Integer;
        { Write method for property Periodo }
        procedure SetPeriodo(Value : Integer);
        { Read method for property Taxa }
        function GetTaxa : Double;
        { Write method for property Taxa }
        procedure SetTaxa(Value : Double);

    protected
      { Protected fields of TIndexador_Economico }

      { Protected methods of TIndexador_Economico }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TIndexador_Economico }

      { Public methods of TIndexador_Economico }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdIDE:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdIDE:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TIndexador_Economico }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Indexador Economico }
        property CodigoIDE : Integer read GetCodigoIDE write SetCodigoIDE;
        property DataAtualizacao : Tdatetime
             read GetDataAtualizacao write SetDataAtualizacao;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoIDE : TEdit read FECodigoIDE write FECodigoIDE;
        property EDataAtualizacao : TMaskEdit
             read FEDataAtualizacao write FEDataAtualizacao;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EPeriodo : TComboBox read FEPeriodo write FEPeriodo;
        property ETaxa : TEdit read FETaxa write FETaxa;
        property Periodo : Integer read GetPeriodo write SetPeriodo;
        property Taxa : Double read GetTaxa write SetTaxa;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TIndexador_Economico with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TIndexador_Economico]);
end;

{ Method to set variable and property values and create objects }
procedure TIndexador_Economico.AutoInitialize;
begin
     FECodigoIDE := nil;
     FEDataAtualizacao := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
     FEPeriodo := nil;
     FETaxa := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TIndexador_Economico.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoIDE then
        FECodigoIDE := nil;
     if AComponent = FEDataAtualizacao then
        FEDataAtualizacao := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEPeriodo then
        FEPeriodo := nil;
     if AComponent = FETaxa then
        FETaxa := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TIndexador_Economico.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TIndexador_Economico.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TIndexador_Economico.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoIDE }
function TIndexador_Economico.GetCodigoIDE : Integer;
begin
  try
    Result := Self.fieldByName('IDE_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoIDE }
procedure TIndexador_Economico.SetCodigoIDE(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IDE_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IDE_CODIGO"!');
    end;
end;

{ Read method for property DataAtualizacao }
function TIndexador_Economico.GetDataAtualizacao : Tdatetime;
begin
  try
    Result := Self.fieldByName('IDE_DT_ATUALIZACAO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAtualizacao }
procedure TIndexador_Economico.SetDataAtualizacao(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IDE_DT_ATUALIZACAO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IDE_DT_ATUALIZACAO"!');
  end;
end;

{ Read method for property Descricao }
function TIndexador_Economico.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('IDE_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TIndexador_Economico.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IDE_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IDE_DESCRICAO"!');
  end;
end;

{ Read method for property Periodo }
function TIndexador_Economico.GetPeriodo : Integer;
begin
  try
    result := Self.fieldByName('IDE_PERIODO').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property Periodo }
procedure TIndexador_Economico.SetPeriodo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IDE_PERIODO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IDE_PERIODO"!');
    end;
end;

{ Read method for property Taxa }
function TIndexador_Economico.GetTaxa : Double;
begin
  try
    Result := Self.fieldByName('IDE_TAXA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Taxa }
procedure TIndexador_Economico.SetTaxa(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IDE_TAXA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IDE_TAXA"!');
    end;
end;

function TIndexador_Economico.AlterarAuto:Boolean;
begin
  Result:=False;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,' UPDATE '+Tabela+' SET '+
      ' USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',IDE_DESCRICAO="'+EDescricao.Text+'" '+
      ',IDE_DT_ATUALIZACAO="'+MesDiaHora(CConfiguracao.DataHora)+' "'+
      ',IDE_TAXA='+VirgPonto(ETaxa.Text)+
      ' WHERE IDE_CODIGO='+ECodigoIDE.Text);
    GeraLog(440,CConfiguracao.CodigoCNC,StrToInt(ECodigoIDE.Text),
      'Valor Ant: R$'+format('%.2f',[Taxa])+
      ' Valor Nov: R$'+ETaxa.Text+
      ' Desc: '+EDescricao.Text);
    Result:=True;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TIndexador_Economico.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    EDescricao.Enabled        :=Habilitar;
  except
  end;
  try
    ETaxa.Enabled             :=Habilitar;
  except
  end;
  try
    EPeriodo.Enabled          :=Habilitar;
  except
  end;
end;

procedure TIndexador_Economico.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TIndexador_Economico.CarregaDados;
begin
  Try
    ECodigoIDE.Text           :=IntToStr(CodigoIDE);
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    ETaxa.Text                :=Format('%.2f', [Taxa]);
  except
  end;
  try
    EPeriodo.Text             :=IntToStr(Periodo);
  except
  end;
  try
    EDataAtualizacao.Text     :=DateTimeToStr(DataAtualizacao);
  except
  end;
end;

constructor TIndexador_Economico.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'INDEXADOR_ECONOMICO';

     { Code to perform other tasks when the component is created }

end;

function TIndexador_Economico.Deletar(CdIDE:Integer):Boolean;
var
  CdCNC: integer;
  vTaxa: Double;
begin
  Result := False;
  If not(localizarCod(CdIDE)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      vTaxa := Taxa;    
      if Delete then
      Begin
        GeraLog(430,CdCNC,CdIDE,'Valor: R$'+format('%.2f',[vTaxa]));      
        Result := True;
        if Tquery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TIndexador_Economico.Destroy;
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

function TIndexador_Economico.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if Trim(EDescricao.Text) = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  if not VerificaFloatBranco(ETaxa.text) then
    mensagem:=mensagem+'Valor digitado incorretamente!'+#13;
  if mensagem<>'' then
    raise exception.create(mensagem)
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
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    else If Estado=2 then
    Begin
      cod:=codigoIDE;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
    AfterScroll:=aux;
    CarregaDados;
  end;
end;

function TIndexador_Economico.InserirAuto:Boolean;
begin
  result:=false;
  try
    append;
    try
      CodigoIDE   := SCodigo;
    except
    end;
    try
      codigocnc   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
       Descricao := EDescricao.Text;
    except
    end;
    try
       Taxa := StrToFloat(ETaxa.Text);
    except
    end;
    try
       Periodo := StrToInt(EPeriodo.Text);
    except
    end;
    try
       DataAtualizacao := CConfiguracao.DataHora;
    except
    end;
    try
      Post;
      GeraLog(420,CConfiguracao.CodigoCNC,SCodigo,
        ' Valor: R$'+ETaxa.Text+
        ' Desc: '+EDescricao.Text);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TIndexador_Economico.LimpaCampos;
begin
  try
    EDescricao.Clear;
  except
  end;
  try
    ETaxa.Clear;
  except
  end;
  try
    EPeriodo.Clear;
  except
  end;
  try
    EDataAtualizacao.Text := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
end;

{ Localiza um cliente }
function TIndexador_Economico.LocalizarCod(CdIDE:Integer):Boolean;
begin
  If (CdIDE<>CodigoIDE) Then
    If locate('IDE_CODIGO', CdIDE, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TIndexador_Economico.LocalizarNome(Nome:String):Boolean;
begin
  If Nome<>Descricao Then
    If locate('IDE_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TIndexador_Economico.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAtualizacao.Text := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
end;

procedure TIndexador_Economico.PreparaInsercao;
begin
  ProximoCodigo('IDE_CODIGO');
  Estado := 1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TIndexador_Economico.deletarauto:Boolean;
var
  CdCNC, CdIDE: integer;
  vTaxa: Double;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdIDE := CodigoIDE;
    vTaxa := Taxa;
    if Delete then
    Begin
      Result := True;
      GeraLog(430,CdCNC,CdIDE,'Valor: R$'+format('%.2f',[vTaxa]));
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
