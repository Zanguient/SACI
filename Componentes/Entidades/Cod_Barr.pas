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
unit Cod_Barr;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Windows, Funcoes, 
     Variants;

type
  TCodigo_Barras = class(TSQuery)
    private
      { Private fields of TCodigo_Barras }
        { Storage for property CodigoCDB }
        FCodigoCDB : Integer;
        { Storage for property CodigoCDB_Barras }
        FCodigoCDB_Barras : String;
        { Storage for property CodigoCDB_Entrada }
        FCodigoCDB_Entrada : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoCDB }
        FECodigoCDB : TEdit;
        { Storage for property ECodigoCDB_Barras }
        FECodigoCDB_Barras : TEdit;
        { Storage for property ECodigoCDB_Entrada }
        FECodigoCDB_Entrada : TEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipo }
        FETipo : TEdit;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;

      { Private methods of TCodigo_Barras }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCDB }
        function GetCodigoCDB : Integer;
        { Write method for property CodigoCDB }
        procedure SetCodigoCDB(Value : Integer);
        { Read method for property CodigoCDB_Barras }
        function GetCodigoCDB_Barras : String;
        { Write method for property CodigoCDB_Barras }
        procedure SetCodigoCDB_Barras(Value : String);
        { Read method for property CodigoCDB_Entrada }
        function GetCodigoCDB_Entrada : Integer;
        { Write method for property CodigoCDB_Entrada }
        procedure SetCodigoCDB_Entrada(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);

    protected
      { Protected fields of TCodigo_Barras }

      { Protected methods of TCodigo_Barras }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TCodigo_Barras }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TCodigo_Barras }
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCDB:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grau }
        function LocalizarCod(CdCDB:Integer):Boolean;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TCodigo_Barras }
        property CodigoCDB : Integer read GetCodigoCDB write SetCodigoCDB;
        property CodigoCDB_Barras : String
             read GetCodigoCDB_Barras write SetCodigoCDB_Barras;
        property CodigoCDB_Entrada : Integer
             read GetCodigoCDB_Entrada write SetCodigoCDB_Entrada;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoCDB : TEdit read FECodigoCDB write FECodigoCDB;
        property ECodigoCDB_Barras : TEdit
             read FECodigoCDB_Barras write FECodigoCDB_Barras;
        property ECodigoCDB_Entrada : TEdit
             read FECodigoCDB_Entrada write FECodigoCDB_Entrada;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EOBS : TEdit read FEOBS write FEOBS;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipo : TEdit read FETipo write FETipo;
        property OBS : String read GetOBS write SetOBS;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCodigo_Barras with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCodigo_Barras]);
end;

{ Method to set variable and property values and create objects }
procedure TCodigo_Barras.AutoInitialize;
begin
     Estado := 0;
     FECodigoCDB := nil;
     FECodigoCDB_Barras := nil;
     FECodigoCDB_Entrada := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEOBS := nil;
     FESituacao := nil;
     FETipo := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCodigo_Barras.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCDB then
        FECodigoCDB := nil;
     if AComponent = FECodigoCDB_Barras then
        FECodigoCDB_Barras := nil;
     if AComponent = FECodigoCDB_Entrada then
        FECodigoCDB_Entrada := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCodigo_Barras.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCDB }
function TCodigo_Barras.GetCodigoCDB : Integer;
begin
  try
    Result := Self.fieldByName('CDB_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCDB }
procedure TCodigo_Barras.SetCodigoCDB(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CDB_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CDB_CODIGO"!');
    end;
end;

{ Read method for property CodigoCDB_Barras }
function TCodigo_Barras.GetCodigoCDB_Barras : String;
begin
  try
    Result := Self.fieldByName('CDB_CODIGO_BARRAS').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CodigoCDB_Barras }
procedure TCodigo_Barras.SetCodigoCDB_Barras(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CDB_CODIGO_BARRAS').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CDB_CODIGO_BARRAS"!');
    end;
end;

{ Read method for property CodigoCDB_Entrada }
function TCodigo_Barras.GetCodigoCDB_Entrada : Integer;
begin
  try
    Result := Self.fieldByName('CDB_CODIGO_ENTRADA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCDB_Entrada }
procedure TCodigo_Barras.SetCodigoCDB_Entrada(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CDB_CODIGO_ENTRADA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CDB_CODIGO_ENTRADA"!');
    end;
end;

{ Read method for property CodigoCNC }
function TCodigo_Barras.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TCodigo_Barras.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TCodigo_Barras.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TCodigo_Barras.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataCadastro }
function TCodigo_Barras.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('CDB_DT_CADASTRO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataCadastro }
procedure TCodigo_Barras.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CDB_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CDB_DT_CADASTRO"!');
    end;
end;

{ Read method for property OBS }
function TCodigo_Barras.GetOBS : String;
begin
  try
    Result := Self.fieldByName('CDB_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TCodigo_Barras.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CDB_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CDB_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TCodigo_Barras.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CDB_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TCodigo_Barras.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CDB_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CDB_SITUACAO"!');
    end;
end;

{ Read method for property Tipo }
function TCodigo_Barras.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('CDB_TIPO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Tipo }
procedure TCodigo_Barras.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CDB_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CDB_TIPO"!');
    end;
end;

procedure TCodigo_Barras.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           := not Habilitar;
  except
  end;
  Try
    ECodigoCDB_Barras.Enabled := Habilitar;
  except
  end;
  try
    ESituacao.Enabled         := Habilitar;
  except
  end;
  try
    EOBS.Enabled              :=Habilitar;
  except
  end;
end;

procedure TCodigo_Barras.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TCodigo_Barras.CarregaDados;
begin
  try
    ECodigoCDB.Text    :=inttostr(CodigoCDB);
  except
  end;
  try
    ETipo.text    :=inttostr(Tipo);
  except
  end;
  try
    ECodigoCDB_barras.Text     :=CodigoCDB_Barras;
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text        := FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    ESituacao.ItemIndex          := Situacao;
  except
  end;
  try
    EOBS.Text                    :=OBS;
  except
  end;
end;

constructor TCodigo_Barras.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CODIGO_DE_BARRAS';

     { Code to perform other tasks when the component is created }

end;

function TCodigo_Barras.Deletar(CdCDB:Integer):Boolean;
var
  CdCNC: integer;
begin
  Result := False;
  If not(localizarCod(CdCDB)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      If Delete then
      Begin
        Result := True;
        RegistrarDel(CdCNC,1280(*CodigoDeBarras*),CdCDB);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TCodigo_Barras.Destroy;
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

function TCodigo_Barras.FinalizaEdicao:Boolean;
var
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem:='';
  if (TRIM(ECodigoCDB_Barras.Text)='') then
    mensagem:=mensagem+'Código de barras inválido!';
  if not verificainteirobranco(ECodigoCDB_Entrada.Text) then
    mensagem:=mensagem+'Código de entrada inválido!';
  if not verificainteirobranco(ETipo.Text) then
    mensagem:=mensagem+'Tipo inválido!';

  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      If Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo);
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
    AfterScroll:=aux;
  end;
end;

function TCodigo_Barras.InserirAuto:Boolean;
begin
  Result := False;
  with CConfiguracao.QueryConsultas do
  Begin
    if VerificaInteiroBranco(ECodigoCDB_Barras.Text) then
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 PRD_CODIGO '+
        ' FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+ECodigoCDB_Barras.Text;
      Open;
      if not isEmpty then
      Begin
        ShowMessage('Código de um produto!');
        Exit;
      end;
    end;
    if Trim(ECodigoCDB_Barras.Text) <> '' then
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 CDB_CODIGO '+
        ' FROM CODIGO_DE_BARRAS '+
        ' WHERE CDB_CODIGO_BARRAS="'+ECodigoCDB_Barras.Text+'" ';
      Open;
      if not isEmpty then
      Begin
        ShowMessage('Código de Barras já cadastrado!');
        Exit;
      end;
    end;
  end;
  try
    append;
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
       CodigoCDB := SCodigo;
    except
    end;
    try
       CodigoCDB_Entrada := StrToInt(ECodigoCDB_Entrada.Text);
    except
    end;
    try
       Tipo := StrToInt(ETipo.Text);
    except
    end;
    try
       CodigoCDB_Barras  := ECodigoCDB_Barras.Text;
    except
    end;
    try
      DataCadastro  := CConfiguracao.DataHora;
    except
    end;
    try
      Situacao  := ESituacao.ItemIndex;
    except
    end;
    try
       OBS  := EOBS.Text;
    except
    end;
    try
      Post;

      //Log de Alterar Produto
      GeraLog(480,CConfiguracao.CodigoCNC,StrToInt(ECodigoCDB_Entrada.Text),'INSERIR CODIGO DE BARRAS '+ECodigoCDB_Barras.Text);      
      
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TCodigo_Barras.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoCDB.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ETipo.Clear
    else
      ETipo.text:='0';
  except
  end;
  try
    if (Estado = 1) and
       (CConfiguracao.Empresa = empHOPE) then
      ECodigoCDB_Barras.Text := '7891306'
    else
      ECodigoCDB_Barras.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text  := FormatDateTime('dd/mm/yyyy hh:mm', CConfiguracao.DataHora)
  except
  end;
  try
    if Estado <> 1 then
      ESituacao.ItemIndex:=-1
    else
      ESituacao.ItemIndex:=0;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
end;

{ Localiza um Grau }
function TCodigo_Barras.LocalizarCod(CdCDB:Integer):Boolean;
begin
  If (CdCDB<>CodigoCDB) Then
    If locate('CDB_CODIGO', CdCDB, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TCodigo_Barras.PreparaInsercao;
begin
  ProximoCodigo('CDB_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TCodigo_Barras.deletarauto:Boolean;
var
  CdCNC, CdCDB, CdPRD: integer;
  sBarras: string;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdCDB := CodigoCDB;
    CdPRD := CodigoCDB_Entrada;
    sBarras := CodigoCDB_Barras;
    if Delete then
    Begin
      result:=true;
      
      //Gerar Log de Alteração de Produto
      GeraLog(480,CdCNC,CdPRD,'EXCLUIR CODIGO DE BARRAS '+sBarras);
      
      RegistrarDel(CdCNC,1280(*CodigoDeBarras*),CdCDB);
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
