�
 TRPT_FORNPROD 0�  TPF0Trpt_fornprodrpt_fornprodLeft� Top� Width(Height`Caption   Relatório dos ProdutosColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight 	TSZReportreportLeft Top Width� HeightAColumnsColumnSpace DataSetFornecedor1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Font.Style Margins.LeftMargins.TopMargins.RightMargins.BottomOptions.CopiesOptions.DestinationzrdLPT1Options.Escapes.BoldOnEGOptions.Escapes.BoldOffFHOptions.Escapes.ItalicsOn4Options.Escapes.ItalicsOff5Options.Escapes.UnderlineOn-1Options.Escapes.UnderlineOff-0Options.Escapes.SuperScriptOnSOptions.Escapes.SuperScriptOffTOptions.Escapes.SubScriptOnS Options.Escapes.SubScriptOffTOptions.PageLengthAOptions.PageWidth� Options.PaperTypezptSheet TSZRBandZRBand1LeftTopWidth� HeightBeforePrintZRBand1BeforePrintBandTyperbPageHeaderForceNewColumnForceNewPage 	TSZRLabelZRLabel2Left TopWidth/HeightAlignToBand	FontStyle WordWrap	Caption SIAC - Fornecedores por Produtos  TSZRSysData
ZRSysData2LeftdTopWidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	DatazrsDateTimeTextData/Hora.:  	TSZRLabelZRLabel3Left Top Width/HeightAlignToBand	FontStyle BeforePrintZRLabel3BeforePrintWordWrap	CaptionEletroGuerra   	TSZRLabelZRLabel5Left TopWidth� HeightAlignToBand	FontStyle WordWrap	Caption�==================================================================================================================================  	TSZRLabelZRLabel1LeftdTop WidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	CaptionCentro de Custo  	TSZRLabelZRLabel6Left TopWidth� HeightAlignToBand	FontStyle WordWrap	Caption�==================================================================================================================================  	TSZRLabelZRLabel7LeftTopWidthHeightAlignToBand	FontStyle WordWrap	Caption   Cód.  	TSZRLabelZRLabel9LeftTopWidth+HeightAlignToBand	FontStyle WordWrap	CaptionFornecedor (Razao Social)  	TSZRLabel	ZRLabel17Left9TopWidthHeightAlignToBand	FontStyle WordWrap	CaptionTelefone  	TSZRLabel	SZRLabel1Left TopWidthHeightAlignToBand	FontStyle WordWrap	CaptionCodigo  	TSZRLabel	SZRLabel2LeftTopWidth<HeightAlignToBand	FontStyle WordWrap	CaptionProduto(Descricao)  	TSZRLabel	SZRLabel3LeftxTopWidth
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	Caption	Pr. Venda  	TSZRLabel	SZRLabel4LeftDTopWidthHeightAlignToBand	FontStyle WordWrap	CaptionUnid.  	TSZRLabel	SZRLabel5LeftJTopWidthHeightAlignToBand	FontStyle WordWrap	CaptionDetalhe  	TSZRLabel	SZRLabel6Left_TopWidthHeightAlignToBand	FontStyle WordWrap	Caption
Referencia  	TSZRLabel	SZRLabel7LeftJTopWidthHeightAlignToBand	FontStyle WordWrap	CaptionFax  	TSZRLabel
zrlFiltrosLeft TopWidth� HeightAlignToBand	FontStyle WordWrap	   TSZRBandZRBand2LeftTop
Width� HeightBandTyperbDetailForceNewColumnForceNewPage 
TSZRDBText	ZRDBText1LeftTop WidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetFornecedor1	DataField
FOR_CODIGO  
TSZRDBText	ZRDBText2LeftTop Width+HeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetFornecedor1	DataFieldFOR_RZ_SOCIAL  
TSZRDBText	ZRDBText4Left9Top WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetFornecedor1	DataFieldFOR_FONE  
TSZRDBText
SZRDBText1LeftJTop WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetFornecedor1	DataFieldFOR_FONE   TSZRBandZRBand3LeftTopWidth� HeightBeforePrintZRBand3BeforePrintBandTyperbPageFooterForceNewColumnForceNewPage TSZRSysData
ZRSysData1LeftwTopWidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	DatazrsPageNumberText   Pág.:  	TSZRLabelZRLabel8Left Top Width� HeightAlignToBand	FontStyle WordWrap	Caption�----------------------------------------------------------------------------------------------------------------------------------  	TSZRLabelZRLabel4Left TopWidth"HeightAlignToBand	FontStyleesItalic WordWrap	CaptionEmpresaDesenvolvedora  	TSZRLabel
zrlUsuarioLeft#TopWidth(HeightAlignToBand	FontStyleesItalic WordWrap	   	TSZRGroupZRGroup1LeftTop	Width� Height
Expression
PRD_CODIGO
FooterBandZRBand4MasterreportForceNewColumnForceNewPage 
TSZRDBText	ZRDBText3LeftTop Width<HeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetFornecedor1	DataFieldPRD_DESCRICAO  
TSZRDBText	ZRDBText6Left Top WidthHeight	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetFornecedor1	DataField
PRD_CODIGO  	TSZRLabel	ZRLabel14LeftTop WidthHeightAlignToBand	FontStyle WordWrap	Caption-  TSZRExpressionZRExpression1LeftxTop Width
Height	AlignmenttaRightJustifyAlignToBand	FontStyle WordWrap	CurrencyResetAfterPrint
ExpressionPRD_PRECO_VENDAMask0.00  
TSZRDBText
SZRDBText2LeftDTop WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetFornecedor1	DataFieldPRD_UNIDADE  
TSZRDBText
SZRDBText3LeftJTop WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetFornecedor1	DataFieldPRD_DETALHE  
TSZRDBText
SZRDBText4Left_Top WidthHeightAlignToBand	FontStyle WordWrap	BlankIfZeroDataSetFornecedor1	DataFieldPRD_REFERENCIA   TSZRBandZRBand4LeftTopWidth� HeightBandTyperbGroupFooterForceNewColumnForceNewPage TSZRFrameLineZRFrameLine1Left Top Width� Height
FrameStylefsHorizontal    TFornecedorFornecedor1DatabaseNameDBguerraSQL.Strings?SELECT T1.CNC_CODIGO,T1.FOR_CODIGO,T1.PPF_CODIGO,T1.PRD_CODIGO,5       T2.PRD_REFERENCIA,T2.PRD_UNIDADE,T2.PRD_MARCA,:       T2.PRD_DESCRICAO,T2.PRD_PRECO_VENDA,T2.PRD_DETALHE,4       T3.FOR_NOME_FAN, T3.FOR_RZ_SOCIAL,T3.FOR_FONE9FROM Produto_por_Fornecedor T1, Produto T2, Fornecedor T3*WHERE (T1.PRD_CODIGO = T2.PRD_CODIGO) AND G               (T1.FOR_CODIGO = T3.FOR_CODIGO) AND (T2.PRD_SITUACAO<>1)ORDER BY T3.FOR_RZ_SOCIAL ASC  	CNCOrigem CentroDeCusto	CodigoCNC 	CodigoUSU Mafalda MaquinaTabela
FORNECEDORBanco 	CodigoCCX 	CodigoFOR 
Logradouro MaxItensNota Situacao LeftTop�    