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
unit Conta_de_Caixa;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TConta_de_Caixa = class(TSQuery)
    private
      { Private fields of TConta_de_Caixa }
        { Storage for property Avulso }
        FAvulso : Boolean;
        { Storage for property CodigoCCX }
        FCodigoCCX : Integer;
        { Storage for property Contabil1 }
        FContabil1 : String;
        { Storage for property Contabil2 }
        FContabil2 : String;
        { Storage for property Contabil3 }
        FContabil3 : String;
        { Storage for property Contabil4 }
        FContabil4 : String;
        { Storage for property DC }
        FDC : String;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property Disponivel }
        FDisponivel : Double;
        { Storage for property EAvulso }
        FEAvulso : TCheckBox;
        { Storage for property ECodigoCCX }
        FECodigoCCX : TEdit;
        { Storage for property EContabil1 }
        FEContabil1 : TEdit;
        { Storage for property EContabil2 }
        FEContabil2 : TEdit;
        { Storage for property EContabil3 }
        FEContabil3 : TEdit;
        { Storage for property EContabil4 }
        FEContabil4 : TEdit;
        { Storage for property EDC }
        FEDC : TComboBox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EDisponivel }
        FEDisponivel : TEdit;
        { Storage for property EGrupo }
        FEGrupo : TDBLookupComboBox;
        { Storage for property EHistoricoContabil }
        FEHistoricoContabil : TEdit;
        { Storage for property ELimiteGasto }
        FELimiteGasto : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property EVisualizarCaixa }
        FEVisualizarCaixa : TCheckBox;
        { Storage for property EVisualizarFinanceiro }
        FEVisualizarFinanceiro : TCheckBox;
        { Storage for property Grupo }
        FGrupo : Integer;
        { Storage for property HistoricoContabil }
        FHistoricoContabil : String;
        { Storage for property LimiteGasto }
        FLimiteGasto : Double;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property VisualizarCaixa }
        FVisualizarCaixa : Boolean;
        { Storage for property VisualizarFinanceiro }
        FVisualizarFinanceiro : Boolean;

      { Private methods of TConta_de_Caixa }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Avulso }
        function GetAvulso : Boolean;
        { Write method for property Avulso }
        procedure SetAvulso(Value : Boolean);
        { Read method for property CodigoCCX }
        function GetCodigoCCX : Integer;
        { Write method for property CodigoCCX }
        procedure SetCodigoCCX(Value : Integer);
        { Read method for property Contabil1 }
        function GetContabil1 : String;
        { Write method for property Contabil1 }
        procedure SetContabil1(Value : String);
        { Read method for property Contabil2 }
        function GetContabil2 : String;
        { Write method for property Contabil2 }
        procedure SetContabil2(Value : String);
        { Read method for property Contabil3 }
        function GetContabil3 : String;
        { Write method for property Contabil3 }
        procedure SetContabil3(Value : String);
        { Read method for property Contabil4 }
        function GetContabil4 : String;
        { Write method for property Contabil4 }
        procedure SetContabil4(Value : String);
        { Read method for property DC }
        function GetDC : String;
        { Write method for property DC }
        procedure SetDC(Value : String);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Disponivel }
        function GetDisponivel : Double;
        { Write method for property Disponivel }
        procedure SetDisponivel(Value : Double);
        { Read method for property Grupo }
        function GetGrupo : Integer;
        { Write method for property Grupo }
        procedure SetGrupo(Value : Integer);
        { Read method for property HistoricoContabil }
        function GetHistoricoContabil : String;
        { Write method for property HistoricoContabil }
        procedure SetHistoricoContabil(Value : String);
        { Read method for property LimiteGasto }
        function GetLimiteGasto : Double;
        { Write method for property LimiteGasto }
        procedure SetLimiteGasto(Value : Double);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property VisualizarCaixa }
        function GetVisualizarCaixa : Boolean;
        { Write method for property VisualizarCaixa }
        procedure SetVisualizarCaixa(Value : Boolean);
        { Read method for property VisualizarFinanceiro }
        function GetVisualizarFinanceiro : Boolean;
        { Write method for property VisualizarFinanceiro }
        procedure SetVisualizarFinanceiro(Value : Boolean);

    protected
      { Protected fields of TConta_de_Caixa }
        property Contabil2 : String read GetContabil2 write SetContabil2;

      { Protected methods of TConta_de_Caixa }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TConta_de_Caixa }

      { Public methods of TConta_de_Caixa }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdCCX:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere uma Conta de Caixa }
        function Inserir(CdCNC,CdCCX,PGrupo: integer; PDC,PDescricao: String; PLimiteGasto, PDisponivel: Double;PAvulso:Boolean):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza uma Conta de Caixa }
        function LocalizarCod(CdCCX,CdCNC:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TConta_de_Caixa }
        property Avulso : Boolean read GetAvulso write SetAvulso;
        { Código da Conta de Caixa }
        property CodigoCCX : Integer read GetCodigoCCX write SetCodigoCCX;
        property Contabil1 : String read GetContabil1 write SetContabil1;
        property Contabil3 : String read GetContabil3 write SetContabil3;
        property Contabil4 : String read GetContabil4 write SetContabil4;
        property DC : String read GetDC write SetDC;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property Disponivel : Double read GetDisponivel write SetDisponivel;
        property EAvulso : TCheckBox read FEAvulso write FEAvulso;
        property ECodigoCCX : TEdit read FECodigoCCX write FECodigoCCX;
        property EContabil1 : TEdit read FEContabil1 write FEContabil1;
        property EContabil2 : TEdit read FEContabil2 write FEContabil2;
        property EContabil3 : TEdit read FEContabil3 write FEContabil3;
        property EContabil4 : TEdit read FEContabil4 write FEContabil4;
        property EDC : TComboBox read FEDC write FEDC;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EDisponivel : TEdit read FEDisponivel write FEDisponivel;
        property EGrupo : TDBLookupComboBox read FEGrupo write FEGrupo;
        property EHistoricoContabil : TEdit
             read FEHistoricoContabil write FEHistoricoContabil;
        property ELimiteGasto : TEdit read FELimiteGasto write FELimiteGasto;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property EVisualizarCaixa : TCheckBox
             read FEVisualizarCaixa write FEVisualizarCaixa;
        property EVisualizarFinanceiro : TCheckBox
             read FEVisualizarFinanceiro write FEVisualizarFinanceiro;
        property Grupo : Integer read GetGrupo write SetGrupo;
        property HistoricoContabil : String
             read GetHistoricoContabil write SetHistoricoContabil;
        property LimiteGasto : Double read GetLimiteGasto write SetLimiteGasto;
        property Observacao : String read GetObservacao write SetObservacao;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property VisualizarCaixa : Boolean
             read GetVisualizarCaixa write SetVisualizarCaixa;
        property VisualizarFinanceiro : Boolean
             read GetVisualizarFinanceiro write SetVisualizarFinanceiro;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TConta_de_Caixa with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TConta_de_Caixa]);
end;

{ Method to set variable and property values and create objects }
procedure TConta_de_Caixa.AutoInitialize;
begin
     FEAvulso := nil;
     FECodigoCCX := nil;
     FEContabil1 := nil;
     FEContabil2 := nil;
     FEContabil3 := nil;
     FEContabil4 := nil;
     FEDC := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDescricao := nil;
     FEDisponivel := nil;
     FEGrupo := nil;
     FEHistoricoContabil := nil;
     FELimiteGasto := nil;
     FEObservacao := nil;
     FESituacao := nil;
     FEVisualizarCaixa := nil;
     FEVisualizarFinanceiro := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TConta_de_Caixa.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAvulso then
        FEAvulso := nil;
     if AComponent = FECodigoCCX then
        FECodigoCCX := nil;
     if AComponent = FEContabil1 then
        FEContabil1 := nil;
     if AComponent = FEContabil2 then
        FEContabil2 := nil;
     if AComponent = FEContabil3 then
        FEContabil3 := nil;
     if AComponent = FEContabil4 then
        FEContabil4 := nil;
     if AComponent = FEDC then
        FEDC := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEDisponivel then
        FEDisponivel := nil;
     if AComponent = FEGrupo then
        FEGrupo := nil;
     if AComponent = FEHistoricoContabil then
        FEHistoricoContabil := nil;
     if AComponent = FELimiteGasto then
        FELimiteGasto := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FEVisualizarCaixa then
        FEVisualizarCaixa := nil;
     if AComponent = FEVisualizarFinanceiro then
        FEVisualizarFinanceiro := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TConta_de_Caixa.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Avulso }
function TConta_de_Caixa.GetAvulso : Boolean;
begin
  try
    result := (Self.fieldByName('CCX_AVULSO').asInteger=1);
  except
    try
      result := Self.fieldByName('CCX_AVULSO').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Write method for property Avulso }
procedure TConta_de_Caixa.SetAvulso(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('CCX_AVULSO').asInteger := 1
      else
        Self.fieldByName('CCX_AVULSO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_AVULSO"!');
    end;
end;

{ Read method for property CodigoCCX }
function TConta_de_Caixa.GetCodigoCCX : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCCX }
procedure TConta_de_Caixa.SetCodigoCCX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_CODIGO"!');
    end;
end;

{ Read method for property Contabil1 }
function TConta_de_Caixa.GetContabil1 : String;
begin
  try
    Result := Self.fieldByName('CCX_CONTABIL_1').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Contabil1 }
procedure TConta_de_Caixa.SetContabil1(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_CONTABIL_1').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_CONTABIL_1"!');
  end;
end;

{ Read method for property Contabil2 }
function TConta_de_Caixa.GetContabil2 : String;
begin
  try
    Result := Self.fieldByName('CCX_CONTABIL_2').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Contabil2 }
procedure TConta_de_Caixa.SetContabil2(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_CONTABIL_2').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_CONTABIL_2"!');
  end;
end;

{ Read method for property Contabil3 }
function TConta_de_Caixa.GetContabil3 : String;
begin
  try
    Result := Self.fieldByName('CCX_CONTABIL_3').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Contabil3 }
procedure TConta_de_Caixa.SetContabil3(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_CONTABIL_3').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_CONTABIL_3"!');
  end;
end;

{ Read method for property Contabil4 }
function TConta_de_Caixa.GetContabil4 : String;
begin
  try
    Result := Self.fieldByName('CCX_CONTABIL_4').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Contabil4 }
procedure TConta_de_Caixa.SetContabil4(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_CONTABIL_4').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_CONTABIL_4"!');
  end;
end;

{ Read method for property DC }
function TConta_de_Caixa.GetDC : String;
begin
  try
    Result := Self.fieldByName('CCX_DC').asString;
  except
    result:= ''
  end;
end;

{ Write method for property DC }
procedure TConta_de_Caixa.SetDC(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_DC').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_DC"!');
  end;
end;

{ Read method for property DataAlterado }
function TConta_de_Caixa.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CCX_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TConta_de_Caixa.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TConta_de_Caixa.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('CCX_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TConta_de_Caixa.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_DT_CADASTRO"!');
  end;
end;

{ Read method for property Descricao }
function TConta_de_Caixa.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('CCX_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TConta_de_Caixa.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_DESCRICAO"!');
  end;
end;

{ Read method for property Disponivel }
function TConta_de_Caixa.GetDisponivel : Double;
begin
  try
    Result := Self.fieldByName('CCX_DISPONIVEL').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Disponivel }
procedure TConta_de_Caixa.SetDisponivel(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_DISPONIVEL').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_DISPONIVEL"!');
    end;
end;

{ Read method for property Grupo }
function TConta_de_Caixa.GetGrupo : Integer;
begin
  try
    Result := Self.fieldByName('CCX_GRUPO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Grupo }
procedure TConta_de_Caixa.SetGrupo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_GRUPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_GRUPO"!');
    end;
end;

{ Read method for property HistoricoContabil }
function TConta_de_Caixa.GetHistoricoContabil : String;
begin
  try
    Result := Self.fieldByName('CCX_HISTORICO_CONTABIL').asString;
  except
    result:= '';
  end;
end;

{ Write method for property HistoricoContabil }
procedure TConta_de_Caixa.SetHistoricoContabil(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_HISTORICO_CONTABIL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_HISTORICO_CONTABIL"!');
  end;
end;

{ Read method for property LimiteGasto }
function TConta_de_Caixa.GetLimiteGasto : Double;
begin
  try
    Result := Self.fieldByName('CCX_LIMITE_GASTO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property LimiteGasto }
procedure TConta_de_Caixa.SetLimiteGasto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_LIMITE_GASTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_LIMITE_GASTO"!');
    end;
end;

{ Read method for property Observacao }
function TConta_de_Caixa.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('CCX_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TConta_de_Caixa.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TConta_de_Caixa.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CCX_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TConta_de_Caixa.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCX_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCX_SITUACAO"!');
  end;
end;

{ Read method for property VisualizarCaixa }
function TConta_de_Caixa.GetVisualizarCaixa : Boolean;
begin
  try
    result := (Self.fieldByName('CCX_VISUALIZAR_CAIXA').asInteger=1);
  except
    try
      result := Self.fieldByName('CCX_VISUALIZAR_CAIXA').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Write method for property VisualizarCaixa }
procedure TConta_de_Caixa.SetVisualizarCaixa(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('CCX_VISUALIZAR_CAIXA').asInteger := 1
      else
        Self.fieldByName('CCX_VISUALIZAR_CAIXA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_VISUALIZAR_CAIXA"!');
    end;
end;

{ Read method for property VisualizarFinanceiro }
function TConta_de_Caixa.GetVisualizarFinanceiro : Boolean;
begin
  try
    result := (Self.fieldByName('CCX_VISUALIZAR_FINANCEIRO').asInteger=1);
  except
    try
      result := Self.fieldByName('CCX_VISUALIZAR_FINANCEIRO').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Write method for property VisualizarFinanceiro }
procedure TConta_de_Caixa.SetVisualizarFinanceiro(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('CCX_VISUALIZAR_FINANCEIRO').asInteger := 1
      else
        Self.fieldByName('CCX_VISUALIZAR_FINANCEIRO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_VISUALIZAR_FINANCEIRO"!');
    end;
end;

function TConta_de_Caixa.AlterarAuto:Boolean;
var
  CdCNC, CdCCX, iAvulso, iGrupo, iVisualizaCaixa, iVisualizaFinanceiro: integer;
  sDetalhe: string;
begin
  Result:=false;
  CdCNC := CodigoCNC;
  CdCCX := CodigoCCX;
  sDetalhe := 'Descricao:'+EDescricao.Text;
  try
    if EAvulso.Checked then
      iAvulso := 1
    else
      iAvulso := 0;
  except
    iAvulso := 0;
  end;

  try
    iGrupo := EGrupo.KeyValue;
  except
    iGrupo := 0;
  end;

  try
    if EVisualizarCaixa.Checked then
      iVisualizaCaixa := 1
    else
      iVisualizaCaixa := 0;
  except
    iVisualizaCaixa := 0;
  end;

  try
    if EVisualizarFinanceiro.Checked then
      iVisualizaFinanceiro := 1
    else
      iVisualizaFinanceiro := 0;
  except
    iVisualizaFinanceiro := 0;
  end;


  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE CONTA_DE_CAIXA SET '+
      ' CCX_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',CCX_DC="'+EDC.Text+'" '+
      ',CCX_AVULSO='+IntToStr(iAvulso)+
      ',CCX_GRUPO='+IntToStr(iGrupo)+
      ',CCX_DESCRICAO="'+EDescricao.Text+'" '+
      ',CCX_LIMITE_GASTO='+VirgPonto(ELimiteGasto.Text)+
      ',CCX_DISPONIVEL='+VirgPonto(EDisponivel.Text)+
      ',CCX_CONTABIL_1="'+EContabil1.Text+'" '+
      ',CCX_CONTABIL_2="'+EContabil2.Text+'" '+
      ',CCX_CONTABIL_3="'+EContabil3.Text+'" '+
      ',CCX_CONTABIL_4="'+EContabil4.Text+'" '+
      ',CCX_HISTORICO_CONTABIL="'+EHistoricoContabil.Text+'" '+
      ',CCX_VISUALIZAR_CAIXA='+IntToStr(iVisualizaCaixa)+
      ',CCX_VISUALIZAR_FINANCEIRO='+IntToStr(iVisualizaFinanceiro)+
      ',CCX_SITUACAO='+IntToStr(ESituacao.ItemIndex)+
      ',CCX_OBSERVACAO="'+EObservacao.Text+'" '+
      ' WHERE CCX_CODIGO='+IntToStr(CodigoCCX)+
      ' AND CNC_CODIGO='+IntToStr(CodigoCNC));
    GeraLog(960, CdCNC, CdCCX, sDetalhe);
    Result:=True;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TConta_de_Caixa.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           := not Habilitar;
  except
  end;
  try
    EDC.Enabled               := Habilitar;
  except
  end;
  try
    EAvulso.Enabled           := Habilitar;
  except
  end;
  try
    EDescricao.Enabled        := Habilitar;
  except
  end;
  try
    ELimiteGasto.Enabled      := Habilitar;
  except
  end;
  try
    EGrupo.Enabled            := Habilitar;
  except
  end;
  try
    EDisponivel.Enabled       := Habilitar;
  except
  end;
  try
    EContabil1.Enabled        := Habilitar;
  except
  end;
  try
    EContabil2.Enabled        := Habilitar;
  except
  end;
  try
    EContabil3.Enabled        := Habilitar;
  except
  end;
  try
    EContabil4.Enabled        := Habilitar;
  except
  end;
  try
    EHistoricoContabil.Enabled := Habilitar;
  except
  end;
  try
    EVisualizarCaixa.Enabled   := Habilitar;
  except
  end;
  try
    EVisualizarFinanceiro.Enabled   := Habilitar;
  except
  end;
  try
    ESituacao.Enabled   := Habilitar;
  except
  end;
  try
    EObservacao.Enabled   := Habilitar;
  except
  end;
end;

procedure TConta_de_Caixa.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TConta_de_Caixa.CarregaDados;
begin
  try
    ECodigoCCX.Text           :=IntToStr(CodigoCCX);
  except
  end;
  try
    if DataCadastro>0 then
      EDataCadastro.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado>0 then
      EDataAlterado.Text := FormatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    ItemComboBox(EDC,DC);
  except
  end;
  try
    EAvulso.Checked := Avulso;
  except
  end;
  Try
    EGrupo.KeyValue      :=Grupo;
  Except
  End;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    ELimiteGasto.Text         :=Format('%.2f',[LimiteGasto]);
  except
  end;
  try
    EDisponivel.Text           :=Format('%.2f',[Disponivel]);
  except
  end;
  try
    EContabil1.Text := Contabil1;
  except
  end;
  try
    EContabil2.Text := Contabil2;
  except
  end;
  try
    EContabil3.Text := Contabil3;
  except
  end;
  try
    EContabil4.Text := Contabil4;
  except
  end;
  try
    EHistoricoContabil.Text := HistoricoContabil;
  except
  end;
  try
    EVisualizarCaixa.Checked := VisualizarCaixa;
  except
  end;
  try
    EVisualizarFinanceiro.Checked := VisualizarFinanceiro;
  except
  end;
  try
    ESituacao.ItemIndex := Situacao;
  except
  end;
  try
    EObservacao.Text := Observacao;
  except
  end;
end;

constructor TConta_de_Caixa.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CONTA_DE_CAIXA';

     { Code to perform other tasks when the component is created }

end;

function TConta_de_Caixa.Deletar(CdCNC,CdCCX:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdCCX,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        GeraLog(950,CdCNC,CdCCX);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TConta_de_Caixa.Destroy;
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

function TConta_de_Caixa.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if ELimiteGasto.Text = '' then
    ELimiteGasto.Text:='0';
  if EDisponivel.Text = '' then
    EDisponivel.Text:='0';
  If not Verificafloat(ELimiteGasto.text) Then
    mensagem:=mensagem+'Limite de Gasto digitado incorretamente!';
  If not Verificafloat(EDisponivel.text) Then
    mensagem:=mensagem+'Limite de Disponível digitado incorretamente!';
  If not VerificaInteiro(EContabil1.text) Then
    mensagem:=mensagem+'Conta Contábil 1 digitada incorretamente!';
  If not VerificaInteiro(EContabil2.text) Then
    mensagem:=mensagem+'Conta Contábil 2 digitada incorretamente!';
  If not VerificaInteiro(EContabil3.text) Then
    mensagem:=mensagem+'Conta Contábil 3 digitada incorretamente!';
  If not VerificaInteiro(EContabil4.text) Then
    mensagem:=mensagem+'Conta Contábil 4 digitada incorretamente!';
  If mensagem <>'' Then
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
        close;
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end;
    End
    else If Estado=2 then
    Begin
      cod:=codigoCCX;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        AtualizaControles(False);
        Estado:=0;
      end;
    End;
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

{ Insere uma Conta de Caixa }
function TConta_de_Caixa.Inserir(CdCNC,CdCCX,PGrupo: integer; PDC,PDescricao: String; PLimiteGasto, PDisponivel: Double;PAvulso:Boolean):boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdCCX=0 then
    Cod    := ProximoCodigo('CCX_CODIGO')
  else
    Cod    := CdCCX;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  else
  begin
     try
       INSERT;
       CodigoCCX      := Cod;
       CodigoCNC      := CdCNC;
       DataCadastro   := StrToDateTime(EDataCadastro.Text);
       CodigoUSU      := CConfiguracao.CodigoUSU;
       DC             := PDC;
       Avulso         := PAvulso;
       Descricao      := PDescricao;
       LimiteGasto    := PLimiteGasto;
       Disponivel     := PDisponivel;
       Grupo          := PGrupo;
       Situacao       := 0;

       try
         Post;
         result:=true;
       except
         Cancel;
         ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
       end;
     except
       ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TConta_de_Caixa.InserirAuto:Boolean;
var
  CdCNC, CdCCX: integer;
  sDetalhe: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdCCX := SCodigo;
  sDetalhe := 'Desc:'+EDescricao.Text;
  try
    append;
    try
      codigoCCX := SCodigo;
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      codigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      codigocnc := CConfiguracao.CodigoCNC;
    except
    end;
    try
      DC := EDC.Text
    except
    end;
    try
      Avulso := EAvulso.Checked;
    except
    end;
    try
      Grupo := EGrupo.KeyValue;
    except
    end;
    try
      Descricao := EDescricao.Text;
    except
    end;
    try
      LimiteGasto := StrToFloat(ELimiteGasto.Text);
    except
    end;
    try
      Disponivel := StrToFloat(ELimiteGasto.Text);
    except
    end;
    try
      Contabil1 := EContabil1.Text;
    except
    end;
    try
      Contabil2 := EContabil2.Text;
    except
    end;
    try
      Contabil3 := EContabil3.Text;
    except
    end;
    try
      Contabil4 := EContabil4.Text;
    except
    end;
    try
      HistoricoContabil := EHistoricoContabil.Text;
    except
    end;
    try
      VisualizarCaixa := EVisualizarCaixa.Checked;
    except
    end;
    try
      VisualizarFinanceiro := EVisualizarFinanceiro.Checked;
    except
    end;
    try
      Situacao := ESituacao.ItemIndex;
    except
    end;
    try
      Observacao := EObservacao.Text;
    except
    end;

    try
      Post;
      GeraLog(940, CdCNC, CdCCX, sDetalhe);
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TConta_de_Caixa.LimpaCampos;
begin
  try
    if Estado <> 3 then
      EDC.ItemIndex := -1
    else
      EDC.ItemIndex := 1;
  except
  end;
  try
    EAvulso.Checked := False;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := FormatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  Try
    EGrupo.KeyValue := 0;
  Except
  End;
  try
   EDescricao.Clear;
  except
  end;
  try
   ELimiteGasto.Clear;
  except
  end;
  try
   EDisponivel.Text:='';
  except
  end;
  try
    EContabil1.Clear;
  except
  end;
  try
    EContabil2.Clear;
  except
  end;
  try
    EContabil3.Clear;
  except
  end;
  try
    EContabil4.Clear;
  except
  end;
  try
    EHistoricoContabil.Clear;
  except
  end;
  try
    EVisualizarCaixa.Checked := False;
  except
  end;
  try
    EVisualizarFinanceiro.Checked := False;
  except
  end;
  try
    if Estado < 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 0;
  except
  end;
  try
    EObservacao.Clear;
  except
  end;
end;

{ Localiza uma Conta de Caixa }
function TConta_de_Caixa.LocalizarCod(CdCCX,CdCNC:Integer):Boolean;
begin
  If (CdCCX<>CodigoCCX) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;CCX_CODIGO', vararrayof([CdCNC, CdCCX]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TConta_de_Caixa.LocalizarNome(Nome:String):Boolean;
begin
  If Nome<>Descricao Then
    If locate('CCX_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TConta_de_Caixa.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := FormatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TConta_de_Caixa.PreparaInsercao;
begin
  ProximoCodigo('CCX_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TConta_de_Caixa.deletarauto:Boolean;
var
  CdCNC, CdCCX:integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC:=CodigoCNC;
  CdCCX:=CodigoCCX;
  sDetalhe := 'Desc:'+Descricao;
  try
    if Delete then
    Begin
      result:=true;
      GeraLog(950,CdCNC,CdCCX,sDetalhe);
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
