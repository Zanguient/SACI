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
unit Tabela_de_Precos_SubGrupo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Variants;

type
  TTabela_de_Precos_SubGrupo = class(TSQuery)
    private
      { Private fields of TTabela_de_Precos_SubGrupo }
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoTPS }
        FCodigoTPS : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataValidade }
        FDataValidade : Tdatetime;
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
        { Storage for property EClienteCNC }
        FEClienteCNC : TEdit;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoTPS }
        FECodigoTPS : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataValidade }
        FEDataValidade : TMaskEdit;
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
        { Storage for property ELaboratorio }
        FELaboratorio : TCheckBox;
        { Storage for property EPrincipal }
        FEPrincipal : TCheckBox;
        { Storage for property Laboratorio }
        FLaboratorio : Boolean;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Principal }
        FPrincipal : Boolean;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TTabela_de_Precos_SubGrupo }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Write method for property ClienteCNC }
        procedure SetClienteCNC(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
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
        { Read method for property DataValidade }
        function GetDataValidade : Tdatetime;
        { Write method for property DataValidade }
        procedure SetDataValidade(Value : Tdatetime);
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
        { Read method for property Laboratorio }
        function GetLaboratorio : Boolean;
        { Write method for property Laboratorio }
        procedure SetLaboratorio(Value : Boolean);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Principal }
        function GetPrincipal : Boolean;
        { Write method for property Principal }
        procedure SetPrincipal(Value : Boolean);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TTabela_de_Precos_SubGrupo }

      { Protected methods of TTabela_de_Precos_SubGrupo }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TTabela_de_Precos_SubGrupo }

      { Public methods of TTabela_de_Precos_SubGrupo }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdTPS:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza uma Tabela de Preço }
        function LocalizarCod(CdTPS,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TTabela_de_Precos_SubGrupo }
        property ClienteCNC : Integer read GetClienteCNC write SetClienteCNC;
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        { Código da tabela de preços }
        property CodigoTPS : Integer read GetCodigoTPS write SetCodigoTPS;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataValidade : Tdatetime
             read GetDataValidade write SetDataValidade;
        property DescontoEspecial : Double
             read GetDescontoEspecial write SetDescontoEspecial;
        property DescontoEspecialPrazo : Double
             read GetDescontoEspecialPrazo write SetDescontoEspecialPrazo;
        property DescontoSimples : Double
             read GetDescontoSimples write SetDescontoSimples;
        property DescontoSimplesPrazo : Double
             read GetDescontoSimplesPrazo write SetDescontoSimplesPrazo;
        property Descricao : String read GetDescricao write SetDescricao;
        property EClienteCNC : TEdit read FEClienteCNC write FEClienteCNC;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoTPS : TEdit read FECodigoTPS write FECodigoTPS;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataValidade : TMaskEdit
             read FEDataValidade write FEDataValidade;
        property EDescontoEspecial : TEdit
             read FEDescontoEspecial write FEDescontoEspecial;
        property EDescontoEspecialPrazo : TEdit
             read FEDescontoEspecialPrazo write FEDescontoEspecialPrazo;
        property EDescontoSimples : TEdit
             read FEDescontoSimples write FEDescontoSimples;
        property EDescontoSimplesPrazo : TEdit
             read FEDescontoSimplesPrazo write FEDescontoSimplesPrazo;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property ELaboratorio : TCheckBox
             read FELaboratorio write FELaboratorio;
        property EPrincipal : TCheckBox read FEPrincipal write FEPrincipal;
        property Laboratorio : Boolean
             read GetLaboratorio write SetLaboratorio;
        property Observacao : String read GetObservacao write SetObservacao;
        property Principal : Boolean read GetPrincipal write SetPrincipal;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTabela_de_Precos_SubGrupo with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTabela_de_Precos_SubGrupo]);
end;

{ Method to set variable and property values and create objects }
procedure TTabela_de_Precos_SubGrupo.AutoInitialize;
begin
     FEClienteCNC := nil;
     FECodigoCLI := nil;
     FECodigoCNC := nil;
     FECodigoTPS := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataValidade := nil;
     FEDescontoEspecial := nil;
     FEDescontoEspecialPrazo := nil;
     FEDescontoSimples := nil;
     FEDescontoSimplesPrazo := nil;
     FEDescricao := nil;
     FELaboratorio := nil;
     FEPrincipal := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TTabela_de_Precos_SubGrupo.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoTPS then
        FECodigoTPS := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataValidade then
        FEDataValidade := nil;
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
     if AComponent = FELaboratorio then
        FELaboratorio := nil;
     if AComponent = FEPrincipal then
        FEPrincipal := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TTabela_de_Precos_SubGrupo.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ClienteCNC }
function TTabela_de_Precos_SubGrupo.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property ClienteCNC }
procedure TTabela_de_Precos_SubGrupo.SetClienteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodigoCLI }
function TTabela_de_Precos_SubGrupo.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCLI }
procedure TTabela_de_Precos_SubGrupo.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoTPS }
function TTabela_de_Precos_SubGrupo.GetCodigoTPS : Integer;
begin
  try
    Result := Self.fieldByName('TPS_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTPS }
procedure TTabela_de_Precos_SubGrupo.SetCodigoTPS(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPS_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPS_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TTabela_de_Precos_SubGrupo.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('TPS_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TTabela_de_Precos_SubGrupo.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TPS_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TPS_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TTabela_de_Precos_SubGrupo.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('TPS_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TTabela_de_Precos_SubGrupo.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TPS_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TPS_DT_CADASTRO"!');
  end;
end;

{ Read method for property DataValidade }
function TTabela_de_Precos_SubGrupo.GetDataValidade : Tdatetime;
begin
  try
    Result := Self.fieldByName('TPS_DT_VALIDADE').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataValidade }
procedure TTabela_de_Precos_SubGrupo.SetDataValidade(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TPS_DT_VALIDADE').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TPS_DT_VALIDADE"!');
  end;
end;

{ Read method for property DescontoEspecial }
function TTabela_de_Precos_SubGrupo.GetDescontoEspecial : Double;
begin
  try
    Result := Self.fieldByName('TPS_DESCONTO_ESPECIAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property DescontoEspecial }
procedure TTabela_de_Precos_SubGrupo.SetDescontoEspecial(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPS_DESCONTO_ESPECIAL').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPS_DESCONTO_ESPECIAL"!');
    end;
end;

{ Read method for property DescontoEspecialPrazo }
function TTabela_de_Precos_SubGrupo.GetDescontoEspecialPrazo : Double;
begin
  try
    Result := Self.fieldByName('TPS_DESCONTO_ESPECIAL_PRAZO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property DescontoEspecialPrazo }
procedure TTabela_de_Precos_SubGrupo.SetDescontoEspecialPrazo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPS_DESCONTO_ESPECIAL_PRAZO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPS_DESCONTO_ESPECIAL_PRAZO"!');
    end;
end;

{ Read method for property DescontoSimples }
function TTabela_de_Precos_SubGrupo.GetDescontoSimples : Double;
begin
  try
    Result := Self.fieldByName('TPS_DESCONTO_SIMPLES').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property DescontoSimples }
procedure TTabela_de_Precos_SubGrupo.SetDescontoSimples(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPS_DESCONTO_SIMPLES').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPS_DESCONTO_SIMPLES"!');
    end;
end;

{ Read method for property DescontoSimplesPrazo }
function TTabela_de_Precos_SubGrupo.GetDescontoSimplesPrazo : Double;
begin
  try
    Result := Self.fieldByName('TPS_DESCONTO_SIMPLES_PRAZO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property DescontoSimplesPrazo }
procedure TTabela_de_Precos_SubGrupo.SetDescontoSimplesPrazo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPS_DESCONTO_SIMPLES_PRAZO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPS_DESCONTO_SIMPLES_PRAZO"!');
    end;
end;

{ Read method for property Descricao }
function TTabela_de_Precos_SubGrupo.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('TPS_DESCRICAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Descricao }
procedure TTabela_de_Precos_SubGrupo.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TPS_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TPS_DESCRICAO"!');
  end;
end;

{ Read method for property Laboratorio }
function TTabela_de_Precos_SubGrupo.GetLaboratorio : Boolean;
begin
  try
    Result := (Self.fieldByName('TPS_LABORATORIO').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property Laboratorio }
procedure TTabela_de_Precos_SubGrupo.SetLaboratorio(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('TPS_LABORATORIO').asInteger := 1
      else
        Self.fieldByName('TPS_LABORATORIO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "TPS_LABORATORIO"!');
    end;
end;

{ Read method for property Observacao }
function TTabela_de_Precos_SubGrupo.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('TPS_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TTabela_de_Precos_SubGrupo.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TPS_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TPS_OBSERVACAO"!');
  end;
end;

{ Read method for property Principal }
function TTabela_de_Precos_SubGrupo.GetPrincipal : Boolean;
begin
  try
    Result := (Self.fieldByName('TPS_PRINCIPAL').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property Principal }
procedure TTabela_de_Precos_SubGrupo.SetPrincipal(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('TPS_PRINCIPAL').asInteger := 1
      else
        Self.fieldByName('TPS_PRINCIPAL').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "TPS_PRINCIPAL"!');
    end;
end;

{ Read method for property Situacao }
function TTabela_de_Precos_SubGrupo.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('TPS_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TTabela_de_Precos_SubGrupo.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TPS_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TPS_SITUACAO"!');
  end;
end;

function TTabela_de_Precos_SubGrupo.AlterarAuto:Boolean;
var
  CdCNC, CdTPS: integer;
  sDetalhe: string;
begin
  Result:=false;
  CdCNC := CodigoCNC;
  CdTPS := CodigoTPS;
  sDetalhe := '';

  if EPrincipal.Checked then
  Begin
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT TPS_CODIGO FROM TABELA_DE_PRECO_SUBGRUPO '+
        ' WHERE TPS_PRINCIPAL=1 '+
        ' AND TPS_CODIGO<>'+ECodigoTPS.Text;
      Open;
      if not isEmpty then
      Begin
        ShowMessage('Já existe outra tabela principal de Produtos!');
        Exit;
      end;
    end;
  end;
  try
    edit;
    try
      DataAlterado  := CConfiguracao.DataHora;
    except
    end;
    try
      CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
      ClienteCNC  := StrToInt(EClienteCNC.Text);
      sDetalhe := sDetalhe + 'CLI:'+EClienteCNC.Text;
    except
    end;
    try
      CodigoCLI  := StrToInt(ECodigoCLI.Text);
      sDetalhe := sDetalhe + '-' + ECodigoCLI.Text;
    except
    end;
    try
      Descricao  := EDescricao.Text;
      sDetalhe := sDetalhe + EDescricao.Text;
    except
    end;
    try
      Laboratorio := ELaboratorio.Checked;
      if ELaboratorio.Checked then
        sDetalhe := sDetalhe + ' Lab.'
    except
    end;
    try
      Principal := EPrincipal.Checked;
      if EPrincipal.Checked then
        sDetalhe := sDetalhe + ' Princ.'
    except
    end;
    try
       DescontoEspecial := StrToFloat(EDescontoEspecial.Text);
       sDetalhe := sDetalhe + 'DescEsp:'+EDescontoEspecial.Text;
    except
    end;
    try
       DescontoSimples := StrToFloat(EDescontoSimples.Text);
       sDetalhe := sDetalhe + 'DescSim:'+EDescontoSimples.Text;
    except
    end;
    try
       DescontoEspecialPrazo := StrToFloat(EDescontoEspecialPrazo.Text);
       sDetalhe := sDetalhe + 'DescEspP:'+EDescontoEspecialPrazo.Text;
    except
    end;
    try
       DescontoSimplesPrazo := StrToFloat(EDescontoSimplesPrazo.Text);
       sDetalhe := sDetalhe + 'DescSimP:'+EDescontoSimplesPrazo.Text;
    except
    end;
    try
       DataValidade  := StrToDateTime(EDataValidade.Text);
       sDetalhe := sDetalhe + 'Val:'+EDataValidade.Text;
    except
    end;
    try
      Post;
      GeraLog(6910, CdCNC, CdTPS, sDetalhe);
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TTabela_de_Precos_SubGrupo.AtualizaControles(Habilitar:Boolean);
begin
  Try
    ECodigoCLI.Enabled     :=Habilitar;
  Except
  End;
  Try
    if CodigoCLI > 0 then
      EDescricao.Enabled     := False
    else
      EDescricao.Enabled     :=Habilitar;
  Except
  End;
  Try
    EDataValidade.Enabled      :=Habilitar;
  Except
  End;
  Try
    ELaboratorio.Enabled        :=Habilitar;
  Except
  End;
  Try
    if ELaboratorio.Checked then
      EPrincipal.Enabled          := Habilitar
    else
      EPrincipal.Enabled          := False;
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
  try
    if Estado=1 then
      ECodigoCNC.Enabled  :=Habilitar
    else
      ECodigoCNC.Enabled    := False;
  except
  end;
end;

procedure TTabela_de_Precos_SubGrupo.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TTabela_de_Precos_SubGrupo.CarregaDados;
begin
  Try
    ECodigoTPS.Text        :=IntToStr(CodigoTPS);
  Except
  End;
  try
    ECodigoCNC.KeyValue   := CodigoCNC;
  except
  end;
  Try
    EClienteCNC.Text        :=IntToStr(ClienteCNC);
  Except
  End;
  Try
    ECodigoCLI.Text        :=IntToStr(CodigoCLI);
  Except
  End;
  Try
    EDescricao.Text        :=Descricao;
  Except
  End;
  Try
    if DataValidade=0 then
      EDataValidade.Clear
    else
      EDataValidade.Text            :=FormatDateTime('dd/mm/yyyy', DataValidade);
  Except
  End;
  Try
    if DataCadastro=0 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text            :=FormatDateTime('dd/mm/yyyy hh:mm:ss', DataCadastro);
  Except
  End;
  Try
    if DataAlterado=0 then
      EDataAlterado.Clear
    else
      EDataAlterado.Text            :=FormatDateTime('dd/mm/yyyy hh:mm:ss', DataAlterado);
  Except
  End;
  Try
    ELaboratorio.Checked   := Laboratorio;
  Except
  End;
  Try
    EPrincipal.Checked     := Principal;
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
end;

constructor TTabela_de_Precos_SubGrupo.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'TABELA_DE_PRECO_SUBGRUPO';

     { Code to perform other tasks when the component is created }

end;

function TTabela_de_Precos_SubGrupo.Deletar(CdCNC,CdTPS:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdTPS,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        GeraLog(6930, CdCNC, CdTPS);
        RegistrarDel(CdCNC,1990(*TabelaDePrecoSubGrupo*),CdTPS);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TTabela_de_Precos_SubGrupo.Destroy;
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

function TTabela_de_Precos_SubGrupo.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  if not VerificaInteiroBranco(ECodigoCLI.Text) then
    ECodigoCLI.Text := '0';
  mensagem:='';
  if EDescontoEspecial.Text = '' then
    EDescontoEspecial.Text := '0';
  if EDescontoSimples.Text = '' then
    EDescontoSimples.Text := '0';
  if EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição incorreta!'+#13;
  If not VerificaInteiroBranco(EClienteCNC.text) Then
    mensagem:=mensagem+'CNC do Cliente incorreto!'+#13;
  If not VerificaInteiroBranco(ECodigoCLI.text) Then
    mensagem:=mensagem+'Código do Cliente incorreto!'+#13;
  If not VerificadataBranco(EDataValidade.text) Then
    mensagem:=mensagem+'Data de Validade incorreta!'+#13;
  if not verificafloat(EDescontoEspecial.text) then
    mensagem:= mensagem + 'Desconto Especial digitado incorretamente!';
  if not verificafloat(EDescontoSimples.text) then
    mensagem:= mensagem + 'Desconto Simples digitado incorretamente!';
  if not verificafloat(EDescontoEspecialPrazo.text) then
    mensagem:= mensagem + 'Desconto Especial Prazo digitado incorretamente!';
  if not verificafloat(EDescontoSimplesPrazo.text) then
    mensagem:= mensagem + 'Desconto Simples Prazo digitado incorretamente!';
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
        SQL.Text := 'SELECT * FROM TABELA_DE_PRECO_SUBGRUPO '+
          ' WHERE TPS_CODIGO='+IntToStr(SCodigo);
        open;
        AtualizaControles(False);
        Estado:=0;
        Result := true;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoTPS;
      if Alterarauto then
      Begin
        close;
        SQL.Text := 'SELECT * FROM TABELA_DE_PRECO_SUBGRUPO '+
          ' WHERE TPS_CODIGO='+IntToStr(Cod);
        open;
        AtualizaControles(False);
        Estado:=0;
        Result := True;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TTabela_de_Precos_SubGrupo.InserirAuto:Boolean;
var
  sDetalhe: string;
begin
  result:=false;
  sDetalhe := '';
  if EPrincipal.Checked then
  Begin
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT TPS_CODIGO FROM TABELA_DE_PRECO_SUBGRUPO '+
        ' WHERE TPS_PRINCIPAL=1 ';
      Open;
      if not isEmpty then
      Begin
        ShowMessage('Já existe outra tabela principal de Produtos!');
        Exit;
      end;
    end;
  end;
  try
    append;
    try
      codigoCNC   := ECodigoCNC.KeyValue;
    except
    end;
    try
      CodigoTPS   := SCodigo;
    except
    end;
    try
      CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
      ClienteCNC  := StrToInt(EClienteCNC.Text);
      sDetalhe := sDetalhe + 'CLI:'+EClienteCNC.Text;
    except
    end;
    try
      CodigoCLI  := StrToInt(ECodigoCLI.Text);
      sDetalhe := sDetalhe + '-'+ECodigoCLI.Text;
    except
    end;
    try
      DataCadastro  := CConfiguracao.DataHora;
    except
    end;
    try
       Descricao  := EDescricao.Text;
       sDetalhe := sDetalhe + ' ' + EDescricao.Text;
    except
    end;
    try
      Laboratorio := ELaboratorio.Checked;
      if ELaboratorio.Checked then
        sDetalhe := sDetalhe + ' Lab.'       
    except
    end;
    try
       Principal := EPrincipal.Checked;
      if EPrincipal.Checked then
        sDetalhe := sDetalhe + ' Princ.'       
    except
    end;
    try
       DescontoEspecial := StrToFloat(EDescontoEspecial.Text);
       sDetalhe := sDetalhe + ' DesEsp:' + EDescontoEspecial.Text;
    except
    end;
    try
       DescontoSimples := StrToFloat(EDescontoSimples.Text);
       sDetalhe := sDetalhe + ' DesSim:' + EDescontoSimples.Text;
    except
    end;
    try
       DescontoEspecialPrazo := StrToFloat(EDescontoEspecialPrazo.Text);
       sDetalhe := sDetalhe + ' DesEspP:' + EDescontoEspecialPrazo.Text;
    except
    end;
    try
       DescontoSimplesPrazo := StrToFloat(EDescontoSimplesPrazo.Text);
       sDetalhe := sDetalhe + ' DesSimP:' + EDescontoSimplesPrazo.Text;
    except
    end;
    try
      DataValidade  := StrToDateTime(EDataValidade.Text);
      sDetalhe := sDetalhe + ' VAL:' + EDataValidade.Text;
    except
    end;
    try
      Situacao := 0;
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

procedure TTabela_de_Precos_SubGrupo.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoTPS.Clear
  except
  end;
  try
    if Estado <> 1 then
      EClienteCNC.Clear
    else
      EClienteCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  except
  end;
  try
    if Estado <> 1 then
      ECodigoCLI.Clear
    else
      ECodigoCLI.Text := '0';
  except
  end;
  Try
    EDescricao.Clear;
  Except
  End;
  try
    if Estado <> 1 then
      ECodigoCNC.KeyValue := -1
    else
      ECodigoCNC.KeyValue := CConfiguracao.CodigoCNC;
  except
  end;
  Try
   if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text  :=FormatDateTime('dd/mm/yyyy hh:mm:ss', CConfiguracao.DataHora);
  Except
  End;
  Try
    EDataAlterado.Clear;
  Except
  End;
  Try
    EDataValidade.Clear;
  Except
  End;
  Try
    ELaboratorio.Checked := False;
  Except
  End;
  Try
    EPrincipal.Checked := False;
  Except
  End;
  Try
    if Estado <> 1 then
      EDescontoEspecial.Clear
    else
      EDescontoEspecial.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      EDescontoSimples.Clear
    else
      EDescontoSimples.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      EDescontoEspecialPrazo.Clear
    else
      EDescontoEspecialPrazo.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      EDescontoSimplesPrazo.Clear
    else
      EDescontoSimplesPrazo.Text := '0,00';
  Except
  End;
end;

{ Localiza uma Tabela de Preço }
function TTabela_de_Precos_SubGrupo.LocalizarCod(CdTPS,CdCNC:Integer):Boolean;
begin
  If (CdTPS<>CodigoTPS) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;TPS_CODIGO', vararrayof([CdCNC, CdTPS]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TTabela_de_Precos_SubGrupo.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  Try
    EDataAlterado.Text  :=FormatDateTime('dd/mm/yyyy hh:mm:ss', CConfiguracao.DataHora);
  Except
  End;
end;

procedure TTabela_de_Precos_SubGrupo.PreparaInsercao;
begin
  ProximoCodigo('TPS_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
