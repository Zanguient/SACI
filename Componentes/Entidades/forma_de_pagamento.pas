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
unit Forma_de_Pagamento;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes;

type
  TForma_de_Pagamento = class(TSQuery)
    private
      { Private fields of TForma_de_Pagamento }
        { Storage for property CentavosEntrada }
        FCentavosEntrada : Boolean;
        { Storage for property CodigoFPG }
        FCodigoFPG : Integer;
        { Storage for property CodigoTBP }
        FCodigoTBP : Integer;
        { Storage for property Compra }
        FCompra : Boolean;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Desconto }
        FDesconto : Double;
        { Storage for property Descricao }
        FDescricao : String;
        { Storage for property ECentavosEntrada }
        FECentavosEntrada : TCheckBox;
        { Storage for property ECodigoFPG }
        FECodigoFPG : TEdit;
        { Storage for property ECodigoTBP }
        FECodigoTBP : TEdit;
        { Storage for property ECompra }
        FECompra : TCheckBox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDesconto }
        FEDesconto : TEdit;
        { Storage for property EDescricao }
        FEDescricao : TEdit;
        { Storage for property EPrazo }
        FEPrazo : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipoPagExclusivo }
        FETipoPagExclusivo : TDBLookupComboBox;
        { Storage for property Juros }
        FJuros : Double;
        { Storage for property Prazo }
        FPrazo : String;
        { Storage for property PrazoMedio }
        FPrazoMedio : Integer;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TipoPagExclusivo }
        FTipoPagExclusivo : Integer;

      { Private methods of TForma_de_Pagamento }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CentavosEntrada }
        function GetCentavosEntrada : Boolean;
        { Write method for property CentavosEntrada }
        procedure SetCentavosEntrada(Value : Boolean);
        { Read method for property CodigoFPG }
        function GetCodigoFPG : Integer;
        { Write method for property CodigoFPG }
        procedure SetCodigoFPG(Value : Integer);
        { Read method for property CodigoTBP }
        function GetCodigoTBP : Integer;
        { Write method for property CodigoTBP }
        procedure SetCodigoTBP(Value : Integer);
        { Read method for property Compra }
        function GetCompra : Boolean;
        { Write method for property Compra }
        procedure SetCompra(Value : Boolean);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property Desconto }
        function GetDesconto : Double;
        { Write method for property Desconto }
        procedure SetDesconto(Value : Double);
        { Read method for property Descricao }
        function GetDescricao : String;
        { Write method for property Descricao }
        procedure SetDescricao(Value : String);
        { Read method for property Juros }
        function GetJuros : Double;
        { Write method for property Juros }
        procedure SetJuros(Value : Double);
        { Read method for property Prazo }
        function GetPrazo : String;
        { Write method for property Prazo }
        procedure SetPrazo(Value : String);
        { Read method for property PrazoMedio }
        function GetPrazoMedio : Integer;
        { Write method for property PrazoMedio }
        procedure SetPrazoMedio(Value : Integer);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property TipoPagExclusivo }
        function GetTipoPagExclusivo : Integer;
        { Write method for property TipoPagExclusivo }
        procedure SetTipoPagExclusivo(Value : Integer);

    protected
      { Protected fields of TForma_de_Pagamento }

      { Protected methods of TForma_de_Pagamento }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TForma_de_Pagamento }

      { Public methods of TForma_de_Pagamento }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdFPG: Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        { Insere uma Forma de Pagamento }
        function Inserir(CdCNC, CdFPG: Integer; CCompra,CCentavos: Boolean; PPrazo, PDescricao: String):boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza uma Forma de Pagamento }
        function LocalizarCod(CdFPG: Integer): Boolean;
        function Media(Texto: String):Integer;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TForma_de_Pagamento }
        property CentavosEntrada : Boolean
             read GetCentavosEntrada write SetCentavosEntrada;
        { Código da Forma de Pagamento }
        property CodigoFPG : Integer read GetCodigoFPG write SetCodigoFPG;
        property CodigoTBP : Integer read GetCodigoTBP write SetCodigoTBP;
        property Compra : Boolean read GetCompra write SetCompra;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property Desconto : Double read GetDesconto write SetDesconto;
        property Descricao : String read GetDescricao write SetDescricao;
        property ECentavosEntrada : TCheckBox
             read FECentavosEntrada write FECentavosEntrada;
        property ECodigoFPG : TEdit read FECodigoFPG write FECodigoFPG;
        property ECodigoTBP : TEdit read FECodigoTBP write FECodigoTBP;
        property ECompra : TCheckBox read FECompra write FECompra;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDesconto : TEdit read FEDesconto write FEDesconto;
        property EDescricao : TEdit read FEDescricao write FEDescricao;
        property EPrazo : TEdit read FEPrazo write FEPrazo;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipoPagExclusivo : TDBLookupComboBox
             read FETipoPagExclusivo write FETipoPagExclusivo;
        property Juros : Double read GetJuros write SetJuros;
        property Prazo : String read GetPrazo write SetPrazo;
        property PrazoMedio : Integer read GetPrazoMedio write SetPrazoMedio;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property TipoPagExclusivo : Integer
             read GetTipoPagExclusivo write SetTipoPagExclusivo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TForma_de_Pagamento with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TForma_de_Pagamento]);
end;

{ Method to set variable and property values and create objects }
procedure TForma_de_Pagamento.AutoInitialize;
begin
     FECentavosEntrada := nil;
     FECodigoFPG := nil;
     FECodigoTBP := nil;
     FECompra := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDesconto := nil;
     FEDescricao := nil;
     FEPrazo := nil;
     FESituacao := nil;
     FETipoPagExclusivo := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TForma_de_Pagamento.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECentavosEntrada then
        FECentavosEntrada := nil;
     if AComponent = FECodigoFPG then
        FECodigoFPG := nil;
     if AComponent = FECodigoTBP then
        FECodigoTBP := nil;
     if AComponent = FECompra then
        FECompra := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDesconto then
        FEDesconto := nil;
     if AComponent = FEDescricao then
        FEDescricao := nil;
     if AComponent = FEPrazo then
        FEPrazo := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipoPagExclusivo then
        FETipoPagExclusivo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TForma_de_Pagamento.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CentavosEntrada }
function TForma_de_Pagamento.GetCentavosEntrada : Boolean;
begin
  try
    result := (Self.fieldByName('FPG_CENTAVOS_ENTRADA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property CentavosEntrada }
procedure TForma_de_Pagamento.SetCentavosEntrada(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('FPG_CENTAVOS_ENTRADA').asInteger := 1
      else
        Self.fieldByName('FPG_CENTAVOS_ENTRADA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CENTAVOS_ENTRADA"!');
    end;
end;

{ Read method for property CodigoFPG }
function TForma_de_Pagamento.GetCodigoFPG : Integer;
begin
  try
    Result := Self.fieldByName('FPG_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFPG }
procedure TForma_de_Pagamento.SetCodigoFPG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CODIGO"!');
    end;
end;

{ Read method for property CodigoTBP }
function TForma_de_Pagamento.GetCodigoTBP : Integer;
begin
  try
    Result := Self.fieldByName('TBP_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTBP }
procedure TForma_de_Pagamento.SetCodigoTBP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TBP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TBP_CODIGO"!');
    end;
end;

{ Read method for property Compra }
function TForma_de_Pagamento.GetCompra : Boolean;
begin
  try
    result := (Self.fieldByName('FPG_COMPRA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Compra }
procedure TForma_de_Pagamento.SetCompra(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('FPG_COMPRA').asInteger := 1
      else
        Self.fieldByName('FPG_COMPRA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_COMPRA"!');
    end;
end;

{ Read method for property DataAlterado }
function TForma_de_Pagamento.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('FPG_DT_ALTERADO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataAlterado }
procedure TForma_de_Pagamento.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FPG_DT_ALTERADO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FPG_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TForma_de_Pagamento.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('FPG_DT_CADASTRO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataCadastro }
procedure TForma_de_Pagamento.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FPG_DT_CADASTRO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FPG_DT_CADASTRO"!');
  end;
end;

{ Read method for property Desconto }
function TForma_de_Pagamento.GetDesconto : Double;
begin
  try
    Result := Self.fieldByName('FPG_DESCONTO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Desconto }
procedure TForma_de_Pagamento.SetDesconto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_DESCONTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_DESCONTO"!');
    end;
end;

{ Read method for property Descricao }
function TForma_de_Pagamento.GetDescricao : String;
begin
  try
    Result := Self.fieldByName('FPG_DESCRICAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descricao }
procedure TForma_de_Pagamento.SetDescricao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FPG_DESCRICAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FPG_DESCRICAO"!');
  end;
end;

{ Read method for property Juros }
function TForma_de_Pagamento.GetJuros : Double;
begin
  try
    Result := Self.fieldByName('FPG_JUROS').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Juros }
procedure TForma_de_Pagamento.SetJuros(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_JUROS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_JUROS"!');
    end;
end;

{ Read method for property Prazo }
function TForma_de_Pagamento.GetPrazo : String;
begin
  try
    Result := Self.fieldByName('FPG_PRAZO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Prazo }
procedure TForma_de_Pagamento.SetPrazo(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('FPG_PRAZO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "FPG_PRAZO"!');
  end;
end;

{ Read method for property PrazoMedio }
function TForma_de_Pagamento.GetPrazoMedio : Integer;
begin
  try
    Result := Self.fieldByName('FPG_PRAZO_MEDIO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property PrazoMedio }
procedure TForma_de_Pagamento.SetPrazoMedio(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_PRAZO_MEDIO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_PRAZO_MEDIO"!');
    end;
end;

{ Read method for property Situacao }
function TForma_de_Pagamento.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('FPG_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Situacao }
procedure TForma_de_Pagamento.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_SITUACAO"!');
    end;
end;

{ Read method for property TipoPagExclusivo }
function TForma_de_Pagamento.GetTipoPagExclusivo : Integer;
begin
  try
    Result := Self.fieldByName('FPG_TIPOPAG_EXCLUSIVO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TipoPagExclusivo }
procedure TForma_de_Pagamento.SetTipoPagExclusivo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_TIPOPAG_EXCLUSIVO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_TIPOPAG_EXCLUSIVO"!');
    end;
end;

function TForma_de_Pagamento.AlterarAuto:Boolean;
var
  CdCNC, CdFPG: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdFPG := CodigoFPG;
  sDetalhe := '';
  try
    edit;
    try
      codigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado := StrToDateTime(EDataAlterado.Text);
    except
    end;
    try
      Descricao := EDescricao.Text;
      sDetalhe := sDetalhe + 'Desc:'+EDescricao.Text;
    except
    end;
    try
      Prazo := EPrazo.Text;
      sDetalhe := sDetalhe + ' Prazo:'+EPrazo.Text;
    except
    end;
    try
      PrazoMedio := Media(EPrazo.Text);
      sDetalhe := sDetalhe + ' PrazoMedio:'+IntToStr(Media(EPrazo.Text));
    except
    end;
    try
      Compra := ECompra.Checked;
      if ECompra.Checked then
        sDetalhe := sDetalhe + ' Compra';
    except
    end;
    try
      CentavosEntrada := ECentavosEntrada.Checked;
      if ECentavosEntrada.Checked then
        sDetalhe := sDetalhe + ' CentEntrada';
    except
    end;    
    try
      Desconto := StrToFloat(EDesconto.Text);
      sDetalhe := sDetalhe + ' Desconto:'+EDesconto.Text;
    except
    end;
    try
      if ETipoPagExclusivo.Text <> '' then
      Begin
        TipoPagExclusivo := ETipoPagExclusivo.KeyValue;
        sDetalhe := sDetalhe + ' TipoPag:'+IntToStr(ETipoPagExclusivo.KeyValue);
      end
      else
      Begin
        TipoPagExclusivo := 0;
        sDetalhe := sDetalhe + ' TipoPag:0 ';
      end;
    except
    end;
    try
      CodigoTBP := StrToInt(ECodigoTBP.Text);
      sDetalhe := sDetalhe + ' TBP:'+ECodigoTBP.Text;
    except
    end;
    try
      Situacao := ESituacao.ItemIndex;
      if ESituacao.ItemIndex = 0 then
        sDetalhe := sDetalhe + ' Ativado'
      else
        sDetalhe := sDetalhe + ' Desativado';
    except
    end;

    try
      Post;
      GeraLog(1080, CdCNC, CdFPG, sDetalhe);
      Result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TForma_de_Pagamento.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  try
    EPrazo.Enabled        :=Habilitar;
  except
  end;
  try
    EDescricao.Enabled    :=Habilitar;
  except
  end;
  try
    ECompra.Enabled    :=Habilitar;
  except
  end;
  try
    ECentavosEntrada.Enabled    :=Habilitar;
  except
  end;  
  try
    EDesconto.Enabled    :=Habilitar;
  except
  end;
  try
    ETipoPagExclusivo.Enabled    :=Habilitar;
  except
  end;
  try
    ECodigoTBP.Enabled    :=Habilitar;
  except
  end;
  try
    ESituacao.Enabled    :=Habilitar;
  except
  end;
end;

procedure TForma_de_Pagamento.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TForma_de_Pagamento.CarregaDados;
begin
  Try
    ECodigoFPG.Text      :=IntToStr(CodigoFPG);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text:=formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Text:='';
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Text:='';
  except
  end;
  try
    EPrazo.Text          :=Prazo;
  except
  end;
  try
    EDescricao.Text      :=Descricao;
  except
  end;
  try
    ECompra.Checked      :=Compra;
  except
  end;
  try
    ECentavosEntrada.Checked      :=CentavosEntrada;
  except
  end;  
  try
    EDesconto.Text      := format('%.2f',[Desconto]);
  except
  end;
  try
    ETipoPagExclusivo.KeyValue      := TipoPagExclusivo;
  except
  end;
  try
    ECodigoTBP.Text      := IntToStr(CodigoTBP);
  except
  end;
  try
    ESituacao.ItemIndex      := Situacao;
  except
  end;
end;

constructor TForma_de_Pagamento.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'FORMA_DE_PAGAMENTO';

     { Code to perform other tasks when the component is created }

end;

function TForma_de_Pagamento.Deletar(CdFPG: Integer):Boolean;
var
  CdCNC: integer;
  sDetalhe: string;
begin
  Result := False;
  If not(localizarCod(CdFPG)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCNC := CodigoCNC;
      sDetalhe := Descricao;
      if Delete then
      Begin
        GeraLog(1070,CdCNC,CdFPG,sDetalhe);
        Result := True;
        if Tquery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TForma_de_Pagamento.Destroy;
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

function TForma_de_Pagamento.FinalizaEdicao:Boolean;
var
  mensagem:string;
  cod:Integer;
  aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if not VerificaFloatBranco(EDesconto.Text) then
    EDesconto.Text := '0,00';
  if not VerificaInteiroBranco(ECodigoFPG.Text) then
    mensagem:=mensagem+'Código de Forma de Pagamento inválido!'+#13;
  if EDescricao.Text = '' then
    mensagem:=mensagem+'Descrição inválida!'+#13;
  if (EPrazo.Text='')OR(not VerificaFormaPagamento(EPrazo.Text)) then
    mensagem:=mensagem+'Prazo de Pagamento inválido!'+#13;
  if not VerificaInteiroBranco(ECodigoTBP.Text) then
    mensagem:=mensagem+'Código de Tabela inválido!'+#13;
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo);
        AtualizaControles(False);
        Estado:=0;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoFPG;
      if Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        AtualizaControles(False);
        Estado:=0;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere uma Forma de Pagamento }
function TForma_de_Pagamento.Inserir(CdCNC, CdFPG: Integer; CCompra,CCentavos: Boolean; PPrazo, PDescricao: String):boolean;
Var
  Cod: Integer;
begin
  Result := False;
  if CdFPG=0 then
    Cod    := ProximoCodigo('FPG_CODIGO')
  Else
    Cod    := CdFPG;
  If (localizarCod(Cod)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    Insert;
    try
      CodigoFPG      := Cod;
      CodigoCNC      := CdCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      DataCadastro   := CConfiguracao.DataHora;
      Prazo          := PPrazo;
      PrazoMedio     := Media(PPrazo);
      Descricao      := PDescricao;
      Compra         := CCompra;
      CentavosEntrada:= CCentavos;      
      Desconto       := 0;
      TipopagExclusivo:=0;
      CodigoTBP      := 0;
      Situacao       := 0;

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

function TForma_de_Pagamento.InserirAuto:Boolean;
var
  CdCNC, CdFPG: integer;
  sDetalhe: string;
begin
  Result := False;
  CdCNC := CodigoCNC;
  CdFPG := CodigoFPG;
  sDetalhe := '';
  try
    append;
    try
      codigoFPG := StrToInt(ECodigoFPG.Text);
    except
    end;
    try
      codigocnc := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro := StrToDateTime(EDataCadastro.Text);
    except
    end;
    try
      Descricao := EDescricao.Text;
      sDetalhe := sDetalhe + 'Desc:'+EDescricao.Text;
    except
    end;
    try
      Prazo := EPrazo.Text;
      sDetalhe := sDetalhe + ' Prazo:'+EPrazo.Text;
    except
    end;
    try
      PrazoMedio := Media(EPrazo.Text);
      sDetalhe := sDetalhe + ' MediaPrazo:'+IntToStr(Media(EPrazo.Text));
    except
    end;
    try
      Compra := ECompra.Checked;
      if ECompra.Checked then
        sDetalhe := sDetalhe + ' Compra';
    except
    end;
    try
      CentavosEntrada := ECentavosEntrada.Checked;
      if ECentavosEntrada.Checked then
        sDetalhe := sDetalhe + ' CentEntrada';
    except
    end;    
    try
      Desconto := StrToFloat(EDesconto.Text);
      sDetalhe := sDetalhe + ' Desconto:'+EDesconto.Text;
    except
    end;
    try
      if ETipoPagExclusivo.Text <> '' then
      Begin
        TipoPagExclusivo := ETipoPagExclusivo.KeyValue;
        sDetalhe := sDetalhe + ' TipoPag:'+IntToStr(ETipoPagExclusivo.KeyValue);
      end
      else
      Begin
        TipoPagExclusivo := 0;
        sDetalhe := sDetalhe + ' TipoPag:0 ';
      end;
    except
    end;
    try
      CodigoTBP := StrToInt(ECodigoTBP.Text);
      sDetalhe := sDetalhe + ' TBP:'+ECodigoTBP.Text;
    except
    end;
    try
      Situacao := ESituacao.ItemIndex;
      if ESituacao.ItemIndex = 0 then
        sDetalhe := sDetalhe + ' Ativado'
      else
        sDetalhe := sDetalhe + ' Desativado';
    except
    end;
    try
      Post;
      GeraLog(1060, CdCNC, CdFPG, sDetalhe);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TForma_de_Pagamento.LimpaCampos;
begin
  try
   EPrazo.Clear;
  except
  end;
  try
    EDescricao.Clear;
  except
  end;
  try
    ECompra.Checked:= False;
  except
  end;
  try
    if Estado <> 1 then
      ECentavosEntrada.Checked:= False
    else
      ECentavosEntrada.Checked:= True;    
  except
  end;  
  try
    if estado <> 1 then
      EDesconto.Clear
    else
      EDesconto.Text := '0,00';
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
    ETipoPagExclusivo.KeyValue := 0;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoTBP.Clear
    else
      ECodigoTBP.Text := '0';
  except
  end;
  try
    if estado <> 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 0;
  except
  end;
end;

{ Localiza uma Forma de Pagamento }
function TForma_de_Pagamento.LocalizarCod(CdFPG: Integer): Boolean;
begin
  If (CdFPG<>CodigoFPG) Then
    If locate('FPG_CODIGO', CdFPG, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TForma_de_Pagamento.Media(Texto: String):Integer;
Type
  Tvetor=array[1..12] of integer;
Var
  vetor:TVetor;
  i,QtdParc,pos,soma:Integer;
  Resultado:Integer;
  Temp:String;
begin
  i:=1;
  QtdParc:=0;
  pos:=0;
  Temp:=Texto;
  While i<length(Temp)+2 do
  Begin
    if (temp[i]=';') or (temp[i]='')then
    Begin
      QtdParc:=QtdParc+1;
      Vetor[QtdParc]:=StrToInt(copy(Temp,pos+1,i-(pos+1)));
      pos:=i;
    End;
    i:=i+1;
  End;
  soma:=0;
  for i:=1 to QtdParc do
    soma:=soma+Vetor[i];
  Resultado := Round(soma/QtdParc);
  Result := Resultado;
end;

procedure TForma_de_Pagamento.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TForma_de_Pagamento.PreparaInsercao;
begin
  ProximoCodigo('FPG_CODIGO');
  Estado := 1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TForma_de_Pagamento.deletarauto:Boolean;
var
  CdCNC,CdFPG:integer;
  sDetalhe: string;
begin
  Result := False;
  try
    CdCNC:=CodigoCNC;
    CdFPG:=CodigoFPG;
    sDetalhe := Descricao;
    if Delete then
    Begin
      GeraLog(1070,CdCNC,CdFPG,sDetalhe);
      result:=true;
      if Tquery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
