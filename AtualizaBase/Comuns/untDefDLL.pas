////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO SISTEMA..: SYS-NFe                                                 //
//============================================================================//
// REVISÃO..........: 1.0                                                     //
// MÓDULO...........: NFe                                                     //
// UNIT.............: Unit de definições das funções importadas LibSysNFe.dll //
// ANALISTA.........: Anderson Gonçalves                                      //
// DESENVOLVEDOR....: Anderson Gonçalves                                      //
// UTILIZADO EM.....: SysNFe.exe                                              //
// DATA DE CRIAÇÃO..: 20/11/2009                                              //
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
unit untDefDLL;

interface

uses SysUtils;

  function RegistroCAB(Versao: Integer; NomeSistema: ShortString; DataCriacao: TDateTime) : Boolean; stdcall; external 'LibSysNFe.dll';
  function RegistroEMI(Emitente_RZ_Social,Emitente_NomeFantasia,Emitente_CNPJ,Emitente_IE,Emitente_IM,
           Emitente_EndLogradouro,Emitente_EndNumero,Emitente_EndComplemento,Emitente_EndBairro,
           Emitente_CodCidade,Emitente_Cidade,Emitente_UF,Emitente_CEP,Emitente_Fone : ShortString) : Boolean; stdcall; external 'LibSysNFe.dll';
  function RegistroTRA(Transportadora_RZ_Social,Transportadora_NomeFantasia,Transportadora_CPF_CNPJ,
           Transportadora_IE,Transportadora_IM,Transportadora_EndLogradouro,Transportadora_EndNumero,
           Transportadora_EndComplemento,Transportadora_EndBairro,Transportadora_CodCidade,
           Transportadora_Cidade,Transportadora_UF,Transportadora_CEP,Transportadora_Fone,
           Transportadora_PlacaUF, Transportadora_Placa : ShortString) : Boolean; stdcall; external 'LibSysNFe.dll';
  function RegistroNFe(Serie,NaturezaOperacao,FormaPgto,Destinatario_Nome,Destinatario_NomeFantasia,
           Destinatario_CPF_CNPJ,Destinatario_RG,Destinatario_IE,Destinatario_IM,Destinatario_EndLogradouro,
           Destinatario_EndNumero,Destinatario_EndComplemento,Destinatario_EndBairro,Destinatario_CodCidade,
           Destinatario_Cidade,Destinatario_UF,Destinatario_CEP,Destinatario_Fone: ShortString;DataEmissao,
           DataSaida: TDateTime; Frete,ValorNota,ValorSeguro,ValorDesconto: Double): Boolean; stdcall; external 'LibSysNFe.dll';
  function RegistroINF(CFOP,Descricao,Unidade,ICMS_CST,IPI_CST,IPI_SitTributaria,IPI_ClasseEnquadramento,
           IPI_CodigoSelo,IPI_CodigoEnquadramento,IPI_CNPJProdutor : ShortString;
           ValorUnit,Qtde,ValorTotal,ICMS_BaseCalculo,ICMS_Aliquota,IPI_ValorUnidade,IPI_BaseCalculo,
           IPI_Aliquota : Double; IPI_QtdeSelo,ICMS_ST(*0=Normal/1=Subst.*): Integer;
           InfoAdicional: ShortString): Boolean; stdcall; external 'LibSysNFe.dll';
  function RegistroRDP(ValorProdutos,BaseICMS,ValorICMS,BaseIPI,
           ValorIPI,BaseICMS_ST,ValorICMS_ST: Double): Boolean; stdcall; external 'LibSysNFe.dll';
  function SaveToFile(sSerie: ShortString): Boolean; stdcall; external 'LibSysNFe.dll';

implementation

end.
