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
unit Descontos;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TDescontos = class(TSQuery)
    private
      { Private fields of TDescontos }
        { Storage for property CodigoDES }
        FCodigoDES : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoGRP }
        FCodigoGRP : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Desconto60 }
        FDesconto60 : Double;
        { Storage for property DescontoGerente }
        FDescontoGerente : Double;
        { Storage for property DescontoLJ3 }
        FDescontoLJ3 : Double;
        { Storage for property ECodigoDES }
        FECodigoDES : TEdit;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TEdit;
        { Storage for property ECodigoGRP }
        FECodigoGRP : TDBLookupComboBox;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDesconto60 }
        FEDesconto60 : TEdit;
        { Storage for property EDescontoGerente }
        FEDescontoGerente : TEdit;
        { Storage for property EDescontoLJ3 }
        FEDescontoLJ3 : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TDescontos }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoDES }
        function GetCodigoDES : Integer;
        { Write method for property CodigoDES }
        procedure SetCodigoDES(Value : Integer);
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Write method for property CodigoFOR }
        procedure SetCodigoFOR(Value : Integer);
        { Read method for property CodigoGRP }
        function GetCodigoGRP : Integer;
        { Write method for property CodigoGRP }
        procedure SetCodigoGRP(Value : Integer);
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
        { Read method for property Desconto60 }
        function GetDesconto60 : Double;
        { Write method for property Desconto60 }
        procedure SetDesconto60(Value : Double);
        { Read method for property DescontoGerente }
        function GetDescontoGerente : Double;
        { Write method for property DescontoGerente }
        procedure SetDescontoGerente(Value : Double);
        { Read method for property DescontoLJ3 }
        function GetDescontoLJ3 : Double;
        { Write method for property DescontoLJ3 }
        procedure SetDescontoLJ3(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TDescontos }

      { Protected methods of TDescontos }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TDescontos }

      { Public methods of TDescontos }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdDES:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um grupo de consórcio }
        function LocalizarCod(CdDES:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TDescontos }
        { Código do Grupo de Consórcio }
        property CodigoDES : Integer read GetCodigoDES write SetCodigoDES;
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        property CodigoGRP : Integer read GetCodigoGRP write SetCodigoGRP;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Desconto60 : Double read GetDesconto60 write SetDesconto60;
        property DescontoGerente : Double
             read GetDescontoGerente write SetDescontoGerente;
        property DescontoLJ3 : Double read GetDescontoLJ3 write SetDescontoLJ3;
        property ECodigoDES : TEdit read FECodigoDES write FECodigoDES;
        property ECodigoFOR : TEdit read FECodigoFOR write FECodigoFOR;
        property ECodigoGRP : TDBLookupComboBox
             read FECodigoGRP write FECodigoGRP;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDesconto60 : TEdit read FEDesconto60 write FEDesconto60;
        property EDescontoGerente : TEdit
             read FEDescontoGerente write FEDescontoGerente;
        property EDescontoLJ3 : TEdit read FEDescontoLJ3 write FEDescontoLJ3;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TDescontos with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TDescontos]);
end;

{ Method to set variable and property values and create objects }
procedure TDescontos.AutoInitialize;
begin
     FECodigoDES := nil;
     FECodigoFOR := nil;
     FECodigoGRP := nil;
     FECodigoPRD := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEDesconto60 := nil;
     FEDescontoGerente := nil;
     FEDescontoLJ3 := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TDescontos.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoDES then
        FECodigoDES := nil;
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FECodigoGRP then
        FECodigoGRP := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDesconto60 then
        FEDesconto60 := nil;
     if AComponent = FEDescontoGerente then
        FEDescontoGerente := nil;
     if AComponent = FEDescontoLJ3 then
        FEDescontoLJ3 := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TDescontos.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoDES }
function TDescontos.GetCodigoDES : Integer;
begin
  try
    Result := Self.fieldByName('DES_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoDES }
procedure TDescontos.SetCodigoDES(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DES_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DES_CODIGO"!');
    end;
end;

{ Read method for property CodigoFOR }
function TDescontos.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFOR }
procedure TDescontos.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property CodigoGRP }
function TDescontos.GetCodigoGRP : Integer;
begin
  try
    Result := Self.fieldByName('GRP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoGRP }
procedure TDescontos.SetCodigoGRP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('GRP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "GRP_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TDescontos.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TDescontos.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TDescontos.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('DES_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TDescontos.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('DES_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "DES_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TDescontos.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('DES_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TDescontos.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('DES_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "DES_DT_CADASTRO"!');
  end;
end;

{ Read method for property Desconto60 }
function TDescontos.GetDesconto60 : Double;
begin
  try
    Result := Self.fieldByName('DES_DESCONTO_60').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Desconto60 }
procedure TDescontos.SetDesconto60(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DES_DESCONTO_60').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DES_DESCONTO_60"!');
    end;
end;

{ Read method for property DescontoGerente }
function TDescontos.GetDescontoGerente : Double;
begin
  try
    Result := Self.fieldByName('DES_DESCONTO_GERENTE').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property DescontoGerente }
procedure TDescontos.SetDescontoGerente(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DES_DESCONTO_GERENTE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DES_DESCONTO_GERENTE"!');
    end;
end;

{ Read method for property DescontoLJ3 }
function TDescontos.GetDescontoLJ3 : Double;
begin
  try
    Result := Self.fieldByName('DES_DESCONTO_LJ3').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property DescontoLJ3 }
procedure TDescontos.SetDescontoLJ3(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DES_DESCONTO_LJ3').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DES_DESCONTO_LJ3"!');
    end;
end;

{ Read method for property Situacao }
function TDescontos.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('DES_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TDescontos.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('DES_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "DES_SITUACAO"!');
    end;
end;

function TDescontos.AlterarAuto:Boolean;
var
  CdDES:integer;
  sAux,sDescontos: string;
begin
  Result:=False;
  CdDES:=StrToInt(ECodigoDES.Text);
  try
    sAux := IntToStr(ECodigoGRP.KeyValue);
  except
    sAux := '0';
  end;
  sDescontos:='FOR:'+ECodigoFOR.Text+' GRP:'+sAux;
  try
    sAux := IntToStr(StrToInt(ECodigoPRD.Text));
  except
    sAux := '0';
  end;
  sDescontos:=sDescontos+' PRD:'+sAux+
    ' D1:'+format('%.2f',[Desconto60])+'% D2:'+
    format('%.2f',[DescontoGerente])+'%';
  try
    edit;
    try
      CodigoFOR := StrToInt(ECodigoFOR.Text);
    except
    end;
    try
      CodigoGRP := ECodigoGRP.KeyValue;
    except
    end;
    try
      CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      Desconto60 := StrToFloat(EDesconto60.Text);
    except
    end;
    try
      DescontoGerente := StrToFloat(EDescontoGerente.Text);
    except
    end;
    try
      DescontoLJ3 := StrToFloat(EDescontoLJ3.Text);
    except
    end;    
    try
      DataAlterado := StrToDateTime(EDataAlterado.Text);
    except
    end;
    try
      Post;
      Result:=True;
      GeraLog(3840,CConfiguracao.CodigoCNC,CdDES,'Alt: '+sDescontos);
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TDescontos.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled          :=not Habilitar;
  except
  end;
  try
    ECodigoFOR.Enabled       :=Habilitar;
  except
  end;
  try
    ECodigoGRP.Enabled       :=Habilitar;
  except
  end;
  try
    ECodigoPRD.Enabled       :=Habilitar;
  except
  end;
  try
    EDesconto60.Enabled      :=Habilitar;
  except
  end;
  try
    EDescontoGerente.Enabled :=Habilitar;
  except
  end;
  try
    EDescontoLJ3.Enabled :=Habilitar;
  except
  end;  
end;

procedure TDescontos.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TDescontos.CarregaDados;
begin
 try
   ECodigoDES.Text           :=IntToStr(CodigoDES);
 except
 end;
 try
   ECodigoFOR.Text        :=IntToStr(CodigoFOR);
 except
 end;
 try
   ECodigoGRP.KeyValue        :=CodigoGRP;
 except
 end;
 try
   ECodigoPRD.Text        :=IntToStr(CodigoPRD);
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
   EDesconto60.Text :=format('%.2f',[Desconto60]);
 except
 end;
 try
   EDescontoGerente.Text :=format('%.2f',[DescontoGerente]);
 except
 end;
 try
   EDescontoLJ3.Text :=format('%.2f',[DescontoLJ3]);
 except
 end; 
end;

constructor TDescontos.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'DESCONTOS';

     { Code to perform other tasks when the component is created }

end;

function TDescontos.Deletar(CdDES:Integer):Boolean;
var
  CdCNC:integer;
  Descontos:string;
begin
  Result := False;
  If not(localizarCod(CdDES)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      CdDES := CodigoDES;
      Descontos:='FOR:'+IntToStr(CodigoFOR)+' GRP:'+IntToStr(CodigoGRP)+' D1:'+
        format('%.2f',[Desconto60])+'% D2:'+
        format('%.2f',[DescontoGerente])+'%';
      if Delete then
      Begin
        Result := True;
        GeraLog(3840,CdCNC,CdDES,'Exc: '+Descontos);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TDescontos.Destroy;
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

function TDescontos.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  if ECodigoPRD.Text = '' then
    ECodigoPRD.Text:='0';
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoFOR.Text) then
    mensagem:=mensagem+'Fornecedor incorreto!'+#13;
  if not VerificaInteiro(ECodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto incorreto!'+#13;
  if not VerificaFloatBranco(EDesconto60.Text) then
    mensagem:=mensagem+'Desconto de 60 dias incorreto!'+#13;
  if not VerificaFloatBranco(EDescontoGerente.Text) then
    mensagem:=mensagem+'Desconto de Gerente incorreto!'+#13;
  if not VerificaFloatBranco(EDescontoLJ3.Text) then
    mensagem:=mensagem+'Desconto de LJ3 incorreto!'+#13;    
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
        LocalizarCod(SCodigo);
        CarregaDados;
        AtualizaControles(False);
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoDES;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        CarregaDados;
        AtualizaControles(False);
      end;
    End;
    AfterScroll:=aux;
    Estado:=0;
  end;
end;

function TDescontos.InserirAuto:Boolean;
var
  sAux, sDescontos: string;
begin
  result:=false;
  try
    sAux := IntToStr(ECodigoGRP.KeyValue);
  except
    sAux := '0';
  end;
  sDescontos:='FOR:'+ECodigoFOR.Text+' GRP:'+sAux;
  try
    sAux := IntToStr(StrToInt(ECodigoPRD.Text));
  except
    sAux := '0';
  end;
  sDescontos:=sDescontos + ' PRD:'+sAux+' D1:'+
    format('%.2f',[StrToFloat(EDesconto60.Text)])+'% D2:'+
    format('%.2f',[StrToFloat(EDescontoGerente.Text)])+'%';
  try
    append;
    try
      CodigoDES   := SCodigo;
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
      CodigoFOR   := StrToInt(ECodigoFOR.Text);
    except
    end;
    try
      CodigoGRP   := ECodigoGRP.KeyValue;
    except
    end;
    try
      CodigoPRD   := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      Desconto60  := StrToFloat(EDesconto60.Text);
    except
    end;
    try
      DescontoGerente  := StrToFloat(EDescontoGerente.Text);
    except
    end;
    try
      DescontoLJ3  := StrToFloat(EDescontoLJ3.Text);
    except
    end;    
    try
      DataCadastro := StrToDateTime(EDataCadastro.Text);
    except
    end;
    try
      Post;
      GeraLog(3840,CConfiguracao.CodigoCNC,sCodigo,'Inc: '+sDescontos);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TDescontos.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoDES.Clear;
  except
  end;
  try
    ECodigoFOR.Clear;
  except
  end;
  try
    ECodigoGRP.KeyValue := 0;
  except
  end;
  try
    ECodigoPRD.Clear;
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
    EDesconto60.Clear;
  except
  end;
  try
    EDescontoGerente.Clear;
  except
  end;
  try
    EDescontoLJ3.Clear;
  except
  end;  
end;

{ Localiza um grupo de consórcio }
function TDescontos.LocalizarCod(CdDES:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CDDES<>CodigoDES) Then
    If locate('DES_CODIGO', CdDES, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TDescontos.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TDescontos.PreparaInsercao;
begin
  ProximoCodigo('DES_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TDescontos.deletarauto:Boolean;
var
  CdCNC, CdDES:integer;
  Descontos:string;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdDES := CodigoDES;
    Descontos:='FOR:'+IntToStr(CodigoFOR)+' GRP:'+IntToStr(CodigoGRP)+' D1:'+
      format('%.2f',[Desconto60])+'% D2:'+
      format('%.2f',[DescontoGerente])+'%';
    if Delete then
    Begin
      result:=true;
      GeraLog(3840,CdCNC,CdDES,'Exc: '+Descontos);
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
