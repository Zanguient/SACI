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
unit Atendimento_por_Vendedor;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, 
     Funcoes;

type
  TAtendimento_por_Vendedor = class(TSQuery)
    private
      { Private fields of TAtendimento_por_Vendedor }
        { Storage for property Atendimentos }
        FAtendimentos : Integer;
        { Storage for property CodigoAPV }
        FCodigoAPV : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EAtendimentos }
        FEAtendimentos : TEdit;
        { Storage for property ECodigoAPV }
        FECodigoAPV : TEdit;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComboBox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TAtendimento_por_Vendedor }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Atendimentos }
        function GetAtendimentos : Integer;
        { Read method for property CodigoAPV }
        function GetCodigoAPV : Integer;
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property Situacao }
        function GetSituacao : Integer;

    protected
      { Protected fields of TAtendimento_por_Vendedor }

      { Protected methods of TAtendimento_por_Vendedor }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TAtendimento_por_Vendedor }

      { Public methods of TAtendimento_por_Vendedor }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdAPV:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Atendimento por Vendedor }
        function LocalizarCod(CdCNC,CdAPV:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TAtendimento_por_Vendedor }
        property Atendimentos : Integer
             read GetAtendimentos write FAtendimentos;
        { Código do Atendimento_por_Vendedor }
        property CodigoAPV : Integer read GetCodigoAPV write FCodigoAPV;
        property CodigoFUN : Integer read GetCodigoFUN write FCodigoFUN;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property EAtendimentos : TEdit
             read FEAtendimentos write FEAtendimentos;
        property ECodigoAPV : TEdit read FECodigoAPV write FECodigoAPV;
        property ECodigoFUN : TDBLookupComboBox
             read FECodigoFUN write FECodigoFUN;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EOBS : TEdit read FEOBS write FEOBS;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property OBS : String read GetOBS write FOBS;
        property Situacao : Integer read GetSituacao write FSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TAtendimento_por_Vendedor with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TAtendimento_por_Vendedor]);
end;

{ Method to set variable and property values and create objects }
procedure TAtendimento_por_Vendedor.AutoInitialize;
begin
     FEAtendimentos := nil;
     FECodigoAPV := nil;
     FECodigoFUN := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEOBS := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TAtendimento_por_Vendedor.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAtendimentos then
        FEAtendimentos := nil;
     if AComponent = FECodigoAPV then
        FECodigoAPV := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TAtendimento_por_Vendedor.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Atendimentos }
function TAtendimento_por_Vendedor.GetAtendimentos : Integer;
begin
  try
    Result := Self.fieldByName('APV_ATENDIMENTOS').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoAPV }
function TAtendimento_por_Vendedor.GetCodigoAPV : Integer;
begin
  try
    Result := Self.fieldByName('APV_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoFUN }
function TAtendimento_por_Vendedor.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DataAlterado }
function TAtendimento_por_Vendedor.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('APV_DT_ALTERADO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataCadastro }
function TAtendimento_por_Vendedor.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('APV_DT_CADASTRO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property OBS }
function TAtendimento_por_Vendedor.GetOBS : String;
begin
  try
    Result := Self.fieldByName('APV_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Situacao }
function TAtendimento_por_Vendedor.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('APV_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

function TAtendimento_por_Vendedor.AlterarAuto:Boolean;
var
  CdCNC, CdAPV: integer;
  sDetalhes: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdAPV := CodigoAPV;
  sDetalhes := sDetalhes+'FUN:'+IntToStr(ECodigoFUN.KeyValue)+
                         ' Atendimentos:'+EAtendimentos.Text+
                         ' Sit:'+IntToStr(ESituacao.ItemIndex)+
                         ' OBS:'+EOBS.Text;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE ATENDIMENTO_POR_VENDEDOR SET '+
      ' USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',APV_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',APV_ATENDIMENTOS='+VirgPonto(EAtendimentos.Text)+
      ',APV_SITUACAO='+IntToStr(ESituacao.ItemIndex)+
      ',APV_OBSERVACAO="'+EObs.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND APV_CODIGO='+IntToStr(CdAPV));

    GeraLog(8540, CdCNC, CdAPV, sDetalhes);
    Result:=True;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TAtendimento_por_Vendedor.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    if estado <> 1 then
      ECodigoFUN.Enabled      := False
    else
      ECodigoFUN.Enabled      :=Habilitar;
  except
  end;
  try
    EAtendimentos.Enabled     :=Habilitar;
  except
  end;
  try
    EOBS.Enabled              :=Habilitar;
  except
  end;
end;

procedure TAtendimento_por_Vendedor.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TAtendimento_por_Vendedor.CarregaDados;
begin
  Try
    ECodigoAPV.Text           :=IntToStr(CodigoAPV);
  except
  end;
  try
    ECodigoFUN.KeyValue := CodigoFUN;
  except
  end;
  try
    EAtendimentos.Text           :=IntToStr(Atendimentos);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    ESituacao.ItemIndex     := Situacao;
  except
  end;
  try
    EOBS.Text                 :=OBS;
  except
  end;
end;

constructor TAtendimento_por_Vendedor.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ATENDIMENTO_POR_VENDEDOR';

     { Code to perform other tasks when the component is created }

end;

function TAtendimento_por_Vendedor.Deletar(CdCNC,CdAPV:Integer):Boolean;
var
  sDetalhes: string;
begin
  Result := False;
  If not(localizarCod(CdCNC,CdAPV)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      sDetalhes := sDetalhes+'FUN:'+IntToStr(ECodigoFUN.KeyValue)+
                           ' Atendimentos:'+EAtendimentos.Text+
                           ' Sit:'+IntToStr(ESituacao.ItemIndex)+
                           ' OBS:'+EOBS.Text;
      ExecutaSQL(CConfiguracao.QueryComandos,'DELETE FROM ATENDIMENTO_POR_VENDEDOR '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND APV_CODIGO='+IntToStr(CdAPV));    
      GeraLog(8550,CdCNC,CdAPV,sDetalhes);
      Result := True;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TAtendimento_por_Vendedor.Destroy;
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

function TAtendimento_por_Vendedor.FinalizaEdicao:Boolean;
var
  CdCNC, cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  If not VerificaInteiroBranco(EAtendimentos.Text) then
    mensagem:=mensagem+'Número de atendimentos inválido!'+#13;
  If mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    try
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
          CarregaDados;
        end;
      End
      Else If Estado=2 then
      Begin
        CdCNC := CodigoCNC;
        cod   := CodigoAPV;
        If Alterarauto then
        Begin
          Result := True;
          close;
          open;
          LocalizarCod(CdCNC, cod);
          Estado:=0;
          AtualizaControles(False);
          CarregaDados;
        end;
      End;
    finally
      AfterScroll:=Aux;
    end;
  end;
end;

function TAtendimento_por_Vendedor.InserirAuto:Boolean;
var
  CdCNC, CdAPV: integer;
  sDetalhes: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdAPV := sCodigo;
  sDetalhes := sDetalhes+'FUN:'+IntToStr(ECodigoFUN.KeyValue)+
                         ' Atendimentos:'+EAtendimentos.Text+
                         ' Sit:'+IntToStr(ESituacao.ItemIndex)+
                         ' OBS:'+EOBS.Text;
                         
  with CConfiguracao.QueryConsultas do
  Begin
    CLose;
    SQL.Text := 'SELECT APV_CODIGO '+
      ' FROM ATENDIMENTO_POR_VENDEDOR '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND FUN_CODIGO='+IntToStr(ECodigoFUN.KeyValue);
    Open;
    if not isEmpty then
      Raise exception.Create('O Nº de Atendimentos desse vendedor já foi cadastrado!');
  end;
  
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO ATENDIMENTO_POR_VENDEDOR '+
      '(CNC_ORIGEM, CNC_CODIGO, APV_CODIGO, USU_CODIGO, APV_DT_CADASTRO '+
      ',FUN_CODIGO,APV_ATENDIMENTOS,APV_SITUACAO,APV_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(CdCNC)+
      ', '+IntToStr(CdAPV)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+IntToStr(ECodigoFUN.KeyValue)+
      ', '+VirgPonto(EAtendimentos.Text)+
      ', '+IntToStr(ESituacao.ItemIndex)+
      ',"'+EObs.Text+'") ');


    GeraLog(8530, CdCNC, CdAPV, sDetalhes);
    result:=True;
  except
    ShowMessage('Não foi possível alterar registro corrente. ATENDIMENTOS POR VENDEDOR');
  end;
end;


procedure TAtendimento_por_Vendedor.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoAPV.Clear
    else
      ECodigoAPV.Text := IntToStr(SCodigo);
  except
  end;
  try
    ECodigoFUN.KeyValue := -1;
  except
  end;
  try
    EAtendimentos.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
  try
    if Estado <> 1 then
      ESituacao.itemIndex := -1
    else
      ESituacao.itemIndex := 0;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
end;

{ Localiza um Atendimento por Vendedor }
function TAtendimento_por_Vendedor.LocalizarCod(CdCNC,CdAPV:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  begin
    close;
    sql.Text:='SELECT * FROM ATENDIMENTO_POR_VENDEDOR '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND APV_CODIGO='+IntToStr(CdAPV);
    open;
    Result := (not IsEmpty);
  end;
end;

procedure TAtendimento_por_Vendedor.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
end;

procedure TAtendimento_por_Vendedor.PreparaInsercao;
begin
  ProximoCodigo('APV_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
