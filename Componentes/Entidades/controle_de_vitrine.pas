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
unit Controle_de_Vitrine;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Windows, Funcoes, 
     Variants;

type
  TControle_de_Vitrine = class(TSQuery)
    private
      { Private fields of TControle_de_Vitrine }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoCVT }
        FCodigoCVT : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataRetorno }
        FDataRetorno : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property Documento }
        FDocumento : Integer;
        { Storage for property ECodigoCVT }
        FECodigoCVT : TEdit;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookUpComboBox;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataRetorno }
        FEDataRetorno : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EDocumento }
        FEDocumento : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : Tedit;
        { Storage for property ESetor }
        FESetor : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipo }
        FETipo : TEdit;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Setor }
        FSetor : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;

      { Private methods of TControle_de_Vitrine }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoCVT }
        function GetCodigoCVT : Integer;
        { Write method for property CodigoCVT }
        procedure SetCodigoCVT(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property DataRetorno }
        function GetDataRetorno : TDateTime;
        { Write method for property DataRetorno }
        procedure SetDataRetorno(Value : TDateTime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Documento }
        function GetDocumento : Integer;
        { Write method for property Documento }
        procedure SetDocumento(Value : Integer);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Setor }
        function GetSetor : String;
        { Write method for property Setor }
        procedure SetSetor(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);

    protected
      { Protected fields of TControle_de_Vitrine }

      { Protected methods of TControle_de_Vitrine }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TControle_de_Vitrine }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TControle_de_Vitrine }
        procedure AtualizaControles(Habilitar:Boolean);
        function AuterarAuto:Boolean;
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCVT:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        { Localiza Direito de bonus }
        function LocalizarCod(CdCVT:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TControle_de_Vitrine }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoCVT : Integer read GetCodigoCVT write SetCodigoCVT;
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataRetorno : TDateTime
             read GetDataRetorno write SetDataRetorno;
        property Descricao : String read GetDescricao write SetDescricao;
        property Documento : Integer read GetDocumento write SetDocumento;
        property ECodigoCVT : TEdit read FECodigoCVT write FECodigoCVT;
        property ECodigoFUN : TDBLookUpComboBox
             read FECodigoFUN write FECodigoFUN;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataRetorno : TMaskEdit
             read FEDataRetorno write FEDataRetorno;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EDocumento : TEdit read FEDocumento write FEDocumento;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EQuantidade : Tedit read FEQuantidade write FEQuantidade;
        property ESetor : TEdit read FESetor write FESetor;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipo : TEdit read FETipo write FETipo;
        property OBS : String read GetOBS write SetOBS;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Setor : String read GetSetor write SetSetor;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TControle_de_Vitrine with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TControle_de_Vitrine]);
end;

{ Method to set variable and property values and create objects }
procedure TControle_de_Vitrine.AutoInitialize;
begin
     Estado := 0;
     FECodigoCVT := nil;
     FECodigoFUN := nil;
     FECodigoPRD := nil;
     FEDataCadastro := nil;
     FEDataRetorno := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
     FEDocumento := nil;
     FEOBS := nil;
     FEQuantidade := nil;
     FESetor := nil;
     FESituacao := nil;
     FETipo := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TControle_de_Vitrine.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCVT then
        FECodigoCVT := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataRetorno then
        FEDataRetorno := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEDocumento then
        FEDocumento := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FESetor then
        FESetor := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TControle_de_Vitrine.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TControle_de_Vitrine.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TControle_de_Vitrine.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoCVT }
function TControle_de_Vitrine.GetCodigoCVT : Integer;
begin
  try
    Result := Self.fieldByName('CVT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCVT }
procedure TControle_de_Vitrine.SetCodigoCVT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CVT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CVT_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TControle_de_Vitrine.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TControle_de_Vitrine.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TControle_de_Vitrine.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TControle_de_Vitrine.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TControle_de_Vitrine.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TControle_de_Vitrine.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataCadastro }
function TControle_de_Vitrine.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('CVT_DT_CADASTRO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataCadastro }
procedure TControle_de_Vitrine.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CVT_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CVT_DT_CADASTRO"!');
    end;
end;

{ Read method for property DataRetorno }
function TControle_de_Vitrine.GetDataRetorno : TDateTime;
begin
  try
    Result := Self.fieldByName('CVT_DT_RETORNO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataRetorno }
procedure TControle_de_Vitrine.SetDataRetorno(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CVT_DT_RETORNO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CVT_DT_RETORNO"!');
    end;
end;

{ Read method for property Descricao }
function TControle_de_Vitrine.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('CVT_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TControle_de_Vitrine.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CVT_DESCRICAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CVT_DESCRICAO"!');
    end;
end;

{ Read method for property Documento }
function TControle_de_Vitrine.GetDocumento : Integer;
begin
  try
    Result := Self.fieldByName('CVT_DOCUMENTO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Documento }
procedure TControle_de_Vitrine.SetDocumento(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CVT_DOCUMENTO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CVT_DOCUMENTO"!');
    end;
end;

{ Read method for property OBS }
function TControle_de_Vitrine.GetOBS : String;
begin
  try
    Result := Self.fieldByName('CVT_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TControle_de_Vitrine.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CVT_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CVT_OBSERVACAO"!');
  end;
end;

{ Read method for property Quantidade }
function TControle_de_Vitrine.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('CVT_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TControle_de_Vitrine.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CVT_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CVT_QUANTIDADE"!');
    end;
end;

{ Read method for property Setor }
function TControle_de_Vitrine.GetSetor : String;
begin
  try
    Result := Self.fieldByName('CVT_SETOR').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Setor }
procedure TControle_de_Vitrine.SetSetor(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CVT_SETOR').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CVT_SETOR"!');
    end;
end;

{ Read method for property Situacao }
function TControle_de_Vitrine.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CVT_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TControle_de_Vitrine.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CVT_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CVT_SITUACAO"!');
    end;
end;

{ Read method for property Tipo }
function TControle_de_Vitrine.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('CVT_TIPO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Tipo }
procedure TControle_de_Vitrine.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CVT_TIPO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CVT_TIPO"!');
    end;
end;

procedure TControle_de_Vitrine.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled                     :=not Habilitar;
  except
  end;
  Try
    ECodigoCVT.Enabled                  :=not Habilitar;
  except
  end;
  Try
    ECodigoFUN.Enabled                  := Habilitar;
  except
  end;
  try
    ECodigoPRD.Enabled                  := Habilitar;
  except
  end;
  try
    ESetor.Enabled                      := Habilitar;
  except
  end;
  try
    EDescricao.Enabled                  := Habilitar;
  except
  end;
  try
    EDocumento.Enabled                  := Habilitar;
  except
  end;
  try
    ETipo.Enabled                       := Habilitar;
  except
  end;
  try
    EQuantidade.Enabled                 := Habilitar;
  except
  end;
  try
    ESituacao.Enabled                   := Habilitar;
  except
  end;
  try
    EOBS.Enabled                        :=Habilitar;
  except
  end;
end;

function TControle_de_Vitrine.AuterarAuto:Boolean;
begin
    try
      edit;
      try
        CodigoPRD                   := StrToInt(ECodigoPRD.Text);
      except
      end;
      try
        CodigoFUN                    := ECodigoFUN.KeyValue;
      except
      end;
      try
        CodigoUSU                    := CConfiguracao.CodigoUSU;
      except
      end;
      try
        Setor                        := ESetor.Text;
      except
      end;
      try
        Descricao                    := EDescricao.Text;
      except
      end;
      try
        Documento                    := StrToInt(EDocumento.Text);
      except
      end;
      try
        Tipo                         := StrToInt(ETipo.Text);
      except
      end;
      try
        Quantidade                   := StrToInt(format('%.2f',[EQuantidade.Text]));
      except
      end;
      try
        DataRetorno                  := CConfiguracao.DataHora;
      except
      end;
      try
        Situacao                     := ESituacao.ItemIndex;
      except
      end;
      try
         OBS                         := EOBS.Text;
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

procedure TControle_de_Vitrine.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  CarregaDados;
end;

procedure TControle_de_Vitrine.CarregaDados;
begin
  try
    ECodigoCVT.Text    :=inttostr(CodigoCVT);
  except
  end;
  try
    ECodigoPRD.Text    :=inttostr(CodigoPRD);
  except
  end;
  try
    ECodigoFUN.KeyValue    :=CodigoFUN;
  except
  end;
  try
    ESetor.Text        :=Setor;
  except
  end;
  try
    EDescricao.Text    :=Descricao;
  except
  end;
  try
    EDocumento.Text    :=inttostr(Documento);
  except
  end;
  try
    ETipo.Text    :=inttostr(Tipo);
  except
  end;
  try
    EQuantidade.text    :=VirgPonto(FloatToStr(Quantidade));
  except
  end;
  try
    if DataCadastro > 0 then
//      EDataCadastro.Text        := FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataRetorno > 0 then
      EDataRetorno.Text        := FormatDateTime('dd/mm/yyyy hh:mm', DataRetorno)
    else
      EDataRetorno.Clear;
  except
  end;
  try
    ESituacao.ItemIndex          := Situacao;
  except
  end;
  try
    EOBS.Text                    :=OBS;
  except
  end;
end;

constructor TControle_de_Vitrine.Create(AOwner: TComponent);
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

function TControle_de_Vitrine.Deletar(CdCVT:Integer):Boolean;
begin
  If not(localizarCod(CdCVT)) Then
  Begin
    Result := False;
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      If Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        begin
          try
            ECodigoCVT.Clear;
          except
          end;
          try
            ECodigoPRD.Clear;
          except
          end;
          try
            ECodigoFUN.KeyValue:=-1;
          except
          end;
          try
            ESetor.Clear;
          except
          end;
          try
            EDescricao.Clear;
          except
          end;
          try
            EDocumento.Clear;
          except
          end;
          try
            ETipo.Clear;
          except
          end;
          try
            EQuantidade.Clear;
          except
          end;
          try
            EDataCadastro.Clear;
          except
          end;
          try
            EDataRetorno.Clear;
          except
          end;
          try
            ESituacao.ItemIndex:=0;
          except
          end;
          try
            EOBS.Clear;
          except
          end;
        end;
      end
      else
        Result := False;
    Except
      Result := False;
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
End;

destructor TControle_de_Vitrine.Destroy;
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

function TControle_de_Vitrine.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  mensagem:='';
  if not verificainteirobranco(ECodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto inválido!';

  if mensagem <> '' then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
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
        LocalizarCod(SCodigo);
        Estado:=0;
        AtualizaControles(False);
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoCVT;
      If Auterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=aux;
    CarregaDados;
  end;
end;

function TControle_de_Vitrine.InserirAuto:Boolean;
begin
  try
    append;
     try
       CodigoCVT                   := SCodigo;
     except
     end;
     try
       CodigoCNC                   := CConfiguracao.CodigoCNC;
     except
     end;
     try
       CodigoPRD                   := StrToInt(ECodigoPRD.Text);
     except
     end;
     try
       CodigoFUN                    := ECodigoFUN.KeyValue;
     except
     end;
     try
       CodigoUSU                    := CConfiguracao.CodigoUSU;
     except
     end;
     try
       Setor                        := ESetor.Text;
     except
     end;
     try
       Descricao                    := EDescricao.Text;
     except
     end;
     try
       Documento                    := StrToInt(EDocumento.Text);
     except
     end;
     try
       Tipo                         := StrToInt(ETipo.Text);
     except
     end;
     try
       Quantidade                   := StrToFloat(EQuantidade.Text);
     except
     end;
     try
       DataCadastro                  := CConfiguracao.DataHora;
     except
     end;
     try
       Situacao                     := ESituacao.ItemIndex;
     except
     end;
     try
        OBS                         := EOBS.Text;
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

{ Localiza Direito de bonus }
function TControle_de_Vitrine.LocalizarCod(CdCVT:Integer):Boolean;
begin
  If (CdCVT<>CodigoCVT) Then
    If locate('CVT_CODIGO', CdCVT, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TControle_de_Vitrine.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TControle_de_Vitrine.PreparaInsercao;
begin
ProximoCodigo('CVT_CODIGO');
  try
    ECodigoCVT.text:= IntToStr(SCodigo);
  except
  end;
  try
    ECodigoPRD.Clear;
  except
  end;
  try
    ESetor.Clear;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    EDocumento.Clear;
  except
  end;
  try
    ETipo.Clear;
  except
  end;
  try
    EQuantidade.Clear;
  except
  end;
  try
    EDataCadastro.Clear;
  except
  end;
  try
    EDataRetorno.Clear;
  except
  end;
  try
    ESituacao.ItemIndex:=0;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
  Estado:=1;
  AtualizaControles(True);
end;

function TControle_de_Vitrine.deletarauto:Boolean;
begin
  try
    if Delete then
    Begin
      result:=true;
    end
    else
      Result := False;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
