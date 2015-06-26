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
unit Mensagem;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Usuario, Funcoes, Extctrls, 
     Variants;

type
  TMensagem = class(TSQuery)
    private
      { Private fields of TMensagem }
        { Storage for property Alertado }
        FAlertado : Boolean;
        { Storage for property Apagada }
        FApagada : Boolean;
        { Storage for property Assunto }
        FAssunto : String;
        { Storage for property AvisarLeitura }
        FAvisarLeitura : Boolean;
        { Storage for property CUsuario }
        FCUsuario : TUsuario;
        { Storage for property CUsuarioRemetenteDestino }
        FCUsuarioRemetenteDestino : TUsuario;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoMSG }
        FCodigoMSG : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : Tdatetime;
        { Storage for property DestinoCNC }
        FDestinoCNC : Integer;
        { Storage for property DestinoUSU }
        FDestinoUSU : Integer;
        { Storage for property EAssunto }
        FEAssunto : TEdit;
        { Storage for property EAvisarLeitura }
        FEAvisarLeitura : TCheckbox;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupCombobox;
        { Storage for property ECodigoMSG }
        FECodigoMSG : TEdit;
        { Storage for property ECodigoUSU }
        FECodigoUSU : TDBLookupCombobox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDestinoCNC }
        FEDestinoCNC : TDBLookupCombobox;
        { Storage for property EDestinoUSU }
        FEDestinoUSU : TDBLookupCombobox;
        { Storage for property EMensagem }
        FEMensagem : TMemo;
        { Storage for property EObs }
        FEObs : TMemo;
        { Storage for property EPublica }
        FEPublica : TCheckBox;
        { Storage for property EUrgente }
        FEUrgente : TCheckbox;
        { Storage for property Mensagem }
        FMensagem : String;
        { Storage for property Obs }
        FObs : String;
        { Storage for property Publica }
        FPublica : Boolean;
        { Storage for property SituacaoEnviar }
        FSituacaoEnviar : Integer;
        { Storage for property SituacaoReceber }
        FSituacaoReceber : Integer;
        { Storage for property Urgente }
        FUrgente : Boolean;

      { Private methods of TMensagem }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Alertado }
        function GetAlertado : Boolean;
        { Write method for property Alertado }
        procedure SetAlertado(Value : Boolean);
        { Read method for property Apagada }
        function GetApagada : Boolean;
        { Write method for property Apagada }
        procedure SetApagada(Value : Boolean);
        { Read method for property Assunto }
        function GetAssunto : String;
        { Write method for property Assunto }
        procedure SetAssunto(Value : String);
        { Read method for property AvisarLeitura }
        function GetAvisarLeitura : Boolean;
        { Write method for property AvisarLeitura }
        procedure SetAvisarLeitura(Value : Boolean);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoMSG }
        function GetCodigoMSG : Integer;
        { Write method for property CodigoMSG }
        procedure SetCodigoMSG(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : Tdatetime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : Tdatetime);
        { Read method for property DestinoCNC }
        function GetDestinoCNC : Integer;
        { Write method for property DestinoCNC }
        procedure SetDestinoCNC(Value : Integer);
        { Read method for property DestinoUSU }
        function GetDestinoUSU : Integer;
        { Write method for property DestinoUSU }
        procedure SetDestinoUSU(Value : Integer);
        { Read method for property Mensagem }
        function GetMensagem : String;
        { Write method for property Mensagem }
        procedure SetMensagem(Value : String);
        { Read method for property Obs }
        function GetObs : String;
        { Write method for property Obs }
        procedure SetObs(Value : String);
        { Read method for property Publica }
        function GetPublica : Boolean;
        { Write method for property Publica }
        procedure SetPublica(Value : Boolean);
        { Read method for property SituacaoEnviar }
        function GetSituacaoEnviar : Integer;
        { Write method for property SituacaoEnviar }
        procedure SetSituacaoEnviar(Value : Integer);
        { Read method for property SituacaoReceber }
        function GetSituacaoReceber : Integer;
        { Write method for property SituacaoReceber }
        procedure SetSituacaoReceber(Value : Integer);
        { Read method for property Urgente }
        function GetUrgente : Boolean;
        { Write method for property Urgente }
        procedure SetUrgente(Value : Boolean);

    protected
      { Protected fields of TMensagem }

      { Protected methods of TMensagem }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TMensagem }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TMensagem }
        { Altera uma Mensagem }
        function Alterar(CdCNC, CdMSG, PDestinoCNC, PDestinoUSU, PSituacaoEnviar, PSituacaoReceber: Integer; PAssunto, PMensagem, PObs: String; PPublica, PUrgente, PAvisarLeitura:boolean):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdMSG: Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere uma Mensagem }
        function Inserir(CdCNC, CdMSG, PDestinoCNC, PDestinoUSU, PSituacaoEnviar, PSituacaoReceber : Integer; PAssunto,PMensagem:string; PObs: String=''; PPublica:Boolean=False; PUrgente:Boolean=False; PAvisarLeitura:boolean=False):boolean;
        function InserirAuto:Boolean;
        { Localiza uma Mensagem }
        function LocalizarCod(CdMSG, CdCNC: Integer): Boolean;
        function LocalizarNome(PAssunto:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TMensagem }
        property Alertado : Boolean read GetAlertado write SetAlertado;
        property Apagada : Boolean read GetApagada write SetApagada;
        property Assunto : String read GetAssunto write SetAssunto;
        property AvisarLeitura : Boolean
             read GetAvisarLeitura write SetAvisarLeitura;
        property CUsuario : TUsuario read FCUsuario write FCUsuario;
        property CUsuarioRemetenteDestino : TUsuario
             read FCUsuarioRemetenteDestino write FCUsuarioRemetenteDestino;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código da Mensagem }
        property CodigoMSG : Integer read GetCodigoMSG write SetCodigoMSG;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : Tdatetime
             read GetDataCadastro write SetDataCadastro;
        property DestinoCNC : Integer read GetDestinoCNC write SetDestinoCNC;
        property DestinoUSU : Integer read GetDestinoUSU write SetDestinoUSU;
        property EAssunto : TEdit read FEAssunto write FEAssunto;
        property EAvisarLeitura : TCheckbox
             read FEAvisarLeitura write FEAvisarLeitura;
        property ECodigoCNC : TDBLookupCombobox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoMSG : TEdit read FECodigoMSG write FECodigoMSG;
        property ECodigoUSU : TDBLookupCombobox
             read FECodigoUSU write FECodigoUSU;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDestinoCNC : TDBLookupCombobox
             read FEDestinoCNC write FEDestinoCNC;
        property EDestinoUSU : TDBLookupCombobox
             read FEDestinoUSU write FEDestinoUSU;
        property EMensagem : TMemo read FEMensagem write FEMensagem;
        property EObs : TMemo read FEObs write FEObs;
        property EPublica : TCheckBox read FEPublica write FEPublica;
        property EUrgente : TCheckbox read FEUrgente write FEUrgente;
        property Mensagem : String read GetMensagem write SetMensagem;
        property Obs : String read GetObs write SetObs;
        property Publica : Boolean read GetPublica write SetPublica;
        property SituacaoEnviar : Integer
             read GetSituacaoEnviar write SetSituacaoEnviar;
        property SituacaoReceber : Integer
             read GetSituacaoReceber write SetSituacaoReceber;
        property Urgente : Boolean read GetUrgente write SetUrgente;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMensagem with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMensagem]);
end;

{ Method to set variable and property values and create objects }
procedure TMensagem.AutoInitialize;
begin
     Estado := 0;
     FEAssunto := nil;
     FEAvisarLeitura := nil;
     FECodigoCNC := nil;
     FECodigoMSG := nil;
     FECodigoUSU := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDestinoCNC := nil;
     FEDestinoUSU := nil;
     FEMensagem := nil;
     FEObs := nil;
     FEPublica := nil;
     FEUrgente := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TMensagem.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAssunto then
        FEAssunto := nil;
     if AComponent = FEAvisarLeitura then
        FEAvisarLeitura := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoMSG then
        FECodigoMSG := nil;
     if AComponent = FECodigoUSU then
        FECodigoUSU := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDestinoCNC then
        FEDestinoCNC := nil;
     if AComponent = FEDestinoUSU then
        FEDestinoUSU := nil;
     if AComponent = FEMensagem then
        FEMensagem := nil;
     if AComponent = FEObs then
        FEObs := nil;
     if AComponent = FEPublica then
        FEPublica := nil;
     if AComponent = FEUrgente then
        FEUrgente := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TMensagem.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Alertado }
function TMensagem.GetAlertado : Boolean;
begin
  try
    Result := (Self.fieldByName('MSG_ALERTADO').asInteger=1);
  except
    result:= false
  end;
end;

{ Write method for property Alertado }
procedure TMensagem.SetAlertado(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('MSG_ALERTADO').asInteger := 1
     else
       Self.fieldByName('MSG_ALERTADO').asInteger := 0;
   except
   end;
end;

{ Read method for property Apagada }
function TMensagem.GetApagada : Boolean;
begin
  try
    Result := (Self.fieldByName('MSG_APAGADA').asInteger=1);
  except
    result:= false
  end;
end;

{ Write method for property Apagada }
procedure TMensagem.SetApagada(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('MSG_APAGADA').asInteger := 1
     else
       Self.fieldByName('MSG_APAGADA').asInteger := 0;
   except
   end;
end;

{ Read method for property Assunto }
function TMensagem.GetAssunto : String;
begin
  try
    Result := Self.fieldByName('MSG_ASSUNTO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Assunto }
procedure TMensagem.SetAssunto(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MSG_ASSUNTO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MSG_ASSUNTO"!');
  end;
end;

{ Read method for property AvisarLeitura }
function TMensagem.GetAvisarLeitura : Boolean;
begin
  try
    Result := (Self.fieldByName('MSG_AVISO_LEITURA').asInteger=1);
  except
    result:= false
  end;
end;

{ Write method for property AvisarLeitura }
procedure TMensagem.SetAvisarLeitura(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('MSG_AVISO_LEITURA').asInteger := 1
     else
       Self.fieldByName('MSG_AVISO_LEITURA').asInteger := 0;
   except
   end;
end;

{ Read method for property CodigoCNC }
function TMensagem.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TMensagem.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoMSG }
function TMensagem.GetCodigoMSG : Integer;
begin
  try
    Result := Self.fieldByName('MSG_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoMSG }
procedure TMensagem.SetCodigoMSG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MSG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MSG_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TMensagem.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TMensagem.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TMensagem.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('MSG_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TMensagem.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MSG_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MSG_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TMensagem.GetDataCadastro : Tdatetime;
begin
  try
    Result := Self.fieldByName('MSG_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TMensagem.SetDataCadastro(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MSG_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MSG_DT_CADASTRO"!');
  end;
end;

{ Read method for property DestinoCNC }
function TMensagem.GetDestinoCNC : Integer;
begin
  try
    Result := Self.fieldByName('MSG_CNC_DESTINO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property DestinoCNC }
procedure TMensagem.SetDestinoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MSG_CNC_DESTINO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MSG_CNC_DESTINO"!');
  end;
end;

{ Read method for property DestinoUSU }
function TMensagem.GetDestinoUSU : Integer;
begin
  try
    Result := Self.fieldByName('MSG_USU_DESTINO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property DestinoUSU }
procedure TMensagem.SetDestinoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MSG_USU_DESTINO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MSG_USU_DESTINO"!');
  end;
end;

{ Read method for property Mensagem }
function TMensagem.GetMensagem : String;
begin
  try
    Result := Self.fieldByName('MSG_MENSAGEM').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Mensagem }
procedure TMensagem.SetMensagem(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MSG_MENSAGEM').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MSG_MENSAGEM"!');
  end;
end;

{ Read method for property Obs }
function TMensagem.GetObs : String;
begin
  try
    Result := Self.fieldByName('MSG_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Obs }
procedure TMensagem.SetObs(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MSG_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MSG_OBSERVACAO"!');
  end;
end;

{ Read method for property Publica }
function TMensagem.GetPublica : Boolean;
begin
  try
    Result := (Self.fieldByName('MSG_PUBLICA').asInteger=1);
  except
    result:= false
  end;
end;

{ Write method for property Publica }
procedure TMensagem.SetPublica(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('MSG_PUBLICA').asInteger := 1
     else
      Self.fieldByName('MSG_PUBLICA').asInteger := 0;
   except
   end;
end;

{ Read method for property SituacaoEnviar }
function TMensagem.GetSituacaoEnviar : Integer;
begin
  try
    Result := Self.fieldByName('MSG_SITUACAO_ENVIAR').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property SituacaoEnviar }
procedure TMensagem.SetSituacaoEnviar(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MSG_SITUACAO_ENVIAR').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MSG_SITUACAO_ENVIAR"!');
  end;
end;

{ Read method for property SituacaoReceber }
function TMensagem.GetSituacaoReceber : Integer;
begin
  try
    Result := Self.fieldByName('MSG_SITUACAO_RECEBER').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property SituacaoReceber }
procedure TMensagem.SetSituacaoReceber(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MSG_SITUACAO_RECEBER').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MSG_SITUACAO_RECEBER"!');
  end;
end;

{ Read method for property Urgente }
function TMensagem.GetUrgente : Boolean;
begin
 try
    Result := (Self.fieldByName('MSG_URGENTE').asInteger=1);
  except
    result:= false
  end;
end;

{ Write method for property Urgente }
procedure TMensagem.SetUrgente(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('MSG_URGENTE').asInteger := 1
     else
      Self.fieldByName('MSG_URGENTE').asInteger := 0;
   except
   end;
end;

{ Altera uma Mensagem }
function TMensagem.Alterar(CdCNC, CdMSG, PDestinoCNC, PDestinoUSU, PSituacaoEnviar, PSituacaoReceber: Integer; PAssunto, PMensagem, PObs: String; PPublica, PUrgente, PAvisarLeitura:boolean):boolean;
begin
  If not(localizarCod(CdMSG, CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoUSU       := CConfiguracao.CodigoUSU;
      DataAlterado    := CConfiguracao.DataHora;
      DestinoCNC      := PDestinoCNC;
      DestinoUSU      := PDestinoUSU;
      Assunto         := PAssunto;
      Mensagem        := PMensagem;
      Publica         := PPublica;
      Urgente         := PUrgente;
      AvisarLeitura   := PAvisarLeitura;
      SituacaoEnviar  := PSituacaoEnviar;
      SituacaoReceber := PSituacaoReceber;

      try
        Post;
        Result := True;
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

function TMensagem.AlterarAuto:Boolean;
begin
    try
      edit;
      try
         DataAlterado  := CConfiguracao.DataHora;
      except
      end;
      try
         DestinoCNC    := EDestinoCNC.KeyValue;
      except
      end;
      try
         DestinoUSU    := EDestinoUSU.KeyValue;
      except
      end;
      try
         Assunto       := EAssunto.Text;
      except
      end;
      try
         Mensagem      := EMensagem.Text;
      except
      end;
      try
         Publica       := EPublica.Checked;
      except
      end;
      try
         Urgente       := EUrgente.Checked;
      except
      end;
      try
         AvisarLeitura := EAvisarLeitura.Checked;
      except
      end;
      try
         Obs           := EObs.Text;
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

procedure TMensagem.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EDestinoCNC.Enabled   :=Habilitar;
  Except
  End;
  Try
    EDestinoUSU.Enabled          :=Habilitar;
  Except
  End;
  Try
    EAssunto.Enabled           :=Habilitar;
  Except
  End;
  Try
    EMensagem.Enabled             :=Habilitar;
  Except
  End;
  Try
    EPublica.Enabled           :=Habilitar;
  Except
  End;
  Try
    EUrgente.Enabled           :=Habilitar;
  Except
  End;
  Try
    EAvisarLeitura.Enabled           :=Habilitar;
  Except
  End;
  Try
    EObs.Enabled           :=Habilitar;
  Except
  End;
end;

procedure TMensagem.CancelaEdicao;
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

procedure TMensagem.CarregaDados;
begin
  Try
    ECodigoCNC.KeyValue   := CodigoCNC;
  Except
  End;
  Try
    ECodigoUSU.KeyValue   := CodigoUSU;
  Except
  End;
  Try
    if CodigoMSG <> 0 then
      ECodigoMSG.Text        := IntToStr(CodigoMSG)
    else
      ECodigoMSG.Clear;
  Except
  End;
  try
    if DataCadastro = 0 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text     := FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro);
  except
  end;
  Try
    if DataAlterado=0 then
      EDataAlterado.Clear
    else
      EDataAlterado.Text   := FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado);
  Except
  End;
  Try
    EDestinoCNC.KeyValue   := DestinoCNC;
  Except
  End;
  Try
    EDestinoUSU.KeyValue   := DestinoUSU;
  Except
  End;
  Try
    EAssunto.Text          := Assunto;
  Except
  End;
  Try
    EMensagem.Text         := Mensagem;
  Except
  End;
  Try
    EPublica.Checked       := Publica;
  Except
  End;
  Try
    EUrgente.Checked       := Urgente;
  Except
  End;
  Try
    EAvisarLeitura.Checked := AvisarLeitura;
  Except
  End;
  Try
    EObs.Text              := Obs;
  Except
  End;
end;

constructor TMensagem.Create(AOwner: TComponent);
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

function TMensagem.Deletar(CdCNC, CdMSG: Integer):Boolean;
begin
  If not(localizarCod(CdMSG, CdCNC)) Then
  Begin
    Result := False;
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        begin
           Try
             ECodigoMSG.Clear;
           Except
           End;
           Try
             EDataCadastro.Clear;
           Except
           End;
           Try
             ECodigoCNC.KeyValue := 0;
           Except
           End;
           Try
             ECodigoUSU.KeyValue := 0;
           Except
           End;
           Try
             EDataAlterado.Clear;
           Except
           End;
           Try
             EDestinoCNC.KeyValue := 0;
           Except
           End;
           Try
             EDestinoUSU.KeyValue := 0;
           Except
           End;
           Try
             EAssunto.Clear;
           Except
           End;
           Try
             EMensagem.Clear;
           Except
           End;
           Try
             EPublica.Checked := false;
           Except
           End;
           Try
             EUrgente.Checked := false;
           Except
           End;
           Try
             EAvisarLeitura.Checked := false;
           Except
           End;
           Try
             EObs.Clear;
           Except
           End;
        end;
      end
      else
        Result := False;
    Except
      Result := False;
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TMensagem.Destroy;
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

function TMensagem.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem : string;
begin
  mensagem := '';
  if EAssunto.Text = '' then
    mensagem := mensagem + 'Assunto inválido!'+#13;
  if EMensagem.Text = '' then
    mensagem := mensagem + 'Mensagem inválida!'+#13;
  if (not EPublica.Checked) and (not EDestinoUSU.KeyValue > 0) then
    mensagem := mensagem + 'Usuário de Destino inválido!'+#13;
  if (not EDestinoCNC.KeyValue >= 0) then
    mensagem := mensagem + 'Centro de Custo de destino inválido!'+#13;
  if (EDestinoCNC.KeyValue = CConfiguracao.CodigoCNC) and
     (EDestinoUSU.KeyValue = CConfiguracao.CodigoUSU) then
    mensagem := mensagem + 'Você está tentando mandar mensagem para você mesmo!'+#13;

  if mensagem <> '' then
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
        LocalizarCod(SCodigo,CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
        CarregaDados;
      end
      else
        Result := False
    End
    Else If Estado=2 then
    Begin
      cod:=codigoMSG;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        AtualizaControles(False);
        Estado:=0;
        CarregaDados;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
  end;
end;

{ Insere uma Mensagem }
function TMensagem.Inserir(CdCNC, CdMSG, PDestinoCNC, PDestinoUSU, PSituacaoEnviar, PSituacaoReceber : Integer; PAssunto,PMensagem:string; PObs: String=''; PPublica:Boolean=False; PUrgente:Boolean=False; PAvisarLeitura:boolean=False):boolean;
Var
  Cod:Integer;
begin
  if not Active then
    Active := True;
  if CdMSG=0 then
    Cod    := ProximoCodigo('MSG_CODIGO')
  else
    Cod    := CdMSG;
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
        CodigoMSG       := Cod;
        CodigoCNC       := CdCNC;
        CodigoUSU       := CConfiguracao.CodigoUSU;
        DataCadastro    := CConfiguracao.DataHora;
        DestinoCNC      := PDestinoCNC;
        DestinoUSU      := PDestinoUSU;
        Assunto         := PAssunto;
        Mensagem        := PMensagem;
        Publica         := PPublica;
        Urgente         := PUrgente;
        AvisarLeitura   := PAvisarLeitura;
        SituacaoEnviar  := PSituacaoEnviar;
        SituacaoReceber := PSituacaoReceber;
        Apagada         := False;
        Alertado        := False;

        try
          Post;
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

function TMensagem.InserirAuto:Boolean;
begin
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
        CodigoMSG   := SCodigo;
      except
      end;
      try
         DataCadastro  := StrToDateTime(EDataCadastro.Text);
      except
      end;
      try
         DestinoCNC    := EDestinoCNC.KeyValue;
      except
      end;
      try
         DestinoUSU    := EDestinoUSU.KeyValue;
      except
      end;
      try
         Assunto       := EAssunto.Text;
      except
      end;
      try
         Mensagem      := EMensagem.Text;
      except
      end;
      try
         Publica       := EPublica.Checked;
      except
      end;
      try
         Urgente       := EUrgente.Checked;
      except
      end;
      try
         AvisarLeitura := EAvisarLeitura.Checked;
      except
      end;
      try
         SituacaoEnviar      := 0;
      except
      end;
      try
         SituacaoReceber     := 0;
      except
      end;
      try
         Obs                 := EObs.Text;
      except
      end;
      try
        Apagada              := False;
      except
      end;
      try
        Alertado              := False;
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

{ Localiza uma Mensagem }
function TMensagem.LocalizarCod(CdMSG, CdCNC: Integer): Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdMSG<>CodigoMSG) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; MSG_CODIGO', vararrayof([CdCNC, CdMSG]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TMensagem.LocalizarNome(PAssunto:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If PAssunto<>Assunto Then
    If locate('MSG_ASSUNTO',PAssunto, [loCaseInsensitive, loPartialKey]) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TMensagem.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TMensagem.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 ProximoCodigo('MSG_CODIGO');
  Try
    EDataCadastro.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  Except
  End;
  Try
    EDestinoCNC.KeyValue := CConfiguracao.CodigoCNC;
  Except
  End;
  Try
    EDestinoUSU.KeyValue := 0;
  Except
  End;
  Try
    EAssunto.Clear;
  Except
  End;
  Try
    EMensagem.Clear;
  Except
  End;
  Try
    EPublica.Checked := false;
  Except
  End;
  Try
    EUrgente.Checked := false;
  Except
  End;
  Try
    EAvisarLeitura.Checked := false;
  Except
  End;
  try
    EOBS.Clear;
  except
  end;
  AtualizaControles(True);
  Estado:=1;
end;

function TMensagem.deletarauto:Boolean;
begin
  try
    Result := Delete;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
