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
unit QuantidadeNormalVenda;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Variants;

type
  TQuantidadeNormalVenda = class(TSQuery)
    private
      { Private fields of TQuantidadeNormalVenda }
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoGRP }
        FCodigoGRP : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoQNV }
        FCodigoQNV : Integer;
        { Storage for property CodigoSGP }
        FCodigoSGP : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TEdit;
        { Storage for property ECodigoGRP }
        FECodigoGRP : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoQNV }
        FECodigoQNV : TEdit;
        { Storage for property ECodigoSGP }
        FECodigoSGP : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDbgrid }
        FEDbgrid : TDBGrid;
        { Storage for property EObs }
        FEObs : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property Obs }
        FObs : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Situacao }
        FSituacao : Integer;

      { Private methods of TQuantidadeNormalVenda }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
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
        { Read method for property CodigoQNV }
        function GetCodigoQNV : Integer;
        { Write method for property CodigoQNV }
        procedure SetCodigoQNV(Value : Integer);
        { Read method for property CodigoSGP }
        function GetCodigoSGP : Integer;
        { Write method for property CodigoSGP }
        procedure SetCodigoSGP(Value : Integer);
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
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);

    protected
      { Protected fields of TQuantidadeNormalVenda }

      { Protected methods of TQuantidadeNormalVenda }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TQuantidadeNormalVenda }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TQuantidadeNormalVenda }
        { Altera uma Desconto }
        function Alterar(CdCNC,CdQNV,CdFOR,CdGRP,CdSGP,CdPRD,PSituacao: integer; DTAlterado:TDateTime;PQuantidade:real):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdQNV:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere um Empréstimo }
        function Inserir(CdCNC,CdQNV,CdFOR,CdGRP,CdSGP,CdPRD,PSituacao: integer; DTCadastro:TDateTime;PQuantidade:real):boolean;
        function InserirAuto:Boolean;
        { Localiza um grupo de consórcio }
        function LocalizarCod(CdQNV,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TQuantidadeNormalVenda }
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        property CodigoGRP : Integer read GetCodigoGRP write SetCodigoGRP;
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        { Código do Grupo de Consórcio }
        property CodigoQNV : Integer read GetCodigoQNV write SetCodigoQNV;
        property CodigoSGP : Integer read GetCodigoSGP write SetCodigoSGP;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoFOR : TEdit read FECodigoFOR write FECodigoFOR;
        property ECodigoGRP : TEdit read FECodigoGRP write FECodigoGRP;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoQNV : TEdit read FECodigoQNV write FECodigoQNV;
        property ECodigoSGP : TEdit read FECodigoSGP write FECodigoSGP;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDbgrid : TDBGrid read FEDbgrid write FEDbgrid;
        property EObs : TEdit read FEObs write FEObs;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property Obs : String read GetObs write SetObs;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Situacao : Integer read GetSituacao write SetSituacao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TQuantidadeNormalVenda with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TQuantidadeNormalVenda]);
end;

{ Method to set variable and property values and create objects }
procedure TQuantidadeNormalVenda.AutoInitialize;
begin
     Estado := 0;
     FECodigoFOR := nil;
     FECodigoGRP := nil;
     FECodigoPRD := nil;
     FECodigoQNV := nil;
     FECodigoSGP := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDbgrid := nil;
     FEObs := nil;
     FEQuantidade := nil;
     FESituacao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TQuantidadeNormalVenda.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FECodigoGRP then
        FECodigoGRP := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoQNV then
        FECodigoQNV := nil;
     if AComponent = FECodigoSGP then
        FECodigoSGP := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDbgrid then
        FEDbgrid := nil;
     if AComponent = FEObs then
        FEObs := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TQuantidadeNormalVenda.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoFOR }
function TQuantidadeNormalVenda.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFOR }
procedure TQuantidadeNormalVenda.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property CodigoGRP }
function TQuantidadeNormalVenda.GetCodigoGRP : Integer;
begin
  try
    Result := Self.fieldByName('GRP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoGRP }
procedure TQuantidadeNormalVenda.SetCodigoGRP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('GRP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "GRP_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TQuantidadeNormalVenda.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPRD }
procedure TQuantidadeNormalVenda.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property CodigoQNV }
function TQuantidadeNormalVenda.GetCodigoQNV : Integer;
begin
  try
    Result := Self.fieldByName('QNV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoQNV }
procedure TQuantidadeNormalVenda.SetCodigoQNV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('QNV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "QNV_CODIGO"!');
    end;
end;

{ Read method for property CodigoSGP }
function TQuantidadeNormalVenda.GetCodigoSGP : Integer;
begin
  try
    Result := Self.fieldByName('SGP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoSGP }
procedure TQuantidadeNormalVenda.SetCodigoSGP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('SGP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "SGP_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TQuantidadeNormalVenda.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('QNV_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TQuantidadeNormalVenda.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('QNV_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "QNV_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TQuantidadeNormalVenda.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('QNV_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TQuantidadeNormalVenda.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('QNV_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "QNV_DT_CADASTRO"!');
  end;
end;

{ Read method for property Obs }
function TQuantidadeNormalVenda.GetObs : String;
begin
  try
    Result := Self.fieldByName('QNV_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Obs }
procedure TQuantidadeNormalVenda.SetObs(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('QNV_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "QNV_OBSERVACAO"!');
    end;
end;

{ Read method for property Quantidade }
function TQuantidadeNormalVenda.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('QNV_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TQuantidadeNormalVenda.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('QNV_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "QNV_QUANTIDADE"!');
    end;
end;

{ Read method for property Situacao }
function TQuantidadeNormalVenda.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('QNV_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TQuantidadeNormalVenda.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('QNV_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "QNV_SITUACAO"!');
    end;
end;

{ Altera uma Desconto }
function TQuantidadeNormalVenda.Alterar(CdCNC,CdQNV,CdFOR,CdGRP,CdSGP,CdPRD,PSituacao: integer; DTAlterado:TDateTime;PQuantidade:real):boolean;
begin
  result := false;
  If not(localizarCod(CdQNV,CdCNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      CodigoFOR      := CdFOR;
      CodigoGRP      := CdGRP;
      CodigoSGP      := CdSGP;
      CodigoPRD      := cdPRD;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      Situacao       := PSituacao;
      DataAlterado   := DTAlterado;
      Quantidade     := PQuantidade;

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

function TQuantidadeNormalVenda.AlterarAuto:Boolean;
var
  QNV:integer;
begin
  result := false;
  QNV:=StrToInt(ECodigoQNV.Text);
  try
    edit;
    try
      CodigoFOR := StrToInt(ECodigoFOR.Text);
    except
    end;
    try
      CodigoGRP := StrToInt(ECodigoGRP.Text);
    except
    end;
    try
      CodigoSGP := StrToInt(ECodigoSGP.Text);
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
      Quantidade := StrToFloat(EQuantidade.Text);
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
      GeraLog(6100,CConfiguracao.CodigoCNC,QNV);
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TQuantidadeNormalVenda.AtualizaControles(Habilitar:Boolean);
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
    ECodigoSGP.Enabled       :=Habilitar;
  except
  end;
  try
    ECodigoPRD.Enabled       :=Habilitar;
  except
  end;
  try
    EQuantidade.Enabled      :=Habilitar;
  except
  end;
  try
    EObs.Enabled      :=Habilitar;
  except
  end;
end;

procedure TQuantidadeNormalVenda.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  CarregaDados;
end;

procedure TQuantidadeNormalVenda.CarregaDados;
begin
 try
   ECodigoQNV.Text           :=IntToStr(CodigoQNV);
 except
 end;
 try
   ECodigoFOR.Text        :=IntToStr(CodigoFOR);
 except
 end;
 try
   ECodigoGRP.Text        :=IntToStr(CodigoGRP);
 except
 end;
 try
   ECodigoSGP.Text        :=IntToStr(CodigoSGP);
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
   EQuantidade.Text :=format('%.2f',[Quantidade]);
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

constructor TQuantidadeNormalVenda.Create(AOwner: TComponent);
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

function TQuantidadeNormalVenda.Deletar(CdCNC, CdQNV:Integer):Boolean;
begin
  result := false;
  If not(localizarCod(CdQNV,CdCNC)) Then
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
            ECodigoQNV.Clear;
          except
          end;
          try
            ECodigoFOR.Clear;
          except
          end;
          try
            ECodigoGRP.Clear;
          except
          end;
          try
            ECodigoSGP.Clear;
          except
          end;
          try
            ECodigoPRD.Clear;
          except
          end;
          try
            EQuantidade.Clear;
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
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TQuantidadeNormalVenda.Destroy;
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

function TQuantidadeNormalVenda.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoFOR.Text) then
    mensagem:=mensagem+'Código do Fornecedor incorreto!'+#13;
  if not VerificaInteiro(ECodigoGRP.Text) then
    mensagem:=mensagem+'Código do Grupo incorreto!'+#13;
  if not VerificaInteiro(ECodigoSGP.Text) then
    mensagem:=mensagem+'Código do SubGrupo incorreto!'+#13;
  if not VerificaInteiro(ECodigoPRD.Text) then
    mensagem:=mensagem+'Código do Produto incorreto!'+#13;
  if not VerificaFloatBranco(EQuantidade.Text) then
    mensagem:=mensagem+'Quantidade incorreta!'+#13;
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
        Estado := 0;
        AtualizaControles(False);
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoQNV;
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
function TQuantidadeNormalVenda.Inserir(CdCNC,CdQNV,CdFOR,CdGRP,CdSGP,CdPRD,PSituacao: integer; DTCadastro:TDateTime;PQuantidade:real):boolean;
Var
  Cod: Integer;
begin
  result := false;
  if CdQNV=0 then
    Cod    := ProximoCodigo('QNV_CODIGO')
  else
    Cod      := CdQNV;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
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
       CodigoQNV      := Cod;
       CodigoUSU      := CConfiguracao.CodigoUSU;
       CodigoFOR      := CdFOR;
       CodigoGRP      := CdGRP;
       CodigoSGP      := CdSGP;
       CodigoPRD      := CdPRD;
       Situacao       := PSituacao;
       DataCadastro   := DTCadastro;
       Quantidade     := PQuantidade;
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

function TQuantidadeNormalVenda.InserirAuto:Boolean;
begin
  result := false;
  try
    append;
    try
      CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoQNV   := SCodigo;
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
      CodigoGRP   := StrToInt(ECodigoGRP.Text);
    except
    end;
    try
      CodigoSGP   := StrToInt(ECodigoSGP.Text);
    except
    end;
    try
      CodigoPRD   := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
      Quantidade  := StrToFloat(EQuantidade.Text);
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
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

{ Localiza um grupo de consórcio }
function TQuantidadeNormalVenda.LocalizarCod(CdQNV,CdCNC:Integer):Boolean;
begin
  If (CdQNV<>CodigoQNV) or (CDCNC<>CodigoCNC)  Then
    If locate('CNC_CODIGO;QNV_CODIGO', vararrayof([CDCNC, CdQNV]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TQuantidadeNormalVenda.PreparaAlteracao;
begin
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
  Estado:=2;
  AtualizaControles(True);
end;

procedure TQuantidadeNormalVenda.PreparaInsercao;
begin
 ProximoCodigo('QNV_CODIGO');
 try
   ECodigoPRD.Clear;
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
   EQuantidade.Clear;
 except
 end;
 try
   ESituacao.ItemIndex:=0;
 except
 end;
  Estado:=1;
  AtualizaControles(True);
end;

function TQuantidadeNormalVenda.deletarauto:Boolean;
var
  QNV:integer;
begin
  result := false;
  try
    QNV:=CodigoQNV;
    if Delete then
    Begin
      result:=true;
      GeraLog(6100,CConfiguracao.CodigoCNC,QNV);
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
