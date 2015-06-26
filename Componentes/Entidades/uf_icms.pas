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
unit UF_ICMS;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TUF_ICMS = class(TSQuery)
    private
      { Private fields of TUF_ICMS }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EICMSCompra }
        FEICMSCompra : TEdit;
        { Storage for property EICMSVenda }
        FEICMSVenda : TEdit;
        { Storage for property EUF }
        FEUF : TComboBox;
        { Storage for property ICMSCompra }
        FICMSCompra : Double;
        { Storage for property ICMSVenda }
        FICMSVenda : Double;
        { Storage for property UF }
        FUF : String;

      { Private methods of TUF_ICMS }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
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
        { Read method for property ICMSCompra }
        function GetICMSCompra : Double;
        { Write method for property ICMSCompra }
        procedure SetICMSCompra(Value : Double);
        { Read method for property ICMSVenda }
        function GetICMSVenda : Double;
        { Write method for property ICMSVenda }
        procedure SetICMSVenda(Value : Double);
        { Read method for property UF }
        function GetUF : String;
        { Write method for property UF }
        procedure SetUF(Value : String);

    protected
      { Protected fields of TUF_ICMS }

      { Protected methods of TUF_ICMS }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TUF_ICMS }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TUF_ICMS }
        { Altera uma UF ICMS }
        function Alterar(PUF:string; PICMSVenda,PICMSCompra:Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(PUF:string):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function Inserir(PUF:string; PICMSVenda,PICMSCompra:Double):boolean;
        function InserirAuto:Boolean;
        { Localiza um UF ICMS }
        function LocalizarCod(PUF:string):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TUF_ICMS }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EICMSCompra : TEdit read FEICMSCompra write FEICMSCompra;
        property EICMSVenda : TEdit read FEICMSVenda write FEICMSVenda;
        property EUF : TComboBox read FEUF write FEUF;
        property ICMSCompra : Double read GetICMSCompra write SetICMSCompra;
        property ICMSVenda : Double read GetICMSVenda write SetICMSVenda;
        property UF : String read GetUF write SetUF;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TUF_ICMS with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TUF_ICMS]);
end;

{ Method to set variable and property values and create objects }
procedure TUF_ICMS.AutoInitialize;
begin
     Estado := 0;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEICMSCompra := nil;
     FEICMSVenda := nil;
     FEUF := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TUF_ICMS.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEICMSCompra then
        FEICMSCompra := nil;
     if AComponent = FEICMSVenda then
        FEICMSVenda := nil;
     if AComponent = FEUF then
        FEUF := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TUF_ICMS.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TUF_ICMS.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TUF_ICMS.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TUF_ICMS.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TUF_ICMS.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TUF_ICMS.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('UFI_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TUF_ICMS.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('UFI_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "UFI_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TUF_ICMS.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('UFI_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TUF_ICMS.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('UFI_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "UFI_DT_CADASTRO"!');
  end;
end;

{ Read method for property ICMSCompra }
function TUF_ICMS.GetICMSCompra : Double;
begin
  try
    Result := Self.fieldByName('UFI_ICMS_COMPRA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ICMSCompra }
procedure TUF_ICMS.SetICMSCompra(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('UFI_ICMS_COMPRA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "UFI_ICMS_COMPRA"!');
    end;
end;

{ Read method for property ICMSVenda }
function TUF_ICMS.GetICMSVenda : Double;
begin
  try
    Result := Self.fieldByName('UFI_ICMS_VENDA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ICMSVenda }
procedure TUF_ICMS.SetICMSVenda(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('UFI_ICMS_VENDA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "UFI_ICMS_VENDA"!');
    end;
end;

{ Read method for property UF }
function TUF_ICMS.GetUF : String;
begin
  try
    Result := Self.fieldByName('UFI_UF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property UF }
procedure TUF_ICMS.SetUF(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('UFI_UF').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "UFI_UF"!');
    end;
end;

{ Altera uma UF ICMS }
function TUF_ICMS.Alterar(PUF:string; PICMSVenda,PICMSCompra:Double):boolean;
begin
  result := false;
  If not(localizarCod(PUF)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      ICMSCompra    := PICMSCompra;
      ICMSVenda     := PICMSVenda;
      CodigoUSU     := CConfiguracao.CodigoUSU;
      DataAlterado  := CConfiguracao.DataHora;
      try
        Post;
        result := true;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TUF_ICMS.AlterarAuto:Boolean;
begin
  result := false;
  try
    edit;
    try
      ICMSCompra := StrToFloat(EICMSCompra.Text);
    except
    end;
    try
      ICMSVenda  := StrToFloat(EICMSVenda.Text);
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
      GeraLog(3920,CConfiguracao.CodigoCNC,0,EUF.Text);
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TUF_ICMS.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EDbgrid.Enabled          :=not Habilitar;
  except
  end;
  try
    if Estado = 1 then
      EUF.Enabled       :=Habilitar
    else
      EUF.Enabled       :=False;
  except
  end;
  try
    EICMSCompra.Enabled       :=Habilitar;
  except
  end;
  try
    EICMSVenda.Enabled       :=Habilitar;
  except
  end;
end;

procedure TUF_ICMS.CancelaEdicao;
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

procedure TUF_ICMS.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
 try
   ItemComboBox(EUF,UF);
 except
 end;
 try
   EICMSCompra.Text        :=format('%.2f',[ICMSCompra]);
 except
 end;
 try
   EICMSVenda.Text        :=format('%.2f',[ICMSVenda]);
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

constructor TUF_ICMS.Create(AOwner: TComponent);
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

function TUF_ICMS.Deletar(PUF:string):Boolean;
begin
  result := false;
  If not(localizarCod(PUF)) Then
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
            EUF.ItemIndex:= -1;
          except
          end;
          try
            EICMSCompra.Clear;
          except
          end;
          try
            EICMSVenda.Clear;
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
        end;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TUF_ICMS.Destroy;
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

function TUF_ICMS.FinalizaEdicao:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
var
  PUF,mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if EUF.ItemIndex = -1 then
    mensagem:=mensagem+'Estado inválido!'+#13;
  if not VerificaFloatBranco(EICMSCompra.Text) then
    mensagem:=mensagem+'ICMS de Compra incorreto!'+#13;
  if not VerificaFloatBranco(EICMSVenda.Text) then
    mensagem:=mensagem+'ICMS de Venda incorreto!'+#13;
  If mensagem <>'' Then
  Begin
    Result := False;
    ShowMessage(mensagem);
  end
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    PUF:=EUF.Text;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(PUF);
        CarregaDados;
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(PUF);
        CarregaDados;
        AtualizaControles(False);
        Estado:=0;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=aux;
  end;
end;

function TUF_ICMS.Inserir(PUF:string; PICMSVenda,PICMSCompra:Double):boolean;
begin
  result := false;
  If (localizarCod(PUF)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     Insert;
     try
      UF            := PUF;
      ICMSCompra    := PICMSCompra;
      ICMSVenda     := PICMSVenda;
      CodigoCNC     := CConfiguracao.CodigoCNC;
      CodigoUSU     := CConfiguracao.CodigoUSU;
      DataCadastro  := CConfiguracao.DataHora;

       try
         Post;
         result := true;

       except
         Cancel;
         ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
       end;
     except
       ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
     end;
  end;
end;

function TUF_ICMS.InserirAuto:Boolean;
begin
  result := false;
  If (localizarCod(EUF.Text)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      append;
      try
        UF         := EUF.Text;
      except
      end;
      try
        ICMSCompra := StrToFloat(EICMSCompra.Text);
      except
      end;
      try
        ICMSVenda  := StrToFloat(EICMSVenda.Text);
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
end;

{ Localiza um UF ICMS }
function TUF_ICMS.LocalizarCod(PUF:string):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (PUF<>UF) Then
    If locate('UFI_UF', PUF, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TUF_ICMS.PreparaAlteracao;
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

procedure TUF_ICMS.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    EUF.ItemIndex:=-1;
  except
  end;
  try
    EICMSCompra.Clear;
  except
  end;
  try
    EICMSVenda.Clear;
  except
  end;
  try
    EDataCadastro.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  Estado:=1;
  AtualizaControles(True);
end;

function TUF_ICMS.deletarauto:Boolean;
var
  PUF:string;
begin
  result := false;
  try
    PUF:=UF;
    if Delete then
    Begin
      result:=true;
      GeraLog(3920,CConfiguracao.CodigoCNC,0,PUF);
    end;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
