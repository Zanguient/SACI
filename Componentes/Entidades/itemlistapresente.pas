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
unit ItemListaPresente;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TItemListaPesente = class(TSQuery)
    private
      { Private fields of TItemListaPesente }
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoILP }
        FCodigoILP : Integer;
        { Storage for property CodigoLSP }
        FCodigoLSP : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoLSP }
        FECodigoLSP : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EObs }
        FEObs : TEdit;
        { Storage for property EQuantidadeComprada }
        FEQuantidadeComprada : TEdit;
        { Storage for property EQuantidadeNecessaria }
        FEQuantidadeNecessaria : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property EcodigoILP }
        FEcodigoILP : TEdit;
        { Storage for property Obs }
        FObs : String;
        { Storage for property QuantidadeComprada }
        FQuantidadeComprada : Integer;
        { Storage for property QuantidadeNecessaria }
        FQuantidadeNecessaria : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TItemListaPesente }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoILP }
        function GetCodigoILP : Integer;
        { Write method for property CodigoILP }
        procedure SetCodigoILP(Value : Integer);
        { Read method for property CodigoLSP }
        function GetCodigoLSP : Integer;
        { Write method for property CodigoLSP }
        procedure SetCodigoLSP(Value : Integer);
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
        { Read method for property Obs }
        function GetObs : String;
        { Write method for property Obs }
        procedure SetObs(Value : String);
        { Read method for property QuantidadeComprada }
        function GetQuantidadeComprada : Integer;
        { Write method for property QuantidadeComprada }
        procedure SetQuantidadeComprada(Value : Integer);
        { Read method for property QuantidadeNecessaria }
        function GetQuantidadeNecessaria : Integer;
        { Write method for property QuantidadeNecessaria }
        procedure SetQuantidadeNecessaria(Value : Integer);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TItemListaPesente }

      { Protected methods of TItemListaPesente }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItemListaPesente }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TItemListaPesente }
        { Altera uma Lista de Presentes }
        function Alterar(CdCNC,CdILP,CdPRD,QuantNeces,QuantCompr,PSituacao: integer; DTAlterado:TDateTime;sOBS:String):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdILP:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Empréstimo }
        function Inserir(CdCNC,CdILP,CdLSP,CdPDR,QtdNeces,QtdCompr,PSituacao: integer; DTCadastro:TDateTime; sOBS:String):boolean;
        function InserirAuto:Boolean;
        { Localiza um grupo de consórcio }
        function LocalizarCod(CdILP,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItemListaPesente }
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoILP : Integer read GetCodigoILP write SetCodigoILP;
        { Código da Lista de Presentes }
        property CodigoLSP : Integer read GetCodigoLSP write SetCodigoLSP;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoLSP : TEdit read FECodigoLSP write FECodigoLSP;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EObs : TEdit read FEObs write FEObs;
        property EQuantidadeComprada : TEdit
             read FEQuantidadeComprada write FEQuantidadeComprada;
        property EQuantidadeNecessaria : TEdit
             read FEQuantidadeNecessaria write FEQuantidadeNecessaria;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property EcodigoILP : TEdit read FEcodigoILP write FEcodigoILP;
        property Obs : String read GetObs write SetObs;
        property QuantidadeComprada : Integer
             read GetQuantidadeComprada write SetQuantidadeComprada;
        property QuantidadeNecessaria : Integer
             read GetQuantidadeNecessaria write SetQuantidadeNecessaria;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItemListaPesente with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItemListaPesente]);
end;

{ Method to set variable and property values and create objects }
procedure TItemListaPesente.AutoInitialize;
begin
     Estado := 0;
     FECodigoLSP := nil;
     FECodigoPRD := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEObs := nil;
     FEQuantidadeComprada := nil;
     FEQuantidadeNecessaria := nil;
     FESituacao := nil;
     FEcodigoILP := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItemListaPesente.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoLSP then
        FECodigoLSP := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEObs then
        FEObs := nil;
     if AComponent = FEQuantidadeComprada then
        FEQuantidadeComprada := nil;
     if AComponent = FEQuantidadeNecessaria then
        FEQuantidadeNecessaria := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FEcodigoILP then
        FEcodigoILP := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItemListaPesente.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoCNC }
function TItemListaPesente.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TItemListaPesente.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoILP }
function TItemListaPesente.GetCodigoILP : Integer;
begin
  try
    Result := Self.fieldByName('ILP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoILP }
procedure TItemListaPesente.SetCodigoILP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ILP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ILP_CODIGO"!');
    end;
end;

{ Read method for property CodigoLSP }
function TItemListaPesente.GetCodigoLSP : Integer;
begin
  try
    Result := Self.fieldByName('LSP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoLSP }
procedure TItemListaPesente.SetCodigoLSP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LSP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LSP_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItemListaPesente.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TItemListaPesente.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItemListaPesente.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('ILP_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItemListaPesente.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ILP_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ILP_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TItemListaPesente.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('ILP_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItemListaPesente.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ILP_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ILP_DT_CADASTRO"!');
  end;
end;

{ Read method for property Obs }
function TItemListaPesente.GetObs : String;
begin
  try
    Result := Self.fieldByName('ILP_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Obs }
procedure TItemListaPesente.SetObs(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ILP_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ILP_OBSERVACAO"!');
    end;
end;

{ Read method for property QuantidadeComprada }
function TItemListaPesente.GetQuantidadeComprada : Integer;
begin
  try
    Result := Self.fieldByName('ILP_QUANTIDADE_COMPRADA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property QuantidadeComprada }
procedure TItemListaPesente.SetQuantidadeComprada(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ILP_QUANTIDADE_COMPRADA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ILP_QUANTIDADE_COMPRADA"!');
    end;
end;

{ Read method for property QuantidadeNecessaria }
function TItemListaPesente.GetQuantidadeNecessaria : Integer;
begin
  try
    Result := Self.fieldByName('ILP_QUANTIDADE_NECESSARIA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property QuantidadeNecessaria }
procedure TItemListaPesente.SetQuantidadeNecessaria(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ILP_QUANTIDADE_NECESSARIA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ILP_QUANTIDADE_NECESSARIA"!');
    end;
end;

{ Read method for property Situacao }
function TItemListaPesente.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('ILP_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TItemListaPesente.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ILP_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ILP_SITUACAO"!');
    end;
end;

{ Altera uma Lista de Presentes }
function TItemListaPesente.Alterar(CdCNC,CdILP,CdPRD,QuantNeces,QuantCompr,PSituacao: integer; DTAlterado:TDateTime;sOBS:String):boolean;
begin
  If not(localizarCod(CdILP,CdCNC)) Then
  begin
    result := false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoPRD                 := CdPRD;
      QuantidadeNecessaria      := QuantNeces;
      QuantidadeComprada        := QuantCompr;
      Situacao                  := PSituacao;
      Obs                       := sOBS;
      DataAlterado              := DTAlterado;
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

function TItemListaPesente.AlterarAuto:Boolean;
begin
  try
    edit;
    try
      CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      QuantidadeNecessaria :=StrToInt(EQuantidadeNecessaria.Text);
    except
    end;
    try
      QuantidadeComprada := StrToInt(EQuantidadeComprada.text);
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

procedure TItemListaPesente.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled          :=not Habilitar;
  except
  end;
  try
    ECodigoPRD.Enabled       :=Habilitar;
  except
  end;
  try
    EQuantidadeNecessaria.Enabled        :=Habilitar;
  except
  end;
  try
    EQuantidadeComprada.Enabled        :=Habilitar;
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

procedure TItemListaPesente.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  CarregaDados;
end;

procedure TItemListaPesente.CarregaDados;
begin
 try
   ECodigoILP.Text                  :=IntToStr(CodigoILP);
 except
 end;
 try
   ECodigoLSP.Text                   :=IntToStr(CodigoLSP);
 except
 end;
 try
   ECodigoPRD.Text                   :=IntToStr(CodigoPRD);
 except
 end;
 try
   EQuantidadeNecessaria.Text        :=IntToStr(QuantidadeNecessaria);
 except
 end;
 try
   EQuantidadeComprada.Text          :=IntToStr(QuantidadeComprada);
 except
 end;
 try
   if DataCadastro=0 then
     EDataCadastro.Clear
   else
     EDataCadastro.Text               :=FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro);
   except
 end;
 try
   if DataAlterado=0 then
     EDataAlterado.Clear
   else
     EDataAlterado.Text               :=FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado);
 except
 end;
 try
   ESituacao.itemindex                 :=Situacao;
 except
 end;
 try
   EObs.Text                            :=Obs;
 except
 end;
end;

constructor TItemListaPesente.Create(AOwner: TComponent);
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

function TItemListaPesente.Deletar(CdCNC,CdILP:Integer):Boolean;
begin
  If not(localizarCod(CdILP,CdCNC)) Then
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
            ECodigoILP.Clear;
          except
          end;
          try
            ECodigoPRD.Clear;
          except
          end;
          try
            EQuantidadeNecessaria.Clear;
          except
          end;
          try
            EQuantidadeComprada.Clear;
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

destructor TItemListaPesente.Destroy;
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

function TItemListaPesente.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto incorreto!'+#13;
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
      cod:=codigoILP;
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
function TItemListaPesente.Inserir(CdCNC,CdILP,CdLSP,CdPDR,QtdNeces,QtdCompr,PSituacao: integer; DTCadastro:TDateTime; sOBS:String):boolean;
Var
  Cod: Integer;
begin
  if CdILP=0 then
    Cod    := ProximoCodigo('ILP_CODIGO')
  else
    Cod      := CdILP;
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
       CodigoLSP                 := CdLSP;
       CodigoILP                 := Cod;
       CodigoCNC                 := CdCNC;
       CodigoPRD                 := CdPDR;
       QuantidadeNecessaria      := QtdNeces;
       QuantidadeComprada        := QtdCompr;
       Situacao                  := PSituacao;
       DataCadastro              := DTCadastro;
       Obs                       := sOBS;
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

function TItemListaPesente.InserirAuto:Boolean;
begin
  try
    append;
    try
      CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoLSP   := StrToInt(ECodigoLSP.Text);
    except
    end;
    try
      CodigoILP   := SCodigo;
    except
    end;
    try
      codigoPRD   := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      QuantidadeNecessaria   := StrToInt(EQuantidadeNecessaria.Text);
    except
    end;
    try
      QuantidadeComprada   := StrToInt(EQuantidadeComprada.Text);
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
function TItemListaPesente.LocalizarCod(CdILP,CdCNC:Integer):Boolean;
begin
  If (CDILP<>CodigoILP) or (CDCNC<>CodigoCNC)  Then
    If locate('CNC_CODIGO;ILP_CODIGO', vararrayof([CDCNC, CdILP]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItemListaPesente.PreparaAlteracao;
begin
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  Estado:=2;
end;

procedure TItemListaPesente.PreparaInsercao;
begin
 ProximoCodigo('ILP_CODIGO');
 try
   ECodigoPRD.Clear;
 except
 end;
 try
   EQuantidadeNecessaria.Clear;
 except
 end;
 try
   EQuantidadeComprada.Clear;
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

function TItemListaPesente.deletarauto:Boolean;
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
