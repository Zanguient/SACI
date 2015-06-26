unit MxExportarDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, DB, DBTables, StdCtrls, ShellApi, Buttons, IniFiles,
  ExtCtrls, SQuery, CentroCusto, DBCtrls, ComCtrls, funcoes;

type
  TfMxExportarDados = class(TForm)
    OpenDialog1: TOpenDialog;
    Query1: TQuery;
    Produtos: TGroupBox;
    Gauge1: TGauge;
    BitBtn1: TBitBtn;
    rgDescricao: TRadioGroup;
    GroupBox1: TGroupBox;
    Gauge2: TGauge;
    BitBtn2: TBitBtn;
    dblCodigoCNC: TDBLookupComboBox;
    DSCentroCusto1: TDataSource;
    CentroCusto1: TCentroCusto;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMxExportarDados: TfMxExportarDados;

implementation

uses UDM;

{$R *.dfm}

procedure TfMxExportarDados.FormCreate(Sender: TObject);
begin
  fMxExportarDados.Position := poScreenCenter;
  CentroCusto1.Open;
  dblCodigoCNC.KeyValue := DM.Configuracao1.CodigoCNC;
end;

procedure TfMxExportarDados.BitBtn1Click(Sender: TObject);
var
  sDirAtual, sBanco, sDescricao,sCod : String;
  IniFile : tIniFile;
  fArq :TextFile;
begin
  //

  sCod := '00000';

  {
  GetDir(0,sDirAtual);
  if not DirectoryExists(sDirAtual + '\Exportação') then
    CreateDir(sDirAtual + '\Exportação');

  sDirAtual := sDirAtual + '\Exportação';
  }
  Screen.Cursor:= crHourGlass;
  //
  // Conta os registros da tabela
  //
  {TODO
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('Select count(REGISTRO) from estoque');
  Query1.Open;}
  //
  // Abre estoque
  //

  if rgDescricao.ItemIndex = 0 then //Produto
    sDescricao := 'T1.PRD_DESCRICAO AS DESCRICAO,'
  else if rgDescricao.ItemIndex = 1 then //Grupo
    sDescricao := 'T3.GRP_DESCRICAO AS DESCRICAO,'
  else if rgDescricao.ItemIndex = 2 then //SubGrupo
    sDescricao := 'T5.SGP_DESCRICAO AS DESCRICAO,';

  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT '
  +'T1.PRD_CODIGO AS CODIGO,'
  +'T1.PRD_DESCRICAO,'
  +'T1.PRD_REFERENCIA AS REFERENCIA,'
  +sDescricao//'T1.PRD_DESCRICAO AS DESCRICAO,'
  +'T3.GRP_DESCRICAO AS NOME,'
  +'T4.FOR_RZ_SOCIAL AS FORNECEDOR,'
  +'T1.PRD_UNIDADE AS MEDIDA,'
  +'COALESCE(T1.PRD_PRECO_VENDA,'+QuotedStr('0')+')"PRECO",'
  +'COALESCE(0,'+QuotedStr('0')+')"INDEXADOR",'
  +'COALESCE(T1.PRD_CUSTO,'+QuotedStr('0')+')"CUSTOCOMPR",'
  //+'COALESCE(T2.IES_SFISCAL,'+QuotedStr('0')+')"QTD_ATUAL",'  //Estoque fiscal ?????
  //+'"" AS LIVRE1,'
  +'"" AS LIVRE2,'
  +'"" AS LIVRE3,'
  +'"" AS LIVRE4,'
  +'COALESCE(T1.PRD_PESO_LIQUIDO,'+QuotedStr('0')+')"PESO",'
  +'"" AS LOCAL,'
  +'"" AS CF,'
  +'COALESCE(0,'+QuotedStr('0')+')"IPI",' //TODO
  +'"" AS CST,' //TODO
  +'"" AS ST,' //TODO
  +'COALESCE(0,'+QuotedStr('0')+')"COMISSAO"' //TODO
  +' FROM PRODUTO T1'
  //+' INNER JOIN ITEM_DE_ESTOQUE T2 ON T1.PRD_CODIGO = T2.PRD_CODIGO'
  +' INNER JOIN GRUPO           T3 ON T1.GRP_CODIGO = T3.GRP_CODIGO'
  +' INNER JOIN FORNECEDOR      T4 ON T1.FOR_CODIGO = T4.FOR_CODIGO'
  +' INNER JOIN SUBGRUPO        T5 ON T1.SGP_CODIGO = T5.SGP_CODIGO'
  +' WHERE 1=1'
  //+' WHERE T2.CNC_CODIGO = '''+IntToStr(DM.Configuracao1.CodigoCNC)+''''

  //+' AND T1.PRD_SITUACAO = 0' //somente produto ativo

  +' AND T5.SGP_SITUACAO = 0' //somente subgrupo ativo

  +' ORDER BY DESCRICAO');



  Query1.Open;
  //
  // Gauge
  //
  Gauge1.MaxValue := 100;
  Gauge1.MaxValue := Query1.RecordCount;
  Gauge1.Progress := 0;
  //
  //
  // Começa gerar o arquivo TXT
  //

  sDirAtual := 'C:\Importação';

  if not DirectoryExists(sDirAtual) then
    CreateDir(sDirAtual);

  AssignFile(fArq,sDirAtual+'\PRODUTOS.TXT');
  Rewrite(fArq);
  //
  while not Query1.Eof do
  begin
    //
    WriteLn(FArq,
    //Copy(Query1.FieldByName('CODIGO').AsString        +'                                              ',1,5) +' '+
    Copy(sCod                                         +'                                              ',1,5) +' '+
    Copy(Query1.FieldByName('REFERENCIA').AsString    +'                                              ',1,13)+' '+
    Copy(Query1.FieldByName('DESCRICAO').AsString     +'                                              ',1,45)+' '+
    Copy(Query1.FieldByName('NOME').AsString          +'                                              ',1,25)+' '+
    Copy(Query1.FieldByName('FORNECEDOR').AsString    +'                                              ',1,35)+' '+
    Copy(Query1.FieldByName('MEDIDA').AsString        +'                                              ',1,3) +' '+
    Copy(Query1.FieldByName('PRECO').AsString         +'                                              ',1,10)+' '+
    Copy(Query1.FieldByName('INDEXADOR').AsString     +'                                              ',1,10)+' '+
    Copy(Query1.FieldByName('CUSTOCOMPR').AsString    +'                                              ',1,10)+' '+
    //Copy(Query1.FieldByName('QTD_ATUAL').AsString   +'                                              ',1,10)+' '+
    Copy(Query1.FieldByName('CODIGO').AsString        +'                                              ',1,30)+' '+
    Copy(Query1.FieldByName('PRD_DESCRICAO').AsString +'                                              ',1,30)+' '+
    Copy(Query1.FieldByName('LIVRE3').AsString        +'                                              ',1,30)+' '+
    Copy(Query1.FieldByName('LIVRE4').AsString        +'                                              ',1,30)+' '+
    Copy(Query1.FieldByName('PESO').AsString          +'                                              ',1,10)+' '+
    Copy(Query1.FieldByName('LOCAL').AsString         +'                                              ',1,10)+' '+
    Copy(Query1.FieldByName('CF').AsString            +'                                              ',1,13)+' '+
    Copy(Query1.FieldByName('IPI').AsString           +'                                              ',1,10)+' '+
    Copy(Query1.FieldByName('CST').AsString           +'                                              ',1,3) +' '+
    Copy(Query1.FieldByName('ST').AsString            +'                                              ',1,3) +' '+
    Copy(Query1.FieldByName('COMISSAO').AsString      +'                                              ',1,10)+' ');
    //Copy(Query1.FieldByName('CODIGO').AsString      +'                                              ',1,10)+' ');
    //
    Query1.Next;
    Gauge1.Progress := Gauge1.Progress + 1;
    Gauge1.Repaint;
    //
  end;
  //
  //Close;
  //
  Closefile(fArq);
  Screen.Cursor  := crDefault;
  ShellExecute( 0, 'Open',pChar(sDirAtual+'\PRODUTOS.TXT'),'','', SW_SHOWNORMAL);
  Close;
  //
end;

procedure TfMxExportarDados.BitBtn2Click(Sender: TObject);
var
  sDirAtual, sBanco, sDescricao : String;
  IniFile : tIniFile;
  fArq :TextFile;
begin
  //
  //GetDir(0,sDirAtual);
  sDirAtual := 'C:\Importação';

{  if not DirectoryExists(sDirAtual + '\Exportação') then
    CreateDir(sDirAtual + '\Exportação');

  sDirAtual := sDirAtual + '\Exportação';}

  Screen.Cursor:= crHourGlass;
  //
  // Conta os registros da tabela
  //
  {TODO
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('Select count(REGISTRO) from estoque');
  Query1.Open;}
  // Abre estoque
  //

  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT '
  +'T1.PRD_CODIGO AS CODIGO,'
  +'COALESCE(T2.IES_SFISCAL,'+QuotedStr('0')+')"QTD_ATUAL"'  //Estoque fiscal ?????
  +' FROM PRODUTO T1'
  +' INNER JOIN ITEM_DE_ESTOQUE T2 ON T1.PRD_CODIGO = T2.PRD_CODIGO'
  +' WHERE T2.CNC_CODIGO = '''+IntToStr(dblCodigoCNC.KeyValue)+''''
  +' ORDER BY T1.PRD_CODIGO');

  Query1.Open;
  //
  // Gauge
  //
  Gauge2.MaxValue := 100;
  Gauge2.MaxValue := Query1.RecordCount;
  Gauge2.Progress := 0;
  //
  //
  // Começa gerar o arquivo TXT
  //
  AssignFile(fArq,sDirAtual+'\TRANSF_ESTOQUE_'+dblCodigoCNC.Text+'.TXT');
  Rewrite(fArq);
  //
  while not Query1.Eof do
  begin
    //
    WriteLn(FArq,

    Copy(Query1.FieldByName('CODIGO').AsString      +'                                              ',1,5) +' '+
    'E '                                                                                                       +
    Copy(Query1.FieldByName('QTD_ATUAL').AsString   +'                                              ',1,10)+' ');
    {Copy(IntToStr(CodigoPRD)    +'                                              ',1,5) +' '+
    'E '                                                                                   +
    Copy(VirgPonto(Quantidade)  +'                                              ',1,10)+' ');}
    //
    Query1.Next;
    Gauge2.Progress := Gauge2.Progress + 1;
    Gauge2.Repaint;
    //
  end;
  //
  //Close;
  //
  Closefile(fArq);
  Screen.Cursor  := crDefault;
  ShellExecute( 0, 'Open',pChar(sDirAtual+'\TRANSF_ESTOQUE_'+dblCodigoCNC.Text+'.TXT'),'','', SW_SHOWNORMAL);
  Close;
  //
end;

procedure TfMxExportarDados.FormShow(Sender: TObject);
begin
  rgDescricao.Enabled := DM.Configuracao1.Empresa <> empLuciano;

  //somente o ADM pode gerar arquivo de exportação de estoque
  if DM.Usuario1.CodigoUSU = 1 then
  begin
    Self.Height       := 295;
    GroupBox1.Visible := true;
  end
  else
  begin
    Self.Height       := 180;
    GroupBox1.Visible := false;
  end;
end;

procedure TfMxExportarDados.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
end;

end.
