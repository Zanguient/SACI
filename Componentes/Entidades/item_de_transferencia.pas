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
unit Item_de_Transferencia;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Configuracao, Transferencia, Funcoes, 
     Variants;

type
  TItem_de_Transferencia = class(TSQuery)
    private
      { Private fields of TItem_de_Transferencia }
        { Storage for property CProduto }
        FCProduto : TProduto;
        { Storage for property CTransferencia }
        FCTransferencia : TTransferencia;
        { Storage for property CodigoITR }
        FCodigoITR : Integer;
        { Storage for property CodigoLOT }
        FCodigoLOT : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoTRF }
        FCodigoTRF : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoITR }
        FECodigoITR : TEdit;
        { Storage for property ECodigoLOT }
        FECodigoLOT : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoTRF }
        FECodigoTRF : TEdit;
        { Storage for property EMarcaProd }
        FEMarcaProd : TEdit;
        { Storage for property ENomeProd }
        FENomeProd : TEdit;
        { Storage for property EPreco }
        FEPreco : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ERefProd }
        FERefProd : TEdit;
        { Storage for property EUNProd }
        FEUNProd : TEdit;
        { Storage for property Preco }
        FPreco : Double;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TItem_de_Transferencia }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoITR }
        function GetCodigoITR : Integer;
        { Write method for property CodigoITR }
        procedure SetCodigoITR(Value : Integer);
        { Read method for property CodigoLOT }
        function GetCodigoLOT : Integer;
        { Write method for property CodigoLOT }
        procedure SetCodigoLOT(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoTRF }
        function GetCodigoTRF : Integer;
        { Write method for property CodigoTRF }
        procedure SetCodigoTRF(Value : Integer);
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
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TItem_de_Transferencia }

      { Protected methods of TItem_de_Transferencia }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_de_Transferencia }

      { Public methods of TItem_de_Transferencia }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdITR:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC, CdITR, CdTRF, CdPRD, CdLOT: Integer; PQuantidade:Double;PSituacao:integer;PPreco:Double=0):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdITR,CdCNC:Integer):Boolean;
        function LocalizarProd(CdCNC,CdTRF,CdPRD:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_de_Transferencia }
        property CProduto : TProduto read FCProduto write FCProduto;
        property CTransferencia : TTransferencia
             read FCTransferencia write FCTransferencia;
        { Código da tabela de preços }
        property CodigoITR : Integer read GetCodigoITR write SetCodigoITR;
        property CodigoLOT : Integer read GetCodigoLOT write SetCodigoLOT;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoTRF : Integer read GetCodigoTRF write SetCodigoTRF;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoITR : TEdit read FECodigoITR write FECodigoITR;
        property ECodigoLOT : TEdit read FECodigoLOT write FECodigoLOT;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoTRF : TEdit read FECodigoTRF write FECodigoTRF;
        property EMarcaProd : TEdit read FEMarcaProd write FEMarcaProd;
        property ENomeProd : TEdit read FENomeProd write FENomeProd;
        property EPreco : TEdit read FEPreco write FEPreco;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ERefProd : TEdit read FERefProd write FERefProd;
        property EUNProd : TEdit read FEUNProd write FEUNProd;
        property Preco : Double read GetPreco write SetPreco;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Transferencia with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Transferencia]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Transferencia.AutoInitialize;
begin
     FECodigoITR := nil;
     FECodigoLOT := nil;
     FECodigoPRD := nil;
     FECodigoTRF := nil;
     FEMarcaProd := nil;
     FENomeProd := nil;
     FEPreco := nil;
     FEQuantidade := nil;
     FERefProd := nil;
     FEUNProd := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_de_Transferencia.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoITR then
        FECodigoITR := nil;
     if AComponent = FECodigoLOT then
        FECodigoLOT := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoTRF then
        FECodigoTRF := nil;
     if AComponent = FEMarcaProd then
        FEMarcaProd := nil;
     if AComponent = FENomeProd then
        FENomeProd := nil;
     if AComponent = FEPreco then
        FEPreco := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FERefProd then
        FERefProd := nil;
     if AComponent = FEUNProd then
        FEUNProd := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Transferencia.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoITR }
function TItem_de_Transferencia.GetCodigoITR : Integer;
begin
  try
    Result := Self.fieldByName('ITR_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoITR }
procedure TItem_de_Transferencia.SetCodigoITR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITR_CODIGO"!');
    end;
end;

{ Read method for property CodigoLOT }
function TItem_de_Transferencia.GetCodigoLOT : Integer;
begin
  try
    Result := Self.fieldByName('LOT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoLOT }
procedure TItem_de_Transferencia.SetCodigoLOT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LOT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LOT_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItem_de_Transferencia.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_de_Transferencia.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Read method for property CodigoTRF }
function TItem_de_Transferencia.GetCodigoTRF : Integer;
begin
  try
    Result := Self.fieldByName('TRF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTRF }
procedure TItem_de_Transferencia.SetCodigoTRF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRF_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItem_de_Transferencia.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('ITR_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItem_de_Transferencia.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITR_DT_ALTERADO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITR_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TItem_de_Transferencia.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('ITR_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItem_de_Transferencia.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITR_DT_CADASTRO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITR_DT_CADASTRO"!');
  end;
end;

{ Read method for property Preco }
function TItem_de_Transferencia.GetPreco : Double;
begin
  try
    Result := Self.fieldByName('ITR_PRECO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Preco }
procedure TItem_de_Transferencia.SetPreco(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITR_PRECO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITR_PRECO"!');
    end;
end;

{ Read method for property Quantidade }
function TItem_de_Transferencia.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('ITR_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TItem_de_Transferencia.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITR_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITR_QUANTIDADE"!');
    end;
end;

{ Read method for property Situacao }
function TItem_de_Transferencia.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('ITR_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TItem_de_Transferencia.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITR_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITR_SITUACAO"!');
    end;
end;

function TItem_de_Transferencia.AlterarAuto:Boolean;
var
  CdCNC, CdTRF, CdPRD, CdLOT: integer;
begin
  Result:=False;
  CdCNC := CodigoCNC;
  CdTRF := CodigoTRF;
  CdPRD := CodigoPRD;
  CdLOT := CodigoLOT;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE ITEM_DE_TRANSFERENCIA SET '+
      '  USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ' ,ITR_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ' ,ITR_QUANTIDADE = '     +VirgPonto(EQuantidade.Text)+
      ' ,ITR_PRECO = '     +VirgPonto(EPreco.Text)+
      ' ,LOT_CODIGO = '    +IntToStr(CdLOT)+
      ' ,ITR_SITUACAO=0 '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND ITR_CODIGO='+IntToStr(CodigoITR));
    GeraLog(8050, CdCNC, CdTRF, 'ALTERAR PRD:'+IntToStr(CdPRD)+' LOT:'+IntTostr(CdLOT));
    Result:=True;
  except
    Cancel;
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TItem_de_Transferencia.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled      := not Habilitar;
  Except
  End;
  If Estado=1 then
  Begin
    Try
      ECodigoPRD.Enabled := Habilitar;
    Except
    End;
  end
  else
    ECodigoPRD.Enabled := False;
  Try
    EQuantidade.Enabled  := Habilitar;
  Except
  End;
  Try
    EPreco.Enabled  := Habilitar;
  Except
  End;
  Try
    ECodigoLOT.Enabled  := Habilitar;
  Except
  End;
end;

procedure TItem_de_Transferencia.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TItem_de_Transferencia.CarregaDados;
begin
 Try
   ECodigoITR.Text        :=IntToStr(CodigoITR);
  Except
  End;
  Try
    ECodigoPRD.Text        :=IntToStr(CodigoPRD);
  Except
  End;
  Try
    ECodigoLOT.Text        :=IntToStr(CodigoLOT);
  Except
  End;
  Try
    EQuantidade.Text       :=Format('%.2f', [Quantidade]);
  Except
  End;
  Try
    EPreco.Text       :=Format('%.2f', [Preco]);
  Except
  End;
end;

constructor TItem_de_Transferencia.Create(AOwner: TComponent);
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

function TItem_de_Transferencia.Deletar(CdCNC,CdITR:Integer):Boolean;
var
  CdTRF, CdPRD: integer;
begin
  Result := False;
  If not(localizarCod(CdITR,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdTRF := CodigoTRF;
      CdPRD := CodigoPRD;
      if Delete then
      Begin
        Result := True;
        RegistrarDel(CdCNC,1690(*ItemDeTransferencia*),CdITR,'TRF:'+IntToStr(CdTRF)+' PRD:'+IntToStr(CdPRD));
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_de_Transferencia.Destroy;
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

function TItem_de_Transferencia.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    mensagem:=mensagem+'Codigo do produto digitado incorretamente!'+#13;
  if not verificafloat(EQuantidade.text) then
    mensagem:= mensagem + 'Quantidade digitada incorretamente!';
  if not verificafloatbranco(EPreco.text) then
    EPreco.Text := '0,00';
  if not VerificaInteiroBranco(ECodigoLOT.Text) then
    mensagem:=mensagem+'Codigo do Lote digitado incorretamente!'+#13;
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
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoITR;
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

{ Insere um Cliente }
function TItem_de_Transferencia.Inserir(CdCNC, CdITR, CdTRF, CdPRD, CdLOT: Integer; PQuantidade:Double;PSituacao:integer;PPreco:Double=0):boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdITR=0 then
    Cod    := ProximoCodigo('ITR_CODIGO')
  else
    Cod    := CdITR;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    Insert;
    try
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataCadastro   := CConfiguracao.DataHora;
      CodigoITR      := Cod;
      CodigoCNC      := CdCNC;
      CodigoPRD      := CdPRD;
      CodigoTRF      := CdTRF;
      CodigoLOT      := CdLOT;
      Quantidade     := PQuantidade;
      Preco          := PPreco;
      Situacao       := PSituacao;
      try
        Post;
        GeraLog(8050, CdCNC, CdTRF, 'INSERIR PRD:'+IntToStr(CdPRD));
        result := true;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o Item de Transferência! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      ShowMessage('Não foi possível incluir o Item de Transferência! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TItem_de_Transferencia.InserirAuto:Boolean;
var
  CdCNC, CdTRF, CdPRD: integer;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdTRF := CTransferencia.CodigoTRF;
  CdPRD := StrToInt(ECodigoPRD.Text);
  try
    append;
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoITR := SCodigo;
    except
    end;
    try
      codigoTRF   := CTransferencia.CodigoTRF;
    except
    end;
    try
      CodigoPRD  := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      CodigoLOT  := StrToInt(ECodigoLOT.Text);
    except
    end;
    try
      CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro  := CConfiguracao.DataHora
    except
    end;
    try
      Quantidade    := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      Preco    := StrToFloat(EPreco.Text);
    except
    end;
    Situacao := 0;
    try
      Post;
      GeraLog(8050, CdCNC, CdTRF, 'INSERIR PRD:'+IntToStr(CdPRD));
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TItem_de_Transferencia.LimpaCampos;
begin
  try
    if Estado <> 1 then
      EPreco.Clear
    else
      EPreco.Text := '0,00';
  except
  end;
  Try
    EQuantidade.Clear;
  Except
  End;
  Try
    ECodigoPRD.Clear;
  Except
  End;
  try
    if Estado <> 1 then
      ECodigoLOT.Clear
    else
      ECodigoLOT.Text := '0';
  except
  end;
  Try
    ENomeProd.Clear;
  Except
  End;
  Try
    EMarcaProd.Clear;
  Except
  End;
  Try
    EUNProd.Clear;
  Except
  End;
end;

{ Localiza um cliente }
function TItem_de_Transferencia.LocalizarCod(CdITR,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdITR<>CodigoITR) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;ITR_CODIGO', vararrayof([CdCNC, CdITR]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TItem_de_Transferencia.LocalizarProd(CdCNC,CdTRF,CdPRD:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdCNC<>CodigoCNC) or (CdTRF<>CodigoTRF) or (CdPRD<>CodigoPRD) Then
    If locate('CNC_CODIGO;TRF_CODIGO;PRD_CODIGO', vararrayof([CdCNC, CdTRF, CdPRD]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_de_Transferencia.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TItem_de_Transferencia.PreparaInsercao;
begin
  ProximoCodigo('ITR_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TItem_de_Transferencia.deletarauto:Boolean;
var
  CdCNC,CdITR,CdTRF, CdPRD: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdITR := CodigoITR;
    CdTRF := CodigoTRF;
    CdPRD := CodigoPRD;
    if Delete then
    Begin
      Result := True;
      RegistrarDel(CdCNC,1690(*ItemDeTransferencia*),CdITR,'TRF:'+IntToStr(CdTRF)+' PRD:'+IntToStr(CdPRD));
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
