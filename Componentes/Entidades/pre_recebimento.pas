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
unit Pre_Recebimento;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Comctrls, Variants;

type
  TPre_Recebimento = class(TSQuery)
    private
      { Private fields of TPre_Recebimento }
        { Storage for property CNC_Origem }
        FCNC_Origem : Integer;
        { Storage for property Cod_Origem }
        FCod_Origem : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoREC }
        FCodigoREC : Integer;
        { Storage for property Data }
        FData : Tdatetime;
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
        { Storage for property NotaFiscal }
        FNotaFiscal : Integer;
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

      { Private methods of TPre_Recebimento }
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
        { Read method for property CodigoREC }
        function GetCodigoREC : Integer;
        { Write method for property CodigoREC }
        procedure SetCodigoREC(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property DataE }
        function GetDataE : TDateTime;
        { Write method for property DataE }
        procedure SetDataE(Value : TDateTime);
        { Read method for property DataS }
        function GetDataS : TDateTime;
        { Write method for property DataS }
        procedure SetDataS(Value : TDateTime);
        { Read method for property NotaFiscal }
        function GetNotaFiscal : Integer;
        { Write method for property NotaFiscal }
        procedure SetNotaFiscal(Value : Integer);
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
      { Protected fields of TPre_Recebimento }

      { Protected methods of TPre_Recebimento }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TPre_Recebimento }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TPre_Recebimento }
        { Altera um Recebimento }
        function Alterar(CdCNC, CdREC, PSituacao, PTotItem, PNota: Integer; PData:TDateTime; POBS: String;CdFOR:integer;PDtS,PDtE:TDatetime;PNum:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdREC: Integer):Boolean;
        destructor Destroy; override;
        procedure FinalizaEdicao;
        { Insere um Recebimento }
        function Inserir(CdREC, CdCNC, PSituacao, PTotItem, PTipo, PCNC_Origem, PCd_Origem, PNota: Integer; POBS: String;CdFOR:integer;PDt,PDtS,PDtE:TDatetime;PNum:String):Boolean;
        function InserirAuto:Boolean;
        { Localiza um Recebimento }
        function LocalizarCod(CdREC, CdCNC: Integer): Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TPre_Recebimento }
        property CNC_Origem : Integer read GetCNC_Origem write SetCNC_Origem;
        property Cod_Origem : Integer read GetCod_Origem write SetCod_Origem;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        { Código do Recebimento }
        property CodigoREC : Integer read GetCodigoREC write SetCodigoREC;
        property Data : Tdatetime read GetData write SetData;
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
        property NotaFiscal : Integer read GetNotaFiscal write SetNotaFiscal;
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
     { Register TPre_Recebimento with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TPre_Recebimento]);
end;

{ Method to set variable and property values and create objects }
procedure TPre_Recebimento.AutoInitialize;
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
procedure TPre_Recebimento.Notification(AComponent : TComponent; Operation : TOperation);
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
procedure TPre_Recebimento.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CNC_Origem }
function TPre_Recebimento.GetCNC_Origem : Integer;
begin
  try
    Result := Self.fieldByName('PRC_CNC_ORIGEM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CNC_Origem }
procedure TPre_Recebimento.SetCNC_Origem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRC_CNC_ORIGEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRC_CNC_ORIGEM"!');
    end;
end;

{ Read method for property Cod_Origem }
function TPre_Recebimento.GetCod_Origem : Integer;
begin
  try
    Result := Self.fieldByName('PRC_COD_ORIGEM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Cod_Origem }
procedure TPre_Recebimento.SetCod_Origem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRC_COD_ORIGEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRC_COD_ORIGEM"!');
    end;
end;

{ Read method for property CodigoCNC }
function TPre_Recebimento.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TPre_Recebimento.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFOR }
function TPre_Recebimento.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFOR }
procedure TPre_Recebimento.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property CodigoREC }
function TPre_Recebimento.GetCodigoREC : Integer;
begin
  try
    Result := Self.fieldByName('PRC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoREC }
procedure TPre_Recebimento.SetCodigoREC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRC_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TPre_Recebimento.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('PRC_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TPre_Recebimento.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRC_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRC_DATA"!');
  end;
end;

{ Read method for property DataE }
function TPre_Recebimento.GetDataE : TDateTime;
begin
  try
    Result := Self.fieldByName('PRC_DATA_EMISSAO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataE }
procedure TPre_Recebimento.SetDataE(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRC_DATA_EMISSAO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRC_DATA_EMISSAO"!');
  end;
end;

{ Read method for property DataS }
function TPre_Recebimento.GetDataS : TDateTime;
begin
  try
    Result := Self.fieldByName('PRC_DATA_SAIDA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataS }
procedure TPre_Recebimento.SetDataS(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRC_DATA_SAIDA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRC_DATA_SAIDA"!');
  end;
end;


{ Read method for property NotaFiscal }
function TPre_Recebimento.GetNotaFiscal : Integer;
begin
  try
    Result := Self.fieldByName('PRC_NOTA_FISCAL').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NotaFiscal }
procedure TPre_Recebimento.SetNotaFiscal(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRC_NOTA_FISCAL').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRC_NOTA_FISCAL"!');
  end;
end;

{ Read method for property Numero }
function TPre_Recebimento.GetNumero : String;
begin
  try
    Result := Self.fieldByName('PRC_NUM_DOC').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Numero }
procedure TPre_Recebimento.SetNumero(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRC_NUM_DOC').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRC_NUM_DOC"!');
  end;
end;

{ Read method for property OBS }
function TPre_Recebimento.GetOBS : String;
begin
  try
    Result := Self.fieldByName('PRC_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TPre_Recebimento.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRC_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRC_OBSERVACAO"!');
  end;
end;

{ Read method for property Situacao }
function TPre_Recebimento.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('PRC_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TPre_Recebimento.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRC_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRC_SITUACAO"!');
  end;
end;

{ Read method for property Tipo }
function TPre_Recebimento.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('PRC_TIPO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Tipo }
procedure TPre_Recebimento.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRC_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRC_TIPO"!');
    end;
end;

{ Read method for property TotItem }
function TPre_Recebimento.GetTotItem : Integer;
begin
  try
    Result := Self.fieldByName('PRC_TOT_ITEM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TotItem }
procedure TPre_Recebimento.SetTotItem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRC_TOT_ITEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRC_TOT-ITEM"!');
    end;
end;

{ Altera um Recebimento }
function TPre_Recebimento.Alterar(CdCNC, CdREC, PSituacao, PTotItem, PNota: Integer; PData:TDateTime; POBS: String;CdFOR:integer;PDtS,PDtE:TDatetime;PNum:String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdREC,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoFor      := CdFor;
      DataS          := PDtS;
      DataE          := PDtE;
      Numero         := PNum;
      Data           := PData;
      Situacao       := PSituacao;
      OBS            := POBS;
      TotItem        := PTotItem;
      NotaFiscal     := PNota;
      try
        Post;
        result:=true;
      except
        result:=false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
      result:=false;
    end;
  End;
end;

function TPre_Recebimento.AlterarAuto:Boolean;
begin
    try
      edit;
      try
         Data := EData.date;
      except
      end;

      try
         OBS := EOBS.Text;
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

procedure TPre_Recebimento.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 try
   EData.Enabled       :=Not Habilitar;
   Except
  End;
  Try
   ESituacao.Enabled   :=Habilitar;
   Except
  End;
  Try
   ECNCOrigem.Enabled   :=Habilitar;
   Except
  End;
  Try
   ECODOrigem.Enabled   :=Habilitar;
   Except
  End;
  Try
   EDataE.Enabled   :=Habilitar;
   Except
  End;
  Try
   EDataS.Enabled   :=Habilitar;
   Except
  End;
  Try
   ECodigoFOR.Enabled   :=Habilitar;
   Except
  End;
  Try
   ENumero.Enabled   :=Habilitar;
   Except
  End;
  Try
   EOBS.Enabled        :=Habilitar;
   Except
  End;
  Try
   ETotItem.Enabled    :=Habilitar;
   Except
  End;
  Try
   ETipo.Enabled    :=Habilitar;
   Except
  End;
end;

procedure TPre_Recebimento.CancelaEdicao;
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

procedure TPre_Recebimento.CarregaDados;
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

constructor TPre_Recebimento.Create(AOwner: TComponent);
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

function TPre_Recebimento.Deletar(CdCNC, CdREC: Integer):Boolean;
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

destructor TPre_Recebimento.Destroy;
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

procedure TPre_Recebimento.FinalizaEdicao;
var
  cod, cdcnc:Integer;
begin
  If Estado=1 then
  Begin
    Inserirauto;
    close;
    open;
    LocalizarCod(SCodigo,CodigoCNC);
  End
  Else If Estado=2 then
  Begin
    cod:=codigoREC;
    cdcnc:=codigoCNC;
    Alterarauto;
    close;
    open;
    LocalizarCod(cod, cdcnc);
  End;

  AtualizaControles(False);
  Estado:=0;
end;

{ Insere um Recebimento }
function TPre_Recebimento.Inserir(CdREC, CdCNC, PSituacao, PTotItem, PTipo, PCNC_Origem, PCd_Origem, PNota: Integer; POBS: String;CdFOR:integer;PDt,PDtS,PDtE:TDatetime;PNum:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdRec=0 then
    Cod    := ProximoCodigo('PRC_CODIGO')
  else
    Cod    := CdREC;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
     Insert;
     try
       CodigoREC      := Cod;
       CodigoFor      := CdFor;
       Data           := PDt;
       DataS          := PDtS;
       DataE          := PDtE;
       Numero         := PNum;
       CodigoCNC      := CdCNC;
       Situacao       := PSituacao;
       OBS            := POBS;
       TotItem        := PTotItem;
       Tipo           := PTipo;
       CNC_Origem     := PCNC_Origem;
       Cod_Origem     := PCd_Origem;
       NotaFiscal     := PNota;

       try
         Post;
         result:=true;
       except
         result:=false;
         Cancel;
         ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
       end;
     except
       result:=false;
       ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TPre_Recebimento.InserirAuto:Boolean;
Var
  Aux:TDataSetNotifyEvent;
begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
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
        AfterScroll:=Aux;
        CarregaDados;
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
function TPre_Recebimento.LocalizarCod(CdREC, CdCNC: Integer): Boolean;
begin
  If (CdREC<>CodigoREC) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; PRC_CODIGO', vararrayof([CdCNC, CdREC]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TPre_Recebimento.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TPre_Recebimento.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 ProximoCodigo('PRC_CODIGO');
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
  AtualizaControles(True);
  Estado:=1;
end;

function TPre_Recebimento.deletarauto:Boolean;
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
