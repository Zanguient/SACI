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
unit Configuracao;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Dbtables, Dialogs, Db, Stdctrls, Mask, 
     Dbctrls, Funcoes, Variants, Inifiles;

type
  TConfiguracao = class(TQuery)
    private
      { Private fields of TConfiguracao }
        { Storage for property AliquotaCOFINS }
        FAliquotaCOFINS : Double;
        { Storage for property AliquotaCPMF }
        FAliquotaCPMF : Double;
        { Storage for property AliquotaISS }
        FAliquotaISS : Double;
        { Storage for property AliquotaPIS }
        FAliquotaPIS : Double;
        { Storage for property CPD }
        FCPD : Boolean;
        { Storage for property Caixa }
        FCaixa : Boolean;
        { Storage for property CentroDeCusto }
        FCentroDeCusto : Integer;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property CodUltRec }
        FCodUltRec : Integer;
        { Storage for property CodigoCAX }
        FCodigoCAX : Integer;
        { Storage for property CodigoCNF }
        FCodigoCNF : Integer;
        { Storage for property CodigoCliAVista }
        FCodigoCliAVista : Integer;
        { Storage for property CodigoImpFiscal }
        FCodigoImpFiscal : Integer;
        { Storage for property CodigoSPC }
        FCodigoSPC : String;
        { Storage for property ContFactoring }
        FContFactoring : Integer;
        { Storage for property ContPagFor }
        FContPagFor : Integer;
        { Storage for property ContPagTrn }
        FContPagTrn : Integer;
        { Storage for property ContPagVen }
        FContPagVen : Integer;
        { Storage for property ContRecCli }
        FContRecCli : Integer;
        { Storage for property ContRecCliAnt }
        FContRecCliAnt : Integer;
        { Storage for property ContRecServico }
        FContRecServico : Integer;
        { Storage for property ContTransfere }
        FContTransfere : Integer;
        { Storage for property ContaAbreCaixa }
        FContaAbreCaixa : Integer;
        { Storage for property ContaFechaCaixa }
        FContaFechaCaixa : Integer;
        { Storage for property ContaVerificaCaixa }
        FContaVerificaCaixa : Integer;
        { Storage for property ControleTransacao }
        FControleTransacao : Boolean;
        { Storage for property CustoOperacional }
        FCustoOperacional : Double;
        { Storage for property CustoOperacionalLJ3 }
        FCustoOperacionalLJ3 : Double;
        { Storage for property Daruma }
        FDaruma : Integer;
        { Storage for property Data }
        FData : TDateTime;
        { Storage for property DataHora }
        FDataHora : TDateTime;
        { Storage for property Deposito }
        FDeposito : Integer;
        { Storage for property DiasLibVendaInadiplente }
        FDiasLibVendaInadiplente : Integer;
        { Storage for property Dias_Reserv }
        FDias_Reserv : Integer;
        { Storage for property DiretoImpFiscal }
        FDiretoImpFiscal : Boolean;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property ECodigoCAX }
        FECodigoCAX : TEdit;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookupComboBox;
        { Storage for property ECodigoCNF }
        FECodigoCNF : TEdit;
        { Storage for property EContFactoring }
        FEContFactoring : TEdit;
        { Storage for property EContPagVen }
        FEContPagVen : TEdit;
        { Storage for property EContRecCli }
        FEContRecCli : TEdit;
        { Storage for property EContRecServico }
        FEContRecServico : TEdit;
        { Storage for property EContTransfere }
        FEContTransfere : TEdit;
        { Storage for property EContpagfor }
        FEContpagfor : TEdit;
        { Storage for property ECustoOperacional }
        FECustoOperacional : TEdit;
        { Storage for property ECustoOperacionalLJ3 }
        FECustoOperacionalLJ3 : TEdit;
        { Storage for property EDiasLibVendaInadiplente }
        FEDiasLibVendaInadiplente : TEdit;
        { Storage for property EEsp }
        FEEsp : TEdit;
        { Storage for property EEspPag }
        FEEspPag : TEdit;
        { Storage for property EIgnorarCheques }
        FEIgnorarCheques : TCheckBox;
        { Storage for property EIgnorarDepositos }
        FEIgnorarDepositos : TCheckBox;
        { Storage for property ELimiteCreditoBasico }
        FELimiteCreditoBasico : TEdit;
        { Storage for property ENorm }
        FENorm : TEdit;
        { Storage for property ENormPag }
        FENormPag : TEdit;
        { Storage for property EPercentualCusto }
        FEPercentualCusto : TEdit;
        { Storage for property EPercentualLucro }
        FEPercentualLucro : TEdit;
        { Storage for property EQNT_DIAS_DEV }
        FEQNT_DIAS_DEV : TEdit;
        { Storage for property ETaxaJuros }
        FETaxaJuros : TEdit;
        { Storage for property EUF }
        FEUF : TComboBox;
        { Storage for property EVlMora }
        FEVlMora : TEdit;
        { Storage for property Empresa }
        FEmpresa : Integer;
        { Storage for property EnviarSPC }
        FEnviarSPC : Integer;
        { Storage for property EstoqueDetalhado }
        FEstoqueDetalhado : Boolean;
        { Storage for property EstoqueIdeal }
        FEstoqueIdeal : Boolean;
        { Storage for property NFE }
        FNFE : Boolean;
        { Storage for property Exportar }
        FExportar : Boolean;
        { Storage for property Gerarlog }
        FGerarlog : Boolean;
        { Storage for property GrupoRepasse }
        FGrupoRepasse : Integer;
        { Storage for property IgnorarCheques }
        FIgnorarCheques : Boolean;
        { Storage for property IgnorarDepositos }
        FIgnorarDepositos : Boolean;
        { Storage for property ImpCheque }
        FImpCheque : Integer;
        { Storage for property ImpFiscal }
        FImpFiscal : Integer;
        { Storage for property Interbase }
        FInterbase : Integer;
        { Storage for property ItemAutomatico }
        FItemAutomatico : Integer;
        { Storage for property JurosEsp }
        FJurosEsp : Double;
        { Storage for property JurosEspPag }
        FJurosEspPag : Double;
        { Storage for property JurosNorm }
        FJurosNorm : Double;
        { Storage for property JurosNormPag }
        FJurosNormPag : Double;
        { Storage for property LBMDesconto60 }
        FLBMDesconto60 : Double;
        { Storage for property LBMJuros60 }
        FLBMJuros60 : Double;
        { Storage for property Laboratorio }
        FLaboratorio : Integer;
        { Storage for property LaboratorioCota1 }
        FLaboratorioCota1 : Double;
        { Storage for property LaboratorioCota2 }
        FLaboratorioCota2 : Double;
        { Storage for property LaboratorioMeta }
        FLaboratorioMeta : Double;
        { Storage for property LeitoraCheque }
        FLeitoraCheque : Integer;
        { Storage for property Lim_desc }
        FLim_desc : Double;
        { Storage for property Lim_desc_esp }
        FLim_desc_esp : Double;
        { Storage for property LimiteCreditoBasico }
        FLimiteCreditoBasico : Double;
        { Storage for property LimiteMediaVenda }
        FLimiteMediaVenda : Integer;
        { Storage for property LocalCPD }
        FLocalCPD : Integer;
        { Storage for property LojaNome }
        FLojaNome : String;
        { Storage for property Magazine }
        FMagazine : Boolean;
        { Storage for property Maquina }
        FMaquina : Integer;
        { Storage for property MaxItensNota }
        FMaxItensNota : Integer;
        { Storage for property MaxLinhasImp }
        FMaxLinhasImp : Integer;
        { Storage for property MelhorData }
        FMelhorData : Integer;
        { Storage for property MensagemCupom }
        FMensagemCupom : String;
        { Storage for property MensagemRodape }
        FMensagemRodape : String;
        { Storage for property Montagem }
        FMontagem : Integer;
        { Storage for property MontagemCota1 }
        FMontagemCota1 : Double;
        { Storage for property MontagemCota2 }
        FMontagemCota2 : Double;
        { Storage for property MontagemMeta }
        FMontagemMeta : Double;
        { Storage for property NFerramenta }
        FNFerramenta : Double;
        { Storage for property Orcamento }
        FOrcamento : Integer;
        { Storage for property PastaImagens }
        FPastaImagens : String;
        { Storage for property PastaSistema }
        FPastaSistema : String;
        { Storage for property PastaSons }
        FPastaSons : String;
        { Storage for property PercentualCusto }
        FPercentualCusto : Double;
        { Storage for property PercentualLucro }
        FPercentualLucro : Double;
        { Storage for property PopupMenu }
        FPopupMenu : Integer;
        { Storage for property PrdReferenciaUnica }
        FPrdReferenciaUnica : Boolean;
        { Storage for property QNT_DIAS_DEV }
        FQNT_DIAS_DEV : Integer;
        { Storage for property QuantDiasSemCobran }
        FQuantDiasSemCobran : Integer;
        { Storage for property QuantDiasSemJuros }
        FQuantDiasSemJuros : Integer;
        { Storage for property QueryComandos }
        FQueryComandos : TQuery;
        { Storage for property QueryConsultas }
        FQueryConsultas : TQuery;
        { Storage for property SqlInterbase }
        FSqlInterbase : Integer;
        { Storage for property TaxaJuros }
        FTaxaJuros : Double;
        { Storage for property TempoOcioso }
        FTempoOcioso : Integer;
        { Storage for property TipoCobranca }
        FTipoCobranca : Integer;
        { Storage for property TipoDocumento }
        FTipoDocumento : Integer;
        { Storage for property UF }
        FUF : String;
        { Storage for property VerificaEstoque }
        FVerificaEstoque : Integer;
        { Storage for property VersaoBase }
        FVersaoBase : Integer;
        { Storage for property VersaoIncluirOper }
        FVersaoIncluirOper : Integer;
        { Storage for property VlMora }
        FVlMora : Double;

      { Private methods of TConfiguracao }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property AliquotaCOFINS }
        function GetAliquotaCOFINS : Double;
        { Read method for property AliquotaCPMF }
        function GetAliquotaCPMF : Double;
        { Read method for property AliquotaISS }
        function GetAliquotaISS : Double;
        { Read method for property AliquotaPIS }
        function GetAliquotaPIS : Double;
        { Read method for property CPD }
        function GetCPD : Boolean;
        { Read method for property Caixa }
        function GetCaixa : Boolean;
        { Read method for property CentroDeCusto }
        function GetCentroDeCusto : Integer;
        { Read method for property Cidade }
        function GetCidade : String;
        { Read method for property CodUltRec }
        function GetCodUltRec : Integer;
        { Read method for property CodigoCAX }
        function GetCodigoCAX : Integer;
        { Read method for property CodigoCNF }
        function GetCodigoCNF : Integer;
        { Read method for property CodigoCliAVista }
        function GetCodigoCliAVista : Integer;
        { Read method for property CodigoImpFiscal }
        function GetCodigoImpFiscal : Integer;
        { Read method for property CodigoSPC }
        function GetCodigoSPC : String;
        { Read method for property ContFactoring }
        function GetContFactoring : Integer;
        { Read method for property ContPagFor }
        function GetContPagFor : Integer;
        { Read method for property ContPagTrn }
        function GetContPagTrn : Integer;
        { Read method for property ContPagVen }
        function GetContPagVen : Integer;
        { Read method for property ContRecCli }
        function GetContRecCli : Integer;
        { Read method for property ContRecCliAnt }
        function GetContRecCliAnt : Integer;
        { Read method for property ContRecServico }
        function GetContRecServico : Integer;
        { Read method for property ContTransfere }
        function GetContTransfere : Integer;
        { Read method for property ContaAbreCaixa }
        function GetContaAbreCaixa : Integer;
        { Read method for property ContaFechaCaixa }
        function GetContaFechaCaixa : Integer;
        { Read method for property ContaVerificaCaixa }
        function GetContaVerificaCaixa : Integer;
        { Read method for property ControleTransacao }
        function GetControleTransacao : Boolean;
        { Read method for property CustoOperacional }
        function GetCustoOperacional : Double;
        { Read method for property CustoOperacionalLJ3 }
        function GetCustoOperacionalLJ3 : Double;
        { Read method for property Daruma }
        function GetDaruma : Integer;
        { Read method for property Data }
        function GetData : TDateTime;
        { Read method for property DataHora }
        function GetDataHora : TDateTime;
        { Read method for property Deposito }
        function GetDeposito : Integer;
        { Read method for property DiasLibVendaInadiplente }
        function GetDiasLibVendaInadiplente : Integer;
        { Read method for property Dias_Reserv }
        function GetDias_Reserv : Integer;
        { Read method for property DiretoImpFiscal }
        function GetDiretoImpFiscal : Boolean;
        { Read method for property Empresa }
        function GetEmpresa : Integer;
        { Read method for property EnviarSPC }
        function GetEnviarSPC : Integer;
        { Read method for property EstoqueDetalhado }
        function GetEstoqueDetalhado : Boolean;
        { Read method for property EstoqueIdeal }
        function GetEstoqueIdeal : Boolean;
        { Read method for property NFE }
        function GetNFE : Boolean;
        { Read method for property Gerarlog }
        function GetGerarlog : Boolean;
        { Read method for property GrupoRepasse }
        function GetGrupoRepasse : Integer;
        { Read method for property IgnorarCheques }
        function GetIgnorarCheques : Boolean;
        { Read method for property IgnorarDepositos }
        function GetIgnorarDepositos : Boolean;
        { Read method for property ImpCheque }
        function GetImpCheque : Integer;
        { Read method for property ImpFiscal }
        function GetImpFiscal : Integer;
        { Read method for property Interbase }
        function GetInterbase : Integer;
        { Read method for property ItemAutomatico }
        function GetItemAutomatico : Integer;
        { Read method for property JurosEsp }
        function GetJurosEsp : Double;
        { Read method for property JurosEspPag }
        function GetJurosEspPag : Double;
        { Read method for property JurosNorm }
        function GetJurosNorm : Double;
        { Read method for property JurosNormPag }
        function GetJurosNormPag : Double;
        { Read method for property LBMDesconto60 }
        function GetLBMDesconto60 : Double;
        { Read method for property LBMJuros60 }
        function GetLBMJuros60 : Double;
        { Read method for property Laboratorio }
        function GetLaboratorio : Integer;
        { Read method for property LaboratorioCota1 }
        function GetLaboratorioCota1 : Double;
        { Read method for property LaboratorioCota2 }
        function GetLaboratorioCota2 : Double;
        { Read method for property LaboratorioMeta }
        function GetLaboratorioMeta : Double;
        { Read method for property LeitoraCheque }
        function GetLeitoraCheque : Integer;
        { Read method for property Lim_desc }
        function GetLim_desc : Double;
        { Read method for property Lim_desc_esp }
        function GetLim_desc_esp : Double;
        { Read method for property LimiteCreditoBasico }
        function GetLimiteCreditoBasico : Double;
        { Read method for property LimiteMediaVenda }
        function GetLimiteMediaVenda : Integer;
        { Read method for property LocalCPD }
        function GetLocalCPD : Integer;
        { Read method for property LojaNome }
        function GetLojaNome : String;
        { Read method for property Magazine }
        function GetMagazine : Boolean;
        { Read method for property Maquina }
        function GetMaquina : Integer;
        { Read method for property MaxItensNota }
        function GetMaxItensNota : Integer;
        { Read method for property MaxLinhasImp }
        function GetMaxLinhasImp : Integer;
        { Read method for property MelhorData }
        function GetMelhorData : Integer;
        { Read method for property MensagemCupom }
        function GetMensagemCupom : String;
        { Read method for property MensagemRodape }
        function GetMensagemRodape : String;
        { Read method for property Montagem }
        function GetMontagem : Integer;
        { Read method for property MontagemCota1 }
        function GetMontagemCota1 : Double;
        { Read method for property MontagemCota2 }
        function GetMontagemCota2 : Double;
        { Read method for property MontagemMeta }
        function GetMontagemMeta : Double;
        { Read method for property NFerramenta }
        function GetNFerramenta : Double;
        { Read method for property Orcamento }
        function GetOrcamento : Integer;
        { Read method for property PastaImagens }
        function GetPastaImagens : String;
        { Read method for property PastaSistema }
        function GetPastaSistema : String;
        { Read method for property PastaSons }
        function GetPastaSons : String;
        { Read method for property PercentualCusto }
        function GetPercentualCusto : Double;
        { Read method for property PercentualLucro }
        function GetPercentualLucro : Double;
        { Read method for property PopupMenu }
        function GetPopupMenu : Integer;
        { Read method for property PrdReferenciaUnica }
        function GetPrdReferenciaUnica : Boolean;
        { Read method for property QNT_DIAS_DEV }
        function GetQNT_DIAS_DEV : Integer;
        { Read method for property QuantDiasSemCobran }
        function GetQuantDiasSemCobran : Integer;
        { Read method for property QuantDiasSemJuros }
        function GetQuantDiasSemJuros : Integer;
        { Read method for property SqlInterbase }
        function GetSqlInterbase : Integer;
        { Read method for property TaxaJuros }
        function GetTaxaJuros : Double;
        { Read method for property TempoOcioso }
        function GetTempoOcioso : Integer;
        { Read method for property TipoCobranca }
        function GetTipoCobranca : Integer;
        { Read method for property TipoDocumento }
        function GetTipoDocumento : Integer;
        { Read method for property UF }
        function GetUF : String;
        { Read method for property VerificaEstoque }
        function GetVerificaEstoque : Integer;
        { Read method for property VersaoBase }
        function GetVersaoBase : Integer;
        { Read method for property VersaoIncluirOper }
        function GetVersaoIncluirOper : Integer;
        { Read method for property VlMora }
        function GetVlMora : Double;

    protected
      { Protected fields of TConfiguracao }

      { Protected methods of TConfiguracao }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TConfiguracao }
        { Diz o Centro de Custo corrente no sistema }
        CodigoCNC : Integer;
        { Diz o usuário corrente no sistema }
        CodigoUSU : Integer;
        { Controla o estado da entidade(0-normal,1-Inserção,2-Alteração) }
        Estado : Integer;

      { Public methods of TConfiguracao }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function ProximoCodigo(Campo:String; Incremento:Integer=1):Longint;

    published
      { Published properties of TConfiguracao }
        property AliquotaCOFINS : Double
             read GetAliquotaCOFINS write FAliquotaCOFINS;
        property AliquotaCPMF : Double
             read GetAliquotaCPMF write FAliquotaCPMF;
        property AliquotaISS : Double read GetAliquotaISS write FAliquotaISS;
        property AliquotaPIS : Double read GetAliquotaPIS write FAliquotaPIS;
        property CPD : Boolean read GetCPD write FCPD;
        property Caixa : Boolean read GetCaixa write FCaixa;
        property CentroDeCusto : Integer
             read GetCentroDeCusto write FCentroDeCusto;
        property Cidade : String read GetCidade write FCidade;
        property CodUltRec : Integer read GetCodUltRec write FCodUltRec;
        property CodigoCAX : Integer read GetCodigoCAX write FCodigoCAX;
        { Código do Abastecimento }
        property CodigoCNF : Integer read GetCodigoCNF write FCodigoCNF;
        property CodigoCliAVista : Integer
             read GetCodigoCliAVista write FCodigoCliAVista;
        property CodigoImpFiscal : Integer
             read GetCodigoImpFiscal write FCodigoImpFiscal;
        property CodigoSPC : String read GetCodigoSPC write FCodigoSPC;
        property ContFactoring : Integer
             read GetContFactoring write FContFactoring;
        property ContPagFor : Integer read GetContPagFor write FContPagFor;
        property ContPagTrn : Integer read GetContPagTrn write FContPagTrn;
        property ContPagVen : Integer read GetContPagVen write FContPagVen;
        property ContRecCli : Integer read GetContRecCli write FContRecCli;
        property ContRecCliAnt : Integer
             read GetContRecCliAnt write FContRecCliAnt;
        property ContRecServico : Integer
             read GetContRecServico write FContRecServico;
        property ContTransfere : Integer
             read GetContTransfere write FContTransfere;
        property ContaAbreCaixa : Integer
             read GetContaAbreCaixa write FContaAbreCaixa;
        property ContaFechaCaixa : Integer
             read GetContaFechaCaixa write FContaFechaCaixa;
        property ContaVerificaCaixa : Integer
             read GetContaVerificaCaixa write FContaVerificaCaixa;
        property ControleTransacao : Boolean
             read GetControleTransacao write FControleTransacao;
        property CustoOperacional : Double
             read GetCustoOperacional write FCustoOperacional;
        property CustoOperacionalLJ3 : Double
             read GetCustoOperacionalLJ3 write FCustoOperacionalLJ3;
        property Daruma : Integer read GetDaruma write FDaruma;
        property Data : TDateTime read GetData write FData;
        property DataHora : TDateTime read GetDataHora write FDataHora;
        property Deposito : Integer read GetDeposito write FDeposito;
        property DiasLibVendaInadiplente : Integer
             read GetDiasLibVendaInadiplente write FDiasLibVendaInadiplente;
        property Dias_Reserv : Integer read GetDias_Reserv write FDias_Reserv;
        property DiretoImpFiscal : Boolean
             read GetDiretoImpFiscal write FDiretoImpFiscal;
        property ECidade : TEdit read FECidade write FECidade;
        property ECodigoCAX : TEdit read FECodigoCAX write FECodigoCAX;
        property ECodigoCNC : TDBLookupComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoCNF : TEdit read FECodigoCNF write FECodigoCNF;
        property EContFactoring : TEdit
             read FEContFactoring write FEContFactoring;
        property EContPagVen : TEdit read FEContPagVen write FEContPagVen;
        property EContRecCli : TEdit read FEContRecCli write FEContRecCli;
        property EContRecServico : TEdit
             read FEContRecServico write FEContRecServico;
        property EContTransfere : TEdit
             read FEContTransfere write FEContTransfere;
        property EContpagfor : TEdit read FEContpagfor write FEContpagfor;
        property ECustoOperacional : TEdit
             read FECustoOperacional write FECustoOperacional;
        property ECustoOperacionalLJ3 : TEdit
             read FECustoOperacionalLJ3 write FECustoOperacionalLJ3;
        property EDiasLibVendaInadiplente : TEdit
             read FEDiasLibVendaInadiplente write FEDiasLibVendaInadiplente;
        property EEsp : TEdit read FEEsp write FEEsp;
        property EEspPag : TEdit read FEEspPag write FEEspPag;
        property EIgnorarCheques : TCheckBox
             read FEIgnorarCheques write FEIgnorarCheques;
        property EIgnorarDepositos : TCheckBox
             read FEIgnorarDepositos write FEIgnorarDepositos;
        property ELimiteCreditoBasico : TEdit
             read FELimiteCreditoBasico write FELimiteCreditoBasico;
        property ENorm : TEdit read FENorm write FENorm;
        property ENormPag : TEdit read FENormPag write FENormPag;
        property EPercentualCusto : TEdit
             read FEPercentualCusto write FEPercentualCusto;
        property EPercentualLucro : TEdit
             read FEPercentualLucro write FEPercentualLucro;
        property EQNT_DIAS_DEV : TEdit
             read FEQNT_DIAS_DEV write FEQNT_DIAS_DEV;
        property ETaxaJuros : TEdit read FETaxaJuros write FETaxaJuros;
        property EUF : TComboBox read FEUF write FEUF;
        property EVlMora : TEdit read FEVlMora write FEVlMora;
        property Empresa : Integer read GetEmpresa write FEmpresa;
        property EnviarSPC : Integer read GetEnviarSPC write FEnviarSPC;
        property EstoqueDetalhado : Boolean
             read GetEstoqueDetalhado write FEstoqueDetalhado;
        property EstoqueIdeal : Boolean
             read GetEstoqueIdeal write FEstoqueIdeal;
        property NFE : Boolean
             read GetNFE write FNFE;
        property Exportar : Boolean read FExportar write FExportar;
        property Gerarlog : Boolean read GetGerarlog write FGerarlog;
        property GrupoRepasse : Integer
             read GetGrupoRepasse write FGrupoRepasse;
        property IgnorarCheques : Boolean
             read GetIgnorarCheques write FIgnorarCheques;
        property IgnorarDepositos : Boolean
             read GetIgnorarDepositos write FIgnorarDepositos;
        property ImpCheque : Integer read GetImpCheque write FImpCheque;
        property ImpFiscal : Integer read GetImpFiscal write FImpFiscal;
        property Interbase : Integer read GetInterbase write FInterbase;
        property ItemAutomatico : Integer
             read GetItemAutomatico write FItemAutomatico;
        property JurosEsp : Double read GetJurosEsp write FJurosEsp;
        property JurosEspPag : Double read GetJurosEspPag write FJurosEspPag;
        property JurosNorm : Double read GetJurosNorm write FJurosNorm;
        property JurosNormPag : Double
             read GetJurosNormPag write FJurosNormPag;
        property LBMDesconto60 : Double
             read GetLBMDesconto60 write FLBMDesconto60;
        property LBMJuros60 : Double read GetLBMJuros60 write FLBMJuros60;
        property Laboratorio : Integer read GetLaboratorio write FLaboratorio;
        property LaboratorioCota1 : Double
             read GetLaboratorioCota1 write FLaboratorioCota1;
        property LaboratorioCota2 : Double
             read GetLaboratorioCota2 write FLaboratorioCota2;
        property LaboratorioMeta : Double
             read GetLaboratorioMeta write FLaboratorioMeta;
        property LeitoraCheque : Integer
             read GetLeitoraCheque write FLeitoraCheque;
        property Lim_desc : Double read GetLim_desc write FLim_desc;
        property Lim_desc_esp : Double
             read GetLim_desc_esp write FLim_desc_esp;
        property LimiteCreditoBasico : Double
             read GetLimiteCreditoBasico write FLimiteCreditoBasico;
        property LimiteMediaVenda : Integer
             read GetLimiteMediaVenda write FLimiteMediaVenda;
        property LocalCPD : Integer read GetLocalCPD write FLocalCPD;
        property LojaNome : String read GetLojaNome write FLojaNome;
        property Magazine : Boolean read GetMagazine write FMagazine;
        property Maquina : Integer read GetMaquina write FMaquina;
        property MaxItensNota : Integer
             read GetMaxItensNota write FMaxItensNota;
        property MaxLinhasImp : Integer
             read GetMaxLinhasImp write FMaxLinhasImp;
        property MelhorData : Integer read GetMelhorData write FMelhorData;
        property MensagemCupom : String
             read GetMensagemCupom write FMensagemCupom;
        property MensagemRodape : String
             read GetMensagemRodape write FMensagemRodape;
        property Montagem : Integer read GetMontagem write FMontagem;
        property MontagemCota1 : Double
             read GetMontagemCota1 write FMontagemCota1;
        property MontagemCota2 : Double
             read GetMontagemCota2 write FMontagemCota2;
        property MontagemMeta : Double
             read GetMontagemMeta write FMontagemMeta;
        property NFerramenta : Double read GetNFerramenta write FNFerramenta;
        property Orcamento : Integer read GetOrcamento write FOrcamento;
        property PastaImagens : String
             read GetPastaImagens write FPastaImagens;
        property PastaSistema : String
             read GetPastaSistema write FPastaSistema;
        property PastaSons : String read GetPastaSons write FPastaSons;
        property PercentualCusto : Double
             read GetPercentualCusto write FPercentualCusto;
        property PercentualLucro : Double
             read GetPercentualLucro write FPercentualLucro;
        property PopupMenu : Integer read GetPopupMenu write FPopupMenu;
        property PrdReferenciaUnica : Boolean
             read GetPrdReferenciaUnica write FPrdReferenciaUnica;
        property QNT_DIAS_DEV : Integer
             read GetQNT_DIAS_DEV write FQNT_DIAS_DEV;
        property QuantDiasSemCobran : Integer
             read GetQuantDiasSemCobran write FQuantDiasSemCobran;
        property QuantDiasSemJuros : Integer
             read GetQuantDiasSemJuros write FQuantDiasSemJuros;
        property QueryComandos : TQuery
             read FQueryComandos write FQueryComandos;
        property QueryConsultas : TQuery
             read FQueryConsultas write FQueryConsultas;
        property SqlInterbase : Integer
             read GetSqlInterbase write FSqlInterbase;
        property TaxaJuros : Double read GetTaxaJuros write FTaxaJuros;
        property TempoOcioso : Integer read GetTempoOcioso write FTempoOcioso;
        property TipoCobranca : Integer
             read GetTipoCobranca write FTipoCobranca;
        property TipoDocumento : Integer
             read GetTipoDocumento write FTipoDocumento;
        property UF : String read GetUF write FUF;
        property VerificaEstoque : Integer
             read GetVerificaEstoque write FVerificaEstoque;
        property VersaoBase : Integer read GetVersaoBase write FVersaoBase;
        property VersaoIncluirOper : Integer
             read GetVersaoIncluirOper write FVersaoIncluirOper;
        property VlMora : Double read GetVlMora write FVlMora;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TConfiguracao with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TConfiguracao]);
end;

{ Method to set variable and property values and create objects }
procedure TConfiguracao.AutoInitialize;
begin
     CodigoUSU := 0;
     Estado := 0;
     FECidade := nil;
     FECodigoCAX := nil;
     FECodigoCNC := nil;
     FECodigoCNF := nil;
     FEContFactoring := nil;
     FEContPagVen := nil;
     FEContRecCli := nil;
     FEContRecServico := nil;
     FEContTransfere := nil;
     FEContpagfor := nil;
     FECustoOperacional := nil;
     FECustoOperacionalLJ3 := nil;
     FEDiasLibVendaInadiplente := nil;
     FEEsp := nil;
     FEEspPag := nil;
     FEIgnorarCheques := nil;
     FEIgnorarDepositos := nil;
     FELimiteCreditoBasico := nil;
     FENorm := nil;
     FENormPag := nil;
     FEPercentualCusto := nil;
     FEPercentualLucro := nil;
     FEQNT_DIAS_DEV := nil;
     FETaxaJuros := nil;
     FEUF := nil;
     FEVlMora := nil;
     FQueryComandos := nil;
     FQueryConsultas := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TConfiguracao.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FECodigoCAX then
        FECodigoCAX := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoCNF then
        FECodigoCNF := nil;
     if AComponent = FEContFactoring then
        FEContFactoring := nil;
     if AComponent = FEContPagVen then
        FEContPagVen := nil;
     if AComponent = FEContRecCli then
        FEContRecCli := nil;
     if AComponent = FEContRecServico then
        FEContRecServico := nil;
     if AComponent = FEContTransfere then
        FEContTransfere := nil;
     if AComponent = FEContpagfor then
        FEContpagfor := nil;
     if AComponent = FECustoOperacional then
        FECustoOperacional := nil;
     if AComponent = FECustoOperacionalLJ3 then
        FECustoOperacionalLJ3 := nil;
     if AComponent = FEDiasLibVendaInadiplente then
        FEDiasLibVendaInadiplente := nil;
     if AComponent = FEEsp then
        FEEsp := nil;
     if AComponent = FEEspPag then
        FEEspPag := nil;
     if AComponent = FEIgnorarCheques then
        FEIgnorarCheques := nil;
     if AComponent = FEIgnorarDepositos then
        FEIgnorarDepositos := nil;
     if AComponent = FELimiteCreditoBasico then
        FELimiteCreditoBasico := nil;
     if AComponent = FENorm then
        FENorm := nil;
     if AComponent = FENormPag then
        FENormPag := nil;
     if AComponent = FEPercentualCusto then
        FEPercentualCusto := nil;
     if AComponent = FEPercentualLucro then
        FEPercentualLucro := nil;
     if AComponent = FEQNT_DIAS_DEV then
        FEQNT_DIAS_DEV := nil;
     if AComponent = FETaxaJuros then
        FETaxaJuros := nil;
     if AComponent = FEUF then
        FEUF := nil;
     if AComponent = FEVlMora then
        FEVlMora := nil;
     if AComponent = FQueryComandos then
        FQueryComandos := nil;
     if AComponent = FQueryConsultas then
        FQueryConsultas := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TConfiguracao.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property AliquotaCOFINS }
function TConfiguracao.GetAliquotaCOFINS : Double;
begin
  try
    Result := Self.fieldByName('CNF_COFINS').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property AliquotaCPMF }
function TConfiguracao.GetAliquotaCPMF : Double;
begin
  try
    Result := Self.fieldByName('CNF_CPMF').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property AliquotaISS }
function TConfiguracao.GetAliquotaISS : Double;
begin
  try
    Result := Self.fieldByName('CNF_ALIQUOTA_ISS').asFloat;
    if Result = 0 then
      Result := 5;
  except
    result:= 5;
  end;
end;

{ Read method for property AliquotaPIS }
function TConfiguracao.GetAliquotaPIS : Double;
begin
  try
    Result := Self.fieldByName('CNF_PIS').asFloat;
  except
    Result := 0;
  end;
end;

{ Read method for property CPD }
function TConfiguracao.GetCPD : Boolean;
begin
  try
    if Self.fieldByName('CNF_CPD').AsInteger = 1 then
      Result := True
    else
      Result := False;
  except
    result:= False
  end;
end;

{ Read method for property Caixa }
function TConfiguracao.GetCaixa : Boolean;
var
  ArqConf:TIniFile;
begin
  Result := False;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    if ArqConf.ReadString('MAQUINA', 'Caixa', '0') = '1' then
      Result := True;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property CentroDeCusto }
function TConfiguracao.GetCentroDeCusto : Integer;
var
  ArqConf:TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'CC', '-1'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;


{ Read method for property Cidade }
function TConfiguracao.GetCidade : String;
begin
  try
    Result := Self.fieldByName('CNF_CIDADE').asString;
  except
    result:= ''
  end;
end;

{ Read method for property CodUltRec }
function TConfiguracao.GetCodUltRec : Integer;
begin
  try
    Result := Self.fieldByName('CNF_COD_ULT_REC').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoCAX }
function TConfiguracao.GetCodigoCAX : Integer;
var
  ArqConf:TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'CAX_CODIGO', '-1'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property CodigoCNF }
function TConfiguracao.GetCodigoCNF : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CODIGO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property CodigoCliAVista }
function TConfiguracao.GetCodigoCliAVista : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CLI_A_VISTA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoImpFiscal }
function TConfiguracao.GetCodigoImpFiscal : Integer;
var
  ArqConf:TIniFile;
begin
  Result := 0;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'CodigoImpFiscal', '0'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property CodigoSPC }
function TConfiguracao.GetCodigoSPC : String;
begin
  try
    Result := Self.fieldByName('CNF_CODIGO_SPC').asString;
  except
    result:= ''
  end;
end;

{ Read method for property ContFactoring }
function TConfiguracao.GetContFactoring : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CONT_FACTORING').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property ContPagFor }
function TConfiguracao.GetContPagFor : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CONT_PAG_FOR').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property ContPagTrn }
function TConfiguracao.GetContPagTrn : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CONT_PAG_TRN').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property ContPagVen }
function TConfiguracao.GetContPagVen : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CONT_PAG_VEN').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property ContRecCli }
function TConfiguracao.GetContRecCli : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CONT_REC_CLI').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property ContRecCliAnt }
function TConfiguracao.GetContRecCliAnt : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CONT_REC_CLI_ANT').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property ContRecServico }
function TConfiguracao.GetContRecServico : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CONT_REC_SERVICO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property ContTransfere }
function TConfiguracao.GetContTransfere : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CONT_TRANSFERE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property ContaAbreCaixa }
function TConfiguracao.GetContaAbreCaixa : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CONT_ABER_CX').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property ContaFechaCaixa }
function TConfiguracao.GetContaFechaCaixa : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CONT_FECH_CX').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property ContaVerificaCaixa }
function TConfiguracao.GetContaVerificaCaixa : Integer;
begin
  try
    Result := Self.fieldByName('CNF_CCX_VERIFICA_CAIXA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property ControleTransacao }
function TConfiguracao.GetControleTransacao : Boolean;
begin
  try
    if Self.fieldByName('CNF_CONTROLE_TRANSACAO').AsInteger = 1 then
      Result := True
    else
      Result := False;
  except
    result:= False
  end;
end;

{ Read method for property CustoOperacional }
function TConfiguracao.GetCustoOperacional : Double;
begin
  try
    Result := Self.fieldByName('CNF_CUSTO_OPERACIONAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property CustoOperacionalLJ3 }
function TConfiguracao.GetCustoOperacionalLJ3 : Double;
begin
  try
    Result := Self.fieldByName('CNF_CUSTO_OPERACIONAL_LJ3').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Daruma }
function TConfiguracao.GetDaruma : Integer;
var
  ArqConf:TIniFile;
begin
  Result := 0;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'Daruma', '0'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property Data }
function TConfiguracao.GetData : TDateTime;
begin
  try
    Result := Self.fieldByName('DATA').asDatetime;
  except
    result:= 0
  end;
end;

{ Read method for property DataHora }
function TConfiguracao.GetDataHora : TDateTime;
begin
  if Date=Data then
    Result := Data+Time
  else
    Result := 0;
//    Result:=Data+StrToTime('23:59:59');
end;

{ Read method for property Deposito }
function TConfiguracao.GetDeposito : Integer;
begin
  try
    Result := Self.fieldByName('CNC_DEPOSITO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DiasLibVendaInadiplente }
function TConfiguracao.GetDiasLibVendaInadiplente : Integer;
begin
  try
    Result := Self.fieldByName('CNF_DIAS_VENDA_INADIPLENTE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Dias_Reserv }
function TConfiguracao.GetDias_Reserv : Integer;
begin
  try
    Result := Self.fieldByName('DIAS_RESERV').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property DiretoImpFiscal }
function TConfiguracao.GetDiretoImpFiscal : Boolean;
var
  ArqConf:TIniFile;
begin
  Result := False;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    if ArqConf.ReadString('MAQUINA', 'DiretoImpFiscal', '0') = '1' then
      Result := True;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property Empresa }
function TConfiguracao.GetEmpresa : Integer;
var
  ArqConf:TIniFile;
begin
  Result := 0;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'Empresa', '0'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property EnviarSPC }
function TConfiguracao.GetEnviarSPC : Integer;
begin
  try
    Result := Self.fieldByName('CNF_ENVIAR_SPC').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property EstoqueDetalhado }
function TConfiguracao.GetEstoqueDetalhado : Boolean;
begin
  try
    result := (Self.fieldByName('CNF_ESTOQUE_DETALHADO').asInteger=1);
  except
    try
      result := Self.fieldByName('CNF_ESTOQUE_DETALHADO').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Read method for property EstoqueIdeal }
function TConfiguracao.GetEstoqueIdeal : Boolean;
begin
  try
    result := (Self.fieldByName('CNF_ESTOQUE_IDEAL').asInteger=1);
  except
    try
      result := Self.fieldByName('CNF_ESTOQUE_IDEAL').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Read method for property NFE }
function TConfiguracao.GetNFE : Boolean;
begin
  try
    result := (Self.fieldByName('CNF_NFE').asInteger=1);
  except
    try
      result := Self.fieldByName('CNF_NFE').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Read method for property Gerarlog }
function TConfiguracao.GetGerarlog : Boolean;
begin
  try
    result := (Self.fieldByName('GERARLOG').asInteger=1);
  except
    try
      result := Self.fieldByName('GERARLOG').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Read method for property GrupoRepasse }
function TConfiguracao.GetGrupoRepasse : Integer;
begin
  try
    Result := Self.fieldByName('CNF_GRUPO_REPASSE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property IgnorarCheques }
function TConfiguracao.GetIgnorarCheques : Boolean;
begin
  try
    result := (Self.fieldByName('CNF_IGNORAR_CHEQUES').asInteger=1);
  except
    try
      result := Self.fieldByName('CNF_IGNORAR_CHEQUES').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Read method for property IgnorarDepositos }
function TConfiguracao.GetIgnorarDepositos : Boolean;
begin
  try
    result := (Self.fieldByName('CNF_IGNORAR_DEPOSITOS').asInteger=1);
  except
    try
      result := Self.fieldByName('CNF_IGNORAR_DEPOSITOS').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Read method for property ImpCheque }
function TConfiguracao.GetImpCheque : Integer;
var
  ArqConf:TIniFile;
begin
  Result := 0;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'ImpCheque', '0'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property ImpFiscal }
function TConfiguracao.GetImpFiscal : Integer;
begin
  try
    Result := Self.fieldByName('CNF_IMPFISCAL').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Interbase }
function TConfiguracao.GetInterbase : Integer;
var
  ArqConf:TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'InterBase', '-1'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property ItemAutomatico }
function TConfiguracao.GetItemAutomatico : Integer;
var
  ArqConf:TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'ItemAutomatico', '0'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property JurosEsp }
function TConfiguracao.GetJurosEsp : Double;
begin
  try
    Result := Self.fieldByName('CNF_JUR_ESP').asFloat;
  except
    result:= 0
  end;
end;


{ Read method for property JurosEspPag }
function TConfiguracao.GetJurosEspPag : Double;
begin
  try
    Result := Self.fieldByName('CNF_JUR_ESP_PAG').asFloat;
  except
    result:= 0
  end;
end;


{ Read method for property JurosNorm }
function TConfiguracao.GetJurosNorm : Double;
begin
  try
    Result := Self.fieldByName('CNF_JUR_NORM').asFloat;
  except
    result:= 0;
  end;
end;


{ Read method for property JurosNormPag }
function TConfiguracao.GetJurosNormPag : Double;
begin
  try
    Result := Self.fieldByName('CNF_JUR_NORM_PAG').asFloat;
  except
    result:= 0;
  end;
end;


{ Read method for property LBMDesconto60 }
function TConfiguracao.GetLBMDesconto60 : Double;
begin
  try
    Result := Self.fieldByName('CNF_LBM_DESC_60').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property LBMJuros60 }
function TConfiguracao.GetLBMJuros60 : Double;
begin
  try
    Result := Self.fieldByName('CNF_LBM_JUROS_60').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Laboratorio }
function TConfiguracao.GetLaboratorio : Integer;
begin
  try
    Result := Self.fieldByName('CNF_LABORATORIO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property LaboratorioCota1 }
function TConfiguracao.GetLaboratorioCota1 : Double;
begin
  try
    Result := Self.fieldByName('CNF_LAB_COTA1').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property LaboratorioCota2 }
function TConfiguracao.GetLaboratorioCota2 : Double;
begin
  try
    Result := Self.fieldByName('CNF_LAB_COTA2').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property LaboratorioMeta }
function TConfiguracao.GetLaboratorioMeta : Double;
begin
  try
    Result := Self.fieldByName('CNF_LAB_META').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property LeitoraCheque }
function TConfiguracao.GetLeitoraCheque : Integer;
var
  ArqConf:TIniFile;
begin
  Result := 0;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'LeitoraCheque', '0'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property Lim_desc }
function TConfiguracao.GetLim_desc : Double;
begin
  try
    Result := Self.fieldByName('CNF_LIM_DESC').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Lim_desc_esp }
function TConfiguracao.GetLim_desc_esp : Double;
begin
  try
    Result := Self.fieldByName('CNF_LIM_DESC_ESP').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property LimiteCreditoBasico }
function TConfiguracao.GetLimiteCreditoBasico : Double;
begin
  try
    Result := Self.fieldByName('CNF_LIMITE_CREDITO_BASICO').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property LimiteMediaVenda }
function TConfiguracao.GetLimiteMediaVenda : Integer;
begin
  try
    Result := Self.fieldByName('CNF_LIMITE_MEDIA_VENDA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property LocalCPD }
function TConfiguracao.GetLocalCPD : Integer;
var
  ArqConf:TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'LocalCPD', '-1'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property LojaNome }
function TConfiguracao.GetLojaNome : String;
begin
  try
    Result := Self.fieldByName('CNF_LOJANOME').asString;
  except
    result:= ''
  end;
end;

{ Read method for property Magazine }
function TConfiguracao.GetMagazine : Boolean;
Begin
  try
    result := (Self.fieldByName('CNF_MAGAZINE').asInteger=1);
  except
    result := False;
  end;
end;

{ Read method for property Maquina }
function TConfiguracao.GetMaquina : Integer;
var
  ArqConf:TIniFile;
begin
  Result := -1;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'Maquina', '-1'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;


{ Read method for property MaxItensNota }
function TConfiguracao.GetMaxItensNota : Integer;
var
  ArqConf:TIniFile;
begin
  Result := 0;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'MaxItensNota', '0'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property MaxLinhasImp }
function TConfiguracao.GetMaxLinhasImp : Integer;
var
  ArqConf:TIniFile;
begin
  Result := 65;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'MaxLinhasImp', '65'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property MelhorData }
function TConfiguracao.GetMelhorData : Integer;
begin
  try
    Result := Self.fieldByName('CNF_MELHORDATA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property MensagemCupom }
function TConfiguracao.GetMensagemCupom : String;
begin
  try
    Result := Self.fieldByName('CNF_MENSAGEMCUPOM').asString;
  except
    result:= ''
  end;
end;

{ Read method for property MensagemRodape }
function TConfiguracao.GetMensagemRodape : String;
begin
  try
    Result := Self.fieldByName('CNF_MENSAGEMRODAPE').asString;
  except
    result:= ''
  end;
end;

{ Read method for property Montagem }
function TConfiguracao.GetMontagem : Integer;
begin
  try
    Result := Self.fieldByName('CNF_MONTAGEM').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property MontagemCota1 }
function TConfiguracao.GetMontagemCota1 : Double;
begin
  try
    Result := Self.fieldByName('CNF_MONT_COTA1').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property MontagemCota2 }
function TConfiguracao.GetMontagemCota2 : Double;
begin
  try
    Result := Self.fieldByName('CNF_MONT_COTA2').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property MontagemMeta }
function TConfiguracao.GetMontagemMeta : Double;
begin
  try
    Result := Self.fieldByName('CNF_MONT_META').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property NFerramenta }
function TConfiguracao.GetNFerramenta : Double;
begin
  try
    Result := Self.fieldByName('CNF_NFERRAMENTA').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Orcamento }
function TConfiguracao.GetOrcamento : Integer;
var
  ArqConf:TIniFile;
begin
  Result := 0;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'Orcamento', '0'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property PastaImagens }
function TConfiguracao.GetPastaImagens : String;
var
  ArqConf:TIniFile;
begin
  Result := '';
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := ArqConf.ReadString('MAQUINA', 'PastaImagens', '.');
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property PastaSistema }
function TConfiguracao.GetPastaSistema : String;
var
  ArqConf:TIniFile;
begin
  Result := '';
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := ArqConf.ReadString('MAQUINA', 'PastaSistema', '.');
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property PastaSons }
function TConfiguracao.GetPastaSons : String;
var
  ArqConf:TIniFile;
begin
  Result := '';
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := ArqConf.ReadString('MAQUINA', 'PastaSons', '.');
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property PercentualCusto }
function TConfiguracao.GetPercentualCusto : Double;
begin
  try
    Result := Self.fieldByName('CNF_PERCENTUAL_CUSTO').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property PercentualLucro }
function TConfiguracao.GetPercentualLucro : Double;
begin
  try
    Result := Self.fieldByName('CNF_PERCENTUAL_LUCRO').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property PopupMenu }
function TConfiguracao.GetPopupMenu : Integer;
begin
  try
    Result := Self.fieldByName('CNF_POPUPMENU').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property PrdReferenciaUnica }
function TConfiguracao.GetPrdReferenciaUnica : Boolean;
begin
  try
    result := (Self.fieldByName('CNF_PRD_REF_UNICA').asInteger=1);
  except
    try
      result := Self.fieldByName('CNF_PRD_REF_UNICA').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Read method for property QNT_DIAS_DEV }
function TConfiguracao.GetQNT_DIAS_DEV : Integer;
begin
  try
    Result := Self.fieldByName('CNF_QNT_DIAS_DEV').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property QuantDiasSemCobran }
function TConfiguracao.GetQuantDiasSemCobran : Integer;
begin
  try
    Result := Self.fieldByName('CNF_QNT_DIAS_SEM_COBRA').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property QuantDiasSemJuros }
function TConfiguracao.GetQuantDiasSemJuros : Integer;
begin
  try
    Result := Self.fieldByName('CNF_QNT_DIAS_SEM_JUROS').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property SqlInterbase }
function TConfiguracao.GetSqlInterbase : Integer;
begin
  try
    Result := Self.fieldByName('CNF_SQL').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property TaxaJuros }
function TConfiguracao.GetTaxaJuros : Double;
begin
  try
    Result := Self.fieldByName('CNF_TAXAJUROS').asFloat;
  except
    result:= 0
  end;
end;


{ Read method for property TempoOcioso }
function TConfiguracao.GetTempoOcioso : Integer;
var
  ArqConf:TIniFile;
begin
  Result := 0;
  ArqConf := TIniFile.Create(cArquivoConfiguracao);
  try
    try
      Result := StrToInt(ArqConf.ReadString('MAQUINA', 'TempoOcioso', '0'));
    except
    end;
  finally
    ArqConf.Free;
  end;
end;

{ Read method for property TipoCobranca }
function TConfiguracao.GetTipoCobranca : Integer;
begin
  try
    Result := Self.fieldByName('CNF_COBRANCA').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property TipoDocumento }
function TConfiguracao.GetTipoDocumento : Integer;
begin
  try
    Result := Self.fieldByName('CNF_TIPO_DOCUMENTO').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property UF }
function TConfiguracao.GetUF : String;
begin
  try
    Result := UpperCase(Self.fieldByName('CNF_UF').asString);
  except
    result:= ''
  end;
end;

{ Read method for property VerificaEstoque }
function TConfiguracao.GetVerificaEstoque : Integer;
begin
  try
    Result := Self.fieldByName('CNF_VERIFICA_ESTOQUE').asInteger;
  except
    result:= 0
  end;
end;

{ Read method for property VersaoBase }
function TConfiguracao.GetVersaoBase : Integer;
begin
  try
    Result := Self.fieldByName('CNF_VERSAO_BASE').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property VersaoIncluirOper }
function TConfiguracao.GetVersaoIncluirOper : Integer;
begin
  try
    Result := Self.fieldByName('CNF_VERSAO_INCLUIROPER').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property VlMora }
function TConfiguracao.GetVlMora : Double;
begin
  try
    Result := Self.fieldByName('CNF_VLMORA').asFloat;
  except
    result:= 0
  end;
end;

constructor TConfiguracao.Create(AOwner: TComponent);
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
//     FIniFile:=TRegistry.Create;
//     FIniFile.RootKey:=HKEY_CURRENT_USER;
//     FIniFile.RootKey:=HKEY_LOCAL_MACHINE;
//     FIniFile := TRegIniFile.Create('\HKEY_LOCAL_MACHINE\saci');
end;

destructor TConfiguracao.Destroy;
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

function TConfiguracao.ProximoCodigo(Campo:String; Incremento:Integer=1):Longint;
var
  Tabel:String;
begin
  If Campo = 'AGN_CODIGO' Then
    Tabel := 'AGENCIA_CONF'
  Else If Campo = 'AGF_CODIGO' Then
    Tabel := 'AGENTE_FINANCEIRO_CONF'
  Else If Campo = 'APF_CODIGO' Then
    Tabel := 'APLICACAO_FINANCEIRA_CONF'
  Else If Campo = 'APV_CODIGO' Then
    Tabel := 'ATENDIMENTO_POR_VENDEDOR_CONF'
  Else If Campo = 'ASD_CODIGO' Then
    Tabel := 'ASSISTENCIA_TECNICA_DEPOSITO_CONF'
  Else If Campo = 'AST_CODIGO' Then
    Tabel := 'ASSISTENCIA_TECNICA_CONF'
  Else If Campo = 'ATN_CODIGO' Then
    Tabel := 'AUTENTICACAO_CONF'
  Else If Campo = 'AUT_CODIGO' Then
    Tabel := 'AUTORIZADA_CONF'
  Else If Campo = 'AVL_CODIGO' Then
    Tabel := 'AVALISTA_CONF'
  Else If Campo = 'BLC_CODIGO' Then
    Tabel := 'BALANCO_CONF'
  Else If Campo = 'BLD_CODIGO' Then
    Tabel := 'BOLETIM_DIARIO_CONF'
  Else If Campo = 'BNC_CODIGO' Then
    Tabel := 'BANCO_CONF'
  Else If Campo = 'BNB_CODIGO' Then
    Tabel := 'BANCO_BOLETO_CONF'
  Else If Campo = 'BOL_CODIGO' Then
    Tabel := 'BOLETO_CONF'
  Else If Campo = 'BON_CODIGO' Then
    Tabel := 'BONUS_CONF'
  Else If Campo = 'BXT_CODIGO' Then
    Tabel := 'BAIXA_TITULO_CONF'
  Else If Campo = 'CAX_CODIGO' Then
    Tabel := 'CAIXA_CONF'
  Else If Campo = 'CBN_CODIGO' Then
    Tabel := 'CONTA_BANCARIA_CONF'
  Else If Campo = 'CCC_CODIGO' Then
    Tabel := 'CONTA_CORRENTE_DO_CC_CONF'
  Else If Campo = 'CCT_CODIGO' Then
    Tabel := 'CONTA_CONTABIL_CONF'
  Else If Campo = 'CCX_CODIGO' Then
    Tabel := 'CONTA_DE_CAIXA_CONF'
  Else If Campo = 'CDB_CODIGO' Then
    Tabel := 'CODIGO_DE_BARRAS_CONF'
  Else If Campo = 'CDE_CODIGO' Then
    Tabel := 'ENVIA_DADOS_EMBARQUE_CONF'
  Else If Campo = 'CDN_CODIGO' Then
    Tabel := 'ENVIA_DADOS_NOTA_CONF'
  Else If Campo = 'CEC_CODIGO' Then
    Tabel := 'CONTROLE_ENVIO_CPD_CONF'
  Else If Campo = 'CEF_CODIGO' Then
    Tabel := 'CONTROLE_ENVIO_FILIAL_CONF'
  Else If Campo = 'COM_CODIGO' Then
    Tabel := 'COMUNICACAO_CONF'
  Else If Campo = 'CEP_CODIGO' Then
    Tabel := 'CEP_CONF'
  Else If Campo = 'CHQ_CODIGO' Then
    Tabel := 'CHEQUE_CONF'
  Else If Campo = 'CLF_CODIGO' Then
    Tabel := 'CLASSIFICACAO_FISCAL_CONF'
  Else If Campo = 'CLI_CODIGO' Then
    Tabel := 'CLIENTE_CONF'
  Else If Campo = 'CMP_CODIGO' Then
    Tabel := 'COMPRA_CONF'
  Else If Campo = 'CNT_CODIGO' Then
    Tabel := 'CONTATO_CONF'
  Else If Campo = 'CNC_CODIGO' Then
    Tabel := 'CENTRO_DE_CUSTO_CONF'
  Else If Campo = 'CPC_CODIGO' Then
    Tabel := 'COBRANCA_POR_COBRADOR_CONF'
  Else If Campo = 'COT_CODIGO' Then
    Tabel := 'COTA_CONF'
  Else If Campo = 'CRC_CODIGO' Then
    Tabel := 'CONTROLE_RECEBIMENTO_CPD_CONF'
  Else If Campo = 'CRF_CODIGO' Then
    Tabel := 'CONTROLE_RECEBIMENTO_FILIAL_CONF'
  Else If Campo = 'CTP_CODIGO' Then
    Tabel := 'CATEGORIA_DE_PRODUTO_CONF'
  Else If Campo = 'CUS_CODIGO' Then
    Tabel := 'CUSTO_CONF'
  Else If Campo = 'CVT_CODIGO' Then
    Tabel := 'CONTROLE_DE_VITRINE_CONF'
  Else If Campo = 'DEV_CODIGO' Then
    Tabel := 'DEVOLUCAO_CONF'
  Else If Campo = 'DES_CODIGO' Then
    Tabel := 'DESCONTOS_CONF'
  Else If Campo = 'DIB_CODIGO' Then
    Tabel := 'DIREITO_DE_BONUS_CONF'
  Else If Campo = 'DPS_CODIGO' Then
    Tabel := 'DETALHE_DE_PEDIDO_DE_SERVICO_CONF'
  Else If Campo = 'EMB_CODIGO' Then
    Tabel := 'EMBARQUE_CONF'
  Else If Campo = 'EMP_CODIGO' Then
    Tabel := 'EMPRESTIMO_CONF'
  Else If Campo = 'ENF_CODIGO' Then
    Tabel := 'ENVIA_FORNECEDOR_CONF'
  Else If Campo = 'FAF_CODIGO' Then
    Tabel := 'FATOR_DE_FINANCEIRA_CONF'
  Else If Campo = 'FPG_CODIGO' Then
    Tabel := 'FORMA_DE_PAGAMENTO_CONF'
  Else If Campo = 'FOR_CODIGO' Then
    Tabel := 'FORNECEDOR_CONF'
  Else If Campo = 'FPE_CODIGO' Then
    Tabel := 'FATURAMENTO_PENDENTE_CONF'
  Else If Campo = 'FCT_CODIGO' Then
    Tabel := 'FACTORING_CONF'
  Else If Campo = 'FUN_CODIGO' Then
    Tabel := 'FUNCIONARIO_CONF'
  Else If Campo = 'GRP_CODIGO' Then
    Tabel := 'GRUPO_CONF'
  Else If Campo = 'GRA_CODIGO' Then
    Tabel := 'GRAU_CONF'
  Else If Campo = 'IDE_CODIGO' Then
    Tabel := 'INDEXADOR_ECONOMICO_CONF'
  Else If Campo = 'INV_CODIGO' Then
    Tabel := 'INVENTARIO_CONF'
  Else If Campo = 'INS_CODIGO' Then
    Tabel := 'INSUMO_CONF'
  Else If Campo = 'IBN_CODIGO' Then
    Tabel := 'ITEM_DE_BONUS_CONF'
  Else If Campo = 'ICA_CODIGO' Then
    Tabel := 'ITEM_DE_COTA_CONF'
  Else If Campo = 'IED_CODIGO' Then
    Tabel := 'ITEM_DE_ESTOQUE_DETALHE_CONF'
  Else If Campo = 'ICT_CODIGO' Then
    Tabel := 'ITEM_DE_MAPA_DE_COTACAO_CONF'
  Else If Campo = 'IEB_CODIGO' Then
    Tabel := 'ITEM_DE_EMBARQUE_CONF'
  Else If Campo = 'IFC_CODIGO' Then
    Tabel := 'ITEM_DE_FACTORING_CONF'
  Else If Campo = 'IIV_CODIGO' Then
    Tabel := 'ITEM_DE_INVENTARIO_CONF'
  Else If Campo = 'IMF_CODIGO' Then
    Tabel := 'ITEM_DE_MANUFATURADO_CONF'
  Else If Campo = 'INF_CODIGO' Then
    Tabel := 'ITEM_DE_NOTA_FISCAL_CONF'
  Else If Campo = 'IPV_CODIGO' Then
    Tabel := 'ITEM_DE_PEDIDO_DE_VENDA_CONF'
  Else If Campo = 'IPC_CODIGO' Then
    Tabel := 'ITEM_DE_PEDIDO_DE_COMPRA_CONF'
  Else If Campo = 'IPR_CODIGO' Then
    Tabel := 'ITEM_DE_PRE_RECEBIMENTO_CONF'
  Else If Campo = 'IRC_CODIGO' Then
    Tabel := 'ITEM_DE_RECEBIMENTO_CONF'
  Else If Campo = 'ITP_CODIGO' Then
    Tabel := 'ITEM_DE_TABELA_DE_PRECO_CONF'
  Else If Campo = 'ITS_CODIGO' Then
    Tabel := 'ITEM_DE_TABELA_DE_PRECO_SUBGRUPO_CONF'
  Else If Campo = 'ITR_CODIGO' Then
    Tabel := 'ITEM_DE_TRANSFERENCIA_CONF'
  Else If Campo = 'ITO_CODIGO' Then
    Tabel := 'ITEM_DE_TROCA_CONF'
  Else If Campo = 'LMG_CODIGO' Then
    Tabel := 'LIMITE_GASTO_CONF'
  Else If Campo = 'LOG_CODIGO' Then
    Tabel := 'LOG_CONF'
  Else If Campo = 'LSP_CODIGO' Then
    Tabel := 'LISTA_DE_PRESENTE_CONF'
  Else If Campo = 'LOT_CODIGO' Then
    Tabel := 'LOTE_CONF'
  Else If Campo = 'ILP_CODIGO' Then
    Tabel := 'ITEM_DE_LISTA_DE_PRESENTE_CONF'
  Else If Campo = 'MCC_CODIGO' Then
    Tabel := 'MOVIMENTO_CONTA_CORRENTE_CONF'
  Else If Campo = 'MCT_CODIGO' Then
    Tabel := 'MAPA_DE_COTACAO_CONF'
  Else If Campo = 'MFA_CODIGO' Then
    Tabel := 'MANUFATURADO_CONF'
  Else If Campo = 'MSC_CODIGO' Then
    Tabel := 'MENSAGEM_CPD_CONF'
  Else If Campo = 'MSG_CODIGO' Then
    Tabel := 'MENSAGEM_CONF'
  Else If Campo = 'MDL_CODIGO' Then
    Tabel := 'MODULO_CONF'
  Else If Campo = 'MCR_CODIGO' Then
    Tabel := 'MOVIMENTO_DE_CREDITO_CONF'
  Else If Campo = 'MVC_CODIGO' Then
    Tabel := 'MOVIMENTO_DE_CAIXA_CONF'
  Else If Campo = 'MCH_CODIGO' Then
    Tabel := 'MOVIMENTO_DE_CHEQUE_CONF'
  Else If Campo = 'MEC_CODIGO' Then
    Tabel := 'MOVIMENTO_DE_ESTOQUE_COM_CONF'
  Else If Campo = 'MES_CODIGO' Then
    Tabel := 'MOVIMENTO_DE_ESTOQUE_FISC_CONF'
  Else If Campo = 'MEF_CODIGO' Then
    Tabel := 'MOVIMENTO_DE_ESTOQUE_FIS_CONF'
  Else If Campo = 'MEI_CODIGO' Then
    Tabel := 'MOVIMENTO_DE_ESTOQUE_IND_CONF'
  Else If Campo = 'MLC_CODIGO' Then
    Tabel := 'MOVIMENTO_DE_LIVRO_CAIXA_CONF'
  Else If Campo = 'ML4_CODIGO' Then
    Tabel := 'MOVIMENTO_DE_ESTOQUE_LJ4_CONF'
  Else If Campo = 'MSN_CODIGO' Then
    Tabel := 'MOVIMENTO_DE_ESTOQUE_SN_CONF'
  Else If Campo = 'MTV_CODIGO' Then
    Tabel := 'CONTROLE_VEICULO_CONF'
  Else If Campo = 'NTF_CODIGO' Then
    Tabel := 'NOTA_FISCAL_CONF'
  Else If Campo = 'OPS_CODIGO' Then
    Tabel := 'OPERACAO_DO_SISTEMA_CONF'
  Else If Campo = 'ORF_CODIGO' Then
    Tabel := 'ORIGEM_FISCAL_CONF'
  Else If Campo = 'PAR_CODIGO' Then
    Tabel := 'PARAMETRO_CONF'
  Else If Campo = 'PEN_CODIGO' Then
    Tabel := 'PENDENCIA_CONF'
  Else If Campo = 'PEC_CODIGO' Then
    Tabel := 'PENDENCIA_CPD_CONF'
  Else If Campo = 'PCR_CODIGO' Then
    Tabel := 'PACOTE_DE_CREDITO_CONF'
  Else If Campo = 'PCP_CODIGO' Then
    Tabel := 'PEDIDO_DE_COMPRA_CONF'
  Else If Campo = 'PDV_CODIGO' Then
    Tabel := 'PEDIDO_DE_VENDA_CONF'
  Else If Campo = 'PDS_CODIGO' Then
    Tabel := 'PEDIDO_DE_SERVICO_CONF'
  Else If Campo = 'ISP_CODIGO' Then
    Tabel := 'ITEM_DE_SERVICO_PRODUTO_CONF'
  Else If Campo = 'ISS_CODIGO' Then
    Tabel := 'ITEM_DE_SERVICO_SERVICO_CONF'
  Else If Campo = 'PRM_CODIGO' Then
    Tabel := 'PERMISSAO_CONF'
  Else If Campo = 'PRC_CODIGO' Then
    Tabel := 'PRE_RECEBIMENTO_CONF'
  Else If Campo = 'PRF_CODIGO' Then
    Tabel := 'PROFISSAO_CONF'
  Else If Campo = 'PRD_CODIGO' Then
    Tabel := 'PRODUTO_CONF'
  Else If Campo = 'PPF_CODIGO' Then
  Begin
    Tabel := 'PRODUTO_POR_FORNECEDOR_CONF';
    Campo:='PRD_CODIGO';
  End
  Else If Campo = 'QNV_CODIGO' Then
    Tabel := 'QUANTIDADE_NORMAL_VENDA_CONF'
  Else If Campo = 'REC_CODIGO' Then
    Tabel := 'RECEBIMENTO_CONF'
  Else If Campo = 'RET_CODIGO' Then
    Tabel := 'RECEITA_CONF'
  Else If Campo = 'RCB_CODIGO' Then
    Tabel := 'RECIBO_CONF'
  Else If Campo = 'RBE_CODIGO' Then
    Tabel := 'REGISTRO_DE_BAIXA_EXTERNA_CONF'
  Else If Campo = 'RBO_CODIGO' Then
    Tabel := 'REGISTRO_BOLETO_CONF'
  Else If Campo = 'RDL_CODIGO' Then
    Tabel := 'REGISTRO_DELETADO_CONF'
  Else If Campo = 'RGP_CODIGO' Then
    Tabel := 'REGISTRO_DE_PROCURA_CONF'
  Else If Campo = 'REL_CODIGO' Then
    Tabel := 'RELATORIO_CONF'
  Else If Campo = 'REP_CODIGO' Then
    Tabel := 'REPOSICAO_CONF'
  Else If Campo = 'REX_CODIGO' Then
    Tabel := 'RESERVA_EXTERNA_CONF'
  Else If Campo = 'SEC_CODIGO' Then
    Tabel := 'SECAO_CONF'
  Else If Campo = 'SER_CODIGO' Then
    Tabel := 'SERVICO_CONF'
  Else If Campo = 'SGR_CODIGO' Then
    Tabel := 'SOLICITACAO_DE_GARANTIA_CONF'
  Else If Campo = 'SPR_CODIGO' Then
    Tabel := 'SOLICIT_DE_PECAS_DE_REP_CONF'
  Else If Campo = 'SGP_CODIGO' Then
    Tabel := 'SUBGRUPO_CONF'
  Else If Campo = 'SML_CODIGO' Then
    Tabel := 'SUBMODULO_CONF'
  Else If Campo = 'SCF_CODIGO' Then
    Tabel := 'SUB_CLASS_FISCAL_CONF'
  Else If Campo = 'TBC_CODIGO' Then
    Tabel := 'TABELA_DE_PRECO_CLIENTE_CONF'
  Else If Campo = 'TBP_CODIGO' Then
    Tabel := 'TABELA_DE_PRECO_CONF'
  Else If Campo = 'TPS_CODIGO' Then
    Tabel := 'TABELA_DE_PRECO_SUBGRUPO_CONF'
  Else If Campo = 'TAR_CODIGO' Then
    Tabel := 'TAREFA_CONF'
  Else If Campo = 'TPR_CODIGO' Then
    Tabel := 'TIPO_DE_PAREMETRO_CONF'
  Else If Campo = 'TPG_CODIGO' Then
    Tabel := 'TITULO_A_PAGAR_CONF'
  Else If Campo = 'TRC_CODIGO' Then
    Tabel := 'TITULO_A_RECEBER_CONF'
  Else If Campo = 'TRF_CODIGO' Then
    Tabel := 'TRANSFERENCIA_CONF'
  Else If Campo = 'TRD_CODIGO' Then
    Tabel := 'TRANSFERENCIA_DE_DADOS_CONF'
  Else If Campo = 'TRN_CODIGO' Then
    Tabel := 'TRANSPORTADORA_CONF'
  Else If Campo = 'TRO_CODIGO' Then
    Tabel := 'TROCA_CONF'
  Else If Campo = 'TRT_CODIGO' Then
    Tabel := 'TRCTEMP_CONF'
  Else If Campo = 'USU_CODIGO' Then
    Tabel := 'USUARIO_CONF'
  Else If Campo = 'VEI_CODIGO' Then
    Tabel := 'VEICULO_CONF'
  Else If Campo = 'ICC_CODIGO' Then
    Tabel := 'ITEM_DE_COBRANCA_COBRADOR_CONF'
  Else If Campo = 'CSG_CODIGO' Then
    Tabel := 'CONSIGNACAO_CONF'
  Else If Campo = 'ICS_CODIGO' Then
    Tabel := 'ITEM_DE_CONSIGNACAO_CONF'
  Else Tabel := 'CONFIGURACAO';

  try
    ExecutaSQL(QueryComandos,'UPDATE '+Tabel+' SET '+Campo+'='+campo+'+'+IntToStr(Incremento));
  except
    result:=0;
    exit;
  end;

  QueryConsultas.close;
  QueryConsultas.SQL.Text:='SELECT * FROM '+Tabel;
  Try
    QueryConsultas.Open;
    result:=QueryConsultas.FieldByName(Campo).asInteger;
  Except
    result:=0;
  End;
end;


end.
