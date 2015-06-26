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
unit Bonus;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TBonus = class(TSQuery)
    private
      { Private fields of TBonus }
        { Storage for property Ano }
        FAno : Integer;
        { Storage for property CodigoBON }
        FCodigoBON : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EAno }
        FEAno : TEdit;
        { Storage for property ECodigoBON }
        FECodigoBON : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EMes }
        FEMes : TEdit;
        { Storage for property Mes }
        FMes : Integer;

      { Private methods of TBonus }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Ano }
        function GetAno : Integer;
        { Write method for property Ano }
        procedure SetAno(Value : Integer);
        { Read method for property CodigoBON }
        function GetCodigoBON : Integer;
        { Write method for property CodigoBON }
        procedure SetCodigoBON(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Mes }
        function GetMes : Integer;
        { Write method for property Mes }
        procedure SetMes(Value : Integer);

    protected
      { Protected fields of TBonus }

      { Protected methods of TBonus }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TBonus }

      { Public methods of TBonus }
        { Altera uma Desconto }
        function Alterar(CdBON,PMes,PAno: integer; DTAlterado:TDateTime):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdBON:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function Inserir(CdBON,PMes,PAno: integer; DTCadastro:TDateTime):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um grupo de consórcio }
        function LocalizarCod(CdBON:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TBonus }
        property Ano : Integer read GetAno write SetAno;
        property CodigoBON : Integer read GetCodigoBON write SetCodigoBON;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EAno : TEdit read FEAno write FEAno;
        property ECodigoBON : TEdit read FECodigoBON write FECodigoBON;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EMes : TEdit read FEMes write FEMes;
        property Mes : Integer read GetMes write SetMes;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TBonus with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TBonus]);
end;

{ Method to set variable and property values and create objects }
procedure TBonus.AutoInitialize;
begin
     FEAno := nil;
     FECodigoBON := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEMes := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TBonus.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAno then
        FEAno := nil;
     if AComponent = FECodigoBON then
        FECodigoBON := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEMes then
        FEMes := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TBonus.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Ano }
function TBonus.GetAno : Integer;
begin
  try
    Result := Self.fieldByName('BON_ANO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Ano }
procedure TBonus.SetAno(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BON_ANO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BON_ANO"!');
    end;
end;

{ Read method for property CodigoBON }
function TBonus.GetCodigoBON : Integer;
begin
  try
    Result := Self.fieldByName('BON_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoBON }
procedure TBonus.SetCodigoBON(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BON_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BON_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TBonus.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('BON_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TBonus.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BON_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BON_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TBonus.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('BON_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TBonus.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('BON_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "BON_DT_CADASTRO"!');
  end;
end;

{ Read method for property Mes }
function TBonus.GetMes : Integer;
begin
  try
    Result := Self.fieldByName('BON_MES').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Mes }
procedure TBonus.SetMes(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BON_MES').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BON_MES"!');
    end;
end;

{ Altera uma Desconto }
function TBonus.Alterar(CdBON,PMes,PAno: integer; DTAlterado:TDateTime):boolean;
begin
  result := False;
  If not(localizarCod(CdBON)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 BON_CODIGO '+
        ' FROM BONUS '+
        ' WHERE BON_CODIGO<>'+IntToStr(CdBON)+
        ' AND BON_MES='+IntToStr(PMes)+
        ' AND BON_ANO='+IntToStr(PAno);
      Open;
      if not isEmpty then
      Begin
        ShowMessage('Já existem Bônus para esse Período!');
        Exit;
      end;
    end;
    try
      edit;
      Mes            := PMes;
      Ano            := PAno;
      CodigoCNC      := CConfiguracao.CodigoCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := DTAlterado;
      try
        Post;
        GeraLog(3880,CConfiguracao.CodigoCNC,CdBON);
        result := True;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TBonus.AlterarAuto:Boolean;
var
  BON:integer;
begin
  result := False;
  BON:=StrToInt(ECodigoBON.Text);
  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 BON_CODIGO '+
      ' FROM BONUS '+
      ' WHERE BON_CODIGO<>'+IntToStr(BON)+
      ' AND BON_MES='+IntToStr(StrToInt(EMes.Text))+
      ' AND BON_ANO='+IntToStr(StrToInt(EAno.Text));
    Open;
    if not isEmpty then
    Begin
      ShowMessage('Já existem Bônus para esse Período!');
      Exit;
    end;
  end;
  try
    edit;
    try
      Mes := StrToInt(EMes.Text);
    except
    end;
    try
      Ano := StrToInt(EAno.Text);
    except
    end;
    try
      CodigoCNC := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado := StrToDateTime(EDataAlterado.Text);
    except
    end;
    try
      Post;
      Result:=True;
      GeraLog(3880,CConfiguracao.CodigoCNC,BON);
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TBonus.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled    :=not Habilitar;
  except
  end;
  try
    EMes.Enabled       :=Habilitar;
  except
  end;
  try
    EAno.Enabled       :=Habilitar;
  except
  end;
end;

procedure TBonus.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TBonus.CarregaDados;
begin
  try
    ECodigoBON.Text           :=IntToStr(CodigoBON);
  except
  end;
  try
    EMes.Text        :=IntToStr(Mes);
  except
  end;
  try
    EAno.Text        :=IntToStr(Ano);
  except
  end;
  try
    if DataCadastro=0 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text          :=FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro);
    except
  end;
  try
    if DataAlterado=0 then
      EDataAlterado.Clear
    else
      EDataAlterado.Text          :=FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado);
  except
  end;
end;

constructor TBonus.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'BONUS';

     { Code to perform other tasks when the component is created }

end;

function TBonus.Deletar(CdBON:Integer):Boolean;
var
  CdCNC: integer;
begin
  Result := False;
  If not(localizarCod(CdBON)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      if Delete then
      Begin
        Result := True;
        GeraLog(3880,CdCNC,CdBON,'Excluido');
        RegistrarDel(CdCNC,1190(*Bonus*),CdBON);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TBonus.Destroy;
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

function TBonus.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if not VerificaInteiroBranco(EMes.Text) then
    mensagem:=mensagem+'Mês incorreto!'+#13;
  if not VerificaInteiroBranco(EAno.Text) then
    mensagem:=mensagem+'Ano incorreto!'+#13;
  If mensagem <>'' Then
  Begin
    ShowMessage(mensagem);
    exit;
  end
  else
  Begin
    if (StrToInt(EMes.Text)<1) or (StrToInt(EMes.Text)>12) then
      mensagem:=mensagem+'Mês incorreto!'+#13;
    if (StrToInt(EAno.Text)<1900) or (StrToInt(EAno.Text)>2100) then
      mensagem:=mensagem+'Ano incorreto!'+#13;
    If mensagem <>'' Then
    Begin
      ShowMessage(mensagem);
      exit;
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
          LocalizarCod(SCodigo);
          CarregaDados;
          Estado:=0;
          AtualizaControles(False);
        end;
      End
      Else If Estado=2 then
      Begin
        cod:=codigoBON;
        if Alterarauto then
        Begin
          Result := True;
          close;
          open;
          LocalizarCod(cod);
          CarregaDados;
          Estado:=0;
          AtualizaControles(False);
        end;
      End;
      AfterScroll:=aux;
    end;
  end;
end;

function TBonus.Inserir(CdBON,PMes,PAno: integer; DTCadastro:TDateTime):boolean;
Var
  Cod: Integer;
begin
  Result := False;
  if CdBON=0 then
    Cod    := ProximoCodigo('BON_CODIGO')
  else
    Cod      := CdBON;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT TOP 1 BON_CODIGO '+
        ' FROM BONUS '+
        ' WHERE BON_CODIGO<>'+IntToStr(Cod)+
        ' AND BON_MES='+IntToStr(PMes)+
        ' AND BON_ANO='+IntToStr(PAno);
      Open;
      if not isEmpty then
      Begin
        ShowMessage('Já existem Bônus para esse Período!');
        Exit;
      end;
    end;
    Insert;
    try
      CodigoBON      := Cod;
      CodigoCNC      := CConfiguracao.CodigoCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      Mes            := PMes;
      Ano            := PAno;
      DataCadastro   := DTCadastro;
      try
        Post;
        result := true;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se Já existe esse Mês/Ano Referência.');
      end;
    except
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

function TBonus.InserirAuto:Boolean;
begin
  Result := False;
  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT TOP 1 BON_CODIGO '+
      ' FROM BONUS '+
      ' WHERE BON_CODIGO<>'+IntToStr(SCodigo)+
      ' AND BON_MES='+IntToStr(StrToInt(EMes.Text))+
      ' AND BON_ANO='+IntToStr(StrToInt(EAno.Text));
    Open;
    if not isEmpty then
    Begin
      ShowMessage('Já existem Bônus para esse Período!');
      Exit;
    end;
  end;
  try
    append;
    try
      CodigoBON   := SCodigo;
    except
    end;
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      Mes         := StrToInt(EMes.Text);
    except
    end;
    try
      Ano         := StrToInt(EAno.Text);
    except
    end;
    try
      DataCadastro := StrToDateTime(EDataCadastro.Text);
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

procedure TBonus.LimpaCampos;
begin
  try
    if Estado <> 1 then
      EMes.Clear
    else
      EMes.Text := formatDateTime('mm',CConfiguracao.Data);
  except
  end;
  try
    if Estado <> 1 then
      EAno.Clear
    else
      EAno.Text := formatDateTime('yyyy',CConfiguracao.Data);
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
end;

{ Localiza um grupo de consórcio }
function TBonus.LocalizarCod(CdBON:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdBON<>CodigoBON) Then
    If locate('BON_CODIGO', CdBON, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TBonus.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TBonus.PreparaInsercao;
begin
  ProximoCodigo('BON_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TBonus.deletarauto:Boolean;
var
  CdCNC, BON:integer;
begin
  Result:=False;
  try
    CdCNC := CodigoCNC;
    BON:=CodigoBON;
    if Delete then
    Begin
      result:=true;
      GeraLog(3880,CdCNC,BON,'Excluido');
      RegistrarDel(CdCNC,1190(*Bonus*),BON);
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
