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
unit Tabela_de_Preco_Cliente;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TTabela_de_Preco_Cliente = class(TSQuery)
    private
      { Private fields of TTabela_de_Preco_Cliente }
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoTBC }
        FCodigoTBC : Integer;
        { Storage for property CodigoTBP }
        FCodigoTBP : Integer;
        { Storage for property DataCadastro }
        FDataCadastro : Tdatetime;
        { Storage for property EClienteCNC }
        FEClienteCNC : TEdit;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoTBC }
        FECodigoTBC : TEdit;
        { Storage for property ECodigoTBP }
        FECodigoTBP : TEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property ETabelaCNC }
        FETabelaCNC : TEdit;
        { Storage for property TabelaCNC }
        FTabelaCNC : Integer;

      { Private methods of TTabela_de_Preco_Cliente }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Write method for property ClienteCNC }
        procedure SetClienteCNC(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property CodigoTBC }
        function GetCodigoTBC : Integer;
        { Write method for property CodigoTBC }
        procedure SetCodigoTBC(Value : Integer);
        { Read method for property CodigoTBP }
        function GetCodigoTBP : Integer;
        { Write method for property CodigoTBP }
        procedure SetCodigoTBP(Value : Integer);
        { Read method for property DataCadastro }
        function GetDataCadastro : Tdatetime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : Tdatetime);
        { Read method for property TabelaCNC }
        function GetTabelaCNC : Integer;
        { Write method for property TabelaCNC }
        procedure SetTabelaCNC(Value : Integer);

    protected
      { Protected fields of TTabela_de_Preco_Cliente }

      { Protected methods of TTabela_de_Preco_Cliente }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TTabela_de_Preco_Cliente }

      { Public methods of TTabela_de_Preco_Cliente }
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function DeletarAuto:Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        function LocalizarCod(CdCLICNC, CdCLI: integer):Boolean;
        procedure PreparaInsercao;

    published
      { Published properties of TTabela_de_Preco_Cliente }
        property ClienteCNC : Integer read GetClienteCNC write SetClienteCNC;
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        { Código do Indexador Economico }
        property CodigoTBC : Integer read GetCodigoTBC write SetCodigoTBC;
        property CodigoTBP : Integer read GetCodigoTBP write SetCodigoTBP;
        property DataCadastro : Tdatetime
             read GetDataCadastro write SetDataCadastro;
        property EClienteCNC : TEdit read FEClienteCNC write FEClienteCNC;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoTBC : TEdit read FECodigoTBC write FECodigoTBC;
        property ECodigoTBP : TEdit read FECodigoTBP write FECodigoTBP;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property ETabelaCNC : TEdit read FETabelaCNC write FETabelaCNC;
        property TabelaCNC : Integer read GetTabelaCNC write SetTabelaCNC;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTabela_de_Preco_Cliente with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTabela_de_Preco_Cliente]);
end;

{ Method to set variable and property values and create objects }
procedure TTabela_de_Preco_Cliente.AutoInitialize;
begin
     FEClienteCNC := nil;
     FECodigoCLI := nil;
     FECodigoTBC := nil;
     FECodigoTBP := nil;
     FEDataCadastro := nil;
     FETabelaCNC := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TTabela_de_Preco_Cliente.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoTBC then
        FECodigoTBC := nil;
     if AComponent = FECodigoTBP then
        FECodigoTBP := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FETabelaCNC then
        FETabelaCNC := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TTabela_de_Preco_Cliente.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ClienteCNC }
function TTabela_de_Preco_Cliente.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property ClienteCNC }
procedure TTabela_de_Preco_Cliente.SetClienteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodigoCLI }
function TTabela_de_Preco_Cliente.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCLI }
procedure TTabela_de_Preco_Cliente.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoTBC }
function TTabela_de_Preco_Cliente.GetCodigoTBC : Integer;
begin
  try
    Result := Self.fieldByName('TBC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTBC }
procedure TTabela_de_Preco_Cliente.SetCodigoTBC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBC_CODIGO"!');
    end;
end;

{ Read method for property CodigoTBP }
function TTabela_de_Preco_Cliente.GetCodigoTBP : Integer;
begin
  try
    Result := Self.fieldByName('TBP_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTBP }
procedure TTabela_de_Preco_Cliente.SetCodigoTBP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_CODIGO"!');
    end;
end;

{ Read method for property DataCadastro }
function TTabela_de_Preco_Cliente.GetDataCadastro : Tdatetime;
begin
  try
    Result := Self.fieldByName('TBC_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TTabela_de_Preco_Cliente.SetDataCadastro(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TBC_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TBC_DT_CADASTRO"!');
  end;
end;

{ Read method for property TabelaCNC }
function TTabela_de_Preco_Cliente.GetTabelaCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_TABELA').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TabelaCNC }
procedure TTabela_de_Preco_Cliente.SetTabelaCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_TABELA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_TABELA"!');
    end;
end;

procedure TTabela_de_Preco_Cliente.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    ECodigoCLI.Enabled        :=Habilitar;
  except
  end;
end;

procedure TTabela_de_Preco_Cliente.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TTabela_de_Preco_Cliente.CarregaDados;
begin
  Try
    ECodigoTBC.Text           :=IntToStr(CodigoTBC);
  except
  end;
  Try
    if DataCadastro > 0 then
      EDataCadastro.Text      :=DateTimeToStr(DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  Try
    EClienteCNC.Text           :=IntToStr(ClienteCNC);
  except
  end;
  Try
    ECodigoCLI.Text           :=IntToStr(CodigoCLI);
  except
  end;
end;

constructor TTabela_de_Preco_Cliente.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'TABELA_DE_PRECO_CLIENTE';

     { Code to perform other tasks when the component is created }

end;

function TTabela_de_Preco_Cliente.DeletarAuto:Boolean;
begin
  Result:=False;
  try
    if Delete then
    Begin
      Result:=True;
      //Log gerado no FORM
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

destructor TTabela_de_Preco_Cliente.Destroy;
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

function TTabela_de_Preco_Cliente.FinalizaEdicao:Boolean;
var
  CdCLICNC, CdCLI: integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if not VerificaInteiroBranco(ETabelaCNC.text) then
    mensagem:=mensagem+'Centro da Tabela incorreto!'+#13;
  if not VerificaInteiroBranco(ECodigoTBP.text) then
    mensagem:=mensagem+'Código da Tabela incorreto!'+#13;
  if not VerificaInteiroBranco(EClienteCNC.text) then
    mensagem:=mensagem+'Centro do Cliente incorreto!'+#13;
  if not VerificaInteiroBranco(ECodigoCLI.text) then
    mensagem:=mensagem+'Código do Cliente incorreto!'+#13;
  if mensagem<>'' then
    raise exception.create(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      CdCLICNC := StrToInt(EClienteCNC.Text);
      CdCLI    := StrToInt(ECodigoCLI.Text);
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(CdCLICNC, CdCLI);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=aux;
  end;
end;

function TTabela_de_Preco_Cliente.InserirAuto:Boolean;
begin
  result:=false;
  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT TBC_CODIGO '+
      ' FROM TABELA_DE_PRECO_CLIENTE '+
      ' WHERE CNC_TABELA='+ETabelaCNC.Text+
      ' AND TBP_CODIGO='+ECodigoTBP.Text+
      ' AND CNC_CLIENTE='+EClienteCNC.Text+
      ' AND CLI_CODIGO='+ECodigoCLI.Text;
    Open;
    if not isEmpty then
      Raise exception.Create('Cliente já cadastrado para essa tabela!');
  end;

  try
    append;
    try
      CodigoTBC   := SCodigo;
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
       DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      TabelaCNC   := StrToInt(ETabelaCNC.Text);
    except
    end;
    try
      codigoTBP   := StrToInt(ECodigoTBP.Text);
    except
    end;
    try
      ClienteCNC   := StrToInt(EClienteCNC.Text);
    except
    end;
    try
      codigoCLI   := StrToInt(ECodigoCLI.Text);
    except
    end;
    try
      Post;
      //Log gerado no FORM
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TTabela_de_Preco_Cliente.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoTBC.Clear;
  except
  end;
  try
    EClienteCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  except
  end;
  try
    ECodigoCLI.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
end;

function TTabela_de_Preco_Cliente.LocalizarCod(CdCLICNC, CdCLI: integer):Boolean;
begin
  If (CdCLICNC<>ClienteCNC) or (CdCLI<>CodigoCLI) Then
    If locate('CNC_CLIENTE;CLI_CODIGO', vararrayof([CdCLICNC, CdCLI]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TTabela_de_Preco_Cliente.PreparaInsercao;
begin
  ProximoCodigo('TBC_CODIGO');
  Estado := 1;
  AtualizaControles(True);
  LimpaCampos;
end;


end.
