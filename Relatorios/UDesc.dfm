�
 TRPT_DESC 0  TPF0	Trpt_Descrpt_DescLeft~TopXWidthIHeight[Captionrpt_DescColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight 	TSZReportreportLeft Top�WidthPHeightAColumnsColumnSpace DataSet
Descontos1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style Margins.LeftMargins.TopMargins.RightMargins.BottomOptions.CopiesOptions.DestinationzrdLPT1Options.Escapes.BoldOnEGOptions.Escapes.BoldOffFHOptions.Escapes.ItalicsOn4Options.Escapes.ItalicsOff5Options.Escapes.UnderlineOn-1Options.Escapes.UnderlineOff-0Options.Escapes.SuperScriptOnSOptions.Escapes.SuperScriptOffTOptions.Escapes.SubScriptOnS Options.Escapes.SubScriptOffTOptions.PageLengthAOptions.PageWidthPOptions.PaperTypezptSheet TSZRBandZRBand1LeftTopWidthNHeightBeforePrintZRBand1BeforePrintBandTyperbPageHeaderForceNewColumnForceNewPage 	TSZRLabelZRLabel2Left TopWidth/HeightAlignToBand	FontStyle WordWrap	CaptionSACI - Relatorio de Descontos  TSZRSysData
ZRSysData2Left0TopWidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	DatazrsDateTimeTextData/Hora.:  	TSZRLabelZRLabel3Left Top Width/HeightAlignToBand	FontStyleesUnderline BeforePrintZRLabel3BeforePrintWordWrap	CaptionEletroGuerra   	TSZRLabelZRLabel5Left TopWidthNHeightAlignToBand	FontStyle WordWrap	CaptionN==============================================================================  	TSZRLabelZRLabel1Left0Top WidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	CaptionCentro de Custo  	TSZRLabelZRLabel6Left TopWidthNHeightAlignToBand	FontStyle WordWrap	CaptionN==============================================================================  	TSZRLabelZRLabel7LeftTopWidth
HeightAlignToBand	FontStyle WordWrap	Caption
Fornecedor  	TSZRLabel	ZRLabel10Left TopWidthHeightAlignToBand	FontStyle WordWrap	CaptionCodigo  	TSZRLabel	SZRLabel1LeftTopWidthHeightAlignToBand	FontStyle WordWrap	CaptionGrupo  	TSZRLabel	SZRLabel2LeftTopWidth
HeightAlignToBand	FontStyle WordWrap	Caption
Desconto60  	TSZRLabel	SZRLabel3Left#TopWidthHeightAlignToBand	FontStyle WordWrap	CaptionDesconto Gerente   TSZRBandZRBand2LeftTopWidthNHeightBandTyperbDetailForceNewColumnForceNewPage 
TSZRDBText	ZRDBText1LeftTop Width
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSet
Descontos1	DataField
FOR_CODIGO  
TSZRDBText	ZRDBText3Left Top WidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSet
Descontos1	DataField
DES_CODIGO  
TSZRDBText
SZRDBText1LeftTop WidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSet
Descontos1	DataField
GRP_CODIGO  
TSZRDBText
SZRDBText2LeftTop Width
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSet
Descontos1	DataFieldDES_DESCONTO_60  
TSZRDBText
SZRDBText3Left#Top WidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSet
Descontos1	DataFieldDES_DESCONTO_GERENTE   TSZRBandZRBand3LeftTopWidthNHeightBandTyperbPageFooterForceNewColumnForceNewPage TSZRSysData
ZRSysData1LeftCTopWidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	DatazrsPageNumberTextP�g.:  	TSZRLabelZRLabel8Left Top WidthNHeightAlignToBand	FontStyle WordWrap	CaptionN------------------------------------------------------------------------------  	TSZRLabelZRLabel4Left TopWidth#HeightAlignToBand	FontStyleesItalic WordWrap	CaptionLantech Conectividade    
TDescontos
Descontos1DatabaseNameDBguerraSQL.StringsSELECT * FROM DESCONTOSORDER BY FOR_CODIGO, GRP_CODIGO CentroDeCusto	CodigoCNC Maquina	CodigoDES 	CodigoFOR 	CodigoGRP 	CodigoUSU Situacao LeftTop�  TIntegerFieldDescontos1DES_CODIGO	FieldName
DES_CODIGOOriginDBGUERRA.DESCONTOS.DES_CODIGO  TIntegerFieldDescontos1FOR_CODIGO	FieldName
FOR_CODIGOOriginDBGUERRA.DESCONTOS.FOR_CODIGO  TIntegerFieldDescontos1GRP_CODIGO	FieldName
GRP_CODIGOOriginDBGUERRA.DESCONTOS.GRP_CODIGO  TIntegerFieldDescontos1USU_CODIGO	FieldName
USU_CODIGOOriginDBGUERRA.DESCONTOS.USU_CODIGO  TDateTimeFieldDescontos1DES_DT_CADASTRO	FieldNameDES_DT_CADASTROOrigin"DBGUERRA.DESCONTOS.DES_DT_CADASTRO  TDateTimeFieldDescontos1DES_DT_ALTERADO	FieldNameDES_DT_ALTERADOOrigin"DBGUERRA.DESCONTOS.DES_DT_ALTERADO  TFloatFieldDescontos1DES_DESCONTO_60	FieldNameDES_DESCONTO_60Origin"DBGUERRA.DESCONTOS.DES_DESCONTO_60DisplayFormat0.00  TIntegerFieldDescontos1DES_SITUACAO	FieldNameDES_SITUACAOOriginDBGUERRA.DESCONTOS.DES_SITUACAO  TFloatFieldDescontos1DES_DESCONTO_GERENTE	FieldNameDES_DESCONTO_GERENTEOrigin'DBGUERRA.DESCONTOS.DES_DESCONTO_GERENTEDisplayFormat0.00  TIntegerFieldDescontos1CNC_CODIGO	FieldName
CNC_CODIGOOriginDBGUERRA.DESCONTOS.CNC_CODIGO    