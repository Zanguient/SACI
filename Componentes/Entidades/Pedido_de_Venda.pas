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
unit Pedido_de_Venda;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, AgenteFin, Cliente, Usuario, Configuracao, 
     Forma_de_Pagamento, Dbgrids, Funcoes, Variants;

type
  TPedido_de_Venda = class(TSQuery)
    private
      { Private fields of TPedido_de_Venda }
        { Storage for property Acrescimo }
        FAcrescimo : Double;
        { Storage for property Arquiteto }
        FArquiteto : Integer;
        { Storage for property CAgenteFin }
        FCAgenteFin : TAgenteFin;
        { Storage for property CCliente }
        FCCliente : TCliente;
        { Storage for property CForma_de_Pagamento }
        FCForma_de_Pagamento : TForma_de_Pagamento;
        { Storage for property CUsuario }
        FCUsuario : TUsuario;
        { Storage for property Caixa }
        FCaixa : String;
        { Storage for property ClienteCNC }
        FClienteCNC : Integer;
        { Storage for property CodigoAGF }
        FCodigoAGF : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property CodigoCNT }
        FCodigoCNT : Integer;
        { Storage for property CodigoFPE }
        FCodigoFPE : Integer;
        { Storage for property CodigoFPG }
        FCodigoFPG : Integer;
        { Storage for property CodigoPDV }
        FCodigoPDV : Integer;
        { Storage for property CodigoPDVOrigem }
        FCodigoPDVOrigem : Integer;
        { Storage for property CodigoPacote }
        FCodigoPacote : Integer;
        { Storage for property Contato }
        FContato : String;
        { Storage for property Credito }
        FCredito : Double;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataEmissaoVenda }
        FDataEmissaoVenda : TDateTime;
        { Storage for property DataEntrega }
        FDataEntrega : TDateTime;
        { Storage for property DataFPE }
        FDataFPE : TDateTime;
        { Storage for property DataHora }
        FDataHora : Tdatetime;
        { Storage for property DataPrevisao }
        FDataPrevisao : TDateTime;
        { Storage for property DiasReserv }
        FDiasReserv : Integer;
        { Storage for property Documento }
        FDocumento : String;
        { Storage for property ECPFCLI }
        FECPFCLI : TEdit;
        { Storage for property ECaixa }
        FECaixa : TEdit;
        { Storage for property EClienteCNC }
        FEClienteCNC : TEdit;
        { Storage for property ECodigoAGF }
        FECodigoAGF : TDBLookupComboBox;
        { Storage for property ECodigoCLI }
        FECodigoCLI : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TEdit;
        { Storage for property ECodigoCNT }
        FECodigoCNT : TEdit;
        { Storage for property ECodigoFPG }
        FECodigoFPG : TDBLookupComboBox;
        { Storage for property ECodigoPDV }
        FECodigoPDV : TEdit;
        { Storage for property ECodigoPDVOrigem }
        FECodigoPDVOrigem : TEdit;
        { Storage for property EContato }
        FEContato : TEdit;
        { Storage for property EDBGrid }
        FEDBGrid : TDBGrid;
        { Storage for property EDataEntrega }
        FEDataEntrega : TMaskEdit;
        { Storage for property EDataHora }
        FEDataHora : TEdit;
        { Storage for property EDataPrevisao }
        FEDataPrevisao : TMaskEdit;
        { Storage for property EDiasReserv }
        FEDiasReserv : TEdit;
        { Storage for property EDocumento }
        FEDocumento : TEdit;
        { Storage for property EEntregaDeposito }
        FEEntregaDeposito : TCheckBox;
        { Storage for property EFoneContato }
        FEFoneContato : TMaskEdit;
        { Storage for property EGarantia }
        FEGarantia : TEdit;
        { Storage for property EMediaPagamento }
        FEMediaPagamento : TEdit;
        { Storage for property EMelhorData }
        FEMelhorData : TMaskEdit;
        { Storage for property ENomeCLI }
        FENomeCLI : TEdit;
        { Storage for property ENotaFiscal }
        FENotaFiscal : TEdit;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property ERGCLI }
        FERGCLI : TEdit;
        { Storage for property EResumo }
        FEResumo : TMemo;
        { Storage for property ESituacao }
        FESituacao : TEdit;
        { Storage for property ESituacaoInt }
        FESituacaoInt : TComboBox;
        { Storage for property ETipoDeVenda }
        FETipoDeVenda : TComboBox;
        { Storage for property ETipoPag }
        FETipoPag : TDBLookupComboBox;
        { Storage for property ETotal }
        FETotal : TEdit;
        { Storage for property EmUsu }
        FEmUsu : Integer;
        { Storage for property Entrada }
        FEntrada : Double;
        { Storage for property EntregaDeposito }
        FEntregaDeposito : Boolean;
        { Storage for property FaturamentoCNC }
        FFaturamentoCNC : Integer;
        { Storage for property FoneContato }
        FFoneContato : String;
        { Storage for property Frete }
        FFrete : Double;
        { Storage for property Garantia }
        FGarantia : Integer;
        { Storage for property GrupoEspecial }
        FGrupoEspecial : Boolean;
        { Storage for property Impresso }
        FImpresso : Boolean;
        { Storage for property Listado }
        FListado : Integer;
        { Storage for property MaquinaPDV }
        FMaquinaPDV : Integer;
        { Storage for property MediaPagamento }
        FMediaPagamento : Integer;
        { Storage for property MelhorData }
        FMelhorData : TDateTime;
        { Storage for property NotaCupom }
        FNotaCupom : Integer;
        { Storage for property NotaFiscal }
        FNotaFiscal : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property PagamentoAntecipado }
        FPagamentoAntecipado : Double;
        { Storage for property Servico }
        FServico : Boolean;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TipoDeVenda }
        FTipoDeVenda : Integer;
        { Storage for property TipoPag }
        FTipoPag : Integer;
        { Storage for property TituloGerado }
        FTituloGerado : Boolean;
        { Storage for property Total }
        FTotal : Double;
        { Storage for property Vencimentos }
        FVencimentos : String;

      { Private methods of TPedido_de_Venda }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Acrescimo }
        function GetAcrescimo : Double;
        { Write method for property Acrescimo }
        procedure SetAcrescimo(Value : Double);
        { Read method for property Arquiteto }
        function GetArquiteto : Integer;
        { Write method for property Arquiteto }
        procedure SetArquiteto(Value : Integer);
        { Read method for property Caixa }
        function GetCaixa : String;
        { Write method for property Caixa }
        procedure SetCaixa(Value : String);
        { Read method for property ClienteCNC }
        function GetClienteCNC : Integer;
        { Write method for property ClienteCNC }
        procedure SetClienteCNC(Value : Integer);
        { Read method for property CodigoAGF }
        function GetCodigoAGF : Integer;
        { Write method for property CodigoAGF }
        procedure SetCodigoAGF(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property CodigoCNT }
        function GetCodigoCNT : Integer;
        { Write method for property CodigoCNT }
        procedure SetCodigoCNT(Value : Integer);
        { Read method for property CodigoFPE }
        function GetCodigoFPE : Integer;
        { Write method for property CodigoFPE }
        procedure SetCodigoFPE(Value : Integer);
        { Read method for property CodigoFPG }
        function GetCodigoFPG : Integer;
        { Write method for property CodigoFPG }
        procedure SetCodigoFPG(Value : Integer);
        { Read method for property CodigoPDV }
        function GetCodigoPDV : Integer;
        { Write method for property CodigoPDV }
        procedure SetCodigoPDV(Value : Integer);
        { Read method for property CodigoPDVOrigem }
        function GetCodigoPDVOrigem : Integer;
        { Write method for property CodigoPDVOrigem }
        procedure SetCodigoPDVOrigem(Value : Integer);
        { Read method for property CodigoPacote }
        function GetCodigoPacote : Integer;
        { Write method for property CodigoPacote }
        procedure SetCodigoPacote(Value : Integer);
        { Read method for property Contato }
        function GetContato : String;
        { Write method for property Contato }
        procedure SetContato(Value : String);
        { Read method for property Credito }
        function GetCredito : Double;
        { Write method for property Credito }
        procedure SetCredito(Value : Double);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataEmissaoVenda }
        function GetDataEmissaoVenda : TDateTime;
        { Write method for property DataEmissaoVenda }
        procedure SetDataEmissaoVenda(Value : TDateTime);
        { Read method for property DataEntrega }
        function GetDataEntrega : TDateTime;
        { Write method for property DataEntrega }
        procedure SetDataEntrega(Value : TDateTime);
        { Read method for property DataFPE }
        function GetDataFPE : TDateTime;
        { Write method for property DataFPE }
        procedure SetDataFPE(Value : TDateTime);
        { Read method for property DataHora }
        function GetDataHora : Tdatetime;
        { Write method for property DataHora }
        procedure SetDataHora(Value : Tdatetime);
        { Read method for property DataPrevisao }
        function GetDataPrevisao : TDateTime;
        { Write method for property DataPrevisao }
        procedure SetDataPrevisao(Value : TDateTime);
        { Read method for property DiasReserv }
        function GetDiasReserv : Integer;
        { Write method for property DiasReserv }
        procedure SetDiasReserv(Value : Integer);
        { Read method for property Documento }
        function GetDocumento : String;
        { Write method for property Documento }
        procedure SetDocumento(Value : String);
        { Read method for property EmUsu }
        function GetEmUsu : Integer;
        { Write method for property EmUsu }
        procedure SetEmUsu(Value : Integer);
        { Read method for property Entrada }
        function GetEntrada : Double;
        { Write method for property Entrada }
        procedure SetEntrada(Value : Double);
        { Read method for property EntregaDeposito }
        function GetEntregaDeposito : Boolean;
        { Write method for property EntregaDeposito }
        procedure SetEntregaDeposito(Value : Boolean);
        { Read method for property FaturamentoCNC }
        function GetFaturamentoCNC : Integer;
        { Write method for property FaturamentoCNC }
        procedure SetFaturamentoCNC(Value : Integer);
        { Read method for property FoneContato }
        function GetFoneContato : String;
        { Write method for property FoneContato }
        procedure SetFoneContato(Value : String);
        { Read method for property Frete }
        function GetFrete : Double;
        { Read method for property Garantia }
        function GetGarantia : Integer;
        { Write method for property Garantia }
        procedure SetGarantia(Value : Integer);
        { Read method for property GrupoEspecial }
        function GetGrupoEspecial : Boolean;
        { Write method for property GrupoEspecial }
        procedure SetGrupoEspecial(Value : Boolean);
        { Read method for property Impresso }
        function GetImpresso : Boolean;
        { Read method for property Listado }
        function GetListado : Integer;
        { Write method for property Listado }
        procedure SetListado(Value : Integer);
        { Read method for property MaquinaPDV }
        function GetMaquinaPDV : Integer;
        { Write method for property MaquinaPDV }
        procedure SetMaquinaPDV(Value : Integer);
        { Read method for property MediaPagamento }
        function GetMediaPagamento : Integer;
        { Write method for property MediaPagamento }
        procedure SetMediaPagamento(Value : Integer);
        { Read method for property MelhorData }
        function GetMelhorData : TDateTime;
        { Write method for property MelhorData }
        procedure SetMelhorData(Value : TDateTime);
        { Read method for property NotaCupom }
        function GetNotaCupom : Integer;
        { Write method for property NotaCupom }
        procedure SetNotaCupom(Value : Integer);
        { Read method for property NotaFiscal }
        function GetNotaFiscal : Integer;
        { Write method for property NotaFiscal }
        procedure SetNotaFiscal(Value : Integer);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property PagamentoAntecipado }
        function GetPagamentoAntecipado : Double;
        { Write method for property PagamentoAntecipado }
        procedure SetPagamentoAntecipado(Value : Double);
        { Read method for property Servico }
        function GetServico : Boolean;
        { Write method for property Servico }
        procedure SetServico(Value : Boolean);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property TipoDeVenda }
        function GetTipoDeVenda : Integer;
        { Write method for property TipoDeVenda }
        procedure SetTipoDeVenda(Value : Integer);
        { Read method for property TipoPag }
        function GetTipoPag : Integer;
        { Write method for property TipoPag }
        procedure SetTipoPag(Value : Integer);
        { Read method for property TituloGerado }
        function GetTituloGerado : Boolean;
        { Write method for property TituloGerado }
        procedure SetTituloGerado(Value : Boolean);
        { Read method for property Total }
        function GetTotal : Double;
        { Write method for property Total }
        procedure SetTotal(Value : Double);
        { Read method for property Vencimentos }
        function GetVencimentos : String;
        { Write method for property Vencimentos }
        procedure SetVencimentos(Value : String);

    protected
      { Protected fields of TPedido_de_Venda }

      { Protected methods of TPedido_de_Venda }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TPedido_de_Venda }

      { Public methods of TPedido_de_Venda }
        function AbrirPedido(PServico:Boolean=False):Boolean;
        { Altera um Pedido de Venda }
        function Alterar(CdCNC, CdPDV, CdCLI, CdAGF, CdFPG, PTipoPag, PListado, PSituacao: integer;  PTotal: Double; POBS: String;PDiasReserv:Integer;PCliCNC:Integer):boolean;
        function AlterarAuto(PSituacao,PListado:Integer;PTotal,PAcrescimo:Double;PGrupoEspecial:Boolean=False;PServico:Boolean=False):Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdPDV:Integer):Boolean;
        destructor Destroy; override;
        function FecharPedido:Boolean;
        function FinalizaEdicao(PSituacao,PListado:Integer;PTotal,PAcrescimo:Double;PGRPEsp:Boolean=False;PServico:Boolean=False):Boolean;
        { Insere um Pedido de Venda }
        function Inserir(CdCNC,CdPDV,CdCLI,CdAGF,CdFPG,PTipoPag,CdUSU,PSituacao: integer;  PTotal: Double; POBS,PDoc: String;PDiasReserv:Integer;PCliCNC:Integer;PData,PPrev:TDateTime;PGRPEsp:Boolean=False;PServ:Boolean=False;PCont:String=''):boolean;
        function InserirAuto(PSituacao,PListado:Integer;PTotal,PAcrescimo:Double;PGRPEsp:Boolean=False;PServico:Boolean=False):Boolean;
        procedure LimpaCampos;
        { Localiza um pedido de venda }
        function LocalizarCod(CdPDV,CdCNC:Integer):Boolean;
        function LocalizarPed(Usuario:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        procedure Resumo(Query:TQuery);
        function SelecionarPed(CdPDV,CdCNC:Integer):Boolean;
        function deletarauto:Boolean;

    published
      { Published properties of TPedido_de_Venda }
        property Acrescimo : Double read GetAcrescimo write SetAcrescimo;
        property Arquiteto : Integer read GetArquiteto write SetArquiteto;
        property CAgenteFin : TAgenteFin read FCAgenteFin write FCAgenteFin;
        property CCliente : TCliente read FCCliente write FCCliente;
        property CForma_de_Pagamento : TForma_de_Pagamento
             read FCForma_de_Pagamento write FCForma_de_Pagamento;
        property CUsuario : TUsuario read FCUsuario write FCUsuario;
        property Caixa : String read GetCaixa write SetCaixa;
        property ClienteCNC : Integer read GetClienteCNC write SetClienteCNC;
        property CodigoAGF : Integer read GetCodigoAGF write SetCodigoAGF;
        { Código do Cliente }
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property CodigoCNT : Integer read GetCodigoCNT write SetCodigoCNT;
        property CodigoFPE : Integer read GetCodigoFPE write SetCodigoFPE;
        property CodigoFPG : Integer read GetCodigoFPG write SetCodigoFPG;
        { Código do Pedido de Venda }
        property CodigoPDV : Integer read GetCodigoPDV write SetCodigoPDV;
        property CodigoPDVOrigem : Integer
             read GetCodigoPDVOrigem write SetCodigoPDVOrigem;
        property CodigoPacote : Integer
             read GetCodigoPacote write SetCodigoPacote;
        property Contato : String read GetContato write SetContato;
        property Credito : Double read GetCredito write SetCredito;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataEmissaoVenda : TDateTime
             read GetDataEmissaoVenda write SetDataEmissaoVenda;
        property DataEntrega : TDateTime
             read GetDataEntrega write SetDataEntrega;
        property DataFPE : TDateTime read GetDataFPE write SetDataFPE;
        property DataHora : Tdatetime read GetDataHora write SetDataHora;
        property DataPrevisao : TDateTime
             read GetDataPrevisao write SetDataPrevisao;
        property DiasReserv : Integer read GetDiasReserv write SetDiasReserv;
        property Documento : String read GetDocumento write SetDocumento;
        property ECPFCLI : TEdit read FECPFCLI write FECPFCLI;
        property ECaixa : TEdit read FECaixa write FECaixa;
        property EClienteCNC : TEdit read FEClienteCNC write FEClienteCNC;
        property ECodigoAGF : TDBLookupComboBox
             read FECodigoAGF write FECodigoAGF;
        property ECodigoCLI : TEdit read FECodigoCLI write FECodigoCLI;
        property ECodigoCNC : TEdit read FECodigoCNC write FECodigoCNC;
        property ECodigoCNT : TEdit read FECodigoCNT write FECodigoCNT;
        property ECodigoFPG : TDBLookupComboBox
             read FECodigoFPG write FECodigoFPG;
        property ECodigoPDV : TEdit read FECodigoPDV write FECodigoPDV;
        property ECodigoPDVOrigem : TEdit
             read FECodigoPDVOrigem write FECodigoPDVOrigem;
        property EContato : TEdit read FEContato write FEContato;
        property EDBGrid : TDBGrid read FEDBGrid write FEDBGrid;
        property EDataEntrega : TMaskEdit
             read FEDataEntrega write FEDataEntrega;
        property EDataHora : TEdit read FEDataHora write FEDataHora;
        property EDataPrevisao : TMaskEdit
             read FEDataPrevisao write FEDataPrevisao;
        property EDiasReserv : TEdit read FEDiasReserv write FEDiasReserv;
        property EDocumento : TEdit read FEDocumento write FEDocumento;
        property EEntregaDeposito : TCheckBox
             read FEEntregaDeposito write FEEntregaDeposito;
        property EFoneContato : TMaskEdit
             read FEFoneContato write FEFoneContato;
        property EGarantia : TEdit read FEGarantia write FEGarantia;
        property EMediaPagamento : TEdit
             read FEMediaPagamento write FEMediaPagamento;
        property EMelhorData : TMaskEdit read FEMelhorData write FEMelhorData;
        property ENomeCLI : TEdit read FENomeCLI write FENomeCLI;
        property ENotaFiscal : TEdit read FENotaFiscal write FENotaFiscal;
        property EOBS : TMemo read FEOBS write FEOBS;
        property ERGCLI : TEdit read FERGCLI write FERGCLI;
        property EResumo : TMemo read FEResumo write FEResumo;
        property ESituacao : TEdit read FESituacao write FESituacao;
        property ESituacaoInt : TComboBox
             read FESituacaoInt write FESituacaoInt;
        property ETipoDeVenda : TComboBox
             read FETipoDeVenda write FETipoDeVenda;
        property ETipoPag : TDBLookupComboBox read FETipoPag write FETipoPag;
        property ETotal : TEdit read FETotal write FETotal;
        property EmUsu : Integer read GetEmUsu write SetEmUsu;
        property Entrada : Double read GetEntrada write SetEntrada;
        property EntregaDeposito : Boolean
             read GetEntregaDeposito write SetEntregaDeposito;
        property FaturamentoCNC : Integer
             read GetFaturamentoCNC write SetFaturamentoCNC;
        property FoneContato : String read GetFoneContato write SetFoneContato;
        property Frete : Double read GetFrete write FFrete;
        property Garantia : Integer read GetGarantia write SetGarantia;
        property GrupoEspecial : Boolean
             read GetGrupoEspecial write SetGrupoEspecial;
        property Impresso : Boolean read GetImpresso write FImpresso;
        property Listado : Integer read GetListado write SetListado;
        property MaquinaPDV : Integer read GetMaquinaPDV write SetMaquinaPDV;
        property MediaPagamento : Integer
             read GetMediaPagamento write SetMediaPagamento;
        property MelhorData : TDateTime read GetMelhorData write SetMelhorData;
        property NotaCupom : Integer read GetNotaCupom write SetNotaCupom;
        property NotaFiscal : Integer read GetNotaFiscal write SetNotaFiscal;
        property OBS : String read GetOBS write SetOBS;
        property PagamentoAntecipado : Double
             read GetPagamentoAntecipado write SetPagamentoAntecipado;
        property Servico : Boolean read GetServico write SetServico;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property TipoDeVenda : Integer
             read GetTipoDeVenda write SetTipoDeVenda;
        property TipoPag : Integer read GetTipoPag write SetTipoPag;
        property TituloGerado : Boolean
             read GetTituloGerado write SetTituloGerado;
        property Total : Double read GetTotal write SetTotal;
        property Vencimentos : String read GetVencimentos write SetVencimentos;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TPedido_de_Venda with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TPedido_de_Venda]);
end;

{ Method to set variable and property values and create objects }
procedure TPedido_de_Venda.AutoInitialize;
begin
     FECPFCLI := nil;
     FECaixa := nil;
     FEClienteCNC := nil;
     FECodigoAGF := nil;
     FECodigoCLI := nil;
     FECodigoCNC := nil;
     FECodigoCNT := nil;
     FECodigoFPG := nil;
     FECodigoPDV := nil;
     FECodigoPDVOrigem := nil;
     FEContato := nil;
     FEDBGrid := nil;
     FEDataEntrega := nil;
     FEDataHora := nil;
     FEDataPrevisao := nil;
     FEDiasReserv := nil;
     FEDocumento := nil;
     FEEntregaDeposito := nil;
     FEFoneContato := nil;
     FEGarantia := nil;
     FEMediaPagamento := nil;
     FEMelhorData := nil;
     FENomeCLI := nil;
     FENotaFiscal := nil;
     FEOBS := nil;
     FERGCLI := nil;
     FEResumo := nil;
     FESituacao := nil;
     FESituacaoInt := nil;
     FETipoDeVenda := nil;
     FETipoPag := nil;
     FETotal := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TPedido_de_Venda.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECPFCLI then
        FECPFCLI := nil;
     if AComponent = FECaixa then
        FECaixa := nil;
     if AComponent = FEClienteCNC then
        FEClienteCNC := nil;
     if AComponent = FECodigoAGF then
        FECodigoAGF := nil;
     if AComponent = FECodigoCLI then
        FECodigoCLI := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoCNT then
        FECodigoCNT := nil;
     if AComponent = FECodigoFPG then
        FECodigoFPG := nil;
     if AComponent = FECodigoPDV then
        FECodigoPDV := nil;
     if AComponent = FECodigoPDVOrigem then
        FECodigoPDVOrigem := nil;
     if AComponent = FEContato then
        FEContato := nil;
     if AComponent = FEDBGrid then
        FEDBGrid := nil;
     if AComponent = FEDataEntrega then
        FEDataEntrega := nil;
     if AComponent = FEDataHora then
        FEDataHora := nil;
     if AComponent = FEDataPrevisao then
        FEDataPrevisao := nil;
     if AComponent = FEDiasReserv then
        FEDiasReserv := nil;
     if AComponent = FEDocumento then
        FEDocumento := nil;
     if AComponent = FEEntregaDeposito then
        FEEntregaDeposito := nil;
     if AComponent = FEFoneContato then
        FEFoneContato := nil;
     if AComponent = FEGarantia then
        FEGarantia := nil;
     if AComponent = FEMediaPagamento then
        FEMediaPagamento := nil;
     if AComponent = FEMelhorData then
        FEMelhorData := nil;
     if AComponent = FENomeCLI then
        FENomeCLI := nil;
     if AComponent = FENotaFiscal then
        FENotaFiscal := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FERGCLI then
        FERGCLI := nil;
     if AComponent = FEResumo then
        FEResumo := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FESituacaoInt then
        FESituacaoInt := nil;
     if AComponent = FETipoDeVenda then
        FETipoDeVenda := nil;
     if AComponent = FETipoPag then
        FETipoPag := nil;
     if AComponent = FETotal then
        FETotal := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TPedido_de_Venda.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Acrescimo }
function TPedido_de_Venda.GetAcrescimo : Double;
begin
  try
    Result := Self.fieldByName('PDV_ACRESCIMO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Acrescimo }
procedure TPedido_de_Venda.SetAcrescimo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_ACRESCIMO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_ACRESCIMO"!');
    end;
end;

{ Read method for property Arquiteto }
function TPedido_de_Venda.GetArquiteto : Integer;
begin
  try
    Result := Self.fieldByName('FUN_ARQUITETO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Arquiteto }
procedure TPedido_de_Venda.SetArquiteto(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FUN_ARQUITETO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FUN_ARQUITETO"!');
    end;
end;

{ Read method for property Caixa }
function TPedido_de_Venda.GetCaixa : String;
begin
  try
    Result := Self.fieldByName('PDV_CAIXA').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Caixa }
procedure TPedido_de_Venda.SetCaixa(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_CAIXA').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_CAIXA"!');
  end;
end;

{ Read method for property ClienteCNC }
function TPedido_de_Venda.GetClienteCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CLIENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property ClienteCNC }
procedure TPedido_de_Venda.SetClienteCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CLIENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CLIENTE"!');
    end;
end;

{ Read method for property CodigoAGF }
function TPedido_de_Venda.GetCodigoAGF : Integer;
begin
  try
    Result := Self.fieldByName('AGF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property CodigoAGF }
procedure TPedido_de_Venda.SetCodigoAGF(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('AGF_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "AGF_CODIGO"!');
    end;
end;


{ Read method for property CodigoCLI }
function TPedido_de_Venda.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCLI }
procedure TPedido_de_Venda.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property CodigoCNT }
function TPedido_de_Venda.GetCodigoCNT : Integer;
begin
  try
    Result := Self.fieldByName('CNT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCNT }
procedure TPedido_de_Venda.SetCodigoCNT(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNT_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNT_CODIGO"!');
    end;
end;

{ Read method for property CodigoFPE }
function TPedido_de_Venda.GetCodigoFPE : Integer;
begin
  try
    Result := Self.fieldByName('FPE_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoFPE }
procedure TPedido_de_Venda.SetCodigoFPE(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPE_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPE_CODIGO"!');
    end;
end;

{ Read method for property CodigoFPG }
function TPedido_de_Venda.GetCodigoFPG : Integer;
begin
  try
    Result := Self.fieldByName('FPG_CODIGO').asInteger;
  except
    result:= 0
  end;
end;


{ Write method for property CodigoFPG }
procedure TPedido_de_Venda.SetCodigoFPG(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('FPG_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "FPG_CODIGO"!');
    end;
end;


{ Read method for property CodigoPDV }
function TPedido_de_Venda.GetCodigoPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPDV }
procedure TPedido_de_Venda.SetCodigoPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_CODIGO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_CODIGO"!');
  end;
end;

{ Read method for property CodigoPDVOrigem }
function TPedido_de_Venda.GetCodigoPDVOrigem : Integer;
begin
  try
    Result := Self.fieldByName('PDV_CODIGO_ORIGEM').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPDVOrigem }
procedure TPedido_de_Venda.SetCodigoPDVOrigem(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_CODIGO_ORIGEM').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_CODIGO_ORIGEM"!');
  end;
end;

{ Read method for property CodigoPacote }
function TPedido_de_Venda.GetCodigoPacote : Integer;
begin
  try
    Result := Self.fieldByName('PDV_PACOTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoPacote }
procedure TPedido_de_Venda.SetCodigoPacote(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_PACOTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_PACOTE"!');
    end;
end;

{ Read method for property Contato }
function TPedido_de_Venda.GetContato : String;
begin
  try
    Result := Self.fieldByName('PDV_CONTATO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Contato }
procedure TPedido_de_Venda.SetContato(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_CONTATO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_CONTATO"!');
  end;
end;

{ Read method for property Credito }
function TPedido_de_Venda.GetCredito : Double;
begin
  try
    Result := Self.fieldByName('PDV_CREDITO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Credito }
procedure TPedido_de_Venda.SetCredito(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_CREDITO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_CREDITO"!');
    end;
end;

{ Read method for property DataAlterado }
function TPedido_de_Venda.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('PDV_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TPedido_de_Venda.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataEmissaoVenda }
function TPedido_de_Venda.GetDataEmissaoVenda : TDateTime;
begin
  try
    Result := Self.fieldByName('PDV_DT_EMISSAO_VENDA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataEmissaoVenda }
procedure TPedido_de_Venda.SetDataEmissaoVenda(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_DT_EMISSAO_VENDA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_DT_EMISSAO_VENDA"!');
  end;
end;

{ Read method for property DataEntrega }
function TPedido_de_Venda.GetDataEntrega : TDateTime;
begin
  try
    Result := Self.fieldByName('PDV_DT_ENTREGA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataEntrega }
procedure TPedido_de_Venda.SetDataEntrega(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_DT_ENTREGA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_DT_ENTREGA"!');
  end;
end;

{ Read method for property DataFPE }
function TPedido_de_Venda.GetDataFPE : TDateTime;
begin
  try
    Result := Self.fieldByName('PDV_DT_FPE').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataFPE }
procedure TPedido_de_Venda.SetDataFPE(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_DT_FPE').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_DT_FPE"!');
  end;
end;

{ Read method for property DataHora }
function TPedido_de_Venda.GetDataHora : Tdatetime;
begin
  try
    Result := Self.fieldByName('PDV_DATA_HORA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataHora }
procedure TPedido_de_Venda.SetDataHora(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_DATA_HORA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_DATA_HORA"!');
  end;
end;

{ Read method for property DataPrevisao }
function TPedido_de_Venda.GetDataPrevisao : TDateTime;
begin
  try
    Result := Self.fieldByName('PDV_DT_PREVISAO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataPrevisao }
procedure TPedido_de_Venda.SetDataPrevisao(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_DT_PREVISAO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_DT_PREVISAO"!');
  end;
end;

{ Read method for property DiasReserv }
function TPedido_de_Venda.GetDiasReserv : Integer;
begin
  try
    Result := Self.fieldByName('PDV_DIAS_RESERV').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property DiasReserv }
procedure TPedido_de_Venda.SetDiasReserv(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_DIAS_RESERV').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_DIAS_RESERV"!');
    end;
end;

{ Read method for property Documento }
function TPedido_de_Venda.GetDocumento : String;
begin
  try
    Result := Self.fieldByName('PDV_DOCUMENTO').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Documento }
procedure TPedido_de_Venda.SetDocumento(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_DOCUMENTO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_DOCUMENTO"!');
  end;
end;

{ Read method for property EmUsu }
function TPedido_de_Venda.GetEmUsu : Integer;
begin
  try
    Result := Self.fieldByName('PDV_EM_USO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property EmUsu }
procedure TPedido_de_Venda.SetEmUsu(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_EM_USO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_EM_USO"!');
    end;
end;

{ Read method for property Entrada }
function TPedido_de_Venda.GetEntrada : Double;
begin
  try
    Result := Self.fieldByName('PDV_ENTRADA').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Entrada }
procedure TPedido_de_Venda.SetEntrada(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_ENTRADA').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_ENTRADA"!');
    end;
end;

{ Read method for property EntregaDeposito }
function TPedido_de_Venda.GetEntregaDeposito : Boolean;
begin
  try
    result := (Self.fieldByName('PDV_ENTREGA_DEPOSITO').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property EntregaDeposito }
procedure TPedido_de_Venda.SetEntregaDeposito(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('PDV_ENTREGA_DEPOSITO').asInteger := 1
      else
        Self.fieldByName('PDV_ENTREGA_DEPOSITO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_ENTREGA_DEPOSITO"!');
    end;
end;

{ Read method for property FaturamentoCNC }
function TPedido_de_Venda.GetFaturamentoCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_FATURAMENTO_PENDENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property FaturamentoCNC }
procedure TPedido_de_Venda.SetFaturamentoCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_FATURAMENTO_PENDENTE').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_FATURAMENTO_PENDENTE"!');
    end;
end;

{ Read method for property FoneContato }
function TPedido_de_Venda.GetFoneContato : String;
begin
  try
    Result := Self.fieldByName('PDV_FONE_CONTATO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property FoneContato }
procedure TPedido_de_Venda.SetFoneContato(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_FONE_CONTATO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_FONE_CONTATO"!');
  end;
end;

{ Read method for property Frete }
function TPedido_de_Venda.GetFrete : Double;
begin
  try
    Result := Self.fieldByName('PDV_FRETE').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Garantia }
function TPedido_de_Venda.GetGarantia : Integer;
begin
  try
    Result := Self.fieldByName('PDV_GARANTIA').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Garantia }
procedure TPedido_de_Venda.SetGarantia(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_GARANTIA').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_GARANTIA"!');
  end;
end;

{ Read method for property GrupoEspecial }
function TPedido_de_Venda.GetGrupoEspecial : Boolean;
begin
  try
    result := (Self.fieldByName('PDV_GRUPO_ESPECIAL').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property GrupoEspecial }
procedure TPedido_de_Venda.SetGrupoEspecial(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('PDV_GRUPO_ESPECIAL').asInteger := 1
      else
        Self.fieldByName('PDV_GRUPO_ESPECIAL').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_GRUPO_ESPECIAL"!');
    end;
end;

{ Read method for property Impresso }
function TPedido_de_Venda.GetImpresso : Boolean;
begin
  try
    result := (Self.fieldByName('PDV_IMPRESSO').asInteger=1);
  except
    result := False;
  end;
end;

{ Read method for property Listado }
function TPedido_de_Venda.GetListado : Integer;
begin
  try
    Result := Self.fieldByName('PDV_LISTADO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Listado }
procedure TPedido_de_Venda.SetListado(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_LISTADO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_LISTADO"!');
    end;
end;

{ Read method for property MaquinaPDV }
function TPedido_de_Venda.GetMaquinaPDV : Integer;
begin
  try
    Result := Self.fieldByName('PDV_MAQUINA').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property MaquinaPDV }
procedure TPedido_de_Venda.SetMaquinaPDV(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_MAQUINA').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_MAQUINA"!');
    end;
end;

{ Read method for property MediaPagamento }
function TPedido_de_Venda.GetMediaPagamento : Integer;
begin
  try
    Result := Self.fieldByName('PDV_MEDIA_PAGAMENTO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property MediaPagamento }
procedure TPedido_de_Venda.SetMediaPagamento(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_MEDIA_PAGAMENTO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_MEDIA_PAGAMENTO"!');
    end;
end;

{ Read method for property MelhorData }
function TPedido_de_Venda.GetMelhorData : TDateTime;
begin
  try
    Result := Self.fieldByName('PDV_MELHOR_DATA').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property MelhorData }
procedure TPedido_de_Venda.SetMelhorData(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_MELHOR_DATA').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_MELHOR_DATA"!');
  end;
end;

{ Read method for property NotaCupom }
function TPedido_de_Venda.GetNotaCupom : Integer;
begin
  try
    Result := Self.fieldByName('PDV_NOTA_CUPOM').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property NotaCupom }
procedure TPedido_de_Venda.SetNotaCupom(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_NOTA_CUPOM').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_NOTA_CUPOM"!');
    end;
end;

{ Read method for property NotaFiscal }
function TPedido_de_Venda.GetNotaFiscal : Integer;
begin
 try
   Result := Self.fieldByName('PDV_NOTA_FISCAL').asInteger;
 except
   Result := 0;
 end;
end;

{ Write method for property NotaFiscal }
procedure TPedido_de_Venda.SetNotaFiscal(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_NOTA_FISCAL').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_NOTA_FISCAL"!');
  end;
end;

{ Read method for property OBS }
function TPedido_de_Venda.GetOBS : String;
begin
  try
    Result := Self.fieldByName('PDV_OBS').asString;
  except
    result:= '';
  end;
end;

{ Write method for property OBS }
procedure TPedido_de_Venda.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_OBS').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_OBS"!');
  end;
end;

{ Read method for property PagamentoAntecipado }
function TPedido_de_Venda.GetPagamentoAntecipado : Double;
begin
  try
    Result := Self.fieldByName('PDV_ANTECIPADO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property PagamentoAntecipado }
procedure TPedido_de_Venda.SetPagamentoAntecipado(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_ANTECIPADO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_ANTECIPADO"!');
    end;
end;

{ Read method for property Servico }
function TPedido_de_Venda.GetServico : Boolean;
begin
  try
    result := (Self.fieldByName('PDV_SERVICO').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Servico }
procedure TPedido_de_Venda.SetServico(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('PDV_SERVICO').asInteger := 1
      else
        Self.fieldByName('PDV_SERVICO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_SERVICO"!');
    end;
end;

{ Read method for property Situacao }
function TPedido_de_Venda.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('PDV_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TPedido_de_Venda.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_SITUACAO"!');
  end;
end;

{ Read method for property TipoDeVenda }
function TPedido_de_Venda.GetTipoDeVenda : Integer;
begin
 try
   Result := Self.fieldByName('PDV_TIPO_VENDA').asInteger;
 except
   Result := 0;
 end;
end;

{ Write method for property TipoDeVenda }
procedure TPedido_de_Venda.SetTipoDeVenda(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_TIPO_VENDA').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_TIPO_VENDA"!');
  end;
end;

{ Read method for property TipoPag }
function TPedido_de_Venda.GetTipoPag : Integer;
begin
  try
    Result := Self.fieldByName('PDV_TIPO_PAG').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property TipoPag }
procedure TPedido_de_Venda.SetTipoPag(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_TIPO_PAG').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_TIPO_PAG"!');
    end;
end;


{ Read method for property TituloGerado }
function TPedido_de_Venda.GetTituloGerado : Boolean;
begin
  try
    result := (Self.fieldByName('PDV_TITULO_GERADO').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property TituloGerado }
procedure TPedido_de_Venda.SetTituloGerado(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('PDV_TITULO_GERADO').asInteger := 1
      else
        Self.fieldByName('PDV_TITULO_GERADO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_TITULO_GERADO"!');
    end;
end;

{ Read method for property Total }
function TPedido_de_Venda.GetTotal : Double;
begin
  try
    Result := Self.fieldByName('PDV_TOTAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Total }
procedure TPedido_de_Venda.SetTotal(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('PDV_TOTAL').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "PDV_TOTAL"!');
    end;
end;

{ Read method for property Vencimentos }
function TPedido_de_Venda.GetVencimentos : String;
begin
  try
    Result := Self.fieldByName('PDV_VENCIMENTOS').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Vencimentos }
procedure TPedido_de_Venda.SetVencimentos(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('PDV_VENCIMENTOS').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "PDV_VENCIMENTOS"!');
  end;
end;

function TPedido_de_Venda.AbrirPedido(PServico:Boolean=False):Boolean;
var
  vSituacao :String;
begin
  Result:=False;

  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT PDV_EM_USO '+
      ' FROM PEDIDO_DE_VENDA '+
      ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(CodigoPDV);
    Open;
    if FieldByName('PDV_EM_USO').asInteger=1 then
      Exit;
  end;

  if PServico then
    vSituacao := ''
  else
    vSituacao := ',PDV_SITUACAO=0 ';

  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' PDV_EM_USO=1 '+
      vSituacao+
      ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(CodigoPDV));
    Result:=True;
  except
  end;
end;

{ Altera um Pedido de Venda }
function TPedido_de_Venda.Alterar(CdCNC, CdPDV, CdCLI, CdAGF, CdFPG, PTipoPag, PListado, PSituacao: integer;  PTotal: Double; POBS: String;PDiasReserv:Integer;PCliCNC:Integer):boolean;
begin
  result:=false;
  If not(localizarCod(CdPDV,CdCNC)) Then
    ShowMessage('Não foi possível alterar registro corrente pois o registro não existe!')
  Else
  Begin
    edit;
    try
      CodigoCLI        := CdCLI;
      CodigoUSU        := CConfiguracao.CodigoUSU;
      Try
        DataAlterado   := CConfiguracao.DataHora;
      Except
      End;
      Try
        if StrToDateTime(EDataEntrega.Text) > 0 then
          DataEntrega   := StrToDateTime(EDataEntrega.Text);
      Except
      End;
      Try
        CodigoFPG      := CdFPG;
      Except
      End;
      Try
        CodigoAGF      := CdAGF;
      Except
      End;
      Try
        MaquinaPDV      := Maquina;
      Except
      End;
      Try
        TipoPag        := PTipoPag;
      Except
      End;
      Try
        Total          := PTotal;
      Except
      End;
      Try
        DiasReserv     := PDiasReserv;
      Except
      End;
      Try
        ClienteCNC     := PCliCNC;
      Except
      End;
      Try
        Listado        := PListado;
      Except
      End;
      Try
        Situacao       := PSituacao;
      Except
      End;
      Try
        Obs            := UpperCase(POBS);
      Except
      End;
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

function TPedido_de_Venda.AlterarAuto(PSituacao,PListado:Integer;PTotal,PAcrescimo:Double;PGrupoEspecial:Boolean=False;PServico:Boolean=False):Boolean;
var
  iGrupoEsp, CdCNT, iGarantia, iCdPDVOrigem: integer;
  sCaixa, sContato, sFoneContato, sTipoDeVenda, sEntregaDeposito: string;
begin
  Result := False;
  try
    iCdPDVOrigem := StrToInt(ECodigoPDVOrigem.Text);
  except
    iCdPDVOrigem := 0;
  end;
  try
    iGarantia := StrToInt(EGarantia.Text);
  except
    iGarantia := 0;
  end;
  try
    sTipoDeVenda := ',PDV_TIPO_VENDA='+IntToStr(ETipoDeVenda.ItemIndex+10);
  except
    sTipoDeVenda := '';
  end;
  try
    sContato := ',PDV_CONTATO="'+EContato.Text+'" ';
  except
    sContato := '';
  end;
  try
    sFoneContato := ',PDV_FONE_CONTATO="'+EFoneContato.Text+'" ';
  except
    sFoneContato := '';
  end;
  try
    CdCNT := StrToInt(ECodigoCNT.Text);
  except
    CdCNT := 0;
  end;
  if (ECaixa <> Nil) and
     PServico and
     (PSituacao<3) and
     (CConfiguracao.Empresa <> empLuciano) then
  Begin
    sCaixa := ECaixa.Text;
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
        ' WHERE PDV_CAIXA="'+Trim(ECaixa.Text)+'" '+
        ' AND PDV_CODIGO<>'+ECodigoPDV.Text+
        ' AND PDV_SITUACAO<>6 '+ //Cancelado
        ' AND PDV_SITUACAO<>3 '+ //Pronto para entregar
        ' AND PDV_SITUACAO<>4 '+ //Dif. Pronto e Entregue ao Cliente
        ' AND PDV_SITUACAO<>8 '; //Devolvido
      Open;
      if not isEmpty then
      Begin
        ShowMessage('Caixa em uso no serviço '+FieldByName('PDV_CODIGO').asString);
        Exit;
      end;
    end;
  end
  else
    sCaixa := '0';
  try
    if EEntregaDeposito.Checked then
      sEntregaDeposito := ',PDV_ENTREGA_DEPOSITO=1 '
    else
      sEntregaDeposito := ',PDV_ENTREGA_DEPOSITO=0 ';
  except
    sEntregaDeposito := ',PDV_ENTREGA_DEPOSITO=0 ';
  end;
  if PGrupoEspecial then
    iGrupoEsp := 1
  else
    iGrupoEsp := 0;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' CNT_CODIGO='+IntToStr(CdCNT)+
      ',PDV_MAQUINA='+IntToStr(Maquina)+
      ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',PDV_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',PDV_DT_PREVISAO="'+MesDia(EDataPrevisao.Text)+'" '+
      ',CNC_CLIENTE='+EClienteCNC.Text+
      ',CLI_CODIGO='+ECodigoCLI.Text+
      ',PDV_TIPO_PAG='+IntToStr(ETipoPag.KeyValue)+
      ',FPG_CODIGO='+IntToStr(ECodigoFPG.KeyValue)+
      ',AGF_CODIGO='+IntToStr(ECodigoAGF.KeyValue)+
      sContato+sFoneContato+
      ',PDV_CAIXA="'+sCaixa+'" '+
      ',PDV_DOCUMENTO="'+EDocumento.Text+'" '+
      ',PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEsp)+
      ',PDV_LISTADO='+IntToStr(PListado)+
      ',PDV_TOTAL='+VirgPonto(PTotal)+
      ',PDV_ACRESCIMO='+VirgPonto(PAcrescimo)+
      ',PDV_GARANTIA='+IntToStr(iGarantia)+
      ',PDV_CODIGO_ORIGEM='+IntToStr(iCdPDVOrigem)+
      sTipoDeVenda+
      sEntregaDeposito+
      ',PDV_SITUACAO='+IntToStr(PSituacao)+
      ',PDV_OBS="'+UpperCase(EOBS.Text)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
      ' AND PDV_CODIGO='+IntToStr(CodigoPDV));
    GeraLog(6600, CodigoCNC, CodigoPDV, 'CNCCLI:'+IntToStr(ClienteCNC)+
      ' CLI:'+IntToStr(CodigoCLI)+
      ' TipoPag:'+IntToStr(TipoPag)+
      ' FPG:'+IntToStr(CodigoFPG)+
      ' AGF:'+IntToStr(CodigoAGF));
    Result:=True;
    Close;
    Open;
  except
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TPedido_de_Venda.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDBGrid.Enabled        :=not Habilitar;
  Except
  End;
  try
    EDataPrevisao.Enabled  := Habilitar;
  Except
  End;
  try
    if not Habilitar then
      EMelhorData.Enabled  := False;
  Except
  End;
  try
    ECodigoCLI.Enabled     :=Habilitar;
  Except
  End;
  try
    ECodigoCNT.Enabled     :=Habilitar;
  Except
  End;
  try
    EContato.Enabled     :=Habilitar;
  Except
  End;
  try
    EFoneContato.Enabled     :=Habilitar;
  Except
  End;
  try
    ECodigoAGF.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECodigoFPG.Enabled     :=Habilitar;
  Except
  End;
  Try
    ETipoPag.Enabled     :=Habilitar;
  Except
  End;
  Try
    EDocumento.Enabled     :=Habilitar;
  Except
  End;
  Try
    ECaixa.Enabled     :=Habilitar;
  Except
  End;
  try
    EGarantia.Enabled     :=Habilitar;
  except
  end;
  try
    if Estado = 1 then
      ETipoDeVenda.Enabled     := Habilitar
    else
      ETipoDeVenda.Enabled     := False;
  except
  end;
  try
    if (Estado = 1) and
       (TipoDeVenda in [12,13]) then //Reforço/Garantia Serviço
      ECodigoPDVOrigem.Enabled     := Habilitar
    else
      ECodigoPDVOrigem.Enabled     := False;
  except
  end;
  try
    EEntregaDeposito.Enabled     := Habilitar
  except
  end;
  Try
    EOBS.Enabled           :=Habilitar;
  Except
  End;
end;

procedure TPedido_de_Venda.CancelaEdicao;
begin
  AtualizaControles(False);
  Estado:=0;
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TPedido_de_Venda.CarregaDados;
begin
  Try
    EDiasReserv.Text           :=IntToStr(DiasReserv);
  Except
  End;
  Try
    ECodigoPDV.Text           :=IntToStr(CodigoPDV);
  Except
  End;
  Try
    EClienteCNC.Text           :=IntToStr(ClienteCNC);
  Except
  End;
  Try
    ECodigoCLI.Text           :=IntToStr(CodigoCLI);
  Except
  End;
  Try
    ECodigoCNT.Text           :=IntToStr(CodigoCNT);
  Except
  End;
  Try
    if DataHora=0 then
      EDataHora.Text:=''
    else
      EDataHora.Text            :=FormatDateTime('dd/mm/yyyy hh:nn:ss', DataHora);
  Except
  End;
  Try
    if MelhorData=0 then
      EMelhorData.Text:=''
    else
      EMelhorData.Text            :=FormatDateTime('dd/mm/yyyy', MelhorData);
  Except
  End;
  Try
    if DataEntrega=0 then
      EDataEntrega.Text:=''
    else
      EDataEntrega.Text            :=FormatDateTime('dd/mm/yyyy', DataEntrega);
  Except
  End;
  Try
    if DataPrevisao=0 then
      EDataPrevisao.Text:=''
    else
      EDataPrevisao.Text            :=FormatDateTime('dd/mm/yyyy', DataPrevisao);
  Except
  End;
  Try
    ETotal.Text               := Format('%.2f', [Total]);
  Except
  End;
  Try
    ENotaFiscal.Text      := IntToStr(NotaFiscal);
  Except
  End;
  Try
    ETipoPag.KeyValue       :=TipoPag;
  Except
  End;
  Try
    ECodigoFPG.KeyValue     :=CodigoFPG;
  Except
  End;
  Try
    ECodigoAGF.KeyValue     :=CodigoAGF;
  Except
  End;
  Try
    EMediaPagamento.Text   := IntToStr(MediaPagamento);
  Except
  End;
  Try
    EContato.Text          := Contato;
  Except
  End;
  Try
    EFoneContato.Text      := FoneContato;
  Except
  End;
  Try
    ECaixa.Text      := Caixa;
  Except
  End;
  Try
    EDocumento.Text      := Documento;
  Except
  End;
  Try
    Case Situacao of
     -1: ESituacao.Text:='Venda Reservada';
     0: ESituacao.Text:='Abertura';
     1: ESituacao.Text:='Intenção de Compra';
     2: ESituacao.Text:='Cliente com Cadastro';
     3: ESituacao.Text:='Venda Aprovada';
     4: ESituacao.Text:='Venda Confirmada';
     5: ESituacao.Text:='Consignação';
     6: ESituacao.Text:='Venda Cancelada';
     7: ESituacao.Text:='Consignação Cancelada';
     8: ESituacao.Text:='Venda Devolvida';
     9: ESituacao.Text:='Consignação Devolvida';
     10: ESituacao.Text:='Cancelado por não aprovação do crédito';
     11: ESituacao.Text:='Pedido Finalizado';
    End;
  Except
  End;
  try
    EGarantia.Text := IntToStr(Garantia);
  except
  end;
  try
    ETipoDeVenda.ItemIndex := TipoDeVenda-10;
  except
  end;
  try
    ECodigoPDVOrigem.Text := IntToStr(CodigoPDVOrigem);
  except
  end;
  Try
    EEntregaDeposito.Checked := EntregaDeposito;
  Except
  End;
  try
    ESituacaoInt.ItemIndex := Situacao;
  except
  end;
  Try
    EOBS.Text                 :=Obs;
  Except
  End;
end;

constructor TPedido_de_Venda.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'PEDIDO_DE_VENDA';

     { Code to perform other tasks when the component is created }

end;

function TPedido_de_Venda.Deletar(CdCNC,CdPDV:Integer):Boolean;
var
  CdCLI: integer;
begin
  Result := False;
  If not(localizarCod(CdPDV,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      CdCLI := CodigoCLI;
      if Delete then
      Begin
        Result := True;
        RegistrarDel(CdCNC,1860(*PedidoDeVenda*),CdPDV,'CLI:'+IntToStr(CdCLI));
        if TQuery(Self).isEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TPedido_de_Venda.Destroy;
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

function TPedido_de_Venda.FecharPedido:Boolean;
begin
  if (active) and (not IsEmpty) then
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_EM_USO=0 '+
        ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(CodigoPDV));
      result:=True;
    except
      result:=False;
    end;
  end
  else
    result:=True;
end;

function TPedido_de_Venda.FinalizaEdicao(PSituacao,PListado:Integer;PTotal,PAcrescimo:Double;PGRPEsp:Boolean=False;PServico:Boolean=False):Boolean;
var
  Mensagem: string;
begin
  Result := False;
  mensagem := '';
  if PServico then
  Begin
    if not VerificaDataBranco(EDataPrevisao.Text) then
      mensagem:=mensagem + 'Data de Previsão inválida!'+#13;
    if not VerificaInteiroBranco(ECodigoCLI.Text) then
      mensagem:= mensagem + 'Código do Cliente inválido!'+#13;
    if (ECaixa <> Nil) then
    Begin
      if not VerificaInteiroBranco(ECaixa.Text) then
      Begin
        if (CConfiguracao.Empresa = empMotical) then
          mensagem:= mensagem + 'Caixa inválido!'+#13
        else
          ECaixa.Text := '0';
      end;
    end;
  end;
  if mensagem <> '' then
    ShowMessage(mensagem)
  else
  Begin
    If Estado=1 then
    Begin
      if Inserirauto(PSituacao,PListado,PTotal,PAcrescimo,PGRPEsp,PServico) then
      Begin
        Result := True;
        Estado:=0;
        AtualizaControles(False);
      end;
    End
    else If Estado=2 then
    Begin
      if Alterarauto(PSituacao,PListado,PTotal,PAcrescimo,PGRPEsp,PServico) then
      Begin
        Result := True;
        Estado:=0;
        AtualizaControles(False);
      end;
    End;
  end;
end;

{ Insere um Pedido de Venda }
function TPedido_de_Venda.Inserir(CdCNC,CdPDV,CdCLI,CdAGF,CdFPG,PTipoPag,CdUSU,PSituacao: integer;  PTotal: Double; POBS,PDoc: String;PDiasReserv:Integer;PCliCNC:Integer;PData,PPrev:TDateTime;PGRPEsp:Boolean=False;PServ:Boolean=False;PCont:String=''):boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdPDV=0 then
    Cod    := ProximoCodigo('PDV_CODIGO')
  else
    Cod    := CdPDV;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
     Insert;
     try
       CodigoPDV      := Cod;
       try
         CodigoFPG      := CdFPG;
       except
       end;
       try
         CodigoAGF      := CdAGF;
       except
       end;
       try
         TipoPag      := PTipoPag;
       except
       end;
       try
         CodigoCNC      := CdCNC;
       except
       end;
       try
         ClienteCNC    := PCLICNC;
       except
       end;
       try
         CodigoCLI      := CdCLI;
       except
       end;
       try
         CodigoUSU      := CdUSU;
       except
       end;
       try
         CodigoFPE      := 0;
       except
       end;
       Try
         MaquinaPDV      := Maquina;
       Except
       End;
       Try
         DataHora       := PData;
       Except
       End;
       Try
         if PPrev > 0 then
           DataPrevisao       := PPrev;
       Except
       End;
       Try
         Listado        := 0;
       Except
       End;
       Try
         Credito        := 0;
       Except
       End;
       Try
         Total          := PTotal;
       Except
       End;
       Try
         DiasReserv     := PDiasReserv;
       Except
       End;
       Try
         NotaFiscal       := 0;
       Except
       End;
       Try
         NotaCupom       := 0;
       Except
       End;
       Try
         GrupoEspecial  := PGRPEsp;
       Except
       End;
       Try
         Total  := 0;
       Except
       End;
       Try
         Acrescimo  := 0;
       Except
       End;
       Try
         Entrada  := 0;
       Except
       End;
       Try
         Frete  := 0;
       Except
       End;
       Try
         PagamentoAntecipado  := 0;
       Except
       End;
       Try
         Arquiteto  := 0;
       Except
       End;
       Try
         CodigoPacote  := 0;
       Except
       End;
       Try
         TipoDeVenda  := 0;
       Except
       End;
       Try
         TituloGerado  := False;
       Except
       End;
       Try
         MediaPagamento  := 0;
       Except
       End;
       try
          Servico := PServ;
       except
       end;
       Try
         Documento      := UpperCase(PDoc);
       Except
       End;
       Try
         Contato            := UpperCase(PCont);
       Except
       End;
       Try
         EmUsu            := 0;
       Except
       End;
       Try
         Situacao       := PSituacao;
       Except
       End;
       Try
         Obs            := UpperCase(POBS);
       Except
       End;
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

function TPedido_de_Venda.InserirAuto(PSituacao,PListado:Integer;PTotal,PAcrescimo:Double;PGRPEsp:Boolean=False;PServico:Boolean=False):Boolean;
Var
  Aux:TDataSetNotifyEvent;
  CdCLICNC, CdCLI, CdTipoPag, CdFPG, CdAGF, CdCNT: integer;
begin
  Result := False;
  try
    if (ECaixa <> Nil) and
       PServico and
       (CConfiguracao.Empresa <> empLuciano) then
    Begin
      with CConfiguracao.QueryConsultas do
      Begin
        Close;
        SQL.Text := 'SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_CAIXA="'+Trim(ECaixa.Text)+'" '+
          ' AND PDV_SITUACAO<>6 '+ //Cancelado
          ' AND PDV_SITUACAO<>3 '+ //Pronto para entregar
          ' AND PDV_SITUACAO<>4 '+ //Dif. Pronto e Entregue ao Cliente
          ' AND PDV_SITUACAO<>8 '; //Devolvido
        Open;
        if not isEmpty then
        Begin
          ShowMessage('Caixa em uso no serviço '+FieldByName('PDV_CODIGO').asString);
          Exit;
        end;
      end;
    end;

    Aux:=AfterScroll;
    AfterScroll:=Nil;
    append;
    try
       CodigoCNC   := CConfiguracao.CodigoCNC;
    except
    end;
    try
      CodigoPDV   := SCodigo;
    except
    end;
    try
       CodigoUSU   := CConfiguracao.CodigoUSU;
    except
    end;
    try
      ClienteCNC   := StrToInt(EClienteCNC.Text);
      CdCLICNC     := ClienteCNC;
    except
      CdCLICNC     := 0;
    end;
    try
      CodigoCLI := StrToInt(ECodigoCLI.Text);
      CdCLI     := CodigoCLI;
    except
      CdCLI     := 0;
    end;
    try
       CodigoCNT   := StrToInt(ECodigoCNT.Text);
       CdCNT       := StrToInt(ECodigoCNT.Text);
    except
      CdCNT := 0;
    end;
    try
      NotaFiscal   := 0;
    except
    end;
    Try
      MaquinaPDV      := Maquina;
    Except
    End;
    try
      DataHora := CConfiguracao.DataHora;
    except
    end;
    try
      DataPrevisao := StrToDateTime(EDataPrevisao.Text);
    except
    end;
    try
      CodigoFPG   := ECodigoFPG.KeyValue;
      CdFPG       := CodigoFPG;
    except
      CdFPG       := 0;
    end;
    try
      CodigoAGF   := ECodigoAGF.KeyValue;
      CdAGF       := ECodigoAGF.KeyValue;
    except
      CdAGF       := 0;
    end;
    try
      TipoPag   := ETipoPag.KeyValue;
      CdTipoPag := TipoPag;
    except
      CdTipoPag := 0;
    end;
    try
      DiasReserv := StrToInt(EDiasReserv.Text);
    except
    end;
    try
      listado := PListado;
    except
    end;
    try
      Credito := 0;
    except
    end;
    try
      Total := PTotal;
    except
    end;
    try
      Acrescimo := PAcrescimo;
    except
    end;
    Try
      NotaCupom       := 0;
    Except
    End;
    try
      GrupoEspecial := PGRPEsp;
    except
    end;
    try
      Contato := EContato.Text;
    except
    end;
    try
      FoneContato := EFoneContato.Text;
    except
    end;
    try
      Caixa := ECaixa.Text;
    except
      Caixa := '0';
    end;
    try
       Documento := EDocumento.Text;
    except
    end;
    try
       EmUsu := 1;
    except
    end;
    try
       Servico := PServico;
    except
    end;
    try
      CodigoPDVOrigem := StrToInt(ECodigoPDVOrigem.Text);
    except
    end;
    try
      Garantia := StrToInt(EGarantia.Text);
    except
    end;
    try
      TipoDeVenda := ETipoDeVenda.ItemIndex + 10;
    except
    end;
    try
      EntregaDeposito := EEntregaDeposito.Checked;
    except
    end;
    try
      if VerificaDataBranco(EMelhorData.Text) then
        MelhorData := StrToDate(EMelhorData.Text);
    except
    end;
    try
      Situacao := PSituacao;
    except
    end;
    try
      Obs := UpperCase(EOBS.Text);
    except
    end;
    try
      Post;

      GeraLog(6600, CodigoCNC, CodigoPDV, 'CNCCLI:'+IntToStr(CdCLICNC)+
        ' CLI:'+IntToStr(CdCLI)+
        ' TipoPag:'+IntToStr(CdTipoPag)+
        ' FPG:'+IntToStr(CdFPG)+
        ' AGF:'+IntToStr(CdAGF)+
        ' CNT:'+IntToStr(CdCNT));

      AfterScroll:=Aux;
      CarregaDados;
      result:=True;
    except
      Cancel;
      ShowMessage('Não foi possível incluir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
    end;
  except
    ShowMessage('Não foi possível alterar registro corrente. Verifique se a tabela encontra-se em modo de somente leitura.');
  end;
end;

procedure TPedido_de_Venda.LimpaCampos;
var
  sDataUtil: string;
begin
  try
    if Estado <> 1 then
      ECodigoPDV.Clear;
  except
  end;
  try
    ECodigoCNT.Clear;
  except
  end;
  Try
    if Estado <> 1 then
      EDataHora.Clear
    else
      EDataHora.text := DateTimeToStr(CConfiguracao.DataHora);
  Except
  End;
  Try
    if Estado <> 1 then
      EDataPrevisao.Clear
    else if CConfiguracao.Empresa IN [empEletro,empPetromax] then
      EDataPrevisao.text := DateToStr(CConfiguracao.DataHora+1)
    else if CConfiguracao.Empresa = empLBM then //Dois Dias Últeis
    Begin
      sDataUtil := RetornaDataValidaUtil(CConfiguracao.PastaSistema, DateToStr(CConfiguracao.DataHora+1));
      sDataUtil := RetornaDataValidaUtil(CConfiguracao.PastaSistema, DateToStr(StrToDate(sDataUtil)+1));
      EDataPrevisao.text := sDataUtil;
    end
    else if CConfiguracao.Empresa = empLuciano then //Quatro dias úteis
    Begin
      sDataUtil := RetornaDataValidaUtil(CConfiguracao.PastaSistema, DateToStr(CConfiguracao.DataHora+1));
      sDataUtil := RetornaDataValidaUtil(CConfiguracao.PastaSistema, DateToStr(StrToDate(sDataUtil)+1));
      sDataUtil := RetornaDataValidaUtil(CConfiguracao.PastaSistema, DateToStr(StrToDate(sDataUtil)+1));
      sDataUtil := RetornaDataValidaUtil(CConfiguracao.PastaSistema, DateToStr(StrToDate(sDataUtil)+1));
      EDataPrevisao.text := sDataUtil;
    end
    else
      EDataPrevisao.text := DateToStr(CConfiguracao.DataHora);
  Except
  End;
  Try
    ECodigoCLI.Clear;
  Except
  End;
  Try
    EClienteCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    ETipoPag.KeyValue := 0;
  Except
  End;
  Try
    ECodigoFPG.KeyValue := 0;
  Except
  End;
  Try
    ECodigoAGF.KeyValue := 0;
  Except
  End;
  Try
    ENotaFiscal.Clear;
  Except
  End;
  Try
    ENomeCLI.Clear;
  Except
  End;
  Try
    ECPFCLI.Clear;
  Except
  End;
  Try
    ERGCLI.Clear;
  Except
  End;
  Try
    EResumo.Clear;
  Except
  End;
  Try
    EContato.Clear;
  Except
  End;
  Try
    EFoneContato.Clear;
  Except
  End;
  Try
    ECaixa.Clear;
  Except
  End;
  Try
    EDocumento.Clear;
  Except
  End;
  Try
    ESituacao.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EGarantia.Clear
    else
      EGarantia.Text := '3';
  Except
  End;
  Try
    if Estado <> 1 then
      ETipoDeVenda.ItemIndex := -1
    else
      ETipoDeVenda.ItemIndex := 0;
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoPDVOrigem.Clear
    else
      ECodigoPDVOrigem.Text := '0';
  Except
  End;
  Try
    EEntregaDeposito.Checked := False;
  Except
  End;
  Try
    EMelhorData.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ESituacaoInt.ItemIndex := -1
    else
      ESituacaoInt.ItemIndex := 0;
  Except
  End;
  Try
    EOBS.Clear;
  Except
  End;
end;

{ Localiza um pedido de venda }
function TPedido_de_Venda.LocalizarCod(CdPDV,CdCNC:Integer):Boolean;
begin
  If (CdPDV<>CodigoPDV) or (CdCNC<>CodigoCNC) Then
    If locate('CNC_CODIGO;PDV_CODIGO', vararrayof([CdCNC, CdPDV]), []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

function TPedido_de_Venda.LocalizarPed(Usuario:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Close;
  SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA WHERE USU_CODIGO='+IntToStr(Usuario)
          +' ORDER BY USU_CODIGO';
  Open;
  Result := not isEmpty;
  Last;
end;

procedure TPedido_de_Venda.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
end;

procedure TPedido_de_Venda.PreparaInsercao;
begin
  ProximoCodigo('PDV_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

procedure TPedido_de_Venda.Resumo(Query:TQuery);
Var
  Tot, vTaxaMensal: Double;
  i: integer;
  vEntrada: Boolean;
  sPagAntecipado, sEntrada: string;
begin
  EResumo.Clear;
  vEntrada := ((CForma_de_Pagamento.Prazo[1] = '0') and (CForma_de_Pagamento.Prazo <> '0'));
  if PagamentoAntecipado > 0 then
    sPagAntecipado := ' ('+Format('%.2f',[PagamentoAntecipado])+')'
  else
    sPagAntecipado := '';
  Tot := 0;
  With Query do
  Begin
    First;
    i := 1;
    While not EOF do
    Begin
      if (not vEntrada) or //Não tiver entrada
         (i <> 1) then //Não for a primeira prestação
        vTaxaMensal := CAgenteFin.TaxaMensal
      else
        vTaxaMensal := 0;

      sEntrada := '';
      if vEntrada and
         (i = 1) and
         (DateToStr(CConfiguracao.Data) <> FieldByName('TRC_VENCIMENTO').AsString) then
        sEntrada := ' (Entrada)';

      if (i <> 1) then
        sPagAntecipado := '';
      EResumo.Lines.Add(FieldByName('TRC_VENCIMENTO').AsString+' - R$ '+
                        Format('%.2f', [FieldByName('TRC_VALOR').AsFloat+vTaxaMensal])+sEntrada+sPagAntecipado);

      Tot:=Tot+Arredonda(FieldByName('TRC_VALOR').AsFloat+vTaxaMensal);

      inc(i);
      Next;
    End;
  End;
  EResumo.Lines.Add('-------------------------');
  EResumo.Lines.Add('Total: R$ '+Format('%.2f', [Tot]));
end;

function TPedido_de_Venda.SelecionarPed(CdPDV,CdCNC:Integer):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  Close;
  SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA WHERE PDV_CODIGO='+IntToStr(CdPDV);
  Open;
  Result := not isEmpty;
end;

function TPedido_de_Venda.deletarauto:Boolean;
var
  CdCNC, CdPDV, CdCLI: integer;
begin
  Result := False;
  try
    CdCNC := CodigoCNC;
    CdPDV := CodigoPDV;
    CdCLI := CodigoCLI;
    if Delete then
    Begin
      Result := True;
      RegistrarDel(CdCNC,1860(*PedidoDeVenda*),CdPDV,'CLI:'+IntToStr(CdCLI));
      if isEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
