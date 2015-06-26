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
unit CategProd;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Variants;

type
  TCategProd = class(TSQuery)
    private
      { Private fields of TCategProd }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoCTP }
        FCodigoCTP : Integer;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoCTP }
        FECodigoCTP : TEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property OBS }
        FOBS : String;

      { Private methods of TCategProd }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoCTP }
        function GetCodigoCTP : Integer;
        { Write method for property CodigoCTP }
        procedure SetCodigoCTP(Value : Integer);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);

    protected
      { Protected fields of TCategProd }

      { Protected methods of TCategProd }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TCategProd }

      { Public methods of TCategProd }
        { Altera uma Categoria de Produto }
        function Alterar(CdCNC,CdCTP: integer; PDescricao, POBS: String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdCTP:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere uma Categoria de produto }
        function Inserir(CdCNC,CdCTP: integer; PDescricao, POBS: String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza uma Categoria de Produto }
        function LocalizarCod(CdCTP,CdCNC:Integer):Boolean;
        function LocalizarDescricao(Descricao:string):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TCategProd }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Categoria da Produto }
        property CodigoCTP : Integer read GetCodigoCTP write SetCodigoCTP;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoCTP : TEdit read FECodigoCTP write FECodigoCTP;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EOBS : TMemo read FEOBS write FEOBS;
        property OBS : String read GetOBS write SetOBS;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCategProd with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCategProd]);
end;

{ Method to set variable and property values and create objects }
procedure TCategProd.AutoInitialize;
begin
     FECodigoCTP := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
     FEOBS := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCategProd.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCTP then
        FECodigoCTP := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCategProd.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TCategProd.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TCategProd.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoCTP }
function TCategProd.GetCodigoCTP : Integer;
begin
  try
    Result := Self.fieldByName('CTP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCTP }
procedure TCategProd.SetCodigoCTP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CTP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CTP_CODIGO"!');
    end;
end;

{ Read method for property Descricao }
function TCategProd.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('CTP_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TCategProd.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CTP_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CTP_DESCRICAO"!');
  end;
end;

{ Read method for property OBS }
function TCategProd.GetOBS : String;
begin
  try
    Result := Self.fieldByName('CTP_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TCategProd.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CTP_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CTP_OBSERVACAO"!');
  end;
end;

{ Altera uma Categoria de Produto }
function TCategProd.Alterar(CdCNC,CdCTP: integer; PDescricao, POBS: String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdCTP,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      Descricao      := PDescricao;
      OBS            := POBS;
      try
        Post;
        result := true;
      except
        result := false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result := false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TCategProd.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    edit;
    try
       Descricao  := EDescricao.Text;
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

procedure TCategProd.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 Try
   EDbgrid.Enabled           :=not Habilitar;
 except
 end;
 Try
   EDescricao.Enabled     :=Habilitar;
    except
 end;
 try
   EOBS.Enabled     :=Habilitar;
    except
 end;

end;

procedure TCategProd.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TCategProd.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 Try
   ECodigoCTP.Text           :=IntToStr(CodigoCTP);
    except
 end;
 try
   EDescricao.Text           :=Descricao;
    except
 end;
 try
   EOBS.Text                 :=OBS;
    except
 end;

end;

constructor TCategProd.Create(AOwner: TComponent);
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

function TCategProd.Deletar(CdCNC,CdCTP:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdCTP,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        GeraLog(870,CdCNC,CdCTP);
        RegistrarDel(CdCNC,1210(*CategoriaProduto*),CdCTP);
        if TQuery(Self).IsEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TCategProd.Destroy;
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

function TCategProd.FinalizaEdicao:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  if LocalizarDescricao(EDescricao.Text) then
    mensagem:=mensagem+'Categoria já cadastrada!'+#13;
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
        LocalizarCod(SCodigo, CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoCTP;
      cdcnc:=codigoCNC;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    else
      Result := False;
    afterscroll:=aux;
    CarregaDados;
  end;
end;

{ Insere uma Categoria de produto }
function TCategProd.Inserir(CdCNC,CdCTP: integer; PDescricao, POBS: String):boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdCTP=0 then
    Cod    := ProximoCodigo('CTP_CODIGO')
  else
    Cod    := CdCTP;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  else
  begin
    try
      iNSERT;
      CodigoCTP      := Cod;
      CodigoCNC      := CdCNC;
      Descricao      := PDescricao;
      OBS            := POBS;
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

function TCategProd.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (localizarCod(SCodigo,CodigoCNC)) Then
  begin
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
    result:=false;
  end
  Else
  begin
    try
      append;
      try
        CodigoCTP   := SCodigo;
      except
      end;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
         Descricao  := EDescricao.Text;
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
        result:=False;
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

procedure TCategProd.LimpaCampos;
begin
  try
    EDescricao.Clear;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
end;

{ Localiza uma Categoria de Produto }
function TCategProd.LocalizarCod(CdCTP,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdCTP<>CodigoCTP) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;CTP_CODIGO', vararrayof([CdCNC, CdCTP]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TCategProd.LocalizarDescricao(Descricao:string):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  With CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text:='SELECT CNC_CODIGO FROM CATEGORIA_DE_PRODUTO '+
      ' WHERE CNC_CODIGO='+IntToStr(CConfiguracao.CodigoCNC)+
      ' AND CTP_DESCRICAO="'+Descricao+'" AND CTP_CODIGO<>'+
      ECodigoCTP.Text;
    Open;
    Result := not isEmpty
  end;
end;

function TCategProd.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>Descricao Then
    If locate('CTP_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TCategProd.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TCategProd.PreparaInsercao;
begin
  ProximoCodigo('CTP_CODIGO');
  Estado := 1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TCategProd.deletarauto:Boolean;
var
  CdCNC, CdCTP: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdCTP := CodigoCTP;
    if Delete then
    Begin
      result:=true;
      GeraLog(870,CdCNC,CdCTP);
      RegistrarDel(CdCNC,1210(*CategoriaProduto*),CdCTP);
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
