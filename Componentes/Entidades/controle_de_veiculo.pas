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
unit Controle_de_Veiculo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, 
     Funcoes, Variants;

type
  TControle_de_Veiculo = class(TSQuery)
    private
      { Private fields of TControle_de_Veiculo }
        { Storage for property CodigoMTV }
        FCodigoMTV : Integer;
        { Storage for property CodigoVEI }
        FCodigoVEI : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataFinal }
        FDataFinal : TDateTime;
        { Storage for property DataInicial }
        FDataInicial : TDateTime;
        { Storage for property Detalhe }
        FDetalhe : String;
        { Storage for property ECodigoMTV }
        FECodigoMTV : TEdit;
        { Storage for property ECodigoVEI }
        FECodigoVEI : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataFinal }
        FEDataFinal : TMaskEdit;
        { Storage for property EDataInicial }
        FEDataInicial : TMaskEdit;
        { Storage for property EDetalhe }
        FEDetalhe : TEdit;
        { Storage for property EKilometragemFIM }
        FEKilometragemFIM : TEdit;
        { Storage for property EKilometragemINI }
        FEKilometragemINI : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EPlaca }
        FEPlaca : TMaskEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipo }
        FETipo : TComboBox;
        { Storage for property EValorTotal }
        FEValorTotal : TEdit;
        { Storage for property KilometragemFIM }
        FKilometragemFIM : Integer;
        { Storage for property KilometragemINI }
        FKilometragemINI : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Placa }
        FPlaca : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property ValorTotal }
        FValorTotal : Double;

      { Private methods of TControle_de_Veiculo }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoMTV }
        function GetCodigoMTV : Integer;
        { Read method for property CodigoVEI }
        function GetCodigoVEI : Integer;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property DataFinal }
        function GetDataFinal : TDateTime;
        { Read method for property DataInicial }
        function GetDataInicial : TDateTime;
        { Read method for property Detalhe }
        function GetDetalhe : String;
        { Read method for property KilometragemFIM }
        function GetKilometragemFIM : Integer;
        { Read method for property KilometragemINI }
        function GetKilometragemINI : Integer;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property Placa }
        function GetPlaca : String;
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Read method for property ValorTotal }
        function GetValorTotal : Double;

    protected
      { Protected fields of TControle_de_Veiculo }

      { Protected methods of TControle_de_Veiculo }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TControle_de_Veiculo }

      { Public methods of TControle_de_Veiculo }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdMTV:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grupo }
        function LocalizarCod(CdCNC, CdMTV:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TControle_de_Veiculo }
        { Código do }
        property CodigoMTV : Integer read GetCodigoMTV write FCodigoMTV;
        property CodigoVEI : Integer read GetCodigoVEI write FCodigoVEI;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property DataFinal : TDateTime read GetDataFinal write FDataFinal;
        property DataInicial : TDateTime
             read GetDataInicial write FDataInicial;
        property Detalhe : String read GetDetalhe write FDetalhe;
        property ECodigoMTV : TEdit read FECodigoMTV write FECodigoMTV;
        property ECodigoVEI : TEdit read FECodigoVEI write FECodigoVEI;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataFinal : TMaskEdit read FEDataFinal write FEDataFinal;
        property EDataInicial : TMaskEdit
             read FEDataInicial write FEDataInicial;
        property EDetalhe : TEdit read FEDetalhe write FEDetalhe;
        property EKilometragemFIM : TEdit
             read FEKilometragemFIM write FEKilometragemFIM;
        property EKilometragemINI : TEdit
             read FEKilometragemINI write FEKilometragemINI;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EPlaca : TMaskEdit read FEPlaca write FEPlaca;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipo : TComboBox read FETipo write FETipo;
        property EValorTotal : TEdit read FEValorTotal write FEValorTotal;
        property KilometragemFIM : Integer
             read GetKilometragemFIM write FKilometragemFIM;
        property KilometragemINI : Integer
             read GetKilometragemINI write FKilometragemINI;
        property OBS : String read GetOBS write FOBS;
        property Placa : String read GetPlaca write FPlaca;
        property Quantidade : Double read GetQuantidade write FQuantidade;
        property Situacao : Integer read GetSituacao write FSituacao;
        property Tipo : Integer read GetTipo write FTipo;
        property ValorTotal : Double read GetValorTotal write FValorTotal;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TControle_de_Veiculo with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TControle_de_Veiculo]);
end;

{ Method to set variable and property values and create objects }
procedure TControle_de_Veiculo.AutoInitialize;
begin
     FECodigoMTV := nil;
     FECodigoVEI := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataFinal := nil;
     FEDataInicial := nil;
     FEDetalhe := nil;
     FEKilometragemFIM := nil;
     FEKilometragemINI := nil;
     FEOBS := nil;
     FEPlaca := nil;
     FEQuantidade := nil;
     FESituacao := nil;
     FETipo := nil;
     FEValorTotal := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TControle_de_Veiculo.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoMTV then
        FECodigoMTV := nil;
     if AComponent = FECodigoVEI then
        FECodigoVEI := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataFinal then
        FEDataFinal := nil;
     if AComponent = FEDataInicial then
        FEDataInicial := nil;
     if AComponent = FEDetalhe then
        FEDetalhe := nil;
     if AComponent = FEKilometragemFIM then
        FEKilometragemFIM := nil;
     if AComponent = FEKilometragemINI then
        FEKilometragemINI := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEPlaca then
        FEPlaca := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
     if AComponent = FEValorTotal then
        FEValorTotal := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TControle_de_Veiculo.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoMTV }
function TControle_de_Veiculo.GetCodigoMTV : Integer;
begin
  try
    Result := Self.fieldByName('MTV_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoVEI }
function TControle_de_Veiculo.GetCodigoVEI : Integer;
begin
  try
    Result := Self.fieldByName('VEI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DataAlterado }
function TControle_de_Veiculo.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('MTV_DT_ALTERADO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataCadastro }
function TControle_de_Veiculo.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('MTV_DT_CADASTRO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataFinal }
function TControle_de_Veiculo.GetDataFinal : TDateTime;
begin
  try
    Result := Self.fieldByName('MTV_DT_FINAL').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataInicial }
function TControle_de_Veiculo.GetDataInicial : TDateTime;
begin
  try
    Result := Self.fieldByName('MTV_DT_INICIAL').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property Detalhe }
function TControle_de_Veiculo.GetDetalhe : String;
begin
  try
    Result := Self.fieldByName('MTV_DETALHE').asString;
  except
    result:= '';
  end;
end;

{ Read method for property KilometragemFIM }
function TControle_de_Veiculo.GetKilometragemFIM : Integer;
begin
  try
    Result := Self.fieldByName('MTV_KILOMETRAGEM_FIM').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property KilometragemINI }
function TControle_de_Veiculo.GetKilometragemINI : Integer;
begin
  try
    Result := Self.fieldByName('MTV_KILOMETRAGEM_INI').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property OBS }
function TControle_de_Veiculo.GetOBS : String;
begin
  try
    Result := Self.fieldByName('MTV_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Placa }
function TControle_de_Veiculo.GetPlaca : String;
begin
  try
    Result := Self.fieldByName('MTV_PLACA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Quantidade }
function TControle_de_Veiculo.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('MTV_QUANTIDADE').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Situacao }
function TControle_de_Veiculo.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('MTV_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Tipo }
function TControle_de_Veiculo.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('MTV_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property ValorTotal }
function TControle_de_Veiculo.GetValorTotal : Double;
begin
  try
    Result := Self.fieldByName('MTV_VALOR_TOTAL').asFloat;
  except
    result:= 0;
  end;
end;

function TControle_de_Veiculo.AlterarAuto:Boolean;
var
  CdCNC, CdMTV: integer;
  sDtINI, sDtFIM, sDetalhe: string;
begin
  result:=False;
  try
    CdCNC := CodigoCNC;
    CdMTV := CodigoMTV;
  except
    CdCNC := 0;
    CdMTV := 0;
  end;

  //Kilometragem
  if (ETipo.ItemIndex = 0) and
     (StrToInt(EKilometragemFIM.Text)>0) then //Definido a Kilometragem final
    ESituacao.ItemIndex := 3
  else if (ETipo.ItemIndex = 0) then  //Kilometragem
    ESituacao.ItemIndex := 2;

  //Abastecimento,Lubrificante ou Manutenção
  if (ETipo.ItemIndex > 0) and
     (StrToFloat(EQuantidade.Text) > 0) then
    ESituacao.ItemIndex := 3
  else if (ETipo.ItemIndex > 0) then  //Abastecimento,Lubrificante ou Manutenção
    ESituacao.ItemIndex := 2;
    
  try
    sDtINI := '"'+MesDia(EDataInicial.Text)+'" ';
  except
    sDtINI := 'NULL';
  end;
  try
    sDtFIM := '"'+MesDia(EDataFinal.Text)+'" ';
  except
    sDtFIM := 'NULL';
  end;  

  sDetalhe := sDetalhe + 'Desc:'+EDetalhe.Text+
                         ' VEI:'+ECodigoVEI.Text+
                         ' Tipo:'+IntToStr(ETipo.ItemIndex)+
                         ' KM:'+EKilometragemINI.Text+'-'+EKilometragemFIM.Text+
                         ' QTD:'+EQuantidade.Text+
                         ' R$:'+EValorTotal.Text+
                         ' INI:'+EDataInicial.Text+
                         ' FIM:'+EDataFinal.Text+                         
                         ' Sit:'+IntToStr(ESituacao.ItemIndex)+
                         ' OBS:'+EOBS.Text;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE CONTROLE_VEICULO SET '+
      ' USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',MTV_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',MTV_DETALHE="'+EDetalhe.Text+'" '+
      ',MTV_KILOMETRAGEM_INI='+EKilometragemINI.Text+
      ',MTV_KILOMETRAGEM_FIM='+EKilometragemFIM.Text+
      ',MTV_TIPO='+IntToStr(ETipo.ItemIndex)+
      ',MTV_QUANTIDADE='+VirgPonto(EQuantidade.Text)+
      ',MTV_VALOR_TOTAL='+VirgPonto(EValorTotal.Text)+
      ',MTV_DT_INICIAL='+sDtINI+
      ',MTV_DT_FINAL='+sDtFIM+      
      ',MTV_SITUACAO='+IntToStr(ESituacao.ItemIndex)+
      ',MTV_OBSERVACAO="'+EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND MTV_CODIGO='+IntToStr(CdMTV));

    GeraLog(8450,CdCNC, CdMTV, sDetalhe);

    Result := True;
  except
    ShowMessage('Não foi possível alterar o registro Controle de Veículo!');
  End;
end;

procedure TControle_de_Veiculo.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoVEI.Enabled     := False
    else
      ECodigoVEI.Enabled     := Habilitar;
  except
  end;
  try
    if Estado <> 1 then
      EKilometragemINI.Enabled      :=False
    else
      EKilometragemINI.Enabled      :=Habilitar;
  except
  end;
  try
    if Estado <> 1 then
      EDataInicial.Enabled      :=False
    else
      EDataInicial.Enabled      :=Habilitar;
  except
  end;  
  try
    if (Situacao = 3) or //Finalizado
       ((Tipo >= 1) and
        (Tipo <  4)) then
      EKilometragemFIM.Enabled :=False
    else
      EKilometragemFIM.Enabled :=Habilitar;
  except
  end;
  try
    if (Situacao = 3) or //Finalizado
       ((Tipo >= 1) and
        (Tipo <  4)) then
      EDataFinal.Enabled :=False
    else
      EDataFinal.Enabled :=Habilitar;
  except
  end;  
  try
    if Estado <> 1 then
      ETipo.Enabled        :=False
    else
      ETipo.Enabled        :=Habilitar;
  except
  end;
  try
    EDetalhe.Enabled        :=Habilitar;
  except
  end;
  try
    if (Estado <> 1) and //dif. Inserir
       ((Tipo=0) or //Kilometragem
        (Situacao=3)) then //Finalizado
      EQuantidade.Enabled   :=False
    else
      EQuantidade.Enabled     :=Habilitar;
  except
  end;
  try
    if (Estado <> 1) and //dif. Inserir
       ((Tipo=0) or //Kilometragem
        (Situacao=3)) then //Finalizado
      EValorTotal.Enabled  :=False
    else
      EValorTotal.Enabled  :=Habilitar;
  except
  end;
  try
    EOBS.Enabled            :=Habilitar;
  except
  end;
end;

procedure TControle_de_Veiculo.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TControle_de_Veiculo.CarregaDados;
begin
  Try
    ECodigoMTV.Text           :=IntToStr(CodigoMTV);
  except
  end;
  Try
    ECodigoVEI.Text           :=IntToStr(CodigoVEI);
  except
  end;
  try
    EPlaca.Text           :=Placa;
  except
  end;
  try
    EKilometragemINI.Text         := IntToStr(KilometragemINI);
  except
  end;
  try
    if DataInicial > 0 then
      EDataInicial.Text           := DateToStr(DataInicial)
    else
      EDataInicial.Text           := '';
  except
  end;  
  try
    EKilometragemFIM.Text         := IntToStr(KilometragemFIM);
  except
  end;
  try
    if DataFinal > 0 then
      EDataFinal.Text           := DateToStr(DataFinal)
    else
      EDataFinal.Text           := '';
  except
  end;  
  try
    ETipo.ItemIndex := Tipo;
  except
  end;
  try
    EDetalhe.Text           := Detalhe;
  except
  end;
  try
    EQuantidade.Text           :=Format('%.2f',[Quantidade]);
  except
  end;
  try
    EValorTotal.Text           := Format('%.2f',[ValorTotal]);
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

constructor TControle_de_Veiculo.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CONTROLE_VEICULO';

     { Code to perform other tasks when the component is created }

end;

function TControle_de_Veiculo.Deletar(CdCNC, CdMTV:Integer):Boolean;
begin
  Result := False;
  If MessageDlg('Deseja excluir esse registro?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  If not(localizarCod(CdCNC, CdMTV)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos, 'DELETE FROM CONTROLE_VEICULO '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND MTV_CODIGO='+IntToStr(CdMTV));
      GeraLog(8510, CdCNC, CdMTV);
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

destructor TControle_de_Veiculo.Destroy;
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

function TControle_de_Veiculo.FinalizaEdicao:Boolean;
var
  CdCNC, cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  If EDetalhe.Text = '' then
    mensagem:=mensagem+'Detalhe inválida!'+#13;
  if not VerificaInteiroBranco(ECodigoVEI.Text) then
    mensagem:=mensagem+'Código do Veículo inválido!'+#13;
  if not VerificaInteiroBranco(EKilometragemINI.Text) then
    mensagem:=mensagem+'Odômetro Inicial inválido!'+#13;
  if not VerificaInteiroBranco(EKilometragemFIM.Text) then
    mensagem:=mensagem+'Odômetro Final inválido!'+#13;
  if not VerificaFloatBranco(EQuantidade.Text) then
    mensagem:=mensagem+'Quantidade inválida!'+#13;
  if not VerificaFloatBranco(EValorTotal.Text) then
    mensagem:=mensagem+'Valor Total inválido!'+#13;
  if Trim(EPlaca.Text) = '-' then
    mensagem:=mensagem+'Placa inválida!'+#13;
  if not VerificaData(EDataInicial.Text) then
    mensagem:=mensagem+'Data inicial inválida!'+#13;
  if not VerificaData(EDataFinal.Text) then
    mensagem:=mensagem+'Data final inválida!'+#13;        
  If mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    if (StrToInt(EKilometragemFIM.Text) > 0) and
       (StrToInt(EKilometragemFIM.Text) < StrToInt(EKilometragemFIM.Text)) and
       ((StrToInt(EKilometragemINI.Text) < 90000) or
        (StrToInt(EKilometragemFIM.Text) > 1000)) then //Considerar que o odômetro virou
      Raise exception.Create('Kilometragem final inferior a kilometragem inicial!');
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      If Inserirauto then
      Begin
        Result := True;
        close;
        open;
        locate('CNC_CODIGO;MTV_CODIGO', vararrayof([CConfiguracao.CodigoCNC, SCodigo]), []);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      CdCNC := CodigoCNC;
      cod:=codigoMTV;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        locate('CNC_CODIGO;MTV_CODIGO', vararrayof([CdCNC, Cod]), []);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TControle_de_Veiculo.InserirAuto:Boolean;
var
  CdCNC, CdMTV: integer;
  sDtINI, sDtFIM, sDetalhes: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdMTV := sCodigo;

  if (ETipo.ItemIndex = 0) and  //Kilometragem
     (StrToInt(EKilometragemFIM.Text)>0) then //Definido a Kilometragem final
    ESituacao.ItemIndex := 3
  else if (ETipo.ItemIndex = 0) then  //Kilometragem
    ESituacao.ItemIndex := 2;
    
  try
    sDtINI := '"'+MesDia(EDataInicial.Text)+'" ';
  except
    sDtINI := 'NULL';
  end;
  try
    sDtFIM := '"'+MesDia(EDataFinal.Text)+'" ';
  except
    sDtFIM := 'NULL';
  end;  

  sDetalhes := sDetalhes + 'Desc:'+EDetalhe.Text+
                           ' VEI:'+ECodigoVEI.Text+
                           ' Tipo:'+IntToStr(ETipo.ItemIndex)+
                           ' KM:'+EKilometragemINI.Text+'-'+EKilometragemFIM.Text+
                           ' QTD:'+EQuantidade.Text+
                           ' R$:'+EValorTotal.Text+
                           ' INI:'+EDataInicial.Text+
                           ' FIM:'+EDataFinal.Text+                           
                           ' Sit:'+IntToStr(ESituacao.ItemIndex)+
                           ' OBS:'+EOBS.Text;

  if StrToInt(ECodigoVEI.Text) > 0 then
  Begin
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT VEI_CODIGO,VEI_COMBUSTIVEL '+
        ' FROM VEICULO '+
        ' WHERE VEI_CODIGO='+ECodigoVEI.Text;
      Open;
      if isEmpty then
        Raise exception.Create('Veículo não cadastrado!');

{
0-Gasolina
1-Alcool
2-Disel
3-Gasolina/Alcool
4-Gasolina/GNV
}
      if (ETipo.ItemIndex = 1) and //Gasolina
         (FieldByName('VEI_COMBUSTIVEL').asInteger <> 0) and //Gasolina
         (FieldByName('VEI_COMBUSTIVEL').asInteger <> 3) and //Gasolina/Alcool
         (FieldByName('VEI_COMBUSTIVEL').asInteger <> 4) then //Gasolina/GNV
        Raise exception.Create('Combustivel incompatível com o Veículo!');

      if (ETipo.ItemIndex = 2) and //Alcool
         (FieldByName('VEI_COMBUSTIVEL').asInteger <> 1) and //Alcool
         (FieldByName('VEI_COMBUSTIVEL').asInteger <> 3) then //Gasolina/Alcool
        Raise exception.Create('Combustivel incompatível com o Veículo!');

      if (ETipo.ItemIndex = 3) and //Disel
         (FieldByName('VEI_COMBUSTIVEL').asInteger <> 2) and //Alcool
         (FieldByName('VEI_COMBUSTIVEL').asInteger <> 4) then //Gasolina/GNV
        Raise exception.Create('Combustivel incompatível com o Veículo!');

      if (ETipo.ItemIndex = 4) and //GNV
         (FieldByName('VEI_COMBUSTIVEL').asInteger <> 4) then //Alcool
        Raise exception.Create('Combustivel incompatível com o Veículo!');
    end;
  end;

  if (ETipo.ItemIndex = 0) and //Kilometragem
     (StrToInt(EKilometragemINI.Text)<=0) then
    Raise exception.Create('Odômetro inicial inválido!');

  if (ETipo.ItemIndex = 0) and //Kilometragem
     (StrToInt(ECodigoVEI.Text)<=0) then
    Raise exception.Create('Veículo inválido!');

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO CONTROLE_VEICULO '+
      '(CNC_ORIGEM,CNC_CODIGO,MTV_CODIGO,USU_CODIGO,MTV_DT_CADASTRO '+
      ',VEI_CODIGO,MTV_PLACA,MTV_KILOMETRAGEM_INI,MTV_KILOMETRAGEM_FIM '+
      ',MTV_DETALHE,MTV_TIPO,MTV_QUANTIDADE,MTV_VALOR_TOTAL '+
      ',MTV_DT_INICIAL,MTV_DT_FINAL '+
      ',MTV_SITUACAO,MTV_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(CdCNC)+
      ', '+IntToStr(CdMTV)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+ECodigoVEI.Text+
      ',"'+EPlaca.Text+'" '+
      ', '+EKilometragemINI.Text+
      ', '+EKilometragemFIM.Text+
      ',"'+EDetalhe.Text+'" '+
      ', '+IntToStr(ETipo.ItemIndex)+
      ', '+VirgPonto(EQuantidade.Text)+
      ', '+VirgPonto(EValorTotal.Text)+
      ', '+sDtINI+
      ', '+sDtFIM+      
      ', '+IntToStr(ESituacao.ItemIndex)+
      ',"'+EObs.Text+'") ');

    GeraLog(8470, CdCNC, CdMTV, sDetalhes);
    result:=True;
  except
    ShowMessage('Não foi possível alterar registro corrente. CONTROLE VEICULO');
  end;
end;


procedure TControle_de_Veiculo.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoMTV.Clear
    else
      ECodigoMTV.Text := IntToStr(SCodigo);
  except
  end;
  try
    ECodigoVEI.Clear;
  except
  end;
  try
    EPlaca.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EKilometragemINI.Clear
    else
      EKilometragemINI.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      EDataInicial.Clear
    else
      EDataInicial.Text := DateToStr(CConfiguracao.Data);
  except
  end;  
  try
    if Estado <> 1 then
      EKilometragemFIM.Clear
    else
      EKilometragemFIM.Text := '0';
  except
  end;
  try
    EDataFinal.Clear;
  except
  end;  
  try
    EDetalhe.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ETipo.ItemIndex := -1
    else
      ETipo.ItemIndex := 0;
  except
  end;
  try
    EDetalhe.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EQuantidade.Clear
    else
      EQuantidade.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EValorTotal.Clear
    else
      EValorTotal.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := FormatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
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
function TControle_de_Veiculo.LocalizarCod(CdCNC, CdMTV:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  begin
    close;
    sql.Text:='SELECT * FROM CONTROLE_VEICULO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND MTV_CODIGO='+IntToStr(CdMTV);
    open;
    Result := (not IsEmpty);
  end;
end;

procedure TControle_de_Veiculo.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
end;

procedure TControle_de_Veiculo.PreparaInsercao;
begin
  ProximoCodigo('MTV_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
