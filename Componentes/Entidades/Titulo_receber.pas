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
unit Titulo_receber;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Pedido_de_Venda, Cliente, Configuracao, Conta_de_Caixa, 
     Item_Pedido_Venda, Forma_de_pagamento, FatFin, CentroCusto, 
     AgenteFin, Funcoes, Variants;

type
  TTitulo_receber = class(TSQuery)
    private
      { Private fields of TTitulo_receber }
        { Storage for property AgenciaNumero }
        FAgenciaNumero : String;
        { Storage for property CAgenteFin }
        FCAgenteFin : TAgenteFin;
        { Storage for property CCentroCusto }
        FCCentroCusto : TCentroCusto;
        { Storage for property CCliente }
        FCCliente : TCliente;
        { Storage for property CFatorFinanceira }
        FCFatorFinanceira : TFatorFinanceira;
        { Storage for property CForma_de_Pagamento }
        FCForma_de_Pagamento : TForma_de_pagamento;
        { Storage for property CItem_Pedido }
        FCItem_Pedido : TItem_Pedido_Venda;
        { Storage for property CPedido }
        FCPedido : TPedido_de_Venda;
        { Storage for property CV }
        FCV : String;
        { Storage for property ChequeCNC }
        FChequeCNC : Integer;
        { Storage for property ChequeDevolvido }
        FChequeDevolvido : Boolean;
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodigoAGF }
        FCodigoAGF : Integer;
        { Storage for property CodigoBOL }
        FCodigoBOL : Integer;
        { Storage for property CodigoCCX }
        FCodigoCCX : Integer;
        { Storage for property CodigoCCXRecebimento }
        FCodigoCCXRecebimento : Integer;
        { Storage for property CodigoCHQ }
        FCodigoCHQ : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoCPC }
        FCodigoCPC : Integer;
        { Storage for property CodigoFPE }
        FCodigoFPE : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoMCC }
        FCodigoMCC : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoTRC }
        FCodigoTRC : Integer;
        { Storage for property CodigoTRF }
        FCodigoTRF : Integer;
        { Storage for property Cred_Cli }
        FCred_Cli : Double;
        { Storage for property Credcli }
        FCredcli : Double;
        { Storage for property Custodia }
        FCustodia : String;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property DataEmissaoBoleto }
        FDataEmissaoBoleto : TDateTime;
        { Storage for property DataOriginal }
        FDataOriginal : TDateTime;
        { Storage for property DataRGBSituacao }
        FDataRGBSituacao : TDateTime;
        { Storage for property DataRecebimentoBoleto }
        FDataRecebimentoBoleto : TDateTime;
        { Storage for property DataVerificado }
        FDataVerificado : TDateTime;
        { Storage for property Desconto }
        FDesconto : Double;
        { Storage for property DtPromessa }
        FDtPromessa : TDateTime;
        { Storage for property DtVisitado }
        FDtVisitado : TDateTime;
        { Storage for property EAgenciaNumero }
        FEAgenciaNumero : TEdit;
        { Storage for property EClienteCNC }
        FEClienteCNC : TDBLookupComboBox;
        { Storage for property ECodigoAGF }
        FECodigoAGF : TDBLookupComboBox;
        { Storage for property ECodigoBOL }
        FECodigoBOL : TEdit;
        { Storage for property ECodigoCCX }
        FECodigoCCX : TDBLookupComboBox;
        { Storage for property ECodigoCCXRecebimento }
        FECodigoCCXRecebimento : TDBLookupComboBox;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoCPC }
        FECodigoCPC : TEdit;
        { Storage for property ECodigoFPE }
        FECodigoFPE : TEdit;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoTRC }
        FECodigoTRC : TEdit;
        { Storage for property ECred_Cli }
        FECred_Cli : Tedit;
        { Storage for property ECustodia }
        FECustodia : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataINI }
        FEDataINI : TMaskedit;
        { Storage for property EDesconto }
        FEDesconto : TEdit;
        { Storage for property EFormaPG }
        FEFormaPG : TDBLookupComboBox;
        { Storage for property EGerouMovimento }
        FEGerouMovimento : TCheckBox;
        { Storage for property EJuros }
        FEJuros : TEdit;
        { Storage for property ELocal }
        FELocal : TEdit;
        { Storage for property EMelhorData }
        FEMelhorData : TCheckbox;
        { Storage for property ENumero }
        FENumero : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property EPagamento }
        FEPagamento : TEdit;
        { Storage for property ESequencia }
        FESequencia : TEdit;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property ETipo }
        FETipo : TDBLookupComboBox;
        { Storage for property ETipoPag }
        FETipoPag : TDBLookupCombobox;
        { Storage for property ETituloORI }
        FETituloORI : TEdit;
        { Storage for property EValor }
        FEValor : TEdit;
        { Storage for property EValorPG }
        FEValorPG : TEdit;
        { Storage for property EVencimento }
        FEVencimento : TMaskEdit;
        { Storage for property EVencimentoORI }
        FEVencimentoORI : TMaskEdit;
        { Storage for property FaturamentoCNC }
        FFaturamentoCNC : Integer;
        { Storage for property GerouMovimento }
        FGerouMovimento : Boolean;
        { Storage for property Juros }
        FJuros : Double;
        { Storage for property Local }
        FLocal : String;
        { Storage for property MovimentoContaCorrenteCNC }
        FMovimentoContaCorrenteCNC : Integer;
        { Storage for property Numero }
        FNumero : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Pagamento }
        FPagamento : TDateTime;
        { Storage for property PagamentoParcial }
        FPagamentoParcial : Boolean;
        { Storage for property Processo }
        FProcesso : Integer;
        { Storage for property Reabertura }
        FReabertura : Integer;
        { Storage for property Sequencia }
        FSequencia : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property TipoPag }
        FTipoPag : Integer;
        { Storage for property TipoPedido }
        FTipoPedido : Integer;
        { Storage for property TituloANT }
        FTituloANT : Integer;
        { Storage for property TituloORI }
        FTituloORI : Integer;
        { Storage for property Valor }
        FValor : Double;
        { Storage for property ValorPG }
        FValorPG : Double;
        { Storage for property Vencimento }
        FVencimento : TDateTime;
        { Storage for property VencimentoORI }
        FVencimentoORI : TDateTime;
        { Storage for property Verificado }
        FVerificado : Integer;
        { Storage for property Visitado }
        FVisitado : Boolean;

      { Private methods of TTitulo_receber }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property AgenciaNumero }
        function GetAgenciaNumero : String;
        { Write method for property AgenciaNumero }
        procedure SetAgenciaNumero(Value : String);
        { Read method for property CV }
        function GetCV : String;
        { Write method for property CV }
        procedure SetCV(Value : String);
        { Read method for property ChequeCNC }
        function GetChequeCNC : Integer;
        { Read method for property ChequeDevolvido }
        function GetChequeDevolvido : Boolean;
        { Write method for property ChequeDevolvido }
        procedure SetChequeDevolvido(Value : Boolean);
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Write method for property ClienteCNC }
        procedure SetClienteCNC(Value : Integer);
        { Read method for property CodigoAGF }
        function GetCodigoAGF : Integer;
        { Write method for property CodigoAGF }
        procedure SetCodigoAGF(Value : Integer);
        { Read method for property CodigoBOL }
        function GetCodigoBOL : Integer;
        { Write method for property CodigoBOL }
        procedure SetCodigoBOL(Value : Integer);
        { Read method for property CodigoCCX }
        function GetCodigoCCX : Integer;
        { Write method for property CodigoCCX }
        procedure SetCodigoCCX(Value : Integer);
        { Read method for property CodigoCCXRecebimento }
        function GetCodigoCCXRecebimento : Integer;
        { Write method for property CodigoCCXRecebimento }
        procedure SetCodigoCCXRecebimento(Value : Integer);
        { Read method for property CodigoCHQ }
        function GetCodigoCHQ : Integer;
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property CodigoCPC }
        function GetCodigoCPC : Integer;
        { Write method for property CodigoCPC }
        procedure SetCodigoCPC(Value : Integer);
        { Read method for property CodigoFPE }
        function GetCodigoFPE : Integer;
        { Write method for property CodigoFPE }
        procedure SetCodigoFPE(Value : Integer);
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Write method for property CodigoFUN }
        procedure SetCodigoFUN(Value : Integer);
        { Read method for property CodigoMCC }
        function GetCodigoMCC : Integer;
        { Write method for property CodigoMCC }
        procedure SetCodigoMCC(Value : Integer);
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Write method for property CodigoPDV }
        procedure SetCodigoPDV(Value : Integer);
        { Read method for property CodigoTRC }
        function GetCodigoTRC : Integer;
        { Write method for property CodigoTRC }
        procedure SetCodigoTRC(Value : Integer);
        { Read method for property CodigoTRF }
        function GetCodigoTRF : Integer;
        { Write method for property CodigoTRF }
        procedure SetCodigoTRF(Value : Integer);
        { Read method for property Cred_Cli }
        function GetCred_Cli : Double;
        { Write method for property Cred_Cli }
        procedure SetCred_Cli(Value : Double);
        { Read method for property Credcli }
        function GetCredcli : Double;
        { Write method for property Credcli }
        procedure SetCredcli(Value : Double);
        { Read method for property Custodia }
        function GetCustodia : String;
        { Write method for property Custodia }
        procedure SetCustodia(Value : String);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : TDateTime);
        { Read method for property DataEmissaoBoleto }
        function GetDataEmissaoBoleto : TDateTime;
        { Write method for property DataEmissaoBoleto }
        procedure SetDataEmissaoBoleto(Value : TDateTime);
        { Read method for property DataOriginal }
        function GetDataOriginal : TDateTime;
        { Write method for property DataOriginal }
        procedure SetDataOriginal(Value : TDateTime);
        { Read method for property DataRGBSituacao }
        function GetDataRGBSituacao : TDateTime;
        { Read method for property DataRecebimentoBoleto }
        function GetDataRecebimentoBoleto : TDateTime;
        { Write method for property DataRecebimentoBoleto }
        procedure SetDataRecebimentoBoleto(Value : TDateTime);
        { Read method for property DataVerificado }
        function GetDataVerificado : TDateTime;
        { Write method for property DataVerificado }
        procedure SetDataVerificado(Value : TDateTime);
        { Read method for property Desconto }
        function GetDesconto : Double;
        { Write method for property Desconto }
        procedure SetDesconto(Value : Double);
        { Read method for property DtPromessa }
        function GetDtPromessa : TDateTime;
        { Write method for property DtPromessa }
        procedure SetDtPromessa(Value : TDateTime);
        { Read method for property DtVisitado }
        function GetDtVisitado : TDateTime;
        { Write method for property DtVisitado }
        procedure SetDtVisitado(Value : TDateTime);
        { Read method for property FaturamentoCNC }
        function GetFaturamentoCNC : Integer;
        { Write method for property FaturamentoCNC }
        procedure SetFaturamentoCNC(Value : Integer);
        { Read method for property GerouMovimento }
        function GetGerouMovimento : Boolean;
        { Write method for property GerouMovimento }
        procedure SetGerouMovimento(Value : Boolean);
        { Read method for property Juros }
        function GetJuros : Double;
        { Write method for property Juros }
        procedure SetJuros(Value : Double);
        { Read method for property Local }
        function GetLocal : String;
        { Write method for property Local }
        procedure SetLocal(Value : String);
        { Read method for property MovimentoContaCorrenteCNC }
        function GetMovimentoContaCorrenteCNC : Integer;
        { Write method for property MovimentoContaCorrenteCNC }
        procedure SetMovimentoContaCorrenteCNC(Value : Integer);
        { Read method for property Numero }
        function GetNumero : String;
        { Write method for property Numero }
        procedure SetNumero(Value : String);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Pagamento }
        function GetPagamento : TDateTime;
        { Write method for property Pagamento }
        procedure SetPagamento(Value : TDateTime);
        { Read method for property PagamentoParcial }
        function GetPagamentoParcial : Boolean;
        { Write method for property PagamentoParcial }
        procedure SetPagamentoParcial(Value : Boolean);
        { Read method for property Processo }
        function GetProcesso : Integer;
        { Write method for property Processo }
        procedure SetProcesso(Value : Integer);
        { Read method for property Reabertura }
        function GetReabertura : Integer;
        { Write method for property Reabertura }
        procedure SetReabertura(Value : Integer);
        { Read method for property Sequencia }
        function GetSequencia : String;
        { Write method for property Sequencia }
        procedure SetSequencia(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);
        { Read method for property TipoPag }
        function GetTipoPag : Integer;
        { Write method for property TipoPag }
        procedure SetTipoPag(Value : Integer);
        { Read method for property TipoPedido }
        function GetTipoPedido : Integer;
        { Write method for property TipoPedido }
        procedure SetTipoPedido(Value : Integer);
        { Read method for property TituloANT }
        function GetTituloANT : Integer;
        { Write method for property TituloANT }
        procedure SetTituloANT(Value : Integer);
        { Read method for property TituloORI }
        function GetTituloORI : Integer;
        { Write method for property TituloORI }
        procedure SetTituloORI(Value : Integer);
        { Read method for property Valor }
        function GetValor : Double;
        { Write method for property Valor }
        procedure SetValor(Value : Double);
        { Read method for property ValorPG }
        function GetValorPG : Double;
        { Write method for property ValorPG }
        procedure SetValorPG(Value : Double);
        { Read method for property Vencimento }
        function GetVencimento : TDateTime;
        { Write method for property Vencimento }
        procedure SetVencimento(Value : TDateTime);
        { Read method for property VencimentoORI }
        function GetVencimentoORI : TDateTime;
        { Write method for property VencimentoORI }
        procedure SetVencimentoORI(Value : TDateTime);
        { Read method for property Verificado }
        function GetVerificado : Integer;
        { Write method for property Verificado }
        procedure SetVerificado(Value : Integer);
        { Read method for property Visitado }
        function GetVisitado : Boolean;
        { Write method for property Visitado }
        procedure SetVisitado(Value : Boolean);

    protected
      { Protected fields of TTitulo_receber }

      { Protected methods of TTitulo_receber }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TTitulo_receber }

      { Public methods of TTitulo_receber }
        { Altera um Abastecimento }
        function Alterar(CNC, TRC,CLI,PDV,CCX,CCXRec,PTipoPG,PSituacao,PTipo: Integer; POBS ,PSeq,PNumero: String; DtVenc,DtPag:TDateTime; PValor,PValorPG,PCred:Double;AGF,PCliCNC,PTituloAnt,PTRCORI:Integer;PMov:Boolean=False):boolean;
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function GerarTitAvulso(CdPDV,CdCLICNC,CdCLI, CdAGF, PTipoPag,CdTRF:Integer;VTot, PFator:Double; VCartao,TemEntrada, PJurosEntrada:Boolean;PPrazo,POBS, PCV:string; DtDataBase:TDateTime; CNCFPE:integer=0;FPE:integer=0;PTipoPed:integer=0):Boolean;
        function GerarTitPrazo(CdCNCCLI, CdCLI:integer;PCV:string;VTot, VEntrada:Double; TemEntrada, vCartao:Boolean; POBS:string=''; PCampo:string='TRT_CODIGO'; PTipoPed:integer=0;PCentPrimeira:Boolean=True):Boolean;
        function GerarTitPrazoLBM(VTot, VEntrada:Double; PCV:string; TemEntrada,vCartao:Boolean; POBS:string=''; PCampo:string='TRT_CODIGO';PTipoPed:integer=0):Boolean;
        function GerarTitVista(CdCNCCLI,CdCLI:integer; PCV:string;VTot:Double;POBS:string='';PCampo:string='TRT_CODIGO';PTipoPed:integer=0):Boolean;
        { Insere um Titulo }
        function Inserir(CNC,TRC,CLI,PDV,CCX,CCXRec,PTipoPG,PTipo,CdTRF,Reab: Integer; DtVenc,DtPag,DTORI,DTVerif :TDateTime; POBS,PSeq,PNumero, PCV: String; PValor,PValorPG,PCred: Double;AGF,PCliCNC,PSit,PTitAnt,PTRCORI,PTipoPed:integer;PMov,PCHQDev:Boolean):boolean;
        function InserirAuto:Boolean;
        function InserirEsp(CdCNC,CdTRC,PCliCNC,CdCLI,CdPDV,CdCCX,PTipoPG,PTipo,CdAGF, CdBOL: Integer; PVencimento :TDateTime; PSequencia,PNumero,PObs: String; PValor: Double):boolean;
        procedure LimpaCampos;
        { Localiza um abastecimeto }
        function LocalizarCod(CdTRC, CdCNC:Integer):Boolean;
        function PagarTitulo(CdCNC,CdTRC,CdFUN: integer; PValorPago:Double;PTipoPag,CdCCXRec,PSit,CdCHQCNC,CdCHQ,CdMCCCNC,CdMCC:integer;PDataPgto,PDtCheque:TdateTime;POBS:String;PCred,PDesc,PJuros:Double;PMov, PPagParcial:Boolean):Boolean;
        function PegarDataVenc(DiaPag:String):TDateTime;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function QtdeTitulos(Temp:String):Integer;
        function ReabreTitulo(PPagParcial:Boolean; PCHQDev:Boolean=False; PUsuAut:integer=0):Boolean;
        function VerificaProcesso(Valor:integer):Boolean;
        function deletarauto:Boolean;

    published
      { Published properties of TTitulo_receber }
        property AgenciaNumero : String
             read GetAgenciaNumero write SetAgenciaNumero;
        property CAgenteFin : TAgenteFin read FCAgenteFin write FCAgenteFin;
        property CCentroCusto : TCentroCusto
             read FCCentroCusto write FCCentroCusto;
        property CCliente : TCliente read FCCliente write FCCliente;
        property CFatorFinanceira : TFatorFinanceira
             read FCFatorFinanceira write FCFatorFinanceira;
        property CForma_de_Pagamento : TForma_de_pagamento
             read FCForma_de_Pagamento write FCForma_de_Pagamento;
        property CItem_Pedido : TItem_Pedido_Venda
             read FCItem_Pedido write FCItem_Pedido;
        property CPedido : TPedido_de_Venda read FCPedido write FCPedido;
        property CV : String read GetCV write SetCV;
        property ChequeCNC : Integer read GetChequeCNC write FChequeCNC;
        property ChequeDevolvido : Boolean
             read GetChequeDevolvido write SetChequeDevolvido;
        property ClienteCNC : Integer read GetClienteCNC write SetClienteCNC;
        property CodigoAGF : Integer read GetCodigoAGF write SetCodigoAGF;
        property CodigoBOL : Integer read GetCodigoBOL write SetCodigoBOL;
        property CodigoCCX : Integer read GetCodigoCCX write SetCodigoCCX;
        property CodigoCCXRecebimento : Integer
             read GetCodigoCCXRecebimento write SetCodigoCCXRecebimento;
        property CodigoCHQ : Integer read GetCodigoCHQ write FCodigoCHQ;
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property CodigoCPC : Integer read GetCodigoCPC write SetCodigoCPC;
        property CodigoFPE : Integer read GetCodigoFPE write SetCodigoFPE;
        property CodigoFUN : Integer read GetCodigoFUN write SetCodigoFUN;
        property CodigoMCC : Integer read GetCodigoMCC write SetCodigoMCC;
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        { Código do Abastecimento }
        property CodigoTRC : Integer read GetCodigoTRC write SetCodigoTRC;
        property CodigoTRF : Integer read GetCodigoTRF write SetCodigoTRF;
        property Cred_Cli : Double read GetCred_Cli write SetCred_Cli;
        property Credcli : Double read GetCredcli write SetCredcli;
        property Custodia : String read GetCustodia write SetCustodia;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write SetDataCadastro;
        property DataEmissaoBoleto : TDateTime
             read GetDataEmissaoBoleto write SetDataEmissaoBoleto;
        property DataOriginal : TDateTime
             read GetDataOriginal write SetDataOriginal;
        property DataRGBSituacao : TDateTime
             read GetDataRGBSituacao write FDataRGBSituacao;
        property DataRecebimentoBoleto : TDateTime
             read GetDataRecebimentoBoleto write SetDataRecebimentoBoleto;
        property DataVerificado : TDateTime
             read GetDataVerificado write SetDataVerificado;
        property Desconto : Double read GetDesconto write SetDesconto;
        property DtPromessa : TDateTime read GetDtPromessa write SetDtPromessa;
        property DtVisitado : TDateTime read GetDtVisitado write SetDtVisitado;
        property EAgenciaNumero : TEdit
             read FEAgenciaNumero write FEAgenciaNumero;
        property EClienteCNC : TDBLookupComboBox
             read FEClienteCNC write FEClienteCNC;
        property ECodigoAGF : TDBLookupComboBox
             read FECodigoAGF write FECodigoAGF;
        property ECodigoBOL : TEdit read FECodigoBOL write FECodigoBOL;
        property ECodigoCCX : TDBLookupComboBox
             read FECodigoCCX write FECodigoCCX;
        property ECodigoCCXRecebimento : TDBLookupComboBox
             read FECodigoCCXRecebimento write FECodigoCCXRecebimento;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoCPC : TEdit read FECodigoCPC write FECodigoCPC;
        property ECodigoFPE : TEdit read FECodigoFPE write FECodigoFPE;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoTRC : TEdit read FECodigoTRC write FECodigoTRC;
        property ECred_Cli : Tedit read FECred_Cli write FECred_Cli;
        property ECustodia : TEdit read FECustodia write FECustodia;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataINI : TMaskedit read FEDataINI write FEDataINI;
        property EDesconto : TEdit read FEDesconto write FEDesconto;
        property EFormaPG : TDBLookupComboBox read FEFormaPG write FEFormaPG;
        property EGerouMovimento : TCheckBox
             read FEGerouMovimento write FEGerouMovimento;
        property EJuros : TEdit read FEJuros write FEJuros;
        property ELocal : TEdit read FELocal write FELocal;
        property EMelhorData : TCheckbox read FEMelhorData write FEMelhorData;
        property ENumero : TEdit read FENumero write FENumero;
        property EOBS : TMemo read FEOBS write FEOBS;
        property EPagamento : TEdit read FEPagamento write FEPagamento;
        property ESequencia : TEdit read FESequencia write FESequencia;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property ETipo : TDBLookupComboBox read FETipo write FETipo;
        property ETipoPag : TDBLookupCombobox read FETipoPag write FETipoPag;
        property ETituloORI : TEdit read FETituloORI write FETituloORI;
        property EValor : TEdit read FEValor write FEValor;
        property EValorPG : TEdit read FEValorPG write FEValorPG;
        property EVencimento : TMaskEdit read FEVencimento write FEVencimento;
        property EVencimentoORI : TMaskEdit
             read FEVencimentoORI write FEVencimentoORI;
        property FaturamentoCNC : Integer
             read GetFaturamentoCNC write SetFaturamentoCNC;
        property GerouMovimento : Boolean
             read GetGerouMovimento write SetGerouMovimento;
        property Juros : Double read GetJuros write SetJuros;
        property Local : String read GetLocal write SetLocal;
        property MovimentoContaCorrenteCNC : Integer
             read GetMovimentoContaCorrenteCNC write SetMovimentoContaCorrenteCNC;
        property Numero : String read GetNumero write SetNumero;
        property OBS : String read GetOBS write SetOBS;
        property Pagamento : TDateTime read GetPagamento write SetPagamento;
        property PagamentoParcial : Boolean
             read GetPagamentoParcial write SetPagamentoParcial;
        property Processo : Integer read GetProcesso write SetProcesso;
        property Reabertura : Integer read GetReabertura write SetReabertura;
        property Sequencia : String read GetSequencia write SetSequencia;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;
        property TipoPag : Integer read GetTipoPag write SetTipoPag;
        { 0 - PDV; 1 - PDS; 2 - PCR }
        property TipoPedido : Integer read GetTipoPedido write SetTipoPedido;
        { Código do Título gerador }
        property TituloANT : Integer read GetTituloANT write SetTituloANT;
        property TituloORI : Integer read GetTituloORI write SetTituloORI;
        property Valor : Double read GetValor write SetValor;
        property ValorPG : Double read GetValorPG write SetValorPG;
        property Vencimento : TDateTime read GetVencimento write SetVencimento;
        property VencimentoORI : TDateTime
             read GetVencimentoORI write SetVencimentoORI;
        property Verificado : Integer read GetVerificado write SetVerificado;
        property Visitado : Boolean read GetVisitado write SetVisitado;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TTitulo_receber with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TTitulo_receber]);
end;

{ Method to set variable and property values and create objects }
procedure TTitulo_receber.AutoInitialize;
begin
     FEAgenciaNumero := nil;
     FEClienteCNC := nil;
     FECodigoAGF := nil;
     FECodigoBOL := nil;
     FECodigoCCX := nil;
     FECodigoCCXRecebimento := nil;
     FECodigoCLI := nil;
     FECodigoCPC := nil;
     FECodigoFPE := nil;
     FECodigoPDV := nil;
     FECodigoTRC := nil;
     FECred_Cli := nil;
     FECustodia := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataINI := nil;
     FEDesconto := nil;
     FEFormaPG := nil;
     FEGerouMovimento := nil;
     FEJuros := nil;
     FELocal := nil;
     FEMelhorData := nil;
     FENumero := nil;
     FEOBS := nil;
     FEPagamento := nil;
     FESequencia := nil;
     FESituacao := nil;
     FETipo := nil;
     FETipoPag := nil;
     FETituloORI := nil;
     FEValor := nil;
     FEValorPG := nil;
     FEVencimento := nil;
     FEVencimentoORI := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TTitulo_receber.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAgenciaNumero then
        FEAgenciaNumero := nil;
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodigoAGF then
        FECodigoAGF := nil;
     if AComponent = FECodigoBOL then
        FECodigoBOL := nil;
     if AComponent = FECodigoCCX then
        FECodigoCCX := nil;
     if AComponent = FECodigoCCXRecebimento then
        FECodigoCCXRecebimento := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoCPC then
        FECodigoCPC := nil;
     if AComponent = FECodigoFPE then
        FECodigoFPE := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoTRC then
        FECodigoTRC := nil;
     if AComponent = FECred_Cli then
        FECred_Cli := nil;
     if AComponent = FECustodia then
        FECustodia := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataINI then
        FEDataINI := nil;
     if AComponent = FEDesconto then
        FEDesconto := nil;
     if AComponent = FEFormaPG then
        FEFormaPG := nil;
     if AComponent = FEGerouMovimento then
        FEGerouMovimento := nil;
     if AComponent = FEJuros then
        FEJuros := nil;
     if AComponent = FELocal then
        FELocal := nil;
     if AComponent = FEMelhorData then
        FEMelhorData := nil;
     if AComponent = FENumero then
        FENumero := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEPagamento then
        FEPagamento := nil;
     if AComponent = FESequencia then
        FESequencia := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
     if AComponent = FETipoPag then
        FETipoPag := nil;
     if AComponent = FETituloORI then
        FETituloORI := nil;
     if AComponent = FEValor then
        FEValor := nil;
     if AComponent = FEValorPG then
        FEValorPG := nil;
     if AComponent = FEVencimento then
        FEVencimento := nil;
     if AComponent = FEVencimentoORI then
        FEVencimentoORI := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TTitulo_receber.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property AgenciaNumero }
function TTitulo_receber.GetAgenciaNumero : String;
begin
  try
    Result := Self.fieldByName('TRC_AGENCIA_NUMERO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property AgenciaNumero }
procedure TTitulo_receber.SetAgenciaNumero(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRC_AGENCIA_NUMERO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRC_AGENCIA_NUMERO"!');
  end;
end;

{ Read method for property CV }
function TTitulo_receber.GetCV : String;
begin
  try
    Result := Self.fieldByName('TRC_CV').asString;
  except
    result:= '';
  end;
end;

{ Write method for property CV }
procedure TTitulo_receber.SetCV(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_CV').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_CV"!');
    end;
end;

{ Read method for property ChequeCNC }
function TTitulo_receber.GetChequeCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CHEQUE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property ChequeDevolvido }
function TTitulo_receber.GetChequeDevolvido : Boolean;
begin
  try
    result := (Self.fieldByName('TRC_CHEQUE_DEVOLVIDO').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property ChequeDevolvido }
procedure TTitulo_receber.SetChequeDevolvido(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('TRC_CHEQUE_DEVOLVIDO').asInteger := 1
      else
        Self.fieldByName('TRC_CHEQUE_DEVOLVIDO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_CHEQUE_DEVOLVIDO"!');
    end;
end;

{ Read method for property ClienteCNC }
function TTitulo_receber.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property ClienteCNC }
procedure TTitulo_receber.SetClienteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodigoAGF }
function TTitulo_receber.GetCodigoAGF : Integer;
begin
  try
    Result := Self.fieldByName('AGF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoAGF }
procedure TTitulo_receber.SetCodigoAGF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_CODIGO"!');
    end;
end;

{ Read method for property CodigoBOL }
function TTitulo_receber.GetCodigoBOL : Integer;
begin
  try
    Result := Self.fieldByName('BOL_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoBOL }
procedure TTitulo_receber.SetCodigoBOL(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('BOL_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "BOL_CODIGO"!');
    end;
end;

{ Read method for property CodigoCCX }
function TTitulo_receber.GetCodigoCCX : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCCX }
procedure TTitulo_receber.SetCodigoCCX(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_CODIGO"!');
    end;
end;

{ Read method for property CodigoCCXRecebimento }
function TTitulo_receber.GetCodigoCCXRecebimento : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO_REC').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCCXRecebimento }
procedure TTitulo_receber.SetCodigoCCXRecebimento(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CCX_CODIGO_REC').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CCX_CODIGO_REC"!');
    end;
end;

{ Read method for property CodigoCHQ }
function TTitulo_receber.GetCodigoCHQ : Integer;
begin
  try
    Result := Self.fieldByName('CHQ_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCLI }
function TTitulo_receber.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCLI }
procedure TTitulo_receber.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoCPC }
function TTitulo_receber.GetCodigoCPC : Integer;
begin
  try
    Result := Self.fieldByName('CPC_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property CodigoCPC }
procedure TTitulo_receber.SetCodigoCPC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CPC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CPC_CODIGO"!');
    end;
end;

{ Read method for property CodigoFPE }
function TTitulo_receber.GetCodigoFPE : Integer;
begin
  try
    Result := Self.fieldByName('FPE_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFPE }
procedure TTitulo_receber.SetCodigoFPE(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPE_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPE_CODIGO"!');
    end;
end;

{ Read method for property CodigoFUN }
function TTitulo_receber.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFUN }
procedure TTitulo_receber.SetCodigoFUN(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_CODIGO"!');
    end;
end;

{ Read method for property CodigoMCC }
function TTitulo_receber.GetCodigoMCC : Integer;
begin
  try
    Result := Self.fieldByName('MCC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoMCC }
procedure TTitulo_receber.SetCodigoMCC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('MCC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "MCC_CODIGO"!');
    end;
end;

{ Read method for property CodigoPDV }
function TTitulo_receber.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property CodigoPDV }
procedure TTitulo_receber.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
    end;
end;

{ Read method for property CodigoTRC }
function TTitulo_receber.GetCodigoTRC : Integer;
begin
  try
    Result := Self.fieldByName('TRC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTRC }
procedure TTitulo_receber.SetCodigoTRC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_CODIGO"!');
    end;
end;

{ Read method for property CodigoTRF }
function TTitulo_receber.GetCodigoTRF : Integer;
begin
  try
    Result := Self.fieldByName('TRF_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoTRF }
procedure TTitulo_receber.SetCodigoTRF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRF_CODIGO"!');
    end;
end;

{ Read method for property Cred_Cli }
function TTitulo_receber.GetCred_Cli : Double;
begin
  try
    Result := Self.fieldByName('TRC_CRED_CLI').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Cred_Cli }
procedure TTitulo_receber.SetCred_Cli(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_CRED_CLI').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_CRED_CLI"!');
    end;
end;

{ Read method for property Credcli }
function TTitulo_receber.GetCredcli : Double;
begin
  try
    Result := Self.fieldByName('TRC_CRED_CLI').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Credcli }
procedure TTitulo_receber.SetCredcli(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_CRED_CLI').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_CRED_CLI"!');
    end;
end;

{ Read method for property Custodia }
function TTitulo_receber.GetCustodia : String;
begin
  try
    Result := Self.fieldByName('TRC_CUSTODIA').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Custodia }
procedure TTitulo_receber.SetCustodia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_CUSTODIA').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_CODIGO"!');
    end;
end;


{ Read method for property DataAlterado }
function TTitulo_receber.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_DT_ALTERADO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DataAlterado }
procedure TTitulo_receber.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_DT_ALTERADO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_DT_ALTERADO"!');
    end;
end;

{ Read method for property DataCadastro }
function TTitulo_receber.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TTitulo_receber.SetDataCadastro(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_DT_CADASTRO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_DT_CADASTRO"!');
    end;
end;

{ Read method for property DataEmissaoBoleto }
function TTitulo_receber.GetDataEmissaoBoleto : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_DT_EMISSAO_BOLETO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataEmissaoBoleto }
procedure TTitulo_receber.SetDataEmissaoBoleto(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_DT_EMISSAO_BOLETO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_DT_EMISSAO_BOLETO"!');
    end;
end;

{ Read method for property DataOriginal }
function TTitulo_receber.GetDataOriginal : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_DTORIGINAL').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataOriginal }
procedure TTitulo_receber.SetDataOriginal(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_DTORIGINAL').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_DTORIGINAL"!');
    end;
end;

{ Read method for property DataRGBSituacao }
function TTitulo_receber.GetDataRGBSituacao : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_RGB_DT_SITUACAO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataRecebimentoBoleto }
function TTitulo_receber.GetDataRecebimentoBoleto : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_DT_RECEBIMENTO_BOLETO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataRecebimentoBoleto }
procedure TTitulo_receber.SetDataRecebimentoBoleto(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_DT_RECEBIMENTO_BOLETO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_DT_RECEBIMENTO_BOLETO"!');
    end;
end;

{ Read method for property DataVerificado }
function TTitulo_receber.GetDataVerificado : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_DT_VERIFICADO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Write method for property DataVerificado }
procedure TTitulo_receber.SetDataVerificado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_DT_VERIFICADO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_DT_VERIFICADO"!');
    end;
end;

{ Read method for property Desconto }
function TTitulo_receber.GetDesconto : Double;
begin
  try
    Result := Self.fieldByName('TRC_DESCONTO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Desconto }
procedure TTitulo_receber.SetDesconto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_DESCONTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_DESCONTO"!');
    end;
end;

{ Read method for property DtPromessa }
function TTitulo_receber.GetDtPromessa : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_RGB_DT_PROMESSA').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DtPromessa }
procedure TTitulo_receber.SetDtPromessa(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_RGB_DT_PROMESSA').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_RGB_DT_PROMESSA"!');
    end;
end;

{ Read method for property DtVisitado }
function TTitulo_receber.GetDtVisitado : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_RGB_DT_VISITADO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property DtVisitado }
procedure TTitulo_receber.SetDtVisitado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_RGB_DT_VISITADO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_RGB_DT_VISITADO"!');
    end;
end;

{ Read method for property FaturamentoCNC }
function TTitulo_receber.GetFaturamentoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_FATURAMENTO_PENDENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property FaturamentoCNC }
procedure TTitulo_receber.SetFaturamentoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_FATURAMENTO_PENDENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_FATURAMENTO_PENDENTE"!');
    end;
end;

{ Read method for property GerouMovimento }
function TTitulo_receber.GetGerouMovimento : Boolean;
begin
  try
    if Self.fieldByName('TRC_GEROU_MOVIMENTO').asInteger = 1 then
      Result := True
    else
      Result := False;
  except
    result:= False;
  end;
end;

{ Write method for property GerouMovimento }
procedure TTitulo_receber.SetGerouMovimento(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('TRC_GEROU_MOVIMENTO').asInteger := 1
      else
        Self.fieldByName('TRC_GEROU_MOVIMENTO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_GEROU_MOVIMENTO"!');
    end;
end;

{ Read method for property Juros }
function TTitulo_receber.GetJuros : Double;
begin
  try
    Result := Self.fieldByName('TRC_JUROS').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Juros }
procedure TTitulo_receber.SetJuros(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_JUROS').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_JUROS"!');
    end;
end;

{ Read method for property Local }
function TTitulo_receber.GetLocal : String;
begin
  try
    Result := Self.fieldByName('TRC_LOCAL').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Local }
procedure TTitulo_receber.SetLocal(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRC_LOCAL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRC_LOCAL"!');
  end;
end;

{ Read method for property MovimentoContaCorrenteCNC }
function TTitulo_receber.GetMovimentoContaCorrenteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_MOVIMENTO_CONTA_CORRENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property MovimentoContaCorrenteCNC }
procedure TTitulo_receber.SetMovimentoContaCorrenteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_MOVIMENTO_CONTA_CORRENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_MOVIMENTO_CONTA_CORRENTE"!');
    end;
end;

{ Read method for property Numero }
function TTitulo_receber.GetNumero : String;
begin
  try
    Result := Self.fieldByName('TRC_NUMERO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Numero }
procedure TTitulo_receber.SetNumero(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRC_NUMERO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRC_NUMERO"!');
  end;
end;

{ Read method for property OBS }
function TTitulo_receber.GetOBS : String;
begin
  try
    Result := Self.fieldByName('TRC_OBSERVACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TTitulo_receber.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('TRC_OBSERVACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "TRC_OBSERVACAO"!');
  end;
end;

{ Read method for property Pagamento }
function TTitulo_receber.GetPagamento : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_PAGAMENTO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property Pagamento }
procedure TTitulo_receber.SetPagamento(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_PAGAMENTO').asDateTime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_PAGAMENTO"!');
    end;
end;


{ Read method for property PagamentoParcial }
function TTitulo_receber.GetPagamentoParcial : Boolean;
begin
  try
    if Self.fieldByName('TRC_PAGAMENTO_PARCIAL').asInteger = 1 then
      Result := True
    else
      Result := False;
  except
    result:= False;
  end;
end;

{ Write method for property PagamentoParcial }
procedure TTitulo_receber.SetPagamentoParcial(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('TRC_PAGAMENTO_PARCIAL').asInteger := 1
      else
        Self.fieldByName('TRC_PAGAMENTO_PARCIAL').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_PAGAMENTO_PARCIAL"!');
    end;
end;

{ Read method for property Processo }
function TTitulo_receber.GetProcesso : Integer;
begin
  try
    Result := Self.fieldByName('TRC_RGB_PROCESSO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Processo }
procedure TTitulo_receber.SetProcesso(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_RGB_PROCESSO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_RGB_PROCESSO"!');
    end;
end;

{ Read method for property Reabertura }
function TTitulo_receber.GetReabertura : Integer;
begin
  try
    Result := Self.fieldByName('TRC_REABERTURA').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Reabertura }
procedure TTitulo_receber.SetReabertura(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_REABERTURA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_REABERTURA"!');
    end;
end;

{ Read method for property Sequencia }
function TTitulo_receber.GetSequencia : String;
begin
  try
    Result := Self.fieldByName('TRC_SEQUENCIA').asString;
  except
    result:='';
  end;
end;

{ Write method for property Sequencia }
procedure TTitulo_receber.SetSequencia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_SEQUENCIA').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_SEQUENCIA"!');
    end;
end;

{ Read method for property Situacao }
function TTitulo_receber.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('TRC_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TTitulo_receber.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_SITUACAO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_SITUACAO"!');
    end;
end;

{ Read method for property Tipo }
function TTitulo_receber.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('TRC_TIPO_DOC').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Tipo }
procedure TTitulo_receber.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_TIPO_DOC').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_TIPO_DOC"!');
    end;
end;

{ Read method for property TipoPag }
function TTitulo_receber.GetTipoPag : Integer;
begin
  try
    Result := Self.fieldByName('TRC_TIPO_PAG').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoPag }
procedure TTitulo_receber.SetTipoPag(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_TIPO_PAG').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_TIPO_PAG"!');
    end;
end;

{ Read method for property TipoPedido }
function TTitulo_receber.GetTipoPedido : Integer;
begin
  try
    Result := Self.fieldByName('TRC_TIPO_PEDIDO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property TipoPedido }
procedure TTitulo_receber.SetTipoPedido(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_TIPO_PEDIDO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_TIPO_PEDIDO"!');
    end;
end;

{ Read method for property TituloANT }
function TTitulo_receber.GetTituloANT : Integer;
begin
  try
    Result := Self.fieldByName('TRC_TITULOANT').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TituloANT }
procedure TTitulo_receber.SetTituloANT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_TITULOANT').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_TITULOANT"!');
    end;
end;

{ Read method for property TituloORI }
function TTitulo_receber.GetTituloORI : Integer;
begin
  try
    Result := Self.fieldByName('TRC_TRCORIGINAL').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TituloORI }
procedure TTitulo_receber.SetTituloORI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_TRCORIGINAL').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_TRCORIGINAL"!');
    end;
end;

{ Read method for property Valor }
function TTitulo_receber.GetValor : Double;
begin
  try
    Result := Self.fieldByName('TRC_VALOR').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Valor }
procedure TTitulo_receber.SetValor(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_VALOR').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_VALOR"!');
    end;
end;


{ Read method for property ValorPG }
function TTitulo_receber.GetValorPG : Double;
begin
  try
    Result := Self.fieldByName('TRC_VALOR_PAGO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property ValorPG }
procedure TTitulo_receber.SetValorPG(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_VALOR_PAGO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_VALOR_PAGO"!');
    end;
end;

{ Read method for property Vencimento }
function TTitulo_receber.GetVencimento : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_VENCIMENTO').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property Vencimento }
procedure TTitulo_receber.SetVencimento(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_VENCIMENTO').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_VENCIMENTO"!');
    end;
end;

{ Read method for property VencimentoORI }
function TTitulo_receber.GetVencimentoORI : TDateTime;
begin
  try
    Result := Self.fieldByName('TRC_DTORIGINAL').asDateTime;
  except
    result:= 0
  end;
end;

{ Write method for property VencimentoORI }
procedure TTitulo_receber.SetVencimentoORI(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_DTORIGINAL').asDatetime := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_DTORIGINAL"!');
    end;
end;

{ Read method for property Verificado }
function TTitulo_receber.GetVerificado : Integer;
begin
  try
    Result := Self.fieldByName('TRC_VERIFICADO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Verificado }
procedure TTitulo_receber.SetVerificado(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('TRC_VERIFICADO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_VERIFICADO"!');
    end;
end;

{ Read method for property Visitado }
function TTitulo_receber.GetVisitado : Boolean;
begin
  try
    if Self.fieldByName('TRC_RGB_VISITADO').AsInteger = 1 then
      Result := True
    else
      Result := False;
  except
    result:= False
  end;
end;

{ Write method for property Visitado }
procedure TTitulo_receber.SetVisitado(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('TRC_RGB_VISITADO').asInteger := 1
      else
        Self.fieldByName('TRC_RGB_VISITADO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "TRC_RGB_VISITADO"!');
    end;
end;

{ Altera um Abastecimento }
function TTitulo_receber.Alterar(CNC, TRC,CLI,PDV,CCX,CCXRec,PTipoPG,PSituacao,PTipo: Integer; POBS ,PSeq,PNumero: String; DtVenc,DtPag:TDateTime; PValor,PValorPG,PCred:Double;AGF,PCliCNC,PTituloAnt,PTRCORI:Integer;PMov:Boolean=False):boolean;
begin
  result:=false;
  If not(localizarCod(TRC,CNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      edit;
      Cred_Cli            := PCred;
      CodigoCLI           := CLI;
      CodigoCCX           := CCX;
      CodigoCCXRecebimento:= CCXRec;
      CodigoPDV           := PDV;
      CodigoUSU           := CConfiguracao.CodigoUSU;
      DataAlterado        := CConfiguracao.DataHora;
      Numero              := PNumero;
      Sequencia           := PSeq;
      TipoPag             := PTipoPG;
      Valor               := PValor;
      ValorPG             := PValorPG;
      Situacao            := PSituacao;
      Tipo                := PTipo;
      Vencimento          := DtVenc;
      Pagamento           := DtPag;
      OBS                 := POBS;
      CodigoAGF           := AGF;
      ClienteCNC          := PCliCNC;
      TituloANT           := PTituloAnt;
      TituloORI           := PTRCORI;
      GerouMovimento      := PMov;
      try
        Post;
        result:=true;
      except
        Cancel;
        ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
      end;
    except
      ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  End;
end;

function TTitulo_receber.AlterarAuto:Boolean;
var
  sValor, sVencimento, sPDV, sCli, sObs: string;
begin
  Result:=False;
  try
    edit;
    sValor := 'R$ '+format('%.2f',[Valor]);
    sVencimento := ' Venc:'+DateToStr(Vencimento);
    sPDV := ' PDV:'+IntToStr(CodigoPDV);
    sCli := ' CLI:'+IntToStr(ClienteCNC)+'-'+IntToStr(CodigoCLI);
    sObs := ' OBS:'+Obs;
    try
      CodigoCLI := StrToInt(ECodigoCLI.Text);
    except
    end;
    try
      CodigoAGF := ECodigoAGF.KeyValue;
    except
    end;
    try
      ClienteCNC := EClienteCNC.KeyValue;
    except
    end;
    try
      CodigoUSU := CConfiguracao.CodigoUSU;
    except
    end;
    try
      DataAlterado := CConfiguracao.DataHora;
    except
    end;
    try
      Cred_Cli := StrToFloat(ECred_Cli.Text);
    except
    end;
    try
      CodigoCCX := ECodigoCCX.KeyValue;
    except
    end;
    try
      CodigoCCXRecebimento := ECodigoCCXRecebimento.KeyValue;
    except
    end;
    try
      CodigoFPE := StrToInt(ECodigoFPE.Text);
    except
    end;
    try
      CodigoPDV := StrToInt(ECodigoPDV.Text);
    except
    end;
    try
      CodigoBOL := StrToInt(ECodigoBOL.Text);
    except
    end;
    try
      TipoPag  := ETipoPag.KeyValue;
    except
    end;
    try
      Valor  := StrToFloat(EValor.Text);
    except
    end;
    try
      ValorPG  := StrToFloat(EValorPG.Text);
    except
    end;
    try
      Tipo  := ETipo.KeyValue;
    except
    end;
    try
      TipoPag  := ETipoPag.KeyValue;
    except
    end;
    try
      Vencimento := StrToDateTime(EVencimento.Text);
    except
    end;
    try
      Pagamento := StrToDateTime(EPagamento.Text);
    except
    end;
    try
       If ESequencia.Text='' then
         Sequencia:='00'
       Else
         Sequencia := ESequencia.Text;
    except
    end;
     try
       Numero := ENumero.Text;
    except
    end;
    try
      Custodia  := ECustodia.Text;
    except
    end;
    try
      CodigoCCXRecebimento  := ECodigoCCXRecebimento.KeyValue;
    except
    end;
    try
       AgenciaNumero := EAgenciaNumero.Text;
    except
    end;
    try
       Local := ELocal.Text;
    except
    end;
    try
      Situacao := StrToInt(ESituacao.text);
    except
    end;
    try
       OBS := EOBS.Text;
    except
    end;
    try
      GeraLog(4510,CodigoCNC,CodigoTRC,sValor+sVencimento+sPDV+sCLI+sObs);
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

procedure TTitulo_receber.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
   ECodigoCLI.Enabled    :=Habilitar;
  Except
  End;
  Try
   ECodigoFPE.Enabled    :=Habilitar;
  Except
  End;
  Try
   EClienteCNC.Enabled    :=Habilitar;
  Except
  End;
  Try
   ECodigoAGF.Enabled    :=Habilitar;
  Except
  End;
  try
   ECred_Cli.Enabled     := Habilitar;
  except
  end;
  Try
   ECodigoCCX.Enabled    :=Habilitar;
  Except
  End;
  Try
   ECodigoCCXRecebimento.Enabled    :=Habilitar;
  Except
  End;
  Try
   EFormaPG.Enabled      :=Habilitar;
  Except
  End;
  Try
   EVencimento.Enabled   :=Habilitar;
  Except
  End;
  Try
   EValor.Enabled        :=Habilitar;
  Except
  End;
  Try
   ECodigoBOL.Enabled        :=Habilitar;
  Except
  End;
  Try
   EPagamento.Enabled    :=Habilitar;
  Except
  End;
  Try
   EValorPG.Enabled      :=Habilitar;
  Except
  End;
  Try
   ETipo.Enabled         :=Habilitar;
  Except
  End;
  Try
   ETipoPag.Enabled         :=Habilitar;
  Except
  End;
  Try
   ENumero.Enabled       :=Habilitar;
  Except
  End;
  Try
   ESequencia.Enabled       :=Habilitar;
  Except
  End;
  try
    ECodigoCCXRecebimento.Enabled := Habilitar;
  except
  end;
  Try
   EAgenciaNumero.Enabled          :=Habilitar;
  Except
  End;
  Try
   ELocal.Enabled          :=Habilitar;
  Except
  End;
  Try
   EOBS.Enabled          :=Habilitar;
  Except
  End;
end;

procedure TTitulo_receber.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TTitulo_receber.CarregaDados;
begin
  Try
   Case Situacao of
    0: ESituacao.Text:='Em aberto, normal';
    1: ESituacao.Text:='Em aberto, por consignação';
    2: ESituacao.Text:='Liquidado, normal';
    3: ESituacao.Text:='Liquidado, por consignação';
    4: ESituacao.Text:='Liquidado por renegociação';
    5: ESituacao.Text:='Cancelado';
    6: ESituacao.Text:='A Renegociar';
    7: ESituacao.Text:='Perdoado';
    8: ESituacao.Text:='Aberto por renegociação';
   End;
  Except
  End;
  Try
   if DataCadastro=0 then
     EDataCadastro.Text:=''
   else
     EDataCadastro.Text           := FormatDateTime('dd/mm/yyyy HH:MM', DataCadastro);
  Except
  End;
  Try
   if DataAlterado=0 then
     EDataAlterado.Text:=''
   else
     EDataAlterado.Text           := FormatDateTime('dd/mm/yyyy HH:MM', DataAlterado);
  Except
  End;
  Try
   ECodigoCLI.Text       := IntToStr(CodigoCLI);
  Except
  End;
  Try
   EClienteCNC.KeyValue       := ClienteCNC;
  Except
  End;
  Try
   ECodigoAGF.KeyValue       := CodigoAGF;
  Except
  End;
  Try
   ECodigoBOL.Text       := IntToStr(CodigoBOL);
  Except
  End;
  try
   ECred_Cli.Text            := floattoStr(Cred_Cli);
  except
  end;
  Try
   ECodigoCCX.KeyValue       := CodigoCCX;
  Except
  End;
  Try
    ECodigoCCXRecebimento.KeyValue       := CodigoCCXRecebimento;
  Except
  End;
  Try
    ECodigoFPE.Text           := IntToStr(CodigoFPE);
  Except
  End;
  Try
    ECodigoPDV.Text           := IntToStr(CodigoPDV);
  Except
  End;
  Try
    ECodigoTRC.Text           := IntToStr(CodigoTRC);
  Except
  End;
  Try
    ECodigoCPC.Text           := IntToStr(CodigoCPC);
  Except
  End;
  Try
    ETipoPag.KeyValue         := TipoPag;
  Except
  End;
  Try
    if Vencimento=0 then
      EVencimento.Text:=''
    else
      EVencimento.Text      :=FormatDateTime('dd/mm/yyyy', Vencimento);
  Except
  End;
  Try
    if VencimentoORI=0 then
      EVencimentoORI.Text:=''
    else
      EVencimentoORI.Text      :=FormatDateTime('dd/mm/yyyy', VencimentoORI);
  Except
  End;
  Try
    EValor.Text               := Format('%.2f', [Valor]);
  Except
  End;
  Try
    EJuros.Text               := Format('%.2f', [Juros]);
  Except
  End;
  Try
    EDesconto.Text            := Format('%.2f', [Desconto]);
  Except
  End;
  Try
    if Pagamento=0 then
      EPagamento.Text:=''
    else
      EPagamento.Text           := FormatDateTime('dd/mm/yyyy', Pagamento);
  Except
  End;
  Try
    EValorPG.Text             := Format('%.2f', [ValorPG]);
  Except
  End;
  Try
    ECustodia.Text            := Custodia;
  Except
  End;
  Try
    ETipo.KeyValue            := Tipo;
  Except
  End;
  Try
    ETipoPag.KeyValue            := TipoPag;
  Except
  End;
  Try
    ESequencia.Text           := Sequencia;
  Except
  End;
  Try
    ENumero.Text              := Numero;
  Except
  End;
  Try
    ETituloORI.Text              := IntToStr(TituloORI);
  Except
  End;
  try
    ECodigoCCXRecebimento.KeyValue := CodigoCCXRecebimento;
  except
  end;
  try
    EGerouMovimento.Checked := GerouMovimento;
  except
  end;
  Try
    EAgenciaNumero.Text     := AgenciaNumero;
  Except
  End;
  Try
    ELocal.Text                := Local;
  Except
  End;
  Try
    EOBS.Text                := OBS;
  Except
  End;
end;

constructor TTitulo_receber.Create(AOwner: TComponent);
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

destructor TTitulo_receber.Destroy;
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

function TTitulo_receber.FinalizaEdicao:Boolean;
var
  mensagem:string;
  Aux:TDataSetNotifyEvent;
Begin
  Result := False;
  if not VerificaInteiroBranco(ECodigoBOL.Text) then
    ECodigoBOL.Text := '0';

  mensagem:='';
  If not VerificadataBranco(EVencimento.text) Then
    mensagem:=mensagem+'Vencimento incorreto!'+#13;
  if not verificafloat(EValor.text) then
    mensagem:= mensagem + 'Valor digitado incorretamente!'+#13;
  if ECodigoCCX.Text = '' then
    mensagem:= mensagem + 'Conta de Caixa inválida!'+#13;
  if ETipo.Text = '' then
    mensagem:= mensagem + 'Tipo de Documento inválido!'+#13;
  if ETipoPag.Text = '' then
    mensagem:= mensagem + 'Tipo de Pagamento inválido!'+#13;
  if ECodigoAGF.Text = '' then
    mensagem:= mensagem + 'Agente Financeiro inválido!'+#13;
  If mensagem <>'' Then
    ShowMessage(mensagem)
  else
  Begin
    Aux:=AfterScroll;
    AfterScroll:=Nil;
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        AtualizaControles(False);
        Estado:=0;
        Result := True;
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        AtualizaControles(False);
        Estado:=0;
        Result := True;
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TTitulo_receber.GerarTitAvulso(CdPDV,CdCLICNC,CdCLI, CdAGF, PTipoPag,CdTRF:Integer;VTot, PFator:Double; VCartao,TemEntrada, PJurosEntrada:Boolean;PPrazo,POBS, PCV:string; DtDataBase:TDateTime; CNCFPE:integer=0;FPE:integer=0;PTipoPed:integer=0):Boolean;
Type
  TVetor=Array [1..100] of string;
const
  Letra : array [1..26] of string = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
Var
  QtdTit,i,j,pos, iMeses:Integer;
  difCentavos, Centavos, CentavosPrestacao, PrimeiraPrestacao, vValor:Double;
  Vetor: TVetor;
  dia, sPrestacao, sSeq, sNumero:String;
  DtVencimento :TDateTime;
begin
  Result := False;
  if Vtot<=0 then
    exit;
  QtdTit := QtdeTitulos(PPrazo);

  if TemEntrada then
    PrimeiraPrestacao := Arredonda(VTot/QtdTit)
  else
    PrimeiraPrestacao := 0;

  if not TemEntrada or PJurosEntrada then
    sPrestacao  := format('%.2f',[VTot*PFator])
  else
    sPrestacao  := format('%.2f',[(VTot-PrimeiraPrestacao)*PFator]);

  difCentavos := PrimeiraPrestacao;
  if not TemEntrada or PJurosEntrada then
    difCentavos := difCentavos+(QtdTit*StrToFloat(sPrestacao))-PrimeiraPrestacao
  else
    difCentavos := difCentavos+((QtdTit-1)*StrToFloat(sPrestacao));

  if difCentavos < VTot then
    difCentavos := StrToFloat(format('%.2f',[VTot-difCentavos]))
  else
    difCentavos := 0;

  Centavos := 0;
  CentavosPrestacao := 0;
  if (not vCartao) then
  Begin
    Centavos := (QtdTit-1)*(StrToInt(Copy(sPrestacao,Length(sPrestacao)-1,2))/100);
    CentavosPrestacao := (StrToInt(Copy(sPrestacao,Length(sPrestacao)-1,2))/100);
  end;

  if not TemEntrada then
    PrimeiraPrestacao := StrToFloat(sPrestacao);

  For i:=1 to 100 do
    Vetor[i]:='';

  pos:=1;
  j:=1;

  for i:=1 to Length(PPrazo)+1 do
  Begin
    if (PPrazo[i]=';') or (i=Length(PPrazo)+1) then
    Begin
      dia:=Copy(PPrazo,pos,i-pos);
      Vetor[j]:=dia;
      j:=j+1;
      pos:=i+1;
    End;
  End;

  for i:=1 to QtdTit do
  Begin
    if not PJurosEntrada then
    Begin
      if i=1 then
        vValor    := PrimeiraPrestacao + difCentavos + Centavos
      else
        vValor    := StrToFloat(sPrestacao)-CentavosPrestacao;
    end
    else
    Begin
      if i=1 then
        vValor := VTot*PFator + difCentavos
      else
        vValor := VTot*PFator;
    end;

    if CConfiguracao.Empresa = empLBM then
      sNumero   := IntToStr(CdPDV)+Letra[i]
    else
      sNumero   := '';

    iMeses := StrToInt(Vetor[i]) div 30;
    if (StrToInt(Vetor[i]) mod 30) > 0 then
      DtVencimento := Trunc(DtDataBase)+StrToInt(Vetor[i])
    else
      DtVencimento := IncMonth(Trunc(DtDataBase), iMeses);

    If i<=9 then
      sSeq  := '0'+IntToStr(i)
    Else
      sSeq  := IntToStr(i);

    Try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT TITULO_A_RECEBER '+
        '(CNC_CODIGO,CNC_ORIGEM,TRC_CODIGO,USU_CODIGO,TRC_DT_CADASTRO,TRC_DT_ALTERADO '+
        ',PDV_CODIGO,CNC_CLIENTE,CLI_CODIGO,TRC_CRED_CLI,AGF_CODIGO,TRC_TIPO_PEDIDO '+
        ',TRC_NUMERO,TRC_VALOR,TRC_VALOR_PAGO,TRC_DESCONTO,TRC_JUROS,TRC_VENCIMENTO,TRC_SEQUENCIA '+
        ',CCX_CODIGO,CCX_CODIGO_REC,TRC_TIPO_DOC,TRC_TIPO_PAG,CNC_FATURAMENTO_PENDENTE,FPE_CODIGO '+
        ',TRC_CV,TRF_CODIGO,TRC_PAGAMENTO_PARCIAL,TRC_CHEQUE_DEVOLVIDO '+
        ',TRC_SITUACAO,TRC_OBSERVACAO) VALUES '+
        '( '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(CentroDeCusto)+
        ', '+IntToStr(ProximoCodigo('TRC_CODIGO'))+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(CdPDV)+
        ', '+IntToStr(CdCLICNC)+
        ', '+IntToStr(CdCLI)+
        ',0'+ //CreditoCliente
        ', '+IntToStr(CdAGF)+
        ', '+IntToStr(PTipoPed)+
        ',"'+sNumero+'" '+
        ', '+VirgPonto(vValor)+
        ',0'+//ValorPago
        ',0'+//Desconto
        ',0'+//Juros
        ',"'+MesDia(DtVencimento)+'" '+
        ',"'+sSeq+'"'+
        ', '+IntToStr(CConfiguracao.ContRecCli)+
        ', '+IntToStr(CConfiguracao.ContRecCLI)+
        ', '+IntToStr(CConfiguracao.TipoDocumento)+
        ', '+IntToStr(PTipoPag)+
        ', '+IntToStr(CNCFPE)+
        ', '+IntToStr(FPE)+
        ',"'+PCV+'" '+
        ', '+IntToStr(CdTRF)+
        ',0'+//PagamentoParcial
        ',0'+//ChequeDevolvido
        ',0'+//Situação
        ',"'+PObs+'") ');
      Result := True;
    Except
      Result := False;
      Showmessage('Falha ao gerar Título a receber!');
    End;
  end;
end;

function TTitulo_receber.GerarTitPrazo(CdCNCCLI, CdCLI:integer;PCV:string;VTot, VEntrada:Double; TemEntrada, vCartao:Boolean; POBS:string=''; PCampo:string='TRT_CODIGO'; PTipoPed:integer=0;PCentPrimeira:Boolean=True):Boolean;
Type
  TVetor=Array [1..100] of string;
const
  Letra : array [1..26] of string = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
Var
  QtdTit,i,j,pos, iMeses, CdAGF, iTipoPag:Integer;
  difCentavos, Centavos, CentavosPrestacao, PrimeiraPrestacao, vValorAux:Double;
  Vetor: TVetor;
  dia, sPrestacao, sTabela, sCV, sNumero, sSeq :String;
  vDataInicial, vVencimento : TDateTime;
begin
  Result := False;
  if Vtot<=0 then
    exit;

  if PCampo = 'TRT_CODIGO' then
    sTabela := 'TRCTEMP'
  else
    sTabela := 'TITULO_A_RECEBER';

  QtdTit := QtdeTitulos(CForma_de_Pagamento.Prazo);

  if VEntrada>0 then
    PrimeiraPrestacao := Arredonda(vEntrada)
  else if TemEntrada then
    PrimeiraPrestacao := Arredonda(VTot/QtdTit)
  else
    PrimeiraPrestacao := 0;

  if not TemEntrada or CAgenteFin.JurosEntrada then
    sPrestacao  := format('%.2f',[VTot*CFatorFinanceira.Fator])
  else
    sPrestacao  := format('%.2f',[(VTot-PrimeiraPrestacao)*CFatorFinanceira.Fator]);

  difCentavos := PrimeiraPrestacao;
  if not TemEntrada or CAgenteFin.JurosEntrada then
    difCentavos := difCentavos+(QtdTit*StrToFloat(sPrestacao))-PrimeiraPrestacao
  else
    difCentavos := difCentavos+((QtdTit-1)*StrToFloat(sPrestacao));

  if difCentavos < VTot then
    difCentavos := StrToFloat(format('%.2f',[VTot-difCentavos]))
  else
    difCentavos := 0;

  Centavos := 0;
  CentavosPrestacao := 0;
  if (vEntrada = 0) and
     (not vCartao) and
     PCentPrimeira then
  Begin
    Centavos := (QtdTit-1)*(StrToInt(Copy(sPrestacao,Length(sPrestacao)-1,2))/100);
    CentavosPrestacao := (StrToInt(Copy(sPrestacao,Length(sPrestacao)-1,2))/100);
  end;

  if not TemEntrada then
    PrimeiraPrestacao := StrToFloat(sPrestacao);

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

  Try
    for i:=1 to QtdTit do
    Begin
      if vCartao and
         (i = 1) and
         (TemEntrada) then
      Begin
        CdAGF  := 1; //A Vista
        iTipoPag    := 5; //Dinheiro
        sCV         := '';
      end
      else
      Begin
        CdAGF  := CAgenteFin.CodigoAGF;
        iTipoPag    := ETipoPag.KeyValue;
        sCV         := PCV;
      end;

      if not CAgenteFin.JurosEntrada then
      Begin
        if i=1 then
          vValorAux    := PrimeiraPrestacao + difCentavos + Centavos
        else
          vValorAux    := StrToFloat(sPrestacao)-CentavosPrestacao;
      end
      else
        if i=1 then
          vValorAux := VTot*CFatorFinanceira.Fator + difCentavos
        else
          vValorAux := VTot*CFatorFinanceira.Fator;

      if vValorAux <= 0 then
      Begin
        ShowMessage('Prestação com valor zerado!');
        Raise exception.Create('');
      end;

      if CConfiguracao.Empresa = empLBM then
        sNumero   := ECodigoPDV.Text+Letra[i]
      else
        sNumero   := '';

      iMeses := StrToInt(Vetor[i]) div 30;
      if EMelhorData <> nil then
      Begin
        If EMelhorData.checked Then
        Begin
          if i = 1 then  //Primeira Prestação
          Begin
            if (StrToInt(Vetor[i]) mod 30) <> 0 then
              vVencimento:= StrToDate(EDataINI.Text)+StrToInt(Vetor[i])
            else
            Begin
              vDataInicial := StrToDate(EDataINI.Text);
              vVencimento := IncMonth(vDataInicial, iMeses);
            end;
          end
          else //Demais Prestações
          Begin
            if (StrToInt(Vetor[i]) mod 30) > 0 then
              vVencimento:= StrToDate(EDataINI.Text)+StrToInt(Vetor[i])
            else
              vVencimento:= IncMonth(StrToDate(EDataINI.Text), iMeses);
          end;
        end
        Else
        Begin
          if (StrToInt(Vetor[i]) mod 30) > 0 then
            vVencimento := Trunc(CConfiguracao.Data)+StrToInt(Vetor[i])
          else
            vVencimento := IncMonth(Trunc(CConfiguracao.Data), iMeses);
        end;
      end
      else
      Begin
        if (StrToInt(Vetor[i]) mod 30) > 0 then
          vVencimento := Trunc(CConfiguracao.Data)+StrToInt(Vetor[i])
        else
          vVencimento := IncMonth(Trunc(CConfiguracao.Data), iMeses);
      end;

      if vVencimento < CConfiguracao.Data then
      Begin
        ShowMessage('Data do Vencimento inválida!');
        Raise exception.Create('');
      end;

      If i<=9 then
        sSeq  := '0'+IntToStr(i)
      Else
        sSeq  := IntToStr(i);

      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT '+sTabela+
        '(CNC_CODIGO,CNC_ORIGEM,TRC_CODIGO,USU_CODIGO,TRC_DT_CADASTRO,TRC_DT_ALTERADO '+
        ',PDV_CODIGO,CNC_CLIENTE,CLI_CODIGO,TRC_CRED_CLI,AGF_CODIGO,TRC_TIPO_PEDIDO '+
        ',TRC_NUMERO,TRC_VALOR,TRC_VALOR_PAGO,TRC_DESCONTO,TRC_JUROS,TRC_VENCIMENTO,TRC_SEQUENCIA '+
        ',CCX_CODIGO,CCX_CODIGO_REC,TRC_TIPO_DOC,TRC_TIPO_PAG,CNC_FATURAMENTO_PENDENTE,FPE_CODIGO '+
        ',TRC_CV,TRF_CODIGO,TRC_PAGAMENTO_PARCIAL,TRC_CHEQUE_DEVOLVIDO '+
        ',TRC_SITUACAO,TRC_OBSERVACAO) VALUES '+
        '( '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(CentroDeCusto)+
        ', '+IntToStr(ProximoCodigo(PCampo))+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+ECodigoPDV.Text+
        ', '+IntToStr(CdCNCCLI)+
        ', '+IntToStr(CdCLI)+
        ',0'+ //CreditoCliente
        ', '+IntToStr(CdAGF)+
        ', '+IntToStr(PTipoPed)+
        ',"'+sNumero+'" '+
        ', '+VirgPonto(vValorAux)+
        ',0'+//ValorPago
        ',0'+//Desconto
        ',0'+//Juros
        ',"'+MesDia(vVencimento)+'" '+
        ',"'+sSeq+'"'+
        ', '+IntToStr(CConfiguracao.ContRecCli)+
        ', '+IntToStr(CConfiguracao.ContRecCLI)+
        ', '+IntToStr(CConfiguracao.TipoDocumento)+
        ', '+IntToStr(iTipoPag)+
        ',0'+//CNCFPE
        ',0'+//FPE
        ',"'+sCV+'" '+
        ',0'+//CodigoTRF
        ',0'+//PagamentoParcial
        ',0'+//ChequeDevolvido
        ',0'+//Situação
        ',"'+PObs+'") ');
      Result := True;
    end;
  Except
    Result := False;
    Showmessage('Falha ao gerar Título a receber!');
  End;
end;

function TTitulo_receber.GerarTitPrazoLBM(VTot, VEntrada:Double; PCV:string; TemEntrada,vCartao:Boolean; POBS:string=''; PCampo:string='TRT_CODIGO';PTipoPed:integer=0):Boolean;
Var
  QtdTit, i, k, CdAGF, CdCCX, CdCCXRec, iTipoPag : integer;
  difCentavos, Centavos, CentavosPrestacao, PrimeiraPrestacao, vValorAux:Double;
  sPrestacao, sTabela, sNumero, sSeq, sCV : string;
begin
  Result := False;

  if Vtot<=0 then
    exit;

  if PCampo = 'TRT_CODIGO' then
    sTabela := 'TRCTEMP'
  else
    sTabela := 'TITULO_A_RECEBER';

  QtdTit := QtdeTitulos(CForma_de_Pagamento.Prazo);

  if VEntrada>0 then
    PrimeiraPrestacao := StrToFloat(format('%.2f',[vEntrada]))
  else if TemEntrada then
    PrimeiraPrestacao := StrToFloat(format('%.2f',[VTot/QtdTit]))
  else
    PrimeiraPrestacao := 0;

  if not TemEntrada then
    sPrestacao  := format('%.2f',[(VTot*CFatorFinanceira.Fator)])
  else
    sPrestacao  := format('%.2f',[(VTot-PrimeiraPrestacao)*CFatorFinanceira.Fator]);

  difCentavos := PrimeiraPrestacao;
  if not TemEntrada then
    difCentavos := difCentavos+(QtdTit*StrToFloat(sPrestacao))-PrimeiraPrestacao
  else
    difCentavos := difCentavos+((QtdTit-1)*StrToFloat(sPrestacao));
  difCentavos := StrToFloat(format('%.2f',[VTot-difCentavos]));

  Centavos := 0;
  CentavosPrestacao := 0;
  if (vEntrada = 0) and (not vCartao) then
  Begin
    Centavos := (QtdTit-1)*(StrToInt(Copy(sPrestacao,Length(sPrestacao)-1,2))/100);
    CentavosPrestacao := (StrToInt(Copy(sPrestacao,Length(sPrestacao)-1,2))/100);
  end;

  if not TemEntrada then
    PrimeiraPrestacao := StrToFloat(sPrestacao);

  if CCliente.CodigoCLI <= 0 then
    Raise exception.Create('');

  if CConfiguracao.Empresa = empLBM then
    sNumero   := IntToStr(CPedido.CodigoPDV)
  else
    sNumero   := '';

  k := 1;
  for i:=1 to QtdTit do
  Begin
    Try
      if i=1 then
        vValorAux    := PrimeiraPrestacao + difCentavos + Centavos
      else
        vValorAux    := StrToFloat(sPrestacao)-CentavosPrestacao;
      if vValorAux <= 0 then
      Begin
        ShowMessage('Parcela com valor zerado!');
        Raise exception.Create('');
      end;

      if (CConfiguracao.Empresa=empLBM) and
         (i = 1) and
         (CAgenteFin.CodigoAGF in [7,8,9,10]) and
         (TemEntrada) then
       Begin
        CdAGF  := 1; //Carteira
        iTipoPag    := 5; //Dinheiro
        sCV         := '';
      end
      else
      Begin
        CdAGF  := ECodigoAGF.KeyValue;
        iTipoPag    := CPedido.TipoPag;
        sCV         := PCV;
      end;

      If i<=9 then
        sSeq  := '0'+IntToStr(i)
      Else
        sSeq  := IntToStr(i);

//(Agente Financeiro = 1 - Carteira)                     --> CCX = 1   - Rec.Vda A Vista
//(Agente Financeiro = 6 - Loja(Pre-Datado)) AND (Seq=1) --> CCX = 2   - Rec. Vda A Prazo Entrada
//(Agente Financeiro = 6 - Loja(Pre-Datado)) AND (Seq<>1)--> CCX = 65  - Rec. Vda A Prazo
//(Agente Financeiro=7,9,10 - Visa, American, Hipercard) --> CCX = 191 - Conta BB
//(Agente Financeiro=8 - MasterCard)                     --> CCX = 193 - Conta BNB
//(Agente Financeiro=2 - BB)                             --> CCX = 191 - Conta BB
//(Agente Financeiro=3 - CEF)                            --> CCX = 194 - Conta CEF
//(Agente Financeiro=4 - BNB)                            --> CCX = 193 - Conta BNB
//(Agente Financeiro=5 - BEC)                            --> CCX = 192 - Conta BEC
      if (CConfiguracao.Empresa = empLBM) then
      Begin
        CdCCX := CConfiguracao.ContRecCliAnt;
        if (CAgenteFin.CodigoAGF = 6) and (i = 1) then //Cheque Entrada
          CdCCXRec := 2
        else if (CAgenteFin.CodigoAGF = 6) then //Cheque Demais Prestações
          CdCCXRec := 65
        else if (CAgenteFin.CodigoAGF in [7,8,9,10]) and //Todos os Cartões
                (TemEntrada) and                         //Tem Entrada
                (i = 1) then                             //Primeira Prestação
          CdCCXRec := 2 //Venda a Prazo Entrada
        else if (CAgenteFin.CodigoAGF in [7,9,10]) then //Visa, American, Hipercard
          CdCCXRec := 191 //Conta Banco do Brasil
        else if (CAgenteFin.CodigoAGF = 8) then //MasterCard
          CdCCXRec := 194 //Conta CEF Antigamente era BNB 193
        else if (CAgenteFin.CodigoAGF = 2) then //BB
          CdCCXRec := 191 //Conta BB
        else if (CAgenteFin.CodigoAGF = 3) then //CEF
          CdCCXRec := 194 //Conta CEF
        else if (CAgenteFin.CodigoAGF = 4) then //BNB
          CdCCXRec := 193 //Conta BNB
        else if (CAgenteFin.CodigoAGF = 5) then //BEC
          CdCCXRec := 192 //Conta BEC
        else if EFormaPG.KeyValue <> 1 then //Diferente de A Vista
          CdCCXRec  := 2 //Venda a Prazo
        else  //A Vista
          CdCCXRec  := CConfiguracao.ContRecCli;
      end
      else
      Begin
        CdCCXRec := CConfiguracao.ContRecCli;
        CdCCX    := CConfiguracao.ContRecCli;
      end;

      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT '+sTabela+
        '(CNC_CODIGO,CNC_ORIGEM,TRC_CODIGO,USU_CODIGO,TRC_DT_CADASTRO,TRC_DT_ALTERADO '+
        ',PDV_CODIGO,CNC_CLIENTE,CLI_CODIGO,TRC_CRED_CLI,AGF_CODIGO,TRC_TIPO_PEDIDO '+
        ',TRC_NUMERO,TRC_VALOR,TRC_VALOR_PAGO,TRC_DESCONTO,TRC_JUROS,TRC_VENCIMENTO,TRC_SEQUENCIA '+
        ',CCX_CODIGO,CCX_CODIGO_REC,TRC_TIPO_DOC,TRC_TIPO_PAG,CNC_FATURAMENTO_PENDENTE,FPE_CODIGO '+
        ',TRC_CV,TRF_CODIGO,TRC_PAGAMENTO_PARCIAL,TRC_CHEQUE_DEVOLVIDO '+
        ',TRC_SITUACAO,TRC_OBSERVACAO) VALUES '+
        '( '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(CentroDeCusto)+
        ', '+IntToStr(ProximoCodigo(PCampo))+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(CPedido.CodigoPDV)+
        ', '+IntToStr(CCliente.CodigoCNC)+
        ', '+IntToStr(CCliente.CodigoCLI)+
        ',0'+ //CreditoCliente
        ', '+IntToStr(CdAGF)+
        ', '+IntToStr(PTipoPed)+
        ',"'+sNumero+'" '+
        ', '+VirgPonto(vValorAux)+
        ',0'+//ValorPago
        ',0'+//Desconto
        ',0'+//Juros
        ',"'+MesDia(StrToDate(copy(CPedido.Vencimentos,k,10)))+'" '+
        ',"'+sSeq+'"'+
        ', '+IntToStr(CdCCX)+
        ', '+IntToStr(CdCCXRec)+
        ', '+IntToStr(CConfiguracao.TipoDocumento)+
        ', '+IntToStr(iTipoPag)+
        ',0'+//CNCFPE
        ',0'+//FPE
        ',"'+sCV+'" '+
        ',0'+//CodigoTRF
        ',0'+//PagamentoParcial
        ',0'+//ChequeDevolvido
        ',0'+//Situação
        ',"'+PObs+'") ');

      k := k + 11;

      Result := True;
    Except
      Result := False;
      Showmessage('Não foi possível incluir o título a receber do pedido!');
    End;
  end;
end;


function TTitulo_receber.GerarTitVista(CdCNCCLI,CdCLI:integer; PCV:string;VTot:Double;POBS:string='';PCampo:string='TRT_CODIGO';PTipoPed:integer=0):Boolean;
var
  sTabela, sNumero: string;
  CdCCX: integer;
begin
  Result := False;

  if Vtot<=0 then
    exit;

  if CConfiguracao.Data <> Date then
  Begin
    ShowMessage('Verifique a Data do Sistema!');
    exit;
  end;

  if PCampo = 'TRT_CODIGO' then
    sTabela := 'TRCTEMP'
  else
    sTabela := 'TITULO_A_RECEBER';

  if CConfiguracao.Empresa = empLBM then
  Begin
    sNumero     := ECodigoPDV.Text;
    CdCCX  := CConfiguracao.ContRecCliAnt
  end
  else
  Begin
    sNumero     := '';
    CdCCX  := CConfiguracao.ContRecCli;
  end;

  Try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT '+sTabela+
      '(CNC_CODIGO,CNC_ORIGEM,TRC_CODIGO,USU_CODIGO,TRC_DT_CADASTRO,TRC_DT_ALTERADO '+
      ',PDV_CODIGO,CNC_CLIENTE,CLI_CODIGO,TRC_CRED_CLI,AGF_CODIGO,TRC_TIPO_PEDIDO '+
      ',TRC_NUMERO,TRC_VALOR,TRC_VALOR_PAGO,TRC_DESCONTO,TRC_JUROS,TRC_VENCIMENTO,TRC_SEQUENCIA '+
      ',CCX_CODIGO,CCX_CODIGO_REC,TRC_TIPO_DOC,TRC_TIPO_PAG '+
      ',TRC_CV,TRF_CODIGO,TRC_PAGAMENTO_PARCIAL,TRC_CHEQUE_DEVOLVIDO '+
      ',TRC_SITUACAO,TRC_OBSERVACAO) VALUES '+
      '( '+IntToStr(CConfiguracao.CodigoCNC)+
      ', '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(ProximoCodigo(PCampo))+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+ECodigoPDV.Text+
      ', '+IntToStr(CdCNCCLI)+
      ', '+IntToStr(CdCLI)+
      ',0'+ //CreditoCliente
      ', '+IntToStr(CAgenteFin.CodigoAGF)+
      ', '+IntToStr(PTipoPed)+
      ',"'+sNumero+'" '+
      ', '+VirgPonto(vTot)+//Valor
      ',0'+//ValorPago
      ',0'+//Desconto
      ',0'+//Juros
      ',"'+MesDia(CConfiguracao.Data)+'" '+
      ',"01" '+//Sequencia
      ', '+IntToStr(CdCCX)+
      ', '+IntToStr(CConfiguracao.ContRecCLI)+
      ', '+IntToStr(CConfiguracao.TipoDocumento)+
      ', '+IntToStr(ETipoPag.KeyValue)+
      ',"'+PCV+'" '+
      ',0'+//CodigoTRF
      ',0'+//PagamentoParcial
      ',0'+//ChequeDevolvido
      ',0'+//Situação
      ',"'+PObs+'") ');
    Result := True;
  Except
    Showmessage('Falha ao gerar Título a receber!');
  End;
end;

{ Insere um Titulo }
function TTitulo_receber.Inserir(CNC,TRC,CLI,PDV,CCX,CCXRec,PTipoPG,PTipo,CdTRF,Reab: Integer; DtVenc,DtPag,DTORI,DTVerif :TDateTime; POBS,PSeq,PNumero, PCV: String; PValor,PValorPG,PCred: Double;AGF,PCliCNC,PSit,PTitAnt,PTRCORI,PTipoPed:integer;PMov,PCHQDev:Boolean):boolean;
Var
  Cod, iVerificado, iGerouMov, iChequeDevolvido: Integer;
  sDtPagamento, sDtVerificado, sDtOrigem: string;
begin
  result:=false;
  if TRC=0 then
    Cod := ProximoCodigo('TRC_CODIGO')
  else
    Cod := TRC;

  If DtPag<>0 Then
    sDtPagamento := '"'+MesDia(DtPag)+'" '
  else
    sDtPagamento := 'NULL';

  if DtVerif > 0 then
  Begin
    iVerificado   := 1;
    sDtVerificado := '"'+MesDia(DtVerif)+'" ';
  end
  else
  Begin
    iVerificado   := 0;
    sDtVerificado := 'NULL';
  end;

  if DTORI > 0 then
    sDtOrigem  := '"'+MesDia(DTORI)+'" '
  else
    sDtOrigem  := 'NULL';

  if PMov then
    iGerouMov := 1
  else
    iGerouMov := 0;

  if PCHQDev then
    iChequeDevolvido := 1
  else
    iChequeDevolvido := 0;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO TITULO_A_RECEBER '+
      '(CNC_ORIGEM,CNC_CODIGO,TRC_CODIGO,USU_CODIGO,TRC_DT_CADASTRO,TRC_DT_ALTERADO '+
      ',PDV_CODIGO,CNC_CLIENTE,CLI_CODIGO,TRC_NUMERO,TRC_SEQUENCIA '+
      ',AGF_CODIGO,CCX_CODIGO,CCX_CODIGO_REC,TRC_TIPO_DOC,TRC_TIPO_PAG '+
      ',TRC_VENCIMENTO,TRC_PAGAMENTO,TRC_DTORIGINAL,TRC_DT_VERIFICADO '+
      ',TRC_VERIFICADO,TRC_PAGAMENTO_PARCIAL,TRC_TITULOANT,TRC_TRCORIGINAL '+
      ',TRC_VALOR,TRC_VALOR_PAGO,TRC_CRED_CLI,TRC_DESCONTO,TRC_JUROS '+
      ',TRC_GEROU_MOVIMENTO '+
      ',TRC_TIPO_PEDIDO,TRC_CHEQUE_DEVOLVIDO,TRC_CV,TRF_CODIGO '+
      ',TRC_REABERTURA '+
      ',TRC_SITUACAO,TRC_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(CNC)+
      ', '+IntToStr(Cod)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+IntToStr(PDV)+
      ', '+IntToStr(PCliCNC)+
      ', '+IntToStr(CLI)+
      ',"'+PNumero+'" '+
      ',"'+PSeq+'" '+
      ', '+IntToStr(AGF)+
      ', '+IntToStr(CCX)+
      ', '+IntToStr(CCXRec)+
      ', '+IntToStr(PTipo)+
      ', '+IntToStr(PTipoPG)+
      ',"'+MesDia(DtVenc)+'" '+
      ', '+sDtPagamento+
      ', '+sDtOrigem+
      ', '+sDtVerificado+
      ', '+IntToStr(iVerificado)+
      ',0'+ //Pagamento Parcial
      ', '+IntToStr(PTitAnt)+
      ', '+IntToStr(PTRCORI)+
      ', '+VirgPonto(PValor)+
      ', '+VirgPonto(PValorPG)+
      ', '+VirgPonto(PCred)+
      ',0'+ //Desconto
      ',0'+ //Juros
      ', '+IntToStr(iGerouMov)+
      ', '+IntToStr(PTipoPed)+
      ', '+IntToStr(iChequeDevolvido)+
      ',"'+PCV+'" '+
      ', '+IntToStr(CdTRF)+
      ', '+IntToStr(Reab)+
      ', '+IntToStr(PSit)+
      ',"'+POBS+'") ');

    Result := True;
  except
    ShowMessage('Não foi possível incluir o registro Título a Receber!');
  End;
end;

function TTitulo_receber.InserirAuto:Boolean;
var
  sSequencia: string;
  CdCCXRec: integer;
begin
  result:=False;
  If ESequencia.Text='' then
    sSequencia:='01'
  Else
    sSequencia := ESequencia.Text;

  try
    CdCCXRec := ECodigoCCXRecebimento.KeyValue;
  except
    CdCCXRec := ECodigoCCX.KeyValue;
  end;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO TITULO_A_RECEBER '+
      '(CNC_ORIGEM,CNC_CODIGO,TRC_CODIGO,USU_CODIGO,TRC_DT_CADASTRO,TRC_DT_ALTERADO '+
      ',PDV_CODIGO,CNC_CLIENTE,CLI_CODIGO,TRC_NUMERO,TRC_SEQUENCIA '+
      ',AGF_CODIGO,CCX_CODIGO,CCX_CODIGO_REC,TRC_TIPO_DOC,TRC_TIPO_PAG '+
      ',TRC_VENCIMENTO,TRC_PAGAMENTO_PARCIAL '+
      ',TRC_VALOR,TRC_GEROU_MOVIMENTO '+
      ',TRC_TIPO_PEDIDO,TRC_CHEQUE_DEVOLVIDO,TRF_CODIGO '+
      ',BOL_CODIGO,TRC_LOCAL,TRC_AGENCIA_NUMERO '+
      ',TRC_SITUACAO,TRC_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(CConfiguracao.CodigoCNC)+
      ', '+IntToStr(SCodigo)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+ECodigoPDV.Text+
      ', '+IntToStr(EClienteCNC.KeyValue)+
      ', '+ECodigoCLI.Text+
      ',"'+ENumero.Text+'" '+
      ',"'+sSequencia+'" '+
      ', '+IntToStr(ECodigoAGF.KeyValue)+
      ', '+IntToStr(ECodigoCCX.KeyValue)+
      ', '+IntToStr(CdCCXRec)+
      ', '+IntToStr(ETipo.KeyValue)+
      ', '+IntToStr(ETipoPag.KeyValue)+
      ',"'+MesDia(EVencimento.Text)+'" '+
      ',0'+ //Pagamento Parcial
      ', '+VirgPonto(EValor.Text)+
      ',0'+ //Gerou Movimento
      ',0'+ //Cheque Devolvido
      ',0'+//TRF_CODIGO
      ', '+ECodigoBOL.Text+
      ', '+ECodigoFPE.Text+
      ',"'+ELocal.Text+'" '+
      ',"'+EAgenciaNumero.Text+'" '+
      ',0'+//Situação
      ',"'+EOBS.Text+'") ');
    Result := True;
  except
    ShowMessage('Não foi possível incluir o registro Título a Receber!');
  End;
end;

function TTitulo_receber.InserirEsp(CdCNC,CdTRC,PCliCNC,CdCLI,CdPDV,CdCCX,PTipoPG,PTipo,CdAGF, CdBOL: Integer; PVencimento :TDateTime; PSequencia,PNumero,PObs: String; PValor: Double):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  if CdTRC=0 then
    Cod    := ProximoCodigo('TRC_CODIGO')
  else
    Cod    := CdTRC;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    Insert;
    try
      CNCOrigem           := CentroDeCusto;  //CodigoCNC;
      CodigoTRC           := Cod;
      CodigoAGF           := CdAGF;
      CodigoCNC           := CdCNC;
      CodigoCCX           := CdCCX;
      CodigoCCXRecebimento:= CdCCX;
      CodigoCLI           := CdCLI;
      CodigoPDV           := CdPDV;
      CodigoUSU           := CConfiguracao.CodigoUSU;
      CodigoBOL           := CdBOL;
      DataAlterado        := CConfiguracao.DataHora;
      Sequencia           := PSequencia;
      Valor               := PValor;
      Situacao            := 0; //Em Aberto
      Tipo                := PTipo;
      Vencimento          := PVencimento;
      TipoPag             := PTipoPG;
      ClienteCNC          := PCliCNC;
      Numero              := PNumero;
      Obs                 := PObs;
      ChequeDevolvido     := False;
      PagamentoParcial    := False;
      CodigoTRF           := 0;
      try
        Post;
        result := true;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
      end;
    except
      result:=false;
      ShowMessage('Não foi possível incluir o registro! Verifique se a tabela encontra-se em modo de somente leitura.');
    end;
  end;
end;


procedure TTitulo_receber.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoTRC.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM:SS',CConfiguracao.DataHora);
  Except
  End;
  Try
    EDataAlterado.Clear;
  Except
  End;
  Try
    ECodigoCCX.KeyValue := 0;
  Except
  End;
  Try
    ECodigoCCXRecebimento.KeyValue := 0;
  Except
  End;
  Try
    ECodigoCLI.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoBOL.Clear
    else
      ECodigoBOL.Text := '0';
  Except
  End;
  Try
    if estado <> 1 then
      EClienteCNC.KeyValue := 0
    else
    Begin
      if (CConfiguracao.Empresa <> 3) or
         (CConfiguracao.CodigoCNC <> 3) then
        EClienteCNC.KeyValue := CConfiguracao.CodigoCNC
      else
        EClienteCNC.KeyValue := 1;
    end;
  Except
  End;
  Try
    ECodigoAGF.KeyValue := 0;
  Except
  End;
  try
   ECred_Cli.Clear;
  except
  end;
  Try
    ETipo.KeyValue := 0;
  Except
  End;
  Try
    ETipoPag.KeyValue := 0;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoFPE.Clear
     else
       ECodigoFPE.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoPDV.Clear
     else
       ECodigoPDV.Text := '-1';
  Except
  End;
  Try
    EVencimento.Clear;
  Except
  End;
  Try
    EValor.Clear;
  Except
  End;
  Try
    EDesconto.Clear;
  Except
  End;
  Try
    EJuros.Clear;
  Except
  End;
  Try
    EValorPG.Clear;
  Except
  End;
  Try
    EPagamento.Clear;
  Except
  End;
  Try
    ESequencia.Clear;
  Except
  End;
  Try
    ENumero.Clear;
  Except
  End;
  try
    EGerouMovimento.Checked := False;
  except
  end;
  Try
    EAgenciaNumero.Clear;
  Except
  End;
  Try
    ETituloORI.Clear;
  Except
  End;
  Try
    EVencimentoORI.Clear;
  Except
  End;
  Try
    ELocal.Clear;
  Except
  End;
  Try
    EOBS.Clear;
  Except
  End;
end;

{ Localiza um abastecimeto }
function TTitulo_receber.LocalizarCod(CdTRC, CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If (CdTRC<>CodigoTRC) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO; TRC_CODIGO', vararrayof([CdCNC, CdTRC]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TTitulo_receber.PagarTitulo(CdCNC,CdTRC,CdFUN: integer; PValorPago:Double;PTipoPag,CdCCXRec,PSit,CdCHQCNC,CdCHQ,CdMCCCNC,CdMCC:integer;PDataPgto,PDtCheque:TdateTime;POBS:String;PCred,PDesc,PJuros:Double;PMov, PPagParcial:Boolean):Boolean;
var
  Movim, iPagParcial:integer;
  sDtCheque, sSitCheque: string;
begin
  Result := False;
  if PMov then
    Movim := 1
  else
    Movim := 0;
  if PPagParcial then
    iPagParcial := 1
  else
    iPagParcial := 0;
  if PDtCheque>0 then
  Begin
    sDtCheque := '"'+MesDia(PDtCheque)+'" ';
    if PDtCheque > CConfiguracao.Data then
      sSitCheque := '2'  //Cheque Pre-Datado Não Baixo
    else
      sSitCheque := '1'  //Cheque do Dia não baixo
  end
  else
  Begin
    sDtCheque := 'NULL';
    sSitCheque := '0';   //Sem Cheque ou Cheque Baixo (independente da data)
  end;

  //Reduzir Saldo do Movimento do Depósito Bancário
  if (not CConfiguracao.IgnorarDepositos) and
     (PTipoPag = 416) and
     (CdMCC > 0) then
  Begin
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE MOVIMENTO_CONTA_CORRENTE SET '+
      ' MCC_SALDO_MOVIMENTO=MCC_SALDO_MOVIMENTO-'+VirgPonto(PValorPago)+
      ' WHERE CNC_CODIGO='+IntToStr(CdMCCCNC)+
      ' AND MCC_CODIGO='+IntToStr(CdMCC));
  end;

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE TITULO_A_RECEBER SET '+
      ' TRC_VALOR_PAGO='  +VirgPonto(PValorPago)+
      ',TRC_DESCONTO='    +VirgPonto(PDesc)+
      ',TRC_JUROS='       +VirgPonto(PJuros)+
      ',USU_CODIGO='      +IntToStr(CConfiguracao.CodigoUSU)+
      ',TRC_PAGAMENTO="'  +MesDiaHora(PDataPgto)+'" '+
      ',TRC_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',FUN_CODIGO='      +IntToStr(CdFUN)+
      ',CNC_CHEQUE='      +IntToStr(CdCHQCNC)+
      ',CHQ_CODIGO='      +IntToStr(CdCHQ)+
      ',CNC_MOVIMENTO_CONTA_CORRENTE='      +IntToStr(CdMCCCNC)+
      ',MCC_CODIGO='      +IntToStr(CdMCC)+
      ',TRC_DT_CHEQUE='   +sDtCheque+ //Na variável já tem as aspas e o MesDia ou NULL
      ',TRC_SIT_CHEQUE='  +sSitCheque+
      ',TRC_CRED_CLI='    +VirgPonto(PCred)+
      ',TRC_TIPO_PAG='    +IntToStr(PTipoPag)+
      ',CCX_CODIGO_REC='  +IntToStr(CdCCXRec)+
      ',TRC_GEROU_MOVIMENTO='+IntToStr(Movim)+
      ',TRC_PAGAMENTO_PARCIAL='+IntToStr(iPagParcial)+
      ',TRC_SITUACAO='    +IntToStr(PSit)+
      ',TRC_OBSERVACAO="' +POBS+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND TRC_CODIGO='+IntToStr(CdTRC));
    Result := True;
  except
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

function TTitulo_receber.PegarDataVenc(DiaPag:String):TDateTime;
Var
  Achou:Boolean;
  Resultado,Data:TDateTime;
begin
  Resultado := 0;
  Achou:=False;
  Data:=CConfiguracao.Data;
  while not achou do
  Begin
    If DiaPag=Copy(DateToStr(Data),1,2) Then
    Begin
      if Trunc(Data) > Trunc(CConfiguracao.Data)+5 then
      Begin
        Achou:=True;
        resultado:=data;
      end
      else
        Data:=Data+1;
    End
    Else
      Data:=Data+1;
  End;
  Result := Resultado;
end;

procedure TTitulo_receber.PreparaAlteracao;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  AtualizaControles(True);
  Estado:=2;
end;

procedure TTitulo_receber.PreparaInsercao;
begin
  ProximoCodigo('TRC_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TTitulo_receber.QtdeTitulos(Temp:String):Integer;
Var
  QtdTit,i:Integer;
begin
  i:=1;
  QtdTit:=0;

  While i<length(Temp) do
  Begin
    if (temp[i]=';') then
      QtdTit:=QtdTit+1;
    i:=i+1;
  End;
  Result:=(QtdTit+1);
end;

function TTitulo_receber.ReabreTitulo(PPagParcial:Boolean; PCHQDev:Boolean=False; PUsuAut:integer=0):Boolean;
Var
  CdTRC,CdCNC:Integer;
  sOBS, sCHQDev, sUSUAut: string;
  vValor: Double;
begin
  Result := False;

  sUSUAut := '';
  if PUsuAut > 0 then
    sUSUAut := 'AUTORIZADO: '+IntToStr(PUsuAut);

  if PCHQDev then
    sCHQDev := '1'
  else
    sCHQDev := '0';

  try
    CdTRC := CodigoTRC;
    CdCNC := CodigoCNC;
    if PPagParcial then
    Begin
      sOBS  := Trim(' REABERTO PARCIAL ('+format('%.2f',[Valor])+') '+OBS);
      vValor := ValorPg+Cred_Cli+Desconto-Juros;
    end
    else
    Begin
      sOBS  := Trim(' REABERTO ('+format('%.2f',[Valor])+') '+OBS);
      vValor := Valor;
    end;
    if not Inserir(CdCNC, 0, CodigoCLI, CodigoPDV, CodigoCCX, CodigoCCXRecebimento,
        TipoPag, Tipo, CodigoTRC(*Reabertura*), 0(*TRF*),Vencimento, 0, Vencimento, 0(*DtVerificado*), sOBS, Sequencia,
        Numero, CV, vValor, 0, 0, CodigoAGF, ClienteCNC, 0, CodigoTRC, CodigoTRC,
        TipoPedido, False(*MovCaixa*), PCHQDev) then
    Begin
      ShowMessage('Falha ao Gerar Título!');
      Exit;
    end;
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE TITULO_A_RECEBER SET '+
      ' TRC_SITUACAO=5 '+
      ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',TRC_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',TRC_REABERTURA='+IntToStr(SCodigo)+
      ',TRC_CHEQUE_DEVOLVIDO='+sCHQDev+
      ',TRC_OBSERVACAO=TRC_OBSERVACAO+"'+sOBS+'" '+
      ' WHERE TRC_CODIGO='+IntToStr(CdTRC)+
      ' AND CNC_CODIGO='+IntToStr(CdCNC));

    //Aumentar Saldo do Movimento do Depósito Bancário
    if (not CConfiguracao.IgnorarDepositos) and
       (TipoPag = 416) and
       (CodigoMCC > 0) then
    Begin
      ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE MOVIMENTO_CONTA_CORRENTE SET '+
        ' MCC_SALDO_MOVIMENTO=ROUND(MCC_SALDO_MOVIMENTO-'+VirgPonto(ValorPG)+',2)'+
        ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
        ' AND MCC_CODIGO='+IntToStr(CodigoMCC));
    end;


    GeraLog(3950, CdCNC, CdTRC, Trim(sUSUAut+sOBS)); //Log de Reabertura
    GeraLog(4520, CdCNC, CdTRC, Trim(sUSUAut+' Reabertura de Titulo de Origem')); //Log de Excluído
    Result := True;
  except
    ShowMessage('Não foi possível reabrir o título!');
  end;
end;

function TTitulo_receber.VerificaProcesso(Valor:integer):Boolean;
var
  Teste,i :integer;
begin
  Teste := Processo;
  if NOT (Teste in [1,2,4,8,16]) then
  Begin
    Result := False;
    ShowMessage('Valor de Processo inválido!');
  end
  else
  Begin
    i := 16;
    Result := False;
    while Teste > 0 do
    Begin
      if Valor = Teste then
      Begin
        Result := true;
        Exit;
      end
      else
      Begin
        Teste := Teste - i;
        i := i div 2;
      end;
    end;
  end;
end;

function TTitulo_receber.deletarauto:Boolean;
var
  CdCNC, CdTRC, CdPDV, CdCLI : integer;
begin
  Result:=False;
  try
    CdCNC := CodigoCNC;
    CdTRC := CodigoTRC;
    CdPDV := CodigoPDV;
    CdCLI := CodigoCLI;
    if Delete then
    Begin
      GeraLog(4520,CdCNC,CdTRC);
      RegistrarDel(CdCNC,2030(*TituloAReceber*),CdTRC,'PDV:'+IntToStr(CdPDV)+' CLI:'+IntToStr(CdCLI));
      Result := True;
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
