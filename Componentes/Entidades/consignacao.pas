////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO.....: SIAC                                                 //
//============================================================================//
// REVISÃO.............: 2.0                                                  //
// MÓDULO..............: SIAC                                                 //
// UNIT................: Cadastro de Consignação                              //
// ANALISTA............: Anderson Gonçalves                                   //
// DESENVOLVEDOR.......: Anderson Gonçalves                                   //
// DATA DAS ALTERAÇÕES.: 10/05/2011                                           //
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
unit consignacao;

interface

uses Windows, WinTypes, WinProcs, Messages, SysUtils, Classes,
     Controls, Forms, Graphics, Squery, Dbtables, Dialogs, Db,
     Stdctrls, Mask, Dbctrls, Configuracao, Variants, ComCtrls,
     ExtCtrls, Registry;

type
  TConsignacao = class(TSQuery)
  private
    FCodigoCSG     : Integer;
    FCodigoFUN     : Integer;
    FCodigoCLI     : Integer;
    FData          : TDatetime;
    FDataAlterado  : TDateTime;
    FValor         : Double;
    FSituacao      : Integer;
    FOBS           : String;
    FECodigoCSG    : TEdit;
    FECodigoFUN    : TDBLookupComboBox;
    FECodigoCLI    : TDBLookupComboBox;
    FEData         : TMaskEdit;
    FEDataAlterado : TMaskEdit;
    FEValor        : TEdit;
    FESituacao     : TEdit;
    FEOBS          : TMemo;
    procedure AutoInitialize;
    procedure AutoDestroy;
    procedure SetCodigoFUN(Value : Integer);
    procedure SetCodigoCLI(Value : Integer);
    procedure SetCodigoCSG(Value : Integer);
    procedure SetData(Value : Tdatetime);
    procedure SetDataAlterado(Value : TDateTime);
    procedure SetOBS(Value : String);
    procedure SetSituacao(Value : Integer);
    procedure SetValor(const Value: Double);
    function GetCodigoFUN : Integer;
    function GetCodigoCLI : Integer;
    function GetCodigoCSG : Integer;
    function GetData : Tdatetime;
    function GetDataAlterado : TDateTime;
    function GetOBS : String;
    function GetSituacao : Integer;
    function GetValor: Double;
  protected
    procedure Notification(AComponent : TComponent; Operation : TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LimpaCampos;
    procedure PreparaAlteracao;
    procedure PreparaInsercao;
    procedure AtualizaControles(Habilitar:Boolean);
    procedure CancelaEdicao;
    procedure CarregaDados;
    function AlterarAuto:Boolean;
    function InserirAuto:Boolean;
    function DeletarAuto:Boolean;
    function Deletar(CdCNC,CdCSG:Integer):Boolean;
    function FinalizaEdicao:Boolean;
    function LocalizarCod(CdCSG, CdCNC:Integer):Boolean;
  published
    property CodigoFUN     : Integer           read GetCodigoFUN    write SetCodigoFUN;
    property CodigoCLI     : Integer           read GetCodigoCLI    write SetCodigoCLI;
    property CodigoCSG     : Integer           read GetCodigoCSG    write SetCodigoCSG;
    property Data          : TDatetime         read GetData         write SetData;
    property DataAlterado  : TDateTime         read GetDataAlterado write SetDataAlterado;
    property OBS           : String            read GetOBS          write SetOBS;
    property Situacao      : Integer           read GetSituacao     write SetSituacao;
    property Valor         : Double            read GetValor        write SetValor;
    property ECodigoFUN    : TDBLookupComboBox read FECodigoFUN     write FECodigoFUN;
    property ECodigoCLI    : TDBLookupComboBox read FECodigoCLI     write FECodigoCLI;
    property ECodigoCSG    : TEdit             read FECodigoCSG     write FECodigoCSG;
    property EData         : TMaskEdit         read FEData          write FEData;
    property EDataAlterado : TMaskEdit         read FEDataAlterado  write FEDataAlterado;
    property EOBS          : TMemo             read FEOBS           write FEOBS;
    property ESituacao     : TEdit             read FESituacao      write FESituacao;
    property EValor        : TEdit             read FEValor         write FEValor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Softech', [TConsignacao]);
end;

{ TConsignacao }

procedure TConsignacao.AutoInitialize;
begin
  FECodigoCSG    := nil;
  FECodigoFUN    := nil;
  FECodigoCLI    := nil;
  FEData         := nil;
  FEDataAlterado := nil;
  FEValor        := nil;
  FESituacao     := nil;
  FEOBS          := nil;
end;

procedure TConsignacao.Notification(AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation <> opRemove then
    Exit;
  if AComponent = FECodigoFUN then
    FECodigoFUN := nil;
  if AComponent = FECodigoCLI then
    FECodigoCLI := nil;
  if AComponent = FECodigoCSG then
    FECodigoCSG := nil;
  if AComponent = FEData then
    FEData := nil;
  if AComponent = FEDataAlterado then
    FEDataAlterado := nil;
  if AComponent = FEOBS then
    FEOBS := nil;
  if AComponent = FESituacao then
    FESituacao := nil;
  if AComponent = FEValor then
    FEValor := nil;
end;

procedure TConsignacao.AutoDestroy;
begin

end;

function TConsignacao.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

procedure TConsignacao.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
  end;
end;

function TConsignacao.GetCodigoCSG : Integer;
begin
  try
    Result := Self.fieldByName('CSG_CODIGO').asInteger;
  except
    Result:= 0
  end;
end;

procedure TConsignacao.SetCodigoCSG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('CSG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CSG_CODIGO"!');
    end;
  end;
end;

function TConsignacao.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('CSG_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

procedure TConsignacao.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('CSG_DATA').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CSG_DATA"!');
    end;
  end;
end;

function TConsignacao.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CSG_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

procedure TConsignacao.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('CSG_DT_ALTERADO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CSG_DT_ALTERADO"!');
    end;
  end;
end;

function TConsignacao.GetOBS : String;
begin
  try
    Result := Self.fieldByName('CSG_OBSERVACAO').asString;
  except
    Result:= ''
  end;
end;

procedure TConsignacao.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('CSG_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CSG_OBSERVACAO"!');
    end;
  end;
end;

function TConsignacao.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CSG_SITUACAO').asInteger;
  except
    Result:= 0
  end;
end;

procedure TConsignacao.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('CSG_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CSG_SITUACAO"!');
    end;
  end;
end;

function TConsignacao.AlterarAuto:Boolean;
var
  CdCNC, CdCSG: integer;
begin
  Result := false;
  CdCNC  := CodigoCNC;
  CdCSG  := CodigoCSG;
  try
    Edit;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      Data := StrToDateTime(EData.Text);
    except
    end;
    try
      CodigoFUN := ECodigoFUN.KeyValue;
    except
    end;
    try
      CodigoCLI := ECodigoCLI.KeyValue;
    except
    end;
    try
      OBS := EOBS.Text;
    except
    end;
    try
      Valor := StrToFloat(EValor.Text);
    except
    end;
    try
      Post;
      GeraLog(8940,CdCNC,CdCSG);
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TConsignacao.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled := not Habilitar;
  Except
  End;
  Try
    ECodigoFUN.Enabled := Habilitar;
  Except
  End;
  Try
    ECodigoCLI.Enabled := Habilitar;
  Except
  End;
  Try
    EOBS.Enabled := Habilitar;
  Except
  End;
  Try
    EValor.Enabled := Habilitar;
  Except
  End;
  Try
    EData.Enabled := Habilitar;
  Except
  End;
  Try
    EDataAlterado.Enabled := Habilitar;
  Except
  End;
  Try
    ESituacao.Enabled := Habilitar;
  Except
  End;
end;

procedure TConsignacao.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if not isEmpty then
    CarregaDados
  else
    LimpaCampos;
end;

procedure TConsignacao.CarregaDados;
begin
  Try
    Case Situacao of
      0: ESituacao.Text:='Em Aberto';
      1: ESituacao.Text:='Confirmado';
      2: ESituacao.Text:='Finalizado';
      3: ESituacao.Text:='Cancelado';
    End;
  Except
  End;
  Try
    ECodigoCSG.Text := IntToStr(CodigoCSG);
  Except
  End;
  Try
    ECodigoFUN.KeyValue := CodigoFUN;
  Except
  End;
  Try
    ECodigoCLI.KeyValue := CodigoCLI;
  Except
  End;
  Try
   If DataAlterado<>0 then
     EDataAlterado.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', DataAlterado);
  Except
  End;
  Try
   If data<>0 then
     EData.Text := FormatDateTime('dd/mm/yyyy', Data);
  Except
  End;
  Try
    EOBS.Text := OBS;
  Except
  End;
  Try
    EValor.Text := Format('%.2f', [Valor]);
  Except
  End;
end;

constructor TConsignacao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  AutoInitialize;
end;

function TConsignacao.Deletar(CdCNC,CdCSG:Integer):Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      GeraLog(8950, CdCNC, CdCSG);
      RegistrarDel(CdCNC,4590(*consignacao*),CdCSG);
      Result := True;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

destructor TConsignacao.Destroy;
begin
  AutoDestroy;
  inherited Destroy;
end;

function TConsignacao.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem :string;
begin
  Result := False;
  mensagem := '';
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado = 1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        Sql.Text := 'SELECT * FROM CONSIGNACAO '+
          ' WHERE CNC_CODIGO=:CNC_CODIGO '+
          ' AND CSG_CODIGO='+IntToStr(SCodigo);
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoCSG;
      If Alterarauto then
      Begin
        Result := True;
        close;
        Sql.Text := 'SELECT * FROM CONSIGNACAO '+
          ' WHERE CNC_CODIGO=:CNC_CODIGO '+
          ' AND CSG_CODIGO='+IntToStr(Cod);
        open;
        AtualizaControles(False);
        Estado:=0;
      end;
    End;
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

function TConsignacao.InserirAuto:Boolean;
var
  CdCNC, CdCSG: integer;
begin
  Result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdCSG := SCodigo;
  try
    Append;
    try
      codigoCNC := CConfiguracao.CodigoCNC;
    except
    end;
    try
       codigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      codigoCSG := SCodigo;
    except
    end;
    try
       CodigoFUN := ECodigoFUN.KeyValue;
    except
    end;
    try
       CodigoCLI := ECodigoCLI.KeyValue;
    except
    end;
    try
       Data := StrToDateTime(EData.Text);
    except
    end;
    try
       Situacao := 0;
    except
    end;
    try
       OBS := EOBS.Text;
    except
    end;
    try
       Valor := StrToFloat(EValor.Text);
    except
    end;
    try
      Post;
      GeraLog(8940,CdCNC,CdCSG);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TConsignacao.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoCSG.Clear;
  Except
  End;
  Try
    ECodigoFUN.KeyValue:=0;
  Except
  End;
  Try
    ECodigoCLI.KeyValue:=0;
  Except
  End;
  Try
    EDataAlterado.Clear;
  Except
  End;
  Try
    if Estado = 1 then
      EData.Text:=DateToStr(CConfiguracao.Data)
    else
      EData.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ESituacao.Clear
    else
      ESituacao.Text := 'Em Aberto';
  Except
  End;
  Try
    EOBS.Clear;
  Except
  End;
  Try
    EValor.Clear;
  Except
  End;
end;

function TConsignacao.LocalizarCod(CdCSG, CdCNC:Integer):Boolean;
begin
  If (CdCSG<>CodigoCSG) or (CdCNC<>CodigoCNC) Then
  begin
    if locate('CNC_CODIGO; CSG_CODIGO', vararrayof([CdCNC, CdCSG]), []) Then
      Result:=True
    else
      Result:=False
  end
  else
    Result:=True;
end;

procedure TConsignacao.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  Try
    EDataAlterado.Text:=DateTimeToStr(CConfiguracao.DataHora)
  Except
  End;
end;

procedure TConsignacao.PreparaInsercao;
begin
  ProximoCodigo('CSG_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TConsignacao.DeletarAuto:Boolean;
var
  CdCNC, CdCSG: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdCSG := CodigoCSG;
    if Delete then
    Begin
      GeraLog(8950, CdCNC, CdCSG);
      RegistrarDel(CdCNC,4590(*consignacao*),CdCSG);
      Result := True;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

function TConsignacao.GetValor: Double;
begin
  try
    Result := Self.fieldByName('CSG_VALOR').asFloat;
  except
    Result:= 0
  end;
end;

procedure TConsignacao.SetValor(const Value: Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('CSG_VALOR').AsFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CSG_VALOR"!');
    end;
  end;
end;

procedure TConsignacao.SetCodigoCLI(Value: Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
  end;
end;

function TConsignacao.GetCodigoCLI: Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

end.
