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
unit ReservaExterna;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Pedido_de_venda, Produto, Configuracao, Variants, 
     Funcoes;

type
  TReservaExterna = class(TSQuery)
    private
      { Private fields of TReservaExterna }
        { Storage for property CPedido_de_Venda }
        FCPedido_de_Venda : TPedido_de_venda;
        { Storage for property CProduto }
        FCProduto : TProduto;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoCNCREQ }
        FCodigoCNCREQ : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoREX }
        FCodigoREX : Integer;
        { Storage for property Data }
        FData : TDateTime;
        { Storage for property ECodigoCNCREQ }
        FECodigoCNCREQ : TDBLookupComboBox;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoREX }
        FECodigoREX : TEdit;
        { Storage for property EData }
        FEData : TMaskEdit;
        { Storage for property EObservacao }
        FEObservacao : TMemo;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TReservaExterna }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoCNCREQ }
        function GetCodigoCNCREQ : Integer;
        { Write method for property CodigoCNCREQ }
        procedure SetCodigoCNCREQ(Value : Integer);
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Write method for property CodigoPDV }
        procedure SetCodigoPDV(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoREX }
        function GetCodigoREX : Integer;
        { Write method for property CodigoREX }
        procedure SetCodigoREX(Value : Integer);
        { Read method for property Data }
        function GetData : TDateTime;
        { Write method for property Data }
        procedure SetData(Value : TDateTime);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TReservaExterna }

      { Protected methods of TReservaExterna }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TReservaExterna }

      { Public methods of TReservaExterna }
        { Altera um Cliente }
        function Alterar(CdCNC, CdREX, CdPDV, CdPRD,  CdCNCREQ,PSituacao: Integer; PObs:String; PData:TDateTime;PQuant:Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdREX:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC,CdREX, CdPDV, CdPRD, CdCNCREQ, PSituacao: Integer; PObs:String;PQuant:Double):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdREX,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TReservaExterna }
        property CPedido_de_Venda : TPedido_de_venda
             read FCPedido_de_Venda write FCPedido_de_Venda;
        property CProduto : TProduto read FCProduto write FCProduto;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoCNCREQ : Integer
             read GetCodigoCNCREQ write SetCodigoCNCREQ;
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        { Código da tabela de preços }
        property CodigoREX : Integer read GetCodigoREX write SetCodigoREX;
        property Data : TDateTime read GetData write SetData;
        property ECodigoCNCREQ : TDBLookupComboBox
             read FECodigoCNCREQ write FECodigoCNCREQ;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoREX : TEdit read FECodigoREX write FECodigoREX;
        property EData : TMaskEdit read FEData write FEData;
        property EObservacao : TMemo read FEObservacao write FEObservacao;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property Observacao : String read GetObservacao write SetObservacao;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TReservaExterna with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TReservaExterna]);
end;

{ Method to set variable and property values and create objects }
procedure TReservaExterna.AutoInitialize;
begin
     FECodigoCNCREQ := nil;
     FECodigoPDV := nil;
     FECodigoPRD := nil;
     FECodigoREX := nil;
     FEData := nil;
     FEObservacao := nil;
     FEQuantidade := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TReservaExterna.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCNCREQ then
        FECodigoCNCREQ := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoREX then
        FECodigoREX := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TReservaExterna.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TReservaExterna.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TReservaExterna.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNCREQ }
function TReservaExterna.GetCodigoCNCREQ : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO_REQ').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNCREQ }
procedure TReservaExterna.SetCodigoCNCREQ(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO_REQ').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO_REQ"!');
    end;
end;

{ Read method for property CodigoPDV }
function TReservaExterna.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPDV }
procedure TReservaExterna.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TReservaExterna.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TReservaExterna.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Read method for property CodigoREX }
function TReservaExterna.GetCodigoREX : Integer;
begin
  try
    Result := Self.fieldByName('REX_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoREX }
procedure TReservaExterna.SetCodigoREX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('REX_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "REX_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TReservaExterna.GetData : TDateTime;
begin
  try
    Result := Self.fieldByName('REX_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TReservaExterna.SetData(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('REX_DATA').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "REX_DATA"!');
  end;
end;

{ Read method for property Observacao }
function TReservaExterna.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('REX_OBS1').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Observacao }
procedure TReservaExterna.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('REX_OBS1').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "REX_OBS1"!');
    end;
end;

{ Read method for property Quantidade }
function TReservaExterna.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('REX_QUANTIDADE').asFloat;
  except
    Result:=0;
  end;
end;

{ Write method for property Quantidade }
procedure TReservaExterna.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('REX_QUANTIDADE').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "REX_QUANTIDADE"!');
  end;
end;

{ Read method for property Situacao }
function TReservaExterna.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('REX_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TReservaExterna.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('REX_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "REX_SITUACAO"!');
  end;
end;

{ Altera um Cliente }
function TReservaExterna.Alterar(CdCNC, CdREX, CdPDV, CdPRD,  CdCNCREQ,PSituacao: Integer; PObs:String; PData:TDateTime;PQuant:Double):boolean;
begin
  result:=false;
  If not(localizarCod(CdREX,CdCNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      CodigoPRD    := CdPRD;
      CodigoPDV    := CdPDV;
      CodigoCNCREQ := CdCNCREQ;
      CodigoPRD    := CdPRD;
      Situacao     := PSituacao;
      Quantidade   := PQuant;
      Observacao   := PObs;
      Data         := Pdata;
      try
        Post;
        result:=True;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TReservaExterna.AlterarAuto:Boolean;
begin
  Result:=false;
  try
    edit;
    try
       CodigoPRD  := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
       CodigoPDV   := StrToInt(ECodigoPDV.Text);
    except
    end;
    try
       CodigoCNCREQ   := ECodigoCNCREQ.KeyValue;
    except
    end;
    try
       Quantidade       := StrToFloat(EQuantidade.Text);
    except
    end;
    try
       Observacao := EObservacao.Text;
    except
    end;
    try
       Data    := StrToDateTime(EData.Text);
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

procedure TReservaExterna.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled        := not Habilitar;
  Except
  End;
  Try
    ECodigoPRD.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoPDV.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoCNCREQ.Enabled  :=Habilitar;
  Except
  End;
  Try
    EObservacao.Enabled    :=Habilitar;
  Except
  End;
  Try
    EQuantidade.Enabled    :=Habilitar;
  Except
  End;
end;

procedure TReservaExterna.CancelaEdicao;
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

procedure TReservaExterna.CarregaDados;
begin
  Try
    ECodigoPDV.Text    :=IntToStr(CodigoPDV);
   Except
  End;
  Try
    ECodigoREX.Text    :=IntToStr(CodigoREX);
   Except
  End;
  Try
   ECodigoPRD.Text    :=IntToStr(CodigoPRD);
   Except
  End;
  Try
   ECodigoCNCREQ.KeyValue :=CodigoCNCREQ;
   Except
  End;
  Try
   EQuantidade.Text       :=Format('%.2f', [Quantidade]);
   Except
  End;
  Try
   EObservacao.Text       :=Observacao;
   Except
  End;
  Try
   If Data<>0 then
     EData.Text             :=FormatDateTime('dd/mm/yyyy hh:mm:ss',Data);
   Except
  End;
  try
    Case Situacao of
      0: ESituacao.Text := 'Reservado';
      1: ESituacao.Text := 'Liberado';
    end;
  Except
  end;
end;

constructor TReservaExterna.Create(AOwner: TComponent);
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

function TReservaExterna.Deletar(CdCNC,CdREX:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdREX,CdCNC)) Then
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

destructor TReservaExterna.Destroy;
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

function TReservaExterna.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem: string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem := '';
  if not VerificaFloatBranco(ECodigoPRD.Text) then
    mensagem := 'Código do Produto inválido!'+#13;
  if not VerificaFloatBranco(EQuantidade.Text) then
    mensagem := 'Quantidade inválida!'+#13;
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
        AfterScroll:=Aux;
        LocalizarCod(SCodigo,CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    else If Estado=2 then
    Begin
      cod:=codigoREX;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        AfterScroll:=Aux;
        LocalizarCod(cod, cdcnc);
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
  end;
end;

{ Insere um Cliente }
function TReservaExterna.Inserir(CdCNC,CdREX, CdPDV, CdPRD, CdCNCREQ, PSituacao: Integer; PObs:String;PQuant:Double):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdREX=0 then
    Cod    := ProximoCodigo('REX_CODIGO')
  else
    Cod    := CdREX;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     Insert;
     try
       CodigoREX    := Cod;
       CodigoCNC    := CDCNC;
       CodigoPRD    := CdPRD;
       CodigoPDV    := CdPDV;
       CodigoCNCREQ := CdCNCREQ;
       Situacao     := PSituacao;
       CodigoPRD    := CdPRD;
       Quantidade   := PQuant;
       Observacao   := PObs;
       try
         Post;
         GeraLog(2250,CdCNC,Cdrex,'I PRD:'+IntToStr(CdPRD)+' QTD:'+format('%.2f',[PQuant]));
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

function TReservaExterna.InserirAuto:Boolean;
var
  CdCNC, CdREX, CdPRD: integer;
  PQuant: Double;
begin
  result:=false;
  try
    CdCNC := CConfiguracao.CodigoCNC;
    CdREX := SCodigo;
    CdPRD := StrToInt(ECodigoPRD.Text);
    PQuant := StrToFloat(EQuantidade.Text);
    append;
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoREX := SCodigo;
    except
    end;
    try
       CodigoPRD  := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
       CodigoPDV   := StrToInt(ECodigoPDV.Text);
    except
    end;
    try
       CodigoCNCREQ   := ECodigoCNCREQ.KeyValue;
    except
    end;
    try
       Quantidade       := StrToFloat(EQuantidade.Text);
    except
    end;
    try
       Data    := StrToDateTime(EData.Text);
    except
    end;
    try
       Situacao    := 0;
    except
    end;
    try
       Observacao := EObservacao.Text;
    except
    end;
    try
      Post;
      GeraLog(2250,CdCNC,CdREX,'I PRD:'+IntToStr(CdPRD)+' QTD:'+format('%.2f',[PQuant]));
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Reserva Externa.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TReservaExterna.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoREX.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoPDV.Clear
    else
      ECodigoPDV.Text := '0';
  Except
  End;
  Try
    ECodigoPRD.Clear;
  Except
  End;
  Try
    ECodigoCNCREQ.KeyValue := -1;
  Except
  End;
  Try
    if Estado <> 1 then
      eData.Clear
    else
      EData.Text:=FormatDatetime('dd/mm/yyyy hh:mm:ss',CConfiguracao.DataHora);
  Except
  End;
  Try
    EQuantidade.Clear;
  Except
  End;
  Try
    ESituacao.Clear;
  Except
  End;
  Try
    EObservacao.Clear;
  Except
  End;
end;

{ Localiza um cliente }
function TReservaExterna.LocalizarCod(CdREX,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdREX<>CodigoREX) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;REX_CODIGO', vararrayof([CdCNC, CdREX]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TReservaExterna.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TReservaExterna.PreparaInsercao;
begin
  ProximoCodigo('REX_CODIGO');
  AtualizaControles(True);
  Estado:=1;
  LimpaCampos;
end;

function TReservaExterna.deletarauto:Boolean;
begin
  try
    Result := Delete;
    if TQuery(Self).isEmpty then
      LimpaCampos;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
