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
unit Envia_Fornecedor;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Extctrls, Variants;

type
  TEnvia_Fornecedor = class(TSQuery)
    private
      { Private fields of TEnvia_Fornecedor }
        { Storage for property CodigoENF }
        FCodigoENF : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataEnviado }
        FDataEnviado : TDateTime;
        { Storage for property DataRecebido }
        FDataRecebido : TDateTime;
        { Storage for property ECodigoENF }
        FECodigoENF : TEdit;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TEdit;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataEnviado }
        FEDataEnviado : TMaskEdit;
        { Storage for property EDataRecebido }
        FEDataRecebido : TMaskEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EPedidoCNC }
        FEPedidoCNC : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property PedidoCNC }
        FPedidoCNC : Integer;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TEnvia_Fornecedor }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoENF }
        function GetCodigoENF : Integer;
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property DataEnviado }
        function GetDataEnviado : TDateTime;
        { Read method for property DataRecebido }
        function GetDataRecebido : TDateTime;
        { Read method for property Observacao }
        function GetObservacao : String;
        { Read method for property PedidoCNC }
        function GetPedidoCNC : Integer;
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Read method for property Situacao }
        function GetSituacao : Integer;

    protected
      { Protected fields of TEnvia_Fornecedor }

      { Protected methods of TEnvia_Fornecedor }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TEnvia_Fornecedor }

      { Public methods of TEnvia_Fornecedor }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TEnvia_Fornecedor }
        { Código do ítem de pedido de compra }
        property CodigoENF : Integer read GetCodigoENF write FCodigoENF;
        property CodigoFOR : Integer read GetCodigoFOR write FCodigoFOR;
        property CodigoPDV : Integer read GetCodigoPDV write FCodigoPDV;
        { Código de Produto }
        property CodigoPRD : Integer read GetCodigoPRD write FCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property DataEnviado : TDateTime
             read GetDataEnviado write FDataEnviado;
        property DataRecebido : TDateTime
             read GetDataRecebido write FDataRecebido;
        property ECodigoENF : TEdit read FECodigoENF write FECodigoENF;
        property ECodigoFOR : TEdit read FECodigoFOR write FECodigoFOR;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataEnviado : TMaskEdit
             read FEDataEnviado write FEDataEnviado;
        property EDataRecebido : TMaskEdit
             read FEDataRecebido write FEDataRecebido;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EPedidoCNC : TEdit read FEPedidoCNC write FEPedidoCNC;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property Observacao : String read GetObservacao write FObservacao;
        property PedidoCNC : Integer read GetPedidoCNC write FPedidoCNC;
        { Quantidade do ítem de pedido de compra }
        property Quantidade : Double read GetQuantidade write FQuantidade;
        property Situacao : Integer read GetSituacao write FSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TEnvia_Fornecedor with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TEnvia_Fornecedor]);
end;

{ Method to set variable and property values and create objects }
procedure TEnvia_Fornecedor.AutoInitialize;
begin
     FECodigoENF := nil;
     FECodigoFOR := nil;
     FECodigoPDV := nil;
     FECodigoPRD := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataEnviado := nil;
     FEDataRecebido := nil;
     FEObservacao := nil;
     FEPedidoCNC := nil;
     FEQuantidade := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TEnvia_Fornecedor.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoENF then
        FECodigoENF := nil;
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataEnviado then
        FEDataEnviado := nil;
     if AComponent = FEDataRecebido then
        FEDataRecebido := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEPedidoCNC then
        FEPedidoCNC := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TEnvia_Fornecedor.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoENF }
function TEnvia_Fornecedor.GetCodigoENF : Integer;
begin
  try
    Result := Self.fieldByName('ENF_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoFOR }
function TEnvia_Fornecedor.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoPDV }
function TEnvia_Fornecedor.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoPRD }
function TEnvia_Fornecedor.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    Result := 0;
  end;
end;

{ Read method for property DataAlterado }
function TEnvia_Fornecedor.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('ENF_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataCadastro }
function TEnvia_Fornecedor.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('ENF_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataEnviado }
function TEnvia_Fornecedor.GetDataEnviado : TDateTime;
begin
  try
    Result := Self.fieldByName('ENF_DT_ENVIADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataRecebido }
function TEnvia_Fornecedor.GetDataRecebido : TDateTime;
begin
  try
    Result := Self.fieldByName('ENF_DT_RECEBIDO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property Observacao }
function TEnvia_Fornecedor.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('ENF_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property PedidoCNC }
function TEnvia_Fornecedor.GetPedidoCNC : Integer;
begin
  try
    Result := Self.fieldByName('ENF_CNC_PEDIDO').asInteger;
  except
    Result := 0;
  end;
end;

{ Read method for property Quantidade }
function TEnvia_Fornecedor.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('ENF_QUANTIDADE').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Situacao }
function TEnvia_Fornecedor.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('ENF_SITUACAO').asInteger;
  except
    Result := 0;
  end;
end;

function TEnvia_Fornecedor.AlterarAuto:Boolean;
var
  CdCNC, CdCNCOrigem, CdENF: integer;
  sDetalhe: string;
begin
  Result:=false;
  CdCNC := CodigoCNC;
  CdCNCOrigem := CNCOrigem;
  CdENF := CodigoENF;
  sDetalhe := 'PDV:'+PreencheZero(2,EPedidoCNC.Text)+'-'+ECodigoPDV.Text+
             ' FOR:'+ECodigoFOR.Text+
             ' PRD:'+ECodigoPRD.Text+
             ' SIT:'+IntToStr(ESituacao.ItemIndex)+
             ' OBS:'+EObservacao.Text;

  //Não Altera Data de Enviado ou Recebido
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE ENVIA_FORNECEDOR SET '+
      ' USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',ENF_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',FOR_CODIGO='+ECodigoFOR.Text+
      ',ENF_CNC_PEDIDO='+EPedidoCNC.Text+
      ',PDV_CODIGO='+ECodigoPDV.Text+
      ',PRD_CODIGO='+ECodigoPRD.Text+
      ',ENF_QUANTIDADE='+VirgPonto(EQuantidade.Text)+
      ',ENF_SITUACAO='+IntToStr(ESituacao.ItemIndex)+
      ',ENF_OBSERVACAO="'+EObservacao.Text+'" '+
      ' WHERE CNC_ORIGEM='+IntToStr(CdCNCOrigem)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND ENF_CODIGO='+IntToStr(CdENF));

    GeraLog(8170,CdCNC,CdENF,sDetalhe);

    Result:=True;
  except
    ShowMessage('Não foi possível alterar registro corrente.');
  end;
end;

procedure TEnvia_Fornecedor.AtualizaControles(Habilitar:Boolean);
begin
  Try
    if Estado = 1 then
      ECodigoPRD.Enabled  := Habilitar
    else
      ECodigoPRD.Enabled  := False;
  Except
  End;
  Try
    ECodigoFOR.Enabled     := Habilitar;
  Except
  End;
  Try
    ECodigoPDV.Enabled     := Habilitar;
  Except
  End;
  Try
    EQuantidade.Enabled    := Habilitar;
  Except
  End;
  Try
    EObservacao.Enabled   := Habilitar;
  Except
  End;
end;

procedure TEnvia_Fornecedor.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TEnvia_Fornecedor.CarregaDados;
begin
  Try
    ECodigoENF.Text         :=IntToStr(CodigoENF);
  Except
  End;
  Try
    if DataCadastro > 0 then
      EDataCadastro.Text := DateTimeToStr(DataCadastro)
    else
      EDataCadastro.Clear;
  Except
  End;
  Try
    if DataAlterado > 0 then
      EDataAlterado.Text := DateTimeToStr(DataAlterado)
    else
      EDataAlterado.Clear;
  Except
  End;
  Try
    if DataEnviado > 0 then
      EDataEnviado.Text := DateTimeToStr(DataEnviado)
    else
      EDataEnviado.Clear;
  Except
  End;
  Try
    if DataRecebido > 0 then
      EDataRecebido.Text := DateTimeToStr(DataRecebido)
    else
      EDataRecebido.Clear;
  Except
  End;
  Try
    EcodigoFOR.Text         := IntToStr(CodigoFOR);
  Except
  End;
  Try
    EPedidoCNC.Text         := IntToStr(PedidoCNC);
  Except
  End;
  Try
    ECodigoPDV.Text         := IntToStr(CodigoPDV);
  Except
  End;
  Try
    ECodigoPRD.Text         := IntToStr(CodigoPRD);
  Except
  End;
  Try
    EQuantidade.Text        := Format('%.2f', [Quantidade]);
  Except
  End;
  Try
    ESituacao.ItemIndex     := Situacao;
  Except
  End;
  Try
    EObservacao.Text        := Observacao;
  Except
  End;
end;

constructor TEnvia_Fornecedor.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ENVIA_FORNECEDOR';

     { Code to perform other tasks when the component is created }

end;

destructor TEnvia_Fornecedor.Destroy;
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

function TEnvia_Fornecedor.FinalizaEdicao:Boolean;
var
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoFOR.text) then
    mensagem:=mensagem+'Código do Fornecedor digitado incorretamente!'+#13;
  if not VerificaInteiroBranco(EPedidoCNC.text) then
    mensagem:=mensagem+'CNC do Pedido digitado incorretamente!'+#13;
  if not VerificaInteiroBranco(ECodigoPDV.text) then
    mensagem:=mensagem+'Código do Pedido digitado incorretamente!'+#13;
  if not VerificaInteiroBranco(ECodigoPRD.text) then
    mensagem:=mensagem+'Código do Produto digitado incorretamente!'+#13;
  if not VerificaFloatBranco(EQuantidade.Text) then
    mensagem:= mensagem +'Quantidade digitada incorretamente!'+#13;
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    if StrToInt(ECodigoFOR.Text) <= 0 then
    Begin
      ShowMessage('Código do Fornecedor inválido!');
      Exit;
    end;
    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        AtualizaControles(False);
        Estado:=0;
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        Result := True;
        AtualizaControles(False);
        Estado:=0;
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TEnvia_Fornecedor.InserirAuto:Boolean;
var
  CdCNC, CdCNCOrigem, CdENF: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CConfiguracao.CodigoCNC;
  CdCNCOrigem := CentroDeCusto;
  CdENF := SCodigo;
  sDetalhe := 'PDV:'+PreencheZero(2,EPedidoCNC.Text)+'-'+ECodigoPDV.Text+
             ' PRD:'+ECodigoPRD.Text+
             ' SIT:'+IntToStr(ESituacao.ItemIndex)+
             ' OBS:'+EObservacao.Text;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT ENVIA_FORNECEDOR '+
      '(CNC_ORIGEM,CNC_CODIGO,ENF_CODIGO,USU_CODIGO,ENF_DT_CADASTRO '+
      ',FOR_CODIGO,ENF_CNC_PEDIDO,PDV_CODIGO,PRD_CODIGO,ENF_QUANTIDADE '+
      ',ENF_SITUACAO,ENF_OBSERVACAO) VALUES '+
      '( '+IntToStr(CdCNCOrigem)+
      ', '+IntToStr(CdCNC)+
      ', '+IntToStr(CdENF)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+      
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+ECodigoFOR.Text+
      ', '+EPedidoCNC.Text+
      ', '+ECodigoPDV.Text+
      ', '+ECodigoPRD.Text+
      ', '+VirgPonto(EQuantidade.Text)+
      ', '+IntToStr(ESituacao.ItemIndex)+
      ',"'+EObservacao.Text+'") ');

    result:=True;
    GeraLog(8160, CdCNC, CdENF, sDetalhe);
  except
    ShowMessage('Não foi possível alterar registro corrente.');
  end;
end;

procedure TEnvia_Fornecedor.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoENF.Clear;
  Except
  End;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear
  except
  end;
  try
    EDataEnviado.Clear
  except
  end;
  try
    EDataRecebido.Clear
  except
  end;        
  Try
    ECodigoFOR.Clear;
  Except
  End;
  Try
    EPedidoCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoPDV.Clear
    else
      ECodigoPDV.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoPRD.Clear
    else
      ECodigoPRD.Text := '0';
  Except
  End;
  Try
    EQuantidade.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 0;
  Except
  End;
  Try
    EObservacao.Clear;
  Except
  End;
end;

procedure TEnvia_Fornecedor.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
end;

procedure TEnvia_Fornecedor.PreparaInsercao;
begin
  ProximoCodigo('ENF_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TEnvia_Fornecedor.deletarauto:Boolean;
var
  CdCNC, CdENF: integer;
  sDetalhe: string;
begin
  Result:=False;
  CdCNC := CodigoCNC;
  CdENF := CodigoENF;
  sDetalhe := 'PDV:'+PreencheZero(2,PedidoCNC)+'-'+IntToStr(CodigoPDV)+
             ' FOR:'+IntToStr(CodigoFOR)+
             ' PRD:'+IntToStr(CodigoPRD)+
             ' SIT:'+IntToStr(Situacao)+
             ' OBS:'+Observacao;
  try
    if Delete then
    Begin
      GeraLog(8180, CdCNC, CdENF, sDetalhe);
      Result:=True;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
