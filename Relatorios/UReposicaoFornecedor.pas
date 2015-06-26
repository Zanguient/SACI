unit UReposicaoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, StdCtrls,
  Reposica;

type
  Trpt_ReposicaoFornecedor = class(TForm)
    report: TSZReport;
    zrbCabecalhoPagina: TSZRBand;
    zrbRodapePagina: TSZRBand;
    ZRSysData1: TSZRSysData;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel8: TSZRLabel;
    ZRLabel4: TSZRLabel;
    ZRLabel1: TSZRLabel;
    zrlUsuario: TSZRLabel;
    SZRLabel1: TSZRLabel;
    zrlFornecedor: TSZRLabel;
    SZRLabel2: TSZRLabel;
    zrlCodigoREP: TSZRLabel;
    SZRLabel3: TSZRLabel;
    zrlDataCadastro: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlDataAlterado: TSZRLabel;
    SZRLabel7: TSZRLabel;
    zrlProduto: TSZRLabel;
    SZRLabel9: TSZRLabel;
    zrlObservacao: TSZRLabel;
    SZRLabel11: TSZRLabel;
    zrlDescricao: TSZRLabel;
    SZRLabel19: TSZRLabel;
    zrlSituacao: TSZRLabel;
    Reposicao1: TReposicao;
    zrlDadosEmpresa: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure zrbRodapePaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure zrbCabecalhoPaginaBeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade: TReposicao;
  end;

var
  rpt_ReposicaoFornecedor: Trpt_ReposicaoFornecedor;

implementation

uses UDM, Funcoes;
{$R *.DFM}

procedure Trpt_ReposicaoFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Trpt_ReposicaoFornecedor.zrbRodapePaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
end;

procedure Trpt_ReposicaoFornecedor.zrbCabecalhoPaginaBeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;

  with Entidade do
  Begin
    zrlCodigoREP.Caption := IntToStr(CodigoREP);
    zrlDataCadastro.Caption := DateTimeToStr(DataCadastro);
    if DataAlterado > 0 then
      zrlDataAlterado.Caption := DateTimeToStr(DataAlterado)
    else
      zrlDataAlterado.Caption := '';

    with DM.QR_Consultas do
    Begin
      //Dados da Empresa
      Close;
      SQL.Text := 'SELECT * FROM CENTRO_DE_CUSTO '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC);
      Open;
      zrlDadosEmpresa.Caption := FieldByName('CNC_NOME_FAN').asString+
                                 ' CNPJ:'+FieldByName('CNC_CGC').asString+
                                 ' CGF:'+FieldByName('CNC_IE').asString+
                                 ' End:'+FieldByName('CNC_ENDERECO').asString+
                                 ' '+FieldByName('CNC_BAIRRO').asString+
                                 ' '+FieldByName('CNC_CIDADE').asString+
                                 '/'+FieldByName('CNC_UF').asString+
                                 ' CEP:'+FieldByName('CNC_CEP').asString+
                                 ' Fone/Fax:'+FieldByName('CNC_FONE').asString+
                                 ' '+FieldByName('CNC_FAX').asString;                                                                  


      //Fornecedor
      Close;
      SQL.Text := 'SELECT * FROM FORNECEDOR '+
        ' WHERE FOR_CODIGO='+IntToStr(CodigoFOR);
      Open;
      zrlFornecedor.Caption := FieldByName('FOR_CODIGO').asString+'-'+
                               FieldByName('FOR_RZ_SOCIAL').asString+' '+
                               FieldByName('FOR_ENDERECO').asString+' '+
                               FieldByName('FOR_BAIRRO').asString+' '+
                               FieldByName('FOR_CIDADE').asString+'/'+
                               FieldByName('FOR_UF').asString+
                               ' Fone/Fax:'+Trim(FieldByName('FOR_FONE').asString+' '+FieldByName('FOR_FAX').asString);

      //Produto
      Close;
      SQL.Text := 'SELECT * FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD);
      Open;
      zrlProduto.Caption := FieldByName('PRD_CODIGO').asString+'-'+
                               FieldByName('PRD_DESCRICAO').asString+' '+
                               FieldByName('PRD_CARACTERISTICA').asString+' '+
                               FieldByName('PRD_REFERENCIA').asString;
    end;


    zrlDescricao.Caption := Descricao;

    case Situacao of
      0: zrlSituacao.Caption := 'PENDENTE';
      1: zrlSituacao.Caption := 'DESATIVADO';
      2: zrlSituacao.Caption := 'ENTREGUE';
    end;

    zrlObservacao.Caption := OBS;
  end;
end;

procedure Trpt_ReposicaoFornecedor.FormCreate(Sender: TObject);
begin
  Entidade := Reposicao1;
end;

end.
