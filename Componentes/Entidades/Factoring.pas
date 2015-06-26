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
unit Factoring;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Windows, Funcoes, 
     Variants;

type
  TFactoring = class(TSQuery)
    private
      { Private fields of TFactoring }
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoFCT }
        FCodigoFCT : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EClienteCNC }
        FEClienteCNC : TEdit;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoFCT }
        FECodigoFCT : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EJuros }
        FEJuros : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EOutrasTaxas }
        FEOutrasTaxas : TEdit;
        { Storage for property EQuantidadeCheques }
        FEQuantidadeCheques : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETotalEnviado }
        FETotalEnviado : TEdit;
        { Storage for property ETotalRecebido }
        FETotalRecebido : TEdit;
        { Storage for property Juros }
        FJuros : Double;
        { Storage for property MaquinaFCT }
        FMaquinaFCT : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property OutrasTaxas }
        FOutrasTaxas : Double;
        { Storage for property QuantidadeCheques }
        FQuantidadeCheques : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TotalEnviado }
        FTotalEnviado : Double;
        { Storage for property TotalRecebido }
        FTotalRecebido : Double;

      { Private methods of TFactoring }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Read method for property CodigoFCT }
        function GetCodigoFCT : Integer;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property Juros }
        function GetJuros : Double;
        { Read method for property MaquinaFCT }
        function GetMaquinaFCT : Integer;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property OutrasTaxas }
        function GetOutrasTaxas : Double;
        { Read method for property QuantidadeCheques }
        function GetQuantidadeCheques : Integer;
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Read method for property TotalEnviado }
        function GetTotalEnviado : Double;
        { Read method for property TotalRecebido }
        function GetTotalRecebido : Double;

    protected
      { Protected fields of TFactoring }

      { Protected methods of TFactoring }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TFactoring }

      { Public methods of TFactoring }
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
        function LocalizarCod(CdCNC,CdFCT:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TFactoring }
        property ClienteCNC : Integer read GetClienteCNC write FClienteCNC;
        property CodigoCLI : Integer read GetCodigoCLI write FCodigoCLI;
        property CodigoFCT : Integer read GetCodigoFCT write FCodigoFCT;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property EClienteCNC : TEdit read FEClienteCNC write FEClienteCNC;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoFCT : TEdit read FECodigoFCT write FECodigoFCT;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EJuros : TEdit read FEJuros write FEJuros;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EOutrasTaxas : TEdit read FEOutrasTaxas write FEOutrasTaxas;
        property EQuantidadeCheques : TEdit
             read FEQuantidadeCheques write FEQuantidadeCheques;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETotalEnviado : TEdit
             read FETotalEnviado write FETotalEnviado;
        property ETotalRecebido : TEdit
             read FETotalRecebido write FETotalRecebido;
        property Juros : Double read GetJuros write FJuros;
        property MaquinaFCT : Integer read GetMaquinaFCT write FMaquinaFCT;
        property OBS : String read GetOBS write FOBS;
        property OutrasTaxas : Double read GetOutrasTaxas write FOutrasTaxas;
        property QuantidadeCheques : Integer
             read GetQuantidadeCheques write FQuantidadeCheques;
        property Situacao : Integer read GetSituacao write FSituacao;
        property TotalEnviado : Double
             read GetTotalEnviado write FTotalEnviado;
        property TotalRecebido : Double
             read GetTotalRecebido write FTotalRecebido;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TFactoring with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TFactoring]);
end;

{ Method to set variable and property values and create objects }
procedure TFactoring.AutoInitialize;
begin
     FEClienteCNC := nil;
     FECodigoCLI := nil;
     FECodigoFCT := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEJuros := nil;
     FEOBS := nil;
     FEOutrasTaxas := nil;
     FEQuantidadeCheques := nil;
     FESituacao := nil;
     FETotalEnviado := nil;
     FETotalRecebido := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TFactoring.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoFCT then
        FECodigoFCT := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEJuros then
        FEJuros := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEOutrasTaxas then
        FEOutrasTaxas := nil;
     if AComponent = FEQuantidadeCheques then
        FEQuantidadeCheques := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETotalEnviado then
        FETotalEnviado := nil;
     if AComponent = FETotalRecebido then
        FETotalRecebido := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TFactoring.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ClienteCNC }
function TFactoring.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCLI }
function TFactoring.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoFCT }
function TFactoring.GetCodigoFCT : Integer;
begin
  try
    Result := Self.fieldByName('FCT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DataAlterado }
function TFactoring.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('FCT_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataCadastro }
function TFactoring.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('FCT_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property Juros }
function TFactoring.GetJuros : Double;
begin
  try
    Result := Self.fieldByName('FCT_JUROS').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property MaquinaFCT }
function TFactoring.GetMaquinaFCT : Integer;
begin
  try
    Result := Self.fieldByName('FCT_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property OBS }
function TFactoring.GetOBS : String;
begin
  try
    Result := Self.fieldByName('FCT_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property OutrasTaxas }
function TFactoring.GetOutrasTaxas : Double;
begin
  try
    Result := Self.fieldByName('FCT_OUTRAS_TAXAS').asFloat; //Real
  except
    result:= 0;
  end;
end;

{ Read method for property QuantidadeCheques }
function TFactoring.GetQuantidadeCheques : Integer;
begin
  try
    Result := Self.fieldByName('FCT_QUANTIDADE_CHEQUES').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Situacao }
function TFactoring.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('FCT_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property TotalEnviado }
function TFactoring.GetTotalEnviado : Double;
begin
  try
    Result := Self.fieldByName('FCT_TOTAL_ENVIADO').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property TotalRecebido }
function TFactoring.GetTotalRecebido : Double;
begin
  try
    Result := Self.fieldByName('FCT_TOTAL_RECEBIDO').asFloat;
  except
    result:= 0;
  end;
end;

function TFactoring.AlterarAuto:Boolean;
begin
  Result:=false;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE '+Tabela+' SET '+
      ' CNC_ORIGEM='         +IntToStr(CentroDeCusto)+
      ',USU_CODIGO='         +IntToStr(CConfiguracao.CodigoUSU)+
      ',FCT_MAQUINA='        +IntToStr(Maquina)+
      ',FCT_DT_ALTERADO="'   +MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',FCT_QUANTIDADE_CHEQUES='+EQuantidadeCheques.Text+
      ',FCT_TOTAL_ENVIADO='  +VirgPonto(ETotalEnviado.Text)+
      ',FCT_JUROS='          +VirgPonto(EJuros.Text)+
      ',FCT_OUTRAS_TAXAS='   +VirgPonto(EOutrasTaxas.Text)+      
      ',FCT_TOTAL_RECEBIDO=' +VirgPonto(ETotalRecebido.Text)+
      ',FCT_OBSERVACAO="'    +EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
      ' AND FCT_CODIGO='+IntToStr(CodigoFCT));
    Result:=True;
  except
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TFactoring.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled        :=not Habilitar;
  except
  end;
  try
    EClienteCNC.Enabled    := Habilitar;
  except
  end;
  try
    ECodigoCLI.Enabled     := Habilitar;
  except
  end;
  try
    EJuros.Enabled         := Habilitar;
  except
  end;
  try
    EOutrasTaxas.Enabled   := Habilitar;
  except
  end;  
  try
    EOBS.Enabled           := Habilitar;
  except
  end;
end;

procedure TFactoring.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TFactoring.CarregaDados;
begin
  try
    ECodigoFCT.Text         := IntToStr(CodigoFCT);
  except
  end;
  try
    EClienteCNC.Text         := IntToStr(ClienteCNC);
  except
  end;
  try
    ECodigoCLI.Text          :=IntToStr(CodigoCLI);
  except
  end;
  try
    EQuantidadeCheques.Text  := IntToStr(QuantidadeCheques);
  except
  end;
  try
    ETotalRecebido.Text      :=format('%.2f',[TotalRecebido]);
  except
  end;
  try
    EJuros.Text              :=format('%.2f',[Juros]);
  except
  end;
  try
    EOutrasTaxas.Text        :=format('%.2f',[OutrasTaxas]);
  except
  end;  
  try
    ETotalEnviado.Text       :=format('%.2f',[TotalEnviado]);
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
      EDataAlterado.Clear;
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

constructor TFactoring.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'FACTORING';

     { Code to perform other tasks when the component is created }

end;

destructor TFactoring.Destroy;
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

function TFactoring.FinalizaEdicao:Boolean;
var
  Aux:TDataSetNotifyEvent;
  mensagem:string;
  Cod, CdCNC: integer;
begin
  Result := False;
  mensagem:='';
  if not VerificaInteiroBranco(EClienteCNC.Text) then
    mensagem:=mensagem+'Centro de Custo de Cliente inválido!';
  if not VerificaInteiroBranco(ECodigoCLI.Text) then
    mensagem:=mensagem+'Código do Cliente inválido!';
  if not VerificaInteiroBranco(EQuantidadeCheques.Text) then
    mensagem:=mensagem+'Quantidade de Cheques inválida!';
  if not VerificaFloatBranco(ETotalEnviado.Text) then
    mensagem:=mensagem+'Total Enviado inválido!';
  if not VerificaFloatBranco(EJuros.Text) then
    mensagem:=mensagem+'Juros inválido!';
  if not VerificaFloatBranco(ETotalRecebido.Text) then
    mensagem:=mensagem+'Total Recebido inválido!';
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
        Close;
        Open;
        LocalizarCod(CConfiguracao.CodigoCNC, SCodigo);
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    Else If Estado=2 then
    Begin
      Cod := CodigoFCT;
      CdCNC := CodigoCNC;
      If Alterarauto then
      Begin
        Result := True;
        Close;
        Open;
        LocalizarCod(CdCNC, Cod);
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
    AfterScroll:=aux;
    CarregaDados;
  end;
end;

function TFactoring.InserirAuto:Boolean;
begin
  Result := False;
  try
    ExecutaSQL(CConfiguracao.QueryComandos, 'INSERT '+Tabela+
      '(CNC_ORIGEM,CNC_CODIGO,FCT_MAQUINA,FCT_CODIGO,USU_CODIGO '+
      ',FCT_DT_CADASTRO,CNC_CLIENTE,CLI_CODIGO '+
      ',FCT_QUANTIDADE_CHEQUES '+
      ',FCT_TOTAL_ENVIADO,FCT_JUROS,FCT_OUTRAS_TAXAS '+
      ',FCT_TOTAL_RECEBIDO,FCT_SITUACAO,FCT_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(CConfiguracao.CodigoCNC)+
      ', '+IntToStr(Maquina)+
      ', '+IntToStr(SCodigo)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+EClienteCNC.Text+
      ', '+ECodigoCLI.Text+
      ', '+EQuantidadeCheques.Text+
      ', '+VirgPonto(ETotalEnviado.Text)+
      ', '+VirgPonto(EJuros.Text)+
      ', '+VirgPonto(EOutrasTaxas.Text)+      
      ', '+VirgPonto(ETotalRecebido.Text)+
      ',0'+
      ',"'+EOBS.Text+'") ');
    result:=True;
  except
    ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TFactoring.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoFCT.Clear;
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
      EClienteCNC.Text := IntToStr(CConfiguracao.CodigoCNC)
    else
      EClienteCNC.Text := '1';
  except
  end;
  try
    ECodigoCLI.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EQuantidadeCheques.Clear
    else
      EQuantidadeCheques.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      ETotalEnviado.Clear
    else
      ETotalEnviado.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EJuros.Clear
    else
      EJuros.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EOutrasTaxas.Clear
    else
      EOutrasTaxas.Text := '0,00';
  except
  end;  
  try
    if Estado <> 1 then
      ETotalRecebido.Clear
    else
      ETotalRecebido.Text := '0,00';
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
function TFactoring.LocalizarCod(CdCNC,CdFCT:Integer):Boolean;
begin
  If (CdFCT<>CodigoFCT) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;FCT_CODIGO', vararrayof([CdCNC,CdFCT]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TFactoring.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
end;

procedure TFactoring.PreparaInsercao;
begin
  ProximoCodigo('FCT_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TFactoring.deletarauto:Boolean;
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
