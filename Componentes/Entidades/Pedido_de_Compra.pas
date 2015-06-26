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
unit Pedido_de_Compra;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Fornecedor, Configuracao, Titulo_a_Pagar, 
     Funcoes, Extctrls, Forma_de_Pagamento, Variants;

type
  TPedido_de_Compra = class(TSQuery)
    private
      { Private fields of TPedido_de_Compra }
        { Storage for property ArquivoGerado }
        FArquivoGerado : Integer;
        { Storage for property BaseCalculo }
        FBaseCalculo : Double;
        { Storage for property BaseCalculoSub }
        FBaseCalculoSub : Double;
        { Storage for property CForma_de_Pagamento }
        FCForma_de_Pagamento : TForma_de_Pagamento;
        { Storage for property CNCEntrega }
        FCNCEntrega : Integer;
        { Storage for property CTitulo_a_Pagar }
        FCTitulo_a_Pagar : TTitulo_a_Pagar;
        { Storage for property CodigoCNT }
        FCodigoCNT : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoFPE }
        FCodigoFPE : Integer;
        { Storage for property CodigoFPG }
        FCodigoFPG : Integer;
        { Storage for property CodigoFPGTRN }
        FCodigoFPGTRN : Integer;
        { Storage for property CodigoOPF }
        FCodigoOPF : Integer;
        { Storage for property CodigoPCP }
        FCodigoPCP : Integer;
        { Storage for property CodigoTPG }
        FCodigoTPG : Integer;
        { Storage for property CodigoTRN }
        FCodigoTRN : Integer;
        { Storage for property Conhecimento }
        FConhecimento : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : Tdatetime;
        { Storage for property DataEmissao }
        FDataEmissao : TDateTime;
        { Storage for property DataEntrega }
        FDataEntrega : Tdatetime;
        { Storage for property DataSaida }
        FDataSaida : TDateTime;
        { Storage for property Documento }
        FDocumento : String;
        { Storage for property EBaseCalculo }
        FEBaseCalculo : TEdit;
        { Storage for property EBaseCalculoSub }
        FEBaseCalculoSub : TEdit;
        { Storage for property ECNCEntrega }
        FECNCEntrega : TDBLookupComboBox;
        { Storage for property ECodigoCNT }
        FECodigoCNT : TDBLookupComboBox;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TDBLookupComboBox;
        { Storage for property ECodigoFPG }
        FECodigoFPG : TDBLookupComboBox;
        { Storage for property ECodigoFPGTRN }
        FECodigoFPGTRN : TDBLookupComboBox;
        { Storage for property ECodigoOPF }
        FECodigoOPF : TDBLookupComboBox;
        { Storage for property ECodigoPCP }
        FECodigoPCP : TEdit;
        { Storage for property ECodigoTPG }
        FECodigoTPG : TDBLookupCombobox;
        { Storage for property ECodigoTRN }
        FECodigoTRN : TDBLookupComboBox;
        { Storage for property EConhecimento }
        FEConhecimento : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataEmissao }
        FEDataEmissao : TMaskEdit;
        { Storage for property EDataEntrega }
        FEDataEntrega : TMaskedit;
        { Storage for property EDataSaida }
        FEDataSaida : TMaskEdit;
        { Storage for property EDocumento }
        FEDocumento : TEdit;
        { Storage for property EFrete }
        FEFrete : TEdit;
        { Storage for property EFreteNota }
        FEFreteNota : TCheckBox;
        { Storage for property EICMS }
        FEICMS : TEdit;
        { Storage for property EICMSFrete }
        FEICMSFrete : TEdit;
        { Storage for property EICMSSub }
        FEICMSSub : TEdit;
        { Storage for property ELJ4 }
        FELJ4 : TCheckBox;
        { Storage for property ENotaFiscal }
        FENotaFiscal : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property EPercentualCusto }
        FEPercentualCusto : TEdit;
        { Storage for property EPercentualVenda }
        FEPercentualVenda : TEdit;
        { Storage for property ESN }
        FESN : TCheckbox;
        { Storage for property ESelo }
        FESelo : TEdit;
        { Storage for property ESerie }
        FESerie : TEdit;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property ESubSerie }
        FESubSerie : TEdit;
        { Storage for property ETipoFrete }
        FETipoFrete : TRadioGroup;
        { Storage for property ETotalFinal }
        FETotalFinal : TEdit;
        { Storage for property ETotalIPI }
        FETotalIPI : TEdit;
        { Storage for property ETotalNota }
        FETotalNota : TEdit;
        { Storage for property ETotalProduto }
        FETotalProduto : TEdit;
        { Storage for property EVPC }
        FEVPC : TEdit;
        { Storage for property Fabricar }
        FFabricar : Boolean;
        { Storage for property Frete }
        FFrete : Double;
        { Storage for property FreteNota }
        FFreteNota : Boolean;
        { Storage for property ICMS }
        FICMS : Double;
        { Storage for property ICMSFrete }
        FICMSFrete : Double;
        { Storage for property ICMSSub }
        FICMSSub : Double;
        { Storage for property LJ4 }
        FLJ4 : Boolean;
        { Storage for property NotaFiscal }
        FNotaFiscal : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property PercentualCusto }
        FPercentualCusto : Double;
        { Storage for property PercentualVenda }
        FPercentualVenda : Double;
        { Storage for property PrecoFinalDefinido }
        FPrecoFinalDefinido : Boolean;
        { Storage for property SN }
        FSN : Boolean;
        { Storage for property Selo }
        FSelo : Integer;
        { Storage for property Serie }
        FSerie : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property SubSerie }
        FSubSerie : String;
        { Storage for property TipoFrete }
        FTipoFrete : Integer;
        { Storage for property TotalFinal }
        FTotalFinal : Double;
        { Storage for property TotalIPI }
        FTotalIPI : Double;
        { Storage for property TotalNota }
        FTotalNota : Double;
        { Storage for property TotalProduto }
        FTotalProduto : Double;
        { Storage for property VPC }
        FVPC : Double;

      { Private methods of TPedido_de_Compra }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property ArquivoGerado }
        function GetArquivoGerado : Integer;
        { Write method for property ArquivoGerado }
        procedure SetArquivoGerado(Value : Integer);
        { Read method for property BaseCalculo }
        function GetBaseCalculo : Double;
        { Write method for property BaseCalculo }
        procedure SetBaseCalculo(Value : Double);
        { Read method for property BaseCalculoSub }
        function GetBaseCalculoSub : Double;
        { Write method for property BaseCalculoSub }
        procedure SetBaseCalculoSub(Value : Double);
        { Read method for property CNCEntrega }
        function GetCNCEntrega : Integer;
        { Write method for property CNCEntrega }
        procedure SetCNCEntrega(Value : Integer);
        { Read method for property CodigoCNT }
        function GetCodigoCNT : Integer;
        { Write method for property CodigoCNT }
        procedure SetCodigoCNT(Value : Integer);
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Write method for property CodigoFOR }
        procedure SetCodigoFOR(Value : Integer);
        { Read method for property CodigoFPE }
        function GetCodigoFPE : Integer;
        { Read method for property CodigoFPG }
        function GetCodigoFPG : Integer;
        { Write method for property CodigoFPG }
        procedure SetCodigoFPG(Value : Integer);
        { Read method for property CodigoFPGTRN }
        function GetCodigoFPGTRN : Integer;
        { Write method for property CodigoFPGTRN }
        procedure SetCodigoFPGTRN(Value : Integer);
        { Read method for property CodigoOPF }
        function GetCodigoOPF : Integer;
        { Write method for property CodigoOPF }
        procedure SetCodigoOPF(Value : Integer);
        { Read method for property CodigoPCP }
        function GetCodigoPCP : Integer;
        { Write method for property CodigoPCP }
        procedure SetCodigoPCP(Value : Integer);
        { Read method for property CodigoTPG }
        function GetCodigoTPG : Integer;
        { Write method for property CodigoTPG }
        procedure SetCodigoTPG(Value : Integer);
        { Read method for property CodigoTRN }
        function GetCodigoTRN : Integer;
        { Write method for property CodigoTRN }
        procedure SetCodigoTRN(Value : Integer);
        { Read method for property Conhecimento }
        function GetConhecimento : Integer;
        { Write method for property Conhecimento }
        procedure SetConhecimento(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : Tdatetime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : Tdatetime);
        { Read method for property DataEmissao }
        function GetDataEmissao : TDateTime;
        { Write method for property DataEmissao }
        procedure SetDataEmissao(Value : TDateTime);
        { Read method for property DataEntrega }
        function GetDataEntrega : Tdatetime;
        { Write method for property DataEntrega }
        procedure SetDataEntrega(Value : Tdatetime);
        { Read method for property DataSaida }
        function GetDataSaida : TDateTime;
        { Write method for property DataSaida }
        procedure SetDataSaida(Value : TDateTime);
        { Read method for property Documento }
        function GetDocumento : String;
        { Write method for property Documento }
        procedure SetDocumento(Value : String);
        { Read method for property Fabricar }
        function GetFabricar : Boolean;
        { Write method for property Fabricar }
        procedure SetFabricar(Value : Boolean);
        { Read method for property Frete }
        function GetFrete : Double;
        { Write method for property Frete }
        procedure SetFrete(Value : Double);
        { Read method for property FreteNota }
        function GetFreteNota : Boolean;
        { Write method for property FreteNota }
        procedure SetFreteNota(Value : Boolean);
        { Read method for property ICMS }
        function GetICMS : Double;
        { Write method for property ICMS }
        procedure SetICMS(Value : Double);
        { Read method for property ICMSFrete }
        function GetICMSFrete : Double;
        { Write method for property ICMSFrete }
        procedure SetICMSFrete(Value : Double);
        { Read method for property ICMSSub }
        function GetICMSSub : Double;
        { Write method for property ICMSSub }
        procedure SetICMSSub(Value : Double);
        { Read method for property LJ4 }
        function GetLJ4 : Boolean;
        { Write method for property LJ4 }
        procedure SetLJ4(Value : Boolean);
        { Read method for property NotaFiscal }
        function GetNotaFiscal : Integer;
        { Write method for property NotaFiscal }
        procedure SetNotaFiscal(Value : Integer);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property PercentualCusto }
        function GetPercentualCusto : Double;
        { Write method for property PercentualCusto }
        procedure SetPercentualCusto(Value : Double);
        { Read method for property PercentualVenda }
        function GetPercentualVenda : Double;
        { Write method for property PercentualVenda }
        procedure SetPercentualVenda(Value : Double);
        { Read method for property PrecoFinalDefinido }
        function GetPrecoFinalDefinido : Boolean;
        { Write method for property PrecoFinalDefinido }
        procedure SetPrecoFinalDefinido(Value : Boolean);
        { Read method for property SN }
        function GetSN : Boolean;
        { Write method for property SN }
        procedure SetSN(Value : Boolean);
        { Read method for property Selo }
        function GetSelo : Integer;
        { Write method for property Selo }
        procedure SetSelo(Value : Integer);
        { Read method for property Serie }
        function GetSerie : String;
        { Write method for property Serie }
        procedure SetSerie(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property SubSerie }
        function GetSubSerie : String;
        { Write method for property SubSerie }
        procedure SetSubSerie(Value : String);
        { Read method for property TipoFrete }
        function GetTipoFrete : Integer;
        { Write method for property TipoFrete }
        procedure SetTipoFrete(Value : Integer);
        { Read method for property TotalFinal }
        function GetTotalFinal : Double;
        { Write method for property TotalFinal }
        procedure SetTotalFinal(Value : Double);
        { Read method for property TotalIPI }
        function GetTotalIPI : Double;
        { Write method for property TotalIPI }
        procedure SetTotalIPI(Value : Double);
        { Read method for property TotalNota }
        function GetTotalNota : Double;
        { Write method for property TotalNota }
        procedure SetTotalNota(Value : Double);
        { Read method for property TotalProduto }
        function GetTotalProduto : Double;
        { Write method for property TotalProduto }
        procedure SetTotalProduto(Value : Double);
        { Read method for property VPC }
        function GetVPC : Double;
        { Write method for property VPC }
        procedure SetVPC(Value : Double);

    protected
      { Protected fields of TPedido_de_Compra }

      { Protected methods of TPedido_de_Compra }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TPedido_de_Compra }
        CdCNT : Integer;

      { Public methods of TPedido_de_Compra }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdPCP:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function GerarTitulos(vValorFinal,vFretePercentual:Double;PPendentes:Boolean):Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Inventário }
        function LocalizarCod(CdPCP, CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TPedido_de_Compra }
        property ArquivoGerado : Integer
             read GetArquivoGerado write SetArquivoGerado;
        property BaseCalculo : Double read GetBaseCalculo write SetBaseCalculo;
        property BaseCalculoSub : Double
             read GetBaseCalculoSub write SetBaseCalculoSub;
        property CForma_de_Pagamento : TForma_de_Pagamento
             read FCForma_de_Pagamento write FCForma_de_Pagamento;
        property CNCEntrega : Integer read GetCNCEntrega write SetCNCEntrega;
        property CTitulo_a_Pagar : TTitulo_a_Pagar
             read FCTitulo_a_Pagar write FCTitulo_a_Pagar;
        property CodigoCNT : Integer read GetCodigoCNT write SetCodigoCNT;
        { Código do Abastecimento }
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        property CodigoFPE : Integer read GetCodigoFPE write FCodigoFPE;
        property CodigoFPG : Integer read GetCodigoFPG write SetCodigoFPG;
        property CodigoFPGTRN : Integer
             read GetCodigoFPGTRN write SetCodigoFPGTRN;
        property CodigoOPF : Integer read GetCodigoOPF write SetCodigoOPF;
        property CodigoPCP : Integer read GetCodigoPCP write SetCodigoPCP;
        property CodigoTPG : Integer read GetCodigoTPG write SetCodigoTPG;
        property CodigoTRN : Integer read GetCodigoTRN write SetCodigoTRN;
        property Conhecimento : Integer
             read GetConhecimento write SetConhecimento;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : Tdatetime
             read GetDataCadastro write SetDataCadastro;
        property DataEmissao : TDateTime
             read GetDataEmissao write SetDataEmissao;
        property DataEntrega : Tdatetime
             read GetDataEntrega write SetDataEntrega;
        property DataSaida : TDateTime read GetDataSaida write SetDataSaida;
        property Documento : String read GetDocumento write SetDocumento;
        property EBaseCalculo : TEdit read FEBaseCalculo write FEBaseCalculo;
        property EBaseCalculoSub : TEdit
             read FEBaseCalculoSub write FEBaseCalculoSub;
        property ECNCEntrega : TDBLookupComboBox
             read FECNCEntrega write FECNCEntrega;
        property ECodigoCNT : TDBLookupComboBox
             read FECodigoCNT write FECodigoCNT;
        property ECodigoFOR : TDBLookupComboBox
             read FECodigoFOR write FECodigoFOR;
        property ECodigoFPG : TDBLookupComboBox
             read FECodigoFPG write FECodigoFPG;
        property ECodigoFPGTRN : TDBLookupComboBox
             read FECodigoFPGTRN write FECodigoFPGTRN;
        property ECodigoOPF : TDBLookupComboBox
             read FECodigoOPF write FECodigoOPF;
        property ECodigoPCP : TEdit read FECodigoPCP write FECodigoPCP;
        property ECodigoTPG : TDBLookupCombobox
             read FECodigoTPG write FECodigoTPG;
        property ECodigoTRN : TDBLookupComboBox
             read FECodigoTRN write FECodigoTRN;
        property EConhecimento : TEdit
             read FEConhecimento write FEConhecimento;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataEmissao : TMaskEdit
             read FEDataEmissao write FEDataEmissao;
        property EDataEntrega : TMaskedit
             read FEDataEntrega write FEDataEntrega;
        property EDataSaida : TMaskEdit read FEDataSaida write FEDataSaida;
        property EDocumento : TEdit read FEDocumento write FEDocumento;
        property EFrete : TEdit read FEFrete write FEFrete;
        property EFreteNota : TCheckBox read FEFreteNota write FEFreteNota;
        property EICMS : TEdit read FEICMS write FEICMS;
        property EICMSFrete : TEdit read FEICMSFrete write FEICMSFrete;
        property EICMSSub : TEdit read FEICMSSub write FEICMSSub;
        property ELJ4 : TCheckBox read FELJ4 write FELJ4;
        property ENotaFiscal : TEdit read FENotaFiscal write FENotaFiscal;
        property EOBS : TMemo read FEOBS write FEOBS;
        property EPercentualCusto : TEdit
             read FEPercentualCusto write FEPercentualCusto;
        property EPercentualVenda : TEdit
             read FEPercentualVenda write FEPercentualVenda;
        property ESN : TCheckbox read FESN write FESN;
        property ESelo : TEdit read FESelo write FESelo;
        property ESerie : TEdit read FESerie write FESerie;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property ESubSerie : TEdit read FESubSerie write FESubSerie;
        property ETipoFrete : TRadioGroup read FETipoFrete write FETipoFrete;
        property ETotalFinal : TEdit read FETotalFinal write FETotalFinal;
        property ETotalIPI : TEdit read FETotalIPI write FETotalIPI;
        property ETotalNota : TEdit read FETotalNota write FETotalNota;
        property ETotalProduto : TEdit
             read FETotalProduto write FETotalProduto;
        property EVPC : TEdit read FEVPC write FEVPC;
        property Fabricar : Boolean read GetFabricar write SetFabricar;
        property Frete : Double read GetFrete write SetFrete;
        property FreteNota : Boolean read GetFreteNota write SetFreteNota;
        property ICMS : Double read GetICMS write SetICMS;
        property ICMSFrete : Double read GetICMSFrete write SetICMSFrete;
        property ICMSSub : Double read GetICMSSub write SetICMSSub;
        property LJ4 : Boolean read GetLJ4 write SetLJ4;
        property NotaFiscal : Integer read GetNotaFiscal write SetNotaFiscal;
        property OBS : String read GetOBS write SetOBS;
        property PercentualCusto : Double
             read GetPercentualCusto write SetPercentualCusto;
        property PercentualVenda : Double
             read GetPercentualVenda write SetPercentualVenda;
        property PrecoFinalDefinido : Boolean
             read GetPrecoFinalDefinido write SetPrecoFinalDefinido;
        property SN : Boolean read GetSN write SetSN;
        property Selo : Integer read GetSelo write SetSelo;
        property Serie : String read GetSerie write SetSerie;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property SubSerie : String read GetSubSerie write SetSubSerie;
        property TipoFrete : Integer read GetTipoFrete write SetTipoFrete;
        property TotalFinal : Double read GetTotalFinal write SetTotalFinal;
        property TotalIPI : Double read GetTotalIPI write SetTotalIPI;
        property TotalNota : Double read GetTotalNota write SetTotalNota;
        property TotalProduto : Double
             read GetTotalProduto write SetTotalProduto;
        property VPC : Double read GetVPC write SetVPC;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TPedido_de_Compra with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TPedido_de_Compra]);
end;

{ Method to set variable and property values and create objects }
procedure TPedido_de_Compra.AutoInitialize;
begin
     FEBaseCalculo := nil;
     FEBaseCalculoSub := nil;
     FECNCEntrega := nil;
     FECodigoCNT := nil;
     FECodigoFOR := nil;
     FECodigoFPG := nil;
     FECodigoFPGTRN := nil;
     FECodigoOPF := nil;
     FECodigoPCP := nil;
     FECodigoTPG := nil;
     FECodigoTRN := nil;
     FEConhecimento := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataEmissao := nil;
     FEDataEntrega := nil;
     FEDataSaida := nil;
     FEDocumento := nil;
     FEFrete := nil;
     FEFreteNota := nil;
     FEICMS := nil;
     FEICMSFrete := nil;
     FEICMSSub := nil;
     FELJ4 := nil;
     FENotaFiscal := nil;
     FEOBS := nil;
     FEPercentualCusto := nil;
     FEPercentualVenda := nil;
     FESN := nil;
     FESelo := nil;
     FESerie := nil;
     FESituacao := nil;
     FESubSerie := nil;
     FETipoFrete := nil;
     FETotalFinal := nil;
     FETotalIPI := nil;
     FETotalNota := nil;
     FETotalProduto := nil;
     FEVPC := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TPedido_de_Compra.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBaseCalculo then
        FEBaseCalculo := nil;
     if AComponent = FEBaseCalculoSub then
        FEBaseCalculoSub := nil;
     if AComponent = FECNCEntrega then
        FECNCEntrega := nil;
     if AComponent = FECodigoCNT then
        FECodigoCNT := nil;
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FECodigoFPG then
        FECodigoFPG := nil;
     if AComponent = FECodigoFPGTRN then
        FECodigoFPGTRN := nil;
     if AComponent = FECodigoOPF then
        FECodigoOPF := nil;
     if AComponent = FECodigoPCP then
        FECodigoPCP := nil;
     if AComponent = FECodigoTPG then
        FECodigoTPG := nil;
     if AComponent = FECodigoTRN then
        FECodigoTRN := nil;
     if AComponent = FEConhecimento then
        FEConhecimento := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataEmissao then
        FEDataEmissao := nil;
     if AComponent = FEDataEntrega then
        FEDataEntrega := nil;
     if AComponent = FEDataSaida then
        FEDataSaida := nil;
     if AComponent = FEDocumento then
        FEDocumento := nil;
     if AComponent = FEFrete then
        FEFrete := nil;
     if AComponent = FEFreteNota then
        FEFreteNota := nil;
     if AComponent = FEICMS then
        FEICMS := nil;
     if AComponent = FEICMSFrete then
        FEICMSFrete := nil;
     if AComponent = FEICMSSub then
        FEICMSSub := nil;
     if AComponent = FELJ4 then
        FELJ4 := nil;
     if AComponent = FENotaFiscal then
        FENotaFiscal := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEPercentualCusto then
        FEPercentualCusto := nil;
     if AComponent = FEPercentualVenda then
        FEPercentualVenda := nil;
     if AComponent = FESN then
        FESN := nil;
     if AComponent = FESelo then
        FESelo := nil;
     if AComponent = FESerie then
        FESerie := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FESubSerie then
        FESubSerie := nil;
     if AComponent = FETipoFrete then
        FETipoFrete := nil;
     if AComponent = FETotalFinal then
        FETotalFinal := nil;
     if AComponent = FETotalIPI then
        FETotalIPI := nil;
     if AComponent = FETotalNota then
        FETotalNota := nil;
     if AComponent = FETotalProduto then
        FETotalProduto := nil;
     if AComponent = FEVPC then
        FEVPC := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TPedido_de_Compra.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property ArquivoGerado }
function TPedido_de_Compra.GetArquivoGerado : Integer;
begin
  try
    Result := Self.fieldByName('PCP_ARQUIVO_GERADO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property ArquivoGerado }
procedure TPedido_de_Compra.SetArquivoGerado(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_ARQUIVO_GERADO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_ARQUIVO_GERADO"!');
    end;
end;

{ Read method for property BaseCalculo }
function TPedido_de_Compra.GetBaseCalculo : Double;
begin
  try
    Result := Self.fieldByName('PCP_BASE_CALCULO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property BaseCalculo }
procedure TPedido_de_Compra.SetBaseCalculo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_BASE_CALCULO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_BASE_CALCULO"!');
    end;
end;

{ Read method for property BaseCalculoSub }
function TPedido_de_Compra.GetBaseCalculoSub : Double;
begin
  try
    Result := Self.fieldByName('PCP_BASE_CALCULO_SUB').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property BaseCalculoSub }
procedure TPedido_de_Compra.SetBaseCalculoSub(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_BASE_CALCULO_SUB').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_BASE_CALCULO_SUB"!');
    end;
end;

{ Read method for property CNCEntrega }
function TPedido_de_Compra.GetCNCEntrega : Integer;
begin
  try
    Result := Self.fieldByName('CNC_ENTREGA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CNCEntrega }
procedure TPedido_de_Compra.SetCNCEntrega(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_ENTREGA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_ENTREGA"!');
    end;
end;

{ Read method for property CodigoCNT }
function TPedido_de_Compra.GetCodigoCNT : Integer;
begin
  try
    Result := Self.fieldByName('CNT_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCNT }
procedure TPedido_de_Compra.SetCodigoCNT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNT_CODIGO"!');
    end;
end;

{ Read method for property CodigoFOR }
function TPedido_de_Compra.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFOR }
procedure TPedido_de_Compra.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property CodigoFPE }
function TPedido_de_Compra.GetCodigoFPE : Integer;
begin
  try
    Result := Self.fieldByName('FPE_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoFPG }
function TPedido_de_Compra.GetCodigoFPG : Integer;
begin
  try
    Result := Self.fieldByName('FPG_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFPG }
procedure TPedido_de_Compra.SetCodigoFPG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CODIGO"!');
    end;
end;

{ Read method for property CodigoFPGTRN }
function TPedido_de_Compra.GetCodigoFPGTRN : Integer;
begin
  try
    Result := Self.fieldByName('FPG_CODIGO_TRN').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFPGTRN }
procedure TPedido_de_Compra.SetCodigoFPGTRN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_CODIGO_TRN').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CODIGO_TRN"!');
    end;
end;

{ Read method for property CodigoOPF }
function TPedido_de_Compra.GetCodigoOPF : Integer;
begin
  try
    Result := Self.fieldByName('OPF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoOPF }
procedure TPedido_de_Compra.SetCodigoOPF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('OPF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "OPF_CODIGO"!');
    end;
end;

{ Read method for property CodigoPCP }
function TPedido_de_Compra.GetCodigoPCP : Integer;
begin
  try
    Result := Self.fieldByName('PCP_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoPCP }
procedure TPedido_de_Compra.SetCodigoPCP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_CODIGO"!');
    end;
end;

{ Read method for property CodigoTPG }
function TPedido_de_Compra.GetCodigoTPG : Integer;
begin
  try
    Result := Self.fieldByName('TPG_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTPG }
procedure TPedido_de_Compra.SetCodigoTPG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TPG_CODIGO"!');
    end;
end;

{ Read method for property CodigoTRN }
function TPedido_de_Compra.GetCodigoTRN : Integer;
begin
  try
    Result := Self.fieldByName('TRN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoTRN }
procedure TPedido_de_Compra.SetCodigoTRN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRN_CODIGO"!');
    end;
end;

{ Read method for property Conhecimento }
function TPedido_de_Compra.GetConhecimento : Integer;
begin
  try
    Result := Self.fieldByName('PCP_CONHECIMENTO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Conhecimento }
procedure TPedido_de_Compra.SetConhecimento(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_CONHECIMENTO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_CONHECIMENTO"!');
    end;
end;

{ Read method for property DataAlterado }
function TPedido_de_Compra.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('PCP_DT_ALTERADO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataAlterado }
procedure TPedido_de_Compra.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TPedido_de_Compra.GetDataCadastro : Tdatetime;
begin
  try
    Result := Self.fieldByName('PCP_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TPedido_de_Compra.SetDataCadastro(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCP_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCP_DT_CADASTRO"!');
  end;
end;

{ Read method for property DataEmissao }
function TPedido_de_Compra.GetDataEmissao : TDateTime;
begin
  try
    Result := Self.fieldByName('PCP_DT_EMISSAO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataEmissao }
procedure TPedido_de_Compra.SetDataEmissao(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_DT_EMISSAO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_DT_EMISSAO"!');
    end;
end;

{ Read method for property DataEntrega }
function TPedido_de_Compra.GetDataEntrega : Tdatetime;
begin
  try
    Result := Self.fieldByName('PCP_DT_ENTREGA').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataEntrega }
procedure TPedido_de_Compra.SetDataEntrega(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_DT_ENTREGA').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_DT_ENTREGA"!');
    end;
end;

{ Read method for property DataSaida }
function TPedido_de_Compra.GetDataSaida : TDateTime;
begin
  try
    Result := Self.fieldByName('PCP_DT_SAIDA').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataSaida }
procedure TPedido_de_Compra.SetDataSaida(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_DT_SAIDA').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_DT_SAIDA"!');
    end;
end;

{ Read method for property Documento }
function TPedido_de_Compra.GetDocumento : String;
begin
  try
    Result := Self.fieldByName('PCP_DOCUMENTO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Documento }
procedure TPedido_de_Compra.SetDocumento(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_DOCUMENTO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_DOCUMENTO"!');
    end;
end;

{ Read method for property Fabricar }
function TPedido_de_Compra.GetFabricar : Boolean;
begin
  try
    Result := (Self.fieldByName('PCP_FABRICAR').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property Fabricar }
procedure TPedido_de_Compra.SetFabricar(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('PCP_FABRICAR').asInteger := 1
      else
        Self.fieldByName('PCP_FABRICAR').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_FABRICAR"!');
    end;
end;

{ Read method for property Frete }
function TPedido_de_Compra.GetFrete : Double;
begin
  try
    Result := Self.fieldByName('PCP_FRETE').asFloat;
  except
    result:= 0
  end;
end;


{ Write method for property Frete }
procedure TPedido_de_Compra.SetFrete(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_FRETE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_FRETE"!');
    end;
end;

{ Read method for property FreteNota }
function TPedido_de_Compra.GetFreteNota : Boolean;
begin
  try
    Result := (Self.fieldByName('PCP_FRETE_NOTA').asInteger = 1);
  except
    result:= False;
  end;
end;

{ Write method for property FreteNota }
procedure TPedido_de_Compra.SetFreteNota(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('PCP_FRETE_NOTA').asInteger := 1
      else
        Self.fieldByName('PCP_FRETE_NOTA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_FRETE_NOTA"!');
    end;
end;

{ Read method for property ICMS }
function TPedido_de_Compra.GetICMS : Double;
begin
  try
    Result := Self.fieldByName('PCP_ICMS').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ICMS }
procedure TPedido_de_Compra.SetICMS(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_ICMS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_ICMS"!');
    end;
end;

{ Read method for property ICMSFrete }
function TPedido_de_Compra.GetICMSFrete : Double;
begin
  try
    Result := Self.fieldByName('PCP_ICMS_FRETE').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ICMSFrete }
procedure TPedido_de_Compra.SetICMSFrete(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_ICMS_FRETE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_ICMS_FRETE"!');
    end;
end;

{ Read method for property ICMSSub }
function TPedido_de_Compra.GetICMSSub : Double;
begin
  try
    Result := Self.fieldByName('PCP_ICMS_SUB').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ICMSSub }
procedure TPedido_de_Compra.SetICMSSub(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_ICMS_SUB').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_ICMS_SUB"!');
    end;
end;

{ Read method for property LJ4 }
function TPedido_de_Compra.GetLJ4 : Boolean;
begin
  try
    result := (Self.fieldByName('PCP_LJ4').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property LJ4 }
procedure TPedido_de_Compra.SetLJ4(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('PCP_LJ4').asInteger := 1
      else
        Self.fieldByName('PCP_LJ4').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_LJ4"!');
    end;
end;

{ Read method for property NotaFiscal }
function TPedido_de_Compra.GetNotaFiscal : Integer;
begin
  try
    Result := Self.fieldByName('PCP_NOTA_FISCAL').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property NotaFiscal }
procedure TPedido_de_Compra.SetNotaFiscal(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_NOTA_FISCAL').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_NOTA_FISCAL"!');
    end;
end;

{ Read method for property OBS }
function TPedido_de_Compra.GetOBS : String;
begin
  try
    Result := Self.fieldByName('PCP_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TPedido_de_Compra.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCP_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCP_OBSERVACAO"!');
  end;
end;

{ Read method for property PercentualCusto }
function TPedido_de_Compra.GetPercentualCusto : Double;
begin
  try
    Result := Self.fieldByName('PCP_PERCENTUAL_CUSTO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PercentualCusto }
procedure TPedido_de_Compra.SetPercentualCusto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_PERCENTUAL_CUSTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_PERCENTUAL_CUSTO"!');
    end;
end;

{ Read method for property PercentualVenda }
function TPedido_de_Compra.GetPercentualVenda : Double;
begin
  try
    Result := Self.fieldByName('PCP_PERCENTUAL_VENDA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PercentualVenda }
procedure TPedido_de_Compra.SetPercentualVenda(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_PERCENTUAL_VENDA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_PERCENTUAL_VENDA"!');
    end;
end;

{ Read method for property PrecoFinalDefinido }
function TPedido_de_Compra.GetPrecoFinalDefinido : Boolean;
begin
  try
    result := (Self.fieldByName('PCP_PRECO_FINAL_DEFINIDO').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property PrecoFinalDefinido }
procedure TPedido_de_Compra.SetPrecoFinalDefinido(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('PCP_PRECO_FINAL_DEFINIDO').asInteger := 1
      else
        Self.fieldByName('PCP_PRECO_FINAL_DEFINIDO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_PRECO_FINAL_DEFINIDO"!');
    end;
end;

{ Read method for property SN }
function TPedido_de_Compra.GetSN : Boolean;
begin
  try
    result := (Self.fieldByName('PCP_SN').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property SN }
procedure TPedido_de_Compra.SetSN(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('PCP_SN').asInteger := 1
      else
        Self.fieldByName('PCP_SN').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_SN"!');
    end;
end;

{ Read method for property Selo }
function TPedido_de_Compra.GetSelo : Integer;
begin
  try
    Result := Self.fieldByName('PCP_SELO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Selo }
procedure TPedido_de_Compra.SetSelo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_SELO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_SELO"!');
    end;
end;

{ Read method for property Serie }
function TPedido_de_Compra.GetSerie : String;
begin
  try
    Result := Self.fieldByName('PCP_SERIE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Serie }
procedure TPedido_de_Compra.SetSerie(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCP_SERIE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCP_SERIE"!');
  end;
end;

{ Read method for property Situacao }
function TPedido_de_Compra.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('PCP_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TPedido_de_Compra.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_SITUACAO"!');
    end;
end;

{ Read method for property SubSerie }
function TPedido_de_Compra.GetSubSerie : String;
begin
  try
    Result := Self.fieldByName('PCP_SUBSERIE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property SubSerie }
procedure TPedido_de_Compra.SetSubSerie(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PCP_SUBSERIE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PCP_SUBSERIE"!');
  end;
end;

{ Read method for property TipoFrete }
function TPedido_de_Compra.GetTipoFrete : Integer;
begin
  try
    Result := Self.fieldByName('PCP_TIPO_FRETE').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoFrete }
procedure TPedido_de_Compra.SetTipoFrete(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_TIPO_FRETE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_TIPO_FRETE"!');
    end;
end;

{ Read method for property TotalFinal }
function TPedido_de_Compra.GetTotalFinal : Double;
begin
  try
    Result := Self.fieldByName('PCP_TOTAL_FINAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TotalFinal }
procedure TPedido_de_Compra.SetTotalFinal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_TOTAL_FINAL').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_TOTAL_FINAL"!');
    end;
end;

{ Read method for property TotalIPI }
function TPedido_de_Compra.GetTotalIPI : Double;
begin
  try
    Result := Self.fieldByName('PCP_TOTAL_IPI').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property TotalIPI }
procedure TPedido_de_Compra.SetTotalIPI(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_TOTAL_IPI').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_TOTAL_IPI"!');
    end;
end;

{ Read method for property TotalNota }
function TPedido_de_Compra.GetTotalNota : Double;
begin
  try
    Result := Self.fieldByName('PCP_TOTAL_NOTA').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property TotalNota }
procedure TPedido_de_Compra.SetTotalNota(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_TOTAL_NOTA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_TOTAL_NOTA"!');
    end;
end;

{ Read method for property TotalProduto }
function TPedido_de_Compra.GetTotalProduto : Double;
begin
  try
    Result := Self.fieldByName('PCP_TOTAL_PRODUTO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property TotalProduto }
procedure TPedido_de_Compra.SetTotalProduto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_TOTAL_PRODUTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_TOTAL_PRODUTO"!');
    end;
end;

{ Read method for property VPC }
function TPedido_de_Compra.GetVPC : Double;
begin
  try
    Result := Self.fieldByName('PCP_VPC').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property VPC }
procedure TPedido_de_Compra.SetVPC(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PCP_VPC').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PCP_VPC"!');
    end;
end;

function TPedido_de_Compra.AlterarAuto:Boolean;
begin
  Result:=False;
  If not localizarCod(CodigoPCP,CConfiguracao.CodigoCNC) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      try
        CodigoUSU    := CConfiguracao.CodigoUSU;
      except
      end;
      try
        CodigoOPF    := ECodigoOPF.KeyValue;
      except
      end;
      try
        CodigoFOR := ECodigoFOR.KeyValue;
      except
      end;
      try
        CodigoCNT := CdCNT;
      except
      end;
      try
        CodigoTRN := ECodigoTRN.KeyValue;
      except
      end;
      try
        CodigoFPG := ECodigoFPG.KeyValue;
      except
      end;
      try
        CodigoTPG := ECodigoTPG.KeyValue;
      except
      end;
      try
        CodigoFPGTRN := ECodigoFPGTRN.KeyValue;
      except
      end;
      try
        DataAlterado := CConfiguracao.DataHora;
      except
      end;
      try
        CNCEntrega := ECNCEntrega.KeyValue;
      except
      end;
      try
        NotaFiscal := StrToInt(ENotaFiscal.Text);
      except
      end;
      try
        Documento := EDocumento.Text;
      except
      end;
      try
        Serie := ESerie.Text;
      except
      end;
      try
        SubSerie := ESubSerie.Text;
      except
      end;
      try
        Selo := StrToInt(ESelo.Text);
      except
      end;
      try
        DataEmissao := StrToDate(EDataEmissao.Text);
      except
      end;
      try
        DataSaida := StrToDate(EDataSaida.Text);
      except
      end;
      try
        DataEntrega := StrToDate(EDataEntrega.Text);
      except
      end;
      try
        Conhecimento := StrToInt(EConhecimento.Text);
      except
      end;
      try
        Frete := StrToFloat(EFrete.Text);
      except
      end;
      try
        BaseCalculo := StrToFloat(EBaseCalculo.Text);
      except
      end;
      try
        BaseCalculoSub := StrToFloat(EBaseCalculoSub.Text);
      except
      end;
      try
        ICMS := StrToFloat(EICMS.Text);
      except
      end;
      try
        ICMSSub := StrToFloat(EICMSSub.Text);
      except
      end;
      try
        TotalProduto := StrToFloat(ETotalProduto.Text);
      except
      end;
      try
        TotalIPI := StrToFloat(ETotalIPI.Text);
      except
      end;
      try
        TotalNota := StrToFloat(ETotalNota.Text);
      except
      end;
      try
        TotalFinal := StrToFloat(ETotalFinal.Text);
      except
      end;
      try
        VPC := StrToFloat(EVPC.Text);
      except
      end;
      try
        SN  := ESN.Checked;
      except
      end;
      try
        LJ4  := ELJ4.Checked;
      except
      end;
      try
        PercentualCusto := StrToFloat(EPercentualCusto.Text);
      except
      end;
      try
        PercentualVenda := StrToFloat(EPercentualVenda.Text);
      except
      end;
      try
        OBS := EOBS.Text;
      except
      end;
      try
        Post;
        Result:=True;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;

procedure TPedido_de_Compra.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled           :=not Habilitar;
  Except
  End;
  Try
    ECNCEntrega.Enabled       :=Habilitar;
  Except
  End;
  Try
    ENotaFiscal.Enabled       :=Habilitar;
  Except
  End;
  Try
    EDocumento.Enabled        :=Habilitar;
  Except
  End;
  Try
    ESerie.Enabled            :=Habilitar;
  Except
  End;
  Try
    ESubSerie.Enabled            :=Habilitar;
  Except
  End;
  Try
    ESelo.Enabled            :=Habilitar;
  Except
  End;
  Try
    EDataEntrega.Enabled      :=Habilitar;
  Except
  End;
  Try
    EDataEmissao.Enabled      :=Habilitar;
  Except
  End;
  Try
    EDataSaida.Enabled        :=Habilitar;
  Except
  End;
  Try
    ECodigoFPG.Enabled        :=Habilitar;
  Except
  End;
  Try
    ECodigoTPG.Enabled        :=Habilitar;
  Except
  End;
  Try
    ECodigoFOR.Enabled        :=Habilitar;
  Except
  End;
  Try
    ECodigoTRN.Enabled        :=Habilitar;
  Except
  End;

  if (CConfiguracao.Empresa = empLuciano) then
  begin
    Try
      EICMS.Enabled             :=Habilitar;
    Except
    End;
    Try
      ETotalIPI.Enabled         :=Habilitar;
    Except
    End;
  end;

  Try
    EVPC.Enabled              :=Habilitar;
  Except
  End;
  try
    ESN.Enabled               :=Habilitar;
  except
  end;
  try
    ELJ4.Enabled               :=Habilitar;
  except
  end;
  try
    EPercentualCusto.Enabled   := Habilitar;
  except
  end;
  try
    EPercentualVenda.Enabled   := Habilitar;
  except
  end;
  Try
    EOBS.Enabled              :=Habilitar;
  Except
  End;
end;

procedure TPedido_de_Compra.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TPedido_de_Compra.CarregaDados;
begin
  Try
   If not IsEmpty then
     Case Situacao of
      0: ESituacao.Text   :='Em Andamento';
      1: ESituacao.Text   :='Cancelado';
      2: ESituacao.Text   :='Processado';
     End;
  Except
  End;
  Try
    ECodigoPCP.Text        :=IntToStr(CodigoPCP);
  Except
  End;
  Try
    ECodigoOPF.KeyValue      :=CodigoOPF;
  Except
  End;
  Try
    ENotaFiscal.Text      :=IntToStr(NotaFiscal);
  Except
  End;
  Try
    EDocumento.Text        :=Documento;
  Except
  End;
  Try
    ESerie.Text           :=Serie;
  Except
  End;
  Try
    ESubSerie.Text           :=SubSerie;
  Except
  End;
  Try
    ESelo.Text           :=IntToStr(Selo);
  Except
  End;
  Try
    ECodigoFPG.KeyValue   :=CodigoFPG;
  Except
  End;
  Try
    ECodigoTPG.KeyValue   :=CodigoTPG;
  Except
  End;
  Try
    ECodigoFPGTRN.KeyValue   :=CodigoFPGTRN;
  Except
  End;
  Try
    ECodigoFOR.KeyValue   :=CodigoFOR;
  Except
  End;
  Try
    ECodigoTRN.KeyValue   :=CodigoTRN;
  Except
  End;
  Try
    CdCNT   :=CodigoCNT;
  Except
  End;
  Try
   If DataCadastro<>0 then
     EDataCadastro.Text   :=FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro)
   else
     EDataCadastro.Text   :='';
  Except
  End;
  Try
   If DataAlterado<>0 then
     EDataAlterado.Text   :=FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado)
   else
     EDataAlterado.Text   :='';
  Except
  End;
  Try
    If DataEmissao<>0 then
     EDataEmissao.Text    :=FormatDateTime('dd/mm/yyyy', dataEmissao)
    else
     EDataEmissao.Text    :='';
  Except
  End;
  Try
    If DataSaida<>0 then
     EDataSaida.Text      :=FormatDateTime('dd/mm/yyyy', dataSaida)
    else
     EDataSaida.Text      :='';
  Except
  End;
  Try
    if DataEntrega=0 then
      EDataEntrega.Text:=''
    else
      EDataEntrega.Text   :=FormatDateTime('dd/mm/yyyy', DataEntrega);
  Except
  End;
  Try
    ECNCEntrega.KeyValue  :=CNCEntrega;
  Except
  End;
  Try
    EICMS.Text            :=Format('%.2f', [ICMS]);
  Except
  End;
  Try
    EICMSSub.Text         :=Format('%.2f', [ICMSSub]);
  Except
  End;
  Try
    EICMSFrete.Text       :=Format('%.4f', [ICMSFrete]);
  Except
  End;
  Try
    EConhecimento.Text    :=IntToStr(Conhecimento);
  Except
  End;
  Try
    EBaseCalculo.Text     :=Format('%.2f', [BaseCalculo]);
  Except
  End;
  Try
    EBaseCalculoSub.Text  :=Format('%.2f', [BaseCalculoSub]);
  Except
  End;
  Try
    ETotalProduto.Text  :=Format('%.2f', [TotalProduto]);
  Except
  End;
  Try
    ETotalIPI.Text  :=Format('%.2f', [TotalIPI]);
  Except
  End;
  Try
    ETotalNota.Text  :=Format('%.2f', [TotalNota]);
  Except
  End;
  Try
    ETotalFinal.Text  :=Format('%.2f', [TotalFinal]);
  Except
  End;
  Try
    EVPC.Text        :=Format('%.2f', [VPC]);
  Except
  End;
  Try
    EFrete.Text           :=Format('%.4f', [Frete]);
  Except
  End;
  try
    EFreteNota.Checked           := FreteNota;
  except
  end;
  try
    ESN.Checked           := SN;
  except
  end;
  try
    ELJ4.Checked           := LJ4;
  except
  end;
  Try
    EPercentualCusto.Text  :=Format('%.4f', [PercentualCusto]);
  Except
  End;
  Try
    EPercentualVenda.Text  :=Format('%.4f', [PercentualVenda]);
  Except
  End;
  Try
    EOBS.Text             :=OBS;
  Except
  End;
end;

constructor TPedido_de_Compra.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'PEDIDO_DE_COMPRA';

     { Code to perform other tasks when the component is created }

end;

function TPedido_de_Compra.Deletar(CdCNC,CdPCP:Integer):Boolean;
var
  sNota: string;
begin
  Result := False;
  If not(localizarCod(CdPCP,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      sNota := IntToStr(NotaFiscal);
      if Delete then
      Begin
        Result := True;
        GeraLog(3680,CdCNC,CdPCP,'Nota Fiscal:'+sNota);
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TPedido_de_Compra.Destroy;
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

function TPedido_de_Compra.FinalizaEdicao:Boolean;
var
  cod:Integer;
  mensagem:string;
  aux:TDataSetNotifyEvent;
begin
  mensagem:='';
  if Trim(ENotaFiscal.Text) = '' then
    ENotaFiscal.Text := '0';
  if Trim(EVPC.Text) = '' then
    EVPC.Text := '0';
  if (ECodigoFOR.Text = '') then
    mensagem:= mensagem + 'Fornecedor inválido!'+#13;
  If not Verificadata(EDataEntrega.text) Then
    mensagem:=mensagem+'Data da entrega incorreta!'+#13;
  If not Verificadata(EDataEmissao.text) Then
    mensagem:=mensagem+'Data de Emissão incorreta!'+#13;
  If not Verificadata(EDataSaida.text) Then
    mensagem:=mensagem+'Data de Saída incorreta!'+#13;
  if not verificafloat(EBaseCalculo.text) then
    mensagem:= mensagem + 'Base de Cálculo digitada incorretamente!'+#13;
  if not verificafloat(EICMS.text) then
    mensagem:= mensagem + 'ICMS digitado incorretamente!'+#13;
  if not verificafloat(EBaseCalculoSub.text) then
    mensagem:= mensagem + 'Base de Cálculo Substituto digitada incorretamente!'+#13;
  if not verificafloat(EICMSSub.text) then
    mensagem:= mensagem + 'ICMS Substituto digitado incorretamente!'+#13;
  if not verificafloat(ETotalIPI.text) then
    mensagem:= mensagem + 'Total de IPI digitado incorretamente!'+#13;
  if not verificafloat(ETotalProduto.text) then
    mensagem:= mensagem + 'Total de Produto digitado incorretamente!'+#13;
  if not verificafloat(ETotalNota.text) then
    mensagem:= mensagem + 'Total da Nota digitado incorretamente!'+#13;
  if not verificafloat(ETotalFinal.text) then
    mensagem:= mensagem + 'Total Final digitado incorretamente!'+#13;
  if not verificafloatBranco(EVPC.text) then
    mensagem:= mensagem + 'VPC digitado incorretamente!'+#13;
  if not verificafloatBranco(EPercentualCusto.text) then
    mensagem:= mensagem + 'Percentual de Custo digitado incorretamente!'+#13;
  if not verificafloatBranco(EPercentualVenda.text) then
    mensagem:= mensagem + 'Percentual de Venda digitado incorretamente!'+#13;
  if ENotaFiscal.Text = '' then
    ENotaFiscal.Text := '0';
  if ESerie.Text = '' then
    ESerie.Text := '0';
  If mensagem <>'' Then
  Begin
    ShowMessage(mensagem);
    Result:=False;
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
        ParamByName('PCP_CODIGO').asInteger := SCodigo;
        open;
        Estado:=0;
        AtualizaControles(False);
        Result := True;
        CarregaDados;
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoPCP;
      if Alterarauto then
      Begin
        close;
        ParamByName('PCP_CODIGO').asInteger := Cod;
        open;
        Estado:=0;
        AtualizaControles(False);
        Result := True;
        CarregaDados;
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
  end;
end;

function TPedido_de_Compra.GerarTitulos(vValorFinal,vFretePercentual:Double;PPendentes:Boolean):Boolean;
Type
  TVetor=Array [1..100] of string;
const
  Letra : array [1..26] of string = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
Var
  Vetor: TVetor;
  dia, Seq:String;
  QtdTit,i,j,pos, CdCCX:Integer;
  Aux:TDataSetNotifyEvent;
  DataVencimento: TDateTime;
  CdCNC: integer;
Begin
  Result := False;
  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT CCX_CODIGO AS CONTA '+
      ' FROM FORNECEDOR '+
      ' WHERE FOR_CODIGO='+IntToStr(CodigoFOR);
    Open;
    CdCCX := FieldByName('CONTA').asInteger;
  end;
  Aux := AfterScroll;
  AfterScroll:=Nil;

  if (CConfiguracao.Empresa = empLuciano) and
     (CConfiguracao.CodigoCNC = 1) then //CPD
  Begin
    //Foi pedido esse controle no dia 24/05/2005
    //Todos os faturamentos de pendentes gerar títulos para o Laboratório
    if PPendentes then
      CdCNC := 3
    else
      CdCNC := 1;
  end
  else
  Begin
    try
      CdCNC := ECNCEntrega.KeyValue;
    except
      CdCNC := CNCEntrega;
    end;
  end;

  CForma_de_Pagamento.LocalizarCod(CodigoFPG);
  if vValorFinal<=0 then
    exit;

  QtdTit := CTitulo_a_pagar.QtdeTitulos(CForma_de_Pagamento.Prazo);

  For i:=1 to 100 do
    Vetor[i]:='';

  i:=1;
  pos:=1;
  j:=1;

  While i<Length(CForma_de_Pagamento.Prazo)+2 do
  Begin
    if (CForma_de_Pagamento.Prazo[i]=';') or (CForma_de_Pagamento.Prazo[i]='')then
    Begin
      dia:=Copy(CForma_de_Pagamento.Prazo,pos,i-pos);
      Vetor[j]:=dia;
      j:=j+1;
      pos:=i+1;
    End;

    i:=i+1;
  End;

  try
    DataVencimento := StrToDate(EDataEmissao.Text);
  except
    try
      DataVencimento := StrToDate(EDataEntrega.Text);
    except
      DataVencimento := CConfiguracao.Data;
    end;
  end;

  for i:=1 to QtdTit do
  Begin
    If i<=9 then
      Seq := '0'+IntToStr(i)
    Else
      Seq := IntToStr(i);
    try
      if NotaFiscal > 0 then
      Begin
        if CTitulo_a_pagar.Inserir(CdCNC,0,CodigoPCP,0,CdCCX,0,
            CodigoFOR,0,CodigoTPG(*CConfiguracao.TipoDocumento*),0,''(*OBS*),'',IntToStr(NotaFiscal)+Letra[i],
            DataVencimento+StrToInt(Vetor[i]),0(*DtPag*),0(*DtOri*),CConfiguracao.Data(*Competencia*),
            Arredonda(vValorFinal/QtdTit),0,CForma_de_Pagamento.Prazo,Seq,5(*TipoPagamento Cheque*),
            0(*TitAnt*),0(*TitOri*), False) then
          Result := True;
      end
      else if CConfiguracao.Empresa <> empLBM then
      Begin
        if CTitulo_a_pagar.Inserir(CdCNC,0,CodigoPCP,0,CdCCX,0,
            CodigoFOR,0,CodigoTPG(*CConfiguracao.TipoDocumento*),0,''(*OBS*),'',''(*Numero*),
            DataVencimento+StrToInt(Vetor[i]),0(*DtPag*),0(*DtOri*),CConfiguracao.Data(*Competencia*),
            Arredonda(vValorFinal/QtdTit),0,CForma_de_Pagamento.Prazo,Seq,5(*TipoPagamento Cheque*),
            0(*TitAnt*),0(*TitOri*), False) then
          Result := True;
      end
      else //LBM LJ3 ou LJ4
      Begin
        if CTitulo_a_pagar.Inserir(CdCNC,0,CodigoPCP,0,109,0,
            CodigoFOR,0,CodigoTPG(*CConfiguracao.TipoDocumento*),0,''(*OBS*),'',''(*Numero*),
            DataVencimento+StrToInt(Vetor[i]),0(*DtPag*),0(*DtOri*),CConfiguracao.Data(*Competencia*),
            Arredonda(vValorFinal/QtdTit),0,CForma_de_Pagamento.Prazo,Seq,5(*TipoPagamento Cheque*),
            0(*TitAnt*),0(*TitOri*), False) then
          Result := True;
      end;
    except
      Result := False;
    end;
  End;
  AfterScroll := Aux;
End;

function TPedido_de_Compra.InserirAuto:Boolean;
begin
  Result := False;
  if LocalizarCod(SCodigo,CConfiguracao.CodigoCNC) then
    ShowMessage('Código de Pedido de Compra já Cadastrado!')
  else
  Begin
    try
      append;
      try
         codigoCNC   := CConfiguracao.CodigoCNC;
      except
      end;
      try
         CNCOrigem   := CConfiguracao.CodigoCNC;
      except
      end;
      try
        CodigoPCP   := SCodigo;
      except
      end;
      try
        CodigoUSU    := CConfiguracao.CodigoUSU;
      except
      end;
      try
        CodigoOPF := ECodigoOPF.KeyValue;
      except
      end;
      try
        CodigoFOR := ECodigoFOR.KeyValue;
      except
      end;
      try
        CodigoCNT := 0;
      except
      end;
      try
        CodigoTRN := 0;
      except
      end;
      try
        CodigoFPG := ECodigoFPG.KeyValue;
      except
      end;
      try
        CodigoTPG := ECodigoTPG.KeyValue;
      except
      end;
      try
        CodigoFPGTRN := 0;
      except
      end;
      try
        DataCadastro := StrToDateTime(EDataCadastro.Text);
      except
      end;
      try
        CNCEntrega := ECNCEntrega.KeyValue;
      except
      end;
      try
        NotaFiscal := StrToInt(ENotaFiscal.Text);
      except
      end;
      try
        Documento := EDocumento.Text;
      except
      end;
      try
        Serie := ESerie.Text;
      except
      end;
      try
        SubSerie := ESubSerie.Text;
      except
      end;
      try
        Selo := StrToInt(ESelo.Text);
      except
      end;
      try
        DataEmissao := StrToDate(EDataEmissao.Text);
      except
      end;
      try
        DataSaida := StrToDate(EDataSaida.Text);
      except
      end;
      try
        DataEntrega := StrToDate(EDataEntrega.Text);
      except
      end;
      try
        Conhecimento := 0;
      except
      end;
      try
        TipoFrete := 0;
      except
      end;
      try
        Frete := StrToFloat(EFrete.Text);
      except
      end;
      try
        BaseCalculo := StrToFloat(EBaseCalculo.Text);
      except
      end;
      try
        BaseCalculoSub := StrToFloat(EBaseCalculoSub.Text);
      except
      end;
      try
        ICMS := StrToFloat(EICMS.Text);
      except
      end;
      try
        ICMSSub := StrToFloat(EICMSSub.Text);
      except
      end;
      try
        TotalProduto := StrToFloat(ETotalProduto.Text);
      except
      end;
      try
        TotalIPI := StrToFloat(ETotalProduto.Text);
      except
      end;
      try
        TotalNota := StrToFloat(ETotalNota.Text);
      except
      end;
      try
        VPC := StrToFloat(EVPC.Text);
      except
      end;
      try
        SN := ESN.Checked;
      except
      end;
      try
        LJ4 := ELJ4.Checked;
      except
      end;
      try
        PercentualCusto := StrToFloat(EPercentualCusto.Text);
      except
      end;
      try
        PercentualVenda := StrToFloat(EPercentualVenda.Text);
      except
      end;
      try
        Situacao := 0;
      except
      end;
      try
        OBS := EOBS.Text;
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

procedure TPedido_de_Compra.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoPCP.Clear
  except
  end;
  Try
    if Estado <> 1 then
      ECodigoOPF.KeyValue := -1
    else
      ECodigoOPF.KeyValue := 0;
  Except
  End;
  try
    if Estado <> 1 then
      ENotaFiscal.Clear
    else
      ENotaFiscal.Text := '0';
  except
  end;
  try
    EDocumento.Clear;
  except
  end;
  try
    ESerie.Clear;
  except
  end;
  try
    ESubSerie.Clear;
  except
  end;
  try
    ESelo.Clear;
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
    if Estado <> 1 then
      EDataEntrega.Clear
    else if CConfiguracao.Empresa = empLuciano then
      EDataEntrega.Text := formatDateTime('dd/mm/yyyy',CConfiguracao.DataHora+15);
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  Try
    EDataEntrega.Clear;
  Except
  End;
  try
    EDataEmissao.Clear;
  Except
  end;
  try
    EDataSaida.Clear;
  Except
  end;
  Try
    if Estado <> 1 then
      ECodigoFOR.KeyValue := -1
    else
      ECodigoFOR.KeyValue := 0;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoTRN.KeyValue := -1
    else
      ECodigoTRN.KeyValue := 0;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoFPG.KeyValue := -1
    else
      ECodigoFPG.KeyValue := 0;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoTPG.KeyValue := -1
    else
      ECodigoTPG.KeyValue := CConfiguracao.TipoDocumento;
  Except
  End;
  Try
    if Estado <> 1 then
      ECNCEntrega.KeyValue := -1
    else
      ECNCEntrega.KeyValue := CConfiguracao.CodigoCNC;
  Except
  End;
  Try
    if Estado <> 1 then
      EBaseCalculo.Clear
    else
      EBaseCalculo.Text:='0';
  Except
  End;
  Try
    if Estado <> 1 then
      EBaseCalculoSub.Clear
    else
      EBaseCalculoSub.Text:='0';
  Except
  End;
  Try
    if Estado <> 1 then
      EICMS.Clear
    else
      EICMS.Text:='0';
  Except
  End;
  Try
    if Estado <> 1 then
      EICMSSub.Clear
    else
      EICMSSub.Text:='0';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalProduto.Clear
    else
      ETotalProduto.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalIPI.Clear
    else
      ETotalIPI.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      EVPC.Clear
    else
      EVPC.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      ETotalNota.Clear
    else
      ETotalNota.Text := '0';
  Except
  End;
  Try
    ESN.Checked  := False;
  Except
  End;
  Try
    ELJ4.Checked  := False;
  Except
  End;
  Try
    if Estado <> 1 then
      EPercentualCusto.Clear
    else
      EPercentualCusto.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      EPercentualVenda.Clear
    else
      EPercentualVenda.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      ESituacao.Clear
    else
      ESituacao.Text := 'Em Andamento';
  Except
  End;
  Try
    EOBS.Clear;
  Except
  End;
end;

{ Localiza um Inventário }
function TPedido_de_Compra.LocalizarCod(CdPCP, CdCNC:Integer):Boolean;
begin
  If (CdPCP<>CodigoPCP) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;PCP_CODIGO', vararrayof([CdCNC, CdPCP]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TPedido_de_Compra.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TPedido_de_Compra.PreparaInsercao;
begin
  proximoCodigo('PCP_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TPedido_de_Compra.deletarauto:Boolean;
var
  CdCNC,CdPCP,Nota:integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdPCP := CodigoPCP;
    Nota  := NotaFiscal;
    if Delete then
    Begin
      GeraLog(3680,CdCNC,CdPCP,'Nota Fiscal:'+IntToStr(Nota));
      Result := True;
      if TQuery(Self).isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
