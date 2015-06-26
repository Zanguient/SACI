unit MxSPediLoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Pedido_de_Venda, Cliente, Titulo_receber, Menus, Item_Pedido_Venda, Mask;

type
  TfMxSPedLoc = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    BitBtn2: TBitBtn;
    DSPedido_de_Venda1: TDataSource;
    Pedido_de_Venda1: TPedido_de_Venda;
    DBGrid1: TDBGrid;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
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
    Pedido_de_Venda1Total: TStringField;
    Titulo_receber1: TTitulo_receber;
    Titulo_receber1TOTALPEDIDO: TFloatField;
    ckbOrcamentosValidos: TCheckBox;
    ckbOrcamentosTodos: TCheckBox;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    MainMenu1: TMainMenu;
    PedidodeVenda1: TMenuItem;
    Localizar1: TMenuItem;
    N1: TMenuItem;
    Confirmar1: TMenuItem;
    Fechar1: TMenuItem;
    ckbDevolucaoParcial: TCheckBox;
    Pedido_de_Venda2: TPedido_de_Venda;
    Pedido_de_Venda1PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda1PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda1PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Pedido_de_Venda1Nota: TStringField;
    Pedido_de_Venda2Nota: TStringField;
    Pedido_de_Venda2PDV_CODIGO: TIntegerField;
    Pedido_de_Venda2CNC_CODIGO: TIntegerField;
    Pedido_de_Venda2CLI_CODIGO: TIntegerField;
    Pedido_de_Venda2USU_CODIGO: TIntegerField;
    Pedido_de_Venda2PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda2PDV_TOTAL: TFloatField;
    Pedido_de_Venda2PDV_LISTADO: TIntegerField;
    Pedido_de_Venda2PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda2PDV_DIAS_RESERV: TIntegerField;
    Pedido_de_Venda2PDV_NOTA_FISCAL: TSmallintField;
    Pedido_de_Venda2AGF_CODIGO: TIntegerField;
    Pedido_de_Venda2FPG_CODIGO: TIntegerField;
    Pedido_de_Venda2PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda2PDV_ENTRADA: TFloatField;
    Pedido_de_Venda2CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda2PDV_EM_USO: TIntegerField;
    Pedido_de_Venda2PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda2PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda2PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda2PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda2PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda2PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda2PDV_OBS: TStringField;
    Pedido_de_Venda2PDV_NOTA_CUPOM: TIntegerField;
    Pedido_de_Venda2TRO_CODIGO: TIntegerField;
    Pedido_de_Venda2TRO_DATA: TDateTimeField;
    Pedido_de_Venda2TRO_MOTIVO: TStringField;
    Pedido_de_Venda2TRO_SITUACAO: TIntegerField;
    Pedido_de_Venda2TRO_NOTA_FISCAL: TIntegerField;
    Pedido_de_Venda2CLI_PESSOA_FISICA: TSmallintField;
    Pedido_de_Venda2CLI_DT_CADASTRO: TDateTimeField;
    Pedido_de_Venda2CLI_DATA_NASC: TDateTimeField;
    Pedido_de_Venda2CLI_RZ_SOCIAL: TStringField;
    Pedido_de_Venda2CLI_NOME_FAN: TStringField;
    Pedido_de_Venda2CLI_CGC_CPF: TStringField;
    Pedido_de_Venda2CLI_CGF_RG: TStringField;
    Pedido_de_Venda2CLI_LOGRADOURO: TIntegerField;
    Pedido_de_Venda2CLI_ENDERECO: TStringField;
    Pedido_de_Venda2CLI_BAIRRO: TStringField;
    Pedido_de_Venda2CLI_CIDADE: TStringField;
    Pedido_de_Venda2CLI_UF: TStringField;
    Pedido_de_Venda2CLI_CEP: TStringField;
    Pedido_de_Venda2CLI_FONE: TStringField;
    Pedido_de_Venda2CLI_SITUACAO: TIntegerField;
    Pedido_de_Venda2CLI_CREDITO: TFloatField;
    Pedido_de_Venda2CLI_PAI: TStringField;
    Pedido_de_Venda2CLI_MAE: TStringField;
    Pedido_de_Venda2CLI_CONJUGE: TStringField;
    Pedido_de_Venda2CLI_OBS1: TStringField;
    Pedido_de_Venda2CLI_LOCALTRABALHO: TStringField;
    Pedido_de_Venda2CLI_FAX: TStringField;
    Pedido_de_Venda2CLI_CELULAR: TStringField;
    Pedido_de_Venda2CLI_SITE: TStringField;
    Pedido_de_Venda2CLI_EMAIL: TStringField;
    Pedido_de_Venda2CLI_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda2CLI_SPC: TIntegerField;
    Pedido_de_Venda2CLI_VENDA_ATACADO: TIntegerField;
    Pedido_de_Venda2CLI_DESCONTO: TFloatField;
    Pedido_de_Venda2CLI_DT_SPC: TDateTimeField;
    Cliente1: TCliente;
    Pedido_de_Venda1Cliente: TStringField;
    Pedido_de_Venda1PDV_OBS: TStringField;
    ckbMaquina: TCheckBox;
    edtMaquina: TEdit;
    Pedido_de_Venda2CLI_ORGAO: TIntegerField;
    Pedido_de_Venda2CLI_REFERENCIA1: TStringField;
    Pedido_de_Venda2CLI_REFERENCIA2: TStringField;
    Pedido_de_Venda2CLI_REFERENCIA3: TStringField;
    Pedido_de_Venda1Fone: TStringField;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Pedido_de_Venda2Cliente: TStringField;
    Pedido_de_Venda2Fone: TStringField;
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda1PDV_CONTATO: TStringField;
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
    Pedido_de_Venda2PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda2PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda2PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda2PDV_CONTATO: TStringField;
    Pedido_de_Venda2PDV_CREDITO: TFloatField;
    Pedido_de_Venda2FUN_ARQUITETO: TIntegerField;
    Pedido_de_Venda2PDV_TITULO_GERADO: TIntegerField;
    Pedido_de_Venda2PDV_TIPO_VENDA: TIntegerField;
    Pedido_de_Venda2PDV_PACOTE: TIntegerField;
    Pedido_de_Venda2PDV_GRUPO_ESPECIAL: TIntegerField;
    Pedido_de_Venda2PDV_DT_PREVISAO: TDateTimeField;
    Pedido_de_Venda2PDV_DT_ENTREGA: TDateTimeField;
    Pedido_de_Venda2PDV_DOCUMENTO: TStringField;
    Pedido_de_Venda2PDV_CAIXA: TStringField;
    Pedido_de_Venda2PDV_CODIGO_1: TIntegerField;
    Pedido_de_Venda2CNC_CODIGO_1: TIntegerField;
    Pedido_de_Venda2USU_CODIGO_1: TIntegerField;
    Pedido_de_Venda2CLI_CODIGO_1: TIntegerField;
    Pedido_de_Venda2CNC_CODIGO_2: TIntegerField;
    Pedido_de_Venda2USU_CODIGO_2: TIntegerField;
    Pedido_de_Venda2CLI_IDENTIFICACAO: TStringField;
    Pedido_de_Venda2CLI_PROFISSAO: TStringField;
    Pedido_de_Venda2CLI_QUINZENAL: TIntegerField;
    Pedido_de_Venda2CLI_MENSAL: TIntegerField;
    Pedido_de_Venda2CLI_NOTA: TIntegerField;
    Pedido_de_Venda2CLI_CLASSIFICACAO: TIntegerField;
    Pedido_de_Venda2CLI_MAQUINA: TIntegerField;
    Pedido_de_Venda1PDV_SERVICO: TIntegerField;
    Pedido_de_Venda2PDV_SERVICO: TIntegerField;
    Pedido_de_Venda1PDV_FONE_CONTATO: TStringField;
    Pedido_de_Venda1FPE_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Pedido_de_Venda1PDV_DT_FPE: TDateTimeField;
    Pedido_de_Venda2PDV_FONE_CONTATO: TStringField;
    Pedido_de_Venda2FPE_CODIGO: TIntegerField;
    Pedido_de_Venda2CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Pedido_de_Venda2PDV_DT_FPE: TDateTimeField;
    Pedido_de_Venda1CNT_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_GARANTIA: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO_ORIGEM: TIntegerField;
    Pedido_de_Venda1PDV_FRETE: TFloatField;
    Pedido_de_Venda2CNT_CODIGO: TIntegerField;
    Pedido_de_Venda2PDV_GARANTIA: TIntegerField;
    Pedido_de_Venda2PDV_CODIGO_ORIGEM: TIntegerField;
    Pedido_de_Venda2PDV_FRETE: TFloatField;
    Pedido_de_Venda1PDV_ANTECIPADO: TFloatField;
    Pedido_de_Venda2Total: TStringField;
    ckbSituacao: TCheckBox;
    cmbSituacao: TComboBox;
    cmbTipoSituacao: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure bitConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Pedido_de_Venda1CalcFields(DataSet: TDataSet);
    procedure ckbOrcamentosValidosClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure ckbDevolucaoParcialClick(Sender: TObject);
    procedure Pedido_de_Venda2CalcFields(DataSet: TDataSet);
    procedure edtMaquinaExit(Sender: TObject);
    procedure ckbMaquinaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbOrcamentosTodosClick(Sender: TObject);
    procedure ckbSituacaoClick(Sender: TObject);
    procedure cmbSituacaoClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    FiltroMaquina, sFiltroSituacao:string;
  public
    Entidade: TPedido_de_Venda;
    sFiltrarServico: String;
    USU:string;
    { Public declarations }
  end;

var
  fMxSPedLoc: TfMxSPedLoc;

implementation
uses UDM, Funcoes, MxPedidoRapido, MxNotaFiscal, MxSelPedido,
  MxAlterarParcelas, MxPedidoMotCal, MxServico, MxSituacaoServico,
  MxServicoLBM, MxAssistenciaTecnica, MxSelAssitenciaTecnica, MxPendencia,
  MxPedidoMotCal_2;

{$R *.DFM}

procedure TfMxSPedLoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid1.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_SPediLoc_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Titulo_receber1.Close;
  Action:=Cafree;
end;

procedure TfMxSPedLoc.BitBtn2Click(Sender: TObject);
begin
  If Tag=2 then
    fMxPedidoRapido.CancelarLoc:=True
  Else if tag=4 then
    fMxNotaFiscal.CancelarLoc:=True
  //Else If Tag=5 then
    //fMxPedidoLBM.CancelarLoc:=True
  Else If Tag=9 then
    fMxPedidoMotCal.CancelarLoc:=True
  Else If Tag=10 then
    fMxServico.CancelarLoc:=True
  Else If Tag IN [11,12] then
    fMxServicoLBM.CancelarLoc:=True
  Else If Tag = 13 then //Gerar Serviço Automático
    fMxServico.CancelarLoc:=True
  Else If Tag = 15 then //Pendencia
    fMxPendencia.CancelarLoc:=True;
  Close;
end;

procedure TfMxSPedLoc.bitConfirmarClick(Sender: TObject);
var
  CdCNC, CdPDV, CdAGF, CdFPG, iTipoPag: integer;
  sDocumento: string;
  Trans : Boolean;
begin
  If not Entidade.IsEmpty Then
  Begin
    If tag=2 then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT PDV_EM_USO, PDV_SITUACAO '+
          ' FROM PEDIDO_DE_VENDA PDV '+
          ' WHERE CNC_CODIGO='+self.Entidade.FieldByName('CNC_CODIGO').AsString+
          ' AND PDV_CODIGO='+self.Entidade.FieldByName('PDV_CODIGO').AsString;
        Open;
        if FieldByName('PDV_EM_USO').AsInteger = 1 then
          Raise exception.Create('Pedido em Uso!');
        if FieldByName('PDV_SITUACAO').AsInteger > 3 then
          Raise exception.Create('Pedido já processado/cancelado!');
      end;
      fMxPedidoRapido.edtCodigoPDV.text := self.Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxPedidoRapido.CancelarLoc:=False;
    end
    else If tag=4 then
    Begin
      fMxNotaFiscal.edtPedidoCNC.text := IntToStr(self.Entidade.CodigoCNC);
      fMxNotaFiscal.edtCodigoPDV.text := IntToStr(self.Entidade.CodigoPDV);
      fMxNotaFiscal.CancelarLoc:=False;
    end
    (*else if tag=5 then
    Begin
      fMxPedidoLBM.edtCodigoPDV.text := self.Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxPedidoLBM.CancelarLoc:=False;
    end*)
    else if tag=6 then
      fMxSelPedido.edtCodigoPDV.text := self.Entidade.FieldByName('PDV_CODIGO').AsString
    else if tag=7 then
      fMxSelPedido.edtNotaFiscal.text := self.Entidade.FieldByName('PDV_NOTA_FISCAL').AsString
    else if tag=8 then
    Begin
      fMxAlterarParcelas.edtPedidoCNC.text:=IntToStr(self.Entidade.CodigoCNC);    
      fMxAlterarParcelas.edtCodigoPDV.text:=IntToStr(self.Entidade.CodigoPDV);
      fMxAlterarParcelas.edtDataHoraPed.Text:=DateToStr(self.Entidade.DataHora);
      fMxAlterarParcelas.edtRazaoSocial.Text:=self.Entidade.FieldByName('Cliente').asString;
      if self.Entidade.FieldByName('Nota').asString <> '0' then
        if self.Entidade.FieldByName('Nota').asString = '-1' then
          fMxAlterarParcelas.edtNotaFiscal.Text := 'LJ3'
        else if self.Entidade.FieldByName('Nota').asString = '-2' then
          fMxAlterarParcelas.edtNotaFiscal.Text := 'LJ4'
        else
          fMxAlterarParcelas.edtNotaFiscal.Text:=self.Entidade.FieldByName('Nota').asString
      else
        fMxAlterarParcelas.edtNotaFiscal.Clear;
      fMxAlterarParcelas.dblTipoPagamentoPed.KeyValue:=self.Entidade.TipoPag;
      fMxAlterarParcelas.dblFormaDePagamentoPed.KeyValue:=self.Entidade.CodigoFPG;
      fMxAlterarParcelas.dblAgenteFinanceiroPed.KeyValue:=self.Entidade.CodigoAGF;
      with Item_Pedido_Venda1 do //Filtrado Vínculo >= 0
      Begin
        if (DM.Configuracao1.Empresa = empMotical) and
           (self.Entidade.CodigoFPE > 0) then
        Begin
          Close;
          SQL.Text := 'SELECT MAX(FUN_CODIGO) AS VENDEDOR, '+
            ' SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO))  AS TOTAL '+
            ' FROM ITEM_DE_PEDIDO_DE_VENDA I1, PEDIDO_DE_VENDA P1 '+
            ' WHERE P1.CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
            ' AND P1.FPE_CODIGO='+IntToStr(self.Entidade.CodigoFPE)+
            ' AND (IPV_VINCULO>=0 OR IPV_VINCULO IS NULL) '+
            ' AND I1.CNC_CODIGO=P1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=P1.PDV_CODIGO ';
          Open;
        end
        else
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger := self.Entidade.CodigoCNC;
          ParamByName('PDV_CODIGO').asInteger := self.Entidade.CodigoPDV;
          Open;
        end;
        fMxAlterarParcelas.dblVendedor.KeyValue:=FieldByName('VENDEDOR').asInteger;
        fMxAlterarParcelas.edtTotalPedidoComFrete.Text:=format('%.2f',[FieldByName('TOTAL').asFloat+Arredonda(self.Entidade.Frete)]);
      end;
      fMxAlterarParcelas.edtClienteCNC.text:=IntToStr(self.Entidade.ClienteCNC);
      fMxAlterarParcelas.edtCodigoCLI.text:=IntToStr(self.Entidade.CodigoCLI);
    end
    else If tag=9 then
    Begin
      fMxPedidoMotCal.edtCodigoPDV.text:=self.Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxPedidoMotCal.CancelarLoc:=False;
    end
    else If tag=10 then
    Begin
      fMxServico.edtCodigoPDV.text:=self.Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxServico.CancelarLoc:=False;
    end
    else If tag=11 then
    Begin
      fMxServicoLBM.edtCodigoPDV.text:=self.Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxServicoLBM.CancelarLoc:=False;
    end
    else If tag=12 then
    Begin
      fMxServicoLBM.edtCodigoPDVOrigem.text:=self.Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxServicoLBM.CancelarLoc:=False;
    end
    else If tag=13 then
    Begin
      //Gerar Serviço Automárica
      CdPDV    := 0;
      CdAGF    := 1;
      CdFPG    := 1;
      iTipoPag := 5;

      with DM.QR_Consultas do
      Begin
        Close;
        //Alteração em 27/07/2013
        //Tive que colocar o DISTINCT, pois o pré-recebimento está gerando o PEDIDO_AUXILIAR duplicado ou triplicado ou quadriplicado, etc
        //dependendo do número do pedido, se tiver o mesmo número nas outras lojas
        SQL.Text := 'SELECT DISTINCT * '+
          ' FROM PEDIDO_AUXILIAR '+
          ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
          ' AND PDV_CODIGO='+IntToStr(self.Entidade.CodigoPDV);
        Open;

        Trans:=false;
        with DM.Database2 do
        begin
          try
            If DM.Configuracao1.ControleTransacao then
            Begin
              StartTransaction;
              Trans:=True;
            end;

            CdCNC    := 0;
            while not Eof do
            Begin
              CdCNC := DM.Configuracao1.CodigoCNC;
              sDocumento := FieldByName('PDV_DOCUMENTO').asString;
              //Pedido_de_Venda
              fMxServico.Entidade.Inserir(CdCNC, 0,
                FieldByName('CLI_CODIGO').asInteger,
                CdAGF    (*Agente Financeiro*),
                CdFPG    (*Forma de Pagamento*),
                iTipoPag (*Tipo de Pagamento*),
                DM.Configuracao1.CodigoUSU, 0, 0,
                FieldByName('PDV_OBSERVACAO').asString (*Observacao*),
                sDocumento,
                0 (*Dias Reserva*),
                FieldByName('CNC_CLIENTE').asInteger,
                DM.Configuracao1.DataHora,
                FieldByName('PDV_DT_PREVISAO').asDateTime,
                False (*Grupo Especial*),
                True (*Serviço*),
                FieldByName('PDV_PASCIENTE').asString);  (*Contato*)

              CdPDV := fMxServico.Entidade.SCodigo;
              //Detalhe_do_Pedido
              ExecutaSQL(DM.QR_Comandos,'INSERT DETALHE_DE_PEDIDO_DE_VENDA '+
                '(CNC_CODIGO,PDV_CODIGO,USU_CODIGO,DPV_DT_CADASTRO '+
                ',DPV_TIPO_ARMACAO,DPV_OBS_ARMACAO,DPV_TIPO_LENTES,DPV_OBS_LENTES '+
                ',DPV_MEDICO_CRM,DPV_MEDICO_NOME,DPV_MEDICO_FONE '+
                ',DPV_OD_ESF,DPV_OE_ESF,DPV_OD_CIL,DPV_OE_CIL '+
                ',DPV_OD_EIXO,DPV_OE_EIXO,DPV_OD_DNP,DPV_OE_DNP '+
                ',DPV_OD_ALT,DPV_OE_ALT,DPV_OD_ADICAO,DPV_OE_ADICAO '+
                ',DPV_SITUACAO,DPV_OBSERVACAO,FUN_CODIGO_1,FUN_CODIGO_2 '+
                ',DPV_COMISSAO_1,DPV_COMISSAO_2,DPV_MEIO,DPV_MEIO_OUTRO,DPV_PASCIENTE) '+
                ' VALUES '+
                '( '+IntToStr(DM.Configuracao1.CodigoCNC)+
                ', '+IntToStr(CdPDV)+
                ', '+IntToStr(DM.Configuracao1.CodigoUSU)+
                ',"'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ',"'+FieldByName('PDV_TIPO_ARMACAO').asString+'" '+
                ',"'+FieldByName('PDV_OBS_ARMACAO').asString+'" '+
                ',"'+FieldByName('PDV_TIPO_LENTES').asString+'" '+
                ',"'+FieldByName('PDV_OBS_LENTES').asString+'" '+
                ',"'+FieldByName('PDV_MEDICO_CRM').asString+'" '+
                ',"'+FieldByName('PDV_MEDICO_NOME').asString+'" '+
                ',"'+FieldByName('PDV_MEDICO_FONE').asString+'" '+
                ', '+VirgPonto(FieldByName('PDV_OD_ESF').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OE_ESF').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OD_CIL').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OE_CIL').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OD_EIXO').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OE_EIXO').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OD_DNP').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OE_DNP').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OD_ALT').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OE_ALT').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OD_ADICAO').asFloat)+
                ', '+VirgPonto(FieldByName('PDV_OE_ADICAO').asFloat)+
                ',0'+//Situacao
                ',""'+//Observacao
                ',0'+//Indicacao1
                ',0'+//Indicacao2
                ',0'+//ComissaoIndicacao1
                ',0'+//ComissaoIndicacao2
                ',0'+//Meio
                ',""'+
                ',"'+FieldByName('PDV_PASCIENTE').asString+'")'); //Nome do Pasciente
              Next;
            end;

          fMxServico.Entidade.GeraLog(7930,CdCNC, CdPDV, sDocumento);

          if trans then
            Commit;
          Trans := False; //Para não fazer mais RollBack
        except
            if trans then
            Begin
              RollBack;
              ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
            end;
        end;
      End;
      end;
      fMxServico.edtCodigoPDV.text := IntToStr(CdPDV);
      fMxServico.CancelarLoc:=False;
    end
    else If tag=14 then
    Begin
      fMxAssistenciaTecnica.edtPedidoCNC.text         := self.Entidade.FieldByName('CNC_CODIGO').AsString;
      fMxAssistenciaTecnica.edtCodigoPDV.Text         := self.Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxAssistenciaTecnica.mskDataEntregaPedido.Text := self.Entidade.FieldByName('PDV_DT_ENTREGA').AsString;
      fMxAssistenciaTecnica.edtNumeroNota.Text        := self.Entidade.FieldByName('PDV_NOTA_FISCAL').AsString;
      fMxAssistenciaTecnica.mskDataEmissao.Text       := self.Entidade.FieldByName('PDV_DT_EMISSAO_VENDA').AsString;
      fMxAssistenciaTecnica.edtClienteCNC.Text        := self.Entidade.FieldByName('CNC_CLIENTE').AsString;
      fMxAssistenciaTecnica.edtCodigoCLI.Text         := self.Entidade.FieldByName('CLI_CODIGO').AsString;
    end
    else If tag=15 then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT PDV_EM_USO, PDV_SITUACAO '+
          ' FROM PEDIDO_DE_VENDA PDV '+
          ' WHERE CNC_CODIGO='+self.Entidade.FieldByName('CNC_CODIGO').AsString+
          ' AND PDV_CODIGO='+self.Entidade.FieldByName('PDV_CODIGO').AsString;
        Open;
        if FieldByName('PDV_EM_USO').AsInteger = 1 then
          Raise exception.Create('Pedido em Uso!');
        if FieldByName('PDV_SITUACAO').AsInteger > 3 then
          Raise exception.Create('Pedido já processado/cancelado!');
      end;
      fMxPendencia.edtPedidoCNC.text := self.Entidade.FieldByName('CNC_CODIGO').AsString;      
      fMxPendencia.edtCodigoPDV.text := self.Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxPendencia.CancelarLoc:=False;
    end
    else If tag=16 then
    Begin
      fMxPedidoMotCal_2.edtCodigoPDV.text:=self.Entidade.FieldByName('PDV_CODIGO').AsString;
      fMxPedidoMotCal_2.CancelarLoc:=False;
    end;


    Close;
  End
  Else if not Pedido_de_Venda2.IsEmpty Then
  Begin
    if Pedido_de_Venda2.EmUsu = 1 then
      Raise Exception.Create('Pedido já aberto!');
    If tag=4 then
      if (fMxNotaFiscal.dblTipoNota.KeyValue = 362) and (ckbDevolucaoParcial.Checked) and
         (not Pedido_de_Venda2.IsEmpty) then
      Begin
        fMxNotaFiscal.edtPedidoCNC.text := IntToStr(Pedido_de_Venda2.CodigoCNC);
        fMxNotaFiscal.edtCodigoPDV.text := IntToStr(Pedido_de_Venda2.CodigoPDV);
        fMxNotaFiscal.edtCodigoTRO.text := Pedido_de_Venda2.FieldByName('TRO_CODIGO').asString;
        fMxNotaFiscal.CancelarLoc:=False;
        Close;
      end;
  end
  else
    ShowMessage('Escolha um pedido antes de continuar!');
end;

procedure TfMxSPedLoc.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  FiltroMaquina   := '';
  sFiltroSituacao := '';
  USU:='';
  Try
    ExecutaSQL(DM.QR_Comandos,'CREATE INDEX PDV_CNCEmUsoSitReservaData ON PEDIDO_DE_VENDA (CNC_CODIGO,PDV_EM_USO,PDV_SITUACAO,PDV_DIAS_RESERV)');
  Except
  end;

  with Titulo_receber1 do
  Begin
    Close;
    if not (Self.Tag in [4,8,15]) then
      SQL.Text := 'SELECT SUM(TRC_VALOR) as TotalPedido '+
        ' FROM TRCTEMP '+
        ' WHERE CNC_CODIGO=:CNC_CODIGO '+
        ' AND PDV_CODIGO=:PDV_CODIGO '
    else if DM.Configuracao1.Empresa <> empLBM then
      SQL.Text := 'SELECT SUM(TRC_VALOR) as TotalPedido '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE CNC_CODIGO=:CNC_CODIGO '+
        ' AND PDV_CODIGO=:PDV_CODIGO '+
        ' AND TRC_SITUACAO<>5 '
    else
      SQL.Text := 'SELECT SUM(TRC_VALOR) as TotalPedido '+
        ' FROM TITULO_A_RECEBER '+
        ' WHERE PDV_CODIGO=:PDV_CODIGO '+
        ' AND TRC_SITUACAO<>5 ';
  end;

  if DM.Configuracao1.Empresa = empLBM then
    If DM.Usuario1.Permissoes.IndexOf(IntToStr(4040)) < 0 then
      Usu:=' AND (USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
           ' OR PDV_CODIGO IN (SELECT PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA '+
           ' WHERE FUN_CODIGO IN (SELECT FUN_CODIGO FROM FUNCIONARIO '+
           ' WHERE FUN_USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+'))) ';

  If Tag = 4 then //Nota Fiscal
  Begin
    ckbOrcamentosValidos.Visible := False;
    ckbOrcamentosTodos.Visible := False;
    if fMxNotaFiscal.dblTipoNota.KeyValue = 362 then //DEVOLUÇÃO
      ckbDevolucaoParcial.Visible := True
  end;

  if tag IN [6,7,8] then
  Begin
    ckbOrcamentosValidos.Visible := False;
    ckbOrcamentosTodos.Visible := False;
    ckbDevolucaoParcial.Visible := False;
    if tag = 8 then
    Begin
      ckbMaquina.Visible := False;
      edtMaquina.Visible := False;
    end;
  end
  else If Tag = 11 then //Serviço LBM
  Begin
    if DM.Configuracao1.Empresa = empLBM then
    Begin
      ckbSituacao.Checked := True;
    end;
  end
  else If Tag = 12 then //Pedido Original do Serviço LBM
  Begin
    ckbOrcamentosValidos.Visible := False;
    ckbOrcamentosTodos.Visible := False;
    ckbDevolucaoParcial.Visible := False;
  end
  else If Tag = 13 then //Gerar Servico Automático
  Begin
    ckbOrcamentosValidos.Visible := False;
    ckbOrcamentosTodos.Visible := False;
    ckbDevolucaoParcial.Visible := False;
    //Alan
    //SB_Loc.Enabled := False;
  end
  else If Tag = 14 then //Assistência Técnica
  Begin
    ckbOrcamentosValidos.Visible := False;
    ckbOrcamentosTodos.Visible := False;
    ckbDevolucaoParcial.Visible := False;
  end;

  ckbOrcamentosValidosClick(sender);

  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfMxSPedLoc.Pedido_de_Venda1CalcFields(DataSet: TDataSet);
begin
  //Exibir Total
  if tag IN [2,10,11,12,13,15] then //10 - Serviço
  Begin
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text := 'SELECT SUM(ROUND(IPV_PRECO_DESC,2)*(IPV_QUANTIDADE-IPV_BONIFICACAO)) AS TOTAL '+
        ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
        ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPDV);
      Open;
      Entidade.FieldByName('Total').asString := Format('%.2f',[FieldByName('TOTAL').asFloat])
    end;
  end
  else
  Begin
    with Titulo_receber1 do
    Begin
      Close;
      try
        ParamByName('CNC_CODIGO').asInteger:=self.Entidade.CodigoCNC;
      except
      end;
      ParamByName('PDV_CODIGO').asInteger:=self.Entidade.CodigoPDV;
      Open;
      if FieldByName('TotalPedido').asFloat > 0 then
        self.Entidade.FieldByName('Total').asString := Format('%.2f',[FieldByName('TotalPedido').asFloat])
      else
        self.Entidade.FieldByName('Total').asString := '-';
    end;
  end;

  self.Entidade.FieldByName('Nota').asString:=IntToStr(self.Entidade.NotaFiscal);
  with Cliente1 do
  Begin
    if (self.Entidade.CodigoCNC <> CodigoCNC) or
       (self.Entidade.CodigoCLI <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=self.Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger:=self.Entidade.CodigoCLI;
      Open;
    end;
    self.Entidade.FieldByName('Cliente').asString:=RazaoSocial;
    self.Entidade.FieldByName('Fone').asString:=Fone;
  end;
end;

procedure TfMxSPedLoc.ckbOrcamentosValidosClick(Sender: TObject);
var
  Data, ParamData: string;
begin
  ParamData := '';

  //Comentado pq ja foi implementado a pesquisa dos RX
  {if (Tag = 13) or (ckbSituacao) then
  begin
    Data := UpperCase(InputBox('Data dos Pedidos de Serviço', 'Pedidos de Serviço com data maior que...', '__/__/____'));

    try
      strtodate(Data);
    except
      Data := '01/01/2000';
      Application.MessageBox('Data inválida. Todos os serviços seram mostrados.','Aviso',MB_OK+MB_ICONWARNING);
    end;

    ParamData := ' AND PDV_DT_PEDIDO >="'+MesDia(Data)+'"';
  end;}

  if ckbOrcamentosValidos.Checked then
  Begin
    ckbOrcamentosTodos.Checked := False;
    self.Entidade.Close;
    If Tag IN [2,3,5,9,10,11,15] then
    Begin
      self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+sFiltroSituacao+
        ' AND PDV_SITUACAO<4 '+
        ' AND PDV_EM_USO=0 '+
        ' AND PDV_DIAS_RESERV>0 '+
        ' AND (PDV_DATA_HORA+PDV_DIAS_RESERV)>="'+MesDia(DM.Configuracao1.Data)+'" '+
        ' AND PDV_EM_USO=0 '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);

      //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
      self.Entidade.SQL.Text:='SELECT * '+
        ' FROM PEDIDO_DE_VENDA '+
        ' WHERE PDV_CODIGO<>-1 '+
        self.Entidade.Selecao.Text+
        ' ORDER BY PDV_CODIGO DESC ';
    end;
  end
  else if ckbOrcamentosTodos.Checked then
  Begin
    ckbOrcamentosValidos.Checked := False;
    self.Entidade.Close;
    If Tag IN [2,3,5,9,10,11,15] then
    Begin
      self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+sFiltroSituacao+
        ' AND PDV_SITUACAO<4 '+ 
        ' AND PDV_EM_USO=0 '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_DIAS_RESERV>0 ';

      //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
      self.Entidade.SQL.Text:='SELECT * '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_CODIGO<>-1 '+
          self.Entidade.Selecao.Text+
          ' ORDER BY PDV_CODIGO DESC';
    end;
  end
  else
  Begin
    self.Entidade.Close;
    If Tag IN [2,3,5,9,10,11,15] then
    Begin
      self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+sFiltroSituacao+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND PDV_SITUACAO<4 '+
        ' AND (PDV_DIAS_RESERV=0 OR PDV_DIAS_RESERV IS NULL) '+
        ' AND PDV_EM_USO=0 ';

      //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
      self.Entidade.SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_CODIGO<>-1 '+
          self.Entidade.Selecao.Text+
          ' ORDER BY PDV_CODIGO DESC ';
    end
    Else If Tag=4 then
    Begin
      if fMxNotaFiscal.dblTipoNota.KeyValue = 361 then //VENDA
      Begin
        self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+
          ' AND PDV_SITUACAO=4 '+
          ' AND (PDV_NOTA_FISCAL=0 OR PDV_NOTA_FISCAL IS NULL) '+
          ' AND CLI_CODIGO<>'+IntToStr(DM.Configuracao1.CodigoCliAVista)+
          ' AND PDV_EM_USO=0 ';

        //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
        self.Entidade.SQL.Text:='SELECT * '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_CODIGO<>-1 '+
          ' AND PDV_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
          self.Entidade.Selecao.Text+
          ' ORDER BY PDV_CODIGO DESC ';
      end
      else if fMxNotaFiscal.dblTipoNota.KeyValue = 362 then //DEVOLUÇÃO
      Begin
        self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+
          ' AND PDV_SITUACAO=8 '+
          ' AND (PDV_NOTA_FISCAL>0) '+
          ' AND CLI_CODIGO<>'+IntToStr(DM.Configuracao1.CodigoCliAVista)+
          ' AND PDV_EM_USO=0 ';

        //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
        self.Entidade.SQL.Text:='SELECT * '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_CODIGO<>-1 '+
          ' AND PDV_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
          self.Entidade.Selecao.Text+
          ' ORDER BY PDV_CODIGO DESC ';
      end
      else if fMxNotaFiscal.dblTipoNota.KeyValue = 364 then //SIMPLES REMESSA
      Begin
        self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+
          ' AND PDV_SITUACAO = 4 '+
          ' AND CLI_CODIGO<>'+IntToStr(DM.Configuracao1.CodigoCliAVista)+
          ' AND (PDV_NOTA_FISCAL>0) '+
          ' AND PDV_EM_USO=0 ';

        //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
        self.Entidade.SQL.Text:='SELECT * '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_CODIGO<>-1 '+
          ' AND PDV_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
          self.Entidade.Selecao.Text+
          ' ORDER BY PDV_CODIGO DESC ';
      end
      else if fMxNotaFiscal.dblTipoNota.KeyValue = 363 then //Correção de Dados
      Begin
        self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+
          ' AND PDV_SITUACAO=4 '+
          ' AND CLI_CODIGO<>'+IntToStr(DM.Configuracao1.CodigoCliAVista)+
          ' AND (PDV_NOTA_FISCAL>0) '+
          ' AND PDV_EM_USO=0 ';

        //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
        self.Entidade.SQL.Text:='SELECT * '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_CODIGO<>-1 '+
          ' AND PDV_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
          self.Entidade.Selecao.Text+
          ' ORDER BY PDV_CODIGO DESC ';
      end
      else
      Begin
        self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+
          ' AND PDV_SITUACAO=4 '+
          ' AND CLI_CODIGO<>'+IntToStr(DM.Configuracao1.CodigoCliAVista)+
          ' AND (PDV_NOTA_FISCAL>0) '+
          ' AND PDV_EM_USO=0 ';

        //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
        self.Entidade.SQL.Text:='SELECT * '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_CODIGO<>-1 '+
          ' AND PDV_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
          self.Entidade.Selecao.Text+
          ' ORDER BY PDV_CODIGO DESC ';
      end;
    end
    else If Tag = 8 then // Alterar Parcelas
    Begin
      self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+
        ' AND PDV_SITUACAO=4 '+
        ' AND CLI_CODIGO<>'+IntToStr(DM.Configuracao1.CodigoCliAVista)+
        ' AND PDV_EM_USO=0 ';

      //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
      self.Entidade.SQL.Text:='SELECT * '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_CODIGO<>-1 '+
          ' AND PDV_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
          self.Entidade.Selecao.Text+
          ' ORDER BY PDV_CODIGO DESC ';
    end
    else if Tag = 12 then //Garantia de Serviço ou Reforço de Contrato
    Begin
      self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+sFiltroSituacao+
        ' AND PDV_SITUACAO=4 '+ 
        ' AND (PDV_DIAS_RESERV = 0 OR PDV_DIAS_RESERV IS NULL) '+
        ' AND PDV_EM_USO=0 '+
        ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);

      //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
      self.Entidade.SQL.Text:='SELECT * '+
          ' FROM PEDIDO_DE_VENDA '+
          ' WHERE PDV_CODIGO<>-1 '+
          self.Entidade.Selecao.Text+
          ' ORDER BY PDV_CODIGO DESC';
    end
    else if Tag = 13 then //Gerar Servico Automático
    Begin
      self.Entidade.SQL.Text:='SELECT DISTINCT CNC_CODIGO '+
          ',PDV_CODIGO '+
          ',PDV_DT_ALTERADO '+
          ',PDV_DT_PREVISAO '+
          ',PDV_MAQUINA '+
          ',CNC_CLIENTE '+
          ',CLI_CODIGO '+
          ',USU_CODIGO '+
          ',PDV_DOCUMENTO '+
          ',PDV_SITUACAO '+
          ',PDV_DT_PEDIDO AS PDV_DATA_HORA '+
          ',0.0 AS PDV_TOTAL '+
          ',0 AS PDV_LISTADO '+
          ',0 AS PDV_DIAS_RESERV '+
          ',0 AS AGF_CODIGO '+
          ',0 AS FPG_CODIGO '+
          ',0 AS PDV_TIPO_PAG '+
          ',0.0 AS PDV_ENTRADA '+
          ',0.0 AS PDV_ACRESCIMO '+
          ',0 AS PDV_EM_USO '+
          ',GETDATE() AS PDV_MELHOR_DATA '+
          ',"" AS PDV_VENCIMENTOS '+
          ',0 AS PDV_MEDIA_PAGAMENTO '+
          ',0 AS PDV_NOTA_CUPOM '+
          ',PDV_OBSERVACAO AS PDV_OBS '+
          ',0 AS PDV_IMPRESSO '+
          ',0 AS PDV_NOTA_FISCAL '+
          ',GETDATE() AS PDV_DT_EMISSAO_VENDA '+
          ',GETDATE() AS PDV_DT_DEVOLUCAO '+
          ',"" AS PDV_CONTATO '+
          ',0.0 AS PDV_CREDITO '+
          ',0 AS FUN_ARQUITETO '+
          ',0 AS PDV_TITULO_GERADO '+
          ',0 AS PDV_PACOTE '+
          ',0 AS PDV_TIPO_VENDA '+
          ',0 AS PDV_GRUPO_ESPECIAL '+
          ',GETDATE() AS PDV_DT_ENTREGA '+
          ',"" AS PDV_CAIXA '+
          ',0 AS PDV_SERVICO '+
          ',"" AS PDV_FONE_CONTATO '+
          ',0 AS FPE_CODIGO '+
          ',0 AS CNC_FATURAMENTO_PENDENTE '+
          ',GETDATE() AS PDV_DT_FPE '+
          ',0 AS CNT_CODIGO '+
          ',0 AS PDV_GARANTIA '+
          ',0 AS PDV_CODIGO_ORIGEM '+
          ',0.0 AS PDV_FRETE '+
          ',0.0 AS PDV_ANTECIPADO '+
//          ',* '+
          ' FROM PEDIDO_AUXILIAR '+
          ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+

          //Alan - Comentado pq ja foi implementado a pesquisa do RX.
          //ParamData+

          ' AND PDV_SITUACAO<>1 '+
          sFiltrarServico+
          ' AND PDV_DOCUMENTO NOT IN (SELECT PDV_DOCUMENTO FROM PEDIDO_DE_VENDA) '+
          ' ORDER BY PDV_DT_PEDIDO ASC ';
    end
    else if Tag = 14 then //Assistência Técnica
    Begin
      self.Entidade.Selecao.Text := USU+sFiltrarServico+FiltroMaquina+
        ' AND PDV_SITUACAO=4 '+
        ' AND PDV_EM_USO=0 ';

      //Colocar todos os filtros no Pedido_de_Venda1.Selecao.Text
      self.Entidade.SQL.Text:='SELECT * '+
        ' FROM PEDIDO_DE_VENDA '+
        ' WHERE PDV_CODIGO<>-1 '+
        ' AND PDV_DT_ALTERADO>="'+MesDia(DM.Configuracao1.Data)+'" '+
        self.Entidade.Selecao.Text+
        ' ORDER BY PDV_CODIGO DESC ';
    end
  end;
  self.Entidade.Open;
  edtLocalizar.SetFocus;
end;

procedure TfMxSPedLoc.SB_LocClick(Sender: TObject);
var
  sCodPDV, sCodCLI, sDtCadastro, sDocumento: string;
begin

  if Tag = 13 then
  begin
    sCodPDV := '';
    sCodCLI := '';
    sDtCadastro := '';
    sDocumento := '';

    if edtLocalizar.Text <> '*' then
    begin
      if cmbCampo.ItemIndex = 0 then
      begin
        if VerificaInteiro(edtLocalizar.Text) then
          sCodPDV := ' AND PDV_CODIGO='+edtLocalizar.Text
        else
          Raise exception.Create('Codigo do Pedido de Serviço inválido!');
      end
      else
        if cmbCampo.ItemIndex = 1 then
        begin
          if VerificaInteiro(edtLocalizar.Text) then
            sCodCLI := ' AND CLI_CODIGO='+edtLocalizar.Text
          else
            Raise exception.Create('Codigo do Cliente inválido!');
        end
        else
          if cmbCampo.ItemIndex = 3 then
          begin
            if VerificaDataBranco(edtLocalizar.Text) then
              sDtCadastro := ' AND PDV_DT_PEDIDO>='+MesDia(edtLocalizar.Text)+' AND '+
                ' PDV_DT_PEDIDO<'+MesDia(strtodate(edtLocalizar.Text)+1)
            else
              Raise exception.Create('Data de Cadastro inválido!');
          end
          else
            if cmbCampo.ItemIndex = 8 then
                sDocumento := ' AND PDV_DOCUMENTO LIKE '''+edtLocalizar.Text+'%'''
            else
              Exit;
    end;

    self.Entidade.Close;
    self.Entidade.SQL.Text:='SELECT DISTINCT CNC_CODIGO '+
      ',PDV_CODIGO '+
      ',PDV_DT_ALTERADO '+
      ',PDV_DT_PREVISAO '+
      ',PDV_MAQUINA '+
      ',CNC_CLIENTE '+
      ',CLI_CODIGO '+
      ',USU_CODIGO '+
      ',PDV_DOCUMENTO '+
      ',PDV_SITUACAO '+
      ',PDV_DT_PEDIDO AS PDV_DATA_HORA '+
      ',0.0 AS PDV_TOTAL '+
      ',0 AS PDV_LISTADO '+
      ',0 AS PDV_DIAS_RESERV '+
      ',0 AS AGF_CODIGO '+
      ',0 AS FPG_CODIGO '+
      ',0 AS PDV_TIPO_PAG '+
      ',0.0 AS PDV_ENTRADA '+
      ',0.0 AS PDV_ACRESCIMO '+
      ',0 AS PDV_EM_USO '+
      ',GETDATE() AS PDV_MELHOR_DATA '+
      ',"" AS PDV_VENCIMENTOS '+
      ',0 AS PDV_MEDIA_PAGAMENTO '+
      ',0 AS PDV_NOTA_CUPOM '+
      ',PDV_OBSERVACAO AS PDV_OBS '+
      ',0 AS PDV_IMPRESSO '+
      ',0 AS PDV_NOTA_FISCAL '+
      ',GETDATE() AS PDV_DT_EMISSAO_VENDA '+
      ',GETDATE() AS PDV_DT_DEVOLUCAO '+
      ',"" AS PDV_CONTATO '+
      ',0.0 AS PDV_CREDITO '+
      ',0 AS FUN_ARQUITETO '+
      ',0 AS PDV_TITULO_GERADO '+
      ',0 AS PDV_PACOTE '+
      ',0 AS PDV_TIPO_VENDA '+
      ',0 AS PDV_GRUPO_ESPECIAL '+
      ',GETDATE() AS PDV_DT_ENTREGA '+
      ',"" AS PDV_CAIXA '+
      ',0 AS PDV_SERVICO '+
      ',"" AS PDV_FONE_CONTATO '+
      ',0 AS FPE_CODIGO '+
      ',0 AS CNC_FATURAMENTO_PENDENTE '+
      ',GETDATE() AS PDV_DT_FPE '+
      ',0 AS CNT_CODIGO '+
      ',0 AS PDV_GARANTIA '+
      ',0 AS PDV_CODIGO_ORIGEM '+
      ',0.0 AS PDV_FRETE '+
      ',0.0 AS PDV_ANTECIPADO '+
      ' FROM PEDIDO_AUXILIAR '+
      ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND PDV_SITUACAO<>1 '+sCodPDV+sCodCLI+sDtCadastro+sDocumento+

      //Estava dando conflito quando tinha pedido muito antigo
      //' AND PDV_DOCUMENTO NOT IN (SELECT PDV_DOCUMENTO FROM PEDIDO_DE_VENDA) '+

      ' ORDER BY PDV_DT_PEDIDO ASC ';
    self.Entidade.Open;

    if self.Entidade.IsEmpty then
      Raise exception.Create('Consulta vazia');
  end
  else
  begin

    if not SB_Loc.Enabled then
      Exit;

    if edtMaquina.Focused then
      edtMaquinaExit(sender);

    if (Length(edtLocalizar.Text) = 10) and (edtLocalizar.Text[3] = '/') and (edtLocalizar.Text[6] = '/')  and
       (cmbCampo.ItemIndex < 3) then
      cmbCampo.ItemIndex := 3;
    self.Entidade.Close;

    if cmbCampo.ItemIndex = 6 then //Razão Social
    Begin
      self.Entidade.SQL.Text := 'SELECT * FROM PEDIDO_DE_VENDA '+
        ' WHERE CLI_CODIGO IN '+
        ' (SELECT CLI_CODIGO FROM CLIENTE '+
        ' WHERE CNC_CODIGO=PEDIDO_DE_VENDA.CNC_CLIENTE '+
        ' AND CLI_CODIGO=PEDIDO_DE_VENDA.CLI_CODIGO '+
        ' AND CLI_RZ_SOCIAL LIKE "%'+edtLocalizar.Text+'%") '+
        self.Entidade.Selecao.Text;
      self.Entidade.Open;
    end
    else if cmbCampo.ItemIndex = 7 then //Nome Fantasia
    Begin
      self.Entidade.SQL.Text := 'SELECT * FROM PEDIDO_DE_VENDA '+
        ' WHERE CLI_CODIGO IN '+
        ' (SELECT CLI_CODIGO FROM CLIENTE '+
        ' WHERE CNC_CODIGO=PEDIDO_DE_VENDA.CNC_CLIENTE '+
        ' AND CLI_CODIGO=PEDIDO_DE_VENDA.CLI_CODIGO '+
        ' AND CLI_NOME_FAN LIKE "%'+edtLocalizar.Text+'%") '+
        self.Entidade.Selecao.Text;
      self.Entidade.Open;
    end
    else
      self.Entidade.Selecionar;
  end;
end;

procedure TfMxSPedLoc.ckbDevolucaoParcialClick(Sender: TObject);
begin
  if ckbDevolucaoParcial.Checked then
  Begin
    SB_Loc.Enabled := False;
    self.Entidade.Close;
    Pedido_de_Venda2.Close;
    DSPedido_de_Venda1.DataSet:=Pedido_de_Venda2;
    Pedido_de_Venda2.SQL.Text:='SELECT * '+
      ' FROM PEDIDO_DE_VENDA T1, TROCA T3, CLIENTE C1 '+
      ' WHERE T1.CNC_CODIGO=T3.CNC_CODIGO '+
      ' AND T1.PDV_CODIGO=T3.PDV_CODIGO '+
      sFiltrarServico+
      ' AND (T3.TRO_NOTA_FISCAL=0 OR T3.TRO_NOTA_FISCAL IS NULL) '+
      ' AND T1.PDV_NOTA_FISCAL>0 '+                                  //Somente para pedidos em qe foi emitida a nota
      ' AND T1.CLI_CODIGO=C1.CLI_CODIGO '+
      ' AND T1.CNC_CLIENTE=C1.CNC_CODIGO '+
      ' AND T3.TRO_SITUACAO=1 '+
      ' ORDER BY T3.TRO_DATA DESC ';
    Pedido_de_Venda2.Open;
  end
  else
  Begin
    SB_Loc.Enabled := True;
    Pedido_de_Venda2.Close;
    DSPedido_de_Venda1.DataSet:=self.Entidade;
    ckbOrcamentosValidosClick(sender);
  end;

  edtLocalizar.SetFocus;
end;

procedure TfMxSPedLoc.Pedido_de_Venda2CalcFields(DataSet: TDataSet);
begin
  with DM.QR_Consultas do
  Begin
    Close;
    SQL.Text := 'SELECT ROUND(ITO_VALOR*ITO_QUANTIDADE,2) AS TOTAL '+
      ' FROM ITEM_DE_TROCA '+
      ' WHERE CNC_CODIGO='+IntToStr(Pedido_de_Venda2.CodigoCNC)+
      ' AND TRO_CODIGO='+Pedido_de_Venda2.FieldByName('TRO_CODIGO').asString;
    Open;
    Pedido_de_Venda2.FieldByName('Total').asString:=format('%.2f',[FieldByName('TOTAL').asFloat]);
  end;

  Pedido_de_Venda2.FieldByName('Nota').asString:=IntToStr(Pedido_de_Venda2.NotaFiscal);

  with Cliente1 do
  Begin
    if (Pedido_de_Venda2.CodigoCNC <> CodigoCNC) or
       (Pedido_de_Venda2.CodigoCLI <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger:=Pedido_de_Venda2.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger:=Pedido_de_Venda2.CodigoCLI;
      Open;
    end;
    Pedido_de_Venda2.FieldByName('Cliente').asString:=RazaoSocial;
    Pedido_de_Venda2.FieldByName('Fone').asString:=Fone;
  end;
end;

procedure TfMxSPedLoc.edtMaquinaExit(Sender: TObject);
begin
  if not VerificaInteiroBranco(edtMaquina.Text) then
    edtMaquina.Text := '0'
  else
    FiltroMaquina := ' AND PDV_MAQUINA=:PDV_MAQUINA ';
  ckbOrcamentosValidosClick(sender);
end;

procedure TfMxSPedLoc.ckbMaquinaClick(Sender: TObject);
begin
  edtMaquina.Enabled := ckbMaquina.Checked;
  if ckbMaquina.Checked then
  Begin
    edtMaquina.Color := clWindow;
    edtMaquina.SetFocus;
  end
  else
    edtMaquina.Color := AlteraCorComponentes;
end;

procedure TfMxSPedLoc.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
  try
    DBGrid1.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_SPediLoc_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  if self.Tag IN [4,8,13] then
    ckbSituacao.Enabled := False;
end;

procedure TfMxSPedLoc.DBGrid1DblClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise exception.Create('Selecione o Pedido!');

  if not Entidade.Servico then
    Exit;

  Application.CreateForm(TfMxSituacaoServico, fMxSituacaoServico);

  with fMxSituacaoServico do
  Begin
    //Mostrar os Produtos
    if (DM.Configuracao1.CodigoCNC = 3) then
    begin
      with Item_Pedido_Venda2 do
      begin
        Close;
        ParamByName('PDV_CODIGO').AsInteger := self.Entidade.CodigoPDV;
        ParamByName('CNC_CODIGO').AsInteger := self.Entidade.CodigoCNC;
        Open;
      end;

      Flag := 1;
    end;

    tag := 1;
    Entidade.Close;
    Entidade.SQL.Text := 'SELECT * FROM PEDIDO_DE_VENDA '+
        ' WHERE PDV_CODIGO='+IntToStr(self.Entidade.CodigoPDV)+
        ' AND CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
        ' AND PDV_SITUACAO BETWEEN 0 and 4 '+ //Fora os Entregues
        ' AND PDV_SITUACAO<>1 ';              //Fora os Cancelados
    Entidade.Open;
    Item_Pedido_Venda1.Open;
    if DM.Configuracao1.Empresa = empMotical then //Motical
      edtLocalizar.Text := self.Entidade.Caixa
    else
      edtLocalizar.Text := IntToStr(self.Entidade.CodigoPDV);
    Showmodal;
  end;
end;

procedure TfMxSPedLoc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close
  else if Key=chr(13) then
    bitConfirmarClick(sender);
end;

procedure TfMxSPedLoc.ckbOrcamentosTodosClick(Sender: TObject);
begin
  if ckbOrcamentosTodos.Checked then
    ckbOrcamentosValidos.Checked := False;
  ckbOrcamentosValidosClick(sender);
end;

procedure TfMxSPedLoc.ckbSituacaoClick(Sender: TObject);
begin
  if ckbSituacao.Checked then
  Begin
    cmbTipoSituacao.Enabled := True;
    cmbTipoSituacao.Color := clWindow;
    cmbTipoSituacao.ItemIndex := 0;
    cmbSituacao.Color:=clWindow;
    cmbSituacao.Enabled:=True;
    cmbSituacao.ItemIndex:=0; //Recepção
    cmbSituacaoClick(sender);
    cmbSituacao.SetFocus;
  end
  else
  Begin
    sFiltroSituacao := '';
    cmbTipoSituacao.Enabled := False;
    cmbTipoSituacao.Color := AlteraCorComponentes;
    cmbTipoSituacao.ItemIndex := -1;
    cmbSituacao.Color:=AlteraCorComponentes;
    cmbSituacao.ItemIndex:=-1;
    cmbSituacao.Enabled:=False;
    ckbOrcamentosValidosClick(sender);
  end;
end;

procedure TfMxSPedLoc.cmbSituacaoClick(Sender: TObject);
begin
  if cmbSituacao.Text = '' then
    cmbSituacao.ItemIndex := 0
  else
  Begin
    if cmbTipoSituacao.ItemIndex = 0 then //Igual
    Begin
      case cmbSituacao.ItemIndex of
        0: Begin //Recepção
             sFiltroSituacao:=' AND (PDV_SITUACAO=0) ';
           end;
        1: Begin //Lab/Oficina
             sFiltroSituacao:=' AND (PDV_SITUACAO=2) AND EXISTS '+
                ' (SELECT PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA I10 '+
                ' WHERE I10.CNC_CODIGO=PEDIDO_DE_VENDA.CNC_CODIGO '+
                ' AND I10.PDV_CODIGO=PEDIDO_DE_VENDA.PDV_CODIGO '+
                ' AND I10.IPV_SITUACAO<>3 '+
                ' AND I10.IPV_SERVICO=1)';
           end;
        2: Begin //Qualidade
             sFiltroSituacao:=' AND (PDV_SITUACAO=2) AND NOT EXISTS '+
                ' (SELECT PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA I10 '+
                ' WHERE I10.CNC_CODIGO=PEDIDO_DE_VENDA.CNC_CODIGO '+
                ' AND I10.PDV_CODIGO=PEDIDO_DE_VENDA.PDV_CODIGO '+
                ' AND I10.IPV_SITUACAO<>3 '+
                ' AND I10.IPV_SERVICO=1)';
           end;
        3: Begin //Pronto p/Entrega
             sFiltroSituacao:=' AND (PDV_SITUACAO=3) ';
           end;
      end;
    end
    else //Diferente
    Begin
      case cmbSituacao.ItemIndex of
        0: Begin //Recepção
             sFiltroSituacao:=' AND (PDV_SITUACAO>=0) ';
           end;
        1: Begin //Lab/Oficina
             sFiltroSituacao:=' AND (PDV_SITUACAO=2) AND EXISTS '+
                ' (SELECT PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA I10 '+
                ' WHERE I10.CNC_CODIGO=PEDIDO_DE_VENDA.CNC_CODIGO '+
                ' AND I10.PDV_CODIGO=PEDIDO_DE_VENDA.PDV_CODIGO '+
                ' AND I10.IPV_SITUACAO<>3 '+
                ' AND I10.IPV_SERVICO=1)';
           end;
        2: Begin //Qualidade
             sFiltroSituacao:=' AND PDV_SITUACAO=2 AND EXISTS '+
                ' (SELECT PDV_CODIGO FROM ITEM_DE_PEDIDO_DE_VENDA I10 '+
                ' WHERE I10.CNC_CODIGO=PEDIDO_DE_VENDA.CNC_CODIGO '+
                ' AND I10.PDV_CODIGO=PEDIDO_DE_VENDA.PDV_CODIGO '+
                ' AND I10.IPV_SITUACAO<>3 '+
                ' AND I10.IPV_SERVICO=1)';
           end;
        3: Begin //Pronto p/Entrega
             sFiltroSituacao:=' AND (PDV_SITUACAO<>3) ';
           end;
      end;
    end;
  end;
  ckbOrcamentosValidosClick(sender);
end;

procedure TfMxSPedLoc.DBGrid1TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
