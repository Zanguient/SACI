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
unit Compra;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Variants;

type
  TCompra = class(TSQuery)
    private
      { Private fields of TCompra }
        { Storage for property CodigoCMP }
        FCodigoCMP : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property ECodigoCMP }
        FECodigoCMP : TEdit;
        { Storage for property EData }
        FEData : TMaskEdit;
        { Storage for property EHistorico }
        FEHistorico : TCheckBox;
        { Storage for property EMotivo }
        FEMotivo : TEdit;
        { Storage for property EPendRep }
        FEPendRep : TCheckBox;
        { Storage for property EPrevVend }
        FEPrevVend : TCheckBox;
        { Storage for property EProcura }
        FEProcura : TCheckBox;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property ESugestao }
        FESugestao : TCheckBox;
        { Storage for property Historico }
        FHistorico : Boolean;
        { Storage for property Motivo }
        FMotivo : String;
        { Storage for property PendRep }
        FPendRep : Boolean;
        { Storage for property PrevVend }
        FPrevVend : Boolean;
        { Storage for property Procura }
        FProcura : Boolean;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Sugestao }
        FSugestao : Boolean;

      { Private methods of TCompra }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCMP }
        function GetCodigoCMP : Integer;
        { Write method for property CodigoCMP }
        procedure SetCodigoCMP(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property Historico }
        function GetHistorico : Boolean;
        { Write method for property Historico }
        procedure SetHistorico(Value : Boolean);
        { Read method for property Motivo }
        function GetMotivo : String;
        { Write method for property Motivo }
        procedure SetMotivo(Value : String);
        { Read method for property PendRep }
        function GetPendRep : Boolean;
        { Write method for property PendRep }
        procedure SetPendRep(Value : Boolean);
        { Read method for property PrevVend }
        function GetPrevVend : Boolean;
        { Write method for property PrevVend }
        procedure SetPrevVend(Value : Boolean);
        { Read method for property Procura }
        function GetProcura : Boolean;
        { Write method for property Procura }
        procedure SetProcura(Value : Boolean);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Sugestao }
        function GetSugestao : Boolean;
        { Write method for property Sugestao }
        procedure SetSugestao(Value : Boolean);

    protected
      { Protected fields of TCompra }

      { Protected methods of TCompra }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;
        procedure Loaded; override;

    public
      { Public fields and properties of TCompra }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TCompra }
        { Altera uma Compra }
        function Alterar(CdCNC,CdCMP, PSituacao : integer;  PMotivo: String; PSugestao,PHistorico, PPrevVend, PPendRep,PProcura:Boolean):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CancelarCompra;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC,CdCMP:Integer);
        destructor Destroy; override;
        procedure FinalizaEdicao;
        { Insere uma Compra }
        function Inserir(CdCNC,CdCMP, PSituacao : integer;  PMotivo: String; PSugestao,PHistorico, PPrevVend, PPendRep,PProcura:Boolean):boolean;
        function InserirAuto:Boolean;
        { Localiza uma Compra }
        function LocalizarCod(CdCMP, CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        procedure VirarCotacao;
        procedure VirarIntencao;
        procedure VirarPedido;
        function deletarauto:Boolean;

    published
      { Published properties of TCompra }
        { Código da Compra }
        property CodigoCMP : Integer read GetCodigoCMP write SetCodigoCMP;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property Data : Tdatetime read GetData write SetData;
        property ECodigoCMP : TEdit read FECodigoCMP write FECodigoCMP;
        property EData : TMaskEdit read FEData write FEData;
        property EHistorico : TCheckBox read FEHistorico write FEHistorico;
        property EMotivo : TEdit read FEMotivo write FEMotivo;
        property EPendRep : TCheckBox read FEPendRep write FEPendRep;
        property EPrevVend : TCheckBox read FEPrevVend write FEPrevVend;
        property EProcura : TCheckBox read FEProcura write FEProcura;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property ESugestao : TCheckBox read FESugestao write FESugestao;
        { Historico da Compra }
        property Historico : Boolean read GetHistorico write SetHistorico;
        { Motivo da Compra }
        property Motivo : String read GetMotivo write SetMotivo;
        { Pendencias de Reposicao da Compra }
        property PendRep : Boolean read GetPendRep write SetPendRep;
        { Previsao de Venda da Compra }
        property PrevVend : Boolean read GetPrevVend write SetPrevVend;
        property Procura : Boolean read GetProcura write SetProcura;
        { Cotacao da Compra }
        property Situacao : Integer read GetSituacao write SetSituacao;
        { Sugestao da Compra }
        property Sugestao : Boolean read GetSugestao write SetSugestao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCompra with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCompra]);
end;

{ Method to set variable and property values and create objects }
procedure TCompra.AutoInitialize;
begin
     Estado := 0;
     FECodigoCMP := nil;
     FEData := nil;
     FEHistorico := nil;
     FEMotivo := nil;
     FEPendRep := nil;
     FEPrevVend := nil;
     FEProcura := nil;
     FESituacao := nil;
     FESugestao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCompra.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCMP then
        FECodigoCMP := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEHistorico then
        FEHistorico := nil;
     if AComponent = FEMotivo then
        FEMotivo := nil;
     if AComponent = FEPendRep then
        FEPendRep := nil;
     if AComponent = FEPrevVend then
        FEPrevVend := nil;
     if AComponent = FEProcura then
        FEProcura := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FESugestao then
        FESugestao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCompra.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCMP }
function TCompra.GetCodigoCMP : Integer;
begin
  try
    Result := Self.fieldByName('CMP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCMP }
procedure TCompra.SetCodigoCMP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CMP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CMP_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TCompra.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TCompra.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TCompra.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('CMP_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TCompra.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CMP_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CMP_DATA"!');
  end;
end;

{ Read method for property Historico }
function TCompra.GetHistorico : Boolean;
begin
  try
    result := (Self.fieldByName('CMP_HISTORICO').asInteger=1);
  except
    try
      result := Self.fieldByName('CMP_HISTORICO').asBoolean;
    except
      result:= False
    end;
  end;
end;

{ Write method for property Historico }
procedure TCompra.SetHistorico(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if value=true then
       Self.fieldByName('CMP_HISTORICO').asInteger := 1
      else
       Self.fieldByName('CMP_HISTORICO').asInteger := 0;
    except
      try
        Self.fieldByName('CMP_HISTORICO').asBoolean := Value;
      except
        ShowMessage('Não foi possível alterar o campo "CMP_HISTORICO"!');
      end;
    end;
end;

{ Read method for property Motivo }
function TCompra.GetMotivo : String;
begin
  try
    Result := Self.fieldByName('CMP_MOTIVO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Motivo }
procedure TCompra.SetMotivo(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CMP_MOTIVO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CMP_MOTIVO"!');
  end;
end;

{ Read method for property PendRep }
function TCompra.GetPendRep : Boolean;
begin
 try
   Result := (Self.fieldByName('CMP_PEND_REP').asInteger=1);
 except
   try
     Result := Self.fieldByName('CMP_PEND_REP').asBoolean;
   except
     result:= False
   end;
 end;
end;

{ Write method for property PendRep }
procedure TCompra.SetPendRep(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
      Self.fieldByName('CMP_PEND_REP').asInteger := 1
     else
      Self.fieldByName('CMP_PEND_REP').asInteger := 0;
   except
     try
       Self.fieldByName('CMP_PEND_REP').asBoolean := Value;
     except
      ShowMessage('Não foi possível alterar o campo "CMP_PEND_REP"!');
     end;
   end;
end;

{ Read method for property PrevVend }
function TCompra.GetPrevVend : Boolean;
begin
  try
    Result := (Self.fieldByName('CMP_PREV_VEND').asInteger=1);
  except
     try
       Result := Self.fieldByName('CMP_PREV_VEND').asBoolean;
     except
       result:= False
     end;
  end;
end;

{ Write method for property PrevVend }
procedure TCompra.SetPrevVend(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('CMP_PREV_VEND').asInteger := 1
     else
       Self.fieldByName('CMP_PREV_VEND').asInteger := 0;
    except
      try
        Self.fieldByName('CMP_PREV_VEND').asBoolean := Value;
      except
        ShowMessage('Não foi possível alterar o campo "CMP_PREV_VEND"!');
      end;
    end;
end;

{ Read method for property Procura }
function TCompra.GetProcura : Boolean;
begin
 try
   Result := (Self.fieldByName('CMP_PROCURA').asInteger=1);
 except
    try
      Result := Self.fieldByName('CMP_PROCURA').asBoolean;
    except
      result:= False
    end;
 end;
end;

{ Write method for property Procura }
procedure TCompra.SetProcura(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('CMP_PROCURA').asInteger := 1
     else
       Self.fieldByName('CMP_PROCURA').asInteger := 0;
    except
      try
        Self.fieldByName('CMP_PROCURA').asBoolean := Value;
      except
        ShowMessage('Não foi possível alterar o campo "CMP_PROCURA"!');
      end;
    end;
end;

{ Read method for property Situacao }
function TCompra.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CMP_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TCompra.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CMP_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CMP_SITUACAO"!');
    end;
end;

{ Read method for property Sugestao }
function TCompra.GetSugestao : Boolean;
begin
 try
   Result := (Self.fieldByName('CMP_SUGESTAO').asInteger=1);
 except
    try
      Result := Self.fieldByName('CMP_SUGESTAO').asBoolean;
    except
      result:= False
    end;
 end;
end;

{ Write method for property Sugestao }
procedure TCompra.SetSugestao(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('CMP_SUGESTAO').asInteger := 1
     else
       Self.fieldByName('CMP_SUGESTAO').asInteger := 0;
   except
     try
       Self.fieldByName('CMP_SUGESTAO').asBoolean := Value;
     except
       ShowMessage('Não foi possível alterar o campo "CMP_SUGESTAO"!');
     end;
   end;
end;

{ Altera uma Compra }
function TCompra.Alterar(CdCNC,CdCMP, PSituacao : integer;  PMotivo: String; PSugestao,PHistorico, PPrevVend, PPendRep,PProcura:Boolean):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
var
  cod, codcnc:Integer;
begin
  result:=true;
  If not(localizarCod(CdCMP,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      Motivo         := PMotivo;
      Sugestao       := PSugestao;
      Situacao       := PSituacao;
      Historico      := PHistorico;
      PrevVend       := PPrevVend;
      PendRep        := PPendRep;
      Procura        := PProcura;
      try
        cod:=codigoCMP;
        codcnc:=codigoCNC;
        Post;
        Close;
        Open;
        LocalizarCod(cod, codcnc);
      except
        result:=false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TCompra.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      edit;
      try
         Motivo := EMotivo.Text;
      except
      end;
      try
         Sugestao := ESugestao.Checked;
      except
      end;
      try
         Historico := EHistorico.Checked;
      except
      end;
      try
         PrevVend := EPrevVend.Checked;
      except
      end;
      try
         Procura := EProcura.Checked;
      except
      end;
      try
         PendRep := EPendRep.Checked;
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

procedure TCompra.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EMotivo.Enabled     :=Habilitar;
  Except
  End;
end;

procedure TCompra.CancelaEdicao;
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

procedure TCompra.CancelarCompra;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
var
  cod, codcnc:Integer;
begin
    try
      edit;
      Situacao       := 0;
      try
        cod:=codigoCMP;
        codcnc:=codigoCNC;
        Post;
        Close;
        Open;
        LocalizarCod(cod, codcnc);
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
end;

procedure TCompra.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
   Case Situacao of
    0: ESituacao.Text:='Em aberto';
    1: ESituacao.Text:='Mapa de Cotação';
    2: ESituacao.Text:='Intenção de Compra';
    3: ESituacao.Text:='Pedido de Compra';
   end;
  except
  end;
  Try
   ECodigoCMP.Text                :=IntToStr(CodigoCMP);
   Except
  End;
  Try
    EMotivo.Text         :=Motivo;
  Except
  End;
  Try
    if Data<>0 then
      EData.Text           :=FormatDateTime('dd/mm/yyyy hh:nn:ss', Data);
  Except
  End;
  Try
    ESugestao.Checked  :=Sugestao;
  Except
  End;
  Try
    EHistorico.Checked :=Historico;
  Except
  End;
  Try
    EPrevVend.Checked  :=PrevVend;
  Except
  End;
  Try
    EPendRep.Checked   :=PendRep;
  Except
  End;
  Try
    EProcura.Checked   :=Procura;
  Except
  End;
end;

constructor TCompra.Create(AOwner: TComponent);
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

procedure TCompra.Deletar(CdCNC,CdCMP:Integer);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdCMP,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      if TQuery(Self).IsEmpty then
      begin
         Try
           ECodigoCMP.Clear;
         Except
         End;
         Try
           EMotivo.Clear;
         Except
         End;
         Try
           EData.Text:=DateTimeToStr(CConfiguracao.DataHora);
         Except
         End;
         Try
           ESugestao.Checked:=False;
         Except
         End;
         Try
           EHistorico.Checked:=False;
         Except
         End;
         Try
           EPrevVend.Checked:=False;
         Except
         End;
         Try
           EProcura.Checked:=False;
         Except
         End;
         Try
           EPendRep.Checked:=False;
         Except
         End;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TCompra.Destroy;
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

procedure TCompra.FinalizaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cod, cdcnc:Integer;
  mensagem:string;
begin
  mensagem:='';
  If not Verificadata(EData.text) Then
    mensagem:=mensagem+'Data incorreta!';
  If mensagem <>'' Then
    raise Exception.Create(mensagem);
  If Estado=1 then
  Begin
    Inserirauto;
    close;
    open;
    LocalizarCod(SCodigo, CodigoCNC);
  End;

  If Estado=2 then
  Begin
    cod:=codigoCMP;
    cdcnc:=codigoCNC;
    Alterarauto;
    close;
    open;
    LocalizarCod(cod, cdcnc);
  End;

  AtualizaControles(False);
  Estado:=0;
end;

{ Insere uma Compra }
function TCompra.Inserir(CdCNC,CdCMP, PSituacao : integer;  PMotivo: String; PSugestao,PHistorico, PPrevVend, PPendRep,PProcura:Boolean):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdCMP=0 then
    Cod    := ProximoCodigo('CMP_CODIGO')
  else
    Cod    := CdCMP;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
   result:=true;
     try
       INSERT;
       CodigoCMP      := Cod;
       CodigoCNC      := CdCNC;
       Motivo         := PMotivo;
       Data           := CConfiguracao.DataHora;
       Sugestao       := PSugestao;
       Situacao       := PSituacao;
       Historico      := PHistorico;
       PrevVend       := PPrevVend;
       PendRep        := PPendRep;
       Procura        := PProcura;
       try
         Post;
         Close;
         Open;
       except
         result:=false;
         Cancel;
         ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
       end;
     except
       result:=false;
       ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TCompra.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Aux:TDataSetNotifyEvent;
begin
  If (localizarCod(SCodigo,CodigoCNC)) Then
  begin
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
    result:=false;
  end
  Else
  begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        codigoCMP := SCodigo;
      except
      end;
      try
         Motivo := EMotivo.Text;
      except
      end;
      try
         Data := StrToDateTime(EData.Text);
      except
      end;
      try
         Sugestao := ESugestao.Checked;
      except
      end;
      try
         Historico := EHistorico.Checked;
      except
      end;
      try
         Procura := EProcura.Checked;
      except
      end;
      try
         PrevVend := EPrevVend.Checked;
      except
      end;
      try
         PendRep := EPendRep.Checked;
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
end;

procedure TCompra.Loaded;
begin
     inherited Loaded;

     { Perform any component setup that depends on the property
       values having been set }

end;

{ Localiza uma Compra }
function TCompra.LocalizarCod(CdCMP, CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdCMP<>CodigoCMP) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; CMP_CODIGO', vararrayof([CdCNC, CdCMP]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TCompra.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TCompra.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  ProximoCodigo('CMP_CODIGO');
  Try
    EMotivo.Clear;
  Except
  End;
  Try
    EData.Text:=DateTimeToStr(CConfiguracao.DataHora);
  Except
  End;
  Try
    ESugestao.Checked:=False;
  Except
  End;
  Try
    EHistorico.Checked:=False;
  Except
  End;
  Try
    EPrevVend.Checked:=False;
  Except
  End;
  Try
    EProcura.Checked:=False;
  Except
  End;
  Try
    EPendRep.Checked:=False;
  Except
  End;

  AtualizaControles(True);
  Estado:=1;
end;

procedure TCompra.VirarCotacao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
var
  cod, codcnc:Integer;
  Aux:TDataSetNotifyEvent;
begin
  If Situacao<>1 then
  Begin
    cod:=codigoCMP;
    codcnc:=codigoCNC;
    Aux:=AfterScroll;
    AfterScroll:=nil;
    try
      edit;
      Situacao       := 1;
      try
        Post;
        Close;
        Open;
        LocalizarCod(cod, codcnc);
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
    AfterScroll:=Aux;
  End;
end;

procedure TCompra.VirarIntencao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
var
  cod, codcnc:Integer;
  Aux:TDataSetNotifyEvent;
begin
  If Situacao<>2 then
  Begin
    cod:=codigoCMP;
    codcnc:=codigoCNC;
    Aux:=AfterScroll;
    AfterScroll:=nil;
    try
      edit;
      Situacao       := 2;
      try
        Post;
        Close;
        Open;
        LocalizarCod(cod, codcnc);
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
    AfterScroll:=Aux;
  End;
end;

procedure TCompra.VirarPedido;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
var
  cod, codcnc:Integer;
  Aux:TDataSetNotifyEvent;
begin
  If Situacao<>3 then
  Begin
    cod:=codigoCMP;
    codcnc:=codigoCNC;
    Aux:=AfterScroll;
    AfterScroll:=nil;
    try
      edit;
      Situacao       := 3;
      try
        Post;
        Close;
        Open;
        LocalizarCod(cod, codcnc);
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
    AfterScroll:=Aux;
  End;
end;

function TCompra.deletarauto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    Result := Delete;
    if TQuery(Self).IsEmpty then
    begin
         Try
           ECodigoCMP.Clear;
         Except
         End;
         Try
           EMotivo.Clear;
         Except
         End;
         Try
           EData.Text:=DateTimeToStr(CConfiguracao.DataHora);
         Except
         End;
         Try
           ESugestao.Checked:=False;
         Except
         End;
         Try
           EHistorico.Checked:=False;
         Except
         End;
         Try
           EPrevVend.Checked:=False;
         Except
         End;
         Try
           EProcura.Checked:=False;
         Except
         End;
         Try
           EPendRep.Checked:=False;
         Except
         End;
    end;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
