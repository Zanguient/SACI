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
unit NotaFiscal;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Extctrls, Variants;

type
  TNotaFiscal = class(TSQuery)
    private
      { Private fields of TNotaFiscal }
        { Storage for property AIDF }
        FAIDF : Integer;
        { Storage for property Arquiteto }
        FArquiteto : Integer;
        { Storage for property Avulsa }
        FAvulsa : Boolean;
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property BaseICMS }
        FBaseICMS : Double;
        { Storage for property BaseISS }
        FBaseISS : Double;
        { Storage for property BaseSub }
        FBaseSub : Double;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property CFOP }
        FCFOP : Integer;
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodPagamento }
        FCodPagamento : Integer;
        { Storage for property CodPagamento2 }
        FCodPagamento2 : Integer;
        { Storage for property CodigoCAG }
        FCodigoCAG : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoFOR }
        FCodigoFOR : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoNTF }
        FCodigoNTF : Integer;
        { Storage for property CodigoTRN }
        FCodigoTRN : Integer;
        { Storage for property CodigoTRO }
        FCodigoTRO : Integer;
        { Storage for property Conhecimento }
        FConhecimento : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataEmissao }
        FDataEmissao : TDateTime;
        { Storage for property DataEntradaSaida }
        FDataEntradaSaida : TDateTime;
        { Storage for property EAIDF }
        FEAIDF : TEdit;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property EBaseICMS }
        FEBaseICMS : TEdit;
        { Storage for property EBaseISS }
        FEBaseISS : TEdit;
        { Storage for property EBaseSub }
        FEBaseSub : TEdit;
        { Storage for property ECEP }
        FECEP : TMaskEdit;
        { Storage for property ECFOP }
        FECFOP : TDBLookupComboBox;
        { Storage for property EClienteCNC }
        FEClienteCNC : TEdit;
        { Storage for property ECodPagamento }
        FECodPagamento : TEdit;
        { Storage for property ECodPagamento2 }
        FECodPagamento2 : TEdit;
        { Storage for property ECodigoCAG }
        FECodigoCAG : TEdit;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoFOR }
        FECodigoFOR : TEdit;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TEdit;
        { Storage for property ECodigoNTF }
        FECodigoNTF : TEdit;
        { Storage for property ECodigoTRN }
        FECodigoTRN : TEdit;
        { Storage for property ECodigoTRO }
        FECodigoTRO : TEdit;
        { Storage for property EConhecimento }
        FEConhecimento : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataEmissao }
        FEDataEmissao : TMaskEdit;
        { Storage for property EDataEntradaSaida }
        FEDataEntradaSaida : TMaskEdit;
        { Storage for property EEndereco }
        FEEndereco : TEdit;
        { Storage for property EEntradaSaida }
        FEEntradaSaida : TComboBox;
        { Storage for property EEspecie }
        FEEspecie : TEdit;
        { Storage for property EFrete }
        FEFrete : TEdit;
        { Storage for property EHora }
        FEHora : TMaskEdit;
        { Storage for property EICMS }
        FEICMS : TEdit;
        { Storage for property EICMSFrete }
        FEICMSFrete : TEdit;
        { Storage for property EICMSSub }
        FEICMSSub : TEdit;
        { Storage for property EIPI }
        FEIPI : TEdit;
        { Storage for property EISS }
        FEISS : TEdit;
        { Storage for property EMarca }
        FEMarca : TEdit;
        { Storage for property EMunicipio }
        FEMunicipio : TEdit;
        { Storage for property ENotaFiscal }
        FENotaFiscal : TEdit;
        { Storage for property ENumero }
        FENumero : TEdit;
        { Storage for property EObservacao }
        FEObservacao : TMemo;
        { Storage for property EOutras }
        FEOutras : TEdit;
        { Storage for property EPedido }
        FEPedido : TEdit;
        { Storage for property EPedidoCNC }
        FEPedidoCNC : TEdit;
        { Storage for property EPesoBruto }
        FEPesoBruto : TEdit;
        { Storage for property EPesoLiquido }
        FEPesoLiquido : TEdit;
        { Storage for property EPlaca }
        FEPlaca : TMaskEdit;
        { Storage for property EPlacaUF }
        FEPlacaUF : TComboBox;
        { Storage for property EQuantidade }
        FEQuantidade : TEdit;
        { Storage for property ESeguro }
        FESeguro : TEdit;
        { Storage for property ESelo }
        FESelo : TEdit;
        { Storage for property ESerie }
        FESerie : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ESubSerie }
        FESubSerie : TEdit;
        { Storage for property ETipoFrete }
        FETipoFrete : TComboBox;
        { Storage for property ETipoNota }
        FETipoNota : TDBLookupComboBox;
        { Storage for property ETipoTransporte }
        FETipoTransporte : TComboBox;
        { Storage for property ETotalNota }
        FETotalNota : TEdit;
        { Storage for property ETotalProduto }
        FETotalProduto : TEdit;
        { Storage for property ETotalServico }
        FETotalServico : TEdit;
        { Storage for property EUF }
        FEUF : TEdit;
        { Storage for property Endereco }
        FEndereco : String;
        { Storage for property EntradaSaida }
        FEntradaSaida : Integer;
        { Storage for property Especie }
        FEspecie : String;
        { Storage for property Frete }
        FFrete : Double;
        { Storage for property ICMS }
        FICMS : Double;
        { Storage for property ICMSFrete }
        FICMSFrete : Double;
        { Storage for property ICMSSub }
        FICMSSub : Double;
        { Storage for property IPI }
        FIPI : Double;
        { Storage for property ISS }
        FISS : Double;
        { Storage for property MaquinaNTF }
        FMaquinaNTF : Integer;
        { Storage for property Marca }
        FMarca : String;
        { Storage for property Municipio }
        FMunicipio : String;
        { Storage for property NotaCupom }
        FNotaCupom : Integer;
        { Storage for property NotaFiscal }
        FNotaFiscal : Integer;
        { Storage for property Numero }
        FNumero : String;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Outras }
        FOutras : Double;
        { Storage for property Pedido }
        FPedido : Integer;
        { Storage for property PedidoCNC }
        FPedidoCNC : Integer;
        { Storage for property PesoBruto }
        FPesoBruto : Double;
        { Storage for property PesoLiquido }
        FPesoLiquido : Double;
        { Storage for property Placa }
        FPlaca : String;
        { Storage for property PlacaUF }
        FPlacaUF : String;
        { Storage for property Quantidade }
        FQuantidade : Double;
        { Storage for property Seguro }
        FSeguro : Double;
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
        { Storage for property TipoNota }
        FTipoNota : Integer;
        { Storage for property TipoTransporte }
        FTipoTransporte : Integer;
        { Storage for property TotalNota }
        FTotalNota : Double;
        { Storage for property TotalProduto }
        FTotalProduto : Double;
        { Storage for property TotalServico }
        FTotalServico : Double;
        { Storage for property UF }
        FUF : String;

      { Private methods of TNotaFiscal }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property AIDF }
        function GetAIDF : Integer;
        { Write method for property AIDF }
        procedure SetAIDF(Value : Integer);
        { Read method for property Arquiteto }
        function GetArquiteto : Integer;
        { Write method for property Arquiteto }
        procedure SetArquiteto(Value : Integer);
        { Read method for property Avulsa }
        function GetAvulsa : Boolean;
        { Write method for property Avulsa }
        procedure SetAvulsa(Value : Boolean);
        { Read method for property Bairro }
        function GetBairro : String;
        { Write method for property Bairro }
        procedure SetBairro(Value : String);
        { Read method for property BaseICMS }
        function GetBaseICMS : Double;
        { Write method for property BaseICMS }
        procedure SetBaseICMS(Value : Double);
        { Read method for property BaseISS }
        function GetBaseISS : Double;
        { Write method for property BaseISS }
        procedure SetBaseISS(Value : Double);
        { Read method for property BaseSub }
        function GetBaseSub : Double;
        { Write method for property BaseSub }
        procedure SetBaseSub(Value : Double);
        { Read method for property CEP }
        function GetCEP : String;
        { Write method for property CEP }
        procedure SetCEP(Value : String);
        { Read method for property CFOP }
        function GetCFOP : Integer;
        { Write method for property CFOP }
        procedure SetCFOP(Value : Integer);
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Write method for property ClienteCNC }
        procedure SetClienteCNC(Value : Integer);
        { Read method for property CodPagamento }
        function GetCodPagamento : Integer;
        { Write method for property CodPagamento }
        procedure SetCodPagamento(Value : Integer);
        { Read method for property CodPagamento2 }
        function GetCodPagamento2 : Integer;
        { Write method for property CodPagamento2 }
        procedure SetCodPagamento2(Value : Integer);
        { Read method for property CodigoCAG }
        function GetCodigoCAG : Integer;
        { Write method for property CodigoCAG }
        procedure SetCodigoCAG(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property CodigoFOR }
        function GetCodigoFOR : Integer;
        { Write method for property CodigoFOR }
        procedure SetCodigoFOR(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoNTF }
        function GetCodigoNTF : Integer;
        { Write method for property CodigoNTF }
        procedure SetCodigoNTF(Value : Integer);
        { Read method for property CodigoTRN }
        function GetCodigoTRN : Integer;
        { Write method for property CodigoTRN }
        procedure SetCodigoTRN(Value : Integer);
        { Read method for property CodigoTRO }
        function GetCodigoTRO : Integer;
        { Write method for property CodigoTRO }
        procedure SetCodigoTRO(Value : Integer);
        { Read method for property Conhecimento }
        function GetConhecimento : Integer;
        { Write method for property Conhecimento }
        procedure SetConhecimento(Value : Integer);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property DataEmissao }
        function GetDataEmissao : TDateTime;
        { Write method for property DataEmissao }
        procedure SetDataEmissao(Value : TDateTime);
        { Read method for property DataEntradaSaida }
        function GetDataEntradaSaida : TDateTime;
        { Write method for property DataEntradaSaida }
        procedure SetDataEntradaSaida(Value : TDateTime);
        { Read method for property Endereco }
        function GetEndereco : String;
        { Write method for property Endereco }
        procedure SetEndereco(Value : String);
        { Read method for property EntradaSaida }
        function GetEntradaSaida : Integer;
        { Write method for property EntradaSaida }
        procedure SetEntradaSaida(Value : Integer);
        { Read method for property Especie }
        function GetEspecie : String;
        { Write method for property Especie }
        procedure SetEspecie(Value : String);
        { Read method for property Frete }
        function GetFrete : Double;
        { Write method for property Frete }
        procedure SetFrete(Value : Double);
        { Read method for property ICMS }
        function GetICMS : Double;
        { Write method for property ICMS }
        procedure SetICMS(Value : Double);
        { Read method for property ICMSSub }
        function GetICMSSub : Double;
        { Write method for property ICMSSub }
        procedure SetICMSSub(Value : Double);
        { Read method for property IPI }
        function GetIPI : Double;
        { Write method for property IPI }
        procedure SetIPI(Value : Double);
        { Read method for property ISS }
        function GetISS : Double;
        { Write method for property ISS }
        procedure SetISS(Value : Double);
        { Read method for property MaquinaNTF }
        function GetMaquinaNTF : Integer;
        { Write method for property MaquinaNTF }
        procedure SetMaquinaNTF(Value : Integer);
        { Read method for property Marca }
        function GetMarca : String;
        { Write method for property Marca }
        procedure SetMarca(Value : String);
        { Read method for property Municipio }
        function GetMunicipio : String;
        { Write method for property Municipio }
        procedure SetMunicipio(Value : String);
        { Read method for property NotaCupom }
        function GetNotaCupom : Integer;
        { Write method for property NotaCupom }
        procedure SetNotaCupom(Value : Integer);
        { Read method for property NotaFiscal }
        function GetNotaFiscal : Integer;
        { Write method for property NotaFiscal }
        procedure SetNotaFiscal(Value : Integer);
        { Read method for property Numero }
        function GetNumero : String;
        { Write method for property Numero }
        procedure SetNumero(Value : String);
        { Read method for property Observacao }
        function GetObservacao : String;
        { Write method for property Observacao }
        procedure SetObservacao(Value : String);
        { Read method for property Outras }
        function GetOutras : Double;
        { Write method for property Outras }
        procedure SetOutras(Value : Double);
        { Read method for property Pedido }
        function GetPedido : Integer;
        { Write method for property Pedido }
        procedure SetPedido(Value : Integer);
        { Read method for property PedidoCNC }
        function GetPedidoCNC : Integer;
        { Write method for property PedidoCNC }
        procedure SetPedidoCNC(Value : Integer);
        { Read method for property PesoBruto }
        function GetPesoBruto : Double;
        { Write method for property PesoBruto }
        procedure SetPesoBruto(Value : Double);
        { Read method for property PesoLiquido }
        function GetPesoLiquido : Double;
        { Write method for property PesoLiquido }
        procedure SetPesoLiquido(Value : Double);
        { Read method for property Placa }
        function GetPlaca : String;
        { Write method for property Placa }
        procedure SetPlaca(Value : String);
        { Read method for property PlacaUF }
        function GetPlacaUF : String;
        { Write method for property PlacaUF }
        procedure SetPlacaUF(Value : String);
        { Read method for property Quantidade }
        function GetQuantidade : Double;
        { Write method for property Quantidade }
        procedure SetQuantidade(Value : Double);
        { Read method for property Seguro }
        function GetSeguro : Double;
        { Write method for property Seguro }
        procedure SetSeguro(Value : Double);
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
        { Read method for property TipoNota }
        function GetTipoNota : Integer;
        { Write method for property TipoNota }
        procedure SetTipoNota(Value : Integer);
        { Read method for property TipoTransporte }
        function GetTipoTransporte : Integer;
        { Write method for property TipoTransporte }
        procedure SetTipoTransporte(Value : Integer);
        { Read method for property TotalNota }
        function GetTotalNota : Double;
        { Write method for property TotalNota }
        procedure SetTotalNota(Value : Double);
        { Read method for property TotalProduto }
        function GetTotalProduto : Double;
        { Write method for property TotalProduto }
        procedure SetTotalProduto(Value : Double);
        { Read method for property TotalServico }
        function GetTotalServico : Double;
        { Write method for property TotalServico }
        procedure SetTotalServico(Value : Double);
        { Read method for property UF }
        function GetUF : String;
        { Write method for property UF }
        procedure SetUF(Value : String);

    protected
      { Protected fields of TNotaFiscal }

      { Protected methods of TNotaFiscal }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TNotaFiscal }

      { Public methods of TNotaFiscal }
        function Alterar(PCFOP,CNCCLI,CLI,PNotaFiscal:integer;PBase,PICMS,PTotalNota,POutras:Double;PUF,OBS:String;DtEmissao,DtEntrada:TDateTime):Boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean; vAvulsa:Boolean=False);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdNTF:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao(vAvulsa:Boolean):Boolean;
        { Insere um Nota Fiscal }
        function Inserir(CNC,NTF,PCNC,Ped,PCF,CdFOR,TRN,CNCCLI,CLI,FUN,PNota,PAIDF,PES,PTipN,PTipT,PTipF,PSel,Sit,Con,PNC,PP,PP2,Arq:integer;PB,PICMS,PBS,PICMSS,PTS,PTP,PTN,PIPI,PFre,ICMSF,QTD,BISS,PISS,PO:Double;PSer,PSubS,OBS,PUF:String;DEM,DES:TDateTime):Boolean;
        function InserirAuto(vAvulsa:Boolean=False):Boolean;
        procedure LimpaDados;
        { Localiza um cliente }
        function LocalizarCod(CdNTF,CdCNC:Integer):Boolean;
        function LocalizarPed(CdPedCNC,Ped:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao(Manual:Boolean; vAvulsa:Boolean=False);
        function deletarauto:Boolean;

    published
      { Published properties of TNotaFiscal }
        property AIDF : Integer read GetAIDF write SetAIDF;
        property Arquiteto : Integer read GetArquiteto write SetArquiteto;
        property Avulsa : Boolean read GetAvulsa write SetAvulsa;
        property Bairro : String read GetBairro write SetBairro;
        property BaseICMS : Double read GetBaseICMS write SetBaseICMS;
        property BaseISS : Double read GetBaseISS write SetBaseISS;
        property BaseSub : Double read GetBaseSub write SetBaseSub;
        property CEP : String read GetCEP write SetCEP;
        property CFOP : Integer read GetCFOP write SetCFOP;
        property ClienteCNC : Integer read GetClienteCNC write SetClienteCNC;
        property CodPagamento : Integer
             read GetCodPagamento write SetCodPagamento;
        property CodPagamento2 : Integer
             read GetCodPagamento2 write SetCodPagamento2;
        property CodigoCAG : Integer read GetCodigoCAG write SetCodigoCAG;
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property CodigoFOR : Integer read GetCodigoFOR write SetCodigoFOR;
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        { Código do Produto }
        property CodigoNTF : Integer read GetCodigoNTF write SetCodigoNTF;
        property CodigoTRN : Integer read GetCodigoTRN write SetCodigoTRN;
        property CodigoTRO : Integer read GetCodigoTRO write SetCodigoTRO;
        property Conhecimento : Integer
             read GetConhecimento write SetConhecimento;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataEmissao : TDateTime
             read GetDataEmissao write SetDataEmissao;
        property DataEntradaSaida : TDateTime
             read GetDataEntradaSaida write SetDataEntradaSaida;
        property EAIDF : TEdit read FEAIDF write FEAIDF;
        property EBairro : TEdit read FEBairro write FEBairro;
        property EBaseICMS : TEdit read FEBaseICMS write FEBaseICMS;
        property EBaseISS : TEdit read FEBaseISS write FEBaseISS;
        property EBaseSub : TEdit read FEBaseSub write FEBaseSub;
        property ECEP : TMaskEdit read FECEP write FECEP;
        property ECFOP : TDBLookupComboBox read FECFOP write FECFOP;
        property EClienteCNC : TEdit read FEClienteCNC write FEClienteCNC;
        property ECodPagamento : TEdit
             read FECodPagamento write FECodPagamento;
        property ECodPagamento2 : TEdit
             read FECodPagamento2 write FECodPagamento2;
        property ECodigoCAG : TEdit read FECodigoCAG write FECodigoCAG;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoFOR : TEdit read FECodigoFOR write FECodigoFOR;
        property ECodigoFUN : TEdit read FECodigoFUN write FECodigoFUN;
        property ECodigoNTF : TEdit read FECodigoNTF write FECodigoNTF;
        property ECodigoTRN : TEdit read FECodigoTRN write FECodigoTRN;
        property ECodigoTRO : TEdit read FECodigoTRO write FECodigoTRO;
        property EConhecimento : TEdit
             read FEConhecimento write FEConhecimento;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataEmissao : TMaskEdit
             read FEDataEmissao write FEDataEmissao;
        property EDataEntradaSaida : TMaskEdit
             read FEDataEntradaSaida write FEDataEntradaSaida;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property EEntradaSaida : TComboBox
             read FEEntradaSaida write FEEntradaSaida;
        property EEspecie : TEdit read FEEspecie write FEEspecie;
        property EFrete : TEdit read FEFrete write FEFrete;
        property EHora : TMaskEdit read FEHora write FEHora;
        property EICMS : TEdit read FEICMS write FEICMS;
        property EICMSFrete : TEdit read FEICMSFrete write FEICMSFrete;
        property EICMSSub : TEdit read FEICMSSub write FEICMSSub;
        property EIPI : TEdit read FEIPI write FEIPI;
        property EISS : TEdit read FEISS write FEISS;
        property EMarca : TEdit read FEMarca write FEMarca;
        property EMunicipio : TEdit read FEMunicipio write FEMunicipio;
        property ENotaFiscal : TEdit read FENotaFiscal write FENotaFiscal;
        property ENumero : TEdit read FENumero write FENumero;
        property EObservacao : TMemo read FEObservacao write FEObservacao;
        property EOutras : TEdit read FEOutras write FEOutras;
        property EPedido : TEdit read FEPedido write FEPedido;
        property EPedidoCNC : TEdit read FEPedidoCNC write FEPedidoCNC;
        property EPesoBruto : TEdit read FEPesoBruto write FEPesoBruto;
        property EPesoLiquido : TEdit read FEPesoLiquido write FEPesoLiquido;
        property EPlaca : TMaskEdit read FEPlaca write FEPlaca;
        property EPlacaUF : TComboBox read FEPlacaUF write FEPlacaUF;
        property EQuantidade : TEdit read FEQuantidade write FEQuantidade;
        property ESeguro : TEdit read FESeguro write FESeguro;
        property ESelo : TEdit read FESelo write FESelo;
        property ESerie : TEdit read FESerie write FESerie;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ESubSerie : TEdit read FESubSerie write FESubSerie;
        property ETipoFrete : TComboBox read FETipoFrete write FETipoFrete;
        property ETipoNota : TDBLookupComboBox
             read FETipoNota write FETipoNota;
        property ETipoTransporte : TComboBox
             read FETipoTransporte write FETipoTransporte;
        property ETotalNota : TEdit read FETotalNota write FETotalNota;
        property ETotalProduto : TEdit
             read FETotalProduto write FETotalProduto;
        property ETotalServico : TEdit
             read FETotalServico write FETotalServico;
        property EUF : TEdit read FEUF write FEUF;
        property Endereco : String read GetEndereco write SetEndereco;
        property EntradaSaida : Integer
             read GetEntradaSaida write SetEntradaSaida;
        property Especie : String read GetEspecie write SetEspecie;
        property Frete : Double read GetFrete write SetFrete;
        property ICMS : Double read GetICMS write SetICMS;
        property ICMSFrete : Double read FICMSFrete write FICMSFrete;
        property ICMSSub : Double read GetICMSSub write SetICMSSub;
        property IPI : Double read GetIPI write SetIPI;
        property ISS : Double read GetISS write SetISS;
        property MaquinaNTF : Integer read GetMaquinaNTF write SetMaquinaNTF;
        property Marca : String read GetMarca write SetMarca;
        property Municipio : String read GetMunicipio write SetMunicipio;
        property NotaCupom : Integer read GetNotaCupom write SetNotaCupom;
        property NotaFiscal : Integer read GetNotaFiscal write SetNotaFiscal;
        property Numero : String read GetNumero write SetNumero;
        property Observacao : String read GetObservacao write SetObservacao;
        property Outras : Double read GetOutras write SetOutras;
        property Pedido : Integer read GetPedido write SetPedido;
        property PedidoCNC : Integer read GetPedidoCNC write SetPedidoCNC;
        property PesoBruto : Double read GetPesoBruto write SetPesoBruto;
        property PesoLiquido : Double read GetPesoLiquido write SetPesoLiquido;
        property Placa : String read GetPlaca write SetPlaca;
        property PlacaUF : String read GetPlacaUF write SetPlacaUF;
        property Quantidade : Double read GetQuantidade write SetQuantidade;
        property Seguro : Double read GetSeguro write SetSeguro;
        property Selo : Integer read GetSelo write SetSelo;
        property Serie : String read GetSerie write SetSerie;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property SubSerie : String read GetSubSerie write SetSubSerie;
        property TipoFrete : Integer read GetTipoFrete write SetTipoFrete;
        property TipoNota : Integer read GetTipoNota write SetTipoNota;
        property TipoTransporte : Integer
             read GetTipoTransporte write SetTipoTransporte;
        property TotalNota : Double read GetTotalNota write SetTotalNota;
        property TotalProduto : Double
             read GetTotalProduto write SetTotalProduto;
        property TotalServico : Double
             read GetTotalServico write SetTotalServico;
        property UF : String read GetUF write SetUF;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TNotaFiscal with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TNotaFiscal]);
end;

{ Method to set variable and property values and create objects }
procedure TNotaFiscal.AutoInitialize;
begin
     FEAIDF := nil;
     FEBairro := nil;
     FEBaseICMS := nil;
     FEBaseISS := nil;
     FEBaseSub := nil;
     FECEP := nil;
     FECFOP := nil;
     FEClienteCNC := nil;
     FECodPagamento := nil;
     FECodPagamento2 := nil;
     FECodigoCAG := nil;
     FECodigoCLI := nil;
     FECodigoFOR := nil;
     FECodigoFUN := nil;
     FECodigoNTF := nil;
     FECodigoTRN := nil;
     FECodigoTRO := nil;
     FEConhecimento := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataEmissao := nil;
     FEDataEntradaSaida := nil;
     FEEndereco := nil;
     FEEntradaSaida := nil;
     FEEspecie := nil;
     FEFrete := nil;
     FEHora := nil;
     FEICMS := nil;
     FEICMSFrete := nil;
     FEICMSSub := nil;
     FEIPI := nil;
     FEISS := nil;
     FEMarca := nil;
     FEMunicipio := nil;
     FENotaFiscal := nil;
     FENumero := nil;
     FEObservacao := nil;
     FEOutras := nil;
     FEPedido := nil;
     FEPedidoCNC := nil;
     FEPesoBruto := nil;
     FEPesoLiquido := nil;
     FEPlaca := nil;
     FEPlacaUF := nil;
     FEQuantidade := nil;
     FESeguro := nil;
     FESelo := nil;
     FESerie := nil;
     FESituacao := nil;
     FESubSerie := nil;
     FETipoFrete := nil;
     FETipoNota := nil;
     FETipoTransporte := nil;
     FETotalNota := nil;
     FETotalProduto := nil;
     FETotalServico := nil;
     FEUF := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TNotaFiscal.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAIDF then
        FEAIDF := nil;
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FEBaseICMS then
        FEBaseICMS := nil;
     if AComponent = FEBaseISS then
        FEBaseISS := nil;
     if AComponent = FEBaseSub then
        FEBaseSub := nil;
     if AComponent = FECEP then
        FECEP := nil;
     if AComponent = FECFOP then
        FECFOP := nil;
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodPagamento then
        FECodPagamento := nil;
     if AComponent = FECodPagamento2 then
        FECodPagamento2 := nil;
     if AComponent = FECodigoCAG then
        FECodigoCAG := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoFOR then
        FECodigoFOR := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoNTF then
        FECodigoNTF := nil;
     if AComponent = FECodigoTRN then
        FECodigoTRN := nil;
     if AComponent = FECodigoTRO then
        FECodigoTRO := nil;
     if AComponent = FEConhecimento then
        FEConhecimento := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataEmissao then
        FEDataEmissao := nil;
     if AComponent = FEDataEntradaSaida then
        FEDataEntradaSaida := nil;
     if AComponent = FEEndereco then
        FEEndereco := nil;
     if AComponent = FEEntradaSaida then
        FEEntradaSaida := nil;
     if AComponent = FEEspecie then
        FEEspecie := nil;
     if AComponent = FEFrete then
        FEFrete := nil;
     if AComponent = FEHora then
        FEHora := nil;
     if AComponent = FEICMS then
        FEICMS := nil;
     if AComponent = FEICMSFrete then
        FEICMSFrete := nil;
     if AComponent = FEICMSSub then
        FEICMSSub := nil;
     if AComponent = FEIPI then
        FEIPI := nil;
     if AComponent = FEISS then
        FEISS := nil;
     if AComponent = FEMarca then
        FEMarca := nil;
     if AComponent = FEMunicipio then
        FEMunicipio := nil;
     if AComponent = FENotaFiscal then
        FENotaFiscal := nil;
     if AComponent = FENumero then
        FENumero := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEOutras then
        FEOutras := nil;
     if AComponent = FEPedido then
        FEPedido := nil;
     if AComponent = FEPedidoCNC then
        FEPedidoCNC := nil;
     if AComponent = FEPesoBruto then
        FEPesoBruto := nil;
     if AComponent = FEPesoLiquido then
        FEPesoLiquido := nil;
     if AComponent = FEPlaca then
        FEPlaca := nil;
     if AComponent = FEPlacaUF then
        FEPlacaUF := nil;
     if AComponent = FEQuantidade then
        FEQuantidade := nil;
     if AComponent = FESeguro then
        FESeguro := nil;
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
     if AComponent = FETipoNota then
        FETipoNota := nil;
     if AComponent = FETipoTransporte then
        FETipoTransporte := nil;
     if AComponent = FETotalNota then
        FETotalNota := nil;
     if AComponent = FETotalProduto then
        FETotalProduto := nil;
     if AComponent = FETotalServico then
        FETotalServico := nil;
     if AComponent = FEUF then
        FEUF := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TNotaFiscal.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property AIDF }
function TNotaFiscal.GetAIDF : Integer;
begin
  try
    Result := Self.fieldByName('NTF_AIDF').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property AIDF }
procedure TNotaFiscal.SetAIDF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_AIDF').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_AIDF"!');
    end;
end;

{ Read method for property Arquiteto }
function TNotaFiscal.GetArquiteto : Integer;
begin
  try
    Result := Self.fieldByName('FUN_ARQUITETO').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Arquiteto }
procedure TNotaFiscal.SetArquiteto(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_ARQUITETO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_ARQUITETO"!');
    end;
end;

{ Read method for property Avulsa }
function TNotaFiscal.GetAvulsa : Boolean;
begin
  try
    result := (Self.fieldByName('NTF_AVULSA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Avulsa }
procedure TNotaFiscal.SetAvulsa(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('NTF_AVULSA').asInteger := 1
      else
        Self.fieldByName('NTF_AVULSA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_AVULSA"!');
    end;
end;

{ Read method for property Bairro }
function TNotaFiscal.GetBairro : String;
begin
  try
    Result := Self.fieldByName('NTF_BAIRRO').AsString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro }
procedure TNotaFiscal.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_BAIRRO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_BAIRRO"!');
    end;
end;

{ Read method for property BaseICMS }
function TNotaFiscal.GetBaseICMS : Double;
begin
  try
    Result := Self.fieldByName('NTF_BASE_ICMS').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property BaseICMS }
procedure TNotaFiscal.SetBaseICMS(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_BASE_ICMS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_BASE_ICMS"!');
    end;
end;

{ Read method for property BaseISS }
function TNotaFiscal.GetBaseISS : Double;
begin
  try
    Result := Self.fieldByName('NTF_BASE_ISS').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property BaseISS }
procedure TNotaFiscal.SetBaseISS(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_BASE_ISS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_BASE_ISS"!');
    end;
end;

{ Read method for property BaseSub }
function TNotaFiscal.GetBaseSub : Double;
begin
  try
    Result := Self.fieldByName('NTF_BASE_ICMS_SUB').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property BaseSub }
procedure TNotaFiscal.SetBaseSub(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_BASE_ICMS_SUB').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_BASE_ICMS_SUB"!');
    end;
end;

{ Read method for property CEP }
function TNotaFiscal.GetCEP : String;
begin
  try
    Result := Self.fieldByName('NTF_CEP').AsString;
  except
    result:= ''
  end;
end;

{ Write method for property CEP }
procedure TNotaFiscal.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_CEP').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_CEP"!');
    end;
end;

{ Read method for property CFOP }
function TNotaFiscal.GetCFOP : Integer;
begin
  try
    Result := Self.fieldByName('NTF_CFOP').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CFOP }
procedure TNotaFiscal.SetCFOP(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_CFOP').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_CFOP"!');
    end;
end;

{ Read method for property ClienteCNC }
function TNotaFiscal.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property ClienteCNC }
procedure TNotaFiscal.SetClienteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodPagamento }
function TNotaFiscal.GetCodPagamento : Integer;
begin
  try
    Result := Self.fieldByName('NTF_COD_PAGAMENTO').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodPagamento }
procedure TNotaFiscal.SetCodPagamento(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_COD_PAGAMENTO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_COD_PAGAMENTO"!');
    end;
end;

{ Read method for property CodPagamento2 }
function TNotaFiscal.GetCodPagamento2 : Integer;
begin
  try
    Result := Self.fieldByName('NTF_COD_PAGAMENTO_2').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodPagamento2 }
procedure TNotaFiscal.SetCodPagamento2(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_COD_PAGAMENTO_2').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_COD_PAGAMENTO_2"!');
    end;
end;

{ Read method for property CodigoCAG }
function TNotaFiscal.GetCodigoCAG : Integer;
begin
  try
    Result := Self.fieldByName('CAG_CLIENTE').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCAG }
procedure TNotaFiscal.SetCodigoCAG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CAG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CAG_CODIGO"!');
    end;
end;

{ Read method for property CodigoCLI }
function TNotaFiscal.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCLI }
procedure TNotaFiscal.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;


{ Read method for property CodigoFOR }
function TNotaFiscal.GetCodigoFOR : Integer;
begin
  try
    Result := Self.fieldByName('FOR_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFOR }
procedure TNotaFiscal.SetCodigoFOR(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FOR_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FOR_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TNotaFiscal.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoFUN }
procedure TNotaFiscal.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoNTF }
function TNotaFiscal.GetCodigoNTF : Integer;
begin
  try
    Result := Self.fieldByName('NTF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoNTF }
procedure TNotaFiscal.SetCodigoNTF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_CODIGO"!');
    end;
end;

{ Read method for property CodigoTRN }
function TNotaFiscal.GetCodigoTRN : Integer;
begin
  try
    Result := Self.fieldByName('TRN_CODIGO').AsInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTRN }
procedure TNotaFiscal.SetCodigoTRN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRN_CODIGO"!');
    end;
end;

{ Read method for property CodigoTRO }
function TNotaFiscal.GetCodigoTRO : Integer;
begin
  try
    Result := Self.fieldByName('TRO_CODIGO').AsInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTRO }
procedure TNotaFiscal.SetCodigoTRO(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRO_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRO_CODIGO"!');
    end;
end;

{ Read method for property Conhecimento }
function TNotaFiscal.GetConhecimento : Integer;
begin
  try
    Result := Self.fieldByName('NTF_CONHECIMENTO').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Conhecimento }
procedure TNotaFiscal.SetConhecimento(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_CONHECIMENTO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_CONHECIMENTO"!');
    end;
end;

{ Read method for property DataAlterado }
function TNotaFiscal.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('NTF_DT_ALTERADO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataAlterado }
procedure TNotaFiscal.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_DT_ALTERADO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TNotaFiscal.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('NTF_DT_CADASTRO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataCadastro }
procedure TNotaFiscal.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_DT_CADASTRO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_DT_CADASTRO"!');
    end;
end;

{ Read method for property DataEmissao }
function TNotaFiscal.GetDataEmissao : TDateTime;
begin
  try
    Result := Self.fieldByName('NTF_DT_EMISSAO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataEmissao }
procedure TNotaFiscal.SetDataEmissao(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_DT_EMISSAO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_DT_EMISSAO"!');
    end;
end;

{ Read method for property DataEntradaSaida }
function TNotaFiscal.GetDataEntradaSaida : TDateTime;
begin
  try
    Result := Self.fieldByName('NTF_DT_ENTRADA_SAIDA').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataEntradaSaida }
procedure TNotaFiscal.SetDataEntradaSaida(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_DT_ENTRADA_SAIDA').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_DT_ENTRADA_SAIDA"!');
    end;
end;

{ Read method for property Endereco }
function TNotaFiscal.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('NTF_ENDERECO').AsString;
  except
    result:= ''
  end;
end;

{ Write method for property Endereco }
procedure TNotaFiscal.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_ENDERECO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_ENDERECO"!');
    end;
end;

{ Read method for property EntradaSaida }
function TNotaFiscal.GetEntradaSaida : Integer;
begin
  try
    Result := Self.fieldByName('NTF_ENTRADA_SAIDA').AsInteger;
  except
    result:= -1
  end;
end;

{ Write method for property EntradaSaida }
procedure TNotaFiscal.SetEntradaSaida(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_ENTRADA_SAIDA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_ENTRADA_SAIDA"!');
    end;
end;

{ Read method for property Especie }
function TNotaFiscal.GetEspecie : String;
begin
  try
    Result := Self.fieldByName('NTF_ESPECIE').AsString;
  except
    result:= '';
  end;
end;

{ Write method for property Especie }
procedure TNotaFiscal.SetEspecie(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_ESPECIE').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_ESPECIE"!');
    end;
end;

{ Read method for property Frete }
function TNotaFiscal.GetFrete : Double;
begin
  try
    Result := Self.fieldByName('NTF_FRETE').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Frete }
procedure TNotaFiscal.SetFrete(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_FRETE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_FRETE"!');
    end;
end;

{ Read method for property ICMS }
function TNotaFiscal.GetICMS : Double;
begin
  try
    Result := Self.fieldByName('NTF_ICMS').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ICMS }
procedure TNotaFiscal.SetICMS(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_ICMS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_ICMS"!');
    end;
end;

{ Read method for property ICMSSub }
function TNotaFiscal.GetICMSSub : Double;
begin
  try
    Result := Self.fieldByName('NTF_ICMS_SUB').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ICMSSub }
procedure TNotaFiscal.SetICMSSub(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_ICMS_SUB').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_ICMS_SUB"!');
    end;
end;

{ Read method for property IPI }
function TNotaFiscal.GetIPI : Double;
begin
  try
    Result := Self.fieldByName('NTF_IPI').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property IPI }
procedure TNotaFiscal.SetIPI(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_IPI').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_IPI"!');
    end;
end;

{ Read method for property ISS }
function TNotaFiscal.GetISS : Double;
begin
  try
    Result := Self.fieldByName('NTF_ISS').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ISS }
procedure TNotaFiscal.SetISS(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_ISS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_ISS"!');
    end;
end;

{ Read method for property MaquinaNTF }
function TNotaFiscal.GetMaquinaNTF : Integer;
begin
  try
    Result := Self.fieldByName('NTF_MAQUINA').AsInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property MaquinaNTF }
procedure TNotaFiscal.SetMaquinaNTF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_MAQUINA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_MAQUINA"!');
    end;
end;

{ Read method for property Marca }
function TNotaFiscal.GetMarca : String;
begin
  try
    Result := Self.fieldByName('NTF_MARCA').AsString;
  except
    result:= '';
  end;
end;

{ Write method for property Marca }
procedure TNotaFiscal.SetMarca(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_MARCA').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_MARCA"!');
    end;
end;

{ Read method for property Municipio }
function TNotaFiscal.GetMunicipio : String;
begin
  try
    Result := Self.fieldByName('NTF_MUNICIPIO').AsString;
  except
    result:= ''
  end;
end;

{ Write method for property Municipio }
procedure TNotaFiscal.SetMunicipio(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_MUNICIPIO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_MUNICIPIO"!');
    end;
end;

{ Read method for property NotaCupom }
function TNotaFiscal.GetNotaCupom : Integer;
begin
  try
    Result := Self.fieldByName('NTF_NOTA_CUPOM').AsInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property NotaCupom }
procedure TNotaFiscal.SetNotaCupom(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_NOTA_CUPOM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_NOTA_CUPOM"!');
    end;
end;

{ Read method for property NotaFiscal }
function TNotaFiscal.GetNotaFiscal : Integer;
begin
  try
    Result := Self.fieldByName('NTF_NOTA_FISCAL').AsInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property NotaFiscal }
procedure TNotaFiscal.SetNotaFiscal(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_NOTA_FISCAL').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_NOTA_FISCAL"!');
    end;
end;

{ Read method for property Numero }
function TNotaFiscal.GetNumero : String;
begin
  try
    Result := Self.fieldByName('NTF_NUMERO').AsString;
  except
    result:= '';
  end;
end;

{ Write method for property Numero }
procedure TNotaFiscal.SetNumero(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_NUMERO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_NUMERO"!');
    end;
end;

{ Read method for property Observacao }
function TNotaFiscal.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('NTF_OBSERVACAO').AsString;
  except
    result:= '';
  end;
end;

{ Write method for property Observacao }
procedure TNotaFiscal.SetObservacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_OBSERVACAO').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_OBSERVACAO"!');
    end;
end;

{ Read method for property Outras }
function TNotaFiscal.GetOutras : Double;
begin
  try
    Result := Self.fieldByName('NTF_OUTRAS').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Outras }
procedure TNotaFiscal.SetOutras(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_OUTRAS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_OUTRAS"!');
    end;
end;

{ Read method for property Pedido }
function TNotaFiscal.GetPedido : Integer;
begin
  try
    Result := Self.fieldByName('NTF_PEDIDO').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Pedido }
procedure TNotaFiscal.SetPedido(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_PEDIDO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_PEDIDO"!');
    end;
end;

{ Read method for property PedidoCNC }
function TNotaFiscal.GetPedidoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_PEDIDO').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property PedidoCNC }
procedure TNotaFiscal.SetPedidoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_PEDIDO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_PEDIDO"!');
    end;
end;

{ Read method for property PesoBruto }
function TNotaFiscal.GetPesoBruto : Double;
begin
  try
    Result := Self.fieldByName('NTF_PESO_BRUTO').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PesoBruto }
procedure TNotaFiscal.SetPesoBruto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_PESO_BRUTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_PESO_BRUTO"!');
    end;
end;

{ Read method for property PesoLiquido }
function TNotaFiscal.GetPesoLiquido : Double;
begin
  try
    Result := Self.fieldByName('NTF_PESO_LIQUIDO').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property PesoLiquido }
procedure TNotaFiscal.SetPesoLiquido(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_PESO_LIQUIDO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_PESO_LIQUIDO"!');
    end;
end;

{ Read method for property Placa }
function TNotaFiscal.GetPlaca : String;
begin
  try
    Result := Self.fieldByName('NTF_PLACA').AsString;
  except
    result:= ''
  end;
end;

{ Write method for property Placa }
procedure TNotaFiscal.SetPlaca(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_PLACA').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_PLACA"!');
    end;
end;

{ Read method for property PlacaUF }
function TNotaFiscal.GetPlacaUF : String;
begin
  try
    Result := Self.fieldByName('NTF_PLACA_UF').AsString;
  except
    result:= '';
  end;
end;

{ Write method for property PlacaUF }
procedure TNotaFiscal.SetPlacaUF(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_PLACA_UF').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_PLACA_UF"!');
    end;
end;

{ Read method for property Quantidade }
function TNotaFiscal.GetQuantidade : Double;
begin
  try
    Result := Self.fieldByName('NTF_QUANTIDADE').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Quantidade }
procedure TNotaFiscal.SetQuantidade(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_QUANTIDADE').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_QUANTIDADE"!');
    end;
end;

{ Read method for property Seguro }
function TNotaFiscal.GetSeguro : Double;
begin
  try
    Result := Self.fieldByName('NTF_SEGURO').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Seguro }
procedure TNotaFiscal.SetSeguro(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_SEGURO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_SEGURO"!');
    end;
end;

{ Read method for property Selo }
function TNotaFiscal.GetSelo : Integer;
begin
  try
    Result := Self.fieldByName('NTF_SELO').AsInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Selo }
procedure TNotaFiscal.SetSelo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_SELO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_SELO"!');
    end;
end;

{ Read method for property Serie }
function TNotaFiscal.GetSerie : String;
begin
  try
    Result := Self.fieldByName('NTF_SERIE').AsString;
  except
    result:= ''
  end;
end;

{ Write method for property Serie }
procedure TNotaFiscal.SetSerie(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_SERIE').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_SERIE"!');
    end;
end;

{ Read method for property Situacao }
function TNotaFiscal.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('NTF_SITUACAO').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TNotaFiscal.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_SITUACAO"!');
    end;
end;

{ Read method for property SubSerie }
function TNotaFiscal.GetSubSerie : String;
begin
  try
    Result := Self.fieldByName('NTF_SUBSERIE').AsString;
  except
    result:= ''
  end;
end;

{ Write method for property SubSerie }
procedure TNotaFiscal.SetSubSerie(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_SUBSERIE').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_SUBSERIE"!');
    end;
end;

{ Read method for property TipoFrete }
function TNotaFiscal.GetTipoFrete : Integer;
begin
  try
    Result := Self.fieldByName('NTF_TIPO_FRETE').AsInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoFrete }
procedure TNotaFiscal.SetTipoFrete(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_TIPO_FRETE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_TIPO_FRETE"!');
    end;
end;

{ Read method for property TipoNota }
function TNotaFiscal.GetTipoNota : Integer;
begin
  try
    Result := Self.fieldByName('NTF_TIPO_NOTA').AsInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TipoNota }
procedure TNotaFiscal.SetTipoNota(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_TIPO_NOTA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_TIPO_NOTA"!');
    end;
end;

{ Read method for property TipoTransporte }
function TNotaFiscal.GetTipoTransporte : Integer;
begin
  try
    Result := Self.fieldByName('NTF_TIPO_TRANSPORTE').AsInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TipoTransporte }
procedure TNotaFiscal.SetTipoTransporte(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_TIPO_TRANSPORTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_TIPO_TRANSPORTE"!');
    end;
end;

{ Read method for property TotalNota }
function TNotaFiscal.GetTotalNota : Double;
begin
  try
    Result := Self.fieldByName('NTF_TOTAL_NOTA').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property TotalNota }
procedure TNotaFiscal.SetTotalNota(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_TOTAL_NOTA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_TOTAL_NOTA"!');
    end;
end;

{ Read method for property TotalProduto }
function TNotaFiscal.GetTotalProduto : Double;
begin
  try
    Result := Self.fieldByName('NTF_TOTAL_PRODUTO').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property TotalProduto }
procedure TNotaFiscal.SetTotalProduto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_TOTAL_PRODUTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_TOTAL_PRODUTO"!');
    end;
end;

{ Read method for property TotalServico }
function TNotaFiscal.GetTotalServico : Double;
begin
  try
    Result := Self.fieldByName('NTF_TOTAL_SERVICO').AsFloat;
  except
    result:= 0
  end;
end;

{ Write method for property TotalServico }
procedure TNotaFiscal.SetTotalServico(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_TOTAL_SERVICO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_TOTAL_SERVICO"!');
    end;
end;

{ Read method for property UF }
function TNotaFiscal.GetUF : String;
begin
  try
    Result := Self.fieldByName('NTF_UF').AsString;
  except
    result:= ''
  end;
end;

{ Write method for property UF }
procedure TNotaFiscal.SetUF(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('NTF_UF').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "NTF_UF"!');
    end;
end;

function TNotaFiscal.Alterar(PCFOP,CNCCLI,CLI,PNotaFiscal:integer;PBase,PICMS,PTotalNota,POutras:Double;PUF,OBS:String;DtEmissao,DtEntrada:TDateTime):Boolean;
begin
  try
    Edit;
    CodigoUSU        := CConfiguracao.CodigoUSU;
    DataAlterado     := CConfiguracao.DataHora;
    DataEmissao      := DtEmissao;
    DataEntradaSaida := DtEntrada;
    CFOP             := PCFOP;
    ClienteCNC       := CNCCLI;
    CodigoCLI        := CLI;
    NotaFiscal       := PNotaFiscal;
    BaseICMS         := PBase;
    ICMS             := PIcms;
    Outras           := POutras;
    TotalNota        := PTotalNota;
    UF               := PUF;
    MaquinaNTF       := Maquina;
    Observacao       := OBS;
    try
      Post;
      Result := True;

    except
      result:=false;
      Cancel;
      ShowMessage('Não foi possível alterar o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
    end;
  except
    result:=false;
    ShowMessage('Não foi possível alterar o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

function TNotaFiscal.AlterarAuto:Boolean;
var
  CdTRO: integer;
begin
  try
    CdTRO := StrToInt(ECodigoTRO.Text);
  except
    CdTRO := 0;
  end;

  try
  Begin
    edit;
    try
      CodigoUSU        := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado     := CConfiguracao.DataHora;
    except
    end;
    try
      MaquinaNTF       := Maquina;
    except
    end;
    try
      CodigoNTF        := StrToInt(ECodigoNTF.Text);
    except
    end;
    try
      CodigoCNC        :=  CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoUSU        := CConfiguracao.CodigoUSU;
    except
    end;
    try
      PedidoCNC        := StrToInt(EPedidoCNC.Text);
    except
    end;
    try
      CodigoTRO        := CdTRO;
    except
    end;
    try
      Pedido           := StrToInt(EPedido.Text);
    except
    end;
    try
      ClienteCNC       := StrToInt(EClienteCNC.Text);
    except
    end;
    try
      CodigoCLI        := StrToInt(ECodigoCLI.Text);
    except
    end;
    try
      CodigoFOR        := StrToInt(ECodigoFOR.Text);
    except
    end;
    try
      CodigoFUN        := StrToInt(ECodigoFUN.Text);
    except
    end;
    try
      CodigoTRN        := StrToInt(ECodigoTRN.Text);
    except
    end;
    try
      CodigoCAG       := 0;
    except
    end;
    try
      DataEmissao     := StrToDateTime(EDataEmissao.Text);
    except
    end;
    try
      DataEntradaSaida:= StrToDateTime(EDataEntradaSaida.Text+' '+EHora.Text);
    except
      try
        DataEntradaSaida:= StrToDate(EDataEntradaSaida.Text);
      except
      end;
    end;
    try
      EntradaSaida       := EEntradaSaida.ItemIndex;
    except
    end;
    try
      TipoNota           := ETipoNota.KeyValue;
    except
    end;
    try
      NotaFiscal      := StrToInt(ENotaFiscal.Text);
    except
    end;
    try
      Serie               := ESerie.Text;
    except
    end;
    try
      SubSerie            := ESubSerie.Text;
    except
    end;
    try
      Selo            := StrToInt(ESelo.Text);
    except
    end;
    try
      AIDF            := StrToInt(EAIDF.Text);
    except
    end;
    try
      CFOP             := ECFOP.KeyValue;
    except
    end;
    try
      BaseICMS        := StrToFloat(EBaseICMS.Text);
    except
    end;
    try
      ICMS            := StrToFloat(EICMS.Text);
    except
    end;
    try
      BaseSub         := StrToFloat(EBasesub.Text);
    except
    end;
    try
      ICMSSub         := StrToFloat(EICMSSub.Text);
    except
    end;
    try
      TotalServico   := StrToFloat(ETotalServico.Text);
    except
    end;
    try
      TotalProduto   := StrToFloat(ETotalProduto.Text);
    except
    end;
    try
      TotalNota       := StrToFloat(ETotalNota.Text);
    except
    end;
    try
      Conhecimento    := StrToInt(EConhecimento.Text);
    except
    end;
    try
      Frete           := StrToFloat(EFrete.Text);
    except
    end;
    try
      ICMSFrete       := StrToFloat(EICMSFrete.Text);
    except
    end;
    try
      Seguro          := StrToFloat(ESeguro.Text);
    except
    end;
    try
      Outras          := StrToFloat(EOutras.Text);
    except
    end;
    try
      IPI             := StrToFloat(EIPI.Text);
    except
    end;
    try
      BaseISS         := StrToFloat(EBaseISS.Text);
    except
    end;
    try
      ISS             := StrToFloat(EISS.Text);
    except
    end;
    try
      TipoTransporte := ETipoTransporte.ItemIndex;
    except
    end;
    try
      TipoFrete      := ETipoFrete.ItemIndex;
    except
    end;
    try
      Placa           := EPlaca.Text;
    except
    end;
    try
      PlacaUF         := EPlacaUF.Text;
    except
    end;
    try
      Quantidade      := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      Especie         := EEspecie.Text;
    except
    end;
    try
      Marca           := EMarca.Text;
    except
    end;
    try
      Numero          := ENumero.Text;
    except
    end;
    try
      PesoBruto       := StrToFloat(EPesoBruto.Text);
    except
    end;
    try
      PesoLiquido     := StrToFloat(EPesoLiquido.Text);
    except
    end;
    try
      Endereco        := EEndereco.Text;
    except
    end;
    try
      Bairro          := EBairro.Text;
    except
    end;
    try
      Municipio       := EMunicipio.Text;
    except
    end;
    try
      UF              := EUF.Text;
    except
    end;
    try
      CEP             := ECEP.Text;
    except
    end;
    try
      CodPagamento    := StrToInt(ECodPagamento.Text);
    except
    end;
    try
      CodPagamento2    := StrToInt(ECodPagamento2.Text);
    except
    end;
    try
      Situacao        := ESituacao.ItemIndex;
    except
    end;
    try
      Observacao      := EObservacao.Text;
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
  end;
  except
    Result:=false;
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TNotaFiscal.AtualizaControles(Habilitar:Boolean; vAvulsa:Boolean=False);
begin
  try
    if vAvulsa and Habilitar then
      ENotaFiscal.Enabled    := True
    else
      ENotaFiscal.Enabled    := False;
  except
  end;
  try
    if vAvulsa and Habilitar then
      ESelo.Enabled    := True
    else
      ESelo.Enabled    := False;
  except
  end;
  try
    if vAvulsa and Habilitar then
      ESerie.Enabled    := True
    else
      ESerie.Enabled    := False;
  except
  end;
  try
    if vAvulsa and Habilitar then
      ESubSerie.Enabled    := True
    else
      ESubSerie.Enabled    := False;
  except
  end;
  try
    if vAvulsa and Habilitar then
      EAIDF.Enabled    := True
    else
      EAIDF.Enabled    := False;
  except
  end;
  try
    EPedido.Enabled    := Habilitar;
  except
  end;
  try
    if vAvulsa and Habilitar then
      EPedidoCNC.Enabled    := True
    else
      EPedidoCNC.Enabled    := False;
  except
  end;
  try
    if vAvulsa and Habilitar then
      ECodigoFUN.Enabled    := True
    else
      ECodigoFUN.Enabled    := False;
  except
  end;
  try
    if CConfiguracao.Empresa <> empLuciano then
    begin
      if vAvulsa and Habilitar then
        ECodigoCLI.Enabled    := True
      else
        ECodigoCLI.Enabled    := False;
    end    
    else
      ECodigoCLI.Enabled    := Habilitar;
  except
  end;
  try
    if vAvulsa and Habilitar then
      EEntradaSaida.Enabled    := True
    else
      EEntradaSaida.Enabled    := False;
  except
  end;
  try
    ECodigoTRN.Enabled    := Habilitar;
  except
  end;
  try
    ECodigoCAG.Enabled    := Habilitar;
  except
  end;
  try
    EDataEmissao.Enabled   := Habilitar;
  except
  end;
  try
    EDataEntradaSaida.Enabled  := Habilitar;
  except
  end;
  try
    EHora.Enabled  := Habilitar;
  except
  end;
  try
    if estado = 1 then
      ECFOP.Enabled          := Habilitar
    else
      ECFOP.Enabled          := False;
  except
  end;
  try
    EFrete.Enabled         := Habilitar;
  except
  end;
  try
    EICMSFrete.Enabled         := Habilitar;
  except
  end;
  try
    ESeguro.Enabled        := Habilitar;
  except
  end;
  try
    EOutras.Enabled    := Habilitar;
  except
  end;
  try
    if estado = 1 then
      ETipoNota.Enabled    := Habilitar
    else
      ETipoNota.Enabled    := False;
  except
  end;
  try
    ETipoTransporte.Enabled    := Habilitar;
  except
  end;
  try
    ETipoFrete.Enabled    := Habilitar;
  except
  end;
  try
    EPlaca.Enabled := Habilitar;
  except
  end;
  try
    EPlacaUF.Enabled := Habilitar;
  except
  end;
  try
    EQuantidade.Enabled := Habilitar;
  except
  end;
  try
    EEspecie.Enabled    := Habilitar;
  except
  end;
  try
    ENumero.Enabled     := Habilitar;
  except
  end;
  try
    EMarca.Enabled      := Habilitar;
  except
  end;
  try
    EPesoBruto.Enabled  := Habilitar;
  except
  end;
  try
    EPesoLiquido.Enabled    := Habilitar;
  except
  end;
  try
    EObservacao.Enabled    := Habilitar;
  except
  end;
end;


procedure TNotaFiscal.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  CarregaDados;
end;

procedure TNotaFiscal.CarregaDados;
begin
//Situações
// 0  Pendente
// 2  Nota Impressa
// 3 Nota Cancelada
  try
    ECFOP.KeyValue  := CFOP;
  except
  end;
  try
    ETipoNota.KeyValue := TipoNota;
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text  := formatDateTime('dd/mm/yyyy hh:mm',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text  := formatDateTime('dd/mm/yyyy hh:mm',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    ECodigoNTF.Text  := IntToStr(CodigoNTF);
  except
  end;
  try
    EPedidoCNC.Text:= IntToStr(PedidoCNC);
  except
  end;
  try
    EPedido.Text  := IntToStr(Pedido);
  except
  end;
  try
    EClienteCNC.Text  := IntToStr(ClienteCNC);
  except
  end;
  try
    ECodigoCLI.Text  := IntToStr(CodigoCLI);
  except
  end;
  try
    ECodigoFOR.Text  := IntToStr(CodigoFOR);
  except
  end;
  try
    ECodigoFUN.Text  := IntToStr(CodigoFUN);
  except
  end;
  try
    ECodigoTRN.Text  := IntToStr(CodigoTRN);
  except
  end;
  try
    ECodigoCAG.Text  := IntToStr(CodigoCAG);
  except
  end;
  try
    if DataEmissao > 0 then
      EDataEmissao.Text  := formatDateTime('dd/mm/yyyy',DataEmissao)
    else
      EDataEmissao.Clear;
  except
  end;
  try
    if DataEntradaSaida > 0 then
      EDataEntradaSaida.Text  := formatDateTime('dd/mm/yyyy',DataEntradaSaida)
    else
      EDataEntradaSaida.Clear;
  except
  end;
  try
    if DataEntradaSaida > 0 then
      EHora.Text  := formatDateTime('hh:mm',DataEntradaSaida)
    else
      EHora.Clear;
  except
  end;
  try
    EEntradaSaida.ItemIndex  := EntradaSaida;
  except
  end;

  try
    ENotaFiscal.Text  := IntToStr(NotaFiscal);
  except
  end;
  try
    ESerie.Text  := Serie;
  except
  end;
  try
    ESubSerie.Text  := SubSerie;
  except
  end;
  try
    ESelo.Text  := IntToStr(Selo);
  except
  end;
  try
    EAIDF.Text  := IntToStr(AIDF);
  except
  end;
  try
    EBaseICMS.Text  := format('%.2f',[BaseICMS]);
  except
  end;
  try
    EICMS.Text  := format('%.2f',[ICMS]);
  except
  end;
  try
    EBaseSub.Text  := format('%.2f',[BaseSub]);
  except
  end;
  try
    EICMSSub.Text  := format('%.2f',[ICMSSub]);
  except
  end;
  try
    ETotalServico.Text  := format('%.2f',[TotalServico]);
  except
  end;
  try
    ETotalProduto.Text  := format('%.2f',[TotalProduto]);
  except
  end;
  try
    ETotalNota.Text  := format('%.2f',[TotalNota]);
  except
  end;
  try
    EFrete.Text  := format('%.2f',[Frete]);
  except
  end;
  try
    EICMSFrete.Text  := format('%.2f',[ICMSFrete]);
  except
  end;
  try
    ESeguro.Text  := format('%.2f',[Seguro]);
  except
  end;
  try
    EOutras.Text  := format('%.2f',[Outras]);
  except
  end;
  try
    EIPI.Text  := format('%.2f',[IPI]);
  except
  end;
  try
    EBaseISS.Text  := format('%.2f',[BaseISS]);
  except
  end;
  try
    EISS.Text  := format('%.2f',[ISS]);
  except
  end;
  try
    ETipoTransporte.ItemIndex := TipoTransporte;
  except
  end;
  try
    ETipoFrete.ItemIndex := TipoFrete;
  except
  end;
  try
    EPlaca.Text  := Placa;
  except
  end;
  try
    ItemComboBox(EPlacaUF,PlacaUF);
  except
  end;
  try
    EQuantidade.Text  := format('%.2f',[Quantidade]);
  except
  end;
  try
    EEspecie.Text  := Especie;
  except
  end;
  try
    EMarca.Text  := Marca;
  except
  end;
  try
    ENumero.Text  := Numero;
  except
  end;
  try
    EPesoBruto.Text  := format('%.2f',[PesoBruto]);
  except
  end;
  try
    EPesoLiquido.Text  := format('%.2f',[PesoLiquido]);
  except
  end;
  try
    EEndereco.Text        := Endereco;
  except
  end;
  try
    EBairro.Text          := Bairro;
  except
  end;
  try
    EMunicipio.Text       := Municipio;
  except
  end;
  try
    EUF.Text              := UF;
  except
  end;
  try
    ECEP.Text             := CEP;
  except
  end;
  try
    ECodPagamento.Text  := IntToStr(CodPagamento);
  except
  end;
  try
    ECodPagamento2.Text  := IntToStr(CodPagamento2);
  except
  end;
  try
    if CodigoTRO > 0 then
      ECodigoTRO.Text  := IntToStr(CodigoTRO)
    else
      ECodigoTRO.Clear;
  except
  end;
  try
    ESituacao.ItemIndex := Situacao;
  except
  end;
  try
    EObservacao.Text      := Observacao;
  except
  end;
end;

constructor TNotaFiscal.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'NOTA_FISCAL';

     { Code to perform other tasks when the component is created }

end;

function TNotaFiscal.Deletar(CdCNC,CdNTF:Integer):Boolean;
var
  sNota: string;
begin
  Result := False;
  If not(localizarCod(CdNTF,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      sNota := IntToStr(NotaFiscal);
      if Delete then
      Begin
        Result := True;
        RegistrarDel(CdCNC,1780(*NotaFiscal*),CdNTF,'Nota:'+sNota);
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TNotaFiscal.Destroy;
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

function TNotaFiscal.FinalizaEdicao(vAvulsa:Boolean):Boolean;
var
  mensagem:string;
  Aux:TDataSetNotifyEvent;
begin
  mensagem := '';
  if mensagem <> '' then
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
      if Inserirauto(vAvulsa) then
      Begin
        Result := true;
        Estado:=0;
        AtualizaControles(False);
      end
      else
        Result := False;
    End
    Else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        Result := True;
        Estado:=0;
        AtualizaControles(False);
      end
      else
        Result := False;
    End
    else
      Result := False;
    AfterScroll:=Aux;
  end;
end;


{ Insere um Nota Fiscal }
function TNotaFiscal.Inserir(CNC,NTF,PCNC,Ped,PCF,CdFOR,TRN,CNCCLI,CLI,FUN,PNota,PAIDF,PES,PTipN,PTipT,PTipF,PSel,Sit,Con,PNC,PP,PP2,Arq:integer;PB,PICMS,PBS,PICMSS,PTS,PTP,PTN,PIPI,PFre,ICMSF,QTD,BISS,PISS,PO:Double;PSer,PSubS,OBS,PUF:String;DEM,DES:TDateTime):Boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if Tabela = '' then
    Tabela := 'NOTA_FISCAL';
  if NTF=0 then
    Cod    := ProximoCodigo('NTF_CODIGO')
  else
    Cod    := NTF;
  If VerificaRegistroExiste('CNC_ORIGEM='+IntToStr(CNC)+' AND NTF_CODIGO='+IntToStr(Cod)) Then
    ShowMessage('Não foi possível inserir o registro da tabela '+Tabela+'. Já existe!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT NOTA_FISCAL '+
        '(NTF_CODIGO,CNC_CODIGO,CNC_ORIGEM,USU_CODIGO,NTF_DT_CADASTRO '+
        ',CAG_CODIGO,CNC_PEDIDO,NTF_PEDIDO,NTF_CFOP,FOR_CODIGO,TRN_CODIGO '+
        ',CNC_CLIENTE,CLI_CODIGO,FUN_CODIGO,NTF_NOTA_FISCAL,NTF_AIDF '+
        ',NTF_ENTRADA_SAIDA,NTF_TIPO_NOTA,NTF_TIPO_TRANSPORTE,NTF_TIPO_FRETE '+
        ',NTF_SITUACAO,NTF_NOTA_CUPOM,NTF_BASE_ICMS,NTF_ICMS,NTF_BASE_ICMS_SUB '+
        ',NTF_ICMS_SUB,NTF_BASE_ISS,NTF_ISS,NTF_TOTAL_SERVICO,NTF_TOTAL_PRODUTO '+
        ',NTF_SEGURO,NTF_OUTRAS,NTF_TOTAL_NOTA,NTF_IPI,NTF_CONHECIMENTO '+
        ',NTF_FRETE,NTF_ICMS_FRETE,NTF_QUANTIDADE,NTF_SERIE,NTF_SUBSERIE '+
        ',NTF_SELO,NTF_OBSERVACAO,NTF_DT_EMISSAO,NTF_DT_ENTRADA_SAIDA '+
        ',NTF_COD_PAGAMENTO,NTF_COD_PAGAMENTO_2,NTF_AVULSA,FUN_ARQUITETO '+
        ',NTF_UF,NTF_MAQUINA) VALUES '+
        '( '+IntToStr(Cod)+ //NTF_CODIGO
        ', '+IntToStr(CNC)+ //CNC_CODIGO
        ', '+IntToStr(CentroDeCusto)+ //CNCOrigem
        ', '+IntToStr(CConfiguracao.CodigoUSU)+ //USU_CODIGO
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+ //DtCadastro
        ',0 '+//CAG_CODIGO
        ', '+IntToStr(PCNC)+ //PedidoCNC
        ', '+IntToStr(Ped)+ //Pedido
        ', '+IntToStr(PCF)+ //CFOP
        ', '+IntToStr(CdFOR)+ //FOR_CODIGO
        ', '+IntToStr(TRN)+ //TRN_CODIGO
        ', '+IntToStr(CNCCLI)+ //CNC_CLIENTE
        ', '+IntToStr(CLI)+ //CLI_CODIGO
        ', '+IntToStr(FUN)+ //FUN_CODIGO
        ', '+IntToStr(PNota)+ //NTF_NOTA_FISCAL
        ', '+IntToStr(PAIDF)+ //NTF_AIDF
        ', '+IntToStr(PES)+ //NTF_ENTRADA_SAIDA
        ', '+IntToStr(PTipN)+ //NTF_TIPO_NOTA
        ', '+IntToStr(PTipT)+ //NTF_TIPO_TRANPORTE
        ', '+IntToStr(PTipF)+ //NTF_TIPO_FRETE
        ', '+IntToStr(Sit)+ //NTF_SITUACAO
        ', '+IntToStr(PNC)+ //NTF_NOTA_CUPOM
        ', '+VirgPonto(PB)+ //NTF_BASE_ICMS
        ', '+VirgPonto(PICMS)+ //NTF_ICMS
        ', '+VirgPonto(PBS)+ //NTF_BASE_ICMS_SUB
        ', '+VirgPonto(PICMSS)+ //NTF_ICMS_SUB
        ', '+VirgPonto(BISS)+ //NTF_BASE_ISS
        ', '+VirgPonto(PISS)+ //NTF_ISS
        ', '+VirgPonto(PTS)+ //NTF_TOTAL_SERVICO
        ', '+VirgPonto(PTP)+ //NTF_TOTAL_PRODUTO
        ',0'+ //NTF_SEGURO
        ', '+VirgPonto(PO)+ //NTF_OUTRAS
        ', '+VirgPonto(PTN)+ //NTF_TOTAL_NOTA
        ', '+VirgPonto(PIPI)+ //NTF_IPI
        ', '+IntToStr(Con)+ //NTF_CONHECIMENTO
        ', '+VirgPonto(PFRE)+ //NTF_FRETE
        ', '+VirgPonto(ICMSF)+ //NTF_ICMS_FRETE
        ', '+VirgPonto(QTD)+ //NTF_QUANTIDADE
        ',"'+PSER+'" '+ //NTF_SERIE
        ',"'+PSubS+'" '+ //NTF_SERIE_SUB
        ', '+IntToStr(PSel)+ //NTF_SELO
        ',"'+OBS+'" '+ //NTF_OBSERVACAO
        ',"'+MesDia(DEM)+'" '+ //NTF_DT_EMISSAO
        ',"'+MesDia(DES)+'" '+ //NTF_DT_ENTRADA_SAIDA
        ', '+IntToStr(PP)+ //NTF_COD_PAGAMENTO
        ', '+IntToStr(PP2)+ //NTF_COD_PAGAMENTO_2
        ',0'+ //NTF_AVULSA
        ', '+IntToStr(Arq)+ //FUN_ARQUITETO
        ',"'+PUF+'" '+ //NTF_UF
        ', '+IntToStr(Maquina)+')'); //NTF_MAQUINA
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
    end;
  end;
end;

function TNotaFiscal.InserirAuto(vAvulsa:Boolean=False):Boolean;
var
  CdTRO: integer;
begin
  result:=False;
  try
    CdTRO := StrToInt(ECodigoTRO.Text);
  except
    CdTRO := 0;
  end;

  try
    append;
    try
      CodigoUSU        := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataCadastro     := CConfiguracao.DataHora;
    except
    end;
    try
      MaquinaNTF       := Maquina;
    except
    end;
    try
      CodigoNTF        := StrToInt(ECodigoNTF.Text);
    except
    end;
    try
      CNCOrigem        :=  CentroDeCusto;
    except
    end;
    try
      CodigoCNC        :=  CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoUSU        := CConfiguracao.CodigoUSU;
    except
    end;
    try
      PedidoCNC        := StrToInt(EPedidoCNC.Text);
    except
    end;
    try
      Pedido           := StrToInt(EPedido.Text);
    except
    end;
    try
      ClienteCNC       := StrToInt(EClienteCNC.Text);
    except
    end;
    try
      CodigoCLI        := StrToInt(ECodigoCLI.Text);
    except
    end;
    try
      CodigoFOR        := StrToInt(ECodigoFOR.Text);
    except
    end;
    try
      CodigoFUN        := StrToInt(ECodigoFUN.Text);
    except
    end;
    try
      CodigoTRN        := StrToInt(ECodigoTRN.Text);
    except
    end;
    try
      CodigoCAG       := 0;
    except
    end;
    try
      DataEmissao     := StrToDateTime(EDataEmissao.Text);
    except
    end;
    try
      DataEntradaSaida:= StrToDateTime(EDataEntradaSaida.Text+' '+EHora.Text);
    except
      try
        DataEntradaSaida:= StrToDate(EDataEntradaSaida.Text);
      except
      end;
    end;
    try
      EntradaSaida       := EEntradaSaida.ItemIndex;
    except
    end;
    try
      TipoNota           := ETipoNota.KeyValue;
    except
    end;
    try
      NotaFiscal      := StrToInt(ENotaFiscal.Text);
    except
    end;
    try
      Serie               := ESerie.Text;
    except
    end;
    try
      SubSerie            := ESubSerie.Text;
    except
    end;
    try
      Selo            := StrToInt(ESelo.Text);
    except
    end;
    try
      AIDF            := StrToInt(EAIDF.Text);
    except
    end;
    try
      CFOP             := ECFOP.KeyValue;
    except
    end;
    try
      BaseICMS        := StrToFloat(EBaseICMS.Text);
    except
    end;
    try
      ICMS            := StrToFloat(EICMS.Text);
    except
    end;
    try
      BaseSub         := StrToFloat(EBasesub.Text);
    except
    end;
    try
      ICMSSub         := StrToFloat(EICMSSub.Text);
    except
    end;
    try
      TotalServico   := StrToFloat(ETotalServico.Text);
    except
    end;
    try
      TotalProduto   := StrToFloat(ETotalProduto.Text);
    except
    end;
    try
      TotalNota       := StrToFloat(ETotalNota.Text);
    except
    end;
    try
      Conhecimento    := StrToInt(EConhecimento.Text);
    except
    end;
    try
      Frete           := StrToFloat(EFrete.Text);
    except
    end;
    try
      ICMSFrete       := StrToFloat(EICMSFrete.Text);
    except
    end;
    try
      Seguro          := StrToFloat(ESeguro.Text);
    except
    end;
    try
      Outras          := StrToFloat(EOutras.Text);
    except
    end;
    try
      IPI             := StrToFloat(EIPI.Text);
    except
    end;
    try
      BaseISS         := StrToFloat(EBaseISS.Text);
    except
    end;
    try
      ISS             := StrToFloat(EISS.Text);
    except
    end;
    try
      TipoTransporte := ETipoTransporte.ItemIndex;
    except
    end;
    try
      TipoFrete      := ETipoFrete.ItemIndex;
    except
    end;
    try
      Placa           := EPlaca.Text;
    except
    end;
    try
      PlacaUF         := EPlacaUF.Text;
    except
    end;
    try
      Quantidade      := StrToFloat(EQuantidade.Text);
    except
    end;
    try
      Especie         := EEspecie.Text;
    except
    end;
    try
      Marca           := EMarca.Text;
    except
    end;
    try
      Numero          := ENumero.Text;
    except
    end;
    try
      PesoBruto       := StrToFloat(EPesoBruto.Text);
    except
    end;
    try
      PesoLiquido     := StrToFloat(EPesoLiquido.Text);
    except
    end;
    try
      Endereco        := EEndereco.Text;
    except
    end;
    try
      Bairro          := EBairro.Text;
    except
    end;
    try
      Municipio       := EMunicipio.Text;
    except
    end;
    try
      UF              := EUF.Text;
    except
    end;
    try
      CEP             := ECEP.Text;
    except
    end;
    try
      Endereco        := EEndereco.Text;
    except
    end;
    try
      Bairro          := EBairro.Text;
    except
    end;
    try
      Municipio       := EMunicipio.Text;
    except
    end;
    try
      UF              := EUF.Text;
    except
    end;
    try
      CEP             := ECEP.Text;
    except
    end;
    try
      NotaCupom      := 1;
    except
    end;
    try
      Avulsa          := vAvulsa;
    except
    end;
    try
      CodPagamento    := StrToInt(ECodPagamento.Text);
    except
    end;
    try
      CodPagamento2   := StrToInt(ECodPagamento2.Text);
    except
    end;
    try
      CodigoTRO       := CdTRO;
    except
    end;
    try
      Situacao        := ESituacao.ItemIndex;
    except
    end;
    try
      Observacao      := EObservacao.Text;
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

procedure TNotaFiscal.LimpaDados;
begin
  try
    ECodigoNTF.Clear;
  except
  end;
  try
    ECodigoFUN.Clear;
  except
  end;
  try
    ECodigoFOR.Clear;
  except
  end;
  try
    ECodigoTRO.Clear;
  except
  end;
  try
    ECFOP.KeyValue := 0;
  except
  end;
  try
    EAIDF.Clear;
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
    ENotaFiscal.Clear;
  except
  end;
  try
    EPedidoCNC.Clear;
  except
  end;
  try
    EPedido.Clear;
  except
  end;
  try
    EClienteCNC.Clear;
  except
  end;
  try
    ECodigoCLI.Clear;
  except
  end;
  try
    EDataEmissao.Clear;
  except
  end;
  try
    EDataEntradaSaida.Clear;
  except
  end;
  try
    EHora.Clear;
  except
  end;
  try
    EBaseICMS.Clear;
  except
  end;
  try
    EICMS.Clear;
  except
  end;
  try
    EBaseSub.Clear;
  except
  end;
  try
    EICMSSub.Clear;
  except
  end;
  try
    ETotalServico.Clear;
  except
  end;
  try
    ETotalProduto.Clear;
  except
  end;
  try
    ETotalNota.Clear;
  except
  end;
  try
    EFrete.Clear;
  except
  end;
  try
    EICMSFrete.Clear;
  except
  end;
  try
    ESeguro.Clear;
  except
  end;
  try
    EOutras.Clear;
  except
  end;
  try
    EIPI.Clear;
  except
  end;
  try
    EBaseISS.Clear;
  except
  end;
  try
    EISS.Clear;
  except
  end;
  try
    ECodigoTRN.Clear;
  except
  end;
  try
    EEntradaSaida.ItemIndex := -1;
  except
  end;
  try
    ETipoNota.KeyValue := 0;
  except
  end;
  try
    ETipoFrete.ItemIndex := -1;
  except
  end;
  try
    ETipoTransporte.ItemIndex := -1;
  except
  end;
  try
    EPlaca.Clear;
  except
  end;
  try
    EPlacaUF.ItemIndex:=-1;
  except
  end;
  try
    EQuantidade.Clear;
  except
  end;
  try
    EEspecie.Clear;
  except
  end;
  try
    EMarca.Clear;
  except
  end;
  try
    ENumero.Clear;
  except
  end;
  try
    EPesoBruto.Clear;
  except
  end;
  try
    EPesoLiquido.Clear;
  except
  end;
  try
    EEndereco.Clear;
  except
  end;
  try
    EBairro.Clear;
  except
  end;
  try
    EMunicipio.Clear;
  except
  end;
  try
    EUF.Clear;
  except
  end;
  try
    ECEP.Clear;
  except
  end;
  try
    ECodPagamento.Clear;
  except
  end;
  try
    ECodPagamento2.Clear;
  except
  end;
  try
    ESituacao.ItemIndex := -1;
  except
  end;
  try
    EObservacao.Clear;
  except
  end;
end;

{ Localiza um cliente }
function TNotaFiscal.LocalizarCod(CdNTF,CdCNC:Integer):Boolean;
begin
  If (CdNTF<>CodigoNTF) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;NTF_CODIGO', vararrayof([CdCNC, CdNTF]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TNotaFiscal.LocalizarPed(CdPedCNC,Ped:Integer):Boolean;
begin
  if (CdPedCNC <> PedidoCNC) and (Ped <> Pedido) then
  Begin
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text:='SELECT * FROM NOTA_FISCAL WHERE CNC_PEDIDO='+
            IntToStr(CdPedCNC)+' AND NTF_PEDIDO='+IntToStr(Ped);
      Open;
      Result := not isEmpty;
    end;
  end
  else
    Result := True;
end;

procedure TNotaFiscal.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TNotaFiscal.PreparaInsercao(Manual:Boolean; vAvulsa:Boolean=False);
begin
  ProximoCodigo('NTF_CODIGO');
  if not vAvulsa then
  Begin
    if not Manual then
    Begin
      CConfiguracao.QueryComandos.SQL.Text:='SELECT * FROM CATRACA'+
        ' WHERE CNC_CODIGO='+IntToStr(CConfiguracao.CodigoCNC)+
        ' AND CTR_TIPO_NOTA=0';
      CConfiguracao.QueryComandos.Open;
    end
    else
    Begin
      CConfiguracao.QueryComandos.SQL.Text:='SELECT * FROM CATRACA'+
        ' WHERE CNC_CODIGO='+IntToStr(CConfiguracao.CodigoCNC)+
        ' AND CTR_TIPO_NOTA=1';
      CConfiguracao.QueryComandos.Open;
    end;
  end;
  try
    EDataCadastro.Text  := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora)
  except
  end;
  try
    EDataAlterado.Clear;
  except
  end;
  try
    EPedidoCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  except
  end;
  try
    EPedido.Clear;
  except
  end;
  try
    EClienteCNC.Text := '1'
  except
  end;
  try
    ECodigoCLI.Clear;
  except
  end;
  try
    ECodigoFOR.Clear;
  except
  end;
  try
    ECodigoFUN.Clear;
  except
  end;
  try
    ECodigoTRN.Clear;
  except
  end;
  try
    ECodigoCAG.Text := '0';
  except
  end;
  try
    if not vAvulsa then
      EDataEmissao.Text  := formatDateTime('dd/mm/yyyy',CConfiguracao.Data);
  except
  end;
  try
    EDataEntradaSaida.Text  := formatDateTime('dd/mm/yyyy',CConfiguracao.Data);
  except
  end;
  try
    EHora.Clear;
  except
  end;
  try
    if not vAvulsa then
      ENotaFiscal.Text  := CConfiguracao.QueryComandos.FieldByName('CTR_NOTA_FISCAL').asString;
  except
  end;
  try
    if not vAvulsa then
      ESerie.Text  := CConfiguracao.QueryComandos.FieldByName('CTR_NOTA_SERIE').asString;
  except
  end;
  try
    if not vAvulsa then
      ESubSerie.Text  := CConfiguracao.QueryComandos.FieldByName('CTR_NOTA_SUBSERIE').asString;
  except
  end;
  try
    if not vAvulsa then
      ESelo.Text  := CConfiguracao.QueryComandos.FieldByName('CTR_NOTA_SELO').asString;
  except
  end;
  try
    if not vAvulsa then
      EAIDF.Text  := CConfiguracao.QueryComandos.FieldByName('CTR_NOTA_AIDF').asString;
  except
  end;
  try
    EBaseICMS.Text := '0,00';
  except
  end;
  try
    EICMS.Text := '0,00';
  except
  end;
  try
    EBaseSub.Text := '0,00';
  except
  end;
  try
    EICMSSub.Text := '0,00';
  except
  end;
  try
    ETotalServico.Text := '0,00';
  except
  end;
  try
    ETotalProduto.Text := '0,00';
  except
  end;
  try
    ETotalNota.Text := '0,00';
  except
  end;
  try
    EFrete.Text := '0,00';
  except
  end;
  try
    ESeguro.Text := '0,00';
  except
  end;
  try
    EOutras.Text := '0,00';
  except
  end;
  try
    EIPI.Text := '0,00';
  except
  end;
  try
    EBaseISS.Text := '0,00';
  except
  end;
  try
    EISS.Text := '0,00';
  except
  end;
  try
    ETipoTransporte.ItemIndex := 0
  except
  end;
  try
    if CConfiguracao.Empresa <> 2 then
      ETipoFrete.ItemIndex := 0
    else
      ETipoFrete.ItemIndex := 1;
  except
  end;
  try
    EPlaca.Clear;
  except
  end;
  try
    EPlacaUF.ItemIndex := -1;
  except
  end;
  try
    EQuantidade.Text := '0';
  except
  end;
  try
    EEspecie.Clear;
  except
  end;
  try
    if not vAvulsa then
      EMarca.Text := CConfiguracao.QueryComandos.FieldByName('CTR_NOTA_MARCA').asString;
  except
  end;
  try
    ENumero.Clear;
  except
  end;
  try
    EPesoBruto.Text := '0,00';
  except
  end;
  try
    EPesoLiquido.Text := '0,00';
  except
  end;
  try
    EEndereco.Clear;
  except
  end;
  try
    EBairro.Clear;
  except
  end;
  try
    EMunicipio.Clear;
  except
  end;
  try
    EUF.Clear;
  except
  end;
  try
    ECEP.Clear;
  except
  end;
  try
    ECodPagamento.Clear;
  except
  end;
  try
    ECodPagamento2.Clear;
  except
  end;
  try
    ESituacao.ItemIndex := 0;
  except
  end;
  try
    EObservacao.Clear;
  except
  end;
  if not vAvulsa then
    if not Manual then
      ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE CATRACA SET CTR_NOTA_FISCAL=CTR_NOTA_FISCAL+1, '+
        ' CTR_NOTA_SELO=CTR_NOTA_SELO+1 '+
        ' WHERE CNC_CODIGO='+IntToStr(CConfiguracao.CodigoCNC)+
        ' AND CTR_TIPO_NOTA=0')
    else
      ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE CATRACA SET CTR_NOTA_FISCAL=CTR_NOTA_FISCAL+1 '+
        ' WHERE CNC_CODIGO='+IntToStr(CConfiguracao.CodigoCNC)+
        ' AND CTR_TIPO_NOTA=1');

  Estado:=1;
  AtualizaControles(True,vAvulsa);
end;

function TNotaFiscal.deletarauto:Boolean;
var
  CdCNC, CdNTF: integer;
  sNota: string;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdNTF := CodigoNTF;
    sNota := IntToStr(NotaFiscal);
    if Delete then
    Begin
      Result := True;
      RegistrarDel(CdCNC,1780(*NotaFiscal*),CdNTF,'Nota:'+sNota);
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
