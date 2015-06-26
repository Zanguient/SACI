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
unit AgenteFin;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Funcoes, Variants, Dbctrls;

type
  TAgenteFin = class(TSQuery)
    private
      { Private fields of TAgenteFin }
        { Storage for property Antecipacao }
        FAntecipacao : Double;
        { Storage for property CentavosEntrada }
        FCentavosEntrada : Boolean;
        { Storage for property CodigoAGF }
        FCodigoAGF : Integer;
        { Storage for property Contabil1 }
        FContabil1 : String;
        { Storage for property Contabil2 }
        FContabil2 : String;
        { Storage for property Contabil3 }
        FContabil3 : String;
        { Storage for property Contabil4 }
        FContabil4 : String;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property DiaPagamento }
        FDiaPagamento : Integer;
        { Storage for property EAntecipacao }
        FEAntecipacao : TEdit;
        { Storage for property ECentavosEntrada }
        FECentavosEntrada : TCheckBox;
        { Storage for property ECodigoAGF }
        FECodigoAGF : TEdit;
        { Storage for property EContabil1 }
        FEContabil1 : TEdit;
        { Storage for property EContabil2 }
        FEContabil2 : TEdit;
        { Storage for property EContabil3 }
        FEContabil3 : TEdit;
        { Storage for property EContabil4 }
        FEContabil4 : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EDiaPagamento }
        FEDiaPagamento : TEdit;
        { Storage for property EEspecial }
        FEEspecial : TCheckBox;
        { Storage for property EHistoricoContabil }
        FEHistoricoContabil : TEdit;
        { Storage for property EJuros }
        FEJuros : TEdit;
        { Storage for property EJurosEntrada }
        FEJurosEntrada : TCheckBox;
        { Storage for property ELiberarDescontoFPG }
        FELiberarDescontoFPG : TCheckBox;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property ERecebimentoAVista }
        FERecebimentoAVista : TCheckBox;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETaxaADM }
        FETaxaADM : TEdit;
        { Storage for property ETaxaMensal }
        FETaxaMensal : TEdit;
        { Storage for property ETipoPagExclusivo }
        FETipoPagExclusivo : TDBLookupComboBox;
        { Storage for property Especial }
        FEspecial : Boolean;
        { Storage for property HistoricoContabil }
        FHistoricoContabil : String;
        { Storage for property Juros }
        FJuros : Double;
        { Storage for property JurosEntrada }
        FJurosEntrada : Boolean;
        { Storage for property LiberarDescontoFPG }
        FLiberarDescontoFPG : Boolean;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property RecebimentoAVista }
        FRecebimentoAVista : Boolean;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TaxaADM }
        FTaxaADM : Double;
        { Storage for property TaxaMensal }
        FTaxaMensal : Double;
        { Storage for property TipoPagExclusivo }
        FTipoPagExclusivo : Integer;

      { Private methods of TAgenteFin }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Antecipacao }
        function GetAntecipacao : Double;
        { Write method for property Antecipacao }
        procedure SetAntecipacao(Value : Double);
        { Read method for property CentavosEntrada }
        function GetCentavosEntrada : Boolean;
        { Write method for property CentavosEntrada }
        procedure SetCentavosEntrada(Value : Boolean);
        { Read method for property CodigoAGF }
        function GetCodigoAGF : Integer;
        { Write method for property CodigoAGF }
        procedure SetCodigoAGF(Value : Integer);
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
        { Read method for property DiaPagamento }
        function GetDiaPagamento : Integer;
        { Write method for property DiaPagamento }
        procedure SetDiaPagamento(Value : Integer);
        { Read method for property Especial }
        function GetEspecial : Boolean;
        { Write method for property Especial }
        procedure SetEspecial(Value : Boolean);
        { Read method for property HistoricoContabil }
        function GetHistoricoContabil : String;
        { Write method for property HistoricoContabil }
        procedure SetHistoricoContabil(Value : String);
        { Read method for property Juros }
        function GetJuros : Double;
        { Write method for property Juros }
        procedure SetJuros(Value : Double);
        { Read method for property JurosEntrada }
        function GetJurosEntrada : Boolean;
        { Write method for property JurosEntrada }
        procedure SetJurosEntrada(Value : Boolean);
        { Read method for property LiberarDescontoFPG }
        function GetLiberarDescontoFPG : Boolean;
        { Write method for property LiberarDescontoFPG }
        procedure SetLiberarDescontoFPG(Value : Boolean);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property RecebimentoAVista }
        function GetRecebimentoAVista : Boolean;
        { Write method for property RecebimentoAVista }
        procedure SetRecebimentoAVista(Value : Boolean);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property TaxaADM }
        function GetTaxaADM : Double;
        { Write method for property TaxaADM }
        procedure SetTaxaADM(Value : Double);
        { Read method for property TaxaMensal }
        function GetTaxaMensal : Double;
        { Write method for property TaxaMensal }
        procedure SetTaxaMensal(Value : Double);
        { Read method for property TipoPagExclusivo }
        function GetTipoPagExclusivo : Integer;
        { Write method for property TipoPagExclusivo }
        procedure SetTipoPagExclusivo(Value : Integer);

    protected
      { Protected fields of TAgenteFin }

      { Protected methods of TAgenteFin }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TAgenteFin }

      { Public methods of TAgenteFin }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdAGF:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Agente Financeiro }
        function Inserir(CdCNC,CdAGF,PDiaPagamento: integer; PDescricao:String; PJuros,PTaxaADM,PAntecipacao:Real;PJurosEntrada:Boolean):Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Agente Financeiro }
        function LocalizarCod(CdAGF,CdCNC:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TAgenteFin }
        property Antecipacao : Double read GetAntecipacao write SetAntecipacao;
        property CentavosEntrada : Boolean
             read GetCentavosEntrada write SetCentavosEntrada;
        { Código do Agente Financeiro }
        property CodigoAGF : Integer read GetCodigoAGF write SetCodigoAGF;
        property Contabil1 : String read GetContabil1 write SetContabil1;
        property Contabil2 : String read GetContabil2 write SetContabil2;
        property Contabil3 : String read GetContabil3 write SetContabil3;
        property Contabil4 : String read GetContabil4 write SetContabil4;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property DiaPagamento : Integer
             read GetDiaPagamento write SetDiaPagamento;
        property EAntecipacao : TEdit read FEAntecipacao write FEAntecipacao;
        property ECentavosEntrada : TCheckBox
             read FECentavosEntrada write FECentavosEntrada;
        property ECodigoAGF : TEdit read FECodigoAGF write FECodigoAGF;
        property EContabil1 : TEdit read FEContabil1 write FEContabil1;
        property EContabil2 : TEdit read FEContabil2 write FEContabil2;
        property EContabil3 : TEdit read FEContabil3 write FEContabil3;
        property EContabil4 : TEdit read FEContabil4 write FEContabil4;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EDiaPagamento : TEdit
             read FEDiaPagamento write FEDiaPagamento;
        property EEspecial : TCheckBox read FEEspecial write FEEspecial;
        property EHistoricoContabil : TEdit
             read FEHistoricoContabil write FEHistoricoContabil;
        property EJuros : TEdit read FEJuros write FEJuros;
        property EJurosEntrada : TCheckBox
             read FEJurosEntrada write FEJurosEntrada;
        property ELiberarDescontoFPG : TCheckBox
             read FELiberarDescontoFPG write FELiberarDescontoFPG;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property ERecebimentoAVista : TCheckBox
             read FERecebimentoAVista write FERecebimentoAVista;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETaxaADM : TEdit read FETaxaADM write FETaxaADM;
        property ETaxaMensal : TEdit read FETaxaMensal write FETaxaMensal;
        property ETipoPagExclusivo : TDBLookupComboBox
             read FETipoPagExclusivo write FETipoPagExclusivo;
        property Especial : Boolean read GetEspecial write SetEspecial;
        property HistoricoContabil : String
             read GetHistoricoContabil write SetHistoricoContabil;
        property Juros : Double read GetJuros write SetJuros;
        property JurosEntrada : Boolean
             read GetJurosEntrada write SetJurosEntrada;
        property LiberarDescontoFPG : Boolean
             read GetLiberarDescontoFPG write SetLiberarDescontoFPG;
        property Observacao : String read GetObservacao write SetObservacao;
        property RecebimentoAVista : Boolean
             read GetRecebimentoAVista write SetRecebimentoAVista;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property TaxaADM : Double read GetTaxaADM write SetTaxaADM;
        property TaxaMensal : Double read GetTaxaMensal write SetTaxaMensal;
        property TipoPagExclusivo : Integer
             read GetTipoPagExclusivo write SetTipoPagExclusivo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TAgenteFin with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TAgenteFin]);
end;

{ Method to set variable and property values and create objects }
procedure TAgenteFin.AutoInitialize;
begin
     FEAntecipacao := nil;
     FECentavosEntrada := nil;
     FECodigoAGF := nil;
     FEContabil1 := nil;
     FEContabil2 := nil;
     FEContabil3 := nil;
     FEContabil4 := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDescricao := nil;
     FEDiaPagamento := nil;
     FEEspecial := nil;
     FEHistoricoContabil := nil;
     FEJuros := nil;
     FEJurosEntrada := nil;
     FELiberarDescontoFPG := nil;
     FEObservacao := nil;
     FERecebimentoAVista := nil;
     FESituacao := nil;
     FETaxaADM := nil;
     FETaxaMensal := nil;
     FETipoPagExclusivo := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TAgenteFin.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAntecipacao then
        FEAntecipacao := nil;
     if AComponent = FECentavosEntrada then
        FECentavosEntrada := nil;
     if AComponent = FECodigoAGF then
        FECodigoAGF := nil;
     if AComponent = FEContabil1 then
        FEContabil1 := nil;
     if AComponent = FEContabil2 then
        FEContabil2 := nil;
     if AComponent = FEContabil3 then
        FEContabil3 := nil;
     if AComponent = FEContabil4 then
        FEContabil4 := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEDiaPagamento then
        FEDiaPagamento := nil;
     if AComponent = FEEspecial then
        FEEspecial := nil;
     if AComponent = FEHistoricoContabil then
        FEHistoricoContabil := nil;
     if AComponent = FEJuros then
        FEJuros := nil;
     if AComponent = FEJurosEntrada then
        FEJurosEntrada := nil;
     if AComponent = FELiberarDescontoFPG then
        FELiberarDescontoFPG := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FERecebimentoAVista then
        FERecebimentoAVista := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETaxaADM then
        FETaxaADM := nil;
     if AComponent = FETaxaMensal then
        FETaxaMensal := nil;
     if AComponent = FETipoPagExclusivo then
        FETipoPagExclusivo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TAgenteFin.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Antecipacao }
function TAgenteFin.GetAntecipacao : Double;
begin
  try
    Result := Self.fieldByName('AGF_ANTECIPACAO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Antecipacao }
procedure TAgenteFin.SetAntecipacao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_ANTECIPACAO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_ANTECIPACAO"!');
  end;
end;

{ Read method for property CentavosEntrada }
function TAgenteFin.GetCentavosEntrada : Boolean;
begin
  try
    result := (Self.fieldByName('AGF_CENTAVOS_ENTRADA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property CentavosEntrada }
procedure TAgenteFin.SetCentavosEntrada(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('AGF_CENTAVOS_ENTRADA').asInteger := 1
      else
        Self.fieldByName('AGF_CENTAVOS_ENTRADA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_CENTAVOS_ENTRADA"!');
    end;
end;

{ Read method for property CodigoAGF }
function TAgenteFin.GetCodigoAGF : Integer;
begin
  try
    Result := Self.fieldByName('AGF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoAGF }
procedure TAgenteFin.SetCodigoAGF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_CODIGO"!');
    end;
end;

{ Read method for property Contabil1 }
function TAgenteFin.GetContabil1 : String;
begin
  try
    Result := Self.fieldByName('AGF_CONTABIL_1').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Contabil1 }
procedure TAgenteFin.SetContabil1(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_CONTABIL_1').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_CONTABIL_1"!');
  end;
end;

{ Read method for property Contabil2 }
function TAgenteFin.GetContabil2 : String;
begin
  try
    Result := Self.fieldByName('AGF_CONTABIL_2').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Contabil2 }
procedure TAgenteFin.SetContabil2(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_CONTABIL_2').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_CONTABIL_2"!');
  end;
end;

{ Read method for property Contabil3 }
function TAgenteFin.GetContabil3 : String;
begin
  try
    Result := Self.fieldByName('AGF_CONTABIL_3').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Contabil3 }
procedure TAgenteFin.SetContabil3(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_CONTABIL_3').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_CONTABIL_3"!');
  end;
end;

{ Read method for property Contabil4 }
function TAgenteFin.GetContabil4 : String;
begin
  try
    Result := Self.fieldByName('AGF_CONTABIL_4').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Contabil4 }
procedure TAgenteFin.SetContabil4(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_CONTABIL_4').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_CONTABIL_4"!');
  end;
end;

{ Read method for property DataAlterado }
function TAgenteFin.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('AGF_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TAgenteFin.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TAgenteFin.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('AGF_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TAgenteFin.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_DT_CADASTRO"!');
  end;
end;

{ Read method for property Descricao }
function TAgenteFin.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('AGF_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TAgenteFin.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_DESCRICAO"!');
  end;
end;

{ Read method for property DiaPagamento }
function TAgenteFin.GetDiaPagamento : Integer;
begin
  try
    result := Self.fieldByName('AGF_DIA_PAGAMENTO').asInteger;
  except
    Result := 0;
  end;
end;

{ Write method for property DiaPagamento }
procedure TAgenteFin.SetDiaPagamento(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGF_DIA_PAGAMENTO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_DIA_PAGAMENTO"!');
    end;
end;

{ Read method for property Especial }
function TAgenteFin.GetEspecial : Boolean;
begin
  try
    result := (Self.fieldByName('AGF_ESPECIAL').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Especial }
procedure TAgenteFin.SetEspecial(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('AGF_ESPECIAL').asInteger := 1
      else
        Self.fieldByName('AGF_ESPECIAL').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_ESPECIAL"!');
    end;
end;

{ Read method for property HistoricoContabil }
function TAgenteFin.GetHistoricoContabil : String;
begin
  try
    Result := Self.fieldByName('AGF_HISTORICO_CONTABIL').asString;
  except
    result:= '';
  end;
end;

{ Write method for property HistoricoContabil }
procedure TAgenteFin.SetHistoricoContabil(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_HISTORICO_CONTABIL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_HISTORICO_CONTABIL"!');
  end;
end;

{ Read method for property Juros }
function TAgenteFin.GetJuros : Double;
begin
  try
    Result := Self.fieldByName('AGF_JUROS').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Juros }
procedure TAgenteFin.SetJuros(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGF_JUROS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_JUROS"!');
    end;
end;

{ Read method for property JurosEntrada }
function TAgenteFin.GetJurosEntrada : Boolean;
begin
  try
    result := (Self.fieldByName('AGF_JUROS_ENTRADA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property JurosEntrada }
procedure TAgenteFin.SetJurosEntrada(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('AGF_JUROS_ENTRADA').asInteger := 1
      else
        Self.fieldByName('AGF_JUROS_ENTRADA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_JUROS_ENTRADA"!');
    end;
end;

{ Read method for property LiberarDescontoFPG }
function TAgenteFin.GetLiberarDescontoFPG : Boolean;
begin
  try
    result := (Self.fieldByName('AGF_LIBERAR_DESCONTO_FPG').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property LiberarDescontoFPG }
procedure TAgenteFin.SetLiberarDescontoFPG(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('AGF_LIBERAR_DESCONTO_FPG').asInteger := 1
      else
        Self.fieldByName('AGF_LIBERAR_DESCONTO_FPG').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_LIBERAR_DESCONTO_FPG"!');
    end;
end;

{ Read method for property Observacao }
function TAgenteFin.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('AGF_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TAgenteFin.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_OBSERVACAO"!');
  end;
end;

{ Read method for property RecebimentoAVista }
function TAgenteFin.GetRecebimentoAVista : Boolean;
begin
  try
    result := (Self.fieldByName('AGF_REC_AVISTA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property RecebimentoAVista }
procedure TAgenteFin.SetRecebimentoAVista(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('AGF_REC_AVISTA').asInteger := 1
      else
        Self.fieldByName('AGF_REC_AVISTA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_REC_AVISTA"!');
    end;
end;

{ Read method for property Situacao }
function TAgenteFin.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('AGF_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TAgenteFin.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_SITUACAO"!');
  end;
end;

{ Read method for property TaxaADM }
function TAgenteFin.GetTaxaADM : Double;
begin
  try
    Result := Self.fieldByName('AGF_TAXA_ADM').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TaxaADM }
procedure TAgenteFin.SetTaxaADM(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_TAXA_ADM').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_TAXA_ADM"!');
  end;
end;

{ Read method for property TaxaMensal }
function TAgenteFin.GetTaxaMensal : Double;
begin
  try
    Result := Self.fieldByName('AGF_TAXA_MENSAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TaxaMensal }
procedure TAgenteFin.SetTaxaMensal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_TAXA_MENSAL').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_TAXA_MENSAL"!');
  end;
end;

{ Read method for property TipoPagExclusivo }
function TAgenteFin.GetTipoPagExclusivo : Integer;
begin
  try
    Result := Self.fieldByName('AGF_TIPOPAG_EXCLUSIVO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TipoPagExclusivo }
procedure TAgenteFin.SetTipoPagExclusivo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('AGF_TIPOPAG_EXCLUSIVO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "AGF_TIPOPAG_EXCLUSIVO"!');
  end;
end;

function TAgenteFin.AlterarAuto:Boolean;
var
  CdCNC, CdAGF: integer;
  sDetalhe: string;
begin
  Result:=false;
  CdCNC := CodigoCNC;
  CdAGF := CodigoAGF;
  sDetalhe := '';
  try
    edit;
    try
       Descricao  := EDescricao.Text;
       sDetalhe := sDetalhe + 'Desc:'+EDescricao.Text;
    except
    end;
    try
       CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
       DataAlterado  := StrToDateTime(EDataAlterado.Text);
    except
    end;
    try
       Juros:= StrToFloat(EJuros.Text);
       sDetalhe := sDetalhe + ' Juros:'+EJuros.Text;
    except
    end;
    try
       DiaPagamento := StrToInt(EDiaPagamento.Text);
       sDetalhe := sDetalhe + ' DiaPag:'+EDiaPagamento.Text;
    except
    end;
    try
       TaxaADM := StrToFloat(ETaxaADM.Text);
       sDetalhe := sDetalhe + ' TaxaAdm:'+ETaxaADM.Text;
    except
    end;
    try
      TaxaMensal := StrToFloat(ETaxaMensal.Text);
      sDetalhe := sDetalhe + ' TxMensal:'+ETaxaMensal.Text;
    except
    end;
    try
       Antecipacao := StrToFloat(EAntecipacao.Text);
       sDetalhe := sDetalhe + ' Antecipacao:'+EAntecipacao.Text;
    except
    end;
    try
       JurosEntrada := EJurosEntrada.Checked;
       if EJurosEntrada.Checked then
         sDetalhe := sDetalhe + ' JurosEntrada:1 '
       else
         sDetalhe := sDetalhe + ' JurosEntrada:0 ';
    except
    end;
    try
       LiberarDescontoFPG := ELiberarDescontoFPG.Checked;
       if ELiberarDescontoFPG.Checked then
         sDetalhe := sDetalhe + ' LibDesconto:1 '
       else
         sDetalhe := sDetalhe + ' LibDesconto:0 ';
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
       Especial := EEspecial.Checked;
       if EEspecial.Checked then
         sDetalhe := sDetalhe + ' Especial ';
    except
    end;
    try
       RecebimentoAVista := ERecebimentoAVista.Checked;
       if ERecebimentoAVista.Checked then
         sDetalhe := sDetalhe + ' RecAVista ';
    except
    end;
    try
      if ETipoPagExclusivo.Text <> '' then
        TipoPagExclusivo := ETipoPagExclusivo.KeyValue
      else
        TipoPagExclusivo := 0;
      sDetalhe := sDetalhe + ' TipoPag:'+ETipoPagExclusivo.Text;
    except
    end;
    try
      Situacao := ESituacao.ItemIndex;
      if ESituacao.ItemIndex = 0 then
        sDetalhe := sDetalhe + ' Ativado '
      else
        sDetalhe := sDetalhe + ' Desativado ';
    except
    end;
    try
       CentavosEntrada := ECentavosEntrada.Checked;
       if ECentavosEntrada.Checked then
         sDetalhe := sDetalhe + ' CentEntrada ';
    except
    end;    
    try
       Observacao := EObservacao.Text;
       sDetalhe := sDetalhe + ' OBS:'+EObservacao.Text;
    except
    end;
    try
      Post;
      GeraLog(400, CdCNC, CdAGF, sDetalhe);
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TAgenteFin.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    EDescricao.Enabled     :=Habilitar;
  except
  end;
  try
    EJuros.Enabled         :=Habilitar;
  except
  end;
  try
    EDiaPagamento.Enabled      :=Habilitar;
  except
  end;
  try
    ETaxaADM.Enabled          :=Habilitar;
  except
  end;
  try
    EAntecipacao.Enabled   :=Habilitar;
  except
  end;
  try
    EJurosEntrada.Enabled   :=Habilitar;
  except
  end;
  try
    ELiberarDescontoFPG.Enabled   :=Habilitar;
  except
  end;
  try
    EContabil1.Enabled   := Habilitar;
  except
  end;
  try
    EContabil2.Enabled   := Habilitar;
  except
  end;
  try
    EContabil3.Enabled   := Habilitar;
  except
  end;
  try
    EContabil4.Enabled   := Habilitar;
  except
  end;
  try
    EHistoricoContabil.Enabled := Habilitar;
  except
  end;
  try
    EEspecial.Enabled := Habilitar;
  except
  end;
  try
    ERecebimentoAVista.Enabled := Habilitar;
  except
  end;
  try
    ETaxaMensal.Enabled := Habilitar;
  except
  end;
  try
    ETipoPagExclusivo.Enabled := Habilitar;
  except
  end;
  try
    ECentavosEntrada.Enabled := Habilitar;
  except
  end;  
  try
    ESituacao.Enabled := Habilitar;
  except
  end;
  try
    EObservacao.Enabled := Habilitar;
  except
  end;
end;

procedure TAgenteFin.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TAgenteFin.CarregaDados;
begin
  Try
    ECodigoAGF.Text           :=IntToStr(CodigoAGF);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    EJuros.Text               :=Format('%.2f', [JUROS]);
  except
  end;
  try
    EDiaPagamento.Text         :=IntToStr(DiaPagamento);
  except
  end;
  try
    ETaxaADM.Text                :=Format('%.2f', [TaxaADM]);
  except
  end;
  try
    EAntecipacao.Text         :=Format('%.2f', [Antecipacao]);
  except
  end;
  try
    EJurosEntrada.Checked     := JurosEntrada;
  except
  end;
  try
    ELiberarDescontoFPG.Checked     := LiberarDescontoFPG;
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
    EEspecial.Checked     := Especial;
  except
  end;
  try
    ERecebimentoAVista.Checked     := RecebimentoAVista;
  except
  end;
  try
    ETaxaMensal.Text      :=Format('%.2f', [TaxaMensal]);
  except
  end;
  try
    ETipoPagExclusivo.KeyValue   := TipoPagExclusivo;
  except
  end;
  try
    ECentavosEntrada.Checked     := CentavosEntrada;
  except
  end;  
  try
    ESituacao.ItemIndex   := Situacao;
  except
  end;
  try
    EObservacao.Text      :=Observacao;
  except
  end;
end;

constructor TAgenteFin.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'AGENTE_FINANCEIRO';

     { Code to perform other tasks when the component is created }

end;

function TAgenteFin.Deletar(CdCNC,CdAGF:Integer):Boolean;
var
  sAgente: string;
begin
  Result := False;
  If not(localizarCod(CdAGF,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      sAgente := Descricao;
      if Delete then
      Begin
        Result := True;
        GeraLog(390,CdCNC,CdAGF,sAgente);
        RegistrarDel(CdCNC,1140(*AgenteFin*),CdAGF,sAgente);
      end;
      if isEmpty then
        LimpaCampos;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TAgenteFin.Destroy;
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

function TAgenteFin.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  If not VerificaInteiro(EDiaPagamento.Text) Then
    mensagem:=mensagem+'Dia de pagamento digitado incorretamente!';
  if not verificafloat(EJuros.text) then
    mensagem:= mensagem + 'Juros digitado incorretamente!'+#13;
  If not Verificafloat(ETaxaADM.text) Then
    mensagem:=mensagem+'TAC digitada incorretamente!';
  If not Verificafloat(ETaxaMensal.text) Then
    mensagem:=mensagem+'Taxa Mensal digitada incorretamente!';
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
        LocalizarCod(SCodigo, CConfiguracao.CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoAGF;
      cdcnc:=codigoCNC;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        AtualizaControles(False);
        Estado:=0;
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Agente Financeiro }
function TAgenteFin.Inserir(CdCNC,CdAGF,PDiaPagamento: integer; PDescricao:String; PJuros,PTaxaADM,PAntecipacao:Real;PJurosEntrada:Boolean):Boolean;
Var
  Cod:Integer;
begin
  result := false;
  if CdAGF=0 then
    Cod    := ProximoCodigo('AGF_CODIGO')
  else
    Cod    := CdAGF;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  else
  begin
     try
       Insert;
       CodigoAGF      := Cod;
       CodigoCNC      := CdCNC;
       CodigoUSU      := CConfiguracao.CodigoUSU;
       DataCadastro   := CConfiguracao.DataHora;
       Descricao      := PDescricao;
       Juros          := PJuros;
       DiaPagamento   := PDiaPagamento;
       TaxaADM        := PTaxaADM;
       TaxaMensal     := 0;
       Antecipacao    := PAntecipacao;
       JurosEntrada   := PJurosEntrada;
       Especial       := False;
       RecebimentoAVista := False;
       TipoPagExclusivo := 0;
       CentavosEntrada:= False;
       Situacao       := 0;
       Observacao     := '';
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

function TAgenteFin.InserirAuto:Boolean;
var
  CdCNC, CdAGF: integer;
  sDetalhe: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdAGF := sCodigo;
  sDetalhe := '';
  If (localizarCod(SCodigo,CodigoCNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  begin
    try
      append;
      try
        codigoAGF   := SCodigo;
      except
      end;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
         CodigoUSU  := CConfiguracao.CodigoUSU;
      except
      end;
      try
         DataCadastro  := StrToDateTime(EDataCadastro.Text);
      except
      end;
      try
         Descricao  := EDescricao.Text;
         sDetalhe := sDetalhe + 'Desc:'+EDescricao.Text;
      except
      end;
      try
         Juros := StrToFloat(EJuros.Text);
         sDetalhe := sDetalhe + ' Juros:'+EJuros.Text;
      except
      end;
      try
         DiaPagamento := StrToInt(EDiaPagamento.Text);
         sDetalhe := sDetalhe + ' DiaPag:'+EDiaPagamento.Text;
      except
      end;
      try
         TaxaADM := StrToFloat(ETaxaADM.Text);
         sDetalhe := sDetalhe + ' TaxaAdm:'+ETaxaADM.Text;
      except
      end;
      try
        TaxaMensal := StrToFloat(ETaxaMensal.Text);
        sDetalhe := sDetalhe + ' TxMensal:'+ETaxaMensal.Text;
      except
      end;
      try
         Antecipacao := StrToFloat(EAntecipacao.Text);
         sDetalhe := sDetalhe + ' Antecipacao:'+EAntecipacao.Text;
      except
      end;
      try
         JurosEntrada := EJurosEntrada.Checked;
         if EJurosEntrada.Checked then
           sDetalhe := sDetalhe + ' JurosEntrada:1 '
         else
           sDetalhe := sDetalhe + ' JurosEntrada:0 ';
      except
      end;
      try
         LiberarDescontoFPG := ELiberarDescontoFPG.Checked;
         if ELiberarDescontoFPG.Checked then
           sDetalhe := sDetalhe + ' LibDesconto:1 '
         else
           sDetalhe := sDetalhe + ' LibDesconto:0 ';
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
         Especial := EEspecial.Checked;
         if EEspecial.Checked then
           sDetalhe := sDetalhe + ' Especial ';
      except
      end;
      try
         RecebimentoAVista := ERecebimentoAVista.Checked;
         if ERecebimentoAVista.Checked then
           sDetalhe := sDetalhe + ' RecAvista ';
      except
      end;
      try
        if ETipoPagExclusivo.Text <> '' then
          TipoPagExclusivo := ETipoPagExclusivo.KeyValue
        else
          TipoPagExclusivo := 0;
        sDetalhe := sDetalhe + ' TipoPag:'+ETipoPagExclusivo.Text;
      except
      end;
      try
         CentavosEntrada := ECentavosEntrada.Checked;
         if ECentavosEntrada.Checked then
           sDetalhe := sDetalhe + ' CentEntrada ';
      except
      end;      
      try
        Situacao := ESituacao.ItemIndex;
        if ESituacao.ItemIndex = 0 then
          sDetalhe := sDetalhe + ' Ativado '
        else
          sDetalhe := sDetalhe + ' Desativado ';
      except
      end;
      try
         Observacao := EObservacao.Text;
         sDetalhe := sDetalhe + ' Obs:'+EObservacao.Text;
      except
      end;
      try
        Post;
        GeraLog(380, CdCNC, CdAGF, sDetalhe);
        result:=True;

      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

procedure TAgenteFin.LimpaCampos;
begin
  try
    EDescricao.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    if Estado <> 1 then
      ETaxaADM.Clear
    else
      ETaxaADM.Text := '0,00'
  except
  end;
  try
    if Estado <> 1 then
      ETaxaMensal.Clear
    else
      ETaxaMensal.Text := '0,00'
  except
  end;
  try
    EJuros.Clear;
  except
  end;
  try
    EDiaPagamento.Clear;
  except
  end;
  try
    EAntecipacao.Clear;
  except
  end;
  try
    EJurosEntrada.Checked := False;
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
    EEspecial.Checked := False;
  except
  end;
  try
    ERecebimentoAVista.Checked := False;
  except
  end;
  try
    ETipoPagExclusivo.KeyValue := 0;
  except
  end;
  try
    if Estado <> 1 then
      ECentavosEntrada.Checked := False
    else
      ECentavosEntrada.Checked := True;        
  except
  end;  
  try
    if Estado <> 1 then
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

{ Localiza um Agente Financeiro }
function TAgenteFin.LocalizarCod(CdAGF,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdAGF<>CodigoAGF) or (CdCNC<>CodigoCNC) Then
    If locate('AGF_CODIGO', CdAGF, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TAgenteFin.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>Descricao Then
    If locate('AGF_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TAgenteFin.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
 try
   EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
 except
 end;
end;

procedure TAgenteFin.PreparaInsercao;
begin
  ProximoCodigo('AGF_CODIGO');
  Estado:=1;
  try
    AtualizaControles(True);
  except
  end;
  LimpaCampos;
end;

function TAgenteFin.deletarauto:Boolean;
var
  CdCNC, CdAGF: integer;
  sDetalhe: string;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdAGF := CodigoAGF;
    sDetalhe := 'Desc:'+Descricao+
                ' DiaPag:'+IntToStr(DiaPagamento)+
                ' TaxaAdm:'+Format('%.2f',[TaxaADM])+
                ' Juros:'+Format('%.2f',[Juros]);
    if Delete then
    Begin
      result:=true;
      GeraLog(390,CdCNC,CdAGF,sDetalhe);
      RegistrarDel(CdCNC,1140(*AgenteFin*),CdAGF,sDetalhe);
    end;
    if isEmpty then
      LimpaCampos;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
