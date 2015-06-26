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
unit Banco_Boleto;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Configuracao, Dbgrids, Extctrls, Dbctrls, Windows, 
     Funcoes;

type
  TBanco_Boleto = class(TSQuery)
    private
      { Private fields of TBanco_Boleto }
        { Storage for property Aceite }
        FAceite : Boolean;
        { Storage for property CodigoBNB }
        FCodigoBNB : Integer;
        { Storage for property CodigoBaixaDevolucao }
        FCodigoBaixaDevolucao : Integer;
        { Storage for property CodigoCarteira }
        FCodigoCarteira : Integer;
        { Storage for property CodigoConvenio }
        FCodigoConvenio : String;
        { Storage for property CodigoDesconto1 }
        FCodigoDesconto1 : Integer;
        { Storage for property CodigoDesconto2 }
        FCodigoDesconto2 : Integer;
        { Storage for property CodigoDesconto3 }
        FCodigoDesconto3 : Integer;
        { Storage for property CodigoJurosMora }
        FCodigoJurosMora : Integer;
        { Storage for property CodigoMoeda }
        FCodigoMoeda : Integer;
        { Storage for property CodigoMulta }
        FCodigoMulta : Integer;
        { Storage for property CodigoProtesto }
        FCodigoProtesto : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Desconto1 }
        FDesconto1 : Double;
        { Storage for property Desconto2 }
        FDesconto2 : Double;
        { Storage for property Desconto3 }
        FDesconto3 : Double;
        { Storage for property DiasBaixaDevolucao }
        FDiasBaixaDevolucao : Integer;
        { Storage for property DiasDesconto1 }
        FDiasDesconto1 : Integer;
        { Storage for property DiasDesconto2 }
        FDiasDesconto2 : Integer;
        { Storage for property DiasDesconto3 }
        FDiasDesconto3 : Integer;
        { Storage for property DiasJurosMora }
        FDiasJurosMora : Integer;
        { Storage for property DiasMulta }
        FDiasMulta : Integer;
        { Storage for property DiasProtesto }
        FDiasProtesto : Integer;
        { Storage for property DigitoAgencia }
        FDigitoAgencia : String;
        { Storage for property DigitoAgenciaConta }
        FDigitoAgenciaConta : String;
        { Storage for property DigitoConta }
        FDigitoConta : String;
        { Storage for property EAceite }
        FEAceite : TCheckBox;
        { Storage for property ECodigoBNB }
        FECodigoBNB : TEdit;
        { Storage for property ECodigoBaixaDevolucao }
        FECodigoBaixaDevolucao : TComboBox;
        { Storage for property ECodigoCarteira }
        FECodigoCarteira : TComboBox;
        { Storage for property ECodigoConvenio }
        FECodigoConvenio : TEdit;
        { Storage for property ECodigoDesconto1 }
        FECodigoDesconto1 : TComboBox;
        { Storage for property ECodigoDesconto2 }
        FECodigoDesconto2 : TComboBox;
        { Storage for property ECodigoDesconto3 }
        FECodigoDesconto3 : TComboBox;
        { Storage for property ECodigoJurosMora }
        FECodigoJurosMora : TComboBox;
        { Storage for property ECodigoMoeda }
        FECodigoMoeda : TComboBox;
        { Storage for property ECodigoMulta }
        FECodigoMulta : TComboBox;
        { Storage for property ECodigoProtesto }
        FECodigoProtesto : TComboBox;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDesconto1 }
        FEDesconto1 : TEdit;
        { Storage for property EDesconto2 }
        FEDesconto2 : TEdit;
        { Storage for property EDesconto3 }
        FEDesconto3 : TEdit;
        { Storage for property EDiasBaixaDevolucao }
        FEDiasBaixaDevolucao : TEdit;
        { Storage for property EDiasDesconto1 }
        FEDiasDesconto1 : TEdit;
        { Storage for property EDiasDesconto2 }
        FEDiasDesconto2 : TEdit;
        { Storage for property EDiasDesconto3 }
        FEDiasDesconto3 : TEdit;
        { Storage for property EDiasJurosMora }
        FEDiasJurosMora : TEdit;
        { Storage for property EDiasMulta }
        FEDiasMulta : TEdit;
        { Storage for property EDiasProtesto }
        FEDiasProtesto : TEdit;
        { Storage for property EDigitoAgencia }
        FEDigitoAgencia : TEdit;
        { Storage for property EDigitoAgenciaConta }
        FEDigitoAgenciaConta : TEdit;
        { Storage for property EDigitoConta }
        FEDigitoConta : TEdit;
        { Storage for property EFonteInstrucao1 }
        FEFonteInstrucao1 : TComboBox;
        { Storage for property EFonteInstrucao2 }
        FEFonteInstrucao2 : TComboBox;
        { Storage for property EFonteInstrucao3 }
        FEFonteInstrucao3 : TComboBox;
        { Storage for property EFonteInstrucao4 }
        FEFonteInstrucao4 : TComboBox;
        { Storage for property EFonteInstrucao5 }
        FEFonteInstrucao5 : TComboBox;
        { Storage for property EFonteInstrucao6 }
        FEFonteInstrucao6 : TComboBox;
        { Storage for property EFonteInstrucao7 }
        FEFonteInstrucao7 : TComboBox;
        { Storage for property EFonteInstrucao8 }
        FEFonteInstrucao8 : TComboBox;
        { Storage for property EFonteMensagem }
        FEFonteMensagem : TComboBox;
        { Storage for property EFonteMensagem10 }
        FEFonteMensagem10 : TComboBox;
        { Storage for property EFonteMensagem11 }
        FEFonteMensagem11 : TComboBox;
        { Storage for property EFonteMensagem12 }
        FEFonteMensagem12 : TComboBox;
        { Storage for property EFonteMensagem13 }
        FEFonteMensagem13 : TComboBox;
        { Storage for property EFonteMensagem14 }
        FEFonteMensagem14 : TComboBox;
        { Storage for property EFonteMensagem15 }
        FEFonteMensagem15 : TComboBox;
        { Storage for property EFonteMensagem16 }
        FEFonteMensagem16 : TComboBox;
        { Storage for property EFonteMensagem17 }
        FEFonteMensagem17 : TComboBox;
        { Storage for property EFonteMensagem18 }
        FEFonteMensagem18 : TComboBox;
        { Storage for property EFonteMensagem2 }
        FEFonteMensagem2 : TComboBox;
        { Storage for property EFonteMensagem3 }
        FEFonteMensagem3 : TComboBox;
        { Storage for property EFonteMensagem4 }
        FEFonteMensagem4 : TComboBox;
        { Storage for property EFonteMensagem5 }
        FEFonteMensagem5 : TComboBox;
        { Storage for property EFonteMensagem6 }
        FEFonteMensagem6 : TComboBox;
        { Storage for property EFonteMensagem7 }
        FEFonteMensagem7 : TComboBox;
        { Storage for property EFonteMensagem8 }
        FEFonteMensagem8 : TComboBox;
        { Storage for property EFonteMensagem9 }
        FEFonteMensagem9 : TComboBox;
        { Storage for property EFormaCadastroTituloBanco }
        FEFormaCadastroTituloBanco : TComboBox;
        { Storage for property EGrupoEspecial }
        FEGrupoEspecial : TCheckBox;
        { Storage for property EIdentificacaoCSP }
        FEIdentificacaoCSP : TEdit;
        { Storage for property EIdentificacaoDistribuicao }
        FEIdentificacaoDistribuicao : TComboBox;
        { Storage for property EIdentificacaoEmissaoBloqueto }
        FEIdentificacaoEmissaoBloqueto : TComboBox;
        { Storage for property EIdentificacaoMensagem }
        FEIdentificacaoMensagem : TComboBox;
        { Storage for property EInstrucao1 }
        FEInstrucao1 : TEdit;
        { Storage for property EInstrucao2 }
        FEInstrucao2 : TEdit;
        { Storage for property EInstrucao3 }
        FEInstrucao3 : TEdit;
        { Storage for property EInstrucao4 }
        FEInstrucao4 : TEdit;
        { Storage for property EInstrucao5 }
        FEInstrucao5 : TEdit;
        { Storage for property EInstrucao6 }
        FEInstrucao6 : TEdit;
        { Storage for property EInstrucao7 }
        FEInstrucao7 : TEdit;
        { Storage for property EInstrucao8 }
        FEInstrucao8 : TEdit;
        { Storage for property EJurosDia }
        FEJurosDia : TEdit;
        { Storage for property ELeiaute }
        FELeiaute : TEdit;
        { Storage for property ELinhaMensagem }
        FELinhaMensagem : TEdit;
        { Storage for property EMensagem1 }
        FEMensagem1 : TEdit;
        { Storage for property EMensagem10 }
        FEMensagem10 : TEdit;
        { Storage for property EMensagem11 }
        FEMensagem11 : TEdit;
        { Storage for property EMensagem12 }
        FEMensagem12 : TEdit;
        { Storage for property EMensagem13 }
        FEMensagem13 : TEdit;
        { Storage for property EMensagem14 }
        FEMensagem14 : TEdit;
        { Storage for property EMensagem15 }
        FEMensagem15 : TEdit;
        { Storage for property EMensagem16 }
        FEMensagem16 : TEdit;
        { Storage for property EMensagem17 }
        FEMensagem17 : TEdit;
        { Storage for property EMensagem18 }
        FEMensagem18 : TEdit;
        { Storage for property EMensagem2 }
        FEMensagem2 : TEdit;
        { Storage for property EMensagem3 }
        FEMensagem3 : TEdit;
        { Storage for property EMensagem4 }
        FEMensagem4 : TEdit;
        { Storage for property EMensagem5 }
        FEMensagem5 : TEdit;
        { Storage for property EMensagem6 }
        FEMensagem6 : TEdit;
        { Storage for property EMensagem7 }
        FEMensagem7 : TEdit;
        { Storage for property EMensagem8 }
        FEMensagem8 : TEdit;
        { Storage for property EMensagem9 }
        FEMensagem9 : TEdit;
        { Storage for property EMensagemImpressa }
        FEMensagemImpressa : TEdit;
        { Storage for property EMulta }
        FEMulta : TEdit;
        { Storage for property ENomeBanco }
        FENomeBanco : TEdit;
        { Storage for property ENomeEmpresa }
        FENomeEmpresa : TEdit;
        { Storage for property ENumeroAgencia }
        FENumeroAgencia : TEdit;
        { Storage for property ENumeroBanco }
        FENumeroBanco : TEdit;
        { Storage for property ENumeroConta }
        FENumeroConta : TEdit;
        { Storage for property ENumeroInscricao }
        FENumeroInscricao : TEdit;
        { Storage for property ENumeroRemessa }
        FENumeroRemessa : TEdit;
        { Storage for property ENumeroRetorno }
        FENumeroRetorno : TEdit;
        { Storage for property EOBS }
        FEOBS : TEdit;
        { Storage for property EReservadoEmpresa }
        FEReservadoEmpresa : TEdit;
        { Storage for property ESituacao }
        FESituacao : TComboBox;
        { Storage for property ETipoDocumento }
        FETipoDocumento : TComboBox;
        { Storage for property ETipoInscricao }
        FETipoInscricao : TComboBox;
        { Storage for property EVersao }
        FEVersao : TEdit;
        { Storage for property FonteInstrucao1 }
        FFonteInstrucao1 : Integer;
        { Storage for property FonteInstrucao2 }
        FFonteInstrucao2 : Integer;
        { Storage for property FonteInstrucao3 }
        FFonteInstrucao3 : Integer;
        { Storage for property FonteInstrucao4 }
        FFonteInstrucao4 : Integer;
        { Storage for property FonteInstrucao5 }
        FFonteInstrucao5 : Integer;
        { Storage for property FonteInstrucao6 }
        FFonteInstrucao6 : Integer;
        { Storage for property FonteInstrucao7 }
        FFonteInstrucao7 : Integer;
        { Storage for property FonteInstrucao8 }
        FFonteInstrucao8 : Integer;
        { Storage for property FonteMensagem }
        FFonteMensagem : Integer;
        { Storage for property FonteMensagem10 }
        FFonteMensagem10 : Integer;
        { Storage for property FonteMensagem11 }
        FFonteMensagem11 : Integer;
        { Storage for property FonteMensagem12 }
        FFonteMensagem12 : Integer;
        { Storage for property FonteMensagem13 }
        FFonteMensagem13 : Integer;
        { Storage for property FonteMensagem14 }
        FFonteMensagem14 : Integer;
        { Storage for property FonteMensagem15 }
        FFonteMensagem15 : Integer;
        { Storage for property FonteMensagem16 }
        FFonteMensagem16 : Integer;
        { Storage for property FonteMensagem17 }
        FFonteMensagem17 : Integer;
        { Storage for property FonteMensagem18 }
        FFonteMensagem18 : Integer;
        { Storage for property FonteMensagem2 }
        FFonteMensagem2 : Integer;
        { Storage for property FonteMensagem3 }
        FFonteMensagem3 : Integer;
        { Storage for property FonteMensagem4 }
        FFonteMensagem4 : Integer;
        { Storage for property FonteMensagem5 }
        FFonteMensagem5 : Integer;
        { Storage for property FonteMensagem6 }
        FFonteMensagem6 : Integer;
        { Storage for property FonteMensagem7 }
        FFonteMensagem7 : Integer;
        { Storage for property FonteMensagem8 }
        FFonteMensagem8 : Integer;
        { Storage for property FonteMensagem9 }
        FFonteMensagem9 : Integer;
        { Storage for property FormaCadastroTituloBanco }
        FFormaCadastroTituloBanco : Integer;
        { Storage for property GrupoEspecial }
        FGrupoEspecial : Boolean;
        { Storage for property IdentificacaoCSP }
        FIdentificacaoCSP : String;
        { Storage for property IdentificacaoDistribuicao }
        FIdentificacaoDistribuicao : Integer;
        { Storage for property IdentificacaoEmissaoBloqueto }
        FIdentificacaoEmissaoBloqueto : Integer;
        { Storage for property IdentificacaoMensagem }
        FIdentificacaoMensagem : Integer;
        { Storage for property Instrucao1 }
        FInstrucao1 : String;
        { Storage for property Instrucao2 }
        FInstrucao2 : String;
        { Storage for property Instrucao3 }
        FInstrucao3 : String;
        { Storage for property Instrucao4 }
        FInstrucao4 : String;
        { Storage for property Instrucao5 }
        FInstrucao5 : String;
        { Storage for property Instrucao6 }
        FInstrucao6 : String;
        { Storage for property Instrucao7 }
        FInstrucao7 : String;
        { Storage for property Instrucao8 }
        FInstrucao8 : String;
        { Storage for property JurosDia }
        FJurosDia : Double;
        { Storage for property Leiaute }
        FLeiaute : String;
        { Storage for property LinhaMensagem }
        FLinhaMensagem : Integer;
        { Storage for property MaquinaBNB }
        FMaquinaBNB : Integer;
        { Storage for property Mensagem1 }
        FMensagem1 : String;
        { Storage for property Mensagem10 }
        FMensagem10 : String;
        { Storage for property Mensagem11 }
        FMensagem11 : String;
        { Storage for property Mensagem12 }
        FMensagem12 : String;
        { Storage for property Mensagem13 }
        FMensagem13 : String;
        { Storage for property Mensagem14 }
        FMensagem14 : String;
        { Storage for property Mensagem15 }
        FMensagem15 : String;
        { Storage for property Mensagem16 }
        FMensagem16 : String;
        { Storage for property Mensagem17 }
        FMensagem17 : String;
        { Storage for property Mensagem18 }
        FMensagem18 : String;
        { Storage for property Mensagem2 }
        FMensagem2 : String;
        { Storage for property Mensagem3 }
        FMensagem3 : String;
        { Storage for property Mensagem4 }
        FMensagem4 : String;
        { Storage for property Mensagem5 }
        FMensagem5 : String;
        { Storage for property Mensagem6 }
        FMensagem6 : String;
        { Storage for property Mensagem7 }
        FMensagem7 : String;
        { Storage for property Mensagem8 }
        FMensagem8 : String;
        { Storage for property Mensagem9 }
        FMensagem9 : String;
        { Storage for property MensagemImpressa }
        FMensagemImpressa : String;
        { Storage for property Multa }
        FMulta : Double;
        { Storage for property NomeBanco }
        FNomeBanco : String;
        { Storage for property NomeEmpresa }
        FNomeEmpresa : String;
        { Storage for property NumeroAgencia }
        FNumeroAgencia : Integer;
        { Storage for property NumeroBanco }
        FNumeroBanco : Integer;
        { Storage for property NumeroConta }
        FNumeroConta : Integer;
        { Storage for property NumeroInscricao }
        FNumeroInscricao : String;
        { Storage for property NumeroRemessa }
        FNumeroRemessa : Integer;
        { Storage for property NumeroRetorno }
        FNumeroRetorno : Integer;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property ReservadoEmpresa }
        FReservadoEmpresa : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TipoDocumento }
        FTipoDocumento : Integer;
        { Storage for property TipoInscricao }
        FTipoInscricao : Integer;
        { Storage for property Versao }
        FVersao : Integer;

      { Private methods of TBanco_Boleto }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property Aceite }
        function GetAceite : Boolean;
        { Read method for property CodigoBNB }
        function GetCodigoBNB : Integer;
        { Read method for property CodigoBaixaDevolucao }
        function GetCodigoBaixaDevolucao : Integer;
        { Read method for property CodigoCarteira }
        function GetCodigoCarteira : Integer;
        { Read method for property CodigoConvenio }
        function GetCodigoConvenio : String;
        { Read method for property CodigoDesconto1 }
        function GetCodigoDesconto1 : Integer;
        { Read method for property CodigoDesconto2 }
        function GetCodigoDesconto2 : Integer;
        { Read method for property CodigoDesconto3 }
        function GetCodigoDesconto3 : Integer;
        { Read method for property CodigoJurosMora }
        function GetCodigoJurosMora : Integer;
        { Read method for property CodigoMoeda }
        function GetCodigoMoeda : Integer;
        { Read method for property CodigoMulta }
        function GetCodigoMulta : Integer;
        { Read method for property CodigoProtesto }
        function GetCodigoProtesto : Integer;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property Desconto1 }
        function GetDesconto1 : Double;
        { Read method for property Desconto2 }
        function GetDesconto2 : Double;
        { Read method for property Desconto3 }
        function GetDesconto3 : Double;
        { Read method for property DiasBaixaDevolucao }
        function GetDiasBaixaDevolucao : Integer;
        { Read method for property DiasDesconto1 }
        function GetDiasDesconto1 : Integer;
        { Read method for property DiasDesconto2 }
        function GetDiasDesconto2 : Integer;
        { Read method for property DiasDesconto3 }
        function GetDiasDesconto3 : Integer;
        { Read method for property DiasJurosMora }
        function GetDiasJurosMora : Integer;
        { Read method for property DiasMulta }
        function GetDiasMulta : Integer;
        { Read method for property DiasProtesto }
        function GetDiasProtesto : Integer;
        { Read method for property DigitoAgencia }
        function GetDigitoAgencia : String;
        { Read method for property DigitoAgenciaConta }
        function GetDigitoAgenciaConta : String;
        { Read method for property DigitoConta }
        function GetDigitoConta : String;
        { Read method for property FonteInstrucao1 }
        function GetFonteInstrucao1 : Integer;
        { Read method for property FonteInstrucao2 }
        function GetFonteInstrucao2 : Integer;
        { Read method for property FonteInstrucao3 }
        function GetFonteInstrucao3 : Integer;
        { Read method for property FonteInstrucao4 }
        function GetFonteInstrucao4 : Integer;
        { Read method for property FonteInstrucao5 }
        function GetFonteInstrucao5 : Integer;
        { Read method for property FonteInstrucao6 }
        function GetFonteInstrucao6 : Integer;
        { Read method for property FonteInstrucao7 }
        function GetFonteInstrucao7 : Integer;
        { Read method for property FonteInstrucao8 }
        function GetFonteInstrucao8 : Integer;
        { Read method for property FonteMensagem }
        function GetFonteMensagem : Integer;
        { Read method for property FonteMensagem10 }
        function GetFonteMensagem10 : Integer;
        { Read method for property FonteMensagem11 }
        function GetFonteMensagem11 : Integer;
        { Read method for property FonteMensagem12 }
        function GetFonteMensagem12 : Integer;
        { Read method for property FonteMensagem13 }
        function GetFonteMensagem13 : Integer;
        { Read method for property FonteMensagem14 }
        function GetFonteMensagem14 : Integer;
        { Read method for property FonteMensagem15 }
        function GetFonteMensagem15 : Integer;
        { Read method for property FonteMensagem16 }
        function GetFonteMensagem16 : Integer;
        { Read method for property FonteMensagem17 }
        function GetFonteMensagem17 : Integer;
        { Read method for property FonteMensagem18 }
        function GetFonteMensagem18 : Integer;
        { Read method for property FonteMensagem2 }
        function GetFonteMensagem2 : Integer;
        { Read method for property FonteMensagem3 }
        function GetFonteMensagem3 : Integer;
        { Read method for property FonteMensagem4 }
        function GetFonteMensagem4 : Integer;
        { Read method for property FonteMensagem5 }
        function GetFonteMensagem5 : Integer;
        { Read method for property FonteMensagem6 }
        function GetFonteMensagem6 : Integer;
        { Read method for property FonteMensagem7 }
        function GetFonteMensagem7 : Integer;
        { Read method for property FonteMensagem8 }
        function GetFonteMensagem8 : Integer;
        { Read method for property FonteMensagem9 }
        function GetFonteMensagem9 : Integer;
        { Read method for property FormaCadastroTituloBanco }
        function GetFormaCadastroTituloBanco : Integer;
        { Read method for property GrupoEspecial }
        function GetGrupoEspecial : Boolean;
        { Read method for property IdentificacaoCSP }
        function GetIdentificacaoCSP : String;
        { Read method for property IdentificacaoDistribuicao }
        function GetIdentificacaoDistribuicao : Integer;
        { Read method for property IdentificacaoEmissaoBloqueto }
        function GetIdentificacaoEmissaoBloqueto : Integer;
        { Read method for property IdentificacaoMensagem }
        function GetIdentificacaoMensagem : Integer;
        { Read method for property Instrucao1 }
        function GetInstrucao1 : String;
        { Read method for property Instrucao2 }
        function GetInstrucao2 : String;
        { Read method for property Instrucao3 }
        function GetInstrucao3 : String;
        { Read method for property Instrucao4 }
        function GetInstrucao4 : String;
        { Read method for property Instrucao5 }
        function GetInstrucao5 : String;
        { Read method for property Instrucao6 }
        function GetInstrucao6 : String;
        { Read method for property Instrucao7 }
        function GetInstrucao7 : String;
        { Read method for property Instrucao8 }
        function GetInstrucao8 : String;
        { Read method for property JurosDia }
        function GetJurosDia : Double;
        { Read method for property Leiaute }
        function GetLeiaute : String;
        { Read method for property LinhaMensagem }
        function GetLinhaMensagem : Integer;
        { Read method for property MaquinaBNB }
        function GetMaquinaBNB : Integer;
        { Read method for property Mensagem1 }
        function GetMensagem1 : String;
        { Read method for property Mensagem10 }
        function GetMensagem10 : String;
        { Read method for property Mensagem11 }
        function GetMensagem11 : String;
        { Read method for property Mensagem12 }
        function GetMensagem12 : String;
        { Read method for property Mensagem13 }
        function GetMensagem13 : String;
        { Read method for property Mensagem14 }
        function GetMensagem14 : String;
        { Read method for property Mensagem15 }
        function GetMensagem15 : String;
        { Read method for property Mensagem16 }
        function GetMensagem16 : String;
        { Read method for property Mensagem17 }
        function GetMensagem17 : String;
        { Read method for property Mensagem18 }
        function GetMensagem18 : String;
        { Read method for property Mensagem2 }
        function GetMensagem2 : String;
        { Read method for property Mensagem3 }
        function GetMensagem3 : String;
        { Read method for property Mensagem4 }
        function GetMensagem4 : String;
        { Read method for property Mensagem5 }
        function GetMensagem5 : String;
        { Read method for property Mensagem6 }
        function GetMensagem6 : String;
        { Read method for property Mensagem7 }
        function GetMensagem7 : String;
        { Read method for property Mensagem8 }
        function GetMensagem8 : String;
        { Read method for property Mensagem9 }
        function GetMensagem9 : String;
        { Read method for property MensagemImpressa }
        function GetMensagemImpressa : String;
        { Read method for property Multa }
        function GetMulta : Double;
        { Read method for property NomeBanco }
        function GetNomeBanco : String;
        { Read method for property NomeEmpresa }
        function GetNomeEmpresa : String;
        { Read method for property NumeroAgencia }
        function GetNumeroAgencia : Integer;
        { Read method for property NumeroBanco }
        function GetNumeroBanco : Integer;
        { Read method for property NumeroConta }
        function GetNumeroConta : Integer;
        { Read method for property NumeroInscricao }
        function GetNumeroInscricao : String;
        { Read method for property NumeroRemessa }
        function GetNumeroRemessa : Integer;
        { Read method for property NumeroRetorno }
        function GetNumeroRetorno : Integer;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property ReservadoEmpresa }
        function GetReservadoEmpresa : String;
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Read method for property TipoDocumento }
        function GetTipoDocumento : Integer;
        { Read method for property TipoInscricao }
        function GetTipoInscricao : Integer;
        { Read method for property Versao }
        function GetVersao : Integer;

    protected
      { Protected fields of TBanco_Boleto }

      { Protected methods of TBanco_Boleto }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TBanco_Boleto }

      { Public methods of TBanco_Boleto }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um Grupo }
        function LocalizarCod(CdBNB:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TBanco_Boleto }
        property Aceite : Boolean read GetAceite write FAceite;
        { Código do Grupo }
        property CodigoBNB : Integer read GetCodigoBNB write FCodigoBNB;
        property CodigoBaixaDevolucao : Integer
             read GetCodigoBaixaDevolucao write FCodigoBaixaDevolucao;
        property CodigoCarteira : Integer
             read GetCodigoCarteira write FCodigoCarteira;
        property CodigoConvenio : String
             read GetCodigoConvenio write FCodigoConvenio;
        property CodigoDesconto1 : Integer
             read GetCodigoDesconto1 write FCodigoDesconto1;
        property CodigoDesconto2 : Integer
             read GetCodigoDesconto2 write FCodigoDesconto2;
        property CodigoDesconto3 : Integer
             read GetCodigoDesconto3 write FCodigoDesconto3;
        property CodigoJurosMora : Integer
             read GetCodigoJurosMora write FCodigoJurosMora;
        property CodigoMoeda : Integer read GetCodigoMoeda write FCodigoMoeda;
        property CodigoMulta : Integer read GetCodigoMulta write FCodigoMulta;
        property CodigoProtesto : Integer
             read GetCodigoProtesto write FCodigoProtesto;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property Desconto1 : Double read GetDesconto1 write FDesconto1;
        property Desconto2 : Double read GetDesconto2 write FDesconto2;
        property Desconto3 : Double read GetDesconto3 write FDesconto3;
        property DiasBaixaDevolucao : Integer
             read GetDiasBaixaDevolucao write FDiasBaixaDevolucao;
        property DiasDesconto1 : Integer
             read GetDiasDesconto1 write FDiasDesconto1;
        property DiasDesconto2 : Integer
             read GetDiasDesconto2 write FDiasDesconto2;
        property DiasDesconto3 : Integer
             read GetDiasDesconto3 write FDiasDesconto3;
        property DiasJurosMora : Integer
             read GetDiasJurosMora write FDiasJurosMora;
        property DiasMulta : Integer read GetDiasMulta write FDiasMulta;
        property DiasProtesto : Integer
             read GetDiasProtesto write FDiasProtesto;
        property DigitoAgencia : String
             read GetDigitoAgencia write FDigitoAgencia;
        property DigitoAgenciaConta : String
             read GetDigitoAgenciaConta write FDigitoAgenciaConta;
        property DigitoConta : String read GetDigitoConta write FDigitoConta;
        property EAceite : TCheckBox read FEAceite write FEAceite;
        property ECodigoBNB : TEdit read FECodigoBNB write FECodigoBNB;
        property ECodigoBaixaDevolucao : TComboBox
             read FECodigoBaixaDevolucao write FECodigoBaixaDevolucao;
        property ECodigoCarteira : TComboBox
             read FECodigoCarteira write FECodigoCarteira;
        property ECodigoConvenio : TEdit
             read FECodigoConvenio write FECodigoConvenio;
        property ECodigoDesconto1 : TComboBox
             read FECodigoDesconto1 write FECodigoDesconto1;
        property ECodigoDesconto2 : TComboBox
             read FECodigoDesconto2 write FECodigoDesconto2;
        property ECodigoDesconto3 : TComboBox
             read FECodigoDesconto3 write FECodigoDesconto3;
        property ECodigoJurosMora : TComboBox
             read FECodigoJurosMora write FECodigoJurosMora;
        property ECodigoMoeda : TComboBox
             read FECodigoMoeda write FECodigoMoeda;
        property ECodigoMulta : TComboBox
             read FECodigoMulta write FECodigoMulta;
        property ECodigoProtesto : TComboBox
             read FECodigoProtesto write FECodigoProtesto;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDesconto1 : TEdit read FEDesconto1 write FEDesconto1;
        property EDesconto2 : TEdit read FEDesconto2 write FEDesconto2;
        property EDesconto3 : TEdit read FEDesconto3 write FEDesconto3;
        property EDiasBaixaDevolucao : TEdit
             read FEDiasBaixaDevolucao write FEDiasBaixaDevolucao;
        property EDiasDesconto1 : TEdit
             read FEDiasDesconto1 write FEDiasDesconto1;
        property EDiasDesconto2 : TEdit
             read FEDiasDesconto2 write FEDiasDesconto2;
        property EDiasDesconto3 : TEdit
             read FEDiasDesconto3 write FEDiasDesconto3;
        property EDiasJurosMora : TEdit
             read FEDiasJurosMora write FEDiasJurosMora;
        property EDiasMulta : TEdit read FEDiasMulta write FEDiasMulta;
        property EDiasProtesto : TEdit
             read FEDiasProtesto write FEDiasProtesto;
        property EDigitoAgencia : TEdit
             read FEDigitoAgencia write FEDigitoAgencia;
        property EDigitoAgenciaConta : TEdit
             read FEDigitoAgenciaConta write FEDigitoAgenciaConta;
        property EDigitoConta : TEdit read FEDigitoConta write FEDigitoConta;
        property EFonteInstrucao1 : TComboBox
             read FEFonteInstrucao1 write FEFonteInstrucao1;
        property EFonteInstrucao2 : TComboBox
             read FEFonteInstrucao2 write FEFonteInstrucao2;
        property EFonteInstrucao3 : TComboBox
             read FEFonteInstrucao3 write FEFonteInstrucao3;
        property EFonteInstrucao4 : TComboBox
             read FEFonteInstrucao4 write FEFonteInstrucao4;
        property EFonteInstrucao5 : TComboBox
             read FEFonteInstrucao5 write FEFonteInstrucao5;
        property EFonteInstrucao6 : TComboBox
             read FEFonteInstrucao6 write FEFonteInstrucao6;
        property EFonteInstrucao7 : TComboBox
             read FEFonteInstrucao7 write FEFonteInstrucao7;
        property EFonteInstrucao8 : TComboBox
             read FEFonteInstrucao8 write FEFonteInstrucao8;
        property EFonteMensagem : TComboBox
             read FEFonteMensagem write FEFonteMensagem;
        property EFonteMensagem10 : TComboBox
             read FEFonteMensagem10 write FEFonteMensagem10;
        property EFonteMensagem11 : TComboBox
             read FEFonteMensagem11 write FEFonteMensagem11;
        property EFonteMensagem12 : TComboBox
             read FEFonteMensagem12 write FEFonteMensagem12;
        property EFonteMensagem13 : TComboBox
             read FEFonteMensagem13 write FEFonteMensagem13;
        property EFonteMensagem14 : TComboBox
             read FEFonteMensagem14 write FEFonteMensagem14;
        property EFonteMensagem15 : TComboBox
             read FEFonteMensagem15 write FEFonteMensagem15;
        property EFonteMensagem16 : TComboBox
             read FEFonteMensagem16 write FEFonteMensagem16;
        property EFonteMensagem17 : TComboBox
             read FEFonteMensagem17 write FEFonteMensagem17;
        property EFonteMensagem18 : TComboBox
             read FEFonteMensagem18 write FEFonteMensagem18;
        property EFonteMensagem2 : TComboBox
             read FEFonteMensagem2 write FEFonteMensagem2;
        property EFonteMensagem3 : TComboBox
             read FEFonteMensagem3 write FEFonteMensagem3;
        property EFonteMensagem4 : TComboBox
             read FEFonteMensagem4 write FEFonteMensagem4;
        property EFonteMensagem5 : TComboBox
             read FEFonteMensagem5 write FEFonteMensagem5;
        property EFonteMensagem6 : TComboBox
             read FEFonteMensagem6 write FEFonteMensagem6;
        property EFonteMensagem7 : TComboBox
             read FEFonteMensagem7 write FEFonteMensagem7;
        property EFonteMensagem8 : TComboBox
             read FEFonteMensagem8 write FEFonteMensagem8;
        property EFonteMensagem9 : TComboBox
             read FEFonteMensagem9 write FEFonteMensagem9;
        property EFormaCadastroTituloBanco : TComboBox
             read FEFormaCadastroTituloBanco write FEFormaCadastroTituloBanco;
        property EGrupoEspecial : TCheckBox
             read FEGrupoEspecial write FEGrupoEspecial;
        property EIdentificacaoCSP : TEdit
             read FEIdentificacaoCSP write FEIdentificacaoCSP;
        property EIdentificacaoDistribuicao : TComboBox
             read FEIdentificacaoDistribuicao write FEIdentificacaoDistribuicao;
        property EIdentificacaoEmissaoBloqueto : TComboBox
             read FEIdentificacaoEmissaoBloqueto write FEIdentificacaoEmissaoBloqueto;
        property EIdentificacaoMensagem : TComboBox
             read FEIdentificacaoMensagem write FEIdentificacaoMensagem;
        property EInstrucao1 : TEdit read FEInstrucao1 write FEInstrucao1;
        property EInstrucao2 : TEdit read FEInstrucao2 write FEInstrucao2;
        property EInstrucao3 : TEdit read FEInstrucao3 write FEInstrucao3;
        property EInstrucao4 : TEdit read FEInstrucao4 write FEInstrucao4;
        property EInstrucao5 : TEdit read FEInstrucao5 write FEInstrucao5;
        property EInstrucao6 : TEdit read FEInstrucao6 write FEInstrucao6;
        property EInstrucao7 : TEdit read FEInstrucao7 write FEInstrucao7;
        property EInstrucao8 : TEdit read FEInstrucao8 write FEInstrucao8;
        property EJurosDia : TEdit read FEJurosDia write FEJurosDia;
        property ELeiaute : TEdit read FELeiaute write FELeiaute;
        property ELinhaMensagem : TEdit
             read FELinhaMensagem write FELinhaMensagem;
        property EMensagem1 : TEdit read FEMensagem1 write FEMensagem1;
        property EMensagem10 : TEdit read FEMensagem10 write FEMensagem10;
        property EMensagem11 : TEdit read FEMensagem11 write FEMensagem11;
        property EMensagem12 : TEdit read FEMensagem12 write FEMensagem12;
        property EMensagem13 : TEdit read FEMensagem13 write FEMensagem13;
        property EMensagem14 : TEdit read FEMensagem14 write FEMensagem14;
        property EMensagem15 : TEdit read FEMensagem15 write FEMensagem15;
        property EMensagem16 : TEdit read FEMensagem16 write FEMensagem16;
        property EMensagem17 : TEdit read FEMensagem17 write FEMensagem17;
        property EMensagem18 : TEdit read FEMensagem18 write FEMensagem18;
        property EMensagem2 : TEdit read FEMensagem2 write FEMensagem2;
        property EMensagem3 : TEdit read FEMensagem3 write FEMensagem3;
        property EMensagem4 : TEdit read FEMensagem4 write FEMensagem4;
        property EMensagem5 : TEdit read FEMensagem5 write FEMensagem5;
        property EMensagem6 : TEdit read FEMensagem6 write FEMensagem6;
        property EMensagem7 : TEdit read FEMensagem7 write FEMensagem7;
        property EMensagem8 : TEdit read FEMensagem8 write FEMensagem8;
        property EMensagem9 : TEdit read FEMensagem9 write FEMensagem9;
        property EMensagemImpressa : TEdit
             read FEMensagemImpressa write FEMensagemImpressa;
        property EMulta : TEdit read FEMulta write FEMulta;
        property ENomeBanco : TEdit read FENomeBanco write FENomeBanco;
        property ENomeEmpresa : TEdit read FENomeEmpresa write FENomeEmpresa;
        property ENumeroAgencia : TEdit
             read FENumeroAgencia write FENumeroAgencia;
        property ENumeroBanco : TEdit read FENumeroBanco write FENumeroBanco;
        property ENumeroConta : TEdit read FENumeroConta write FENumeroConta;
        property ENumeroInscricao : TEdit
             read FENumeroInscricao write FENumeroInscricao;
        property ENumeroRemessa : TEdit
             read FENumeroRemessa write FENumeroRemessa;
        property ENumeroRetorno : TEdit
             read FENumeroRetorno write FENumeroRetorno;
        property EOBS : TEdit read FEOBS write FEOBS;
        property EReservadoEmpresa : TEdit
             read FEReservadoEmpresa write FEReservadoEmpresa;
        property ESituacao : TComboBox read FESituacao write FESituacao;
        property ETipoDocumento : TComboBox
             read FETipoDocumento write FETipoDocumento;
        property ETipoInscricao : TComboBox
             read FETipoInscricao write FETipoInscricao;
        property EVersao : TEdit read FEVersao write FEVersao;
        property FonteInstrucao1 : Integer
             read GetFonteInstrucao1 write FFonteInstrucao1;
        property FonteInstrucao2 : Integer
             read GetFonteInstrucao2 write FFonteInstrucao2;
        property FonteInstrucao3 : Integer
             read GetFonteInstrucao3 write FFonteInstrucao3;
        property FonteInstrucao4 : Integer
             read GetFonteInstrucao4 write FFonteInstrucao4;
        property FonteInstrucao5 : Integer
             read GetFonteInstrucao5 write FFonteInstrucao5;
        property FonteInstrucao6 : Integer
             read GetFonteInstrucao6 write FFonteInstrucao6;
        property FonteInstrucao7 : Integer
             read GetFonteInstrucao7 write FFonteInstrucao7;
        property FonteInstrucao8 : Integer
             read GetFonteInstrucao8 write FFonteInstrucao8;
        property FonteMensagem : Integer
             read GetFonteMensagem write FFonteMensagem;
        property FonteMensagem10 : Integer
             read GetFonteMensagem10 write FFonteMensagem10;
        property FonteMensagem11 : Integer
             read GetFonteMensagem11 write FFonteMensagem11;
        property FonteMensagem12 : Integer
             read GetFonteMensagem12 write FFonteMensagem12;
        property FonteMensagem13 : Integer
             read GetFonteMensagem13 write FFonteMensagem13;
        property FonteMensagem14 : Integer
             read GetFonteMensagem14 write FFonteMensagem14;
        property FonteMensagem15 : Integer
             read GetFonteMensagem15 write FFonteMensagem15;
        property FonteMensagem16 : Integer
             read GetFonteMensagem16 write FFonteMensagem16;
        property FonteMensagem17 : Integer
             read GetFonteMensagem17 write FFonteMensagem17;
        property FonteMensagem18 : Integer
             read GetFonteMensagem18 write FFonteMensagem18;
        property FonteMensagem2 : Integer
             read GetFonteMensagem2 write FFonteMensagem2;
        property FonteMensagem3 : Integer
             read GetFonteMensagem3 write FFonteMensagem3;
        property FonteMensagem4 : Integer
             read GetFonteMensagem4 write FFonteMensagem4;
        property FonteMensagem5 : Integer
             read GetFonteMensagem5 write FFonteMensagem5;
        property FonteMensagem6 : Integer
             read GetFonteMensagem6 write FFonteMensagem6;
        property FonteMensagem7 : Integer
             read GetFonteMensagem7 write FFonteMensagem7;
        property FonteMensagem8 : Integer
             read GetFonteMensagem8 write FFonteMensagem8;
        property FonteMensagem9 : Integer
             read GetFonteMensagem9 write FFonteMensagem9;
        property FormaCadastroTituloBanco : Integer
             read GetFormaCadastroTituloBanco write FFormaCadastroTituloBanco;
        property GrupoEspecial : Boolean
             read GetGrupoEspecial write FGrupoEspecial;
        property IdentificacaoCSP : String
             read GetIdentificacaoCSP write FIdentificacaoCSP;
        property IdentificacaoDistribuicao : Integer
             read GetIdentificacaoDistribuicao write FIdentificacaoDistribuicao;
        property IdentificacaoEmissaoBloqueto : Integer
             read GetIdentificacaoEmissaoBloqueto write FIdentificacaoEmissaoBloqueto;
        property IdentificacaoMensagem : Integer
             read GetIdentificacaoMensagem write FIdentificacaoMensagem;
        property Instrucao1 : String read GetInstrucao1 write FInstrucao1;
        property Instrucao2 : String read GetInstrucao2 write FInstrucao2;
        property Instrucao3 : String read GetInstrucao3 write FInstrucao3;
        property Instrucao4 : String read GetInstrucao4 write FInstrucao4;
        property Instrucao5 : String read GetInstrucao5 write FInstrucao5;
        property Instrucao6 : String read GetInstrucao6 write FInstrucao6;
        property Instrucao7 : String read GetInstrucao7 write FInstrucao7;
        property Instrucao8 : String read GetInstrucao8 write FInstrucao8;
        property JurosDia : Double read GetJurosDia write FJurosDia;
        property Leiaute : String read GetLeiaute write FLeiaute;
        property LinhaMensagem : Integer
             read GetLinhaMensagem write FLinhaMensagem;
        property MaquinaBNB : Integer read GetMaquinaBNB write FMaquinaBNB;
        property Mensagem1 : String read GetMensagem1 write FMensagem1;
        property Mensagem10 : String read GetMensagem10 write FMensagem10;
        property Mensagem11 : String read GetMensagem11 write FMensagem11;
        property Mensagem12 : String read GetMensagem12 write FMensagem12;
        property Mensagem13 : String read GetMensagem13 write FMensagem13;
        property Mensagem14 : String read GetMensagem14 write FMensagem14;
        property Mensagem15 : String read GetMensagem15 write FMensagem15;
        property Mensagem16 : String read GetMensagem16 write FMensagem16;
        property Mensagem17 : String read GetMensagem17 write FMensagem17;
        property Mensagem18 : String read GetMensagem18 write FMensagem18;
        property Mensagem2 : String read GetMensagem2 write FMensagem2;
        property Mensagem3 : String read GetMensagem3 write FMensagem3;
        property Mensagem4 : String read GetMensagem4 write FMensagem4;
        property Mensagem5 : String read GetMensagem5 write FMensagem5;
        property Mensagem6 : String read GetMensagem6 write FMensagem6;
        property Mensagem7 : String read GetMensagem7 write FMensagem7;
        property Mensagem8 : String read GetMensagem8 write FMensagem8;
        property Mensagem9 : String read GetMensagem9 write FMensagem9;
        property MensagemImpressa : String
             read GetMensagemImpressa write FMensagemImpressa;
        property Multa : Double read GetMulta write FMulta;
        property NomeBanco : String read GetNomeBanco write FNomeBanco;
        property NomeEmpresa : String read GetNomeEmpresa write FNomeEmpresa;
        property NumeroAgencia : Integer
             read GetNumeroAgencia write FNumeroAgencia;
        property NumeroBanco : Integer read GetNumeroBanco write FNumeroBanco;
        property NumeroConta : Integer read GetNumeroConta write FNumeroConta;
        property NumeroInscricao : String
             read GetNumeroInscricao write FNumeroInscricao;
        property NumeroRemessa : Integer
             read GetNumeroRemessa write FNumeroRemessa;
        property NumeroRetorno : Integer
             read GetNumeroRetorno write FNumeroRetorno;
        property OBS : String read GetOBS write FOBS;
        property ReservadoEmpresa : String
             read GetReservadoEmpresa write FReservadoEmpresa;
        property Situacao : Integer read GetSituacao write FSituacao;
        property TipoDocumento : Integer
             read GetTipoDocumento write FTipoDocumento;
        property TipoInscricao : Integer
             read GetTipoInscricao write FTipoInscricao;
        property Versao : Integer read GetVersao write FVersao;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TBanco_Boleto with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TBanco_Boleto]);
end;

{ Method to set variable and property values and create objects }
procedure TBanco_Boleto.AutoInitialize;
begin
     FEAceite := nil;
     FECodigoBNB := nil;
     FECodigoBaixaDevolucao := nil;
     FECodigoCarteira := nil;
     FECodigoConvenio := nil;
     FECodigoDesconto1 := nil;
     FECodigoDesconto2 := nil;
     FECodigoDesconto3 := nil;
     FECodigoJurosMora := nil;
     FECodigoMoeda := nil;
     FECodigoMulta := nil;
     FECodigoProtesto := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDesconto1 := nil;
     FEDesconto2 := nil;
     FEDesconto3 := nil;
     FEDiasBaixaDevolucao := nil;
     FEDiasDesconto1 := nil;
     FEDiasDesconto2 := nil;
     FEDiasDesconto3 := nil;
     FEDiasJurosMora := nil;
     FEDiasMulta := nil;
     FEDiasProtesto := nil;
     FEDigitoAgencia := nil;
     FEDigitoAgenciaConta := nil;
     FEDigitoConta := nil;
     FEFonteInstrucao1 := nil;
     FEFonteInstrucao2 := nil;
     FEFonteInstrucao3 := nil;
     FEFonteInstrucao4 := nil;
     FEFonteInstrucao5 := nil;
     FEFonteInstrucao6 := nil;
     FEFonteInstrucao7 := nil;
     FEFonteInstrucao8 := nil;
     FEFonteMensagem := nil;
     FEFonteMensagem10 := nil;
     FEFonteMensagem11 := nil;
     FEFonteMensagem12 := nil;
     FEFonteMensagem13 := nil;
     FEFonteMensagem14 := nil;
     FEFonteMensagem15 := nil;
     FEFonteMensagem16 := nil;
     FEFonteMensagem17 := nil;
     FEFonteMensagem18 := nil;
     FEFonteMensagem2 := nil;
     FEFonteMensagem3 := nil;
     FEFonteMensagem4 := nil;
     FEFonteMensagem5 := nil;
     FEFonteMensagem6 := nil;
     FEFonteMensagem7 := nil;
     FEFonteMensagem8 := nil;
     FEFonteMensagem9 := nil;
     FEFormaCadastroTituloBanco := nil;
     FEGrupoEspecial := nil;
     FEIdentificacaoCSP := nil;
     FEIdentificacaoDistribuicao := nil;
     FEIdentificacaoEmissaoBloqueto := nil;
     FEIdentificacaoMensagem := nil;
     FEInstrucao1 := nil;
     FEInstrucao2 := nil;
     FEInstrucao3 := nil;
     FEInstrucao4 := nil;
     FEInstrucao5 := nil;
     FEInstrucao6 := nil;
     FEInstrucao7 := nil;
     FEInstrucao8 := nil;
     FEJurosDia := nil;
     FELeiaute := nil;
     FELinhaMensagem := nil;
     FEMensagem1 := nil;
     FEMensagem10 := nil;
     FEMensagem11 := nil;
     FEMensagem12 := nil;
     FEMensagem13 := nil;
     FEMensagem14 := nil;
     FEMensagem15 := nil;
     FEMensagem16 := nil;
     FEMensagem17 := nil;
     FEMensagem18 := nil;
     FEMensagem2 := nil;
     FEMensagem3 := nil;
     FEMensagem4 := nil;
     FEMensagem5 := nil;
     FEMensagem6 := nil;
     FEMensagem7 := nil;
     FEMensagem8 := nil;
     FEMensagem9 := nil;
     FEMensagemImpressa := nil;
     FEMulta := nil;
     FENomeBanco := nil;
     FENomeEmpresa := nil;
     FENumeroAgencia := nil;
     FENumeroBanco := nil;
     FENumeroConta := nil;
     FENumeroInscricao := nil;
     FENumeroRemessa := nil;
     FENumeroRetorno := nil;
     FEOBS := nil;
     FEReservadoEmpresa := nil;
     FESituacao := nil;
     FETipoDocumento := nil;
     FETipoInscricao := nil;
     FEVersao := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TBanco_Boleto.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FEAceite then
        FEAceite := nil;
     if AComponent = FECodigoBNB then
        FECodigoBNB := nil;
     if AComponent = FECodigoBaixaDevolucao then
        FECodigoBaixaDevolucao := nil;
     if AComponent = FECodigoCarteira then
        FECodigoCarteira := nil;
     if AComponent = FECodigoConvenio then
        FECodigoConvenio := nil;
     if AComponent = FECodigoDesconto1 then
        FECodigoDesconto1 := nil;
     if AComponent = FECodigoDesconto2 then
        FECodigoDesconto2 := nil;
     if AComponent = FECodigoDesconto3 then
        FECodigoDesconto3 := nil;
     if AComponent = FECodigoJurosMora then
        FECodigoJurosMora := nil;
     if AComponent = FECodigoMoeda then
        FECodigoMoeda := nil;
     if AComponent = FECodigoMulta then
        FECodigoMulta := nil;
     if AComponent = FECodigoProtesto then
        FECodigoProtesto := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDesconto1 then
        FEDesconto1 := nil;
     if AComponent = FEDesconto2 then
        FEDesconto2 := nil;
     if AComponent = FEDesconto3 then
        FEDesconto3 := nil;
     if AComponent = FEDiasBaixaDevolucao then
        FEDiasBaixaDevolucao := nil;
     if AComponent = FEDiasDesconto1 then
        FEDiasDesconto1 := nil;
     if AComponent = FEDiasDesconto2 then
        FEDiasDesconto2 := nil;
     if AComponent = FEDiasDesconto3 then
        FEDiasDesconto3 := nil;
     if AComponent = FEDiasJurosMora then
        FEDiasJurosMora := nil;
     if AComponent = FEDiasMulta then
        FEDiasMulta := nil;
     if AComponent = FEDiasProtesto then
        FEDiasProtesto := nil;
     if AComponent = FEDigitoAgencia then
        FEDigitoAgencia := nil;
     if AComponent = FEDigitoAgenciaConta then
        FEDigitoAgenciaConta := nil;
     if AComponent = FEDigitoConta then
        FEDigitoConta := nil;
     if AComponent = FEFonteInstrucao1 then
        FEFonteInstrucao1 := nil;
     if AComponent = FEFonteInstrucao2 then
        FEFonteInstrucao2 := nil;
     if AComponent = FEFonteInstrucao3 then
        FEFonteInstrucao3 := nil;
     if AComponent = FEFonteInstrucao4 then
        FEFonteInstrucao4 := nil;
     if AComponent = FEFonteInstrucao5 then
        FEFonteInstrucao5 := nil;
     if AComponent = FEFonteInstrucao6 then
        FEFonteInstrucao6 := nil;
     if AComponent = FEFonteInstrucao7 then
        FEFonteInstrucao7 := nil;
     if AComponent = FEFonteInstrucao8 then
        FEFonteInstrucao8 := nil;
     if AComponent = FEFonteMensagem then
        FEFonteMensagem := nil;
     if AComponent = FEFonteMensagem10 then
        FEFonteMensagem10 := nil;
     if AComponent = FEFonteMensagem11 then
        FEFonteMensagem11 := nil;
     if AComponent = FEFonteMensagem12 then
        FEFonteMensagem12 := nil;
     if AComponent = FEFonteMensagem13 then
        FEFonteMensagem13 := nil;
     if AComponent = FEFonteMensagem14 then
        FEFonteMensagem14 := nil;
     if AComponent = FEFonteMensagem15 then
        FEFonteMensagem15 := nil;
     if AComponent = FEFonteMensagem16 then
        FEFonteMensagem16 := nil;
     if AComponent = FEFonteMensagem17 then
        FEFonteMensagem17 := nil;
     if AComponent = FEFonteMensagem18 then
        FEFonteMensagem18 := nil;
     if AComponent = FEFonteMensagem2 then
        FEFonteMensagem2 := nil;
     if AComponent = FEFonteMensagem3 then
        FEFonteMensagem3 := nil;
     if AComponent = FEFonteMensagem4 then
        FEFonteMensagem4 := nil;
     if AComponent = FEFonteMensagem5 then
        FEFonteMensagem5 := nil;
     if AComponent = FEFonteMensagem6 then
        FEFonteMensagem6 := nil;
     if AComponent = FEFonteMensagem7 then
        FEFonteMensagem7 := nil;
     if AComponent = FEFonteMensagem8 then
        FEFonteMensagem8 := nil;
     if AComponent = FEFonteMensagem9 then
        FEFonteMensagem9 := nil;
     if AComponent = FEFormaCadastroTituloBanco then
        FEFormaCadastroTituloBanco := nil;
     if AComponent = FEGrupoEspecial then
        FEGrupoEspecial := nil;
     if AComponent = FEIdentificacaoCSP then
        FEIdentificacaoCSP := nil;
     if AComponent = FEIdentificacaoDistribuicao then
        FEIdentificacaoDistribuicao := nil;
     if AComponent = FEIdentificacaoEmissaoBloqueto then
        FEIdentificacaoEmissaoBloqueto := nil;
     if AComponent = FEIdentificacaoMensagem then
        FEIdentificacaoMensagem := nil;
     if AComponent = FEInstrucao1 then
        FEInstrucao1 := nil;
     if AComponent = FEInstrucao2 then
        FEInstrucao2 := nil;
     if AComponent = FEInstrucao3 then
        FEInstrucao3 := nil;
     if AComponent = FEInstrucao4 then
        FEInstrucao4 := nil;
     if AComponent = FEInstrucao5 then
        FEInstrucao5 := nil;
     if AComponent = FEInstrucao6 then
        FEInstrucao6 := nil;
     if AComponent = FEInstrucao7 then
        FEInstrucao7 := nil;
     if AComponent = FEInstrucao8 then
        FEInstrucao8 := nil;
     if AComponent = FEJurosDia then
        FEJurosDia := nil;
     if AComponent = FELeiaute then
        FELeiaute := nil;
     if AComponent = FELinhaMensagem then
        FELinhaMensagem := nil;
     if AComponent = FEMensagem1 then
        FEMensagem1 := nil;
     if AComponent = FEMensagem10 then
        FEMensagem10 := nil;
     if AComponent = FEMensagem11 then
        FEMensagem11 := nil;
     if AComponent = FEMensagem12 then
        FEMensagem12 := nil;
     if AComponent = FEMensagem13 then
        FEMensagem13 := nil;
     if AComponent = FEMensagem14 then
        FEMensagem14 := nil;
     if AComponent = FEMensagem15 then
        FEMensagem15 := nil;
     if AComponent = FEMensagem16 then
        FEMensagem16 := nil;
     if AComponent = FEMensagem17 then
        FEMensagem17 := nil;
     if AComponent = FEMensagem18 then
        FEMensagem18 := nil;
     if AComponent = FEMensagem2 then
        FEMensagem2 := nil;
     if AComponent = FEMensagem3 then
        FEMensagem3 := nil;
     if AComponent = FEMensagem4 then
        FEMensagem4 := nil;
     if AComponent = FEMensagem5 then
        FEMensagem5 := nil;
     if AComponent = FEMensagem6 then
        FEMensagem6 := nil;
     if AComponent = FEMensagem7 then
        FEMensagem7 := nil;
     if AComponent = FEMensagem8 then
        FEMensagem8 := nil;
     if AComponent = FEMensagem9 then
        FEMensagem9 := nil;
     if AComponent = FEMensagemImpressa then
        FEMensagemImpressa := nil;
     if AComponent = FEMulta then
        FEMulta := nil;
     if AComponent = FENomeBanco then
        FENomeBanco := nil;
     if AComponent = FENomeEmpresa then
        FENomeEmpresa := nil;
     if AComponent = FENumeroAgencia then
        FENumeroAgencia := nil;
     if AComponent = FENumeroBanco then
        FENumeroBanco := nil;
     if AComponent = FENumeroConta then
        FENumeroConta := nil;
     if AComponent = FENumeroInscricao then
        FENumeroInscricao := nil;
     if AComponent = FENumeroRemessa then
        FENumeroRemessa := nil;
     if AComponent = FENumeroRetorno then
        FENumeroRetorno := nil;
     if AComponent = FEOBS then
        FEOBS := nil;
     if AComponent = FEReservadoEmpresa then
        FEReservadoEmpresa := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETipoDocumento then
        FETipoDocumento := nil;
     if AComponent = FETipoInscricao then
        FETipoInscricao := nil;
     if AComponent = FEVersao then
        FEVersao := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TBanco_Boleto.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property Aceite }
function TBanco_Boleto.GetAceite : Boolean;
begin
  try
    result := (Self.fieldByName('BNB_ACEITE').asInteger=1);
  except
    result := False;
  end;
end;

{ Read method for property CodigoBNB }
function TBanco_Boleto.GetCodigoBNB : Integer;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoBaixaDevolucao }
function TBanco_Boleto.GetCodigoBaixaDevolucao : Integer;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO_BAIXA_DEVOLUCAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCarteira }
function TBanco_Boleto.GetCodigoCarteira : Integer;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO_CARTEIRA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoConvenio }
function TBanco_Boleto.GetCodigoConvenio : String;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO_CONVENIO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property CodigoDesconto1 }
function TBanco_Boleto.GetCodigoDesconto1 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO_DESCONTO1').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoDesconto2 }
function TBanco_Boleto.GetCodigoDesconto2 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO_DESCONTO2').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoDesconto3 }
function TBanco_Boleto.GetCodigoDesconto3 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO_DESCONTO3').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoJurosMora }
function TBanco_Boleto.GetCodigoJurosMora : Integer;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO_JUROS_MORA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoMoeda }
function TBanco_Boleto.GetCodigoMoeda : Integer;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO_MOEDA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoMulta }
function TBanco_Boleto.GetCodigoMulta : Integer;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO_MULTA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoProtesto }
function TBanco_Boleto.GetCodigoProtesto : Integer;
begin
  try
    Result := Self.fieldByName('BNB_CODIGO_PROTESTO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DataAlterado }
function TBanco_Boleto.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('BNB_DT_ALTERADO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property DataCadastro }
function TBanco_Boleto.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('BNB_DT_CADASTRO').AsDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property Desconto1 }
function TBanco_Boleto.GetDesconto1 : Double;
begin
  try
    Result := Self.fieldByName('BNB_DESCONTO1').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Desconto2 }
function TBanco_Boleto.GetDesconto2 : Double;
begin
  try
    Result := Self.fieldByName('BNB_DESCONTO2').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Desconto3 }
function TBanco_Boleto.GetDesconto3 : Double;
begin
  try
    Result := Self.fieldByName('BNB_DESCONTO3').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property DiasBaixaDevolucao }
function TBanco_Boleto.GetDiasBaixaDevolucao : Integer;
begin
  try
    Result := Self.fieldByName('BNB_DIAS_BAIXA_DEVOLUCAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DiasDesconto1 }
function TBanco_Boleto.GetDiasDesconto1 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_DIAS_DESCONTO1').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DiasDesconto2 }
function TBanco_Boleto.GetDiasDesconto2 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_DIAS_DESCONTO2').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DiasDesconto3 }
function TBanco_Boleto.GetDiasDesconto3 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_DIAS_DESCONTO3').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DiasJurosMora }
function TBanco_Boleto.GetDiasJurosMora : Integer;
begin
  try
    Result := Self.fieldByName('BNB_DIAS_JUROS_MORA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DiasMulta }
function TBanco_Boleto.GetDiasMulta : Integer;
begin
  try
    Result := Self.fieldByName('BNB_DIAS_MULTA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DiasProtesto }
function TBanco_Boleto.GetDiasProtesto : Integer;
begin
  try
    Result := Self.fieldByName('BNB_DIAS_PROTESTO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DigitoAgencia }
function TBanco_Boleto.GetDigitoAgencia : String;
begin
  try
    Result := Self.fieldByName('BNB_DIGITO_AGENCIA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property DigitoAgenciaConta }
function TBanco_Boleto.GetDigitoAgenciaConta : String;
begin
  try
    Result := Self.fieldByName('BNB_DIGITO_AGENCIA_CONTA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property DigitoConta }
function TBanco_Boleto.GetDigitoConta : String;
begin
  try
    Result := Self.fieldByName('BNB_DIGITO_CONTA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property FonteInstrucao1 }
function TBanco_Boleto.GetFonteInstrucao1 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_INSTRUCAO1').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteInstrucao2 }
function TBanco_Boleto.GetFonteInstrucao2 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_INSTRUCAO2').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteInstrucao3 }
function TBanco_Boleto.GetFonteInstrucao3 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_INSTRUCAO3').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteInstrucao4 }
function TBanco_Boleto.GetFonteInstrucao4 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_INSTRUCAO4').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteInstrucao5 }
function TBanco_Boleto.GetFonteInstrucao5 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_INSTRUCAO5').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteInstrucao6 }
function TBanco_Boleto.GetFonteInstrucao6 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_INSTRUCAO6').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteInstrucao7 }
function TBanco_Boleto.GetFonteInstrucao7 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_INSTRUCAO7').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteInstrucao8 }
function TBanco_Boleto.GetFonteInstrucao8 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_INSTRUCAO8').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem }
function TBanco_Boleto.GetFonteMensagem : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem10 }
function TBanco_Boleto.GetFonteMensagem10 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM10').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem11 }
function TBanco_Boleto.GetFonteMensagem11 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM11').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem12 }
function TBanco_Boleto.GetFonteMensagem12 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM12').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem13 }
function TBanco_Boleto.GetFonteMensagem13 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM13').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem14 }
function TBanco_Boleto.GetFonteMensagem14 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM14').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem15 }
function TBanco_Boleto.GetFonteMensagem15 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM15').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem16 }
function TBanco_Boleto.GetFonteMensagem16 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM16').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem17 }
function TBanco_Boleto.GetFonteMensagem17 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM17').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem18 }
function TBanco_Boleto.GetFonteMensagem18 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM18').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem2 }
function TBanco_Boleto.GetFonteMensagem2 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM2').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem3 }
function TBanco_Boleto.GetFonteMensagem3 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM3').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem4 }
function TBanco_Boleto.GetFonteMensagem4 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM4').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem5 }
function TBanco_Boleto.GetFonteMensagem5 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM5').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem6 }
function TBanco_Boleto.GetFonteMensagem6 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM6').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem7 }
function TBanco_Boleto.GetFonteMensagem7 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM7').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem8 }
function TBanco_Boleto.GetFonteMensagem8 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM8').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FonteMensagem9 }
function TBanco_Boleto.GetFonteMensagem9 : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FONTE_MENSAGEM9').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property FormaCadastroTituloBanco }
function TBanco_Boleto.GetFormaCadastroTituloBanco : Integer;
begin
  try
    Result := Self.fieldByName('BNB_FORMA_CAD_TIT_BANCO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property GrupoEspecial }
function TBanco_Boleto.GetGrupoEspecial : Boolean;
begin
  try
    result := (Self.fieldByName('BNB_GRUPO_ESPECIAL').asInteger=1);
  except
    result := False;
  end;
end;

{ Read method for property IdentificacaoCSP }
function TBanco_Boleto.GetIdentificacaoCSP : String;
begin
  try
    Result := Self.fieldByName('BNB_ID_CSP').asString;
  except
    result:= '';
  end;
end;

{ Read method for property IdentificacaoDistribuicao }
function TBanco_Boleto.GetIdentificacaoDistribuicao : Integer;
begin
  try
    Result := Self.fieldByName('BNB_ID_DISTRIBUICAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property IdentificacaoEmissaoBloqueto }
function TBanco_Boleto.GetIdentificacaoEmissaoBloqueto : Integer;
begin
  try
    Result := Self.fieldByName('BNB_ID_EMISSAO_BLOQUETO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property IdentificacaoMensagem }
function TBanco_Boleto.GetIdentificacaoMensagem : Integer;
begin
  try
    Result := Self.fieldByName('BNB_IDENTIFICACAO_MENSAGEM').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Instrucao1 }
function TBanco_Boleto.GetInstrucao1 : String;
begin
  try
    Result := Self.fieldByName('BNB_INSTRUCAO1').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Instrucao2 }
function TBanco_Boleto.GetInstrucao2 : String;
begin
  try
    Result := Self.fieldByName('BNB_INSTRUCAO2').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Instrucao3 }
function TBanco_Boleto.GetInstrucao3 : String;
begin
  try
    Result := Self.fieldByName('BNB_INSTRUCAO3').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Instrucao4 }
function TBanco_Boleto.GetInstrucao4 : String;
begin
  try
    Result := Self.fieldByName('BNB_INSTRUCAO4').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Instrucao5 }
function TBanco_Boleto.GetInstrucao5 : String;
begin
  try
    Result := Self.fieldByName('BNB_INSTRUCAO5').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Instrucao6 }
function TBanco_Boleto.GetInstrucao6 : String;
begin
  try
    Result := Self.fieldByName('BNB_INSTRUCAO6').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Instrucao7 }
function TBanco_Boleto.GetInstrucao7 : String;
begin
  try
    Result := Self.fieldByName('BNB_INSTRUCAO7').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Instrucao8 }
function TBanco_Boleto.GetInstrucao8 : String;
begin
  try
    Result := Self.fieldByName('BNB_INSTRUCAO8').asString;
  except
    result:= '';
  end;
end;

{ Read method for property JurosDia }
function TBanco_Boleto.GetJurosDia : Double;
begin
  try
    Result := Self.fieldByName('BNB_JUROS_DIA').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Leiaute }
function TBanco_Boleto.GetLeiaute : String;
begin
  try
    Result := Self.fieldByName('BNB_LEIAUTE').asString;
  except
    result:= '';
  end;
end;

{ Read method for property LinhaMensagem }
function TBanco_Boleto.GetLinhaMensagem : Integer;
begin
  try
    Result := Self.fieldByName('BNB_LINHA_MENSAGEM').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property MaquinaBNB }
function TBanco_Boleto.GetMaquinaBNB : Integer;
begin
  try
    Result := Self.fieldByName('BNB_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Mensagem1 }
function TBanco_Boleto.GetMensagem1 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM1').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem10 }
function TBanco_Boleto.GetMensagem10 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM10').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem11 }
function TBanco_Boleto.GetMensagem11 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM11').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem12 }
function TBanco_Boleto.GetMensagem12 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM12').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem13 }
function TBanco_Boleto.GetMensagem13 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM13').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem14 }
function TBanco_Boleto.GetMensagem14 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM14').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem15 }
function TBanco_Boleto.GetMensagem15 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM15').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem16 }
function TBanco_Boleto.GetMensagem16 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM16').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem17 }
function TBanco_Boleto.GetMensagem17 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM17').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem18 }
function TBanco_Boleto.GetMensagem18 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM18').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem2 }
function TBanco_Boleto.GetMensagem2 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM2').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem3 }
function TBanco_Boleto.GetMensagem3 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM3').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem4 }
function TBanco_Boleto.GetMensagem4 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM4').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem5 }
function TBanco_Boleto.GetMensagem5 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM5').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem6 }
function TBanco_Boleto.GetMensagem6 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM6').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem7 }
function TBanco_Boleto.GetMensagem7 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM7').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem8 }
function TBanco_Boleto.GetMensagem8 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM8').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Mensagem9 }
function TBanco_Boleto.GetMensagem9 : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM9').asString;
  except
    result:= '';
  end;
end;

{ Read method for property MensagemImpressa }
function TBanco_Boleto.GetMensagemImpressa : String;
begin
  try
    Result := Self.fieldByName('BNB_MENSAGEM_IMPRESSA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Multa }
function TBanco_Boleto.GetMulta : Double;
begin
  try
    Result := Self.fieldByName('BNB_MULTA').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property NomeBanco }
function TBanco_Boleto.GetNomeBanco : String;
begin
  try
    Result := Self.fieldByName('BNB_NOME_BANCO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property NomeEmpresa }
function TBanco_Boleto.GetNomeEmpresa : String;
begin
  try
    Result := Self.fieldByName('BNB_NOME_EMPRESA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property NumeroAgencia }
function TBanco_Boleto.GetNumeroAgencia : Integer;
begin
  try
    Result := Self.fieldByName('BNB_NUMERO_AGENCIA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property NumeroBanco }
function TBanco_Boleto.GetNumeroBanco : Integer;
begin
  try
    Result := Self.fieldByName('BNB_NUMERO_BANCO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property NumeroConta }
function TBanco_Boleto.GetNumeroConta : Integer;
begin
  try
    Result := Self.fieldByName('BNB_NUMERO_CONTA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property NumeroInscricao }
function TBanco_Boleto.GetNumeroInscricao : String;
begin
  try
    Result := Self.fieldByName('BNB_NUMERO_INSCRICAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property NumeroRemessa }
function TBanco_Boleto.GetNumeroRemessa : Integer;
begin
  try
    Result := Self.fieldByName('BNB_NUMERO_REMESSA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property NumeroRetorno }
function TBanco_Boleto.GetNumeroRetorno : Integer;
begin
  try
    Result := Self.fieldByName('BNB_NUMERO_RETORNO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property OBS }
function TBanco_Boleto.GetOBS : String;
begin
  try
    Result := Self.fieldByName('BNB_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property ReservadoEmpresa }
function TBanco_Boleto.GetReservadoEmpresa : String;
begin
  try
    Result := Self.fieldByName('BNB_RESERVADO_EMPRESA').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Situacao }
function TBanco_Boleto.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('BNB_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property TipoDocumento }
function TBanco_Boleto.GetTipoDocumento : Integer;
begin
  try
    Result := Self.fieldByName('BNB_TIPO_DOCUMENTO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property TipoInscricao }
function TBanco_Boleto.GetTipoInscricao : Integer;
begin
  try
    Result := Self.fieldByName('BNB_TIPO_INSCRICAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Versao }
function TBanco_Boleto.GetVersao : Integer;
begin
  try
    Result := Self.fieldByName('BNB_VERSAO').asInteger;
  except
    result:= 0;
  end;
end;

function TBanco_Boleto.AlterarAuto:Boolean;
var
  CdCNC, CdBNB: integer;
  sAceite, sGrupoEspecial,sMensagemImpressa,sIdentificacaoCSP,sObs,
    sMensagem5,sMensagem6,sMensagem7,sMensagem8,sMensagem9,sMensagem10,sMensagem11,
    sMensagem12,sMensagem13,sMensagem14,sMensagem15,sMensagem16,sMensagem17,
    sMensagem18,sInstrucao1,sInstrucao2,sInstrucao3,sInstrucao4,sInstrucao5,
    sInstrucao6,sInstrucao7,sInstrucao8: string;
  iFormaCadastroTituloBanco,iTipoDocumento,iCodigoJurosMora,iCodigoDesconto1,iCodigoDesconto2,
    iCodigoDesconto3,iLinhaMensagem,iIdentificacaoMensagem,iDiasDesconto1,iDiasDesconto2,
    iDiasDesconto3,iDiasMulta,iCodigoMulta,
    iDiasBaixaDevolucao,iCodigoBaixaDevolucao,iIdentificacaoEmissaoBloqueto,
    iIdentificacaoDistribuicao,iDiasJurosMora,iCodigoProtesto,    
    iFonteMensagem2,iFonteMensagem3,iFonteMensagem4,iFonteMensagem5,iFonteMensagem6,
    iFonteMensagem7,iFonteMensagem8,iFonteMensagem9,iFonteMensagem10,iFonteMensagem11,
    iFonteMensagem12,iFonteMensagem13,iFonteMensagem14,iFonteMensagem15,iFonteMensagem16,
    iFonteMensagem17,iFonteMensagem18,iFonteInstrucao1,iFonteInstrucao2,iFonteInstrucao3,
    iFonteInstrucao4,iFonteInstrucao5,iFonteInstrucao6,iFonteInstrucao7,iFonteInstrucao8: integer;
  vMulta,vDesconto1,vDesconto2,vDesconto3,vJurosDia: Double;    
begin
  Result:=False;
  try
    try
      if EAceite.Checked then
        sAceite := '1'
      else
        sAceite := '0';
    except
      sAceite := '0';
    end;
    try
      if EGrupoEspecial.Checked then
        sGrupoEspecial := '1'
      else
        sGrupoEspecial := '0';
    except
      sGrupoEspecial := '0';
    end;
    
    try
      sMensagemImpressa := EMensagemImpressa.Text;
    except
      sMensagemImpressa := '';
    end;
    try
      sIdentificacaoCSP := EIdentificacaoCSP.Text; 
    except
      sIdentificacaoCSP := '';
    end;    
    try
      iFormaCadastroTituloBanco := EFormaCadastroTituloBanco.ItemIndex;
    except
      iFormaCadastroTituloBanco := 0; 
    end;
    try
      iTipoDocumento := ETipoDocumento.ItemIndex;
    except
      iTipoDocumento := 0;
    end;  
    try
      iCodigoJurosMora := ECodigoJurosMora.ItemIndex;
    except
      iCodigoJurosMora := 0;
    end;      
    try
      iCodigoDesconto1 := ECodigoDesconto1.ItemIndex;
    except
      iCodigoDesconto1 := 0;
    end;
    try
      iDiasDesconto1 := StrToInt(EDiasDesconto1.Text);
    except
      iDiasDesconto1 := 0;
    end;
    try
      vDesconto1 := StrToFloat(EDesconto1.Text);
    except
      vDesconto1 := 0; 
    end;        
    try
      iCodigoDesconto2 := ECodigoDesconto2.ItemIndex;
    except
      iCodigoDesconto2 := 0;
    end;
    try
      iDiasDesconto2 := StrToInt(EDiasDesconto2.Text);
    except
      iDiasDesconto2 := 0;
    end;        
    try
      vDesconto2 := StrToFloat(EDesconto2.Text);
    except
      vDesconto2 := 0; 
    end;    
    try
      iCodigoDesconto3 := ECodigoDesconto3.ItemIndex;      
    except
      iCodigoDesconto3 := 0;
    end;
    try
      iDiasDesconto3 := StrToInt(EDiasDesconto3.Text);
    except
      iDiasDesconto3 := 0;
    end; 
    try
      vDesconto3 := StrToFloat(EDesconto3.Text);
    except
      vDesconto3 := 0; 
    end;           
    try
      sObs := EObs.Text;
    except
      sObs := '';
    end;    
    try
      iLinhaMensagem := StrToInt(ELinhaMensagem.Text);
    except
      iLinhaMensagem := 0;
    end;
    try
      iIdentificacaoMensagem := EIdentificacaoMensagem.ItemIndex;
    except
      iIdentificacaoMensagem := 0; 
    end;
    try
      vMulta := StrToFloat(EMulta.Text)
    except
      vMulta := 0;
    end;
    try
      iDiasMulta := StrToInt(EDiasMulta.Text);
    except
      iDiasMulta := 0;
    end;
    try
      iCodigoMulta := ECodigoMulta.ItemIndex;
    except
      iCodigoMulta := 0; 
    end;
    try
      iDiasBaixaDevolucao := StrToInt(EDiasBaixaDevolucao.Text);
    except
      iDiasBaixaDevolucao := 0;
    end;    
    try
      iCodigoBaixaDevolucao := ECodigoBaixaDevolucao.ItemIndex;
    except
      iCodigoBaixaDevolucao := 0;
    end;                                
    try
      iIdentificacaoEmissaoBloqueto := EIdentificacaoEmissaoBloqueto.ItemIndex;
    except
      iIdentificacaoEmissaoBloqueto := 0;
    end;
    try
      iIdentificacaoDistribuicao := EIdentificacaoDistribuicao.ItemIndex;
    except
      iIdentificacaoDistribuicao := 0;
    end;
    try
      iDiasJurosMora := StrToInt(EDiasJurosMora.Text);
    except
      iDiasJurosMora := 0;
    end;
    try
      vJurosDia := StrToFloat(EJurosDia.Text);
    except
      vJurosDia := 0;
    end;
    try
      iCodigoProtesto := ECodigoProtesto.ItemIndex;
    except
      iCodigoProtesto := 0;
    end;    
    
    try
      sInstrucao1 := EInstrucao1.Text;
    except
      sInstrucao1 := '';
    end;
    try
      iFonteInstrucao1 := EFonteInstrucao1.ItemIndex;
    except
      iFonteInstrucao1 := 0;
    end;
    try
      sInstrucao2 := EInstrucao2.Text;
    except
      sInstrucao2 := '';
    end;
    try
      iFonteInstrucao2 := EFonteInstrucao2.ItemIndex;
    except
      iFonteInstrucao2 := 0;
    end;    
    try
      sInstrucao3 := EInstrucao3.Text;
    except
      sInstrucao3 := '';
    end;
    try
      iFonteInstrucao3 := EFonteInstrucao3.ItemIndex;
    except
      iFonteInstrucao3 := 0;
    end;    
    try
      sInstrucao4 := EInstrucao4.Text;
    except
      sInstrucao4 := '';
    end;
    try
      iFonteInstrucao4 := EFonteInstrucao4.ItemIndex;
    except
      iFonteInstrucao4 := 0;
    end;    
    try
      sInstrucao5 := EInstrucao5.Text;
    except
      sInstrucao5 := '';
    end;
    try
      iFonteInstrucao5 := EFonteInstrucao5.ItemIndex;
    except
      iFonteInstrucao5 := 0;
    end;    
    try    
      sInstrucao6 := EInstrucao6.Text;
    except
      sInstrucao6 := '';
    end;
    try
      iFonteInstrucao6 := EFonteInstrucao6.ItemIndex;
    except
      iFonteInstrucao6 := 0;
    end;    
    try
      sInstrucao7 := EInstrucao7.Text;
    except
      sInstrucao7 := '';
    end;
    try
      iFonteInstrucao7 := EFonteInstrucao7.ItemIndex;
    except
      iFonteInstrucao7 := 0;
    end;    
    try
      sInstrucao8 := EInstrucao8.Text;
    except
      sInstrucao8 := '';
    end;
    try
      iFonteInstrucao8 := EFonteInstrucao8.ItemIndex;
    except
      iFonteInstrucao8 := 0;
    end;
        
    try
      sMensagem5 := EMensagem5.Text;
    except
      sMensagem5 := '';
    end;
    try
      sMensagem6 := EMensagem6.Text;
    except
      sMensagem6 := '';
    end;
    try
      sMensagem7 := EMensagem7.Text;
    except
      sMensagem7 := '';
    end;
    try
      sMensagem8 := EMensagem8.Text;
    except
      sMensagem8 := '';
    end;
    try
      sMensagem9 := EMensagem9.Text;
    except
      sMensagem9 := '';
    end;
    try
      sMensagem10 := EMensagem10.Text;
    except
      sMensagem10 := '';
    end;
    try
      sMensagem11 := EMensagem11.Text;
    except
      sMensagem11 := '';
    end;                
    try
      sMensagem12 := EMensagem12.Text;
    except
      sMensagem12 := '';
    end;                
    try
      sMensagem13 := EMensagem13.Text;
    except
      sMensagem13 := '';
    end;                
    try
      sMensagem14 := EMensagem14.Text;
    except
      sMensagem14 := '';
    end;                
    try
      sMensagem15 := EMensagem15.Text;
    except
      sMensagem15 := '';
    end;                
    try
      sMensagem16 := EMensagem16.Text;
    except
      sMensagem16 := '';
    end;                
    try
      sMensagem17 := EMensagem17.Text;
    except
      sMensagem17 := '';
    end;                
    try
      sMensagem18 := EMensagem18.Text;
    except
      sMensagem18 := '';
    end;    
    
    try
      iFonteMensagem2 := EFonteMensagem2.ItemIndex;
    except
      iFonteMensagem2 := 0;
    end;                                
    try
      iFonteMensagem3 := EFonteMensagem3.ItemIndex;
    except
      iFonteMensagem3 := 0;
    end;
    try
      iFonteMensagem4 := EFonteMensagem4.ItemIndex;
    except
      iFonteMensagem4 := 0;
    end;
    try
      iFonteMensagem5 := EFonteMensagem5.ItemIndex;
    except
      iFonteMensagem5 := 0;
    end;
    try
      iFonteMensagem6 := EFonteMensagem6.ItemIndex;
    except
      iFonteMensagem6 := 0;
    end;
    try
      iFonteMensagem7 := EFonteMensagem7.ItemIndex;
    except
      iFonteMensagem7 := 0;
    end;
    try
      iFonteMensagem8 := EFonteMensagem8.ItemIndex;
    except
      iFonteMensagem8 := 0;
    end;
    try
      iFonteMensagem9 := EFonteMensagem9.ItemIndex;
    except
      iFonteMensagem9 := 0;
    end;
    try
      iFonteMensagem10 := EFonteMensagem10.ItemIndex;
    except
      iFonteMensagem10 := 0;
    end;
    try
      iFonteMensagem11 := EFonteMensagem11.ItemIndex;
    except
      iFonteMensagem11 := 0;
    end;                    
    try
      iFonteMensagem12 := EFonteMensagem12.ItemIndex;
    except
      iFonteMensagem12 := 0;
    end;                    
    try
      iFonteMensagem13 := EFonteMensagem13.ItemIndex;
    except
      iFonteMensagem13 := 0;
    end;                    
    try
      iFonteMensagem14 := EFonteMensagem14.ItemIndex;
    except
      iFonteMensagem14 := 0;
    end;                    
    try
      iFonteMensagem15 := EFonteMensagem15.ItemIndex;
    except
      iFonteMensagem15 := 0;
    end;                    
    try
      iFonteMensagem16 := EFonteMensagem16.ItemIndex;
    except
      iFonteMensagem16 := 0;
    end;                    
    try
      iFonteMensagem17 := EFonteMensagem17.ItemIndex;
    except
      iFonteMensagem17 := 0;
    end;                    
    try
      iFonteMensagem18 := EFonteMensagem18.ItemIndex;
    except
      iFonteMensagem18 := 0;
    end;                                                                                                                                                                        
    
    
    CdCNC := CodigoCNC;
    CdBNB := CodigoBNB;
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE '+Tabela+' SET '+
      ' USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',BNB_MAQUINA='+IntToStr(Maquina)+
      ',BNB_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',BNB_LEIAUTE="'+ELeiaute.Text+'" '+
      ',BNB_TIPO_INSCRICAO='+IntToStr(ETipoInscricao.ItemIndex)+
      ',BNB_NUMERO_INSCRICAO="'+ENumeroInscricao.Text+'" '+
      ',BNB_CODIGO_CONVENIO="'+ECodigoConvenio.Text+'" '+
      ',BNB_NUMERO_BANCO='+ENumeroBanco.Text+
      ',BNB_NUMERO_AGENCIA='+ENumeroAgencia.Text+
      ',BNB_DIGITO_AGENCIA="'+EDigitoAgencia.Text+'" '+
      ',BNB_NUMERO_CONTA='+ENumeroConta.Text+
      ',BNB_DIGITO_CONTA="'+EDigitoConta.Text+'" '+
      ',BNB_DIGITO_AGENCIA_CONTA="'+EDigitoAgenciaConta.Text+'" '+
      ',BNB_NOME_EMPRESA="'+ENomeEmpresa.Text+'" '+
      ',BNB_NOME_BANCO="'+ENomeBanco.Text+'" '+
      ',BNB_VERSAO='+EVersao.Text+
      ',BNB_RESERVADO_EMPRESA="'+EReservadoEmpresa.Text+'" '+
      ',BNB_ID_CSP="'+sIdentificacaoCSP+'" '+
      ',BNB_INSTRUCAO1="'+sInstrucao1+'" '+
      ',BNB_FONTE_INSTRUCAO1='+IntToStr(iFonteInstrucao1)+
      ',BNB_INSTRUCAO2="'+sInstrucao2+'" '+
      ',BNB_FONTE_INSTRUCAO2='+IntToStr(iFonteInstrucao2)+
      ',BNB_INSTRUCAO3="'+sInstrucao3+'" '+
      ',BNB_FONTE_INSTRUCAO3='+IntToStr(iFonteInstrucao3)+      
      ',BNB_INSTRUCAO4="'+sInstrucao4+'" '+
      ',BNB_FONTE_INSTRUCAO4='+IntToStr(iFonteInstrucao4)+      
      ',BNB_INSTRUCAO5="'+sInstrucao5+'" '+
      ',BNB_FONTE_INSTRUCAO5='+IntToStr(iFonteInstrucao5)+      
      ',BNB_INSTRUCAO6="'+sInstrucao6+'" '+
      ',BNB_FONTE_INSTRUCAO6='+IntToStr(iFonteInstrucao6)+      
      ',BNB_INSTRUCAO7="'+sInstrucao7+'" '+
      ',BNB_FONTE_INSTRUCAO7='+IntToStr(iFonteInstrucao7)+      
      ',BNB_INSTRUCAO8="'+sInstrucao8+'" '+
      ',BNB_FONTE_INSTRUCAO8='+IntToStr(iFonteInstrucao8)+                                                
      ',BNB_MENSAGEM1="'+EMensagem1.Text+'" '+
      ',BNB_FONTE_MENSAGEM='+IntToStr(EFonteMensagem.ItemIndex)+      
      ',BNB_MENSAGEM2="'+EMensagem2.Text+'" '+
      ',BNB_FONTE_MENSAGEM2='+IntToStr(iFonteMensagem2)+      
      ',BNB_MENSAGEM3="'+EMensagem3.Text+'" '+
      ',BNB_FONTE_MENSAGEM3='+IntToStr(iFonteMensagem3)+      
      ',BNB_MENSAGEM4="'+EMensagem4.Text+'" '+
      ',BNB_FONTE_MENSAGEM4='+IntToStr(iFonteMensagem4)+      
      ',BNB_MENSAGEM5="'+sMensagem5+'" '+
      ',BNB_FONTE_MENSAGEM5='+IntToStr(iFonteMensagem5)+      
      ',BNB_MENSAGEM6="'+sMensagem6+'" '+
      ',BNB_FONTE_MENSAGEM6='+IntToStr(iFonteMensagem6)+      
      ',BNB_MENSAGEM7="'+sMensagem7+'" '+
      ',BNB_FONTE_MENSAGEM7='+IntToStr(iFonteMensagem7)+      
      ',BNB_MENSAGEM8="'+sMensagem8+'" '+
      ',BNB_FONTE_MENSAGEM8='+IntToStr(iFonteMensagem8)+      
      ',BNB_MENSAGEM9="'+sMensagem9+'" '+
      ',BNB_FONTE_MENSAGEM9='+IntToStr(iFonteMensagem9)+      
      ',BNB_MENSAGEM10="'+sMensagem10+'" '+
      ',BNB_FONTE_MENSAGEM10='+IntToStr(iFonteMensagem10)+      
      ',BNB_MENSAGEM11="'+sMensagem11+'" '+
      ',BNB_FONTE_MENSAGEM11='+IntToStr(iFonteMensagem11)+      
      ',BNB_MENSAGEM12="'+sMensagem12+'" '+
      ',BNB_FONTE_MENSAGEM12='+IntToStr(iFonteMensagem12)+      
      ',BNB_MENSAGEM13="'+sMensagem13+'" '+
      ',BNB_FONTE_MENSAGEM13='+IntToStr(iFonteMensagem13)+      
      ',BNB_MENSAGEM14="'+sMensagem14+'" '+
      ',BNB_FONTE_MENSAGEM14='+IntToStr(iFonteMensagem14)+      
      ',BNB_MENSAGEM15="'+sMensagem15+'" '+
      ',BNB_FONTE_MENSAGEM15='+IntToStr(iFonteMensagem15)+      
      ',BNB_MENSAGEM16="'+sMensagem16+'" '+
      ',BNB_FONTE_MENSAGEM16='+IntToStr(iFonteMensagem16)+      
      ',BNB_MENSAGEM17="'+sMensagem17+'" '+
      ',BNB_FONTE_MENSAGEM17='+IntToStr(iFonteMensagem17)+      
      ',BNB_MENSAGEM18="'+sMensagem18+'" '+
      ',BNB_FONTE_MENSAGEM18='+IntToStr(iFonteMensagem18)+                                                                                          
      ',BNB_NUMERO_REMESSA='+ENumeroRemessa.Text+
      ',BNB_NUMERO_RETORNO='+ENumeroRetorno.Text+
      ',BNB_CODIGO_CARTEIRA='+IntToStr(ECodigoCarteira.ItemIndex)+
      ',BNB_FORMA_CAD_TIT_BANCO='+IntToStr(iFormaCadastroTituloBanco)+
      ',BNB_TIPO_DOCUMENTO='+IntToStr(iTipoDocumento)+
      ',BNB_ID_EMISSAO_BLOQUETO='+IntToStr(iIdentificacaoEmissaoBloqueto)+
      ',BNB_ID_DISTRIBUICAO='+IntToStr(iIdentificacaoDistribuicao)+
      ',BNB_ACEITE='+sAceite+
      ',BNB_GRUPO_ESPECIAL='+sGrupoEspecial+
      ',BNB_CODIGO_JUROS_MORA='+IntToStr(iCodigoJurosMora)+
      ',BNB_DIAS_JUROS_MORA='+IntToStr(iDiasJurosMora)+
      ',BNB_JUROS_DIA='+VirgPonto(vJurosDia)+
      ',BNB_CODIGO_DESCONTO1='+IntToStr(iCodigoDesconto1)+
      ',BNB_DIAS_DESCONTO1='+IntToStr(iDiasDesconto1)+
      ',BNB_DESCONTO1='+VirgPonto(vDesconto1)+
      ',BNB_CODIGO_PROTESTO='+IntToStr(iCodigoProtesto)+
      ',BNB_DIAS_PROTESTO='+EDiasProtesto.Text+
      ',BNB_CODIGO_BAIXA_DEVOLUCAO='+IntToStr(iCodigoBaixaDevolucao)+
      ',BNB_DIAS_BAIXA_DEVOLUCAO='+IntToStr(iDiasBaixaDevolucao)+
      ',BNB_CODIGO_MOEDA='+IntToStr(ECodigoMoeda.ItemIndex)+
      ',BNB_CODIGO_DESCONTO2='+IntToStr(iCodigoDesconto2)+
      ',BNB_DIAS_DESCONTO2='+IntToStr(iDiasDesconto2)+
      ',BNB_DESCONTO2='+VirgPonto(vDesconto2)+
      ',BNB_CODIGO_DESCONTO3='+IntToStr(iCodigoDesconto3)+
      ',BNB_DIAS_DESCONTO3='+IntToStr(iDiasDesconto3)+
      ',BNB_DESCONTO3='+VirgPonto(vDesconto3)+
      ',BNB_CODIGO_MULTA='+IntToStr(iCodigoMulta)+
      ',BNB_DIAS_MULTA='+IntToStr(iDiasMulta)+
      ',BNB_MULTA='+VirgPonto(vMulta)+
      ',BNB_IDENTIFICACAO_MENSAGEM='+IntToStr(iIdentificacaoMensagem)+
      ',BNB_LINHA_MENSAGEM='+IntToStr(iLinhaMensagem)+
      ',BNB_MENSAGEM_IMPRESSA="'+sMensagemImpressa+'" '+
      ',BNB_SITUACAO='+IntToStr(ESituacao.ItemIndex)+
      ',BNB_OBSERVACAO="'+sObs+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND BNB_CODIGO='+IntToStr(CdBNB));

    GeraLog(7770,CdCNC,CdBNB);
    Result := True;
  except
    ShowMessage('Não foi possível alterar o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TBanco_Boleto.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled                       := not Habilitar;
  except
  end;
  try
    ELeiaute.Enabled                      := Habilitar;
  except
  end;
  try
    ETipoInscricao.Enabled                := Habilitar;
  except
  end;
  try
    ENumeroInscricao.Enabled              := Habilitar;
  except
  end;
  try
    ECodigoConvenio.Enabled               := Habilitar;
  except
  end;
  try
    ENumeroBanco.Enabled                  := Habilitar;
  except
  end;
  try
    ENumeroAgencia.Enabled                := Habilitar;
  except
  end;
  try
    EDigitoAgencia.Enabled                := Habilitar;
  except
  end;
  try
    ENumeroConta.Enabled                  := Habilitar;
  except
  end;
  try
    EDigitoConta.Enabled                  := Habilitar;
  except
  end;
  try
    EDigitoAgenciaConta.Enabled           := Habilitar;
  except
  end;
  try
    ENomeEmpresa.Enabled                  := Habilitar;
  except
  end;
  try
    EnomeBanco.Enabled                    := Habilitar;
  except
  end;
  try
    EVersao.Enabled                       := Habilitar;
  except
  end;
  try
    EReservadoEmpresa.Enabled             := Habilitar;
  except
  end;
  try
    EIdentificacaoCSP.Enabled             := Habilitar;
  except
  end;
  try
    EInstrucao1.Enabled                   := Habilitar;
  except
  end;
  try
    EFonteInstrucao1.Enabled              := Habilitar;
  except
  end;  
  try
    EInstrucao2.Enabled                   := Habilitar;
  except
  end;  
  try
    EFonteInstrucao2.Enabled              := Habilitar;
  except
  end;    
  try
    EInstrucao3.Enabled                   := Habilitar;
  except
  end;  
  try
    EFonteInstrucao3.Enabled              := Habilitar;
  except
  end;    
  try
    EInstrucao4.Enabled                   := Habilitar;
  except
  end;  
  try
    EFonteInstrucao4.Enabled              := Habilitar;
  except
  end;    
  try
    EInstrucao5.Enabled                   := Habilitar;
  except
  end;  
  try
    EFonteInstrucao5.Enabled              := Habilitar;
  except
  end;    
  try
    EInstrucao6.Enabled                   := Habilitar;
  except
  end;  
  try
    EFonteInstrucao6.Enabled              := Habilitar;
  except
  end;    
  try
    EInstrucao7.Enabled                   := Habilitar;
  except
  end;  
  try
    EFonteInstrucao7.Enabled              := Habilitar;
  except
  end;    
  try
    EInstrucao8.Enabled                   := Habilitar;
  except
  end;              
  try
    EFonteInstrucao8.Enabled              := Habilitar;
  except
  end;        
  try
    EMensagem1.Enabled                    := Habilitar;
  except
  end;
  try
    EMensagem2.Enabled                    := Habilitar;
  except
  end;
  try
    EMensagem3.Enabled                    := Habilitar;
  except
  end;
  try
    EMensagem4.Enabled                    := Habilitar;
  except
  end;
  try
    EMensagem5.Enabled                    := Habilitar;
  except
  end;
  try
    EMensagem6.Enabled                    := Habilitar;
  except
  end;
  try
    EMensagem7.Enabled                    := Habilitar;
  except
  end;
  try
    EMensagem8.Enabled                    := Habilitar;
  except
  end;
  try
    EMensagem9.Enabled                    := Habilitar;
  except
  end;
  try
    EMensagem10.Enabled                   := Habilitar;
  except
  end;
  try
    EMensagem11.Enabled                   := Habilitar;
  except
  end;
  try
    EMensagem12.Enabled                   := Habilitar;
  except
  end;
  try
    EMensagem13.Enabled                   := Habilitar;
  except
  end;
  try
    EMensagem14.Enabled                   := Habilitar;
  except
  end;
  try
    EMensagem15.Enabled                   := Habilitar;
  except
  end;
  try
    EMensagem16.Enabled                   := Habilitar;
  except
  end;
  try
    EMensagem17.Enabled                   := Habilitar;
  except
  end;
  try
    EMensagem18.Enabled                   := Habilitar;
  except
  end;                            
  try
    ENumeroRemessa.Enabled                := Habilitar;
  except
  end;
  try
    ENumeroRetorno.Enabled                := Habilitar;
  except
  end;
  try
    ECodigoCarteira.Enabled               := Habilitar;
  except
  end;
  try
    EFormaCadastroTituloBanco.Enabled     := Habilitar;
  except
  end;
  try
    ETipoDocumento.Enabled                := Habilitar;
  except
  end;
  try
    EIdentificacaoEmissaoBloqueto.Enabled := Habilitar;
  except
  end;
  try
    EIdentificacaoDistribuicao.Enabled    := Habilitar;
  except
  end;
  try
    EAceite.Enabled                       := Habilitar;
  except
  end;
  try
    EGrupoEspecial.Enabled                := Habilitar;
  except
  end;
  try
    ECodigoJurosMora.Enabled              := Habilitar;
  except
  end;
  try
    EDiasJurosMora.Enabled                := Habilitar;
  except
  end;
  try
    EJurosDia.Enabled                     := Habilitar;
  except
  end;
  try
    ECodigoDesconto1.Enabled              := Habilitar;
  except
  end;
  try
    EDiasDesconto1.Enabled                := Habilitar;
  except
  end;
  try
    EDesconto1.Enabled                    := Habilitar;
  except
  end;
  try
    ECodigoProtesto.Enabled               := Habilitar;
  except
  end;
  try
    EDiasProtesto.Enabled                 := Habilitar;
  except
  end;
  try
    ECodigoBaixaDevolucao.Enabled         := Habilitar;
  except
  end;
  try
    EDiasBaixaDevolucao.Enabled           := Habilitar;
  except
  end;
  try
    ECodigoMoeda.Enabled                  := Habilitar;
  except
  end;
  try
    ECodigoDesconto2.Enabled              := Habilitar;
  except
  end;
  try
    EDiasDesconto2.Enabled                := Habilitar;
  except
  end;
  try
    EDesconto2.Enabled                    := Habilitar;
  except
  end;
  try
    ECodigoDesconto3.Enabled              := Habilitar;
  except
  end;
  try
    EDiasDesconto3.Enabled                := Habilitar;
  except
  end;
  try
    EDesconto3.Enabled                    := Habilitar;
  except
  end;
  try
    ECodigoMulta.Enabled                  := Habilitar;
  except
  end;
  try
    EDiasMulta.Enabled                    := Habilitar;
  except
  end;
  try
    EMulta.Enabled                        := Habilitar;
  except
  end;
  try
    EIdentificacaoMensagem.Enabled        := Habilitar;
  except
  end;
  try
    ELinhaMensagem.Enabled                := Habilitar;
  except
  end;
  try
    EMensagemimpressa.Enabled             := Habilitar;
  except
  end;
  try
    EFonteMensagem.Enabled                := Habilitar;
  except
  end;
  try
    EFonteMensagem2.Enabled               := Habilitar;
  except
  end;
  try
    EFonteMensagem3.Enabled               := Habilitar;
  except
  end;  
  try
    EFonteMensagem4.Enabled               := Habilitar;
  except
  end;  
  try
    EFonteMensagem5.Enabled               := Habilitar;
  except
  end;  
  try
    EFonteMensagem6.Enabled               := Habilitar;
  except
  end;  
  try
    EFonteMensagem7.Enabled               := Habilitar;
  except
  end;  
  try
    EFonteMensagem8.Enabled               := Habilitar;
  except
  end;  
  try
    EFonteMensagem9.Enabled               := Habilitar;
  except
  end;  
  try
    EFonteMensagem10.Enabled              := Habilitar;
  except
  end;
  try
    EFonteMensagem11.Enabled              := Habilitar;
  except
  end;
  try
    EFonteMensagem12.Enabled              := Habilitar;
  except
  end;
  try
    EFonteMensagem13.Enabled              := Habilitar;
  except
  end;
  try
    EFonteMensagem14.Enabled              := Habilitar;
  except
  end;
  try
    EFonteMensagem15.Enabled              := Habilitar;
  except
  end;
  try
    EFonteMensagem16.Enabled              := Habilitar;
  except
  end;
  try
    EFonteMensagem17.Enabled              := Habilitar;
  except
  end;
  try
    EFonteMensagem18.Enabled              := Habilitar;
  except
  end;                                    
  try
    ESituacao.Enabled                     := Habilitar;
  except
  end;
  try
    EOBS.Enabled                          := Habilitar;
  except
  end;
end;

procedure TBanco_Boleto.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if isEmpty then
    LimpaCampos
  else
    CarregaDados;
end;

procedure TBanco_Boleto.CarregaDados;
begin
  Try
    ECodigoBNB.Text                       := IntToStr(CodigoBNB);
  except
  end;
  try
    if DataCadastro > 0 then
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM',DataCadastro)
    else
      EDataCadastro.Clear;
  except
  end;
  try
    if DataAlterado > 0 then
      EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',DataAlterado)
    else
      EDataAlterado.Clear;
  except
  end;
  try
    ELeiaute.Text                         := Leiaute;
  except
  end;
  try
    ETipoInscricao.ItemIndex              := TipoInscricao;
  except
  end;
  try
    ENumeroInscricao.Text                 := NumeroInscricao;
  except
  end;
  try
    ECodigoConvenio.Text                  := CodigoConvenio;
  except
  end;
  try
    ENumeroBanco.Text                     := IntToStr(NumeroBanco);
  except
  end;
  try
    ENumeroAgencia.Text                   := IntToStr(NumeroAgencia);
  except
  end;
  try
    EDigitoAgencia.Text                   := DigitoAgencia;
  except
  end;
  try
    ENumeroConta.Text                  := IntToStr(NumeroConta);
  except
  end;
  try
    EDigitoConta.Text                  := DigitoConta;
  except
  end;
  try
    EDigitoAgenciaConta.Text           := DigitoAgenciaConta;
  except
  end;
  try
    ENomeEmpresa.text                  := NomeEmpresa;
  except
  end;
  try
    ENomeBanco.Text                    := NomeBanco;
  except
  end;
  try
    EVersao.Text                       := IntToStr(Versao);
  except
  end;
  try
    EReservadoEmpresa.Text             := ReservadoEmpresa;
  except
  end;
  try
    EIdentificacaoCSP.Text             := IdentificacaoCSP;
  except
  end;
  try
    EInstrucao1.Text                   := Instrucao1;
  except
  end;
  try
    EFonteInstrucao1.ItemIndex         := FonteInstrucao1;
  except
  end;  
  try
    EInstrucao2.Text                   := Instrucao2;
  except
  end;
  try
    EFonteInstrucao2.ItemIndex         := FonteInstrucao2;
  except
  end;    
  try
    EInstrucao3.Text                   := Instrucao3;
  except
  end;
  try
    EFonteInstrucao3.ItemIndex         := FonteInstrucao3;
  except
  end;    
  try
    EInstrucao4.Text                   := Instrucao4;
  except
  end;
  try
    EFonteInstrucao4.ItemIndex         := FonteInstrucao4;
  except
  end;    
  try
    EInstrucao5.Text                   := Instrucao5;
  except
  end;
  try
    EFonteInstrucao5.ItemIndex         := FonteInstrucao5;
  except
  end;    
  try
    EInstrucao6.Text                   := Instrucao6;
  except
  end;
  try
    EFonteInstrucao6.ItemIndex         := FonteInstrucao6;
  except
  end;    
  try
    EInstrucao7.Text                   := Instrucao7;
  except
  end;
  try
    EFonteInstrucao7.ItemIndex         := FonteInstrucao7;
  except
  end;    
  try
    EInstrucao8.Text                   := Instrucao8;
  except
  end;
  try
    EFonteInstrucao8.ItemIndex         := FonteInstrucao8;
  except
  end;                    
  try
    EMensagem1.Text                    := Mensagem1;
  except
  end;
  try
    EMensagem2.Text                    := Mensagem2;
  except
  end;
  try
    EMensagem3.Text                    := Mensagem3;
  except
  end;
  try
    EMensagem4.Text                    := Mensagem4;
  except
  end;
  try
    EMensagem5.Text                    := Mensagem5;
  except
  end;
  try
    EMensagem6.Text                    := Mensagem6;
  except
  end;
  try
    EMensagem7.Text                    := Mensagem7;
  except
  end;
  try
    EMensagem8.Text                    := Mensagem8;
  except
  end;
  try
    EMensagem9.Text                    := Mensagem9;
  except
  end;
  try
    EMensagem10.Text                    := Mensagem10;
  except
  end;
  try
    EMensagem11.Text                    := Mensagem11;
  except
  end;
  try
    EMensagem12.Text                    := Mensagem12;
  except
  end;
  try
    EMensagem13.Text                    := Mensagem13;
  except
  end;
  try
    EMensagem14.Text                    := Mensagem14;
  except
  end;
  try
    EMensagem15.Text                    := Mensagem15;
  except
  end;
  try
    EMensagem16.Text                    := Mensagem16;
  except
  end;
  try
    EMensagem17.Text                    := Mensagem17;
  except
  end;
  try
    EMensagem18.Text                    := Mensagem18;
  except
  end;
  try
    ENumeroRemessa.Text                := IntToStr(NumeroRemessa);
  except
  end;
  try
    ENumeroRetorno.Text                := IntToStr(NumeroRetorno);
  except
  end;
  try
    ECodigoCarteira.ItemIndex          := CodigoCarteira;
  except
  end;
  try
    EFormaCadastroTituloBanco.ItemIndex     := FormaCadastroTituloBanco;
  except
  end;
  try
    ETipoDocumento.ItemIndex                := TipoDocumento;
  except
  end;
  try
    EIdentificacaoEmissaoBloqueto.ItemIndex := IdentificacaoEmissaoBloqueto;
  except
  end;
  try
    EIdentificacaoDistribuicao.ItemIndex    := IdentificacaoDistribuicao;
  except
  end;
  try
    EAceite.Checked                         := Aceite;
  except
  end;
  try
    EGrupoEspecial.Checked                  := GrupoEspecial;
  except
  end;
  try
    ECodigoJurosMora.ItemIndex              := CodigoJurosMora;
  except
  end;
  try
    EDiasJurosMora.Text                     := IntToStr(DiasJurosMora);
  except
  end;
  try
    EJurosDia.Text                          := format('%.2f',[JurosDia]);
  except
  end;
  try
    ECodigoDesconto1.ItemIndex              := CodigoDesconto1;
  except
  end;
  try
    EDiasDesconto1.Text                     := IntToStr(DiasDesconto1);
  except
  end;
  try
    EDesconto1.Text                         := format('%.2f',[Desconto1]);
  except
  end;
  try
    ECodigoProtesto.ItemIndex               := CodigoProtesto;
  except
  end;
  try
    EDiasProtesto.Text                      := IntToStr(DiasProtesto);
  except
  end;
  try
    ECodigoBaixaDevolucao.ItemIndex         := CodigoBaixaDevolucao;
  except
  end;
  try
    EDiasBaixaDevolucao.Text                := IntToStr(DiasBaixaDevolucao);
  except
  end;
  try
    ECodigoMoeda.ItemIndex                  := CodigoMoeda;
  except
  end;
  try
    ECodigoDesconto2.ItemIndex              := CodigoDesconto2;
  except
  end;
  try
    EDiasDesconto2.Text                     := IntToStr(DiasDesconto2);
  except
  end;
  try
    EDesconto2.Text                         := format('%.2f',[Desconto2]);
  except
  end;
  try
    ECodigoDesconto3.ItemIndex              := CodigoDesconto3;
  except
  end;
  try
    EDiasDesconto3.Text                     := IntToStr(DiasDesconto3);
  except
  end;
  try
    EDesconto3.Text                         := format('%.2f',[Desconto3]);
  except
  end;
  try
    ECodigoMulta.ItemIndex                  := CodigoMulta;
  except
  end;
  try
    EDiasMulta.Text                         := IntToStr(DiasMulta);
  except
  end;
  try
    EMulta.Text                             := format('%.2f',[Multa]);
  except
  end;
  try
    EIdentificacaoMensagem.ItemIndex        := IdentificacaoMensagem;
  except
  end;
  try
    ELinhaMensagem.Text                     := IntToStr(LinhaMensagem);
  except
  end;
  try
    EMensagemimpressa.Text                  := Mensagemimpressa;
  except
  end;
  try
    EFonteMensagem.ItemIndex                := FonteMensagem;
  except
  end;
  try
    EFonteMensagem2.ItemIndex                := FonteMensagem2;
  except
  end;  
  try
    EFonteMensagem3.ItemIndex                := FonteMensagem3;
  except
  end;
  try
    EFonteMensagem4.ItemIndex                := FonteMensagem4;
  except
  end;
  try
    EFonteMensagem5.ItemIndex                := FonteMensagem5;
  except
  end;
  try
    EFonteMensagem6.ItemIndex                := FonteMensagem6;
  except
  end;
  try
    EFonteMensagem7.ItemIndex                := FonteMensagem7;
  except
  end;
  try
    EFonteMensagem8.ItemIndex                := FonteMensagem8;
  except
  end;
  try
    EFonteMensagem9.ItemIndex                := FonteMensagem9;
  except
  end;
  try
    EFonteMensagem10.ItemIndex                := FonteMensagem10;
  except
  end;
  try
    EFonteMensagem11.ItemIndex                := FonteMensagem11;
  except
  end;  
  try
    EFonteMensagem12.ItemIndex                := FonteMensagem12;
  except
  end;  
  try
    EFonteMensagem13.ItemIndex                := FonteMensagem13;
  except
  end;  
  try
    EFonteMensagem14.ItemIndex                := FonteMensagem14;
  except
  end;  
  try
    EFonteMensagem15.ItemIndex                := FonteMensagem15;
  except
  end;  
  try
    EFonteMensagem16.ItemIndex                := FonteMensagem16;
  except
  end;  
  try
    EFonteMensagem17.ItemIndex                := FonteMensagem17;
  except
  end;  
  try
    EFonteMensagem18.ItemIndex                := FonteMensagem18;
  except
  end;                                    
  try
    ESituacao.ItemIndex                     := Situacao;
  except
  end;
  try
    EOBS.Text                               :=OBS;
  except
  end;
end;

constructor TBanco_Boleto.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'BANCO_BOLETO';

     { Code to perform other tasks when the component is created }

end;

destructor TBanco_Boleto.Destroy;
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

function TBanco_Boleto.FinalizaEdicao:Boolean;
var
  cod:Integer;
  Aux:TDataSetNotifyEvent;
  mensagem:string;
begin
  Result := False;
  mensagem := '';
  if Trim(ENomeEmpresa.Text) = '' then
    mensagem := mensagem + 'Nome da Empresa inválido!'+#13;
  if Trim(ENomeBanco.Text) = '' then
    mensagem := mensagem + 'Nome do Banco inválido!'+#13;
  if not VerificaInteiroBranco(EVersao.text) then
    mensagem := mensagem + 'Versão inválida!'+#13;
  if not VerificaInteiroBranco(ENumeroBanco.text) then
    mensagem := mensagem + 'Número do Banco inválido!'+#13;
  if not VerificaInteiroBranco(ENumeroAgencia.text) then
    mensagem := mensagem + 'Número do Agencia inválido!'+#13;
  if not VerificaInteiroBranco(ENumeroConta.text) then
    mensagem := mensagem + 'Número da Conta inválido!'+#13;
  If mensagem <> '' then
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
        LocalizarCod(SCodigo);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End
    Else If Estado=2 then
    Begin
      cod:=codigoBNB;
      If Alterarauto then
      Begin
        Result := True;
        close;
        open;
        LocalizarCod(cod);
        Estado:=0;
        AtualizaControles(False);
        CarregaDados;
      end;
    End;
    AfterScroll:=Aux;
  end;
end;

function TBanco_Boleto.InserirAuto:Boolean;
var
  CdCNC, CdBNB: integer;
  sAceite, sGrupoEspecial,sMensagemImpressa,sIdentificacaoCSP,sObs,
    sMensagem5,sMensagem6,sMensagem7,sMensagem8,sMensagem9,sMensagem10,sMensagem11,
    sMensagem12,sMensagem13,sMensagem14,sMensagem15,sMensagem16,sMensagem17,
    sMensagem18,sInstrucao1,sInstrucao2,sInstrucao3,sInstrucao4,sInstrucao5,
    sInstrucao6,sInstrucao7,sInstrucao8: string;
  iFormaCadastroTituloBanco,iTipoDocumento,iCodigoJurosMora,iCodigoDesconto1,iCodigoDesconto2,
    iCodigoDesconto3,iLinhaMensagem,iIdentificacaoMensagem,iDiasDesconto1,iDiasDesconto2,
    iDiasDesconto3,iDiasMulta,iCodigoMulta,
    iDiasBaixaDevolucao,iCodigoBaixaDevolucao,iIdentificacaoEmissaoBloqueto,
    iIdentificacaoDistribuicao,iDiasJurosMora,iCodigoProtesto,
    iFonteMensagem2,iFonteMensagem3,iFonteMensagem4,iFonteMensagem5,iFonteMensagem6,
    iFonteMensagem7,iFonteMensagem8,iFonteMensagem9,iFonteMensagem10,iFonteMensagem11,
    iFonteMensagem12,iFonteMensagem13,iFonteMensagem14,iFonteMensagem15,iFonteMensagem16,
    iFonteMensagem17,iFonteMensagem18,iFonteInstrucao1,iFonteInstrucao2,iFonteInstrucao3,
    iFonteInstrucao4,iFonteInstrucao5,iFonteInstrucao6,iFonteInstrucao7,iFonteInstrucao8: integer;
  vMulta,vDesconto1,vDesconto2,vDesconto3,vJurosDia: Double;
begin
  Result:=False;
  try
    try
      if EAceite.Checked then
        sAceite := '1'
      else
        sAceite := '0';
    except
      sAceite := '0';
    end;
    try
      if EGrupoEspecial.Checked then
        sGrupoEspecial := '1'
      else
        sGrupoEspecial := '0';
    except
      sGrupoEspecial := '0';
    end;
    
    try
      sMensagemImpressa := EMensagemImpressa.Text;
    except
      sMensagemImpressa := '';
    end;
    try
      sIdentificacaoCSP := EIdentificacaoCSP.Text; 
    except
      sIdentificacaoCSP := '';
    end;    
    try
      iFormaCadastroTituloBanco := EFormaCadastroTituloBanco.ItemIndex;
    except
      iFormaCadastroTituloBanco := 0; 
    end;
    try
      iTipoDocumento := ETipoDocumento.ItemIndex;
    except
      iTipoDocumento := 0;
    end;  
    try
      iCodigoJurosMora := ECodigoJurosMora.ItemIndex;
    except
      iCodigoJurosMora := 0;
    end;      
    try
      iCodigoDesconto1 := ECodigoDesconto1.ItemIndex;
    except
      iCodigoDesconto1 := 0;
    end;
    try
      iDiasDesconto1 := StrToInt(EDiasDesconto1.Text);
    except
      iDiasDesconto1 := 0;
    end;
    try
      vDesconto1 := StrToFloat(EDesconto1.Text);
    except
      vDesconto1 := 0; 
    end;        
    try
      iCodigoDesconto2 := ECodigoDesconto2.ItemIndex;
    except
      iCodigoDesconto2 := 0;
    end;
    try
      iDiasDesconto2 := StrToInt(EDiasDesconto2.Text);
    except
      iDiasDesconto2 := 0;
    end;        
    try
      vDesconto2 := StrToFloat(EDesconto2.Text);
    except
      vDesconto2 := 0; 
    end;    
    try
      iCodigoDesconto3 := ECodigoDesconto3.ItemIndex;      
    except
      iCodigoDesconto3 := 0;
    end;
    try
      iDiasDesconto3 := StrToInt(EDiasDesconto3.Text);
    except
      iDiasDesconto3 := 0;
    end; 
    try
      vDesconto3 := StrToFloat(EDesconto3.Text);
    except
      vDesconto3 := 0; 
    end;           
    try
      sObs := EObs.Text;
    except
      sObs := '';
    end;    
    try
      iLinhaMensagem := StrToInt(ELinhaMensagem.Text);
    except
      iLinhaMensagem := 0;
    end;
    try
      iIdentificacaoMensagem := EIdentificacaoMensagem.ItemIndex;
    except
      iIdentificacaoMensagem := 0; 
    end;
    try
      vMulta := StrToFloat(EMulta.Text)
    except
      vMulta := 0;
    end;
    try
      iDiasMulta := StrToInt(EDiasMulta.Text);
    except
      iDiasMulta := 0;
    end;
    try
      iCodigoMulta := ECodigoMulta.ItemIndex;
    except
      iCodigoMulta := 0; 
    end;
    try
      iDiasBaixaDevolucao := StrToInt(EDiasBaixaDevolucao.Text);
    except
      iDiasBaixaDevolucao := 0;
    end;    
    try
      iCodigoBaixaDevolucao := ECodigoBaixaDevolucao.ItemIndex;
    except
      iCodigoBaixaDevolucao := 0;
    end;                                
    try
      iIdentificacaoEmissaoBloqueto := EIdentificacaoEmissaoBloqueto.ItemIndex;
    except
      iIdentificacaoEmissaoBloqueto := 0;
    end;
    try
      iIdentificacaoDistribuicao := EIdentificacaoDistribuicao.ItemIndex;
    except
      iIdentificacaoDistribuicao := 0;
    end;
    try
      iDiasJurosMora := StrToInt(EDiasJurosMora.Text);
    except
      iDiasJurosMora := 0;
    end;
    try
      vJurosDia := StrToFloat(EJurosDia.Text);
    except
      vJurosDia := 0;
    end;
    try
      iCodigoProtesto := ECodigoProtesto.ItemIndex;
    except
      iCodigoProtesto := 0;
    end;
    
    try
      sInstrucao1 := EInstrucao1.Text;
    except
      sInstrucao1 := '';
    end;
    try
      iFonteInstrucao1 := EFonteInstrucao1.ItemIndex;
    except
      iFonteInstrucao1 := 0;
    end;
    try
      sInstrucao2 := EInstrucao2.Text;
    except
      sInstrucao2 := '';
    end;
    try
      iFonteInstrucao2 := EFonteInstrucao2.ItemIndex;
    except
      iFonteInstrucao2 := 0;
    end;    
    try
      sInstrucao3 := EInstrucao3.Text;
    except
      sInstrucao3 := '';
    end;
    try
      iFonteInstrucao3 := EFonteInstrucao3.ItemIndex;
    except
      iFonteInstrucao3 := 0;
    end;    
    try
      sInstrucao4 := EInstrucao4.Text;
    except
      sInstrucao4 := '';
    end;
    try
      iFonteInstrucao4 := EFonteInstrucao4.ItemIndex;
    except
      iFonteInstrucao4 := 0;
    end;    
    try
      sInstrucao5 := EInstrucao5.Text;
    except
      sInstrucao5 := '';
    end;
    try
      iFonteInstrucao5 := EFonteInstrucao5.ItemIndex;
    except
      iFonteInstrucao5 := 0;
    end;    
    try    
      sInstrucao6 := EInstrucao6.Text;
    except
      sInstrucao6 := '';
    end;
    try
      iFonteInstrucao6 := EFonteInstrucao6.ItemIndex;
    except
      iFonteInstrucao6 := 0;
    end;    
    try
      sInstrucao7 := EInstrucao7.Text;
    except
      sInstrucao7 := '';
    end;
    try
      iFonteInstrucao7 := EFonteInstrucao7.ItemIndex;
    except
      iFonteInstrucao7 := 0;
    end;    
    try
      sInstrucao8 := EInstrucao8.Text;
    except
      sInstrucao8 := '';
    end;
    try
      iFonteInstrucao8 := EFonteInstrucao8.ItemIndex;
    except
      iFonteInstrucao8 := 0;
    end;
        
    try
      sMensagem5 := EMensagem5.Text;
    except
      sMensagem5 := '';
    end;
    try
      sMensagem6 := EMensagem6.Text;
    except
      sMensagem6 := '';
    end;
    try
      sMensagem7 := EMensagem7.Text;
    except
      sMensagem7 := '';
    end;
    try
      sMensagem8 := EMensagem8.Text;
    except
      sMensagem8 := '';
    end;
    try
      sMensagem9 := EMensagem9.Text;
    except
      sMensagem9 := '';
    end;
    try
      sMensagem10 := EMensagem10.Text;
    except
      sMensagem10 := '';
    end;
    try
      sMensagem11 := EMensagem11.Text;
    except
      sMensagem11 := '';
    end;                
    try
      sMensagem12 := EMensagem12.Text;
    except
      sMensagem12 := '';
    end;                
    try
      sMensagem13 := EMensagem13.Text;
    except
      sMensagem13 := '';
    end;                
    try
      sMensagem14 := EMensagem14.Text;
    except
      sMensagem14 := '';
    end;                
    try
      sMensagem15 := EMensagem15.Text;
    except
      sMensagem15 := '';
    end;                
    try
      sMensagem16 := EMensagem16.Text;
    except
      sMensagem16 := '';
    end;                
    try
      sMensagem17 := EMensagem17.Text;
    except
      sMensagem17 := '';
    end;                
    try
      sMensagem18 := EMensagem18.Text;
    except
      sMensagem18 := '';
    end;
    
    try
      iFonteMensagem2 := EFonteMensagem2.ItemIndex;
    except
      iFonteMensagem2 := 0;
    end;                                
    try
      iFonteMensagem3 := EFonteMensagem3.ItemIndex;
    except
      iFonteMensagem3 := 0;
    end;
    try
      iFonteMensagem4 := EFonteMensagem4.ItemIndex;
    except
      iFonteMensagem4 := 0;
    end;
    try
      iFonteMensagem5 := EFonteMensagem5.ItemIndex;
    except
      iFonteMensagem5 := 0;
    end;
    try
      iFonteMensagem6 := EFonteMensagem6.ItemIndex;
    except
      iFonteMensagem6 := 0;
    end;
    try
      iFonteMensagem7 := EFonteMensagem7.ItemIndex;
    except
      iFonteMensagem7 := 0;
    end;
    try
      iFonteMensagem8 := EFonteMensagem8.ItemIndex;
    except
      iFonteMensagem8 := 0;
    end;
    try
      iFonteMensagem9 := EFonteMensagem9.ItemIndex;
    except
      iFonteMensagem9 := 0;
    end;
    try
      iFonteMensagem10 := EFonteMensagem10.ItemIndex;
    except
      iFonteMensagem10 := 0;
    end;
    try
      iFonteMensagem11 := EFonteMensagem11.ItemIndex;
    except
      iFonteMensagem11 := 0;
    end;                    
    try
      iFonteMensagem12 := EFonteMensagem12.ItemIndex;
    except
      iFonteMensagem12 := 0;
    end;                    
    try
      iFonteMensagem13 := EFonteMensagem13.ItemIndex;
    except
      iFonteMensagem13 := 0;
    end;                    
    try
      iFonteMensagem14 := EFonteMensagem14.ItemIndex;
    except
      iFonteMensagem14 := 0;
    end;                    
    try
      iFonteMensagem15 := EFonteMensagem15.ItemIndex;
    except
      iFonteMensagem15 := 0;
    end;                    
    try
      iFonteMensagem16 := EFonteMensagem16.ItemIndex;
    except
      iFonteMensagem16 := 0;
    end;                    
    try
      iFonteMensagem17 := EFonteMensagem17.ItemIndex;
    except
      iFonteMensagem17 := 0;
    end;                    
    try
      iFonteMensagem18 := EFonteMensagem18.ItemIndex;
    except
      iFonteMensagem18 := 0;
    end;                                                                                                                                                      
    
    
    CdCNC := CConfiguracao.CodigoCNC;
    CdBNB := sCodigo;
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT '+Tabela+
      '(CNC_CODIGO,BNB_CODIGO,USU_CODIGO,BNB_MAQUINA,BNB_DT_CADASTRO '+
      ',BNB_LEIAUTE,BNB_TIPO_INSCRICAO,BNB_NUMERO_INSCRICAO'+
      ',BNB_CODIGO_CONVENIO,BNB_NUMERO_BANCO,BNB_NUMERO_AGENCIA'+
      ',BNB_DIGITO_AGENCIA,BNB_NUMERO_CONTA,BNB_DIGITO_CONTA'+
      ',BNB_DIGITO_AGENCIA_CONTA,BNB_NOME_EMPRESA,BNB_NOME_BANCO,BNB_VERSAO'+
      ',BNB_RESERVADO_EMPRESA,BNB_ID_CSP '+
      ',BNB_INSTRUCAO1,BNB_FONTE_INSTRUCAO1,BNB_INSTRUCAO2,BNB_FONTE_INSTRUCAO2 '+
      ',BNB_INSTRUCAO3,BNB_FONTE_INSTRUCAO3,BNB_INSTRUCAO4,BNB_FONTE_INSTRUCAO4 '+
      ',BNB_INSTRUCAO5,BNB_FONTE_INSTRUCAO5,BNB_INSTRUCAO6,BNB_FONTE_INSTRUCAO6 '+
      ',BNB_INSTRUCAO7,BNB_FONTE_INSTRUCAO7,BNB_INSTRUCAO8,BNB_FONTE_INSTRUCAO8 '+      
      ',BNB_MENSAGEM1,BNB_MENSAGEM2,BNB_MENSAGEM3,BNB_MENSAGEM4,BNB_MENSAGEM5 '+
      ',BNB_MENSAGEM6,BNB_MENSAGEM7,BNB_MENSAGEM8,BNB_MENSAGEM9,BNB_MENSAGEM10 '+
      ',BNB_MENSAGEM11,BNB_MENSAGEM12,BNB_MENSAGEM13,BNB_MENSAGEM14,BNB_MENSAGEM15 '+
      ',BNB_MENSAGEM16,BNB_MENSAGEM17,BNB_MENSAGEM18 '+            
      ',BNB_NUMERO_REMESSA'+
      ',BNB_NUMERO_RETORNO,BNB_CODIGO_CARTEIRA,BNB_FORMA_CAD_TIT_BANCO'+
      ',BNB_TIPO_DOCUMENTO,BNB_ID_EMISSAO_BLOQUETO'+
      ',BNB_ID_DISTRIBUICAO,BNB_ACEITE,BNB_GRUPO_ESPECIAL,BNB_CODIGO_JUROS_MORA'+
      ',BNB_DIAS_JUROS_MORA,BNB_JUROS_DIA,BNB_CODIGO_DESCONTO1'+
      ',BNB_DIAS_DESCONTO1,BNB_DESCONTO1,BNB_CODIGO_PROTESTO,BNB_DIAS_PROTESTO'+
      ',BNB_CODIGO_BAIXA_DEVOLUCAO,BNB_DIAS_BAIXA_DEVOLUCAO,BNB_CODIGO_MOEDA'+
      ',BNB_CODIGO_DESCONTO2,BNB_DIAS_DESCONTO2,BNB_DESCONTO2'+
      ',BNB_CODIGO_DESCONTO3,BNB_DIAS_DESCONTO3,BNB_DESCONTO3,BNB_CODIGO_MULTA'+
      ',BNB_DIAS_MULTA,BNB_MULTA,BNB_IDENTIFICACAO_MENSAGEM,BNB_LINHA_MENSAGEM'+
      ',BNB_MENSAGEM_IMPRESSA '+
      ',BNB_FONTE_MENSAGEM,BNB_FONTE_MENSAGEM2,BNB_FONTE_MENSAGEM3,BNB_FONTE_MENSAGEM4 '+
      ',BNB_FONTE_MENSAGEM5,BNB_FONTE_MENSAGEM6,BNB_FONTE_MENSAGEM7,BNB_FONTE_MENSAGEM8 '+
      ',BNB_FONTE_MENSAGEM9,BNB_FONTE_MENSAGEM10,BNB_FONTE_MENSAGEM11,BNB_FONTE_MENSAGEM12 '+
      ',BNB_FONTE_MENSAGEM13,BNB_FONTE_MENSAGEM14,BNB_FONTE_MENSAGEM15,BNB_FONTE_MENSAGEM16 '+
      ',BNB_FONTE_MENSAGEM17,BNB_FONTE_MENSAGEM18 '+
      ',BNB_SITUACAO,BNB_OBSERVACAO) VALUES '+
      '( '+IntToStr(CdCNC)+
      ', '+IntToStr(CdBNB)+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ', '+IntToStr(Maquina)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',"'+ELeiaute.Text+'" '+
      ', '+IntToStr(ETipoInscricao.ItemIndex)+
      ',"'+ENumeroInscricao.Text+'" '+
      ',"'+ECodigoConvenio.Text+'" '+
      ', '+ENumeroBanco.Text+
      ', '+ENumeroAgencia.Text+
      ',"'+EDigitoAgencia.Text+'" '+
      ', '+ENumeroConta.Text+
      ',"'+EDigitoConta.Text+'" '+
      ',"'+EDigitoAgenciaConta.Text+'" '+
      ',"'+ENomeEmpresa.Text+'" '+
      ',"'+ENomeBanco.Text+'" '+
      ', '+EVersao.Text+
      ',"'+EReservadoEmpresa.Text+'" '+
      ',"'+sIdentificacaoCSP+'" '+
      ',"'+sInstrucao1+'" '+
      ', '+IntToStr(iFonteInstrucao1)+
      ',"'+sInstrucao2+'" '+
      ', '+IntToStr(iFonteInstrucao2)+      
      ',"'+sInstrucao3+'" '+
      ', '+IntToStr(iFonteInstrucao3)+      
      ',"'+sInstrucao4+'" '+
      ', '+IntToStr(iFonteInstrucao4)+      
      ',"'+sInstrucao5+'" '+
      ', '+IntToStr(iFonteInstrucao5)+      
      ',"'+sInstrucao6+'" '+
      ', '+IntToStr(iFonteInstrucao6)+      
      ',"'+sInstrucao7+'" '+
      ', '+IntToStr(iFonteInstrucao7)+      
      ',"'+sInstrucao8+'" '+
      ', '+IntToStr(iFonteInstrucao8)+                                                
      ',"'+EMensagem1.Text+'" '+
      ',"'+EMensagem2.Text+'" '+
      ',"'+EMensagem3.Text+'" '+
      ',"'+EMensagem4.Text+'" '+
      ',"'+sMensagem5+'" '+
      ',"'+sMensagem6+'" '+
      ',"'+sMensagem7+'" '+
      ',"'+sMensagem8+'" '+
      ',"'+sMensagem9+'" '+
      ',"'+sMensagem10+'" '+
      ',"'+sMensagem11+'" '+
      ',"'+sMensagem12+'" '+
      ',"'+sMensagem13+'" '+
      ',"'+sMensagem14+'" '+
      ',"'+sMensagem15+'" '+
      ',"'+sMensagem16+'" '+
      ',"'+sMensagem17+'" '+
      ',"'+sMensagem18+'" '+                                                                                    
      ', '+ENumeroRemessa.Text+
      ', '+ENumeroRetorno.Text+
      ', '+IntToStr(ECodigoCarteira.ItemIndex)+
      ', '+IntToStr(iFormaCadastroTituloBanco)+
      ', '+IntToStr(iTipoDocumento)+
      ', '+IntToStr(iIdentificacaoEmissaoBloqueto)+
      ', '+IntToStr(iIdentificacaoDistribuicao)+
      ', '+sAceite+
      ', '+sGrupoEspecial+
      ', '+IntToStr(iCodigoJurosMora)+
      ', '+IntToStr(iDiasJurosMora)+
      ', '+VirgPonto(vJurosDia)+
      ', '+IntToStr(iCodigoDesconto1)+
      ', '+IntToStr(iDiasDesconto1)+
      ', '+VirgPonto(vDesconto1)+
      ', '+IntToStr(iCodigoProtesto)+
      ', '+EDiasProtesto.Text+
      ', '+IntToStr(iCodigoBaixaDevolucao)+
      ', '+IntToStr(iDiasBaixaDevolucao)+
      ', '+IntToStr(ECodigoMoeda.ItemIndex)+
      ', '+IntToStr(iCodigoDesconto2)+
      ', '+IntToStr(iDiasDesconto2)+
      ', '+VirgPonto(vDesconto2)+
      ', '+IntToStr(iCodigoDesconto3)+
      ', '+IntToStr(iDiasDesconto3)+
      ', '+VirgPonto(vDesconto3)+
      ', '+IntToStr(iCodigoMulta)+
      ', '+IntToStr(iDiasMulta)+
      ', '+VirgPonto(vMulta)+
      ', '+IntToStr(iIdentificacaoMensagem)+
      ', '+IntToStr(iLinhaMensagem)+
      ',"'+sMensagemImpressa+'" '+
      ', '+IntToStr(EFonteMensagem.ItemIndex)+
      ', '+IntToStr(iFonteMensagem2)+
      ', '+IntToStr(iFonteMensagem3)+
      ', '+IntToStr(iFonteMensagem4)+
      ', '+IntToStr(iFonteMensagem5)+
      ', '+IntToStr(iFonteMensagem6)+
      ', '+IntToStr(iFonteMensagem7)+
      ', '+IntToStr(iFonteMensagem8)+
      ', '+IntToStr(iFonteMensagem9)+
      ', '+IntToStr(iFonteMensagem10)+
      ', '+IntToStr(iFonteMensagem11)+
      ', '+IntToStr(iFonteMensagem12)+
      ', '+IntToStr(iFonteMensagem13)+
      ', '+IntToStr(iFonteMensagem14)+
      ', '+IntToStr(iFonteMensagem15)+
      ', '+IntToStr(iFonteMensagem16)+
      ', '+IntToStr(iFonteMensagem17)+
      ', '+IntToStr(iFonteMensagem18)+                                                                                                
      ', '+IntToStr(ESituacao.ItemIndex)+
      ',"'+sObs+'") ');
    GeraLog(7760,CdCNC,CdBNB);
    Result := True;
  except
    ShowMessage('Não foi possível inserir o registro corrente. Verifique se o tipo de dado que você está tentando alterar é o mesmo do campo.');
  end;
end;

procedure TBanco_Boleto.LimpaCampos;
begin
  try
    if Estado <> 1 then
      ECodigoBNB.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
  try
    EDataAlterado.Clear
  except
  end;
  try
    ELeiaute.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ETipoInscricao.Itemindex := -1
    else
      ETipoInscricao.Itemindex := 1;
  except
  end;
  try
    ENumeroInscricao.Clear;
  except
  end;
  try
    ECodigoConvenio.Clear;
  except
  end;
  try
    ENumeroBanco.Clear;
  except
  end;
  try
    ENumeroAgencia.Clear;
  except
  end;
  try
    EDigitoAgencia.Clear;
  except
  end;
  try
    ENumeroConta.Clear;
  except
  end;
  try
    EDigitoConta.Clear;
  except
  end;
  try
    EDigitoAgenciaConta.Clear;
  except
  end;
  try
    ENomeEmpresa.Clear;
  except
  end;
  try
    EnomeBanco.Clear;
  except
  end;
  try
    EVersao.Clear;
  except
  end;
  try
    EReservadoEmpresa.Clear;
  except
  end;
  try
    EIdentificacaoCSP.Clear;
  except
  end;
  try
    EInstrucao1.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EFonteInstrucao1.ItemIndex := -1
    else
      EFonteInstrucao1.ItemIndex := 0;
  except
  end;    
  try
    EInstrucao2.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EFonteInstrucao2.ItemIndex := -1
    else
      EFonteInstrucao2.ItemIndex := 0;
  except
  end;    
  try
    EInstrucao3.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EFonteInstrucao3.ItemIndex := -1
    else
      EFonteInstrucao3.ItemIndex := 0;
  except
  end;    
  try
    EInstrucao4.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EFonteInstrucao4.ItemIndex := -1
    else
      EFonteInstrucao4.ItemIndex := 0;
  except
  end;    
  try
    EInstrucao5.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EFonteInstrucao5.ItemIndex := -1
    else
      EFonteInstrucao5.ItemIndex := 0;
  except
  end;    
  try
    EInstrucao6.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EFonteInstrucao6.ItemIndex := -1
    else
      EFonteInstrucao6.ItemIndex := 0;
  except
  end;    
  try
    EInstrucao7.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EFonteInstrucao7.ItemIndex := -1
    else
      EFonteInstrucao7.ItemIndex := 0;
  except
  end;    
  try
    EInstrucao8.Clear;
  except
  end;  
  try
    if Estado <> 1 then
      EFonteInstrucao8.ItemIndex := -1
    else
      EFonteInstrucao8.ItemIndex := 0;
  except
  end;                  
  try
    EMensagem1.Clear;
  except
  end;
  try
    EMensagem2.Clear;
  except
  end;
  try
    EMensagem3.Clear;
  except
  end;
  try
    EMensagem4.Clear;
  except
  end;
  try
    EMensagem5.Clear;
  except
  end;
  try
    EMensagem6.Clear;
  except
  end;
  try
    EMensagem7.Clear;
  except
  end;
  try
    EMensagem8.Clear;
  except
  end;
  try
    EMensagem9.Clear;
  except
  end;
  try
    EMensagem10.Clear;
  except
  end;
  try
    EMensagem11.Clear;
  except
  end;
  try
    EMensagem12.Clear;
  except
  end;
  try
    EMensagem13.Clear;
  except
  end;
  try
    EMensagem14.Clear;
  except
  end;
  try
    EMensagem15.Clear;
  except
  end;
  try
    EMensagem16.Clear;
  except
  end;
  try
    EMensagem17.Clear;
  except
  end;
  try
    EMensagem18.Clear;
  except
  end;                            
  try
    ENumeroRemessa.Clear;
  except
  end;
  try
    ENumeroRetorno.Clear;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoCarteira.ItemIndex := -1
    else
      ECodigoCarteira.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFormaCadastroTituloBanco.ItemIndex := -1
    else
      EFormaCadastroTituloBanco.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      ETipoDocumento.ItemIndex := -1
    else
      ETipoDocumento.ItemIndex := 0
  except
  end;
  try
    if Estado <> 1 then
      EIdentificacaoEmissaoBloqueto.ItemIndex := -1
    else
      EIdentificacaoEmissaoBloqueto.ItemIndex := 0
  except
  end;
  try
    if Estado <> 1 then
      EIdentificacaoDistribuicao.ItemIndex := -1
    else
      EIdentificacaoDistribuicao.ItemIndex := 0
  except
  end;
  try
    EAceite.Checked := False;
  except
  end;
  try
    EGrupoEspecial.Checked := False;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoJurosMora.ItemIndex := -1
    else
      ECodigoJurosMora.ItemIndex := 0
  except
  end;
  try
    if Estado <> 1 then
      EDiasJurosMora.Clear
    else
      EDiasJurosMora.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      EJurosDia.Clear
    else
      EJurosDia.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      ECodigoDesconto1.ItemIndex := -1
    else
      ECodigoDesconto1.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EDiasDesconto1.Clear
    else
      EDiasDesconto1.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      EDesconto1.Clear
    else
      EDesconto1.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      ECodigoProtesto.ItemIndex := -1
    else
      ECodigoProtesto.ItemIndex := 2;
  except
  end;
  try
    if Estado <> 1 then
      EDiasProtesto.Clear
    else
      EDiasProtesto.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      ECodigoBaixaDevolucao.ItemIndex := -1
    else
      ECodigoBaixaDevolucao.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EDiasBaixaDevolucao.Clear
    else
      EDiasBaixaDevolucao.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      ECodigoMoeda.ItemIndex := -1
    else
      ECodigoMoeda.ItemIndex := 8;
  except
  end;
  try
    if Estado <> 1 then
      ECodigoDesconto2.ItemIndex := -1
    else
      ECodigoDesconto2.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EDiasDesconto2.Clear
    else
      EDiasDesconto2.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      EDesconto2.Clear
    else
      EDesconto2.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      ECodigoDesconto3.ItemIndex := -1
    else
      ECodigoDesconto3.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EDiasDesconto3.Clear
    else
      EDiasDesconto3.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      EDesconto3.Clear
    else
      EDesconto3.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      ECodigoMulta.ItemIndex := -1
    else
      ECodigoMulta.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EDiasMulta.Clear
    else
      EDiasMulta.Text := '0';
  except
  end;
  try
    if Estado <> 1 then
      EMulta.Clear
    else
      EMulta.Text := '0,00';
  except
  end;
  try
    if Estado <> 1 then
      EIdentificacaoMensagem.Itemindex := -1
    else
      EIdentificacaoMensagem.Itemindex := 0;
  except
  end;
  try
    if Estado <> 1 then
      ELinhaMensagem.Clear
    else
      ELinhaMensagem.Text := '1';
  except
  end;
  try
    EMensagemimpressa.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem.ItemIndex := -1
    else
      EFonteMensagem.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem2.ItemIndex := -1
    else
      EFonteMensagem2.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem3.ItemIndex := -1
    else
      EFonteMensagem3.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem4.ItemIndex := -1
    else
      EFonteMensagem4.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem5.ItemIndex := -1
    else
      EFonteMensagem5.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem6.ItemIndex := -1
    else
      EFonteMensagem6.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem7.ItemIndex := -1
    else
      EFonteMensagem7.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem8.ItemIndex := -1
    else
      EFonteMensagem8.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem9.ItemIndex := -1
    else
      EFonteMensagem9.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem10.ItemIndex := -1
    else
      EFonteMensagem10.ItemIndex := 0;
  except
  end;
  try
    if Estado <> 1 then
      EFonteMensagem11.ItemIndex := -1
    else
      EFonteMensagem11.ItemIndex := 0;
  except
  end;  
  try
    if Estado <> 1 then
      EFonteMensagem12.ItemIndex := -1
    else
      EFonteMensagem12.ItemIndex := 0;
  except
  end;  
  try
    if Estado <> 1 then
      EFonteMensagem13.ItemIndex := -1
    else
      EFonteMensagem13.ItemIndex := 0;
  except
  end;  
  try
    if Estado <> 1 then
      EFonteMensagem14.ItemIndex := -1
    else
      EFonteMensagem14.ItemIndex := 0;
  except
  end;  
  try
    if Estado <> 1 then
      EFonteMensagem15.ItemIndex := -1
    else
      EFonteMensagem15.ItemIndex := 0;
  except
  end;  
  try
    if Estado <> 1 then
      EFonteMensagem16.ItemIndex := -1
    else
      EFonteMensagem16.ItemIndex := 0;
  except
  end;  
  try
    if Estado <> 1 then
      EFonteMensagem17.ItemIndex := -1
    else
      EFonteMensagem17.ItemIndex := 0;
  except
  end;  
  try
    if Estado <> 1 then
      EFonteMensagem18.ItemIndex := -1
    else
      EFonteMensagem18.ItemIndex := 0;
  except
  end;                                    
  try
    if Estado <> 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 0;
  except
  end;
  try
    EOBS.Clear;
  except
  end;
end;

{ Localiza um Grupo }
function TBanco_Boleto.LocalizarCod(CdBNB:Integer):Boolean;
begin
  If (CdBNB<>CodigoBNB) Then
    If locate('BNB_CODIGO',CdBNB, []) Then
      Result:=True
    else
      Result:=False
  Else
    Result:=True;
end;

procedure TBanco_Boleto.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('DD/MM/YYYY HH:MM',CConfiguracao.DataHora);
  except
  end;
end;

procedure TBanco_Boleto.PreparaInsercao;
begin
  ProximoCodigo('BNB_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TBanco_Boleto.deletarauto:Boolean;
var
  CdCNC, CdBNB: integer;
begin
  Result := False;
  try
    If MessageDlg('Deseja excluir o registro corrente?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;  
    CdCNC := CodigoCNC;
    CdBNB := CodigoBNB;    
    ExecutaSQL(CConfiguracao.QueryComandos,'DELETE FROM BANCO_BOLETO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND BNB_CODIGO='+IntToStr(CdBNB));
    GeraLog(7780,CdCNC,CdBNB);
    RegistrarDel(CdCNC,1180(*BancoBoleto*),CdBNB);
    result:=true; 
    Close;
    Open;   
    if TQuery(Self).isEmpty then
      LimpaCampos;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
