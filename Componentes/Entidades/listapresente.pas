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
unit ListaPresente;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TListaPresente = class(TSQuery)
    private
      { Private fields of TListaPresente }
        { Storage for property CNCCliente }
        FCNCCliente : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoLSP }
        FCodigoLSP : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECNCCliente }
        FECNCCliente : TEdit;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoLSP }
        FECodigoLSP : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EObs }
        FEObs : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Obs }
        FObs : String;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TListaPresente }
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
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoLSP }
        function GetCodigoLSP : Integer;
        { Write method for property CodigoLSP }
        procedure SetCodigoLSP(Value : Integer);
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
        { Read method for property Obs }
        function GetObs : String;
        { Write method for property Obs }
        procedure SetObs(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TListaPresente }

      { Protected methods of TListaPresente }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TListaPresente }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TListaPresente }
        { Altera uma Lista de Presentes }
        function Alterar(CdCNC,CdLSP,CdCLI,CdCNCCLI,PSituacao: integer; DTAlterado:TDateTime;sDescricao, sOBS:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdLSP:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Empréstimo }
        function Inserir(CdCNC,CdLSP,CdCLI,CdCNCCLI,PSituacao: integer; DTCadastro:TDateTime;sDescricao, sOBS:String):boolean;
        function InserirAuto:Boolean;
        { Localiza um grupo de consórcio }
        function LocalizarCod(CdLSP,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TListaPresente }
        property CNCCliente : Integer read GetCNCCliente write SetCNCCliente;
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código da Lista de Presentes }
        property CodigoLSP : Integer read GetCodigoLSP write SetCodigoLSP;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECNCCliente : TEdit read FECNCCliente write FECNCCliente;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoLSP : TEdit read FECodigoLSP write FECodigoLSP;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EObs : TEdit read FEObs write FEObs;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property Obs : String read GetObs write SetObs;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TListaPresente with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TListaPresente]);
end;

{ Method to set variable and property values and create objects }
procedure TListaPresente.AutoInitialize;
begin
     Estado := 0;
     FECNCCliente := nil;
     FECodigoCLI := nil;
     FECodigoLSP := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEDescricao := nil;
     FEObs := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TListaPresente.Notification(AComponent : TComponent; Operation : TOperation);
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
     if AComponent = FECodigoLSP then
        FECodigoLSP := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEObs then
        FEObs := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TListaPresente.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CNCCliente }
function TListaPresente.GetCNCCliente : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CNCCliente }
procedure TListaPresente.SetCNCCliente(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodigoCLI }
function TListaPresente.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCLI }
procedure TListaPresente.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TListaPresente.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TListaPresente.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoLSP }
function TListaPresente.GetCodigoLSP : Integer;
begin
  try
    Result := Self.fieldByName('LSP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoLSP }
procedure TListaPresente.SetCodigoLSP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LSP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LSP_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TListaPresente.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TListaPresente.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TListaPresente.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('LSP_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TListaPresente.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LSP_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LSP_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TListaPresente.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('LSP_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TListaPresente.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('LSP_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "LSP_DT_CADASTRO"!');
  end;
end;

{ Read method for property Descricao }
function TListaPresente.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('LSP_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TListaPresente.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LSP_DESCRICAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LSP_DESCRICAO"!');
    end;
end;

{ Read method for property Obs }
function TListaPresente.GetObs : String;
begin
  try
    Result := Self.fieldByName('LSP_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Obs }
procedure TListaPresente.SetObs(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LSP_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LSP_OBSERVACAO"!');
    end;
end;

{ Read method for property Situacao }
function TListaPresente.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('LSP_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TListaPresente.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LSP_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LSP_SITUACAO"!');
    end;
end;

{ Altera uma Lista de Presentes }
function TListaPresente.Alterar(CdCNC,CdLSP,CdCLI,CdCNCCLI,PSituacao: integer; DTAlterado:TDateTime;sDescricao, sOBS:String):boolean;
begin
  If not(localizarCod(CdLSP,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoCLI      := CdCLI;
      CNCCliente     := CdCNCCLI;
      Descricao      := sDescricao;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      Situacao       := PSituacao;
      OBS            := sOBS;
      DataAlterado   := DTAlterado;
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

function TListaPresente.AlterarAuto:Boolean;
begin
  try
    edit;
    try
      CodigoCLI := StrToInt(ECodigoCLI.Text);
    except
    end;
    try
      CNCCliente := StrToInt(ECNCCliente.Text);
    except
    end;
    try
      Descricao := EDescricao.Text;
    except
    end;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      Situacao := ESituacao.itemindex;
    except
    end;
    try
      DataAlterado := StrToDateTime(EDataAlterado.Text);
    except
    end;
    try
      OBS := EObs.Text;
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

procedure TListaPresente.AtualizaControles(Habilitar:Boolean);
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
    EDescricao.Enabled        :=Habilitar;
  except
  end;
  try
    EObs.Enabled               :=Habilitar;
  except
  end;
  try
    ESituacao.Enabled          :=Habilitar;
  except
  end;
end;

procedure TListaPresente.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
//  CarregaDados;
end;

procedure TListaPresente.CarregaDados;
begin
 try
   ECodigoLSP.Text           :=IntToStr(CodigoLSP);
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
   EDescricao.Text        :=Descricao;
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
   ESituacao.itemindex        :=Situacao;
 except
 end;
 try
   EObs.Text        :=Obs;
 except
 end;
end;

constructor TListaPresente.Create(AOwner: TComponent);
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

function TListaPresente.Deletar(CdCNC, CdLSP:Integer):Boolean;
begin
  If not(localizarCod(CdLSP,CdCNC)) Then
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
            ECodigoLSP.Clear;
          except
          end;
          try
            ECodigoCLI.Clear;
          except
          end;
          try
            ECNCCliente.Clear;
          except
          end;
          try
            EDescricao.Clear;
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
            ESituacao.ItemIndex:=-1;
          except
          end;
          try
            EObs.Clear;
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

destructor TListaPresente.Destroy;
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

function TListaPresente.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoCLI.Text) then
    mensagem:=mensagem+'Código do Cliente incorreto!'+#13;
  if EDescricao.Text='' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
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
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CConfiguracao.CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoLSP;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod,CConfiguracao.CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=aux;
    CarregaDados;
  end;
end;

{ Insere um Empréstimo }
function TListaPresente.Inserir(CdCNC,CdLSP,CdCLI,CdCNCCLI,PSituacao: integer; DTCadastro:TDateTime;sDescricao, sOBS:String):boolean;
Var
  Cod: Integer;
begin
  if CdLSP=0 then
    Cod    := ProximoCodigo('LSP_CODIGO')
  else
    Cod      := CdLSP;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
     if Estado=3 then
     begin
       result:=true;
       exit;
     end;
     Insert;
     try
       CodigoCNC      := CdCNC;
       CodigoLSP      := Cod;
       CodigoUSU      := CConfiguracao.CodigoUSU;
       CodigoCLI      := CdCLI;
       CNCCliente     := CdCNCCLI;
       Descricao      := sDescricao;
       Situacao       := PSituacao;
       DataCadastro   := DTCadastro;
       Obs            := sOBS;
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

function TListaPresente.InserirAuto:Boolean;
begin
  try
    append;
    try
      CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoLSP   := SCodigo;
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
      Descricao   := EDescricao.Text;
    except
    end;
    try
      DataCadastro := StrToDateTime(EDataCadastro.Text);
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

{ Localiza um grupo de consórcio }
function TListaPresente.LocalizarCod(CdLSP,CdCNC:Integer):Boolean;
begin
  If (CDLSP<>CodigoLSP) or (CDCNC<>CodigoCNC)  Then
    If locate('CNC_CODIGO;LSP_CODIGO', vararrayof([CDCNC, CdLSP]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TListaPresente.PreparaAlteracao;
begin
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  Estado:=2;
end;

procedure TListaPresente.PreparaInsercao;
begin
 ProximoCodigo('LSP_CODIGO');
 try
   ECodigoCLI.Clear;
 except
 end;
 try
   ECNCCliente.Text := IntToStr(CConfiguracao.CodigoCNC);
 except
 end;
 try
   EDescricao.Clear;
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
 try
   ESituacao.ItemIndex:=0;
 except
 end;
 try
   EOBS.Clear;
 except
 end;

  Estado:=1;
  AtualizaControles(True);
end;

function TListaPresente.deletarauto:Boolean;
begin
  try
    if Delete then
    Begin
      result:=true;
    end
    else
      Result := False;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
