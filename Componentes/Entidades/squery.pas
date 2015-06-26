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
unit SQuery;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Dbtables, Dialogs, Dbgrids, Configuracao, 
     Db, Stdctrls, Log, Registry, Funcoes, Variants, IniFiles;

type
  TSQuery = class(TQuery)
    private
      { Private fields of TSQuery }
        { Storage for property CConfiguracao }
        FCConfiguracao : TConfiguracao;
        { Storage for property CLog }
        FCLog : TLog;
        { Storage for property CNCOrigem }
        FCNCOrigem : Integer;
        { Storage for property CamposDeResumo }
        FCamposDeResumo : TStrings;
        { Storage for property CentroDeCusto }
        FCentroDeCusto : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property ECampoLocaliz }
        FECampoLocaliz : TComboBox;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property ENomeLocaliz }
        FENomeLocaliz : TEdit;
        { Storage for property ESCodigo }
        FESCodigo : TEdit;
        { Storage for property ImportComponent }
        FImportComponent : TSQuery;
        { Storage for property Mafalda }
        FMafalda : Integer;
        { Storage for property Maquina }
        FMaquina : Integer;
        { Storage for property Resumo }
        FResumo : TStrings;
        { Storage for property Selecao }
        FSelecao : TStrings;
        { Storage for property Tabela }
        FTabela : String;

      { Private methods of TSQuery }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CNCOrigem }
        function GetCNCOrigem : Integer;
        { Write method for property CNCOrigem }
        procedure SetCNCOrigem(Value : Integer);
        { Write method for property CamposDeResumo }
        procedure SetCamposDeResumo(Value : TStrings);
        { Read method for property CentroDeCusto }
        function GetCentroDeCusto : Integer;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoUSU }
        function GetCodigoUSU : Integer;
        { Write method for property CodigoUSU }
        procedure SetCodigoUSU(Value : Integer);
        { Read method for property Mafalda }
        function GetMafalda : Integer;
        { Read method for property Maquina }
        function GetMaquina : Integer;
        { Read method for property Resumo }
        function GetResumo : TStrings;
        { Write method for property Selecao }
        procedure SetSelecao(Value : TStrings);

    protected
      { Protected fields of TSQuery }

      { Protected methods of TSQuery }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TSQuery }
        Estado : Integer;
        SCodigo : Longint;
        property Resumo : TStrings read GetResumo;

      { Public methods of TSQuery }
        constructor Create(AOwner: TComponent); override;
        function Delete:Boolean;
        destructor Destroy; override;
        procedure Edit;
        function GeraLog(CdOPS,PCncCodigo,PCodigoEnt : integer;PObs: String=''):Boolean;
        function LocalizaValor(CampoLocalizar,ValorLocalizar:string):Boolean;
        function Localizar:Boolean;
        function ProximoCodigo(Campo:String):Longint;
        function RegistrarDel(PCNCRegistro,PCodigoTabela,PCodigoRegistro: integer;POBS: String=''):Boolean;
        procedure SGravarGrid(Grid: TDBGrid;Par: String);
        procedure SOrdemdoGrid(Grid: TDBGrid;Coluna: TColumn;Par: String);
        function Selecionar:Boolean;
        function VerificaNumObrig(Texto:String):Boolean;
        function VerificaRegistroExiste(Filtro1:String):Boolean;

    published
      { Published properties of TSQuery }
        property CConfiguracao : TConfiguracao
             read FCConfiguracao write FCConfiguracao;
        property CLog : TLog read FCLog write FCLog;
        property CNCOrigem : Integer read GetCNCOrigem write SetCNCOrigem;
        property CamposDeResumo : TStrings
             read FCamposDeResumo write SetCamposDeResumo;
        property CentroDeCusto : Integer
             read GetCentroDeCusto write FCentroDeCusto;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property ECampoLocaliz : TComboBox
             read FECampoLocaliz write FECampoLocaliz;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property ENomeLocaliz : TEdit read FENomeLocaliz write FENomeLocaliz;
        property ESCodigo : TEdit read FESCodigo write FESCodigo;
        property ImportComponent : TSQuery
             read FImportComponent write FImportComponent;
        property Mafalda : Integer read GetMafalda write FMafalda;
        property Maquina : Integer read GetMaquina write FMaquina;
        property Selecao : TStrings read FSelecao write SetSelecao;
        property Tabela : String read FTabela write FTabela;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TSQuery with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TSQuery]);
end;

{ Method to set variable and property values and create objects }
procedure TSQuery.AutoInitialize;
begin
     FCamposDeResumo := TStringList.Create;
     FECampoLocaliz := nil;
     FEDbgrid := nil;
     FENomeLocaliz := nil;
     FESCodigo := nil;
     FResumo := TStringList.Create;
     FSelecao := TStringList.Create;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TSQuery.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECampoLocaliz then
        FECampoLocaliz := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FENomeLocaliz then
        FENomeLocaliz := nil;
     if AComponent = FESCodigo then
        FESCodigo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TSQuery.AutoDestroy;
begin
     FCamposDeResumo.Free;
     FResumo.Free;
     FSelecao.Free;
end; { of AutoDestroy }

{ Read method for property CNCOrigem }
function TSQuery.GetCNCOrigem : Integer;
begin
  try
    Result := Self.fieldByName('CNC_ORIGEM').AsInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CNCOrigem }
procedure TSQuery.SetCNCOrigem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_ORIGEM').asInteger := Value;
    except
    end;
end;

{ Write method for property CamposDeResumo }
procedure TSQuery.SetCamposDeResumo(Value : TStrings);
begin
     { Use Assign method because TStrings is an object type
       and FCamposDeResumo has been created. }
     FCamposDeResumo.Assign(Value);
end;

{ Read method for property CentroDeCusto }
function TSQuery.GetCentroDeCusto : Integer;
var
  ArqConf:TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'CC', '-1'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property CodigoCNC }
function TSQuery.GetCodigoCNC : Integer;
begin
  try
    Result := FieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCNC }
procedure TSQuery.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
    end;
end;

{ Read method for property CodigoUSU }
function TSQuery.GetCodigoUSU : Integer;
begin
  try
    Result := FieldByName('USU_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoUSU }
procedure TSQuery.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
    end;
end;

{ Read method for property Mafalda }
function TSQuery.GetMafalda : Integer;
var
  ArqConf:TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'Mafalda', '-1'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property Maquina }
function TSQuery.GetMaquina : Integer;
var
  ArqConf:TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'Maquina', '-1'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property Resumo }
function TSQuery.GetResumo : TStrings;
var
  i:Integer;
begin
  FResumo.Clear;
  with CamposDeResumo do
  begin
    for i:=0 to Count-1 do
      try
        FResumo.Add(copy(copy(Strings[i],1, pos(';', Strings[i])-1)+
        '                    ',1,20)+': '+Self.FieldByName(copy(Strings[i],
        pos(';', Strings[i])+1,30)).asString);
      except
      end;
  end;
  Result := FResumo;
end;

{ Write method for property Selecao }
procedure TSQuery.SetSelecao(Value : TStrings);
begin
     { Use Assign method because TStrings is an object type
       and FSelecao has been created. }
     FSelecao.Assign(Value);
end;

constructor TSQuery.Create(AOwner: TComponent);
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
//     Registro:=TRegistry.Create;
//     Registro.RootKey:=HKEY_CURRENT_USER;
//     Registro.RootKey:=HKEY_LOCAL_MACHINE;
end;

function TSQuery.Delete:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  //
  if MessageDlg('Tem certeza que você deseja excluir o registro?',
    mtConfirmation, [mbYes, mbNo], 0) in [mrYes, 201] then
  Begin
    TQuery(Self).Delete;
    Result := True;
  end
  else
    Result := False;

  //
end;

destructor TSQuery.Destroy;
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

procedure TSQuery.Edit;
begin
  if not Self.IsEmpty then
    TQuery(Self).Edit;
end;

function TSQuery.GeraLog(CdOPS,PCncCodigo,PCodigoEnt : integer;PObs: String=''):Boolean;
begin
  Result := True;
  if CLog<>nil then
    with CLog do
    begin
      if not Inserir(CdOPS,PCncCodigo,PCodigoEnt,Maquina,PObs) then
        Result := False;
    end;
end;

function TSQuery.LocalizaValor(CampoLocalizar,ValorLocalizar:string):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  NomeLocalizar:String;
begin
  NomeLocalizar:=Trim(ValorLocalizar);
  try
    If locate(campoLocalizar,NomeLocalizar, [loCaseInsensitive, loPartialKey]) Then
      Result:=True
    else
      Result:=False;
  Except
    ShowMessage('Faça as ligações dos componentes antes de localizar!');
    Result:=False;
  End;
end;

function TSQuery.Localizar:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Campo,Nome,campoloc:String;
  i         :Integer;
begin
  Try
    If (ECampoLocaliz.Text<>'') and (ENomeLocaliz.text<>'') Then
    Begin
      try
        campoloc:=trim(ECampoLocaliz.Text);
        for i:= length(campoloc) downto 1 do
          If campoloc[i]=' ' Then
          Begin
            Campo := Copy(campoloc,i+1,length(campoloc)-i);
            Break;
          End;
      except
      end;
      try
        Nome:=Trim(ENomeLocaliz.text);
      except
      end;
      If locate(campo,Nome, [loCaseInsensitive, loPartialKey]) Then
        Result:=True
      else
        Result:=False;
    End
    else
    Begin
      ShowMessage('Campo ou valor de localizacao faltando!');
      Result := False;
    end;
    Except
    ShowMessage('Faça as ligações dos componentes antes de localizar!');
    Result:=False;
  End;
end;

function TSQuery.ProximoCodigo(Campo:String):Longint;
begin
  if SCodigo<0 then
    SCodigo:=CConfiguracao.ProximoCodigo(Campo, -SCodigo)
  else
    SCodigo:=CConfiguracao.ProximoCodigo(Campo, 1);
  if scodigo>0 then
  try
    ESCodigo.Text:=IntToStr(SCodigo);
  except
  end;
  result:=SCodigo;
end;

function TSQuery.RegistrarDel(PCNCRegistro,PCodigoTabela,PCodigoRegistro: integer;POBS: String=''):Boolean;
begin
  Result := True;
  if CLog<>nil then
    if CLog.CRegistroDeletado<>nil then
      with CLog.CRegistroDeletado do
      begin
        if not Inserir(PCNCRegistro,PCodigoTabela,PCodigoRegistro,POBS) then
          Result := False;
      end;
end;

procedure TSQuery.SGravarGrid(Grid: TDBGrid;Par: String);
Var
   i : Integer;
begin
  for i := 0 to Grid.Columns.Count-1 do
    Grid.Columns.Items[i].Title.Color := clBtnFace;
  Grid.Columns.SaveToFile(CConfiguracao.PastaSistema+'\'+Par+IntToStr(CConfiguracao.CodigoUSU)+'.TXT');
end;

procedure TSQuery.SOrdemdoGrid(Grid: TDBGrid;Coluna: TColumn;Par: String);
Var
   Ordem, Selec, sConsultaOriginal : String;
   i : Integer;
begin
  Ordem := '';
  sConsultaOriginal := SQL.Text;
  try
    if Par <> '' then
      Par := Par+'.';
    //
    for i := 0 to Grid.Columns.Count-1 do
    begin
      if Grid.Columns.Items[i] = Coluna then
      begin
        if Pos('ASC',SQL.Text) > 0 then
          Ordem := ' ORDER BY '+Par+Grid.Columns.Items[i].FieldName+' DESC '
        else
          Ordem := ' ORDER BY '+Par+Grid.Columns.Items[i].FieldName+' ASC ';
        Grid.Columns.Items[i].Title.Color := clSkyBlue;
      end
      else
        Grid.Columns.Items[i].Title.Color := clBtnFace;
    end;
    //
    if Pos('ORDER',SQL.Text) > 0 then
      Selec := Copy(SQL.Text,0,Pos('ORDER', SQL.Text)-1)
    else
      Selec := SQL.Text;
    //
    Close;
    SQL.Text := Selec+Ordem;
    try
      Open;
    except
      //Retornar a consulta antiga
      SQL.Text := sConsultaOriginal;
      try
        Open;
      except
      end;
    end;
  except
  end;
end;

function TSQuery.Selecionar:Boolean;
Var
  Campo,Nome,NOME1,NOME2,campoloc:String;
  i         :Integer;
  field     :TField;
begin
  NOME2:='';
  Try
    If (ECampoLocaliz.Text<>'') and (ENomeLocaliz.text<>'') and (tabela<>'')
       and (ENomeLocaliz.text<>'*') Then
    Begin
      try
        campoloc:=trim(ECampoLocaliz.Text);
        for i:= length(campoloc) downto 1 do
          If campoloc[i]=' ' Then
          Begin
            Campo := Copy(campoloc,i+1,length(campoloc)-i);
            Break;
          End;
      except
      end;
      try
        Nome:=UpperCase(Trim(ENomeLocaliz.text));
      except
      end;
      //Obtem informacoes do campo
      field:=FindField(campo);
      //fecha a query
      close;
      //Seleciona de acordo com o tipo do campo
      if (Field.DataType=ftString) or (Field.DataType=ftMemo) then
        sql.Text:='SELECT * FROM '+TABELA+' WHERE '+CAMPO+' LIKE "%'+NOME+'%"'
      else if (Field.DataType=ftDate) or (Field.DataType=ftTime) or (Field.DataType=ftDateTime) then
      Begin
        NOME2:=DateToStr(StrToDate(NOME)+1);
        NOME1:=Copy(NOME,4,3)+Copy(NOME,1,3)+Copy(NOME,7,4);
        NOME2:=Copy(NOME2,4,3)+Copy(NOME2,1,3)+Copy(NOME2,7,4);
        sql.Text:='SELECT * FROM '+TABELA+' WHERE '+CAMPO+'>="'+NOME1+'" AND '+CAMPO+'<"'+NOME2+'"';
      End
      else if (Field.DataType=ftSmallInt) or (Field.DataType=ftInteger) or (Field.DataType=ftWord) then
      Begin
        If VerificaInteiroBranco(NOME) Then
          sql.Text:='SELECT * FROM '+TABELA+' WHERE '+CAMPO+'='+NOME
        Else
        Begin
          result:=False;
          SQL.Text:='SELECT * FROM '+TABELA+' WHERE '+CAMPO+'=-1';
          Open;
          ShowMessage('Valor a ser localizado inválido!');
          Exit;
        End;
      end
      else if (Field.DataType=ftFloat) or (Field.DataType=ftCurrency) then
        sql.Text:='SELECT * FROM '+TABELA+' WHERE '+CAMPO+'='+VirgPonto(NOME);
      //Adiciona selecao se existir
      if selecao.Count>0 then
        sql.text:=sql.text+selecao.text;
      sql.Text:=sql.Text+' ORDER BY '+CAMPO;
      open;
      result:=isEmpty;
    End
    else if (ENomeLocaliz.text='*') Then
    Begin
      SQL.Text:='SELECT * FROM '+TABELA+' WHERE CNC_CODIGO<>-1 ';
      if selecao.Count>0 then
        sql.text:=sql.text+selecao.text;
      open;
      result:=isEmpty;
    end
    else
      Result := False;

  Except
    result:=false;
    ShowMessage('Faça as ligações dos componentes antes de selecionar!');
  End;
end;

function TSQuery.VerificaNumObrig(Texto:String):Boolean;
Var
  i:Integer;
Begin
  result:=True;
  If Length(Texto)>0 Then
  Begin
    For i:=1 to Length(Texto) do
      if not(StrToInt(texto[i]) in [0,1,2,3,4,5,6,7,8,9]) then
        result:=false;
  End
  Else
    result:=false;
End;

function TSQuery.VerificaRegistroExiste(Filtro1:String):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  Begin
    CLose;
    SQL.Text := 'SELECT TOP 1 * FROM '+Tabela+
      ' WHERE '+Filtro1;
    Open;
    Result := (not IsEmpty);
  end;
end;


end.
