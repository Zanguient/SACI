�
 TRPT_RECEBIMENTO 0*  TPF0Trpt_Recebimentorpt_RecebimentoLeft5Top� Width�Height�CaptionRecebimentoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight 	TSZReportreportLeftTop WidthPHeight(
AfterPrintreportAfterPrintColumnsColumnSpace DataSetRecebimento1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style Margins.LeftMargins.TopMargins.RightMargins.BottomOptions.CopiesOptions.DestinationzrdLPT1Options.Escapes.BoldOnEGOptions.Escapes.BoldOffFHOptions.Escapes.ItalicsOn4Options.Escapes.ItalicsOff5Options.Escapes.UnderlineOn-1Options.Escapes.UnderlineOff-0Options.Escapes.SuperScriptOnSOptions.Escapes.SuperScriptOffTOptions.Escapes.SubScriptOnS Options.Escapes.SubScriptOffTOptions.PageLength(Options.PageWidthPOptions.PaperTypezptSheet TSZRBandZRBand1LeftTopWidthNHeightBeforePrintZRBand1BeforePrintBandTyperbPageHeaderForceNewColumnForceNewPage 	TSZRLabelZRLabel2Left TopWidth/HeightAlignToBand	FontStyle WordWrap	CaptionSIAC - Recebimento  TSZRSysData
ZRSysData2Left0TopWidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	DatazrsDateTimeTextData/Hora.:  	TSZRLabelZRLabel3Left Top Width/HeightAlignToBand	FontStyle BeforePrintZRLabel3BeforePrintWordWrap	CaptionEletroGuerra   	TSZRLabelZRLabel5Left TopWidthNHeightAlignToBand	FontStyle WordWrap	CaptionN==============================================================================  	TSZRLabelZRLabel1Left0Top WidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	CaptionCentro de Custo  	TSZRLabelZRLabel6Left TopWidthNHeightAlignToBand	FontStyle WordWrap	CaptionN==============================================================================  	TSZRLabelZRLabel7Left TopWidthHeightAlignToBand	FontStyle WordWrap	Caption   Código  	TSZRLabelZRLabel9Left
TopWidthHeightAlignToBand	FontStyle WordWrap	CaptionData  	TSZRLabel	ZRLabel12LeftTopWidthHeightAlignToBand	FontStyle WordWrap	CaptionItens  
TSZRDBText	ZRDBText8Left TopWidth	HeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetRecebimento1	DataField
REC_CODIGO  
TSZRDBText	ZRDBText9Left
TopWidth
HeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetRecebimento1	DataFieldREC_DATA  
TSZRDBText
ZRDBText13LeftTopWidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetRecebimento1	DataFieldPRC_TOT_ITEM  	TSZRLabel	ZRLabel10LeftTopWidthHeightAlignToBand	FontStyle WordWrap	CaptionOrigem  
TSZRDBText
ZRDBText11LeftTopWidth"HeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetRecebimento1	DataFieldORIGEM  	TSZRLabel	ZRLabel13Left?TopWidthHeightAlignToBand	FontStyle WordWrap	CaptionSituacao  
TSZRDBText
ZRDBText12Left?TopWidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetRecebimento1	DataFieldsituacao   TSZRBandZRBand3LeftTopWidthNHeightBeforePrintZRBand3BeforePrintBandTyperbPageFooterForceNewColumnForceNewPage TSZRSysData
ZRSysData1LeftCTopWidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	DatazrsPageNumberTextPag.:  	TSZRLabelZRLabel8Left Top WidthNHeightAlignToBand	FontStyle WordWrap	CaptionN------------------------------------------------------------------------------  	TSZRLabelZRLabel4Left TopWidth#HeightAlignToBand	FontStyleesItalic WordWrap	CaptionEmpresaDesenvolvedora   	TSZRGroupZRGroup1LeftTopWidthNHeight
Expression
REC_CODIGOMasterreportForceNewColumnForceNewPage 	TSZRLabel	ZRLabel15Left TopWidthHeightAlignToBand	FontStyle WordWrap	CaptionProduto  	TSZRLabel	ZRLabel16Left3TopWidth
HeightAlignToBand	FontStyle WordWrap	Caption
Referencia  	TSZRLabel	ZRLabel18LeftFTopWidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	CaptionRecebido  	TSZRLabel	ZRLabel19Left Top WidthHeightAlignToBand	FontStyleesUnderline WordWrap	CaptionCod. Origem  	TSZRLabel	ZRLabel20LeftTop WidthHeightAlignToBand	FontStyleesUnderline WordWrap	CaptionNum. Documento  
TSZRDBText
ZRDBText10LeftTopWidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetRecebimento1	DataFieldNumDoc  	TSZRLabel	ZRLabel21Left TopWidthNHeightAlignToBand	FontStyle WordWrap	CaptionN------------------------------------------------------------------------------  
TSZRDBText	ZRDBText7Left TopWidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetRecebimento1	DataFieldPRC_COD_ORIGEM   TSZRBandZRBand4LeftTopWidthNHeightBeforePrintZRBand4BeforePrintBandTyperbDetailForceNewColumnForceNewPage 
TSZRDBText	ZRDBText3LeftTop Width+HeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetRecebimento1	DataFieldproduto  
TSZRDBText	ZRDBText4Left3Top WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetRecebimento1	DataField
referencia  
TSZRDBText	ZRDBText1Left Top WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetRecebimento1	DataField
PRD_CODIGO  	TSZRLabel	ZRLabel25LeftTop WidthHeightAlignToBand	FontStyle WordWrap	Caption-  	TSZRLabel	SZRLabel1LeftFTop WidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	Caption	SZRLabel1   TSZRBandSZRBand1LeftTopWidthNHeightBeforePrintSZRBand1BeforePrintBandType	rbSummaryForceNewColumnForceNewPage 	TSZRLabel	SZRLabel2Left Top WidthNHeightAlignToBand	FontStyle WordWrap	CaptionN------------------------------------------------------------------------------  	TSZRLabel	SZRLabel3Left3TopWidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	CaptionTotal:  	TSZRLabellblTotalLeftFTopWidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	CaptionTotal:    TProdutoProduto1DatabaseNameDBguerraSQL.Strings1select * from produto where prd_codigo=prd_codigo 	CNCOrigem CentroDeCusto	CodigoCNC 	CodigoUSU Mafalda MaquinaTabelaPRODUTOCatalogoClassificacao 	CodigoCLF 	CodigoCTP 	CodigoFOR 	CodigoGRP 	CodigoORF 	CodigoPRD 	CodigoSGP EstoqueDetalhadoForaDeLinhaForaPrevisao
ForaTabelaInsumoNivel Previsao ServicoSituacao 
TempoMedio LeftdTop�   TCentroCustoCentroCusto1Active	DatabaseNameDBguerraSQL.StringsSELECT * FROM CENTRO_DE_CUSTO 	CNCOrigem CentroDeCusto	CodigoCNC	CodigoUSU Mafalda MaquinaTabelaCENTRO_DE_CUSTOBairroCENTROCEP62900000CGC03.868.142/0001-63CidadeRUSSASEnderecoPROF. APRIGIO, 166Fax(  88) 3411-0023Fone(  88) 3411-0023IE	062982699
Logradouro/NomeFantasiaLUCIANO OTICARazaoSocialCPDRecebeDados	UfCELeft� Top�   TRecebimentoRecebimento1OnCalcFieldsRecebimento1CalcFieldsDatabaseNameDBguerraFiltered	SQL.Strings	SELECT * ,FROM RECEBIMENTO T1, ITEM_DE_RECEBIMENTO T2 %WHERE T1.REC_CODIGO=T2.REC_CODIGO AND#      T1.CNC_CODIGO=:CNC_CODIGO AND#      T2.CNC_CODIGO=:CNC_CODIGO AND      T1.REC_CODIGO=:REC_CODIGO$ORDER BY T2.REC_CODIGO,T2.IRC_CODIGO 	CNCOrigem CentroDeCusto	CodigoCNC 	CodigoUSU Mafalda Maquina
CNC_Origem 
Cod_Origem 	CodigoFOR 	CodigoPRC 	CodigoREC Situacao Tipo TotItem Left� Top� 	ParamDataDataType	ftIntegerName
CNC_CODIGO	ParamType	ptUnknown DataType	ftIntegerName
CNC_CODIGO	ParamType	ptUnknown DataType	ftIntegerName
REC_CODIGO	ParamType	ptUnknown   TIntegerFieldRecebimento1REC_CODIGO	FieldName
REC_CODIGOOriginRECEBIMENTO.REC_CODIGO  TIntegerFieldRecebimento1CNC_CODIGO	FieldName
CNC_CODIGOOriginRECEBIMENTO.CNC_CODIGO  TDateTimeFieldRecebimento1REC_DATA	FieldNameREC_DATAOriginRECEBIMENTO.REC_DATA  TIntegerFieldRecebimento1FOR_CODIGO	FieldName
FOR_CODIGOOriginRECEBIMENTO.FOR_CODIGO  TIntegerFieldRecebimento1REC_SITUACAO	FieldNameREC_SITUACAOOriginRECEBIMENTO.REC_SITUACAO  TIntegerFieldRecebimento1REC_TOT_ITEM	FieldNameREC_TOT_ITEMOriginRECEBIMENTO.REC_TOT_ITEM  TIntegerFieldRecebimento1REC_TIPO	FieldNameREC_TIPOOriginRECEBIMENTO.REC_TIPO  TIntegerFieldRecebimento1REC_CNC_ORIGEM	FieldNameREC_CNC_ORIGEMOriginRECEBIMENTO.REC_CNC_ORIGEM  TIntegerFieldRecebimento1REC_COD_ORIGEM	FieldNameREC_COD_ORIGEMOriginRECEBIMENTO.REC_COD_ORIGEM  TDateTimeFieldRecebimento1REC_DATA_SAIDA	FieldNameREC_DATA_SAIDAOriginRECEBIMENTO.REC_DATA_SAIDA  TDateTimeFieldRecebimento1REC_DATA_EMISSAO	FieldNameREC_DATA_EMISSAOOriginRECEBIMENTO.REC_DATA_EMISSAO  TStringFieldRecebimento1REC_NUM_DOC	FieldNameREC_NUM_DOCOriginRECEBIMENTO.REC_NUM_DOC  TIntegerFieldRecebimento1PRC_CODIGO	FieldName
PRC_CODIGOOriginRECEBIMENTO.PRC_CODIGO  TStringFieldRecebimento1REC_OBSERVACAO	FieldNameREC_OBSERVACAOOriginRECEBIMENTO.REC_OBSERVACAOSize�   TIntegerFieldRecebimento1IRC_CODIGO	FieldName
IRC_CODIGOOriginRECEBIMENTO.REC_OBSERVACAO  TIntegerFieldRecebimento1CNC_CODIGO_1	FieldNameCNC_CODIGO_1OriginRECEBIMENTO.REC_OBSERVACAO  TIntegerFieldRecebimento1PRD_CODIGO	FieldName
PRD_CODIGOOriginRECEBIMENTO.REC_OBSERVACAO  TIntegerFieldRecebimento1REC_CODIGO_1	FieldNameREC_CODIGO_1OriginRECEBIMENTO.REC_OBSERVACAO  TIntegerFieldRecebimento1IRC_SITUACAO	FieldNameIRC_SITUACAOOriginRECEBIMENTO.REC_OBSERVACAO  TFloatFieldRecebimento1IRC_QUANTIDADE	FieldNameIRC_QUANTIDADEOriginRECEBIMENTO.REC_OBSERVACAO  TStringFieldRecebimento1Origem	FieldKindfkLookup	FieldNameOrigemLookupDataSetCentroCusto1LookupKeyFields
CNC_CODIGOLookupResultFieldCNC_RZ_SOCIAL	KeyFieldsREC_CNC_ORIGEMLookup	  TStringFieldRecebimento1Situacao	FieldKindfkCalculated	FieldNameSituacao
Calculated	  TStringFieldRecebimento1NumDoc	FieldKindfkCalculated	FieldNameNumDoc
Calculated	  TStringFieldRecebimento1Produto	FieldKindfkLookup	FieldNameProdutoLookupDataSetProduto1LookupKeyFields
PRD_CODIGOLookupResultFieldPRD_DESCRICAO	KeyFields
PRD_CODIGOSize2Lookup	  TStringFieldRecebimento1Referencia	FieldKindfkLookup	FieldName
ReferenciaLookupDataSetProduto1LookupKeyFields
PRD_CODIGOLookupResultFieldPRD_REFERENCIA	KeyFields
PRD_CODIGOLookup	    