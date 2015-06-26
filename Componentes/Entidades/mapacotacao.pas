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
unit MapaCotacao;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Variants;

type
  TMapaCotacao = class(TSQuery)
    private
      { Private fields of TMapaCotacao }
        { Storage for property CodigoAGF }
        FCodigoAGF : Integer;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoFPG }
        FCodigoFPG : Integer;
        { Storage for property CodigoMCT }
        FCodigoMCT : Integer;
        { Storage for property CodigoUSU }
        FCodigoUSU : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECodigoAGF }
        FECodigoAGF : TDBLookupComboBox;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TEdit;
        { Storage for property ECodigoFPG }
        FECodigoFPG : TDBLookupComboBox;
        { Storage for property ECodigoMCT }
        FECodigoMCT : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EFornecedor }
        FEFornecedor : TEdit;
        { Storage for property EFrete }
        FEFrete : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EPrazoEntrega }
        FEPrazoEntrega : TEdit;
        { Storage for property ETipoPag }
        FETipoPag : TDBLookupComboBox;
        { Storage for property EVenda }
        FEVenda : TCheckBox;
        { Storage for property FRETE }
        FFRETE : Double;
        { Storage for property Fornecedor }
        FFornecedor : String;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property PrazoEntrega }
        FPrazoEntrega : Integer;
        { Storage for property TipoPag }
        FTipoPag : Integer;
        { Storage for property Venda }
        FVenda : Boolean;

      { Private methods of TMapaCotacao }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoAGF }
        function GetCodigoAGF : Integer;
        { Write method for property CodigoAGF }
        procedure SetCodigoAGF(Value : Integer);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Write method for property CodigoFOR }
        procedure SetCodigoFOR(Value : Integer);
        { Read method for property CodigoFPG }
        function GetCodigoFPG : Integer;
        { Write method for property CodigoFPG }
        procedure SetCodigoFPG(Value : Integer);
        { Read method for property CodigoMCT }
        function GetCodigoMCT : Integer;
        { Write method for property CodigoMCT }
        procedure SetCodigoMCT(Value : Integer);
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
        { Read method for property FRETE }
        function GetFRETE : Double;
        { Write method for property FRETE }
        procedure SetFRETE(Value : Double);
        { Read method for property Fornecedor }
        function GetFornecedor : String;
        { Write method for property Fornecedor }
        procedure SetFornecedor(Value : String);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property PrazoEntrega }
        function GetPrazoEntrega : Integer;
        { Write method for property PrazoEntrega }
        procedure SetPrazoEntrega(Value : Integer);
        { Read method for property TipoPag }
        function GetTipoPag : Integer;
        { Write method for property TipoPag }
        procedure SetTipoPag(Value : Integer);
        { Read method for property Venda }
        function GetVenda : Boolean;
        { Write method for property Venda }
        procedure SetVenda(Value : Boolean);

    protected
      { Protected fields of TMapaCotacao }

      { Protected methods of TMapaCotacao }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TMapaCotacao }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TMapaCotacao }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdMCT:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        { Localiza um cliente }
        function LocalizarCod(CdMCT,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TMapaCotacao }
        property CodigoAGF : Integer read GetCodigoAGF write SetCodigoAGF;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        property CodigoFPG : Integer read GetCodigoFPG write SetCodigoFPG;
        { Código do Mapa de Cotação }
        property CodigoMCT : Integer read GetCodigoMCT write SetCodigoMCT;
        property CodigoUSU : Integer read GetCodigoUSU write SetCodigoUSU;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECodigoAGF : TDBLookupComboBox
             read FECodigoAGF write FECodigoAGF;
        property ECodigoFOR : TEdit read FECodigoFOR write FECodigoFOR;
        property ECodigoFPG : TDBLookupComboBox
             read FECodigoFPG write FECodigoFPG;
        property ECodigoMCT : TEdit read FECodigoMCT write FECodigoMCT;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EFornecedor : TEdit read FEFornecedor write FEFornecedor;
        property EFrete : TEdit read FEFrete write FEFrete;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EPrazoEntrega : TEdit
             read FEPrazoEntrega write FEPrazoEntrega;
        property ETipoPag : TDBLookupComboBox read FETipoPag write FETipoPag;
        property EVenda : TCheckBox read FEVenda write FEVenda;
        property FRETE : Double read GetFRETE write SetFRETE;
        property Fornecedor : String read GetFornecedor write SetFornecedor;
        property Observacao : String read GetObservacao write SetObservacao;
        property PrazoEntrega : Integer
             read GetPrazoEntrega write SetPrazoEntrega;
        property TipoPag : Integer read GetTipoPag write SetTipoPag;
        property Venda : Boolean read GetVenda write SetVenda;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TMapaCotacao with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TMapaCotacao]);
end;

{ Method to set variable and property values and create objects }
procedure TMapaCotacao.AutoInitialize;
begin
     Estado := 0;
     FECodigoAGF := nil;
     FECodigoFOR := nil;
     FECodigoFPG := nil;
     FECodigoMCT := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDescricao := nil;
     FEFornecedor := nil;
     FEFrete := nil;
     FEObservacao := nil;
     FEPrazoEntrega := nil;
     FETipoPag := nil;
     FEVenda := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TMapaCotacao.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoAGF then
        FECodigoAGF := nil;
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FECodigoFPG then
        FECodigoFPG := nil;
     if AComponent = FECodigoMCT then
        FECodigoMCT := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEFornecedor then
        FEFornecedor := nil;
     if AComponent = FEFrete then
        FEFrete := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEPrazoEntrega then
        FEPrazoEntrega := nil;
     if AComponent = FETipoPag then
        FETipoPag := nil;
     if AComponent = FEVenda then
        FEVenda := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TMapaCotacao.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoAGF }
function TMapaCotacao.GetCodigoAGF : Integer;
begin
  try
    Result := Self.fieldByName('AGF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoAGF }
procedure TMapaCotacao.SetCodigoAGF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNC }
function TMapaCotacao.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TMapaCotacao.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFOR }
function TMapaCotacao.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFOR }
procedure TMapaCotacao.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property CodigoFPG }
function TMapaCotacao.GetCodigoFPG : Integer;
begin
  try
    Result := Self.fieldByName('FPG_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFPG }
procedure TMapaCotacao.SetCodigoFPG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CODIGO"!');
    end;
end;

{ Read method for property CodigoMCT }
function TMapaCotacao.GetCodigoMCT : Integer;
begin
  try
    Result := Self.fieldByName('MCT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoMCT }
procedure TMapaCotacao.SetCodigoMCT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCT_CODIGO"!');
    end;
end;

{ Read method for property CodigoUSU }
function TMapaCotacao.GetCodigoUSU : Integer;
begin
  try
    Result := Self.fieldByName('USU_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoUSU }
procedure TMapaCotacao.SetCodigoUSU(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('USU_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "USU_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TMapaCotacao.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('MCT_DT_ALTERADO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataAlterado }
procedure TMapaCotacao.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MCT_DT_ALTERADO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MCT_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TMapaCotacao.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('MCT_DT_CADASTRO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataCadastro }
procedure TMapaCotacao.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MCT_DT_CADASTRO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "MCT_DT_CADASTRO"!');
  end;
end;

{ Read method for property Descricao }
function TMapaCotacao.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('MCT_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TMapaCotacao.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('MCT_DESCRICAO').asString := UpperCase(Value);
  except
    ShowMessage('Não foi possível alterar o campo "MCT_DESCRIÇÃO"!');
  end;
end;

{ Read method for property FRETE }
function TMapaCotacao.GetFRETE : Double;
begin
  try
    Result := Self.fieldByName('MCT_FRETE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property FRETE }
procedure TMapaCotacao.SetFRETE(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCT_FRETE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCT_FRETE"!');
    end;
end;

{ Read method for property Fornecedor }
function TMapaCotacao.GetFornecedor : String;
begin
  try
    Result := Self.fieldByName('MCT_FORNECEDOR').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fornecedor }
procedure TMapaCotacao.SetFornecedor(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCT_FORNECEDOR').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCT_FORNECEDOR"!');
    end;
end;

{ Read method for property Observacao }
function TMapaCotacao.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('MCT_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Observacao }
procedure TMapaCotacao.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCT_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCT_OBSERVACAO"!');
    end;
end;

{ Read method for property PrazoEntrega }
function TMapaCotacao.GetPrazoEntrega : Integer;
begin
  try
    Result := Self.fieldByName('MCT_PRAZO_ENTREGA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property PrazoEntrega }
procedure TMapaCotacao.SetPrazoEntrega(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCT_PRAZO_ENTREGA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCT_PRAZO_ENTREGA"!');
    end;
end;

{ Read method for property TipoPag }
function TMapaCotacao.GetTipoPag : Integer;
begin
  try
    Result := Self.fieldByName('MCT_TIPO_PAG').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoPag }
procedure TMapaCotacao.SetTipoPag(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCT_TIPO_PAG').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCT_TIPO_PAG"!');
    end;
end;

{ Read method for property Venda }
function TMapaCotacao.GetVenda : Boolean;
begin
  try
    result := (Self.fieldByName('MCT_VENDA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Venda }
procedure TMapaCotacao.SetVenda(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('MCT_VENDA').asInteger := 1
      else
        Self.fieldByName('MCT_VENDA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "MCT_VENDA"!');
    end;
end;

function TMapaCotacao.AlterarAuto:Boolean;
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
         CodigoFOR  := StrToInt(ECodigoFOR.Text);
      except
      end;
      try
         Fornecedor  := EFornecedor.Text;
      except
      end;
      try
         Descricao  := EDescricao.Text;
      except
      end;
      try
         CodigoAGF  := ECodigoAGF.KeyValue;
      except
      end;
      try
         CodigoFPG  := ECodigoFPG.KeyValue;
      except
      end;
      try
         TipoPag    := ETipoPag.KeyValue;
      except
      end;
      try
         PrazoEntrega  := StrToInt(EPrazoEntrega.Text);
      except
      end;
      try
         Frete  := StrToFloat(EFrete.Text);
      except
      end;
      try
         Venda  := EVenda.Checked;
      except
      end;
      try
         Observacao  := EObservacao.Text;
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

procedure TMapaCotacao.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    EDescricao.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoFOR.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoAGF.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoFPG.Enabled     :=Habilitar;
  Except
  End;
  Try
    ETipoPag.Enabled       :=Habilitar;
  Except
  End;
  Try
    EPrazoEntrega.Enabled     :=Habilitar;
  Except
  End;
  Try
    EFrete.Enabled     :=Habilitar;
  Except
  End;
  Try
    EObservacao.Enabled     :=Habilitar;
  Except
  End;
  Try
    if not Habilitar then
    Begin
      EFornecedor.Color     := clMenu;
      EFornecedor.Enabled   := False;
    end
    else if ECodigoFOR.Text = '0' then
    Begin
      EFornecedor.Color     := clWindow;
      EFornecedor.Enabled   := True;
    end;
  Except
  End;

end;

procedure TMapaCotacao.CancelaEdicao;
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

procedure TMapaCotacao.CarregaDados;
begin
  Try
    if DataCadastro=0 then
      EDataCadastro.Text:=''
    else
      EDataCadastro.Text  :=FormatDateTime('dd/mm/yyyy hh:mm',DataCadastro);
  Except
  End;
  Try
    if DataAlterado=0 then
      EDataAlterado.Text:=''
    else
      EDataAlterado.Text  :=FormatDateTime('dd/mm/yyyy hh:mm',DataAlterado);
  Except
  End;
  Try
    EDescricao.Text        :=Descricao;
  Except
  End;
  Try
    ECodigoMCT.Text        :=IntToStr(CodigoMCT);
  Except
  End;
  Try
    ECodigoFOR.Text        :=IntToStr(CodigoFOR);
  Except
  End;
  Try
    EPrazoEntrega.Text        :=IntToStr(PrazoEntrega);
  Except
  End;
  Try
    EFornecedor.Text        :=Fornecedor;
  Except
  End;
  Try
    ECodigoAGF.KeyValue     := CodigoAGF;
  Except
  End;
  Try
    ECodigoFPG.KeyValue     := CodigoFPG;
  Except
  End;
  Try
    ETipoPag.KeyValue       := TipoPag;
  Except
  End;
  Try
    EFrete.Text        :=format('%.2f',[Frete]);
  Except
  End;
  Try
    EVenda.Checked    := Venda;
  Except
  End;
  Try
    EObservacao.Text        :=Observacao;
  Except
  End;
end;

constructor TMapaCotacao.Create(AOwner: TComponent);
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

function TMapaCotacao.Deletar(CdCNC,CdMCT:Integer):Boolean;
begin
  If not(localizarCod(CdMCT,CdCNC)) Then
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
           ECodigoMCT.clear;
          except
          end;
          try
           ECodigoFOR.clear;
          except
          end;
          try
           EDescricao.Clear;
          except
          end;
          try
           EFornecedor.clear;
          except
          end;
          Try
            EDataCadastro.Clear;
          Except
          End;
          Try
            EDataAlterado.Clear;
          Except
          End;
          Try
            EFrete.Clear;
          Except
          End;
          Try
            EVenda.Checked := False;
          Except
          End;
          Try
            EPrazoEntrega.Clear;
          Except
          End;
          Try
            ECodigoAGF.KeyValue := -1;
          Except
          End;
          Try
            ECodigoFPG.KeyValue := -1;
          Except
          End;
          Try
            ETipoPag.KeyValue   := -1;
          Except
          End;
          Try
            EObservacao.Clear;
          Except
          End;
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

destructor TMapaCotacao.Destroy;
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

function TMapaCotacao.FinalizaEdicao:Boolean;
var
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  if EFrete.Text = '' then
    EFrete.Text := '0';
  if EPrazoEntrega.Text = '' then
    EPrazoEntrega.Text := '0';
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoFOR.Text) then
    mensagem:=mensagem+'Código do Fornecedor/Cliente inválido!'+#13;
  if EFornecedor.Text = '' then
    mensagem:=mensagem+'Nome do Fornecedor/Cliente inválido!'+#13;
  if not (ETipoPag.KeyValue > 0) then
    mensagem:=mensagem+'Tipo de Pagamento inválido!'+#13;
  if not (ECodigoFPG.KeyValue > 0) then
    mensagem:=mensagem+'Forma de Pagamento inválido!'+#13;
  if not (ECodigoAGF.KeyValue > 0) then
    mensagem:=mensagem+'Agente Financeiro inválido!'+#13;
  if mensagem <> '' then
  Begin
    Result := False;
    ShowMessage(mensagem);
    Exit;
  end
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        close;
        open;
        Estado:=0;
        AtualizaControles(False);
        Result := True;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        close;
        open;
        Estado:=0;
        AtualizaControles(False);
        Result := True;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
  end;
end;

function TMapaCotacao.InserirAuto:Boolean;
begin
  try
    append;
    try
      codigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      CodigoMCT   := SCodigo;
    except
    end;
    try
       DataCadastro := StrToDateTime(EDataCadastro.Text);
    except
    end;
    try
       CodigoFOR  := StrToInt(ECodigoFOR.Text);
    except
    end;
    try
       Fornecedor  := EFornecedor.Text;
    except
    end;
    try
       Descricao  := EDescricao.Text;
    except
    end;
    try
       CodigoAGF  := ECodigoAGF.KeyValue;
    except
    end;
    try
       CodigoFPG  := ECodigoFPG.KeyValue;
    except
    end;
    try
       TipoPag    := ETipoPag.KeyValue;
    except
    end;
    try
       PrazoEntrega  := StrToInt(EPrazoEntrega.Text);
    except
    end;
    try
       Frete  := StrToFloat(EFrete.Text);
    except
    end;
    try
       Venda  := EVenda.Checked;
    except
    end;
    try
       Observacao  := EObservacao.Text;
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

{ Localiza um cliente }
function TMapaCotacao.LocalizarCod(CdMCT,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdMCT<>CodigoMCT) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;MCT_CODIGO', vararrayof([CdCNC, CdMCT]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TMapaCotacao.PreparaAlteracao;
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

procedure TMapaCotacao.PreparaInsercao;
begin
  ProximoCodigo('MCT_CODIGO');
  try
    ECodigoMCT.Text := IntToStr(SCodigo);
  except
  end;
  try
   EDescricao.clear;
  except
  end;
  try
   ECodigoFOR.clear;
  except
  end;
  try
   EFornecedor.clear;
  except
  end;
  Try
    EDataCadastro.text := DateTimeToStr(CConfiguracao.DataHora);
  Except
  End;
  try
   EDataAlterado.clear;
  except
  end;
  try
   EPrazoEntrega.clear;
  except
  end;
  try
   EFrete.clear;
  except
  end;
  try
   EObservacao.clear;
  except
  end;
  Estado:=1;
  AtualizaControles(True);
end;

function TMapaCotacao.deletarauto:Boolean;
begin
  try
    Result := Delete;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
