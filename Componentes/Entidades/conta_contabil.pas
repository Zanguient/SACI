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
unit Conta_Contabil;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TConta_Contabil = class(TSQuery)
    private
      { Private fields of TConta_Contabil }
        { Storage for property CodigoCCT }
        FCodigoCCT : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property DC }
        FDC : String;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoCCT }
        FECodigoCCT : TEdit;
        { Storage for property EDC }
        FEDC : TComboBox;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property ELimiteGasto }
        FELimiteGasto : TEdit;
        { Storage for property LimiteGasto }
        FLimiteGasto : Double;

      { Private methods of TConta_Contabil }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCCT }
        function GetCodigoCCT : Integer;
        { Write method for property CodigoCCT }
        procedure SetCodigoCCT(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property DC }
        function GetDC : String;
        { Write method for property DC }
        procedure SetDC(Value : String);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property LimiteGasto }
        function GetLimiteGasto : Double;
        { Write method for property LimiteGasto }
        procedure SetLimiteGasto(Value : Double);

    protected
      { Protected fields of TConta_Contabil }

      { Protected methods of TConta_Contabil }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;
        procedure Loaded; override;

    public
      { Public fields and properties of TConta_Contabil }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TConta_Contabil }
        { Altera um Cliente }
        function Alterar(CdCNC,CdCCT: integer; PDC, PDescricao: String; PLimiteGasto: Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC,CdCCT:Integer);
        destructor Destroy; override;
        procedure FinalizaEdicao;
        { Insere um Cliente }
        function Inserir(CdCNC,CdCCT: integer; PDC, PDescricao: String; PLimiteGasto: Double):boolean;
        function InserirAuto:Boolean;
        { Localiza um cliente }
        function LocalizarCod(CdCCT,CdCNC:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TConta_Contabil }
        { Código da Conta Contabil }
        property CodigoCCT : Integer read GetCodigoCCT write SetCodigoCCT;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property DC : String read GetDC write SetDC;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoCCT : TEdit read FECodigoCCT write FECodigoCCT;
        property EDC : TComboBox read FEDC write FEDC;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property ELimiteGasto : TEdit read FELimiteGasto write FELimiteGasto;
        property LimiteGasto : Double read GetLimiteGasto write SetLimiteGasto;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TConta_Contabil with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TConta_Contabil]);
end;

{ Method to set variable and property values and create objects }
procedure TConta_Contabil.AutoInitialize;
begin
     Estado := 0;
     FECodigoCCT := nil;
     FEDC := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
     FELimiteGasto := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TConta_Contabil.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoCCT then
        FECodigoCCT := nil;
     if AComponent = FEDC then
        FEDC := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FELimiteGasto then
        FELimiteGasto := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TConta_Contabil.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCCT }
function TConta_Contabil.GetCodigoCCT : Integer;
begin
  try
    Result := Self.fieldByName('CCT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCCT }
procedure TConta_Contabil.SetCodigoCCT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCT_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TConta_Contabil.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TConta_Contabil.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property DC }
function TConta_Contabil.GetDC : String;
begin
  try
    Result := Self.fieldByName('CCT_DC').asString;
  except
    result:= ''
  end;
end;

{ Write method for property DC }
procedure TConta_Contabil.SetDC(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCT_DC').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCT_DC"!');
  end;
end;

{ Read method for property Descricao }
function TConta_Contabil.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('CCT_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TConta_Contabil.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CCT_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CCT_DESCRICAO"!');
  end;
end;

{ Read method for property LimiteGasto }
function TConta_Contabil.GetLimiteGasto : Double;
begin
  try
    Result := Self.fieldByName('CCT_LIMITE_GASTO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property LimiteGasto }
procedure TConta_Contabil.SetLimiteGasto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCT_LIMITE_GASTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCT_LIMITE_GASTO"!');
    end;
end;

{ Altera um Cliente }
function TConta_Contabil.Alterar(CdCNC,CdCCT: integer; PDC, PDescricao: String; PLimiteGasto: Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  result := true;
  If not(localizarCod(CdCCT,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      codigoCCT      := CdCCT;
      DC             := PDC;
      Descricao      := PDescricao;
      LimiteGasto    := PLimiteGasto;

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

function TConta_Contabil.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      edit;
      try
        DC := EDC.Text;
      except
      end;
      try
        Descricao := EDescricao.Text;
      except
      end;
      try
        LimiteGasto := StrToFloat(ELimiteGasto.Text);
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

procedure TConta_Contabil.AtualizaControles(Habilitar:Boolean);
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
 try
   EDC.Enabled               :=Habilitar;
    except
 end;
 try
   EDescricao.Enabled        :=Habilitar;
    except
 end;
 try
   ELimiteGasto.Enabled      :=Habilitar;
    except
 end;

end;

procedure TConta_Contabil.CancelaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(False);
  Estado:=0;
  CarregaDados;
end;

procedure TConta_Contabil.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 Try
   ECodigoCCT.Text           :=IntToStr(CodigoCCT);
    except
 end;
 try
   EDC.Text                  :=DC;
    except
 end;
 try
   EDescricao.Text           :=Descricao;
    except
 end;
 try
   ELimiteGasto.Text         :=Format('%.2f', [LimiteGasto]);
    except
 end;

end;

constructor TConta_Contabil.Create(AOwner: TComponent);
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

procedure TConta_Contabil.Deletar(CdCNC,CdCCT:Integer);
begin
  If not(localizarCod(CdCCT,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      if TQuery(Self).isEmpty then
      begin
        try
         ECodigoCCT.Clear;
          except
        end;
        try
         EDC.Text := '';
          except
        end;
        try
         EDescricao.Clear;
          except
        end;
        try
         ELimiteGasto.Clear;
          except
        end;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TConta_Contabil.Destroy;
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

procedure TConta_Contabil.FinalizaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
var
  mensagem: string;
  cod, cdcnc:Integer;
begin
  mensagem:='';
  If not Verificafloat(ELimiteGasto.text) Then
    mensagem:=mensagem+'Limite de gasto digitado incorretamente!';
  If mensagem <>'' Then
    raise Exception.Create(mensagem);
  If Estado=1 then
  Begin
    Inserirauto;
    close;
    open;
    LocalizarCod(SCodigo,CodigoCNC);
  End;

  If Estado=2 then
  Begin
    cod:=codigoCCT;
    cdcnc:=codigoCnc;
    Alterarauto;
    close;
    open;
    LocalizarCod(cod, cdcnc);
  End;

  AtualizaControles(False);
  Estado:=0;
end;

{ Insere um Cliente }
function TConta_Contabil.Inserir(CdCNC,CdCCT: integer; PDC, PDescricao: String; PLimiteGasto: Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod:Integer;
begin
  if CdCCT=0 then
    Cod    := ProximoCodigo('CCT_CODIGO')
  else
    Cod    := CdCCT;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  else
  begin
   result:=true;
      try
         INSERT;
         CodigoCCT      := Cod;
         CodigoCNC      := CdCNC;
         DC             := PDC;
         Descricao      := PDescricao;
         LimiteGasto    := PLimiteGasto;

         try
           Post;

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

function TConta_Contabil.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Aux:TDataSetNotifyEvent;

begin
  If (localizarCod(SCodigo,CodigoCNC)) Then
  begin
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
    result:=false;
  end
  Else
  begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        CodigoCCT := SCodigo;
      except
      end;
      try
        codigocnc := CConfiguracao.CodigoCNC;
      except
      end;
      try
        DC := EDC.Text;
      except
      end;
      try
        Descricao := EDescricao.Text;
      except
      end;
      try
        LimiteGasto := StrToFloat(ELimiteGasto.Text);
      except
      end;

      try
        Post;
        AfterScroll:=Aux;
        CarregaDados;
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

procedure TConta_Contabil.Loaded;
begin
     inherited Loaded;

     { Perform any component setup that depends on the property
       values having been set }

end;

{ Localiza um cliente }
function TConta_Contabil.LocalizarCod(CdCCT,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdCCT<>CodigoCCT) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;CCT_CODIGO', vararrayof([CdCNC, CdCCT]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TConta_Contabil.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>Descricao Then
    If locate('CCT_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TConta_Contabil.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TConta_Contabil.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 ProximoCodigo('CCT_CODIGO');
 try
  EDC.Text := '';
   except
 end;
 try
  EDescricao.Clear;
   except
 end;
 try
  ELimiteGasto.Clear;
   except
 end;

  Estado:=1;
  AtualizaControles(True);
end;

function TConta_Contabil.deletarauto:Boolean;
begin
  Result:=False;
  try
    if Delete then
    Begin    
      GeraLog(1350,CodigoCNC,CodigoCCT,'36');
      result:=true;
    end;
  Except    
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
