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
unit Transferencia;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Variants, Funcoes;

type
  TTransferencia = class(TSQuery)
    private
      { Private fields of TTransferencia }
        { Storage for property Automatica }
        FAutomatica : Boolean;
        { Storage for property CNCDest }
        FCNCDest : Integer;
        { Storage for property CNCOri }
        FCNCOri : Integer;
        { Storage for property CodigoPCP }
        FCodigoPCP : Integer;
        { Storage for property CodigoTRF }
        FCodigoTRF : Integer;
        { Storage for property Data }
        FData : TDateTime;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property EAutomatica }
        FEAutomatica : TCheckBox;
        { Storage for property ECNCDest }
        FECNCDest : TDBLookupcomboBox;
        { Storage for property ECNCOri }
        FECNCOri : TDBLookupComboBox;
        { Storage for property ECodigoPCP }
        FECodigoPCP : TEdit;
        { Storage for property ECodigoTRF }
        FECodigoTRF : TEdit;
        { Storage for property EData }
        FEData : TMaskEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EFormaPgto }
        FEFormaPgto : TDbLookupCombobox;
        { Storage for property EFuncionarioDestino }
        FEFuncionarioDestino : TDBLookupComboBox;
        { Storage for property EFuncionarioOrigem }
        FEFuncionarioOrigem : TDBLookupComboBox;
        { Storage for property ENotaFiscal }
        FENotaFiscal : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TMemo;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property ETipoDocumento }
        FETipoDocumento : TDBLookupComboBox;
        { Storage for property ETotItens }
        FETotItens : TEdit;
        { Storage for property FormaPgto }
        FFormaPgto : Integer;
        { Storage for property FuncionarioDestino }
        FFuncionarioDestino : Integer;
        { Storage for property FuncionarioOrigem }
        FFuncionarioOrigem : Integer;
        { Storage for property NotaFiscal }
        FNotaFiscal : Integer;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TipoDocumento }
        FTipoDocumento : Integer;
        { Storage for property TotItens }
        FTotItens : Integer;

      { Private methods of TTransferencia }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Automatica }
        function GetAutomatica : Boolean;
        { Write method for property Automatica }
        procedure SetAutomatica(Value : Boolean);
        { Read method for property CNCDest }
        function GetCNCDest : Integer;
        { Write method for property CNCDest }
        procedure SetCNCDest(Value : Integer);
        { Read method for property CNCOri }
        function GetCNCOri : Integer;
        { Write method for property CNCOri }
        procedure SetCNCOri(Value : Integer);
        { Read method for property CodigoPCP }
        function GetCodigoPCP : Integer;
        { Write method for property CodigoPCP }
        procedure SetCodigoPCP(Value : Integer);
        { Read method for property CodigoTRF }
        function GetCodigoTRF : Integer;
        { Write method for property CodigoTRF }
        procedure SetCodigoTRF(Value : Integer);
        { Read method for property Data }
        function GetData : TDateTime;
        { Write method for property Data }
        procedure SetData(Value : TDateTime);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property FormaPgto }
        function GetFormaPgto : Integer;
        { Write method for property FormaPgto }
        procedure SetFormaPgto(Value : Integer);
        { Read method for property FuncionarioDestino }
        function GetFuncionarioDestino : Integer;
        { Write method for property FuncionarioDestino }
        procedure SetFuncionarioDestino(Value : Integer);
        { Read method for property FuncionarioOrigem }
        function GetFuncionarioOrigem : Integer;
        { Write method for property FuncionarioOrigem }
        procedure SetFuncionarioOrigem(Value : Integer);
        { Read method for property NotaFiscal }
        function GetNotaFiscal : Integer;
        { Write method for property NotaFiscal }
        procedure SetNotaFiscal(Value : Integer);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property TipoDocumento }
        function GetTipoDocumento : Integer;
        { Write method for property TipoDocumento }
        procedure SetTipoDocumento(Value : Integer);
        { Read method for property TotItens }
        function GetTotItens : Integer;
        { Write method for property TotItens }
        procedure SetTotItens(Value : Integer);

    protected
      { Protected fields of TTransferencia }

      { Protected methods of TTransferencia }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TTransferencia }

      { Public methods of TTransferencia }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdTRF:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC, CdTRF, PTotItens,PCNCORi,PCNCDest,FunOrigem,FunDestino: Integer; PObs:String;PAutomatica:Boolean; CdPCP, PSit, PTipoDoc, PFormaPag:integer):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdTRF,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TTransferencia }
        property Automatica : Boolean read GetAutomatica write SetAutomatica;
        property CNCDest : Integer read GetCNCDest write SetCNCDest;
        property CNCOri : Integer read GetCNCOri write SetCNCOri;
        property CodigoPCP : Integer read GetCodigoPCP write SetCodigoPCP;
        property CodigoTRF : Integer read GetCodigoTRF write SetCodigoTRF;
        property Data : TDateTime read GetData write SetData;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property EAutomatica : TCheckBox read FEAutomatica write FEAutomatica;
        property ECNCDest : TDBLookupcomboBox read FECNCDest write FECNCDest;
        property ECNCOri : TDBLookupComboBox read FECNCOri write FECNCOri;
        property ECodigoPCP : TEdit read FECodigoPCP write FECodigoPCP;
        property ECodigoTRF : TEdit read FECodigoTRF write FECodigoTRF;
        property EData : TMaskEdit read FEData write FEData;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EFormaPgto : TDbLookupCombobox
             read FEFormaPgto write FEFormaPgto;
        property EFuncionarioDestino : TDBLookupComboBox
             read FEFuncionarioDestino write FEFuncionarioDestino;
        property EFuncionarioOrigem : TDBLookupComboBox
             read FEFuncionarioOrigem write FEFuncionarioOrigem;
        property ENotaFiscal : TEdit read FENotaFiscal write FENotaFiscal;
        property EObservacao : TMemo read FEObservacao write FEObservacao;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property ETipoDocumento : TDBLookupComboBox
             read FETipoDocumento write FETipoDocumento;
        property ETotItens : TEdit read FETotItens write FETotItens;
        property FormaPgto : Integer read GetFormaPgto write SetFormaPgto;
        property FuncionarioDestino : Integer
             read GetFuncionarioDestino write SetFuncionarioDestino;
        property FuncionarioOrigem : Integer
             read GetFuncionarioOrigem write SetFuncionarioOrigem;
        property NotaFiscal : Integer read GetNotaFiscal write SetNotaFiscal;
        property Observacao : String read GetObservacao write SetObservacao;
        { Código da tabela de preços }
        property Situacao : Integer read GetSituacao write SetSituacao;
        property TipoDocumento : Integer
             read GetTipoDocumento write SetTipoDocumento;
        property TotItens : Integer read GetTotItens write SetTotItens;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTransferencia with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTransferencia]);
end;

{ Method to set variable and property values and create objects }
procedure TTransferencia.AutoInitialize;
begin
     FEAutomatica := nil;
     FECNCDest := nil;
     FECNCOri := nil;
     FECodigoPCP := nil;
     FECodigoTRF := nil;
     FEData := nil;
     FEDataAlterado := nil;
     FEFormaPgto := nil;
     FEFuncionarioDestino := nil;
     FEFuncionarioOrigem := nil;
     FENotaFiscal := nil;
     FEObservacao := nil;
     FESituacao := nil;
     FETipoDocumento := nil;
     FETotItens := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TTransferencia.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAutomatica then
        FEAutomatica := nil;
     if AComponent = FECNCDest then
        FECNCDest := nil;
     if AComponent = FECNCOri then
        FECNCOri := nil;
     if AComponent = FECodigoPCP then
        FECodigoPCP := nil;
     if AComponent = FECodigoTRF then
        FECodigoTRF := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEFormaPgto then
        FEFormaPgto := nil;
     if AComponent = FEFuncionarioDestino then
        FEFuncionarioDestino := nil;
     if AComponent = FEFuncionarioOrigem then
        FEFuncionarioOrigem := nil;
     if AComponent = FENotaFiscal then
        FENotaFiscal := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipoDocumento then
        FETipoDocumento := nil;
     if AComponent = FETotItens then
        FETotItens := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TTransferencia.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Automatica }
function TTransferencia.GetAutomatica : Boolean;
begin
  try
    result := (Self.fieldByName('TRF_AUTOMATICA').asInteger=1);
  except
    try
      Result := Self.fieldByName('TRF_AUTOMATICA').asBoolean;
    except
      result:= False
    end;
  end;
end;

{ Write method for property Automatica }
procedure TTransferencia.SetAutomatica(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
   try
     if value=true then
       Self.fieldByName('TRF_AUTOMATICA').asInteger := 1
     else
       Self.fieldByName('TRF_AUTOMATICA').asInteger := 0;
   except
      try
        Self.fieldByName('TRF_AUTOMATICA').asBoolean := Value;
      except
        ShowMessage('Não foi possível alterar o campo "TRF_AUTOMATICA"!');
      end;
   end;
end;

{ Read method for property CNCDest }
function TTransferencia.GetCNCDest : Integer;
begin
  try
    Result := Self.fieldByName('TRF_CNC_DESTINO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CNCDest }
procedure TTransferencia.SetCNCDest(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRF_CNC_DESTINO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRF_CNC_DESTINO"!');
    end;
end;

{ Read method for property CNCOri }
function TTransferencia.GetCNCOri : Integer;
begin
  try
    Result := Self.fieldByName('TRF_CNC_ORIGEM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CNCOri }
procedure TTransferencia.SetCNCOri(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRF_CNC_ORIGEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRF_CNC_ORIGEM"!');
    end;
end;

{ Read method for property CodigoPCP }
function TTransferencia.GetCodigoPCP : Integer;
begin
  try
    Result := Self.fieldByName('PCP_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPCP }
procedure TTransferencia.SetCodigoPCP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_CODIGO"!');
    end;
end;

{ Read method for property CodigoTRF }
function TTransferencia.GetCodigoTRF : Integer;
begin
  try
    Result := Self.fieldByName('TRF_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTRF }
procedure TTransferencia.SetCodigoTRF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRF_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TTransferencia.GetData : TDateTime;
begin
  try
    Result := Self.fieldByName('TRF_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TTransferencia.SetData(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRF_DATA').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRF_DATA"!');
  end;
end;

{ Read method for property DataAlterado }
function TTransferencia.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('TRF_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TTransferencia.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRF_DT_ALTERADO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRF_DT_ALTERADO"!');
  end;
end;

{ Read method for property FormaPgto }
function TTransferencia.GetFormaPgto : Integer;
begin
  try
    Result := Self.fieldByName('FPG_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property FormaPgto }
procedure TTransferencia.SetFormaPgto(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CODIGO"!');
    end;
end;

{ Read method for property FuncionarioDestino }
function TTransferencia.GetFuncionarioDestino : Integer;
begin
  try
    Result := Self.fieldByName('FUN_DESTINO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property FuncionarioDestino }
procedure TTransferencia.SetFuncionarioDestino(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_DESTINO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_DESTINO"!');
    end;
end;

{ Read method for property FuncionarioOrigem }
function TTransferencia.GetFuncionarioOrigem : Integer;
begin
  try
    Result := Self.fieldByName('FUN_ORIGEM').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property FuncionarioOrigem }
procedure TTransferencia.SetFuncionarioOrigem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_ORIGEM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_ORIGEM"!');
    end;
end;

{ Read method for property NotaFiscal }
function TTransferencia.GetNotaFiscal : Integer;
begin
  try
    Result := Self.fieldByName('TRF_NOTA_FISCAL').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NotaFiscal }
procedure TTransferencia.SetNotaFiscal(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRF_NOTA_FISCAL').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRF_NOTA_FISCAL"!');
    end;
end;

{ Read method for property Observacao }
function TTransferencia.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('TRF_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Observacao }
procedure TTransferencia.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRF_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRF_OBSERVACAO"!');
    end;
end;

{ Read method for property Situacao }
function TTransferencia.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('TRF_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TTransferencia.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRF_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRF_SITUACAO"!');
    end;
end;

{ Read method for property TipoDocumento }
function TTransferencia.GetTipoDocumento : Integer;
begin
  try
    Result := Self.fieldByName('TRF_TIPO_DOCUMENTO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TipoDocumento }
procedure TTransferencia.SetTipoDocumento(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRF_TIPO_DOCUMENTO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRF_TIPO_DOCUMENTO"!');
    end;
end;

{ Read method for property TotItens }
function TTransferencia.GetTotItens : Integer;
begin
  try
    Result := Self.fieldByName('TRF_TOT_ITENS').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TotItens }
procedure TTransferencia.SetTotItens(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRF_TOT_ITENS').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRF_TOT_ITENS"!');
  end;
end;

function TTransferencia.AlterarAuto:Boolean;
var
  CdCNC, CdTRF, iDestino: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdTRF := CodigoTRF;
  iDestino := ECNCDest.KeyValue;
  sDetalhe := '';
  try
    edit;
    try
      CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado  := CConfiguracao.DataHora;
    except
    end;
    try
      TotItens  := StrToInt(ETotItens.Text);
    except
    end;
    try
      CNCOri    := ECNCOri.KeyValue;
    except
    end;
    try
      CNCDest   := ECNCDest.KeyValue;
    except
    end;
    try
      TipoDocumento   := ETipoDocumento.KeyValue;
    except
    end;
    try
      FormaPgto   := EFormaPgto.KeyValue;
    except
    end;
    try
      CodigoPCP   := StrToInt(ECodigoPCP.Text);
    except
    end;
    try
      if EFuncionarioOrigem.Text <> '' then
        FuncionarioOrigem := EFuncionarioOrigem.KeyValue
      else
        FuncionarioOrigem := 0;
       sDetalhe := sDetalhe + ' FUNOri:'+EFuncionarioOrigem.Text;
    except
    end;
    try
      if EFuncionarioDestino.Text <> '' then
        FuncionarioDestino := EFuncionarioDestino.KeyValue
      else
        FuncionarioDestino := 0;
       sDetalhe := sDetalhe + ' FUNDest:'+EFuncionarioDestino.Text;
    except
    end;
    try
      Situacao  := StrToInt(ESituacao.Text);
    except
    end;
    try
      Observacao := EObservacao.Text;
    except
    end;

    try
      Post;
      GeraLog(8040, CdCNC, CdTRF, 'ALTERAR Destino:'+IntToStr(iDestino)+sDetalhe);
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TTransferencia.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled        := not Habilitar;
  Except
  End;
  Try
    ETipoDocumento.Enabled    :=Habilitar;
  Except
  End;
  Try
    EFormaPgto.Enabled    :=Habilitar;
  Except
  End;
  Try
    ECNCDest.Enabled       :=Habilitar;
  Except
  End;
  Try
    ECodigoPCP.Enabled       :=Habilitar;
  Except
  End;
  try
    EFuncionarioOrigem.Enabled := Habilitar;
  except
  end;
  try
    EFuncionarioDestino.Enabled := Habilitar;
  except
  end;
  Try
    EObservacao.Enabled    :=Habilitar;
  Except
  End;
end;

procedure TTransferencia.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  CarregaDados;
  if isEmpty then
    LimpaCampos;
end;

procedure TTransferencia.CarregaDados;
begin
  Try
   Case Situacao of
    0: ESituacao.Text:='Solicitada';
    1: ESituacao.Text:='Processada';
    2: ESituacao.Text:='Embarcada';
    3: ESituacao.Text:='Recebida';
    4: ESituacao.Text:='Cancelada';
   End;
  Except
  End;
  Try
     ECodigoTRF.Text        :=IntToStr(CodigoTRF);
  Except
  End;
  Try
     ENotaFiscal.Text        :=IntToStr(NotaFiscal);
  Except
  End;
  Try
     ECNCOri.KeyValue       :=CNCOri;
  Except
  End;
  Try
     ECNCDest.KeyValue      :=CNCDest;
  Except
  End;
  Try
     ETipoDocumento.KeyValue      :=TipoDocumento;
  Except
  End;
  Try
     EFormaPgto.KeyValue      :=FormaPgto;
  Except
  End;
  Try
     ETotItens.Text         :=IntToStr(TotItens);
  Except
  End;
  Try
    if Data=0 then
      EData.Text:=''
    else
     EData.Text             :=FormatDateTime('dd/mm/yyyy hh:mm',Data);
  Except
  End;
  Try
    if DataAlterado=0 then
      EDataAlterado.Text:=''
    else
     EDataAlterado.Text             :=FormatDateTime('dd/mm/yyyy hh:mm',DataAlterado);
  Except
  End;
  Try
     EAutomatica.Checked       :=Automatica;
  Except
  End;
  Try
     ECodigoPCP.Text        :=IntToStr(CodigoPCP);
  Except
  End;
  try
    EFuncionarioOrigem.KeyValue   := FuncionarioOrigem;
  except
  end;
  try
    EFuncionarioDestino.KeyValue   := FuncionarioDestino;
  except
  end;
  Try
     EObservacao.Text       :=Observacao;
  Except
  End;
end;

constructor TTransferencia.Create(AOwner: TComponent);
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

function TTransferencia.Deletar(CdCNC,CdTRF:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdTRF,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TTransferencia.Destroy;
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

function TTransferencia.FinalizaEdicao:Boolean;
var
  CdCNC, CdTRF: integer;
  mensagem : string;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  if not VerificaInteiroBranco(ECodigoPCP.Text) then
    ECodigoPCP.Text := '0';
  mensagem := '';
  if (ECNCDest.Text = '') then
    mensagem:=mensagem+'Destino inválido!'+#13;
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      CdCNC := CodigoCNC;
      if Inserirauto then
      Begin
        Result := True;
        Estado:=0;
        AtualizaControles(False);
        Close;
        Open;
        LocalizarCod(SCodigo,CdCNC);
      end;
    End
    Else If Estado=2 then
    Begin
      CdCNC := CodigoCNC;
      CdTRF := CodigoTRF;
      if Alterarauto then
      Begin
        Result := True;
        Estado:=0;
        AtualizaControles(False);
        Close;
        Open;
        LocalizarCod(CdTRF,CdCNC);
      end;
    End;
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

{ Insere um Cliente }
function TTransferencia.Inserir(CdCNC, CdTRF, PTotItens,PCNCORi,PCNCDest,FunOrigem,FunDestino: Integer; PObs:String;PAutomatica:Boolean; CdPCP, PSit, PTipoDoc, PFormaPag:integer):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdTRF=0 then
    Cod    := ProximoCodigo('TRF_CODIGO')
  else
    Cod    := CdTRF;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     Insert;
     try
       CodigoTRF    := Cod;
       CodigoCNC    := CdCNC;
       CodigoUSU    := CConfiguracao.CodigoUSU;
       Data         := CConfiguracao.DataHora;
       NotaFiscal   := 0;
       TotItens     := PTotItens;
       CNCOri       := PCNCOri;
       CNCDest      := PCNCDest;
       Automatica   := PAutomatica;
       CodigoPCP    := CdPCP;
       FuncionarioOrigem  := FunOrigem;
       FuncionarioDestino := FunDestino;
       TipoDocumento := PTipoDoc;
       FormaPgto     := PFormaPag;
       Situacao      := PSit;
       Observacao    := PObs;
       try
         Post;
         GeraLog(8040, CdCNC, CdTRF, 'INSERIR Destino:'+IntToStr(PCNCDest));
         Result := True;
       except
         Cancel;
         ShowMessage('Não foi possível incluir a Transferência corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
       end;
     except
       ShowMessage('Não foi possível incluir a Transferência! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TTransferencia.InserirAuto:Boolean;
var
  CdCNC, CdTRF, iDestino: integer;
  sDetalhe: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdTRF := SCodigo;
  iDestino  := ECNCDest.KeyValue;
  sDetalhe := '';
  try
    append;
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoTRF   := SCodigo;
    except
    end;
    try
      CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      NotaFiscal   := 0;
    except
    end;
    try
      Situacao  := 0;
    except
    end;
    try
      TotItens  := StrToInt(ETotItens.Text);
    except
    end;
    try
      CNCOri    := ECNCOri.KeyValue;
    except
    end;
    try
      CNCDest   := ECNCDest.KeyValue;
    except
    end;
    try
      TipoDocumento  := ETipoDocumento.KeyValue;
    except
    end;
    try
      FormaPgto  := EFormaPgto.KeyValue;
    except
    end;
    try
      Data    := CConfiguracao.DataHora;
    except
    end;
    try
      Automatica    := False;
    except
    end;
    try
      CodigoPCP    := StrToInt(ECodigoPCP.Text);
    except
    end;
    try
      if EFuncionarioOrigem.Text <> '' then
        FuncionarioOrigem    := EFuncionarioOrigem.KeyValue
      else
        FuncionarioOrigem    := 0;
      sDetalhe := sDetalhe + ' FUNOri:'+EFuncionarioOrigem.Text;
    except
    end;
    try
      if EFuncionarioDestino.Text <> '' then
        FuncionarioDestino    := EFuncionarioDestino.KeyValue
      else
        FuncionarioDestino    := 0;
      sDetalhe := sDetalhe + ' FUNOri:'+EFuncionarioOrigem.Text;
    except
    end;
    try
      Observacao := EObservacao.Text;
    except
    end;

    try
      Post;
      GeraLog(8040, CdCNC, CdTRF, 'INSERIR Destino:'+IntToStr(iDestino)+' PCP:'+ECodigoPCP.Text+sDetalhe);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TTransferencia.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoTRF.Clear;
  except
  end;
  Try
    ECNCDest.KeyValue := -1;
  Except
  End;
  Try
    if Estado <> 1 then
      ECNCOri.KeyValue := -1
    else
      ECNCOri.KeyValue := CConfiguracao.CodigoCNC;
  Except
  End;
  Try
    if Estado <> 1 then
      ETipoDocumento.KeyValue := -1
    else
      ETipoDocumento.KeyValue := CConfiguracao.TipoDocumento;
  Except
  End;
  Try
    EFormaPgto.KeyValue := -1;
  Except
  End;
  Try
    EAutomatica.Checked := False;
  Except
  End;
  Try
    ENotaFiscal.Clear;
  Except
  End;
  Try
    ESituacao.Clear;
  Except
  End;
  Try
    ETotItens.Clear;
  Except
  End;
  Try
    ECodigoPCP.Text := '0';
  Except
  End;
  Try
    EFuncionarioOrigem.KeyValue := 0;
  Except
  End;
  Try
    EFuncionarioDestino.KeyValue := 0;
  Except
  End;
  Try
    EObservacao.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EData.Clear
    else
      EData.text:=DateTimeToStr(CConfiguracao.DataHora);
  Except
  End;
end;

{ Localiza um cliente }
function TTransferencia.LocalizarCod(CdTRF,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdTRF<>CodigoTRF) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;TRF_CODIGO', vararrayof([CdCNC, CdTRF]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TTransferencia.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
  Try
    EDataAlterado.text:=DateTimeToStr(CConfiguracao.DataHora);
  Except
  End;
end;

procedure TTransferencia.PreparaInsercao;
begin
  ProximoCodigo('TRF_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TTransferencia.deletarauto:Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      Result := True;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
