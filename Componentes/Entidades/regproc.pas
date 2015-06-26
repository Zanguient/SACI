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
unit RegProc;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Funcoes, Variants;

type
  TRegProc = class(TSQuery)
    private
      { Private fields of TRegProc }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoRegistro }
        FCodigoRegistro : Integer;
        { Storage for property Data }
        FData : Tdatetime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoRegistro }
        FECodigoRegistro : TEdit;
        { Storage for property EData }
        FEData : TMaskedit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EObs }
        FEObs : TMemo;
        { Storage for property Obs }
        FObs : String;

      { Private methods of TRegProc }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoRegistro }
        function GetCodigoRegistro : Integer;
        { Write method for property CodigoRegistro }
        procedure SetCodigoRegistro(Value : Integer);
        { Read method for property Data }
        function GetData : Tdatetime;
        { Write method for property Data }
        procedure SetData(Value : Tdatetime);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Obs }
        function GetObs : String;
        { Write method for property Obs }
        procedure SetObs(Value : String);

    protected
      { Protected fields of TRegProc }

      { Protected methods of TRegProc }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;
        procedure Loaded; override;

    public
      { Public fields and properties of TRegProc }

      { Public methods of TRegProc }
        { Altera um Cliente }
        function Alterar(CdCNC,CdRGP: integer; PDATA:TDateTime;PDESC,POBS:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CDRGP:Integer):Boolean;
        destructor Destroy; override;
        procedure FinalizaEdicao;
        { Insere um Cliente }
        function Inserir(CdCNC,CdRGP: integer;PDATA:TDateTime;PDESCRICAO,POBS:String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CDRGP,CDCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TRegProc }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Cliente }
        property CodigoRegistro : Integer
             read GetCodigoRegistro write SetCodigoRegistro;
        property Data : Tdatetime read GetData write SetData;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoRegistro : TEdit
             read FECodigoRegistro write FECodigoRegistro;
        property EData : TMaskedit read FEData write FEData;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EObs : TMemo read FEObs write FEObs;
        property Obs : String read GetObs write SetObs;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TRegProc with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TRegProc]);
end;

{ Method to set variable and property values and create objects }
procedure TRegProc.AutoInitialize;
begin
     FECodigoRegistro := nil;
     FEData := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
     FEObs := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TRegProc.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoRegistro then
        FECodigoRegistro := nil;
     if AComponent = FEData then
        FEData := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEObs then
        FEObs := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TRegProc.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TRegProc.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TRegProc.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoRegistro }
function TRegProc.GetCodigoRegistro : Integer;
begin
  try
    Result := Self.fieldByName('RGP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoRegistro }
procedure TRegProc.SetCodigoRegistro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('RGP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "RGP_CODIGO"!');
    end;
end;

{ Read method for property Data }
function TRegProc.GetData : Tdatetime;
begin
  try
    Result := Self.fieldByName('RGP_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property Data }
procedure TRegProc.SetData(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('RGP_DATA').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "RGP_DATA"!');
  end;
end;

{ Read method for property Descricao }
function TRegProc.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('RGP_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TRegProc.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('RGP_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "RGP_DESCRICAO"!');
  end;
end;

{ Read method for property Obs }
function TRegProc.GetObs : String;
begin
  try
    Result := Self.fieldByName('RGP_OBS').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Obs }
procedure TRegProc.SetObs(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('RGP_OBS').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "RGP_OBS"!');
  end;
end;

{ Altera um Cliente }
function TRegProc.Alterar(CdCNC,CdRGP: integer; PDATA:TDateTime;PDESC,POBS:String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  result := true;
  If not(localizarCod(CdRGP,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      Data           := PDATA;
      DESCRICAO      := PDESC;
      OBS            := POBS;

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

function TRegProc.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      edit;
      try
        Data := StrToDateTime(EData.Text);
      except
      end;
      try
         Descricao := Edescricao.text;
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

procedure TRegProc.AtualizaControles(Habilitar:Boolean);
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
   EData.Enabled             :=Habilitar;
   except
 end;
 try
   EDescricao.Enabled        :=Habilitar;
   except
 end;
 try
   EOBS.Enabled              :=Habilitar;
   except
 end;
end;

procedure TRegProc.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TRegProc.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 try
   ECodigoRegistro.Text      := IntToStr(CodigoRegistro);
   except
 end;
 try
   if Data=0 then
     EData.Text:=''
   else
     EData.Text                := FormatDateTime('dd/mm/yyyy', Data);
   except
 end;
 try
   EDescricao.text           := Descricao;
   except
 end;
 try
   EOBS.Text                 := Obs;
   except
 end;
end;

constructor TRegProc.Create(AOwner: TComponent);
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

function TRegProc.Deletar(CdCNC,CDRGP:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdRGP,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        RegistrarDel(CdCNC,1930(*RegistroDeProcura*),CdRGP);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TRegProc.Destroy;
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

procedure TRegProc.FinalizaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cod, cdcnc:Integer;
  mensagem:string;
begin
  mensagem:='';
  If not Verificadata(EData.text) Then
    mensagem:=mensagem+'Data incorreta!';
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
    cod:=CodigoRegistro;
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
function TRegProc.Inserir(CdCNC,CdRGP: integer;PDATA:TDateTime;PDESCRICAO,POBS:String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod: Integer;
begin
  if CdRGP=0 then
    Cod    := ProximoCodigo('RGP_CODIGO')
  else
    Cod    := CdRGP;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
     result := true;
     Insert;
     try
       CodigoRegistro := Cod;
       CodigoCNC      := CdCNC;
       Data           := PDATA;
       Descricao      := PDESCRICAO;
       Obs            := POBS;

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

function TRegProc.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Aux:TDataSetNotifyEvent;
begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        Codigoregistro  := SCodigo;
      except
      end;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        Data := StrToDateTime(EData.Text);
      except
      end;
      try
        Descricao := EDescricao.text;
      except
      end;
      try
        Obs := EOBS.Text;
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

procedure TRegProc.LimpaCampos;
begin
  try
    EData.Clear;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
end;

procedure TRegProc.Loaded;
begin
     inherited Loaded;

     { Perform any component setup that depends on the property
       values having been set }

end;

{ Localiza um cliente }
function TRegProc.LocalizarCod(CDRGP,CDCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDRGP<>CodigoRegistro) or (CDCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;RGP_CODIGO', vararrayof([CDCNC, CDRGP]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TRegProc.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TRegProc.PreparaInsercao;
begin
  ProximoCodigo('RGP_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TRegProc.deletarauto:Boolean;
var
  CdCNC, CdRGP: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdRGP := CodigoRegistro;
    if Delete then
    Begin
      result:=true;
      GeraLog(1150,CdCNC,CdRGP);
      RegistrarDel(CdCNC,1930(*RegistroDeProcura*),CdRGP);
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
