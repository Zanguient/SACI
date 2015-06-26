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
unit Boletim_Diario;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Funcionario, Caixa, Configuracao, Funcoes, 
     Variants;

type
  TBoletim_Diario = class(TSQuery)
    private
      { Private fields of TBoletim_Diario }
        { Storage for property CCaixa }
        FCCaixa : TCaixa;
        { Storage for property CFuncionario }
        FCFuncionario : TFuncionario;
        { Storage for property CodigoBLD }
        FCodigoBLD : Integer;
        { Storage for property CodigoCAX }
        FCodigoCAX : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property ECodigoBLD }
        FECodigoBLD : TEdit;
        { Storage for property ECodigoCAX }
        FECodigoCAX : TDBLookupComboBox;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComboBox;
        { Storage for property EData }
        FEData : TMaskEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property ETipo }
        FETipo : TEdit;
        { Storage for property ETotalCartao }
        FETotalCartao : TEdit;
        { Storage for property ETotalCheque }
        FETotalCheque : TEdit;
        { Storage for property ETotalDinheiro }
        FETotalDinheiro : TEdit;
        { Storage for property ETotalPreDatado }
        FETotalPreDatado : TEdit;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Tipo }
        FTipo : String;
        { Storage for property TotalCartao }
        FTotalCartao : Double;
        { Storage for property TotalCheque }
        FTotalCheque : Double;
        { Storage for property TotalDinheiro }
        FTotalDinheiro : Double;
        { Storage for property TotalPreDatado }
        FTotalPreDatado : Double;

      { Private methods of TBoletim_Diario }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoBLD }
        function GetCodigoBLD : Integer;
        { Write method for property CodigoBLD }
        procedure SetCodigoBLD(Value : Integer);
        { Read method for property CodigoCAX }
        function GetCodigoCAX : Integer;
        { Write method for property CodigoCAX }
        procedure SetCodigoCAX(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Tipo }
        function GetTipo : String;
        { Write method for property Tipo }
        procedure SetTipo(Value : String);
        { Read method for property TotalCartao }
        function GetTotalCartao : Double;
        { Write method for property TotalCartao }
        procedure SetTotalCartao(Value : Double);
        { Read method for property TotalCheque }
        function GetTotalCheque : Double;
        { Write method for property TotalCheque }
        procedure SetTotalCheque(Value : Double);
        { Read method for property TotalDinheiro }
        function GetTotalDinheiro : Double;
        { Write method for property TotalDinheiro }
        procedure SetTotalDinheiro(Value : Double);
        { Read method for property TotalPreDatado }
        function GetTotalPreDatado : Double;
        { Write method for property TotalPreDatado }
        procedure SetTotalPreDatado(Value : Double);

    protected
      { Protected fields of TBoletim_Diario }

      { Protected methods of TBoletim_Diario }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TBoletim_Diario }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TBoletim_Diario }
        { Altera um Boletim Diário }
        function Alterar(CdCNC,CdBLD, CdFUN, CdCAX, Cd1CCX: integer; PData, POBS:String; PTotalCartao, PTotalDinheiro, PTotalCheque,PTotalPre: Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdBLD:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Boletim Diário }
        function Inserir(CdCNC,CdBLD, CdFUN, CdCAX, Cd1CCX: integer; PData, POBS:String; PTotalCartao, PTotalDinheiro, PTotalCheque,PTotalPre: Double):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function Localizar(Tipo:String):Boolean;
        { Localiza um boletim diário }
        function LocalizarCod(CdBLD,CdCNC:Integer):Boolean;
        { Localiza um Boletim pela data }
        function LocalizarData(LData:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TBoletim_Diario }
        property CCaixa : TCaixa read FCCaixa write FCCaixa;
        property CFuncionario : TFuncionario
             read FCFuncionario write FCFuncionario;
        { Código do Boletim diário }
        property CodigoBLD : Integer read GetCodigoBLD write SetCodigoBLD;
        { Código do Caixa }
        property CodigoCAX : Integer read GetCodigoCAX write SetCodigoCAX;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Funcionário }
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property Data : Tdatetime read GetData write SetData;
        property ECodigoBLD : TEdit read FECodigoBLD write FECodigoBLD;
        property ECodigoCAX : TDBLookupComboBox
             read FECodigoCAX write FECodigoCAX;
        property ECodigoFUN : TDBLookupComboBox
             read FECodigoFUN write FECodigoFUN;
        property EData : TMaskEdit read FEData write FEData;
        property EOBS : TEdit read FEOBS write FEOBS;
        property ETipo : TEdit read FETipo write FETipo;
        property ETotalCartao : TEdit read FETotalCartao write FETotalCartao;
        property ETotalCheque : TEdit read FETotalCheque write FETotalCheque;
        property ETotalDinheiro : TEdit
             read FETotalDinheiro write FETotalDinheiro;
        property ETotalPreDatado : TEdit
             read FETotalPreDatado write FETotalPreDatado;
        property OBS : String read GetOBS write SetOBS;
        property Tipo : String read GetTipo write SetTipo;
        property TotalCartao : Double read GetTotalCartao write SetTotalCartao;
        property TotalCheque : Double read GetTotalCheque write SetTotalCheque;
        property TotalDinheiro : Double
             read GetTotalDinheiro write SetTotalDinheiro;
        property TotalPreDatado : Double
             read GetTotalPreDatado write SetTotalPreDatado;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TBoletim_Diario with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TBoletim_Diario]);
end;

{ Method to set variable and property values and create objects }
procedure TBoletim_Diario.AutoInitialize;
begin
     Estado := 0;
     FECodigoBLD := nil;
     FECodigoCAX := nil;
     FECodigoFUN := nil;
     FEData := nil;
     FEOBS := nil;
     FETipo := nil;
     FETotalCartao := nil;
     FETotalCheque := nil;
     FETotalDinheiro := nil;
     FETotalPreDatado := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TBoletim_Diario.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoBLD then
        FECodigoBLD := nil;
     if AComponent = FECodigoCAX then
        FECodigoCAX := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FETipo then
        FETipo := nil;
     if AComponent = FETotalCartao then
        FETotalCartao := nil;
     if AComponent = FETotalCheque then
        FETotalCheque := nil;
     if AComponent = FETotalDinheiro then
        FETotalDinheiro := nil;
     if AComponent = FETotalPreDatado then
        FETotalPreDatado := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TBoletim_Diario.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoBLD }
function TBoletim_Diario.GetCodigoBLD : Integer;
begin
  try
    Result := Self.fieldByName('BLD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoBLD }
procedure TBoletim_Diario.SetCodigoBLD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLD_CODIGO"!');
    end;
end;

{ Read method for property CodigoCAX }
function TBoletim_Diario.GetCodigoCAX : Integer;
begin
  try
    Result := Self.fieldByName('CAX_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCAX }
procedure TBoletim_Diario.SetCodigoCAX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CAX_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CAX_CODIGO"!');
  end;
end;

{ Read method for property CodigoCNC }
function TBoletim_Diario.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TBoletim_Diario.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TBoletim_Diario.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TBoletim_Diario.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TBoletim_Diario.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('BLD_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TBoletim_Diario.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BLD_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BLD_DATA"!');
  end;
end;

{ Read method for property OBS }
function TBoletim_Diario.GetOBS : String;
begin
  try
    Result := Self.fieldByName('BLD_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TBoletim_Diario.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BLD_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BLD_OBSERVACAO"!');
  end;
end;

{ Read method for property Tipo }
function TBoletim_Diario.GetTipo : String;
begin
  try
    Result := Self.fieldByName('BLD_TIPO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Tipo }
procedure TBoletim_Diario.SetTipo(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BLD_TIPO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BLD_TIPO"!');
  end;
end;

{ Read method for property TotalCartao }
function TBoletim_Diario.GetTotalCartao : Double;
begin
  try
    Result := Self.fieldByName('BLD_TOTAL_CARTAO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property TotalCartao }
procedure TBoletim_Diario.SetTotalCartao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BLD_TOTAL_CARTAO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BLD_TOTAL_CARTAO"!');
  end;
end;

{ Read method for property TotalCheque }
function TBoletim_Diario.GetTotalCheque : Double;
begin
  try
    Result := Self.fieldByName('BLD_TOTAL_CHEQUE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property TotalCheque }
procedure TBoletim_Diario.SetTotalCheque(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLD_TOTAL_CHEQUE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLD_TOTAL_CHEQUE"!');
    end;
end;

{ Read method for property TotalDinheiro }
function TBoletim_Diario.GetTotalDinheiro : Double;
begin
  try
    result := Self.fieldByName('BLD_TOTAL_DINHEIRO').asFloat;
  except
    result := 0
  end;
end;

{ Write method for property TotalDinheiro }
procedure TBoletim_Diario.SetTotalDinheiro(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLD_TOTAL_DINHEIRO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLD_TOTAL_DINHEIRO"!');
    end;
end;

{ Read method for property TotalPreDatado }
function TBoletim_Diario.GetTotalPreDatado : Double;
begin
  try
    Result := Self.fieldByName('BLD_TOTAL_PREDATADO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property TotalPreDatado }
procedure TBoletim_Diario.SetTotalPreDatado(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BLD_TOTAL_PREDATADO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BLD_TOTAL_PREDATADO"!');
    end;
end;

{ Altera um Boletim Diário }
function TBoletim_Diario.Alterar(CdCNC,CdBLD, CdFUN, CdCAX, Cd1CCX: integer; PData, POBS:String; PTotalCartao, PTotalDinheiro, PTotalCheque,PTotalPre: Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdBLD,CdCNC)) Then
  begin
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
    result:=false
  end
  Else
  Begin
    try
      edit;
      CodigoFUN        := CdFUN;
      CodigoCAX        := CdCAX;
      Data             := StrToDateTime(PData);
      TotalCartao      := PTotalCartao;
      TotalDinheiro    := PTotalDinheiro;
      TotalCheque      := PTotalCheque;
      TotalPreDatado   := PTotalPre;
      OBS              := POBS;

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

function TBoletim_Diario.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      edit;
      try
        CodigoFUN := ECodigoFUN.KeyValue;
      except
      end;
      try
        CodigoCAX := ECodigoCAX.KeyValue;
      except
      end;
      try
        Data := StrToDateTime(EData.Text);
      except
      end;
      try
        TotalCartao := StrToFloat(ETotalcartao.Text);
      except
      end;
      try
        TotalDinheiro := StrToFloat(ETotalDinheiro.Text);
      except
      end;
      try
        TotalCheque := StrToFloat(ETotalCheque.Text);
      except
      end;
      try
        TotalPreDatado := StrToFloat(ETotalPreDatado.Text);
      except
      end;
      try
         Obs := EOBS.Text;
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

procedure TBoletim_Diario.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EDBGrid.Enabled        :=not Habilitar;
  Except
  End;
  Try
   ECodigoFUN.Enabled        :=Habilitar;
   Except
  End;
  Try
//   ECodigoCAX.Enabled        :=Habilitar;
   Except
  End;
//  Try
//   EData.Enabled             :=Habilitar;
//   Except
//  End;
  Try
   ETotalCartao.Enabled  :=Habilitar;
   Except
  End;
  Try
   ETotalDinheiro.Enabled    :=Habilitar;
   Except
  End;
  Try
   ETotalCheque.Enabled     :=Habilitar;
   Except
  End;
  Try
   ETotalPreDatado.Enabled     :=Habilitar;
   Except
  End;
  Try
   EOBS.Enabled              :=Habilitar;
   Except
  End;
end;

procedure TBoletim_Diario.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TBoletim_Diario.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
   ECodigoBLD.Text                :=IntToStr(CodigoBLD);
  Except
  End;
  Try
   ECodigoFUN.KeyValue       :=CodigoFUN;
  Except
  End;
  Try
   ECodigoCAX.KeyValue       :=CodigoCAX;
  Except
  End;
  Try
    if Data=0 then
      EData.text:=''
    else
      EData.Text                :=FormatDateTime('dd/mm/yyyy hh:mm', Data);
  Except
  End;
  Try
   ETotalCartao.Text     :=Format('%.2f', [TotalCartao]);
  Except
  End;
  Try
   ETotalDinheiro.Text       :=Format('%.2f', [TotalDinheiro]);
  Except
  End;
  Try
   ETotalCheque.Text        :=Format('%.2f', [TotalCheque]);
  Except
  End;
  Try
   ETotalPreDatado.Text        :=Format('%.2f', [TotalPreDatado]);
  Except
  End;
  Try
   EOBS.Text                 :=OBS;
  Except
  End;
end;

constructor TBoletim_Diario.Create(AOwner: TComponent);
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

function TBoletim_Diario.Deletar(CdCNC,CdBLD:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdBLD,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).IsEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TBoletim_Diario.Destroy;
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

function TBoletim_Diario.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem := '';
  if ECodigoCAX.Text = '' then
    mensagem:=mensagem+'Caixa inválido!'+#13;
  if ECodigoFUN.Text = '' then
    mensagem:=mensagem+'Responsável inválido!'+#13;
  if not VerificaFloat(ETotalDinheiro.Text) then
    mensagem:=mensagem+'Total em Dinheiro inválido!'+#13;
  if not VerificaFloat(ETotalCheque.Text) then
    mensagem:=mensagem+'Total em Cheque inválido!'+#13;
  if not VerificaFloat(ETotalPreDatado.Text) then
    mensagem:=mensagem+'Total em PréDatado inválido!'+#13;
  if not VerificaFloat(ETotalCartao.Text) then
    mensagem:=mensagem+'Total em Cartão inválido!'+#13;
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
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        Result := True;
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Boletim Diário }
function TBoletim_Diario.Inserir(CdCNC,CdBLD, CdFUN, CdCAX, Cd1CCX: integer; PData, POBS:String; PTotalCartao, PTotalDinheiro, PTotalCheque,PTotalPre: Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdBLD=0 then
    Cod    := ProximoCodigo('BLD_CODIGO')
  else
    Cod    := CdBLD;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
     try
       INsert;
       CodigoBLD      := Cod;
       CodigoCNC        := CdCNC;
       CodigoFUN        := CdFUN;
       CodigoCAX        := CdCAX;
       Data             := StrToDateTime(PData);
       TotalCartao      := PTotalCartao;
       TotalDinheiro    := PTotalDinheiro;
       TotalCheque      := PTotalCheque;
       TotalPreDatado   := PTotalPre;
       OBS              := POBS;

       try
         Post;
         result:=true;
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

function TBoletim_Diario.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (localizarCod(SCodigo,CodigoCNC)) Then
  begin
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
    result:=false;
  end
  Else
  begin
    try
      append;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        codigoBLD := SCodigo;
      except
      end;
      try
        CodigoFUN := ECodigoFUN.KeyValue;
      except
      end;
      try
        CodigoCAX := ECodigoCAX.KeyValue;
      except
      end;
      try
        Data := StrToDateTime(EData.Text);
      except
      end;
      try
        TotalCartao := StrToFloat(ETotalCartao.Text);
      except
      end;
      try
        TotalDinheiro := StrToFloat(ETotalDinheiro.Text);
      except
      end;
      try
        TotalCheque := StrToFloat(ETotalCheque.Text);
      except
      end;
      try
        TotalPreDatado := StrToFloat(ETotalPreDatado.Text);
      except
      end;
      try
         Obs := EOBS.Text;
      except
      end;
      try
         Tipo := ETipo.Text;
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
end;

procedure TBoletim_Diario.LimpaCampos;
begin
  if Estado <> 1 then
    ECodigoBLD.Clear
  else
    ECodigoBLD.Text := IntToStr(ProximoCodigo('BLD_CODIGO'));
    
  Try
    if Estado <> 1 then
      ECodigoCAX.KeyValue := -1     
    else  
      ECodigoCAX.KeyValue := CConfiguracao.CodigoCAX;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoFUN.KeyValue := -1
    else  
      ECodigoFUN.KeyValue := CCaixa.CodigoFUN;
  Except
  End;
  Try
    if Estado <> 1 then
      EData.Clear
    else  
      EData.Text :=DateTimeToStr(CConfiguracao.DataHora);
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalCartao.Clear
    else  
      ETotalCartao.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalDinheiro.Clear
    else  
      ETotalDinheiro.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalCheque.Clear
    else  
      ETotalCheque.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalPreDatado.Clear
    else  
      ETotalPreDatado.Text := '0,00';
  Except
  End;
  Try
    EOBS.Clear;
  Except
  End;
end;

function TBoletim_Diario.Localizar(Tipo:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Result:=false;
  Try
    If locate('BLD_DATA;CAX_CODIGO;BLD_TIPO',VarArrayOf([CConfiguracao.Data,CConfiguracao.CodigoCAX,Tipo]),[]) then
      result:=True;
  Except
    Result:=False;
  End;
end;

{ Localiza um boletim diário }
function TBoletim_Diario.LocalizarCod(CdBLD,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdBLD<>CodigoBLD) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;BLD_CODIGO', vararrayof([CdCNC, CdBLD]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

{ Localiza um Boletim pela data }
function TBoletim_Diario.LocalizarData(LData:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Locate('BLD_DATA', Ldata, []) Then
    Result:=True
  else
    Result:=False
end;

procedure TBoletim_Diario.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
   EData.Text :=DateTimeToStr(CConfiguracao.DataHora);
  Except
  End;
  Estado:=2;
  AtualizaControles(True);
end;

procedure TBoletim_Diario.PreparaInsercao;
begin
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TBoletim_Diario.deletarauto:Boolean;
begin
  Result:=False;
  try
    if Delete then
    Begin
      Result := False;
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except    
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
