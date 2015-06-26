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
unit Item_de_Inventario;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Inventario, Configuracao, Item_de_Estoque, 
     Funcoes, Variants;

type
  TItem_de_Inventario = class(TSQuery)
    private
      { Private fields of TItem_de_Inventario }
        { Storage for property CInventario }
        FCInventario : TInventario;
        { Storage for property CItem_de_Estoque }
        FCItem_de_Estoque : TItem_de_Estoque;
        { Storage for property CProduto }
        FCProduto : TProduto;
        { Storage for property CodigoIIV }
        FCodigoIIV : Integer;
        { Storage for property CodigoINV }
        FCodigoINV : Integer;
        { Storage for property CodigoLOT }
        FCodigoLOT : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property ECodigoIIV }
        FECodigoIIV : TEdit;
        { Storage for property ECodigoINV }
        FECodigoINV : TEdit;
        { Storage for property ECodigoLOT }
        FECodigoLOT : TEdit;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EQuantInf }
        FEQuantInf : TEdit;
        { Storage for property EQuantSist }
        FEQuantSist : TEdit;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property QuantInf }
        FQuantInf : Double;
        { Storage for property QuantSist }
        FQuantSist : Double;

      { Private methods of TItem_de_Inventario }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoIIV }
        function GetCodigoIIV : Integer;
        { Write method for property CodigoIIV }
        procedure SetCodigoIIV(Value : Integer);
        { Read method for property CodigoINV }
        function GetCodigoINV : Integer;
        { Write method for property CodigoINV }
        procedure SetCodigoINV(Value : Integer);
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
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property QuantInf }
        function GetQuantInf : Double;
        { Write method for property QuantInf }
        procedure SetQuantInf(Value : Double);
        { Read method for property QuantSist }
        function GetQuantSist : Double;
        { Write method for property QuantSist }
        procedure SetQuantSist(Value : Double);

    protected
      { Protected fields of TItem_de_Inventario }

      { Protected methods of TItem_de_Inventario }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TItem_de_Inventario }

      { Public methods of TItem_de_Inventario }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC, CdIIV: Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Ítem de Inventário }
        function LocalizarCod(CdIIV, CdCNC: Integer): Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_de_Inventario }
        property CInventario : TInventario
             read FCInventario write FCInventario;
        property CItem_de_Estoque : TItem_de_Estoque
             read FCItem_de_Estoque write FCItem_de_Estoque;
        property CProduto : TProduto read FCProduto write FCProduto;
        { Código do ítem de inventário }
        property CodigoIIV : Integer read GetCodigoIIV write SetCodigoIIV;
        { Código do Inventário }
        property CodigoINV : Integer read GetCodigoINV write SetCodigoINV;
        property CodigoLOT : Integer read GetCodigoLOT write SetCodigoLOT;
        { Código do produto }
        property CodigoPRD : Integer read GetCodigoPRD write SetCodigoPRD;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property ECodigoIIV : TEdit read FECodigoIIV write FECodigoIIV;
        property ECodigoINV : TEdit read FECodigoINV write FECodigoINV;
        property ECodigoLOT : TEdit read FECodigoLOT write FECodigoLOT;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EQuantInf : TEdit read FEQuantInf write FEQuantInf;
        property EQuantSist : TEdit read FEQuantSist write FEQuantSist;
        property Observacao : String read GetObservacao write SetObservacao;
        property QuantInf : Double read GetQuantInf write SetQuantInf;
        property QuantSist : Double read GetQuantSist write SetQuantSist;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Inventario with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Inventario]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Inventario.AutoInitialize;
begin
     FECodigoIIV := nil;
     FECodigoINV := nil;
     FECodigoLOT := nil;
     FECodigoPRD := nil;
     FEObservacao := nil;
     FEQuantInf := nil;
     FEQuantSist := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_de_Inventario.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodigoIIV then
        FECodigoIIV := nil;
     if AComponent = FECodigoINV then
        FECodigoINV := nil;
     if AComponent = FECodigoLOT then
        FECodigoLOT := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEQuantInf then
        FEQuantInf := nil;
     if AComponent = FEQuantSist then
        FEQuantSist := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Inventario.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoIIV }
function TItem_de_Inventario.GetCodigoIIV : Integer;
begin
  try
    Result := Self.fieldByName('IIV_CODIGO').asInteger;
  except
    Result:= 0
  end;
end;

{ Write method for property CodigoIIV }
procedure TItem_de_Inventario.SetCodigoIIV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('IIV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "IIV_CODIGO"!');
    end;
end;

{ Read method for property CodigoINV }
function TItem_de_Inventario.GetCodigoINV : Integer;
begin
  try
    Result := Self.fieldByName('INV_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoINV }
procedure TItem_de_Inventario.SetCodigoINV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('INV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "INV_CODIGO"!');
    end;
end;

{ Read method for property CodigoLOT }
function TItem_de_Inventario.GetCodigoLOT : Integer;
begin
  try
    Result := Self.fieldByName('LOT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoLOT }
procedure TItem_de_Inventario.SetCodigoLOT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('LOT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "LOT_CODIGO"!');
    end;
end;

{ Read method for property CodigoPRD }
function TItem_de_Inventario.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property CodigoPRD }
procedure TItem_de_Inventario.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
end;

{ Read method for property DataAlterado }
function TItem_de_Inventario.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('IIV_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TItem_de_Inventario.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IIV_DT_ALTERADO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IIV_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TItem_de_Inventario.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('IIV_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TItem_de_Inventario.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IIV_DT_CADASTRO').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IIV_DT_CADASTRO"!');
  end;
end;

{ Read method for property Observacao }
function TItem_de_Inventario.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('IIV_OBSERVACAO').asString;
  except
    Result := '';
  end;
end;

{ Write method for property Observacao }
procedure TItem_de_Inventario.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IIV_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IIV_OBSERVACAO"!');
  end;
end;

{ Read method for property QuantInf }
function TItem_de_Inventario.GetQuantInf : Double;
begin
  try
    Result := Self.fieldByName('IIV_QUANT_INF').asFloat;
  except
    Result := 0;
  end;
end;

{ Write method for property QuantInf }
procedure TItem_de_Inventario.SetQuantInf(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IIV_QUANT_INF').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IIV_QUANT_INF"!');
  end;
end;

{ Read method for property QuantSist }
function TItem_de_Inventario.GetQuantSist : Double;
begin
  try
    Result := Self.fieldByName('IIV_QUANT_SIST').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property QuantSist }
procedure TItem_de_Inventario.SetQuantSist(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('IIV_QUANT_SIST').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "IIV_QUANT_SIST"!');
  end;
end;

function TItem_de_Inventario.AlterarAuto:Boolean;
var
  CdCNC, CdINV, CdPRD: integer;
  sDetalhe: string;
begin
  result:=false;
  CdCNC := CodigoCNC;
  CdINV := CodigoINV;
  CdPRD := CodigoPRD;
  sDetalhe := 'PRD:'+IntToStr(CdPRD);
  try
    Edit;
    try
      codigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      CodigoLOT   := StrToInt(ECodigoLOT.Text);
    except
    end;    
    try
      DataAlterado   := CConfiguracao.DataHora;
    except
    end;
    try
      With CItem_de_Estoque do
      Begin
        Close;
        ParamByName('PRD_CODIGO').AsInteger :=StrToInt(ECodigoPRD.Text);
        ParamByName('CNC_CODIGO').AsInteger :=CConfiguracao.CodigoCNC;
        Open;
      End;
      try
         QuantInf := StrToFloat(EQuantInf.Text);
         sDetalhe := sDetalhe + ' QtdInf:'+EQuantInf.Text;
      except
      end;
      If not CItem_de_Estoque.IsEmpty then
        QuantSist := CItem_de_Estoque.SFisico
      else
        QuantSist := 0;
      sDetalhe := sDetalhe + ' MEF:'+Format('%.2f',[CItem_de_Estoque.SFisico]);
      sDetalhe := sDetalhe + ' MEC:'+Format('%.2f',[CItem_de_Estoque.SComercial]);
      sDetalhe := sDetalhe + ' MES:'+Format('%.2f',[CItem_de_Estoque.SFiscal]);
      sDetalhe := sDetalhe + ' Ind:'+Format('%.2f',[CItem_de_Estoque.Indisponivel]);
      sDetalhe := sDetalhe + ' Res:'+Format('%.2f',[CItem_de_Estoque.SReservado]);
      sDetalhe := sDetalhe + ' LJ3:'+Format('%.2f',[CItem_de_Estoque.SSN]);
      sDetalhe := sDetalhe + ' LJ4:'+Format('%.2f',[CItem_de_Estoque.SLJ4]);
    except
    end;
    try
       Observacao := EObservacao.Text;
       sDetalhe := sDetalhe + ' OBS:'+EObservacao.Text;
    except
    end;
    try
      Post;
      GeraLog(7830,CdCNC,CdINV,sDetalhe);
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TItem_de_Inventario.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled      := not Habilitar;
  Except
  End;
  Try
    if Estado = 1 then
      ECodigoPRD.Enabled   := Habilitar
    else
      ECodigoPRD.Enabled   := False;
  Except
  End;
  Try
    EQuantInf.Enabled    := Habilitar;
  Except
  End;
  Try
    ECodigoLOT.Enabled    := Habilitar;
  Except
  End;  
  Try
    EObservacao.Enabled    := Habilitar;
  Except
  End;
end;

procedure TItem_de_Inventario.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TItem_de_Inventario.CarregaDados;
begin
  Try
    ECodigoIIV.Text                :=IntToStr(CodigoIIV);
  Except
  End;
  Try
    ECodigoPRD.Text       :=IntToStr(CodigoPRD);
  Except
  End;
  Try
    ECodigoLOT.Text       :=IntToStr(CodigoLOT);
  Except
  End;  
  Try
    EQuantSist.Text           :=Format('%.2f', [QuantSist]);
  Except
  End;
  Try
    EQuantInf.Text            :=Format('%.2f', [QuantInf]);
  Except
  End;
  Try
    EObservacao.Text            :=Observacao;
  Except
  End;
end;

constructor TItem_de_Inventario.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ITEM_DE_INVENTARIO';

     { Code to perform other tasks when the component is created }

end;

function TItem_de_Inventario.Deletar(CdCNC, CdIIV: Integer):Boolean;
var
  CdINV, CdPRD: integer;
begin
  Result := False;
  If not(localizarCod(CdIIV, CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdINV := CodigoINV;
      CdPRD := CodigoPRD;
      if Delete then
      Begin
        GeraLog(7840, CdCNC, CdINV, 'PRD:'+IntToStr(CdPRD));
        RegistrarDel(CdCNC,1570(*ItemDeInventário*),CdIIV);
        Result := True;
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_de_Inventario.Destroy;
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

function TItem_de_Inventario.FinalizaEdicao:Boolean;
var
  Cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  if not VerificaInteiroBranco(ECodigoLOT.text) then
    mensagem:= mensagem + 'Código de Lote digitada incorretamente!';
  if not VerificaFloatBranco(EQuantInf.text) then
    mensagem:= mensagem + 'Quantidade inf. digitada incorretamente!';    
  If mensagem <>'' Then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      If Inserirauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(SCodigo,CConfiguracao.CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    else If Estado=2 then
    Begin
      Cod := CodigoIIV;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(Cod,CConfiguracao.CodigoCNC);
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
    AfterScroll:=Aux;
    CarregaDados;
  end;
end;

function TItem_de_Inventario.InserirAuto:Boolean;
var
  CdCNC, CdINV, CdPRD: integer;
  sDetalhe: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdINV := CInventario.CodigoINV;
  CdPRD := StrToInt(ECodigoPRD.Text);
  sDetalhe := 'PRD:'+IntToStr(CdPRD);
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
      codigoLOT   := StrToInt(ECodigoLOT.Text);
    except
    end;    
    try
      DataCadastro   := CConfiguracao.DataHora;
    except
    end;
    try
      DataAlterado   := CConfiguracao.DataHora;
    except
    end;
    try
      codigoIIV := SCodigo;
    except
    end;
    try
       CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
       CodigoINV := CInventario.CodigoINV;
    except
    end;
    try
       QuantInf := StrToFloat(EQuantInf.Text);
       sDetalhe := sDetalhe + ' QtdInf:'+EQuantInf.Text;
    except
    end;
    try
      With CItem_de_Estoque do
      Begin
        Close;
        ParamByName('PRD_CODIGO').AsInteger :=StrToInt(ECodigoPRD.Text);
        ParamByName('CNC_CODIGO').AsInteger :=CConfiguracao.CodigoCNC;
        Open;
      End;
      If not CItem_de_Estoque.IsEmpty then
        QuantSist := CItem_de_Estoque.SFisico
      else
        QuantSist := 0;
      sDetalhe := sDetalhe + ' MEF:'+Format('%.2f',[CItem_de_Estoque.SFisico]);
      sDetalhe := sDetalhe + ' MEC:'+Format('%.2f',[CItem_de_Estoque.SComercial]);
      sDetalhe := sDetalhe + ' MES:'+Format('%.2f',[CItem_de_Estoque.SFiscal]);
      sDetalhe := sDetalhe + ' Ind:'+Format('%.2f',[CItem_de_Estoque.Indisponivel]);
      sDetalhe := sDetalhe + ' Res:'+Format('%.2f',[CItem_de_Estoque.SReservado]);
      sDetalhe := sDetalhe + ' LJ3:'+Format('%.2f',[CItem_de_Estoque.SSN]);
      sDetalhe := sDetalhe + ' LJ4:'+Format('%.2f',[CItem_de_Estoque.SLJ4]);
    except
    end;
    try
       Observacao := EObservacao.Text;
       sDetalhe := sDetalhe + ' OBS:'+EObservacao.Text;
    except
    end;
    try
      Post;
      GeraLog(7820,CdCNC,CdINV,sDetalhe);
      result:=True;

    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TItem_de_Inventario.LimpaCampos;
begin
  Try
    ECodigoPRD.Clear;
  Except
  End;
  Try
    EQuantSist.Clear;
  Except
  End;
  Try
    EQuantInf.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoLOT.Clear
    else
      ECodigoLOT.Text := '0';
  Except
  End;  
  Try
    EObservacao.Clear;
  Except
  End;
end;

{ Localiza um Ítem de Inventário }
function TItem_de_Inventario.LocalizarCod(CdIIV, CdCNC: Integer): Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdIIV<>CodigoIIV) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; IIV_CODIGO', vararrayof([CdCNC, CdIIV]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_de_Inventario.PreparaAlteracao;
begin
  Estado := 2;
  AtualizaControles(True);
end;

procedure TItem_de_Inventario.PreparaInsercao;
begin
  ProximoCodigo('IIV_CODIGO');
  Estado := 1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TItem_de_Inventario.deletarauto:Boolean;
var
  CdCNC, CdINV, CdIIV, CdPRD: integer;
begin
  Result:=False;
  try
    CdCNC := CodigoCNC;
    CdINV := CodigoINV;
    CdIIV := CodigoIIV;
    CdPRD := CodigoPRD;
    if Delete then
    Begin
      RegistrarDel(CdCNC,1570(*ItemDeInventário*),CdIIV, 'PRD:'+IntToStr(CdPRD));
      GeraLog(7840, CdCNC, CdINV, 'PRD:'+IntToStr(CdPRD));
      Result := True;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

end.
