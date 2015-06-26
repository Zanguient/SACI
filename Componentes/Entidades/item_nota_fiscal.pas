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
unit Item_Nota_Fiscal;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Variants;

type
  TItem_Nota_Fiscal = class(TSQuery)
    private
      { Private fields of TItem_Nota_Fiscal }
        { Storage for property Aliquota }
        FAliquota : Double;
        { Storage for property AliquotaISS }
        FAliquotaISS : Double;
        { Storage for property Amostra }
        FAmostra : Double;
        { Storage for property Bonificacao }
        FBonificacao : Double;
        { Storage for property CNCOrigem }
        FCNCOrigem : Integer;
        { Storage for property CodigoINF }
        FCodigoINF : Integer;
        { Storage for property CodigoLOT }
        FCodigoLOT : Integer;
        { Storage for property CodigoNTF }
        FCodigoNTF : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Desconto }
        FDesconto : Double;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property EAliquota }
        FEAliquota : TEdit;
        { Storage for property EAliquotaISS }
        FEAliquotaISS : TEdit;
        { Storage for property EAmostra }
        FEAmostra : TEdit;
        { Storage for property EBonificacao }
        FEBonificacao : TEdit;
        { Storage for property ECodigoINF }
        FECodigoINF : TEdit;
        { Storage for property ECodigoLOT }
        FECodigoLOT : TEdit;
        { Storage for property ECodigoNTF }
        FECodigoNTF : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDesconto }
        FEDesconto : TEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EIPI }
        FEIPI : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ETipoAliquota }
        FETipoAliquota : TComboBox;
        { Storage for property EValorUnit }
        FEValorUnit : TEdit;
        { Storage for property IPI }
        FIPI : Double;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property TipoAliquota }
        FTipoAliquota : Integer;
        { Storage for property ValorUnit }
        FValorUnit : Double;

      { Private methods of TItem_Nota_Fiscal }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Aliquota }
        function GetAliquota : Double;
        { Write method for property Aliquota }
        procedure SetAliquota(Value : Double);
        { Read method for property AliquotaISS }
        function GetAliquotaISS : Double;
        { Write method for property AliquotaISS }
        procedure SetAliquotaISS(Value : Double);
        { Read method for property Amostra }
        function GetAmostra : Double;
        { Write method for property Amostra }
        procedure SetAmostra(Value : Double);
        { Read method for property Bonificacao }
        function GetBonificacao : Double;
        { Write method for property Bonificacao }
        procedure SetBonificacao(Value : Double);
        { Read method for property CNCOrigem }
        function GetCNCOrigem : Integer;
        { Write method for property CNCOrigem }
        procedure SetCNCOrigem(Value : Integer);
        { Read method for property CodigoINF }
        function GetCodigoINF : Integer;
        { Write method for property CodigoINF }
        procedure SetCodigoINF(Value : Integer);
        { Read method for property CodigoLOT }
        function GetCodigoLOT : Integer;
        { Write method for property CodigoLOT }
        procedure SetCodigoLOT(Value : Integer);
        { Read method for property CodigoNTF }
        function GetCodigoNTF : Integer;
        { Write method for property CodigoNTF }
        procedure SetCodigoNTF(Value : Integer);
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
        { Read method for property Desconto }
        function GetDesconto : Double;
        { Write method for property Desconto }
        procedure SetDesconto(Value : Double);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property IPI }
        function GetIPI : Double;
        { Write method for property IPI }
        procedure SetIPI(Value : Double);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property TipoAliquota }
        function GetTipoAliquota : Integer;
        { Write method for property TipoAliquota }
        procedure SetTipoAliquota(Value : Integer);
        { Read method for property ValorUnit }
        function GetValorUnit : Double;
        { Write method for property ValorUnit }
        procedure SetValorUnit(Value : Double);

    protected
      { Protected fields of TItem_Nota_Fiscal }

      { Protected methods of TItem_Nota_Fiscal }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_Nota_Fiscal }

      { Public methods of TItem_Nota_Fiscal }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdINF:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC,CdINF, CDNTF,CdPRD,CdLOT,PTipoAliquota: integer;PAliquota,PAliqISS,PQuant,PValor,PDesconto,PIPI,PBon,PAmo:Double; PDescricao: String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdINF,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_Nota_Fiscal }
        property Aliquota : Double read GetAliquota write SetAliquota;
        property AliquotaISS : Double read GetAliquotaISS write SetAliquotaISS;
        property Amostra : Double read GetAmostra write SetAmostra;
        property Bonificacao : Double read GetBonificacao write SetBonificacao;
        property CNCOrigem : Integer read GetCNCOrigem write SetCNCOrigem;
        { Código do Item de Nota Fiscal }
        property CodigoINF : Integer read GetCodigoINF write SetCodigoINF;
        property CodigoLOT : Integer read GetCodigoLOT write SetCodigoLOT;
        property CodigoNTF : Integer read GetCodigoNTF write SetCodigoNTF;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Desconto : Double read GetDesconto write SetDesconto;
        property Descricao : String read GetDescricao write SetDescricao;
        property EAliquota : TEdit read FEAliquota write FEAliquota;
        property EAliquotaISS : TEdit read FEAliquotaISS write FEAliquotaISS;
        property EAmostra : TEdit read FEAmostra write FEAmostra;
        property EBonificacao : TEdit read FEBonificacao write FEBonificacao;
        property ECodigoINF : TEdit read FECodigoINF write FECodigoINF;
        property ECodigoLOT : TEdit read FECodigoLOT write FECodigoLOT;
        property ECodigoNTF : TEdit read FECodigoNTF write FECodigoNTF;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDesconto : TEdit read FEDesconto write FEDesconto;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EIPI : TEdit read FEIPI write FEIPI;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ETipoAliquota : TComboBox
             read FETipoAliquota write FETipoAliquota;
        property EValorUnit : TEdit read FEValorUnit write FEValorUnit;
        property IPI : Double read GetIPI write SetIPI;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property TipoAliquota : Integer
             read GetTipoAliquota write SetTipoAliquota;
        property ValorUnit : Double read GetValorUnit write SetValorUnit;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_Nota_Fiscal with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_Nota_Fiscal]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_Nota_Fiscal.AutoInitialize;
begin
     FEAliquota := nil;
     FEAliquotaISS := nil;
     FEAmostra := nil;
     FEBonificacao := nil;
     FECodigoINF := nil;
     FECodigoLOT := nil;
     FECodigoNTF := nil;
     FECodigoPRD := nil;
     FEDesconto := nil;
     FEDescricao := nil;
     FEIPI := nil;
     FEQuantidade := nil;
     FETipoAliquota := nil;
     FEValorUnit := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_Nota_Fiscal.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAliquota then
        FEAliquota := nil;
     if AComponent = FEAliquotaISS then
        FEAliquotaISS := nil;
     if AComponent = FEAmostra then
        FEAmostra := nil;
     if AComponent = FEBonificacao then
        FEBonificacao := nil;
     if AComponent = FECodigoINF then
        FECodigoINF := nil;
     if AComponent = FECodigoLOT then
        FECodigoLOT := nil;
     if AComponent = FECodigoNTF then
        FECodigoNTF := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDesconto then
        FEDesconto := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEIPI then
        FEIPI := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FETipoAliquota then
        FETipoAliquota := nil;
     if AComponent = FEValorUnit then
        FEValorUnit := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_Nota_Fiscal.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Aliquota }
function TItem_Nota_Fiscal.GetAliquota : Double;
begin
  try
    Result := Self.fieldByName('INF_ALIQUOTA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Aliquota }
procedure TItem_Nota_Fiscal.SetAliquota(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_ALIQUOTA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_ALIQUOTA"!');
    end;
end;

{ Read method for property AliquotaISS }
function TItem_Nota_Fiscal.GetAliquotaISS : Double;
begin
  try
    Result := Self.fieldByName('INF_ALIQUOTA_ISS').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property AliquotaISS }
procedure TItem_Nota_Fiscal.SetAliquotaISS(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_ALIQUOTA_ISS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_ALIQUOTA_ISS"!');
    end;
end;

{ Read method for property Amostra }
function TItem_Nota_Fiscal.GetAmostra : Double;
begin
  try
    Result := Self.fieldByName('INF_AMOSTRA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Amostra }
procedure TItem_Nota_Fiscal.SetAmostra(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_AMOSTRA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_AMOSTRA"!');
    end;
end;

{ Read method for property Bonificacao }
function TItem_Nota_Fiscal.GetBonificacao : Double;
begin
  try
    Result := Self.fieldByName('INF_BONIFICACAO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Bonificacao }
procedure TItem_Nota_Fiscal.SetBonificacao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_BONIFICACAO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_BONIFICACAO"!');
    end;
end;

{ Read method for property CNCOrigem }
function TItem_Nota_Fiscal.GetCNCOrigem : Integer;
begin
  try
    Result := Self.fieldByName('CNC_ORIGEM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CNCOrigem }
procedure TItem_Nota_Fiscal.SetCNCOrigem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_ORIGEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_ORIGEM"!');
    end;
end;

{ Read method for property CodigoINF }
function TItem_Nota_Fiscal.GetCodigoINF : Integer;
begin
  try
    Result := Self.fieldByName('INF_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoINF }
procedure TItem_Nota_Fiscal.SetCodigoINF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_CODIGO"!');
    end;
end;

{ Read method for property CodigoLOT }
function TItem_Nota_Fiscal.GetCodigoLOT : Integer;
begin
  try
    Result := Self.fieldByName('LOT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoLOT }
procedure TItem_Nota_Fiscal.SetCodigoLOT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LOT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LOT_CODIGO"!');
    end;
end;

{ Read method for property CodigoNTF }
function TItem_Nota_Fiscal.GetCodigoNTF : Integer;
begin
  try
    Result := Self.fieldByName('NTF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoNTF }
procedure TItem_Nota_Fiscal.SetCodigoNTF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItem_Nota_Fiscal.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_Nota_Fiscal.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItem_Nota_Fiscal.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('INF_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItem_Nota_Fiscal.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TItem_Nota_Fiscal.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('INF_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItem_Nota_Fiscal.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_DT_CADASTRO"!');
    end;
end;

{ Read method for property Desconto }
function TItem_Nota_Fiscal.GetDesconto : Double;
begin
  try
    Result := Self.fieldByName('INF_DESCONTO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Desconto }
procedure TItem_Nota_Fiscal.SetDesconto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_DESCONTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_DESCONTO"!');
    end;
end;

{ Read method for property Descricao }
function TItem_Nota_Fiscal.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('INF_SERVICO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TItem_Nota_Fiscal.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_SERVICO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_SERVICO"!');
    end;
end;

{ Read method for property IPI }
function TItem_Nota_Fiscal.GetIPI : Double;
begin
  try
    result := Self.fieldByName('INF_ALIQUOTA_IPI').asFloat;
  except
    Result := 0;
  end;
end;

{ Write method for property IPI }
procedure TItem_Nota_Fiscal.SetIPI(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_ALIQUOTA_IPI').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_ALIQUOTA_IPI"!');
    end;
end;

{ Read method for property Quantidade }
function TItem_Nota_Fiscal.GetQuantidade : Double;
begin
  try
    result := Self.fieldByName('INF_QUANTIDADE').asFloat;
  except
    Result := 0;
  end;
end;

{ Write method for property Quantidade }
procedure TItem_Nota_Fiscal.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_QUANTIDADE"!');
    end;
end;

{ Read method for property TipoAliquota }
function TItem_Nota_Fiscal.GetTipoAliquota : Integer;
begin
  try
    Result := Self.fieldByName('INF_TIPO_ALIQUOTA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoAliquota }
procedure TItem_Nota_Fiscal.SetTipoAliquota(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INF_TIPO_ALIQUOTA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INF_TIPO_ALIQUOTA"!');
    end;
end;

{ Read method for property ValorUnit }
function TItem_Nota_Fiscal.GetValorUnit : Double;
begin
  try
    Result := Self.fieldByName('INF_PRECO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ValorUnit }
procedure TItem_Nota_Fiscal.SetValorUnit(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('INF_PRECO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "INF_PRECO"!');
  end;
end;

function TItem_Nota_Fiscal.AlterarAuto:Boolean;
begin
  Result:=False;
  try
    edit;
    try
      CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado  := CConfiguracao.DataHora;
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
      Descricao  := EDescricao.Text;
    except
    end;
    try
      Quantidade := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      Bonificacao := StrToFloat(EBonificacao.Text);
    except
    end;
    try
      Amostra := StrToFloat(EAmostra.Text);
    except
    end;
    try
      ValorUnit  := StrToFloat(EValorUnit.Text);
    except
    end;
    try
      Desconto  := StrToFloat(EDesconto.Text);
    except
    end;
    try
      IPI       := StrToFloat(EIPI.Text);
    except
    end;
    try
      TipoAliquota := ETipoAliquota.ItemIndex;
    except
    end;
    try
      Aliquota   := StrToFloat(EAliquota.Text);
    except
    end;
    try
      AliquotaISS   := StrToFloat(EAliquotaISS.Text);
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

procedure TItem_Nota_Fiscal.AtualizaControles(Habilitar:Boolean);
begin
  Try
    if Estado = 1 then
      ECodigoPRD.Enabled     :=Habilitar
    else
      ECodigoPRD.Enabled     := False;
  Except
  End;
  Try
    ECodigoLOT.Enabled     :=Habilitar;
  Except
  End;
  Try
    if CConfiguracao.Empresa <> 3 then
      EDescricao.Enabled       :=Habilitar;
  Except
  End;
  Try
    EQuantidade.Enabled      :=Habilitar;
  Except
  End;
  Try
    EBonificacao.Enabled      :=Habilitar;
  Except
  End;
  Try
    EAmostra.Enabled          :=Habilitar;
  Except
  End;
  Try
    EValorUnit.Enabled        :=Habilitar;
  Except
  End;
  Try
    EDesconto.Enabled        :=Habilitar;
  Except
  End;
  Try
    EIPI.Enabled             :=Habilitar;
  Except
  End;
  Try
//Suspenso até ser reformado Substituto
//    if CConfiguracao.Empresa <> 3 then
//      ETipoAliquota.Enabled        :=Habilitar;
  Except
  End;
  Try
    EAliquota.Enabled        :=Habilitar;
  Except
  End;
  Try
    EAliquotaISS.Enabled     :=Habilitar;
  Except
  End;
end;

procedure TItem_Nota_Fiscal.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TItem_Nota_Fiscal.CarregaDados;
begin
  Try
    ECodigoINF.Text    :=IntToStr(CodigoINF);
  Except
  End;
  try
    ECodigoPRD.Text    := IntToStr(CodigoPRD);
  except
  end;
  try
    ECodigoLOT.Text    := IntToStr(CodigoLOT);
  except
  end;
  try
    EDescricao.Text    := Descricao;
  except
  end;
  try
    EQuantidade.Text   := Format('%.2f', [Quantidade]);
  except
  end;
  try
    EBonificacao.Text   := Format('%.2f', [Bonificacao]);
  except
  end;
  try
    EAmostra.Text   := Format('%.2f', [Amostra]);
  except
  end;
  try
    EValorUnit.Text    := Format('%.2f', [ValorUnit]);
  except
  end;
  try
    EDesconto.Text   := Format('%.2f', [Desconto]);
  except
  end;
  try
    EIPI.Text        := Format('%.2f', [IPI]);
  except
  end;
  try
    ETipoAliquota.ItemIndex := TipoAliquota;
  except
  end;
  try
    EAliquota.Text     := Format('%.2f', [Aliquota]);
  except
  end;
  try
    EAliquotaISS.Text     := Format('%.2f', [AliquotaISS]);
  except
  end;
end;

constructor TItem_Nota_Fiscal.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ITEM_DE_NOTA_FISCAL';

     { Code to perform other tasks when the component is created }

end;

function TItem_Nota_Fiscal.Deletar(CdCNC,CdINF:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdINF,CdCNC)) Then
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

destructor TItem_Nota_Fiscal.Destroy;
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

function TItem_Nota_Fiscal.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:String;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if Trim(EIPI.Text) = '' then
    EIPI.Text := '0';
  if Trim(EAliquotaISS.Text) = '' then
    EAliquotaISS.Text := '0';
  if EDesconto.Text = '' then
    EDesconto.Text := '0';
  If not VerificafloatBranco(EQuantidade.text) Then
    mensagem:=mensagem+'Quantidade digitada incorretamente!'+#13;
  If not VerificafloatBranco(EValorUnit.text) Then
    mensagem:=mensagem+'Valor unitário digitado incorretamente!'+#13;
  If not Verificafloat(EDesconto.text) Then
    mensagem:=mensagem+'Desconto digitado incorretamente!'+#13;
  If not VerificafloatBranco(EIPI.text) Then
    mensagem:=mensagem+'IPI digitado incorretamente!'+#13;
  If not VerificafloatBranco(EAliquotaISS.text) Then
    mensagem:=mensagem+'Aliquota ISS digitado incorretamente!'+#13;
  If not VerificaInteiroBranco(ECodigoLOT.text) Then
    mensagem:=mensagem+'Código de Lote digitado incorretamente!'+#13;
  If mensagem <>'' Then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
  Else
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
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoINF;
      cdcnc:=codigoCnc;
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

{ Insere um Cliente }
function TItem_Nota_Fiscal.Inserir(CdCNC,CdINF, CDNTF,CdPRD,CdLOT,PTipoAliquota: integer;PAliquota,PAliqISS,PQuant,PValor,PDesconto,PIPI,PBon,PAmo:Double; PDescricao: String):boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdINF=0 then
    Cod    := ProximoCodigo('INF_CODIGO')
  else
    Cod    := CdINF;
  if Tabela = '' then
    Tabela := 'ITEM_DE_NOTA_FISCAL';
  If VerificaRegistroExiste('CNC_ORIGEM='+IntToStr(CdCNC)+' AND INF_CODIGO='+IntToStr(Cod)) Then
    ShowMessage('Não foi possível inserir o registro da tabela '+Tabela+'. Já existe!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT ITEM_DE_NOTA_FISCAL '+
        '(INF_CODIGO,CNC_CODIGO,CNC_ORIGEM,USU_CODIGO,INF_DT_CADASTRO '+
        ',NTF_CODIGO,PRD_CODIGO,LOT_CODIGO,INF_TIPO_ALIQUOTA,INF_ALIQUOTA '+
        ',INF_ALIQUOTA_ISS,INF_QUANTIDADE,INF_BONIFICACAO,INF_AMOSTRA '+
        ',INF_PRECO,INF_DESCONTO,INF_ALIQUOTA_IPI,INF_SERVICO) VALUES '+
        '( '+IntToStr(Cod)+
        ', '+IntToStr(CdCNC)+
        ', '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(CdNTF)+
        ', '+IntToStr(CdPRD)+
        ', '+IntToStr(CdLOT)+
        ', '+VirgPonto(PTipoAliquota)+
        ', '+VirgPonto(PAliquota)+
        ', '+VirgPonto(PAliqISS)+
        ', '+VirgPonto(PQuant)+
        ', '+VirgPonto(PBon)+
        ', '+VirgPonto(PAmo)+
        ', '+VirgPonto(PValor)+
        ', '+VirgPonto(PDesconto)+
        ', '+VirgPonto(PIPI)+
        ',"'+PDescricao+'") ');
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
    end;
  end;
end;

function TItem_Nota_Fiscal.InserirAuto:Boolean;
begin
  result:=false;
  try
    append;
    try
      Codigocnc   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CNCOrigem   := CentroDeCusto;
    except
    end;
    try
      codigoINF := SCodigo;
    except
    end;
    try
      CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro   := CConfiguracao.DataHora;
    except
    end;
    try
      CodigoNTF   := StrToInt(ECodigoNTF.Text);
    except
    end;
    try
      CodigoPRD   := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      CodigoLOT   := StrToInt(ECodigoLOT.Text);
    except
    end;
    try
      Descricao := EDescricao.Text;
    except
    end;
    try
      Quantidade   := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      Bonificacao  := StrToFloat(EBonificacao.Text);
    except
    end;
    try
      Amostra  := StrToFloat(EAmostra.Text);
    except
    end;
    try
      ValorUnit   := StrToFloat(EValorUnit.Text);
    except
    end;
    try
      Desconto  := StrToFloat(EDesconto.Text);
    except
    end;
    try
      IPI       := StrToFloat(EIPI.Text);
    except
    end;
    try
      TipoAliquota := ETipoAliquota.ItemIndex;
    except
    end;
    try
      Aliquota   := StrToFloat(EAliquota.Text);
    except
    end;
    try
      AliquotaISS   := StrToFloat(EAliquotaISS.Text);
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


procedure TItem_Nota_Fiscal.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoINF.Clear;
  except
  end;
  try
    ECodigoPRD.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoLOT.Clear
    else
      ECodigoLOT.Text := '0';
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    EQuantidade.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EBonificacao.Clear
    else
      EBonificacao.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      EAmostra.Clear
    else
      EAmostra.Text := '0';
  except
  end;
  try
    EValorUnit.Clear;
  except
  end;
  try
    EDesconto.Clear;
  except
  end;
  try
    if Trim(EIPI.Text) = '' then
      if Estado <> 1 then
        EIPI.Clear
      else
        EIPI.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      ETipoAliquota.ItemIndex := -1
    else
      ETipoAliquota.ItemIndex := 0;
  except
  end;
  try
    EAliquota.Clear;
  except
  end;
  try
    EAliquotaISS.Clear;
  except
  end;
end;

{ Localiza um cliente }
function TItem_Nota_Fiscal.LocalizarCod(CdINF,CdCNC:Integer):Boolean;
begin
  If (CdINF<>CodigoINF) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;INF_CODIGO', vararrayof([CdCNC, CdINF]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_Nota_Fiscal.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TItem_Nota_Fiscal.PreparaInsercao;
begin
  ProximoCodigo('INF_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TItem_Nota_Fiscal.deletarauto:Boolean;
begin
  Result:=False;
  try
    if Delete then
    Begin
      Result := True;
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
