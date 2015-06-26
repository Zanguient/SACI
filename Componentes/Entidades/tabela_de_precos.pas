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
unit Tabela_de_precos;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Variants;

type
  TTabela_de_Precos = class(TSQuery)
    private
      { Private fields of TTabela_de_Precos }
        { Storage for property AgenteExclusivo }
        FAgenteExclusivo : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoTBP }
        FCodigoTBP : Integer;
        { Storage for property DescontoEspecial }
        FDescontoEspecial : Double;
        { Storage for property DescontoEspecialPrazo }
        FDescontoEspecialPrazo : Double;
        { Storage for property DescontoSimples }
        FDescontoSimples : Double;
        { Storage for property DescontoSimplesPrazo }
        FDescontoSimplesPrazo : Double;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property EAgenteExclusivo }
        FEAgenteExclusivo : TDBLookupComboBox;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoTBP }
        FECodigoTBP : TEdit;
        { Storage for property EDescontoEspecial }
        FEDescontoEspecial : TEdit;
        { Storage for property EDescontoEspecialPrazo }
        FEDescontoEspecialPrazo : TEdit;
        { Storage for property EDescontoSimples }
        FEDescontoSimples : TEdit;
        { Storage for property EDescontoSimplesPrazo }
        FEDescontoSimplesPrazo : TEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EIndice }
        FEIndice : TEdit;
        { Storage for property EPrazoMedio }
        FEPrazoMedio : TEdit;
        { Storage for property EValidade }
        FEValidade : TMaskEdit;
        { Storage for property Indice }
        FIndice : Double;
        { Storage for property PrazoMedio }
        FPrazoMedio : Integer;
        { Storage for property Validade }
        FValidade : Tdatetime;

      { Private methods of TTabela_de_Precos }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property AgenteExclusivo }
        function GetAgenteExclusivo : Integer;
        { Write method for property AgenteExclusivo }
        procedure SetAgenteExclusivo(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoTBP }
        function GetCodigoTBP : Integer;
        { Write method for property CodigoTBP }
        procedure SetCodigoTBP(Value : Integer);
        { Read method for property DescontoEspecial }
        function GetDescontoEspecial : Double;
        { Write method for property DescontoEspecial }
        procedure SetDescontoEspecial(Value : Double);
        { Read method for property DescontoEspecialPrazo }
        function GetDescontoEspecialPrazo : Double;
        { Write method for property DescontoEspecialPrazo }
        procedure SetDescontoEspecialPrazo(Value : Double);
        { Read method for property DescontoSimples }
        function GetDescontoSimples : Double;
        { Write method for property DescontoSimples }
        procedure SetDescontoSimples(Value : Double);
        { Read method for property DescontoSimplesPrazo }
        function GetDescontoSimplesPrazo : Double;
        { Write method for property DescontoSimplesPrazo }
        procedure SetDescontoSimplesPrazo(Value : Double);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Indice }
        function GetIndice : Double;
        { Write method for property Indice }
        procedure SetIndice(Value : Double);
        { Read method for property PrazoMedio }
        function GetPrazoMedio : Integer;
        { Write method for property PrazoMedio }
        procedure SetPrazoMedio(Value : Integer);
        { Read method for property Validade }
        function GetValidade : Tdatetime;
        { Write method for property Validade }
        procedure SetValidade(Value : Tdatetime);

    protected
      { Protected fields of TTabela_de_Precos }

      { Protected methods of TTabela_de_Precos }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TTabela_de_Precos }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TTabela_de_Precos }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdTBP:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere uma Tabela de Preço }
        function Inserir(CdCNC, CdTBP, PPrazoMedio: Integer; PDescricao: String;PValidade:TDateTime;PIndice, PDescEsp, PDescSimples:Real):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza uma Tabela de Preço }
        function LocalizarCod(CdTBP,CdCNC:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TTabela_de_Precos }
        property AgenteExclusivo : Integer
             read GetAgenteExclusivo write SetAgenteExclusivo;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código da tabela de preços }
        property CodigoTBP : Integer read GetCodigoTBP write SetCodigoTBP;
        property DescontoEspecial : Double
             read GetDescontoEspecial write SetDescontoEspecial;
        property DescontoEspecialPrazo : Double
             read GetDescontoEspecialPrazo write SetDescontoEspecialPrazo;
        property DescontoSimples : Double
             read GetDescontoSimples write SetDescontoSimples;
        property DescontoSimplesPrazo : Double
             read GetDescontoSimplesPrazo write SetDescontoSimplesPrazo;
        property Descricao : String read GetDescricao write SetDescricao;
        property EAgenteExclusivo : TDBLookupComboBox
             read FEAgenteExclusivo write FEAgenteExclusivo;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoTBP : TEdit read FECodigoTBP write FECodigoTBP;
        property EDescontoEspecial : TEdit
             read FEDescontoEspecial write FEDescontoEspecial;
        property EDescontoEspecialPrazo : TEdit
             read FEDescontoEspecialPrazo write FEDescontoEspecialPrazo;
        property EDescontoSimples : TEdit
             read FEDescontoSimples write FEDescontoSimples;
        property EDescontoSimplesPrazo : TEdit
             read FEDescontoSimplesPrazo write FEDescontoSimplesPrazo;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EIndice : TEdit read FEIndice write FEIndice;
        property EPrazoMedio : TEdit read FEPrazoMedio write FEPrazoMedio;
        property EValidade : TMaskEdit read FEValidade write FEValidade;
        property Indice : Double read GetIndice write SetIndice;
        property PrazoMedio : Integer read GetPrazoMedio write SetPrazoMedio;
        property Validade : Tdatetime read GetValidade write SetValidade;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTabela_de_Precos with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTabela_de_Precos]);
end;

{ Method to set variable and property values and create objects }
procedure TTabela_de_Precos.AutoInitialize;
begin
     Estado := 0;
     FEAgenteExclusivo := nil;
     FECodigoCNC := nil;
     FECodigoTBP := nil;
     FEDescontoEspecial := nil;
     FEDescontoEspecialPrazo := nil;
     FEDescontoSimples := nil;
     FEDescontoSimplesPrazo := nil;
     FEDescricao := nil;
     FEIndice := nil;
     FEPrazoMedio := nil;
     FEValidade := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TTabela_de_Precos.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAgenteExclusivo then
        FEAgenteExclusivo := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoTBP then
        FECodigoTBP := nil;
     if AComponent = FEDescontoEspecial then
        FEDescontoEspecial := nil;
     if AComponent = FEDescontoEspecialPrazo then
        FEDescontoEspecialPrazo := nil;
     if AComponent = FEDescontoSimples then
        FEDescontoSimples := nil;
     if AComponent = FEDescontoSimplesPrazo then
        FEDescontoSimplesPrazo := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEIndice then
        FEIndice := nil;
     if AComponent = FEPrazoMedio then
        FEPrazoMedio := nil;
     if AComponent = FEValidade then
        FEValidade := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TTabela_de_Precos.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property AgenteExclusivo }
function TTabela_de_Precos.GetAgenteExclusivo : Integer;
begin
  try
    Result := Self.fieldByName('TBP_AGF_EXCLUSIVO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property AgenteExclusivo }
procedure TTabela_de_Precos.SetAgenteExclusivo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_AGF_EXCLUSIVO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_AGF_EXCLUSIVO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TTabela_de_Precos.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCNC }
procedure TTabela_de_Precos.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoTBP }
function TTabela_de_Precos.GetCodigoTBP : Integer;
begin
  try
    Result := Self.fieldByName('TBP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTBP }
procedure TTabela_de_Precos.SetCodigoTBP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_CODIGO"!');
    end;
end;

{ Read method for property DescontoEspecial }
function TTabela_de_Precos.GetDescontoEspecial : Double;
begin
  try
    Result := Self.fieldByName('TBP_DESCONTO_ESPECIAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property DescontoEspecial }
procedure TTabela_de_Precos.SetDescontoEspecial(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_DESCONTO_ESPECIAL').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_DESCONTO_ESPECIAL"!');
    end;
end;

{ Read method for property DescontoEspecialPrazo }
function TTabela_de_Precos.GetDescontoEspecialPrazo : Double;
begin
  try
    Result := Self.fieldByName('TBP_DESCONTO_ESPECIAL_PRAZO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property DescontoEspecialPrazo }
procedure TTabela_de_Precos.SetDescontoEspecialPrazo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_DESCONTO_ESPECIAL_PRAZO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_DESCONTO_ESPECIAL_PRAZO"!');
    end;
end;

{ Read method for property DescontoSimples }
function TTabela_de_Precos.GetDescontoSimples : Double;
begin
  try
    Result := Self.fieldByName('TBP_DESCONTO_SIMPLES').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property DescontoSimples }
procedure TTabela_de_Precos.SetDescontoSimples(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_DESCONTO_SIMPLES').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_DESCONTO_SIMPLES"!');
    end;
end;

{ Read method for property DescontoSimplesPrazo }
function TTabela_de_Precos.GetDescontoSimplesPrazo : Double;
begin
  try
    Result := Self.fieldByName('TBP_DESCONTO_SIMPLES_PRAZO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property DescontoSimplesPrazo }
procedure TTabela_de_Precos.SetDescontoSimplesPrazo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_DESCONTO_SIMPLES_PRAZO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_DESCONTO_SIMPLES_PRAZO"!');
    end;
end;

{ Read method for property Descricao }
function TTabela_de_Precos.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('TBP_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TTabela_de_Precos.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TBP_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TBP_DESCRICAO"!');
  end;
end;

{ Read method for property Indice }
function TTabela_de_Precos.GetIndice : Double;
begin
  try
    Result := Self.fieldByName('TBP_INDICE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Indice }
procedure TTabela_de_Precos.SetIndice(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_INDICE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_INDICE"!');
    end;
end;

{ Read method for property PrazoMedio }
function TTabela_de_Precos.GetPrazoMedio : Integer;
begin
  try
    Result := Self.fieldByName('TBP_PRAZO_MEDIO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property PrazoMedio }
procedure TTabela_de_Precos.SetPrazoMedio(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_PRAZO_MEDIO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_PRAZO_MEDIO"!');
    end;
end;

{ Read method for property Validade }
function TTabela_de_Precos.GetValidade : Tdatetime;
begin
  try
    Result := Self.fieldByName('TBP_VALIDADE').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Validade }
procedure TTabela_de_Precos.SetValidade(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TBP_VALIDADE').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TBP_VALIDADE"!');
  end;
end;

function TTabela_de_Precos.AlterarAuto:Boolean;
var
  CdCNC, CdTBP, CdAGF: integer;
  DtValidade: TDateTime;
begin
  Result:=false;
  CdCNC := CodigoCNC;
  CdTBP := CodigoTBP;
  CdAGF := AgenteExclusivo;
  DtValidade := Validade;
  try
    edit;
    try
       Descricao  := EDescricao.Text;
    except
    end;
    try
       Indice := StrToFloat(EIndice.Text);
    except
    end;
    try
       DescontoSimples := StrToFloat(EDescontoSimples.Text);
    except
    end;
    try
       DescontoEspecial := StrToFloat(EDescontoEspecial.Text);
    except
    end;
    try
       DescontoSimplesPrazo := StrToFloat(EDescontoSimplesPrazo.Text);
    except
    end;
    try
       DescontoEspecialPrazo := StrToFloat(EDescontoEspecialPrazo.Text);
    except
    end;
    try
       PrazoMedio := StrToInt(EPrazoMedio.Text);
    except
    end;
    try
       Validade  := StrToDateTime(EValidade.Text);
    except
    end;
    try
      if EAgenteExclusivo.Text <> '' then
        AgenteExclusivo  := EAgenteExclusivo.KeyValue
      else
        AgenteExclusivo  := 0;
    except
    end;
    try
      Post;
      GeraLog(6910, CdCNC, CdTBP, ' Validade:'+DateToStr(DtValidade)+
        ' Simples:'+EDescontoSimples.Text+
        ' Especial:'+EDescontoEspecial.Text+
        ' SimplesPrazo:'+EDescontoSimplesPrazo.Text+
        ' EspecialPrazo:'+EDescontoEspecialPrazo.Text+
        ' AGF:'+IntToStr(CdAGF));
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TTabela_de_Precos.AtualizaControles(Habilitar:Boolean);
begin
  Try
    if Estado = 1 then
      ECodigoCNC.Enabled     :=Habilitar
    else
      ECodigoCNC.Enabled     := False;
  Except
  End;
  Try
    EDescricao.Enabled     :=Habilitar;
  Except
  End;
  Try
    EIndice.Enabled        :=Habilitar;
  Except
  End;
  Try
    EDescontoSimples.Enabled        :=Habilitar;
  Except
  End;
  Try
    EDescontoEspecial.Enabled        :=Habilitar;
  Except
  End;
  Try
    EDescontoSimplesPrazo.Enabled        :=Habilitar;
  Except
  End;
  Try
    EDescontoEspecialPrazo.Enabled        :=Habilitar;
  Except
  End;
  Try
    EPrazoMedio.Enabled    := Habilitar;
  Except
  End;
  Try
    EValidade.Enabled      := Habilitar;
  Except
  End;
  Try
    EAgenteExclusivo.Enabled      := Habilitar;
  Except
  End;
end;

procedure TTabela_de_Precos.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TTabela_de_Precos.CarregaDados;
begin
 Try
   ECodigoTBP.Text        :=IntToStr(CodigoTBP);
  Except
  End;
  try
    ECodigoCNC.KeyValue   := CodigoCNC;
  except
  end;
  Try
    EDescricao.Text        :=Descricao;
  Except
  End;
  Try
    EIndice.Text           :=Format('%.2f', [Indice]);
  Except
  End;
  Try
    EDescontoEspecial.Text           :=Format('%.2f', [DescontoEspecial]);
  Except
  End;
  Try
    EDescontoSimples.Text           :=Format('%.2f', [DescontoSimples]);
  Except
  End;
  Try
    EDescontoEspecialPrazo.Text           :=Format('%.2f', [DescontoEspecialPrazo]);
  Except
  End;
  Try
    EDescontoSimplesPrazo.Text           :=Format('%.2f', [DescontoSimplesPrazo]);
  Except
  End;
  Try
    EPrazoMedio.Text       :=IntToStr(PrazoMedio);
  Except
  End;
  Try
   if Validade=0 then
     EValidade.Text:=''
   else
     EValidade.Text            :=FormatDateTime('dd/mm/yyyy', Validade);
  Except
  End;
  Try
    EAgenteExclusivo.KeyValue := AgenteExclusivo;
  Except
  End;
end;

constructor TTabela_de_Precos.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'TABELA_DE_PRECO';

     { Code to perform other tasks when the component is created }

end;

function TTabela_de_Precos.Deletar(CdCNC,CdTBP:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdTBP,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        GeraLog(6930,CdCNC,CdTBP);
        RegistrarDel(CdCNC,1980(*TabelaDePreco*),CdTBP);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TTabela_de_Precos.Destroy;
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

function TTabela_de_Precos.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if EDescontoSimples.Text = '' then
    EDescontoSimples.Text := '0';
  if EDescontoEspecial.Text = '' then
    EDescontoEspecial.Text := '0';
  if EDescontoSimplesPrazo.Text = '' then
    EDescontoSimplesPrazo.Text := '0';
  if EDescontoEspecialPrazo.Text = '' then
    EDescontoEspecialPrazo.Text := '0';
  if EPrazoMedio.Text = '' then
    EPrazoMedio.Text := '0';
  if EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição incorreta!'+#13;
  If not VerificadataBranco(EValidade.text) Then
    mensagem:=mensagem+'Validade incorreta!'+#13;
  if not verificafloat(EDescontoSimples.text) then
    mensagem:= mensagem + 'Desconto Simples digitado incorretamente!';
  if not verificafloat(EDescontoEspecial.text) then
    mensagem:= mensagem + 'Desconto Especial digitado incorretamente!';
  if not verificafloat(EDescontoSimplesPrazo.text) then
    mensagem:= mensagem + 'Desconto Simples Prazo digitado incorretamente!';
  if not verificafloat(EDescontoEspecialPrazo.text) then
    mensagem:= mensagem + 'Desconto Especial Prazo digitado incorretamente!';
  If mensagem <>'' Then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        close;
        SQL.Text := 'SELECT * FROM TABELA_DE_PRECO '+
          ' WHERE TBP_CODIGO='+IntToStr(SCodigo);
        open;
        AtualizaControles(False);
        Estado:=0;
        Result := true;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoTBP;
      if Alterarauto then
      Begin
        close;
        SQL.Text := 'SELECT * FROM TABELA_DE_PRECO '+
          ' WHERE TBP_CODIGO='+IntToStr(Cod);
        open;
        AtualizaControles(False);
        Estado:=0;
        Result := True;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere uma Tabela de Preço }
function TTabela_de_Precos.Inserir(CdCNC, CdTBP, PPrazoMedio: Integer; PDescricao: String;PValidade:TDateTime;PIndice, PDescEsp, PDescSimples:Real):boolean;
Var
  Cod: Integer;
begin
  if CdTBP=0 then
    Cod    := ProximoCodigo('TBP_CODIGO')
  else
    Cod    := CdTBP;
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
       CodigoTBP      := Cod;
       CodigoCNC      := CdCNC;
       Descricao      := PDescricao;
       DescontoEspecial:=PDescEsp;
       DescontoSimples:= PDescSimples;
       Indice         := PIndice;
       PrazoMedio     := PPrazoMedio;
       Validade       := PValidade;
       AgenteExclusivo := 0;

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

function TTabela_de_Precos.InserirAuto:Boolean;
Var
  sDetalhe: string;
begin
  result:=false;
  try
    append;
    try
      codigoCNC   := ECodigoCNC.KeyValue;
    except
    end;
    try
      CodigoTBP   := SCodigo;
    except
    end;
    try
       Descricao  := EDescricao.Text;
       sDetalhe := sDetalhe + EDescricao.Text;
    except
    end;
    try
       Indice := StrToFloat(EIndice.Text);
    except
    end;
    try
       DescontoSimples := StrToFloat(EDescontoSimples.Text);
       sDetalhe := sDetalhe + ' DescVista:'+EDescontoSimples.Text;
    except
    end;
    try
       DescontoEspecial := StrToFloat(EDescontoEspecial.Text);
       sDetalhe := sDetalhe + ' DescVistaEsp:'+EDescontoEspecial.Text;
    except
    end;
    try
       DescontoSimplesPrazo := StrToFloat(EDescontoSimplesPrazo.Text);
       sDetalhe := sDetalhe + ' DescPrazo:'+EDescontoSimplesPrazo.Text;
    except
    end;
    try
       DescontoEspecialPrazo := StrToFloat(EDescontoEspecialPrazo.Text);
       sDetalhe := sDetalhe + ' DescPrazoEsp:'+EDescontoEspecialPrazo.Text;
    except
    end;
    try
       PrazoMedio := StrToInt(EPrazoMedio.Text);
    except
    end;
    try
       Validade  := StrToDateTime(EValidade.Text);
       sDetalhe := sDetalhe + ' Validade:'+EValidade.Text;
    except
    end;
    try
      if EAgenteExclusivo.Text <> '' then
      Begin
        AgenteExclusivo  := EAgenteExclusivo.KeyValue;
        sDetalhe := sDetalhe + ' AGF:'+IntToStr(EAgenteExclusivo.KeyValue);
      end
      else
      Begin
        AgenteExclusivo  := 0;
        sDetalhe := sDetalhe + ' AGF:0';
      end;
    except
    end;
    try
      Post;
      GeraLog(6910, ECodigoCNC.KeyValue, SCodigo, sDetalhe);
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TTabela_de_Precos.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoTBP.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoCNC.KeyValue := -1
    else
      ECodigoCNC.KeyValue := CConfiguracao.CodigoCNC;
  Except
  End;
  Try
    EDescricao.Clear;
  Except
  End;
  Try
    EIndice.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EDescontoSimples.Clear
    else
      EDescontoSimples.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      EDescontoEspecial.Clear
    else
      EDescontoEspecial.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      EDescontoSimplesPrazo.Clear
    else
      EDescontoSimplesPrazo.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      EDescontoEspecialPrazo.Clear
    else
      EDescontoEspecialPrazo.Text := '0';
  Except
  End;
  Try
    EPrazoMedio.Clear;
  Except
  End;
  Try
    EValidade.Clear;
  Except
  End;
  Try
    EAgenteExclusivo.KeyValue := 0;
  Except
  End;
end;

{ Localiza uma Tabela de Preço }
function TTabela_de_Precos.LocalizarCod(CdTBP,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdTBP<>CodigoTBP) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;TBP_CODIGO', vararrayof([CdCNC, CdTBP]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TTabela_de_Precos.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>Descricao Then
    If locate('TBP_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TTabela_de_Precos.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TTabela_de_Precos.PreparaInsercao;
begin
  ProximoCodigo('TBP_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
