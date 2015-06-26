unit MxSelAniversario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TfMxSelAniversario = class(TForm)
    Panel2: TPanel;
    SpeedButton5: TSpeedButton;
    bitConfirmar: TBitBtn;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    procedure SpeedButton5Click(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxSelAniversario: TfMxSelAniversario;

implementation
uses UDM, Funcoes, MxSelCliente, UClienteAniversariante,
  UClienteAniversarianteRelatorio, UClienteAniversarianteLUOTICA;

{$R *.DFM}

procedure TfMxSelAniversario.SpeedButton5Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelAniversario.bitConfirmarClick(Sender: TObject);
var
  sAniversarico1, sAniversarico2: string;
begin
  sAniversarico1 := '';
  sAniversarico2 := '';
  if not fMxSelCliente.ckbAniversarioContato.Checked then
  Begin
    sAniversarico1 := ' AND DATEPART(mm,T1.CLI_DATA_NASC)='+IntToStr(fMxSelCliente.cmbMesAniversario.ItemIndex+1);
    if fMxSelCliente.edtDiaAniversario.Text <> '' then
      sAniversarico2 := ' AND DATEPART(dd,T1.CLI_DATA_NASC)='+fMxSelCliente.edtDiaAniversario.Text;
  end
  else if fMxSelCliente.edtDiaAniversario.Text = '' then
  Begin
     sAniversarico1 := ' AND EXISTS (SELECT FOR_CODIGO FROM CONTATO C10 '+
       ' WHERE C10.CNC_FOR=T1.CNC_CODIGO '+
       ' AND C10.FOR_CODIGO=T1.CLI_CODIGO '+
       ' AND DATEPART(mm,C10.CNT_DT_NASCIMENTO)='+IntToStr(fMxSelCliente.cmbMesAniversario.ItemIndex+1)+') ';
  end
  else
     sAniversarico1 := ' AND EXISTS (SELECT FOR_CODIGO FROM CONTATO C10 '+
       ' WHERE C10.CNC_FOR=T1.CNC_CODIGO '+
       ' AND C10.FOR_CODIGO=T1.CLI_CODIGO '+
       ' AND DATEPART(mm,C10.CNT_DT_NASCIMENTO)='+IntToStr(fMxSelCliente.cmbMesAniversario.ItemIndex+1)+
       ' AND DATEPART(dd,C10.CNT_DT_NASCIMENTO)='+fMxSelCliente.edtDiaAniversario.Text+') ';

  case RadioGroup1.ItemIndex of
   0: Begin
        if DM.Configuracao1.Empresa = empLuciano then
        begin
          Application.CreateForm(Trpt_clienteAniversarianteLUOTICA, rpt_clienteAniversarianteLUOTICA);
          with rpt_clienteAniversarianteLUOTICA do
          Begin
            Cliente1.Close;
            if DM.Configuracao1.SqlInterbase = 1 then
              Cliente1.SQL.Text:='SELECT * FROM CLIENTE T1 '+
                fMxSelCliente.Centro+fMxSelCliente.USU+fMxSelCliente.Cred+fMxSelCliente.cUltimaPag+fMxSelCliente.CLIInad+fMxSelCliente.Valor+
                fMxSelCliente.DATACliIni+fMxSelCliente.DATACliFim+fMxSelCliente.Sit+fMxSelCliente.CdCLI+fMxSelCliente.CdConvenio+fMxSelCliente.cSPC+
                fMxSelCliente.cUltimaCompra+fMxSelCliente.sClassificacao+fMxSelCliente.sTipo+
                sAniversarico1+
                sAniversarico2+
                fMxSelCliente.Ordem
            else //Interbase
              Cliente1.SQL.Text:='SELECT * FROM CLIENTE T1 '+
              fMxSelCliente.Centro+fMxSelCliente.USU+fMxSelCliente.Cred+fMxSelCliente.cUltimaPag+fMxSelCliente.CLIInad+fMxSelCliente.Valor+
              fMxSelCliente.DATACliIni+fMxSelCliente.DATACliFim+fMxSelCliente.Sit+fMxSelCliente.CdCLI+fMxSelCliente.CdConvenio+fMxSelCliente.cSPC+
              fMxSelCliente.cUltimaCompra+fMxSelCliente.sClassificacao+fMxSelCliente.sTipo+
              ' AND T1.CLI_DATA_NASC>="12/31/1800" '+fMxSelCliente.Ordem;
            Cliente1.Open;
            if Cliente1.isEmpty then
              Raise exception.Create('Consulta Vazia!');
            report.Preview;
            Close;
          end;
        end
        else
        begin
          Application.CreateForm(Trpt_clienteAniversariante, rpt_clienteAniversariante);
          with rpt_clienteAniversariante do
          Begin
            Cliente1.Close;
            if DM.Configuracao1.SqlInterbase = 1 then
              Cliente1.SQL.Text:='SELECT * FROM CLIENTE T1 '+
                fMxSelCliente.Centro+fMxSelCliente.USU+fMxSelCliente.Cred+fMxSelCliente.cUltimaPag+fMxSelCliente.CLIInad+
                fMxSelCliente.DATACliIni+fMxSelCliente.DATACliFim+fMxSelCliente.Sit+fMxSelCliente.Valor+
                fMxSelCliente.CdCLI+fMxSelCliente.CdConvenio+fMxSelCliente.cSPC+
                fMxSelCliente.cUltimaCompra+fMxSelCliente.sClassificacao+fMxSelCliente.sTipo+
                sAniversarico1+
                sAniversarico2+
                fMxSelCliente.Ordem
            else //Interbase
              Cliente1.SQL.Text:='SELECT * FROM CLIENTE T1 '+
              fMxSelCliente.Centro+fMxSelCliente.USU+fMxSelCliente.Cred+fMxSelCliente.cUltimaPag+fMxSelCliente.CLIInad+
              fMxSelCliente.DATACliIni+fMxSelCliente.DATACliFim+fMxSelCliente.Sit+fMxSelCliente.Valor+
              fMxSelCliente.CdCLI+fMxSelCliente.CdConvenio+fMxSelCliente.cSPC+
              fMxSelCliente.cUltimaCompra+fMxSelCliente.sClassificacao+fMxSelCliente.sTipo+
              ' AND T1.CLI_DATA_NASC>="12/31/1800" '+fMxSelCliente.Ordem;
            Cliente1.Open;
            if Cliente1.isEmpty then
              Raise exception.Create('Consulta Vazia!');
            report.Preview;
            Close;
          end;
        end;
      end;
   1: Begin
        Application.CreateForm(Trpt_clienteAniversarianteRelatorio, rpt_clienteAniversarianteRelatorio);
        with rpt_clienteAniversarianteRelatorio do
        Begin
          Cliente1.Close;
          if DM.Configuracao1.SqlInterbase = 1 then
            Cliente1.SQL.Text:='SELECT * FROM CLIENTE T1 '+
              fMxSelCliente.Centro+fMxSelCliente.USU+fMxSelCliente.Cred+fMxSelCliente.cUltimaPag+fMxSelCliente.CLIInad+
              fMxSelCliente.DATACliIni+fMxSelCliente.DATACliFim+fMxSelCliente.Valor+
              fMxSelCliente.CdCLI+fMxSelCliente.CdConvenio+fMxSelCliente.cSPC+fMxSelCliente.Sit+
              fMxSelCliente.cUltimaCompra+fMxSelCliente.sClassificacao+fMxSelCliente.sTipo+
              sAniversarico1+
              sAniversarico2+
              fMxSelCliente.Ordem
          else //Interbase
            Cliente1.SQL.Text:='SELECT * FROM CLIENTE T1 '+
              fMxSelCliente.Centro+fMxSelCliente.USU+fMxSelCliente.Cred+fMxSelCliente.cUltimaPag+fMxSelCliente.CLIInad+
              fMxSelCliente.DATACliIni+fMxSelCliente.DATACliFim+fMxSelCliente.Valor+
              fMxSelCliente.CdCLI+fMxSelCliente.CdConvenio+fMxSelCliente.cSPC+fMxSelCliente.Sit+
              fMxSelCliente.cUltimaCompra+fMxSelCliente.sClassificacao+fMxSelCliente.sTipo+
              ' AND T1.CLI_DATA_NASC>="12/31/1800" '+fMxSelCliente.Ordem;
          Cliente1.Open;
          if Cliente1.isEmpty then
            Raise exception.Create('Consulta Vazia!');
          report.Preview;
          Close;
        end;
      end;
  end;
  Close;
end;

procedure TfMxSelAniversario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=caFree;
end;

procedure TfMxSelAniversario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TfMxSelAniversario.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
end;

end.
