unit ZRConst;

interface

{$R ZRConst.RES}

const
  SzrBase = $A000;

  SzrTitle        = SzrBase +  0;
  SzrPageHeader   = SzrBase +  1;
  SzrDetail       = SzrBase +  2;
  SzrPageFooter   = SzrBase +  3;
  SzrSummary      = SzrBase +  4;
  SzrGroupHeader  = SzrBase +  5;
  SzrGroupFooter  = SzrBase +  6;
  SzrSubDetail    = SzrBase +  7;
  SzrColumnHeader = SzrBase +  8;
  SzrColumnFooter = SzrBase +  9;
  SzrChild        = SzrBase + 10;

  SzrTitleBandName        = SzrBase + 11;
  SzrPageHeaderBandName   = SzrBase + 12;
  SzrDetailBandName       = SzrBase + 13;
  SzrPageFooterBandName   = SzrBase + 14;
  SzrSummaryBandName      = SzrBase + 15;
  SzrGroupHeaderBandName  = SzrBase + 16;
  SzrGroupFooterBandName  = SzrBase + 17;
  SzrSubDetailBandName    = SzrBase + 18;
  SzrColumnHeaderBandName = SzrBase + 19;
  SzrColumnFooterBandName = SzrBase + 20;
  SzrChildBandName        = SzrBase + 21;
  
  SzrParentReport         = SzrBase + 30;
  SzrParentBand           = SzrBase + 31;
  SzrZRPrinterNotReady    = SzrBase + 32;
  SzrZRPrinterNotFinished = SzrBase + 33;
  SzrIllegalNewPage       = SzrBase + 34;
  SzrIllegalPageRange     = SzrBase + 35;
  SzrNoCircular           = SzrBase + 36;
  SzrErrorInExpr          = SzrBase + 37;
  SzrNone                 = SzrBase + 38;
  SzrCompleted            = SzrBase + 39;

  SzrProcessing           = SzrBase + 40;
  SzrPrinting             = SzrBase + 41;
  SzrPage                 = SzrBase + 42;
  SzrOf                   = SzrBase + 43;
  SzrFileNotExist         = SzrBase + 44;
  SzrFirstPageHint        = SzrBase + 45;
  SzrPrevPageHint         = SzrBase + 46;
  SzrNextPageHint         = SzrBase + 47;
  SzrLastPageHint         = SzrBase + 48;
  SzrSaveReportHint       = SzrBase + 49;
  SzrLoadReportHint       = SzrBase + 50;
  SzrPrintReportHint      = SzrBase + 51;
  SzrPrintReport          = SzrBase + 52;

  SzrPrinterSetup         = SzrBase + 53;
  SzrDestination          = SzrBase + 54;
  SzrDestinationFile      = SzrBase + 55;
  SzrDestinationLPT       = SzrBase + 56;
  SzrBrowse               = SzrBase + 57;
  SzrFileFilter           = SzrBase + 58;
  SzrPages                = SzrBase + 59;
  SzrPagesAll             = SzrBase + 60;
  SzrPagesRange           = SzrBase + 61;
  SzrPagesRangeFrom       = SzrBase + 62;
  SzrPagesRangeTo         = SzrBase + 63;
  SzrCopies               = SzrBase + 64;

  SzrOK                   = SzrBase + 70;
  SzrCancel               = SzrBase + 71;
  SzrExit                 = SzrBase + 72;

  SzrTime                 = SzrBase + 80;
  SzrDate                 = SzrBase + 81;
  SzrDateTime             = SzrBase + 82;
  SzrPageNum              = SzrBase + 83;
  SzrReportTitle          = SzrBase + 84;
  SzrDetailCount          = SzrBase + 85;
  SzrDetailNo             = SzrBase + 86;

  SzrQSD              = SzrBase +  90;
  SzrIfDesc           = SzrBase +  91;
  SzrStrDesc          = SzrBase +  92;
  SzrTimeDesc         = SzrBase +  93;
  SzrDateDesc         = SzrBase +  94;
  SzrSumDesc          = SzrBase +  95;
  SzrCopyDesc         = SzrBase +  96;
  SzrCountDesc        = SzrBase +  97;
  SzrMaxDesc          = SzrBase +  98;
  SzrMinDesc          = SzrBase +  99;
  SzrAverageDesc      = SzrBase + 100;
  SzrBoolDesc         = SzrBase + 101;
  SzrIntDesc          = SzrBase + 102;
  SzrFracDesc         = SzrBase + 103;
  SzrSqrtDesc         = SzrBase + 104;
  SzrTypeofDesc       = SzrBase + 105;
  SzrUpperDesc        = SzrBase + 106;
  SzrLowerDesc        = SzrBase + 107;
  SzrPrettyDesc       = SzrBase + 108;
  SzrFormatFloatDesc  = SzrBase + 109;

implementation

end.

