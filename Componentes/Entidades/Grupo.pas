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
unit Grupo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows;

type
  TGrupo = class(TSQuery)
    private
      { Private fields of TGrupo }
        { Storage for property CodigoGRP }
        FCodigoGRP : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoGRP }
        FECodigoGRP : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EEspecial }
        FEEspecial : TCheckBox;
        { Storage for property EFoto }
        FEFoto : TImage;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EServico }
        FEServico : TCheckBox;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Especial }
        FEspecial : Boolean;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Servico }
        FServico : Boolean;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TGrupo }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoGRP }
        function GetCodigoGRP : Integer;
        { Write method for property CodigoGRP }
        procedure SetCodigoGRP(Value : Integer);
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
        { Read method for property Especial }
        function GetEspecial : Boolean;
        { Write method for property Especial }
        procedure SetEspecial(Value : Boolean);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Servico }
        function GetServico : Boolean;
        { Write method for property Servico }
        procedure SetServico(Value : Boolean);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TGrupo }

      { Protected methods of TGrupo }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TGrupo }

      { Public methods of TGrupo }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdGRP:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grupo }
        function LocalizarCod(CdGRP:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TGrupo }
        { Código do Grupo }
        property CodigoGRP : Integer read GetCodigoGRP write SetCodigoGRP;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoGRP : TEdit read FECodigoGRP write FECodigoGRP;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EEspecial : TCheckBox read FEEspecial write FEEspecial;
        property EFoto : TImage read FEFoto write FEFoto;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EServico : TCheckBox read FEServico write FEServico;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        { Dizer se a Armacao é Acabada... }
        property Especial : Boolean read GetEspecial write SetEspecial;
        property OBS : String read GetOBS write SetOBS;
        property Servico : Boolean read GetServico write SetServico;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TGrupo with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TGrupo]);
end;

{ Method to set variable and property values and create objects }
procedure TGrupo.AutoInitialize;
begin
     FECodigoGRP := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDescricao := nil;
     FEEspecial := nil;
     FEFoto := nil;
     FEOBS := nil;
     FEServico := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TGrupo.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoGRP then
        FECodigoGRP := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEEspecial then
        FEEspecial := nil;
     if AComponent = FEFoto then
        FEFoto := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEServico then
        FEServico := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TGrupo.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoGRP }
function TGrupo.GetCodigoGRP : Integer;
begin
  try
    Result := Self.fieldByName('GRP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoGRP }
procedure TGrupo.SetCodigoGRP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('GRP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "GRP_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TGrupo.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('GRP_DT_ALTERADO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TGrupo.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('GRP_DT_ALTERADO').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "GRP_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TGrupo.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('GRP_DT_CADASTRO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TGrupo.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('GRP_DT_CADASTRO').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "GRP_DT_CADASTRO"!');
  end;
end;

{ Read method for property Descricao }
function TGrupo.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('GRP_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TGrupo.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('GRP_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "GRP_DESCRICAO"!');
  end;
end;

{ Read method for property Especial }
function TGrupo.GetEspecial : Boolean;
begin
  try
    result := (Self.fieldByName('GRP_ESPECIAL').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Especial }
procedure TGrupo.SetEspecial(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('GRP_ESPECIAL').asInteger := 1
      else
        Self.fieldByName('GRP_ESPECIAL').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "GRP_ESPECIAL"!');
    end;
end;

{ Read method for property OBS }
function TGrupo.GetOBS : String;
begin
  try
    Result := Self.fieldByName('GRP_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TGrupo.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('GRP_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "GRP_OBSERVACAO"!');
  end;
end;

{ Read method for property Servico }
function TGrupo.GetServico : Boolean;
begin
  try
    result := (Self.fieldByName('GRP_SERVICO').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Servico }
procedure TGrupo.SetServico(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('GRP_SERVICO').asInteger := 1
      else
        Self.fieldByName('GRP_SERVICO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "GRP_SERVICO"!');
    end;
end;

{ Read method for property Situacao }
function TGrupo.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('GRP_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TGrupo.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('GRP_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "GRP_SITUACAO"!');
  end;
end;

function TGrupo.AlterarAuto:Boolean;
var
  CdCNC, CdGRP: integer;
  sDetalhes: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdGRP := CodigoGRP;
  sDetalhes := '';
  try
    edit;
    try
      Descricao := EDescricao.Text;
      sDetalhes := sDetalhes+'Desc:'+EDescricao.Text;
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      Especial    := EEspecial.Checked;
      if EEspecial.Checked then
        sDetalhes := sDetalhes+' Esp:S'
      else
        sDetalhes := sDetalhes+' Esp:N';
    except
    end;
    try
      Servico    := EServico.Checked;
      if EServico.Checked then
        sDetalhes := sDetalhes+' Serv:S'
      else
        sDetalhes := sDetalhes+' Serv:N';
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
      GeraLog(520, CdCNC, CdGRP, sDetalhes);
      Result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TGrupo.AtualizaControles(Habilitar:Boolean);
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
    EEspecial.Enabled          :=Habilitar;
  except
  end;
  try
    EServico.Enabled          :=Habilitar;
  except
  end;
  try
    EOBS.Enabled                :=Habilitar;
  except
  end;

end;

procedure TGrupo.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TGrupo.CarregaDados;
var
  Foto : string;
begin
  Try
    ECodigoGRP.Text           :=IntToStr(CodigoGRP);
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    EEspecial.checked         := Especial;
  except
  end;
  try
    EServico.checked         := Servico;
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
  try
    foto:=CConfiguracao.PastaImagens+'\Grupo\00'+'-'+IntToStr(CodigoGRP)+'.JPG';
    Efoto.Picture.LoadFromFile(foto);
  Except
    try
      EFoto.Picture:=nil;
    except
    end;
  end;
end;

constructor TGrupo.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'GRUPO';

     { Code to perform other tasks when the component is created }

end;

function TGrupo.Deletar(CdGRP:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdGRP)) Then
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

destructor TGrupo.Destroy;
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

function TGrupo.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  If EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
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
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoGRP;
      If Alterarauto then
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

function TGrupo.InserirAuto:Boolean;
var
  CdCNC, CdGRP: integer;
  sDetalhes: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdGRP := sCodigo;
  sDetalhes := '';
  try
    append;
    try
      CodigoGRP   := CdGRP;
    except
    end;
    try
      codigocnc   := CdCNC;
    except
    end;
    try
      Descricao := EDescricao.Text;
      sDetalhes := sDetalhes+'Desc:'+EDescricao.Text;
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      Especial    := EEspecial.Checked;
      if EEspecial.Checked then
        sDetalhes := sDetalhes+' Esp:S'
      else
        sDetalhes := sDetalhes+' Esp:N';
    except
    end;
    try
      Servico     := EServico.Checked;
      if EServico.Checked then
        sDetalhes := sDetalhes+' Serv:S'
      else
        sDetalhes := sDetalhes+' Serv:N';
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
      GeraLog(500, CdCNC, CdGRP, sDetalhes);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;


procedure TGrupo.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoGRP.Clear
    else
      ECodigoGRP.Text := IntToStr(SCodigo);
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
    EEspecial.Checked   := False;
  except
  end;
  try
    EServico.Checked    := False;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
  try
    EFoto.Picture:=nil;
  except
  end;
end;

{ Localiza um Grupo }
function TGrupo.LocalizarCod(CdGRP:Integer):Boolean;
begin
  If (CdGRP<>CodigoGRP) Then
    If locate('GRP_CODIGO',CdGRP, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TGrupo.LocalizarNome(Nome:String):Boolean;
begin
  If Nome<>Descricao Then
    If locate('GRP_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TGrupo.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
end;

procedure TGrupo.PreparaInsercao;
begin
  ProximoCodigo('GRP_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TGrupo.deletarauto:Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      result:=true;
      GeraLog(510,CodigoCNC,CodigoGRP,'16');
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
