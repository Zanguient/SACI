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
unit Item_de_Cotacao;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto_por_Fornecedor, Fornecedor, MapaCotacao, 
     Configuracao, Funcoes, Variants;

type
  TItem_de_Cotacao = class(TSQuery)
    private
      { Private fields of TItem_de_Cotacao }
        { Storage for property AcFin }
        FAcFin : Double;
        { Storage for property Bonificacao }
        FBonificacao : Double;
        { Storage for property CCotacao }
        FCCotacao : TMapaCotacao;
        { Storage for property CodigoCNC }
        FCodigoCNC : Integer;
        { Storage for property CodigoICT }
        FCodigoICT : Integer;
        { Storage for property CodigoMCT }
        FCodigoMCT : Integer;
        { Storage for property Descontos }
        FDescontos : String;
        { Storage for property EAcFin }
        FEAcFin : TEdit;
        { Storage for property EBonificacao }
        FEBonificacao : TEdit;
        { Storage for property ECodigoICT }
        FECodigoICT : TEdit;
        { Storage for property ECodigoMCT }
        FECodigoMCT : TEdit;
        { Storage for property EDescontos }
        FEDescontos : TEdit;
        { Storage for property EEntrega }
        FEEntrega : TEdit;
        { Storage for property EFornecedor }
        FEFornecedor : TEdit;
        { Storage for property EFrete }
        FEFrete : TEdit;
        { Storage for property EICM }
        FEICM : TEdit;
        { Storage for property EIPI }
        FEIPI : TEdit;
        { Storage for property EPagamento }
        FEPagamento : TEdit;
        { Storage for property EPreco }
        FEPreco : TEdit;
        { Storage for property EProduto }
        FEProduto : TEdit;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ETipoAcFin }
        FETipoAcFin : TComboBox;
        { Storage for property EVPC }
        FEVPC : TEdit;
        { Storage for property Entrega }
        FEntrega : Integer;
        { Storage for property Fornecedor }
        FFornecedor : String;
        { Storage for property Frete }
        FFrete : Double;
        { Storage for property ICM }
        FICM : Double;
        { Storage for property IPI }
        FIPI : Double;
        { Storage for property Pagamento }
        FPagamento : String;
        { Storage for property Preco }
        FPreco : Double;
        { Storage for property Produto }
        FProduto : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property TipoAcFin }
        FTipoAcFin : String;
        { Storage for property VPC }
        FVPC : Double;

      { Private methods of TItem_de_Cotacao }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property AcFin }
        function GetAcFin : Double;
        { Write method for property AcFin }
        procedure SetAcFin(Value : Double);
        { Read method for property Bonificacao }
        function GetBonificacao : Double;
        { Write method for property Bonificacao }
        procedure SetBonificacao(Value : Double);
        { Read method for property CodigoCNC }
        function GetCodigoCNC : Integer;
        { Write method for property CodigoCNC }
        procedure SetCodigoCNC(Value : Integer);
        { Read method for property CodigoICT }
        function GetCodigoICT : Integer;
        { Write method for property CodigoICT }
        procedure SetCodigoICT(Value : Integer);
        { Read method for property CodigoMCT }
        function GetCodigoMCT : Integer;
        { Write method for property CodigoMCT }
        procedure SetCodigoMCT(Value : Integer);
        { Read method for property Descontos }
        function GetDescontos : String;
        { Write method for property Descontos }
        procedure SetDescontos(Value : String);
        { Read method for property Entrega }
        function GetEntrega : Integer;
        { Write method for property Entrega }
        procedure SetEntrega(Value : Integer);
        { Read method for property Fornecedor }
        function GetFornecedor : String;
        { Write method for property Fornecedor }
        procedure SetFornecedor(Value : String);
        { Read method for property Frete }
        function GetFrete : Double;
        { Write method for property Frete }
        procedure SetFrete(Value : Double);
        { Read method for property ICM }
        function GetICM : Double;
        { Write method for property ICM }
        procedure SetICM(Value : Double);
        { Read method for property IPI }
        function GetIPI : Double;
        { Write method for property IPI }
        procedure SetIPI(Value : Double);
        { Read method for property Pagamento }
        function GetPagamento : String;
        { Write method for property Pagamento }
        procedure SetPagamento(Value : String);
        { Read method for property Preco }
        function GetPreco : Double;
        { Write method for property Preco }
        procedure SetPreco(Value : Double);
        { Read method for property Produto }
        function GetProduto : String;
        { Write method for property Produto }
        procedure SetProduto(Value : String);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property TipoAcFin }
        function GetTipoAcFin : String;
        { Write method for property TipoAcFin }
        procedure SetTipoAcFin(Value : String);
        { Read method for property VPC }
        function GetVPC : Double;
        { Write method for property VPC }
        procedure SetVPC(Value : Double);

    protected
      { Protected fields of TItem_de_Cotacao }

      { Protected methods of TItem_de_Cotacao }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;
        procedure Loaded; override;

    public
      { Public fields and properties of TItem_de_Cotacao }
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TItem_de_Cotacao }
        { Altera um Ítem de Cotação }
        function Alterar(CdCNC, CdICT, CdMCT, PEntrega: Integer; PPagamento: String; PPreco, PFrete, PIPI, PBonificacao,PICM,PQuantidade: Double;PProduto,PFornecedor,Pdescontos:String;PVPC:Double;PTipoAcFin:String;PAcFin:Double):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        procedure Deletar(CdCNC, CdICT: Integer);
        destructor Destroy; override;
        procedure FinalizaEdicao;
        { Insere um Ítem de Cotação }
        function Inserir(CdCNC, CdICT, CdMCT, PEntrega: Integer; PPagamento: String; PBonificacao,PPreco, PFrete, PIPI, PICM,PQuantidade: Double;PProduto,PFornecedor,Pdescontos:String;PVPC:Double;PTipoAcFin:String;PAcFin:Double):boolean;
        function InserirAuto:Boolean;
        { Localiza um Ítem de Cotação }
        function LocalizarCod(CdICT, CdCNC: Integer): Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TItem_de_Cotacao }
        property AcFin : Double read GetAcFin write SetAcFin;
        property Bonificacao : Double read GetBonificacao write SetBonificacao;
        property CCotacao : TMapaCotacao read FCCotacao write FCCotacao;
        property CodigoCNC : Integer read GetCodigoCNC write SetCodigoCNC;
        { Código do Ítem de Cotação }
        property CodigoICT : Integer read GetCodigoICT write SetCodigoICT;
        { Código do mapa de cotação }
        property CodigoMCT : Integer read GetCodigoMCT write SetCodigoMCT;
        property Descontos : String read GetDescontos write SetDescontos;
        property EAcFin : TEdit read FEAcFin write FEAcFin;
        property EBonificacao : TEdit read FEBonificacao write FEBonificacao;
        property ECodigoICT : TEdit read FECodigoICT write FECodigoICT;
        property ECodigoMCT : TEdit read FECodigoMCT write FECodigoMCT;
        property EDescontos : TEdit read FEDescontos write FEDescontos;
        property EEntrega : TEdit read FEEntrega write FEEntrega;
        property EFornecedor : TEdit read FEFornecedor write FEFornecedor;
        property EFrete : TEdit read FEFrete write FEFrete;
        property EICM : TEdit read FEICM write FEICM;
        property EIPI : TEdit read FEIPI write FEIPI;
        property EPagamento : TEdit read FEPagamento write FEPagamento;
        property EPreco : TEdit read FEPreco write FEPreco;
        property EProduto : TEdit read FEProduto write FEProduto;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ETipoAcFin : TComboBox read FETipoAcFin write FETipoAcFin;
        property EVPC : TEdit read FEVPC write FEVPC;
        property Entrega : Integer read GetEntrega write SetEntrega;
        property Fornecedor : String read GetFornecedor write SetFornecedor;
        property Frete : Double read GetFrete write SetFrete;
        property ICM : Double read GetICM write SetICM;
        property IPI : Double read GetIPI write SetIPI;
        property Pagamento : String read GetPagamento write SetPagamento;
        property Preco : Double read GetPreco write SetPreco;
        property Produto : String read GetProduto write SetProduto;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property TipoAcFin : String read GetTipoAcFin write SetTipoAcFin;
        property VPC : Double read GetVPC write SetVPC;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Cotacao with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Cotacao]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Cotacao.AutoInitialize;
begin
     Estado := 0;
     FEAcFin := nil;
     FEBonificacao := nil;
     FECodigoICT := nil;
     FECodigoMCT := nil;
     FEDescontos := nil;
     FEEntrega := nil;
     FEFornecedor := nil;
     FEFrete := nil;
     FEICM := nil;
     FEIPI := nil;
     FEPagamento := nil;
     FEPreco := nil;
     FEProduto := nil;
     FEQuantidade := nil;
     FETipoAcFin := nil;
     FEVPC := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TItem_de_Cotacao.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAcFin then
        FEAcFin := nil;
     if AComponent = FEBonificacao then
        FEBonificacao := nil;
     if AComponent = FECodigoICT then
        FECodigoICT := nil;
     if AComponent = FECodigoMCT then
        FECodigoMCT := nil;
     if AComponent = FEDescontos then
        FEDescontos := nil;
     if AComponent = FEEntrega then
        FEEntrega := nil;
     if AComponent = FEFornecedor then
        FEFornecedor := nil;
     if AComponent = FEFrete then
        FEFrete := nil;
     if AComponent = FEICM then
        FEICM := nil;
     if AComponent = FEIPI then
        FEIPI := nil;
     if AComponent = FEPagamento then
        FEPagamento := nil;
     if AComponent = FEPreco then
        FEPreco := nil;
     if AComponent = FEProduto then
        FEProduto := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FETipoAcFin then
        FETipoAcFin := nil;
     if AComponent = FEVPC then
        FEVPC := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Cotacao.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property AcFin }
function TItem_de_Cotacao.GetAcFin : Double;
begin
  try
    Result := Self.fieldByName('ICT_ACFIN').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property AcFin }
procedure TItem_de_Cotacao.SetAcFin(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_ACFIN').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_ACFIN"!');
  end;
end;

{ Read method for property Bonificacao }
function TItem_de_Cotacao.GetBonificacao : Double;
begin
  try
    Result := Self.fieldByName('ICT_BONIFICACAO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Bonificacao }
procedure TItem_de_Cotacao.SetBonificacao(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_BONIFICACAO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_BONIFICACAO"!');
  end;
end;

{ Read method for property CodigoCNC }
function TItem_de_Cotacao.GetCodigoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNC }
procedure TItem_de_Cotacao.SetCodigoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CODIGO"!');
    end;
end;

{ Read method for property CodigoICT }
function TItem_de_Cotacao.GetCodigoICT : Integer;
begin
  try
    Result := Self.fieldByName('ICT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoICT }
procedure TItem_de_Cotacao.SetCodigoICT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ICT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICT_CODIGO"!');
    end;
end;

{ Read method for property CodigoMCT }
function TItem_de_Cotacao.GetCodigoMCT : Integer;
begin
  try
    Result := Self.fieldByName('MCT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoMCT }
procedure TItem_de_Cotacao.SetCodigoMCT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCT_CODIGO"!');
    end;
end;

{ Read method for property Descontos }
function TItem_de_Cotacao.GetDescontos : String;
begin
  try
    Result := Self.fieldByName('ICT_DESCONTOS').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Descontos }
procedure TItem_de_Cotacao.SetDescontos(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_DESCONTOS').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_DESCONTOS"!');
  end;
end;

{ Read method for property Entrega }
function TItem_de_Cotacao.GetEntrega : Integer;
begin
  try
    Result := Self.fieldByName('ICT_ENTREGA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Entrega }
procedure TItem_de_Cotacao.SetEntrega(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_ENTREGA').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_ENTREGA"!');
  end;
end;

{ Read method for property Fornecedor }
function TItem_de_Cotacao.GetFornecedor : String;
begin
  try
    Result := Self.fieldByName('ICT_FORNECEDOR').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fornecedor }
procedure TItem_de_Cotacao.SetFornecedor(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_FORNECEDOR').asString := UpperCase(Value);
  except
    ShowMessage('Não foi possível alterar o campo "ICT_FORNECEDOR"!');
  end;
end;

{ Read method for property Frete }
function TItem_de_Cotacao.GetFrete : Double;
begin
  try
    Result := Self.fieldByName('ICT_FRETE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Frete }
procedure TItem_de_Cotacao.SetFrete(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_FRETE').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_FRETE"!');
  end;
end;

{ Read method for property ICM }
function TItem_de_Cotacao.GetICM : Double;
begin
  try
    Result := Self.fieldByName('ICT_ICM').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ICM }
procedure TItem_de_Cotacao.SetICM(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ICT_ICM').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICT_ICM"!');
    end;
end;

{ Read method for property IPI }
function TItem_de_Cotacao.GetIPI : Double;
begin
  try
    Result := Self.fieldByName('ICT_IPI').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property IPI }
procedure TItem_de_Cotacao.SetIPI(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_IPI').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_IPI"!');
  end;
end;

{ Read method for property Pagamento }
function TItem_de_Cotacao.GetPagamento : String;
begin
  try
    Result := Self.fieldByName('ICT_PAGAMENTO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Pagamento }
procedure TItem_de_Cotacao.SetPagamento(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_PAGAMENTO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_PAGAMENTO"!');
  end;
end;

{ Read method for property Preco }
function TItem_de_Cotacao.GetPreco : Double;
begin
  try
    Result := Self.fieldByName('ICT_PRECO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Preco }
procedure TItem_de_Cotacao.SetPreco(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_PRECO').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_PRECO"!');
  end;
end;

{ Read method for property Produto }
function TItem_de_Cotacao.GetProduto : String;
begin
  try
    Result := Self.fieldByName('ICT_PRODUTO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Produto }
procedure TItem_de_Cotacao.SetProduto(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_PRODUTO').asString := UpperCase(Value);
  except
    ShowMessage('Não foi possível alterar o campo "ICT_PRODUTO"!');
  end;
end;

{ Read method for property Quantidade }
function TItem_de_Cotacao.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('ICT_QUANTIDADE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TItem_de_Cotacao.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('ICT_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "ICT_QUANTIDADE"!');
    end;
end;

{ Read method for property TipoAcFin }
function TItem_de_Cotacao.GetTipoAcFin : String;
begin
  try
    Result := Self.fieldByName('ICT_TIPO_ACFIN').asString;
  except
    result:= ''
  end;
end;

{ Write method for property TipoAcFin }
procedure TItem_de_Cotacao.SetTipoAcFin(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_TIPO_ACFIN').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_TIPO_ACFIN"!');
  end;
end;

{ Read method for property VPC }
function TItem_de_Cotacao.GetVPC : Double;
begin
  try
    Result := Self.fieldByName('ICT_VPC').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property VPC }
procedure TItem_de_Cotacao.SetVPC(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('ICT_VPC').asFloat := Value;
  except
    ShowMessage('Não foi possível alterar o campo "ICT_VPC"!');
  end;
end;

{ Altera um Ítem de Cotação }
function TItem_de_Cotacao.Alterar(CdCNC, CdICT, CdMCT, PEntrega: Integer; PPagamento: String; PPreco, PFrete, PIPI, PBonificacao,PICM,PQuantidade: Double;PProduto,PFornecedor,Pdescontos:String;PVPC:Double;PTipoAcFin:String;PAcFin:Double):boolean;
begin
  result:=true;
  If not(localizarCod(CdICT, CdCNC)) Then
  begin
    result:=false;
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!');
  end
  Else
  Begin
    try
      edit;
      CodigoMCT      := CdMCT;
      Preco          := PPreco;
      Bonificacao    := PBonificacao;
      Frete          := PFrete;
      IPI            := PIPI;
      ICM            := PICM;
      Entrega        := PEntrega;
      Pagamento      := PPagamento;
      Quantidade     := PQuantidade;
      Produto        := PProduto;
      Fornecedor     := PFornecedor;
      Descontos      := PDescontos;
      VPC            := PVPC;
      TipoAcFin      := PTipoAcFin;
      AcFin          := PAcFin;
      try
        Post;
      except
        result:=false;
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TItem_de_Cotacao.AlterarAuto:Boolean;
begin
    try
      edit;
      try
         Preco := StrToFloat(EPreco.Text);
      except
      end;
      try
         Bonificacao := StrToFloat(EBonificacao.Text);
      except
      end;
      try
         Frete := StrToFloat(EFrete.Text);
      except
      end;
      try
         IPI := StrToFloat(EIPI.Text);
      except
      end;
      try
         ICM := StrToFloat(EICM.Text);
      except
      end;
      try
         Entrega := StrToInt(EEntrega.Text);
      except
      end;
      try
         Pagamento := EPagamento.Text;
      except
      end;
      try
         quantidade := StrToFloat(Equantidade.Text);
      except
      end;
      try
         produto := EProduto.Text;
      except
      end;
      try
         fornecedor := EFornecedor.Text;
      except
      end;
      try
         descontos := EDescontos.Text;
      except
      end;
      try
         VPC := StrToFloat(EVPC.Text);
      except
      end;
      try
         TipoAcFin := ETipoAcFin.Text;
      except
      end;
      try
         AcFin := StrToFloat(EAcFin.Text);
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

procedure TItem_de_Cotacao.AtualizaControles(Habilitar:Boolean);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EPreco.Enabled         :=Habilitar;
  Except
  End;
  Try
    EBonificacao.Enabled   :=Habilitar;
  Except
  End;
  Try
    EFrete.Enabled         :=Habilitar;
  Except
  End;
  Try
    EIPI.Enabled           :=Habilitar;
  Except
  End;
  Try
    EICM.Enabled           :=Habilitar;
  Except
  End;
  Try
    EEntrega.Enabled       :=Habilitar;
  Except
  End;
  Try
    EPagamento.Enabled     :=Habilitar;
  Except
  End;
  Try
    EQuantidade.Enabled     :=Habilitar;
  Except
  End;
  Try
    EProduto.Enabled        :=Habilitar;
  Except
  End;
  Try
    EFornecedor.Enabled     :=Habilitar;
  Except
  End;
  Try
    EDescontos.Enabled      :=Habilitar;
  Except
  End;
  Try
    EVPC.Enabled            :=Habilitar;
  Except
  End;
  Try
    ETipoAcFin.Enabled      :=Habilitar;
  Except
  End;
  Try
    EAcFin.Enabled          :=Habilitar;
  Except
  End;
end;

procedure TItem_de_Cotacao.CancelaEdicao;
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

procedure TItem_de_Cotacao.CarregaDados;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Try
    EPreco.Text               :=Format('%.2f', [Preco]);
  Except
  End;
  Try
    EBonificacao.Text         :=Format('%.2f', [Bonificacao]);
  Except
  End;
  Try
    EFrete.Text               :=Format('%.2f', [Frete]);
  Except
  End;
  Try
    EIPI.Text                 :=Format('%.2f', [IPI]);
  Except
  End;
  Try
    EICM.Text                 :=Format('%.2f', [ICM]);
  Except
  End;
  Try
    EEntrega.Text             :=IntToStr(Entrega);
  Except
  End;
  Try
    EPagamento.Text           :=Pagamento;
  Except
  End;
  Try
    EQuantidade.Text           :=Format('%.2f', [Quantidade]);
  Except
  End;

  Try
    EProduto.Text              :=Produto;
  Except
  End;
  Try
    EFornecedor.Text           :=Fornecedor;
  Except
  End;
  Try
    EDescontos.Text             :=Descontos;
  Except
  End;
  Try
    EVPC.Text                  :=Format('%.2f', [VPC]);
  Except
  End;
  Try
    ETipoAcfin.Text            :=TipoAcfin;
  Except
  End;
  Try
    EAcFin.Text                :=Format('%.2f', [Acfin]);
  Except
  End;
end;

constructor TItem_de_Cotacao.Create(AOwner: TComponent);
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

procedure TItem_de_Cotacao.Deletar(CdCNC, CdICT: Integer);
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If not(localizarCod(CdICT, CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      Delete;
      if Tquery(Self).isEmpty then
      begin
         Try
           ECodigoICT.Clear;
         Except
         End;
         Try
           EPreco.Clear;
         Except
         End;
         Try
           EBonificacao.Clear;
         Except
         End;
         Try
           EFrete.Clear;
         Except
         End;
         Try
           EIPI.Clear;
         Except
         End;
         Try
           EICM.Clear;
         Except
         End;
         Try
           EEntrega.Clear;
         Except
         End;
         try
           EPagamento.Clear;
         Except
         End;
         try
           EQuantidade.Clear;
         Except
         End;

         try
           EProduto.Clear;
         Except
         End;
         try
           EFornecedor.Clear;
         Except
         End;
         try
           EDescontos.Clear;
         Except
         End;
         try
           EVPC.Clear;
         Except
         End;
         try
           EAcFin.Clear;
         Except
         End;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TItem_de_Cotacao.Destroy;
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

procedure TItem_de_Cotacao.FinalizaEdicao;
     { Internal declarations for method }
     { type }
     { . . . }
var
  cod, cdcnc:Integer;
  mensagem:string;
begin
  mensagem:='';
  If not Verificafloat(EQuantidade.text) Then
    mensagem:=mensagem+'Quantidade digitada incorretamente!'+#13;
  If not Verificafloat(EBonificacao.text) Then
    mensagem:=mensagem+'Bonificação digitada incorretamente!'+#13;
  If not Verificafloat(EPreco.text) Then
    mensagem:=mensagem+'Preço digitado incorretamente!'+#13;
  If not Verificafloat(EIPI.text) Then
    mensagem:=mensagem+'IPI digitado incorretamente!'+#13;
  If not Verificafloat(EICM.text) Then
    mensagem:=mensagem+'ICM digitado incorretamente!'+#13;
  If not Verificafloat(EFrete.text) Then
    mensagem:=mensagem+'Frete digitado incorretamente!';
  If not Verificafloat(EVPC.text) Then
    mensagem:=mensagem+'VPC digitado incorretamente!'+#13;
  If not Verificafloat(EAcFin.text) Then
    mensagem:=mensagem+'Acréscimo financeiro digitada incorretamente!'+#13;
  If mensagem <>'' Then
    raise Exception.Create(mensagem);
  If Estado=1 then
  Begin
    Inserirauto;
    close;
    open;
    LocalizarCod(SCodigo,CodigoCNC);
  End;

  If Estado=2 then
  Begin
    cod:=codigoICT;
    cdcnc:=codigoCNC;
    Alterarauto;
    close;
    open;
    LocalizarCod(cod, cdcnc);
  End;

  AtualizaControles(False);
  Estado:=0;
end;

{ Insere um Ítem de Cotação }
function TItem_de_Cotacao.Inserir(CdCNC, CdICT, CdMCT, PEntrega: Integer; PPagamento: String; PBonificacao,PPreco, PFrete, PIPI, PICM,PQuantidade: Double;PProduto,PFornecedor,Pdescontos:String;PVPC:Double;PTipoAcFin:String;PAcFin:Double):boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Cod: Integer;
begin
  if CdICT=0 then
    Cod    := ProximoCodigo('ICT_CODIGO')
  else
    Cod     := CdICT;
  If (localizarCod(Cod,CdCNC)) Then
  begin
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!');
    result:=false;
  end
  Else
  begin
      result:=true;
      Insert;
      try
        CodigoICT      := Cod;
        CodigoCNC      := CdCNC;
        CodigoMCT      := CdMCT;
        Preco          := PPreco;
        Bonificacao    := PBonificacao;
        Frete          := PFrete;
        IPI            := PIPI;
        ICM            := PICM;
        Entrega        := PEntrega;
        Pagamento      := PPagamento;
        Quantidade     := PQuantidade;
        Produto        := PProduto;
        Fornecedor     := PFornecedor;
        Descontos      := PDescontos;
        VPC            := PVPC;
        TipoAcFin      := PTipoAcFin;
        AcFin          := PAcFin;
        try
          Post;
        except
          result:=false;
          Cancel;
          ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
        end;
      except
        result:=false;
        ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
      end;
  end;
end;

function TItem_de_Cotacao.InserirAuto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
Var
  Aux:TDataSetNotifyEvent;
begin
    try
      Aux:=AfterScroll;
      AfterScroll:=Nil;
      append;
      try
        CodigoMCT   := StrToInt(ECodigoMCT.Text);
      except
      end;
      try
        codigocnc   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        codigoICT := SCodigo;
      except
      end;
      try
         Preco := StrToFloat(EPreco.Text);
      except
      end;
      try
         Bonificacao := StrToFloat(EBonificacao.Text);
      except
      end;
      try
         Frete := StrToFloat(EFrete.Text);
      except
      end;
      try
         IPI := StrToFloat(EIPI.Text);
      except
      end;
      try
         ICM := StrToFloat(EICM.Text);
      except
      end;
      try
         Entrega := StrToInt(EEntrega.Text);
      except
      end;
      try
         Pagamento := EPagamento.Text;
      except
      end;
      try
         Quantidade := StrToFloat(EQuantidade.Text);
      except
      end;
      try
         produto := EProduto.Text;
      except
      end;
      try
         fornecedor := EFornecedor.Text;
      except
      end;
      try
         descontos := EDescontos.Text;
      except
      end;
      try
         VPC := StrToFloat(EVPC.Text);
      except
      end;
      try
         TipoAcFin := ETipoAcFin.Text;
      except
      end;
      try
         AcFin := StrToFloat(EAcFin.Text);
      except
      end;
      try
        Post;
        AfterScroll:=Aux;
        CarregaDados;
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

procedure TItem_de_Cotacao.Loaded;
begin
     inherited Loaded;

     { Perform any component setup that depends on the property
       values having been set }

end;

{ Localiza um Ítem de Cotação }
function TItem_de_Cotacao.LocalizarCod(CdICT, CdCNC: Integer): Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdICT<>CodigoICT) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; ICT_CODIGO', vararrayof([CdCNC, CdICT]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TItem_de_Cotacao.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TItem_de_Cotacao.PreparaInsercao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  ProximoCodigo('ICT_CODIGO');
  Try
    EPreco.Clear;
  Except
  End;
  Try
    EBonificacao.Clear;
  Except
  End;
  Try
    EFrete.Clear;
  Except
  End;
  Try
    EIPI.Clear;
  Except
  End;
  Try
    EICM.Clear;
  Except
  End;
  Try
    EEntrega.Clear;
  Except
  End;
  try
    EPagamento.Clear;
  Except
  End;
  try
    EQuantidade.Clear;
  Except
  End;
  try
    EProduto.Clear;
  Except
  End;
  try
    EFornecedor.Clear;
  Except
  End;
  try
    EDescontos.Clear;
  Except
  End;
  try
    EVPC.Clear;
  Except
  End;
  try
    EAcFin.Clear;
  Except
  End;
  AtualizaControles(True);
  Estado:=1;
end;

function TItem_de_Cotacao.deletarauto:Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  try
    Result := Delete;
  Except
    Result:=False;
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
