’
 TRPT_COMPROVANTECONTROLEVEICULO 04  TPF0Trpt_ComprovanteControleVeiculorpt_ComprovanteControleVeiculoLeftTop° BorderIconsbiSystemMenu
biMaximize BorderStylebsDialogCaption\ClientHeightčClientWidth©Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style OldCreateOrder	OnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight 	TSZReportreportLeft Top Width Height ColumnsColumnSpace Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameCourier New
Font.Style Margins.LeftMargins.TopMargins.RightMargins.BottomOptions.CopiesOptions.DestinationzrdLPT1Options.Escapes.BoldOnEGOptions.Escapes.BoldOffFHOptions.Escapes.ItalicsOn4Options.Escapes.ItalicsOff5Options.Escapes.UnderlineOn-1Options.Escapes.UnderlineOff-0Options.Escapes.SuperScriptOnSOptions.Escapes.SuperScriptOffTOptions.Escapes.SubScriptOnS Options.Escapes.SubScriptOffTOptions.PageLength Options.PageWidth Options.PaperTypezptSheet TSZRBandzrbCabecalhoPaginaLeftTopWidth HeightBeforePrintzrbCabecalhoPaginaBeforePrintBandTyperbPageHeaderForceNewColumnForceNewPage 	TSZRLabelZRLabel2Left TopWidth/HeightAlignToBand	FontStyle WordWrap	Caption&SIAC - Comprovante de Controle Veiculo  TSZRSysData
ZRSysData2LeftVTopWidth2Height	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	DatazrsDateTimeTextData/Hora.:  	TSZRLabelZRLabel3Left Top Width/HeightAlignToBand	FontStyle WordWrap	CaptionEletroGuerra   	TSZRLabelZRLabel5Left TopWidth HeightAlignToBand	FontStyle WordWrap	Caption========================================================================================================================================  	TSZRLabelZRLabel1LeftVTop Width2Height	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	CaptionCentro de Custo  	TSZRLabel	SZRLabel1Left TopWidth	HeightAlignToBand	FontStyle WordWrap	Caption	Veiculo :  	TSZRLabel
zrlVeiculoLeft
TopWidth~HeightAlignToBand	FontStyle WordWrap	  	TSZRLabel	SZRLabel2Left TopWidth	HeightAlignToBand	FontStyle WordWrap	Caption	Codigo  :  	TSZRLabelzrlCodigoMTVLeft
TopWidth
HeightAlignToBand	FontStyle WordWrap	  	TSZRLabel	SZRLabel3LeftTopWidth	HeightAlignToBand	FontStyle WordWrap	Caption	Cadastro:  	TSZRLabelzrlDataCadastroLeft"TopWidthHeightAlignToBand	FontStyle WordWrap	  	TSZRLabel	SZRLabel5Left9TopWidth	HeightAlignToBand	FontStyle WordWrap	Caption	Alterado:  	TSZRLabelzrlDataAlteradoLeftCTopWidthHeightAlignToBand	FontStyle WordWrap	  	TSZRLabel	SZRLabel7Left TopWidth	HeightAlignToBand	FontStyle WordWrap	Caption	Detalhe :  	TSZRLabel
zrlDetalheLeft
TopWidth~HeightAlignToBand	FontStyle WordWrap	  	TSZRLabel	SZRLabel9Left TopWidth	HeightAlignToBand	FontStyle WordWrap	Caption	Obs     :  	TSZRLabelzrlObservacaoLeft
TopWidth~HeightAlignToBand	FontStyle WordWrap	  	TSZRLabel
SZRLabel11Left Top
Width	HeightAlignToBand	FontStyle WordWrap	Caption	Tipo    :  	TSZRLabelzrlTipoLeft
Top
WidthHeightAlignToBand	FontStyle WordWrap	  	TSZRLabel
SZRLabel13Left TopWidth	HeightAlignToBand	FontStyle WordWrap	Caption	Odometro:  	TSZRLabelzrlOdometroLeft
TopWidth5HeightAlignToBand	FontStyle WordWrap	  	TSZRLabelzrlDescQuantidadeLeft$Top
WidthHeightAlignToBand	FontStyle WordWrap	CaptionQuantidade:  	TSZRLabelzrlQuantidadeLeft1Top
WidthHeightAlignToBand	FontStyle WordWrap	  	TSZRLabelzrlDescValorTotalLeftCTop
WidthHeightAlignToBand	FontStyle WordWrap	CaptionValor Total: R$  	TSZRLabelzrlValorTotalLeftSTop
WidthHeightAlignToBand	FontStyle WordWrap	  	TSZRLabel
SZRLabel19Left TopWidth	HeightAlignToBand	FontStyle WordWrap	Caption	Situacao:  	TSZRLabelzrlSituacaoLeft
TopWidthHeightAlignToBand	FontStyle WordWrap	   TSZRBandzrbRodapePaginaLeftTopWidth HeightBeforePrintzrbRodapePaginaBeforePrintBandTyperbPageFooterForceNewColumnForceNewPage TSZRSysData
ZRSysData1Left}TopWidthHeight	AlignmenttaRightJustifyAlignToBand		FontStyle WordWrap	DatazrsPageNumberText   PĆ”g.:  	TSZRLabelZRLabel8Left Top Width HeightAlignToBand	FontStyle WordWrap	Caption----------------------------------------------------------------------------------------------------------------------------------------  	TSZRLabelZRLabel4Left TopWidthHeightAlignToBand	FontStyleesItalic WordWrap	CaptionEmpresaDesenvolvedora  	TSZRLabel
zrlUsuarioLeftTopWidth,HeightAlignToBand	FontStyleesItalic WordWrap	    TControle_de_VeiculoControle_de_Veiculo1DatabaseNameDBguerraSQL.StringsSELECT * FROM CONTROLE_VEICULOWHERE CNC_CODIGO=:CNC_CODIGOAND MTV_CODIGO=:MTV_CODIGO 	CNCOrigem CentroDeCusto	CodigoCNC 	CodigoUSU Mafalda MaquinaTabelaCONTROLE_VEICULO	CodigoMTV 	CodigoVEI KilometragemFIM KilometragemINI Situacao Tipo LeftTopĒ	ParamDataDataType	ftIntegerName
CNC_CODIGO	ParamType	ptUnknown DataType	ftIntegerName
MTV_CODIGO	ParamType	ptUnknown     