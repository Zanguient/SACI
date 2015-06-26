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
unit Registro_de_baixa_externa;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Funcoes, Variants;

type
  TRegistro_de_Baixa_Externa = class(TSQuery)
    private
      { Private fields of TRegistro_de_Baixa_Externa }
        { Storage for property CncBaixa }
        FCncBaixa : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoRBE }
        FCodigoRBE : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property ECncBaixa }
        FECncBaixa : TEdit;
        { Storage for property ECodigoRBE }
        FECodigoRBE : TEdit;
        { Storage for property EData }
        FEData : TMaskEdit;
        { Storage for property ENumero }
        FENumero : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipo }
        FETipo : TDBLookupcomboBox;
        { Storage for property EValor }
        FEValor : TEdit;
        { Storage for property Numero }
        FNumero : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property Valor }
        FValor : Double;

      { Private methods of TRegistro_de_Baixa_Externa }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CncBaixa }
        function GetCncBaixa : Integer;
        { Write method for property CncBaixa }
        procedure SetCncBaixa(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoRBE }
        function GetCodigoRBE : Integer;
        { Write method for property CodigoRBE }
        procedure SetCodigoRBE(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
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
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);
        { Read method for property Valor }
        function GetValor : Double;
        { Write method for property Valor }
        procedure SetValor(Value : Double);

    protected
      { Protected fields of TRegistro_de_Baixa_Externa }

      { Protected methods of TRegistro_de_Baixa_Externa }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;
        procedure Loaded; override;

    public
      { Public fields and properties of TRegistro_de_Baixa_Externa }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TRegistro_de_Baixa_Externa }
        { Altera um Registro de Beixa Externa }
        function Alterar(CdCNC, CdRBE, PCNCBaixa, PTipo,  PSituacao: Integer; PData:TDateTime; PNumero, POBS: String;PValor:Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC,CdRBE:Integer);
        destructor Destroy; override;
        procedure FinalizaEdicao;
        { Insere um Registro de Baixa Externa }
        function Inserir(CdCNC, CdRBE, PCNCBaixa, PTipo, PSituacao: Integer; PData:TDateTime; PNumero, POBS: String; PValor :Double):boolean;
        function InserirAuto:Boolean;
        { Localiza um registro de baixa externa }
        function LocalizarCod(CdRBE, CdCNC: Integer): Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TRegistro_de_Baixa_Externa }
        property CncBaixa : Integer read GetCncBaixa write SetCncBaixa;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoRBE : Integer read GetCodigoRBE write SetCodigoRBE;
        property Data : Tdatetime read GetData write SetData;
        property ECncBaixa : TEdit read FECncBaixa write FECncBaixa;
        property ECodigoRBE : TEdit read FECodigoRBE write FECodigoRBE;
        property EData : TMaskEdit read FEData write FEData;
        property ENumero : TEdit read FENumero write FENumero;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipo : TDBLookupcomboBox read FETipo write FETipo;
        property EValor : TEdit read FEValor write FEValor;
        property Numero : String read GetNumero write SetNumero;
        property OBS : String read GetOBS write SetOBS;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;
        property Valor : Double read GetValor write SetValor;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TRegistro_de_Baixa_Externa with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TRegistro_de_Baixa_Externa]);
end;

{ Method to set variable and property values and create objects }
procedure TRegistro_de_Baixa_Externa.AutoInitialize;
begin
     Estado := 0;
     FECncBaixa := nil;
     FECodigoRBE := nil;
     FEData := nil;
     FENumero := nil;
     FEOBS := nil;
     FESituacao := nil;
     FETipo := nil;
     FEValor := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TRegistro_de_Baixa_Externa.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECncBaixa then
        FECncBaixa := nil;
     if AComponent = FECodigoRBE then
        FECodigoRBE := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FENumero then
        FENumero := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
     if AComponent = FEValor then
        FEValor := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TRegistro_de_Baixa_Externa.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CncBaixa }
function TRegistro_de_Baixa_Externa.GetCncBaixa : Integer;
begin
  try
    Result := Self.fieldByName('RBE_CNC_BAIXA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CncBaixa }
procedure TRegistro_de_Baixa_Externa.SetCncBaixa(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('RBE_CNC_BAIXA').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "RBE_CNC_BAIXA"!');
  end;
end;

{ Read method for property CodigoCNC }
function TRegistro_de_Baixa_Externa.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TRegistro_de_Baixa_Externa.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoRBE }
function TRegistro_de_Baixa_Externa.GetCodigoRBE : Integer;
begin
  try
    Result := Self.fieldByName('RBE_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoRBE }
procedure TRegistro_de_Baixa_Externa.SetCodigoRBE(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('RBE_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "RBE_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TRegistro_de_Baixa_Externa.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('RBE_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TRegistro_de_Baixa_Externa.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('RBE_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "RBE_DATA"!');
  end;
end;

{ Read method for property Numero }
function TRegistro_de_Baixa_Externa.GetNumero : String;
begin
  try
    result := Self.fieldByName('RBE_TRC_NUMERO').asString;
  except
  end;
end;

{ Write method for property Numero }
procedure TRegistro_de_Baixa_Externa.SetNumero(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('RBE_TRC_NUMERO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "RBE_TRC_NUMERO"!');
    end;
end;

{ Read method for property OBS }
function TRegistro_de_Baixa_Externa.GetOBS : String;
begin
  try
    result := Self.fieldByName('RBE_OBSERVACAO').asString;
  except
  end;
end;

{ Write method for property OBS }
procedure TRegistro_de_Baixa_Externa.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('RBE_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "RBE_OBSERVACAO"!');
    end;
end;

{ Read method for property Situacao }
function TRegistro_de_Baixa_Externa.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('RBE_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TRegistro_de_Baixa_Externa.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('RBE_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "RBE_SITUACAO"!');
    end;
end;

{ Read method for property Tipo }
function TRegistro_de_Baixa_Externa.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('RBE_TRC_TIPO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Tipo }
procedure TRegistro_de_Baixa_Externa.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('RBE_TRC_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "RBE_TRC_TIPO"!');
    end;
end;

{ Read method for property Valor }
function TRegistro_de_Baixa_Externa.GetValor : Double;
begin
  try
    Result := Self.fieldByName('RBE_VALOR').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Valor }
procedure TRegistro_de_Baixa_Externa.SetValor(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('RBE_VALOR').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "RBE_VALOR"!');
    end;
end;

{ Altera um Registro de Beixa Externa }
function TRegistro_de_Baixa_Externa.Alterar(CdCNC, CdRBE, PCNCBaixa, PTipo,  PSituacao: Integer; PData:TDateTime; PNumero, POBS: String;PValor:Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  result := true;
  If not(localizarCod(CdRBE,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CNCBaixa       := PCNCBaixa;
      Data           := PData;
      Numero         := PNumero;
      Tipo           := PTipo;
      Valor          := PValor;
      Situacao       := PSituacao;
      OBS            := POBS;

      try
        Post;

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

function TRegistro_de_Baixa_Externa.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      edit;
      Try
         CncBaixa  := StrToInt(ECncBaixa.Text);
      except
      end;
      try
         Data := StrToDateTime(EData.Text);
      except
      end;
      try
         Numero  := ENumero.Text;
      except
      end;
      try
         Tipo := ETipo.KeyValue;
      except
      end;
      try
         Valor := StrToFloat(EValor.Text);
      except
      end;
      try
         Situacao := ESituacao.Itemindex;
      except
      end;
      try
         Obs := EOBS.Text;
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

procedure TRegistro_de_Baixa_Externa.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    ECncBaixa.Enabled     :=Habilitar;
  Except
  End;
  Try
    ENumero.Enabled   :=Habilitar;
  Except
  End;
  Try
    ETipo.Enabled      :=Habilitar;
  Except
  End;
  Try
    EValor.Enabled     :=Habilitar;
  Except
  End;
  Try
    ESituacao.Enabled         :=Habilitar;
  Except
  End;
  Try
    EOBS.Enabled              :=Habilitar;
  Except
  End;
end;

procedure TRegistro_de_Baixa_Externa.CancelaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(False);
  Estado:=0;
  CarregaDados;
end;

procedure TRegistro_de_Baixa_Externa.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    ECodigoRBE.Text           :=IntToStr(CodigoRBE);
  Except
  End;
  Try
    ECncBaixa.Text            :=IntToStr(CncBaixa);
  Except
  End;
  Try
    If data<>0 then
      EData.Text                :=FormatDateTime('dd/mm/yyyy', Data);
  Except
  End;
  Try
    ENumero.Text              :=Numero;
  Except
  End;
  Try
    ETipo.KeyValue            :=Tipo;
  Except
  End;
  Try
    EValor.Text               :=Format('%.2f', [Valor]);
  Except
  End;
  Try
    ESituacao.itemindex       :=Situacao;
  Except
  End;
  Try
    EOBS.Text                 :=OBS;
  Except
  End;
end;

constructor TRegistro_de_Baixa_Externa.Create(AOwner: TComponent);
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

procedure TRegistro_de_Baixa_Externa.Deletar(CdCNC,CdRBE:Integer);
begin
  If not(localizarCod(CdRBE,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      if TQuery(Self).isEmpty then
      begin
         Try
           ECodigoRBE.Clear;
         Except
         End;
         Try
           ECncBaixa.Clear;
         Except
         End;
         Try
           EData.Text := DateToStr(CConfiguracao.Data);
         Except
         End;
         Try
           ENumero.Clear;
         Except
         End;
         Try
           ETipo.KeyValue:=0;
         Except
         End;
         Try
           EValor.Clear;
         Except
         End;
         Try
           ESituacao.Text := '';
         Except
         End;
         Try
           EOBS.Clear;
         Except
         End;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TRegistro_de_Baixa_Externa.Destroy;
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

procedure TRegistro_de_Baixa_Externa.FinalizaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
var
  cod, cdcnc:Integer;
  mensagem:string;
begin
  mensagem:='';
  If not Verificadata(EData.text) Then
    mensagem:=mensagem+'Data incorreta!'+#13;
  if not verificafloat(EValor.text) then
    mensagem:= mensagem + 'Valor digitado incorretamente!';
  If mensagem <>'' Then
    raise Exception.Create(mensagem);
  If Estado=1 then
  Begin
    Inserirauto;
    close;
    open;
    LocalizarCod(SCodigo,CodigoCNC);
  End;

  If Estado=2 then
  Begin
    cod:=codigoRBE;
    cdcnc:=codigoCNC;
    Alterarauto;
    close;
    open;
    LocalizarCod(cod, cdcnc);
  End;

  AtualizaControles(False);
  Estado:=0;
end;

{ Insere um Registro de Baixa Externa }
function TRegistro_de_Baixa_Externa.Inserir(CdCNC, CdRBE, PCNCBaixa, PTipo, PSituacao: Integer; PData:TDateTime; PNumero, POBS: String; PValor :Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdRBE=0 then
    Cod    := ProximoCodigo('RBE_CODIGO')
  else
    Cod    := CdRBE;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
     result := true;
     Insert;
     try
       CodigoRBE      := Cod;
       CodigoCNC      := CdCNC;
       CNCBaixa       := PCNCBaixa;
       Data           := PData;
       Numero         := PNumero;
       Tipo           := PTipo;
       Valor          := PValor;
       Situacao       := PSituacao;
       OBS            := POBS;

       try
         Post;

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
End;

function TRegistro_de_Baixa_Externa.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Aux:TDataSetNotifyEvent;
begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      Try
         CncBaixa  := StrToInt(ECncBaixa.Text);
      except
      end;
      try
         Data := StrToDateTime(EData.Text);
      except
      end;
      try
         Numero  := ENumero.Text;
      except
      end;
      try
         Tipo := ETipo.KeyValue;
      except
      end;
      try
         Valor := StrToFloat(EValor.Text);
      except
      end;
      try
         Situacao := ESituacao.Itemindex;
      except
      end;
      try
         OBS := EOBS.Text;
      except
      end;
      try
         CodigoRBE := SCodigo;
      except
      end;

      try
        Post;
        AfterScroll:=Aux;
        CarregaDados;
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

procedure TRegistro_de_Baixa_Externa.Loaded;
begin
     inherited Loaded;

     { Perform any component setup that depends on the property
       values having been set }

end;

{ Localiza um registro de baixa externa }
function TRegistro_de_Baixa_Externa.LocalizarCod(CdRBE, CdCNC: Integer): Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdRBE<>CodigoRBE) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; RBE_CODIGO', vararrayof([CdCNC, CdRBE]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TRegistro_de_Baixa_Externa.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TRegistro_de_Baixa_Externa.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  ProximoCodigo('RBE_CODIGO');
  Try
    ECncBaixa.Clear;
  Except
  End;
  Try
    EData.Text := DateToStr(CConfiguracao.Data);
  Except
  End;
  Try
    ENumero.Clear;
  Except
  End;
  Try
    ETipo.KeyValue:=0;
  Except
  End;
  Try
    EValor.Clear;
  Except
  End;
  Try
    ESituacao.Text := '';
  Except
  End;
  Try
    EOBS.Clear;
  Except
  End;
  Estado:=1;
  AtualizaControles(True);
end;

function TRegistro_de_Baixa_Externa.deletarauto:Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      result:=true;
      GeraLog(1880,CodigoCNC,CodigoRBE,'48');
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
