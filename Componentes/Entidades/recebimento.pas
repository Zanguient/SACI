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
unit Recebimento;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Comctrls, Funcoes, Variants;

type
  TRecebimento = class(TSQuery)
    private
      { Private fields of TRecebimento }
        { Storage for property CNC_Origem }
        FCNC_Origem : Integer;
        { Storage for property Cod_Origem }
        FCod_Origem : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoPRC }
        FCodigoPRC : Integer;
        { Storage for property CodigoREC }
        FCodigoREC : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataE }
        FDataE : TDateTime;
        { Storage for property DataS }
        FDataS : TDateTime;
        { Storage for property ECncOrigem }
        FECncOrigem : TDBLookUpComboBox;
        { Storage for property ECodOrigem }
        FECodOrigem : TEdit;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TEdit;
        { Storage for property ECodigoREC }
        FECodigoREC : TEdit;
        { Storage for property EData }
        FEData : TDateTimePicker;
        { Storage for property EDataE }
        FEDataE : TMaskedit;
        { Storage for property EDataS }
        FEDataS : TMaskedit;
        { Storage for property ENumero }
        FENumero : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property ETipo }
        FETipo : TComboBox;
        { Storage for property ETotItem }
        FETotItem : TEdit;
        { Storage for property Numero }
        FNumero : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property TotItem }
        FTotItem : Integer;

      { Private methods of TRecebimento }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CNC_Origem }
        function GetCNC_Origem : Integer;
        { Write method for property CNC_Origem }
        procedure SetCNC_Origem(Value : Integer);
        { Read method for property Cod_Origem }
        function GetCod_Origem : Integer;
        { Write method for property Cod_Origem }
        procedure SetCod_Origem(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Write method for property CodigoFOR }
        procedure SetCodigoFOR(Value : Integer);
        { Read method for property CodigoPRC }
        function GetCodigoPRC : Integer;
        { Write method for property CodigoPRC }
        procedure SetCodigoPRC(Value : Integer);
        { Read method for property CodigoREC }
        function GetCodigoREC : Integer;
        { Write method for property CodigoREC }
        procedure SetCodigoREC(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataE }
        function GetDataE : TDateTime;
        { Write method for property DataE }
        procedure SetDataE(Value : TDateTime);
        { Read method for property DataS }
        function GetDataS : TDateTime;
        { Write method for property DataS }
        procedure SetDataS(Value : TDateTime);
        { Read method for property Numero }
        function GetNumero : String;
        { Write method for property Numero }
        procedure SetNumero(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);
        { Read method for property TotItem }
        function GetTotItem : Integer;
        { Write method for property TotItem }
        procedure SetTotItem(Value : Integer);

    protected
      { Protected fields of TRecebimento }

      { Protected methods of TRecebimento }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TRecebimento }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TRecebimento }
        { Altera um Recebimento }
        function Alterar(CdCNC, CdREC, PSituacao, PTotItem: Integer; PData:TDateTime; POBS: String;CdFOR:integer;PDtS,PDtE:TDatetime;PNum:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdREC: Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Recebimento }
        function Inserir(CdREC, CdCNC, CdPRC, PSituacao, PTotItem, PTipo, PCNC_Origem, PCd_Origem: Integer; POBS: String;CdFOR:integer; PDtS,PDtE:TDatetime;PNum:String):Boolean;
        function InserirAuto:Boolean;
        { Localiza um Recebimento }
        function LocalizarCod(CdREC, CdCNC: Integer): Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TRecebimento }
        property CNC_Origem : Integer read GetCNC_Origem write SetCNC_Origem;
        property Cod_Origem : Integer read GetCod_Origem write SetCod_Origem;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        property CodigoPRC : Integer read GetCodigoPRC write SetCodigoPRC;
        { Código do Recebimento }
        property CodigoREC : Integer read GetCodigoREC write SetCodigoREC;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property Data : Tdatetime read GetData write SetData;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataE : TDateTime read GetDataE write SetDataE;
        property DataS : TDateTime read GetDataS write SetDataS;
        property ECncOrigem : TDBLookUpComboBox
             read FECncOrigem write FECncOrigem;
        property ECodOrigem : TEdit read FECodOrigem write FECodOrigem;
        property ECodigoFOR : TEdit read FECodigoFOR write FECodigoFOR;
        property ECodigoREC : TEdit read FECodigoREC write FECodigoREC;
        property EData : TDateTimePicker read FEData write FEData;
        property EDataE : TMaskedit read FEDataE write FEDataE;
        property EDataS : TMaskedit read FEDataS write FEDataS;
        property ENumero : TEdit read FENumero write FENumero;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property ETipo : TComboBox read FETipo write FETipo;
        property ETotItem : TEdit read FETotItem write FETotItem;
        property Numero : String read GetNumero write SetNumero;
        property OBS : String read GetOBS write SetOBS;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;
        property TotItem : Integer read GetTotItem write SetTotItem;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TRecebimento with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TRecebimento]);
end;

{ Method to set variable and property values and create objects }
procedure TRecebimento.AutoInitialize;
begin
     Estado := 0;
     FECncOrigem := nil;
     FECodOrigem := nil;
     FECodigoFOR := nil;
     FECodigoREC := nil;
     FEDataE := nil;
     FEDataS := nil;
     FENumero := nil;
     FEOBS := nil;
     FESituacao := nil;
     FETipo := nil;
     FETotItem := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TRecebimento.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECncOrigem then
        FECncOrigem := nil;
     if AComponent = FECodOrigem then
        FECodOrigem := nil;
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FECodigoREC then
        FECodigoREC := nil;
     if AComponent = FEDataE then
        FEDataE := nil;
     if AComponent = FEDataS then
        FEDataS := nil;
     if AComponent = FENumero then
        FENumero := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
     if AComponent = FETotItem then
        FETotItem := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TRecebimento.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CNC_Origem }
function TRecebimento.GetCNC_Origem : Integer;
begin
  try
    Result := Self.fieldByName('REC_CNC_ORIGEM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CNC_Origem }
procedure TRecebimento.SetCNC_Origem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('REC_CNC_ORIGEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "REC_CNC_ORIGEM"!');
    end;
end;

{ Read method for property Cod_Origem }
function TRecebimento.GetCod_Origem : Integer;
begin
  try
    Result := Self.fieldByName('REC_COD_ORIGEM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Cod_Origem }
procedure TRecebimento.SetCod_Origem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('REC_COD_ORIGEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "REC_COD_ORIGEM"!');
    end;
end;

{ Read method for property CodigoCNC }
function TRecebimento.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TRecebimento.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFOR }
function TRecebimento.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFOR }
procedure TRecebimento.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRC }
function TRecebimento.GetCodigoPRC : Integer;
begin
  try
    Result := Self.fieldByName('PRC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRC }
procedure TRecebimento.SetCodigoPRC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRC_CODIGO"!');
    end;
end;

{ Read method for property CodigoREC }
function TRecebimento.GetCodigoREC : Integer;
begin
  try
    Result := Self.fieldByName('REC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoREC }
procedure TRecebimento.SetCodigoREC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('REC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "REC_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TRecebimento.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TRecebimento.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TRecebimento.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('REC_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TRecebimento.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('REC_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "REC_DATA"!');
  end;
end;

{ Read method for property DataAlterado }
function TRecebimento.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('REC_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TRecebimento.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('REC_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "REC_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataE }
function TRecebimento.GetDataE : TDateTime;
begin
  try
    Result := Self.fieldByName('REC_DATA_EMISSAO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataE }
procedure TRecebimento.SetDataE(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('REC_DATA_EMISSAO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "REC_DATA_EMISSAO"!');
  end;
end;

{ Read method for property DataS }
function TRecebimento.GetDataS : TDateTime;
begin
  try
    Result := Self.fieldByName('REC_DATA_SAIDA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataS }
procedure TRecebimento.SetDataS(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('REC_DATA_SAIDA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "REC_DATA_SAIDA"!');
  end;
end;


{ Read method for property Numero }
function TRecebimento.GetNumero : String;
begin
  try
    Result := Self.fieldByName('REC_NUM_DOC').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Numero }
procedure TRecebimento.SetNumero(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('REC_NUM_DOC').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "REC_NUM_DOC"!');
  end;
end;

{ Read method for property OBS }
function TRecebimento.GetOBS : String;
begin
  try
    Result := Self.fieldByName('REC_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TRecebimento.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('REC_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "REC_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TRecebimento.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('REC_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TRecebimento.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('REC_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "REC_SITUACAO"!');
  end;
end;

{ Read method for property Tipo }
function TRecebimento.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('REC_TIPO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Tipo }
procedure TRecebimento.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('REC_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "REC_TIPO"!');
    end;
end;

{ Read method for property TotItem }
function TRecebimento.GetTotItem : Integer;
begin
  try
    Result := Self.fieldByName('REC_TOT_ITEM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TotItem }
procedure TRecebimento.SetTotItem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('REC_TOT_ITEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "REC_TOT-ITEM"!');
    end;
end;

{ Altera um Recebimento }
function TRecebimento.Alterar(CdCNC, CdREC, PSituacao, PTotItem: Integer; PData:TDateTime; POBS: String;CdFOR:integer;PDtS,PDtE:TDatetime;PNum:String):boolean;
begin
  result:=false;
  If not(localizarCod(CdREC,CdCNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      CodigoFor      := CdFor;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := CConfiguracao.DataHora;
      DataS          := PDtS;
      DataE          := PDtE;
      Numero         := PNum;
      Data           := PData;
      Situacao       := PSituacao;
      OBS            := POBS;
      TotItem        := PTotItem;
      try
        Post;
        result:=true;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TRecebimento.AlterarAuto:Boolean;
begin
  try
    edit;
    try
       Data := EData.date;
    except
    end;
    try
       CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
       DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
       DataS := strtodatetime(EDataS.Text);
    except
    end;
    try
       DataE := strtodatetime(EDataE.Text);
    except
    end;
    try
       Numero := ENumero.Text;
    except
    end;
    try
       CodigoFOR := strtoint(ECodigoFOR.Text);
    except
    end;
    try
       TotItem := StrToInt(ETotItem.Text);
    except
    end;
    try
       Tipo := ETipo.ItemIndex;
    except
    end;
    try
       CNC_ORIGEM := ECncOrigem.KeyValue;
    except
    end;
    try
       COD_ORIGEM := StrToInt(ECODOrigem.Text);
    except
    end;
    try
       OBS := EOBS.Text;
    except
    end;
    try
      Post;
      Result:=True;
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

procedure TRecebimento.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    EData.Enabled       := Not Habilitar;
  Except
  End;
  try
    EDBGrid.Enabled     := Not Habilitar;
  Except
  End;
  Try
    ECNCOrigem.Enabled  := Habilitar;
  Except
  End;
  Try
    ECODOrigem.Enabled  := Habilitar;
  Except
  End;
  Try
    EDataE.Enabled      := Habilitar;
  Except
  End;
  Try
    EDataS.Enabled      := Habilitar;
  Except
  End;
  Try
    ECodigoFOR.Enabled  := Habilitar;
  Except
  End;
  Try
    ENumero.Enabled     := Habilitar;
  Except
  End;
  Try
    EOBS.Enabled        := Habilitar;
  Except
  End;
  Try
    ETotItem.Enabled    := Habilitar;
  Except
  End;
  Try
    ETipo.Enabled       := Habilitar;
  Except
  End;
end;

procedure TRecebimento.CancelaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(False);
  Estado:=0;
  CarregaDados;
end;

procedure TRecebimento.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
   Case Situacao of
    0: ESituacao.Text:='Aguardando';
    1: ESituacao.Text:='Recebido';
    2: ESituacao.Text:='Recusado';
    3: ESituacao.Text:='Cancelado';
   End;
  Except
  End;
 Try
   ECodigoREC.Text           :=IntToStr(CodigoREC);
   Except
  End;
  Try
   if DataE=0 then
     EDataE.Text:=''
   else
     EDataE.Text                :=FormatDateTime('dd/mm/yyyy', DataE);
   Except
  End;
  Try
   if DataS=0 then
     EDataS.Text:=''
   else
     EDataS.Text                :=FormatDateTime('dd/mm/yyyy', DataS);
   Except
  End;
  Try
   ECodigoFor.text       :=inttostr(CodigoFOR);
   Except
  End;
  Try
   ENumero.text       := Numero;
   Except
  End;
  Try
   EOBS.Text                 :=OBS;
   Except
  End;
  Try
   ETotItem.Text             :=IntToStr(TotItem);
   Except
  End;
  try
     ETipo.ItemIndex:=Tipo;
  except
  end;
  try
     ECncOrigem.KeyValue:=CNC_ORIGEM;
  except
  end;
  try
     ECODOrigem.Text:=IntToStr(COD_ORIGEM);
  except
  end;
end;

constructor TRecebimento.Create(AOwner: TComponent);
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

function TRecebimento.Deletar(CdCNC, CdREC: Integer):Boolean;
begin
  If not(localizarCod(CdREC, CdCNC)) Then
  Begin
    Result := False;
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        begin
          Try
           ECodigoREC.Clear;
           Except
          End;
          Try
           ESituacao.Text := '';
           Except
          End;
          Try
           EOBS.Clear;
           Except
          End;
          Try
           ETotItem.Clear;
           Except
          End;
        end;
      end
      else
        Result := False;
    Except
      Result := False;
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TRecebimento.Destroy;
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

function TRecebimento.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem :String;
  aux:TDataSetNotifyEvent;
begin
  mensagem := '';
  if not ECNCOrigem.KeyValue >= 0 then
    mensagem := mensagem + 'Centro de Custo de Origem inválido!'+#13;
  if ENumero.Text = '' then
    mensagem := mensagem + 'Número do Documento inválido!'+#13;
  if ECodOrigem.Text = '' then
    mensagem := mensagem + 'Código de Origem inválido!'+#13;
  if not VerificaDataBranco(EDataE.Text) then
    mensagem := mensagem + 'Data de Entrada inválida!'+#13;
  if not VerificaDataBranco(EDataS.Text) then
    mensagem := mensagem + 'Data de Saída inválida!'+#13;
  if not VerificaInteiro(ECodigoFOR.Text) then
    mensagem := mensagem + 'Código do Fornecedor inválido!'+#13;
  if mensagem <> '' then
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
      If Inserirauto then
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
      cod:=codigoREC;
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
    CarregaDados;
  end;
end;

{ Insere um Recebimento }
function TRecebimento.Inserir(CdREC, CdCNC, CdPRC, PSituacao, PTotItem, PTipo, PCNC_Origem, PCd_Origem: Integer; POBS: String;CdFOR:integer; PDtS,PDtE:TDatetime;PNum:String):Boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdRec=0 then
    Cod    := ProximoCodigo('REC_CODIGO')
  else
    Cod    := CdREC;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      Insert;
      CodigoREC      := Cod;
      CodigoFor      := CdFor;
      CodigoPRC      := CdPRC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := CConfiguracao.DataHora;
      DataS          := PDtS;
      DataE          := PDtE;
      Numero         := PNum;
      CodigoCNC      := CdCNC;
      Data           := CConfiguracao.Data;
      Situacao       := PSituacao;
      OBS            := POBS;
      TotItem        := PTotItem;
      Tipo           := PTipo;
      CNC_Origem     := PCNC_Origem;
      Cod_Origem     := PCd_Origem;

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

function TRecebimento.InserirAuto:Boolean;
begin
  try
    append;
    try
      codigocnc   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
       DataS := strtodatetime(EDataS.Text);
    except
    end;
    try
       DataE := strtodatetime(EDataE.Text);
    except
    end;
    try
       Numero := ENumero.Text;
    except
    end;
    try
       CodigoFOR := strtoint(ECodigoFOR.Text);
    except
    end;
    try
      CodigoREC   := SCodigo;
    except
    end;
    try
       Data := EData.date;
    except
    end;
    try
       Situacao := 0;
    except
    end;
    try
       TotItem := StrToInt(ETotItem.Text);
    except
    end;

    try
       Tipo := ETipo.ItemIndex;
    except
    end;
    try
       CNC_ORIGEM := ECncOrigem.KeyValue;
    except
    end;
    try
       COD_ORIGEM := StrToInt(ECODOrigem.Text);
    except
    end;

    try
      Post;
      result:=True;

    except
      result:=False;
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

{ Localiza um Recebimento }
function TRecebimento.LocalizarCod(CdREC, CdCNC: Integer): Boolean;
begin
  If (CdREC<>CodigoREC) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; REC_CODIGO', vararrayof([CdCNC, CdREC]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TRecebimento.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TRecebimento.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  ProximoCodigo('REC_CODIGO');
  Try
    EDataE.Clear;
  Except
  End;
  Try
    EDataS.Clear;
  Except
  End;
  Try
    ECodigoFOR.Clear;
  Except
  End;
  Try
    ENumero.Clear;
  Except
  End;
  Try
    ESituacao.Text := '';
  Except
  End;
  Try
    EOBS.Clear;
  Except
  End;
  Try
    ETotItem.Clear;
  Except
  End;
  Try
    ECodOrigem.Clear;
  Except
  End;
  TRY
    ETipo.ItemIndex := 1;
  except
  end;
  AtualizaControles(True);
  Estado:=1;
end;

function TRecebimento.deletarauto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    Result := Delete;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
