�
 TRPT_CARNETLUCIANO 0  TPF0Trpt_CarnetLucianorpt_CarnetLucianoLeft� TopjWidth(Height`Caption   Carnet Papel da GráficaColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnClose	FormClosePixelsPerInch`
TextHeight 	TSZReportreportLeft Top WidthdHeightColumnsColumnSpace DataSetTitulo_receber1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style Margins.LeftMargins.Top Margins.RightMargins.Bottom Options.CopiesOptions.DestinationzrdLPT1Options.Escapes.BoldOn0Options.Escapes.BoldOffFHOptions.Escapes.ItalicsOn2Options.Escapes.ItalicsOff5Options.Escapes.UnderlineOn-1Options.Escapes.UnderlineOff-0Options.Escapes.SuperScriptOnSOptions.Escapes.SuperScriptOffTOptions.Escapes.SubScriptOnS Options.Escapes.SubScriptOffTOptions.PageLengthOptions.PageWidthdOptions.PaperTypezptSheet TSZRBand
zrbDetalheLeftTop WidthaHeightBeforePrintzrbDetalheBeforePrintBandTyperbDetailForceNewColumnForceNewPage 
TSZRDBText
SZRDBText7LeftTopWidth
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetTitulo_receber1	DataFieldTRC_SEQUENCIA  
TSZRDBText
SZRDBText8LeftTopWidth
Height	AlignmenttaCenterAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetTitulo_receber1	DataField
CNC_CODIGO  TSZRExpressionSZRExpression1Left3TopWidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	CurrencyResetAfterPrint
Expression	TRC_VALORMask0.00  
TSZRDBText
SZRDBText3LeftTopWidth
Height	AlignmenttaCenterAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetTitulo_receber1	DataFieldTRC_VENCIMENTO  	TSZRLabel
zrlClienteLeftTopWidth>HeightAlignToBand	FontStyle WordWrap	  
TSZRDBText
SZRDBText1LeftTopWidth
Height	AlignmenttaCenterAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetTitulo_receber1	DataField
PDV_CODIGO  
TSZRDBText
SZRDBText2LeftOTopWidth
Height	AlignmenttaCenterAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetTitulo_receber1	DataField
PDV_CODIGO  
TSZRDBText
SZRDBText5LeftJTopWidth
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetTitulo_receber1	DataFieldTRC_SEQUENCIA  	TSZRLabel	SZRLabel1LeftTTopWidthHeightAlignToBand	FontStyle WordWrap	Caption/  
TSZRDBText
SZRDBText6LeftPTopWidth
Height	AlignmenttaCenterAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetTitulo_receber1	DataFieldTRC_VENCIMENTO  TSZRExpressionSZRExpression2LeftGTopWidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	CurrencyResetAfterPrint
Expression	TRC_VALORMask0.00  
TSZRDBText
SZRDBText9Left2TopWidth
Height	AlignmenttaCenterAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetTitulo_receber1	DataFieldTRC_DT_CADASTRO  	TSZRLabel
SZRLabel61Left`TopWidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyleesItalic WordWrap	Caption.  	TSZRLabel	SZRLabel4Left Top WidthHeightAlignToBand		FontStyleesBold WordWrap	Caption.  	TSZRLabel	SZRLabel2Left`TopWidthHeightAlignToBand	FontStyle WordWrap	Caption.  	TSZRLabelzrlMensagemLeftTopWidth>HeightAlignToBand	FontStyle WordWrap	  	TSZRLabelzrlEnderecoLeftTopWidth>HeightAlignToBand	FontStyle WordWrap	  	TSZRLabelzrlFoneLeftTopWidth>HeightAlignToBand	FontStyle WordWrap	  	TSZRLabel	SZRLabel3LeftTopWidthHeightAlignToBand	FontStyle WordWrap	Caption/  	TSZRLabelzrlTotalParc1LeftTopWidthHeightAlignToBand	FontStyle WordWrap	  	TSZRLabelzrlTotalParc2LeftUTopWidthHeightAlignToBand	FontStyle WordWrap	  	TSZRLabelzrlDadosClienteLeftHTopWidthHeightAlignToBand	FontStyle WordWrap	    TTitulo_receberTitulo_receber1DatabaseNameDBguerraFiltered	SQL.StringsSELECT T1.*,B     T3.CLI_CODIGO,T3.CLI_RZ_SOCIAL,T3.CLI_ENDERECO,T3.CLI_CIDADE,2     T3.CLI_BAIRRO,T3.CNC_CODIGO,T3.CLI_LOGRADOUROFROM     TITULO_A_RECEBER T1,     CLIENTE T3WHERE     (T1.PDV_CODIGO=:PDV) AND     (T1.CNC_CODIGO=:CNC) AND     (T1.TRC_SITUACAO<>5) AND%     (T3.CNC_CODIGO=:CNC_EXTERNO) AND"     (T3.CLI_CODIGO=T1.CLI_CODIGO)ORDER BY     T1.TRC_SEQUENCIA   CConfiguracaoDM.Configuracao1	CNCOrigem CentroDeCusto	CodigoCNC 	CodigoUSU Mafalda Maquinad	ChequeCNC ChequeDevolvido
ClienteCNC 	CodigoAGF 	CodigoBOL 	CodigoCCX CodigoCCXRecebimento 	CodigoCHQ 	CodigoCLI 	CodigoCPC 	CodigoFPE 	CodigoFUN 	CodigoMCC 	CodigoPDV 	CodigoTRC 	CodigoTRF FaturamentoCNC GerouMovimentoMovimentoContaCorrenteCNC PagamentoParcialProcesso 
Reabertura Situacao Tipo TipoPag 
TipoPedido 	TituloANT 	TituloORI 
Verificado VisitadoLeftjTop� 	ParamDataDataType	ftIntegerNamePDV	ParamType	ptUnknown DataType	ftIntegerNameCNC	ParamType	ptUnknown DataType	ftUnknownNameCNC_EXTERNO	ParamType	ptUnknown    
TParametro
Parametro1DatabaseNameDBguerraSQL.StringsSELECT * FROM PARAMETROWHERE PAR_CODIGO=:PAR_CODIGO  	CNCOrigem CentroDeCusto	CodigoCNC 	CodigoUSU Mafalda Maquinad	CodigoPAR 	CodigoTPR 
Informacao Situacao Left� Top� 	ParamDataDataType	ftIntegerName
PAR_CODIGO	ParamType	ptUnknown    TTitulo_receberTitulo_receberAntesDatabaseNameDBguerraFiltered	SQL.StringsSELECT T1.*,B     T3.CLI_CODIGO,T3.CLI_RZ_SOCIAL,T3.CLI_ENDERECO,T3.CLI_CIDADE,2     T3.CLI_BAIRRO,T3.CNC_CODIGO,T3.CLI_LOGRADOUROFROM     TITULO_A_RECEBER T1,     CLIENTE T3WHERE     (T1.PDV_CODIGO=:PDV) AND     (T1.CNC_CODIGO=:CNC) AND     (T1.TRC_SITUACAO<>5) AND&     (T3.CNC_CODIGO=T1.CNC_CODIGO) AND"     (T3.CLI_CODIGO=T1.CLI_CODIGO)ORDER BY     T1.TRC_SEQUENCIA   CConfiguracaoDM.Configuracao1	CNCOrigem CentroDeCusto	CodigoCNC 	CodigoUSU Mafalda Maquinad	ChequeCNC ChequeDevolvido
ClienteCNC 	CodigoAGF 	CodigoBOL 	CodigoCCX CodigoCCXRecebimento 	CodigoCHQ 	CodigoCLI 	CodigoCPC 	CodigoFPE 	CodigoFUN 	CodigoMCC 	CodigoPDV 	CodigoTRC 	CodigoTRF FaturamentoCNC GerouMovimentoMovimentoContaCorrenteCNC PagamentoParcialProcesso 
Reabertura Situacao Tipo TipoPag 
TipoPedido 	TituloANT 	TituloORI 
Verificado VisitadoLeft�Top]	ParamDataDataType	ftIntegerNamePDV	ParamType	ptUnknown DataType	ftIntegerNameCNC	ParamType	ptUnknown     