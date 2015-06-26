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
unit Item_de_Mapa_de_Cotacao;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto_por_Fornecedor, Fornecedor, MapaCotacao, 
     Configuracao, Funcoes, Variants;

type
  TItem_de_Mapa_de_Cotacao = class(TSQuery)
    private
      { Private fields of TItem_de_Mapa_de_Cotacao }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoICT }
        FCodigoICT : Integer;
        { Storage for property CodigoMCT }
        FCodigoMCT : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Desconto }
        FDesconto : String;
        { Storage for property ECodigoICT }
        FECodigoICT : TEdit;
        { Storage for property ECodigoMCT }
        FECodigoMCT : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDesconto }
        FEDesconto : TEdit;
        { Storage for property EIPI }
        FEIPI : TEdit;
        { Storage for property EPreco }
        FEPreco : TEdit;
        { Storage for property EProduto }
        FEProduto : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property IPI }
        FIPI : Double;
        { Storage for property Preco }
        FPreco : Double;
        { Storage for property Produto }
        FProduto : String;
        { Storage for property Quantidade }
        FQuantidade : Double;

      { Private methods of TItem_de_Mapa_de_Cotacao }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoICT }
        function GetCodigoICT : Integer;
        { Write method for property CodigoICT }
        procedure SetCodigoICT(Value : Integer);
        { Read method for property CodigoMCT }
        function GetCodigoMCT : Integer;
        { Write method for property CodigoMCT }
        procedure SetCodigoMCT(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Desconto }
        function GetDesconto : String;
        { Write method for property Desconto }
        procedure SetDesconto(Value : String);
        { Read method for property IPI }
        function GetIPI : Double;
        { Write method for property IPI }
        procedure SetIPI(Value : Double);
        { Read method for property Preco }
        function GetPreco : Double;
        { Write method for property Preco }
        procedure SetPreco(Value : Double);
        { Read method for property Produto }
        function GetProduto : String;
        { Write method for property Produto }
        procedure SetProduto(Value : String);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);

    protected
      { Protected fields of TItem_de_Mapa_de_Cotacao }

      { Protected methods of TItem_de_Mapa_de_Cotacao }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_de_Mapa_de_Cotacao }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TItem_de_Mapa_de_Cotacao }
        { Altera um Ítem de Cotação }
        function Alterar(CdCNC, CdICT, CdMCT, CdPRD: Integer; PPreco, PIPI, PQuantidade: Double; PProduto, Pdesconto: String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdICT: Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Ítem de Cotação }
        function Inserir(CdCNC, CdICT, CdMCT, CdPRD: Integer; PPreco, PIPI, PQuantidade: Double; PProduto, Pdesconto: String):boolean;
        function InserirAuto:Boolean;
        { Localiza um Ítem de Cotação }
        function LocalizarCod(CdICT, CdCNC: Integer): Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_de_Mapa_de_Cotacao }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Ítem de Cotação }
        property CodigoICT : Integer read GetCodigoICT write SetCodigoICT;
        { Código do mapa de cotação }
        property CodigoMCT : Integer read GetCodigoMCT write SetCodigoMCT;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Desconto : String read GetDesconto write SetDesconto;
        property ECodigoICT : TEdit read FECodigoICT write FECodigoICT;
        property ECodigoMCT : TEdit read FECodigoMCT write FECodigoMCT;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDesconto : TEdit read FEDesconto write FEDesconto;
        property EIPI : TEdit read FEIPI write FEIPI;
        property EPreco : TEdit read FEPreco write FEPreco;
        property EProduto : TEdit read FEProduto write FEProduto;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property IPI : Double read GetIPI write SetIPI;
        property Preco : Double read GetPreco write SetPreco;
        property Produto : String read GetProduto write SetProduto;
        property Quantidade : Double read GetQuantidade write SetQuantidade;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Mapa_de_Cotacao with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Mapa_de_Cotacao]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Mapa_de_Cotacao.AutoInitialize;
begin
     Estado := 0;
     FECodigoICT := nil;
     FECodigoMCT := nil;
     FECodigoPRD := nil;
     FEDesconto := nil;
     FEIPI := nil;
     FEPreco := nil;
     FEProduto := nil;
     FEQuantidade := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_de_Mapa_de_Cotacao.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoICT then
        FECodigoICT := nil;
     if AComponent = FECodigoMCT then
        FECodigoMCT := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDesconto then
        FEDesconto := nil;
     if AComponent = FEIPI then
        FEIPI := nil;
     if AComponent = FEPreco then
        FEPreco := nil;
     if AComponent = FEProduto then
        FEProduto := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Mapa_de_Cotacao.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TItem_de_Mapa_de_Cotacao.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TItem_de_Mapa_de_Cotacao.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoICT }
function TItem_de_Mapa_de_Cotacao.GetCodigoICT : Integer;
begin
  try
    Result := Self.fieldByName('ICT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoICT }
procedure TItem_de_Mapa_de_Cotacao.SetCodigoICT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ICT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICT_CODIGO"!');
    end;
end;

{ Read method for property CodigoMCT }
function TItem_de_Mapa_de_Cotacao.GetCodigoMCT : Integer;
begin
  try
    Result := Self.fieldByName('MCT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoMCT }
procedure TItem_de_Mapa_de_Cotacao.SetCodigoMCT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCT_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItem_de_Mapa_de_Cotacao.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_de_Mapa_de_Cotacao.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TItem_de_Mapa_de_Cotacao.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TItem_de_Mapa_de_Cotacao.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItem_de_Mapa_de_Cotacao.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('ICT_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItem_de_Mapa_de_Cotacao.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TItem_de_Mapa_de_Cotacao.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('ICT_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItem_de_Mapa_de_Cotacao.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_DT_CADASTRO"!');
  end;
end;

{ Read method for property Desconto }
function TItem_de_Mapa_de_Cotacao.GetDesconto : String;
begin
  try
    Result := Self.fieldByName('ICT_DESCONTO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Desconto }
procedure TItem_de_Mapa_de_Cotacao.SetDesconto(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_DESCONTO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_DESCONTO"!');
  end;
end;

{ Read method for property IPI }
function TItem_de_Mapa_de_Cotacao.GetIPI : Double;
begin
  try
    Result := Self.fieldByName('ICT_IPI').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property IPI }
procedure TItem_de_Mapa_de_Cotacao.SetIPI(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_IPI').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_IPI"!');
  end;
end;

{ Read method for property Preco }
function TItem_de_Mapa_de_Cotacao.GetPreco : Double;
begin
  try
    Result := Self.fieldByName('ICT_PRECO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Preco }
procedure TItem_de_Mapa_de_Cotacao.SetPreco(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_PRECO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_PRECO"!');
  end;
end;

{ Read method for property Produto }
function TItem_de_Mapa_de_Cotacao.GetProduto : String;
begin
  try
    Result := Self.fieldByName('ICT_PRODUTO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Produto }
procedure TItem_de_Mapa_de_Cotacao.SetProduto(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_PRODUTO').asString := UpperCase(Value);
  except
    ShowMessage('Não foi possível alterar o campo "ICT_PRODUTO"!');
  end;
end;

{ Read method for property Quantidade }
function TItem_de_Mapa_de_Cotacao.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('ICT_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TItem_de_Mapa_de_Cotacao.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ICT_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICT_QUANTIDADE"!');
    end;
end;

{ Altera um Ítem de Cotação }
function TItem_de_Mapa_de_Cotacao.Alterar(CdCNC, CdICT, CdMCT, CdPRD: Integer; PPreco, PIPI, PQuantidade: Double; PProduto, Pdesconto: String):boolean;
begin
  If not(localizarCod(CdICT, CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoMCT    := CdMCT;
      CodigoPRD    := CdPRD;
      CodigoUSU    := CConfiguracao.CodigoUSU;
      DataAlterado := CConfiguracao.DataHora;
      Preco        := PPreco;
      IPI          := PIPI;
      Quantidade   := PQuantidade;
      Produto      := PProduto;
      Desconto     := PDesconto;
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

function TItem_de_Mapa_de_Cotacao.AlterarAuto:Boolean;
begin
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
         CodigoPRD := StrToInt(ECodigoPRD.Text);
      except
      end;
      try
         Preco := StrToFloat(EPreco.Text);
      except
      end;
      try
         IPI := StrToFloat(EIPI.Text);
      except
      end;
      try
         Quantidade := StrToFloat(Equantidade.Text);
      except
      end;
      try
         Produto := EProduto.Text;
      except
      end;
      try
         Desconto := EDesconto.Text;
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

procedure TItem_de_Mapa_de_Cotacao.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    ECodigoPRD.Enabled         :=Habilitar;
  Except
  End;
  Try
    EPreco.Enabled         :=Habilitar;
  Except
  End;
  Try
    EIPI.Enabled           :=Habilitar;
  Except
  End;
  Try
    EQuantidade.Enabled     :=Habilitar;
  Except
  End;
  Try
    EDesconto.Enabled      :=Habilitar;
  Except
  End;
  Try
    if not Habilitar then
    Begin
      EProduto.Color     := clMenu;
      EProduto.Enabled   := False;
    end
    else if ECodigoPRD.Text = '0' then
    Begin
      EProduto.Color     := clWindow;
      EProduto.Enabled   := True;
    end;
  Except
  End;
end;

procedure TItem_de_Mapa_de_Cotacao.CancelaEdicao;
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

procedure TItem_de_Mapa_de_Cotacao.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    ECodigoPRD.Text           :=IntToStr(CodigoPRD);
  Except
  End;
  Try
    EPreco.Text               :=Format('%.2f', [Preco]);
  Except
  End;
  Try
    EIPI.Text                 :=Format('%.2f', [IPI]);
  Except
  End;
  Try
    EQuantidade.Text           :=Format('%.2f', [Quantidade]);
  Except
  End;
  Try
    EProduto.Text              :=Produto;
  Except
  End;
  Try
    EDesconto.Text             :=Desconto;
  Except
  End;
end;

constructor TItem_de_Mapa_de_Cotacao.Create(AOwner: TComponent);
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

function TItem_de_Mapa_de_Cotacao.Deletar(CdCNC, CdICT: Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdICT, CdCNC)) Then
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
        if Tquery(Self).isEmpty then
        begin
           Try
             ECodigoICT.Clear;
           Except
           End;
           Try
             ECodigoPRD.Clear;
           Except
           End;
           Try
             EPreco.Clear;
           Except
           End;
           Try
             EIPI.Clear;
           Except
           End;
           try
             EQuantidade.Clear;
           Except
           End;
           try
             EProduto.Clear;
           Except
           End;
           try
             EDesconto.Clear;
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

destructor TItem_de_Mapa_de_Cotacao.Destroy;
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

function TItem_de_Mapa_de_Cotacao.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  if EDesconto.Text = '' then
    EDesconto.Text := '0';
  mensagem:='';
  If not VerificaInteiroBranco(ECodigoPRD.text) Then
    mensagem:=mensagem+'Código do Produto digitado incorretamente!'+#13;
  If EProduto.text = '' Then
    mensagem:=mensagem+'Nome do Produto digitado incorretamente!'+#13;
  If not VerificafloatBranco(EQuantidade.text) Then
    mensagem:=mensagem+'Quantidade digitada incorretamente!'+#13;
  If not Verificafloat(EPreco.text) Then
    mensagem:=mensagem+'Preço digitado incorretamente!'+#13;
  if not VerificaDesconto(EDesconto.Text) then
    mensagem:=mensagem+'Desconto digitado incorretamente!'+#13;
  If not Verificafloat(EIPI.text) Then
    mensagem:=mensagem+'IPI digitado incorretamente!'+#13;
  If mensagem <>'' Then
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
      if Inserirauto then
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
      cod:=codigoICT;
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
  end;
end;

{ Insere um Ítem de Cotação }
function TItem_de_Mapa_de_Cotacao.Inserir(CdCNC, CdICT, CdMCT, CdPRD: Integer; PPreco, PIPI, PQuantidade: Double; PProduto, Pdesconto: String):boolean;
Var
  Cod: Integer;
begin
  if CdICT=0 then
    Cod    := ProximoCodigo('ICT_CODIGO')
  else
    Cod     := CdICT;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
    Insert;
    try
      CodigoICT    := Cod;
      CNCOrigem    := CentroDeCusto;
      CodigoCNC    := CdCNC;
      CodigoMCT    := CdMCT;
      CodigoPRD    := CdPRD;
      CodigoUSU    := CConfiguracao.CodigoUSU;
      DataCadastro := CConfiguracao.DataHora;
      Preco        := PPreco;
      IPI          := PIPI;
      Quantidade   := PQuantidade;
      Produto      := PProduto;
      Desconto     := PDesconto;
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

function TItem_de_Mapa_de_Cotacao.InserirAuto:Boolean;
begin
  try
    append;
    try
      CodigoICT   := SCodigo;
    except
    end;
    try
      CNCOrigem   := CentroDeCusto;
    except
    end;    
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoMCT   := StrToInt(ECodigoMCT.Text);
    except
    end;
    try
       CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
       CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
       DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
       Preco := StrToFloat(EPreco.Text);
    except
    end;
    try
       IPI := StrToFloat(EIPI.Text);
    except
    end;
    try
       Quantidade := StrToFloat(Equantidade.Text);
    except
    end;
    try
       Produto := EProduto.Text;
    except
    end;
    try
       Desconto := EDesconto.Text;
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

{ Localiza um Ítem de Cotação }
function TItem_de_Mapa_de_Cotacao.LocalizarCod(CdICT, CdCNC: Integer): Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdICT<>CodigoICT) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; ICT_CODIGO', vararrayof([CdCNC, CdICT]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_de_Mapa_de_Cotacao.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TItem_de_Mapa_de_Cotacao.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  ProximoCodigo('ICT_CODIGO');
  Try
    ECodigoPRD.Clear;
  Except
  End;
  try
    EProduto.Clear;
  Except
  End;
  Try
    EPreco.Clear;
  Except
  End;
  try
    EQuantidade.Clear;
  Except
  End;
  Estado:=1;
  AtualizaControles(True);
end;

function TItem_de_Mapa_de_Cotacao.deletarauto:Boolean;
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
