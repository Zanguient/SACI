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
unit Item_de_Embarque;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Embarque, Configuracao, Variants, 
     Funcoes;

type
  TItem_de_Embarque = class(TSQuery)
    private
      { Private fields of TItem_de_Embarque }
        { Storage for property CEmbarque }
        FCEmbarque : TEmbarque;
        { Storage for property CNC_Codigo_Ent }
        FCNC_Codigo_Ent : Integer;
        { Storage for property CProduto }
        FCProduto : TProduto;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoEMB }
        FCodigoEMB : Integer;
        { Storage for property CodigoENT }
        FCodigoENT : Integer;
        { Storage for property CodigoIEB }
        FCodigoIEB : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Destino }
        FDestino : String;
        { Storage for property ECodigoEMB }
        FECodigoEMB : TDBLookupComboBox;
        { Storage for property ECodigoENT }
        FECodigoENT : TDBLookUpComboBox;
        { Storage for property ECodigoIEB }
        FECodigoIEB : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TDBLookupComboBox;
        { Storage for property EDestino }
        FEDestino : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ETipoEnt }
        FETipoEnt : TComboBox;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TipoEnt }
        FTipoEnt : Integer;

      { Private methods of TItem_de_Embarque }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CNC_Codigo_Ent }
        function GetCNC_Codigo_Ent : Integer;
        { Write method for property CNC_Codigo_Ent }
        procedure SetCNC_Codigo_Ent(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoEMB }
        function GetCodigoEMB : Integer;
        { Write method for property CodigoEMB }
        procedure SetCodigoEMB(Value : Integer);
        { Read method for property CodigoENT }
        function GetCodigoENT : Integer;
        { Write method for property CodigoENT }
        procedure SetCodigoENT(Value : Integer);
        { Read method for property CodigoIEB }
        function GetCodigoIEB : Integer;
        { Write method for property CodigoIEB }
        procedure SetCodigoIEB(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Destino }
        function GetDestino : String;
        { Write method for property Destino }
        procedure SetDestino(Value : String);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property TipoEnt }
        function GetTipoEnt : Integer;
        { Write method for property TipoEnt }
        procedure SetTipoEnt(Value : Integer);

    protected
      { Protected fields of TItem_de_Embarque }

      { Protected methods of TItem_de_Embarque }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_de_Embarque }

      { Public methods of TItem_de_Embarque }
        { Altera um Ítem de Embarque }
        function Alterar(CdCNC, CdIEB, CdPRD, CdEMB, PTipoEnt, PCNC_Codigo_Ent, CdEnt: Integer; PQuantidade: Double; PDestino:String;PSituacao:integer):boolean;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC, CdIEB:Integer);
        destructor Destroy; override;
        { Insere um Ítem de Embarque }
        function Inserir(CdCNC,CdIEB,CdPRD, CdEMB, PTipoEnt, PCNC_Codigo_Ent, CdEnt: Integer; PQuantidade: Double; PDestino:String;PSituacao:integer):boolean;
        { Localiza um Ítem de Embarque }
        function LocalizarCod(CdIEB, CdCNC: Integer):Boolean;

    published
      { Published properties of TItem_de_Embarque }
        property CEmbarque : TEmbarque read FCEmbarque write FCEmbarque;
        property CNC_Codigo_Ent : Integer
             read GetCNC_Codigo_Ent write SetCNC_Codigo_Ent;
        property CProduto : TProduto read FCProduto write FCProduto;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Embarque }
        property CodigoEMB : Integer read GetCodigoEMB write SetCodigoEMB;
        property CodigoENT : Integer read GetCodigoENT write SetCodigoENT;
        { Código do Ítem de Embarque }
        property CodigoIEB : Integer read GetCodigoIEB write SetCodigoIEB;
        { Código do Produto }
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Destino : String read GetDestino write SetDestino;
        property ECodigoEMB : TDBLookupComboBox
             read FECodigoEMB write FECodigoEMB;
        property ECodigoENT : TDBLookUpComboBox
             read FECodigoENT write FECodigoENT;
        property ECodigoIEB : TEdit read FECodigoIEB write FECodigoIEB;
        property ECodigoPRD : TDBLookupComboBox
             read FECodigoPRD write FECodigoPRD;
        property EDestino : TEdit read FEDestino write FEDestino;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ETipoEnt : TComboBox read FETipoEnt write FETipoEnt;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property TipoEnt : Integer read GetTipoEnt write SetTipoEnt;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Embarque with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Embarque]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Embarque.AutoInitialize;
begin
     FECodigoEMB := nil;
     FECodigoENT := nil;
     FECodigoIEB := nil;
     FECodigoPRD := nil;
     FEDestino := nil;
     FEQuantidade := nil;
     FETipoEnt := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_de_Embarque.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoEMB then
        FECodigoEMB := nil;
     if AComponent = FECodigoENT then
        FECodigoENT := nil;
     if AComponent = FECodigoIEB then
        FECodigoIEB := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDestino then
        FEDestino := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FETipoEnt then
        FETipoEnt := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Embarque.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CNC_Codigo_Ent }
function TItem_de_Embarque.GetCNC_Codigo_Ent : Integer;
begin
  try
    Result := Self.fieldByName('IEB_CNC_CODIGO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CNC_Codigo_Ent }
procedure TItem_de_Embarque.SetCNC_Codigo_Ent(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IEB_CNC_CODIGO_ENT').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IEB_CNC_CODIGO_ENT"!');
  end;
end;

{ Read method for property CodigoCNC }
function TItem_de_Embarque.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TItem_de_Embarque.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoEMB }
function TItem_de_Embarque.GetCodigoEMB : Integer;
begin
  try
    Result := Self.fieldByName('EMB_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoEMB }
procedure TItem_de_Embarque.SetCodigoEMB(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('EMB_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "EMB_CODIGO"!');
    end;
end;

{ Read method for property CodigoENT }
function TItem_de_Embarque.GetCodigoENT : Integer;
begin
  try
    Result := Self.fieldByName('IEB_ENT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoENT }
procedure TItem_de_Embarque.SetCodigoENT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IEB_ENT_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IEB_TIPO_CODIGO"!');
  end;
end;

{ Read method for property CodigoIEB }
function TItem_de_Embarque.GetCodigoIEB : Integer;
begin
  try
    Result := Self.fieldByName('IEB_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoIEB }
procedure TItem_de_Embarque.SetCodigoIEB(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IEB_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IEB_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItem_de_Embarque.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItem_de_Embarque.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItem_de_Embarque.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('IEB_DT_ALTERADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItem_de_Embarque.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IEB_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IEB_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TItem_de_Embarque.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('IEB_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItem_de_Embarque.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IEB_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IEB_DT_CADASTRO"!');
    end;
end;

{ Read method for property Destino }
function TItem_de_Embarque.GetDestino : String;
begin
  try
    Result := Self.fieldByName('IEB_DESTINO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Destino }
procedure TItem_de_Embarque.SetDestino(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IEB_DESTINO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IEB_DESTINO"!');
    end;
end;

{ Read method for property Quantidade }
function TItem_de_Embarque.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('IEB_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TItem_de_Embarque.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IEB_QUANTIDADE').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IEB_QUANTIDADE"!');
  end;
end;

{ Read method for property Situacao }
function TItem_de_Embarque.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('IEB_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TItem_de_Embarque.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IEB_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IEB_SITUACAO"!');
    end;
end;

{ Read method for property TipoEnt }
function TItem_de_Embarque.GetTipoEnt : Integer;
begin
  try
    Result := Self.fieldByName('IEB_TIPO_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoEnt }
procedure TItem_de_Embarque.SetTipoEnt(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IEB_TIPO_ENT').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IEB_TIPO_ENT"!');
    end;
end;

{ Altera um Ítem de Embarque }
function TItem_de_Embarque.Alterar(CdCNC, CdIEB, CdPRD, CdEMB, PTipoEnt, PCNC_Codigo_Ent, CdEnt: Integer; PQuantidade: Double; PDestino:String;PSituacao:integer):boolean;
begin
  If not(localizarCod(CdIEB,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoPRD      := CdPRD;
      CodigoEMB      := CdEMB;
      DataAlterado   := CConfiguracao.DataHora;
      Destino        := PDestino;
      Quantidade     := PQuantidade;
      TipoEnt        := PTipoEnt;
      CNC_Codigo_Ent := PCNC_Codigo_Ent;
      CodigoENT      := CdENT;
      Situacao       := PSituacao;
      try
        Post;
        result:=true;
      except
        result:=false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

constructor TItem_de_Embarque.Create(AOwner: TComponent);
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

procedure TItem_de_Embarque.Deletar(CdCNC, CdIEB:Integer);
begin
  If not(localizarCod(CdIEB,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      if TQuery(Self).isEmpty then
      begin
        Try
          ECodigoIEB.Clear;
        Except
        End;
        Try
          ECodigoEMB.KeyValue := 0;
        Except
        End;
        Try
          ECodigoENT.KeyValue := 0;
        Except
        End;
        Try
          ECodigoPRD.KeyValue := 0;
        Except
        End;
        Try
          EDestino.Text := '';
        Except
        End;
        Try
          EQuantidade.Clear;
        Except
        End;
        Try
          ETipoEnt.Text := '';
        Except
        End;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_de_Embarque.Destroy;
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

{ Insere um Ítem de Embarque }
function TItem_de_Embarque.Inserir(CdCNC,CdIEB,CdPRD, CdEMB, PTipoEnt, PCNC_Codigo_Ent, CdEnt: Integer; PQuantidade: Double; PDestino:String;PSituacao:integer):boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdIEB=0 then
    Cod    := ProximoCodigo('IEB_CODIGO')
  else
    Cod      := CdIEB;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO ITEM_DE_EMBARQUE '+
        '( IEB_CODIGO, CNC_CODIGO, IEB_DT_CADASTRO, PRD_CODIGO '+
        ',EMB_CODIGO,IEB_QUANTIDADE, IEB_TIPO_ENT '+
        ',IEB_CNC_CODIGO_ENT,IEB_ENT_CODIGO, IEB_DESTINO, IEB_SITUACAO) VALUES '+
        '( '+IntToStr(Cod)+
        ', '+IntToStr(CdCNC)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(CdPRD)+
        ', '+IntToStr(CdEMB)+
        ', '+VirgPonto(PQuantidade)+
        ', '+IntToStr(PTipoEnt)+
        ', '+IntToStr(PCNC_Codigo_Ent)+
        ', '+IntToStr(CdENT)+
        ',"'+PDestino+'" '+
        ', '+IntToStr(PSituacao)+')');
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
    end;
  end;
end;

{ Localiza um Ítem de Embarque }
function TItem_de_Embarque.LocalizarCod(CdIEB, CdCNC: Integer):Boolean;
begin
  If (CdIEB<>CodigoIEB) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; IEB_CODIGO', vararrayof([CdCNC, CdIEB]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;


end.
