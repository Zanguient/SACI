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
unit Emprestimo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TEmprestimo = class(TSQuery)
    private
      { Private fields of TEmprestimo }
        { Storage for property CNCCliente }
        FCNCCliente : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoEMP }
        FCodigoEMP : Integer;
        { Storage for property CodigoLOT }
        FCodigoLOT : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Demonstracao }
        FDemonstracao : Boolean;
        { Storage for property ECNCCliente }
        FECNCCliente : TEdit;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoEMP }
        FECodigoEMP : TEdit;
        { Storage for property ECodigoLOT }
        FECodigoLOT : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDemonstracao }
        FEDemonstracao : TCheckBox;
        { Storage for property ENotaFiscalEnt }
        FENotaFiscalEnt : TEdit;
        { Storage for property ENotaFiscalSai }
        FENotaFiscalSai : TEdit;
        { Storage for property EObs }
        FEObs : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property NotaFiscalEnt }
        FNotaFiscalEnt : Integer;
        { Storage for property NotaFiscalSai }
        FNotaFiscalSai : Integer;
        { Storage for property Obs }
        FObs : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TEmprestimo }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CNCCliente }
        function GetCNCCliente : Integer;
        { Write method for property CNCCliente }
        procedure SetCNCCliente(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property CodigoEMP }
        function GetCodigoEMP : Integer;
        { Write method for property CodigoEMP }
        procedure SetCodigoEMP(Value : Integer);
        { Read method for property CodigoLOT }
        function GetCodigoLOT : Integer;
        { Write method for property CodigoLOT }
        procedure SetCodigoLOT(Value : Integer);
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Write method for property CodigoPRD }
        procedure SetCodigoPRD(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Demonstracao }
        function GetDemonstracao : Boolean;
        { Write method for property Demonstracao }
        procedure SetDemonstracao(Value : Boolean);
        { Read method for property NotaFiscalEnt }
        function GetNotaFiscalEnt : Integer;
        { Write method for property NotaFiscalEnt }
        procedure SetNotaFiscalEnt(Value : Integer);
        { Read method for property NotaFiscalSai }
        function GetNotaFiscalSai : Integer;
        { Write method for property NotaFiscalSai }
        procedure SetNotaFiscalSai(Value : Integer);
        { Read method for property Obs }
        function GetObs : String;
        { Write method for property Obs }
        procedure SetObs(Value : String);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TEmprestimo }

      { Protected methods of TEmprestimo }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TEmprestimo }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TEmprestimo }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdEMP:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um grupo de consórcio }
        function LocalizarCod(CdEMP,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TEmprestimo }
        property CNCCliente : Integer read GetCNCCliente write SetCNCCliente;
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        { Código do Grupo de Consórcio }
        property CodigoEMP : Integer read GetCodigoEMP write SetCodigoEMP;
        property CodigoLOT : Integer read GetCodigoLOT write SetCodigoLOT;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Demonstracao : Boolean
             read GetDemonstracao write SetDemonstracao;
        property ECNCCliente : TEdit read FECNCCliente write FECNCCliente;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoEMP : TEdit read FECodigoEMP write FECodigoEMP;
        property ECodigoLOT : TEdit read FECodigoLOT write FECodigoLOT;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDemonstracao : TCheckBox
             read FEDemonstracao write FEDemonstracao;
        property ENotaFiscalEnt : TEdit
             read FENotaFiscalEnt write FENotaFiscalEnt;
        property ENotaFiscalSai : TEdit
             read FENotaFiscalSai write FENotaFiscalSai;
        property EObs : TEdit read FEObs write FEObs;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property NotaFiscalEnt : Integer
             read GetNotaFiscalEnt write SetNotaFiscalEnt;
        property NotaFiscalSai : Integer
             read GetNotaFiscalSai write SetNotaFiscalSai;
        property Obs : String read GetObs write SetObs;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TEmprestimo with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TEmprestimo]);
end;

{ Method to set variable and property values and create objects }
procedure TEmprestimo.AutoInitialize;
begin
     Estado := 0;
     FECNCCliente := nil;
     FECodigoCLI := nil;
     FECodigoEMP := nil;
     FECodigoLOT := nil;
     FECodigoPRD := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEDemonstracao := nil;
     FENotaFiscalEnt := nil;
     FENotaFiscalSai := nil;
     FEObs := nil;
     FEQuantidade := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TEmprestimo.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECNCCliente then
        FECNCCliente := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoEMP then
        FECodigoEMP := nil;
     if AComponent = FECodigoLOT then
        FECodigoLOT := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDemonstracao then
        FEDemonstracao := nil;
     if AComponent = FENotaFiscalEnt then
        FENotaFiscalEnt := nil;
     if AComponent = FENotaFiscalSai then
        FENotaFiscalSai := nil;
     if AComponent = FEObs then
        FEObs := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TEmprestimo.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CNCCliente }
function TEmprestimo.GetCNCCliente : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CNCCliente }
procedure TEmprestimo.SetCNCCliente(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodigoCLI }
function TEmprestimo.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCLI }
procedure TEmprestimo.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoEMP }
function TEmprestimo.GetCodigoEMP : Integer;
begin
  try
    Result := Self.fieldByName('EMP_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoEMP }
procedure TEmprestimo.SetCodigoEMP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('EMP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "EMP_CODIGO"!');
    end;
end;

{ Read method for property CodigoLOT }
function TEmprestimo.GetCodigoLOT : Integer;
begin
  try
    Result := Self.fieldByName('LOT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoLOT }
procedure TEmprestimo.SetCodigoLOT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LOT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LOT_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TEmprestimo.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TEmprestimo.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TEmprestimo.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('EMP_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TEmprestimo.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('EMP_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "EMP_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TEmprestimo.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('EMP_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TEmprestimo.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('EMP_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "EMP_DT_CADASTRO"!');
  end;
end;

{ Read method for property Demonstracao }
function TEmprestimo.GetDemonstracao : Boolean;
begin
  try
    result := (Self.fieldByName('EMP_DEMONSTRACAO').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Demonstracao }
procedure TEmprestimo.SetDemonstracao(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('EMP_DEMONSTRACAO').asInteger := 1
      else
        Self.fieldByName('EMP_DEMONSTRACAO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "EMP_DEMONSTRACAO"!');
    end;
end;

{ Read method for property NotaFiscalEnt }
function TEmprestimo.GetNotaFiscalEnt : Integer;
begin
  try
    Result := Self.fieldByName('EMP_NOTA_FISCAL_ENT').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NotaFiscalEnt }
procedure TEmprestimo.SetNotaFiscalEnt(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('EMP_NOTA_FISCAL_ENT').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "EMP_NOTA_FISCAL_ENT"!');
    end;
end;

{ Read method for property NotaFiscalSai }
function TEmprestimo.GetNotaFiscalSai : Integer;
begin
  try
    Result := Self.fieldByName('EMP_NOTA_FISCAL_SAI').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NotaFiscalSai }
procedure TEmprestimo.SetNotaFiscalSai(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('EMP_NOTA_FISCAL_SAI').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "EMP_NOTA_FISCAL_SAI"!');
    end;
end;

{ Read method for property Obs }
function TEmprestimo.GetObs : String;
begin
  try
    Result := Self.fieldByName('EMP_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Obs }
procedure TEmprestimo.SetObs(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('EMP_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "EMP_OBSERVACAO"!');
    end;
end;

{ Read method for property Quantidade }
function TEmprestimo.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('EMP_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TEmprestimo.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('EMP_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "EMP_QUANTIDADE"!');
    end;
end;

{ Read method for property Situacao }
function TEmprestimo.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('EMP_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TEmprestimo.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('EMP_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "EMP_SITUACAO"!');
    end;
end;

function TEmprestimo.AlterarAuto:Boolean;
var
  EMP:integer;
begin
  Result:=false;
  EMP:=StrToInt(ECodigoEMP.Text);
  try
    edit;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      CodigoCLI := StrToInt(ECodigoCLI.Text);
    except
    end;
    try
      CNCCliente := StrToInt(ECNCCliente.Text);
    except
    end;
    try
      CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      CodigoLOT := StrToInt(ECodigoLOT.Text);
    except
    end;    
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      Quantidade := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      Demonstracao := EDemonstracao.Checked;
    except
    end;
    try
      Situacao := ESituacao.itemindex;
    except
    end;
    try
      OBS := EObs.Text;
    except
    end;
    try
      Post;
      Result:=True;
      GeraLog(3860,CConfiguracao.CodigoCNC,EMP);
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TEmprestimo.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled          :=not Habilitar;
  except
  end;
  try
    ECodigoCLI.Enabled       :=Habilitar;
  except
  end;
  try
    ECodigoPRD.Enabled       :=Habilitar;
  except
  end;
  try
    ECodigoLOT.Enabled       :=Habilitar;
  except
  end;  
  try
    EQuantidade.Enabled      :=Habilitar;
  except
  end;
  try
    EDemonstracao.Enabled      :=Habilitar;
  except
  end;
  try
    EObs.Enabled      :=Habilitar;
  except
  end;
end;

procedure TEmprestimo.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TEmprestimo.CarregaDados;
begin
 try
   ECodigoEMP.Text           :=IntToStr(CodigoEMP);
 except
 end;
 try
   ECodigoCLI.Text        :=IntToStr(CodigoCLI);
 except
 end;
 try
   ECNCCliente.Text        :=IntToStr(CNCCliente);
 except
 end;
 try
   ECodigoPRD.Text        :=IntToStr(CodigoPRD);
 except
 end;
 try
   ECodigoLOT.Text        :=IntToStr(CodigoLOT);
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
 try
   EQuantidade.Text :=format('%.2f',[Quantidade]);
 except
 end;
 try
   ENotaFiscalEnt.Text        :=IntToStr(NotaFiscalEnt);
 except
 end;
 try
   ENotaFiscalSai.Text        :=IntToStr(NotaFiscalSai);
 except
 end;
 try
   EDemonstracao.Checked        :=Demonstracao;
 except
 end;
 try
   ESituacao.itemindex        :=Situacao;
 except
 end;
 try
   EObs.Text        :=Obs;
 except
 end;
end;

constructor TEmprestimo.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'EMPRESTIMO';

     { Code to perform other tasks when the component is created }

end;

function TEmprestimo.Deletar(CdCNC, CdEMP:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdEMP,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        GeraLog(3860,CdCNC,CdEMP);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TEmprestimo.Destroy;
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

function TEmprestimo.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoCLI.Text) then
    mensagem:=mensagem+'Código do Cliente incorreto!'+#13;
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto incorreto!'+#13;
  if not VerificaFloatBranco(EQuantidade.Text) then
    mensagem:=mensagem+'Quantidade incorreta!'+#13;
  if EObs.Text = '' then
    mensagem:=mensagem+'Observação incorreta!'+#13;
  if not VerificaInteiroBranco(ECodigoLOT.Text) then
    mensagem:=mensagem+'Código do Lote incorreto!'+#13;    
  If mensagem <>'' Then
    ShowMessage(mensagem)
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
        LocalizarCod(SCodigo,CConfiguracao.CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoEMP;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod,CConfiguracao.CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=aux;
  end;
end;

function TEmprestimo.InserirAuto:Boolean;
begin
  try
    append;
    try
      CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoEMP   := SCodigo;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      CodigoCLI   := StrToInt(ECodigoCLI.Text);
    except
    end;
    try
      CNCCliente   := StrToInt(ECNCCliente.Text);
    except
    end;
    try
      CodigoPRD   := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      CodigoLOT   := StrToInt(ECodigoLOT.Text);
    except
    end;    
    try
      Quantidade  := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      Demonstracao := EDemonstracao.Checked;
    except
    end;
    try
      Situacao := ESituacao.itemindex;
    except
    end;
    try
      Obs := EObs.Text;
    except
    end;
    NotaFiscalEnt:=0;
    NotaFiscalSai:=0;
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

procedure TEmprestimo.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoEMP.Clear;
  except
  end;
  try
    ECodigoCLI.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ECNCCliente.Clear
    else if (CConfiguracao.Empresa <> 3) or //Dif. LBM
            (CConfiguracao.CodigoCNC = 3) then //LBM Serviço
      ECNCCliente.Text := IntToStr(CConfiguracao.CodigoCNC)
    else
      ECNCCliente.Text := '1';
  except
  end;
  try
    ECodigoPRD.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoLOT.Clear
    else
      ECodigoLOT.Text := '0';
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
  try
    EQuantidade.Clear;
  except
  end;
  try
    EDemonstracao.Checked := False;
  except
  end;
  try
    if Estado <> 1 then
      ESituacao.ItemIndex:=-1
    else
      ESituacao.ItemIndex:=0;
  except
  end;
  try
    ENotaFiscalEnt.Clear;
  except
  end;
  try
    ENotaFiscalSai.Clear;
  except
  end;
  try
    EObs.Clear;
  except
  end;
end;

{ Localiza um grupo de consórcio }
function TEmprestimo.LocalizarCod(CdEMP,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDEMP<>CodigoEMP) or (CDCNC<>CodigoCNC)  Then
    If locate('CNC_CODIGO;EMP_CODIGO', vararrayof([CDCNC, CdEMP]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TEmprestimo.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  Estado:=2;
end;

procedure TEmprestimo.PreparaInsercao;
begin
  ProximoCodigo('EMP_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TEmprestimo.deletarauto:Boolean;
var
  CdCNC,CdEMP:integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdEMP := CodigoEMP;
    if Delete then
    Begin
      result:=true;
      GeraLog(3860,CdCNC,CdEMP);
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
