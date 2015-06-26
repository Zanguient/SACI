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
unit Insumos;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Windows, Funcoes, 
     Variants, Extctrls;

type
  TInsumos = class(TSQuery)
    private
      { Private fields of TInsumos }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoINS }
        FCodigoINS : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoINS }
        FECodigoINS : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EFoto }
        FEFoto : TImage;
        { Storage for property EINS_CodigoPRD }
        FEINS_CodigoPRD : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property INS_CodigoPRD }
        FINS_CodigoPRD : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TInsumos }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoINS }
        function GetCodigoINS : Integer;
        { Write method for property CodigoINS }
        procedure SetCodigoINS(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property INS_CodigoPRD }
        function GetINS_CodigoPRD : Integer;
        { Write method for property INS_CodigoPRD }
        procedure SetINS_CodigoPRD(Value : Integer);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TInsumos }

      { Protected methods of TInsumos }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TInsumos }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TInsumos }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdINS:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        { Localiza um Grau }
        function LocalizarCod(CdINS:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TInsumos }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoINS : Integer read GetCodigoINS write SetCodigoINS;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoINS : TEdit read FECodigoINS write FECodigoINS;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EFoto : TImage read FEFoto write FEFoto;
        property EINS_CodigoPRD : TEdit
             read FEINS_CodigoPRD write FEINS_CodigoPRD;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        { Código do Grupo }
        property INS_CodigoPRD : Integer
             read GetINS_CodigoPRD write SetINS_CodigoPRD;
        property OBS : String read GetOBS write SetOBS;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TInsumos with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TInsumos]);
end;

{ Method to set variable and property values and create objects }
procedure TInsumos.AutoInitialize;
begin
     Estado := 0;
     FECodigoINS := nil;
     FECodigoPRD := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEFoto := nil;
     FEINS_CodigoPRD := nil;
     FEOBS := nil;
     FEQuantidade := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TInsumos.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoINS then
        FECodigoINS := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEFoto then
        FEFoto := nil;
     if AComponent = FEINS_CodigoPRD then
        FEINS_CodigoPRD := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TInsumos.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TInsumos.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TInsumos.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoINS }
function TInsumos.GetCodigoINS : Integer;
begin
  try
    Result := Self.fieldByName('INS_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoINS }
procedure TInsumos.SetCodigoINS(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INS_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INS_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TInsumos.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TInsumos.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TInsumos.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TInsumos.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TInsumos.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('INS_DT_ALTERADO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataAlterado }
procedure TInsumos.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INS_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INS_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TInsumos.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('INS_DT_CADASTRO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataCadastro }
procedure TInsumos.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INS_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INS_DT_CADASTRO"!');
    end;
end;

{ Read method for property INS_CodigoPRD }
function TInsumos.GetINS_CodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('INS_PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property INS_CodigoPRD }
procedure TInsumos.SetINS_CodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INS_PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INS_PRD_CODIGO"!');
    end;
end;

{ Read method for property OBS }
function TInsumos.GetOBS : String;
begin
  try
    Result := Self.fieldByName('INS_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TInsumos.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('INS_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "INS_OBSERVACAO"!');
  end;
end;

{ Read method for property Quantidade }
function TInsumos.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('INS_QUANTIDADE').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Quantidade }
procedure TInsumos.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INS_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INS_QUANTIDADE"!');
    end;
end;

{ Read method for property Situacao }
function TInsumos.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('INS_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TInsumos.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INS_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INS_SITUACAO"!');
    end;
end;

function TInsumos.AlterarAuto:Boolean;
begin
    try
      edit;
      try
        INS_CodigoPRD         :=  StrToInt(EINS_CodigoPRD.Text);
      except
      end;
      try
        Quantidade            :=  StrToFloat(EQuantidade.Text);
      except
      end;
      try
        CodigoUSU              :=  CConfiguracao.CodigoUSU;
      except
      end;
      try
        DataAlterado  := CConfiguracao.DataHora;
      except
      end;
      try
        Situacao  := ESituacao.ItemIndex;
      except
      end;
      try
         OBS := EOBS.Text;
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

procedure TInsumos.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled        :=not Habilitar;
  except
  end;
  try
    if Estado<>2 Then
      EINS_CodigoPRD.Enabled    := Habilitar
    else
      EINS_CodigoPRD.Enabled    := false;
  except
  end;
  try
    EQuantidade.Enabled          := Habilitar;
  except
  end;
  try
    ESituacao.Enabled       := Habilitar;
  except
  end;
  try
    EOBS.Enabled           :=Habilitar;
    except
  end;
end;

procedure TInsumos.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  CarregaDados;
end;

procedure TInsumos.CarregaDados;
var foto:String;
begin
  try
    ECodigoINS.Text           :=IntToStr(CodigoINS);
  except
  end;
  try
    EQuantidade.Text          := format('%.2f',[Quantidade]);
  except
  end;
  try
    EINS_CodigoPRD.Text        :=IntToStr(INS_CodigoPRD);
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
    ESituacao.ItemIndex          := Situacao;
  except
  end;
  try
    EOBS.Text                  :=OBS;
  except
  end;
  try
    foto:=CConfiguracao.PastaImagens+'\Produto\00'+'-'+IntToStr(INS_CodigoPRD)+'.JPG';
    Efoto.Picture.LoadFromFile(foto);
  Except
      EFoto.Picture:=nil;
  end;
end;

constructor TInsumos.Create(AOwner: TComponent);
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

function TInsumos.Deletar(CdINS:Integer):Boolean;
begin
  If not(localizarCod(CdINS)) Then
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
            ECodigoINS.Clear;
          except
          end;
          try
            EDataCadastro.Clear;
          except
          end;
          try
            EDataAlterado.Clear;
          except
          end;
          try
            EINS_CodigoPRD.Clear;
          except
          end;
          try
            EQuantidade.Clear;
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
end;

destructor TInsumos.Destroy;
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

function TInsumos.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  mensagem:='';
  if not VerificaFloatBranco(EINS_CodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto inválido!';
  if not VerificaFloatBranco(EQuantidade.Text) then
    mensagem:=mensagem+'Quantidade inválida!';

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
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoINS;
      If Alterarauto then
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

function TInsumos.InserirAuto:Boolean;
begin
  result:=False;
  with CConfiguracao.QueryConsultas do
  begin
    close;
    SQL.Text:='SELECT * FROM INSUMO '+
      ' WHERE INS_PRD_CODIGO = ' +EINS_CodigoPRD.Text+
      ' AND PRD_CODIGO = '+ECodigoPRD.Text+
      ' AND CNC_CODIGO = '+IntToStr(CConfiguracao.CodigoCNC);
    open;
    if not IsEmpty Then
    Begin
      Showmessage('Insumo já cadastrado para este Produto!');
      cancel;
      Exit;
    end;
  end;
  try
    append;
    try
      CodigoINS   := SCodigo;
    except
    end;
    try
      CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
       CodigoPRD  :=  StrToInt(ECodigoPRD.Text);
    except
    end;
    try
       INS_CodigoPRD  :=  StrToInt(EINS_CodigoPRD.Text);
    except
    end;
    try
       DataCadastro  := CConfiguracao.DataHora;
    except
    end;
    try
      Quantidade  := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      Situacao  := ESituacao.ItemIndex;
    except
    end;
    try
       OBS  := EOBS.Text;
    except
    end;
    try
      Post;
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

{ Localiza um Grau }
function TInsumos.LocalizarCod(CdINS:Integer):Boolean;
begin
  If (CdINS<>CodigoINS) Then
    If locate('INS_CODIGO', CdINS, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TInsumos.PreparaAlteracao;
begin
  try
    EDataAlterado.Text  := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
  Estado:=2;
  AtualizaControles(True);
end;

procedure TInsumos.PreparaInsercao;
begin
  ProximoCodigo('INS_CODIGO');
  try
    EDataCadastro.Text  := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    EQuantidade.Clear;
  except
  end;
  try
    EINS_CodigoPRD.Clear;
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

function TInsumos.deletarauto:Boolean;
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
