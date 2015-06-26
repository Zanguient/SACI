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
unit Cliente;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Extctrls, 
     Variants, DateUtils;

type
  TCliente = class(TSQuery)
    private
      { Private fields of TCliente }
        { Storage for property ArquivoDeEtiquetas }
        FArquivoDeEtiquetas : String;
        { Storage for property Bairro }
        FBairro : String;
        { Storage for property CEP }
        FCEP : String;
        { Storage for property CGFRG }
        FCGFRG : String;
        { Storage for property CLogradouro }
        FCLogradouro : Integer;
        { Storage for property CPFCGC }
        FCPFCGC : String;
        { Storage for property CRota }
        FCRota : Integer;
        { Storage for property Celular }
        FCelular : String;
        { Storage for property Cidade }
        FCidade : String;
        { Storage for property Classificacao }
        FClassificacao : Integer;
        { Storage for property CodigoCLI }
        FCodigoCLI : Integer;
        { Storage for property Conjuge }
        FConjuge : String;
        { Storage for property Convenio }
        FConvenio : Integer;
        { Storage for property ConvenioCNC }
        FConvenioCNC : Integer;
        { Storage for property Credito }
        FCredito : Double;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : Tdatetime;
        { Storage for property DataNascimento }
        FDataNascimento : Tdatetime;
        { Storage for property Desconto }
        FDesconto : Double;
        { Storage for property DescontoPrazo }
        FDescontoPrazo : Double;
        { Storage for property EBairro }
        FEBairro : TEdit;
        { Storage for property ECGFRG }
        FECGFRG : TEdit;
        { Storage for property ECPFCGC }
        FECPFCGC : TMaskEdit;
        { Storage for property ECelular }
        FECelular : TMaskEdit;
        { Storage for property ECep }
        FECep : TMaskEdit;
        { Storage for property ECidade }
        FECidade : TEdit;
        { Storage for property EClassificacao }
        FEClassificacao : TDBLookupComboBox;
        { Storage for property ECodigoCNC }
        FECodigoCNC : TDBLookUpComboBox;
        { Storage for property ECodigoCli }
        FECodigoCli : TEdit;
        { Storage for property EConjuge }
        FEConjuge : TEdit;
        { Storage for property EConsultas }
        FEConsultas : TSQuery;
        { Storage for property EConvenio }
        FEConvenio : TEdit;
        { Storage for property EConvenioCNC }
        FEConvenioCNC : TEdit;
        { Storage for property ECred }
        FECred : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataNascimento }
        FEDataNascimento : TMaskEdit;
        { Storage for property EDesconto }
        FEDesconto : TEdit;
        { Storage for property EDescontoPrazo }
        FEDescontoPrazo : TEdit;
        { Storage for property EEMail }
        FEEMail : TEdit;
        { Storage for property EEndereco }
        FEEndereco : TEdit;
        { Storage for property EFax }
        FEFax : TMaskEdit;
        { Storage for property EFone }
        FEFone : TMaskEdit;
        { Storage for property EFoto }
        FEFoto : TImage;
        { Storage for property EIdentificacao }
        FEIdentificacao : TEdit;
        { Storage for property ELocalTrabalho }
        FELocalTrabalho : TEdit;
        { Storage for property ELogradouro }
        FELogradouro : TDBLookupComboBox;
        { Storage for property EMae }
        FEMae : TEdit;
        { Storage for property EMail }
        FEMail : String;
        { Storage for property EMensal }
        FEMensal : TCheckBox;
        { Storage for property ENomeFantasia }
        FENomeFantasia : TEdit;
        { Storage for property ENota }
        FENota : TCheckBox;
        { Storage for property EOBS }
        FEOBS : TMemo;
        { Storage for property EOrgao }
        FEOrgao : TComboBox;
        { Storage for property EPai }
        FEPai : TEdit;
        { Storage for property EPessoaFisica }
        FEPessoaFisica : TCheckBox;
        { Storage for property EConsignatario }
        FEConsignatario : TCheckBox;
        { Storage for property EProfissao }
        FEProfissao : TEdit;
        { Storage for property EQuinzenal }
        FEQuinzenal : TCheckBox;
        { Storage for property ERazaoSocial }
        FERazaoSocial : TEdit;
        { Storage for property EReferencia1 }
        FEReferencia1 : TEdit;
        { Storage for property EReferencia2 }
        FEReferencia2 : TEdit;
        { Storage for property EReferencia3 }
        FEReferencia3 : TEdit;
        { Storage for property ESite }
        FESite : TEdit;
        { Storage for property ESituacao }
        FESituacao : TCombobox;
        { Storage for property ETipo }
        FETipo : TDBLookupComboBox;
        { Storage for property EUF }
        FEUF : TComboBox;
        { Storage for property EVendaAtacado }
        FEVendaAtacado : TCheckBox;
        { Storage for property Endereco }
        FEndereco : String;
        { Storage for property Fax }
        FFax : String;
        { Storage for property Fone }
        FFone : String;
        { Storage for property Identificacao }
        FIdentificacao : String;
        { Storage for property LocalTrabalho }
        FLocalTrabalho : String;
        { Storage for property Logradouro }
        FLogradouro : Integer;
        { Storage for property Mae }
        FMae : String;
        { Storage for property Mensal }
        FMensal : Boolean;
        { Storage for property NomeFantasia }
        FNomeFantasia : String;
        { Storage for property Nota }
        FNota : Boolean;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Orgao }
        FOrgao : Integer;
        { Storage for property Pai }
        FPai : String;
        { Storage for property PessoaFisica }
        FPessoaFisica : Boolean;
        { Storage for property Consignatario }
        FConsignatario : Boolean;
        { Storage for property Profissao }
        FProfissao : String;
        { Storage for property Quinzenal }
        FQuinzenal : Boolean;
        { Storage for property RazaoSocial }
        FRazaoSocial : String;
        { Storage for property Referencia1 }
        FReferencia1 : String;
        { Storage for property Referencia2 }
        FReferencia2 : String;
        { Storage for property Referencia3 }
        FReferencia3 : String;
        { Storage for property SPC }
        FSPC : Integer;
        { Storage for property Site }
        FSite : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property Uf }
        FUf : String;
        { Storage for property VendaAtacado }
        FVendaAtacado : Boolean;

      { Private methods of TCliente }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Bairro }
        function GetBairro : String;
        { Write method for property Bairro }
        procedure SetBairro(Value : String);
        { Read method for property CEP }
        function GetCEP : String;
        { Write method for property CEP }
        procedure SetCEP(Value : String);
        { Read method for property CGFRG }
        function GetCGFRG : String;
        { Write method for property CGFRG }
        procedure SetCGFRG(Value : String);
        { Read method for property CPFCGC }
        function GetCPFCGC : String;
        { Write method for property CPFCGC }
        procedure SetCPFCGC(Value : String);
        { Read method for property Celular }
        function GetCelular : String;
        { Write method for property Celular }
        procedure SetCelular(Value : String);
        { Read method for property Cidade }
        function GetCidade : String;
        { Write method for property Cidade }
        procedure SetCidade(Value : String);
        { Read method for property Classificacao }
        function GetClassificacao : Integer;
        { Write method for property Classificacao }
        procedure SetClassificacao(Value : Integer);
        { Read method for property CodigoCLI }
        function GetCodigoCLI : Integer;
        { Write method for property CodigoCLI }
        procedure SetCodigoCLI(Value : Integer);
        { Read method for property Conjuge }
        function GetConjuge : String;
        { Write method for property Conjuge }
        procedure SetConjuge(Value : String);
        { Read method for property Convenio }
        function GetConvenio : Integer;
        { Write method for property Convenio }
        procedure SetConvenio(Value : Integer);
        { Read method for property ConvenioCNC }
        function GetConvenioCNC : Integer;
        { Write method for property ConvenioCNC }
        procedure SetConvenioCNC(Value : Integer);
        { Read method for property Credito }
        function GetCredito : Double;
        { Write method for property Credito }
        procedure SetCredito(Value : Double);
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Write method for property DataAlterado }
        procedure SetDataAlterado(Value : TDateTime);
        { Read method for property DataCadastro }
        function GetDataCadastro : Tdatetime;
        { Write method for property DataCadastro }
        procedure SetDataCadastro(Value : Tdatetime);
        { Read method for property DataNascimento }
        function GetDataNascimento : Tdatetime;
        { Write method for property DataNascimento }
        procedure SetDataNascimento(Value : Tdatetime);
        { Read method for property Desconto }
        function GetDesconto : Double;
        { Write method for property Desconto }
        procedure SetDesconto(Value : Double);
        { Read method for property DescontoPrazo }
        function GetDescontoPrazo : Double;
        { Write method for property DescontoPrazo }
        procedure SetDescontoPrazo(Value : Double);
        { Read method for property EMail }
        function GetEMail : String;
        { Write method for property EMail }
        procedure SetEMail(Value : String);
        { Read method for property Endereco }
        function GetEndereco : String;
        { Write method for property Endereco }
        procedure SetEndereco(Value : String);
        { Read method for property Fax }
        function GetFax : String;
        { Write method for property Fax }
        procedure SetFax(Value : String);
        { Read method for property Fone }
        function GetFone : String;
        { Write method for property Fone }
        procedure SetFone(Value : String);
        { Read method for property Identificacao }
        function GetIdentificacao : String;
        { Write method for property Identificacao }
        procedure SetIdentificacao(Value : String);
        { Read method for property LocalTrabalho }
        function GetLocalTrabalho : String;
        { Write method for property LocalTrabalho }
        procedure SetLocalTrabalho(Value : String);
        { Read method for property Logradouro }
        function GetLogradouro : Integer;
        { Write method for property Logradouro }
        procedure SetLogradouro(Value : Integer);
        { Read method for property Mae }
        function GetMae : String;
        { Write method for property Mae }
        procedure SetMae(Value : String);
        { Read method for property Mensal }
        function GetMensal : Boolean;
        { Write method for property Mensal }
        procedure SetMensal(Value : Boolean);
        { Read method for property NomeFantasia }
        function GetNomeFantasia : String;
        { Write method for property NomeFantasia }
        procedure SetNomeFantasia(Value : String);
        { Read method for property Nota }
        function GetNota : Boolean;
        { Write method for property Nota }
        procedure SetNota(Value : Boolean);
        { Read method for property OBS }
        function GetOBS : String;
        { Write method for property OBS }
        procedure SetOBS(Value : String);
        { Read method for property Pai }
        function GetPai : String;
        { Write method for property Pai }
        procedure SetPai(Value : String);
        { Read method for property PessoaFisica }
        function GetPessoaFisica : Boolean;
        { Read method for property Consignatario }
        function GetConsignatario : Boolean;
        { Write method for property PessoaFisica }
        procedure SetPessoaFisica(Value : Boolean);
        { Write method for property Consignatario }
        procedure SetConsignatario(Value : Boolean);
        { Read method for property Profissao }
        function GetProfissao : String;
        { Write method for property Profissao }
        procedure SetProfissao(Value : String);
        { Read method for property Quinzenal }
        function GetQuinzenal : Boolean;
        { Write method for property Quinzenal }
        procedure SetQuinzenal(Value : Boolean);
        { Read method for property RazaoSocial }
        function GetRazaoSocial : String;
        { Write method for property RazaoSocial }
        procedure SetRazaoSocial(Value : String);
        { Read method for property Referencia1 }
        function GetReferencia1 : String;
        { Write method for property Referencia1 }
        procedure SetReferencia1(Value : String);
        { Read method for property Referencia2 }
        function GetReferencia2 : String;
        { Write method for property Referencia2 }
        procedure SetReferencia2(Value : String);
        { Read method for property Referencia3 }
        function GetReferencia3 : String;
        { Write method for property Referencia3 }
        procedure SetReferencia3(Value : String);
        { Read method for property SPC }
        function GetSPC : Integer;
        { Write method for property SPC }
        procedure SetSPC(Value : Integer);
        { Read method for property Site }
        function GetSite : String;
        { Write method for property Site }
        procedure SetSite(Value : String);
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Write method for property Situacao }
        procedure SetSituacao(Value : Integer);
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Write method for property Tipo }
        procedure SetTipo(Value : Integer);
        { Read method for property Uf }
        function GetUf : String;
        { Write method for property Uf }
        procedure SetUf(Value : String);
        { Read method for property VendaAtacado }
        function GetVendaAtacado : Boolean;
        { Write method for property VendaAtacado }
        procedure SetVendaAtacado(Value : Boolean);

    protected
      { Protected fields of TCliente }
        FEtiquetas : TextFile;

      { Protected methods of TCliente }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TCliente }

      { Public methods of TCliente }
        procedure AdicionarEtiqueta(CdCLI,PConvenio:integer;PRazaoSocial,PApelido,PFone,PFax,PCelular,PEMail,PEndereco,PBairro,PCidade,PUF,PCEP,PRG,PCPF,POBS:string;Ad:String='';PAspas:Boolean=False);
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar, LiberarTudo:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdCLI:Integer):Boolean;
        destructor Destroy; override;
        procedure FechaEtiquetas;
        function FinalizaEdicao:Boolean;
        { Insere um Cliente }
        function Inserir(CdCNC,CdCLI,PSit,PLog: integer;CdPesFis,CdConsignatario,CdAtac:Boolean; DT_NASC:TDateTime;RZ_SOCIAL,NOME_FAN,CGC_CPF,CGF_RG,PEndereco,PBairro,PCidade,PUF,PCEP,PFone,PFax,PCelular,PPai,PMae,PConj,PLocal,PProf,PSite,PEMail,POBS:String;PCred:double=0):Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        procedure LimpaEtiquetas(CampoAdicional:String='CampoAdicional');
        function LocalizarCNPJCPF(PCNPJCPF:String; CdCLI,CdCNC:Integer):Boolean;
        { Localiza um cliente }
        function LocalizarCod(CdCli,CdCNC:Integer):Boolean;
        function LocalizarNome(Nome:String):Boolean;
        procedure PreparaAlteracao(LiberarTudo: Boolean);
        procedure PreparaInsercao(LiberarTudo: Boolean);
        function deletarauto:Boolean;

    published
      { Published properties of TCliente }
        property ArquivoDeEtiquetas : String
             read FArquivoDeEtiquetas write FArquivoDeEtiquetas;
        property Bairro : String read GetBairro write SetBairro;
        property CEP : String read GetCEP write SetCEP;
        property CGFRG : String read GetCGFRG write SetCGFRG;
        property CLogradouro : Integer read FCLogradouro write FCLogradouro;
        property CPFCGC : String read GetCPFCGC write SetCPFCGC;
        property CRota : Integer read FCRota write FCRota;
        property Celular : String read GetCelular write SetCelular;
        property Cidade : String read GetCidade write SetCidade;
        property Classificacao : Integer
             read GetClassificacao write SetClassificacao;
        { Código do Cliente }
        property CodigoCLI : Integer read GetCodigoCLI write SetCodigoCLI;
        property Conjuge : String read GetConjuge write SetConjuge;
        property Convenio : Integer read GetConvenio write SetConvenio;
        property ConvenioCNC : Integer
             read GetConvenioCNC write SetConvenioCNC;
        property Credito : Double read GetCredito write SetCredito;
        property DataAlterado : TDateTime
             read GetDataAlterado write SetDataAlterado;
        property DataCadastro : Tdatetime
             read GetDataCadastro write SetDataCadastro;
        property DataNascimento : Tdatetime
             read GetDataNascimento write SetDataNascimento;
        property Desconto : Double read GetDesconto write SetDesconto;
        property DescontoPrazo : Double
             read GetDescontoPrazo write SetDescontoPrazo;
        property EBairro : TEdit read FEBairro write FEBairro;
        property ECGFRG : TEdit read FECGFRG write FECGFRG;
        property ECPFCGC : TMaskEdit read FECPFCGC write FECPFCGC;
        property ECelular : TMaskEdit read FECelular write FECelular;
        property ECep : TMaskEdit read FECep write FECep;
        property ECidade : TEdit read FECidade write FECidade;
        property EClassificacao : TDBLookupComboBox
             read FEClassificacao write FEClassificacao;
        property ECodigoCNC : TDBLookUpComboBox
             read FECodigoCNC write FECodigoCNC;
        property ECodigoCli : TEdit read FECodigoCli write FECodigoCli;
        property EConjuge : TEdit read FEConjuge write FEConjuge;
        property EConsultas : TSQuery read FEConsultas write FEConsultas;
        property EConvenio : TEdit read FEConvenio write FEConvenio;
        property EConvenioCNC : TEdit read FEConvenioCNC write FEConvenioCNC;
        property ECred : TEdit read FECred write FECred;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataNascimento : TMaskEdit
             read FEDataNascimento write FEDataNascimento;
        property EDesconto : TEdit read FEDesconto write FEDesconto;
        property EDescontoPrazo : TEdit
             read FEDescontoPrazo write FEDescontoPrazo;
        property EEMail : TEdit read FEEMail write FEEMail;
        property EEndereco : TEdit read FEEndereco write FEEndereco;
        property EFax : TMaskEdit read FEFax write FEFax;
        property EFone : TMaskEdit read FEFone write FEFone;
        property EFoto : TImage read FEFoto write FEFoto;
        property EIdentificacao : TEdit
             read FEIdentificacao write FEIdentificacao;
        property ELocalTrabalho : TEdit
             read FELocalTrabalho write FELocalTrabalho;
        property ELogradouro : TDBLookupComboBox
             read FELogradouro write FELogradouro;
        property EMae : TEdit read FEMae write FEMae;
        property EMail : String read GetEMail write SetEMail;
        property EMensal : TCheckBox read FEMensal write FEMensal;
        property ENomeFantasia : TEdit
             read FENomeFantasia write FENomeFantasia;
        property ENota : TCheckBox read FENota write FENota;
        property EOBS : TMemo read FEOBS write FEOBS;
        property EOrgao : TComboBox read FEOrgao write FEOrgao;
        property EPai : TEdit read FEPai write FEPai;
        property EPessoaFisica : TCheckBox
             read FEPessoaFisica write FEPessoaFisica;
        property EConsignatario : TCheckBox
             read FEConsignatario write FEConsignatario;
        property EProfissao : TEdit read FEProfissao write FEProfissao;
        property EQuinzenal : TCheckBox read FEQuinzenal write FEQuinzenal;
        property ERazaoSocial : TEdit read FERazaoSocial write FERazaoSocial;
        property EReferencia1 : TEdit read FEReferencia1 write FEReferencia1;
        property EReferencia2 : TEdit read FEReferencia2 write FEReferencia2;
        property EReferencia3 : TEdit read FEReferencia3 write FEReferencia3;
        property ESite : TEdit read FESite write FESite;
        property ESituacao : TCombobox read FESituacao write FESituacao;
        property ETipo : TDBLookupComboBox read FETipo write FETipo;
        property EUF : TComboBox read FEUF write FEUF;
        property EVendaAtacado : TCheckBox
             read FEVendaAtacado write FEVendaAtacado;
        property Endereco : String read GetEndereco write SetEndereco;
        property Fax : String read GetFax write SetFax;
        property Fone : String read GetFone write SetFone;
        property Identificacao : String
             read GetIdentificacao write SetIdentificacao;
        property LocalTrabalho : String
             read GetLocalTrabalho write SetLocalTrabalho;
        property Logradouro : Integer read GetLogradouro write SetLogradouro;
        property Mae : String read GetMae write SetMae;
        property Mensal : Boolean read GetMensal write SetMensal;
        property NomeFantasia : String
             read GetNomeFantasia write SetNomeFantasia;
        property Nota : Boolean read GetNota write SetNota;
        property OBS : String read GetOBS write SetOBS;
        property Orgao : Integer read FOrgao write FOrgao;
        property Pai : String read GetPai write SetPai;
        property PessoaFisica : Boolean
             read GetPessoaFisica write SetPessoaFisica;
        property Consignatario : Boolean
             read GetConsignatario write SetConsignatario;
        property Profissao : String read GetProfissao write SetProfissao;
        property Quinzenal : Boolean read GetQuinzenal write SetQuinzenal;
        property RazaoSocial : String read GetRazaoSocial write SetRazaoSocial;
        property Referencia1 : String read GetReferencia1 write SetReferencia1;
        property Referencia2 : String read GetReferencia2 write SetReferencia2;
        property Referencia3 : String read GetReferencia3 write SetReferencia3;
        property SPC : Integer read GetSPC write SetSPC;
        property Site : String read GetSite write SetSite;
        property Situacao : Integer read GetSituacao write SetSituacao;
        property Tipo : Integer read GetTipo write SetTipo;
        property Uf : String read GetUf write SetUf;
        property VendaAtacado : Boolean
             read GetVendaAtacado write SetVendaAtacado
             default False;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TCliente with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TCliente]);
end;

{ Method to set variable and property values and create objects }
procedure TCliente.AutoInitialize;
begin
     FEBairro := nil;
     FECGFRG := nil;
     FECPFCGC := nil;
     FECelular := nil;
     FECep := nil;
     FECidade := nil;
     FEClassificacao := nil;
     FECodigoCNC := nil;
     FECodigoCli := nil;
     FEConjuge := nil;
     FEConvenio := nil;
     FEConvenioCNC := nil;
     FECred := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataNascimento := nil;
     FEDesconto := nil;
     FEDescontoPrazo := nil;
     FEEMail := nil;
     FEEndereco := nil;
     FEFax := nil;
     FEFone := nil;
     FEFoto := nil;
     FEIdentificacao := nil;
     FELocalTrabalho := nil;
     FELogradouro := nil;
     FEMae := nil;
     FEMensal := nil;
     FENomeFantasia := nil;
     FENota := nil;
     FEOBS := nil;
     FEOrgao := nil;
     FEPai := nil;
     FEPessoaFisica := nil;
     FEConsignatario := nil;
     FEProfissao := nil;
     FEQuinzenal := nil;
     FERazaoSocial := nil;
     FEReferencia1 := nil;
     FEReferencia2 := nil;
     FEReferencia3 := nil;
     FESite := nil;
     FESituacao := nil;
     FETipo := nil;
     FEUF := nil;
     FEVendaAtacado := nil;
     FVendaAtacado := False;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TCliente.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEBairro then
        FEBairro := nil;
     if AComponent = FECGFRG then
        FECGFRG := nil;
     if AComponent = FECPFCGC then
        FECPFCGC := nil;
     if AComponent = FECelular then
        FECelular := nil;
     if AComponent = FECep then
        FECep := nil;
     if AComponent = FECidade then
        FECidade := nil;
     if AComponent = FEClassificacao then
        FEClassificacao := nil;
     if AComponent = FECodigoCNC then
        FECodigoCNC := nil;
     if AComponent = FECodigoCli then
        FECodigoCli := nil;
     if AComponent = FEConjuge then
        FEConjuge := nil;
     if AComponent = FEConvenio then
        FEConvenio := nil;
     if AComponent = FEConvenioCNC then
        FEConvenioCNC := nil;
     if AComponent = FECred then
        FECred := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataNascimento then
        FEDataNascimento := nil;
     if AComponent = FEDesconto then
        FEDesconto := nil;
     if AComponent = FEDescontoPrazo then
        FEDescontoPrazo := nil;
     if AComponent = FEEMail then
        FEEMail := nil;
     if AComponent = FEEndereco then
        FEEndereco := nil;
     if AComponent = FEFax then
        FEFax := nil;
     if AComponent = FEFone then
        FEFone := nil;
     if AComponent = FEFoto then
        FEFoto := nil;
     if AComponent = FEIdentificacao then
        FEIdentificacao := nil;
     if AComponent = FELocalTrabalho then
        FELocalTrabalho := nil;
     if AComponent = FELogradouro then
        FELogradouro := nil;
     if AComponent = FEMae then
        FEMae := nil;
     if AComponent = FEMensal then
        FEMensal := nil;
     if AComponent = FENomeFantasia then
        FENomeFantasia := nil;
     if AComponent = FENota then
        FENota := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEOrgao then
        FEOrgao := nil;
     if AComponent = FEPai then
        FEPai := nil;
     if AComponent = FEPessoaFisica then
        FEPessoaFisica := nil;
     if AComponent = FEConsignatario then
        FEConsignatario := nil;
     if AComponent = FEProfissao then
        FEProfissao := nil;
     if AComponent = FEQuinzenal then
        FEQuinzenal := nil;
     if AComponent = FERazaoSocial then
        FERazaoSocial := nil;
     if AComponent = FEReferencia1 then
        FEReferencia1 := nil;
     if AComponent = FEReferencia2 then
        FEReferencia2 := nil;
     if AComponent = FEReferencia3 then
        FEReferencia3 := nil;
     if AComponent = FESite then
        FESite := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipo then
        FETipo := nil;
     if AComponent = FEUF then
        FEUF := nil;
     if AComponent = FEVendaAtacado then
        FEVendaAtacado := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TCliente.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Bairro }
function TCliente.GetBairro : String;
begin
  try
    Result := Self.fieldByName('CLI_BAIRRO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Bairro }
procedure TCliente.SetBairro(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_BAIRRO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_BAIRRO"!');
  end;
end;

{ Read method for property CEP }
function TCliente.GetCEP : String;
begin
  try
    Result := Self.fieldByName('CLI_CEP').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CEP }
procedure TCliente.SetCEP(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_CEP').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_CEP"!');
  end;
end;

{ Read method for property CGFRG }
function TCliente.GetCGFRG : String;
begin
  try
    Result := Self.fieldByName('CLI_CGF_RG').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CGFRG }
procedure TCliente.SetCGFRG(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CGF_RG').asString := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CGF_RG"!');
    end;
end;

{ Read method for property CPFCGC }
function TCliente.GetCPFCGC : String;
begin
  try
    Result := Self.fieldByName('CLI_CGC_CPF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property CPFCGC }
procedure TCliente.SetCPFCGC(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_CGC_CPF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_CPF_CGC"!');
  end;
end;

{ Read method for property Celular }
function TCliente.GetCelular : String;
begin
  try
    Result := Self.fieldByName('CLI_CELULAR').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Celular }
procedure TCliente.SetCelular(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_CELULAR').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_CELULAR"!');
  end;
end;

{ Read method for property Cidade }
function TCliente.GetCidade : String;
begin
  try
    Result := Self.fieldByName('CLI_CIDADE').asString;
  except
    result:= '';
  end;
end;

{ Write method for property Cidade }
procedure TCliente.SetCidade(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_CIDADE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_CIDADE"!');
  end;
end;

{ Read method for property Classificacao }
function TCliente.GetClassificacao : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CLASSIFICACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Classificacao }
procedure TCliente.SetClassificacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_CLASSIFICACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_CLASSIFICACAO"!');
  end;
end;

{ Read method for property CodigoCLI }
function TCliente.GetCodigoCLI : Integer;
begin
  try
    Result := Self.fieldByName('CLI_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property CodigoCLI }
procedure TCliente.SetCodigoCLI(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CODIGO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CODIGO"!');
    end;
end;

{ Read method for property Conjuge }
function TCliente.GetConjuge : String;
begin
  try
    Result := Self.fieldByName('CLI_CONJUGE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Conjuge }
procedure TCliente.SetConjuge(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_CONJUGE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_CONJUGE"!');
  end;
end;

{ Read method for property Convenio }
function TCliente.GetConvenio : Integer;
begin
  //Quando foi igual ao CodigoCLI significa que é a empresa do convênio
  try
    Result := Self.fieldByName('CLI_CONVENIO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Convenio }
procedure TCliente.SetConvenio(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CONVENIO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CONVENIO"!');
    end;
end;

{ Read method for property ConvenioCNC }
function TCliente.GetConvenioCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_CONVENIO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property ConvenioCNC }
procedure TCliente.SetConvenioCNC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CNC_CONVENIO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CNC_CONVENIO"!');
    end;
end;

{ Read method for property Credito }
function TCliente.GetCredito : Double;
begin
  try
    Result := Self.fieldByName('CLI_CREDITO').asFloat;
  except
    result:= 0
  end;
end;

{ Write method for property Credito }
procedure TCliente.SetCredito(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_CREDITO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CREDITO"!');
    end;
end;

{ Read method for property DataAlterado }
function TCliente.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('CLI_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataAlterado }
procedure TCliente.SetDataAlterado(Value : TDateTime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_DT_ALTERADO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_DT_ALTERADO"!');
  end;
end;

{ Read method for property DataCadastro }
function TCliente.GetDataCadastro : Tdatetime;
begin
  try
    Result := Self.fieldByName('CLI_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataCadastro }
procedure TCliente.SetDataCadastro(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_DT_CADASTRO').asDatetime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_DT_CADASTRO"!');
  end;
end;

{ Read method for property DataNascimento }
function TCliente.GetDataNascimento : Tdatetime;
begin
  try
    Result := Self.fieldByName('CLI_DATA_NASC').asDateTime;
  except
    Result := 0;
  end;
end;

{ Write method for property DataNascimento }
procedure TCliente.SetDataNascimento(Value : Tdatetime);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_DATA_NASC').asDateTime := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_DATA_NASC"!');
  end;
end;

{ Read method for property Desconto }
function TCliente.GetDesconto : Double;
begin
  try
    Result := Self.fieldByName('CLI_DESCONTO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property Desconto }
procedure TCliente.SetDesconto(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_DESCONTO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_DESCONTO"!');
    end;
end;

{ Read method for property DescontoPrazo }
function TCliente.GetDescontoPrazo : Double;
begin
  try
    Result := Self.fieldByName('CLI_DESCONTO_PRAZO').asFloat;
  except
    result:= 0;
  end;
end;

{ Write method for property DescontoPrazo }
procedure TCliente.SetDescontoPrazo(Value : Double);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_DESCONTO_PRAZO').asFloat := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_DESCONTO_PRAZO"!');
    end;
end;

{ Read method for property EMail }
function TCliente.GetEMail : String;
begin
  try
    Result := Self.fieldByName('CLI_EMAIL').asString;
  except
    result:= ''
  end;
end;

{ Write method for property EMail }
procedure TCliente.SetEMail(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_EMAIL').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_EMAIL"!');
  end;
end;

{ Read method for property Endereco }
function TCliente.GetEndereco : String;
begin
  try
    Result := Self.fieldByName('CLI_ENDERECO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Endereco }
procedure TCliente.SetEndereco(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_ENDERECO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_ENDERECO"!');
  end;
end;

{ Read method for property Fax }
function TCliente.GetFax : String;
begin
  try
    Result := Self.fieldByName('CLI_FAX').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fax }
procedure TCliente.SetFax(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_FAX').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_FAX"!');
  end;
end;

{ Read method for property Fone }
function TCliente.GetFone : String;
begin
  try
    Result := Self.fieldByName('CLI_FONE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Fone }
procedure TCliente.SetFone(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_FONE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_FONE"!');
  end;
end;

{ Read method for property Identificacao }
function TCliente.GetIdentificacao : String;
begin
  try
    Result := Self.fieldByName('CLI_IDENTIFICACAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Identificacao }
procedure TCliente.SetIdentificacao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_IDENTIFICACAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_IDENTIFICACAO"!');
  end;
end;

{ Read method for property LocalTrabalho }
function TCliente.GetLocalTrabalho : String;
begin
  try
    Result := Self.fieldByName('CLI_LOCALTRABALHO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property LocalTrabalho }
procedure TCliente.SetLocalTrabalho(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_LOCALTRABALHO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_LOCALTRABALHO"!');
  end;
end;

{ Read method for property Logradouro }
function TCliente.GetLogradouro : Integer;
begin
  try
    Result := Self.fieldByName('CLI_LOGRADOURO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Logradouro }
procedure TCliente.SetLogradouro(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      Self.fieldByName('CLI_LOGRADOURO').asInteger := Value;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_LOGRADOURO"!');
    end;
end;

{ Read method for property Mae }
function TCliente.GetMae : String;
begin
  try
    Result := Self.fieldByName('CLI_MAE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Mae }
procedure TCliente.SetMae(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_MAE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_MAE"!');
  end;
end;

{ Read method for property Mensal }
function TCliente.GetMensal : Boolean;
begin
  try
    result := (Self.fieldByName('CLI_MENSAL').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Mensal }
procedure TCliente.SetMensal(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('CLI_MENSAL').asInteger := 1
      else
        Self.fieldByName('CLI_MENSAL').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_MENSAL"!');
    end;
end;

{ Read method for property NomeFantasia }
function TCliente.GetNomeFantasia : String;
begin
  try
    Result := Self.fieldByName('CLI_NOME_FAN').asString;
  except
    result:= ''
  end;
end;

{ Write method for property NomeFantasia }
procedure TCliente.SetNomeFantasia(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_NOME_FAN').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_NOME_FAN"!');
  end;
end;

{ Read method for property Nota }
function TCliente.GetNota : Boolean;
begin
  try
    result := (Self.fieldByName('CLI_NOTA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Nota }
procedure TCliente.SetNota(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('CLI_NOTA').asInteger := 1
      else
        Self.fieldByName('CLI_NOTA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_NOTA"!');
    end;
end;

{ Read method for property OBS }
function TCliente.GetOBS : String;
begin
  try
    Result := Self.fieldByName('CLI_OBS1').asString;
  except
    result:= ''
  end;
end;

{ Write method for property OBS }
procedure TCliente.SetOBS(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_OBS1').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_OBS1"!');
  end;
end;

{ Read method for property Pai }
function TCliente.GetPai : String;
begin
  try
    Result := Self.fieldByName('CLI_PAI').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Pai }
procedure TCliente.SetPai(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_PAI').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_PAI"!');
  end;
end;

{ Read method for property PessoaFisica }
function TCliente.GetPessoaFisica : Boolean;
begin
  try
    result := (Self.fieldByName('CLI_PESSOA_FISICA').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property PessoaFisica }
procedure TCliente.SetPessoaFisica(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('CLI_PESSOA_FISICA').asInteger := 1
      else
        Self.fieldByName('CLI_PESSOA_FISICA').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_PESSOA_FISICA"!');
    end;
end;

{ Read method for property Profissao }
function TCliente.GetProfissao : String;
begin
  try
    Result := Self.fieldByName('CLI_PROFISSAO').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Profissao }
procedure TCliente.SetProfissao(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_PROFISSAO').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_PROFISSAO"!');
  end;
end;

{ Read method for property Quinzenal }
function TCliente.GetQuinzenal : Boolean;
begin
  try
    result := (Self.fieldByName('CLI_QUINZENAL').asInteger=1);
  except
    result := False;
  end;
end;

{ Write method for property Quinzenal }
procedure TCliente.SetQuinzenal(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('CLI_QUINZENAL').asInteger := 1
      else
        Self.fieldByName('CLI_QUINZENAL').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_QUINZENAL"!');
    end;
end;

{ Read method for property RazaoSocial }
function TCliente.GetRazaoSocial : String;
begin
  try
    Result := Self.fieldByName('CLI_RZ_SOCIAL').asString;
  except
    result:= ''
  end;
end;

{ Write method for property RazaoSocial }
procedure TCliente.SetRazaoSocial(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_RZ_SOCIAL').asString := UpperCase(Value);
  except
    ShowMessage('Não foi possível alterar o campo "CLI_RZ_SOCIAL"!');
  end;
end;

{ Read method for property Referencia1 }
function TCliente.GetReferencia1 : String;
begin
  try
    Result := Self.fieldByName('CLI_REFERENCIA1').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Referencia1 }
procedure TCliente.SetReferencia1(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_REFERENCIA1').asString := UpperCase(Value);
  except
    ShowMessage('Não foi possível alterar o campo "CLI_REFERENCIA1"!');
  end;
end;

{ Read method for property Referencia2 }
function TCliente.GetReferencia2 : String;
begin
  try
    Result := Self.fieldByName('CLI_REFERENCIA2').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Referencia2 }
procedure TCliente.SetReferencia2(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_REFERENCIA2').asString := UpperCase(Value);
  except
    ShowMessage('Não foi possível alterar o campo "CLI_REFERENCIA2"!');
  end;
end;

{ Read method for property Referencia3 }
function TCliente.GetReferencia3 : String;
begin
  try
    Result := Self.fieldByName('CLI_REFERENCIA3').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Referencia3 }
procedure TCliente.SetReferencia3(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_REFERENCIA3').asString := UpperCase(Value);
  except
    ShowMessage('Não foi possível alterar o campo "CLI_REFERENCIA3"!');
  end;
end;

{ Read method for property SPC }
function TCliente.GetSPC : Integer;
begin
  try
    Result := Self.fieldByName('CLI_SPC').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property SPC }
procedure TCliente.SetSPC(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_SPC').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_SPC"!');
  end;
end;

{ Read method for property Site }
function TCliente.GetSite : String;
begin
  try
    Result := Self.fieldByName('CLI_SITE').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Site }
procedure TCliente.SetSite(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_SITE').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_SITE"!');
  end;
end;

{ Read method for property Situacao }
function TCliente.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('CLI_SITUACAO').asInteger;
  except
    result:= 0
  end;
end;

{ Write method for property Situacao }
procedure TCliente.SetSituacao(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_SITUACAO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_SITUACAO"!');
  end;
end;

{ Read method for property Tipo }
function TCliente.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('CLI_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Write method for property Tipo }
procedure TCliente.SetTipo(Value : Integer);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_TIPO').asInteger := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_TIPO"!');
  end;
end;

{ Read method for property Uf }
function TCliente.GetUf : String;
begin
  try
    Result := Self.fieldByName('CLI_UF').asString;
  except
    result:= ''
  end;
end;

{ Write method for property Uf }
procedure TCliente.SetUf(Value : String);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
  try
    Self.fieldByName('CLI_UF').asString := Value;
  except
    ShowMessage('Não foi possível alterar o campo "CLI_UF"!');
  end;
end;

{ Read method for property VendaAtacado }
function TCliente.GetVendaAtacado : Boolean;
begin
  try
    result := (Self.fieldByName('CLI_VENDA_ATACADO').asInteger=1);
  except
    try
      result := Self.fieldByName('CLI_VENDA_ATACADO').asBoolean;
    except
      result := False;
    end;
  end;
end;

{ Write method for property VendaAtacado }
procedure TCliente.SetVendaAtacado(Value : Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value=True then
        Self.fieldByName('CLI_VENDA_ATACADO').asInteger := 1
      else
        Self.fieldByName('CLI_VENDA_ATACADO').asInteger := 0;
    except
      try
        Self.fieldByName('CLI_VENDA_ATACADO').asBoolean := Value
      except
        ShowMessage('Não foi possível alterar o campo "CLI_VENDA_ATACADO"!');
      end;
    end;
end;

procedure TCliente.AdicionarEtiqueta(CdCLI,PConvenio:integer;PRazaoSocial,PApelido,PFone,PFax,PCelular,PEMail,PEndereco,PBairro,PCidade,PUF,PCEP,PRG,PCPF,POBS:string;Ad:String='';PAspas:Boolean=False);
var
  Linha,sAspas: String;
begin
  sAspas := '';
  if PAspas then
    sAspas := '"';
  //
  Linha:=sAspas+PreencheE(IntToStr(CdCLI), '0', 6)+sAspas+';'+sAspas+
    IntToStr(PConvenio)+sAspas+';'+sAspas+
    RetiraAspas(PRazaoSocial)+sAspas+';'+sAspas+
    RetiraAspas(PApelido)+sAspas+';'+sAspas+
    RetiraAspas(PFone)+sAspas+';'+sAspas+
    RetiraAspas(PFax)+sAspas+';'+sAspas+
    RetiraAspas(PCelular)+sAspas+';'+sAspas+
    RetiraAspas(PEMail)+sAspas+';'+sAspas+
    RetiraAspas(PEndereco)+sAspas+';'+sAspas+
    RetiraAspas(PBairro)+sAspas+';'+sAspas+
    RetiraAspas(PCidade)+sAspas+';'+sAspas+
    RetiraAspas(PUF)+sAspas+';'+sAspas+
    RetiraAspas(PCEP)+sAspas+';'+sAspas+
    RetiraAspas(PRG)+sAspas+';'+sAspas+
    RetiraAspas(PCPF)+sAspas+';'+sAspas+
    RetiraAspas(POBS)+sAspas+';'+sAspas+
    RetiraAspas(Ad)+sAspas;
  Writeln(FEtiquetas, linha);
end;

function TCliente.AlterarAuto:Boolean;
var
  CdCNC, CdCLI: integer;
  sCodigoUSU, sDataAlterado, sDataNascimento, sPessoaFisica, sConsignatario,
    sOrgao, sVendaAtacado, sLogradouro, sDesconto, sDescontoPrazo, sSituacao,
    sQuinzenal, sMensal, sNota, sClassificacao, sTipo, sConvenioCNC, sConvenio: string;
begin
  Result := False;

  CdCNC := CodigoCNC;
  CdCLI := CodigoCLI;

  if LocalizarCNPJCPF(ECPFCGC.Text,CodigoCLI,CodigoCNC) then
  Begin
    ShowMessage('CNPJ/CPF já cadastrado!');
    Exit;
  end;
  Try
    sCodigoUSU    := IntToStr(CConfiguracao.CodigoUSU);
  except
    sCOdigoUSU    := '-1';
  end;
  Try
    sDataAlterado := '"'+MesDiaHora(CConfiguracao.DataHora)+'" ';
  except
    sDataAlterado := 'NULL';
  end;
  Try
    if EPessoaFisica.checked then
      sPessoaFisica  := '1'
    else
      sPessoaFisica  := '0';
  except
    sPessoaFisica  := '0';
  end;

  Try
    if EConsignatario.checked then
      sConsignatario  := '1'
    else
      sConsignatario  := '0';
  except
    sConsignatario  := '0';
  end;

  Try
    if EVendaAtacado.checked then
      sVendaAtacado := '1'
    else
      sVendaAtacado := '0';
  except
    sVendaAtacado := '0';
  end;
  Try
    if EQuinzenal.checked then
      sQuinzenal  := '1'
    else
      sQuinzenal  := '0';
  except
    sQuinzenal  := '0';
  end;
  Try
    if EMensal.checked then
      sMensal  := '1'
    else
      sMensal  := '0';
  except
    sMensal  := '0';
  end;
  Try
    if ENota.checked then
      sNota  := '1'
    else
      sNota  := '0';
  except
    sNota  := '0';
  end;
  try
    sDataNascimento := '"'+MesDia(StrToDateTime(EDataNascimento.Text))+'" ';
  except
    sDataNascimento := 'NULL';
  end;
  try
    sOrgao  := IntToStr(EOrgao.ItemIndex);
  except
    sOrgao  := '0';
  end;
  try
    sLogradouro  := IntToStr(ELogradouro.KeyValue);
  except
    sLogradouro  := '0';
  end;
  try
    sSituacao := IntToStr(ESITUACAO.Itemindex);
  except
    sSituacao := '0';
  end;
  try
    sDesconto      := VirgPonto(StrToFloat(EDesconto.Text));
  except
    sDesconto      := '0';
  end;
  try
    sDescontoPrazo      := VirgPonto(StrToFloat(EDescontoPrazo.Text));
  except
    sDescontoPrazo      := '0';
  end;
  try
    sClassificacao := IntToStr(EClassificacao.KeyValue);
  except
    sClassificacao := '0';
  end;
  try
    sTipo := IntToStr(ETipo.KeyValue);
  except
    sTipo := '0';
  end;
  try
    sConvenioCNC := ',CNC_CONVENIO='+IntToStr(StrToInt(EConvenioCNC.Text));
  except
    sConvenioCNC := '';
  end;
  try
    sConvenio := ',CLI_CONVENIO='+IntToStr(StrToInt(EConvenio.Text));
  except
    sConvenio := '';
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE CLIENTE SET '+
      ' CLI_DT_ALTERADO='+sDataAlterado+
      ',USU_CODIGO='+sCodigoUSU+
      ',CLI_DATA_NASC='+sDataNascimento+
      ',CLI_PESSOA_FISICA='+sPessoaFisica+
      ',CLI_CONSIGNATARIO='+sConsignatario+
      ',CLI_QUINZENAL='+sQuinzenal+
      ',CLI_MENSAL='+sMensal+
      ',CLI_NOTA='+sNota+
      ',CLI_RZ_SOCIAL="'+ERazaoSocial.Text+'" '+
      ',CLI_NOME_FAN="'+ENomeFantasia.Text+'" '+
      ',CLI_IDENTIFICACAO="'+EIdentificacao.Text+'" '+
      ',CLI_CGC_CPF="'+ECPFCGC.Text+'" '+
      ',CLI_CGF_RG="'+ECGFRG.Text+'" '+
      ',CLI_LOGRADOURO='+sLogradouro+
      ',CLI_ENDERECO="'+EEndereco.Text+'" '+
      ',CLI_BAIRRO="'+EBairro.Text+'" '+
      ',CLI_CIDADE="'+ECidade.Text+'" '+
      ',CLI_UF="'+EUF.Text+'" '+
      ',CLI_CEP="'+ECEP.text+'" '+
      ',CLI_FONE="'+EFONE.Text+'" '+
      ',CLI_FAX="'+EFax.Text+'" '+
      ',CLI_CELULAR="'+ECelular.Text+'" '+
      ',CLI_PAI="'+EPai.Text+'" '+
      ',CLI_MAE="'+EMae.Text+'" '+
      ',CLI_CONJUGE="'+EConjuge.Text+'" '+
      ',CLI_SITE="'+ESite.Text+'" '+
      ',CLI_PROFISSAO="'+EProfissao.Text+'" '+
      ',CLI_EMAIL="'+EEMail.Text+'" '+
      ',CLI_REFERENCIA1="'+EReferencia1.Text+'" '+
      ',CLI_REFERENCIA2="'+EReferencia2.Text+'" '+
      ',CLI_REFERENCIA3="'+EReferencia3.Text+'" '+
      ',CLI_SITUACAO='+sSituacao+
      ',CLI_LOCALTRABALHO="'+ELocalTrabalho.Text+'" '+
      ',CLI_ORGAO='+sOrgao+
      ',CLI_VENDA_ATACADO='+sVendaAtacado+
      ',CLI_DESCONTO='+sDesconto+
      ',CLI_DESCONTO_PRAZO='+sDescontoPrazo+
      ',CLI_CLASSIFICACAO='+sClassificacao+
      ',CLI_TIPO='+sTipo+
      sConvenioCNC+
      sConvenio+
      ',CLI_OBS1="'+EOBS.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND CLI_CODIGO='+IntToStr(CdCLI));

    GeraLog(40,CdCNC,CdCLI,'Nome:'+ERazaoSocial.Text+' End:'+EEndereco.Text+
      ' Fones:'+EFone.Text+'/'+EFax.Text+'/'+ECelular.Text+
      ' CPF:'+ECPFCGC.Text+
      ' Classificacao:'+sClassificacao+
      ' Atacado:'+sVendaAtacado+
      ' Conv:'+EConvenioCNC.Text+'-'+EConvenio.Text);
    Result:=True;
  except
    ShowMessage('Não foi possível alterar o registro corrente.');
  end;
end;

procedure TCliente.AtualizaControles(Habilitar, LiberarTudo:Boolean);
begin
  Try
    EDbgrid.Enabled           :=not Habilitar;
  except
  end;
  Try
    ECodigoCNC.Enabled        :=not Habilitar;
  except
  end;
  Try
    EFONE.Enabled             :=Habilitar;
  Except
  End;
  Try
    EFax.Enabled              :=Habilitar;
  Except
  End;
  Try
    ECelular.Enabled          :=Habilitar;
  Except
  End;
  Try
    EProfissao.Enabled        :=Habilitar;
  Except
  end;
  Try
    ESite.Enabled             :=Habilitar;
  Except
  End;
  Try
    EEMail.Enabled             :=Habilitar;
  Except
  End;
  Try
    EPai.Enabled             :=Habilitar;
  Except
  End;
  Try
    EMae.Enabled             :=Habilitar;
  Except
  End;
  Try
    ELocalTrabalho.Enabled       :=Habilitar;
  Except
  End;
  Try
    EConjuge.Enabled             :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EReferencia1.Enabled       := Habilitar;
  Except
  End;
  Try
    EReferencia2.Enabled       := Habilitar;
  Except
  End;
  Try
    EReferencia3.Enabled       := Habilitar;
  Except
  End;
  Try
    EPessoaFisica.Enabled     :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EConsignatario.Enabled     :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EVendaAtacado.Enabled     :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EQuinzenal.Enabled        :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EMensal.Enabled        :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    ENota.Enabled        :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    ECred.Enabled     :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EDataNascimento.Enabled   :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    ERazaoSocial.Enabled      :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    ENomeFantasia.Enabled     :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EIdentificacao.Enabled     :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    ECPFCGC.Enabled           :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    ECGFRG.Enabled            :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    ELogradouro.Enabled       :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EEndereco.Enabled         :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EBairro.Enabled           :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    ECidade.Enabled           :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EUF.Enabled               :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    ECEP.Enabled              :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EDesconto.Enabled       := Habilitar and LiberarTudo;
  Except
  End;
  Try
    EDescontoPrazo.Enabled       := Habilitar and LiberarTudo;
  Except
  End;
  Try
    EClassificacao.Enabled  := Habilitar and LiberarTudo;
  Except
  End;
  Try
    ETipo.Enabled           := Habilitar and LiberarTudo;
  Except
  End;
  Try
    EConvenio.Enabled       := Habilitar and LiberarTudo;
  Except
  End;
  Try
    ESITUACAO.Enabled       :=Habilitar and LiberarTudo;
  Except
  End;
  Try
    EOBS.Enabled            :=Habilitar and LiberarTudo;
  Except
  End;
end;

procedure TCliente.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False, False);
  if not isEmpty then
    CarregaDados
  else
    LimpaCampos;
end;

procedure TCliente.CarregaDados;
var
  foto:string;
begin
  Try
    ECodigoCli.Text           := IntToStr(CodigoCli);
  Except
  End;
  Try
    EPessoaFisica.checked     := PessoaFisica;
  Except
  End;
  Try
    EConsignatario.checked     := Consignatario;
  Except
  End;
  Try
    EVendaAtacado.checked     := VendaAtacado;
  Except
  End;
  Try
    EQuinzenal.checked        := Quinzenal;
  Except
  End;
  Try
    EMensal.checked           := Mensal;
  Except
  End;
  Try
    ENota.checked             := Nota;
  Except
  End;
  Try
    ECred.text                := FloatToStr(Credito);
  Except
  End;
  Try
    if DataCadastro > 0 then
      EDataCadastro.Text        := FormatDateTime('dd/mm/yyyy hh:mm', DataCadastro)
    else
      EDataCadastro.Text        := '';
  Except
  End;
  Try
    if DataAlterado > 0 then
      EDataAlterado.Text        := FormatDateTime('dd/mm/yyyy hh:mm', DataAlterado)
    else
      EDataAlterado.Text        := '';
  Except
  End;
  Try
    if DataNascimento=0 then
      EDataNascimento.Text      := ''
    else
    Begin
      if YearOf(DataNascimento) = 1900 then
        EDataNascimento.Text      := FormatDateTime('dd/mm/', DataNascimento)
      else
        EDataNascimento.Text      := FormatDateTime('dd/mm/yyyy', DataNascimento);
    end;
  Except
  End;
  Try
    ERazaoSocial.Text           := RazaoSocial;
  Except
  End;
  Try
    ENomeFantasia.Text           := NomeFantasia;
  Except
  End;
  Try
    EIdentificacao.Text          := Identificacao;
  Except
  End;
  Try
    If PessoaFisica then
       ECPFCGC.Editmask := '999-999-999-99;0;_'
    Else
       ECPFCGC.Editmask := '99-999-999/9999-99;0;_';
    ECPFCGC.Text                 := CPFCGC;
  Except
  End;
  Try
    ECGFRG.Text                  := CGFRG;
  Except
  End;
  try
     EOrgao.ItemIndex            := Orgao;
  except
  end;
  Try
    ELogradouro.KeyValue         := Logradouro;
  Except
  End;
  Try
    EEndereco.Text               := Endereco;
  Except
  End;
  Try
    EBairro.Text                 := Bairro;
  Except
  End;
  Try
    ECidade.Text                 := Cidade;
  Except
  End;
  Try
    ECEP.text                    := CEP;
  Except
  End;
  Try
    ItemComboBox(EUF,UF);
  Except
  End;
  Try
    EFone.Text                   := Fone;
  Except
  End;
  Try
    EFax.Text                    := Fax;
  Except
  End;
  Try
    ECelular.Text                := Celular;
  Except
  End;
  Try
    EProfissao.Text              := Profissao;
  Except
  end;
  Try
    ESite.Text                   := Site;
  Except
  End;
  Try
    EEMail.Text                  := EMail;
  Except
  End;
  Try
    EPai.Text                    := Pai;
  Except
  End;
  Try
    EMae.Text                    := Mae;
  Except
  End;
  Try
    EConjuge.Text                := IntToStr(StrToInt(Conjuge));
  Except
    try
      EConjuge.Text              := Conjuge;
    except
    end;
  End;
  Try
    ELocalTrabalho.Text          := LocalTrabalho;
  Except
  End;
  Try
    EDesconto.Text               := format('%.2f',[Desconto]);
  Except
  End;
  Try
    EDescontoPrazo.Text               := format('%.2f',[DescontoPrazo]);
  Except
  End;
  Try
    EReferencia1.Text            := Referencia1;
  Except
  End;
  Try
    EReferencia2.Text            := Referencia2;
  Except
  End;
  Try
    EReferencia3.Text            := Referencia3;
  Except
  End;
  Try
    EClassificacao.KeyValue      := Classificacao;
  Except
  End;
  Try
    ETipo.KeyValue               := Tipo;
  Except
  End;
  Try
    EConvenioCNC.Text            := IntToStr(ConvenioCNC);
  Except
  End;
  Try
    EConvenio.Text               := IntToStr(Convenio);
  Except
  End;
  Try
    ESITUACAO.itemindex          := Situacao;
  Except
  End;
  Try
    EOBS.Text                    := Obs;
  Except
  End;
  try
    if CConfiguracao.CodigoCNC < 10 then
      foto:=CConfiguracao.PastaImagens+'\Cliente\0'+IntToStr(CConfiguracao.CodigoCNC)+
         '-'+IntToStr(CodigoCLI)+'.JPG'
    else
      foto:=CConfiguracao.PastaImagens+'\Cliente\'+IntToStr(CConfiguracao.CodigoCNC)+
         '-'+IntToStr(CodigoCLI)+'.JPG';
    Efoto.Picture.LoadFromFile(foto);
  Except
    try
      EFoto.Picture:=nil;
    except
    end;
  end;
end;

constructor TCliente.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'CLIENTE';

     { Code to perform other tasks when the component is created }

end;

function TCliente.Deletar(CdCNC,CdCLI:Integer):Boolean;
var
  sDetalhes: string;
begin
  Result := False;
  If not(localizarCod(CdCLI,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      sDetalhes := 'RZ:'+RazaoSocial+' End:'+Endereco+' CPF:'+CPFCGC;
      if Delete then
      Begin
        Result := True;
        GeraLog(30,CdCNC,CdCLI,sDetalhes(*OBS*));
        RegistrarDel(CdCNC,1250(*Cliente*),CdCLI,sDetalhes);
        if TQuery(Self).IsEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TCliente.Destroy;
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

procedure TCliente.FechaEtiquetas;
begin
  CloseFile(FEtiquetas);
end;

function TCliente.FinalizaEdicao:Boolean;
var
  mensagem:String;
  aux:TDataSetNotifyEvent;
begin
  Result:=False;
  mensagem:='';
  try
    ESite.Text := RetiraAspas(ESite.Text);
  except
  end;
  try
    EEMail.Text := RetiraAspas(EEMail.Text);
  except
  end;
  if (not VerificaInteiroBranco(EConvenioCNC.Text)) or
     (EConvenioCNC.Text = '0') then
    EConvenioCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  if not VerificaInteiroBranco(EConvenio.Text) then
    EConvenio.Text := '0';
  if ERazaoSocial.Text = '' then
    mensagem := mensagem + 'Razão Social inválida!'+#13
  else if Pos(' ', Trim(ERazaoSocial.Text)) <= 0 then
    mensagem := mensagem + 'Mínimo de Duas Palavras para Razão Social!'+#13;
  if Pos('"',ERazaoSocial.Text) > 0 then
    mensagem := mensagem + 'Existem aspas duplas no nome do cliente!'+#13;
  if Pos('"',EEndereco.Text) > 0 then
    mensagem := mensagem + 'Existem aspas duplas no Endereco do cliente!'+#13;
  if Pos('"',EBairro.Text) > 0 then
    mensagem := mensagem + 'Existem aspas duplas no Bairro do cliente!'+#13;
  if Pos('"',ECidade.Text) > 0 then
    mensagem := mensagem + 'Existem aspas duplas no Cidade do cliente!'+#13;
  if Pos('"',EObs.Text) > 0 then
    mensagem := mensagem + 'Existem aspas duplas no Observação do cliente!'+#13;
  if not VerificaCPFCNPJ(ECPFCGC.Text) then
    mensagem := mensagem + 'CPF/CNPJ inválido'+#13;
  if not VerificaInteiro(ECGFRG.Text) then
    if (upperCase(ECGFRG.Text[1]) <> 'P') or
       (not VerificaInteiro(Copy(ECGFRG.Text,2,Length(ECGFRG.Text)-1))) then
      mensagem := mensagem + 'CGF/RG inválido'+#13;
  if (ECodigoCLI.Text <> IntToStr(CConfiguracao.CodigoCliAVista)) then
  Begin
    if (not EPessoaFisica.Checked) and
       (ECGFRG.Text <> '') and
       (not VerificaCGFBranco(ECGFRG.Text,EUF.Text)) then
      Exit;  //A menssagem será exibida pela função
    if (CConfiguracao.Empresa <> empHOPE) then
    Begin
      if (not VerificaCPFCNPJBranco(ECPFCGC.Text)) and
         (EVendaAtacado.Checked) then
        mensagem := mensagem +'CPF/CNPJ inválido!'+#13;
    end;
    if (CConfiguracao.Empresa <> empLBM) or
       (ECPFCGC.Text <> '') then
    Begin
      if Trim(EEndereco.Text) = '' then
        mensagem := mensagem + 'Endereço inválido!'+#13;
      if Trim(EBairro.Text) = '' then
        mensagem := mensagem + 'Bairro inválido!'+#13;
      if Trim(ECidade.Text) = '' then
        mensagem := mensagem + 'Cidade inválida!'+#13;
    end;
    if (CConfiguracao.Empresa = empLuciano) and
       (Trim(EClassificacao.Text) = '') then
      mensagem := mensagem + 'Classificação do Cliente inválido!'+#13;
    if (CConfiguracao.Empresa <> empLuciano) and
       (Trim(EFone.Text) = '') then
      mensagem := mensagem + 'Telefone inválido!'+#13;
  end;
  if EDataNascimento<>nil then
  Begin
    Try
      if Length(Trim(EDataNascimento.Text)) = 6 then //Dia e Mês
        EDataNascimento.Text := EDataNascimento.Text + '1900';
      If not Verificadata(EDataNascimento.text) Then
        mensagem:=mensagem+'Data de nascimento inválida!'+#13;
      if CConfiguracao.Empresa = empLuciano then
      Begin
        If not VerificaDataBranco(EDataNascimento.text) Then
          mensagem:=mensagem+'Data de nascimento inválida!'+#13;
      end;
    Except
    End;
  end;

  if StrToInt(EConvenio.Text) > 0 then
  Begin
    with CConfiguracao.QueryConsultas do
    Begin
      Close;
      SQL.Text := 'SELECT CLI_CODIGO '+
        ' FROM CLIENTE '+
        ' WHERE CNC_CODIGO='+EConvenioCNC.Text+
        ' AND CLI_CODIGO='+EConvenio.Text+
        ' AND CLI_CODIGO<>'+ECodigoCLI.Text;
      Open;
      if isEmpty then
        mensagem:=mensagem+'Código do convênio inválido!'+#13;
    end;
  end;

  If mensagem <>'' Then
  Begin
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
        Estado:=0;
        AtualizaControles(False, False);
        Result:=True;
      end;
    End
    Else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        Estado:=0;
        AtualizaControles(False, False);
        Result:=True;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

{ Insere um Cliente }
function TCliente.Inserir(CdCNC,CdCLI,PSit,PLog: integer;CdPesFis,CdConsignatario,CdAtac:Boolean; DT_NASC:TDateTime;RZ_SOCIAL,NOME_FAN,CGC_CPF,CGF_RG,PEndereco,PBairro,PCidade,PUF,PCEP,PFone,PFax,PCelular,PPai,PMae,PConj,PLocal,PProf,PSite,PEMail,POBS:String;PCred:double=0):Boolean;
Var
  Cod:Integer;
begin
  result:=false;
  if CdCLI=0 then
    Cod    := ProximoCodigo('CLI_CODIGO')
  else
    Cod    := CdCLI;
  If (localizarCod(Cod,CdCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  else
  begin
    try
      INSERT;
      CodigoCLI      := Cod;
      CodigoCNC      := CdCNC;
      CodigoUSU      := CConfiguracao.CodigoUSU;
      Credito        := PCred;
      PessoaFisica   := CDPesFis;
      Consignatario  := CDConsignatario;
      VendaAtacado   := CdAtac;
      Quinzenal      := False;
      DataCadastro   := CConfiguracao.DataHora;
      DataNascimento := DT_NASC;
      RazaoSocial    := RZ_SOCIAL;
      NomeFantasia   := NOME_FAN;
      CPFCGC         := CGC_CPF;
      CGFRG          := CGF_RG;
      Logradouro     := PLog;
      Endereco       := PEndereco;
      Bairro         := PBairro;
      Cidade         := PCidade;
      Uf             := PUF;
      CEP            := PCEP;
      Fone           := PFone;
      Fax            := PFax;
      Celular        := PCelular;
      Profissao      := PProf;
      Site           := PSite;
      EMail          := PEMail;
      Situacao       := PSit;
      Obs            := POBS;
      Pai            := PPai;
      Mae            := PMae;
      Conjuge        := PConj;
      LocalTrabalho  := PLocal;
      try
        Post;

        GeraLog(20,CdCNC,Cod,'Nome:'+RZ_SOCIAL+' End:'+PEndereco+
          ' Fones:'+PFone+'/'+PFax+'/'+PCelular+
          ' CPF:'+CGC_CPF);

        Result := True;
      except
        Cancel;
        ShowMessage('Não foi possível incluir o registro corrente!');
      end;
    except
      ShowMessage('Não foi possível incluir o registro!');
    end;
  end;
end;

function TCliente.InserirAuto:Boolean;
var
  CdCNC, CdCLI: integer;
begin
  Result := False;

  CdCNC := ECodigoCNC.KeyValue;
  CdCLI := sCodigo;

  If (localizarCod(CdCLI,CdCNC)) Then
    ShowMessage('Não foi possível inserir registro corrente pois o registro já existe!')
  Else
  begin
    if LocalizarCNPJCPF(ECPFCGC.Text,CdCLI,CdCNC) then
    Begin
      ShowMessage('CNPJ/CPF já cadastrado!');
      Exit;
    end;
    try
      append;
      try
        CNCOrigem   := CentroDeCusto;
      except
      end;
      try
        codigocnc   := CdCNC;
      except
      end;
      try
        CodigoCli   := CdCLI;
      except
      end;
      try
        CodigoUSU   := CConfiguracao.CodigoUSU;
      except
      end;
      try
        Credito   := 0;
      except
      end;
      Try
        PessoaFisica  := EPessoaFisica.checked;
      except
      end;
      Try
        Consignatario  := EConsignatario.checked;
      except
      end;
      Try
        VendaAtacado  := EVendaAtacado.checked;
      except
      end;
      Try
        Quinzenal     := EQuinzenal.checked;
      except
      end;
      Try
        Mensal        := EMensal.checked;
      except
      end;
      Try
        Nota          := ENota.checked;
      except
      end;
      try
        DataCadastro   := StrToDateTime(EDataCadastro.Text);
      except
      end;
      try
        DataNascimento := StrToDateTime(EDataNascimento.Text);
      except
      end;
      try
         RazaoSocial  := ERazaoSocial.Text;
      except
      end;
      try
         NomeFantasia := ENomeFantasia.Text;
      except
      end;
      try
        Identificacao := EIdentificacao.Text;
      except
      end;
      try
         CPFCGC := ECPFCGC.Text;
      except
      end;
      try
         CGFRG  := ECGFRG.Text;
      except
      end;
      try
         Orgao  := EOrgao.ItemIndex;
      except
      end;
      try
         Logradouro  := ELogradouro.keyValue;
      except
      end;
      try
         Endereco   := EEndereco.Text;
      except
      end;
      try
         Bairro := EBairro.Text;
      except
      end;
      try
         Cidade := ECidade.Text;
      except
      end;
      try
         Uf   := EUF.Text;
      except
      end;
      try
         CEP := ECEP.text;
      except
      end;
      try
         Fone := EFONE.Text;
      except
      end;
      try
         Fax := EFax.Text;
      except
      end;
      try
         Celular := ECelular.Text;
      except
      end;
      try
         Profissao := EProfissao.Text;
      except
      end;
      try
         Site := ESite.Text;
      except
      end;
      try
         EMail := EEMail.Text;
      except
      end;
      try
         Pai := EPai.Text;
      except
      end;
      try
         Mae := EMae.Text;
      except
      end;
      try
         Conjuge := EConjuge.Text;
      except
      end;
      try
         LocalTrabalho := ELocalTrabalho.Text;
      except
      end;
      try
         Desconto      := StrToFloat(EDesconto.Text);
      except
      end;
      try
         DescontoPrazo      := StrToFloat(EDescontoPrazo.Text);
      except
      end;
      try
         Referencia1      := EReferencia1.Text;
      except
      end;
      try
         Referencia2      := EReferencia2.Text;
      except
      end;
      try
         Referencia3      := EReferencia3.Text;
      except
      end;
      try
        Credito           := 0;
      except
      end;
      try
        if EClassificacao.Text <> '' then
          Classificacao     := EClassificacao.KeyValue
        else
          Classificacao     := 0;
      except
      end;
      try
        if ETipo.Text <> '' then
          Tipo     := ETipo.KeyValue
        else
          Tipo     := 0;
      except
      end;
      try
        ConvenioCNC := StrToInt(EConvenioCNC.Text);
      except
      end;
      try
        Convenio := StrToInt(EConvenio.Text);
      except
      end;
      try
        Situacao := ESITUACAO.itemindex;
      except
      end;
      try
        Obs := EOBS.Text;
      except
      end;
      try
        Post;
        GeraLog(20,CdCNC,CdCLI,'Nome:'+ERazaoSocial.Text+' End:'+EEndereco.Text+
          ' Fones:'+EFone.Text+'/'+EFax.Text+'/'+ECelular.Text+
          ' CPF:'+ECPFCGC.Text+
          ' Conv:'+EConvenioCNC.Text+'-'+EConvenio.Text);
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

procedure TCliente.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoCLI.Clear;
  Except
  End;
  Try
    EQuinzenal.Checked := False;
  Except
  End;
  Try
    EMensal.Checked := False;
  Except
  End;
  Try
    ENota.Checked := False;
  Except
  End;
  Try
    ELogradouro.KeyValue := 0;
  Except
  End;
  Try
    ECred.Clear;
  Except
  End;
  Try
    if Estado = 1 then
    Begin
      if CConfiguracao.Empresa = 4 then
        EPessoaFisica.Checked:=False //Jurídica
      else
        EPessoaFisica.Checked:=True;  //Física
    end;
  Except
  End;
  Try
    EConsignatario.Checked:=False
  Except
  End;
  Try
    EVendaAtacado.Checked:=False;
  Except
  End;
  Try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text:=formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  Except
  End;
  try
    EDataAlterado.Clear;
  except
  end;
  Try
    EDataNascimento.Clear;
  Except
  End;
  Try
    ERazaoSocial.Clear;
  Except
  End;
  Try
    ENomeFantasia.Clear;
  Except
  End;
  Try
    EIdentificacao.Clear;
  Except
  End;
  Try
    ECPFCGC.Clear;
  Except
  End;
  Try
    ECGFRG.Clear;
  Except
  End;
  Try
    EOrgao.ItemIndex := -1;
  Except
  End;
  Try
    EEndereco.Clear;
  Except
  End;
  Try
    EBairro.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ECidade.Clear
    else
      ECidade.Text := CConfiguracao.Cidade;
  Except
  End;
  Try
    ECEP.Clear;
  Except
  End;
  Try
    EFONE.Clear;
  Except
  End;
  Try
    EFax.Clear;
  Except
  End;
  Try
    ECelular.Clear;
  Except
  End;
  Try
    EProfissao.Clear;
  Except
  End;
  Try
    ESite.Clear;
  Except
  End;
  Try
    EEMail.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EUF.ItemIndex := -1
    else
      ItemComboBox(EUf,CConfiguracao.UF);
  Except
  End;
  Try
    EPai.Clear;
  Except
  End;
  Try
    EMae.Clear;
  Except
  End;
  Try
    EConjuge.Clear;
  Except
  End;
  Try
    ELocalTrabalho.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      EDesconto.Clear
    else
      EDesconto.Text := '0,00';
  Except
  End;
  Try
    if Estado <> 1 then
      EDescontoPrazo.Clear
    else
      EDescontoPrazo.Text := '0,00';
  Except
  End;
  Try
    EClassificacao.KeyValue := 0;
  Except
  End;
  Try
    ETipo.KeyValue := 0;
  Except
  End;
  Try
    if Estado <> 1 then
      EConvenioCNC.Clear
    else
      EConvenioCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado <> 1 then
      EConvenio.Clear
    else
      EConvenio.Text := '0';
  Except
  End;
  Try
    ESituacao.ItemIndex := 0;
  Except
  End;
  Try
    EOBS.Clear;
  Except
  End;
  Try
    EFoto.Picture:=nil;
  Except
  End;
end;

procedure TCliente.LimpaEtiquetas(CampoAdicional:String='CampoAdicional');
begin
  AssignFile(FEtiquetas, ArquivoDeEtiquetas);
  Rewrite(FEtiquetas);
  Writeln(FEtiquetas, 'codigo;Convenio;razaosocial;Apelido;Fone;Fax;Celular;EMail;endereco;bairro;cidade;uf;cep;RG;CPF;obs;'+CampoAdicional);
end;

function TCliente.LocalizarCNPJCPF(PCNPJCPF:String; CdCLI,CdCNC:Integer):Boolean;
begin
  if (PCNPJCPF <> '') and (PCNPJCPF <> '  -   -   /    -  ') and (PCNPJCPF <> '   -   -   -  ') then
  Begin
    with CConfiguracao.QueryConsultas do
    begin
      close;
      sql.Text:='SELECT * FROM CLIENTE '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND CLI_CGC_CPF = "'+PCNPJCPF+'" '+
        ' AND CLI_CODIGO <> '+IntToStr(CdCLI);
      open;
      if not IsEmpty then
        Result:=True
      else
        Result:=False;
    end;
  end
  else
    Result:=False;
end;

{ Localiza um cliente }
function TCliente.LocalizarCod(CdCli,CdCNC:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  begin
    close;
    sql.Text:='SELECT * FROM CLIENTE '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND CLI_CODIGO='+IntToStr(CdCLI);
    open;
    Result := (not IsEmpty);
  end;
end;

function TCliente.LocalizarNome(Nome:String):Boolean;
     { Internal declarations for method }
     { type }
     { . . . }
     { var }
     { . . . }
begin
  If Nome<>NomeFantasia Then
    If locate('CLI_NOME_FAN',Nome, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TCliente.PreparaAlteracao(LiberarTudo: Boolean);
begin
  Estado:=2;
  AtualizaControles(True, LiberarTudo);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TCliente.PreparaInsercao(LiberarTudo: Boolean);
begin
  ProximoCodigo('CLI_CODIGO');
  Estado:=1;
  AtualizaControles(True, LiberarTudo);
  LimpaCampos;
end;

function TCliente.deletarauto:Boolean;
var
  CdCNC, CdCLI:Integer;
  sDetalhes: string;
begin
  Result:=False;
  try
    CdCNC:=CodigoCNC;
    CdCLI:=CodigoCLI;
    sDetalhes := 'RZ:'+RazaoSocial+' End:'+Endereco+' CPF:'+CPFCGC;
    if Delete then
    Begin
      Result:=True;
      GeraLog(30,CdCNC,CdCLI,sDetalhes(*OBS*));
      RegistrarDel(CdCNC,1250(*Cliente*),CdCLI,sDetalhes);
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


function TCliente.GetConsignatario: Boolean;
begin
  try
    result := (Self.fieldByName('CLI_CONSIGNATARIO').asInteger=1);
  except
    result := False;
  end;
end;

procedure TCliente.SetConsignatario(Value: Boolean);
begin
  if (Self.State=dsEdit) or (Self.State=dsInsert) then
    try
      if Value then
        Self.fieldByName('CLI_CONSIGNATARIO').asInteger := 1
      else
        Self.fieldByName('CLI_CONSIGNATARIO').asInteger := 0;
    except
      ShowMessage('Não foi possível alterar o campo "CLI_CONSIGNATARIO"!');
    end;
end;

end.
