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
unit Grau;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Windows, Funcoes, 
     Variants;

type
  TGrau = class(TSQuery)
    private
      { Private fields of TGrau }
        { Storage for property Base }
        FBase : Boolean;
        { Storage for property CB }
        FCB : Boolean;
        { Storage for property CH }
        FCH : Boolean;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoGRA }
        FCodigoGRA : Integer;
        { Storage for property CodigoGRP }
        FCodigoGRP : Integer;
        { Storage for property CodigoSGP }
        FCodigoSGP : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DefinirOlho }
        FDefinirOlho : Boolean;
        { Storage for property EBase }
        FEBase : TCheckBox;
        { Storage for property ECB }
        FECB : TcheckBox;
        { Storage for property ECH }
        FECH : TCheckBox;
        { Storage for property ECodigoGRA }
        FECodigoGRA : TEdit;
        { Storage for property ECodigoGRP }
        FECodigoGRP : TDBLookupComboBox;
        { Storage for property ECodigoSGP }
        FECodigoSGP : TDBLookupComboBox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDefinirOlho }
        FEDefinirOlho : TCheckBox;
        { Storage for property EGrau }
        FEGrau : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Grau }
        FGrau : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TGrau }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Base }
        function GetBase : Boolean;
        { Write method for property Base }
        procedure SetBase(Value : Boolean);
        { Read method for property CB }
        function GetCB : Boolean;
        { Write method for property CB }
        procedure SetCB(Value : Boolean);
        { Read method for property CH }
        function GetCH : Boolean;
        { Write method for property CH }
        procedure SetCH(Value : Boolean);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoGRA }
        function GetCodigoGRA : Integer;
        { Write method for property CodigoGRA }
        procedure SetCodigoGRA(Value : Integer);
        { Read method for property CodigoGRP }
        function GetCodigoGRP : Integer;
        { Write method for property CodigoGRP }
        procedure SetCodigoGRP(Value : Integer);
        { Read method for property CodigoSGP }
        function GetCodigoSGP : Integer;
        { Write method for property CodigoSGP }
        procedure SetCodigoSGP(Value : Integer);
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
        { Read method for property DefinirOlho }
        function GetDefinirOlho : Boolean;
        { Write method for property DefinirOlho }
        procedure SetDefinirOlho(Value : Boolean);
        { Read method for property Grau }
        function GetGrau : String;
        { Write method for property Grau }
        procedure SetGrau(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TGrau }

      { Protected methods of TGrau }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TGrau }
        { Seta se esta em processo de copia ou não }
        Copiando : Boolean;

      { Public methods of TGrau }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdGRA:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grau }
        function LocalizarCod(CdGRA:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TGrau }
        property Base : Boolean read GetBase write SetBase;
        property CB : Boolean read GetCB write SetCB;
        property CH : Boolean read GetCH write SetCH;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoGRA : Integer read GetCodigoGRA write SetCodigoGRA;
        property CodigoGRP : Integer read GetCodigoGRP write SetCodigoGRP;
        { Código do Grupo }
        property CodigoSGP : Integer read GetCodigoSGP write SetCodigoSGP;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DefinirOlho : Boolean
             read GetDefinirOlho write SetDefinirOlho;
        property EBase : TCheckBox read FEBase write FEBase;
        property ECB : TcheckBox read FECB write FECB;
        property ECH : TCheckBox read FECH write FECH;
        property ECodigoGRA : TEdit read FECodigoGRA write FECodigoGRA;
        property ECodigoGRP : TDBLookupComboBox
             read FECodigoGRP write FECodigoGRP;
        property ECodigoSGP : TDBLookupComboBox
             read FECodigoSGP write FECodigoSGP;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDefinirOlho : TCheckBox
             read FEDefinirOlho write FEDefinirOlho;
        property EGrau : TEdit read FEGrau write FEGrau;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property Grau : String read GetGrau write SetGrau;
        property OBS : String read GetOBS write SetOBS;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TGrau with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TGrau]);
end;

{ Method to set variable and property values and create objects }
procedure TGrau.AutoInitialize;
begin
     Copiando := False;
     FEBase := nil;
     FECB := nil;
     FECH := nil;
     FECodigoGRA := nil;
     FECodigoGRP := nil;
     FECodigoSGP := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEDefinirOlho := nil;
     FEGrau := nil;
     FEOBS := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TGrau.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBase then
        FEBase := nil;
     if AComponent = FECB then
        FECB := nil;
     if AComponent = FECH then
        FECH := nil;
     if AComponent = FECodigoGRA then
        FECodigoGRA := nil;
     if AComponent = FECodigoGRP then
        FECodigoGRP := nil;
     if AComponent = FECodigoSGP then
        FECodigoSGP := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDefinirOlho then
        FEDefinirOlho := nil;
     if AComponent = FEGrau then
        FEGrau := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TGrau.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Base }
function TGrau.GetBase : Boolean;
begin
  try
    Result := (Self.fieldByName('GRA_BASE').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property Base }
procedure TGrau.SetBase(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    If Value Then
      Self.fieldByName('GRA_BASE').asInteger := 1
    else
      Self.fieldByName('GRA_BASE').asInteger := 0;
  except
    ShowMessage('Não foi possível alterar o campo "GRA_BASE"!');
  end;
end;

{ Read method for property CB }
function TGrau.GetCB : Boolean;
begin
  try
    Result := (Self.fieldByName('GRA_CB').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property CB }
procedure TGrau.SetCB(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    If Value Then
      Self.fieldByName('GRA_CB').asInteger := 1
    else
      Self.fieldByName('GRA_CB').asInteger := 0;
  except
    ShowMessage('Não foi possível alterar o campo "GRA_CB"!');
  end;
end;

{ Read method for property CH }
function TGrau.GetCH : Boolean;
begin
  try
    Result := (Self.fieldByName('GRA_CH').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property CH }
procedure TGrau.SetCH(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    If Value Then
      Self.fieldByName('GRA_CH').asInteger := 1
    else
      Self.fieldByName('GRA_CH').asInteger := 0;
  except
    ShowMessage('Não foi possível alterar o campo "GRA_CH"!');
  end;
end;

{ Read method for property CodigoCNC }
function TGrau.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TGrau.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoGRA }
function TGrau.GetCodigoGRA : Integer;
begin
  try
    Result := Self.fieldByName('GRA_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoGRA }
procedure TGrau.SetCodigoGRA(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('GRA_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "GRA_CODIGO"!');
    end;
end;

{ Read method for property CodigoGRP }
function TGrau.GetCodigoGRP : Integer;
begin
  try
    Result := Self.fieldByName('GRP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoGRP }
procedure TGrau.SetCodigoGRP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('GRP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "GRP_CODIGO"!');
    end;
end;

{ Read method for property CodigoSGP }
function TGrau.GetCodigoSGP : Integer;
begin
  try
    Result := Self.fieldByName('SGP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoSGP }
procedure TGrau.SetCodigoSGP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SGP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SGP_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TGrau.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TGrau.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TGrau.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('GRA_DT_ALTERADO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataAlterado }
procedure TGrau.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('GRA_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "GRA_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TGrau.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('GRA_DT_CADASTRO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataCadastro }
procedure TGrau.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('GRA_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "GRA_DT_CADASTRO"!');
    end;
end;

{ Read method for property DefinirOlho }
function TGrau.GetDefinirOlho : Boolean;
begin
  try
    Result := (Self.fieldByName('GRA_DEFINIR_OLHO').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property DefinirOlho }
procedure TGrau.SetDefinirOlho(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    If Value Then
      Self.fieldByName('GRA_DEFINIR_OLHO').asInteger := 1
    else
      Self.fieldByName('GRA_DEFINIR_OLHO').asInteger := 0;
  except
    ShowMessage('Não foi possível alterar o campo "GRA_DEFINIR_OLHO"!');
  end;
end;

{ Read method for property Grau }
function TGrau.GetGrau : String;
begin
  try
    Result := Self.fieldByName('GRA_GRAU').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Grau }
procedure TGrau.SetGrau(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('GRA_GRAU').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "GRA_GRAU"!');
  end;
end;

{ Read method for property OBS }
function TGrau.GetOBS : String;
begin
  try
    Result := Self.fieldByName('GRA_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TGrau.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('GRA_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "GRA_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TGrau.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('GRA_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TGrau.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('GRA_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "GRA_SITUACAO"!');
    end;
end;

function TGrau.AlterarAuto:Boolean;
begin
    try
      edit;
      try
        Base       :=  EBase.Checked;
      except
      end;
      try
        CH         :=  ECH.Checked;
      except
      end;
      try
        CB         :=  ECB.Checked;
      except
      end;
      try
        DefinirOlho         :=  EDefinirOlho.Checked;
      except
      end;
      try
        CodigoUSU  :=  CConfiguracao.CodigoUSU;
      except
      end;
      try
        Grau       :=  EGrau.Text;
      except
      end;
      try
        DataAlterado  := CConfiguracao.DataHora;
      except
      end;
      try
        Situacao  := ESituacao.ItemIndex;
      except
      end;
      try
         OBS := EOBS.Text;
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

procedure TGrau.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled        :=not Habilitar;
  except
  end;
  try
    ECodigoGRP.Enabled     := not Habilitar;
  except
  end;
  try
    ECodigoSGP.Enabled     := not Habilitar;
  except
  end;
  try
    ECH.Enabled            := Habilitar;
  except
  end;
  try
    ECB.Enabled            := Habilitar;
  except
  end;
  try
    EBase.Enabled          := Habilitar;
  except
  end;
  try
    EDefinirOlho.Enabled    := Habilitar;
  except
  end;
  try
    EGrau.Enabled          := Habilitar;
  except
  end;
  try
    ESituacao.Enabled       := Habilitar;
  except
  end;
  try
    EOBS.Enabled           :=Habilitar;
    except
  end;
end;

procedure TGrau.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  CarregaDados;
end;

procedure TGrau.CarregaDados;
begin
  try
    EGrau.Text               := Grau;
  except
  end;
  try
    EBase.Checked            :=Base;
  except
  end;
  try
    ECH.Checked               :=CH;
  except
  end;
  try
    ECB.Checked               :=CB;
  except
  end;
  try
    EDefinirOlho.Checked       :=DefinirOlho;
  except
  end;
  try
    ECodigoGRA.Text                 :=inttostr(CodigoGRA);
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
    if DataAlterado > 0 then
      EDataAlterado.Text        := FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    ESituacao.ItemIndex          := Situacao;
  except
  end;
  try
    EOBS.Text                  :=OBS;
  except
  end;
end;

constructor TGrau.Create(AOwner: TComponent);
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

function TGrau.Deletar(CdGRA:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdGRA)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      If Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TGrau.Destroy;
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

function TGrau.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem:='';
  if Trim(EGrau.Text) = '' then
    mensagem:=mensagem+'Grau inválido!';
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
        if not copiando then
        begin
          close;
          open;
        end;
        LocalizarCod(SCodigo);
        AtualizaControles(False);
        Estado:=0;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoGRA;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        AtualizaControles(False);
        Estado:=0;
      end;
    End;
    AfterScroll:=aux;
    CarregaDados;
  end;
end;

function TGrau.InserirAuto:Boolean;
begin
  try
    append;
    try
      CodigoGRA   := SCodigo;
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
       CodigoGRP  :=  ECodigoGRP.KeyValue;
    except
    end;
    try
       CodigoSGP  :=  ECodigoSGP.KeyValue;
    except
    end;
    try
       DataCadastro  := StrToDateTime(EDataCadastro.Text);
    except
    end;
    try
      Grau  := EGrau.Text;
    except
    end;
    try
      Base  := EBase.Checked;
    except
    end;
    try
      CH  := ECH.Checked;
    except
    end;
    try
      CB  := ECB.Checked;
    except
    end;
    try
      DefinirOlho  := EDefinirOlho.Checked;
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

procedure TGrau.LimpaCampos;
begin
  try
    if not copiando then
      if Estado <> 1 then
        ECodigoGRA.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text  := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    if not copiando then
      EGrau.Clear;
  except
  end;
  try
    if not copiando then
      EBase.Checked  := False;
  except
  end;
  try
    if not copiando then
      ECH.Checked    := False;
  except
  end;
  try
    if not copiando then
      EDefinirOlho.Checked    := False;
  except
  end;
  try
    if not copiando then
      if Estado <> 1 then
        ESituacao.ItemIndex:=-1
      else
        ESituacao.ItemIndex:=0;
  except
  end;
  try
    if not copiando then
      EOBS.Clear;
  except
  end;
end;

{ Localiza um Grau }
function TGrau.LocalizarCod(CdGRA:Integer):Boolean;
begin
  If (CdGRA<>CodigoGRA) Then
    If locate('GRA_CODIGO', CdGRA, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TGrau.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TGrau.PreparaInsercao;
begin
  ProximoCodigo('GRA_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TGrau.deletarauto:Boolean;
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
