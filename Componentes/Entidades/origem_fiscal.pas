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
unit Origem_Fiscal;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Variants;

type
  TOrigem_Fiscal = class(TSQuery)
    private
      { Private fields of TOrigem_Fiscal }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoORF }
        FCodigoORF : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoORF }
        FECodigoORF : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;

      { Private methods of TOrigem_Fiscal }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoORF }
        function GetCodigoORF : Integer;
        { Write method for property CodigoORF }
        procedure SetCodigoORF(Value : Integer);
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

    protected
      { Protected fields of TOrigem_Fiscal }

      { Protected methods of TOrigem_Fiscal }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TOrigem_Fiscal }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TOrigem_Fiscal }
        { Altera uma Origem Fiscal }
        function Alterar(CdCNC, CdORF: integer; PDescricao: String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdORF:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere uma Origem Fiscal }
        function Inserir(CdCNC, CdORF: integer; PDescricao: String):boolean;
        function InserirAuto:Boolean;
        { Localiza uma Origem Fiscal }
        function LocalizarCod(CdORF:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TOrigem_Fiscal }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código da Origem Fiscal }
        property CodigoORF : Integer read GetCodigoORF write SetCodigoORF;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoORF : TEdit read FECodigoORF write FECodigoORF;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TOrigem_Fiscal with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TOrigem_Fiscal]);
end;

{ Method to set variable and property values and create objects }
procedure TOrigem_Fiscal.AutoInitialize;
begin
     Estado := 0;
     FECodigoORF := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TOrigem_Fiscal.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoORF then
        FECodigoORF := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TOrigem_Fiscal.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TOrigem_Fiscal.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TOrigem_Fiscal.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoORF }
function TOrigem_Fiscal.GetCodigoORF : Integer;
begin
  try
    Result := Self.fieldByName('ORF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoORF }
procedure TOrigem_Fiscal.SetCodigoORF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ORF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ORF_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TOrigem_Fiscal.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TOrigem_Fiscal.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TOrigem_Fiscal.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('ORF_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TOrigem_Fiscal.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ORF_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ORF_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TOrigem_Fiscal.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('ORF_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TOrigem_Fiscal.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ORF_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ORF_DT_CADASTRO"!');
    end;
end;

{ Read method for property Descricao }
function TOrigem_Fiscal.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('ORF_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TOrigem_Fiscal.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ORF_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ORF_DESCRICAO"!');
  end;
end;

{ Altera uma Origem Fiscal }
function TOrigem_Fiscal.Alterar(CdCNC, CdORF: integer; PDescricao: String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdORF)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoUSU    := CConfiguracao.CodigoUSU;
      DataAlterado := CConfiguracao.DataHora;
      Descricao    := PDescricao;
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

function TOrigem_Fiscal.AlterarAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
    try
      edit;
      try
         CodigoUSU := CConfiguracao.CodigoUSU;
      except
      end;
      try
         DataAlterado := StrToDateTime(EDataAlterado.Text);
      except
      end;
      try
         Descricao := EDescricao.Text;
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

procedure TOrigem_Fiscal.AtualizaControles(Habilitar:Boolean);
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
   EDescricao.Enabled        :=Habilitar;
   except
 end;
end;

procedure TOrigem_Fiscal.CancelaEdicao;
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

procedure TOrigem_Fiscal.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    ECodigoORF.Text           :=IntToStr(CodigoORF);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    EDescricao.Text           :=Descricao;
  except
  end;
end;

constructor TOrigem_Fiscal.Create(AOwner: TComponent);
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

function TOrigem_Fiscal.Deletar(CdORF:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdORF)) Then    
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        begin
          try
            ECodigoORF.Clear;
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
            EDescricao.Clear;
          except
          end;
        end;
      end
      else
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TOrigem_Fiscal.Destroy;
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

function TOrigem_Fiscal.FinalizaEdicao:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if mensagem<>'' then
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
        LocalizarCod(SCodigo);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoORF;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
  end;
end;

{ Insere uma Origem Fiscal }
function TOrigem_Fiscal.Inserir(CdCNC, CdORF: integer; PDescricao: String):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod: Integer;
begin
  if CdORF=0 then
    Cod    := ProximoCodigo('ORF_CODIGO')
  else
    Cod    := CdORF;
  If (localizarCod(Cod)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
     Insert;
     try
       CodigoORF       := Cod;
       CodigoCNC       := CdCNC;
       CodigoUSU       := CConfiguracao.CodigoUSU;
       DataCadastro    := CConfiguracao.DataHora;
       Descricao       := PDescricao;

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

function TOrigem_Fiscal.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
   try
      append;
      try
         codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
         CodigoORF := SCodigo;
       except
       end;
      try
         CodigoUSU := CConfiguracao.CodigoUSU;
      except
      end;
      try
         DataCadastro := StrToDateTime(EDataCadastro.Text);
      except
      end;
       try
         Descricao := EDescricao.Text;
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

{ Localiza uma Origem Fiscal }
function TOrigem_Fiscal.LocalizarCod(CdORF:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdORF<>CodigoORF) Then
    If locate('ORF_CODIGO', CdORF, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TOrigem_Fiscal.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>Descricao Then
    If locate('ORF_DESCRICAO',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TOrigem_Fiscal.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TOrigem_Fiscal.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  ProximoCodigo('ORF_CODIGO');
  try
    EDataCadastro.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  Estado:=1;
  AtualizaControles(True);
end;

function TOrigem_Fiscal.deletarauto:Boolean;
begin
  Result := False;
  try
    if Delete then
    Begin
      result:=true;
      GeraLog(1430,CodigoCNC,CodigoORF,'38');
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
