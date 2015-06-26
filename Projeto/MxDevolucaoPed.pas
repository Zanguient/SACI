unit MxDevolucaoPed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery, JPEG,
  Pedido_de_Venda, Item_de_Estoque, Titulo_receber, Cliente,
  Item_Pedido_Venda, Informacoes, Item_de_Embarque, Menus, CentroCusto,
  Direito_de_Bonus, ToolWin, ActnMan, ActnCtrls, ActnMenus, ActnList,
  XPStyleActnCtrls;

type
  TfMxDevPed = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtRazaoSocial: TEdit;
    edtCodigoPDV: TEdit;
    SB_Fechar: TSpeedButton;
    SB_Devolver: TSpeedButton;
    Pedido_de_Venda1: TPedido_de_Venda;
    Item_de_Estoque1: TItem_de_Estoque;
    Label3: TLabel;
    edtMotivoDevolucao: TEdit;
    Cliente1: TCliente;
    Pedido_de_Venda1PDV_CODIGO: TIntegerField;
    Pedido_de_Venda1CNC_CODIGO: TIntegerField;
    Pedido_de_Venda1CLI_CODIGO: TIntegerField;
    Pedido_de_Venda1USU_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda1PDV_TOTAL: TFloatField;
    Pedido_de_Venda1PDV_LISTADO: TIntegerField;
    Pedido_de_Venda1PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda1PDV_DIAS_RESERV: TIntegerField;
    Pedido_de_Venda1Cliente: TStringField;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Informacoes1: TInformacoes;
    Pedido_de_Venda2: TPedido_de_Venda;
    Pedido_de_Venda2PDV_CODIGO: TIntegerField;
    Pedido_de_Venda2CNC_CODIGO: TIntegerField;
    Pedido_de_Venda2CLI_CODIGO: TIntegerField;
    Pedido_de_Venda2USU_CODIGO: TIntegerField;
    Pedido_de_Venda2PDV_DATA_HORA: TDateTimeField;
    Pedido_de_Venda2PDV_TOTAL: TFloatField;
    Pedido_de_Venda2PDV_LISTADO: TIntegerField;
    Pedido_de_Venda2PDV_SITUACAO: TIntegerField;
    Pedido_de_Venda2PDV_DIAS_RESERV: TIntegerField;
    Pedido_de_Venda2PDV_NOTA_FISCAL: TSmallIntField;
    Pedido_de_Venda2CNC_CLIENTE: TIntegerField;
    Pedido_de_Venda2CLI_RZ_SOCIAL: TStringField;
    Pedido_de_Venda2CNC_CODIGO_1: TIntegerField;
    Pedido_de_Venda2CLI_CODIGO_1: TIntegerField;
    Item_de_Embarque1: TItem_de_Embarque;
    SB_Loc: TSpeedButton;
    edtLocalizar: TEdit;
    Label19: TLabel;
    cmbCampo: TComboBox;
    Label20: TLabel;
    Pedido_de_Venda2Total: TStringField;
    edtCodigoCLI: TEdit;
    Label4: TLabel;
    Label30: TLabel;
    Bevel2: TBevel;
    Image1: TImage;
    DSPedido_de_Venda2: TDataSource;
    Pedido_de_Venda2AGF_CODIGO: TIntegerField;
    Pedido_de_Venda2FPG_CODIGO: TIntegerField;
    Pedido_de_Venda2PDV_TIPO_PAG: TIntegerField;
    Pedido_de_Venda2PDV_ENTRADA: TFloatField;
    Pedido_de_Venda2PDV_EM_USO: TIntegerField;
    Pedido_de_Venda2PDV_ACRESCIMO: TFloatField;
    Pedido_de_Venda2PDV_DT_ALTERADO: TDateTimeField;
    Pedido_de_Venda2PDV_MAQUINA: TIntegerField;
    Pedido_de_Venda2PDV_MELHOR_DATA: TDateTimeField;
    Pedido_de_Venda2PDV_VENCIMENTOS: TStringField;
    Pedido_de_Venda2PDV_MEDIA_PAGAMENTO: TIntegerField;
    Pedido_de_Venda2PDV_NOTA_CUPOM: TIntegerField;
    Pedido_de_Venda1PDV_OBS: TStringField;
    Pedido_de_Venda2PDV_OBS: TStringField;
    Pedido_de_Venda1PDV_NOTA_FISCAL: TIntegerField;
    Pedido_de_Venda1Centro: TStringField;
    rdgGerarCredito: TRadioButton;
    rdgGerarExtorno: TRadioButton;
    Pedido_de_Venda2PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda2PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda2PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda2PDV_CONTATO: TStringField;
    Pedido_de_Venda2PDV_CREDITO: TFloatField;
    Pedido_de_Venda1PDV_CREDITO: TFloatField;
    Titulo_receber2: TTitulo_receber;
    CentroCusto2: TCentroCusto;
    Pedido_de_Venda2FUN_ARQUITETO: TIntegerField;
    Pedido_de_Venda2Centro: TStringField;
    Direito_de_Bonus1: TDireito_de_Bonus;
    Titulo_receber1: TTitulo_receber;
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
    Pedido_de_Venda1PDV_IMPRESSO: TIntegerField;
    Pedido_de_Venda1PDV_DT_EMISSAO_VENDA: TDateTimeField;
    Pedido_de_Venda1PDV_DT_DEVOLUCAO: TDateTimeField;
    Pedido_de_Venda1PDV_CONTATO: TStringField;
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
    rdbIgnorar: TRadioButton;
    Pedido_de_Venda2PDV_TITULO_GERADO: TIntegerField;
    Pedido_de_Venda2PDV_TIPO_VENDA: TIntegerField;
    Pedido_de_Venda2PDV_PACOTE: TIntegerField;
    Pedido_de_Venda2PDV_GRUPO_ESPECIAL: TIntegerField;
    Pedido_de_Venda2PDV_DT_PREVISAO: TDateTimeField;
    Pedido_de_Venda2PDV_DT_ENTREGA: TDateTimeField;
    Pedido_de_Venda2PDV_DOCUMENTO: TStringField;
    Pedido_de_Venda2PDV_CAIXA: TStringField;
    Pedido_de_Venda2PDV_SERVICO: TIntegerField;
    Pedido_de_Venda2PDV_FONE_CONTATO: TStringField;
    Pedido_de_Venda2FPE_CODIGO: TIntegerField;
    Pedido_de_Venda2CNC_FATURAMENTO_PENDENTE: TIntegerField;
    Pedido_de_Venda2PDV_DT_FPE: TDateTimeField;
    Pedido_de_Venda1PDV_DT_FPE: TDateTimeField;
    Pedido_de_Venda1CNT_CODIGO: TIntegerField;
    Pedido_de_Venda2CNT_CODIGO: TIntegerField;
    Pedido_de_Venda1PDV_GARANTIA: TIntegerField;
    Pedido_de_Venda1PDV_CODIGO_ORIGEM: TIntegerField;
    Pedido_de_Venda1PDV_FRETE: TFloatField;
    Bevel1: TBevel;
    ActionManager1: TActionManager;
    Devolver1: TAction;
    Localizar1: TAction;
    Fechar1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure SB_DevolverClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_FecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Pedido_de_Venda2AfterScroll(DataSet: TDataSet);
    procedure SB_LocClick(Sender: TObject);
    procedure Pedido_de_Venda2CalcFields(DataSet: TDataSet);
    procedure Image1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure pShow;
  private
    { Private declarations }
  public
    Entidade: TPedido_de_Venda;
    cancelar:Boolean;
  end;

var
  fMxDevPed: TfMxDevPed;

implementation
Uses
 UDM, DigSenha, funcoes, MxFotoAmpliada, UCredito, MxSRecPedido;
{$R *.DFM}


procedure TfMxDevPed.SB_DevolverClick(Sender: TObject);
Var
  Total,Cred,CredUtilizado,vExtorno,vValorPago:Double;
  CdCNCCLI,CdCLI,CdCNC,CdPDV,CaixaCNC,CdAGF,CdCCX, CdGRP, CdSGP, CdTipoDoc, CdTipoPag, CdFUN:integer;
  sTipoCredito, sUsuAutorizado, sAutorizacaoDepoisPrazo: string;
begin
  Total := 0;
  Cred  := 0;
  vExtorno := 0;
  vValorPago := 0;
  CdAGF := 0;
  CdCCX := 0;
  CdTipoDoc := 0;
  CdTipoPag := 0;
  CdCNC := Pedido_de_Venda2.CodigoCNC;
  CdPDV := Pedido_de_Venda2.CodigoPDV;
  CredUtilizado := Pedido_de_Venda2.Credito;
  CdCNCCLI := Pedido_de_Venda2.ClienteCNC;
  CdCLI    := Pedido_de_Venda2.CodigoCLI;
  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  If Pedido_de_Venda2.IsEmpty then
    Raise Exception.Create('Selecione um pedido antes de continuar!');
  if DM.Configuracao1.Empresa = empLBM then
    if Pedido_de_Venda2.NotaFiscal = 0 then
      Raise Exception.Create('Só é permitido efetuar devolução de Venda Faturada!');
  if Pedido_de_Venda2.Situacao <> 4 then
    Raise Exception.Create('Pedido não está como finalizado!');
  if DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto then
    raise Exception.Create('Você não pode inserir vendas neste centro de custo.')
  else if (DM.Configuracao1.Empresa <> empLBM) and
          (Entidade.CodigoCNC <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Você não pode inserir vendas neste centro de custo.');

  If (Pedido_de_Venda2.TipoDeVenda = 1) and //Pendente
     (Pedido_de_Venda2.CodigoFPE = 0) then //Ainda não Faturado
  Begin
    if not rdbIgnorar.Checked then
      Raise Exception.Create('Pedido pendente!'+#13+
                             'Reabrir o Pedido ou devolver ignorando o crédito!');
  end;

  if Length(edtMotivoDevolucao.Text) < 3 then
  Begin
    ShowMessage('Motivo da devolução inválido!');
    try
      edtMotivoDevolucao.SetFocus;
    except
    end;
    exit;
  end;

  If MessageDlg('Atenção!!!'+#13+'Tem certeza que deseja devolver esse Pedido?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  sAutorizacaoDepoisPrazo := '';
  If (DM.Configuracao1.Data-Entidade.DataHora)>DM.Configuracao1.QNT_DIAS_DEV Then
  Begin
    ShowMessage('O prazo para devolução é de '+IntToStr(DM.Configuracao1.QNT_DIAS_DEV)+' dias!');
    if DM.usuario1.Permissoes.IndexOf(IntToStr(8270)) < 0 then
    Begin
      Application.CreateForm(TDigitaSenha, DigitaSenha);
      With DigitaSenha do
      Begin
        DigCdPDVCNC := CdCNC;
        DigCdPDV    := CdPDV;
        DigCdCLICNC := CdCNCCLI;
        DigCdCLI    := CdCLI;
        if rdgGerarCredito.Checked then
          DigiCreditoExtorno := 0
        else if rdgGerarExtorno.Checked then
          DigiCreditoExtorno := 1
        else
          DigiCreditoExtorno := 2;
        DigiTipoPendencia := 0; //Dev. Total
        onClose:=nil;
        Tag:=4;
        Cancelar:=False;
        Showmodal;
        If Cancelar Then
        Begin
          Free;
          Exit;
        End;
        if usuario1.Permissoes.IndexOf(IntToStr(8270)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para devolver o pedido!');
        end
        else
        Begin
          if DigCdPEN > 0 then
            ExecutaSQL(QR_Consultas, 'UPDATE PENDENCIA SET '+
              ' PEN_SITUACAO=3 '+ //Processado
              ',PEN_DT_ALTERADO="'+MesDiaHora(Configuracao1.DataHora)+'" '+
              ',PEN_USU_LIBEROU='+IntToStr(Usuario1.CodigoUSU)+
              ' WHERE CNC_ORIGEM='+IntToStr(DigCNCOrigem)+
              ' AND CNC_CODIGO='+IntToStr(DigCdPENCNC)+
              ' AND PEN_CODIGO='+IntToStr(DigCdPEN));
          sAutorizacaoDepoisPrazo := '(DEPOIS PRAZO AUTORIZADO: '+IntToStr(Usuario1.CodigoUSU)+')';
        end;
        free;
      End;
    End
    else
      sAutorizacaoDepoisPrazo := '(DEPOIS PRAZO)';
  end;

  //Verifica se o usuário que está logado já tem permissão para devolver o pedido
  if DM.usuario1.Permissoes.IndexOf(IntToStr(3110)) < 0 then
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      DigCdPDVCNC := CdCNC;
      DigCdPDV    := CdPDV;
      DigCdCLICNC := CdCNCCLI;
      DigCdCLI    := CdCLI;
      DigiTipoPendencia := 0; //Dev. Total    
      onClose:=nil;
      Tag:=4;
      Cancelar:=False;
      Showmodal;
      If Cancelar Then
      Begin
        Free;
        Exit;
      End;
      if usuario1.Permissoes.IndexOf(IntToStr(3110)) < 0 then
      begin
        free;
        raise Exception.Create('O usuário não tem permissão para devolver o pedido!');
      end
      else
        sUsuAutorizado := 'AUTORIZADO: '+IntToStr(Usuario1.CodigoUSU);
      free;
    End;
  End;

  with Cliente1 do
  Begin
    Close;
    ParamByName('CLI_CODIGO').AsInteger := CdCLI;
    ParamByName('CNC_CODIGO').AsInteger := CdCNCCLI;
    Open;
  end;

  with DM.Caixa1 do
  Begin
    Close;
    ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
    Open;
  end;

  with DM.Database2 do
  begin
    try
      StartTransaction;

      With Item_Pedido_Venda1 do //Está filtrando Vínculo < 0
      Begin
        Close;
        ParamByName('CNC_CODIGO').AsInteger := CdCNC;
        ParamByName('PDV_CODIGO').AsInteger := CdPDV;
        Open;
        First;
        While not eof do
        Begin
          DM.Produto1.Close;
          DM.Produto1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
          DM.Produto1.Open;
          CdGRP := DM.Produto1.CodigoGRP;
          CdSGP := DM.Produto1.CodigoSGP;
          if DM.Configuracao1.Empresa in TEmpresasEstFUN then
            CdFUN := Item_Pedido_Venda1.CodigoFUN
          else
            CdFUN := 0;
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
          Item_de_Estoque1.ParamByName('FUN_CODIGO').AsInteger := CdFUN;
          Item_de_Estoque1.Open;
          If Item_de_Estoque1.isempty Then
          Begin
            ShowMessage('Produto '+IntToStr(CodigoPRD)+' sem Item de Estoque!');
            Raise Exception.Create('');
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
              Begin
                ShowMessage('Falha ao gerar Direito de Bonus!');
                Raise exception.Create('');
              end;
            end;
          end;

          //Se for Eletro sem ser Entrega não gerou movimentação
          if Entrega or (DM.Configuracao1.Empresa <> 1) or (DM.Usuario1.Mafalda = 1) then
          Begin
            //Gerar movimento de estoque comercial
            If not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC,0,CodigoPRD,CdFUN,362,
                   CdCNC,CdPDV,'E', Quantidade,
                   Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                   Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
                   'DEVOLUCAO TOTAL') then
            Begin
              ShowMessage('Falha ao gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;

            //Gerar movimento de estoque LJ3
            if Entidade.NotaFiscal = -1 then
              If not DM.Movimento_Estoque_SN1.Inserir(CdCNC,CodigoPRD,CdFUN,362,
                     CdCNC,CdPDV,'E',
                     Quantidade,Item_de_Estoque1.SSN) then
              Begin
                ShowMessage('Falha ao Gerar Mov. LJ3!');
                Raise Exception.Create('');
              end;

            //Gerar movimento de estoque LJ4
            if Entidade.NotaFiscal = -2 then
              If not DM.Movimento_Estoque_LJ41.Inserir(CdCNC,CodigoPRD,CdFUN,362,
                     CdCNC,CdPDV,'E',
                     Quantidade,Item_de_Estoque1.SLJ4) then
              Begin
                ShowMessage('Falha ao Gerar Mov. LJ4!');
                Raise Exception.Create('');
              end;
          end;

{
          if CdLOT>0 then
          Begin
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
              ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(Quantidade)+
              ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
              ' AND CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND LOT_CODIGO='+IntToStr(CdLOT);
          end;
}

          //Gerar movimento de estoque físico
          If Entrega then
          Begin
            If not DM.Movimento_Fisico1.Inserir(CdCNC,0,CodigoPRD,CdFUN,
                CdCNC,CdPDV,362(*DEVOLUCAO*),'E',
                Quantidade, Item_de_Estoque1.SFisico) then
            Begin
              ShowMessage('Falha ao gerar Mov. Físico!');
              Raise Exception.Create('');
            end;
            if Entidade.NotaFiscal = -1 then
            Begin
              //Aumentar estoque físico , Comercial e LJ3
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ',IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                ',IES_SSN=IES_SSN+'+VirgPonto(Quantidade)+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));
            end
            else if Entidade.NotaFiscal = -2 then
              //Aumentar estoque físico , Comercial e LJ4
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ',IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                ',IES_SLJ4=IES_SLJ4+'+VirgPonto(Quantidade)+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN))
            else
              //Aumentar estoque físico e Comercial
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                ',IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));
          end
          Else if (DM.Configuracao1.Empresa <> empEletro) or (DM.Usuario1.Mafalda = 1) then
          //Cancelar itens de embarque dos que nao forem de entrega imediata
          Begin
            if Entidade.NotaFiscal = -1 then
              //Aumentar somente estoque Comercial
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                ',IES_SSN=IES_SSN+'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN))
            else if Entidade.NotaFiscal = -2 then
              //Aumentar somente estoque Comercial
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                ',IES_SLJ4=IES_SLJ4+'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN))
            else
              //Aumentar somente estoque Comercial
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND FUN_CODIGO='+IntToStr(CdFUN));                

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
              ' IEB_SITUACAO=2 '+
              ' WHERE IEB_CNC_CODIGO_ENT='+IntToStr(CodigoCNC)+
              ' AND IEB_ENT_CODIGO='+IntToStr(CodigoIPV));
          end;

          if Entidade.CodigoPacote > 0 then
            ExecutaSQL(DM.Configuracao1.QueryComandos,'UPDATE ITEM_DE_PACOTE_DE_VENDA SET '+
              ' IPC_QUANTIDADE_ENTREGUE=IPC_QUANTIDADE_ENTREGUE-'+IntToStr(Trunc(Quantidade))+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(Entidade.CodigoPacote)+
              ' AND GRP_CODIGO='+IntToStr(CdGRP)+
              ' AND (SGP_CODIGO_1='+IntToStr(CdSGP)+
              '   OR SGP_CODIGO_2='+IntToStr(CdSGP)+
              '   OR SGP_CODIGO_3='+IntToStr(CdSGP)+
              '   OR SGP_CODIGO_4='+IntToStr(CdSGP)+')');

          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
            ' IPV_SITUACAO=5 '+
            ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND IPV_CODIGO='+IntToStr(CodigoIPV));
          Next;
        End;
        close;

        if (not (DM.Configuracao1.Empresa in [empMotical,empHOPE])) or
           (Pedido_de_Venda2.TipoDeVenda = 0) then //Venda Normal (Faturamento Imediato)
        Begin
          //Cancelar título no contas a receber
          With Titulo_receber1 do
          Begin
            Close;
            ParamByName('CNC_CODIGO').AsInteger := CdCNC;
            ParamByName('PDV_CODIGO').AsInteger := CdPDV;
            ParamByName('TRC_TIPO_PEDIDO').AsInteger := 0;
            Open;
            First;
            if IsEmpty then
              ShowMessage('Pedido sem Títulos abertos ou pagos!');
            While not EOF do
            Begin
              If Situacao IN [0,1] then
              Begin
                //cancelar os titulos
                Total:=Total+Valor;
                ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
                  ' TRC_SITUACAO=5 '+
                  ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ',TRC_OBSERVACAO="Exc. Dev por'+DM.Usuario1.NomeUSU+' Excluir" '+
                  ' WHERE TRC_CODIGO='+IntToStr(CodigoTRC)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC));
              end
              else If Situacao IN [2,3] then
              Begin
                vValorPago := vValorPago + Titulo_receber1.ValorPG+Credcli;
                if CdCCX = 0 then
                Begin
                  CdAGF := CodigoAGF;
                  CdCCX := CodigoCCX;
                  CdTipoDoc := Tipo;
                  CdTipoPag := TipoPag;
                end;

                if not rdbIgnorar.Checked then
                Begin
                  //Gerar movimento de caixa para os que já foram pagos se o cliente for cliente à vista
                  if rdgGerarExtorno.Checked or
                     (Entidade.CodigoCLI = DM.Configuracao1.CodigoCliAVista) then
                  Begin
                    if not DM.Movimento_caixa1.Inserir(CaixaCNC, 0, CodigoCCX,CodigoCCX,DM.Configuracao1.CodigoCAX,
                             TipoPag,Tipo,CodigoCNC,0 (*CdCHQCNC*),0 (*CdCHQ*),
                             'Dev-Ext TRC:'+IntToStr(CodigoTRC),
                             '1' (*Flag*),Numero,'',Sequencia,'D',ValorPG+Credcli,
                             0(*Desconto*),0(*Juros*),
                             0(*CredCli*),Valor(*ValorDoc*),
                             DM.Configuracao1.DataHora,DM.Configuracao1.Data(*Competência*),
                             0(*DtCheque*),CodigoTRC,CodigoCNC,'D') then
                    Begin
                      ShowMessage('Falha ao gerar Mov. Caixa!');
                      Raise Exception.Create('');
                    end
                    else
                    Begin
                      vExtorno := vExtorno + ValorPG+Credcli;
                      if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
                        if TipoPag = 5 then
                          DM.Mensagem3.Inserir(CdCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,1,0,'Movimento de Caixa',
                            'Dev. Total Pedido - Extorno Titulo: '+IntToStr(CodigoTRC)+#13+#10+
                            'Pedido: '+IntToStr(CdPDV)+#13+
                            'Valor: R$ '+format('%.2f',[ValorPG+Credcli])+' (Dinheiro)')
                        else
                          DM.Mensagem3.Inserir(CdCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,1,0,'Movimento de Caixa',
                            'Dev. Total Pedido - Extorno Titulo: '+IntToStr(CodigoTRC)+#13+#10+
                            'Pedido: '+IntToStr(CdPDV)+#13+
                            'Valor: R$ '+format('%.2f',[ValorPG+Credcli])+' (Cheque)');
                    end;
                  end
                  else
                    Cred := Cred + Titulo_receber1.ValorPG+Credcli;
                end;
              End;
              Next;
            End;
            if (Cred > 0) and (Cred > CredUtilizado) then
              //Incluir Credito para o cliente para os que ja foram pagos
              if (DM.Configuracao1.CodigoCliAVista <> CdCLI) then
              Begin
                ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
                  ' CLI_CREDITO=CLI_CREDITO+'+VirgPonto(Cred-CredUtilizado)+
                  ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE CNC_CODIGO='+IntToStr(CdCNCCLI)+
                  ' AND CLI_CODIGO='+IntToStr(CdCLI));
                if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
                    CdCNCCLI, CdCLI, 1002, CdCNC, CdPDV,CdCNC,CdPDV, 'C',
                    Cliente1.Credito (*ValorAnt*), Cred-CredUtilizado(*Valor*)) then
                Begin
                  ShowMessage('Falha ao Gerar Mov. de Crédito!');
                  Raise exception.Create('');
                end;
              end;
          End;
        end
        else if (Pedido_de_Venda2.TipoDeVenda = 3) or
                (Pedido_de_Venda2.CodigoFPE > 0) then
        Begin
          //Gerar Crédito no valor do Pedido para Pré-Pago e Faturamento Pendente já Faturado
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT SUM((IPV_QUANTIDADE-IPV_BONIFICACAO)*ROUND(IPV_PRECO_DESC,2)) AS TOTAL '+
              ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
              ' AND PDV_CODIGO='+IntToStr(CdPDV);
            Open;
            Cred := Cred + FieldByName('TOTAL').asFloat;
          end;
          //Incluir Credito para o cliente no valor do Pedido
          ExecutaSQL(DM.QR_Comandos,'UPDATE CLIENTE SET '+
            ' CLI_CREDITO=CLI_CREDITO+'+VirgPonto(Cred)+
            ',CLI_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNCCLI)+
            ' AND CLI_CODIGO='+IntToStr(CdCLI));
          if not DM.Movimento_de_Credito1.Inserir(DM.Configuracao1.CodigoCNC,
              CdCNCCLI, CdCLI, 1002, CdCNC, CdPDV,CdCNC,CdPDV, 'C',
              Cliente1.Credito (*ValorAnt*), Cred(*Valor*)) then
          Begin
            ShowMessage('Falha ao Gerar Mov. de Crédito!');
            Raise exception.Create('');
          end;
        end;
      End;

      //Devolver pedido
      ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
        ' PDV_SITUACAO=8 '+
        ',USU_CODIGO='+IntToStr(DM.Configuracao1.CodigoUSU)+
        ',PDV_DT_DEVOLUCAO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV));

      //Diminuir o crédito utilizado do cliente
      If (Pedido_de_Venda2.CodigoFPG <> 1) and
         (Pedido_de_Venda2.TipoPag <> 13) and
         (Pedido_de_Venda2.TipoDeVenda <= 1) then //Normal ou Pendente já Faturado
        With Informacoes1 do
          ExecutaSQL(DM.QR_Comandos,'UPDATE INFORMACOES_DE_CREDITO SET '+
            ' ICR_CRED_UTIL=ICR_CRED_UTIL-'+VirgPonto(Total)+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNCCLI)+
            ' AND CLI_CODIGO='+IntToStr(CdCLI));

      if Entidade.TipoDeVenda = 0 then
      Begin
        //Gerar Entrada no Caixa do Credito Gerado por Devolução Parcial
        if (CredUtilizado > 0) and
           ((rdgGerarExtorno.Checked) or
            (Entidade.CodigoCLI = DM.Configuracao1.CodigoCliAVista)) then
        Begin
          if not DM.Movimento_caixa1.Inserir(CaixaCNC, 0, CdCCX, CdCCX,
              DM.Configuracao1.CodigoCAX, CdTipoPag, CdTipoDoc, CdCNC,
              0 (*CdCHQCNC*),0 (*CdCHQ*),
              'Dev-Cred.Gerado Ant.', '1' (*Flag*), IntToStr(CdPDV), '', '', 'C',
              CredUtilizado,0(*Desconto*),0(*Juros*),
              0(*CredCli*),CredUtilizado(*ValorDoc*),
              DM.Configuracao1.DataHora, DM.Configuracao1.Data(*Competência*),
              0(*DtCheque*),0(*CdTit*), 0(*CdCNCTit*), 'D') then
          Begin
            ShowMessage('Falha ao gerar Mov. Caixa!');
            Raise Exception.Create('');
          end
          else
            if (DM.Configuracao1.CodigoUSU <> DM.Caixa1.CodigoFUN) then //Mensagem para Rejane
              if CdTipoPag = 5 then
                DM.Mensagem3.Inserir(CdCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,1,0,'Movimento de Caixa',
                  'Dev. Total Pedido - Compensar Credito Gerado Anteriormento.'+#13+#10+
                  'Pedido: '+IntToStr(CdPDV)+#13+#10+
                  'Valor: R$ '+format('%.2f',[CredUtilizado])+' (Dinheiro)')
              else
                DM.Mensagem3.Inserir(CdCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,1,0,'Movimento de Caixa',
                  'Dev. Total Pedido - Compensar Credito Gerado Anteriormento.'+#13+#10+
                  'Pedido: '+IntToStr(CdPDV)+#13+#10+
                  'Valor: R$ '+format('%.2f',[CredUtilizado])+' (Cheque)');
        end;

        if (vValorPago <= CredUtilizado) and (CredUtilizado > 0) then
        Begin
          if not Titulo_receber2.Active then
            Titulo_receber2.Open;
          //Gerar Título para compensar Credito Gerado em Devolução Parcial
          if not Titulo_receber2.Inserir(CdCNC, 0, CdCLI, CdPDV, CdCCX, CdCCX,
             CdTipoPag, CdTipoDoc, 0(*TRF*), 0(*Reabertura*), DM.Configuracao1.Data,0(*DtPag*),0(*DtOrig*),
             0(*DtVerificado*),'Dev. Total com Crédito Anterior','1.1',IntToStr(CdPDV),
             ''(*CartãoCV*),CredUtilizado-Cred, 0(*ValorPag*), 0(*Credito*), CdAGF, CdCNCCLI,
             0(*Situacao*), 0(*TitAnt*), 0(*TitOrig*), 0(*TipoPedido*),
             False(*MovCaixa*), False(*CHQDev*)) then
          Begin
            ShowMessage('Falha ao gerar TRC!');
            Raise Exception.Create('');
          end;
        end;
      end;

      if rdgGerarCredito.Checked then
        sTipoCredito := ' (Credito)'
      else if rdgGerarCredito.Checked then
        sTipoCredito := ' (Extorno)'
      else
        sTipoCredito := ' (Ignorar)';

      if not Entidade.GeraLog(3110,Entidade.CodigoCNC,Entidade.CodigoPDV,
          Trim(sUsuAutorizado+sAutorizacaoDepoisPrazo+' Máquina: '+IntToStr(DM.Usuario1.Maquina)+sTipoCredito)) then
      Begin
        ShowMessage('Falha ao gerar Log!');
        Raise Exception.Create('');
      end;
      Commit;
    except
      RollBack;
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
      Exit;
    end;
  End;
  try
    if ((Cred > 0) or (vExtorno > 0)) and
       ((Cred > CredUtilizado) or (vExtorno > CredUtilizado)) then
    Begin
      //Imprimir Comprovante de Crédito
      Application.CreateForm(Trpt_Credito,rpt_Credito);
      with rpt_Credito do
      Begin
        Tag:=0;
        Cliente1.Close;
        Cliente1.ParamByName('CNC_CODIGO').asInteger:=CdCNCCLI;
        Cliente1.ParamByName('CLI_CODIGO').asInteger:=CdCLI;
        Cliente1.Open;
        if vExtorno > 0 then
        Begin
          ZRLabel10.Caption:='REFERENTE A DEVOLUCAO TOTAL DO PEDIDO '+IntToStr(CdPDV)+' (EXTORNO)';
          Credi := vExtorno;
        end
        else
        Begin
          ZRLabel10.Caption:='REFERENTE A DEVOLUCAO TOTAL DO PEDIDO '+IntToStr(CdPDV);
          Credi := Cred-CredUtilizado;
        end;
        report.Preview;
      end;

      If MessageDlg('Deseja ver os títulos desse Cliente?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
        with Cliente1 do
        Begin
          Close;
          ParamByName('CLI_CODIGO').AsInteger := CdCLI;
          ParamByName('CNC_CODIGO').AsInteger := CdCNCCLI;
          Open;
        end;
        Application.CreateForm(TfMxSRecPed, fMxSRecPed);
        with fMxSRecPed do
        Begin
          Tag :=10;
          edtCodigoCLI.Text     :=  IntToStr(self.Cliente1.CodigoCLI);
          edtRazaoSocial.Text   :=  self.Cliente1.RazaoSocial;
          mskCNPJ_CPF.Text      :=  self.Cliente1.CPFCGC;
          edtCGF_RG.Text        :=  self.Cliente1.CGFRG;
          edtObservacaoCLI.Text :=  self.Cliente1.OBS;
          Cliente1.Close;
          Cliente1.ParamByName('CNC_CODIGO').AsInteger := self.Entidade.ClienteCNC;
          Cliente1.ParamByName('CLI_CODIGO').AsInteger := self.Entidade.CodigoCLI;
          ShowModal;
        end;
      End;
    end
    else if ((Cred < CredUtilizado) or (vExtorno < CredUtilizado)) then
      ShowMessage('ATENÇÃO!!!'+#13+
                  'Foi gerado um Título para compensar Crédito anterior!')
    else
      ShowMessage('Não foi gerado Crédito/Extorno!');
  except
  end;
  Close;
end;

procedure TfMxDevPed.FormCreate(Sender: TObject);
begin
  Entidade := Pedido_de_Venda1;
  try
    DBGrid1.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_DevTotal_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Item_de_Embarque1.Open;
end;

procedure TfMxDevPed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid1.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_DevTotal_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  try
    Entidade.Close;
  finally
  end;
  Action:=Cafree;
end;

procedure TfMxDevPed.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxDevPed.FormShow(Sender: TObject);
begin
  pShow;
end;

procedure TfMxDevPed.Pedido_de_Venda2AfterScroll(DataSet: TDataSet);
var
  Foto:string;
begin
  Entidade.Close;
  Entidade.ParamByName('PDV_CODIGO').AsInteger:=Pedido_de_Venda2.CodigoPDV;
  Entidade.ParamByName('CNC_CODIGO').AsInteger:=Pedido_de_Venda2.CodigoCNC;
  Entidade.Open;
  if Pedido_de_Venda2.CodigoCLI = DM.Configuracao1.CodigoCliAVista then
  Begin
    rdgGerarExtorno.Checked := True;
    rdgGerarCredito.Enabled := False;
  end;

  edtCodigoPDV.text := IntToStr(Pedido_de_Venda2.CodigoPDV);
  edtCodigoCLI.text := IntToStr(Pedido_de_Venda2.CodigoCLI);
  edtRazaoSocial.text := Pedido_de_Venda2.FieldByName('CLI_RZ_SOCIAL').asString;
  try
    if Pedido_de_Venda2.ClienteCNC < 10 then
      Foto:=DM.Configuracao1.PastaImagens+'\Cliente\0'+IntToStr(Pedido_de_Venda2.ClienteCNC)+
         '-'+IntToStr(Pedido_de_Venda2.CodigoCLI)+'.JPG'
    else
      Foto:=DM.Configuracao1.PastaImagens+'\Cliente\'+IntToStr(Pedido_de_Venda2.ClienteCNC)+
         '-'+IntToStr(Pedido_de_Venda2.CodigoCLI)+'.JPG';
    Image1.Picture.LoadFromFile(foto);
  Except
    try
      Image1.Picture:=nil;
    except
    end;
  end;
end;

procedure TfMxDevPed.SB_LocClick(Sender: TObject);
Var
  Campo,Nome,campoloc :String;
  i :Integer;
begin
  if cmbCampo.ItemIndex IN [0,1] then
    if not VerificaInteiroBranco(edtLocalizar.Text) then
    Begin
      ShowMessage('Código inválido');
      exit;
    end;

  if cmbCampo.ItemIndex IN [3,4] then
    if not VerificaDataBranco(edtLocalizar.Text) then
      Raise exception.Create('Data inválida!');

  If (cmbCampo.Text<>'') and (edtLocalizar.text<>'') Then
  Begin
    campoloc:=trim(cmbCampo.Text);
    for i:= length(campoloc) downto 1 do
      If campoloc[i]=' ' Then
      Begin
        Campo := Copy(campoloc,i+1,length(campoloc)-i);
        Break;
      End;
    Nome:=Trim(edtLocalizar.text);
  End
  else
    Raise Exception.Create('Campo ou valor de localização faltando!');

  //Entidade.Localizar;
  With Pedido_de_Venda2 do
  Begin
    Close;
    //Inteiro do Pedido de Venda
    If (Campo='PDV_CODIGO') or
       (Campo='PDV_PACOTE') or
       (Campo='CLI_CODIGO') then
      SQL.Text:='SELECT DISTINCT T1.*,T2.CLI_RZ_SOCIAL,T2.CNC_CODIGO,T2.CLI_CODIGO '+
                ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
                ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
                ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
                ' AND PDV_SITUACAO IN (4,5) '+
                ' AND T1.'+Campo+'='+edtLocalizar.Text+
                ' ORDER BY T2.CLI_RZ_SOCIAL ASC,T1.PDV_CODIGO DESC'
    //Campo string do Pedido de Venda
    Else if (Campo='PDV_OBS') or
            (Campo='PDV_NOTA_FISCAL') or
            (Campo='PDV_DOCUMENTO') then
      SQL.Text:='SELECT DISTINCT T1.*,T2.CLI_RZ_SOCIAL,T2.CNC_CODIGO,T2.CLI_CODIGO '+
                ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
                ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
                ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
                ' AND PDV_SITUACAO IN (4,5) '+
                ' AND T1.'+Campo+' LIKE "%'+edtLocalizar.Text+'%" '+
                ' ORDER BY T2.CLI_RZ_SOCIAL ASC,T1.PDV_CODIGO DESC'
    Else if Campo='CLI_RZ_SOCIAL' then
      SQL.Text:='SELECT DISTINCT T1.*,T2.CLI_RZ_SOCIAL,T2.CNC_CODIGO,T2.CLI_CODIGO '+
                ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
                ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
                ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
                ' AND PDV_SITUACAO IN (4,5) '+
                ' AND T2.CLI_RZ_SOCIAL LIKE "%'+edtLocalizar.Text+'%" '+
                ' ORDER BY T2.CLI_RZ_SOCIAL ASC,T1.PDV_CODIGO DESC'
    Else if (Campo='PDV_DATA_HORA') or
            (Campo='PDV_DT_ALTERADO') or
            (Campo='PDV_DT_ENTREGA') or
            (Campo='PDV_DT_EMISSAO_VENDA') then
    Begin
      if not VerificaDataBranco(edtLocalizar.Text) then
        Raise exception.Create('Data inválida!');
      SQL.Text:='SELECT DISTINCT T1.*,T2.CLI_RZ_SOCIAL,T2.CNC_CODIGO,T2.CLI_CODIGO '+
                ' FROM PEDIDO_DE_VENDA T1,CLIENTE T2 '+
                ' WHERE T1.CLI_CODIGO=T2.CLI_CODIGO '+
                ' AND T1.CNC_CLIENTE=T2.CNC_CODIGO '+
                ' AND PDV_SITUACAO IN (4,5) '+
                ' AND T1.'+Campo+'>="'+MesDia(edtLocalizar.Text)+'" '+
                ' AND T1.'+Campo+'<"'+MesDia(StrToDate(edtLocalizar.Text)+1)+'" '+
                ' ORDER BY T2.CLI_RZ_SOCIAL ASC,T1.PDV_CODIGO DESC';
    end;
    Open;
  End;
end;

procedure TfMxDevPed.Pedido_de_Venda2CalcFields(DataSet: TDataSet);
begin
  Pedido_de_Venda2.FieldByName('Total').asString:=format('%.2f',[Pedido_de_venda2.FieldByName('PDV_TOTAL').asfloat]);
  //Definir Centro de Custo
  with DM.CentroCusto2 do
  Begin
    if DM.Configuracao1.Empresa <> empLBM then
    Begin
      if Active = False then
        Open;
      if (Pedido_de_Venda2.CodigoCNC > 0) then
      Begin
        if (Pedido_de_Venda2.CodigoCNC <> COdigoCNC) then
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger := Pedido_de_Venda2.CodigoCNC;
          Open;
        end;
        Pedido_de_Venda2.FieldByName('Centro').asString := RazaoSocial;
      end
      else
        Pedido_de_Venda2.FieldByName('Centro').asString := '';
    end
    else //LBM
    Begin
      if Pedido_de_Venda2.CodigoCNC <= 0 then
        Pedido_de_Venda2.FieldByName('Centro').asString := 'ERRO'
      else if Pedido_de_Venda2.CodigoCNC = 1 then
        Pedido_de_Venda2.FieldByName('Centro').asString := 'Matriz'
      else
        Pedido_de_Venda2.FieldByName('Centro').asString := 'Filial'+IntToStr(Pedido_de_Venda2.CodigoCNC);
    end;
  end;
end;

procedure TfMxDevPed.Image1DblClick(Sender: TObject);
begin
  Application.CreateForm(TfMxFotoAmpliada, fMxFotoAmpliada);
  fMxFotoAmpliada.imgFotoAmpliada.Picture:=Image1.Picture;
  fMxFotoAmpliada.ShowModal;
end;

procedure TfMxDevPed.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxDevPed.DBGrid1TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxDevPed.pShow;
begin
  DM.Usuario1.ConfiguraTela(self);
  cmbCampo.ItemIndex:=0;
  try
    if f_Sistema = tsGerenciador then
      edtLocalizar.Setfocus;
  except
  end;
end;

end.
