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
unit Item_Tabela_de_Precos_SubGrupo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Variants, Funcoes;

type
  TItem_Tabela_de_Precos_SubGrupo = class(TSQuery)
    private
      { Private fields of TItem_Tabela_de_Precos_SubGrupo }
        { Storage for property Bonificacao }
        FBonificacao : Double;
        { Storage for property CodigoGRP }
        FCodigoGRP : Integer;
        { Storage for property CodigoITS }
        FCodigoITS : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoSGP }
        FCodigoSGP : Integer;
        { Storage for property CodigoTPS }
        FCodigoTPS : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EBonificacao }
        FEBonificacao : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoGRP }
        FECodigoGRP : TDBLookupComboBox;
        { Storage for property ECodigoIPS }
        FECodigoIPS : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoSGP }
        FECodigoSGP : TDBLookupComboBox;
        { Storage for property ECodigoTPS }
        FECodigoTPS : TEdit;
        { Storage for property EPreco }
        FEPreco : TEdit;
        { Storage for property EPrecoOriginal }
        FEPrecoOriginal : TEdit;
        { Storage for property EQuantidadeMinima }
        FEQuantidadeMinima : TEdit;
        { Storage for property Preco }
        FPreco : Double;
        { Storage for property PrecoOriginal }
        FPrecoOriginal : Double;
        { Storage for property QuantidadeMinima }
        FQuantidadeMinima : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TItem_Tabela_de_Precos_SubGrupo }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Bonificacao }
        function GetBonificacao : Double;
        { Write method for property Bonificacao }
        procedure SetBonificacao(Value : Double);
        { Read method for property CodigoGRP }
        function GetCodigoGRP : Integer;
        { Write method for property CodigoGRP }
        procedure SetCodigoGRP(Value : Integer);
        { Read method for property CodigoITS }
        function GetCodigoITS : Integer;
        { Write method for property CodigoITS }
        procedure SetCodigoITS(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoSGP }
        function GetCodigoSGP : Integer;
        { Write method for property CodigoSGP }
        procedure SetCodigoSGP(Value : Integer);
        { Read method for property CodigoTPS }
        function GetCodigoTPS : Integer;
        { Write method for property CodigoTPS }
        procedure SetCodigoTPS(Value : Integer);
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
        { Read method for property QuantidadeMinima }
        function GetQuantidadeMinima : Double;
        { Write method for property QuantidadeMinima }
        procedure SetQuantidadeMinima(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TItem_Tabela_de_Precos_SubGrupo }

      { Protected methods of TItem_Tabela_de_Precos_SubGrupo }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_Tabela_de_Precos_SubGrupo }

      { Public methods of TItem_Tabela_de_Precos_SubGrupo }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdITS:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdITS,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TItem_Tabela_de_Precos_SubGrupo }
        property Bonificacao : Double read GetBonificacao write SetBonificacao;
        property CodigoGRP : Integer read GetCodigoGRP write SetCodigoGRP;
        { Código da tabela de preços }
        property CodigoITS : Integer read GetCodigoITS write SetCodigoITS;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoSGP : Integer read GetCodigoSGP write SetCodigoSGP;
        property CodigoTPS : Integer read GetCodigoTPS write SetCodigoTPS;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EBonificacao : TEdit read FEBonificacao write FEBonificacao;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoGRP : TDBLookupComboBox
             read FECodigoGRP write FECodigoGRP;
        property ECodigoIPS : TEdit read FECodigoIPS write FECodigoIPS;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoSGP : TDBLookupComboBox
             read FECodigoSGP write FECodigoSGP;
        property ECodigoTPS : TEdit read FECodigoTPS write FECodigoTPS;
        property EPreco : TEdit read FEPreco write FEPreco;
        property EPrecoOriginal : TEdit
             read FEPrecoOriginal write FEPrecoOriginal;
        property EQuantidadeMinima : TEdit
             read FEQuantidadeMinima write FEQuantidadeMinima;
        property Preco : Double read GetPreco write SetPreco;
        property PrecoOriginal : Double
             read GetPrecoOriginal write SetPrecoOriginal;
        property QuantidadeMinima : Double
             read GetQuantidadeMinima write SetQuantidadeMinima;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_Tabela_de_Precos_SubGrupo with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_Tabela_de_Precos_SubGrupo]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_Tabela_de_Precos_SubGrupo.AutoInitialize;
begin
     FEBonificacao := nil;
     FECodigoCNC := nil;
     FECodigoGRP := nil;
     FECodigoIPS := nil;
     FECodigoPRD := nil;
     FECodigoSGP := nil;
     FECodigoTPS := nil;
     FEPreco := nil;
     FEPrecoOriginal := nil;
     FEQuantidadeMinima := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_Tabela_de_Precos_SubGrupo.Notification(AComponent : TComponent; Operation : TOperation);
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
     if AComponent = FECodigoGRP then
        FECodigoGRP := nil;
     if AComponent = FECodigoIPS then
        FECodigoIPS := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoSGP then
        FECodigoSGP := nil;
     if AComponent = FECodigoTPS then
        FECodigoTPS := nil;
     if AComponent = FEPreco then
        FEPreco := nil;
     if AComponent = FEPrecoOriginal then
        FEPrecoOriginal := nil;
     if AComponent = FEQuantidadeMinima then
        FEQuantidadeMinima := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_Tabela_de_Precos_SubGrupo.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Bonificacao }
function TItem_Tabela_de_Precos_SubGrupo.GetBonificacao : Double;
begin
  try
    Result := Self.fieldByName('ITS_BONIFICACAO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Bonificacao }
procedure TItem_Tabela_de_Precos_SubGrupo.SetBonificacao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITS_BONIFICACAO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITS_BONIFICACAO"!');
    end;
end;

{ Read method for property CodigoGRP }
function TItem_Tabela_de_Precos_SubGrupo.GetCodigoGRP : Integer;
begin
  try
    Result := Self.fieldByName('GRP_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoGRP }
procedure TItem_Tabela_de_Precos_SubGrupo.SetCodigoGRP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('GRP_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "GRP_CODIGO"!');
  end;
end;

{ Read method for property CodigoITS }
function TItem_Tabela_de_Precos_SubGrupo.GetCodigoITS : Integer;
begin
  try
    Result := Self.fieldByName('ITS_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoITS }
procedure TItem_Tabela_de_Precos_SubGrupo.SetCodigoITS(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITS_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITS_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItem_Tabela_de_Precos_SubGrupo.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_Tabela_de_Precos_SubGrupo.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property CodigoSGP }
function TItem_Tabela_de_Precos_SubGrupo.GetCodigoSGP : Integer;
begin
  try
    Result := Self.fieldByName('SGP_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoSGP }
procedure TItem_Tabela_de_Precos_SubGrupo.SetCodigoSGP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SGP_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SGP_CODIGO"!');
  end;
end;

{ Read method for property CodigoTPS }
function TItem_Tabela_de_Precos_SubGrupo.GetCodigoTPS : Integer;
begin
  try
    Result := Self.fieldByName('TPS_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTPS }
procedure TItem_Tabela_de_Precos_SubGrupo.SetCodigoTPS(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPS_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPS_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItem_Tabela_de_Precos_SubGrupo.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('ITS_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItem_Tabela_de_Precos_SubGrupo.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITS_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITS_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TItem_Tabela_de_Precos_SubGrupo.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('ITS_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItem_Tabela_de_Precos_SubGrupo.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITS_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITS_DT_CADASTRO"!');
    end;
end;

{ Read method for property Preco }
function TItem_Tabela_de_Precos_SubGrupo.GetPreco : Double;
begin
  try
    Result := Self.fieldByName('ITS_PRECO_VENDA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Preco }
procedure TItem_Tabela_de_Precos_SubGrupo.SetPreco(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITS_PRECO_VENDA').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITS_PRECO_VENDA"!');
  end;
end;

{ Read method for property PrecoOriginal }
function TItem_Tabela_de_Precos_SubGrupo.GetPrecoOriginal : Double;
begin
  try
    Result := Self.fieldByName('ITS_PRECO_ORIGINAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PrecoOriginal }
procedure TItem_Tabela_de_Precos_SubGrupo.SetPrecoOriginal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ITS_PRECO_ORIGINAL').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ITS_PRECO_ORIGINAL"!');
  end;
end;

{ Read method for property QuantidadeMinima }
function TItem_Tabela_de_Precos_SubGrupo.GetQuantidadeMinima : Double;
begin
  try
    Result := Self.fieldByName('ITS_QUANTIDADE_MINIMA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property QuantidadeMinima }
procedure TItem_Tabela_de_Precos_SubGrupo.SetQuantidadeMinima(Value : Double);
begin
     FQuantidadeMinima := Value;
end;

{ Read method for property Situacao }
function TItem_Tabela_de_Precos_SubGrupo.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('ITS_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TItem_Tabela_de_Precos_SubGrupo.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ITS_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ITS_SITUACAO"!');
    end;
end;

function TItem_Tabela_de_Precos_SubGrupo.AlterarAuto:Boolean;
var
  CdCNC, CdITS, CdSGP, CdPRD: integer;
begin
  Result:=false;
  CdCNC := CodigoCNC;
  CdITS := CodigoITS;
  CdSGP := CodigoSGP;
  CdPRD := CodigoPRD;
  try
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT TPS_CODIGO '+
        ' FROM ITEM_DE_TABELA_DE_PRECO_SUBGRUPO '+
        ' WHERE TPS_CODIGO='+ECodigoTPS.Text+
        ' AND SGP_CODIGO='+IntToStr(ECodigoSGP.KeyValue)+
        ' AND PRD_CODIGO='+ECodigoPRD.Text+
        ' AND ITS_CODIGO<>'+IntToStr(CodigoITS);
      Open;
      if not isEmpty then
      Begin
        ShowMessage('SubGrupo/Produto já cadastrado para essa Tabela!');
        Exit;
      end;
    end;
    edit;
    try
      CodigoGRP     := ECodigoGRP.KeyValue;
    except
    end;
    try
      CodigoSGP     := ECodigoSGP.KeyValue;
    except
    end;
    try
      CodigoPRD     := StrToInt(ECodigoPRD.Text);
    except
    end;    
    try
      CodigoUSU     := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado  := CConfiguracao.DataHora;
    except
    end;
    try
      QuantidadeMinima := StrToFloat(EQuantidadeMinima.Text);
    except
    end;
    try
      Preco         := StrToFloat(EPreco.Text);
    except
    end;
    try
      PrecoOriginal := StrToFloat(EPrecoOriginal.Text);
    except
    end;
    try
      Bonificacao := StrToFloat(EBonificacao.Text);
    except
    end;
    try
      Post;
      GeraLog(6920,CdCNC,CdITS,'SGP:'+IntToStr(CdSGP)+' PRD:'+IntToStr(CdPRD));
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TItem_Tabela_de_Precos_SubGrupo.AtualizaControles(Habilitar:Boolean);
begin
  Try
    ECodigoGRP.Enabled        := Habilitar;
  Except
  End;
  Try
    ECodigoSGP.Enabled        := Habilitar;
  Except
  End;
  Try
    ECodigoPRD.Enabled        := Habilitar;
  Except
  End;  
  Try
    EPreco.Enabled            := Habilitar;
  Except
  End;
  Try
    EPrecoOriginal.Enabled    := Habilitar;
  Except
  End;
  Try
    EBonificacao.Enabled      := Habilitar;
  Except
  End;
  Try
    EQuantidadeMinima.Enabled := Habilitar;
  Except
  End;
end;

procedure TItem_Tabela_de_Precos_SubGrupo.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TItem_Tabela_de_Precos_SubGrupo.CarregaDados;
begin
  Try
    ECodigoGRP.KeyValue    := CodigoGRP;
  Except
  End;
  Try
    ECodigoSGP.KeyValue    := CodigoSGP;
  Except
  End;
  Try
    ECodigoPRD.Text        := IntToStr(CodigoPRD);
  Except
  End;  
  Try
    EPreco.Text            :=Format('%.2f', [Preco]);
  Except
  End;
  Try
    EPrecoOriginal.Text    :=Format('%.2f', [PrecoOriginal]);
  Except
  End;
  Try
    EBonificacao.Text      :=Format('%.2f', [Bonificacao]);
  Except
  End;
  Try
    EQuantidadeMinima.Text         :=Format('%.2f', [QuantidadeMinima]);
  Except
  End;
end;

constructor TItem_Tabela_de_Precos_SubGrupo.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ITEM_DE_TABELA_DE_PRECO_SUBGRUPO';

     { Code to perform other tasks when the component is created }

end;

function TItem_Tabela_de_Precos_SubGrupo.Deletar(CdCNC,CdITS:Integer):Boolean;
var
  CdTPS, CdSGP, CdPRD: integer;
begin
  Result := False;
  If not(localizarCod(CdITS,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdTPS := CodigoTPS;
      CdSGP := CodigoSGP;
      CdPRD := CodigoPRD;
      if Delete then
      Begin
        GeraLog(6940,CdCNC,CdITS,'SGP:'+IntToStr(CdSGP)+' PRD:'+IntToStr(CdPRD));
        RegistrarDel(CdCNC,1680(*ItemDeTabelaDePrecoSubGrupo*),CdITS,'TPS:'+IntToStr(CdTPS)+' SGP:'+IntToStr(CdSGP)+' PRD:'+IntToStr(CdPRD));
        Result := True;
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_Tabela_de_Precos_SubGrupo.Destroy;
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

function TItem_Tabela_de_Precos_SubGrupo.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem :string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem := '';
  if not VerificaInteiroBranco(EBonificacao.Text) then
    EBonificacao.Text := '0';
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    ECodigoPRD.Text := '0';    
  if ECodigoGRP.Text = '' then
    mensagem := mensagem + 'Grupo inválido!'+#13;
  if ECodigoSGP.Text = '' then
    mensagem := mensagem + 'SubGrupo inválido!'+#13;
  if not VerificaFloatBranco(EPreco.text) then
    mensagem := mensagem + 'Preço inválido!'+#13;
  if not VerificaFloatBranco(EPrecoOriginal.text) then
    mensagem := mensagem + 'Preço Original inválido!'+#13;
  if not VerificaFloatBranco(EQuantidadeMinima.text) then
    mensagem := mensagem + 'Quantidade Mínima inválido!'+#13;
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    if StrToFloat(EPreco.Text) <= 0 then
    Begin
      ShowMessage('Preço inválido!');
      Exit;
    end;
    if StrToFloat(EPrecoOriginal.Text) <= 0 then
    Begin
      ShowMessage('Preço Original inválido!');
      Exit;
    end;
    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        close;
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
        Result := True;
      end;
    End
    else If Estado=2 then
    Begin
      cod:=codigoITS;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        close;
        open;
        LocalizarCod(cod, cdcnc);
        Estado:=0;
        AtualizaControles(False);
        Result := True;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TItem_Tabela_de_Precos_SubGrupo.InserirAuto:Boolean;
begin
  result:=false;
  try
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT TPS_CODIGO '+
        ' FROM ITEM_DE_TABELA_DE_PRECO_SUBGRUPO '+
        ' WHERE TPS_CODIGO='+ECodigoTPS.Text+
        ' AND SGP_CODIGO='+IntToStr(ECodigoSGP.KeyValue)+
        ' AND PRD_CODIGO='+ECodigoPRD.Text;        
      Open;
      if not isEmpty then
      Begin
        ShowMessage('SubGrupo já cadastrado para essa Tabela!');
        Exit;
      end;
    end;
    append;
    try
      codigoCNC   := ECodigoCNC.KeyValue;
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
      codigoITS   := SCodigo;
    except
    end;
    try
      CodigoGRP  := ECodigoGRP.KeyValue;
    except
    end;
    try
      CodigoSGP  := ECodigoSGP.KeyValue;
    except
    end;
    try
      CodigoPRD  := StrToInt(ECodigoPRD.Text);
    except
    end;    
    try
      CodigoTPS   := StrToInt(ECodigoTPS.Text);
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
       QuantidadeMinima    := StrToFloat(EQuantidadeMinima.Text);
    except
    end;
    try
      Situacao := 0;
    except
    end;
    try
      Post;
      GeraLog(6920,ECodigoCNC.KeyValue,SCodigo);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TItem_Tabela_de_Precos_SubGrupo.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoGRP.KeyValue := 0;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoSGP.KeyValue := 0;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoPRD.Text := '0';
  Except
  End;  
  Try
    EPreco.Clear;
  Except
  End;
  Try
    EPrecoOriginal.Clear;
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
    if Estado <> 1 then
      EQuantidadeMinima.Clear
    else
      EQuantidadeMinima.Text := '0';
  Except
  End;
end;

{ Localiza um cliente }
function TItem_Tabela_de_Precos_SubGrupo.LocalizarCod(CdITS,CdCNC:Integer):Boolean;
begin
  If (CdITS<>CodigoITS) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;ITS_CODIGO', vararrayof([CdCNC, CdITS]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_Tabela_de_Precos_SubGrupo.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TItem_Tabela_de_Precos_SubGrupo.PreparaInsercao;
begin
  ProximoCodigo('ITS_CODIGO');
  Estado := 1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
