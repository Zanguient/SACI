////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO.....: SIAC                                                 //
//============================================================================//
// REVISÃO.............: 2.0                                                  //
// MÓDULO..............: SIAC                                                 //
// UNIT................: Item do Cadastro de Consignação                      //
// ANALISTA............: Anderson Gonçalves                                   //
// DESENVOLVEDOR.......: Anderson Gonçalves                                   //
// DATA DAS ALTERAÇÕES.: 10/05/2011                                           //
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

unit item_de_consignacao;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls,
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls,
     Mask, Dbctrls, Configuracao, Variants, Consignacao, Item_de_Estoque,
     Produto, Funcoes;

type
  TItem_de_Consignacao = class(TSQuery)
  private
    FCConsignacao     : TConsignacao;
    FCProduto         : TProduto;
    FCItem_de_Estoque : TItem_de_Estoque;
    FCodigoICS        : Integer;
    FCodigoCSG        : Integer;
    FCodigoPRD        : Integer;
    FDataCadastro     : TDateTime;
    FObservacao       : String;
    FQuantidade       : Double;
    FValor            : Double;
    FECodigoICS       : TEdit;
    FECodigoCSG       : TEdit;
    FECodigoPRD       : TEdit;
    FEObservacao      : TEdit;
    FEQuantidade      : TEdit;
    FEValor           : TEdit;
    procedure AutoInitialize;
    procedure AutoDestroy;
    procedure SetCodigoICS(Value : Integer);
    procedure SetCodigoCSG(Value : Integer);
    procedure SetCodigoPRD(Value : Integer);
    procedure SetDataCadastro(Value : TDateTime);
    procedure SetObservacao(Value : String);
    procedure SetQuantidade(Value : Double);
    procedure SetValor(const Value: Double);
    function GetCodigoICS : Integer;
    function GetCodigoCSG : Integer;
    function GetCodigoPRD : Integer;
    function GetDataCadastro : TDateTime;
    function GetObservacao : String;
    function GetQuantidade : Double;
    function GetValor: Double;
  protected
    procedure Notification(AComponent : TComponent; Operation : TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function AlterarAuto:Boolean;
    function Deletar(CdCNC, CdICS: Integer):Boolean;
    function FinalizaEdicao:Boolean;
    function InserirAuto:Boolean;
    function LocalizarCod(CdICS, CdCNC: Integer): Boolean;
    function DeletarAuto:Boolean;
    procedure AtualizaControles(Habilitar:Boolean);
    procedure CancelaEdicao;
    procedure CarregaDados;
    procedure LimpaCampos;
    procedure PreparaAlteracao;
    procedure PreparaInsercao;
  published
    property CConsignacao     : TConsignacao     read FCConsignacao     write FCConsignacao;
    property CProduto         : TProduto         read FCProduto         write FCProduto;
    property CItem_de_Estoque : TItem_de_Estoque read FCItem_de_Estoque write FCItem_de_Estoque;
    property CodigoICS        : Integer          read GetCodigoICS      write SetCodigoICS;
    property CodigoCSG        : Integer          read GetCodigoCSG      write SetCodigoCSG;
    property CodigoPRD        : Integer          read GetCodigoPRD      write SetCodigoPRD;
    property DataCadastro     : TDateTime        read GetDataCadastro   write SetDataCadastro;
    property Observacao       : String           read GetObservacao     write SetObservacao;
    property Quantidade       : Double           read GetQuantidade     write SetQuantidade;
    property Valor            : Double           read GetValor          write SetValor;
    property ECodigoICS       : TEdit            read FECodigoICS       write FECodigoICS;
    property ECodigoCSG       : TEdit            read FECodigoCSG       write FECodigoCSG;
    property ECodigoPRD       : TEdit            read FECodigoPRD       write FECodigoPRD;
    property EObservacao      : TEdit            read FEObservacao      write FEObservacao;
    property EQuantidade      : TEdit            read FEQuantidade      write FEQuantidade;
    property EValor           : TEdit            read FEValor           write FEValor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Softech', [TItem_de_Consignacao]);
end;

{ TConsignacao }

procedure TItem_de_Consignacao.AutoInitialize;
begin
  FECodigoICS  := nil;
  FECodigoCSG  := nil;
  FEValor      := nil;
  FECodigoPRD  := nil;
  FEObservacao := nil;
  FEQuantidade := nil;
end;

procedure TItem_de_Consignacao.Notification(AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation <> opRemove then
    Exit;
  if AComponent = FECodigoICS then
    FECodigoICS := nil;
  if AComponent = FECodigoCSG then
    FECodigoCSG := nil;
  if AComponent = FECodigoPRD then
    FECodigoPRD := nil;
  if AComponent = FEObservacao then
    FEObservacao := nil;
  if AComponent = FEQuantidade then
    FEQuantidade := nil;
  if AComponent = FEValor then
    FEValor := nil;
end;

procedure TItem_de_Consignacao.AutoDestroy;
begin

end;

function TItem_de_Consignacao.GetCodigoICS : Integer;
begin
  try
    Result := Self.fieldByName('ICS_CODIGO').asInteger;
  except
    Result:= 0
  end;
end;

procedure TItem_de_Consignacao.SetCodigoICS(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('ICS_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICS_CODIGO"!');
    end;
  end;
end;

function TItem_de_Consignacao.GetCodigoCSG : Integer;
begin
  try
    Result := Self.fieldByName('CSG_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

procedure TItem_de_Consignacao.SetCodigoCSG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('CSG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CSG_CODIGO"!');
    end;
  end;
end;

function TItem_de_Consignacao.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

procedure TItem_de_Consignacao.SetCodigoPRD(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('PRD_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PRD_CODIGO"!');
    end;
  end;
end;

function TItem_de_Consignacao.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('ICS_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

procedure TItem_de_Consignacao.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('ICS_DATA').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICS_DATA"!');
    end;
  end;
end;

function TItem_de_Consignacao.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('ICS_OBSERVACAO').asString;
  except
    Result := '';
  end;
end;

procedure TItem_de_Consignacao.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('ICS_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICS_OBSERVACAO"!');
    end;
  end;
end;

function TItem_de_Consignacao.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('ICS_QUANTIDADE').asFloat;
  except
    Result := 0;
  end;
end;

procedure TItem_de_Consignacao.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('ICS_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICS_QUANTIDADE"!');
    end;
  end;
end;

function TItem_de_Consignacao.AlterarAuto:Boolean;
var
  CdCNC, CdCSG, CdPRD: integer;
  sDetalhe: string;
begin
  result:=false;
  CdCNC := CodigoCNC;
  CdCSG := CodigoCSG;
  CdPRD := CodigoPRD;
  sDetalhe := 'PRD:'+IntToStr(CdPRD);
  try
    Edit;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      Valor := StrToFloat(EValor.Text);
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
         Quantidade := StrToFloat(EQuantidade.Text);
         sDetalhe := sDetalhe + ' QtdInf:'+EQuantidade.Text;
      except
      end;
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
      GeraLog(8960,CdCNC,CdCSG,sDetalhe);
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TItem_de_Consignacao.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled := not Habilitar;
  Except
  End;
  Try
    if Estado = 1 then
      ECodigoPRD.Enabled := Habilitar
    else
      ECodigoPRD.Enabled := False;
  Except
  End;
  Try
    EQuantidade.Enabled := Habilitar;
  Except
  End;
  {Try
    EValor.Enabled := Habilitar;
  Except
  End;}
  Try
    EObservacao.Enabled := Habilitar;
  Except
  End;
end;

procedure TItem_de_Consignacao.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado := 0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TItem_de_Consignacao.CarregaDados;
begin
  Try
    ECodigoICS.Text := IntToStr(CodigoICS);
  Except
  End;
  Try
    ECodigoPRD.Text := IntToStr(CodigoPRD);
  Except
  End;
  Try
    EValor.Text := Format('%.2f', [Valor]);
  Except
  End;
  Try
    EQuantidade.Text := Format('%.2f', [Quantidade]);
  Except
  End;
  Try
    EObservacao.Text := Observacao;
  Except
  End;
end;

constructor TItem_de_Consignacao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  AutoInitialize;
  Tabela := 'ITEM_DE_CONSIGNACAO';
end;

function TItem_de_Consignacao.Deletar(CdCNC, CdICS: Integer):Boolean;
var
  CdCSG, CdPRD: integer;
begin
  Result := False;
  If not(localizarCod(CdICS, CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCSG := CodigoCSG;
      CdPRD := CodigoPRD;
      if Delete then
      Begin
        GeraLog(8970, CdCNC, CdCSG, 'PRD:'+IntToStr(CdPRD));
        RegistrarDel(CdCNC,4600{ItemDeConsignacao},CdICS);
        Result := True;
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_de_Consignacao.Destroy;
begin
  AutoDestroy;
  inherited Destroy;
end;

function TItem_de_Consignacao.FinalizaEdicao:Boolean;
var
  Cod:Integer;
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  Result := False;
  mensagem:='';
  {if not VerificaFloatBranco(EValor.text) then
    mensagem:= mensagem + 'Valor digitado incorretamente!';}
  if not VerificaFloatBranco(EQuantidade.text) then
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
      Cod := CodigoICS;
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

function TItem_de_Consignacao.InserirAuto:Boolean;
var
  CdCNC, CdCSG, CdPRD: integer;
  sDetalhe: string;
begin
  result:=false;
  CdCNC := CConfiguracao.CodigoCNC;
  CdCSG := CConsignacao.CodigoCSG;
  CdPRD := StrToInt(ECodigoPRD.Text);
  sDetalhe := 'PRD:'+IntToStr(CdPRD);
  try
    append;
    try
      codigoCNC := CConfiguracao.CodigoCNC;
    except
    end;
    try
      codigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro := CConfiguracao.DataHora;
    except
    end;
    try
      Valor := StrToFloat(EValor.Text);
    except
    end;
    try
      CodigoICS := SCodigo;
    except
    end;
    try
       CodigoPRD := StrToInt(ECodigoPRD.Text);
    except
    end;
    try
       CodigoCSG := CConsignacao.CodigoCSG;
    except
    end;
    try
       Quantidade := StrToFloat(EQuantidade.Text);
       sDetalhe   := sDetalhe + ' QtdInf:'+EQuantidade.Text;
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
      GeraLog(8960,CdCNC,CdCSG,sDetalhe);
      Result := True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TItem_de_Consignacao.LimpaCampos;
begin
  Try
    ECodigoPRD.Clear;
  Except
  End;
  Try
    EValor.Clear;
  Except
  End;
  Try
    EQuantidade.Clear;
  Except
  End;
  Try
    EObservacao.Clear;
  Except
  End;
end;

function TItem_de_Consignacao.LocalizarCod(CdICS, CdCNC: Integer): Boolean;
begin
  if (CdICS<>CodigoICS) or (CdCNC<>CodigoCNC) Then
  begin
    if locate('CNC_CODIGO; ICS_CODIGO', vararrayof([CdCNC, CdICS]), []) Then
      Result := True
    else
      Result := False;
  end
  else
    Result := True;
end;

procedure TItem_de_Consignacao.PreparaAlteracao;
begin
  Estado := 2;
  AtualizaControles(True);
end;

procedure TItem_de_Consignacao.PreparaInsercao;
begin
  ProximoCodigo('ICS_CODIGO');
  Estado := 1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TItem_de_Consignacao.DeletarAuto:Boolean;
var
  CdCNC, CdCSG, CdICS, CdPRD: integer;
begin
  Result:=False;
  try
    CdCNC := CodigoCNC;
    CdCSG := CodigoCSG;
    CdICS := CodigoICS;
    CdPRD := CodigoPRD;
    if Delete then
    Begin
      RegistrarDel(CdCNC,4600{ItemDeConsignacao},CdICS, 'PRD:'+IntToStr(CdPRD));
      GeraLog(8970, CdCNC, CdCSG, 'PRD:'+IntToStr(CdPRD));
      Result := True;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;

function TItem_de_Consignacao.GetValor: Double;
begin
  try
    Result := Self.fieldByName('ICS_VALOR').asFloat;
  except
    Result := 0;
  end;
end;

procedure TItem_de_Consignacao.SetValor(const Value: Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  begin
    try
      Self.fieldByName('ICS_VALOR').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICS_VALOR"!');
    end;
  end;
end;

end.
