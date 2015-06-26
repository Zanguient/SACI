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
unit Tarefa;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, ComCtrls, 
     Variants;

type
  TTarefa = class(TSQuery)
    private
      { Private fields of TTarefa }
        { Storage for property CodigoOrigem }
        FCodigoOrigem : Integer;
        { Storage for property CodigoResponsavel }
        FCodigoResponsavel : Integer;
        { Storage for property CodigoTAR }
        FCodigoTAR : Integer;
        { Storage for property DataAgendado }
        FDataAgendado : TDateTime;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataFinal }
        FDataFinal : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoOrigem }
        FECodigoOrigem : TEdit;
        { Storage for property ECodigoResponsavel }
        FECodigoResponsavel : TEdit;
        { Storage for property ECodigoTAR }
        FECodigoTAR : TEdit;
        { Storage for property EDataAgendado }
        FEDataAgendado : TMonthCalendar;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataFinal }
        FEDataFinal : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EPeriodicidade }
        FEPeriodicidade : TComboBox;
        { Storage for property EPrioridade }
        FEPrioridade : TComboBox;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipo }
        FETipo : TDBLookupComboBox;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Periodicidade }
        FPeriodicidade : Integer;
        { Storage for property Prioridade }
        FPrioridade : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;

      { Private methods of TTarefa }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoOrigem }
        function GetCodigoOrigem : Integer;
        { Write method for property CodigoOrigem }
        procedure SetCodigoOrigem(Value : Integer);
        { Read method for property CodigoResponsavel }
        function GetCodigoResponsavel : Integer;
        { Write method for property CodigoResponsavel }
        procedure SetCodigoResponsavel(Value : Integer);
        { Read method for property CodigoTAR }
        function GetCodigoTAR : Integer;
        { Write method for property CodigoTAR }
        procedure SetCodigoTAR(Value : Integer);
        { Read method for property DataAgendado }
        function GetDataAgendado : TDateTime;
        { Write method for property DataAgendado }
        procedure SetDataAgendado(Value : TDateTime);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property DataFinal }
        function GetDataFinal : TDateTime;
        { Write method for property DataFinal }
        procedure SetDataFinal(Value : TDateTime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Periodicidade }
        function GetPeriodicidade : Integer;
        { Write method for property Periodicidade }
        procedure SetPeriodicidade(Value : Integer);
        { Read method for property Prioridade }
        function GetPrioridade : Integer;
        { Write method for property Prioridade }
        procedure SetPrioridade(Value : Integer);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);

    protected
      { Protected fields of TTarefa }

      { Protected methods of TTarefa }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TTarefa }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TTarefa }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CDTAR:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC,CdTAR,PTipo,PSituacao,PPeriodicidade, PPrioridade: integer; PDescricao:String;DTAgendado:TDateTime):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function LocalizarCod(CdTAR,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TTarefa }
        property CodigoOrigem : Integer
             read GetCodigoOrigem write SetCodigoOrigem;
        property CodigoResponsavel : Integer
             read GetCodigoResponsavel write SetCodigoResponsavel;
        property CodigoTAR : Integer read GetCodigoTAR write SetCodigoTAR;
        property DataAgendado : TDateTime
             read GetDataAgendado write SetDataAgendado;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataFinal : TDateTime read GetDataFinal write SetDataFinal;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoOrigem : TEdit
             read FECodigoOrigem write FECodigoOrigem;
        property ECodigoResponsavel : TEdit
             read FECodigoResponsavel write FECodigoResponsavel;
        property ECodigoTAR : TEdit read FECodigoTAR write FECodigoTAR;
        property EDataAgendado : TMonthCalendar
             read FEDataAgendado write FEDataAgendado;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataFinal : TMaskEdit read FEDataFinal write FEDataFinal;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EPeriodicidade : TComboBox
             read FEPeriodicidade write FEPeriodicidade;
        property EPrioridade : TComboBox read FEPrioridade write FEPrioridade;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipo : TDBLookupComboBox read FETipo write FETipo;
        property Observacao : String read GetObservacao write SetObservacao;
        property Periodicidade : Integer
             read GetPeriodicidade write SetPeriodicidade;
        property Prioridade : Integer read GetPrioridade write SetPrioridade;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTarefa with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTarefa]);
end;

{ Method to set variable and property values and create objects }
procedure TTarefa.AutoInitialize;
begin
     Estado := 0;
     FECodigoOrigem := nil;
     FECodigoResponsavel := nil;
     FECodigoTAR := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataFinal := nil;
     FEDescricao := nil;
     FEObservacao := nil;
     FEPeriodicidade := nil;
     FEPrioridade := nil;
     FESituacao := nil;
     FETipo := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TTarefa.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoOrigem then
        FECodigoOrigem := nil;
     if AComponent = FECodigoResponsavel then
        FECodigoResponsavel := nil;
     if AComponent = FECodigoTAR then
        FECodigoTAR := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataFinal then
        FEDataFinal := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEPeriodicidade then
        FEPeriodicidade := nil;
     if AComponent = FEPrioridade then
        FEPrioridade := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TTarefa.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoOrigem }
function TTarefa.GetCodigoOrigem : Integer;
begin
  try
    Result := Self.fieldByName('TAR_ORIGEM').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoOrigem }
procedure TTarefa.SetCodigoOrigem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TAR_ORIGEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TAR_ORIGEM"!');
    end;
end;

{ Read method for property CodigoResponsavel }
function TTarefa.GetCodigoResponsavel : Integer;
begin
  try
    Result := Self.fieldByName('TAR_RESPONSAVEL').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoResponsavel }
procedure TTarefa.SetCodigoResponsavel(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TAR_RESPONSAVEL').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TAR_RESPONSAVEL"!');
    end;
end;

{ Read method for property CodigoTAR }
function TTarefa.GetCodigoTAR : Integer;
begin
  try
    Result := Self.fieldByName('TAR_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTAR }
procedure TTarefa.SetCodigoTAR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TAR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TAR_CODIGO"!');
    end;
end;

{ Read method for property DataAgendado }
function TTarefa.GetDataAgendado : TDateTime;
begin
  try
    Result := Self.fieldByName('TAR_DT_AGENDADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAgendado }
procedure TTarefa.SetDataAgendado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TAR_DT_AGENDADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TAR_DT_AGENDADO"!');
  end;
end;

{ Read method for property DataAlterado }
function TTarefa.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('TAR_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TTarefa.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TAR_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TAR_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TTarefa.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('TAR_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TTarefa.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TAR_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TAR_DT_CADASTRO"!');
  end;
end;

{ Read method for property DataFinal }
function TTarefa.GetDataFinal : TDateTime;
begin
  try
    Result := Self.fieldByName('TAR_DT_FINAL').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataFinal }
procedure TTarefa.SetDataFinal(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TAR_DT_FINAL').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TAR_DT_FINAL"!');
  end;
end;

{ Read method for property Descricao }
function TTarefa.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('TAR_DESCRICAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Descricao }
procedure TTarefa.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TAR_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TAR_DESCRICAO"!');
  end;
end;

{ Read method for property Observacao }
function TTarefa.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('TAR_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TTarefa.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TAR_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TAR_OBSERVACAO"!');
  end;
end;

{ Read method for property Periodicidade }
function TTarefa.GetPeriodicidade : Integer;
begin
  try
    Result := Self.fieldByName('TAR_PERIODICIDADE').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Periodicidade }
procedure TTarefa.SetPeriodicidade(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TAR_PERIODICIDADE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TAR_PERIODICIDADE"!');
    end;
end;

{ Read method for property Prioridade }
function TTarefa.GetPrioridade : Integer;
begin
  try
    Result := Self.fieldByName('TAR_PRIORIDADE').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Prioridade }
procedure TTarefa.SetPrioridade(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TAR_PRIORIDADE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TAR_PRIORIDADE"!');
    end;
end;

{ Read method for property Situacao }
function TTarefa.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('TAR_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TTarefa.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TAR_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TAR_SITUACAO"!');
    end;
end;

{ Read method for property Tipo }
function TTarefa.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('TAR_TIPO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Tipo }
procedure TTarefa.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TAR_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TAR_TIPO"!');
    end;
end;

function TTarefa.AlterarAuto:Boolean;
begin
  Result:=false;
  try
    edit;
    try
       Descricao  := EDescricao.Text;
    except
    end;
    try
       CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
       CodigoResponsavel  := StrToInt(ECodigoResponsavel.Text);
    except
    end;
    try
       DataAlterado  := CConfiguracao.DataHora;
    except
    end;
    try
       DataFinal  := StrToDate(EDataFinal.Text);
    except
    end;
    try
       Tipo := ETipo.KeyValue;
    except
    end;
    try
       Periodicidade := EPeriodicidade.ItemIndex;
    except
    end;
    try
       Prioridade := EPrioridade.ItemIndex;
    except
    end;
    try
       Situacao := ESituacao.ItemIndex;
    except
    end;
    try
       Observacao := EObservacao.Text;
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

procedure TTarefa.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    EDataAgendado.Enabled     :=not Habilitar;
  except
  end;
  try
    if not Habilitar then
      EDataFinal.Enabled     := False;
  except
  end;
  try
    ECodigoResponsavel.Enabled     :=Habilitar;
  except
  end;
  try
    EDescricao.Enabled        :=Habilitar;
  except
  end;
  try
    ETipo.Enabled           :=Habilitar;
  except
  end;
  try
    EPrioridade.Enabled       :=Habilitar;
  except
  end;
  try
    EPeriodicidade.Enabled    :=Habilitar;
  except
  end;
  try
    ESituacao.Enabled         :=Habilitar;
  except
  end;
  try
    EObservacao.Enabled        :=Habilitar;
  except
  end;
end;

procedure TTarefa.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TTarefa.CarregaDados;
begin
  try
    ECodigoTAR.Text       := IntToStr(CodigoTAR);
  except
  end;
  try
    ECodigoOrigem.Text       := IntToStr(CodigoOrigem);
  except
  end;
  try
    ECodigoResponsavel.Text       := IntToStr(CodigoResponsavel);
  except
  end;
  try
    EDescricao.Text       := Descricao;
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    if DataFinal > 0 then
      EDataFinal.Text := formatDateTime('dd/mm/yyyy',DataFinal)
    else
      EDataFinal.Clear;
  except
  end;
  try
    ETipo.KeyValue     := Tipo;
  except
  end;
  try
    EPeriodicidade.ItemIndex  := Periodicidade;
  except
  end;
  try
    EPrioridade.ItemIndex := Prioridade;
  except
  end;
  try
    ESituacao.ItemIndex  := Situacao;
  except
  end;
  try
    EObservacao.Text  := Observacao;
  except
  end;
end;

constructor TTarefa.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'TABELA';

     { Code to perform other tasks when the component is created }

end;

function TTarefa.Deletar(CdCNC,CDTAR:Integer):Boolean;
begin
  result := false;
  If not(localizarCod(CdTAR,CdCNC)) Then
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

destructor TTarefa.Destroy;
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

function TTarefa.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem : string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem := '';
  if EDescricao.Text = '' then
    mensagem := mensagem + 'Descrição inválida!'+#13;
  if not VerificaDataBranco(EDataFinal.Text) then
    mensagem := mensagem + 'Data Final inválida!'+#13;
  if not VerificaInteiroBranco(ECodigoResponsavel.Text) then
    mensagem := mensagem + 'Código do Responsável inválido!'+#13;
  if not VerificaInteiroBranco(ECodigoOrigem.Text) then
    mensagem := mensagem + 'Código de Origem inválido!'+#13;
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
        LocalizarCod(SCodigo,CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoTAR;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    end;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Cliente }
function TTarefa.Inserir(CdCNC,CdTAR,PTipo,PSituacao,PPeriodicidade, PPrioridade: integer; PDescricao:String;DTAgendado:TDateTime):boolean;
begin
  result := false;
  Insert;
  if CdTAR=0 then
    CodigoTAR    := ProximoCodigo('TAR_CODIGO')
  else
    CodigoTAR    := CdTAR;
  try
    CodigoCNC      := CdCNC;
    CodigoUSU      := CConfiguracao.CodigoUSU;
    DataCadastro   := CConfiguracao.DataHora;
    Descricao      := PDescricao;
    Situacao       := PSituacao;
    Tipo           := PTipo;
    Prioridade     := PPrioridade;
    Periodicidade  := PPeriodicidade;
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

function TTarefa.InserirAuto:Boolean;
var
  CdTAR, i, iQtdRepeticoes: integer;
  vDtAgendado: TDateTime;
begin
  result:=false;
  iQtdRepeticoes := CalculaRepeticoes(EPeriodicidade.ItemIndex, EDataAgendado.Date, StrToDate(EDataFinal.Text));
  CdTAR          := StrToInt(ECodigoTAR.Text);
  vDtAgendado    := EDataAgendado.Date;
  for i:=1 to iQtdRepeticoes do
  Begin
    if i > 1 then
    Begin
      CdTAR       := ProximoCodigo('TAR_CODIGO');
      vDtAgendado := ProximaRepeticao(EPeriodicidade.ItemIndex, vDtAgendado);
    end;
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO TAREFA '+
        '(CNC_ORIGEM, CNC_CODIGO, TAR_CODIGO, TAR_ORIGEM, USU_CODIGO '+
        ',TAR_RESPONSAVEL, TAR_DT_CADASTRO, TAR_DT_AGENDADO, TAR_DT_FINAL '+
        ',TAR_TIPO, TAR_DESCRICAO, TAR_PERIODICIDADE, TAR_PRIORIDADE '+
        ',TAR_SITUACAO,TAR_OBSERVACAO) VALUES '+
        '( '+IntToStr(CentroDeCusto)+
        ', '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(CdTAR)+
        ', '+ECodigoOrigem.Text+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ', '+ECodigoResponsavel.Text+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ',"'+MesDia(vDtAgendado)+'" '+
        ',"'+MesDia(EDataFinal.Text)+'" '+
        ', '+IntToStr(ETipo.KeyValue)+
        ',"'+EDescricao.Text+'" '+
        ', '+IntToStr(EPeriodicidade.ItemIndex)+
        ', '+IntToStr(EPrioridade.ItemIndex)+
        ', '+IntToStr(ESituacao.ItemIndex)+
        ',"'+EObservacao.Text+'") ');
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente!');
    End;
  end;
end;

procedure TTarefa.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoTAR.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoOrigem.Clear
    else
      ECodigoOrigem.Text := IntToStr(SCodigo);
  except
  end;
  try
    if Estado <> 1 then
      ECodigoResponsavel.Clear
    else
      ECodigoResponsavel.Text := IntToStr(CConfiguracao.CodigoUSU);
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;  
  try
    if Estado <> 1 then
      EDataFinal.Clear
    else
      EDataFinal.Text := formatDateTime('dd/mm/yyyy',EDataAgendado.Date);
  except
  end;
  try
    if Estado <> 1 then
      EPeriodicidade.ItemIndex := -1
    else
      EPeriodicidade.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      ETipo.KeyValue := 0;
  except
  end;
  try
    if Estado <> 1 then
      EPrioridade.ItemIndex := -1
    else
      EPrioridade.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 1;
  except
  end;  
  try
    EObservacao.Clear;
  except
  end;
end;

function TTarefa.LocalizarCod(CdTAR,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdTAR<>CodigoTAR) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;TAR_CODIGO', vararrayof([CdCNC, CdTAR]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TTarefa.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TTarefa.PreparaInsercao;
begin
  ProximoCodigo('TAR_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TTarefa.deletarauto:Boolean;
var
  CdCNC, CdTAR:integer;
begin
  result := false;
  try
    CdCNC:=CodigoCNC;
    CdTAR:=CodigoTAR;
    if Delete then
    Begin
      result:=true;
      GeraLog(4570,CdCNC,CdTAR,'Excluido');
    end;
    if isEmpty then
      LimpaCampos;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
