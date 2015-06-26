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
unit SolicitPecRep;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Fornecedor, Configuracao, Dbgrids, Funcoes, 
     Variants;

type
  TSolicitPecRep = class(TSQuery)
    private
      { Private fields of TSolicitPecRep }
        { Storage for property CFornecedor }
        FCFornecedor : TFornecedor;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoSPR }
        FCodigoSPR : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoSPR }
        FECodigoSPR : TEdit;
        { Storage for property EDataInicio }
        FEDataInicio : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EFornecedor }
        FEFornecedor : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property EProduto }
        FEProduto : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Fornecedor }
        FFornecedor : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Produto }
        FProduto : Integer;
        { Storage for property Quantidade }
        FQuantidade : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TSolicitPecRep }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoSPR }
        function GetCodigoSPR : Integer;
        { Write method for property CodigoSPR }
        procedure SetCodigoSPR(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Fornecedor }
        function GetFornecedor : Integer;
        { Write method for property Fornecedor }
        procedure SetFornecedor(Value : Integer);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Produto }
        function GetProduto : Integer;
        { Write method for property Produto }
        procedure SetProduto(Value : Integer);
        { Read method for property Quantidade }
        function GetQuantidade : Integer;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Integer);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TSolicitPecRep }

      { Protected methods of TSolicitPecRep }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TSolicitPecRep }

      { Public methods of TSolicitPecRep }
        { Altera uma solicitação }
        function Alterar(CdCNC,CdSPR,CdProduto,CdFornecedor, PQuantidade,PSituacao: integer; PData:TDateTime;PDescricao,POBS:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CDSPR:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Grupo }
        function Inserir(CdCNC,CdSPR,CdProduto,CdFornecedor, PQuantidade,PSituacao: integer; PData:TDateTime;PDescricao,POBS:String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um grupo de consórcio }
        function LocalizarCod(CDSPR,CDCNC:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TSolicitPecRep }
        property CFornecedor : TFornecedor
             read FCFornecedor write FCFornecedor;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Grupo de Consórcio }
        property CodigoSPR : Integer read GetCodigoSPR write SetCodigoSPR;
        property Data : Tdatetime read GetData write SetData;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoSPR : TEdit read FECodigoSPR write FECodigoSPR;
        property EDataInicio : TMaskEdit read FEDataInicio write FEDataInicio;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EFornecedor : TEdit read FEFornecedor write FEFornecedor;
        property EOBS : TMemo read FEOBS write FEOBS;
        property EProduto : TEdit read FEProduto write FEProduto;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property Fornecedor : Integer read GetFornecedor write SetFornecedor;
        property OBS : String read GetOBS write SetOBS;
        property Produto : Integer read GetProduto write SetProduto;
        property Quantidade : Integer read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TSolicitPecRep with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TSolicitPecRep]);
end;

{ Method to set variable and property values and create objects }
procedure TSolicitPecRep.AutoInitialize;
begin
     FECodigoSPR := nil;
     FEDataInicio := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
     FEFornecedor := nil;
     FEOBS := nil;
     FEProduto := nil;
     FEQuantidade := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TSolicitPecRep.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoSPR then
        FECodigoSPR := nil;
     if AComponent = FEDataInicio then
        FEDataInicio := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEFornecedor then
        FEFornecedor := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEProduto then
        FEProduto := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TSolicitPecRep.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TSolicitPecRep.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TSolicitPecRep.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoSPR }
function TSolicitPecRep.GetCodigoSPR : Integer;
begin
  try
    Result := Self.fieldByName('SPR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoSPR }
procedure TSolicitPecRep.SetCodigoSPR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SPR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SPR_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TSolicitPecRep.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('SPR_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TSolicitPecRep.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SPR_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SPR_DATA"!');
  end;
end;

{ Read method for property Descricao }
function TSolicitPecRep.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('SPR_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TSolicitPecRep.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SPR_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SPR_DESCRICAO"!');
  end;
end;

{ Read method for property Fornecedor }
function TSolicitPecRep.GetFornecedor : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Fornecedor }
procedure TSolicitPecRep.SetFornecedor(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FOR_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
  end;
end;

{ Read method for property OBS }
function TSolicitPecRep.GetOBS : String;
begin
  try
    Result := Self.fieldByName('SPR_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TSolicitPecRep.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('SPR_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "SPR_OBSERVACAO"!');
  end;
end;

{ Read method for property Produto }
function TSolicitPecRep.GetProduto : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Produto }
procedure TSolicitPecRep.SetProduto(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PRD_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
  end;
end;

{ Read method for property Quantidade }
function TSolicitPecRep.GetQuantidade : Integer;
begin
  try
    Result := Self.fieldByName('SPR_QUANTIDADE').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TSolicitPecRep.SetQuantidade(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SPR_QUANTIDADE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SPR_QUANTIDADE"!');
    end;
end;

{ Read method for property Situacao }
function TSolicitPecRep.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('SPR_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TSolicitPecRep.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SPR_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SPR_SITUACAO"!');
    end;
end;

{ Altera uma solicitação }
function TSolicitPecRep.Alterar(CdCNC,CdSPR,CdProduto,CdFornecedor, PQuantidade,PSituacao: integer; PData:TDateTime;PDescricao,POBS:String):boolean;
begin
  result := true;
  If not(localizarCod(CdSPR,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      Produto        := cdProduto;
      Fornecedor     := cdFornecedor;
      Quantidade     := PQuantidade;
      Situacao       := PSituacao;
      Data           := PData;
      Descricao      := PDescricao;
      Obs            := POBS;

      try
        Post;

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

function TSolicitPecRep.AlterarAuto:Boolean;
begin
    try
      edit;
      try
        Descricao := EDescricao.Text;
      except
      end;
      try
        Produto := StrToInt(EProduto.Text);
      except
      end;
      try
        Fornecedor := StrToInt(EFornecedor.Text);
      except
      end;
      try
        Quantidade := StrToInt(EQuantidade.Text);
      except
      end;
      try
        Situacao := ESituacao.itemindex;
      except
      end;
      try
        Data := StrToDateTime(EDataInicio.Text);
      except
      end;
      try
         Obs := EOBS.Text;
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

procedure TSolicitPecRep.AtualizaControles(Habilitar:Boolean);
begin
 Try
   EDbgrid.Enabled           :=not Habilitar;
 except
 end;
 try
   EFornecedor.Enabled  :=Habilitar;
   except
 end;
 try
   EDescricao.Enabled   :=Habilitar;
   except
 end;
 try
   EDataInicio.Enabled  :=Habilitar;
   except
 end;
 try
   EQuantidade.Enabled  :=Habilitar;
   except
 end;
 try
   ESituacao.Enabled    :=Habilitar;
   except
 end;
 try
   EOBS.Enabled         :=Habilitar;
   except
 end;
end;

procedure TSolicitPecRep.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TSolicitPecRep.CarregaDados;
begin
 try
   ECodigoSPR.Text           :=IntToStr(CodigoSPR);
   except
 end;
 try
   if Data=0 then
     EDataInicio.Text      :=''
   else
     EDataInicio.Text          :=FormatDateTime('dd/mm/yyyy', Data);
   except
 end;
 try
   EFornecedor.Text        :=IntToStr(Fornecedor);
 except
 end;
 try
   EProduto.Text           :=IntToStr(Produto);
 except
 end;
 try
   EDescricao.Text           :=Descricao;
   except
 end;
 try
   EQuantidade.Text          :=InttoStr(Quantidade);
   except
 end;
 try
   ESituacao.itemindex        :=Situacao;
   except
 end;
 try
   EOBS.Text                 :=Obs;
   except
 end;
end;

constructor TSolicitPecRep.Create(AOwner: TComponent);
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

function TSolicitPecRep.Deletar(CdCNC,CDSPR:Integer):Boolean;
var
  CdPRD,QTD:integer;
begin
  Result := False;
  If not(localizarCod(CdSPR,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdPRD:=Produto;
      QTD:=Quantidade;
      if Delete then
      Begin
        Result := True;
        GeraLog(1190,CdCNC,CdSPR,'PRD:'+IntToStr(CdPRD)+' QTD:'+IntToStr(QTD));
        RegistrarDel(CdCNC,1950(*SOLICITACAO_DE_PECAS_DE_REP*),CdSPR,'PRD:'+IntToStr(CdPRD)+' QTD:'+IntToStr(QTD));
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TSolicitPecRep.Destroy;
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

function TSolicitPecRep.FinalizaEdicao:Boolean;
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if EProduto.Text = '' then
    EProduto.Text := '0';
  If not Verificadata(EDatainicio.text) Then
    mensagem:=mensagem+'Data incorreta!'#13;
  if EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição incorreta!'+#13;
  if not VerificaInteiroBranco(EQuantidade.Text) then
    mensagem:=mensagem+'Quantidade incorreta!'+#13;
  If mensagem <>'' Then
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
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CodigoCNC);
        CarregaDados;
        AtualizaControles(False);
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoSPR;
      cdcnc:=codigoCnc;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod, cdcnc);
        CarregaDados;
        AtualizaControles(False);
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=aux;
    Estado:=0;
  end;
end;

{ Insere um Grupo }
function TSolicitPecRep.Inserir(CdCNC,CdSPR,CdProduto,CdFornecedor, PQuantidade,PSituacao: integer; PData:TDateTime;PDescricao,POBS:String):boolean;
Var
  Cod: Integer;
begin
  if CdSPR=0 then
    Cod    := ProximoCodigo('SPR_CODIGO')
  else
    Cod      := CdSPR;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
     if Estado=3 then
     begin
       result:=true;
       exit;
     end;
     Insert;
     try
       CodigoSPR      := Cod;
       CodigoCNC      := CdCNC;
       Produto        := cdProduto;
       Fornecedor     := cdFornecedor;
       Quantidade     := PQuantidade;
       Situacao       := PSituacao;
       Data           := PData;
       Descricao      := PDescricao;
       Obs            := POBS;

       try
         Post;
         result := true;

       except
         result := false;
         Cancel;
         ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
       end;
     except
       result := false;
       ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TSolicitPecRep.InserirAuto:Boolean;
begin
    try
      append;
      try
        CodigoSPR   := SCodigo;
      except
      end;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        Descricao := EDescricao.Text;
      except
      end;
      try
        Produto := StrToInt(EProduto.Text);
      except
      end;
      try
        Fornecedor := StrToInt(EFornecedor.Text);
      except
      end;
      try
        Quantidade := StrToInt(EQuantidade.Text);
      except
      end;
      try
        Situacao := ESituacao.itemindex;
      except
      end;
      try
        Data := StrToDateTime(EDataInicio.Text);
      except
      end;
      try
         Obs := EOBS.Text;
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

procedure TSolicitPecRep.LimpaCampos;
begin
  try
    EFornecedor.Clear;
  except
  end;
  try
    EProduto.Clear;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataInicio.Clear
    else
      EDataInicio.Text:=formatDateTime('dd/mm/yyyy',CConfiguracao.Data);
  except
  end;
  try
    EQuantidade.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ESituacao.Clear
    else
      ESituacao.ItemIndex:=0;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
end;

{ Localiza um grupo de consórcio }
function TSolicitPecRep.LocalizarCod(CDSPR,CDCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDSPR<>CodigoSPR) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;SPR_CODIGO', vararrayof([CDCNC, CDSPR]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TSolicitPecRep.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>Descricao Then
    If locate('SPR_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TSolicitPecRep.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TSolicitPecRep.PreparaInsercao;
begin
  ProximoCodigo('SPR_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TSolicitPecRep.deletarauto:Boolean;
var
  CdCNC, CdSPR, CdPRD, QTD:integer;
begin
  Result := False;
  try
    CdCNC:=CodigoCNC;
    CdSPR:=CodigoSPR;
    CdPRD:=Produto;
    QTD:=Quantidade;
    if Delete then
    Begin
      result:=true;
      GeraLog(1190,CdCNC,CdSPR,'PRD:'+IntToStr(CdPRD)+' QTD:'+IntToStr(QTD));
      RegistrarDel(CdCNC,1950(*SOLICITACAO_DE_PECAS_DE_REP*),CdSPR,'PRD:'+IntToStr(CdPRD)+' QTD:'+IntToStr(QTD));
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
