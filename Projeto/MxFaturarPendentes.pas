unit MxFaturarPendentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Db, DBTables, SQuery,Math,
  Cliente, Menus, Pedido_de_Venda, Titulo_receber, Forma_de_Pagamento,
  Fatfin, AgenteFin, Item_Nota_Fiscal, NotaFiscal, Item_Pedido_Venda,
  Produto, Classificacao_fiscal;

type
  TfMxFaturarPendentes = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    SB_Confirmar: TBitBtn;
    SB_Fechar: TBitBtn;
    DSCliente1: TDataSource;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    SB_LocCab: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    edtLocalizar: TEdit;
    cmbCampo: TComboBox;
    MainMenu1: TMainMenu;
    MenuCliente: TMenuItem;
    LocalizarCab: TMenuItem;
    N1: TMenuItem;
    ConfirmarCab: TMenuItem;
    SairCab: TMenuItem;
    Cliente1: TCliente;
    ckbFaturarTodos: TCheckBox;
    Pedido_de_Venda1: TPedido_de_Venda;
    Titulo_receber1: TTitulo_receber;
    FatorFinanceira1: TFatorFinanceira;
    Forma_de_Pagamento1: TForma_de_Pagamento;
    AgenteFin1: TAgenteFin;
    NotaFiscal1: TNotaFiscal;
    Item_Nota_Fiscal1: TItem_Nota_Fiscal;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Produto1: TProduto;
    Fechar1: TMenuItem;
    Cliente1CLI_CODIGO: TIntegerField;
    Cliente1CNC_CODIGO: TIntegerField;
    Cliente1CLI_PESSOA_FISICA: TSmallintField;
    Cliente1CLI_DT_CADASTRO: TDateTimeField;
    Cliente1CLI_DATA_NASC: TDateTimeField;
    Cliente1CLI_RZ_SOCIAL: TStringField;
    Cliente1CLI_NOME_FAN: TStringField;
    Cliente1CLI_CGC_CPF: TStringField;
    Cliente1CLI_CGF_RG: TStringField;
    Cliente1CLI_LOGRADOURO: TIntegerField;
    Cliente1CLI_ENDERECO: TStringField;
    Cliente1CLI_BAIRRO: TStringField;
    Cliente1CLI_CIDADE: TStringField;
    Cliente1CLI_UF: TStringField;
    Cliente1CLI_CEP: TStringField;
    Cliente1CLI_FONE: TStringField;
    Cliente1CLI_SITUACAO: TIntegerField;
    Cliente1CLI_CREDITO: TFloatField;
    Cliente1CLI_PAI: TStringField;
    Cliente1CLI_MAE: TStringField;
    Cliente1CLI_CONJUGE: TStringField;
    Cliente1CLI_OBS1: TStringField;
    Cliente1CLI_LOCALTRABALHO: TStringField;
    Cliente1CLI_FAX: TStringField;
    Cliente1CLI_SITE: TStringField;
    Cliente1CLI_EMAIL: TStringField;
    Cliente1USU_CODIGO: TIntegerField;
    Cliente1CLI_DT_ALTERADO: TDateTimeField;
    Cliente1CLI_CELULAR: TStringField;
    Cliente1CLI_SPC: TIntegerField;
    Cliente1CLI_VENDA_ATACADO: TIntegerField;
    Cliente1CLI_DESCONTO: TFloatField;
    Cliente1CLI_ORGAO: TIntegerField;
    Cliente1CLI_DT_SPC: TDateTimeField;
    Cliente1CLI_REFERENCIA1: TStringField;
    Cliente1CLI_REFERENCIA2: TStringField;
    Cliente1CLI_REFERENCIA3: TStringField;
    Cliente1CLI_PROFISSAO: TStringField;
    Cliente1CLI_IDENTIFICACAO: TStringField;
    Cliente1CLI_QUINZENAL: TIntegerField;
    Cliente1CLI_MENSAL: TIntegerField;
    Cliente1CLI_NOTA: TIntegerField;
    Cliente1CLI_CLASSIFICACAO: TIntegerField;
    Cliente1CLI_MAQUINA: TIntegerField;
    Cliente1Total: TStringField;
    ckbFaturarServicos: TCheckBox;
    Cliente1Total2: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_FecharClick(Sender: TObject);
    procedure SB_ConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_LocCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Cliente1CalcFields(DataSet: TDataSet);
  private
    procedure AtualizaControles(Cabecalho: integer; Habilitar: Boolean);

  public
    vDataBase: TDateTime;
    Entidade: TCliente;
    Cancelar: Boolean;
  end;

var
  fMxFaturarPendentes: TfMxFaturarPendentes;

implementation
uses UDM, Funcoes, UNotaFiscalMotCal, UPapeletaDeRecebimento,
  UNotaFiscalLuciano, DigSenha;

{$R *.DFM}

procedure TfMxFaturarPendentes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    DBGrid1.Columns.SaveToFile(DM.Configuracao1.PastaSistema+'\COL_FatPend_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
  Entidade.Close;
  Action:=Cafree;
end;

procedure TfMxFaturarPendentes.SB_FecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxFaturarPendentes.SB_ConfirmarClick(Sender: TObject);
var
  Trans, vCartao, TemEntrada, vGerouTit: Boolean;
  CdPDVCNC, CdPDV, CdNTF, CdFUN, iNotaFiscal, iSelo, iAIDF, iCFOP, iCodPagamento,
    iCodPagamento2, iQtdFolhas, iGrupoEspecial, iTipoPag, CdAGF, CdFPG, CdCNCFPE, CdFPE: integer;
  sDataEmissao, sSerie, sSubSerie, sPedido, sTituloGerado, sItemServico, sFatServico, sObs: string;
  vTotalNota, vTotalProduto, vTotalServico, vTotalICMS, vTotalISS, vAliquota,
    vAliquotaISS, vTotalTitulo, vTotalFrete, vTotalBase: Double;
  DtEmissao, DtVencimento: TDateTime;
begin
  if DM.Configuracao1.CPD then
    Raise exception.Create('Somente nas lojas!');

  If Entidade.IsEmpty Then
    Raise exception.Create('Nenhum cliente para Faturar!');

  if DM.Configuracao1.CodigoCNC <> DM.Usuario1.CentroDeCusto then
    Raise exception.Create('Não pode Faturar nesse Centro de Custo!');

  if ckbFaturarTodos.Checked then
  Begin
    If MessageDlg('Atenção!!!'+#13+'Deseja Faturar os Pedidos de todos esses clientes?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end
  else
  Begin
    If MessageDlg('Atenção!!!'+#13+'Deseja Faturar os Pedidos somente do cliente selecionado?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit;
  end;

  if ckbFaturarServicos.Checked then
  Begin
    sTituloGerado := ' AND P1.PDV_TITULO_GERADO2=0 ';
    sItemServico  := ' AND I1.IPV_SERVICO=1 ';
    sFatServico   := ' Servico';
  end
  else
  Begin
    sTituloGerado := ' AND P1.PDV_TITULO_GERADO=0 ';
    sItemServico  := ' AND (I1.IPV_SERVICO=0 OR I1.IPV_SERVICO IS NULL) ';
    sFatServico   := '';
  end;

  if DM.Usuario1.Permissoes.IndexOf(IntToStr(7450)) < 0 then //Processar Faturamento Pendente
  Begin
    Application.CreateForm(TDigitaSenha, DigitaSenha);
    With DigitaSenha do
    Begin
      onClose:=nil;
      Tag:=39;
      Cancelar:=False;
      Showmodal;
      If not cancelar Then
      begin
        if usuario1.Permissoes.IndexOf(IntToStr(7450)) < 0 then
        begin
          free;
          raise Exception.Create('O usuário não tem permissão para processar faturamento pendente!');
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

  AtualizaControles(1, True);

  if ckbFaturarTodos.Checked then
    Entidade.First;

  if not Titulo_receber1.Active then
    Titulo_receber1.Open;

  while not Entidade.Eof do
  Begin
    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        iNotaFiscal  := 0;
        sDataEmissao := 'NULL';
        CdNTF := 0;
        iCodPagamento := 0;
        iCodPagamento2 := 0;
        iSelo    := 0;
        iAIDF    := 0;

        CdCNCFPE := DM.Usuario1.CentroDeCusto;
        CdFPE  := DM.Configuracao1.ProximoCodigo('FPE_CODIGO');

        if CdFPE <= 0 then
        Begin
          ShowMessage('Falha ao gerar Código de Faturamento Pendente!');
          Raise exception.Create('');
        end;

        //----------------------------------------------------------------------
        //Gerar Títulos
        with Pedido_de_Venda1 do
        Begin
          Close;
          SQL.Text := 'SELECT P1.CNC_CODIGO,P1.PDV_GRUPO_ESPECIAL '+
            ',MIN(P1.PDV_CODIGO) AS PDV_CODIGO '+
            ',SUM(ROUND((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2),2)) AS PDV_TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE P1.CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
            ' AND P1.CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
            ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.codigoCNC)+
            ' AND P1.PDV_SITUACAO=4 '+
            ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
            sTituloGerado+
            sItemServico+
            ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
            ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
            ' GROUP BY P1.CNC_CODIGO,P1.PDV_GRUPO_ESPECIAL ';
          Open;
          CdPDVCNC := CodigoCNC;
          CdPDV    := CodigoPDV;

          if ckbFaturarServicos.Checked then
          Begin
            //Uma vez
            CdAGF := 1;
            //Mudar a Forma de pagamento de 30 dias (CdFPG=8) para 1 Dia (CdFPG=37).
            //CdFPG := 8;
            CdFPG := 37;
            //Alan - Estava gerando com um codigo errado (iTipoPag=1), codigo certo (iTipoPag=5), Dinheiro/Promissoria
            //iTipoPag := 1;
            iTipoPag := 5;
          end
          else
          Begin
            if Total >= 300 then
            Begin
              //Três vezes sem entrada
              CdAGF    := 1;
              CdFPG    := 10;
              iTipoPag := 5;
            end
            else if Total >= 200 then
            Begin
              //Duas vezes sem entrada
              CdAGF    := 1;
              CdFPG    := 9;
              iTipoPag := 5;
            end
            else
            Begin
              //Uma vezes sem entrada
              CdAGF    := 1;
              CdFPG    := 8;
              iTipoPag := 5;
            end;
          end;

          //Somar o Frete dos Pedidos
          with DM.qr_consultas2 do
          Begin
            Close;
            SQL.Text := 'SELECT P1.CNC_CODIGO,P1.PDV_GRUPO_ESPECIAL '+
              ',MIN(P1.PDV_CODIGO) AS PDV_CODIGO '+
              ',SUM(ROUND(P1.PDV_FRETE,2)) AS TOTAL '+
              ' FROM PEDIDO_DE_VENDA P1 '+
              ' WHERE P1.CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
              ' AND P1.CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
              ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.codigoCNC)+
              ' AND P1.PDV_SITUACAO=4 '+
              ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
              ' AND P1.PDV_TITULO_GERADO=0 '+
              ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
              ' GROUP BY P1.CNC_CODIGO,P1.PDV_GRUPO_ESPECIAL ';
            Open;
            vTotalFrete := Arredonda(FieldByName('TOTAL').asFloat);
          end;

          if GrupoEspecial then
            iGrupoEspecial := 1
          else
            iGrupoEspecial := 0;

          //Localizar Agente Financeiro
          with AgenteFin1 do
          Begin
            if CodigoAGF <> CdAGF then
            Begin
              Close;
              ParamByName('AGF_CODIGO').asInteger := CdAGF;
              Open;
            end;
            if DiaPagamento > 0 then
              vCartao := True
            else
              vCartao := False;
          end;

          //Localizar Forma de Pagamento
          with Forma_de_Pagamento1 do
          Begin
            if CodigoFPG <> CdFPG then
            Begin
              Close;
              ParamByName('FPG_CODIGO').asInteger := CdFPG;
              Open;
            end;
            if Prazo[1] = '0' then
              TemEntrada := True
            else
              TemEntrada := False;
          end;

          //Localizar Fator de Financeira
          With FatorFinanceira1 do
          Begin
            Close;
            ParamByName('AGF_CODIGO').AsInteger := CdAGF;
            If (Forma_de_Pagamento1.Prazo[1]='0') and (not AgenteFin1.JurosEntrada) then
              ParamByName('FAF_NPARC').AsInteger:=Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo)-1
            Else
              ParamByName('FAF_NPARC').AsInteger:=Titulo_receber1.QtdeTitulos(Forma_de_Pagamento1.Prazo);
            Open;
          End;

          vGerouTit := False;
          //Gerar Títulos
          if (Total+vTotalFrete > 0) then
          Begin
            //Alan - Voltar ao valor normal do FormCreate
            {if CdFPG = 37 then
              vDataBase := Data();}


            vTotalTitulo := Total+vTotalFrete;

            if not Titulo_receber1.GerarTitAvulso(CdPDV, Entidade.codigoCNC,
                Entidade.CodigoCLI,CdAGF, iTipoPag, 0(*CdTRF*), vTotalTitulo, FatorFinanceira1.Fator,
                vCartao, TemEntrada,AgenteFin1.JurosEntrada, Forma_de_Pagamento1.Prazo,
                'Faturamento Pendente',''(*CartãoCV*),vDataBase,CdCNCFPE, CdFPE) then //Tag = 0 Venda;
              Raise exception.Create('')
            else
              vGerouTit := True;

            //Alan - Voltar ao valor normal do FormCreate
            {if CdFPG = 37 then
              vDataBase := DM.Configuracao1.Data;}
          end
          else
            vTotalTitulo := 0;
          Close;
        end;

        //--------------------------------------------------------------------
        //Gerar Nota
        if (Entidade.Nota) and
           (DM.Configuracao1.Empresa <> empLuciano) then
        Begin
          if (CdFPG = 11) and (DM.Configuracao1.Empresa = empLBM) then
            iCodPagamento := 1  //Apresentação
          else if (iTipoPag = 13) then // Cartão
          Begin
            iCodPagamento := 4;  //Cartão
            case CdAGF of
              7: iCodPagamento2 := 40;
              8: iCodPagamento2 := 50;
              9: iCodPagamento2 := 60;
             10: iCodPagamento2 := 70;
            end;
          end
          else if (CdFPG = 1) then // AVista
            iCodPagamento := 2  //AVista
          else
          Begin
            iCodPagamento := 3; //APrazo
            case iTipoPag of
              6: iCodPagamento2 := 10;
            416: iCodPagamento2 := 20;
            412: iCodPagamento2 := 30;
            end;
          end;
          if Cliente1.Uf = DM.Configuracao1.UF then
            iCFOP := 5102  //Dentro do Estado
          else if Cliente1.PessoaFisica or (Trim(Cliente1.CGFRG) = '') then
            iCFOP := 6108  //Não Contribuinte
          else
            iCFOP := 6102; //Fora do Estado

          DM.Item_Pedido_Venda1.Close;
          DM.Item_Pedido_Venda1.SQL.Text := 'SELECT PRD_CODIGO '+
            ',SUM(IPV_QUANTIDADE) AS IPV_QUANTIDADE '+
            ',ROUND(SUM((IPV_QUANTIDADE-IPV_BONIFICACAO)*ROUND(IPV_PRECO_DESC,2))/SUM(IPV_QUANTIDADE),2) AS IPV_PRECO_DESC '+
            ' FROM PEDIDO_DE_VENDA P1 '+
            ',ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE P1.CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
            ' AND P1.CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
            ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
            ' AND P1.PDV_SITUACAO=4 '+      //Pedido Finalizado
            ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
            sTituloGerado+
            sItemServico+
            ' AND P1.PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
            ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
            ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
            ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
            ' GROUP BY I1.PRD_CODIGO ';
          DM.Item_Pedido_Venda1.Open;
          vTotalNota := 0;
          vTotalProduto := 0;
          vTotalServico := 0;
          vTotalICMS := 0;
          vTotalISS  := 0;

          if not DM.Item_Pedido_Venda1.IsEmpty then
          Begin
            CdNTF := NotaFiscal1.ProximoCodigo('NTF_CODIGO');

            with DM.QR_Consultas do
            Begin
              Close;
              SQL.Text := 'SELECT P1.PDV_CODIGO, P1.PDV_DOCUMENTO '+
                ' FROM PEDIDO_DE_VENDA P1 '+
                ' WHERE P1.CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
                ' AND P1.CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
                ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND P1.PDV_SITUACAO=4 '+      //Pedido Finalizado
                ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
                sTituloGerado+
                ' AND P1.PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
                ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" ';
              Open;
              sObs := '';
              while not Eof do
              Begin
                if sObs <> '' then
                  sObs := sObs + ';';
                sObs := sObs + FieldByName('PDV_CODIGO').asString;
                Next;
              end;
            end;
            sObs := 'DOC:'+sObs;

            //Carregar Número da Nota e demais informações
            with DM.QR_Consultas do
            Begin
              Close;
              SQL.Text:='SELECT * FROM CATRACA '+
                ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND CTR_TIPO_NOTA=0';
              Open;
              iNotaFiscal := FieldByName('CTR_NOTA_FISCAL').asInteger;
              iSelo       := FieldByName('CTR_NOTA_SELO').asInteger;
              iAIDF       := FieldByName('CTR_NOTA_AIDF').asInteger;
              sSerie      := FieldByName('CTR_NOTA_SERIE').asString;
              sSubSerie   := FieldByName('CTR_NOTA_SUBSERIE').asString;

              Close;
              SQL.Text := 'SELECT COUNT(DISTINCT P2.SGP_CODIGO) AS QTD '+
                ' FROM PEDIDO_DE_VENDA P1 '+
                ',ITEM_DE_PEDIDO_DE_VENDA I1 '+
                ',PRODUTO P2 '+
                ' WHERE P1.CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
                ' AND P1.CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
                ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
                ' AND P1.PDV_SITUACAO=4 '+      //Pedido Finalizado
                ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
                sTituloGerado+
                sItemServico+
                ' AND P1.PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
                ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
                ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
                ' AND P1.PDV_CODIGO=I1.PDV_CODIGO '+
                ' AND I1.PRD_CODIGO=P2.PRD_CODIGO ';
              Open;
              if FieldByName('QTD').asInteger <= confItensNota[empMotical] then
                iQtdFolhas := 1
              else
              Begin
                iQtdFolhas := FieldByName('QTD').asInteger div confItensNota[empMotical];
                if (FieldByName('QTD').asInteger mod confItensNota[empMotical]) > 0 then
                  iQtdFolhas := iQtdFolhas + 1;
              end;
            end;

            //Alterar Catraca de acorde com a quantidade de folhas na Nota
            ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
              ' CTR_NOTA_FISCAL=CTR_NOTA_FISCAL+1 '+
              ',CTR_NOTA_SELO=CTR_NOTA_SELO+'+IntToStr(iQtdFolhas)+
              ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND CTR_TIPO_NOTA=0');
          end;
          while not DM.Item_Pedido_Venda1.EOF do
          Begin
            if Produto1.CodigoPRD <> DM.Item_Pedido_Venda1.CodigoPRD then
            Begin
              Produto1.Close;
              Produto1.ParamByName('PRD_CODIGO').asInteger := DM.Item_Pedido_Venda1.CodigoPRD;
              Produto1.Open;
            end;
            //Carregar Alíquota de ICMS do Produto
            Classificacao_fiscal1.Close;
            if Produto1.CodigoCLF = 0 then
              Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=1
            else
              Classificacao_fiscal1.ParamByName('CLF_CODIGO').asInteger:=Produto1.CodigoCLF;
            Classificacao_fiscal1.Open;

            if Produto1.Servico then
            Begin
              vAliquota := 0;
              vAliquotaISS := DM.Configuracao1.AliquotaISS;
              vTotalISS := vTotalISS + Arredonda(DM.Item_Pedido_Venda1.Quantidade*
                Arredonda(DM.Item_Pedido_Venda1.PrecoDesc*vAliquotaISS/100));
              vTotalServico := vTotalServico + Arredonda(DM.Item_Pedido_Venda1.Quantidade*DM.Item_Pedido_Venda1.PrecoDesc);
            end
            else
            Begin
              vAliquotaISS := 0;
              if not Classificacao_fiscal1.IsEmpty then
                vAliquota := Classificacao_fiscal1.ICMS
              else
                vAliquota := 17;
              vTotalProduto := vTotalProduto + Arredonda(DM.Item_Pedido_Venda1.Quantidade*DM.Item_Pedido_Venda1.PrecoDesc);
              vTotalICMS := vTotalICMS + Arredonda(DM.Item_Pedido_Venda1.Quantidade*
                Arredonda(DM.Item_Pedido_Venda1.PrecoDesc*vAliquota/100));
            end;

            vTotalNota := vTotalNota+Arredonda(DM.Item_Pedido_Venda1.Quantidade*DM.Item_Pedido_Venda1.PrecoDesc);
            if not Item_Nota_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,CdNTF,
                DM.Item_Pedido_Venda1.CodigoPRD,DM.Item_Pedido_Venda1.CodigoLOT,0(*TipoAliquota*),
                vAliquota(*AliquotaICMS*),vAliquotaISS(*AliquotaISS*),
                DM.Item_Pedido_Venda1.Quantidade,DM.Item_Pedido_Venda1.PrecoDesc,
                0(*Desconto*),0(*AliquotaIPI*),DM.Item_Pedido_Venda1.Bonificacao,0(*Amostra*),
                DM.Produto1.Descricao) then
              Raise exception.Create('');

            DM.Item_Pedido_Venda1.Next;
          end;

          //Como o Faturamento de serviço é separado de produto não emitir a nota
          if vTotalNota > 0 then
          Begin
            DtEmissao := DM.Configuracao1.Data;
            sDataEmissao := '"'+MesDia(DtEmissao)+'" ';
            try
              CdFUN := StrToInt(Entidade.Conjuge);
            except
              CdFUN := 0;
            end;

            vTotalBase := vTotalProduto + vTotalFrete;
            vTotalICMS := vTotalICMS + Arredonda(vTotalFrete*0.07);
            vTotalNota := vTotalNota + vTotalFrete;

            if not NotaFiscal1.Inserir(DM.Configuracao1.CodigoCNC,CdNTF,CdPDVCNC,CdPDV,iCFOP (*CFOP*),
                0(*CodigoFOR*),DM.Configuracao1.CodigoCNC(*CodigoTRN*),Entidade.CodigoCNC,
                Entidade.CodigoCLI, CdFUN, iNotaFiscal,
                iAIDF,1,361(*Tipo*),0(*TipoTransporte*),0(*TipoFrete*),iSelo,
                2(*Situacao*),0(*Conhecimento*),1 (*NotaCupom*),iCodPagamento,iCodPagamento2,
                0,vTotalBase(*BaseICMS*),vTotalICMS,0(*BaseICMSSub*),0(*ICMSSub*),
                vTotalServico,vTotalProduto(*TotalProduto*),vTotalNota,0(*IPI*),vTotalFrete(*Frete*),
                7(*ICMSFrete*),0(*Quantidade*),vTotalServico(*Base ISS*),
                Arredonda(vTotalServico*DM.Configuracao1.AliquotaISS/100),0(*Outras*),
                sSerie,sSubSerie,sObs(*OBS*),''(*UF*),DtEmissao (*DataEmissao*),
                DM.Configuracao1.Data (*DataEntSaida*)) then
              Raise exception.Create('');

            ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
              ' TRC_NUMERO="'+IntToStr(iNotaFiscal)+'" '+
              ',CCX_CODIGO=CCX_CODIGO_REC '+
              ',CNC_FATURAMENTO_PENDENTE='+IntToStr(CdCNCFPE)+
              ',FPE_CODIGO='+IntToStr(CdFPE)+
              ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
              ' AND CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
              ' AND TRC_SITUACAO=0 '); //Não alterar o Número dos Títulos Pagos;

            ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
              ' PDV_NOTA_FISCAL='+IntToStr(iNotaFiscal)+
              ',PDV_DT_EMISSAO_VENDA='+sDataEmissao+
              ',PDV_TITULO_GERADO='+IntToStr(IfThen(vGerouTit,1))+
              ',CNC_FATURAMENTO_PENDENTE='+IntToStr(CdCNCFPE)+
              ',FPE_CODIGO='+IntToStr(CdFPE)+
              ',PDV_DT_FPE="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',AGF_CODIGO='+IntToStr(CdAGF)+
              ',FPG_CODIGO='+IntToStr(CdFPG)+
              ',PDV_TIPO_PAG='+IntToStr(iTipoPag)+
              ' WHERE CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
              ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
              ' AND PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
              ' AND PDV_SITUACAO=4 '+
              ' AND PDV_TIPO_VENDA=1 '+    //Venda Pendente
              ' AND PDV_TITULO_GERADO=0 '+
              ' AND PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" ');
          end
          else if vGerouTit then
          Begin
            ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
              ' PDV_TITULO_GERADO=1 '+
              ',CNC_FATURAMENTO_PENDENTE='+IntToStr(CdCNCFPE)+
              ',FPE_CODIGO='+IntToStr(CdFPE)+
              ',PDV_DT_FPE="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ',AGF_CODIGO='+IntToStr(CdAGF)+
              ',FPG_CODIGO='+IntToStr(CdFPG)+
              ',PDV_TIPO_PAG='+IntToStr(iTipoPag)+
              ' WHERE CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
              ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
              ' AND PDV_SITUACAO=4 '+
              ' AND PDV_TIPO_VENDA=1 '+    //Venda Pendente
              ' AND PDV_TITULO_GERADO=0 '+
              ' AND PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
              ' AND PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" ');
          end;
        end
        else //Não Gerou nota ou Luciano Ótica
        Begin
          if vGerouTit then //Somente Gerou Títulos
          Begin
            if ckbFaturarServicos.Checked then
            begin
              ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
                ' PDV_TITULO_GERADO2=1 '+
                ',CNC_FATURAMENTO_PENDENTE2='+IntToStr(CdCNCFPE)+
                ',FPE_CODIGO2='+IntToStr(CdFPE)+
                ',PDV_DT_FPE2="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ',AGF_CODIGO='+IntToStr(CdAGF)+
                ',FPG_CODIGO='+IntToStr(CdFPG)+
                ',PDV_TIPO_PAG='+IntToStr(iTipoPag)+
                ' WHERE CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
                ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
                ' AND PDV_SITUACAO=4 '+
                ' AND PDV_TIPO_VENDA=1 '+    //Venda Pendente
                ' AND PDV_TITULO_GERADO2=0 '+
                ' AND PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
                ' AND PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" ');
            end
            else
              ExecutaSQL(DM.QR_Comandos, 'UPDATE PEDIDO_DE_VENDA SET '+
                ' PDV_TITULO_GERADO=1 '+
                ',CNC_FATURAMENTO_PENDENTE='+IntToStr(CdCNCFPE)+
                ',FPE_CODIGO='+IntToStr(CdFPE)+
                ',PDV_DT_FPE="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ',AGF_CODIGO='+IntToStr(CdAGF)+
                ',FPG_CODIGO='+IntToStr(CdFPG)+
                ',PDV_TIPO_PAG='+IntToStr(iTipoPag)+
                ' WHERE CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
                ' AND CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
                ' AND PDV_SITUACAO=4 '+
                ' AND PDV_TIPO_VENDA=1 '+    //Venda Pendente
                ' AND PDV_TITULO_GERADO=0 '+
                ' AND PDV_GRUPO_ESPECIAL='+IntToStr(iGrupoEspecial)+
                ' AND PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" ');
          end;
        end;

        Entidade.GeraLog(7450, CdCNCFPE, CdFPE, 'CLI:'+PreencheZero(2,Entidade.CodigoCNC)+'-'+IntToStr(Entidade.CodigoCLI)+
          ' DtBase:'+DateToStr(vDataBase)+' AGF:'+IntToStr(CdAGF)+' FPG:'+IntToStr(CdFPG)+
          ' TipoPag:'+IntToStr(iTipoPag)+' Esp:'+IntToStr(iGrupoEspecial)+sFatServico);

        If DM.Configuracao1.ControleTransacao then
          Commit;

        if iNotaFiscal > 0 then
        Begin
          if DM.Configuracao1.Empresa = empMotical then
          Begin
            Application.CreateForm(Trpt_NotaFiscalMotCal, rpt_NotaFiscalMotCal);
            with rpt_NotaFiscalMotCal do
            Begin
              tag := 12; //Não funciona
              if iCodPagamento <> 2 then //Diferente de A Vista
                VendaPrazo := True;

              Item_Nota_Fiscal10.Close;
              Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := DM.Configuracao1.CodigoCNC;
              Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := DM.Configuracao1.CodigoCNC;
              Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := CdNTF;
              Item_Nota_Fiscal10.Open;

              report.Preview;
              Close;
            end;
          end
          else
          Begin
            Application.CreateForm(Trpt_NotaFiscalLuciano, rpt_NotaFiscalLuciano);
            with rpt_NotaFiscalLuciano do
            Begin
              tag := 12; //Não funciona
              if iCodPagamento <> 2 then //Diferente de A Vista
                VendaPrazo := True;

              Item_Nota_Fiscal10.Close;
              Item_Nota_Fiscal10.ParamByName('CNC_ORIGEM').asinteger := DM.Configuracao1.CodigoCNC;
              Item_Nota_Fiscal10.ParamByName('CNC_CODIGO').asinteger := DM.Configuracao1.CodigoCNC;
              Item_Nota_Fiscal10.ParamByName('NTF_CODIGO').asInteger := CdNTF;
              Item_Nota_Fiscal10.Open;

              report.Preview;
              Close;
            end;
          end;
          If MessageDlg('Atenção!!!'+#13+
                        'A Nota foi Impressa com Sucesso?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Begin
            ShowMessage('Processo Abortado!'+#13+
                        'Verifique a Catraca e re-imprima a Nota!');
            Break;
          end;
        end
        else
        Begin
          //Imprimir Papeleta de Recebimento
          Application.CreateForm(Trpt_PapeletaDeRecebimento, rpt_PapeletaDeRecebimento);
          with rpt_PapeletaDeRecebimento do
          Begin
            Tag := 0;
            zrlTotalPedido.Caption := format('%.2f',[vTotalTitulo]);
            with DM.QR_Consultas do
            Begin
              Close;
              if ckbFaturarServicos.Checked then
                SQL.Text := 'SELECT PDV_CODIGO, PDV_DOCUMENTO '+
                  ' FROM PEDIDO_DE_VENDA '+
                  ' WHERE CNC_FATURAMENTO_PENDENTE2='+IntToStr(CdCNCFPE)+
                  ' AND FPE_CODIGO2='+IntToStr(CdFPE)
              else
                SQL.Text := 'SELECT PDV_CODIGO, PDV_DOCUMENTO '+
                  ' FROM PEDIDO_DE_VENDA '+
                  ' WHERE CNC_FATURAMENTO_PENDENTE='+IntToStr(CdCNCFPE)+
                  ' AND FPE_CODIGO='+IntToStr(CdFPE);
              Open;
              sPedido := '';
              while not Eof do
              Begin
                if sPedido <> '' then
                  sPedido := sPedido + ';';
                if Trim(FieldByName('PDV_DOCUMENTO').asString) <> '' then
                  sPedido := sPedido + FieldByName('PDV_DOCUMENTO').asString
                else
                  sPedido := sPedido + FieldByName('PDV_CODIGO').asString;
                Next;
              end;
              zrlPedidos.Caption := sPedido;
            end;

            Entidade.Close;
            Entidade.SQL.Text := 'SELECT * FROM TITULO_A_RECEBER '+
              ' WHERE CNC_CODIGO='+IntToStr(CdPDVCNC)+
              ' AND FPE_CODIGO='+IntToStr(CdFPE)+
              ' AND TRC_SITUACAO<>5 ';
            Entidade.Open;
            report.Preview;
            Close;
          end;
        end;

      except
        AtualizaControles(1, False);
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
          end;
      end;
    End;
    Entidade.Next;
    if not ckbFaturarTodos.Checked then
      Break;
  end;
  Entidade.Close;
  Entidade.Open;
  AtualizaControles(1, False);
end;

procedure TfMxFaturarPendentes.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  if DM.Configuracao1.Empresa = empMotical then
    ckbFaturarTodos.Checked := True;
  cmbCampo.ItemIndex := 0;
  edtLocalizar.SetFocus;
end;

procedure TfMxFaturarPendentes.SB_LocCabClick(Sender: TObject);
begin
  if (cmbCampo.ItemIndex=0) and
     (not VerificaInteiroBranco(edtLocalizar.Text)) then
    Raise exception.Create('Código inválido!');
  Entidade.Localizar;
end;

procedure TfMxFaturarPendentes.FormCreate(Sender: TObject);
begin
  Entidade := Cliente1;
  vDataBase := DM.Configuracao1.Data;
  try
    DBGrid1.Columns.LoadFromFile(DM.Configuracao1.PastaSistema+'\COL_FatPend_'+IntToStr(DM.Configuracao1.CodigoUSU)+'.TXT');
  except
  end;
end;

procedure TfMxFaturarPendentes.AtualizaControles(Cabecalho: integer; Habilitar: Boolean);
begin
  Fechar1.Enabled       := not Habilitar;
  SairCab.Enabled       := not Habilitar;
  SB_Confirmar.Enabled  := not Habilitar;
  SB_Fechar.Enabled     := not Habilitar;

  edtLocalizar.Enabled  := not Habilitar;
  if Habilitar then
    edtLocalizar.Color  := AlteraCorComponentes
  else
    edtLocalizar.Color  := clWindow;
  cmbCampo.Enabled      := not Habilitar;
  if Habilitar then
    cmbCampo.Color      := AlteraCorComponentes
  else
    cmbCampo.Color      := clWindow;

  DBGrid1.Enabled       := not Habilitar;
end;

procedure TfMxFaturarPendentes.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  If key=chr(27) then
  Begin
    if SB_Fechar.Enabled then
    Begin
      SB_Fechar.SetFocus;
      SB_FecharClick(sender);
    end
    else
      Close;
  end
  else if Key=#13 then
  Begin
    if SB_Confirmar.Enabled then
    Begin
      SB_Confirmar.SetFocus;
      SB_ConfirmarClick(sender);
    end;
  end;
end;

procedure TfMxFaturarPendentes.Cliente1CalcFields(DataSet: TDataSet);
var
  vTotal, vTotal2: Double;
begin
  with DM.QR_Consultas do
  Begin
    //Total de serviço a ser faturado
    Close;
    SQL.Text := 'SELECT SUM(ROUND((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2),2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
      ' AND P1.CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
      ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND P1.PDV_SITUACAO=4 '+
      ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
      ' AND P1.PDV_TITULO_GERADO2=0 '+
      ' AND I1.IPV_SERVICO=1 '+
      ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    vTotal2 := FieldByName('TOTAL').asFloat;

    //Total de Produto a ser faturado
    Close;
    SQL.Text := 'SELECT SUM(ROUND((I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)*ROUND(I1.IPV_PRECO_DESC,2),2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
      ' WHERE P1.CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
      ' AND P1.CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
      ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND P1.PDV_SITUACAO=4 '+
      ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
      ' AND P1.PDV_TITULO_GERADO=0 '+
      ' AND (I1.IPV_SERVICO=0 OR I1.IPV_SERVICO IS NULL ) '+
      ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" '+
      ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
      ' AND P1.PDV_CODIGO=I1.PDV_CODIGO ';
    Open;
    vTotal := FieldByName('TOTAL').asFloat;

    //Total de Ferte para somar com produto
    Close;
    SQL.Text := 'SELECT SUM(ROUND(P1.PDV_FRETE,2)) AS TOTAL '+
      ' FROM PEDIDO_DE_VENDA P1 '+
      ' WHERE P1.CNC_CLIENTE='+IntToStr(Entidade.CodigoCNC)+
      ' AND P1.CLI_CODIGO='+IntToStr(Entidade.CodigoCLI)+
      ' AND P1.CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
      ' AND P1.PDV_SITUACAO=4 '+
      ' AND P1.PDV_TIPO_VENDA=1 '+    //Venda Pendente
      ' AND P1.PDV_TITULO_GERADO=0 '+
      ' AND P1.PDV_DT_ENTREGA<="'+MesDia(vDataBase)+'" ';
    Open;
    vTotal := vTotal + FieldByName('TOTAL').asFloat;

    if vTotal > 0 then
      Cliente1.FieldByName('TOTAL').asString := Format('%.2f',[vTotal])
    else
      Cliente1.FieldByName('TOTAL').asString := '0,00';

    if vTotal2 > 0 then
      Cliente1.FieldByName('TOTAL2').asString := Format('%.2f',[vTotal2])
    else
      Cliente1.FieldByName('TOTAL2').asString := '0,00';
  end;
end;

end.
