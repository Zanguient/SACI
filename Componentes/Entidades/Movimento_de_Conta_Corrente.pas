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
unit Movimento_de_Conta_Corrente;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Variants, Funcoes;

type
  TMovimento_de_Conta_Corrente = class(TSQuery)
    private
      { Private fields of TMovimento_de_Conta_Corrente }
        { Storage for property CodigoCBN }
        FCodigoCBN : Integer;
        { Storage for property CodigoMCC }
        FCodigoMCC : Integer;
        { Storage for property DC }
        FDC : String;
        { Storage for property DataCadastro }
        FDataCadastro : Tdatetime;
        { Storage for property DataCompetencia }
        FDataCompetencia : TDateTime;
        { Storage for property Documento }
        FDocumento : String;
        { Storage for property ECodigoCBN }
        FECodigoCBN : TEdit;
        { Storage for property ECodigoMCC }
        FECodigoMCC : TEdit;
        { Storage for property EDC }
        FEDC : TComboBox;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataCompetencia }
        FEDataCompetencia : TMaskEdit;
        { Storage for property EDocumento }
        FEDocumento : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipo }
        FETipo : TDBLookupComboBox;
        { Storage for property EValor }
        FEValor : TEdit;
        { Storage for property MaquinaMCC }
        FMaquinaMCC : Integer;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property SaldoAnterior }
        FSaldoAnterior : Double;
        { Storage for property SaldoMovimento }
        FSaldoMovimento : Double;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property Valor }
        FValor : Double;

      { Private methods of TMovimento_de_Conta_Corrente }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCBN }
        function GetCodigoCBN : Integer;
        { Read method for property CodigoMCC }
        function GetCodigoMCC : Integer;
        { Read method for property DC }
        function GetDC : String;
        { Read method for property DataCadastro }
        function GetDataCadastro : Tdatetime;
        { Read method for property DataCompetencia }
        function GetDataCompetencia : TDateTime;
        { Read method for property Documento }
        function GetDocumento : String;
        { Read method for property MaquinaMCC }
        function GetMaquinaMCC : Integer;
        { Read method for property Observacao }
        function GetObservacao : String;
        { Read method for property SaldoAnterior }
        function GetSaldoAnterior : Double;
        { Read method for property SaldoMovimento }
        function GetSaldoMovimento : Double;
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Read method for property Valor }
        function GetValor : Double;

    protected
      { Protected fields of TMovimento_de_Conta_Corrente }

      { Protected methods of TMovimento_de_Conta_Corrente }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TMovimento_de_Conta_Corrente }

      { Public methods of TMovimento_de_Conta_Corrente }
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Movimento Conta Corrente }
        function Inserir(CdCNC, CdCBN, CdTipo: integer; PValor:Double; PDocumento, PDC:string; DtCompetencia:TDateTime; PSaldoAnt:Double=-1; POBS:string=''):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function LocalizarCod(CdMCC,CdCNC:Integer):Boolean;
        procedure PreparaInsercao;

    published
      { Published properties of TMovimento_de_Conta_Corrente }
        { Código da Conta Bancária }
        property CodigoCBN : Integer read GetCodigoCBN write FCodigoCBN;
        { Código do Movimento }
        property CodigoMCC : Integer read GetCodigoMCC write FCodigoMCC;
        property DC : String read GetDC write FDC;
        property DataCadastro : Tdatetime
             read GetDataCadastro write FDataCadastro;
        property DataCompetencia : TDateTime
             read GetDataCompetencia write FDataCompetencia;
        property Documento : String read GetDocumento write FDocumento;
        property ECodigoCBN : TEdit read FECodigoCBN write FECodigoCBN;
        property ECodigoMCC : TEdit read FECodigoMCC write FECodigoMCC;
        property EDC : TComboBox read FEDC write FEDC;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataCompetencia : TMaskEdit
             read FEDataCompetencia write FEDataCompetencia;
        property EDocumento : TEdit read FEDocumento write FEDocumento;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipo : TDBLookupComboBox read FETipo write FETipo;
        property EValor : TEdit read FEValor write FEValor;
        property MaquinaMCC : Integer read GetMaquinaMCC write FMaquinaMCC;
        property Observacao : String read GetObservacao write FObservacao;
        property SaldoAnterior : Double
             read GetSaldoAnterior write FSaldoAnterior;
        property SaldoMovimento : Double
             read GetSaldoMovimento write FSaldoMovimento;
        property Situacao : Integer read GetSituacao write FSituacao;
        property Tipo : Integer read GetTipo write FTipo;
        property Valor : Double read GetValor write FValor;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMovimento_de_Conta_Corrente with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMovimento_de_Conta_Corrente]);
end;

{ Method to set variable and property values and create objects }
procedure TMovimento_de_Conta_Corrente.AutoInitialize;
begin
     FECodigoCBN := nil;
     FECodigoMCC := nil;
     FEDC := nil;
     FEDataCadastro := nil;
     FEDataCompetencia := nil;
     FEDocumento := nil;
     FEObservacao := nil;
     FESituacao := nil;
     FETipo := nil;
     FEValor := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TMovimento_de_Conta_Corrente.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCBN then
        FECodigoCBN := nil;
     if AComponent = FECodigoMCC then
        FECodigoMCC := nil;
     if AComponent = FEDC then
        FEDC := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataCompetencia then
        FEDataCompetencia := nil;
     if AComponent = FEDocumento then
        FEDocumento := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
     if AComponent = FEValor then
        FEValor := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TMovimento_de_Conta_Corrente.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCBN }
function TMovimento_de_Conta_Corrente.GetCodigoCBN : Integer;
begin
  try
    Result := Self.fieldByName('CBN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoMCC }
function TMovimento_de_Conta_Corrente.GetCodigoMCC : Integer;
begin
  try
    Result := Self.fieldByName('MCC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DC }
function TMovimento_de_Conta_Corrente.GetDC : String;
begin
  try
    Result := Self.fieldByName('MCC_DC').asString;
  except
    result:= '';
  end;
end;

{ Read method for property DataCadastro }
function TMovimento_de_Conta_Corrente.GetDataCadastro : Tdatetime;
begin
  try
    Result := Self.fieldByName('MCC_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataCompetencia }
function TMovimento_de_Conta_Corrente.GetDataCompetencia : TDateTime;
begin
  try
    Result := Self.fieldByName('MCC_DT_COMPETENCIA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property Documento }
function TMovimento_de_Conta_Corrente.GetDocumento : String;
begin
  try
    Result := Self.fieldByName('MCC_DOCUMENTO').asString;
  except
    result:= '';
  end;
end;


{ Read method for property MaquinaMCC }
function TMovimento_de_Conta_Corrente.GetMaquinaMCC : Integer;
begin
  try
    Result := Self.fieldByName('MCC_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Observacao }
function TMovimento_de_Conta_Corrente.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('MCC_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property SaldoAnterior }
function TMovimento_de_Conta_Corrente.GetSaldoAnterior : Double;
begin
  try
    Result := Self.fieldByName('MCC_SALDO_ANT').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property SaldoMovimento }
function TMovimento_de_Conta_Corrente.GetSaldoMovimento : Double;
begin
  try
    Result := Self.fieldByName('MCC_SALDO_MOVIMENTO').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Situacao }
function TMovimento_de_Conta_Corrente.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('MCC_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Tipo }
function TMovimento_de_Conta_Corrente.GetTipo : Integer;
begin
  try
    //4110 - REC CLIENTE
    //4120 - PAG FORNECEDOR
    //4130 - PAG TRANSPORTADORA
    Result := Self.fieldByName('MCC_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Valor }
function TMovimento_de_Conta_Corrente.GetValor : Double;
begin
  try
    Result := Self.fieldByName('MCC_VALOR').asFloat;
  except
    result:= 0;
  end;
end;

procedure TMovimento_de_Conta_Corrente.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled        := not Habilitar;
  Except
  End;
  Try
    EDC.Enabled            := not Habilitar;
  Except
  End;
  Try
    ECodigoCBN.Enabled     := Habilitar;
  Except
  End;
  Try
    EDataCompetencia.Enabled     := Habilitar;
  Except
  End;
  Try
    EDocumento.Enabled     := Habilitar;
  Except
  End;
  Try
    ETipo.Enabled          := Habilitar;
  Except
  End;
  Try
    EValor.Enabled          := Habilitar;
  Except
  End;
  Try
    EObservacao.Enabled    := Habilitar;
  Except
  End;
end;

procedure TMovimento_de_Conta_Corrente.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TMovimento_de_Conta_Corrente.CarregaDados;
begin
  Try
    ECodigoMCC.Text := IntToStr(CodigoMCC);
  Except
  End;
  Try
    ETipo.KeyValue             := Tipo;
  Except
  End;
  Try
    if DataCadastro > 0 then
      EDataCadastro.Text  := formatDateTime('DD/MM/YYYY HH:MM', DataCadastro)
    else
      EDataCadastro.Clear;
  Except
  End;
  Try
    if DataCompetencia > 0 then
      EDataCompetencia.Text  := formatDateTime('DD/MM/YYYY', DataCompetencia)
    else
      EDataCompetencia.Clear;
  Except
  End;
  Try
    ECodigoCBN.Text := IntToStr(CodigoCBN);
  Except
  End;
  Try
    EDocumento.Text := Documento;
  Except
  End;
  Try
    EValor.Text := format('%.2f',[Valor]);
  Except
  End;
  Try
    ESituacao.ItemIndex := Situacao;
  Except
  End;
  Try
    EObservacao.Text := Observacao;
  Except
  End;
end;

constructor TMovimento_de_Conta_Corrente.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'MOVIMENTO_CONTA_CORRENTE';

     { Code to perform other tasks when the component is created }

end;

destructor TMovimento_de_Conta_Corrente.Destroy;
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

function TMovimento_de_Conta_Corrente.FinalizaEdicao:Boolean;
var
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem:='';
  if not (EDC.ItemIndex IN [0,1]) then
    mensagem := mensagem + 'Defina se é Débito ou Crédito!'+#13;
  if not VerificaInteiroBranco(ECodigoCBN.Text) then
    mensagem := mensagem + 'Código da Conta Corrente inválido!'+#13;
  if Trim(EDocumento.Text) = '' then
    mensagem := mensagem + 'Documento inválido!'+#13;
  if not VerificaDataBranco(EDataCompetencia.Text) then
    mensagem := mensagem + 'Data de Competência inválida!'+#13;
  if ETipo.Text = '' then
    mensagem := mensagem + 'Tipo de Movimento inválido!'+#13;
  if not VerificaFloatBranco(EValor.Text) then
    mensagem := mensagem + 'Valor inválido!'+#13;
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
        Result := True;
        close;
        SQL.Text := 'SELECT * FROM '+Tabela+
          ' WHERE CNC_CODIGO='+IntToStr(CConfiguracao.CodigoCNC)+
          ' AND MCC_CODIGO='+IntToStr(SCodigo)+
          Selecao.Text;
        open;
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      End;
    end;
    AfterScroll:=Aux;
  End;
end;

{ Insere um Movimento Conta Corrente }
function TMovimento_de_Conta_Corrente.Inserir(CdCNC, CdCBN, CdTipo: integer; PValor:Double; PDocumento, PDC:string; DtCompetencia:TDateTime; PSaldoAnt:Double=-1; POBS:string=''):boolean;
Var
  Cod:Integer;
  vSaldoAnt: Double;
  sSinal: string;
begin
  Result := False;
  Cod    := ProximoCodigo('MCC_CODIGO');
  if CConfiguracao.Data <= 0 then
  Begin
    ShowMessage('Problema com a Data!');
    Exit;
  end;

  if PDC = 'D' then
    sSinal := '-'
  else
    sSinal := '+';

  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT CBN_SALDO '+
      ' FROM CONTA_BANCARIA '+
      ' WHERE CBN_CODIGO='+IntToStr(CdCBN);
    Open;
    if isEmpty then
    Begin
      ShowMessage('Conta bancária não encontrada!');
      Exit;
    end;
    if PSaldoAnt = -1 then
      vSaldoAnt := FieldByName('CBN_SALDO').asFloat
    else
      vSaldoAnt := PSaldoAnt;
  end;


  If VerificaRegistroExiste('CNC_CODIGO='+IntToStr(CdCNC)+' AND MCC_CODIGO='+IntToStr(Cod)) Then
    ShowMessage('Não foi possível inserir o registro da tabela '+Tabela+'. Já existe!')
  else If VerificaRegistroExiste('CNC_CODIGO='+IntToStr(CdCNC)+' AND CBN_CODIGO='+IntToStr(CdCBN)+' AND MCC_DOCUMENTO="'+PDocumento+'" AND MCC_DC="'+PDC+'"') Then
    ShowMessage('Movimento com esse documento já inserido!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO '+Tabela+
        '(CNC_CODIGO,MCC_CODIGO,CNC_ORIGEM,USU_CODIGO,MCC_DT_CADASTRO '+
        ',MCC_MAQUINA,CBN_CODIGO,MCC_TIPO '+
        ',MCC_DC,MCC_DOCUMENTO,MCC_DT_COMPETENCIA'+
        ',MCC_SALDO_ANT,MCC_VALOR,MCC_SALDO_MOVIMENTO'+
        ',MCC_SITUACAO,MCC_OBSERVACAO) VALUES '+
        '( '+IntToStr(CdCNC)+
        ', '+IntToStr(Cod)+
        ', '+IntToStr(CentroDeCusto)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(Maquina)+
        ', '+IntToStr(CdCBN)+
        ', '+IntToStr(CdTipo)+
        ',"'+PDC+'" '+
        ',"'+PDocumento+'" '+
        ',"'+MesDia(DtCompetencia)+'" '+
        ', '+VirgPonto(vSaldoAnt)+
        ', '+VirgPonto(PValor)+
        ', '+VirgPonto(PValor)+ //Saldo Movimento
        ',0'+ //Situacao
        ',"'+PObs+'") ');

      ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE CONTA_BANCARIA SET '+
        ' CBN_SALDO=CBN_SALDO'+sSinal+VirgPonto(PValor)+
        ' WHERE CBN_CODIGO='+IntToStr(CdCBN));

      if PDC = 'D' then
        GeraLog(7490, CdCNC, Cod, 'Conta:'+IntToStr(CdCBN)+
          ' SaldoAnt:'+format('%.2f',[vSaldoAnt])+
          ' Valor:'+format('%.2f',[PValor]))
      else
        GeraLog(7500, CdCNC, Cod, 'Conta:'+IntToStr(CdCBN)+
          ' SaldoAnt:'+format('%.2f',[vSaldoAnt])+
          ' Valor:'+format('%.2f',[PValor]));
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente!');
    End;
  end;
end;

function TMovimento_de_Conta_Corrente.InserirAuto:Boolean;
var
  sDC: string;
begin
  if EDC.ItemIndex = 0 then
    sDC := 'D'
  else
    sDC := 'C';

  Result := Inserir(CConfiguracao.CodigoCNC,
    StrToInt(ECodigoCBN.Text),ETipo.KeyValue,
    StrToFloat(EValor.Text),
    EDocumento.Text, sDC, StrToDate(EDataCompetencia.Text),
    -1(*SaldoMovimento=Valor*),
    EObservacao.Text);
end;

procedure TMovimento_de_Conta_Corrente.LimpaCampos;
begin
  Try
    if estado <> 1 then
      ECodigoMCC.Clear;
  Except
  End;
  try
    ECodigoCBN.Clear;
  except
  end;
  try
    EDocumento.Clear;
  except
  end;
  Try
    if Estado = 1 then
      EDataCadastro.Text  := formatDateTime('DD/MM/YYYY HH:MM', CConfiguracao.DataHora)
    else
      EDataCadastro.Clear;
  Except
  End;
  try
    if Estado <> 1 then
      EDataCompetencia.Clear
    else
      EDataCompetencia.Text := formatDateTime('DD/MM/YYYY',CConfiguracao.DataHora);
  except
  end;
  try
    EValor.Clear;
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

function TMovimento_de_Conta_Corrente.LocalizarCod(CdMCC,CdCNC:Integer):Boolean;
begin
  If (CdMCC<>CodigoMCC) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;MCC_CODIGO', vararrayof([CdCNC, CdMCC]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TMovimento_de_Conta_Corrente.PreparaInsercao;
begin
  ProximoCodigo('MCC_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
