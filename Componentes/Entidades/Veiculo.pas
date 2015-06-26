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
unit Veiculo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, 
     Funcoes, Variants;

type
  TVeiculo = class(TSQuery)
    private
      { Private fields of TVeiculo }
        { Storage for property CodigoVEI }
        FCodigoVEI : Integer;
        { Storage for property Combustivel }
        FCombustivel : Integer;
        { Storage for property Consumo }
        FConsumo : Double;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoVEI }
        FECodigoVEI : TEdit;
        { Storage for property ECombustivel }
        FECombustivel : TComboBox;
        { Storage for property EConsumo }
        FEConsumo : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EFoto }
        FEFoto : TImage;
        { Storage for property EMarca }
        FEMarca : TEdit;
        { Storage for property EModelo }
        FEModelo : TEdit;
        { Storage for property ENumeroChassis }
        FENumeroChassis : TEdit;
        { Storage for property ENumeroRenavan }
        FENumeroRenavan : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EPlaca }
        FEPlaca : TMaskEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Marca }
        FMarca : String;
        { Storage for property Modelo }
        FModelo : String;
        { Storage for property NumeroChassis }
        FNumeroChassis : String;
        { Storage for property NumeroRenavan }
        FNumeroRenavan : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Placa }
        FPlaca : String;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TVeiculo }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoVEI }
        function GetCodigoVEI : Integer;
        { Read method for property Combustivel }
        function GetCombustivel : Integer;
        { Read method for property Consumo }
        function GetConsumo : Double;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property Descricao }
        function GetDescricao : String;
        { Read method for property Marca }
        function GetMarca : String;
        { Read method for property Modelo }
        function GetModelo : String;
        { Read method for property NumeroChassis }
        function GetNumeroChassis : String;
        { Read method for property NumeroRenavan }
        function GetNumeroRenavan : String;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property Placa }
        function GetPlaca : String;
        { Read method for property Situacao }
        function GetSituacao : Integer;

    protected
      { Protected fields of TVeiculo }

      { Protected methods of TVeiculo }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TVeiculo }

      { Public methods of TVeiculo }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdVEI:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grupo }
        function LocalizarCod(CdVEI:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;

    published
      { Published properties of TVeiculo }
        { Código do Veículo }
        property CodigoVEI : Integer read GetCodigoVEI write FCodigoVEI;
        property Combustivel : Integer read GetCombustivel write FCombustivel;
        property Consumo : Double read GetConsumo write FConsumo;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property Descricao : String read GetDescricao write FDescricao;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoVEI : TEdit read FECodigoVEI write FECodigoVEI;
        property ECombustivel : TComboBox
             read FECombustivel write FECombustivel;
        property EConsumo : TEdit read FEConsumo write FEConsumo;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EFoto : TImage read FEFoto write FEFoto;
        property EMarca : TEdit read FEMarca write FEMarca;
        property EModelo : TEdit read FEModelo write FEModelo;
        property ENumeroChassis : TEdit
             read FENumeroChassis write FENumeroChassis;
        property ENumeroRenavan : TEdit
             read FENumeroRenavan write FENumeroRenavan;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EPlaca : TMaskEdit read FEPlaca write FEPlaca;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property Marca : String read GetMarca write FMarca;
        property Modelo : String read GetModelo write FModelo;
        property NumeroChassis : String
             read GetNumeroChassis write FNumeroChassis;
        property NumeroRenavan : String
             read GetNumeroRenavan write FNumeroRenavan;
        property OBS : String read GetOBS write FOBS;
        property Placa : String read GetPlaca write FPlaca;
        property Situacao : Integer read GetSituacao write FSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TVeiculo with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TVeiculo]);
end;

{ Method to set variable and property values and create objects }
procedure TVeiculo.AutoInitialize;
begin
     FECodigoCNC := nil;
     FECodigoVEI := nil;
     FECombustivel := nil;
     FEConsumo := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDescricao := nil;
     FEFoto := nil;
     FEMarca := nil;
     FEModelo := nil;
     FENumeroChassis := nil;
     FENumeroRenavan := nil;
     FEOBS := nil;
     FEPlaca := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TVeiculo.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoVEI then
        FECodigoVEI := nil;
     if AComponent = FECombustivel then
        FECombustivel := nil;
     if AComponent = FEConsumo then
        FEConsumo := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEFoto then
        FEFoto := nil;
     if AComponent = FEMarca then
        FEMarca := nil;
     if AComponent = FEModelo then
        FEModelo := nil;
     if AComponent = FENumeroChassis then
        FENumeroChassis := nil;
     if AComponent = FENumeroRenavan then
        FENumeroRenavan := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEPlaca then
        FEPlaca := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TVeiculo.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoVEI }
function TVeiculo.GetCodigoVEI : Integer;
begin
  try
    Result := Self.fieldByName('VEI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Combustivel }
function TVeiculo.GetCombustivel : Integer;
begin
  try
    Result := Self.fieldByName('VEI_COMBUSTIVEL').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Consumo }
function TVeiculo.GetConsumo : Double;
begin
  try
    Result := Self.fieldByName('VEI_CONSUMO').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property DataAlterado }
function TVeiculo.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('VEI_DT_ALTERADO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataCadastro }
function TVeiculo.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('VEI_DT_CADASTRO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property Descricao }
function TVeiculo.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('VEI_DESCRICAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Marca }
function TVeiculo.GetMarca : String;
begin
  try
    Result := Self.fieldByName('VEI_MARCA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Modelo }
function TVeiculo.GetModelo : String;
begin
  try
    Result := Self.fieldByName('VEI_MODELO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property NumeroChassis }
function TVeiculo.GetNumeroChassis : String;
begin
  try
    Result := Self.fieldByName('VEI_NUMERO_CHASSIS').asString;
  except
    result:= '';
  end;
end;

{ Read method for property NumeroRenavan }
function TVeiculo.GetNumeroRenavan : String;
begin
  try
    Result := Self.fieldByName('VEI_NUMERO_RENAVAN').asString;
  except
    result:= '';
  end;
end;

{ Read method for property OBS }
function TVeiculo.GetOBS : String;
begin
  try
    Result := Self.fieldByName('VEI_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Placa }
function TVeiculo.GetPlaca : String;
begin
  try
    Result := Self.fieldByName('VEI_PLACA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Situacao }
function TVeiculo.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('VEI_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

function TVeiculo.AlterarAuto:Boolean;
var
  CdCNC, CdVEI: integer;
  sDetalhe: string;
begin
  result:=False;
  try
    CdCNC := CodigoCNC;
    CdVEI := CodigoVEI;
  except
    CdCNC := 0;
    CdVEI := 0;
  end;

  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM VEICULO '+
      ' WHERE VEI_CODIGO<>'+IntToStr(CdVEI)+
      ' AND VEI_PLACA="'+EPlaca.Text+'" ';
    Open;
    if not isEmpty then
      Raise exception.Create('Placa já cadastrada!');
  end;

  sDetalhe := EDescricao.Text + ' Placa:'+EPlaca.Text+
              ' Combustivel:'+IntToStr(ECombustivel.ItemIndex)+
              ' Consumo:'+EConsumo.Text;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE VEICULO SET '+
      ' USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',VEI_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',VEI_PLACA="'+EPlaca.Text+'" '+
      ',VEI_MARCA="'+EMarca.Text+'" '+
      ',VEI_MODELO="'+EModelo.Text+'" '+
      ',VEI_DESCRICAO="'+EDescricao.Text+'" '+
      ',VEI_NUMERO_CHASSIS="'+ENumeroChassis.Text+'" '+
      ',VEI_NUMERO_RENAVAN="'+ENumeroRenavan.Text+'" '+
      ',VEI_COMBUSTIVEL='+IntToStr(ECombustivel.ItemIndex)+
      ',VEI_CONSUMO='+VirgPonto(EConsumo.Text)+
      ',VEI_SITUACAO='+IntToStr(ESituacao.ItemIndex)+
      ',VEI_OBSERVACAO="'+EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND VEI_CODIGO='+IntToStr(CdVEI));

    GeraLog(8450,CdCNC, CdVEI, sDetalhe);

    Result := True;
  except
    ShowMessage('Não foi possível alterar o registro Veículo!');
  End;
end;

procedure TVeiculo.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled         :=not Habilitar;
  except
  end;
  Try
    ECodigoCNC.Enabled      :=not Habilitar;
  except
  end;
  try
    EPlaca.Enabled          :=Habilitar;
  except
  end;
  try
    EMarca.Enabled        :=Habilitar;
  except
  end;
  try
    EModelo.Enabled        :=Habilitar;
  except
  end;
  try
    EDescricao.Enabled        :=Habilitar;
  except
  end;
  try
    ENumeroChassis.Enabled        :=Habilitar;
  except
  end;
  try
    ENumeroRenavan.Enabled        :=Habilitar;
  except
  end;
  try
    ECombustivel.Enabled    :=Habilitar;
  except
  end;
  try
    EConsumo.Enabled        :=Habilitar;
  except
  end;
  try
    ESituacao.Enabled        :=Habilitar;
  except
  end;
  try
    EOBS.Enabled                :=Habilitar;
  except
  end;
end;

procedure TVeiculo.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TVeiculo.CarregaDados;
var
  Foto : string;
begin
  Try
    ECodigoVEI.Text           :=IntToStr(CodigoVEI);
  except
  end;
  try
    EPlaca.Text           :=Placa;
  except
  end;
  try
    EMarca.Text           :=Marca;
  except
  end;
  try
    EModelo.Text           :=Modelo;
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
  try
    ENumeroChassis.Text           :=NumeroChassis;
  except
  end;
  try
    ENumeroRenavan.Text           :=NumeroRenavan;
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
    ECombustivel.ItemIndex     := Combustivel;
  except
  end;
  try
    EConsumo.Text := Format('%.4f',[Consumo]);
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
  try
    Foto:=CConfiguracao.PastaImagens+'\Veiculo\00'+'-'+IntToStr(CodigoVEI)+'.JPG';
    if FileExists(Foto) then
      Efoto.Picture.LoadFromFile(foto)
    else
      EFoto.Picture:=nil;
  Except
    try
      EFoto.Picture:=nil;
    except
    end;
  end;
end;

constructor TVeiculo.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'VEICULO';

     { Code to perform other tasks when the component is created }

end;

function TVeiculo.Deletar(CdVEI:Integer):Boolean;
begin
  Result := False;
  If MessageDlg('Deseja excluir esse registro?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  If not(localizarCod(CdVEI)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos, 'DELETE FROM VEICULO '+
        ' WHERE VEI_CODIGO='+IntToStr(CdVEI));
      GeraLog(8460, 0, CdVEI);
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

destructor TVeiculo.Destroy;
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

function TVeiculo.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  If Trim(EDescricao.Text) = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  If Trim(EPlaca.Text) = '-' then
    mensagem:=mensagem+'Placa inválida!'+#13;
  If not VerificaFloatBranco(EConsumo.Text) then
    mensagem:=mensagem+'Consumo inválido!'+#13;
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
          locate('VEI_CODIGO', SCodigo, []);
          Estado:=0;
          AtualizaControles(False);
          CarregaDados;
        end;
      End
      Else If Estado=2 then
      Begin
        cod:=codigoVEI;
        If Alterarauto then
        Begin
          Result := True;
          close;
          open;
          locate('VEI_CODIGO', Cod, []);
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

function TVeiculo.InserirAuto:Boolean;
var
  CdVEI: integer;
  sDetalhe: string;
begin
  result:=False;
  try
    CdVEI := sCodigo;
  except
    CdVEI := 0;
  end;

  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM VEICULO '+
      ' WHERE VEI_PLACA="'+EPlaca.Text+'" ';
    Open;
    if not isEmpty then
      Raise exception.Create('Placa já cadastrada!');
  end;

  sDetalhe := EDescricao.Text+' Placa:'+EPlaca.Text+
              ' Combustivel:'+IntToStr(ECombustivel.ItemIndex)+
              ' Consumo:'+EConsumo.Text;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO VEICULO '+
      '(CNC_ORIGEM,CNC_CODIGO,VEI_CODIGO,USU_CODIGO,VEI_DT_CADASTRO '+
      ',VEI_PLACA,VEI_MARCA,VEI_MODELO,VEI_DESCRICAO '+
      ',VEI_NUMERO_CHASSIS,VEI_NUMERO_RENAVAN,VEI_COMBUSTIVEL,VEI_CONSUMO '+
      ',VEI_SITUACAO,VEI_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(ECodigoCNC.KeyValue)+
      ', '+IntToStr(CdVEI)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',"'+EPlaca.Text+'" '+
      ',"'+EMarca.Text+'" '+
      ',"'+EModelo.Text+'" '+
      ',"'+EDescricao.Text+'" '+
      ',"'+ENumeroChassis.Text+'" '+
      ',"'+ENumeroRenavan.Text+'" '+
      ', '+IntToStr(ECombustivel.ItemIndex)+
      ', '+VirgPonto(EConsumo.Text)+
      ', '+IntToStr(ESituacao.ItemIndex)+
      ',"'+EOBS.Text+'") ');

    GeraLog(8440,CConfiguracao.CodigoCNC, CdVEI, sDetalhe);
    Result := True;
  except
    ShowMessage('Não foi possível incluir o registro Veículo!');
  End;
end;

procedure TVeiculo.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoVEI.Clear
    else
      ECodigoVEI.Text := IntToStr(SCodigo);
  except
  end;
  try
    EPlaca.Clear;
  except
  end;
  try
    EMarca.Clear;
  except
  end;
  try
    EModelo.Clear;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    ENumeroChassis.Clear;
  except
  end;
  try
    ENumeroRenavan.Clear;
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
    EDataAlterado.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ECombustivel.itemIndex := -1
    else
      ECombustivel.itemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EConsumo.Clear
    else
      EConsumo.Text := '0,00';
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
  try
    EFoto.Picture:=nil;
  except
  end;
end;

{ Localiza um Grupo }
function TVeiculo.LocalizarCod(CdVEI:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  begin
    close;
    sql.Text:='SELECT * FROM VEICULO '+
      ' WHERE VEI_CODIGO='+IntToStr(CdVEI);
    open;
    Result := (not IsEmpty);
  end;
end;

procedure TVeiculo.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
end;

procedure TVeiculo.PreparaInsercao;
begin
  ProximoCodigo('VEI_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
