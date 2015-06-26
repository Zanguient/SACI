unit MxPreRecebimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls,
  Grids, DBGrids, ExtCtrls, DBCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  CheckLst, Item_Recebimento, Recebimento, Item_Pre_Recebimento,
  Pre_Recebimento, CentroCusto, Item_de_Estoque, Produto,
  Item_de_Estoque_Detalhe, math, StrUtils;

type
  TfMxPreRecebim = class(TForm)
    Panel3: TPanel;
    Panel5: TPanel;
    SB_Fechar: TSpeedButton;
    Panel6: TPanel;
    Label14: TLabel;
    Produto1: TProduto;
    SB_Confirmar: TSpeedButton;
    Item_de_Estoque1: TItem_de_Estoque;
    Panel1: TPanel;
    Label20: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    edtCodigoPRC: TEdit;
    Label2: TLabel;
    edtNumeroDocumento: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    mskDataEntrada: TMaskEdit;
    mskDataEmissao: TMaskEdit;
    edtCodigoFOR: TEdit;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    cmbTipo: TComboBox;
    dblCNCOrigem: TDBLookupComboBox;
    Label9: TLabel;
    edtCodigoOrigem: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    CentroCusto1: TCentroCusto;
    DSCentroCusto1: TDataSource;
    SB_Etiquetas: TSpeedButton;
    Etiquetas1: TProduto;
    edtSituacao: TEdit;
    Label12: TLabel;
    Pre_Recebimento1: TPre_Recebimento;
    Item_Pre_Recebimento1: TItem_Pre_Recebimento;
    DSPre_Recebimento: TDataSource;
    DSItem_Pre_Recebimento: TDataSource;
    Item_Pre_Recebimento1IPR_CODIGO: TIntegerField;
    Item_Pre_Recebimento1CNC_CODIGO: TIntegerField;
    Item_Pre_Recebimento1PRD_CODIGO: TIntegerField;
    Item_Pre_Recebimento1PRC_CODIGO: TIntegerField;
    Item_Pre_Recebimento1IPR_QUANTIDADE: TFloatField;
    Item_Pre_Recebimento1IPR_SITUACAO: TIntegerField;
    Recebimento1: TRecebimento;
    Item_Recebimento1: TItem_Recebimento;
    DSRecebimento: TDataSource;
    SB_Imprimir: TSpeedButton;
    Recebimento2: TRecebimento;
    Pre_Recebimento1PRC_CODIGO: TIntegerField;
    Pre_Recebimento1CNC_CODIGO: TIntegerField;
    Pre_Recebimento1PRC_DATA: TDateTimeField;
    Pre_Recebimento1FOR_CODIGO: TIntegerField;
    Pre_Recebimento1PRC_SITUACAO: TIntegerField;
    Pre_Recebimento1PRC_TOT_ITEM: TIntegerField;
    Pre_Recebimento1PRC_TIPO: TIntegerField;
    Pre_Recebimento1PRC_CNC_ORIGEM: TIntegerField;
    Pre_Recebimento1PRC_COD_ORIGEM: TIntegerField;
    Pre_Recebimento1PRC_DATA_SAIDA: TDateTimeField;
    Pre_Recebimento1PRC_DATA_EMISSAO: TDateTimeField;
    Pre_Recebimento1PRC_NUM_DOC: TStringField;
    Pre_Recebimento1Tipo: TStringField;
    Label16: TLabel;
    edtObservacao: TEdit;
    Pre_Recebimento1PRC_OBSERVACAO: TStringField;
    Item_Pre_Recebimento1Produto: TStringField;
    Item_Pre_Recebimento1Marca: TStringField;
    Item_Pre_Recebimento1Referencia: TStringField;
    Panel4: TPanel;
    CheckListBox1: TCheckListBox;
    edtNotaFiscal: TEdit;
    Label6: TLabel;
    Pre_Recebimento1PRC_NOTA_FISCAL: TIntegerField;
    SB_Pendencia: TSpeedButton;
    SB_Cancelar: TSpeedButton;
    SB_Verificar: TSpeedButton;
    Item_de_Estoque_Detalhe1: TItem_de_Estoque_Detalhe;
    Item_Pre_Recebimento1Lote: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SB_FecharClick(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_EtiquetasClick(Sender: TObject);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure SB_ImprimirClick(Sender: TObject);
    procedure Pre_Recebimento1CalcFields(DataSet: TDataSet);
    procedure Item_Pre_Recebimento1CalcFields(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Pre_Recebimento1AfterOpen(DataSet: TDataSet);
    procedure Item_Pre_Recebimento1AfterOpen(DataSet: TDataSet);
    procedure Pre_Recebimento1AfterScroll(DataSet: TDataSet);
    procedure SB_CancelarClick(Sender: TObject);
    procedure SB_PendenciaClick(Sender: TObject);
    procedure SB_VerificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TItem_Pre_Recebimento;
    ValorAnt:Double;
    FORNECEDORINV:string;
    vPendentes:Boolean;
  end;

var
  fMxPreRecebim: TfMxPreRecebim;

implementation
Uses
  UDM, MxSPediProd, MxSCotaFor, funcoes,
  Urpt_PreReceb, UPrinc2, MxVerificarMercadoria;
{$R *.DFM}

procedure TfMxPreRecebim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM.Configuracao1.Empresa = 1 then
  Begin
    //Verificar Pendência de Pre Recebimento
    with DM.QR_Consultas do
    Begin
      Close;
      SQL.Text:='SELECT TOP 1 P1.PRC_DATA '+
        ' FROM PRE_RECEBIMENTO P1, ITEM_DE_PRE_RECEBIMENTO I1 '+
        ' WHERE P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
        ' AND P1.PRC_SITUACAO<>1 '+
        ' AND NOT EXISTS (SELECT R1.PRC_CODIGO '+
        ' FROM RECEBIMENTO R1 '+
        ' WHERE R1.CNC_CODIGO=P1.CNC_CODIGO '+
        ' AND R1.REC_COD_ORIGEM=P1.PRC_COD_ORIGEM '+
        ' AND R1.REC_CNC_ORIGEM=P1.PRC_CNC_ORIGEM '+
        ' AND R1.REC_TIPO=P1.PRC_TIPO) '+
        ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
        ' AND P1.PRC_CODIGO=I1.PRC_CODIGO ';
      Open;
      if IsEmpty then
      Begin
        //SACI.Compras1.Enabled := True;
        //SIAC.Vendas1.Enabled := True;
        //SACI.Servio1.Enabled := True;
        //SIAC.Caixa1.Enabled := True;
        //SACI.Cobrana2.Enabled := True;
        //SIAC.Financeiro1.Enabled := True;
      end
      else
      Begin
        SB_PendenciaClick(sender);
        If MessageDlg('Atenção!!!'+#13+
                      'Ainda existe(m) pendência(s).'+#13+
                      'Deseja sair dos pre-recebimentos?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Begin
          Action := caNone;
          Exit;
        end;
      end;
    end;
  end;
  Action:=Cafree;
end;

procedure TfMxPreRecebim.FormCreate(Sender: TObject);
begin
  vPendentes := False;
  CentroCusto1.Open;
end;

procedure TfMxPreRecebim.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxPreRecebim.DateTimePicker1Change(Sender: TObject);
begin
  SB_Prim.Enabled := True;
  SB_Ant.Enabled := True;
  SB_Prox.Enabled := True;
  SB_Ult.Enabled := True;
  
  CheckListBox1.Clear;
  Pre_Recebimento1.Close;
  Pre_Recebimento1.SQL.Text:='SELECT P1.* '+
    ' FROM PRE_RECEBIMENTO P1 '+
    ' WHERE P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
    ' AND P1.PRC_DATA>="'+MesDia(Trunc(DateTimePicker1.Date))+'" '+
    ' AND P1.PRC_DATA<"'+MesDia(Trunc(DateTimePicker1.Date)+1)+'" '+
    ' AND EXISTS (SELECT PRC_CODIGO FROM ITEM_DE_PRE_RECEBIMENTO I1 '+
    '  WHERE P1.CNC_CODIGO=I1.CNC_CODIGO '+
    '  AND P1.PRC_CODIGO=I1.PRC_CODIGO) '+
    ' ORDER BY P1.PRC_CODIGO DESC';
  Pre_Recebimento1.Open;
end;

procedure TfMxPreRecebim.SB_ConfirmarClick(Sender: TObject);
Var
  i, CdPRC, CodigoOri, cTipoMov: Integer;
  Trans : Boolean;
begin
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) and
     (DM.Configuracao1.Empresa <> empLBM) then
    raise Exception.Create('Você não pode alterar recebimentos neste centro de custo!');
  if Pre_Recebimento1.IsEmpty then
    raise Exception.create('Selecione o Pré Recebimento!');
  if Pre_Recebimento1.Situacao = 1 then
    raise Exception.create('Pré Recebimento já recebido!');
  if Item_Pre_Recebimento1.IsEmpty then
    raise Exception.Create('Pre Recebimento sem itens!');
  if not VerificaInteiroBranco(edtNotaFiscal.Text) then
    edtNotaFiscal.Text := '0';
  if (Pre_Recebimento1.NotaFiscal <> StrToInt(edtNotaFiscal.Text)) and
     (DM.Configuracao1.Empresa <> empLBM) then
    Raise Exception.Create('Número da Nota inválido!');
  if MessageDlg('Atenção!!!'+#13+
                'Confirmando este Pre-recebimento você assume está recebento todos os produtos descriminados nesse Pre-Recebimento.'+#13+#13+
                'Deseja continuar?',
                mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  CdPRC:=Pre_Recebimento1.CodigoREC;
  Recebimento2.Close;
  Recebimento2.ParamByName('CNC_CODIGO').AsInteger:=DM.Configuracao1.CodigoCNC;
  Recebimento2.ParamByName('REC_TIPO').AsInteger:=Pre_Recebimento1.Tipo;
  Recebimento2.ParamByName('REC_COD_ORIGEM').AsInteger:=Pre_Recebimento1.Cod_Origem;
  Recebimento2.ParamByName('REC_CNC_ORIGEM').AsInteger:=Pre_Recebimento1.CNC_Origem;
  Recebimento2.Open;
  If not Recebimento2.IsEmpty then
    Raise Exception.Create('Este pré-recebimento já foi processado!');

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      //Incluir o Cabeçalho do Recebimento
      with DM.QR_Comandos do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'INSERT INTO RECEBIMENTO (REC_CODIGO,CNC_CODIGO,PRC_CODIGO,'+
          'REC_SITUACAO,REC_TOT_ITEM,REC_TIPO,REC_CNC_ORIGEM,REC_COD_ORIGEM,REC_OBSERVACAO,'+
          'FOR_CODIGO,REC_DATA_SAIDA,REC_DATA_EMISSAO,REC_NUM_DOC,REC_DT_ALTERADO,USU_CODIGO,'+
          'REC_DATA)'+
          ' VALUES ('+inttostr(Recebimento1.ProximoCodigo('REC_CODIGO'))+
          ','+inttostr(DM.Configuracao1.CodigoCNC)+
          ','+inttostr(Pre_Recebimento1.CodigoREC)+
          ',0'+//SITUACAO
          ','+inttostr(Pre_Recebimento1.TotItem)+
          ','+inttostr(Pre_Recebimento1.Tipo)+
          ','+inttostr(Pre_Recebimento1.CNC_Origem)+
          ','+inttostr(Pre_Recebimento1.Cod_Origem)+
          ','''+edtObservacao.Text+''''+
          ','+inttostr(Pre_Recebimento1.CodigoFOR)+
          ','''+MesDiaHora(Pre_Recebimento1.DataS)+
          ''','''+MesDiaHora(Pre_Recebimento1.DataE)+
          ''','+IntToStr(Pre_Recebimento1.NotaFiscal)+
          ','''+MesDiaHora(DM.Configuracao1.DataHora)+
          ''','+inttostr(DM.Configuracao1.CodigoUSU)+
          ','''+MesDiaHora(DM.Configuracao1.Data)+''')';
         ExecSQL;
      end;

      Recebimento1.Close;
      Recebimento1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
      Recebimento1.ParamByName('PRC_CODIGO').asInteger:=Pre_Recebimento1.CodigoREC;
      Recebimento1.Open;

      for i:=0 to CheckListBox1.Items.Count-1 do
      begin
        CheckListBox1.ItemIndex:=i;
        if CheckListBox1.checked[i] then
        begin
          with DM.QR_Comandos do
          begin
            Close;
            SQL.Clear;
            SQL.Text := 'INSERT INTO ITEM_DE_RECEBIMENTO (CNC_CODIGO,IRC_CODIGO,REC_CODIGO,'+
              'PRD_CODIGO,IRC_QUANTIDADE,IRC_SITUACAO,USU_CODIGO,IRC_DT_CADASTRO,LOT_CODIGO)'+
              ' VALUES ('+inttostr(DM.Configuracao1.CodigoCNC)+
              ','+inttostr(Item_Recebimento1.ProximoCodigo('IRC_CODIGO'))+
              ','+inttostr(Recebimento1.CodigoREC)+
              ','+inttostr(strtoint(Copy(CheckListBox1.Items[i],1,7)))+
              ','+floattostr(strtofloat(Trim(Copy(CheckListBox1.Items[i],104,8))))+
              ',0'+
              ','+inttostr(DM.Configuracao1.CodigoUSU)+
              ','''+MesDiaHora(DM.Configuracao1.DataHora)+
              ''','+Trim(Copy(CheckListBox1.Items[i],112,20))+')';

            ExecSQL;
          end;

        end;
      end;

      With Item_Pre_Recebimento1 do
      Begin
        Close;
        Open;
        First;
        try
          CodigoOri := StrToInt(edtCodigoOrigem.Text);
        except
          CodigoOri := CodigoREC;
        end;
        case cmbTipo.ItemIndex of
          0: cTipoMov := 365; //Transferência  ANTIGO 16
          1: cTipoMov := 93; //Abastecimento   ANTIGO 15
          2: cTipoMov := 360; //Compra         ANTIGO 14
          else
            cTipoMov := -1;
        end;
        While not EOF do
        Begin
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
          Item_de_Estoque1.Open;
          If Item_de_Estoque1.IsEmpty Then
          Begin
            if not Item_de_Estoque1.Inserir(DM.Configuracao1.CodigoCNC,CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                      DM.Configuracao1.DataHora,0,0,0,0,0,0) then
            Begin
              ShowMessage('Erro ao gerar item de estoque!'+IntToStr(CodigoPRD));
              Raise Exception.Create('');
            end;
            Item_de_Estoque1.Close;
            Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=DM.Configuracao1.CodigoCNC;
            Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
            Item_de_Estoque1.Open;
          End;

          if (DM.Configuracao1.Empresa <> empLUCIANO) or
             (cmbTipo.ItemIndex <> 2) then //Compra
          Begin
            //Gerar Movimento de estoque comercial
            if not DM.Movimento_Estoque_Comercial1.Inserir(DM.Configuracao1.CodigoCNC,0,
                CodigoPRD,0(*CdFUN*),cTipoMov,DM.Configuracao1.CodigoCNC,CodigoOri,'E',Quantidade,
                Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
                Trim('PRE-RECEBIMENTO '+edtObservacao.Text)) then
            Begin
              ShowMessage('Erro ao gerar movimento de Estoque Comercial!');
              Raise Exception.Create('');
            end;
            //Gerar Movimento Fisico
            if not DM.Movimento_Fisico1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoPRD,0(*CdFUN*),
                DM.Configuracao1.CodigoCNC,CodigoOri,cTipoMov,'E',
                Quantidade,Item_de_Estoque1.SFisico,
                Trim('PRE-RECEBIMENTO '+edtObservacao.Text)) then
            Begin
              ShowMessage('Erro ao gerar Movimento de estoque Fisico!');
              Raise Exception.Create('');
            end;
          end;

          if (edtNotaFiscal.Text <> '') and (edtNotaFiscal.Text <> '0') then
          Begin
            if not DM.Mov_Est_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC,CodigoPRD,0(*CdFUN*),0,
               DM.Configuracao1.CodigoCNC,StrToInt(edtNotaFiscal.Text),cTipoMov, 'E', Quantidade,
               Item_de_Estoque1.SFiscal,
               Item_de_Estoque1.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque1.SBonificacaoFiscal, 0(*BonusFiscal*),
               Trim('PRE-RECEBIMENTO '+edtObservacao.Text)) then
            Begin
              ShowMessage('Falha ao inserir Movimento Fiscal!');
              Raise  exception.Create('');
            end;

            if (DM.Configuracao1.Empresa <> empLuciano) or
               (cmbTipo.ItemIndex <> 2) then //Compra
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                ',IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND PRD_CODIGO='+IntToStr(CodigoPRD))
            else
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
                ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
                ',IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND PRD_CODIGO='+IntToStr(CodigoPRD));
          end
          else
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
              ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND PRD_CODIGO='+IntToStr(CodigoPRD));

          Item_de_Estoque_Detalhe1.Close;
          Item_de_Estoque_Detalhe1.ParamByName('PRD_CODIGO').AsInteger := CodigoPRD;
          Item_de_Estoque_Detalhe1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
          Item_de_Estoque_Detalhe1.ParamByName('LOT_CODIGO').AsInteger := Item_Pre_Recebimento1.fieldbyname('LOT_CODIGO').AsInteger;
          Item_de_Estoque_Detalhe1.Open;

          if Item_de_Estoque_Detalhe1.IsEmpty then
            //Inserir Lote
            DM.Item_de_Estoque_Detalhe1.Inserir(DM.Configuracao1.CodigoCNC,
              Item_Pre_Recebimento1.fieldbyname('LOT_CODIGO').AsInteger,CodigoPRD);

          //Atualizar Estoque Detalhe
          if Item_Pre_Recebimento1.fieldbyname('LOT_CODIGO').AsInteger > 0 then
          begin
            if (DM.Configuracao1.Empresa <> empLuciano) or (cmbTipo.ItemIndex <> 2) then //Compra
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISICO=IED_QTD_FISICO+'+VirgPonto(Quantidade)+
                ',IED_QTD_FISCAL=IED_QTD_FISCAL+'+VirgPonto(Quantidade)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND LOT_CODIGO='+Item_Pre_Recebimento1.fieldbyname('LOT_CODIGO').AsString)
            else
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE_DETALHE SET '+
                ' IED_QTD_FISCAL=IED_QTD_FISCAL+'+VirgPonto(Quantidade)+
                ',IED_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND LOT_CODIGO='+Item_Pre_Recebimento1.fieldbyname('LOT_CODIGO').AsString);
          end;
          //
          //Mudar a situação do ítem
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_RECEBIMENTO SET '+
            ' IRC_SITUACAO=1 '+
            ',IRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
            ' AND IRC_CODIGO='+IntToStr(CodigoIRC));
          Next;
        End;
        Close;
        Open;
      End;

      ExecutaSQL(DM.QR_Comandos,'UPDATE PRE_RECEBIMENTO SET '+
        ' PRC_SITUACAO=1 '+
        ' WHERE CNC_CODIGO='+IntToStr(Pre_Recebimento1.CodigoCNC)+
        ' AND PRC_CODIGO='+IntToStr(Pre_Recebimento1.CodigoREC));

      if DM.Configuracao1.ControleTransacao then
        Commit;
    except
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte!');
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
        end;
    end;
  end;

  Pre_Recebimento1.close;
  Pre_Recebimento1.Open;
  SB_Imprimir.Enabled:=True;
  Pre_Recebimento1.LocalizarCod(CdPRC,DM.Configuracao1.CodigoCNC);
end;

procedure TfMxPreRecebim.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if vPendentes then
    SB_PendenciaClick(sender)
  else
  Begin
    DateTimePicker1.Date:= DM.Configuracao1.Data;
    DateTimePicker1Change(sender);
  end;
end;

procedure TfMxPreRecebim.SB_UltClick(Sender: TObject);
begin
 if Pre_Recebimento1.IsEmpty then
   abort;
 if Pre_Recebimento1.IsEmpty then
   abort;
  If Pre_Recebimento1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Pre_Recebimento1.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Pre_Recebimento1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxPreRecebim.SB_PrimClick(Sender: TObject);
begin
 if Pre_Recebimento1.IsEmpty then
   abort;
 if Pre_Recebimento1.IsEmpty then
   abort;
 If Pre_Recebimento1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Pre_Recebimento1.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Pre_Recebimento1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxPreRecebim.SB_AntClick(Sender: TObject);
begin
 if Pre_Recebimento1.IsEmpty then
   abort;
 if Pre_Recebimento1.IsEmpty then
   abort;
 If Pre_Recebimento1.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Pre_Recebimento1.Prior;
    If Pre_Recebimento1.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not Pre_Recebimento1.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxPreRecebim.SB_ProxClick(Sender: TObject);
begin
 if Pre_Recebimento1.IsEmpty then
   abort;
 if Pre_Recebimento1.IsEmpty then
   abort;
  If Pre_Recebimento1.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Pre_Recebimento1.Next;
    If Pre_Recebimento1.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Pre_Recebimento1.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;


procedure TfMxPreRecebim.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=2;
    fMxSCotaFor.ShowModal;
  end;
end;

procedure TfMxPreRecebim.SB_EtiquetasClick(Sender: TObject);
var
  sProduto, sCodigoBarras: string;
  PUmPoQuantidade: Boolean;
  iQuantidade: integer;
begin
  if Pre_Recebimento1.IsEmpty then
    raise Exception.create('Selecione o Pré Recebimento!');
  Etiquetas1.Close;
  Etiquetas1.SQL.Text := 'SELECT T1.*, T2.IPR_QUANTIDADE '+
      ' FROM PRODUTO T1, ITEM_DE_PRE_RECEBIMENTO T2 '+
      ' WHERE T1.PRD_CODIGO=T2.PRD_CODIGO '+
      ' AND T2.PRC_CODIGO='+edtCodigoPRC.Text+
      ' AND T2.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' ORDER BY T1.PRD_CODIGO ';
  Etiquetas1.Open;
  if Etiquetas1.IsEmpty then
    Raise Exception.Create('O arquivo não foi gerado!');
  try

    PUmPoQuantidade := (MessageDlg('Deseja um registro para cada item do produto?',mtConfirmation, [mbYes, mbNo], 0) <> mrYeS);

    Etiquetas1.LimpaEtiquetas;
    while not Etiquetas1.EOF do
    begin
      if DM.Configuracao1.Empresa = empEletro then
        sProduto := Etiquetas1.Descricao+' '+Etiquetas1.Caracteristica
      else
        sProduto := Etiquetas1.Descricao;

      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT TOP 1 * '+
          ' FROM CODIGO_DE_BARRAS '+
          ' WHERE CDB_CODIGO_ENTRADA='+IntToStr(Etiquetas1.CodigoPRD)+
          ' AND CDB_TIPO=0 ';
        Open;
        sCodigoBarras := FieldByName('CDB_CODIGO_BARRAS').asString;
      end;

      iQuantidade := Etiquetas1.FieldByName('IPR_QUANTIDADE').asInteger;

      if (DM.Configuracao1.Empresa = empEletro) and
         (iQuantidade > 0) and
         (Etiquetas1.Estmedio > 1) then //Volume
        iQuantidade := Trunc(iQuantidade*Etiquetas1.Estmedio); //Volume

      Etiquetas1.AdicionaEtiqueta(Etiquetas1.CodigoPRD,Etiquetas1.Precovenda,
         iQuantidade, sProduto,
         Etiquetas1.Referencia, Etiquetas1.Detalhe, Etiquetas1.Caracteristica, Etiquetas1.Marca, sCodigoBarras, PUmPoQuantidade);
      Etiquetas1.Next;
    end;
    Etiquetas1.FechaEtiquetas;
    Etiquetas1.Close;
    ShowMessage('Arquivo gerado com sucesso !');
  except
  end;
end;

procedure TfMxPreRecebim.SB_ImprimirClick(Sender: TObject);
begin
  if Pre_Recebimento1.IsEmpty then
    raise Exception.create('Selecione o Pré Recebimento!');
  Application.CreateForm(Trpt_PreRecebimento, rpt_PreRecebimento);
  with rpt_PreRecebimento do
  Begin
    Produto1.Open;
    CentroCusto1.Open;
    Pre_Recebimento1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
    Pre_Recebimento1.ParamByName('PRC_CODIGO').AsInteger := self.Pre_Recebimento1.CodigoREC;
    Pre_Recebimento1.Open;
    Report.Preview;
    Close;
  end;
end;

procedure TfMxPreRecebim.Pre_Recebimento1CalcFields(DataSet: TDataSet);
begin
  case Pre_Recebimento1.Tipo of
    0: Pre_Recebimento1.FieldByName('Tipo').asString:='Transferência';
    1: Pre_Recebimento1.FieldByName('Tipo').asString:='Abastecimento';
    2: Pre_Recebimento1.FieldByName('Tipo').asString:='Compra';
  end;
end;

procedure TfMxPreRecebim.Item_Pre_Recebimento1CalcFields(
  DataSet: TDataSet);
begin
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_Pre_Recebimento1.CodigoPRD;
  Produto1.Open;
  if DM.Configuracao1.Empresa = empEletro then
    Item_Pre_Recebimento1.FieldByName('Produto').asString    := Trim(Produto1.Descricao+' '+Produto1.Caracteristica)
  else
    Item_Pre_Recebimento1.FieldByName('Produto').asString    := Produto1.Descricao;
  Item_Pre_Recebimento1.FieldByName('Marca').asString      := Produto1.Marca;
  Item_Pre_Recebimento1.FieldByName('Referencia').asString := Produto1.Referencia;
end;

procedure TfMxPreRecebim.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxPreRecebim.Pre_Recebimento1AfterOpen(DataSet: TDataSet);
begin
  if Pre_Recebimento1.IsEmpty then
  Begin
    edtCodigoPRC.Clear;
    edtNumeroDocumento.Clear;
    edtCodigoFOR.Clear;
    edtCodigoOrigem.Clear;
    edtSituacao.Clear;
    edtObservacao.Clear;
    mskDataEntrada.Clear;
    mskDataEmissao.Clear;
    cmbTipo.ItemIndex := -1;
    dblCNCOrigem.KeyValue := -1;
  end;
end;

procedure TfMxPreRecebim.Item_Pre_Recebimento1AfterOpen(DataSet: TDataSet);
Var
  i:Integer;
  posicao:TBookmark;
begin
  CheckListBox1.Clear;
  if Pre_Recebimento1.IsEmpty then
    Exit;
  Recebimento2.Close;
  Recebimento2.ParamByName('CNC_CODIGO').AsInteger     := DM.Configuracao1.CodigoCNC;
  Recebimento2.ParamByName('REC_TIPO').AsInteger       := Pre_Recebimento1.Tipo;
  Recebimento2.ParamByName('REC_COD_ORIGEM').AsInteger := Pre_Recebimento1.Cod_Origem;
  Recebimento2.ParamByName('REC_CNC_ORIGEM').AsInteger := Pre_Recebimento1.CNC_Origem;
  Recebimento2.Open;
  If not Recebimento2.IsEmpty then
  Begin
    edtSituacao.Text:='Recebido';
    edtObservacao.Text:=Recebimento2.OBS;
    edtObservacao.Enabled:=False;
    SB_Imprimir.Enabled:=True;
  end
  else
  Begin
    edtObservacao.Enabled:=True;
    SB_Imprimir.Enabled:=False;
  end;
  If not Item_Recebimento1.Active then
  Begin
    Recebimento1.Open;
    Item_Recebimento1.Open;
  End;
  With Item_Pre_Recebimento1 do
  Begin
    Posicao:=GetBookmark;
    DisableControls;
    first;
    While not EOF Do
    Begin
      CheckListBox1.Items.Add(PreencheZero(7,Item_Pre_Recebimento1.codigoPRD)+' '+PreencheEspaco(60,Item_Pre_Recebimento1.FieldByName('Produto').AsString)+
                              PreencheEspaco(19,Item_Pre_Recebimento1.FieldByName('Marca').AsString)+PreencheEspaco(16,Item_Pre_Recebimento1.FieldByName('Referencia').AsString)+
                              PreencheEspacoEsq(8,format('%.2f',[Item_Pre_Recebimento1.Quantidade]))+
                              PreencheEspacoEsq(16, IfThen(Item_Pre_Recebimento1.FieldByName('LOT_CODIGO').AsString = '', '0', Item_Pre_Recebimento1.FieldByName('LOT_CODIGO').AsString)));
      Next;
    End;

    i:=0;
    first;

    While not EOF Do
    Begin
      If (Item_Recebimento1.Locate('PRD_CODIGO',FieldByName('PRD_CODIGO').AsInteger,[])) or
         (Pre_Recebimento1.Situacao <> 1) Then
        CheckListBox1.Checked[i]:=true
      Else
        CheckListBox1.Checked[i]:=False;
      i:=i+1;
      Next;
    end;
    EnableControls;
    GotoBookmark(Posicao);
    FreeBookmark(Posicao);
  End;
end;

procedure TfMxPreRecebim.Pre_Recebimento1AfterScroll(DataSet: TDataSet);
begin
  edtNotaFiscal.Text := '0';
  if Pre_Recebimento1.IsEmpty then
  Begin
    edtCodigoPRC.Clear;
    edtNumeroDocumento.Clear;
    edtCodigoFOR.Clear;
    edtCodigoOrigem.Clear;
    edtSituacao.Clear;
    edtObservacao.Clear;
    mskDataEntrada.Clear;
    mskDataEmissao.Clear;
    cmbTipo.ItemIndex := -1;
    dblCNCOrigem.KeyValue := -1;
  end
  else
  Begin
    Pre_Recebimento1.CarregaDados;
    Item_Pre_Recebimento1.Close;
    Item_Pre_Recebimento1.SQL.Text := 'SELECT * FROM ITEM_DE_PRE_RECEBIMENTO '+
      ' WHERE PRC_CODIGO='+IntToStr(Pre_Recebimento1.CodigoREC)+
      ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC);
    Item_Pre_Recebimento1.Open;
  end;
end;

procedure TfMxPreRecebim.SB_CancelarClick(Sender: TObject);
var
  CodigoOri, cTipoMov: integer;
  Trans : Boolean;
begin
  ShowMessage('Função Desativada!');
  exit;
  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Você não pode alterar recebimentos neste centro de custo!');
  if Pre_Recebimento1.IsEmpty then
    raise Exception.create('Selecione o Pré Recebimento!');
  If Pre_Recebimento1.Situacao=3 then
    raise Exception.create('O recebiento já foi cancelado!');
  If Pre_Recebimento1.Situacao=1 then
  Begin
    if MessageDlg('Este embarque já foi processado! Confirma seu cancelamento?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
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

        with Item_Pre_Recebimento1 do
        begin
          first;
          try
            CodigoOri := StrToInt(edtCodigoOrigem.Text);
          except
            CodigoOri := CodigoREC;
          end;
          cTipoMov := 510; //Cancelamento de Recebimento
          while not eof do
          begin
            Item_de_Estoque1.Close;
            Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
            Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
            Item_de_Estoque1.Open;
            If Item_de_Estoque1.IsEmpty Then
            Begin
              if not Item_de_Estoque1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                        DM.Configuracao1.DataHora,0,0,0,0,0,0) then
              Begin
                ShowMessage('Erro ao gerar item de Estoque!');
                Raise Exception.Create('');
              end;
              Item_de_Estoque1.Close;
              Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
              Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
              Item_de_Estoque1.Open;
            End;
            //Gerar MEF
            if not DM.Movimento_Fisico1.Inserir(CodigoCNC,0,CodigoPRD,0(*CdFUN*),
                DM.Configuracao1.CodigoCNC,CodigoOri,cTipoMov,'S',
                Quantidade,Item_de_Estoque1.SFisico) then
            Begin
              ShowMessage('Erro ao gerar movimento de estoque Fisico!');
              Raise Exception.Create('');
            end;
            //Gerar MEC
            if not DM.Movimento_Estoque_Comercial1.Inserir(CodigoCNC,0,
                CodigoPRD,0(*CdFUN*),cTipoMov,DM.Configuracao1.CodigoCNC,CodigoOri, 'S',Quantidade,
                Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
                'PRE-RECEBIMENTO - CANCELADO') then
            Begin
              ShowMessage('Erro ao gerar Movimento de estoque Comercial!');
              Raise Exception.Create('');
            end;

            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
              ',IES_SCOMERCIAL=SCOMERCIAL-'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
              ' AND PRD_CODIGO='+IntToStr(CodigoPRD));

            next;
          end;
        end;

        ExecutaSQL(DM.QR_Comandos,'UPDATE RECEBIMENTO SET '+
          ' REC_SITUACAO=3 '+
          ',REC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(Recebimento1.CodigoCNC)+
          ' AND REC_CODIGO='+IntToStr(Recebimento1.CodigoREC));

        ExecutaSQL(DM.QR_Comandos,'UPDATE PRE_RECEBIMENTO SET PRC_SITUACAO=3 '+
          ' WHERE CNC_CODIGO='+IntToStr(Pre_Recebimento1.CodigoCNC)+
          ' AND PRC_CODIGO='+IntToStr(Pre_Recebimento1.CodigoREC));

        If DM.Configuracao1.ControleTransacao then
          Commit;
      except
        ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
          end;
      end;
    end;
  end
  else //Não gerou movimento (Não foi confirmado antes de cancelar
  Begin
    ExecutaSQL(DM.QR_Comandos,'UPDATE RECEBIMENTO SET '+
      ' REC_SITUACAO=3 '+
      ',REC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(Recebimento1.CodigoCNC)+
      ' AND REC_CODIGO='+IntToStr(Recebimento1.CodigoREC));

    ExecutaSQL(DM.QR_Comandos,'UPDATE PRE_RECEBIMENTO SET PRC_SITUACAO=3 '+
      ' WHERE CNC_CODIGO='+IntToStr(Pre_Recebimento1.CodigoCNC)+
      ' AND PRC_CODIGO='+IntToStr(Pre_Recebimento1.CodigoREC));
  end;
  Pre_Recebimento1.close;
  Pre_Recebimento1.Open;
  SB_Imprimir.Enabled:=False;
end;

procedure TfMxPreRecebim.SB_PendenciaClick(Sender: TObject);
begin
  with DM.QR_Consultas do
  Begin
    Close;
    //Selecionar itens para evitar cabecalhos sem itens
    SQL.Text:='SELECT TOP 1 P1.PRC_DATA '+
      ' FROM PRE_RECEBIMENTO P1, ITEM_DE_PRE_RECEBIMENTO I1 '+
      ' WHERE P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND P1.PRC_SITUACAO<>1 '+
      ' AND NOT EXISTS (SELECT PRC_CODIGO '+
      ' FROM RECEBIMENTO R1 '+
      ' WHERE R1.CNC_CODIGO=P1.CNC_CODIGO '+
      ' AND R1.REC_COD_ORIGEM=P1.PRC_COD_ORIGEM '+
      ' AND R1.REC_CNC_ORIGEM=P1.PRC_CNC_ORIGEM '+
      ' AND R1.REC_TIPO=P1.PRC_TIPO) '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PRC_CODIGO=I1.PRC_CODIGO '+
      ' ORDER BY PRC_DATA ASC ';
    Open;
    if not IsEmpty then
    Begin
      DateTimePicker1.Date := FieldByName('PRC_DATA').AsDateTime;
      DateTimePicker1Change(sender);
      while (not Pre_Recebimento1.Eof) and
            (Pre_Recebimento1.Situacao = 1) do
        Pre_Recebimento1.Next;
    end
    else
      ShowMessage('Não existe Pré-Recebimento pendente!');
  end;
end;

procedure TfMxPreRecebim.SB_VerificarClick(Sender: TObject);
begin
  if Item_Pre_Recebimento1.isEmpty then
    Raise exception.Create('Selecione Pedido com Itens!');

  Application.CreateForm(TfMxVerificarMercadoria, fMxVerificarMercadoria);
  with fMxVerificarMercadoria do
  Begin
    Tag := 2; //Tipo Pre-Recebimento
    //Limpar Tabela
    ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Entidade.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
      ' AND VER_PEDIDO='+IntToStr(self.Item_Pre_Recebimento1.CodigoREC));
    edtCodigoCNC.Text := IntToStr(self.Item_Pre_Recebimento1.CodigoCNC);
    edtPedido.Text    := IntToStr(self.Item_Pre_Recebimento1.CodigoREC);
    edtDescricao.Text := self.edtNumeroDocumento.Text;
    Showmodal;
    //Limpar Tabela
    ExecutaSQL(DM.QR_Comandos, 'DELETE VERIFICAR_MERCADORIA '+
      ' WHERE CNC_CODIGO='+IntToStr(self.Item_Pre_Recebimento1.CodigoCNC)+
      ' AND VER_TIPO='+IntToStr(Tag)+ //Não usar self
      ' AND VER_PEDIDO='+IntToStr(self.Item_Pre_Recebimento1.CodigoREC));
  end;
end;

end.
