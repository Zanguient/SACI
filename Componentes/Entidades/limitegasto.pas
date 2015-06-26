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
unit LimiteGasto;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, 
     Funcoes;

type
  TLimiteGasto = class(TSQuery)
    private
      { Private fields of TLimiteGasto }
        { Storage for property CodigoCCX }
        FCodigoCCX : Integer;
        { Storage for property CodigoLMG }
        FCodigoLMG : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoCCX }
        FECodigoCCX : TDBLookupComboBox;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoLMG }
        FECodigoLMG : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property ELimiteMensal }
        FELimiteMensal : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property LimiteMensal }
        FLimiteMensal : Double;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TLimiteGasto }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCCX }
        function GetCodigoCCX : Integer;
        { Write method for property CodigoCCX }
        procedure SetCodigoCCX(Value : Integer);
        { Read method for property CodigoLMG }
        function GetCodigoLMG : Integer;
        { Write method for property CodigoLMG }
        procedure SetCodigoLMG(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property LimiteMensal }
        function GetLimiteMensal : Double;
        { Write method for property LimiteMensal }
        procedure SetLimiteMensal(Value : Double);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TLimiteGasto }

      { Protected methods of TLimiteGasto }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TLimiteGasto }

      { Public methods of TLimiteGasto }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdLMG:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grupo }
        function LocalizarCod(CdLMG:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TLimiteGasto }
        property CodigoCCX : Integer read GetCodigoCCX write SetCodigoCCX;
        { Código do Grupo }
        property CodigoLMG : Integer read GetCodigoLMG write SetCodigoLMG;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoCCX : TDBLookupComboBox
             read FECodigoCCX write FECodigoCCX;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoLMG : TEdit read FECodigoLMG write FECodigoLMG;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property ELimiteMensal : TEdit
             read FELimiteMensal write FELimiteMensal;
        property EOBS : TEdit read FEOBS write FEOBS;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property LimiteMensal : Double
             read GetLimiteMensal write SetLimiteMensal;
        property OBS : String read GetOBS write SetOBS;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TLimiteGasto with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TLimiteGasto]);
end;

{ Method to set variable and property values and create objects }
procedure TLimiteGasto.AutoInitialize;
begin
     FECodigoCCX := nil;
     FECodigoCNC := nil;
     FECodigoLMG := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FELimiteMensal := nil;
     FEOBS := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TLimiteGasto.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCCX then
        FECodigoCCX := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoLMG then
        FECodigoLMG := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FELimiteMensal then
        FELimiteMensal := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TLimiteGasto.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCCX }
function TLimiteGasto.GetCodigoCCX : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCCX }
procedure TLimiteGasto.SetCodigoCCX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_CODIGO"!');
    end;
end;

{ Read method for property CodigoLMG }
function TLimiteGasto.GetCodigoLMG : Integer;
begin
  try
    Result := Self.fieldByName('LMG_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoLMG }
procedure TLimiteGasto.SetCodigoLMG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LMG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LMG_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TLimiteGasto.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('LMG_DT_ALTERADO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TLimiteGasto.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LMG_DT_ALTERADO').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LMG_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TLimiteGasto.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('LMG_DT_CADASTRO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TLimiteGasto.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LMG_DT_CADASTRO').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LMG_DT_CADASTRO"!');
  end;
end;

{ Read method for property LimiteMensal }
function TLimiteGasto.GetLimiteMensal : Double;
begin
  try
    Result := Self.fieldByName('LMG_LIMITE_MENSAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property LimiteMensal }
procedure TLimiteGasto.SetLimiteMensal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LMG_LIMITE_MENSAL').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LMG_LIMITE_MENSAL"!');
  end;
end;

{ Read method for property OBS }
function TLimiteGasto.GetOBS : String;
begin
  try
    Result := Self.fieldByName('LMG_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property OBS }
procedure TLimiteGasto.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LMG_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LMG_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TLimiteGasto.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('LMG_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TLimiteGasto.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LMG_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LMG_SITUACAO"!');
  end;
end;

function TLimiteGasto.AlterarAuto:Boolean;
var
  CdCNC, CdLMG: integer;
  sDetalhes: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdLMG := CodigoLMG;
  sDetalhes := ' LIMITE POR CENTRO ';
  try
    edit;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      LimiteMensal    := StrToFloat(ELimiteMensal.Text);
      sDetalhes := sDetalhes+' LimMensal:'+ELimiteMensal.Text;
    except
    end;
    try
      Situacao     := ESituacao.ItemIndex;
      sDetalhes := sDetalhes+' Sit:'+IntToStr(ESituacao.ItemIndex);
    except
    end;
    try
       OBS := EOBS.Text;
       sDetalhes := sDetalhes+' OBS:'+EOBS.Text;
    except
    end;
    try
      Post;
      GeraLog(960, CdCNC, CdLMG, sDetalhes);
      Result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TLimiteGasto.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    ECodigoCNC.Enabled        :=not Habilitar;
  except
  end;
  Try
    ECodigoCCX.Enabled        :=not Habilitar;
  except
  end;
  try
    ELimiteMensal.Enabled        :=Habilitar;
  except
  end;
  try
    EOBS.Enabled                :=Habilitar;
  except
  end;
end;

procedure TLimiteGasto.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TLimiteGasto.CarregaDados;
begin
  Try
    ECodigoLMG.Text           :=IntToStr(CodigoLMG);
  except
  end;
  try
    ELimiteMensal.Text           := Format('%.2f',[LimiteMensal]);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    ESituacao.ItemIndex     := Situacao;
  except
  end;
  try
    EOBS.Text                 :=OBS;
  except
  end;
end;

constructor TLimiteGasto.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'LIMITE_GASTO';

     { Code to perform other tasks when the component is created }

end;

function TLimiteGasto.Deletar(CdLMG:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdLMG)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      If Delete then
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

destructor TLimiteGasto.Destroy;
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

function TLimiteGasto.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  if ECodigoCNC.Text = '' then
    mensagem:=mensagem+'Centro de Custo inválido!'+#13;
  if ECodigoCCX.Text = '' then
    mensagem:=mensagem+'Conta de Caixa inválida!'+#13;
  If not VerificaFloatBranco(ELimiteMensal.Text) then
    mensagem:=mensagem+'Limite Mensal inválido!'+#13;
  If mensagem <> '' then
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
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoLMG;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TLimiteGasto.InserirAuto:Boolean;
var
  CdCNC, CdLMG: integer;
  sDetalhes: string;
begin
  result:=false;
  CdCNC := ECodigoCNC.KeyValue;
  CdLMG := sCodigo;
  sDetalhes := '';
  try
    append;
    try
      CodigoLMG   := CdLMG;
    except
    end;
    try
      CNCOrigem   := CentroDeCusto;
    except
    end;
    try
      codigocnc   := CdCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      CodigoCCX := ECodigoCCX.KeyValue;
      sDetalhes := sDetalhes+' CCX:'+IntToStr(ECodigoCCX.KeyValue);
    except
    end;
    try
      LimiteMensal := StrToFloat(ELimiteMensal.Text);
      sDetalhes := sDetalhes+'LimMensal:'+ELimiteMensal.Text;
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      Situacao     := ESituacao.ItemIndex;
       sDetalhes := sDetalhes+' Sit:'+IntToStr(ESituacao.ItemIndex);
    except
    end;
    try
       OBS  := EOBS.Text;
       sDetalhes := sDetalhes+' OBS:'+EOBS.Text;
    except
    end;
    try
      Post;
      GeraLog(940, CdCNC, CdLMG, sDetalhes);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;


procedure TLimiteGasto.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoLMG.Clear
    else
      ECodigoLMG.Text := IntToStr(SCodigo);
  except
  end;
  try
    ELimiteMensal.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
  try
    if Estado <> 1 then
      ESituacao.itemIndex := -1
    else
      ESituacao.itemIndex := 0;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
end;

{ Localiza um Grupo }
function TLimiteGasto.LocalizarCod(CdLMG:Integer):Boolean;
begin
  If (CdLMG<>CodigoLMG) Then
    If locate('LMG_CODIGO',CdLMG, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TLimiteGasto.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
end;

procedure TLimiteGasto.PreparaInsercao;
begin
  ProximoCodigo('LMG_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TLimiteGasto.deletarauto:Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      result:=true;
      GeraLog(950,CodigoCNC,CodigoLMG,'LIMITE GASTO CENTRO');
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
