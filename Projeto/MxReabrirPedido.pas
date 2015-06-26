unit MxReabrirPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,
  Pedido_de_Venda, Cliente, Titulo_receber, Menus, Item_Pedido_Venda,
  Informacoes, Item_de_Estoque, Movimento_Estoque_Comercial,
  Movimento_Fisico, Direito_de_Bonus;

type
  TfMxReabrirPedido = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    bitReabrir: TBitBtn;
    BitBtn2: TBitBtn;
    DSPedido_de_Venda1: TDataSource;
    Pedido_de_Venda1: TPedido_de_Venda;
    DBGrid1: TDBGrid;
    Titulo_receber1: TTitulo_receber;
    Panel2: TPanel;
    SB_Loc: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    MainMenu1: TMainMenu;
    PedidodeVenda1: TMenuItem;
    Localizar1: TMenuItem;
    N1: TMenuItem;
    Confirmar1: TMenuItem;
    Fechar1: TMenuItem;
    Cliente1: TCliente;
    Pedido_de_Venda1Cliente: TStringField;
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
    Pedido_de_Venda1PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda1PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda1PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda1PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda1PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda1PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda1PDV_NOTA_CUPOM: TIntegerField;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Informacoes1: TInformacoes;
    Item_de_Estoque1: TItem_de_Estoque;
    Item_de_Estoque3: TItem_de_Estoque;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda1Centro: TStringField;
    Item_de_Estoque2: TItem_de_Estoque;
    Direito_de_Bonus1: TDireito_de_Bonus;
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
    Pedido_de_Venda1PDV_SERVICO: TIntegerField;
    Pedido_de_Venda1PDV_FONE_CONTATO: TStringField;
    Pedido_de_Venda1FPE_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Pedido_de_Venda1PDV_DT_FPE: TDateTimeField;
    Pedido_de_Venda1CNT_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_GARANTIA: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO_ORIGEM: TIntegerField;
    Pedido_de_Venda1PDV_FRETE: TFloatField;
    Pedido_de_Venda1CSG_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_PAF: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure bitReabrirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Pedido_de_Venda1CalcFields(DataSet: TDataSet);
    procedure SB_LocClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    USU:string;
    Entidade : TPedido_de_Venda;
  end;

var
  fMxReabrirPedido: TfMxReabrirPedido;

implementation
uses UDM, Funcoes;

{$R *.DFM}

procedure TfMxReabrirPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=False;
  Titulo_receber1.Active:=False;
  Action:=Cafree;
end;

procedure TfMxReabrirPedido.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxReabrirPedido.bitReabrirClick(Sender: TObject);
var
  Trans : Boolean;
  CdPDVCNC, CdPDV, CdFUN, CdCLICNC, CdCLI, CdGRP, CdSGP, CentroLocal, CentroExterno,
    iTipoVenda, iDiasReserva, CdLOT : integer;
  sCNC: string;
begin
  If Entidade.IsEmpty Then
  Begin
    ShowMessage('Escolha um pedido antes de continuar!');
    Exit;
  end;

  if Entidade.FieldByName('PDV_PAF').AsString = 'S' then
    Raise exception.Create('Não é possível reabrir Pedido de venda com Cupom Fiscal(PAF) Emitido!');

  if Entidade.NotaFiscal <> 0 then
    Raise exception.Create('Não é possível reabrir Pedido de venda com Nota Emitida!');

  if Entidade.Situacao <> 4 then
    Raise exception.Create('Pedido não está na situação de finalizado!');


  CdPDVCNC   := Entidade.CodigoCNC;
  CdPDV      := Entidade.CodigoPDV;
  CdCLICNC   := Entidade.ClienteCNC;
  CdCLI      := Entidade.CodigoCLI;
  iTipoVenda := Entidade.TipoDeVenda;

  if DM.Configuracao1.Empresa  = empLBM then
  Begin
    if Entidade.CodigoCNC = 1 then
    Begin
      CentroLocal := 1;
      CentroExterno := 2;
    end
    else if Entidade.CodigoCNC = 3 then
    Begin
      CentroLocal := 3;
      CentroExterno := 3;
    end
    else
    Begin
      CentroLocal := 2;
      CentroExterno := 1;
    end
  end
  else
  Begin
    if DM.Configuracao1.CodigoCNC <> Entidade.CodigoCNC then
      Raise exception.Create('Não pode reabrir Pedido desse Centro de Custo!');
    CentroLocal   := Entidade.CodigoCNC;
    CentroExterno := Entidade.CodigoCNC;
  end;

  if (DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode Reabrir esse Pedido neste centro de custo.');
  If MessageDlg('Atenção!!!'+#13+'Esse processo irá cancelar os título e reabrir o Pedido.'+#13+'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  if Entidade.CodigoFPE > 0 then
    Raise Exception.Create('Pedido Faturamento pendente não pode ser reaberto!');

  if DM.Configuracao1.Empresa <> empLBM then
    sCNC := ' AND CNC_CODIGO='+IntToStr(CdPDVCNC);

  with Titulo_receber1 do
  Begin
    Close;
    SQL.Text := 'SELECT TRC_CODIGO '+
      ' FROM TITULO_A_RECEBER '+
      ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
      sCNC+
      ' AND TRC_SITUACAO <> 0 '+
      ' AND TRC_SITUACAO <> 5 '+
      ' AND TRC_TIPO_PEDIDO=0 '; //Pedido de Venda
    Open;
    if not IsEmpty then
      Raise Exception.Create('Pedido com Título(s) pago(s)!'+#13+'Não pode ser Reaberto!');
  end;

  Item_Pedido_Venda1.Close;
  Item_Pedido_Venda1.ParamByName('CNC_CODIGO').asInteger := CdPDVCNC;
  Item_Pedido_Venda1.ParamByName('PDV_CODIGO').asInteger := CdPDV;
  Item_Pedido_Venda1.Open;

  Informacoes1.Close;
  Informacoes1.ParamByName('CNC_CODIGO').asInteger := CdCLICNC;
  Informacoes1.ParamByName('CLI_CODIGO').asInteger := CdCLI;
  Informacoes1.Open;

  if not bitReabrir.Enabled then
    Exit;

  bitReabrir.Enabled := False;

  Trans:=false;
  try
    If DM.Configuracao1.ControleTransacao then
    Begin
      DM.Database2.StartTransaction;
      Trans:=True;
    end;

    if (Entidade.TipoDeVenda = 0) or (Entidade.TipoDeVenda = 10) then //Venda Normal - Faturamento Imediato ou ServiçoLBM
    Begin
      ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
         ' TRC_SITUACAO=5 '+
         ',TRC_OBSERVACAO="Exc.P/'+DM.Usuario1.NomeUSU+' Reabrir Pedido" '+
         ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
         ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
         sCNC+
         ' AND TRC_TIPO_PEDIDO=0 '); //Pedido_de_venda ou ServiçoLBM
      DM.Usuario1.GeraLog(4520, CdPDVCNC,CdPDV,'Reabrir Pedido');
    end;

    With Item_Pedido_Venda1 do //Filtrando Vínvulo >= 0
    Begin
      first;
      While not eof do
      Begin
        CdLOT := CodigoLOT;
        DM.Produto1.Close;
        DM.Produto1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
        DM.Produto1.Open;
        CdGRP := DM.Produto1.CodigoGRP;
        CdSGP := DM.Produto1.CodigoSGP;
        if DM.Configuracao1.Empresa in TEmpresasEstFUN then
          CdFUN := CodigoFUN
        else
          CdFUN := 0;
        Item_de_Estoque1.Close;
        Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CentroLocal;
        Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
        Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
        Item_de_Estoque1.open;
        If Item_de_Estoque1.isempty then
        begin
          Item_de_Estoque1.Inserir(CentroLocal,CodigoPRD,CdFUN,0,0,0,0,0,
            DM.Configuracao1.DataHora,0,0,0,0,0,0);
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CentroLocal;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
          Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
          Item_de_Estoque1.open;
        end;

        Item_de_Estoque2.Close;
        Item_de_Estoque2.ParamByName('CNC_CODIGO').AsInteger := CentroExterno;
        Item_de_Estoque2.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
        Item_de_Estoque2.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
        Item_de_Estoque2.open;
        If Item_de_Estoque2.isempty then
        begin
          Item_de_Estoque2.Inserir(CentroExterno,CodigoPRD,CdFUN,0,0,0,0,0,
            DM.Configuracao1.DataHora,0,0,0,0,0,0);
          Item_de_Estoque2.Close;
          Item_de_Estoque2.ParamByName('CNC_CODIGO').AsInteger := CentroExterno;
          Item_de_Estoque2.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
          Item_de_Estoque2.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
          Item_de_Estoque2.open;
        end;

        with Direito_de_Bonus1 do
        Begin
          Close;
          SQL.Text := 'SELECT * FROM DIREITO_DE_BONUS '+
            ' WHERE PDV_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPDV)+
            ' AND PRD_CODIGO='+IntToStr(Item_Pedido_Venda1.CodigoPRD)+
            ' ORDER BY DIB_CODIGO DESC ';
          Open;

          if not isEmpty then
          Begin
            if not Direito_de_Bonus1.Inserir(CodigoPDV, CodigoPRD, CodigoFUN,
                BonusFOR, BonusLoja, Quantidade, -QuantidadeBonus, Preco, 'Pedido Reaberto') then
              Raise exception.Create('');
          end;
        end;

        if DM.Configuracao1.Empresa = empLBM then
        Begin
          //Gerar Movimento Local
          if (EstoqueLocal > 0) then
          Begin
            If not DM.Movimento_Estoque_Comercial1.Inserir(CentroLocal, 0, CodigoPRD,CdFUN,374,
                   CodigoCNC, CodigoPDV, 'E', EstoqueLocal,
                   Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                   Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
                   'REABRIR PEDIDO') Then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;

            if CdLOT>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(EstoqueLocal)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CentroLocal)+
                ' AND LOT_CODIGO='+IntToStr(CdLOT));
            end;

            if Entrega then
            Begin
              //Gerar movimento de estoque físico
              If not DM.Movimento_Fisico1.Inserir(CentroLocal, 0, CodigoPRD,CdFUN,
                  CodigoCNC, CodigoPDV, 374(*Reabertura*), 'E',
                  EstoqueLocal, Item_de_Estoque1.SFisico) then
              Begin
                ShowMessage('Falha ao Gerar Mov. Físico!');
                Raise Exception.Create('');
              end;

              //Atualizar estoque comercial e Fisico
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(EstoqueLocal)+
                ',IES_SFISICO=IES_SFISICO+'+VirgPonto(EstoqueLocal)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CentroLocal)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));
            end
            else //Sem entrega Imediata
            Begin
              //Atualizar somente estoque comercial
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(EstoqueLocal)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CentroLocal)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));

              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
                ' IEB_SITUACAO=2 '+
                ' WHERE IEB_CNC_CODIGO_ENT='+IntToStr(CentroLocal)+
                ' AND IEB_ENT_CODIGO='+IntToStr(CodigoIPV));
            end;
          end;

          //Gerar Movimento Externo
          if EstoqueExterno > 0 then
          Begin
            If not DM.Movimento_Estoque_Comercial1.Inserir(CentroExterno, 0, CodigoPRD,CdFUN,374,
                   CodigoCNC, CodigoPDV, 'E', EstoqueExterno,
                   Item_de_Estoque2.SComercial,Item_de_Estoque2.SReservado,Item_de_Estoque2.Indisponivel,
                   Item_de_Estoque2.SAmostra, 0(*Amostra*), Item_de_Estoque2.SBonificacao, 0(*Bonus*),
                   'REABRIR PEDIDO') Then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;

            if CdLOT>0 then
            Begin
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(EstoqueExterno)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CentroExterno)+
                ' AND LOT_CODIGO='+IntToStr(CdLOT));
            end;

            if Entrega then
            Begin
              //Gerar movimento de estoque físico
              If not DM.Movimento_Fisico1.Inserir(CentroExterno, 0, CodigoPRD,CdFUN,
                  CodigoCNC, CodigoPDV,374(*Reabertura*), 'E',
                  EstoqueExterno,Item_de_Estoque2.SFisico) then
              Begin
                ShowMessage('Falha ao Gerar Mov. Físico!');
                Raise Exception.Create('');
              end;

              //Atualizar estoque comercial e Fisico
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(EstoqueExterno)+
                ',IES_SFISICO=IES_SFISICO+'+VirgPonto(EstoqueExterno)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CentroExterno)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));
            end
            else
            Begin
              //Atualizar somente estoque comercial
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(EstoqueExterno)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CentroExterno)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));

              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
                ' IEB_SITUACAO=2 '+
                ' WHERE IEB_CNC_CODIGO_ENT='+IntToStr(CentroExterno)+
                ' AND IEB_ENT_CODIGO='+IntToStr(CodigoIPV));
            end;
          end;
        end
        else //Diferente de LBM
        Begin
          if Entrega or
             (DM.Usuario1.Mafalda = 1) or
             (DM.Configuracao1.Empresa <> 1) then
          Begin
            //Gerar Movimento
            If not DM.Movimento_Estoque_Comercial1.Inserir(CentroLocal, 0, CodigoPRD,CdFUN,374,
                   CodigoCNC, CodigoPDV, 'E', Quantidade,
                   Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                   Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
                   'REABRIR PEDIDO') Then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;
          end;

          if CdLOT>0 then
          Begin
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
              ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(Quantidade)+
              ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(CentroLocal)+
              ' AND LOT_CODIGO='+IntToStr(CdLOT));
          end;

          if Entrega then
          Begin
            //Gerar movimento de estoque físico
            If not DM.Movimento_Fisico1.Inserir(CentroLocal, 0, CodigoPRD,CdFUN,
                CodigoCNC, CodigoPDV, 374(*Reabertura*), 'E',
                Quantidade, Item_de_Estoque1.SFisico) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Físico!');
              Raise Exception.Create('');
            end;

            //Atualizar estoque comercial e Fisico
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
              ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(CentroLocal)+
              ' AND FUN_CODIGO='+IntToStr(CdFUN));
          end
          //Sem entrega Imediata
          else if (DM.Usuario1.Mafalda = 1) or
                  (DM.Configuracao1.Empresa <> 1) then
          Begin
            //Atualizar somente estoque comercial
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(CentroLocal)+
              ' AND FUN_CODIGO='+IntToStr(CdFUN));

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
              ' IEB_SITUACAO=2 '+
              ' WHERE IEB_CNC_CODIGO_ENT='+IntToStr(CentroLocal)+
              ' AND IEB_ENT_CODIGO='+IntToStr(CodigoIPV));
          end;

          if Entidade.CodigoPacote > 0 then
            ExecutaSQL(DM.Configuracao1.QueryComandos,'UPDATE ITEM_DE_PACOTE_DE_VENDA SET '+
              ' IPC_QUANTIDADE_ENTREGUE=IPC_QUANTIDADE_ENTREGUE-'+IntToStr(Trunc(Quantidade))+
              ' WHERE CNC_CODIGO='+IntToStr(Entidade.CodigoCNC)+
              ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPacote)+
              ' AND GRP_CODIGO='+IntToStr(CdGRP)+
              ' AND (SGP_CODIGO_1='+IntToStr(CdSGP)+
              '   OR SGP_CODIGO_2='+IntToStr(CdSGP)+
              '   OR SGP_CODIGO_3='+IntToStr(CdSGP)+
              '   OR SGP_CODIGO_4='+IntToStr(CdSGP)+')');
        end;
        //Item de pedido fica aberto
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
           ' IPV_SITUACAO=0 '+
           ',IEB_CODIGO=0 '+
           ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
           ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
           ' AND IPV_CODIGO='+IntToStr(CodigoIPV));

        //Devolvendo as quantidades para a consignação
        if Pedido_de_Venda1.FieldByName('CSG_CODIGO').AsInteger > 0 then
        begin
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_CONSIGNACAO SET '+
             ' ICS_QUANTIDADE=ICS_QUANTIDADE + '+VirgPonto(Quantidade)+
             ' WHERE CSG_CODIGO=''' + Pedido_de_Venda1.FieldByName('CSG_CODIGO').AsString + ''' '+
             ' AND PRD_CODIGO='+IntToStr(CodigoPRD));
        end;

        Next;
      end;
    end;

    if (DM.Configuracao1.Empresa = 1) and
       (DM.Configuracao1.CodigoCNC = 3) and
       (iTipoVenda = 10) then //Não é Pedido de Venda
      iDiasReserva := 0
    else
      iDiasReserva := 1;

    //Pedido vira Orçamento Aberto
    ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
      ' PDV_SITUACAO=3 '+
      //',CSG_CODIGO=-2 '+ //campo para indicar que o pedido foi reaberto
      ',PDV_LISTADO=0 '+
      ',PDV_MAQUINA='+IntToStr(DM.CentroCusto1.Maquina)+
      ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
      ',PDV_DIAS_RESERV='+IntToStr(iDiasReserva)+
      ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
      ' AND PDV_CODIGO='+IntToStr(CdPDV));

    with Cliente1 do
    Begin
      //Diminui o crédito utilizado do cliente
      if (Entidade.TipoPag <> 13) and  //Diferente de Cartão
         (Entidade.CodigoFPG <> 1) and //Diferente de à vista
         (Entidade.TipoDeVenda <= 1)  then
        ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
          ' ICR_CRED_UTIL='+VirgPonto(Informacoes1.CreditoUtil-Entidade.Total-Entidade.Acrescimo)+
          ' WHERE CNC_CODIGO='+IntToStr(CdCLICNC)+
          ' AND CLI_CODIGO='+IntToStr(CdCLI));
    end;

    if Entidade.TipoDeVenda = 3 then //Pré-Pago
    Begin
      ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
        ' CLI_CREDITO=CLI_CREDITO+'+VirgPonto(Entidade.Total-Entidade.Acrescimo)+
        ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCLICNC)+
        ' AND CLI_CODIGO='+IntToStr(CdCLI));
      if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
          CdCLICNC, CdCLI, 1005 (*Reabrir*), CdPDVCNC, CdPDV,CdPDVCNC,CdPDV, 'C',
          Cliente1.Credito (*ValorAnt*), Entidade.Total-Entidade.Acrescimo(*Valor*)) then
      Begin
        ShowMessage('Falha ao Gerar Mov. de Crédito!');
        Raise exception.Create('');
      end;
    end;

    Entidade.GeraLog(6030, Entidade.CodigoCNC, Entidade.CodigoPDV);

    If DM.Configuracao1.ControleTransacao then
      DM.Database2.Commit;
    Trans := False;

    Entidade.Close;
    Entidade.Open;

    ShowMessage('Pedido Reaberto!');
  except
    ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
    If DM.Configuracao1.ControleTransacao then
      if trans then
        DM.Database2.RollBack;
  end;
  bitReabrir.Enabled := True;
end;

procedure TfMxReabrirPedido.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  Entidade.Close;
  Entidade.SQL.Text:='SELECT * FROM PEDIDO_DE_VENDA '+
      ' WHERE PDV_SITUACAO = 4 '+
      ' AND PDV_DATA_HORA>="'+MesDia(DM.Configuracao1.Data)+'" '+
      ' AND PDV_DATA_HORA<"'+MesDia(DM.Configuracao1.Data+1)+'" '+
      ' AND PDV_EM_USO=0 '+
      ' AND (PDV_NOTA_FISCAL=0 OR PDV_NOTA_FISCAL IS NULL) '+
      ' ORDER BY PDV_CODIGO ';
  Entidade.Open;
  ComboBox2.ItemIndex := 0;
  Edit11.SetFocus;
end;

procedure TfMxReabrirPedido.Pedido_de_Venda1CalcFields(DataSet: TDataSet);
begin
  with Cliente1 do
  Begin
    if (Entidade.ClienteCNC <> CodigoCNC) or
       (Entidade.CodigoCLI <> CodigoCLI) then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Entidade.ClienteCNC;
      ParamByName('CLI_CODIGO').asInteger := Entidade.CodigoCLI;
      Open;
    end;
    Entidade.FieldByName('Cliente').asString := '('+PreencheZero(2,CodigoCNC)+'-'+IntToStr(CodigoCLI)+') '+RazaoSocial;
  end;

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
end;

procedure TfMxReabrirPedido.SB_LocClick(Sender: TObject);
begin
  Entidade.Selecionar;
end;

procedure TfMxReabrirPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxReabrirPedido.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
end;

end.
