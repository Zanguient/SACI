�
 TRPT_MOVCREDITO 0�)  TPF0Trpt_MovCreditorpt_MovCreditoLeft7Top� Width�Height�Caption%   Relatório dos Movimentos de CréditoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight 	TSZReportreportLeft Top Width� HeightAColumnsColumnSpace DataSetMovimento_de_Credito1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style Margins.LeftMargins.TopMargins.RightMargins.BottomOptions.CopiesOptions.DestinationzrdLPT1Options.Escapes.BoldOnEGOptions.Escapes.BoldOffFHOptions.Escapes.ItalicsOn4Options.Escapes.ItalicsOff5Options.Escapes.UnderlineOn-1Options.Escapes.UnderlineOff-0Options.Escapes.SuperScriptOnSOptions.Escapes.SuperScriptOffTOptions.Escapes.SubScriptOnS Options.Escapes.SubScriptOffTOptions.PageLengthAOptions.PageWidth� Options.PaperTypezptSheet TSZRBandZRBand1LeftTopWidth� HeightBeforePrintZRBand1BeforePrintBandTyperbPageHeaderForceNewColumnForceNewPage 	TSZRLabelZRLabel2Left TopWidth9HeightAlignToBand	FontStyle WordWrap	Caption3   SIAC - Relatorio de Movimeto de Crédito de Cliente  TSZRSysData
ZRSysData2LeftdTopWidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	DatazrsDateTimeTextData/Hora.:  	TSZRLabelZRLabel3Left Top Width9HeightAlignToBand	FontStyleesUnderline WordWrap	CaptionEletroGuerra   	TSZRLabelZRLabel5Left TopWidth� HeightAlignToBand	FontStyle WordWrap	Caption�============================================================================================================================================================  	TSZRLabelZRLabel6Left TopWidth� HeightAlignToBand	FontStyle WordWrap	Caption�============================================================================================================================================================  	TSZRLabel	SZRLabel5Left TopWidth
HeightAlignToBand	FontStyle WordWrap	Caption	SZRLabel1  	TSZRLabel	SZRLabel6LeftTopWidthHeightAlignToBand	FontStyle WordWrap	Captiona  	TSZRLabel	SZRLabel7LeftTopWidth
HeightAlignToBand	FontStyle WordWrap	Caption	SZRLabel3  	TSZRLabel
zrlFiltrosLeftTopWidthjHeightAlignToBand	FontStyle WordWrap	  	TSZRLabel	zrlCodigoLeftTopWidthHeightAlignToBand	FontStyle WordWrap	CaptionCodigo  	TSZRLabel	SZRLabel1LeftTopWidthHeightAlignToBand	FontStyle WordWrap	CaptionData  	TSZRLabel	SZRLabel2Left"TopWidth!HeightAlignToBand	FontStyle WordWrap	CaptionTipo  	TSZRLabel	SZRLabel4LeftmTopWidth
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	CaptionValor  	TSZRLabel
SZRLabel13LeftDTopWidth	HeightAlignToBand	FontStyle WordWrap	Caption	EntCodigo  	TSZRLabel
SZRLabel15LeftbTopWidth
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	CaptionValorAnt  	TSZRLabel
SZRLabel19LeftxTopWidth
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	CaptionSaldo  	TSZRLabel	SZRLabel3LeftOTopWidth
HeightAlignToBand	FontStyle WordWrap	CaptionPedido   TSZRBand
zrbDetalheLeftTopWidth� HeightBeforePrintzrbDetalheBeforePrintBandTyperbDetailForceNewColumnForceNewPage 
TSZRDBText	ZRDBText1LeftTop WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetMovimento_de_Credito1	DataField
MCR_CODIGO  
TSZRDBText
SZRDBText1LeftTop WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetMovimento_de_Credito1	DataFieldMCR_DT_CADASTRO  
TSZRDBText
SZRDBText2Left"Top WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetMovimento_de_Credito1	DataFieldMCR_DC  	TSZRLabelzrlTipoLeft$Top WidthHeightAlignToBand	FontStyle WordWrap	  
TSZRDBText
SZRDBText4LeftDTop Width	HeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetMovimento_de_Credito1	DataFieldMCR_ENT_CODIGO  
TSZRDBText
SZRDBText6LeftbTop Width
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetMovimento_de_Credito1	DataFieldMCR_VALOR_ANT  
TSZRDBText
SZRDBText7LeftmTop Width
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetMovimento_de_Credito1	DataField	MCR_VALOR  	TSZRLabelzrlSaldoLeftxTop Width
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	  	TSZRLabelzrlUsuarioMovLeftoTopWidthHeightAlignToBand	FontStyle WordWrap	  	TSZRLabelzrlObservacaoLeftTopWidth?HeightAlignToBand	FontStyle WordWrap	  	TSZRLabel	zrlPedidoLeftOTop Width
HeightAlignToBand	FontStyle WordWrap	   TSZRBandzrlUsuario1LeftTopWidth� HeightBeforePrintzrlUsuario1BeforePrintBandTyperbPageFooterForceNewColumnForceNewPage TSZRSysData
ZRSysData1LeftwTopWidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	DatazrsPageNumberTextPag.:  	TSZRLabelZRLabel8Left Top Width� HeightAlignToBand	FontStyle WordWrap	Caption�------------------------------------------------------------------------------------------------------------------------------------------------------------  	TSZRLabelZRLabel4Left TopWidth)HeightAlignToBand	FontStyleesItalic WordWrap	CaptionEmpresaDesenvolvedora  	TSZRLabel
zrlUsuarioLeft*TopWidth,HeightAlignToBand	FontStyleesItalic WordWrap	   	TSZRGroupZRGroup1LeftTopWidth� Height
ExpressionCNC_CLIENTE+CLI_CODIGO
FooterBandSZRBand1MasterreportForceNewColumnForceNewPage 
TSZRDBText
SZRDBText3Left Top WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetMovimento_de_Credito1	DataField
CLI_CODIGO  	TSZRLabel
SZRLabel14Left TopWidth� HeightAlignToBand	FontStyle WordWrap	Caption�----------------------------------------------------------------------------------------------------------------------------------  	TSZRLabel
SZRLabel10LeftTop WidthHeightAlignToBand	FontStyle WordWrap	Caption-  
TSZRDBText
SZRDBText5LeftTop Width2HeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetMovimento_de_Credito1	DataFieldCLI_RZ_SOCIAL   TSZRBandSZRBand1LeftTopWidth� HeightBandTyperbGroupFooterForceNewColumnForceNewPage 	TSZRLabel
SZRLabel12Left Top Width� HeightAlignToBand	FontStyle WordWrap	Caption�----------------------------------------------------------------------------------------------------------------------------------   	TSZRGroup	SZRGroup1LeftTop
Width� HeightBeforePrintSZRGroup1BeforePrint
Expression
CNC_CODIGOMasterreportForceNewColumnForceNewPage 	TSZRLabelzrlCentroDeCustoLeft Top Width9HeightAlignToBand	FontStyle WordWrap	    TCentroCustoCentroCusto1DatabaseNameDBguerraSQL.StringsSELECT * FROM CENTRO_DE_CUSTOWHERE CNC_CODIGO=:CNC_CODIGO 	CNCOrigem CentroDeCusto	CodigoCNC 	CodigoUSU Mafalda MaquinaTabelaCENTRO_DE_CUSTO
Logradouro RecebeDadosLeft� Top	ParamDataDataType	ftIntegerName
CNC_CODIGO	ParamType	ptUnknown    TMovimento_de_CreditoMovimento_de_Credito1DatabaseNameDBguerraSQL.Strings'SELECT T1.CLI_RZ_SOCIAL,T1.CLI_CGC_CPF,!T1.CLI_FONE,T1.CLI_NOME_FAN,T2.* (FROM Cliente T1,Movimento_de_Credito T2 WHERE MCR_CODIGO<>-10 #AND (T1.CNC_CODIGO=T2.CNC_CLIENTE) "AND (T1.CLI_CODIGO=T2.CLI_CODIGO)  	CNCOrigem CentroDeCusto	CodigoCNC 	CodigoUSU Mafalda MaquinaTabelaMOVIMENTO_DE_CREDITO
ClienteCNC 	CodigoCLI 	CodigoMCR 	CodigoPDV 	EntCodigo EntCodigoCNC 
MaquinaMCR 	PedidoCNC Situacao Tipo Left`Top  TStringField"Movimento_de_Credito1CLI_RZ_SOCIAL	FieldNameCLI_RZ_SOCIALOrigin(DBGUERRA.MOVIMENTO_DE_CREDITO.MCR_CODIGO	FixedChar	Size<  TStringField Movimento_de_Credito1CLI_CGC_CPF	FieldNameCLI_CGC_CPFOrigin(DBGUERRA.MOVIMENTO_DE_CREDITO.CNC_CODIGO	FixedChar	  TStringFieldMovimento_de_Credito1CLI_FONE	FieldNameCLI_FONEOrigin)DBGUERRA.MOVIMENTO_DE_CREDITO.CNC_CLIENTE	FixedChar	  TStringField!Movimento_de_Credito1CLI_NOME_FAN	FieldNameCLI_NOME_FANOrigin(DBGUERRA.MOVIMENTO_DE_CREDITO.CLI_CODIGO	FixedChar	Size<  TIntegerFieldMovimento_de_Credito1MCR_CODIGO	FieldName
MCR_CODIGOOrigin(DBGUERRA.MOVIMENTO_DE_CREDITO.USU_CODIGO  TIntegerFieldMovimento_de_Credito1CNC_CODIGO	FieldName
CNC_CODIGOOrigin-DBGUERRA.MOVIMENTO_DE_CREDITO.MCR_DT_CADASTRO  TIntegerField Movimento_de_Credito1CNC_CLIENTE	FieldNameCNC_CLIENTEOrigin-DBGUERRA.MOVIMENTO_DE_CREDITO.MCR_DT_ALTERADO  TIntegerFieldMovimento_de_Credito1CLI_CODIGO	FieldName
CLI_CODIGOOrigin$DBGUERRA.MOVIMENTO_DE_CREDITO.MCR_DC  TIntegerFieldMovimento_de_Credito1USU_CODIGO	FieldName
USU_CODIGOOrigin&DBGUERRA.MOVIMENTO_DE_CREDITO.MCR_TIPO  TDateTimeField$Movimento_de_Credito1MCR_DT_CADASTRO	FieldNameMCR_DT_CADASTROOrigin+DBGUERRA.MOVIMENTO_DE_CREDITO.MCR_VALOR_ANT  TDateTimeField$Movimento_de_Credito1MCR_DT_ALTERADO	FieldNameMCR_DT_ALTERADOOrigin'DBGUERRA.MOVIMENTO_DE_CREDITO.MCR_VALOR  TStringFieldMovimento_de_Credito1MCR_DC	FieldNameMCR_DCOrigin,DBGUERRA.MOVIMENTO_DE_CREDITO.CNC_ENT_CODIGO	FixedChar	  TIntegerFieldMovimento_de_Credito1MCR_TIPO	FieldNameMCR_TIPOOrigin,DBGUERRA.MOVIMENTO_DE_CREDITO.MCR_ENT_CODIGO  TFloatField"Movimento_de_Credito1MCR_VALOR_ANT	FieldNameMCR_VALOR_ANTOrigin*DBGUERRA.MOVIMENTO_DE_CREDITO.MCR_SITUACAODisplayFormat0.00  TFloatFieldMovimento_de_Credito1MCR_VALOR	FieldName	MCR_VALOROrigin,DBGUERRA.MOVIMENTO_DE_CREDITO.MCR_OBSERVACAODisplayFormat0.00  TIntegerField#Movimento_de_Credito1CNC_ENT_CODIGO	FieldNameCNC_ENT_CODIGOOriginDBGUERRA.CLIENTE.CLI_RZ_SOCIAL  TIntegerField#Movimento_de_Credito1MCR_ENT_CODIGO	FieldNameMCR_ENT_CODIGOOriginDBGUERRA.CLIENTE.CLI_CGC_CPF  TIntegerField!Movimento_de_Credito1MCR_SITUACAO	FieldNameMCR_SITUACAOOriginDBGUERRA.CLIENTE.CLI_FONE  TStringField#Movimento_de_Credito1MCR_OBSERVACAO	FieldNameMCR_OBSERVACAOOriginDBGUERRA.CLIENTE.CLI_NOME_FAN	FixedChar	Size�   TIntegerField Movimento_de_Credito1MCR_MAQUINA	FieldNameMCR_MAQUINAOriginDBGUERRA.CLIENTE.CLI_CGC_CPF  TIntegerFieldMovimento_de_Credito1CNC_PEDIDO	FieldName
CNC_PEDIDOOriginDBGUERRA.CLIENTE.CLI_FONE  TIntegerFieldMovimento_de_Credito1PDV_CODIGO	FieldName
PDV_CODIGOOriginDBGUERRA.CLIENTE.CLI_NOME_FAN    