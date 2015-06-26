unit UReciboGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, SQuery, Funcionario,
  QRExport, Item_de_Cota, Extenso, CentroCusto, Cliente, Titulo_receber,
  jpeg;

type
  Trpt_ReciboGrafico = class(TForm)
    report: TQuickRep;
    zrbDetalhe: TQRBand;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    Titulo_receber1: TTitulo_receber;
    CentroCusto1: TCentroCusto;
    Extenso1: TValorPorExtenso;
    qriLogomarca: TQRImage;
    zrlTitulo: TQRLabel;
    QRShape1: TQRShape;
    zrlSifrao: TQRLabel;
    QRShape2: TQRShape;
    zrlTelefoneLoja: TQRLabel;
    zrlEnderecoLoja: TQRLabel;
    zrlCidadeEstado: TQRLabel;
    zrlEMailLoja: TQRLabel;
    zrlDescCliente: TQRLabel;
    zrlDataExtenso: TQRLabel;
    zrlNomeEmpresa: TQRLabel;
    zrlCNPJ: TQRLabel;
    zrlValor: TQRLabel;
    zrlCodigoTRC: TQRLabel;
    Cliente1: TCliente;
    zrlAVistaPrazo: TQRLabel;
    zrlDescCodigoTRC: TQRLabel;
    zrlDescVencimento: TQRLabel;
    zrlVencimento: TQRLabel;
    zrlMensagemCheque: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Pagina : integer;
  public
    DataINI, DataFIM: TDateTime;
    Entidade : TTitulo_receber;
    SomenteEntra, PrimeiraPag, VendaPz, vReciboTotal : Boolean;
    vTotalRecibo: Double;
  end;

var
  rpt_ReciboGrafico: Trpt_ReciboGrafico;

implementation

uses UDM, Funcoes, MxSPediLocImpPromis, DateUtils, MaskUtils;

{$R *.dfm}

procedure Trpt_ReciboGrafico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Trpt_ReciboGrafico.FormCreate(Sender: TObject);
begin
  Entidade := Titulo_receber1;
  vTotalRecibo := 0;
  SomenteEntra := False;
  PrimeiraPag := True;
  VendaPz := True;
  vReciboTotal := False;
  Pagina := 1;
end;

procedure Trpt_ReciboGrafico.zrbDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
const
  mes : array [1..12] of string = ('janeiro','fevereiro','marco','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro');
var
  S, sCidade, sNomeLogo : string;
begin
  if (SomenteEntra) and (not PrimeiraPag) then
  Begin
    PrintBand := False;
    Exit;
  end;

  sNomeLogo := DM.Configuracao1.PastaImagens+'\LogoPequeno.';

  //Identificar a Cidade e CNPJ da Loja
  with CentroCusto1 do
  Begin
    if CodigoCNC <> DM.Configuracao1.CodigoCNC then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := DM.Configuracao1.CodigoCNC;
      Open;
    end;
    zrlCNPJ.Caption := CGC;
    sCidade := Cidade;
  end;

  if (DM.Configuracao1.Empresa <> empLBM) or
     (DM.Configuracao1.CodigoCNC = 3) then
  Begin
    qriLogomarca.Top := 10;
    if FileExists(sNomeLogo+'JPG') then
      qriLogomarca.Picture.LoadFromFile(sNomeLogo+'JPG')
    else if FileExists(sNomeLogo+'BMP') then
      qriLogomarca.Picture.LoadFromFile(sNomeLogo+'BMP')
    else //Arquivo não encontrado
      qriLogomarca.Visible := False;

    with DM.CentroCusto1 do
    Begin
      zrlTelefoneLoja.Caption := Fone;
      //Endereço
      DM.SelecionaParametro(Logradouro);
      if not DM.Parametro1.IsEmpty then
        zrlEnderecoLoja.Caption := DM.Parametro1.Descricao + ' ' + Endereco
      else
        zrlEnderecoLoja.Caption := Endereco;
      zrlEnderecoLoja.Caption := zrlEnderecoLoja.Caption + ' ' + Bairro;
      zrlCidadeEstado.Caption := Cidade + '/' + Uf;
      zrlEMailLoja.Caption    := Site;
      zrlNomeEmpresa.Caption    := RazaoSocial;
    end;
  end;

  zrlDescCliente.Caption := 'Recebemos de';

  //Nome do Cliente
  with Cliente1 do
  Begin
    if (CodigoCNC <> Entidade.ClienteCNC) or
       (CodigoCLI <> Entidade.CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    zrlDescCliente.Caption := zrlDescCliente.Caption + ' ' + Cliente1.RazaoSocial;
  end;

  zrlDescCliente.Caption := zrlDescCliente.Caption + ' a quantia discriminada de ';

  //Definir Valor do Recibo e Extenso
  if vTotalRecibo = 0 then //Recibo não avulso e nem Total Pedido
    vTotalRecibo := Entidade.Valor;

  zrlValor.Caption := FormatFloat('#,##0.00',vTotalRecibo);
  Extenso1.Valor   := vTotalRecibo;
  S := Extenso1.Texto;
  zrlDescCliente.Caption := zrlDescCliente.Caption + ' (' + UpperCase(S)+')';

  if vReciboTotal then
  Begin
    zrlDescCodigoTRC.Caption := '';
    zrlCodigoTRC.Caption := '';
    zrlDescVencimento.Caption := '';
    zrlVencimento.Caption := '';
  end
  else
  Begin
    zrlCodigoTRC.Caption := IntToStr(Entidade.CodigoTRC)+' / '+Entidade.Sequencia;
    zrlVencimento.Caption := DateToStr(Entidade.Vencimento);
  end;

  if Titulo_receber1.TipoPag = 6 then
    zrlMensagemCheque.Enabled := True
  else
    zrlMensagemCheque.Enabled := False;

  //

  //Data por Extenso
  zrlDataExtenso.Caption := sCidade+', '+
    FormatDateTime('dd',DM.Configuracao1.Data)+' de '+mes[StrToInt(FormatDateTime('mm',DM.Configuracao1.Data))]+
    ' de '+FormatDateTime('yyyy',DM.Configuracao1.Data);

  PrimeiraPag := False;

  inc(Pagina);
end;

end.
