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
unit Parametro;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, TipoParam, Dbctrls, Configuracao, Dbgrids, Variants, 
     Funcoes;

type
  TParametro = class(TSQuery)
    private
      { Private fields of TParametro }
        { Storage for property CodigoPAR }
        FCodigoPAR : Integer;
        { Storage for property CodigoTPR }
        FCodigoTPR : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoPAR }
        FECodigoPAR : TEdit;
        { Storage for property ECodigoTPR }
        FECodigoTPR : TDBLookupComboBox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EInformacao }
        FEInformacao : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipoParam }
        FETipoParam : TTipoParam;
        { Storage for property Informacao }
        FInformacao : Integer;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TParametro }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoPAR }
        function GetCodigoPAR : Integer;
        { Write method for property CodigoPAR }
        procedure SetCodigoPAR(Value : Integer);
        { Read method for property CodigoTPR }
        function GetCodigoTPR : Integer;
        { Write method for property CodigoTPR }
        procedure SetCodigoTPR(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Informacao }
        function GetInformacao : Integer;
        { Write method for property Informacao }
        procedure SetInformacao(Value : Integer);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TParametro }

      { Protected methods of TParametro }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TParametro }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TParametro }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdPAR:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Parametro }
        function Inserir(CdPAR,CdTPR: integer; PDescricao: String; PInformacao:integer=0; PObs:string=''):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Parametro }
        function LocalizarCod(CdPAR:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TParametro }
        property CodigoPAR : Integer read GetCodigoPAR write SetCodigoPAR;
        { Código do Tipo de Parametro }
        property CodigoTPR : Integer read GetCodigoTPR write SetCodigoTPR;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoPAR : TEdit read FECodigoPAR write FECodigoPAR;
        property ECodigoTPR : TDBLookupComboBox
             read FECodigoTPR write FECodigoTPR;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EInformacao : TEdit read FEInformacao write FEInformacao;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipoParam : TTipoParam read FETipoParam write FETipoParam;
        property Informacao : Integer read GetInformacao write SetInformacao;
        property Observacao : String read GetObservacao write SetObservacao;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TParametro with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TParametro]);
end;

{ Method to set variable and property values and create objects }
procedure TParametro.AutoInitialize;
begin
     Estado := 0;
     FECodigoPAR := nil;
     FECodigoTPR := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDescricao := nil;
     FEInformacao := nil;
     FEObservacao := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TParametro.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoPAR then
        FECodigoPAR := nil;
     if AComponent = FECodigoTPR then
        FECodigoTPR := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEInformacao then
        FEInformacao := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TParametro.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoPAR }
function TParametro.GetCodigoPAR : Integer;
begin
  try
    Result := Self.fieldByName('PAR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPAR }
procedure TParametro.SetCodigoPAR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PAR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PAR_CODIGO"!');
    end;
end;

{ Read method for property CodigoTPR }
function TParametro.GetCodigoTPR : Integer;
begin
  try
    Result := Self.fieldByName('TPR_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTPR }
procedure TParametro.SetCodigoTPR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPR_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TParametro.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('PAR_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TParametro.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PAR_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PAR_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TParametro.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('PAR_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TParametro.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PAR_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PAR_DT_CADASTRO"!');
    end;
end;

{ Read method for property Descricao }
function TParametro.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('PAR_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TParametro.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PAR_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PAR_DESCRICAO"!');
  end;
end;

{ Read method for property Informacao }
function TParametro.GetInformacao : Integer;
begin
  try
    Result := Self.fieldByName('PAR_INFORMACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Informacao }
procedure TParametro.SetInformacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PAR_INFORMACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PAR_INFORMACAO"!');
  end;
end;

{ Read method for property Observacao }
function TParametro.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('PAR_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TParametro.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PAR_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PAR_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TParametro.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('PAR_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TParametro.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PAR_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PAR_SITUACAO"!');
  end;
end;

function TParametro.AlterarAuto:Boolean;
var
  CdCNC, CdPAR: integer;
  sDetalhe: string;
begin
  Result:=False;
  CdCNC := CodigoCNC;
  CdPAR := CodigoPAR;
  sDetalhe := '';
  try
    edit;
    try
      CodigoTPR  := ECodigoTPR.KeyValue;
      sDetalhe := sDetalhe + 'TPR:'+IntToStr(ECodigoTPR.KeyValue);
    except
    end;
    try
      Descricao  := EDescricao.Text;
      sDetalhe := sDetalhe + ' Desc:'+EDescricao.Text;
    except
    end;
    try
      DataAlterado  := CConfiguracao.DataHora;
    except
    end;
    try
      Informacao  := StrToInt(EInformacao.Text);
      sDetalhe := sDetalhe + ' Inf:'+EInformacao.Text;
    except
    end;
    try
      Situacao  := ESituacao.ItemIndex;
      if ESituacao.ItemIndex = 0 then
        sDetalhe := sDetalhe + ' Ativado'
      else
        sDetalhe := sDetalhe + ' Desativado';
    except
    end;
    try
      Observacao  := EObservacao.Text;
      sDetalhe := sDetalhe + ' OBS:'+EObservacao.Text;
    except
    end;
    try
      Post;
      GeraLog(560, CdCNC, CdPAR, sDetalhe);
      Result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TParametro.AtualizaControles(Habilitar:Boolean);
begin
 Try
   EDbgrid.Enabled           :=not Habilitar;
 except
 end;
 try
   ECodigoTPR.Enabled     :=not Habilitar;
 except
 end;
 try
   EDescricao.Enabled     :=Habilitar;
 except
 end;
 try
   EInformacao.Enabled     :=Habilitar;
 except
 end; 
 try
   ESituacao.Enabled      :=Habilitar;
 except
 end;
 try
   EObservacao.Enabled     :=Habilitar;
 except
 end; 
end;

procedure TParametro.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TParametro.CarregaDados;
begin
  try
    ECodigoPAR.Text           :=IntToStr(CodigoPAR);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text  :=formatDateTime('DD/MM/YYYY HH:MM',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text  :=formatDateTime('DD/MM/YYYY HH:MM',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    EInformacao.Text           :=IntToStr(Informacao);
  except
  end;
  try
    ESituacao.ItemIndex   := Situacao;
  except
  end;
  try
    EObservacao.Text           :=Observacao;
  except
  end;
end;

constructor TParametro.Create(AOwner: TComponent);
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

function TParametro.Deletar(CdPAR:Integer):Boolean;
begin
  Result := True;
  If not(localizarCod(CdPAR)) Then
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

destructor TParametro.Destroy;
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

function TParametro.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if Trim(EDescricao.Text) = '' then
    mensagem := mensagem + 'Descrição inválida!'+#13;
  if not VerificaInteiroBranco(EInformacao.Text) then
    mensagem := mensagem + 'Informação tem que ser inteiro!'+#13;
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
        LocalizarCod(SCodigo);
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoPAR;
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
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

{ Insere um Parametro }
function TParametro.Inserir(CdPAR,CdTPR: integer; PDescricao: String; PInformacao:integer=0; PObs:string=''):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdPAR=0 then
    Cod    := ProximoCodigo('PAR_CODIGO')
  else
    Cod    := CdPAR;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     result := true;
     Insert;
     try
       CodigoPAR      := Cod;
       CodigoCNC      := CConfiguracao.CodigoCNC;
       CodigoTPR      := CdTPR;
       DataCadastro   := CConfiguracao.DataHora;
       Descricao      := PDescricao;
       Informacao     := PInformacao;
       Situacao       := 0;
       Observacao     := PObs;

       try
         Post;

       except
         Cancel;
         ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
       end;
     except
       ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TParametro.InserirAuto:Boolean;
var
  CdCNC, CdPAR: integer;
  sDetalhe: string;
begin
  result:=False;
  CdCNC := CConfiguracao.CodigoCNC;
  CdPAR := SCodigo;
  sDetalhe := '';
  try
    append;
    try
      CodigoPAR   := SCodigo;
    except
    end;
    try
      codigocnc   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoTPR  := ECodigoTPR.KeyValue;
      sDetalhe := sDetalhe + 'TPR:'+IntToStr(ECodigoTPR.KeyValue);
    except
    end;
    try
      Descricao  := EDescricao.Text;
      sDetalhe := sDetalhe + ' Desc:'+EDescricao.Text;
    except
    end;
    try
      DataCadastro  := CConfiguracao.DataHora;
    except
    end;
    try
      Informacao  := StrToInt(EInformacao.Text);
      sDetalhe := sDetalhe + ' Informacao:'+EInformacao.Text;
    except
    end;
    try
      Situacao  := ESituacao.ItemIndex;
      if ESituacao.ItemIndex = 0 then
        sDetalhe := sDetalhe + ' Ativado'
      else
        sDetalhe := sDetalhe + ' Desativado';
    except
    end;
    try
      Observacao  := EObservacao.Text;
      sDetalhe := sDetalhe + ' OBS:'+EObservacao.Text;
    except
    end;
    try
      Post;
      GeraLog(540, CdCNC, CdPAR, sDetalhe);
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TParametro.LimpaCampos;
begin
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text  :=formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
  try
    if Estado <> 1 then
      ECodigoPAR.Clear;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EInformacao.Clear
    else
      EInformacao.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 0;
  except
  end;
  try
    EObservacao.Clear;
  except
  end;
end;

{ Localiza um Parametro }
function TParametro.LocalizarCod(CdPAR:Integer):Boolean;
begin
  If (CdPAR<>CodigoPAR) Then
    If locate('PAR_CODIGO', CdPAR, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TParametro.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>Descricao Then
    If locate('PAR_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TParametro.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TParametro.PreparaInsercao;
begin
  ProximoCodigo('PAR_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TParametro.deletarauto:Boolean;
var
  CdCNC, CdPAR: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdPAR := CodigoPAR;
  sDetalhe := 'TPR:'+IntToStr(CodigoTPR)+
              ' Desc:'+Descricao+
              ' OBS:'+Observacao;
  try
    if Delete then
    Begin
      result:=true;
      GeraLog(550,CdCNC,CdPAR,sDetalhe);
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
