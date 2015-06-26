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
unit Item_de_Factoring;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Windows, Funcoes, 
     Variants;

type
  TItem_de_Factoring = class(TSQuery)
    private
      { Private fields of TItem_de_Factoring }
        { Storage for property ChequeCNC }
        FChequeCNC : Integer;
        { Storage for property CodigoCHQ }
        FCodigoCHQ : Integer;
        { Storage for property CodigoFCT }
        FCodigoFCT : Integer;
        { Storage for property CodigoIFC }
        FCodigoIFC : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EChequeCNC }
        FEChequeCNC : TEdit;
        { Storage for property ECodigoCHQ }
        FECodigoCHQ : TEdit;
        { Storage for property ECodigoFCT }
        FECodigoFCT : TEdit;
        { Storage for property ECodigoIFC }
        FECodigoIFC : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property EValor }
        FEValor : TEdit;
        { Storage for property MaquinaIFC }
        FMaquinaIFC : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Valor }
        FValor : Double;

      { Private methods of TItem_de_Factoring }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ChequeCNC }
        function GetChequeCNC : Integer;
        { Read method for property CodigoCHQ }
        function GetCodigoCHQ : Integer;
        { Read method for property CodigoFCT }
        function GetCodigoFCT : Integer;
        { Read method for property CodigoIFC }
        function GetCodigoIFC : Integer;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property MaquinaIFC }
        function GetMaquinaIFC : Integer;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Read method for property Valor }
        function GetValor : Double;

    protected
      { Protected fields of TItem_de_Factoring }

      { Protected methods of TItem_de_Factoring }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_de_Factoring }

      { Public methods of TItem_de_Factoring }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grau }
        function LocalizarCod(CdCNC,CdIFC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_de_Factoring }
        property ChequeCNC : Integer read GetChequeCNC write FChequeCNC;
        property CodigoCHQ : Integer read GetCodigoCHQ write FCodigoCHQ;
        property CodigoFCT : Integer read GetCodigoFCT write FCodigoFCT;
        property CodigoIFC : Integer read GetCodigoIFC write FCodigoIFC;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property EChequeCNC : TEdit read FEChequeCNC write FEChequeCNC;
        property ECodigoCHQ : TEdit read FECodigoCHQ write FECodigoCHQ;
        property ECodigoFCT : TEdit read FECodigoFCT write FECodigoFCT;
        property ECodigoIFC : TEdit read FECodigoIFC write FECodigoIFC;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EOBS : TEdit read FEOBS write FEOBS;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property EValor : TEdit read FEValor write FEValor;
        property MaquinaIFC : Integer read GetMaquinaIFC write FMaquinaIFC;
        property OBS : String read GetOBS write FOBS;
        property Situacao : Integer read GetSituacao write FSituacao;
        property Valor : Double read GetValor write FValor;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Factoring with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Factoring]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Factoring.AutoInitialize;
begin
     FEChequeCNC := nil;
     FECodigoCHQ := nil;
     FECodigoFCT := nil;
     FECodigoIFC := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEOBS := nil;
     FESituacao := nil;
     FEValor := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_de_Factoring.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEChequeCNC then
        FEChequeCNC := nil;
     if AComponent = FECodigoCHQ then
        FECodigoCHQ := nil;
     if AComponent = FECodigoFCT then
        FECodigoFCT := nil;
     if AComponent = FECodigoIFC then
        FECodigoIFC := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FEValor then
        FEValor := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Factoring.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ChequeCNC }
function TItem_de_Factoring.GetChequeCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CHEQUE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCHQ }
function TItem_de_Factoring.GetCodigoCHQ : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoFCT }
function TItem_de_Factoring.GetCodigoFCT : Integer;
begin
  try
    Result := Self.fieldByName('FCT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoIFC }
function TItem_de_Factoring.GetCodigoIFC : Integer;
begin
  try
    Result := Self.fieldByName('IFC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DataAlterado }
function TItem_de_Factoring.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('IFC_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataCadastro }
function TItem_de_Factoring.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('IFC_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property MaquinaIFC }
function TItem_de_Factoring.GetMaquinaIFC : Integer;
begin
  try
    Result := Self.fieldByName('FCT_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property OBS }
function TItem_de_Factoring.GetOBS : String;
begin
  try
    Result := Self.fieldByName('IFC_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Situacao }
function TItem_de_Factoring.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('IFC_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Valor }
function TItem_de_Factoring.GetValor : Double;
begin
  try
    Result := Self.fieldByName('IFC_VALOR').asFloat;
  except
    result:= 0;
  end;
end;

function TItem_de_Factoring.AlterarAuto:Boolean;
begin
  Result:=false;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE '+Tabela+' SET '+
      ' CNC_ORIGEM='         +IntToStr(CentroDeCusto)+
      ',USU_CODIGO='         +IntToStr(CConfiguracao.CodigoUSU)+
      ',IFC_MAQUINA='        +IntToStr(Maquina)+
      ',IFC_DT_ALTERADO="'   +MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',CNC_CHEQUE='         +EChequeCNC.Text+
      ',CHQ_CODIGO='         +ECodigoCHQ.Text+
      ',IFC_VALOR='          +VirgPonto(EValor.Text)+
      ',IFC_OBSERVACAO="'    +EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
      ' AND IFC_CODIGO='+IntToStr(CodigoIFC));
    Result:=True;
  except
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TItem_de_Factoring.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled        :=not Habilitar;
  except
  end;
  try
    EChequeCNC.Enabled    := Habilitar;
  except
  end;
  try
    ECodigoCHQ.Enabled     := Habilitar;
  except
  end;
  try
    EOBS.Enabled           := Habilitar;
  except
  end;
end;

procedure TItem_de_Factoring.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TItem_de_Factoring.CarregaDados;
begin
  try
    ECodigoIFC.Text         := IntToStr(CodigoFCT);
  except
  end;
  try
    EChequeCNC.Text         := IntToStr(ChequeCNC);
  except
  end;
  try
    ECodigoCHQ.Text         := IntToStr(CodigoCHQ);
  except
  end;
  try
    EValor.Text      :=format('%.2f',[Valor]);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text        := FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text        := FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    ESituacao.ItemIndex         := Situacao;
  except
  end;
  try
    EOBS.Text                   := OBS;
  except
  end;
end;

constructor TItem_de_Factoring.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ITEM_DE_FACTORING';

     { Code to perform other tasks when the component is created }

end;

destructor TItem_de_Factoring.Destroy;
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

function TItem_de_Factoring.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem:='';
  if not VerificaInteiroBranco(EChequeCNC.Text) then
    mensagem:=mensagem+'Centro de Custo do Cheque inválido!';
  if not VerificaInteiroBranco(ECodigoCHQ.Text) then
    mensagem:=mensagem+'Código do Cheque inválido!';
  if not VerificaFloatBranco(EValor.Text) then
    mensagem:=mensagem+'Valor inválido!';
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      If Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(CConfiguracao.CodigoCNC, SCodigo);
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoIFC;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(CConfiguracao.CodigoCNC, cod);
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
    AfterScroll:=aux;
    CarregaDados;
  end;
end;

function TItem_de_Factoring.InserirAuto:Boolean;
begin
  Result := False;
  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT FCT_CODIGO '+
      ' FROM CHEQUE '+
      ' WHERE CNC_CODIGO='+EChequeCNC.Text+
      ' AND CHQ_CODIGO='+ECodigoCHQ.Text+
      ' AND FCT_CODIGO>0 ';
    Open;
    if not isEmpty then
    Begin
      ShowMessage('Cheque em outro Envio ao Factoring '+FieldByName('FCT_CODIGO').asString);
      Exit;
    end;
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos, 'INSERT '+Tabela+
      '(CNC_ORIGEM,CNC_CODIGO,FCT_CODIGO,IFC_CODIGO,USU_CODIGO '+
      ',IFC_DT_CADASTRO,CNC_CHEQUE,CHQ_CODIGO '+
      ',IFC_VALOR,IFC_SITUACAO,IFC_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(CConfiguracao.CodigoCNC)+
      ', '+ECodigoFCT.Text+
      ', '+IntToStr(SCodigo)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+EChequeCNC.Text+
      ', '+ECodigoCHQ.Text+
      ', '+VirgPonto(EValor.Text)+
      ',0'+
      ',"'+EOBS.Text+'") ');
    result:=True;
  except
    ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TItem_de_Factoring.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoIFC.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text  := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    if CConfiguracao.Empresa <> 3 then
      EChequeCNC.Text := IntToStr(CConfiguracao.CodigoCNC)
    else
      EChequeCNC.Text := '1';
  except
  end;
  try
    ECodigoCHQ.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EValor.Clear
    else
      EValor.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      ESituacao.ItemIndex:=-1
    else
      ESituacao.ItemIndex:=0;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
end;

{ Localiza um Grau }
function TItem_de_Factoring.LocalizarCod(CdCNC,CdIFC:Integer):Boolean;
begin
  If (CdIFC<>CodigoIFC) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;IFC_CODIGO', vararrayof([CdCNC,CdIFC]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_de_Factoring.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
end;

procedure TItem_de_Factoring.PreparaInsercao;
begin
  ProximoCodigo('IFC_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TItem_de_Factoring.deletarauto:Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      result:=true;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
