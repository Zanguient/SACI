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
unit Manufaturado;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TManufaturado = class(TSQuery)
    private
      { Private fields of TManufaturado }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoMFA }
        FCodigoMFA : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoMFA }
        FECodigoMFA : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoUSU }
        FECodigoUSU : TDBLookupComboBox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EEntradaSaida }
        FEEntradaSaida : TComboBox;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property EntradaSaida }
        FEntradaSaida : Integer;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TManufaturado }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoMFA }
        function GetCodigoMFA : Integer;
        { Write method for property CodigoMFA }
        procedure SetCodigoMFA(Value : Integer);
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
        { Read method for property EntradaSaida }
        function GetEntradaSaida : Integer;
        { Write method for property EntradaSaida }
        procedure SetEntradaSaida(Value : Integer);
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
      { Protected fields of TManufaturado }

      { Protected methods of TManufaturado }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TManufaturado }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TManufaturado }
        { Altera uma Desconto }
        function Alterar(CdCNC,CdMFA,CdPRD,PES,PSituacao: integer; DTAlterado:TDateTime;PQuantidade:real):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdMFA:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Desconto }
        function Inserir(CdCNC,CdMFA,CdPRD,PES,PSituacao: integer; DTCadastro:TDateTime;PQuantidade:real):boolean;
        function InserirAuto:Boolean;
        { Localiza um Manufaturado }
        function LocalizarCod(CdMFA,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TManufaturado }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Grupo de Consórcio }
        property CodigoMFA : Integer read GetCodigoMFA write SetCodigoMFA;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoMFA : TEdit read FECodigoMFA write FECodigoMFA;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoUSU : TDBLookupComboBox
             read FECodigoUSU write FECodigoUSU;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EEntradaSaida : TComboBox
             read FEEntradaSaida write FEEntradaSaida;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property EntradaSaida : Integer
             read GetEntradaSaida write SetEntradaSaida;
        property Observacao : String read GetObservacao write SetObservacao;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TManufaturado with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TManufaturado]);
end;

{ Method to set variable and property values and create objects }
procedure TManufaturado.AutoInitialize;
begin
     Estado := 0;
     FECodigoMFA := nil;
     FECodigoPRD := nil;
     FECodigoUSU := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEEntradaSaida := nil;
     FEObservacao := nil;
     FEQuantidade := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TManufaturado.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoMFA then
        FECodigoMFA := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoUSU then
        FECodigoUSU := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEEntradaSaida then
        FEEntradaSaida := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TManufaturado.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TManufaturado.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TManufaturado.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoMFA }
function TManufaturado.GetCodigoMFA : Integer;
begin
  try
    Result := Self.fieldByName('MFA_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoMFA }
procedure TManufaturado.SetCodigoMFA(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MFA_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MFA_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TManufaturado.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TManufaturado.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TManufaturado.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TManufaturado.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TManufaturado.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('MFA_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TManufaturado.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MFA_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MFA_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TManufaturado.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('MFA_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TManufaturado.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MFA_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MFA_DT_CADASTRO"!');
  end;
end;

{ Read method for property EntradaSaida }
function TManufaturado.GetEntradaSaida : Integer;
begin
  try
    Result := Self.fieldByName('MFA_ES').asInteger;
  except
    result:= -1
  end;
end;

{ Write method for property EntradaSaida }
procedure TManufaturado.SetEntradaSaida(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MFA_ES').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MFA_ES"!');
  end;
end;

{ Read method for property Observacao }
function TManufaturado.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('MFA_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Observacao }
procedure TManufaturado.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MFA_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MFA_OBSERVACAO"!');
  end;
end;

{ Read method for property Quantidade }
function TManufaturado.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('MFA_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TManufaturado.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MFA_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MFA_QUANTIDADE"!');
    end;
end;

{ Read method for property Situacao }
function TManufaturado.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('MFA_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TManufaturado.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MFA_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MFA_SITUACAO"!');
    end;
end;

{ Altera uma Desconto }
function TManufaturado.Alterar(CdCNC,CdMFA,CdPRD,PES,PSituacao: integer; DTAlterado:TDateTime;PQuantidade:real):boolean;
begin
  result := False;
  If not(localizarCod(CdMFA,CdCNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      CodigoPRD      := cdPRD;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      Situacao       := PSituacao;
      DataAlterado   := DTAlterado;
      Quantidade     := PQuantidade;
      EntradaSaida   := PES;
      try
        Post;
        Result := True;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TManufaturado.AlterarAuto:Boolean;
var
  MFA:integer;
begin
  Result := False;
  MFA:=StrToInt(ECodigoMFA.Text);
  try
    edit;
    try
      CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      Quantidade := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      EntradaSaida := EEntradaSaida.ItemIndex;
    except
    end;
    try
      DataAlterado := StrToDateTime(EDataAlterado.Text);
    except
    end;
    try
      Post;
      Result:=True;
      GeraLog(3850,CConfiguracao.CodigoCNC,MFA);
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TManufaturado.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EDbgrid.Enabled          :=not Habilitar;
  except
  end;
  try
    ECodigoPRD.Enabled       :=Habilitar;
  except
  end;
  try
    EEntradaSaida.Enabled       :=Habilitar;
  except
  end;
  try
    ESituacao.Enabled        :=Habilitar;
  except
  end;
  try
    EQuantidade.Enabled      :=Habilitar;
  except
  end;
end;

procedure TManufaturado.CancelaEdicao;
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

procedure TManufaturado.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 try
   ECodigoMFA.Text           :=IntToStr(CodigoMFA);
 except
 end;
 try
   ECodigoPRD.Text        :=IntToStr(CodigoPRD);
 except
 end;
 try
   ECodigoUSU.KeyValue        :=CodigoUSU;
 except
 end;
 try
   if DataCadastro=0 then
     EDataCadastro.Clear
   else
     EDataCadastro.Text          :=FormatDateTime('dd/mm/yyyy', DataCadastro);
   except
 end;
 try
   if DataAlterado=0 then
     EDataAlterado.Clear
   else
     EDataAlterado.Text          :=FormatDateTime('dd/mm/yyyy', DataAlterado);
 except
 end;
 try
   EQuantidade.Text :=format('%.2f',[Quantidade]);
 except
 end;
 try
   EEntradaSaida.itemIndex :=EntradaSaida;
 except
 end;
 try
   case situacao of
     0:ESituacao.Text:='Criado';
     1:ESituacao.Text:='Processado';
   end;
 except
 end;
end;

constructor TManufaturado.Create(AOwner: TComponent);
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

function TManufaturado.Deletar(CdCNC,CdMFA:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdMFA,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        begin
          try
            ECodigoMFA.Clear;
          except
          end;
          try
            ECodigoPRD.Clear;
          except
          end;
          try
            ECodigoUSU.KeyValue := 0;
          except
          end;
          try
            EQuantidade.Clear;
          except
          end;
          try
            EEntradaSaida.itemIndex:=-1;
          except
          end;
          try
            EDataCadastro.Clear;
          except
          end;
          try
            EDataAlterado.Clear;
          except
          end;
          try
            ESituacao.Clear;
          except
          end;
        end;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TManufaturado.Destroy;
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

function TManufaturado.FinalizaEdicao:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    mensagem:=mensagem+'Produto incorreto!'+#13;
  if not VerificaFloatBranco(EQuantidade.Text) then
    mensagem:=mensagem+'Quantidade incorreto!'+#13;
  If mensagem <>'' Then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
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
        LocalizarCod(SCodigo,CConfiguracao.CodigoCNC);
        CarregaDados;
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoMFA;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod,CConfiguracao.CodigoCNC);
        CarregaDados;
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=aux;
  end;
end;

{ Insere um Desconto }
function TManufaturado.Inserir(CdCNC,CdMFA,CdPRD,PES,PSituacao: integer; DTCadastro:TDateTime;PQuantidade:real):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdMFA=0 then
    Cod    := ProximoCodigo('MFA_CODIGO')
  else
    Cod      := CdMFA;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     if Estado=3 then
     begin
       result:=true;
       exit;
     end;
     Insert;
     try
       CodigoMFA      := Cod;
       CodigoPRD      := CdPRD;
       CodigoUSU      := CConfiguracao.CodigoUSU;
       Situacao       := PSituacao;
       DataCadastro   := DTCadastro;
       Quantidade     := PQuantidade;
       EntradaSaida   := PES;

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

function TManufaturado.InserirAuto:Boolean;
begin
  result:=false;
  try
    append;
    try
      CodigoMFA   := SCodigo;
    except
    end;
    try
      CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      CodigoPRD   := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      Quantidade  := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      EntradaSaida  := EEntradaSaida.ItemIndex;
    except
    end;
    try
      DataCadastro := StrToDateTime(EDataCadastro.Text);
    except
    end;
    Situacao:=0;
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

{ Localiza um Manufaturado }
function TManufaturado.LocalizarCod(CdMFA,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDMFA<>CodigoMFA) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;MFA_CODIGO', vararrayof([CdCNC, CdMFA]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TManufaturado.PreparaAlteracao;
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

procedure TManufaturado.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 ProximoCodigo('MFA_CODIGO');
 try
   ECodigoPRD.Clear;
 except
 end;
 try
   ECodigoUSU.KeyValue := CConfiguracao.CodigoUSU;
 except
 end;
 try
   EQuantidade.Clear;
 except
 end;
 try
   EEntradaSaida.ItemIndex:=0;
 except
 end;
 try
   EDataCadastro.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
 except
 end;
 try
   ESituacao.Clear;
 except
 end;
  AtualizaControles(True);
  Estado:=1;
end;

function TManufaturado.deletarauto:Boolean;
var
  MFA:integer;
begin
  Result := False;
  try
    MFA:=CodigoMFA;
    if Delete then
    Begin
      result:=true;
      GeraLog(3850,CConfiguracao.CodigoCNC,MFA);
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
