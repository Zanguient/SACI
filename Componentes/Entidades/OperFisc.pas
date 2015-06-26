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
unit OperFisc;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Funcoes, Dbctrls, Variants;

type
  TOperFiscal = class(TSQuery)
    private
      { Private fields of TOperFiscal }
        { Storage for property CodigoOPF }
        FCodigoOPF : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoOPF }
        FECodigoOPF : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EEntrada }
        FEEntrada : TCheckBox;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property ESaida }
        FESaida : TCheckBox;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipo }
        FETipo : TDBLookupComboBox;
        { Storage for property Entrada }
        FEntrada : Boolean;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Saida }
        FSaida : Boolean;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;

      { Private methods of TOperFiscal }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoOPF }
        function GetCodigoOPF : Integer;
        { Write method for property CodigoOPF }
        procedure SetCodigoOPF(Value : Integer);
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
        { Read method for property Entrada }
        function GetEntrada : Boolean;
        { Write method for property Entrada }
        procedure SetEntrada(Value : Boolean);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Saida }
        function GetSaida : Boolean;
        { Write method for property Saida }
        procedure SetSaida(Value : Boolean);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);

    protected
      { Protected fields of TOperFiscal }

      { Protected methods of TOperFiscal }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TOperFiscal }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TOperFiscal }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdOPF:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Tipo de parametro }
        function Inserir(CdOPF,PTipo: integer; PDescricao:string;PEntradaSaida:Integer=0; POBS: String=''):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Tipo de Parametro }
        function LocalizarCod(CdOPF:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;
        { Altera um Tipo de parametro }
        function zzzzzAlterar(CdOPF,PTipo: integer; PDescricao,POBS: String):Boolean;

    published
      { Published properties of TOperFiscal }
        { Código do Tipo de Parametro }
        property CodigoOPF : Integer read GetCodigoOPF write SetCodigoOPF;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoOPF : TEdit read FECodigoOPF write FECodigoOPF;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EEntrada : TCheckBox read FEEntrada write FEEntrada;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property ESaida : TCheckBox read FESaida write FESaida;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipo : TDBLookupComboBox read FETipo write FETipo;
        property Entrada : Boolean read GetEntrada write SetEntrada;
        property Observacao : String read GetObservacao write SetObservacao;
        property Saida : Boolean read GetSaida write SetSaida;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TOperFiscal with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TOperFiscal]);
end;

{ Method to set variable and property values and create objects }
procedure TOperFiscal.AutoInitialize;
begin
     Estado := 0;
     FECodigoOPF := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDescricao := nil;
     FEEntrada := nil;
     FEObservacao := nil;
     FESaida := nil;
     FESituacao := nil;
     FETipo := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TOperFiscal.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoOPF then
        FECodigoOPF := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEEntrada then
        FEEntrada := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FESaida then
        FESaida := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TOperFiscal.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoOPF }
function TOperFiscal.GetCodigoOPF : Integer;
begin
  try
    Result := Self.fieldByName('OPF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoOPF }
procedure TOperFiscal.SetCodigoOPF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('OPF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "OPF_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TOperFiscal.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('OPF_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TOperFiscal.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('OPF_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "OPF_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TOperFiscal.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('OPF_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TOperFiscal.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('OPF_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "OPF_DT_CADASTRO"!');
    end;
end;

{ Read method for property Descricao }
function TOperFiscal.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('OPF_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TOperFiscal.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('OPF_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "OPF_DESCRICAO"!');
  end;
end;

{ Read method for property Entrada }
function TOperFiscal.GetEntrada : Boolean;
begin
  try
    result := (Self.fieldByName('OPF_ENTRADA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Entrada }
procedure TOperFiscal.SetEntrada(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('OPF_ENTRADA').asInteger := 1
      else
        Self.fieldByName('OPF_ENTRADA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "OPF_ENTRADA"!');
    end;
end;

{ Read method for property Observacao }
function TOperFiscal.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('OPF_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Observacao }
procedure TOperFiscal.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('OPF_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "OPF_OBSERVACAO"!');
  end;
end;

{ Read method for property Saida }
function TOperFiscal.GetSaida : Boolean;
begin
  try
    result := (Self.fieldByName('OPF_SAIDA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Saida }
procedure TOperFiscal.SetSaida(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('OPF_SAIDA').asInteger := 1
      else
        Self.fieldByName('OPF_SAIDA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "OPF_SAIDA"!');
    end;
end;

{ Read method for property Situacao }
function TOperFiscal.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('OPF_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TOperFiscal.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('OPF_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "OPF_SITUACAO"!');
    end;
end;

{ Read method for property Tipo }
function TOperFiscal.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('OPF_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Tipo }
procedure TOperFiscal.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('OPF_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "OPF_TIPO"!');
    end;
end;

function TOperFiscal.AlterarAuto:Boolean;
begin
  Result:=False;
  try
    edit;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
       CodigoOPF  := StrToInt(ECodigoOPF.Text);
    except
    end;
    try
       Descricao  := EDescricao.Text;
    except
    end;
    try
       Entrada  := EEntrada.Checked;
    except
    end;
    try
       Saida  := ESaida.Checked;
    except
    end;
    try
       Tipo  := ETipo.KeyValue;
    except
    end;
    try
       Situacao  := ESituacao.ItemIndex;
    except
    end;    
    try
       Observacao  := EObservacao.Text;
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

procedure TOperFiscal.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    ECodigoOPF.Enabled     := Habilitar
  except
  end;
  try
    EDescricao.Enabled     :=Habilitar;
  except
  end;
  try
    ETipo.Enabled     :=Habilitar;
  except
  end;
  try
    EEntrada.Enabled     :=Habilitar;
  except
  end;
  try
    ESaida.Enabled     :=Habilitar;
  except
  end;
  try
    ESituacao.Enabled     :=Habilitar;
  except
  end;  
  try
    EObservacao.Enabled     :=Habilitar;
  except
  end;
end;

procedure TOperFiscal.CancelaEdicao;
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

procedure TOperFiscal.CarregaDados;
begin
  try
    ECodigoOPF.Text           :=IntToStr(CodigoOPF);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text :=formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text :=formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    ETipo.KeyValue           :=Tipo;
  except
  end;
  try
    EEntrada.Checked         :=Entrada;
  except
  end;
  try
    ESaida.Checked         :=Saida;
  except
  end;
  try
    ESituacao.ItemIndex           :=Situacao;
  except
  end;  
  try
    EObservacao.Text           :=Observacao;
  except
  end;
end;

constructor TOperFiscal.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'OPERACAO_FISCAL';

     { Code to perform other tasks when the component is created }

end;

function TOperFiscal.Deletar(CdOPF:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdOPF)) Then
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

destructor TOperFiscal.Destroy;
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

function TOperFiscal.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem :string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoOPF.Text) then
    mensagem:=mensagem+'Código da Operação fiscal inválido!'+#13;
  if EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  if (ETipo.KeyValue = 0) or (ETipo.KeyValue = NULL) then
    mensagem:=mensagem+'Tipo inválido!'+#13;
  if (not EEntrada.Checked) and (not ESaida.Checked) then
    mensagem:=mensagem+'Defina se é de entrada e/ou Saída!'+#13;
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
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoOPF;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end
    End;
    AfterScroll:=aux;
  end;
end;

{ Insere um Tipo de parametro }
function TOperFiscal.Inserir(CdOPF,PTipo: integer; PDescricao:string;PEntradaSaida:Integer=0; POBS: String=''):boolean;
begin
  result:=false;
  If (localizarCod(CdOPF)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    Insert;
    try
      CodigoOPF    := CdOPF;
      CodigoCNC    := CConfiguracao.CodigoCNC;
      CodigoUSU    := CConfiguracao.CodigoUSU;
      DataCadastro := CConfiguracao.DataHora;
      Descricao    := PDescricao;
      Tipo         := PTipo;      
      if PEntradaSaida = 0 then
      Begin
        Entrada := True;
        Saida   := False;
      end
      else
      Begin
        Entrada := False;
        Saida   := True;
      end;
      Situacao     := 0;
      Observacao   := POBS;

      try
        Post;
        Result := True;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

function TOperFiscal.InserirAuto:Boolean;
begin
  result:=false;
  If (localizarCod(StrToInt(ECodigoOPF.Text))) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      append;
      try
         CodigoOPF  := StrToInt(ECodigoOPF.Text);
      except
      end;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        codigoUSU   := CConfiguracao.CodigoUSU;
      except
      end;
      try
        DataCadastro   := CConfiguracao.DataHora;
      except
      end;
      try
         Descricao  := EDescricao.Text;
      except
      end;
      try
         Tipo  := ETipo.KeyValue;
      except
      end;
      try
         Entrada  := EEntrada.Checked;
      except
      end;
      try
         Saida  := ESaida.Checked;
      except
      end;
      try
         Situacao  := ESituacao.ItemIndex;
      except
      end;      
      try
         Observacao  := EObservacao.Text;
      except
      end;
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
end;

procedure TOperFiscal.LimpaCampos;
begin
  try
    ECodigoOPF.Clear;
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
    ETipo.KeyValue := 0;
  except
  end;
  try
    EEntrada.Checked :=False;
  except
  end;
  try
    ESaida.Checked   :=False;
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

{ Localiza um Tipo de Parametro }
function TOperFiscal.LocalizarCod(CdOPF:Integer):Boolean;
begin
  If (CdOPF<>CodigoOPF) Then
    If locate('OPF_CODIGO', CdOPF, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TOperFiscal.LocalizarNome(Nome:String):Boolean;
begin
  If Nome<>Descricao Then
    If locate('TPR_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TOperFiscal.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TOperFiscal.PreparaInsercao;
begin
   Estado:=1;
   AtualizaControles(True);
   LimpaCampos;
end;

function TOperFiscal.deletarauto:Boolean;
begin
  Result := False;
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
end;

{ Altera um Tipo de parametro }
function TOperFiscal.zzzzzAlterar(CdOPF,PTipo: integer; PDescricao,POBS: String):Boolean;
begin
  Result := False;
  If not localizarCod(CdOPF) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      Descricao    := PDescricao;
      CodigoUSU    := CConfiguracao.CodigoUSU;
      DataAlterado := CConfiguracao.DataHora;
      Tipo         := PTipo;
      Observacao   := POBS;
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


end.
