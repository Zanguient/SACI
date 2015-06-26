unit MxSPediLocComp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Pedido_de_Venda, Cliente, Titulo_receber, DBCtrls, CentroCusto, Menus,
  Informacoes, Item_Pedido_Venda, Produto, Descontos, Funcionario,
  Item_de_Estoque, ImgList, ActnList, XPStyleActnCtrls, ActnMan, ToolWin,
  ActnCtrls, ActnMenus;

type
  TfMxSPedLocComp = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bitFechar: TBitBtn;
    DSPedido_de_Venda1: TDataSource;
    Pedido_de_Venda1: TPedido_de_Venda;
    DBGrid5: TDBGrid;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    edtLocalizar: TEdit;
    Label19: TLabel;
    cmbCampo: TComboBox;
    Label20: TLabel;
    c: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1USU_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_TOTAL: TFloatField;
    Pedido_de_Venda1PDV_LISTADO: TIntegerField;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1PDV_DIAS_RESERV: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_FISCAL: TSmallintField;
    Pedido_de_Venda1AGF_CODIGO: TIntegerField;
    Pedido_de_Venda1FPG_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda1PDV_ENTRADA: TFloatField;
    Pedido_de_Venda1CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda1PDV_EM_USO: TIntegerField;
    Pedido_de_Venda1CLI_RZ_SOCIAL: TStringField;
    Pedido_de_Venda1situacao: TStringField;
    Pedido_de_Venda1Total: TStringField;
    Pedido_de_Venda1Bloqueado: TStringField;
    Pedido_de_Venda1PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda1PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda1PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Pedido_de_Venda1NumNotaFiscal: TStringField;
    Informacoes1: TInformacoes;
    Titulo_receber3: TTitulo_receber;
    Titulo_receber6: TTitulo_receber;
    Titulo_receber6MEDIA: TFloatField;
    Titulo_receber5: TTitulo_receber;
    Cliente1: TCliente;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Produto1: TProduto;
    Descontos1: TDescontos;
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda1PDV_CONTATO: TStringField;
    Pedido_de_Venda1FUN_CODIGO: TIntegerField;
    Pedido_de_Venda1Vendedor: TStringField;
    Funcionario1: TFuncionario;
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    Pedido_de_Venda1Centro: TStringField;
    CentroCusto2: TCentroCusto;
    Item_de_Estoque1: TItem_de_Estoque;
    Pedido_de_Venda1PDV_CREDITO: TFloatField;
    Pedido_de_Venda1FUN_ARQUITETO: TIntegerField;
    Titulo_receber4: TTitulo_receber;
    SB_Imprimir: TBitBtn;
    Pedido_de_Venda1PDV_TITULO_GERADO: TIntegerField;
    Pedido_de_Venda1PDV_TIPO_VENDA: TIntegerField;
    Pedido_de_Venda1PDV_PACOTE: TIntegerField;
    Pedido_de_Venda1PDV_GRUPO_ESPECIAL: TIntegerField;
    Pedido_de_Venda1PDV_DT_PREVISAO: TDateTimeField;
    Pedido_de_Venda1PDV_DT_ENTREGA: TDateTimeField;
    Pedido_de_Venda1PDV_DOCUMENTO: TStringField;
    Pedido_de_Venda1PDV_CAIXA: TStringField;
    Pedido_de_Venda1PDV_SERVICO: TIntegerField;
    Pedido_de_Venda1PDV_FONE_CONTATO: TStringField;
    Pedido_de_Venda1FPE_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Pedido_de_Venda1PDV_DT_FPE: TDateTimeField;
    Pedido_de_Venda1CNT_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_GARANTIA: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO_ORIGEM: TIntegerField;
    Pedido_de_Venda1PDV_FRETE: TFloatField;
    BitBtn1: TBitBtn;
    Pedido_de_Venda1PDV_COO: TStringField;
    Pedido_de_Venda1PDV_CCF: TStringField;
    ckbSomenteFaturada: TCheckBox;
    pnlPDV: TPanel;
    Image7: TImage;
    Label7: TLabel;
    Image8: TImage;
    Label8: TLabel;
    Image13: TImage;
    Label13: TLabel;
    ActionManager1: TActionManager;
    Imprimir: TAction;
    Action1: TAction;
    Sair1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    N1: TMenuItem;
    CupomFiscal1: TMenuItem;
    Pedido_de_Venda1PDV_PAF: TStringField;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitFecharClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure Pedido_de_Venda1CalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Item_Pedido_Venda1BeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure ReimprimirLJ31Click(Sender: TObject);
    procedure ckbSomenteFaturadaClick(Sender: TObject);
    procedure CupomFiscal1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    Cancelar : Boolean;
    Entidade: TPedido_de_Venda;
  end;

var
  fMxSPedLocComp: TfMxSPedLocComp;

implementation
uses
  MxReceber, UDM, MxPedidoRapido, MxSPediLoc, funcoes, DigSenha,
  UPapeletaDeRecebimento, UPedidoVendaMotical, UComprovanteLJ3,
  UPedidoServicoCompleto, UDMFB;

{$R *.DFM}

procedure TfMxSPedLocComp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_LOC_PDV_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Action:=Cafree;
end;

procedure TfMxSPedLocComp.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSPedLocComp.SB_LocClick(Sender: TObject);
var
  sSomenteFaturado : string;
begin
  if ckbSomenteFaturada.Checked then
    sSomenteFaturado := ' AND T1.PDV_NOTA_FISCAL<>0 AND T1.PDV_NOTA_FISCAL IS NOT NULL '
  else
    sSomenteFaturado := '';
  Entidade.Close;
  if edtLocalizar.Text = '*' then
    Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
      ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
      ' FROM PEDIDO_DE_VENDA T1, CLIENTE T2 '+
      ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
      sSomenteFaturado+
      ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
      ' ORDER BY T2.CLI_RZ_SOCIAL DESC'
  Else
    Case cmbCampo.ItemIndex of
      0: //Código do Pedido
      Begin
        If not VerificaInteiroBranco(edtLocalizar.Text) then
          Raise Exception.Create('Código do pedido de venda inválido!');
        Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
          ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
          sSomenteFaturado+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND T1.PDV_CODIGO='+edtLocalizar.Text+
          ' ORDER BY T2.CLI_RZ_SOCIAL DESC';
      End;
      1: //Código do Cliente
      Begin
        If not VerificaInteiroBranco(edtLocalizar.Text) then
          Raise Exception.Create('Código do cliente inválido!');
        Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
          ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
          sSomenteFaturado+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND T2.CLI_CODIGO='+edtLocalizar.Text+
          ' ORDER BY T2.CLI_RZ_SOCIAL DESC';
      End;
      2: //Nome do Cliente
      Begin
        Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
          ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T2.CLI_CODIGO=T1.CLI_CODIGO '+
          sSomenteFaturado+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND T2.CLI_RZ_SOCIAL LIKE "%'+edtLocalizar.Text+'%" '+
          ' ORDER BY T2.CLI_RZ_SOCIAL DESC';
      end;
      3: //Data Finalizado/Entrega
      Begin
        If not VerificaDataBranco(edtLocalizar.Text) then
          Raise Exception.Create('Data do pedido de venda inválida!');
        if Tag = 1 then
        begin
          Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            sSomenteFaturado+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.PDV_DT_ENTREGA>= :DATAINI '+
            ' AND T1.PDV_DT_ENTREGA< :DATAFIM '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
          Entidade.parambyname('DATAINI').AsDateTime:=StrToDate(edtLocalizar.Text);
          Entidade.parambyname('DATAFIM').AsDateTime:=StrToDate(edtLocalizar.Text)+1;
        end
        else
        begin
          Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            sSomenteFaturado+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.PDV_DATA_HORA>= :DATAINI '+
            ' AND T1.PDV_DATA_HORA< :DATAFIM '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
          Entidade.parambyname('DATAINI').AsDateTime:=StrToDate(edtLocalizar.Text);
          Entidade.parambyname('DATAFIM').AsDateTime:=StrToDate(edtLocalizar.Text)+1;
        end;
      End;
      4: //Data Emissão
      Begin
         If not VerificaDataBranco(edtLocalizar.Text) then
           Raise Exception.Create('Data do pedido de venda inválida!');
         Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            sSomenteFaturado+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.PDV_DT_EMISSAO_VENDA>=:DATAINI '+
            ' AND T1.PDV_DT_EMISSAO_VENDA<:DATAFIM '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
         Entidade.parambyname('DATAINI').AsDateTime:=StrToDate(edtLocalizar.Text);
         Entidade.parambyname('DATAFIM').AsDateTime:=StrToDate(edtLocalizar.Text)+1;
      End;
      5: //Arquiteto/Projetista/Montador
      Begin
        If not VerificaInteiro(edtLocalizar.Text) then
          Raise exception.Create('Código do Arquiteto/Projetista/Montador inválido!')
        else if Trim(edtLocalizar.Text) <> '' then
          Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            sSomenteFaturado+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.FUN_ARQUITETO='+edtLocalizar.Text+
            ' ORDER BY T2.CLI_RZ_SOCIAL DESC'
        else
          Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            sSomenteFaturado+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.FUN_ARQUITETO>0 '+
            ' ORDER BY T2.CLI_RZ_SOCIAL DESC';

      end;
      6: //Documento
      Begin
         If not VerificaInteiroBranco(edtLocalizar.Text) then
           Raise Exception.Create('Documento inválido!');
         Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            sSomenteFaturado+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.PDV_DOCUMENTO LIKE "%'+edtLocalizar.Text+'%" '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      End;
      7: //Nome do Paciente
      Begin
        Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
          ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
          ' WHERE T2.CLI_CODIGO=T1.CLI_CODIGO '+
          sSomenteFaturado+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND T1.PDV_CONTATO LIKE "%'+edtLocalizar.Text+'%" '+
          ' ORDER BY T1.PDV_CONTATO DESC';
      end;
      8: //Caixa
      Begin
         If not VerificaInteiroBranco(edtLocalizar.Text) then
           Raise Exception.Create('Caixa inválido!');
         Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            sSomenteFaturado+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.PDV_CAIXA LIKE "%'+edtLocalizar.Text+'%" '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      End;
      9: //CodigoFPE
      Begin
         If not VerificaInteiroBranco(edtLocalizar.Text) then
           Raise Exception.Create('Código do Faturamento Pendente inválido!');
         Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            sSomenteFaturado+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.FPE_CODIGO='+edtLocalizar.Text+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      End;
      10: //Nota Fiscal
      Begin
         If not VerificaInteiroBranco(edtLocalizar.Text) then
           Raise Exception.Create('Nota Fiscal inválida!');
         Entidade.sql.Text:='SELECT T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            sSomenteFaturado+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.PDV_NOTA_FISCAL="'+edtLocalizar.Text+'" '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      End;
    end;
  Entidade.Open;
end;

procedure TfMxSPedLocComp.Pedido_de_Venda1CalcFields(DataSet: TDataSet);
begin
  //Definir Centro de Custo
  with DM.CentroCusto2 do
  Begin
    if DM.Configuracao1.Empresa <> empLBM then
    Begin
      if Active = False then
        Open;
      if (Entidade.CodigoCNC > 0) then
      Begin
        if (Entidade.CodigoCNC <> COdigoCNC) then
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
          Open;
        end;
        Entidade.FieldByName('Centro').asString := RazaoSocial;
      end
      else
        Entidade.FieldByName('Centro').asString := '';
    end
    else //LBM
    Begin
      if Entidade.CodigoCNC <= 0 then
        Entidade.FieldByName('Centro').asString := 'ERRO'
      else if Entidade.CodigoCNC = 1 then
        Entidade.FieldByName('Centro').asString := 'Matriz'
      else
        Entidade.FieldByName('Centro').asString := 'Filial'+IntToStr(Entidade.CodigoCNC);
    end;
  end;

  if Tag = 1 then //Serviço
  begin
    Case Entidade.FieldByName('PDV_SITUACAO').AsInteger of
       0:Entidade.FieldByName('situacao').AsString:= 'Recepção/Abertura';
       1:Entidade.FieldByName('situacao').AsString:= 'Cancelado';
       2:Entidade.FieldByName('situacao').AsString:= 'Laboratório/Oficina';
       3:Entidade.FieldByName('situacao').AsString:= 'Serviço Pronto';
       4:Entidade.FieldByName('situacao').AsString:= 'Entregue ao Cliente';
       5:Entidade.FieldByName('situacao').AsString:= 'PEDIDO DE VENDA';
       6:Entidade.FieldByName('situacao').AsString:= 'Cancelado';
       7:Entidade.FieldByName('situacao').AsString:= 'PEDIDO DE VENDA';
       8:Entidade.FieldByName('situacao').AsString:= 'PEDIDO DE VENDA';
       9:Entidade.FieldByName('situacao').AsString:= 'PEDIDO DE VENDA';
      10:Entidade.FieldByName('situacao').AsString:= 'PEDIDO DE VENDA';
      11:Entidade.FieldByName('situacao').AsString:= 'PEDIDO DE VENDA';
      12:Entidade.FieldByName('situacao').AsString:= 'PEDIDO DE VENDA';
    End;
  end
  else //Pedido
  begin
    Case Entidade.FieldByName('PDV_SITUACAO').AsInteger of
       0:Entidade.FieldByName('situacao').AsString:= 'Abertura';
       1:Entidade.FieldByName('situacao').AsString:= 'Intenção de compra';
       2:Entidade.FieldByName('situacao').AsString:= 'Cliente C/ Cadastro';
       3:Entidade.FieldByName('situacao').AsString:= 'Proposta';
       4:Entidade.FieldByName('situacao').AsString:= 'Venda Confirmada';
       5:Entidade.FieldByName('situacao').AsString:= 'Consignação';
       6:Entidade.FieldByName('situacao').AsString:= 'Venda Cancelada';
       7:Entidade.FieldByName('situacao').AsString:= 'Consignação Cancelada';
       8:Entidade.FieldByName('situacao').AsString:= 'Venda Devolvida';
       9:Entidade.FieldByName('situacao').AsString:= 'Consignação Devolvida';
      10:Entidade.FieldByName('situacao').AsString:= 'Canc. Não Aprov.Crédito';
      11:Entidade.FieldByName('situacao').AsString:= 'Pedido Finalizado';
      12:Entidade.FieldByName('situacao').AsString:= 'Pedido com Cupom Fiscal';
    End;
  end;

  with Item_Pedido_Venda2 do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := Entidade.CodigoCNC;
    ParamByName('PDV_CODIGO').asInteger := Entidade.CodigoPDV;
    Open;
    Entidade.FieldByName('Total').asString:=format('%.2f',[FieldByName('SOMA').asFloat]);
  end;

  case Entidade.FieldByName('PDV_EM_USO').AsInteger of
    0: Entidade.FieldByName('Bloqueado').AsString:='Não';
    1: Entidade.FieldByName('Bloqueado').AsString:='Sim';
  end;

  if Entidade.NotaFiscal = -1 then
    Entidade.FieldByName('NumNotaFiscal').AsString:='LJ3'
  else if Entidade.NotaFiscal = -2 then
    Entidade.FieldByName('NumNotaFiscal').AsString:='LJ4'
  else if Entidade.NotaFiscal > 0 then
    Entidade.FieldByName('NumNotaFiscal').AsString:=IntToStr(Entidade.NotaFiscal)
  else
    Entidade.FieldByName('NumNotaFiscal').AsString:='';

  with Funcionario1 do
  Begin
    if (Entidade.FieldByName('FUN_CODIGO').asInteger <> CodigoFUN) or
       ((DM.Configuracao1.Empresa IN [empEletro,empPetromax]) and
       (Entidade.FieldByName('CNC_CODIGO').asInteger <> CodigoCNC)) then
    Begin
      Close;
      try
        ParamByName('CNC_CODIGO').asInteger := Entidade.FieldByName('CNC_CODIGO').asInteger;
      except
      end;
      ParamByName('FUN_CODIGO').asInteger := Entidade.FieldByName('FUN_CODIGO').asInteger;
      Open;
    end;
    Entidade.FieldByName('Vendedor').asString := Apelido;
  end;
end;

procedure TfMxSPedLocComp.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if DM.Configuracao1.Empresa = empLuciano then
  begin
    DBGrid5.Columns[6].Visible := True; //PACIENTE
//    DBGrid5.Columns[8].Visible := False; //TOTAL
//    DBGrid5.Columns[9].Visible := False; //NOTA
//    DBGrid5.Columns[17].Visible := False; //PACOTE
//    DBGrid5.Columns[18].Visible := False; //FRETE
    ckbSomenteFaturada.Visible := False;
    //SB_Imprimir.Visible := False;
  end
  else
  begin
    DBGrid5.Columns[6].Visible := False; //PACIENTE
  end;

  pnlPDV.Width := 505;

  if Tag = 1 then //Serviço
  begin
    pnlPDV.Visible := false;
    //pnlSER.Visible := true;
  end
  else
  begin
    pnlPDV.Visible := true;
    //pnlSER.Visible := false;
  end;

  cmbCampo.ItemIndex:=0;
  edtLocalizar.SetFocus;
end;

procedure TfMxSPedLocComp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CdMVCOri, CdPDV, CdCNC, CdArquiteto : integer;
  Trans, Lib3790, Lib3540, Lib3830, Lib3740, Lib3820, Lib3930, Lib6230, Lib6240  :boolean;
begin
  if Key = VK_ESCAPE then
    Close;

  if Key = VK_F3 then
    SB_LocClick(SB_Loc);


  if (DM.Configuracao1.Empresa = empLBM) then
  Begin
    Lib3790:=False; //Liberar Venda Cliente Inadiplente
    Lib3540:=False; //Liberar Juros Total
    Lib3830:=False; //Entrada Menor que a Prestação
    Lib3740:=False; //Abaixo do Preço Mínimo
    Lib3820:=False; //Venda sem Estoque
    Lib3930:=False; //Desconto Gerente
    Lib6230:=False; //Boleto
    Lib6240:=False; //LimiteMediaVenda dias
    if (Key = VK_F10) or
       (Key = VK_F12) then
    Begin
      if Entidade.IsEmpty then
      Begin
        ShowMessage('Selecione o Pedido de Venda!');
        Exit;
      end
      else if (Entidade.NotaFiscal > 0) then
      Begin
        ShowMessage('Pedido com Nota determinada!');
        Exit;
      end;
    end;
    if (Key = VK_F10) then
    Begin
      CdCNC := Entidade.CodigoCNC;
      CdPDV := Entidade.CodigoPDV;
      //Desmarcar LJ3
      if (Entidade.NotaFiscal = -1) then
      Begin
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(6160)) < 0) then //Desmarcar LJ3
        Begin
          Beep;
          Exit;
        end;
        if Trunc(Entidade.DataEmissaoVenda) <> Trunc(DM.Configuracao1.Data) then
        Begin
          ShowMessage('Não é possível tirar o LJ3 colocado no dia diferente de Hoje!');
          Exit;
        end;
        If MessageDlg('Deseja desmarcar o Pedido como LJ3?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;

        Trans:=false;
        with DM.Database2 do
        begin
          try
            If DM.Configuracao1.ControleTransacao then
            Begin
              StartTransaction;
              Trans:=True;
            end;

            //Gerar Movimento LJ3 de Entrada
            with Item_Pedido_Venda1 do
            Begin
              Close;
              Open;
              while not EOF do
              Begin
                if Vinculo >= 0 then //Menor do que zero não foi vendido e sim entregue pelo cliente para manutenção
                Begin
                  Item_de_Estoque1.Close;
                  Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
                  Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
                  Item_de_Estoque1.Open;
                  If Item_de_Estoque1.isempty then
                  begin
                    Item_de_Estoque1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                      DM.Configuracao1.DataHora,0,0,0,0,0,0);
                    Item_de_Estoque1.Close;
                    Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CodigoCNC;
                    Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
                    Item_de_Estoque1.open;
                  end;

                  if not DM.Movimento_Estoque_SN1.Inserir(CodigoCNC, CodigoPRD,0(*CdFUN*),
                      4410 (*TipoMovimento - CancelarLJ3*) ,CodigoCNC, CodigoPDV,
                      'E',Quantidade, Item_de_Estoque1.SSN) then
                  Begin
                    ShowMessage('Falha ao Gerar Mov. LJ3!');
                    Raise Exception.Create('');
                  end;
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                    ' IES_SSN=IES_SSN+'+VirgPonto(Quantidade)+
                    ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(CodigoCNC));
                end;
                Next;
              end;
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_NUMERO='+IntToStr(Entidade.CodigoPDV)+
              ',CCX_CODIGO=129 '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
              ' AND TRC_SITUACAO=0 '); //Não alterar o Número dos Títulos Pagos;

            ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
              ' PDV_NOTA_FISCAL=0 '+
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
              ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
            SB_LocClick(sender);
            Entidade.LocalizarCod(CdPDV, CdCNC);
            Entidade.GeraLog(6160, CdCNC, CdPDV);

            If DM.Configuracao1.ControleTransacao then
              Commit;
          except
            If DM.Configuracao1.ControleTransacao then
              if trans then
              Begin
                RollBack;
                ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
              end;
          end;
        End;
        Exit;
      end
      else if (Entidade.Situacao <> 4) then
      Begin
        ShowMessage('Pedido não Finalizado!');
        Exit;
      end
      else //Definir LJ3
      Begin
        if (DM.Configuracao1.Empresa = empLBM) then
        Begin
          if (DM.Configuracao1.CodigoCNC <> 3) then //LBM Serviço não verifica nada
          Begin
            if (Entidade.TipoPag = 13) or //Cartão
               (Entidade.TipoPag = 412) or //Boleto Bancário
               (Entidade.TipoPag = 416) then //Depósito em Conta
            Begin
              ShowMessage('Tipo de Pagamento (Cartão, Boleto ou Depósito em Conta)!');
              Exit;
            end
            else
            Begin
              if (CLiente1.CodigoCNC <> Entidade.ClienteCNC) or
                 (Cliente1.CodigoCLI <> Entidade.CodigoCLI) then
              Begin
                Cliente1.Close;
                Cliente1.ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
                Cliente1.ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
                Cliente1.Open;
              end;
              if Cliente1.SPC = 1 then
              Begin
                if MessageDlg('Cliente no SPC !!!'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                  exit;
                If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0) then
                Begin
                  Application.CreateForm(TDigitaSenha, DigitaSenha);
                  With DigitaSenha do
                  Begin
                    onClose:=nil;
                    Tag:=28;
                    Cancelar:=False;
                    Showmodal;
                    If not cancelar Then
                    Begin
                      if (Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0)then
                      begin
                        free;
                        raise Exception.Create('O usuário não tem permissão para vender a Cliente no SPC!');
                      end;
                    end
                    else
                    begin
                      free;
                      exit;
                    end;
                    free;
                  End;
                end;
              end;
              Informacoes1.Close;
              Informacoes1.ParamByName('CNC_CODIGO').asInteger:=Cliente1.CodigoCNC;
              Informacoes1.ParamByName('CLI_CODIGO').asInteger:=Cliente1.CodigoCLI;
              Informacoes1.Open;
              //Verificar Inadiplência se não for Cliente Balcão e se não for à Vista e não for Cartão
              if (Entidade.CodigoCLI <> DM.Configuracao1.CodigoCliAVista) and
                 (Entidade.CodigoFPG <> 1) and (Entidade.TipoPag <> 13) then
              Begin
                if not Informacoes1.IsEmpty then
                Begin
                  if ((Informacoes1.LimiteCredito-Informacoes1.CreditoUtil)<0) then
                    Raise Exception.Create('Limite de Crédito Ultrapassado!')
                  else if ((Informacoes1.DataAlterado) <
                          (incMonth(DM.Configuracao1.Data,-6))) then
                  Begin
                    Titulo_receber3.Close; //Verificar Títulos alterados a mais de 6 meses
                    Titulo_receber3.ParamByName('CNC_CLIENTE').asInteger := Entidade.ClienteCNC;
                    Titulo_receber3.ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
                    Titulo_receber3.Open;
                    if Titulo_receber3.DataAlterado < incMonth(DM.Configuracao1.Data,-6) then
                      Raise Exception.Create('Inf. de Crédito com mais de 6 meses!');
                  end;
                end
                else
                  Raise Exception.Create('Cliente sem Limite de crédito!');

                //Verificar Inadiplência
                Titulo_receber5.Close;
                Titulo_receber5.ParamByName('CNC_CODIGO').asInteger:=Cliente1.CodigoCNC;
                Titulo_receber5.ParamByName('CLI_CODIGO').asInteger:=Cliente1.CodigoCLI;
                Titulo_receber5.ParamByName('DATA').asDate:=DM.Configuracao1.Data;
                Titulo_receber5.Open;
                if (not Titulo_receber5.IsEmpty) then
                Begin
                  if MessageDlg('Cliente inadiplente !!!'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                    exit;
                  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0) and
                     (not Lib3790) then
                  Begin
                    Application.CreateForm(TDigitaSenha, DigitaSenha);
                    With DigitaSenha do
                    Begin
                      onClose:=nil;
                      Tag:=28;
                      Cancelar:=False;
                      Showmodal;
                      If not cancelar Then
                      Begin
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0)then
                        begin
                          free;
                          raise Exception.Create('O usuário não tem permissão para vender a Cliente Inadiplente!');
                        end
                        else
                        begin
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                            Lib3790 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                            Lib3540 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                            Lib3830 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                            Lib3740 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                            Lib3820 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                            Lib3930 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                            Lib6230 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                            Lib6240 := True;
                          if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                             Lib6230 AND Lib6240 AND
                             (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                            ShowMessage('');
                        end;
                      end
                      else
                      begin
                        free;
                        exit;
                      end;
                      free;
                    End;
                  end;
                end;
              end;
              if Informacoes1.Proibido then
                Raise Exception.Create('Cliente Bloqueado!'+#13+'Procure a gerência!');

              Titulo_receber6.Close;
              Titulo_receber6.Open;
              if (Titulo_receber6.FieldByName('MEDIA').asFloat > Entidade.Entrada) and
                 (Entidade.Entrada > 0) then
              Begin
                if MessageDlg('Entrada menor que a prestação mensal !!!'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                  exit;
                if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3830)) < 0) AND
                   (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                   (not Lib3830) and (not Lib3540) then
                Begin
                  Application.CreateForm(TDigitaSenha, DigitaSenha);
                  With DigitaSenha do
                  Begin
                    onClose:=nil;
                    Tag:=28;
                    Cancelar:=False;
                    Showmodal;
                    If not cancelar Then
                    Begin
                      if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) < 0) AND
                         (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
                      begin
                        free;
                        raise Exception.Create('O usuário não tem permissão para faturar com Entrada menor que a prestação!');
                      end
                      else
                      begin
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                          Lib3790 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                          Lib3540 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                          Lib3830 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                          Lib3740 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                          Lib3820 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                          Lib3930 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                          Lib6230 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                          Lib6240 := True;
                        if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                           Lib6230 AND Lib6240 AND
                           (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                          ShowMessage('');
                      end;
                    end
                    else
                    begin
                      free;
                      exit;
                    end;
                    free;
                  End;
                end;
              end;
              Item_Pedido_Venda1.Close;
              Entidade.Close;
              Entidade.Open;
              Item_Pedido_Venda1.Open;
              //Verificar Venda com Boleto
              if Entidade.TipoPag = 412 then //Boleto Bancário
              Begin
                if MessageDlg('Venda com Boleto Bancário !!!'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                  exit;
                If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6230)) < 0) and
                   (not Lib6230) and (not Informacoes1.Boleto) then
                Begin
                  Application.CreateForm(TDigitaSenha, DigitaSenha);
                  With DigitaSenha do
                  Begin
                    onClose:=nil;
                    Tag:=28;
                    Cancelar:=False;
                    Showmodal;
                    If not cancelar Then
                    Begin
                      if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) < 0)then
                      begin
                        free;
                        raise Exception.Create('O usuário não tem permissão para venda com Boleto!');
                      end
                      else
                      begin
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                          Lib3790 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                          Lib3540 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                          Lib3830 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                          Lib3740 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                          Lib3820 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                          Lib3930 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                          Lib6230 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                          Lib6240 := True;
                        if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                           Lib6230 AND Lib6240 AND
                           (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                          ShowMessage('');
                      end;
                    end
                    else
                    begin
                      free;
                      exit;
                    end;
                    free;
                  End;
                end;
              end;
              //Verificar Média Acima de LimiteMediaVenda dias
              if Entidade.MediaPagamento > DM.Configuracao1.LimiteMediaVenda then
              Begin
                if MessageDlg('Média de Venda '+IntToStr(Entidade.MediaPagamento)+' dias !!!'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                  exit;
                If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6240)) < 0) and
                   (not Lib6240) then
                Begin
                  Application.CreateForm(TDigitaSenha, DigitaSenha);
                  With DigitaSenha do
                  Begin
                    onClose:=nil;
                    Tag:=28;
                    Cancelar:=False;
                    Showmodal;
                    If not cancelar Then
                    Begin
                      if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) < 0)then
                      begin
                        free;
                        raise Exception.Create('O usuário não tem permissão para média acima de '+IntToStr(DM.Configuracao1.LimiteMediaVenda)+' dias!');
                      end
                      else
                      begin
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                          Lib3790 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                          Lib3540 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                          Lib3830 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                          Lib3740 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                          Lib3820 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                          Lib3930 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                          Lib6230 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                          Lib6240 := True;
                        if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                           Lib6230 AND Lib6240 AND
                           (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                          ShowMessage('');
                      end;
                    end
                    else
                    begin
                      free;
                      exit;
                    end;
                    free;
                  End;
                end;
              end;
              With Item_Pedido_Venda1 do
              Begin
                First;
                While not EOF do
                Begin
                  if Vinculo >= 0 then //Menor do que zero não foi vendido e sim entregue pelo cliente para manutenção
                  Begin
                    Produto1.Close;
                    Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
                    Produto1.Open;
                    Descontos1.Close;
                    Descontos1.SQL.Text:='SELECT * FROM DESCONTOS WHERE PRD_CODIGO='+
                       IntToStr(Produto1.CodigoPRD);
                    Descontos1.Open;
                    if Descontos1.IsEmpty then
                    Begin
                      Descontos1.Close;
                      Descontos1.SQL.Text:='SELECT * FROM DESCONTOS WHERE GRP_CODIGO='+
                        IntToStr(Produto1.CodigoGRP)+' AND FOR_CODIGO='+IntToStr(Produto1.CodigoFOR)+
                         ' AND (PRD_CODIGO=0 OR PRD_CODIGO IS NULL)';
                      Descontos1.Open;
                    end;
                    if Descontos1.IsEmpty then
                    Begin
                      Descontos1.Close;
                      Descontos1.SQL.Text:='SELECT * FROM DESCONTOS WHERE FOR_CODIGO='+
                         IntToStr(Produto1.CodigoFOR)+' AND (GRP_CODIGO=0 OR GRP_CODIGO IS NULL)'+
                         ' AND (PRD_CODIGO=0 OR PRD_CODIGO IS NULL)';
                      Descontos1.Open;
                    end;
                    if (Pendencia > 1) then
                    Begin
                      If MessageDlg('O Produto '+Trim(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                            'está com pendência de estoque. Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                        Exit;
                      if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3820)) < 0) and
                         (not Lib3820) then
                      Begin
                        Application.CreateForm(TDigitaSenha, DigitaSenha);
                        With DigitaSenha do
                        Begin
                          onClose:=nil;
                          Tag:=28;
                          Cancelar:=False;
                          Showmodal;
                          If not cancelar Then
                          Begin
                            if Usuario1.Permissoes.IndexOf(IntToStr(3820)) < 0 then
                            begin
                              free;
                              raise Exception.Create('O usuário não tem permissão para venda sem estoque!');
                            end
                            else
                            begin
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                                Lib3790 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                                Lib3540 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                                Lib3830 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                                Lib3740 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                                Lib3820 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                                Lib3930 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                                Lib6230 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                                Lib6240 := True;
                              if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                                 Lib6230 AND Lib6240 AND
                                 (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                                ShowMessage('');
                            end;
                          end
                          else
                          begin
                            free;
                            exit;
                          end;
                          free;
                        End;
                      end;
                    end;

                    if (PrecoDesc < Arredonda(Produto1.Precomedio)) and
                       (Produto1.Precomedio > 0) then
                    Begin
                      If MessageDlg('Produto '+Trim(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                            'Preço R$'+format('%.2f',[PrecoDesc-Produto1.Precomedio])+' abaixo do mínimo !!!'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                        Exit;
                      if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
                         (not Lib3540) and (not Lib3740) then
                      Begin
                        ShowMessage('É necessário Permissão de Liberar Venda com Preço abaixo do Mínimo!');
                        Application.CreateForm(TDigitaSenha, DigitaSenha);
                        With DigitaSenha do
                        Begin
                          onClose:=nil;
                          Tag:=28;
                          Cancelar:=False;
                          Showmodal;
                          If not cancelar Then
                          Begin
                            if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND
                               (Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) then
                            begin
                              free;
                              raise Exception.Create('O usuário não tem permissão para venda com Preço abaixo do Mínimo!');
                            end
                            else
                            begin
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                                Lib3790 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                                Lib3540 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                                Lib3830 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                                Lib3740 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                                Lib3820 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                                Lib3930 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                                Lib6230 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                                Lib6240 := True;
                              if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                                 Lib6230 AND Lib6240 AND
                                 (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                                ShowMessage('');
                            end;
                          end
                          else
                          begin
                            free;
                            exit;
                          end;
                          free;
                        End;
                      end;
                    End;

                    // Verifica se o usuário tem permissão para liberar desconto
                    if (PrecoDesc<PrecoSugerido) and
                       (Arredonda(100-(PrecoDesc/PrecoSugerido*100))<Arredonda(Descontos1.DescontoLJ3)) then
                    Begin
                      If MessageDlg('Produto '+Trim(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                            'Preço R$'+format('%.2f',[PrecoDesc-Produto1.Precomedio])+#13+
                            'Abaixo do Sugerido ('+format('%.4f',[100-PrecoDesc/PrecoSugerido*100])+' %) !!!'+#13+
                            'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                        Exit;
                      if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3930)) < 0) AND
                         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                         (not Lib3930) and (not Lib3540) then
                      Begin
                        Application.CreateForm(TDigitaSenha, DigitaSenha);
                        With DigitaSenha do
                        Begin
                          onClose:=nil;
                          Tag:=28;
                          Cancelar:=False;
                          Showmodal;
                          If not cancelar Then
                          Begin
                            if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) < 0) AND
                               (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
                            begin
                              free;
                              raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
                            end
                            else
                            begin
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                                Lib3790 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                                Lib3540 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                                Lib3830 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                                Lib3740 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                                Lib3820 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                                Lib3930 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                                Lib6230 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                                Lib6240 := True;
                              if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                                 Lib6230 AND Lib6240 AND
                                 (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                                ShowMessage('');
                            end;
                          end
                          else
                          begin
                            free;
                            exit;
                          end;
                          free;
                        End;
                      end;
                    end
                    //Preço abaixo do sugerido de forma que o gerente não tem permissão
                    else if (PrecoDesc<PrecoSugerido) then
                    Begin
                      If MessageDlg('Produto '+(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                            'Preço R$'+format('%.2f',[PrecoDesc-Produto1.Precomedio])+#13+
                            'Abaixo do Sugerido (Gerente) ('+format('%.4f',[100-PrecoDesc/PrecoSugerido*100])+' %) !!!'+#13+
                            'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                        Exit;
                      if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                         (not Lib3540) then
                      Begin
                        Application.CreateForm(TDigitaSenha, DigitaSenha);
                        With DigitaSenha do
                        Begin
                          onClose:=nil;
                          Tag:=28;
                          Cancelar:=False;
                          Showmodal;
                          If not cancelar Then
                          Begin
                            if Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then
                            begin
                              free;
                              raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
                            end
                            else
                            begin
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                                Lib3790 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                                Lib3540 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                                Lib3830 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                                Lib3740 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                                Lib3820 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                                Lib3930 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                                Lib6230 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                                Lib6240 := True;
                              if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                                 Lib6230 AND Lib6240 AND
                                 (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                                ShowMessage('');
                            end;
                          end
                          else
                          begin
                            free;
                            exit;
                          end;
                          free;
                        End;
                      end;
                    end;
                  end;
                  next;
                End;
              End;
            end;
          end;

          Trans:=false;
          with DM.Database2 do
          begin
            try
              If DM.Configuracao1.ControleTransacao then
              Begin
                  StartTransaction;
                  Trans:=True;
              end;

              //Gerar Movimento LJ3 de Saída
              with Item_Pedido_Venda1 do
              Begin
                Close;
                Open;
                while not EOF do
                Begin
                  if Vinculo >= 0 then //Menor do que zero não foi vendido e sim entregue pelo cliente para manutenção
                  Begin
                    Item_de_Estoque1.Close;
                    Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
                    Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
                    Item_de_Estoque1.Open;
                    If Item_de_Estoque1.isempty then
                    begin
                      Item_de_Estoque1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                        DM.Configuracao1.DataHora,0,0,0,0,0,0);
                      Item_de_Estoque1.Close;
                      Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CodigoCNC;
                      Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
                      Item_de_Estoque1.open;
                    end;

                    if not DM.Movimento_Estoque_SN1.Inserir(CodigoCNC, CodigoPRD,0(*CdFUN*),
                        4430 (*TipoMovimento - VendaLJ3*) ,CodigoCNC, CodigoPDV,
                        'S',Quantidade, Item_de_Estoque1.SSN) then
                    Begin
                      ShowMessage('Falha ao Gerar Mov. LJ3!');
                      Raise Exception.Create('');
                    end;
                    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                      ' IES_SSN=IES_SSN-'+VirgPonto(Quantidade)+
                      ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                      ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                      ' AND CNC_CODIGO='+IntToStr(CodigoCNC));
                  end;
                  Next;
                end;
              end;

              ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
                ' PDV_NOTA_FISCAL=-1 '+
                ',PDV_DT_EMISSAO_VENDA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND PDV_CODIGO='+IntToStr(CdPDV));


    //(Agente Financeiro = 1 - Carteira)                     --> CCX = 1   - Rec.Vda A Vista
    //(Agente Financeiro = 6 - Loja(Pre-Datado)) AND (Seq=1) --> CCX = 2   - Rec. Vda A Prazo Entrada
    //(Agente Financeiro = 6 - Loja(Pre-Datado)) AND (Seq<>1)--> CCX = 65  - Rec. Vda A Prazo
    //(Agente Financeiro=7,9,10 - Visa, American, Hipercard) --> CCX = 191 - Conta BB
    //(Agente Financeiro=8 - MasterCard)                     --> CCX = 193 - Conta BNB
    //(Agente Financeiro=2 - BB)                             --> CCX = 191 - Conta BB
    //(Agente Financeiro=3 - CEF)                            --> CCX = 194 - Conta CEF
    //(Agente Financeiro=4 - BNB)                            --> CCX = 193 - Conta BNB
    //(Agente Financeiro=5 - BEC)                            --> CCX = 192 - Conta BEC

              ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
                ' TRC_NUMERO="" '+
                ',CCX_CODIGO=CCX_CODIGO_REC '+
                ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
                ' AND TRC_SITUACAO=0 '); //Não alterar o Número dos Títulos Pagos;

              //Gerar Extorno de Venda Futura
              with Titulo_receber4 do
              Begin
                Close;
                ParamByName('PDV_CODIGO').asInteger := CdPDV;
                Open;
              end;
              while not Titulo_receber4.Eof do
              Begin
                CdMVCOri := 0;
                with DM.QR_Consultas do
                Begin
                  Close;
                  SQL.Text := 'SELECT TOP 1 MVC_CODIGO '+
                    ' FROM MOVIMENTO_DE_CAIXA '+
                    ' WHERE TIT_CODIGO='+IntToStr(Titulo_receber4.CodigoTRC)+
                    ' AND MVC_FLAG=1 '; //TRC
                  Open;
                  if not IsEmpty then
                    CdMVCOri := FieldByName('MVC_CODIGO').asInteger;
                end;
                if not DM.Movimento_caixa1.Inserir(1(*LBM*),0,
                       Titulo_receber4.CodigoCCX,Titulo_receber4.CodigoCCXRecebimento,
                       DM.Configuracao1.CodigoCAX,Titulo_receber4.TipoPag,
                       Titulo_receber4.Tipo,Titulo_receber4.CodigoCNC,
                       Titulo_receber4.ChequeCNC,Titulo_receber4.CodigoCHQ,
                       'ExtVdaFut TRC:'+IntToStr(Titulo_receber4.CodigoTRC),
                       '1' (*Flag*),IntToStr(Titulo_receber4.CodigoPDV)(*Numero*),''(*OBS*),
                       Titulo_receber4.Sequencia,'D',Titulo_receber4.ValorPG,
                       Titulo_receber4.Desconto,Titulo_receber4.Juros,
                       Titulo_receber4.Credcli(*CredCli*),Titulo_receber4.Valor(*ValorDoc*),
                       DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                       Titulo_receber4.CodigoTRC,
                       0(*DtCheque*),Titulo_receber4.CodigoCNC,'T',CdMVCOri,True) then
                Begin
                  ShowMessage('Falha Mov. Ext.!');
                  Raise Exception.Create('');
                end;
                if not DM.Movimento_caixa1.Inserir(1(*LBM*),0,
                       Titulo_receber4.CodigoCCX,Titulo_receber4.CodigoCCX,
                       DM.Configuracao1.CodigoCAX,Titulo_receber4.TipoPag,
                       Titulo_receber4.Tipo,Titulo_receber4.CodigoCNC,
                       Titulo_receber4.ChequeCNC,Titulo_receber4.CodigoCHQ,
                       'TRC-AUTO:'+IntToStr(Titulo_receber4.CodigoTRC),
                       '1' (*Flag*),''(*Número*),''(*OBS*),
                       Titulo_receber4.Sequencia,'C',Titulo_receber4.ValorPG,
                       Titulo_receber4.Desconto,Titulo_receber4.Juros,
                       Titulo_receber4.Credcli(*CredCli*),Titulo_receber4.Valor(*ValorDoc*),
                       DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                       0(*DtCheque*),Titulo_receber4.CodigoTRC,
                       Titulo_receber4.CodigoCNC,'T') then
                Begin
                  ShowMessage('Falha Mov. Reentrada!');
                  Raise Exception.Create('');
                end;
                Titulo_receber4.Next;
              end;

              If DM.Configuracao1.ControleTransacao then
                Commit;
              Trans := False;
              //
            except
              If DM.Configuracao1.ControleTransacao then
                if trans then
                Begin
                  RollBack;
                  ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
                end;
            end;
          End;
          //Imprimir Comprovante
          Application.CreateForm(Trpt_ComprovanteLJ3, rpt_ComprovanteLJ3);
          with rpt_ComprovanteLJ3 do
          Begin
            Tag := 1;
            Item_Pedido_Venda1.Close;
            Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
              ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
              ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND T2.CNC_CODIGO='+
              IntToStr(self.Entidade.CodigoCNC)+
              ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) AND T2.PDV_CODIGO='+
              IntToStr(self.Entidade.CodigoPDV)+
              ' ORDER BY T2.PDV_CODIGO,T1.IPV_CODIGO ASC';
            Item_Pedido_Venda1.Open;
            if Entidade.isEmpty then
            Begin
              ShowMessage('Consulta vazia!');
              Raise exception.Create('');
            end;
            //Habilitar Assinatura do cliente no Rel
            report.Preview;
            Close;
          end;
          //
          SB_LocClick(sender);
          Entidade.LocalizarCod(CdPDV, CdCNC);
        end;
      end;
    end
    else if (Key = VK_F12) then
    Begin
      CdCNC := Entidade.CodigoCNC;
      CdPDV := Entidade.CodigoPDV;
      //Desmarcar LJ4
      if (Entidade.NotaFiscal = -2) then
      Begin
        if (DM.Usuario1.Permissoes.IndexOf(IntToStr(8100)) < 0) then //Desmarcar LJ4
        Begin
          Beep;
          Exit;
        end;
        if Trunc(Entidade.DataEmissaoVenda) <> Trunc(DM.Configuracao1.Data) then
        Begin
          ShowMessage('Não é possível tirar o LJ4 colocado no dia diferente de Hoje!');
          Exit;
        end;
        If MessageDlg('Deseja desmarcar o Pedido como LJ4?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;

        Trans:=false;
        with DM.Database2 do
        begin
          try
            If DM.Configuracao1.ControleTransacao then
            Begin
              StartTransaction;
              Trans:=True;
            end;

            //Gerar Movimento LJ4 de Entrada
            with Item_Pedido_Venda1 do
            Begin
              Close;
              Open;
              while not EOF do
              Begin
                if Vinculo >= 0 then //Menor do que zero não foi vendido e sim entregue pelo cliente para manutenção
                Begin
                  Item_de_Estoque1.Close;
                  Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
                  Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
                  Item_de_Estoque1.Open;
                  If Item_de_Estoque1.isempty then
                  begin
                    Item_de_Estoque1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                      DM.Configuracao1.DataHora,0,0,0,0,0,0);
                    Item_de_Estoque1.Close;
                    Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CodigoCNC;
                    Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
                    Item_de_Estoque1.open;
                  end;

                  if not DM.Movimento_Estoque_LJ41.Inserir(CodigoCNC, CodigoPRD,0(*CdFUN*),
                      4420 (*TipoMovimento - CancelarLJ4*) ,CodigoCNC, CodigoPDV,
                      'E',Quantidade, Item_de_Estoque1.SLJ4) then
                  Begin
                    ShowMessage('Falha ao Gerar Mov. LJ4!');
                    Raise Exception.Create('');
                  end;
                  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                    ' IES_SLJ4=IES_SLJ4+'+VirgPonto(Quantidade)+
                    ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(CodigoCNC));
                end;
                Next;
              end;
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_NUMERO='+IntToStr(Entidade.CodigoPDV)+
              ',CCX_CODIGO=129 '+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PDV_CODIGO='+IntToStr(Entidade.CodigoPDV)+
              ' AND TRC_SITUACAO=0 '); //Não alterar o Número dos Títulos Pagos;

            ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
              ' PDV_NOTA_FISCAL=0 '+
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
              ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV));
            SB_LocClick(sender);
            Entidade.LocalizarCod(CdPDV, CdCNC);
            Entidade.GeraLog(8100, CdCNC, CdPDV);

            If DM.Configuracao1.ControleTransacao then
              Commit;
          except
            If DM.Configuracao1.ControleTransacao then
              if trans then
              Begin
                RollBack;
                ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
              end;
          end;
        End;
        Exit;
      end
      else if (Entidade.Situacao <> 4) then
      Begin
        ShowMessage('Pedido não Finalizado!');
        Exit;
      end
      else //Definir LJ4
      Begin
        if (DM.Configuracao1.Empresa = empLBM) then
        Begin
          if (DM.Configuracao1.CodigoCNC <> 3) then //LBM Serviço não verifica nada
          Begin
            if (Entidade.TipoPag = 13) or //Cartão
               (Entidade.TipoPag = 412) or //Boleto Bancário
               (Entidade.TipoPag = 416) then //Depósito em Conta
            Begin
              ShowMessage('Tipo de Pagamento (Cartão, Boleto ou Depósito em Conta)!');
              Exit;
            end
            else
            Begin
              if (CLiente1.CodigoCNC <> Entidade.ClienteCNC) or
                 (Cliente1.CodigoCLI <> Entidade.CodigoCLI) then
              Begin
                Cliente1.Close;
                Cliente1.ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
                Cliente1.ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
                Cliente1.Open;
              end;
              if Cliente1.SPC = 1 then
              Begin
                if MessageDlg('Cliente no SPC !!!'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                  exit;
                If (DM.Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0) then
                Begin
                  Application.CreateForm(TDigitaSenha, DigitaSenha);
                  With DigitaSenha do
                  Begin
                    onClose:=nil;
                    Tag:=28;
                    Cancelar:=False;
                    Showmodal;
                    If not cancelar Then
                    Begin
                      if (Usuario1.Permissoes.IndexOf(IntToStr(8930)) < 0)then
                      begin
                        free;
                        raise Exception.Create('O usuário não tem permissão para vender a Cliente no SPC!');
                      end;
                    end
                    else
                    begin
                      free;
                      exit;
                    end;
                    free;
                  End;
                end;
              end;
              Informacoes1.Close;
              Informacoes1.ParamByName('CNC_CODIGO').asInteger:=Cliente1.CodigoCNC;
              Informacoes1.ParamByName('CLI_CODIGO').asInteger:=Cliente1.CodigoCLI;
              Informacoes1.Open;
              //Verificar Inadiplência se não for Cliente Balcão e se não for à Vista e não for Cartão
              if (Entidade.CodigoCLI <> DM.Configuracao1.CodigoCliAVista) and
                 (Entidade.CodigoFPG <> 1) and (Entidade.TipoPag <> 13) then
              Begin
                if not Informacoes1.IsEmpty then
                Begin
                  if ((Informacoes1.LimiteCredito-Informacoes1.CreditoUtil)<0) then
                    Raise Exception.Create('Limite de Crédito Ultrapassado!')
                  else if ((Informacoes1.DataAlterado) <
                          (incMonth(DM.Configuracao1.Data,-6))) then
                  Begin
                    Titulo_receber3.Close; //Verificar Títulos alterados a mais de 6 meses
                    Titulo_receber3.ParamByName('CNC_CLIENTE').asInteger := Entidade.ClienteCNC;
                    Titulo_receber3.ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
                    Titulo_receber3.Open;
                    if Titulo_receber3.DataAlterado < incMonth(DM.Configuracao1.Data,-6) then
                      Raise Exception.Create('Inf. de Crédito com mais de 6 meses!');
                  end;
                end
                else
                  Raise Exception.Create('Cliente sem Limite de crédito!');

                //Verificar Inadiplência
                Titulo_receber5.Close;
                Titulo_receber5.ParamByName('CNC_CODIGO').asInteger:=Cliente1.CodigoCNC;
                Titulo_receber5.ParamByName('CLI_CODIGO').asInteger:=Cliente1.CodigoCLI;
                Titulo_receber5.ParamByName('DATA').asDate:=DM.Configuracao1.Data;
                Titulo_receber5.Open;
                if (not Titulo_receber5.IsEmpty) then
                Begin
                  if MessageDlg('Cliente inadiplente !!!'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                    exit;
                  If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0) and
                     (not Lib3790) then
                  Begin
                    Application.CreateForm(TDigitaSenha, DigitaSenha);
                    With DigitaSenha do
                    Begin
                      onClose:=nil;
                      Tag:=28;
                      Cancelar:=False;
                      Showmodal;
                      If not cancelar Then
                      Begin
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0)then
                        begin
                          free;
                          raise Exception.Create('O usuário não tem permissão para vender a Cliente Inadiplente!');
                        end
                        else
                        begin
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                            Lib3790 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                            Lib3540 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                            Lib3830 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                            Lib3740 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                            Lib3820 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                            Lib3930 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                            Lib6230 := True;
                          if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                            Lib6240 := True;
                          if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                             Lib6230 AND Lib6240 AND
                             (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                            ShowMessage('');
                        end;
                      end
                      else
                      begin
                        free;
                        exit;
                      end;
                      free;
                    End;
                  end;
                end;
              end;
              if Informacoes1.Proibido then
                Raise Exception.Create('Cliente Bloqueado!'+#13+'Procure a gerência!');

              Titulo_receber6.Close;
              Titulo_receber6.Open;
              if (Titulo_receber6.FieldByName('MEDIA').asFloat > Entidade.Entrada) and
                 (Entidade.Entrada > 0) then
              Begin
                if MessageDlg('Entrada menor que a prestação mensal !!!'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                  exit;
                if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3830)) < 0) AND
                   (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                   (not Lib3830) and (not Lib3540) then
                Begin
                  Application.CreateForm(TDigitaSenha, DigitaSenha);
                  With DigitaSenha do
                  Begin
                    onClose:=nil;
                    Tag:=28;
                    Cancelar:=False;
                    Showmodal;
                    If not cancelar Then
                    Begin
                      if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) < 0) AND
                         (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
                      begin
                        free;
                        raise Exception.Create('O usuário não tem permissão para faturar com Entrada menor que a prestação!');
                      end
                      else
                      begin
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                          Lib3790 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                          Lib3540 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                          Lib3830 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                          Lib3740 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                          Lib3820 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                          Lib3930 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                          Lib6230 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                          Lib6240 := True;
                        if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                           Lib6230 AND Lib6240 AND
                           (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                          ShowMessage('');
                      end;
                    end
                    else
                    begin
                      free;
                      exit;
                    end;
                    free;
                  End;
                end;
              end;
              Item_Pedido_Venda1.Close;
              Entidade.Close;
              Entidade.Open;
              Item_Pedido_Venda1.Open;
              //Verificar Venda com Boleto
              if Entidade.TipoPag = 412 then //Boleto Bancário
              Begin
                if MessageDlg('Venda com Boleto Bancário !!!'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                  exit;
                If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6230)) < 0) and
                   (not Lib6230) and (not Informacoes1.Boleto) then
                Begin
                  Application.CreateForm(TDigitaSenha, DigitaSenha);
                  With DigitaSenha do
                  Begin
                    onClose:=nil;
                    Tag:=28;
                    Cancelar:=False;
                    Showmodal;
                    If not cancelar Then
                    Begin
                      if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) < 0)then
                      begin
                        free;
                        raise Exception.Create('O usuário não tem permissão para venda com Boleto!');
                      end
                      else
                      begin
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                          Lib3790 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                          Lib3540 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                          Lib3830 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                          Lib3740 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                          Lib3820 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                          Lib3930 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                          Lib6230 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                          Lib6240 := True;
                        if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                           Lib6230 AND Lib6240 AND
                           (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                          ShowMessage('');
                      end;
                    end
                    else
                    begin
                      free;
                      exit;
                    end;
                    free;
                  End;
                end;
              end;
              //Verificar Média Acima de LimiteMediaVenda dias
              if Entidade.MediaPagamento > DM.Configuracao1.LimiteMediaVenda then
              Begin
                if MessageDlg('Média de Venda '+IntToStr(Entidade.MediaPagamento)+' dias !!!'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                  exit;
                If (DM.Usuario1.Permissoes.IndexOf(IntToStr(6240)) < 0) and
                   (not Lib6240) then
                Begin
                  Application.CreateForm(TDigitaSenha, DigitaSenha);
                  With DigitaSenha do
                  Begin
                    onClose:=nil;
                    Tag:=28;
                    Cancelar:=False;
                    Showmodal;
                    If not cancelar Then
                    Begin
                      if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) < 0)then
                      begin
                        free;
                        raise Exception.Create('O usuário não tem permissão para média acima de '+IntToStr(DM.Configuracao1.LimiteMediaVenda)+' dias!');
                      end
                      else
                      begin
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                          Lib3790 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                          Lib3540 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                          Lib3830 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                          Lib3740 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                          Lib3820 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                          Lib3930 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                          Lib6230 := True;
                        if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                          Lib6240 := True;
                        if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                           Lib6230 AND Lib6240 AND
                           (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                          ShowMessage('');
                      end;
                    end
                    else
                    begin
                      free;
                      exit;
                    end;
                    free;
                  End;
                end;
              end;
              With Item_Pedido_Venda1 do
              Begin
                First;
                While not EOF do
                Begin
                  if Vinculo >= 0 then //Menor do que zero não foi vendido e sim entregue pelo cliente para manutenção
                  Begin
                    Produto1.Close;
                    Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
                    Produto1.Open;
                    Descontos1.Close;
                    Descontos1.SQL.Text:='SELECT * FROM DESCONTOS WHERE PRD_CODIGO='+
                       IntToStr(Produto1.CodigoPRD);
                    Descontos1.Open;
                    if Descontos1.IsEmpty then
                    Begin
                      Descontos1.Close;
                      Descontos1.SQL.Text:='SELECT * FROM DESCONTOS WHERE GRP_CODIGO='+
                        IntToStr(Produto1.CodigoGRP)+' AND FOR_CODIGO='+IntToStr(Produto1.CodigoFOR)+
                         ' AND (PRD_CODIGO=0 OR PRD_CODIGO IS NULL)';
                      Descontos1.Open;
                    end;
                    if Descontos1.IsEmpty then
                    Begin
                      Descontos1.Close;
                      Descontos1.SQL.Text:='SELECT * FROM DESCONTOS WHERE FOR_CODIGO='+
                         IntToStr(Produto1.CodigoFOR)+' AND (GRP_CODIGO=0 OR GRP_CODIGO IS NULL)'+
                         ' AND (PRD_CODIGO=0 OR PRD_CODIGO IS NULL)';
                      Descontos1.Open;
                    end;
                    if (Pendencia > 1) then
                    Begin
                      If MessageDlg('O Produto '+Trim(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                            'está com pendência de estoque. Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                        Exit;
                      if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3820)) < 0) and
                         (not Lib3820) then
                      Begin
                        Application.CreateForm(TDigitaSenha, DigitaSenha);
                        With DigitaSenha do
                        Begin
                          onClose:=nil;
                          Tag:=28;
                          Cancelar:=False;
                          Showmodal;
                          If not cancelar Then
                          Begin
                            if Usuario1.Permissoes.IndexOf(IntToStr(3820)) < 0 then
                            begin
                              free;
                              raise Exception.Create('O usuário não tem permissão para venda sem estoque!');
                            end
                            else
                            begin
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                                Lib3790 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                                Lib3540 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                                Lib3830 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                                Lib3740 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                                Lib3820 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                                Lib3930 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                                Lib6230 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                                Lib6240 := True;
                              if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                                 Lib6230 AND Lib6240 AND
                                 (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                                ShowMessage('');
                            end;
                          end
                          else
                          begin
                            free;
                            exit;
                          end;
                          free;
                        End;
                      end;
                    end;

                    if (PrecoDesc < Arredonda(Produto1.Precomedio)) and
                       (Produto1.Precomedio > 0) then
                    Begin
                      If MessageDlg('Produto '+Trim(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                            'Preço R$'+format('%.2f',[PrecoDesc-Produto1.Precomedio])+' abaixo do mínimo !!!'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                        Exit;
                      if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
                         (not Lib3540) and (not Lib3740) then
                      Begin
                        ShowMessage('É necessário Permissão de Liberar Venda com Preço abaixo do Mínimo!');
                        Application.CreateForm(TDigitaSenha, DigitaSenha);
                        With DigitaSenha do
                        Begin
                          onClose:=nil;
                          Tag:=28;
                          Cancelar:=False;
                          Showmodal;
                          If not cancelar Then
                          Begin
                            if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND
                               (Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) then
                            begin
                              free;
                              raise Exception.Create('O usuário não tem permissão para venda com Preço abaixo do Mínimo!');
                            end
                            else
                            begin
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                                Lib3790 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                                Lib3540 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                                Lib3830 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                                Lib3740 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                                Lib3820 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                                Lib3930 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                                Lib6230 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                                Lib6240 := True;
                              if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                                 Lib6230 AND Lib6240 AND
                                 (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                                ShowMessage('');
                            end;
                          end
                          else
                          begin
                            free;
                            exit;
                          end;
                          free;
                        End;
                      end;
                    End;

                    // Verifica se o usuário tem permissão para liberar desconto
                    if (PrecoDesc<PrecoSugerido) and
                       (Arredonda(100-(PrecoDesc/PrecoSugerido*100))<=Arredonda(Descontos1.DescontoGerente)) then
                    Begin
                      If MessageDlg('Produto '+Trim(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                            'Preço R$'+format('%.2f',[PrecoDesc-Produto1.Precomedio])+#13+
                            'Abaixo do Sugerido ('+format('%.4f',[100-PrecoDesc/PrecoSugerido*100])+' %) !!!'+#13+
                            'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                        Exit;
                      if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3930)) < 0) AND
                         (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                         (not Lib3930) and (not Lib3540) then
                      Begin
                        Application.CreateForm(TDigitaSenha, DigitaSenha);
                        With DigitaSenha do
                        Begin
                          onClose:=nil;
                          Tag:=28;
                          Cancelar:=False;
                          Showmodal;
                          If not cancelar Then
                          Begin
                            if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) < 0) AND
                               (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
                            begin
                              free;
                              raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
                            end
                            else
                            begin
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                                Lib3790 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                                Lib3540 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                                Lib3830 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                                Lib3740 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                                Lib3820 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                                Lib3930 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                                Lib6230 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                                Lib6240 := True;
                              if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                                 Lib6230 AND Lib6240 AND
                                 (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                                ShowMessage('');
                            end;
                          end
                          else
                          begin
                            free;
                            exit;
                          end;
                          free;
                        End;
                      end;
                    end
                    //Preço abaixo do sugerido de forma que o gerente não tem permissão
                    else if (PrecoDesc<PrecoSugerido) then
                    Begin
                      If MessageDlg('Produto '+(Produto1.Descricao+' '+Produto1.Referencia)+#13+
                            'Preço R$'+format('%.2f',[PrecoDesc-Produto1.Precomedio])+#13+
                            'Abaixo do Sugerido (Gerente) ('+format('%.4f',[100-PrecoDesc/PrecoSugerido*100])+' %) !!!'+#13+
                            'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                        Exit;
                      if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                         (not Lib3540) then
                      Begin
                        Application.CreateForm(TDigitaSenha, DigitaSenha);
                        With DigitaSenha do
                        Begin
                          onClose:=nil;
                          Tag:=28;
                          Cancelar:=False;
                          Showmodal;
                          If not cancelar Then
                          Begin
                            if Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then
                            begin
                              free;
                              raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
                            end
                            else
                            begin
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) > 0) then
                                Lib3790 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) > 0) then
                                Lib3540 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) > 0) then
                                Lib3830 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3740)) > 0) then
                                Lib3740 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3820)) > 0) then
                                Lib3820 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) > 0) then
                                Lib3930 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6230)) > 0) then
                                Lib6230 := True;
                              if (Usuario1.Permissoes.IndexOf(IntToStr(6240)) > 0) then
                                Lib6240 := True;
                              if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
                                 Lib6230 AND Lib6240 AND
                                 (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
                                ShowMessage('');
                            end;
                          end
                          else
                          begin
                            free;
                            exit;
                          end;
                          free;
                        End;
                      end;
                    end;
                  end;
                  next;
                End;
              End;
            end;
          end;

          Trans:=false;
          with DM.Database2 do
          begin
            try
              If DM.Configuracao1.ControleTransacao then
              Begin
                  StartTransaction;
                  Trans:=True;
              end;

              //Gerar Movimento LJ4 de Saída
              with Item_Pedido_Venda1 do
              Begin
                Close;
                Open;
                while not EOF do
                Begin
                  if Vinculo >= 0 then //Menor do que zero não foi vendido e sim entregue pelo cliente para manutenção
                  Begin
                    Item_de_Estoque1.Close;
                    Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
                    Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
                    Item_de_Estoque1.Open;
                    If Item_de_Estoque1.isempty then
                    begin
                      Item_de_Estoque1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                        DM.Configuracao1.DataHora,0,0,0,0,0,0);
                      Item_de_Estoque1.Close;
                      Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CodigoCNC;
                      Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
                      Item_de_Estoque1.open;
                    end;

                    if not DM.Movimento_Estoque_LJ41.Inserir(CodigoCNC, CodigoPRD,0(*CdFUN*),
                        4440 (*TipoMovimento - VendaLJ4*) ,CodigoCNC, CodigoPDV,
                        'S',Quantidade, Item_de_Estoque1.SLJ4) then
                    Begin
                      ShowMessage('Falha ao Gerar Mov. LJ4!');
                      Raise Exception.Create('');
                    end;
                    ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                      ' IES_SLJ4=IES_SLJ4-'+VirgPonto(Quantidade)+
                      ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                      ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                      ' AND CNC_CODIGO='+IntToStr(CodigoCNC));
                  end;
                  Next;
                end;
              end;

              ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
                ' PDV_NOTA_FISCAL=-2 '+
                ',PDV_DT_EMISSAO_VENDA="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND PDV_CODIGO='+IntToStr(CdPDV));


    //(Agente Financeiro = 1 - Carteira)                     --> CCX = 1   - Rec.Vda A Vista
    //(Agente Financeiro = 6 - Loja(Pre-Datado)) AND (Seq=1) --> CCX = 2   - Rec. Vda A Prazo Entrada
    //(Agente Financeiro = 6 - Loja(Pre-Datado)) AND (Seq<>1)--> CCX = 65  - Rec. Vda A Prazo
    //(Agente Financeiro=7,9,10 - Visa, American, Hipercard) --> CCX = 191 - Conta BB
    //(Agente Financeiro=8 - MasterCard)                     --> CCX = 193 - Conta BNB
    //(Agente Financeiro=2 - BB)                             --> CCX = 191 - Conta BB
    //(Agente Financeiro=3 - CEF)                            --> CCX = 194 - Conta CEF
    //(Agente Financeiro=4 - BNB)                            --> CCX = 193 - Conta BNB
    //(Agente Financeiro=5 - BEC)                            --> CCX = 192 - Conta BEC

              ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
                ' TRC_NUMERO="" '+
                ',CCX_CODIGO=CCX_CODIGO_REC '+
                ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
                ' AND TRC_SITUACAO=0 '); //Não alterar o Número dos Títulos Pagos;

              //Gerar Extorno de Venda Futura
              with Titulo_receber4 do
              Begin
                Close;
                ParamByName('PDV_CODIGO').asInteger := CdPDV;
                Open;
              end;
              while not Titulo_receber4.Eof do
              Begin
                CdMVCOri := 0;
                with DM.QR_Consultas do
                Begin
                  Close;
                  SQL.Text := 'SELECT TOP 1 MVC_CODIGO '+
                    ' FROM MOVIMENTO_DE_CAIXA '+
                    ' WHERE TIT_CODIGO='+IntToStr(Titulo_receber4.CodigoTRC)+
                    ' AND MVC_FLAG=1 '; //TRC
                  Open;
                  if not IsEmpty then
                    CdMVCOri := FieldByName('MVC_CODIGO').asInteger;
                end;
                if not DM.Movimento_caixa1.Inserir(1(*LBM*),0,
                       Titulo_receber4.CodigoCCX,Titulo_receber4.CodigoCCXRecebimento,
                       DM.Configuracao1.CodigoCAX,Titulo_receber4.TipoPag,
                       Titulo_receber4.Tipo,Titulo_receber4.CodigoCNC,
                       Titulo_receber4.ChequeCNC,Titulo_receber4.CodigoCHQ,
                       'ExtVdaFut TRC:'+IntToStr(Titulo_receber4.CodigoTRC),
                       '1' (*Flag*),IntToStr(Titulo_receber4.CodigoPDV)(*Numero*),''(*OBS*),
                       Titulo_receber4.Sequencia,'D',Titulo_receber4.ValorPG,
                       Titulo_receber4.Desconto,Titulo_receber4.Juros,
                       Titulo_receber4.Credcli(*CredCli*),Titulo_receber4.Valor(*ValorDoc*),
                       DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                       Titulo_receber4.CodigoTRC,
                       0(*DtCheque*),Titulo_receber4.CodigoCNC,'T',CdMVCOri,True) then
                Begin
                  ShowMessage('Falha Mov. Ext.!');
                  Raise Exception.Create('');
                end;
                if not DM.Movimento_caixa1.Inserir(1(*LBM*),0,
                       Titulo_receber4.CodigoCCX,Titulo_receber4.CodigoCCX,
                       DM.Configuracao1.CodigoCAX,Titulo_receber4.TipoPag,
                       Titulo_receber4.Tipo,Titulo_receber4.CodigoCNC,
                       Titulo_receber4.ChequeCNC,Titulo_receber4.CodigoCHQ,
                       'TRC-AUTO:'+IntToStr(Titulo_receber4.CodigoTRC),
                       '1' (*Flag*),''(*Número*),''(*OBS*),
                       Titulo_receber4.Sequencia,'C',Titulo_receber4.ValorPG,
                       Titulo_receber4.Desconto,Titulo_receber4.Juros,
                       Titulo_receber4.Credcli(*CredCli*),Titulo_receber4.Valor(*ValorDoc*),
                       DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                       0(*DtCheque*),Titulo_receber4.CodigoTRC,
                       Titulo_receber4.CodigoCNC,'T') then
                Begin
                  ShowMessage('Falha Mov. Reentrada!');
                  Raise Exception.Create('');
                end;
                Titulo_receber4.Next;
              end;

              If DM.Configuracao1.ControleTransacao then
                Commit;
              Trans := False;
              //
            except
              If DM.Configuracao1.ControleTransacao then
                if trans then
                Begin
                  RollBack;
                  ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
                end;
            end;
          End;
          //
          SB_LocClick(sender);
          Entidade.LocalizarCod(CdPDV, CdCNC);
        end;
      end;
    end;
  end;
end;

procedure TfMxSPedLocComp.Item_Pedido_Venda1BeforeOpen(DataSet: TDataSet);
begin
  try
    Item_Pedido_Venda1.ParamByName('CNC_CODIGO').asinteger := Entidade.CodigoCNC;
  except
    Item_Pedido_Venda1.ParamByName('CNC_CODIGO').asinteger := 0;
  end;
  try
    Item_Pedido_Venda1.ParamByName('PDV_CODIGO').asinteger := Entidade.CodigoPDV;
  except
    Item_Pedido_Venda1.ParamByName('PDV_CODIGO').asinteger := 0;
  end;
end;

procedure TfMxSPedLocComp.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_LOC_PDV_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxSPedLocComp.SB_ImprimirClick(Sender: TObject);
var
  sPedido: string;
  CdCNC, CdPDV: integer;
  vTotalTitulo: Double;
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o pedido!');

  CdCNC := 0;
  CdPDV := 0;
  //Imprimir Papeleta de Recebimento
  Application.CreateForm(Trpt_PapeletaDeRecebimento, rpt_PapeletaDeRecebimento);
  with rpt_PapeletaDeRecebimento do
  Begin
    Tag := 0;
    with DM.QR_Consultas do
    Begin
      sPedido := '';
      if self.Entidade.CodigoFPE > 0 then
      Begin
        Close;
        SQL.Text := 'SELECT P1.CNC_CODIGO, P1.PDV_CODIGO, P1.PDV_DOCUMENTO, '+
          ' (SELECT SUM(ROUND(I1.IPV_PRECO_DESC,2)*(I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)) '+
          ' FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO=P1.CNC_CODIGO '+
          ' AND I1.PDV_CODIGO=P1.PDV_CODIGO) AS TOTAL '+
          ' FROM PEDIDO_DE_VENDA P1 '+
          ' WHERE P1.CNC_FATURAMENTO_PENDENTE='+IntToStr(self.Entidade.FaturamentoCNC)+
          ' AND P1.FPE_CODIGO='+IntToStr(self.Entidade.CodigoFPE);
        Open;
        vTotalTitulo := 0;
        while not Eof do
        Begin
          vTotalTitulo := vTotalTitulo + Arredonda(FieldByName('TOTAL').asFloat);
          if sPedido <> '' then
            sPedido := sPedido + ';'
          else
          Begin
            CdCNC := FieldByName('CNC_CODIGO').asInteger;
            CdPDV := FieldByName('PDV_CODIGO').asInteger;
          end;
          sPedido := sPedido + FieldByName('PDV_CODIGO').asString;
          Next;
        end;

        //Somar Frete
        Close;
        SQL.Text := 'SELECT SUM(ROUND(P1.PDV_FRETE,2)) AS TotalFrete '+
          ' FROM PEDIDO_DE_VENDA P1 '+
          ' WHERE P1.CNC_FATURAMENTO_PENDENTE='+IntToStr(self.Entidade.FaturamentoCNC)+
          ' AND P1.FPE_CODIGO='+IntToStr(self.Entidade.CodigoFPE);
        Open;
        vTotalTitulo := vTotalTitulo + FieldByName('TotalFrete').asFloat;
      end
      else //Não é faturamento Pendente
      Begin
        vTotalTitulo := self.Entidade.Total + self.Entidade.Frete;
        sPedido := IntToStr(self.Entidade.CodigoPDV);
        CdCNC := self.Entidade.CodigoCNC;
        CdPDV := self.Entidade.CodigoPDV;
      end;

      zrlTotalPedido.Caption := Format('%.2f',[vTotalTitulo]);
      zrlPedidos.Caption := sPedido;
    end;
    Entidade.Close;
    Entidade.ParamByName('CNC_CODIGO').asInteger := CdCNC;
    Entidade.ParamByName('PDV_CODIGO').asInteger := CdPDV;
    Entidade.Open;
    report.Preview;
    Close;
  end;
end;

procedure TfMxSPedLocComp.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    if Column.FieldName = 'CLI_RZ_SOCIAL' then
      Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'T2')
    else
      Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'T1');
  except
  end;
end;

procedure TfMxSPedLocComp.BitBtn1Click(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise exception.Create('Selecione o Registro a ser Impresso!');

  if Tag = 1 then
  begin
    Application.CreateForm(Trpt_PedidoServicoCompleto, rpt_PedidoServicoCompleto);
    with rpt_PedidoServicoCompleto do
    begin
      Entidade.Close;
      Entidade.SQL.Text := 'SELECT * FROM PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(self.Entidade.CodigoPDV)+
        ' ORDER BY CNC_CODIGO, PDV_CODIGO ';
      Entidade.Open;
      if Entidade.IsEmpty then
        Raise exception.Create('Consulta Vazia!');
      report.preview;
    end;
  end
  else
  begin
    Application.CreateForm(Trpt_PedidoVendaMotical, rpt_PedidoVendaMotical);
    with rpt_PedidoVendaMotical do
    Begin
      tag := 1;
      if (DM.Configuracao1.Empresa IN [empMotical,empAndrea,empLuciano]) then //Motical - Meia Folha
        report.Options.PageLength := 32;

      Item_Pedido_Venda1.Close;
      Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
        ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
        ' WHERE (T2.CLI_CODIGO<>0) '+
        ' AND T1.CNC_CODIGO='+IntToStr(fMxSPedLocComp.Entidade.CodigoCNC)+
        ' AND T1.PDV_CODIGO='+IntToStr(fMxSPedLocComp.Entidade.CodigoPDV)+
        ' AND (T2.CNC_CODIGO=T1.CNC_CODIGO) '+
        ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) ';
      Item_Pedido_Venda1.Open;
      if Item_Pedido_Venda1.IsEmpty then
        Raise Exception.Create('Consulta Vazia!');
      if (report.Height > DM.Configuracao1.MaxLinhasImp) and
         (DM.Configuracao1.MaxLinhasImp <> 65) then
        report.Height := DM.Configuracao1.MaxLinhasImp;
      report.preview;
      Close;
      Exit;
    end;
  end;
end;

procedure TfMxSPedLocComp.ReimprimirLJ31Click(Sender: TObject);
begin
  if Entidade.NotaFiscal = -1 then
  Begin
    if (DM.Usuario1.Permissoes.IndexOf(IntToStr(7950)) < 0) then
    Begin
      Beep;
      Exit;
    end;

    Entidade.GeraLog(7950, Entidade.CodigoCNC, Entidade.CodigoPDV, 'CLI:'+IntToStr(Entidade.CodigoCLI));

    Application.CreateForm(Trpt_ComprovanteLJ3, rpt_ComprovanteLJ3);
    with rpt_ComprovanteLJ3 do
    Begin
      Tag := 1;

      zrlDescReimpressao.Enabled := True;

      Item_Pedido_Venda1.Close;
      Item_Pedido_Venda1.SQL.Text:='SELECT T1.*,T2.* '+
        ' FROM Item_de_pedido_de_venda T1,Pedido_de_Venda T2 '+
        ' WHERE (T2.CNC_CODIGO=T1.CNC_CODIGO) AND T2.CNC_CODIGO='+
        IntToStr(self.Entidade.CodigoCNC)+
        ' AND (T1.PDV_CODIGO = T2.PDV_CODIGO) AND T2.PDV_CODIGO='+
        IntToStr(self.Entidade.CodigoPDV)+
        ' ORDER BY T2.PDV_CODIGO,T1.IPV_CODIGO ASC';
      Item_Pedido_Venda1.Open;
      if Entidade.isEmpty then
      Begin
        ShowMessage('Consulta vazia!');
        Raise exception.Create('');
      end;
      report.Preview;
      Close;
    end;
  end;
end;

procedure TfMxSPedLocComp.ckbSomenteFaturadaClick(Sender: TObject);
begin
  SB_LocClick(SB_Loc);
end;

procedure TfMxSPedLocComp.CupomFiscal1Click(Sender: TObject);
begin
{
  if Entidade.Situacao <> 4 then
    Raise Exception.Create('O pedido de venda não foi finalizado!');

  if Application.MessageBox(PChar(#13+#13+'Atenção: '+#13+#13+#13+
                            'Utilize o código de orçamento ' +inttostr(Entidade.CodigoPDV) + ' para importar os itens informados no pedido,'+#13+
                            'Siga as instruções para realizar o processo. Deseja emitir o cupom fiscal agora?'+#13+#13+#13),
                            'PAF-ECF',
                            MB_YESNO+MB_ICONQUESTION) = id_yes then
  begin
    try
      if DMFB.PAF_Conectar then
      begin
        DMFB.PAF_SalvaDAV(Entidade.CodigoCNC, Entidade.CodigoPDV);
        PAF_ExecutaCupomFiscal;
        Entidade.Close;
        Entidade.Open;
      end;
    finally
      DMFB.PAF_Desconectar;
    end;
  end;
}
end;

procedure TfMxSPedLocComp.PopupMenu1Popup(Sender: TObject);
begin
  CupomFiscal1.Enabled := (Entidade.FieldByName('PDV_PAF').AsString <> 'S');
end;

procedure TfMxSPedLocComp.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  iImage: Integer;
begin
  if (Column.FieldName = 'PDV_SITUACAO') then
  begin
    try
      if Tag = 1 then //Serviço
      begin
        //TODO
      end
      else
      begin
        if ( Column.Field.AsInteger = 0 ) or ( Column.Field.AsInteger = 1 ) or
           ( Column.Field.AsInteger = 2 ) then
          iImage := 0 //Em Aberto
        else if Column.Field.AsInteger = 3 then
          iImage := 3 //Orçamento
        else if Column.Field.AsInteger = 4 then
          iImage := 4 //Finalizado
        else if ( Column.Field.AsInteger = 6 ) or ( Column.Field.AsInteger = 7 ) then
          iImage := 6 //Canelado
        else if ( Column.Field.AsInteger = 8 ) or ( Column.Field.AsInteger = 9 ) then
          iImage := 7 //Devolvido
        else
          iImage := -1;
      end;

      if iImage >= 0 then
      begin
        DBGrid5.Canvas.FillRect(Rect);
        DM.ImageListPDV.Draw(DBGrid5.Canvas, Trunc( (Rect.Right) div 4), Rect.Top + 1, iImage);
      end;

    except
    end;
  end;
end;


end.
