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
unit Item_Tabela_de_Precos;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Tabela_de_Precos, Configuracao, 
     Variants, Funcoes;

type
  TItem_Tabela_de_Precos = class(TSQuery)
    private
      { Private fields of TItem_Tabela_de_Precos }
        { Storage for property Bonificacao }
        FBonificacao : Double;
        { Storage for property CodigoITP }
        FCodigoITP : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoTBP }
        FCodigoTBP : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EBonificacao }
        FEBonificacao : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoITP }
        FECodigoITP : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoTBP }
        FECodigoTBP : TEdit;
        { Storage for property EPreco }
        FEPreco : TEdit;
        { Storage for property EPrecoOriginal }
        FEPrecoOriginal : TEdit;
        { Storage for property EQuantMin }
        FEQuantMin : TEdit;
        { Storage for property Preco }
        FPreco : Double;
        { Storage for property PrecoOriginal }
        FPrecoOriginal : Double;
        { Storage for property QuantMin }
        FQuantMin : Double;

      { Private methods of TItem_Tabela_de_Precos }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Bonificacao }
        function GetBonificacao : Double;
        { Write method for property Bonificacao }
        procedure SetBonificacao(Value : Double);
        { Read method for property CodigoITP }
        function GetCodigoITP : Integer;
        { Write method for property CodigoITP }
        procedure SetCodigoITP(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoTBP }
        function GetCodigoTBP : Integer;
        { Write method for property CodigoTBP }
        procedure SetCodigoTBP(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Preco }
        function GetPreco : Double;
        { Write method for property Preco }
        procedure SetPreco(Value : Double);
        { Read method for property PrecoOriginal }
        function GetPrecoOriginal : Double;
        { Write method for property PrecoOriginal }
        procedure SetPrecoOriginal(Value : Double);
        { Read method for property QuantMin }
        function GetQuantMin : Double;
        { Write method for property QuantMin }
        procedure SetQuantMin(Value : Double);

    protected
      { Protected fields of TItem_Tabela_de_Precos }

      { Protected methods of TItem_Tabela_de_Precos }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_Tabela_de_Precos }

      { Public methods of TItem_Tabela_de_Precos }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdITP:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC,CdITP, CdTBP, CdPRD: Integer; PPrecoOriginal, PPreco,PBonificacao,PQuantMin:Double):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdITP,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TItem_Tabela_de_Precos }
        property Bonificacao : Double read GetBonificacao write SetBonificacao;
        { Código da tabela de preços }
        property CodigoITP : Integer read GetCodigoITP write SetCodigoITP;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoTBP : Integer read GetCodigoTBP write SetCodigoTBP;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EBonificacao : TEdit read FEBonificacao write FEBonificacao;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoITP : TEdit read FECodigoITP write FECodigoITP;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoTBP : TEdit read FECodigoTBP write FECodigoTBP;
        property EPreco : TEdit read FEPreco write FEPreco;
        property EPrecoOriginal : TEdit
             read FEPrecoOriginal write FEPrecoOriginal;
        property EQuantMin : TEdit read FEQuantMin write FEQuantMin;
        property Preco : Double read GetPreco write SetPreco;
        property PrecoOriginal : Double
             read GetPrecoOriginal write SetPrecoOriginal;
        property QuantMin : Double read GetQuantMin write SetQuantMin;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_Tabela_de_Precos with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_Tabela_de_Precos]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_Tabela_de_Precos.AutoInitialize;
begin
     FEBonificacao := nil;
     FECodigoCNC := nil;
     FECodigoITP := nil;
     FECodigoPRD := nil;
     FECodigoTBP := nil;
     FEPreco := nil;
     FEPrecoOriginal := nil;
     FEQuantMin := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_Tabela_de_Precos.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBonificacao then
        FEBonificacao := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoITP then
        FECodigoITP := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoTBP then
        FECodigoTBP := nil;
     if AComponent = FEPreco then
        FEPreco := nil;
     if AComponent = FEPrecoOriginal then
        FEPrecoOriginal := nil;
     if AComponent = FEQuantMin then
        FEQuantMin := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_Tabela_de_Precos.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Bonificacao }
function TItem_Tabela_de_Precos.GetBonificacao : Double;
begin
  try
    Result := Self.fieldByName('ITP_BONIFICACAO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Bonificacao }
procedure TItem_Tabela_de_Precos.SetBonificacao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITP_BONIFICACAO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITP_BONIFICACAO"!');
    end;
end;

{ Read method for property CodigoITP }
function TItem_Tabela_de_Precos.GetCodigoITP : Integer;
begin
  try
    Result := Self.fieldByName('ITP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoITP }
procedure TItem_Tabela_de_Precos.SetCodigoITP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITP_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItem_Tabela_de_Precos.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_Tabela_de_Precos.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Read method for property CodigoTBP }
function TItem_Tabela_de_Precos.GetCodigoTBP : Integer;
begin
  try
    Result := Self.fieldByName('TBP_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTBP }
procedure TItem_Tabela_de_Precos.SetCodigoTBP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItem_Tabela_de_Precos.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('ITP_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItem_Tabela_de_Precos.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITP_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITP_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TItem_Tabela_de_Precos.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('ITP_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItem_Tabela_de_Precos.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITP_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITP_DT_CADASTRO"!');
    end;
end;

{ Read method for property Preco }
function TItem_Tabela_de_Precos.GetPreco : Double;
begin
  try
    Result := Self.fieldByName('ITP_PRECO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Preco }
procedure TItem_Tabela_de_Precos.SetPreco(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITP_PRECO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITP_PRECO"!');
  end;
end;

{ Read method for property PrecoOriginal }
function TItem_Tabela_de_Precos.GetPrecoOriginal : Double;
begin
  try
    Result := Self.fieldByName('ITP_PRECO_ORIGINAL').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PrecoOriginal }
procedure TItem_Tabela_de_Precos.SetPrecoOriginal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITP_PRECO_ORIGINAL').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITP_PRECO_ORIGINAL"!');
  end;
end;

{ Read method for property QuantMin }
function TItem_Tabela_de_Precos.GetQuantMin : Double;
begin
  try
    Result := Self.fieldByName('ITP_QUANT_MIN').asFloat;
  except
    Result := 0;
  end;
end;

{ Write method for property QuantMin }
procedure TItem_Tabela_de_Precos.SetQuantMin(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITP_QUANT_MIN').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITP_QUANT_MIN"!');
  end;
end;

function TItem_Tabela_de_Precos.AlterarAuto:Boolean;
var
  CdCNC, CdITP, CdPRD: integer;
begin
  Result:=false;
  CdCNC := CodigoCNC;
  CdITP := CodigoITP;
  CdPRD := CodigoPRD;
  try
    edit;
    try
       CodigoTBP   := StrToInt(ECodigoTBP.Text);
    except
    end;
    try
       CodigoPRD  := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
       CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;    
    try
       DataAlterado  := CConfiguracao.DataHora;
    except
    end;
    try
       Preco      := StrToFloat(EPreco.Text);
    except
    end;
    try
       Bonificacao := StrToFloat(EBonificacao.Text);
    except
    end;
    try
       QuantMin    := StrToFloat(EQuantMin.Text);
    except
    end;

    try
      Post;
      GeraLog(6920,CdCNC,CdITP,'PRD:'+IntToStr(CdPRD));
      Result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TItem_Tabela_de_Precos.AtualizaControles(Habilitar:Boolean);
begin
  Try
    ECodigoPRD.Enabled     :=Habilitar;
  Except
  End;
  Try
    EPreco.Enabled         :=Habilitar;
  Except
  End;
  Try
    EBonificacao.Enabled   :=Habilitar;
  Except
  End;
  Try
    EQuantMin.Enabled      :=Habilitar;
  Except
  End;
end;

procedure TItem_Tabela_de_Precos.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TItem_Tabela_de_Precos.CarregaDados;
begin

  Try
    ECodigoPRD.Text    := IntToStr(CodigoPRD);
  Except
  End;
  Try
    EPreco.Text            :=Format('%.2f', [Preco]);
  Except
  End;
  Try
    EPrecoOriginal.Text            :=Format('%.2f', [PrecoOriginal]);
  Except
  End;
  Try
    EBonificacao.Text      :=Format('%.2f', [Bonificacao]);
  Except
  End;
  Try
    EQuantMin.Text         :=Format('%.2f', [QuantMin]);
  Except
  End;
end;

constructor TItem_Tabela_de_Precos.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ITEM_DE_TABELA_DE_PRECO';

     { Code to perform other tasks when the component is created }

end;

function TItem_Tabela_de_Precos.Deletar(CdCNC,CdITP:Integer):Boolean;
var
  CdTBP, CdPRD: integer;
begin
  Result := False;
  If not(localizarCod(CdITP,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdTBP := CodigoTBP;
      CdPRD := CodigoPRD;
      if Delete then
      Begin
        Result := True;
        GeraLog(6940,CdCNC,CdITP,'PRD:'+IntToStr(CdPRD));
        RegistrarDel(CdCNC,1670(*ItemDeTabelaDePreco*),CdITP,'TBP:'+IntToStr(CdTBP)+' PRD:'+IntToStr(CdPRD));
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_Tabela_de_Precos.Destroy;
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

function TItem_Tabela_de_Precos.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem :string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem := '';
  if EBonificacao.Text = '' then
    EBonificacao.Text := '0';
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    mensagem := mensagem + 'Código do Produto inválido!'+#13;
  if not VerificaFloat(EQuantMin.Text) then
    mensagem := mensagem + 'Quantidade mínima inválida!'+#13;
  if not VerificaFloatBranco(EPreco.Text) then
    mensagem := mensagem + 'Preço de Tabela inválido!'+#13;
  if mensagem <> '' then
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
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
        Result := True;
      end;
    End
    else If Estado=2 then
    Begin
      cod:=codigoITP;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        close;
        open;
        LocalizarCod(cod, cdcnc);
        AtualizaControles(False);
        Estado:=0;
        Result := True;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Cliente }
function TItem_Tabela_de_Precos.Inserir(CdCNC,CdITP, CdTBP, CdPRD: Integer; PPrecoOriginal, PPreco,PBonificacao,PQuantMin:Double):boolean;
Var
  Cod: Integer;
begin
  if CdITP=0 then
    Cod    := ProximoCodigo('ITP_CODIGO')
  else
    Cod    := CdITP;
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
        CodigoITP      := Cod;
        CodigoCNC      := CdCNC;
        CodigoPRD      := CdPRD;
        CodigoUSU      := CConfiguracao.CodigoUSU;
        DataCadastro   := CConfiguracao.DataHora;
        CodigoTBP      := CdTBP;
        PrecoOriginal  := PPrecoOriginal;
        Preco          := PPreco;
        Bonificacao    := PBonificacao;
        QuantMin       := PQuantMin;

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

function TItem_Tabela_de_Precos.InserirAuto:Boolean;
begin
  result:=False;
  try
    append;
    try
      codigoCNC   := ECodigoCNC.KeyValue;
    except
    end;
    try
      codigoITP   := SCodigo;
    except
    end;
    try
      CodigoPRD  := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
       CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;    
    try
       DataCadastro  := CConfiguracao.DataHora;
    except
    end;
    try
      CodigoTBP   := StrToInt(ECodigoTBP.Text);
    except
    end;
    try
      PrecoOriginal := StrToFloat(EPrecoOriginal.Text);
    except
    end;
    try
      Preco       := StrToFloat(EPreco.Text);
    except
    end;
    try
       Bonificacao := StrToFloat(EBonificacao.Text);
    except
    end;
    try
       QuantMin    := StrToFloat(EQuantMin.Text);
    except
    end;

    try
      Post;
      GeraLog(6920,CConfiguracao.CodigoCNC,SCodigo,'PRD:'+ECodigoPRD.Text);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TItem_Tabela_de_Precos.LimpaCampos;
begin
  Try
    ECodigoPRD.Clear;
  Except
  End;
  Try
    EPreco.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EBonificacao.Clear
    else
      EBonificacao.Text := '0';
  Except
  End;
  Try
    EQuantMin.Clear;
  Except
  End;
end;

{ Localiza um cliente }
function TItem_Tabela_de_Precos.LocalizarCod(CdITP,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdITP<>CodigoITP) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;ITP_CODIGO', vararrayof([CdCNC, CdITP]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_Tabela_de_Precos.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TItem_Tabela_de_Precos.PreparaInsercao;
begin
  ProximoCodigo('ITP_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
