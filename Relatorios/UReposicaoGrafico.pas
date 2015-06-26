unit UReposicaoGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, SQuery, Funcionario,
  QRExport, Item_de_Cota, Extenso, CentroCusto, Cliente, Titulo_receber,
  jpeg, Reposica,DateUtils, MaskUtils;

type
  Trpt_ReposicaoGrafico = class(TForm)
    report: TQuickRep;
    zrbDetalhe: TQRBand;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    CentroCusto1: TCentroCusto;
    qriLogomarca: TQRImage;
    zrlTitulo: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    zrlTelefoneLoja: TQRLabel;
    zrlEnderecoLoja: TQRLabel;
    zrlCidadeEstado: TQRLabel;
    zrlFornecedorRazaoSocial: TQRLabel;
    zrlDataExtenso: TQRLabel;
    zrlCentroDeCusto: TQRLabel;
    zrlEMail: TQRLabel;
    zrlProduto: TQRLabel;
    zrlDescricao: TQRLabel;
    Reposicao1: TReposicao;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    zrlObservacao: TQRLabel;
    zrlCodigoREP: TQRLabel;
    zrlDataCadastro: TQRLabel;
    zrlFornecedorEndereco: TQRLabel;
    zrlFornecedorFone: TQRLabel;
    QRLabel3: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure zrbDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Pagina : integer;
  public
    Entidade : TReposicao;
    PrimeiraPag: Boolean;
  end;

var
  rpt_ReposicaoGrafico: Trpt_ReposicaoGrafico;

implementation

uses UDM, Funcoes;

{$R *.dfm}

procedure Trpt_ReposicaoGrafico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Trpt_ReposicaoGrafico.FormCreate(Sender: TObject);
begin
  Entidade := Reposicao1;
  Pagina := 1;
end;

procedure Trpt_ReposicaoGrafico.zrbDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
const
  mes : array [1..12] of string = ('janeiro','fevereiro','marco','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro');
var
  sCidade : string;
begin
//  sNomeLogo := DM.Configuracao1.PastaImagens+'\LogoPequeno.';

  //Identificar a Cidade e CNPJ da Loja
  with CentroCusto1 do
  Begin
    if (not Active) or
       (CodigoCNC <> DM.Configuracao1.CodigoCNC) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.CNCOrigem;
      Open;
    end;
    zrlCentroDeCusto.Caption := RazaoSocial;
    zrlEMail.Caption := EMail;
    sCidade := Cidade;
  end;

{  if (DM.Configuracao1.Empresa <> empLBM) or
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
}

  with Entidade do
  Begin
    zrlCodigoREP.Caption := 'Cód: '+PreencheZero(2,CodigoCNC)+'-'+PreencheZero(6,CodigoREP);
    zrlDataCadastro.Caption := 'Cad: '+DateToStr(DataCadastro);
//    if DataAlterado > 0 then
//      zrlDataAlterado.Caption := DateTimeToStr(DataAlterado)
//    else
//      zrlDataAlterado.Caption := '';

    with DM.QR_Consultas do
    Begin
      //Fornecedor
      Close;
      SQL.Text := 'SELECT * FROM FORNECEDOR '+
        ' WHERE FOR_CODIGO='+IntToStr(CodigoFOR);
      Open;
      zrlFornecedorRazaoSocial.Caption := 'FORNECEDOR: '+FieldByName('FOR_RZ_SOCIAL').asString+' ('+FieldByName('FOR_CODIGO').asString+')';
      zrlFornecedorEndereco.Caption    := 'ENDEREÇO: '+FieldByName('FOR_ENDERECO').asString+' '+
                                          FieldByName('FOR_BAIRRO').asString+' '+
                                          FieldByName('FOR_CIDADE').asString+'/'+
                                          FieldByName('FOR_UF').asString;
      zrlFornecedorFone.Caption := 'FONE/FAX: '+Trim(FieldByName('FOR_FONE').asString+' '+FieldByName('FOR_FAX').asString);

      //Produto
      Close;
      SQL.Text := 'SELECT * FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD);
      Open;
      zrlProduto.Caption := FieldByName('PRD_DESCRICAO').asString+' '+
                            FieldByName('PRD_CARACTERISTICA').asString+' '+
                            FieldByName('PRD_REFERENCIA').asString+' ('+FieldByName('PRD_CODIGO').asString+')';
    end;


    zrlDescricao.Caption := Descricao;

{    case Situacao of
      0: zrlSituacao.Caption := 'PENDENTE';
      1: zrlSituacao.Caption := 'DESATIVADO';
      2: zrlSituacao.Caption := 'ENTREGUE';
    end;
}

    zrlObservacao.Caption := OBS;
  end;

  //Data por Extenso
  zrlDataExtenso.Caption := sCidade+', '+
    FormatDateTime('dd',DM.Configuracao1.Data)+' de '+mes[StrToInt(FormatDateTime('mm',DM.Configuracao1.Data))]+
    ' de '+FormatDateTime('yyyy',DM.Configuracao1.Data);

  PrimeiraPag := False;

  inc(Pagina);
end;

end.
