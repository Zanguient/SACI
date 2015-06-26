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
unit Fatfin;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Funcoes, Variants;

type
  TFatorFinanceira = class(TSQuery)
    private
      { Private fields of TFatorFinanceira }
        { Storage for property CodigoAGF }
        FCodigoAGF : Integer;
        { Storage for property CodigoFAF }
        FCodigoFAF : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoAGF }
        FECodigoAGF : TEdit;
        { Storage for property ECodigoFAF }
        FECodigoFAF : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EFator }
        FEFator : TEdit;
        { Storage for property ENumParc }
        FENumParc : TEdit;
        { Storage for property Fator }
        FFator : Double;
        { Storage for property NumParc }
        FNumParc : Integer;

      { Private methods of TFatorFinanceira }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoAGF }
        function GetCodigoAGF : Integer;
        { Write method for property CodigoAGF }
        procedure SetCodigoAGF(Value : Integer);
        { Read method for property CodigoFAF }
        function GetCodigoFAF : Integer;
        { Write method for property CodigoFAF }
        procedure SetCodigoFAF(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Fator }
        function GetFator : Double;
        { Write method for property Fator }
        procedure SetFator(Value : Double);
        { Read method for property NumParc }
        function GetNumParc : Integer;
        { Write method for property NumParc }
        procedure SetNumParc(Value : Integer);

    protected
      { Protected fields of TFatorFinanceira }

      { Protected methods of TFatorFinanceira }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;
        procedure Loaded; override;

    public
      { Public fields and properties of TFatorFinanceira }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TFatorFinanceira }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdFAF:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Agente Financeiro }
        function Inserir(CdCNC,CdFAF,CdAGF,PNumParc: integer; PFator:Real):boolean;
        function InserirAuto:Boolean;
        { Localiza um Agente Financeiro }
        function LocalizarCod(CdFAF,CdCNC:Integer):Boolean;
        function LocalizarNParc(CdAGF,PNParc:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;
        { Altera um Agente Financeiro }
        function zzzAlterar(CdCNC,CdFAF,CdAGF,PNumParc: integer; PFator:Real):boolean;

    published
      { Published properties of TFatorFinanceira }
        { Código do Agente Financeiro }
        property CodigoAGF : Integer read GetCodigoAGF write SetCodigoAGF;
        property CodigoFAF : Integer read GetCodigoFAF write SetCodigoFAF;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoAGF : TEdit read FECodigoAGF write FECodigoAGF;
        property ECodigoFAF : TEdit read FECodigoFAF write FECodigoFAF;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EFator : TEdit read FEFator write FEFator;
        property ENumParc : TEdit read FENumParc write FENumParc;
        property Fator : Double read GetFator write SetFator;
        property NumParc : Integer read GetNumParc write SetNumParc;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TFatorFinanceira with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TFatorFinanceira]);
end;

{ Method to set variable and property values and create objects }
procedure TFatorFinanceira.AutoInitialize;
begin
     Estado := 0;
     FECodigoAGF := nil;
     FECodigoFAF := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEFator := nil;
     FENumParc := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TFatorFinanceira.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoAGF then
        FECodigoAGF := nil;
     if AComponent = FECodigoFAF then
        FECodigoFAF := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEFator then
        FEFator := nil;
     if AComponent = FENumParc then
        FENumParc := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TFatorFinanceira.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoAGF }
function TFatorFinanceira.GetCodigoAGF : Integer;
begin
  try
    Result := Self.fieldByName('AGF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoAGF }
procedure TFatorFinanceira.SetCodigoAGF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_CODIGO"!');
    end;
end;

{ Read method for property CodigoFAF }
function TFatorFinanceira.GetCodigoFAF : Integer;
begin
  try
    Result := Self.fieldByName('FAF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFAF }
procedure TFatorFinanceira.SetCodigoFAF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FAF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FAF_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TFatorFinanceira.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('FAF_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TFatorFinanceira.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FAF_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FAF_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TFatorFinanceira.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('FAF_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TFatorFinanceira.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FAF_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FAF_DT_CADASTRO"!');
  end;
end;

{ Read method for property Fator }
function TFatorFinanceira.GetFator : Double;
begin
  try
    Result := Self.fieldByName('FAF_FATOR').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Fator }
procedure TFatorFinanceira.SetFator(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FAF_FATOR').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FAF_FATOR"!');
  end;
end;

{ Read method for property NumParc }
function TFatorFinanceira.GetNumParc : Integer;
begin
  try
    Result := Self.fieldByName('FAF_NPARC').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NumParc }
procedure TFatorFinanceira.SetNumParc(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FAF_NPARC').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FAF_NPARC"!');
    end;
end;

function TFatorFinanceira.AlterarAuto:Boolean;
var
  CdCNC, CdAGF: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdAGF := CodigoAGF;
  sDetalhe := '';
  try
    edit;
    try
       CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
       DataAlterado  := CConfiguracao.DataHora;
    except
    end;
    try
       NumParc  := StrToInt(EnumParc.Text);
       sDetalhe := sDetalhe + 'NParcelas:'+EnumParc.Text;
    except
    end;
    try
       Fator := Arredonda(StrToFloat(EFator.Text),7);
       sDetalhe := sDetalhe + ' Fator:'+Format('%.7f',[StrToFloat(EFator.Text)]);
    except
    end;

    try
      Post;
      GeraLog(400, CdCNC, CdAGF, 'ALTERAR FATOR '+sDetalhe);
      Result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TFatorFinanceira.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 try
   EDBGrid.Enabled     := not Habilitar;
 except
 end;
 Try
   ENumParc.Enabled     :=Habilitar;
 except
 end;
 try
   EFator.Enabled         :=Habilitar;
 except
 end;
end;

procedure TFatorFinanceira.CancelaEdicao;
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

procedure TFatorFinanceira.CarregaDados;
begin
 Try
   ECodigoFAF.Text :=IntToStr(CodigoFAF);
   Except
  End;
 Try
   ENumParc.Text   :=IntToStr(NumParc);
 except
 end;
 try
   EFator.Text     := Format('%.7f', [Fator]);
 except
 end;
end;

constructor TFatorFinanceira.Create(AOwner: TComponent);
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

function TFatorFinanceira.Deletar(CdCNC,CdFAF:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdFAF,CdCNC)) Then
  Begin
    Result := False;
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).isEmpty then
        begin
          try
            ECodigoFAF.Clear;
          except
          end;
          try
            ENumParc.Clear;
          except
          end;
          try
            EFator.Clear;
          except
          end;
        end;
      end
      else
        Result := False;
    Except
      Result := False;
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TFatorFinanceira.Destroy;
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

function TFatorFinanceira.FinalizaEdicao:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cod, cdcnc:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  If not Verificafloat(EFator.text) Then
    mensagem:=mensagem+'Fator de correção digitado incorretamente!';
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
      if Inserirauto Then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CConfiguracao.CodigoCNC);
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoFAF;
      cdcnc:=codigoCNC;
      if Alterarauto then
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
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

{ Insere um Agente Financeiro }
function TFatorFinanceira.Inserir(CdCNC,CdFAF,CdAGF,PNumParc: integer; PFator:Real):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdFAF=0 then
    Cod    := ProximoCodigo('FAF_CODIGO')
  Else
    Cod    := CdFAF;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    Insert;
    try
      CodigoFAF      := Cod;
      CodigoCNC      := CdCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataCadastro   := CConfiguracao.DataHora;
      CodigoAGF      := CdAGF;
      NumParc        := PNumParc;
      Fator          := PFator;

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

function TFatorFinanceira.InserirAuto:Boolean;
var
  CdCNC, CdAGF: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CConfiguracao.CodigoCNC;
  CdAGF := StrToInt(ECodigoAGF.Text);
  sDetalhe := '';
  try
    append;
    try
      CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoFAF := SCodigo;
    except
    end;
    try
       CodigoUSU  := CConfiguracao.CodigoUSU;
    except
    end;
    try
       DataCadastro  := CConfiguracao.DataHora;
    except
    end;
    try
      CodigoAGF  := StrToInt(ECodigoAGF.Text);
    except
    end;
    try
      NumParc := StrToInt(ENumParc.Text);
      sDetalhe := sDetalhe + 'NParcelas:'+ENumParc.Text;
    except
    end;
    try
      Fator := Arredonda(StrToFloat(EFator.Text),7);
      sDetalhe := sDetalhe + ' Fator:'+Format('%.7f',[StrToFloat(EFator.Text)]);
    except
    end;

    try
      Post;
      GeraLog(400, CdCNC, CdAGF, 'INSERIR FATOR '+sDetalhe);
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TFatorFinanceira.Loaded;
begin
     inherited Loaded;

     { Perform any component setup that depends on the property
       values having been set }
  Filtered:=False;
end;

{ Localiza um Agente Financeiro }
function TFatorFinanceira.LocalizarCod(CdFAF,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdFAF<>CodigoFAF) or (CdCNC<>CodigoCNC) Then
    If locate('FAF_CODIGO',CdFAF, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TFatorFinanceira.LocalizarNParc(CdAGF,PNParc:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Result:=locate('AGF_CODIGO;FAF_NPARC', vararrayof([CdAGF, PNParc]), []);
end;

procedure TFatorFinanceira.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TFatorFinanceira.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 ProximoCodigo('FAF_CODIGO');
 try
   ENumParc.Clear;
 except
 end;
 try
   EFator.Clear;
 except
 end;

 try
  AtualizaControles(True);
 except
 end;

  Estado:=1;
end;

function TFatorFinanceira.deletarauto:Boolean;
var
  CdCNC, CdAGF: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdAGF := CodigoAGF;
  sDetalhe := 'NParcelas:'+IntToStr(NumParc)+
              ' Fator:'+Format('%.7f',[Fator]);
  try
    if Delete then
    Begin
      GeraLog(400, CdCNC, CdAGF, 'EXCLUIR FATOR '+sDetalhe);
      Result :=  True;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

{ Altera um Agente Financeiro }
function TFatorFinanceira.zzzAlterar(CdCNC,CdFAF,CdAGF,PNumParc: integer; PFator:Real):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdFAF,CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataAlterado   := CConfiguracao.DataHora;
      NumParc        := PNumParc;
      Fator          := PFator;
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


end.
