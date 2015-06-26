unit MxSelDetalhePedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Cliente, DBCtrls, CentroCusto, Menus,
  Detalhe_Venda, Funcionario, Pedido_de_Venda, Item_Pedido_Venda;

type
  TfMxSelDetalhePedido = class(TForm)
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
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Principal1: TMenuItem;
    Localizar1: TMenuItem;
    Cliente1: TCliente;
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda1PDV_CONTATO: TStringField;
    Pedido_de_Venda1FUN_CODIGO: TIntegerField;
    Pedido_de_Venda1Vendedor: TStringField;
    Funcionario1: TFuncionario;
    Pedido_de_Venda1Centro: TStringField;
    CentroCusto2: TCentroCusto;
    Pedido_de_Venda1PDV_CREDITO: TFloatField;
    Pedido_de_Venda1FUN_ARQUITETO: TIntegerField;
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
    Item_Pedido_Venda2: TItem_Pedido_Venda;
    Pedido_de_Venda1DPV_DT_CADASTRO: TDateTimeField;
    Pedido_de_Venda1DPV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda1DPV_TIPO_ARMACAO: TStringField;
    Pedido_de_Venda1DPV_OBS_ARMACAO: TStringField;
    Pedido_de_Venda1DPV_TIPO_LENTES: TStringField;
    Pedido_de_Venda1DPV_OBS_LENTES: TStringField;
    Pedido_de_Venda1DPV_MEDICO_CRM: TIntegerField;
    Pedido_de_Venda1DPV_MEDICO_NOME: TStringField;
    Pedido_de_Venda1DPV_MEDICO_FONE: TStringField;
    Pedido_de_Venda1DPV_OD_ESF: TFloatField;
    Pedido_de_Venda1DPV_OE_ESF: TFloatField;
    Pedido_de_Venda1DPV_OD_CIL: TFloatField;
    Pedido_de_Venda1DPV_OE_CIL: TFloatField;
    Pedido_de_Venda1DPV_OD_EIXO: TFloatField;
    Pedido_de_Venda1DPV_OE_EIXO: TFloatField;
    Pedido_de_Venda1DPV_OD_DNP: TFloatField;
    Pedido_de_Venda1DPV_OE_DNP: TFloatField;
    Pedido_de_Venda1DPV_OD_ALT: TFloatField;
    Pedido_de_Venda1DPV_OE_ALT: TFloatField;
    Pedido_de_Venda1DPV_OD_ADICAO: TFloatField;
    Pedido_de_Venda1DPV_OE_ADICAO: TFloatField;
    Pedido_de_Venda1DPV_SITUACAO: TIntegerField;
    Pedido_de_Venda1DPV_OBSERVACAO: TStringField;
    Pedido_de_Venda1FUN_CODIGO_1: TIntegerField;
    Pedido_de_Venda1FUN_CODIGO_2: TIntegerField;
    Pedido_de_Venda1DPV_COMISSAO_1: TFloatField;
    Pedido_de_Venda1DPV_COMISSAO_2: TFloatField;
    Pedido_de_Venda1DPV_MEIO: TIntegerField;
    Pedido_de_Venda1DPV_MEIO_OUTRO: TStringField;
    Pedido_de_Venda1DPV_PASCIENTE: TStringField;
    Pedido_de_Venda1PDV_CODIGO_1: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO_1: TIntegerField;
    Pedido_de_Venda1USU_CODIGO_1: TIntegerField;
    Pedido_de_Venda1PDV_ANTECIPADO: TFloatField;
    Pedido_de_Venda1PDV_ENTREGA_DEPOSITO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitFecharClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure Pedido_de_Venda1CalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    Cancelar : Boolean;
    Entidade: TPedido_de_Venda;
  end;

var
  fMxSelDetalhePedido: TfMxSelDetalhePedido;

implementation
uses
  MxReceber, UDM, MxPedidoRapido, MxSPediLoc, funcoes, DigSenha,
  UPapeletaDeRecebimento, UPedidoVendaMotical, UComprovanteLJ3,
  UPedidoServicoCompleto;

{$R *.DFM}

procedure TfMxSelDetalhePedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid5.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_SEL_DETALHEPDV'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Action:=Cafree;
end;

procedure TfMxSelDetalhePedido.bitFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelDetalhePedido.SB_LocClick(Sender: TObject);
begin
  Entidade.Close;
  if edtLocalizar.Text = '*' then
    Entidade.sql.Text:='SELECT D1.*,T1.*,T2.CLI_RZ_SOCIAL,'+
      ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
      ' FROM PEDIDO_DE_VENDA T1, CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
      ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
      ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
      ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
      ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
      ' ORDER BY T2.CLI_RZ_SOCIAL DESC'
  Else
    Case cmbCampo.ItemIndex of
      0: //Código do Pedido
      Begin
        If not VerificaInteiroBranco(edtLocalizar.Text) then
          Raise Exception.Create('Código do pedido de venda inválido!');
        Entidade.sql.Text:='SELECT D1.*,T1.*,T2.CLI_RZ_SOCIAL,'+
          ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
          ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
          ' AND T1.PDV_CODIGO='+edtLocalizar.Text+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
          ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
          ' ORDER BY T2.CLI_RZ_SOCIAL DESC';
      End;
      1: //Código do Cliente
      Begin
        If not VerificaInteiroBranco(edtLocalizar.Text) then
          Raise Exception.Create('Código do cliente inválido!');
        Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
          ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
          ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND T2.CLI_CODIGO='+edtLocalizar.Text+
          ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
          ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
          ' ORDER BY T2.CLI_RZ_SOCIAL DESC';
      End;
      2: //Nome do Cliente
      Begin
        Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
          ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
          ' WHERE T2.CLI_CODIGO=T1.CLI_CODIGO '+
          ' AND T2.CLI_RZ_SOCIAL LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
          ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
          ' ORDER BY T2.CLI_RZ_SOCIAL DESC';
      end;
      3: //Data Finalizado/Entrega
      Begin
        If not VerificaDataBranco(edtLocalizar.Text) then
          Raise Exception.Create('Data do pedido de venda inválida!');
        Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
          ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
          ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND T1.PDV_DT_ENTREGA>= :DATAINI '+
          ' AND T1.PDV_DT_ENTREGA< :DATAFIM '+
          ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
          ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
          ' ORDER BY T2.CLI_RZ_SOCIAL ';
        Entidade.parambyname('DATAINI').AsDateTime:=StrToDate(edtLocalizar.Text);
        Entidade.parambyname('DATAFIM').AsDateTime:=StrToDate(edtLocalizar.Text)+1;
      End;
      4: //Data Emissão
      Begin
         If not VerificaDataBranco(edtLocalizar.Text) then
           Raise Exception.Create('Data do pedido de venda inválida!');
         Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.PDV_DT_EMISSAO_VENDA>=:DATAINI '+
            ' AND T1.PDV_DT_EMISSAO_VENDA<:DATAFIM '+
            ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
         Entidade.parambyname('DATAINI').AsDateTime:=StrToDate(edtLocalizar.Text);
         Entidade.parambyname('DATAFIM').AsDateTime:=StrToDate(edtLocalizar.Text)+1;
      End;
      5: //Arquiteto/Projetista/Montador
      Begin
        If not VerificaInteiro(edtLocalizar.Text) then
          Raise exception.Create('Código do Arquiteto/Projetista/Montador inválido!')
        else if Trim(edtLocalizar.Text) <> '' then
          Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.FUN_ARQUITETO='+edtLocalizar.Text+
            ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
            ' ORDER BY T2.CLI_RZ_SOCIAL DESC'
        else
          Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.FUN_ARQUITETO>0 '+
            ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
            ' ORDER BY T2.CLI_RZ_SOCIAL DESC';

      end;
      6: //Documento
      Begin
         If not VerificaInteiroBranco(edtLocalizar.Text) then
           Raise Exception.Create('Documento inválido!');
         Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.PDV_DOCUMENTO LIKE "%'+edtLocalizar.Text+'%" '+
            ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      End;
      7: //Nome do Paciente
      Begin
        Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
          ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
          ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
          ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
          ' WHERE T2.CLI_CODIGO=T1.CLI_CODIGO '+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          //' AND T1.PDV_CONTATO LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND D1.DPV_PASCIENTE LIKE "%'+edtLocalizar.Text+'%" '+
          ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
          ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
          ' ORDER BY T1.PDV_CONTATO DESC';
      end;
      8: //Caixa
      Begin
         If not VerificaInteiroBranco(edtLocalizar.Text) then
           Raise Exception.Create('Caixa inválido!');
         Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.PDV_CAIXA LIKE "%'+edtLocalizar.Text+'%" '+
            ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      End;
      9: //CodigoFPE
      Begin
         If not VerificaInteiroBranco(edtLocalizar.Text) then
           Raise Exception.Create('Código do Faturamento Pendente inválido!');
         Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.FPE_CODIGO='+edtLocalizar.Text+
            ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      End;
      10: //Nota Fiscal
      Begin
         If not VerificaInteiroBranco(edtLocalizar.Text) then
           Raise Exception.Create('Nota Fiscal inválida!');
         Entidade.sql.Text:='SELECT D1.*, T1.*,T2.CLI_RZ_SOCIAL,'+
            ' (SELECT MAX(I1.FUN_CODIGO) FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=T1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=T1.PDV_CODIGO) AS FUN_CODIGO '+
            ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2, DETALHE_DE_PEDIDO_DE_VENDA D1 '+
            ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
            ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
            ' AND T1.PDV_NOTA_FISCAL="'+edtLocalizar.Text+'" '+
            ' AND T1.PDV_CODIGO=D1.PDV_CODIGO '+
            ' AND T1.CNC_CODIGO=D1.CNC_CODIGO '+
            ' ORDER BY T2.CLI_RZ_SOCIAL ';
      End;
    end;
  Entidade.Open;
end;

procedure TfMxSelDetalhePedido.Pedido_de_Venda1CalcFields(DataSet: TDataSet);
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

procedure TfMxSelDetalhePedido.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  cmbCampo.ItemIndex:=0;
  edtLocalizar.SetFocus;
end;

procedure TfMxSelDetalhePedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  Begin
    Close;
    Exit;
  end;

  if Key = VK_F3 then
    SB_LocClick(SB_Loc);
end;

procedure TfMxSelDetalhePedido.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
  try
    DBGrid5.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_SEL_DETALHEPDV'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxSelDetalhePedido.DBGrid5TitleClick(Column: TColumn);
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

end.
