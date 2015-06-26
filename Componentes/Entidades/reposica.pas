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
unit Reposica;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, 
     Funcoes;

type
  TReposicao = class(TSQuery)
    private
      { Private fields of TReposicao }
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoREP }
        FCodigoREP : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoREP }
        FECodigoREP : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TReposicao }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Read method for property CodigoREP }
        function GetCodigoREP : Integer;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property Descricao }
        function GetDescricao : String;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property Situacao }
        function GetSituacao : Integer;

    protected
      { Protected fields of TReposicao }

      { Protected methods of TReposicao }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TReposicao }

      { Public methods of TReposicao }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdREP:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grupo }
        function LocalizarCod(CdCNC,CdREP:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TReposicao }
        property CodigoFOR : Integer read GetCodigoFOR write FCodigoFOR;
        property CodigoPRD : Integer read GetCodigoPRD write FCodigoPRD;
        { Código do Grupo }
        property CodigoREP : Integer read GetCodigoREP write FCodigoREP;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property Descricao : String read GetDescricao write FDescricao;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoFOR : TEdit read FECodigoFOR write FECodigoFOR;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoREP : TEdit read FECodigoREP write FECodigoREP;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EOBS : TEdit read FEOBS write FEOBS;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property OBS : String read GetOBS write FOBS;
        property Situacao : Integer read GetSituacao write FSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TReposicao with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TReposicao]);
end;

{ Method to set variable and property values and create objects }
procedure TReposicao.AutoInitialize;
begin
     FECodigoCNC := nil;
     FECodigoFOR := nil;
     FECodigoPRD := nil;
     FECodigoREP := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDescricao := nil;
     FEOBS := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TReposicao.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoREP then
        FECodigoREP := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TReposicao.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoFOR }
function TReposicao.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoPRD }
function TReposicao.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoREP }
function TReposicao.GetCodigoREP : Integer;
begin
  try
    Result := Self.fieldByName('REP_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DataAlterado }
function TReposicao.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('REP_DT_ALTERADO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataCadastro }
function TReposicao.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('REP_DT_CADASTRO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property Descricao }
function TReposicao.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('REP_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Read method for property OBS }
function TReposicao.GetOBS : String;
begin
  try
    Result := Self.fieldByName('REP_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Read method for property Situacao }
function TReposicao.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('REP_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

function TReposicao.AlterarAuto:Boolean;
var
  CdCNC, CdREP: integer;
  sDetalhe: string;
Begin
  result:=False;
  try
    CdCNC := CodigoCNC;
    CdREP := CodigoREP;
  except
    CdCNC := 0;
    CdREP := 0;
  end;

  sDetalhe := EDescricao.Text;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE REPOSICAO SET '+
      ' USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',REP_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',REP_DESCRICAO="'+EDescricao.Text+'" '+
      ',REP_SITUACAO='+IntToStr(ESituacao.ItemIndex)+
      ',REP_OBSERVACAO="'+EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND REP_CODIGO='+IntToStr(CdREP));

    GeraLog(8640,CdCNC, CdREP, sDetalhe);

    Result := True;
  except
    ShowMessage('Não foi possível alterar o registro Veículo!');
  End;
end;

procedure TReposicao.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    ECodigoCNC.Enabled        :=not Habilitar;
  except
  end;  
  try
    EDescricao.Enabled        :=Habilitar;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoFOR.Enabled        :=False
    else
      ECodigoFOR.Enabled        :=Habilitar;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoPRD.Enabled        :=False
    else
      ECodigoPRD.Enabled        :=Habilitar;
  except
  end;
  try
    EOBS.Enabled                :=Habilitar;
  except
  end;
end;

procedure TReposicao.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TReposicao.CarregaDados;
begin
  Try
    ECodigoREP.Text           :=IntToStr(CodigoREP);
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    ECodigoFOR.Text           :=IntToStr(CodigoFOR);
  except
  end;
  try
    ECodigoPRD.Text           :=IntToStr(CodigoPRD);
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

constructor TReposicao.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'REPOSICAO';

     { Code to perform other tasks when the component is created }

end;

function TReposicao.Deletar(CdCNC,CdREP:Integer):Boolean;
begin
  Result := False;
  If MessageDlg('Deseja excluir esse registro?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  If not(localizarCod(CdCNC,CdREP)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos, 'DELETE FROM VEICULO '+
        ' WHERE REP_CODIGO='+IntToStr(CdREP)+
        ' AND CNC_CODIGO='+IntToStr(CdCNC));
      GeraLog(8650, CdCNC, CdREP);
      Result := True;
      Close;
      Open;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TReposicao.Destroy;
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

function TReposicao.FinalizaEdicao:Boolean;
var
  CdCNC,cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  If EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  if not VerificaInteiroBranco(ECodigoFOR.Text) then
    mensagem:=mensagem+'Código do Fornecedor inválido!'+#13;
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto inválido!'+#13;
  If mensagem <> '' then
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
        LocalizarCod(CConfiguracao.CodigoCNC,SCodigo);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      CdCNC := CodigoCNC;
      cod:=codigoREP;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(CdCNC,cod);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TReposicao.InserirAuto:Boolean;
var
  CdREP: integer;
  sDetalhe: string;
begin
  result:=False;
  try
    CdREP := sCodigo;
  except
    CdREP := 0;
  end;

  sDetalhe := EDescricao.Text;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO REPOSICAO '+
      '(CNC_ORIGEM,CNC_CODIGO,REP_CODIGO,USU_CODIGO,REP_DT_CADASTRO '+
      ',REP_DESCRICAO,FOR_CODIGO,PRD_CODIGO '+
      ',REP_SITUACAO,REP_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(ECodigoCNC.KeyValue)+
      ', '+IntToStr(CdREP)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',"'+EDescricao.Text+'" '+
      ', '+ECodigoFOR.Text+
      ', '+ECodigoPRD.Text+
      ', '+IntToStr(ESituacao.ItemIndex)+
      ',"'+EOBS.Text+'") ');

    GeraLog(8630,CConfiguracao.CodigoCNC, CdREP, sDetalhe);
    Result := True;
  except
    ShowMessage('Não foi possível incluir o registro Veículo!');
  End;
end;

procedure TReposicao.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoREP.Clear
    else
      ECodigoREP.Text := IntToStr(SCodigo);
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    ECodigoFOR.Clear;
  except
  end;
  try
    ECodigoPRD.Clear;
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

{ Localiza um Grupo }
function TReposicao.LocalizarCod(CdCNC,CdREP:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  begin
    close;
    sql.Text:='SELECT * FROM REPOSICAO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND REP_CODIGO='+IntToStr(CdREP);
    open;
    Result := (not IsEmpty);
  end;
end;

procedure TReposicao.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
end;

procedure TReposicao.PreparaInsercao;
begin
  ProximoCodigo('REP_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
