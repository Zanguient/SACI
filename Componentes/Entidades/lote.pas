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
unit Lote;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, 
     Funcoes;

type
  TLote = class(TSQuery)
    private
      { Private fields of TLote }
        { Storage for property CodigoLOT }
        FCodigoLOT : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataValidade }
        FDataValidade : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoLOT }
        FECodigoLOT : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataValidade }
        FEDataValidade : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EPrecoCompra }
        FEPrecoCompra : TEdit;
        { Storage for property EPrecoCusto }
        FEPrecoCusto : TEdit;
        { Storage for property EReferencia }
        FEReferencia : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property PrecoCompra }
        FPrecoCompra : Double;
        { Storage for property PrecoCusto }
        FPrecoCusto : Double;
        { Storage for property PrecoVenda }
        FPrecoVenda : Double;
        { Storage for property Referencia }
        FReferencia : String;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TLote }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoLOT }
        function GetCodigoLOT : Integer;
        { Write method for property CodigoLOT }
        procedure SetCodigoLOT(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property DataValidade }
        function GetDataValidade : TDateTime;
        { Write method for property DataValidade }
        procedure SetDataValidade(Value : TDateTime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property PrecoCompra }
        function GetPrecoCompra : Double;
        { Write method for property PrecoCompra }
        procedure SetPrecoCompra(Value : Double);
        { Read method for property PrecoCusto }
        function GetPrecoCusto : Double;
        { Write method for property PrecoCusto }
        procedure SetPrecoCusto(Value : Double);
        { Read method for property PrecoVenda }
        function GetPrecoVenda : Double;
        { Write method for property PrecoVenda }
        procedure SetPrecoVenda(Value : Double);
        { Read method for property Referencia }
        function GetReferencia : String;
        { Write method for property Referencia }
        procedure SetReferencia(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TLote }

      { Protected methods of TLote }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TLote }

      { Public methods of TLote }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdLOT:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grupo }
        function LocalizarCod(CdLOT:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TLote }
        { Código do Grupo }
        property CodigoLOT : Integer read GetCodigoLOT write SetCodigoLOT;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataValidade : TDateTime
             read GetDataValidade write SetDataValidade;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoLOT : TEdit read FECodigoLOT write FECodigoLOT;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataValidade : TMaskEdit
             read FEDataValidade write FEDataValidade;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EPrecoCompra : TEdit read FEPrecoCompra write FEPrecoCompra;
        property EPrecoCusto : TEdit read FEPrecoCusto write FEPrecoCusto;
        property EReferencia : TEdit read FEReferencia write FEReferencia;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property OBS : String read GetOBS write SetOBS;
        property PrecoCompra : Double read GetPrecoCompra write SetPrecoCompra;
        property PrecoCusto : Double read GetPrecoCusto write SetPrecoCusto;
        property PrecoVenda : Double read GetPrecoVenda write SetPrecoVenda;
        property Referencia : String read GetReferencia write SetReferencia;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TLote with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TLote]);
end;

{ Method to set variable and property values and create objects }
procedure TLote.AutoInitialize;
begin
     FECodigoLOT := nil;
     FECodigoPRD := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataValidade := nil;
     FEDescricao := nil;
     FEOBS := nil;
     FEPrecoCompra := nil;
     FEPrecoCusto := nil;
     FEReferencia := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TLote.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoLOT then
        FECodigoLOT := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataValidade then
        FEDataValidade := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEPrecoCompra then
        FEPrecoCompra := nil;
     if AComponent = FEPrecoCusto then
        FEPrecoCusto := nil;
     if AComponent = FEReferencia then
        FEReferencia := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TLote.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoLOT }
function TLote.GetCodigoLOT : Integer;
begin
  try
    Result := Self.fieldByName('LOT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoLOT }
procedure TLote.SetCodigoLOT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LOT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LOT_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TLote.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPRD }
procedure TLote.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TLote.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('LOT_DT_ALTERADO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TLote.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_DT_ALTERADO').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TLote.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('LOT_DT_CADASTRO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TLote.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_DT_CADASTRO').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_DT_CADASTRO"!');
  end;
end;

{ Read method for property DataValidade }
function TLote.GetDataValidade : TDateTime;
begin
  try
    Result := Self.fieldByName('LOT_DT_VALIDADE').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataValidade }
procedure TLote.SetDataValidade(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_DT_VALIDADE').AsDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_DT_VALIDADE"!');
  end;
end;

{ Read method for property Descricao }
function TLote.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('LOT_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TLote.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_DESCRICAO"!');
  end;
end;

{ Read method for property OBS }
function TLote.GetOBS : String;
begin
  try
    Result := Self.fieldByName('LOT_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property OBS }
procedure TLote.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_OBSERVACAO"!');
  end;
end;

{ Read method for property PrecoCompra }
function TLote.GetPrecoCompra : Double;
begin
  try
    Result := Self.fieldByName('LOT_PRECO_COMPRA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoCompra }
procedure TLote.SetPrecoCompra(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_PRECO_COMPRA').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_PRECO_COMPRA"!');
  end;
end;

{ Read method for property PrecoCusto }
function TLote.GetPrecoCusto : Double;
begin
  try
    Result := Self.fieldByName('LOT_PRECO_CUSTO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoCusto }
procedure TLote.SetPrecoCusto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_PRECO_CUSTO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_PRECO_CUSTO"!');
  end;
end;

{ Read method for property PrecoVenda }
function TLote.GetPrecoVenda : Double;
begin
  try
    Result := Self.fieldByName('LOT_PRECO_VENDA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoVenda }
procedure TLote.SetPrecoVenda(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_PRECO_VENDA').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_PRECO_VENDA"!');
  end;
end;

{ Read method for property Referencia }
function TLote.GetReferencia : String;
begin
  try
    Result := Self.fieldByName('LOT_REFERENCIA').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Referencia }
procedure TLote.SetReferencia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LOT_REFERENCIA').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LOT_REFERENCIA"!');
  end;
end;

{ Read method for property Situacao }
function TLote.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('LOT_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TLote.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LOT_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LOT_SITUACAO"!');
    end;
end;

function TLote.AlterarAuto:Boolean;
var
  CdCNC, CdLOT: integer;
  sDetalhes: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdLOT := CodigoLOT;
  sDetalhes := '';
  try
    edit;
    try
      CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;      
    try
      CodigoPRD := StrToInt(ECodigoPRD.Text);
      sDetalhes := sDetalhes+'PRD:'+ECodigoPRD.Text;
    except
    end;
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
      DataValidade := StrToDate(EDataValidade.Text);
      sDetalhes := sDetalhes+'Validade:'+EDataValidade.Text;
    except
    end;
    try
      Referencia := EReferencia.Text;
      sDetalhes := sDetalhes+'Ref:'+EReferencia.Text;
    except
    end;
    try
      PrecoCompra := StrToFloat(EPrecoCompra.Text);
    except
    end;
    try
      PrecoCusto := StrToFloat(EPrecoCusto.Text);
    except
    end;
    try
      PrecoVenda := 0;
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
      GeraLog(8740, CdCNC, CdLOT, sDetalhes);
      Result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TLote.AtualizaControles(Habilitar:Boolean);
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
    EReferencia.Enabled        :=Habilitar;
  except
  end;
  try
    EDataValidade.Enabled        :=Habilitar;
  except
  end;
  try
    EPrecoCompra.Enabled        :=Habilitar;
  except
  end;
  try
    EPrecoCusto.Enabled        :=Habilitar;
  except
  end;
  try
    EOBS.Enabled                :=Habilitar;
  except
  end;
end;

procedure TLote.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TLote.CarregaDados;
begin
  Try
    ECodigoLOT.Text           :=IntToStr(CodigoLOT);
  except
  end;
  Try
//    ECodigoPRD.Text           :=IntToStr(CodigoPRD);
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    EReferencia.Text           :=Referencia;
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
    if DataValidade > 0 then
      EDataValidade.Text := formatDateTime('DD/MM/YYYY',DataValidade)
    else
      EDataValidade.Clear;
  except
  end;
  try
    EPrecoCompra.Text     := Format('%.2f',[PrecoCompra]);
  except
  end;
  try
    EPrecoCusto.Text     := Format('%.2f',[PrecoCusto]);
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

constructor TLote.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'LOTE';

     { Code to perform other tasks when the component is created }

end;

function TLote.Deletar(CdLOT:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdLOT)) Then
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

destructor TLote.Destroy;
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

function TLote.FinalizaEdicao:Boolean;
var
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  If Trim(EDescricao.Text) = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  If not VerificaInteiroBranco(ECodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto inválido!'+#13;
  If not VerificaDataBranco(EDataValidade.Text) then
    mensagem:=mensagem+'Data de Validade inválida!'+#13;
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
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      If Alterarauto then
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

function TLote.InserirAuto:Boolean;
var
  CdLOT: integer;
  sDetalhes: string;
begin
  result:=false;
  CdLOT := sCodigo;
  sDetalhes := '';
  try
    append;
    try
      CodigoLOT   := CdLOT;
    except
    end;
    try
      CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;    
    try
      CodigoPRD   := StrToInt(ECodigoPRD.Text);
      sDetalhes := sDetalhes+'PRD:'+ECodigoPRD.Text;
    except
    end;
    try
      Descricao := EDescricao.Text;
      sDetalhes := sDetalhes+'Desc:'+EDescricao.Text;
    except
    end;
    try
      Referencia := EReferencia.Text;
      sDetalhes := sDetalhes+'Ref:'+EReferencia.Text;
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      DataValidade := StrToDate(EDataValidade.Text);
    except
    end;
    try
      PrecoCompra := StrToFloat(EPrecoCompra.Text);
    except
    end;
    try
      PrecoCusto := StrToFloat(EPrecoCusto.Text);
    except
    end;
    try
      PrecoVenda := 0;
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
      GeraLog(8730, 0, CdLOT, sDetalhes);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;


procedure TLote.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoLOT.Clear
    else
      ECodigoLOT.Text := IntToStr(SCodigo);
  except
  end;
  try
//    ECodigoPRD.Clear;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    EReferencia.Clear;
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
//    if Estado <> 1 then
      EDataValidade.Clear;
//    else
//      EDataValidade.Text := formatDateTime('DD/MM/YYYY', CConfiguracao.DataHora);
  except
  end;
  try
    if Estado <> 1 then
      EPrecoCompra.Clear
    else
      EPrecoCompra.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EPrecoCusto.Clear
    else
      EPrecoCusto.Text := '0,00';
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
function TLote.LocalizarCod(CdLOT:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  begin
    close;
    sql.Text:='SELECT * FROM LOTE '+
      ' WHERE LOT_CODIGO='+IntToStr(CdLOT);
    open;
    Result := (not IsEmpty);
  end;
end;

procedure TLote.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
end;

procedure TLote.PreparaInsercao;
begin
  ProximoCodigo('LOT_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TLote.deletarauto:Boolean;
var
  CdCNC, CdLOT: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdLOT := CodigoLOT;
    if Delete then
    Begin
      result:=true;
      GeraLog(8750,CdCNC,CdLOT);
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
