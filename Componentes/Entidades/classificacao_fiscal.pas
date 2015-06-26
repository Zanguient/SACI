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
unit Classificacao_fiscal;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Variants, Funcoes;

type
  TClassificacao_fiscal = class(TSQuery)
    private
      { Private fields of TClassificacao_fiscal }
        { Storage for property CodigoCLF }
        FCodigoCLF : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoCLF }
        FECodigoCLF : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EExibir }
        FEExibir : TEdit;
        { Storage for property EICMS }
        FEICMS : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TMemo;
        { Storage for property EReducao }
        FEReducao : TEdit;
        { Storage for property Exibir }
        FExibir : String;
        { Storage for property ICMS }
        FICMS : Double;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Reducao }
        FReducao : Double;

      { Private methods of TClassificacao_fiscal }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCLF }
        function GetCodigoCLF : Integer;
        { Write method for property CodigoCLF }
        procedure SetCodigoCLF(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
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
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Exibir }
        function GetExibir : String;
        { Write method for property Exibir }
        procedure SetExibir(Value : String);
        { Read method for property ICMS }
        function GetICMS : Double;
        { Write method for property ICMS }
        procedure SetICMS(Value : Double);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Reducao }
        function GetReducao : Double;
        { Write method for property Reducao }
        procedure SetReducao(Value : Double);

    protected
      { Protected fields of TClassificacao_fiscal }

      { Protected methods of TClassificacao_fiscal }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TClassificacao_fiscal }

      { Public methods of TClassificacao_fiscal }
        { Altera um Cliente }
        function Alterar(CdCNC,CdCLF: integer;Desc:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCLF:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC,CdCLF: integer;Desc:String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdCLF:Integer):Boolean;
        function LocalizarDescricao(Descricao:string):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TClassificacao_fiscal }
        { Código do Cliente }
        property CodigoCLF : Integer read GetCodigoCLF write SetCodigoCLF;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoCLF : TEdit read FECodigoCLF write FECodigoCLF;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EExibir : TEdit read FEExibir write FEExibir;
        property EICMS : TEdit read FEICMS write FEICMS;
        property EObservacao : TMemo read FEObservacao write FEObservacao;
        property EReducao : TEdit read FEReducao write FEReducao;
        property Exibir : String read GetExibir write SetExibir;
        property ICMS : Double read GetICMS write SetICMS;
        property Observacao : String read GetObservacao write SetObservacao;
        property Reducao : Double read GetReducao write SetReducao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TClassificacao_fiscal with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TClassificacao_fiscal]);
end;

{ Method to set variable and property values and create objects }
procedure TClassificacao_fiscal.AutoInitialize;
begin
     FECodigoCLF := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
     FEExibir := nil;
     FEICMS := nil;
     FEObservacao := nil;
     FEReducao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TClassificacao_fiscal.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCLF then
        FECodigoCLF := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEExibir then
        FEExibir := nil;
     if AComponent = FEICMS then
        FEICMS := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEReducao then
        FEReducao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TClassificacao_fiscal.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCLF }
function TClassificacao_fiscal.GetCodigoCLF : Integer;
begin
  try
    Result := Self.fieldByName('CLF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCLF }
procedure TClassificacao_fiscal.SetCodigoCLF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLF_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TClassificacao_fiscal.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TClassificacao_fiscal.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TClassificacao_fiscal.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TClassificacao_fiscal.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TClassificacao_fiscal.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CLF_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TClassificacao_fiscal.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLF_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLF_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TClassificacao_fiscal.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('CLF_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TClassificacao_fiscal.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLF_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLF_DT_CADASTRO"!');
  end;
end;

{ Read method for property Descricao }
function TClassificacao_fiscal.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('CLF_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TClassificacao_fiscal.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLF_DESCRICAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLF_DESCRICAO"!');
    end;
end;

{ Read method for property Exibir }
function TClassificacao_fiscal.GetExibir : String;
begin
  try
    Result := Self.fieldByName('CLF_EXIBIR').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Exibir }
procedure TClassificacao_fiscal.SetExibir(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLF_EXIBIR').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLF_EXIBIR"!');
    end;
end;

{ Read method for property ICMS }
function TClassificacao_fiscal.GetICMS : Double;
begin
  try
    Result := Self.fieldByName('CLF_ICMS').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ICMS }
procedure TClassificacao_fiscal.SetICMS(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLF_ICMS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLF_ICMS"!');
    end;
end;

{ Read method for property Observacao }
function TClassificacao_fiscal.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('CLF_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Observacao }
procedure TClassificacao_fiscal.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLF_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLF_OBSERVACAO"!');
    end;
end;

{ Read method for property Reducao }
function TClassificacao_fiscal.GetReducao : Double;
begin
  try
    Result := Self.fieldByName('CLF_REDUCAO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Reducao }
procedure TClassificacao_fiscal.SetReducao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLF_REDUCAO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLF_REDUCAO"!');
    end;
end;

{ Altera um Cliente }
function TClassificacao_fiscal.Alterar(CdCNC,CdCLF: integer;Desc:String):boolean;
begin
  result := false;
  If not(localizarCod(CdCLF)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      Descricao  := Desc;
      try
        Post;
        result := true;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TClassificacao_fiscal.AlterarAuto:Boolean;
begin
  Result:=false;
  try
    edit;
    try
      CodigoUSU       :=     CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado    :=     StrToDateTime(EDataAlterado.Text);
    except
    end;
    try
      Exibir          :=     EExibir.Text;
    except
    end;
    try
      ICMS            :=     StrToFloat(EICMS.Text);
    except
    end;
    try
      Reducao         :=     StrToFloat(EReducao.Text);
    except
    end;
    try
      Descricao       :=     EDescricao.Text;
    except
    end;
    try
      Observacao       :=     EObservacao.Text;
    except
    end;
    try
      Post;
      Result:=True;
      GeraLog(920,CConfiguracao.CodigoCNC,CodigoCLF);
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except    
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TClassificacao_fiscal.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    EExibir.Enabled        := Habilitar;
  except
  end;
  try
    EICMS.Enabled        := Habilitar;
  except
  end;
  try
    EReducao.Enabled        := Habilitar;
  except
  end;
  try
    EDescricao.Enabled        := Habilitar;
  except
  end;
  try
    EObservacao.Enabled        := Habilitar;
  except
  end;
end;


procedure TClassificacao_fiscal.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TClassificacao_fiscal.CarregaDados;
begin
  Try
    ECodigoCLF.Text      := IntToStr(CodigoCLF);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text   := formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text   := formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    EExibir.Text         := Exibir;
  except
  end;
  try
    EICMS.Text           := format('%.2f',[ICMS]);
  except
  end;
  try
    EReducao.Text        := format('%.2f',[Reducao]);
  except
  end;
  try
    EDescricao.Text      := Descricao;
  except
  end;
  try
    EObservacao.Text      := Observacao;
  except
  end;
end;

constructor TClassificacao_fiscal.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CLASSIFICACAO_FISCAL';

     { Code to perform other tasks when the component is created }

end;

function TClassificacao_fiscal.Deletar(CdCLF:Integer):Boolean;
var
  CdCNC: integer;
begin
  Result := False;
  If not(localizarCod(CdCLF)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      If Delete then
      Begin
        Result := True;
        GeraLog(910,CdCNC,CdCLF);
        RegistrarDel(CdCNC,1240(*ClassificacaoFiscal*),CdCLF);
        if TQuery(Self).IsEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TClassificacao_fiscal.Destroy;
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

function TClassificacao_fiscal.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  Aux:TdatasetNotifyEvent;
begin
  mensagem:='';
  if EDescricao.Text = '' then
    mensagem:=mensagem+'Descricao inválida!'+#13;
  If LocalizarDescricao(EDescricao.Text) Then
    mensagem:=mensagem+ 'Classificacao Fiscal ja cadastrada!';
  If not VerificaFloatBranco(EReducao.Text) Then
    mensagem:=mensagem+ 'Redução de ICMS de Venda inválido!';
  If mensagem <>'' Then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
  else
  Begin
    Aux:=AfterScroll;
    afterScroll:=nil;
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
      cod:=codigoCLF;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        Estado:=0;
        AtualizaControles(False);
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

{ Insere um Cliente }
function TClassificacao_fiscal.Inserir(CdCNC,CdCLF: integer;Desc:String):boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdCLF=0 then
    Cod    := ProximoCodigo('CLF_CODIGO')
  else
    Cod    := CdCLF;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  else
  begin   
    try
      INSERT;
      CodigoCLF      := Cod;
      CodigoCNC          := CdCNC;
      Descricao          := Desc;
      Reducao            := 0;
      try
        Post;
        result:=true;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

function TClassificacao_fiscal.InserirAuto:Boolean;
begin
  result:=False;
  try
    append;
    try
      codigocnc       := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoCLF       := SCodigo;
    except
    end;
    try
      CodigoUSU       := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro    := StrToDateTime(EDataCadastro.Text);
    except
    end;
    try
      Exibir          := EExibir.Text;
    except
    end;
    try
      ICMS            := StrToFloat(EICMS.Text);
    except
    end;
    try
      Reducao         := StrToFloat(EReducao.Text);
    except
    end;
    try
      Descricao       := EDescricao.Text;
    except
    end;
    try
      Observacao      := EObservacao.Text;
    except
    end;
    try
      Post;
      result:=True;
      GeraLog(900,CConfiguracao.CodigoCNC,SCodigo);
    except       
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TClassificacao_fiscal.LimpaCampos;
begin
  try
    ECodigoCLF.Clear;
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
    EExibir.Clear;
  except
  end;
  try
    EICMS.Clear;
  except
  end;
  try
    EReducao.Clear;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    EObservacao.Clear;
  except
  end;
end;

{ Localiza um cliente }
function TClassificacao_fiscal.LocalizarCod(CdCLF:Integer):Boolean;
begin
  If (CdCLF<>CodigoCLF) Then
    If locate('CLF_CODIGO', CdCLF, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TClassificacao_fiscal.LocalizarDescricao(Descricao:string):Boolean;
begin
  With CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text:='SELECT CNC_CODIGO FROM CLASSIFICACAO_FISCAL '+
      ' WHERE CLF_DESCRICAO="'+Descricao+'" '+
      ' AND CLF_CODIGO<>'+ESCodigo.Text;//ECodigoCLF.Text;
    Open;
    Result := not isEmpty
  end;
end;

procedure TClassificacao_fiscal.PreparaAlteracao;
begin
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  Estado:=2;
  AtualizaControles(True);
end;

procedure TClassificacao_fiscal.PreparaInsercao;
begin
  ProximoCodigo('CLF_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
  try
    EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

function TClassificacao_fiscal.deletarauto:Boolean;
var
  CdCNC, CdCLF: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdCLF := CodigoCLF;
    If Delete then
    Begin
      result:=true;
      GeraLog(910,CdCNC,CdCLF);
      RegistrarDel(CdCNC,1240(*ClassificacaoFiscal*),CdCLF);
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end
    else
      Result := False;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
