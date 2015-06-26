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
unit Item_Recebimento;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Variants;

type
  TItem_Recebimento = class(TSQuery)
    private
      { Private fields of TItem_Recebimento }
        { Storage for property CodigoIRC }
        FCodigoIRC : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoREC }
        FCodigoREC : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoIRC }
        FECodigoIRC : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoREC }
        FECodigoREC : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TItem_Recebimento }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoIRC }
        function GetCodigoIRC : Integer;
        { Write method for property CodigoIRC }
        procedure SetCodigoIRC(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoREC }
        function GetCodigoREC : Integer;
        { Write method for property CodigoREC }
        procedure SetCodigoREC(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TItem_Recebimento }

      { Protected methods of TItem_Recebimento }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_Recebimento }

      { Public methods of TItem_Recebimento }
        { Altera um Recebimento }
        function Alterar(CdCNC, CdIRC, CdREC, CdPRD: Integer;PQuantidade:Double;PSituacao:integer):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdIRC: Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Recebimento }
        function Inserir(CdCNC,CdIRC, CdREC, CdPRD: Integer;PQuantidade:Double;PSituacao:integer):boolean;
        function InserirAuto:Boolean;
        { Localiza um Recebimento }
        function LocalizarCod(CdIRC, CdCNC: Integer): Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_Recebimento }
        { Código do Recebimento }
        property CodigoIRC : Integer read GetCodigoIRC write SetCodigoIRC;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoREC : Integer read GetCodigoREC write SetCodigoREC;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoIRC : TEdit read FECodigoIRC write FECodigoIRC;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoREC : TEdit read FECodigoREC write FECodigoREC;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_Recebimento with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_Recebimento]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_Recebimento.AutoInitialize;
begin
     FECodigoIRC := nil;
     FECodigoPRD := nil;
     FECodigoREC := nil;
     FEQuantidade := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_Recebimento.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoIRC then
        FECodigoIRC := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoREC then
        FECodigoREC := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_Recebimento.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoIRC }
function TItem_Recebimento.GetCodigoIRC : Integer;
begin
  try
    Result := Self.fieldByName('IRC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoIRC }
procedure TItem_Recebimento.SetCodigoIRC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IRC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IRC_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItem_Recebimento.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_Recebimento.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Read method for property CodigoREC }
function TItem_Recebimento.GetCodigoREC : Integer;
begin
  try
    Result := Self.fieldByName('REC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoREC }
procedure TItem_Recebimento.SetCodigoREC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('REC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "REC_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItem_Recebimento.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('IRC_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItem_Recebimento.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IRC_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IRC_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TItem_Recebimento.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('IRC_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItem_Recebimento.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IRC_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IRC_DT_CADASTRO"!');
    end;
end;

{ Read method for property Quantidade }
function TItem_Recebimento.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('IRC_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TItem_Recebimento.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IRC_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IRC_QUANTIDADE"!');
    end;
end;

{ Read method for property Situacao }
function TItem_Recebimento.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('IRC_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property Situacao }
procedure TItem_Recebimento.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IRC_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IRC_SITUACAO"!');
    end;
end;

{ Altera um Recebimento }
function TItem_Recebimento.Alterar(CdCNC, CdIRC, CdREC, CdPRD: Integer;PQuantidade:Double;PSituacao:integer):boolean;
begin
  If not(localizarCod(CdIRC,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      DataAlterado   := CConfiguracao.DataHora;
      CodigoPRD      := CdPRD;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      Quantidade     := PQuantidade;
      Situacao       := PSituacao;
      try
        Post;
        result:=true;
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

function TItem_Recebimento.AlterarAuto:Boolean;
begin
  try
    edit;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
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
    Situacao :=0;
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

procedure TItem_Recebimento.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EDBGrid.Enabled       := not Habilitar;
  Except
  End;
  Try
    EcodigoIRC.Enabled    := Habilitar;
  Except
  End;
  Try
    EcodigoPRD.Enabled    := Habilitar;
  Except
  End;
  Try
    EcodigoREC.Enabled    := Habilitar;
  Except
  End;
  Try
    Equantidade.Enabled   := Habilitar;
  Except
  End;
end;

procedure TItem_Recebimento.CancelaEdicao;
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

procedure TItem_Recebimento.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EcodigoPRD.text  :=inttostr(CodigoPRD);
  Except
  End;
  Try
    Equantidade.Text :=Format('%.2f', [Quantidade]);
  Except
  End;
end;

constructor TItem_Recebimento.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ITEM_DE_RECEBIMENTO';

     { Code to perform other tasks when the component is created }

end;

function TItem_Recebimento.Deletar(CdCNC, CdIRC: Integer):Boolean;
begin
  If not(localizarCod(CdIRC, CdCNC)) Then
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
           ECodigoPRD.Text  :='';
           Except
          End;
          try
           EQuantidade.Text  :='';
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

destructor TItem_Recebimento.Destroy;
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

function TItem_Recebimento.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem : string;
  aux:TDataSetNotifyEvent;
begin
  mensagem := '';
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    mensagem := mensagem + 'Código do Produto inválido!'+#13;
  if not VerificaFloatBranco(EQuantidade.Text) then
    mensagem := mensagem + 'Quantidade inválida!'+#13;
  if mensagem <> '' then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      If Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoREC;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

{ Insere um Recebimento }
function TItem_Recebimento.Inserir(CdCNC,CdIRC, CdREC, CdPRD: Integer;PQuantidade:Double;PSituacao:integer):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdIRC=0 then
    Cod    := ProximoCodigo('IRC_CODIGO')
  else
    Cod    := CdIRC;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      Insert;
      CodigoIRC      := Cod;
      CodigoCNC      := CdCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU; 
      DataCadastro   := CConfiguracao.DataHora;
      CodigoPRD      := CdPRD;
      CodigoREC      := CdREC;
      Quantidade     := PQuantidade;
      Situacao       := PSituacao;
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

function TItem_Recebimento.InserirAuto:Boolean;
Var
  Aux:TDataSetNotifyEvent;
begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        Codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        codigoIRC := SCodigo;
      except
      end;
      try
        codigoUSU := CConfiguracao.CodigoUSU;
      except
      end;      
      try
        DataCadastro := CConfiguracao.DataHora;
      except
      end;
      try
        CodigoPRD := strtoInt(ECodigoPRD.text);
      except
      end;
      try
        CodigoREC := strtoInt(ECodigoREC.text);
      except
      end;
      try
        Quantidade := StrToFloat(EQuantidade.Text);
      except
      end;
      Situacao := 0;
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

{ Localiza um Recebimento }
function TItem_Recebimento.LocalizarCod(CdIRC, CdCNC: Integer): Boolean;
begin
  If (CdIRC<>CodigoIRC) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; IRC_CODIGO', vararrayof([CdCNC, CdIRC]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_Recebimento.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TItem_Recebimento.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 ProximoCodigo('IRC_CODIGO');
  Try
   ECodigoPRD.clear;
   Except
  End;
  Try
   EQuantidade.Text  :='';
   Except
  End;
  AtualizaControles(True);
  Estado:=1;
end;

function TItem_Recebimento.deletarauto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    Result := Delete;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
