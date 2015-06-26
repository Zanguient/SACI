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
unit Banco;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls,
     Mask, Configuracao, Dbgrids, Funcoes, Variants;

type
  TBanco = class(TSQuery)
  private
    FCodigoBanco   : Integer;
    FDataAlterado  : TDateTime;
    FDataCadastro  : TDateTime;
    FEDataAlterado : TMaskEdit;
    FEDataCadastro : TMaskEdit;
    FENome         : TEdit;
    FENumeroBanco  : TEdit;
    FNome          : String;
    FNumeroBanco   : Integer;
    procedure AutoInitialize;
    procedure AutoDestroy;
    function GetCodigoBanco : Integer;
    procedure SetCodigoBanco(Value : Integer);
    function GetDataAlterado : TDateTime;
    procedure SetDataAlterado(Value : TDateTime);
    function GetDataCadastro : TDateTime;
    procedure SetDataCadastro(Value : TDateTime);
    function GetNome : String;
    procedure SetNome(Value : String);
    function GetNumeroBanco : Integer;
    procedure SetNumeroBanco(Value : Integer);
  protected
    procedure Notification(AComponent : TComponent; Operation : TOperation); override;
  public
    function Alterar(CdCNC,CdBNC,PNumero:Integer;PNome:String):boolean;
    function AlterarAuto:Boolean;
    procedure AtualizaControles(Habilitar:Boolean);
    procedure CancelaEdicao;
    procedure CarregaDados;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FinalizaEdicao:Boolean;
    function Inserir(CdCNC,CdBNC,PNumeroBanco:Integer;PNome:String):boolean;
    function InserirAuto:Boolean;
    procedure LimpaCampos;
    function LocalizarCod(CdBNC,CdCNC:integer):Boolean;
    function LocalizarNome(NomeBanco:String):Boolean;
    function Localizarnumero(numero,CDCNC:Integer):Boolean;
    procedure PreparaAlteracao;
    procedure PreparaInsercao;
    function deletarauto:Boolean;
  published
    property CodigoBanco   : Integer   read GetCodigoBanco  write SetCodigoBanco;
    property DataAlterado  : TDateTime read GetDataAlterado write SetDataAlterado;
    property DataCadastro  : TDateTime read GetDataCadastro write SetDataCadastro;
    property EDataAlterado : TMaskEdit read FEDataAlterado  write FEDataAlterado;
    property EDataCadastro : TMaskEdit read FEDataCadastro  write FEDataCadastro;
    property ENome         : TEdit     read FENome          write FENome;
    property ENumeroBanco  : TEdit     read FENumeroBanco   write FENumeroBanco;
    property Nome          : String    read GetNome         write SetNome;
    property NumeroBanco   : Integer   read GetNumeroBanco  write SetNumeroBanco;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Softech', [TBanco]);
end;

procedure TBanco.AutoInitialize;
begin
  FEDataAlterado := nil;
  FEDataCadastro := nil;
  FENome := nil;
  FENumeroBanco := nil;
end;

procedure TBanco.Notification(AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation <> opRemove then
    Exit;
  if AComponent = FEDataAlterado then
    FEDataAlterado := nil;
  if AComponent = FEDataCadastro then
    FEDataCadastro := nil;
  if AComponent = FENome then
    FENome := nil;
  if AComponent = FENumeroBanco then
    FENumeroBanco := nil;
end;

procedure TBanco.AutoDestroy;
begin
end;

function TBanco.GetCodigoBanco : Integer;
begin
  try
    Result := Self.fieldByName('BNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

procedure TBanco.SetCodigoBanco(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('BNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BNC_CODIGO"!');
    end;
  end;
end;

function TBanco.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('BNC_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

procedure TBanco.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BNC_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BNC_DT_ALTERADO"!');
  end;
end;

function TBanco.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('BNC_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

procedure TBanco.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BNC_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BNC_DT_CADASTRO"!');
  end;
end;

function TBanco.GetNome : String;
begin
  try
    Result := Self.fieldByName('BNC_NOME').asString;
  except
    result:= ''
  end;
end;

procedure TBanco.SetNome(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BNC_NOME').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BNC_NOME"!');
  end;
end;

function TBanco.GetNumeroBanco : Integer;
begin
  try
    Result := Self.fieldByName('BNC_NUMERO').asInteger;
  except
    result:= 0
  end;
end;

procedure TBanco.SetNumeroBanco(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BNC_NUMERO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BNC_NUMERO"!');
    end;
end;

function TBanco.Alterar(CdCNC,CdBNC,PNumero:Integer;PNome:String):boolean;
begin
  If not(localizarNumero(PNumero,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoUSU    := CConfiguracao.CodigoUSU;
      DataAlterado := CConfiguracao.DataHora;
      Nome         := PNome;
      CodigoBanco  := CdBNC;
      NumeroBanco  := PNumero;

      try
        Post;
        result := true;
      except
        result := false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifiqu se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result := false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TBanco.AlterarAuto:Boolean;
begin
  try
    edit;
    try
      CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado := StrToDateTime(EDataAlterado.Text);
    except
    end;
    try
      Nome   := ENome.Text;
    except
    end;
    try
      NumeroBanco   := StrToInt(ENumeroBanco.Text);
    except
    end;

    try
      Post;
      Result:=True;
      GeraLog(640,CodigoCNC,CodigoBanco);
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

procedure TBanco.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled      := not Habilitar;
  except
  end;
  Try
    ENome.Enabled        := Habilitar;
  except
  end;
  try
    ENumeroBanco.Enabled :=Habilitar;
  except
  end;
end;

procedure TBanco.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if not isEmpty then
    CarregaDados
  else
    LimpaCampos;
end;

procedure TBanco.CarregaDados;
begin
  Try
    ENumeroBanco.Text           :=IntToStr(NumeroBanco);
  except
  end;
  Try
    if DataCadastro > 0 then
      EDataCadastro.Text :=formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  Try
    if DataAlterado > 0 then
      EDataAlterado.Text :=formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    ENome.Text                  :=Nome;
  except
  end;
end;

constructor TBanco.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  AutoInitialize;
end;

destructor TBanco.Destroy;
begin
  AutoDestroy;
  inherited Destroy;
end;

function TBanco.FinalizaEdicao:Boolean;
var
  numero, cdcnc:Integer;
  menssagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  menssagem :='';
  if not VerificaInteiroBranco(ENumeroBanco.text) then
    menssagem:=menssagem+'Número do Banco digitado incorretamente ou vazio!';
  if Trim(ENome.text) = '' then
    menssagem:=menssagem+'Nome do Banco inválido!';
  if menssagem<>'' then
    ShowMessage(menssagem)
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
        LocalizarCod(SCodigo, CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      numero:=numerobanco;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarNumero(numero, cdcnc);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TBanco.Inserir(CdCNC,CdBNC,PNumeroBanco:Integer;PNome:String):boolean;
Var
  Cod:Integer;
begin
  if CdBNC=0 then
    Cod    := ProximoCodigo('BNC_CODIGO')
  else
    Cod    := CdBNC;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
  end
  else
  begin
    try
      Insert;
      CodigoBanco    := Cod;
      CodigoCNC      := CdCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataCadastro   := CConfiguracao.DataHora;
      Nome           := PNome;
      NumeroBanco    := PNumeroBanco;

      try
        Post;
        Result := True;
      except
        result := false;
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      result := false;
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

function TBanco.InserirAuto:Boolean;
begin
  If (localizarCod(SCodigo,CodigoCNC)) Then
  begin
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
    result:=false;
  end
  Else
  begin
    If localizarNumero(StrToInt(ENumeroBanco.text),CConfiguracao.CodigoCNC) Then
    Begin
      ShowMessage('Não foi possível incluir o registro corrente pois ele já existe!');
      Result := False;
    end
    Else
    begin
      try
        append;
        try
          codigocnc   := CConfiguracao.CodigoCNC;
        except
        end;
        try
           CodigoBanco := SCodigo;
        except
        end;
        try
          numerobanco  := StrToInt(Enumerobanco.text);
        except
        end;
        try
          CodigoUSU    := CConfiguracao.CodigoUSU;
        except
        end;
        try
          DataCadastro := StrToDateTime(EDataCadastro.Text);
        except
        end;
        try
           Nome        := ENome.Text;
        except
        end;
        try
          Post;
          result := True;

        except
          result := False;
          Cancel;
          ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
        end;
      except
        result := false;
        ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
      end;
    end;
  end;
end;

procedure TBanco.LimpaCampos;
begin
  Try
    ENumeroBanco.Clear;
  except
  end;
  try
    if estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    ENome.Clear;
  except
  end;
end;

function TBanco.LocalizarCod(CdBNC,CdCNC:integer):Boolean;
begin
  If (CdBNC<>CodigoBanco) or (CDCNC<>CodigoCNC) Then
  begin
    If locate('CNC_CODIGO;BNC_CODIGO', vararrayof([CDCNC, CDBNC]), []) Then
      Result := True
    else
      Result := False
  end
  Else
    Result := True;
end;

function TBanco.LocalizarNome(NomeBanco:String):Boolean;
begin
  If NomeBanco<>Nome Then
  begin
    If locate('BNC_NOME',NomeBanco, []) Then
      Result:=True
    else
      Result:=False
  end
  Else
    Result:=True;
end;

function TBanco.Localizarnumero(numero,CDCNC:Integer):Boolean;
begin
  If (numero<>NumeroBanco) or (CDCNC<>CodigoCNC) Then
  begin
    If locate('CNC_CODIGO;BNC_NUMERO', vararrayof([CDCNC, numero]), []) Then
      Result:=True
    else
      Result:=False
  end
  Else
    Result:=True;
end;

procedure TBanco.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;

end;

procedure TBanco.PreparaInsercao;
begin
  ProximoCodigo('BNC_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TBanco.deletarauto:Boolean;
var
  CdCNC, CdBNC,Numero:integer;
begin
  result:=false;
  try
    CdCNC :=CodigoCNC;
    CdBNC :=CodigoBanco;
    Numero:=NumeroBanco;
    if Delete then
    Begin
      result:=true;
      GeraLog(630,CdCNC,CdBNC,'Banco: '+IntToStr(Numero));
      RegistrarDel(CdCNC,1170(*Banco*),CdBNC,'Banco: '+IntToStr(Numero));
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

end.
