unit u_pesquisa_subgrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, DBTables,
  SQuery, SubGrupo;

type
  Tf_pesquisa_subgrupo = class(TForm)
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    bitConfirma: TBitBtn;
    BitBtn2: TBitBtn;
    SubGrupo1: TSubGrupo;
    DSGrupo1: TDataSource;
    SubGrupo1SGP_CODIGO: TIntegerField;
    SubGrupo1CNC_CODIGO: TIntegerField;
    SubGrupo1GRP_CODIGO: TIntegerField;
    SubGrupo1SGP_DESCRICAO: TStringField;
    SubGrupo1SGP_OBSERVACAO: TStringField;
    SubGrupo1SGP_QUANTIDADE_NORMAL: TFloatField;
    SubGrupo1SGP_BASE_CHAVE: TStringField;
    SubGrupo1SGP_FAMILIA: TStringField;
    SubGrupo1SGP_SITUACAO: TIntegerField;
    SubGrupo1SGP_DT_CADASTRO: TDateTimeField;
    SubGrupo1SGP_DT_ALTERADO: TDateTimeField;
    SubGrupo1USU_CODIGO: TIntegerField;
    SubGrupo1SGP_INDICE_REFRACAO: TFloatField;
    SubGrupo1SGP_FABRICAR: TIntegerField;
    SubGrupo1SGP_PRECO_DOLAR: TAutoIncField;
    SubGrupo1SGP_EIXOS: TStringField;
    SubGrupo1SGP_SERVICO_OBRIGATORIO: TIntegerField;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitConfirmaClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_pesquisa_subgrupo: Tf_pesquisa_subgrupo;

implementation

uses MxSPediProdMotCal;

{$R *.dfm}

procedure Tf_pesquisa_subgrupo.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure Tf_pesquisa_subgrupo.FormShow(Sender: TObject);
begin
  if tag=0 then
  begin
    with SubGrupo1 do
    begin
      close;
      SQL.Text:='SELECT * FROM SUBGRUPO '+
        ' WHERE GRP_CODIGO = '+ inttostr(fMxSPedProdMotCal.dblCodigoGRP.KeyValue)+
        ' ORDER BY SGP_DESCRICAO ';
      open;
    end;
  end;
end;

procedure Tf_pesquisa_subgrupo.bitConfirmaClick(Sender: TObject);
begin
  try
    if tag=0 then
    begin
      if not SubGrupo1.IsEmpty then
      begin
        fMxSPedProdMotCal.dblCodigoSGP.KeyValue:=subgrupo1.fieldbyname('SGP_CODIGO').AsInteger;
        fMxSPedProdMotCal.Entidade.Close;
        fMxSPedProdMotCal.Entidade.Open;
        close;
      end;
    end;
  except
  end;
end;

procedure Tf_pesquisa_subgrupo.SB_LocClick(Sender: TObject);
var
  pesquisa:string;
begin
  if tag=0 then
  begin
    if edtLocalizar.Text<>'' then
    begin
      if cmbCampo.ItemIndex=0 then
        pesquisa:=' AND SGP_CODIGO='+edtLocalizar.Text+' '
      else if cmbCampo.ItemIndex=1 then
        pesquisa:=' AND SGP_DESCRICAO LIKE ''%'+edtLocalizar.Text+'%''';
    end
    else
      pesquisa:='';

    with SubGrupo1 do
    begin
      close;
      SQL.Text:='SELECT * FROM SUBGRUPO '+
        ' WHERE GRP_CODIGO = '+ inttostr(fMxSPedProdMotCal.dblCodigoGRP.KeyValue)+pesquisa+
        ' ORDER BY SGP_DESCRICAO ';
      open;
    end;
  end;
end;

procedure Tf_pesquisa_subgrupo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_F3 then
    SB_LocClick(SB_Loc);
end;

end.
