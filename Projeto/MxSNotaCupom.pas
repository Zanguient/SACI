unit MxSNotaCupom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, SQuery, CentroCusto, DBCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Cliente, Titulo_receber, Informacoes, Item_Pedido_Venda,
  {ImpFiscB, }Item_de_Estoque, Pedido_de_Venda, Item_Nota_Fiscal, NotaFiscal,
  Classificacao_fiscal, Produto, Menus, Transferencia,
  Item_de_Transferencia;

type
  TfMxSNotaCupom = class(TForm)
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    Panel2: TPanel;
    ckbServico: TCheckBox;
    rdgCupom: TRadioButton;
    rdgNota: TRadioButton;
    Bevel1: TBevel;
    Cliente1: TCliente;
    Titulo_receber1: TTitulo_receber;
    Informacoes1: TInformacoes;
    Titulo_receber2: TTitulo_receber;
    Titulo_receber2MEDIA: TFloatField;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_de_Estoque1: TItem_de_Estoque;
    Pedido_de_Venda1: TPedido_de_Venda;
    NotaFiscal1: TNotaFiscal;
    Item_Nota_Fiscal1: TItem_Nota_Fiscal;
    Classificacao_fiscal1: TClassificacao_fiscal;
    Titulo_receber3: TTitulo_receber;
    Item_de_Estoque2: TItem_de_Estoque;
    Item_de_Transferencia2: TItem_de_Transferencia;
    Transferencia2: TTransferencia;
    Item_de_Transferencia1: TItem_de_Transferencia;
    Transferencia1: TTransferencia;
    DSTransferencia1: TDataSource;
    Titulo_receber4: TTitulo_receber;
    ckbManual: TCheckBox;
    Titulo_receber5: TTitulo_receber;
    ckbCupomEsp: TCheckBox;
    qrConsultas: TQuery;
    qrConsultas2: TQuery;
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bitConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbCupomEspClick(Sender: TObject);
  private
    { Private declarations }
  public
    Entidade : TPedido_De_venda;
    Cancelar, SimpRemessa, ReducaoEletro, FOtica : Boolean;
    CdCNC, CdPDV, iCdCNCCli, CdCLI, CdFUN, CdFPG, CdTipoPag : integer;
    Entrada : Double;
    CNPJ_CPF : string;
  end;

var
  fMxSNotaCupom: TfMxSNotaCupom;

implementation
uses UDM, funcoes, DigSenha, MxNotaFiscal, MxPedidoRapido,
  MxPedidoMotCal, MxServico, MxServicoLBM, MxPedidoMotCal_2, UDMFB;
{$R *.DFM}

procedure TfMxSNotaCupom.bitCancelarClick(Sender: TObject);
begin
  if tag = 0 then //Pedido de Venda LBM
    //fmxpedidoLBM.CancelarFatura := True
  else if tag = 1 then
    fMxPedidoRapido.CancelarFatura := True
//  else if tag = 2 then
//    fMxPedidoRapido.CancelarFatura := True;
  else if tag in [3,5] then
    fMxPedidoMotCal.CancelarFatura := True
  else if tag = 4 then
    fMxServico.CancelarFatura := True
  else if tag = 6 then
    fMxServicoLBM.CancelarFatura := True
  else if tag in [7,8] then
    fMxPedidoMotCal_2.CancelarFatura := True;
  Close;
end;

procedure TfMxSNotaCupom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMxSNotaCupom.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = 'C') then
  begin
    if ckbCupomEsp.Visible = False then
      ckbCupomEsp.Visible := True
    else
    begin
      ckbCupomEsp.Checked := False;
      ckbCupomEsp.Visible := False;
    end;
  end
  else
    if Key = #27 then
      Close;
end;

procedure TfMxSNotaCupom.bitConfirmarClick(Sender: TObject);
var
  CentroLocal, CentroExterno, NumeroItemNota, Linhas, i, j, NumeroOficial,
    iCodPagamento, iCodPagamento2, CdArquiteto, CaixaCNC,iTRFEletro :Integer;
  vTotalNota, vTotalProduto, vTotalServico, vTotalServicoLBM, PrecoUnitNota, vQuantidade, ValorItem,
    PLiquido, QuantidadeVendida, EstLocal, EstExterno, vTotalICMS, vTotalISS,
    vAliquota, vDesc_Bonificacao, vTotalCupom : Double;
  mensagem,TAM,FiltrarCentro,sFiltrarTitulo, sDescricaoFPG:string;
  trans, Lib3790, Lib3540, Lib3830, Lib3740, Lib3820, Lib3930, Lib6230, Lib6240:boolean;
begin
  Lib3790:=False; //Liberar Venda Cliente Inadiplente
  Lib3540:=False; //Liberar Juros Total
  Lib3830:=False; //Entrada Menor que a Presta��o
  Lib3740:=False; //Abaixo do Pre�o M�nimo
  Lib3820:=False; //Venda sem Estoque
  Lib3930:=False; //Desconto Gerente
  Lib6230:=False; //Boleto Banc�rio
  Lib6240:=False; //M�dia Acima de 60 dias
  bitConfirmar.Enabled := False;
  PLiquido:=0;
  vTotalNota := 0;
  vTotalCupom := 0;
  vTotalProduto := 0;
  vTotalServico := 0;
  vTotalServicoLBM := 0;
  vTotalICMS := 0;
  vTotalISS  := 0;

  if (DM.Configuracao1.Empresa = empLBM) and
     (DM.Configuracao1.CodigoCNC <> 3) then
    CaixaCNC := 1
  else
    CaixaCNC := DM.Configuracao1.CodigoCNC;

  if (DM.Configuracao1.Empresa = empLBM) then
    if (DM.Configuracao1.CodigoCNC = 1) then
    Begin
      CentroLocal   := 1;
      CentroExterno := 2;
    end
    else if (DM.Configuracao1.CodigoCNC = 3) then
    Begin
      CentroLocal   := 3;
      CentroExterno := 3;
    end
    else
    Begin
      CentroLocal   := 2;
      CentroExterno := 1;
    end
  else
  Begin
    CentroLocal   := DM.Configuracao1.CodigoCNC;
    CentroExterno := DM.Configuracao1.Deposito;
  end;

  if (DM.Configuracao1.CodigoCNC<>DM.Usuario1.CentroDeCusto) then
    raise Exception.Create('Voc� n�o pode alterar vendas neste centro de custo.');

  //Carrega Pedido
  with Entidade do
  Begin
    Close;
    ParamByName('CNC_CODIGO').asInteger := CdCNC;
    ParamByName('PDV_CODIGO').asInteger := CdPDV;
    Open;
  end;

  iCodPagamento2 := 0;
  if (Entidade.CodigoFPG = 11) and (DM.Configuracao1.Empresa = empLBM) then
    iCodPagamento := 1  //Carteira
  else if (Entidade.TipoPag = 13) then // Cart�o
  Begin
    iCodPagamento := 4;  //Cart�o
    case Entidade.CodigoAGF of
      7: iCodPagamento2 := 40;
      8: iCodPagamento2 := 50;
      9: iCodPagamento2 := 60;
     10: iCodPagamento2 := 70;
    end;
  end
  else if (Entidade.CodigoFPG = 1) then // AVista
    iCodPagamento := 2  //AVista
  else
  Begin
    iCodPagamento := 3; //APrazo
    case Entidade.TipoPag of
      6: iCodPagamento2 := 10;
    416: iCodPagamento2 := 20;
    412: iCodPagamento2 := 30;
    end;
  end;

  //Valor Total somente dos itens q ser�o impressos no CUPOM FISCAL
  with qrConsultas do
  begin
    Close;
    SQL.Clear;

    if (ckbCupomEsp.Checked=False) then
    begin
      SQL.Text:= 'SELECT IPV.IPV_QUANTIDADE,IPV.IPV_PRECO_DESC FROM ITEM_DE_PEDIDO_DE_VENDA IPV'+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND IPV_FISCAL=1'+
        ' AND PDV_CODIGO='+IntToStr(CdPDV);
      Open;
      while not (qrConsultas.Eof) do
      begin
        vTotalCupom := vTotalCupom + qrConsultas.Fields[0].AsFloat*qrConsultas.Fields[1].AsFloat;

        qrConsultas.Next;
      end;
    end
    else
    begin
      SQL.Text:= 'SELECT IPV.IPV_QUANTIDADE,IPV.IPV_PRECO_DESC,IPV_DESCONTO FROM ITEM_DE_PEDIDO_DE_VENDA IPV'+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND IPV_FISCAL=1'+
        ' AND PDV_CODIGO='+IntToStr(CdPDV);
      Open;
      while not (qrConsultas.Eof) do
      begin
        //Calculo do Preco de Venda - 30%
        vTotalCupom := vTotalCupom + qrConsultas.Fields[0].AsFloat*
          (qrConsultas.Fields[1].AsFloat-(qrConsultas.Fields[1].AsFloat*30/100));

        qrConsultas.Next;
      end;
    end;
  end;

  //Carrega Itens do Pedido
  //Alan - Filtrar somente os produtos q podem ser impressos
  if (DM.Configuracao1.Empresa = empLuciano) then
  begin
    with Item_Pedido_Venda1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND IPV_FISCAL=1'+
        ' AND PDV_CODIGO='+IntToStr(CdPDV)+
        ' ORDER BY IPV_CODIGO ASC ';
      Open;
      CdFUN := CodigoFUN;
    end;
  end
  else
  //
  begin
    with Item_Pedido_Venda1 do
    Begin
      Close;
      SQL.Text := 'SELECT * FROM ITEM_DE_PEDIDO_DE_VENDA '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
        ' AND PDV_CODIGO='+IntToStr(CdPDV)+
        ' ORDER BY IPV_CODIGO ASC ';
      Open;
      CdFUN := CodigoFUN;
    end;
  end;

  //Carrega Cliente
  with Cliente1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CLIENTE '+
      ' WHERE CNC_CODIGO='+IntToStr(iCdCNCCli)+
      ' AND CLI_CODIGO='+IntToStr(CdCLI);
    Open;
  end;

  if rdgCupom.Checked then
  Begin
    try
      if DMFB.PAF_Conectar then
      begin
        DMFB.PAF_SalvaDAV(CdCNC, CdPDV);
        if Application.MessageBox(PChar(#13+#13+'Aten��o: '+#13+#13+#13+
                                  'Utilize o c�digo de or�amento ' +inttostr(CdPDV) + ' para importar os itens informados no pedido,'+#13+
                                  'Siga as instru��es para realizar o processo. Deseja emitir o cupom fiscal agora?'+#13+#13+#13),
                                  'PAF-ECF',
                                  MB_YESNO+MB_ICONQUESTION) = id_yes then
          PAF_ExecutaCupomFiscal;
      end;
    finally
      DMFB.PAF_Desconectar;
    end;

   //Altera��o em 02/08/2013
  //N�o imprimir mais cupom fiscal pelo sistema, utilizar o PAF
{
    //Verificar Cliente (Somente LBM e diferente de � Vista e Diferente de Cart�o e Cupom)
    if (DM.Configuracao1.Empresa = empLBM) then
    Begin
      if (DM.Configuracao1.CodigoCliAVista <> Entidade.CodigoCLI) then
      Begin
        if not VerificaCPFCNPJBranco(Cliente1.CPFCGC) then
        Begin
          //if tag = 0 then //Pedido de Venda LBM
            //fmxpedidoLBM.CancelarFatura := True;
          bitConfirmar.Enabled := True;
          Raise Exception.Create('CPF/CNPJ inv�lido!!!!');
        end;
        if Cliente1.SPC = 1 then
        Begin
          //if tag = 0 then //Pedido de Venda LBM
            //fmxpedidoLBM.CancelarFatura := True;
          bitConfirmar.Enabled := True;
          Raise Exception.Create('Cliente no SPC!!!!');
        end;
        with Titulo_receber1 do
        Begin
          Close;
          ParamByName('CNC_CLIENTE').asInteger:=iCdCNCCli;
          ParamByName('CLI_CODIGO').asInteger:=CdCLI;
          ParamByName('DATA').asDate:=DM.Configuracao1.Data;
          Open;
        end;
        with Informacoes1 do
        Begin
          Close;
          ParamByName('CNC_CODIGO').asInteger:=iCdCNCCli;
          ParamByName('CLI_CODIGO').asInteger:=CdCLI;
          Open;
        end;
        if (CdFPG <> 1) and (CdTipoPag <> 13) then
        Begin
          if not Informacoes1.IsEmpty then
          Begin
            if ((Informacoes1.LimiteCredito-Informacoes1.CreditoUtil)<0) then
            Begin
              //if tag = 0 then //Pedido de Venda LBM
                //fmxpedidoLBM.CancelarFatura := True;
              bitConfirmar.Enabled := True;
              Raise Exception.Create('Limite de Cr�dito Ultrapassado!');
            end
            else if ((Informacoes1.DataAlterado) <
                    (incMonth(DM.Configuracao1.Data,-6))) then
            Begin
              Titulo_receber3.Close; //Verificar T�tulos alterados a mais de 6 meses
              Titulo_receber3.ParamByName('CNC_CLIENTE').asInteger := iCdCNCCli;
              Titulo_receber3.ParamByName('CLI_CODIGO').asInteger := CdCLI;
              Titulo_receber3.Open;
              if Titulo_receber3.DataAlterado < incMonth(DM.Configuracao1.Data,-6) then
              Begin
                //if tag = 0 then //Pedido de Venda LBM
                  //fmxpedidoLBM.CancelarFatura := True;
                bitConfirmar.Enabled := True;
                Raise Exception.Create('Inf. de Cr�dto com mais de 6 meses!');
              end;
            end;
          end
          else
          Begin
            //if tag = 0 then //Pedido de Venda LBM
              //fmxpedidoLBM.CancelarFatura := True;
            bitConfirmar.Enabled := True;
            Raise Exception.Create('Cliente sem Limite de cr�dito!');
          end;
        end;
        if Informacoes1.Proibido then
        Begin
          //if tag = 0 then //Pedido de Venda LBM
            //fmxpedidoLBM.CancelarFatura := True;
          bitConfirmar.Enabled := True;
          Raise Exception.Create('Cliente Bloqueado!'+#13+'Procure a ger�ncia!');
        end;
        if (not Titulo_receber1.IsEmpty) and (rdgCupom.Checked) then
        Begin
          if MessageDlg('Cliente Inadiplente !!!'+#13+
              'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Begin
            bitConfirmar.Enabled := True;
            exit;
          end;
          If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0) and
             (not Lib3790) then
          Begin
            Application.CreateForm(TDigitaSenha, DigitaSenha);
            With DigitaSenha do
            Begin
              onClose:=nil;
              Tag:=27;
              Cancelar:=False;
              Showmodal;
              If not cancelar Then
              Begin
                if (Usuario1.Permissoes.IndexOf(IntToStr(3790)) < 0)then
                begin
                  free;
                  //if tag = 0 then //Pedido de Venda LBM
                    //fmxpedidoLBM.CancelarFatura := True;
                  bitConfirmar.Enabled := True;
                  raise Exception.Create('O usu�rio n�o tem permiss�o para vender a Cliente Inadiplente!');
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
                bitConfirmar.Enabled := True;
                exit;
              end;
              free;
            End;
          end;
        end;

        //Verificar se a Entrada � menor que a M�dia das presta��es
        with Titulo_receber2 do
        Begin
          Close;
          SQL.Text := 'SELECT AVG(TRC_VALOR) as Media '+
            ' FROM TITULO_A_RECEBER '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
            ' AND PDV_CODIGO='+IntToStr(CdPDV);
          Open;
          if (FieldByName('MEDIA').asFloat > Entrada) and
             (Entrada > 0) then
          Begin
            if MessageDlg('Entrada menor que a presta��o !!!'+#13+
                'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Begin
              bitConfirmar.Enabled := True;
              exit;
            end;
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3830)) < 0) AND
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
               (not Lib3830) and (not Lib3540) then
            Begin
              Application.CreateForm(TDigitaSenha, DigitaSenha);
              With DigitaSenha do
              Begin
                onClose:=nil;
                Tag:=27;
                Cancelar:=False;
                Showmodal;
                If not cancelar Then
                Begin
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3830)) < 0) AND
                     (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
                  begin
                    free;
                    //if tag = 0 then //Pedido de Venda LBM
                      //fmxpedidoLBM.CancelarFatura := True;
                    bitConfirmar.Enabled := True;
                    raise Exception.Create('O usu�rio n�o tem permiss�o para faturar com Entrada menor que a presta��o!');
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
                Begin
                  free;
                  bitConfirmar.Enabled := True;
                  exit;
                end;
                free;
              End;
            end;
          end;
        end;
      end;
    end;

    //Verifica Impressora Fiscal
    (*
    Linhas := DM.ImpFiscalB1.MonitoramentoPapel;
    if not DM.ImpFiscalB1.Analisa_iRetorno then
    Begin
      ShowMessage('Falha de Comunica��o com a impressora!');
      Exit;
    end;

    case DM.ImpFiscalB1.Retorno_Impressora of
      -1: Begin
            bitConfirmar.Enabled := True;
            Exit;
          end;
       0: Begin
            if DM.Configuracao1.Empresa = empLBM then
            Begin
              DM.Caixa1.Close;
              DM.Caixa1.ParamByName('CAX_CODIGO').asInteger := DM.Configuracao1.CodigoCAX;
              DM.Caixa1.Open;
              DM.Mensagem3.Inserir(DM.Configuracao1.CodigoCNC,0,CaixaCNC,DM.Caixa1.CodigoFUN,1,0,'Final da Bobina Fiscal',
                'Maquina '+IntToStr(DM.Usuario1.Maquina)+'. Impressas '+IntToStr(Linhas)+' linhas em baixa.');
              ShowMessage('O Papel est� acabando!'+#13+#13+'Linhas Impressas em Baixa: '+PreencheZero(5,Linhas));
              ShowMessage('Informe ao caixa sobre o final da Bobina!');
              bitConfirmar.Enabled := True;
              Exit;
            end;
          end;
    end;
    DM.ImpFiscalB1.LimpaItens;
    *)

    vDesc_Bonificacao := 0;
    With Item_Pedido_Venda1 do  //A consulta filtra os com V�nvulo < 0
    Begin
      First;
      NumeroItemNota:=1;
      While not EOF do
      Begin
        with DM.Produto1 do
        Begin
          Close;
          ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
          Open;
        end;

        if (DM.Configuracao1.Empresa = empLBM) then
        Begin
          DM.Descontos1.Close;
          DM.Descontos1.SQL.Text:='SELECT * FROM DESCONTOS '+
            ' WHERE PRD_CODIGO='+IntToStr(DM.Produto1.CodigoPRD);
          DM.Descontos1.Open;
          if DM.Descontos1.IsEmpty then
          Begin
            DM.Descontos1.Close;
            DM.Descontos1.SQL.Text:='SELECT * FROM DESCONTOS '+
              ' WHERE GRP_CODIGO='+IntToStr(DM.Produto1.CodigoGRP)+
              ' AND FOR_CODIGO='+IntToStr(DM.Produto1.CodigoFOR)+
              ' AND (PRD_CODIGO=0 OR PRD_CODIGO IS NULL)';
            DM.Descontos1.Open;
          end;
          if DM.Descontos1.IsEmpty then
          Begin
            DM.Descontos1.Close;
            DM.Descontos1.SQL.Text:='SELECT * FROM DESCONTOS '+
              ' WHERE FOR_CODIGO='+IntToStr(DM.Produto1.CodigoFOR)+
              ' AND (GRP_CODIGO=0 OR GRP_CODIGO IS NULL)'+
              ' AND (PRD_CODIGO=0 OR PRD_CODIGO IS NULL)';
            DM.Descontos1.Open;
          end;

          if (Pendencia > 1) then
          Begin
            If MessageDlg('Produto '+Trim(DM.Produto1.Descricao+' '+DM.Produto1.Referencia)+#13+
                'Sem estoque !!!'+#13+
                'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Begin
              bitConfirmar.Enabled := True;
              Exit;
            end;
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3820)) < 0) and
               (not Lib3820) then
            Begin
              Application.CreateForm(TDigitaSenha, DigitaSenha);
              With DigitaSenha do
              Begin
                onClose:=nil;
                Tag:=27;
                Cancelar:=False;
                Showmodal;
                If not cancelar Then
                Begin
                  if Usuario1.Permissoes.IndexOf(IntToStr(3820)) < 0 then
                  begin
                    free;
                    //if tag = 0 then //Pedido de Venda LBM
                      //fmxpedidoLBM.CancelarFatura := True;
                    bitConfirmar.Enabled := True;
                    raise Exception.Create('O usu�rio n�o tem permiss�o para venda sem estoque!');
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
                  bitConfirmar.Enabled := True;
                  exit;
                end;
                free;
              End;
            end;
          end;

          if (Arredonda(PrecoDesc) < Arredonda(DM.Produto1.Precomedio)) then
          Begin
            If MessageDlg('Produto '+Trim(DM.Produto1.Descricao+' '+DM.Produto1.Referencia)+#13+
                  'Pre�o R$'+format('%.2f',[PrecoDesc-DM.Produto1.Precomedio])+
                  ' abaixo do m�nimo !!!'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Begin
              bitConfirmar.Enabled := True;
              Exit;
            end;
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
               (not Lib3540) and (not Lib3740) then
            Begin
              Application.CreateForm(TDigitaSenha, DigitaSenha);
              With DigitaSenha do
              Begin
                onClose:=nil;
                Tag:=27;
                Cancelar:=False;
                Showmodal;
                If not cancelar Then
                Begin
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) AND
                     (Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) then
                  begin
                    free;
                    //if tag = 0 then //Pedido de Venda LBM
                      //fmxpedidoLBM.CancelarFatura := True;
                    bitConfirmar.Enabled := True;
                    raise Exception.Create('O usu�rio n�o tem permiss�o para venda com Pre�o abaixo do M�nimo!');
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
                  bitConfirmar.Enabled := True;
                  exit;
                end;
                free;
              End;
            end;
          End;

          // Verifica se o usu�rio tem permiss�o para liberar desconto
          if (Arredonda(PrecoDesc)<Arredonda(PrecoSugerido)) and
             ((100-(Arredonda(PrecoDesc)/Arredonda(PrecoSugerido)*100))<DM.Descontos1.DescontoGerente) then
          Begin
            If MessageDlg('Produto '+DM.Produto1.Descricao+' '+DM.Produto1.Referencia+#13+
                  'Pre�o R$'+format('%.2f',[Arredonda(PrecoDesc)-Arredonda(DM.Produto1.Precomedio)])+#13+
                  'Abaixo do Sugerido ('+
                  format('%.4f',[100-Arredonda(PrecoDesc)/Arredonda(PrecoSugerido)*100])+' %) !!!'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Begin
              bitConfirmar.Enabled := True;
              Exit;
            end;
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3930)) < 0) AND
               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
               (not Lib3930) and (not Lib3540) then
            Begin
              Application.CreateForm(TDigitaSenha, DigitaSenha);
              With DigitaSenha do
              Begin
                onClose:=nil;
                Tag:=27;
                Cancelar:=False;
                Showmodal;
                If not cancelar Then
                Begin
                  if (Usuario1.Permissoes.IndexOf(IntToStr(3930)) < 0) AND
                     (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
                  begin
                    free;
                    //if tag = 0 then //Pedido de Venda LBM
                      //fmxpedidoLBM.CancelarFatura := True;
                    bitConfirmar.Enabled := True;
                    raise Exception.Create('O usu�rio n�o tem permiss�o para liberar o desconto!');
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
                  bitConfirmar.Enabled := True;
                  exit;
                end;
                free;
              End;
            end;
          end
          //Pre�o abaixo do sugerido de forma que o gerente n�o tem permiss�o
          else if (Arredonda(PrecoDesc)<Arredonda(PrecoSugerido)) then
          Begin
            If MessageDlg('Produto '+Trim(DM.Produto1.Descricao+' '+DM.Produto1.Referencia)+#13+
                  'Pre�o R$'+format('%.2f',[Arredonda(PrecoDesc)-Arredonda(DM.Produto1.Precomedio)])+#13+
                  'Abaixo do Sugerido (Gerente) ('+
                  format('%.4f',[100-Arredonda(PrecoDesc)/Arredonda(PrecoSugerido)*100])+' %) !!!'+#13+
                  'Deseja continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            Begin
              bitConfirmar.Enabled := True;
              Exit;
            end;
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
               (not Lib3540) then
            Begin
              Application.CreateForm(TDigitaSenha, DigitaSenha);
              With DigitaSenha do
              Begin
                onClose:=nil;
                Tag:=27;
                Cancelar:=False;
                Showmodal;
                If not cancelar Then
                Begin
                  if Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then
                  begin
                    free;
                    //if tag = 0 then //Pedido de Venda LBM
                      //fmxpedidoLBM.CancelarFatura := True;
                    bitConfirmar.Enabled := True;
                    raise Exception.Create('O usu�rio n�o tem permiss�o para liberar o desconto!');
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
                  bitConfirmar.Enabled := True;
                  exit;
                end;
                free;
              End;
            end;
          end;
        end;

        //Definir Pre�o de Servi�o
        if (DM.Configuracao1.Empresa = empLBM) and (ckbServico.Checked) then
        Begin
          PrecoUnitNota := Arredonda(PrecoDesc * 0.60);
          vTotalISS := vTotalISS + Arredonda(Quantidade*
            Arredonda(PrecoDesc-PrecoUnitNota)*DM.Configuracao1.AliquotaISS/100);
          vTotalServico := vTotalServico + Arredonda(Quantidade*
            Arredonda(PrecoDesc-PrecoUnitNota));
          vTotalServicoLBM := vTotalServicoLBM + Arredonda(Quantidade*
            Arredonda(PrecoDesc-PrecoUnitNota));
          vTotalNota := vTotalNota + Arredonda((Quantidade-Bonificacao)*
            Arredonda(PrecoDesc-PrecoUnitNota));
        end
        else
          //Alan 05-05-06 colocar no cupom o preco de venda
          if (DM.Configuracao1.Empresa = empLuciano) then
          begin
            if (ckbCupomEsp.Checked) then
                PrecoUnitNota := Arredonda(PrecoSugerido)
            else
              if Item_Pedido_Venda1.FieldByName('IPV_DESCONTO').AsFloat > 0 then
                PrecoUnitNota := Arredonda(PrecoSugerido)
              else
                PrecoUnitNota := Arredonda(PrecoDesc);
          end
          else
            if ReducaoEletro and (DM.Produto1.Precocompra > 0) then
              PrecoUnitNota := Arredonda(DM.Produto1.Precocompra*1.25)  //Pre�o de Compra + 25%
            else
                PrecoUnitNota := Arredonda(PrecoDesc);

        if Bonificacao > 0 then
          vDesc_Bonificacao := vDesc_Bonificacao + Arredonda(Bonificacao*Arredonda(PrecoUnitNota));

        vQuantidade := Quantidade;  //Na quantidade j� est� inclu�do a bonifica��o
        ValorItem  := Arredonda(PrecoUnitNota);

        if DM.Produto1.Servico then
        Begin
          vAliquota := DM.Configuracao1.AliquotaISS;
          vTotalISS := vTotalISS + Arredonda((Quantidade-Bonificacao)*
            ValorItem*vAliquota/100);
          vTotalServico := vTotalServico + Arredonda((Quantidade-Bonificacao)*ValorItem);
        end
        else
          if (DM.Configuracao1.Empresa = empLuciano) then
          begin
            vAliquota := DM.Produto1.FieldByName('Aliquota').asFloat;

            if not (ckbCupomEsp.Checked) then
            begin
              //if (Item_Pedido_Venda1.FieldByName('IPV_DESCONTO').AsFloat > 0) then
                vTotalICMS := vTotalICMS + Arredonda((Quantidade-Bonificacao)*
                  PrecoDesc*vAliquota/100)
              (*else
                vTotalICMS := vTotalICMS + Arredonda((Quantidade-Bonificacao)*
                  ValorItem*vAliquota/100);*)
            end
            else
              vTotalICMS := vTotalICMS + Arredonda((Quantidade-Bonificacao)*
                  (ValorItem-(ValorItem*30/100))*vAliquota/100);

           //vTotalICMS := vTotalICMS + Arredonda((Quantidade-Bonificacao)*ValorItem*vAliquota/100);
           //vTotalProduto := vTotalProduto + Arredonda((Quantidade-Bonificacao)*
           //   (ValorItem-(ValorItem*Item_Pedido_Venda1.FieldByName('IPV_DESCONTO').AsFloat/100)));
          end
          else
          begin
            vAliquota := DM.Produto1.FieldByName('Aliquota').asFloat;
            vTotalICMS := vTotalICMS + Arredonda((Quantidade-Bonificacao)*
              ValorItem*vAliquota/100);
            vTotalProduto := vTotalProduto +Arredonda((Quantidade-Bonificacao)*ValorItem);
          end;

        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_NOTA=1 '+
          ',IPV_ITEMNOTA='+IntToStr(NumeroItemNota)+
          ',IPV_PRECO_NOTA='+VirgPonto(ValorItem)+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND IPV_CODIGO='+IntToStr(CodigoIPV));

        NumeroItemNota:=NumeroItemNota+1;
        //Tem que deduzir a Bonifica��o
        vTotalNota:=vTotalNota+Arredonda((Quantidade-Bonificacao)*ValorItem);
        next;
      End;
    End;

    mensagem:='';
    TAM:='';
    for i:=1 to 40-Length(Trim(Cliente1.RazaoSocial)) do
      TAM:=TAM+' ';
    mensagem:=mensagem+PreencheEspaco(48,PreencheZero(5,Cliente1.CodigoCLI)+' - '+
              Trim(Cliente1.RazaoSocial)+TAM);

    mensagem:=mensagem+PreencheEspaco(48,'Fone: '+Trim(Cliente1.Fone));

    mensagem:=mensagem+PreencheEspaco(48,Cliente1.Endereco+TAM);

    TAM:='';
    for i:=1 to 48-Length(Trim(Cliente1.Bairro)+'CEP:'+Trim(Cliente1.CEP)) do
      TAM:=TAM+' ';
    mensagem:=mensagem+PreencheEspaco(48,Trim(Cliente1.Bairro)+TAM+'CEP:'+Trim(Cliente1.CEP));

    TAM:='';
    for i:=1 to 27-Length(Trim(Cliente1.Cidade)+'UF:'+Trim(Cliente1.UF)) do
      TAM:=TAM+' ';
    mensagem:=mensagem+PreencheEspaco(48,Trim(Cliente1.Cidade)+TAM+'UF:'+Trim(Cliente1.UF)+
      ' PDV:'+PreencheZero(7,CdPDV)+' Ven:'+PreencheZero(4,CdFUN));

    for i:=1 to 48 do
      mensagem := mensagem + '*';

    mensagem:=mensagem+DM.Configuracao1.MensagemCupom;

    //NumeroOficial := DM.ImpFiscalB1.RetornoNumeroCupom;
    NumeroOficial := CdPDV;

    If not Transferencia2.Active then
      Transferencia2.Open;

    if not Item_de_Transferencia2.Active then
      Item_de_Transferencia2.Open;

    //Iniciar a Transa��o
    Trans:=false;
    with DM.Database2 do
    begin
      try
        If DM.Configuracao1.ControleTransacao then
        Begin
          StartTransaction;
          Trans:=True;
        end;

        ExecutaSQL(DM.QR_Comandos,'UPDATE PEDIDO_DE_VENDA SET '+
          ' PDV_LISTADO=1 '+
          ',PDV_NOTA_FISCAL='+IntToStr(NumeroOficial)+
          ',PDV_NOTA_CUPOM=2 '+
          ',PDV_DT_EMISSAO_VENDA="'+Mesdia(DM.Configuracao1.Data)+'" '+
          ',PDV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND PDV_CODIGO='+IntToStr(CdPDV));

        if (DM.Configuracao1.Empresa = 1) and
           (DM.Usuario1.Mafalda <> 1) and
           (DM.Configuracao1.CodigoCNC = 11) and //Dep�sito
           (CdCNC <> 11) then
        Begin
          //Gerar Registro na Tabela de Envia_Dados_Nota
          ExecutaSQL(DM.QR_Comandos,'INSERT INTO ENVIA_DADOS_NOTA '+
            ' (CNC_CODIGO, CDN_CODIGO, CNC_DESTINO, USU_CODIGO, '+
            ' CDN_TIPO, CDN_DT_CADASTRO, PDV_CODIGO, CDN_NOTA_FISCAL, '+
            ' CDN_DT_EMISSAO, CDN_SITUACAO, CDN_OBSERVACAO) VALUES '+
            '( '+IntToStr(DM.Configuracao1.CodigoCNC)+
            ', '+IntToStr(DM.Configuracao1.ProximoCodigo('CDN_CODIGO'))+
            ', '+IntToStr(CdCNC)+ //Centro de Custo do Pedido
            ', '+IntToStr(DM.Configuracao1.CodigoUSU)+
            ',2'+ //Tipo Cupom
            ',"'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ', '+IntToStr(CdPDV)+
            ', '+IntToStr(NumeroOficial)+
            ',"'+MesDia(DM.Configuracao1.Data)+'" '+
            ',0,"")'); //Situa��o e Observa��o
        end;
        i:=1;
        if NumeroOficial <= 0 then
          NumeroOficial := CdPDV;

        with Entidade do
        Begin
          try
            CdArquiteto := StrToInt(FieldByName('FUN_ARQUITETO').asString);
          except
            CdArquiteto := 0;
          end;
          if not NotaFiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,CodigoCNC,CodigoPDV,5102 (*CFOP Venda Cupom*),
              0(*CodigoFOR*),1(*CodigoTRN*),ClienteCNC,CodigoCLI,CdFUN,NumeroOficial,
              0,1,361(*TipoVenda*),0(*TipoTransporte*),0(*TipoFrete*),0(*Selo*),
              2(*Sit*),0(*Conhecimento*),2(*Cupom*),iCodPagamento(*CodPagamento*),
                                          //Alan 10-05-06
              iCodPagamento2,CdArquiteto, vTotalCupom(*vTotalProduto*),vTotalICMS,0(*BaseICMSS*),0(*ICMSS*),
                                       //Alan 10-05-06
              Arredonda(vTotalServico), vTotalCupom(*vTotalProduto*),
                         //Alan 11-05-06
              vTotalCupom(*vTotalNota*)+Acrescimo,0(*IPI*),0(*Frete*),0(*ICMS Frete*),
              0(*Quantidade*),Arredonda(vTotalServico)(*Base ISS*),
              vTotalISS(*ISS*),0(*Outras*),''(*S�rie*),''(*SubS�rie*),OBS ,''(*UF*),
              DM.Configuracao1.Data,DM.Configuracao1.Data) then
          Begin
            bitConfirmar.Enabled := True;
            ShowMessage('Falha ao inserir Nota Fiscal!');
            Raise exception.Create('');
          end;
        end;

        if not self.Pedido_de_Venda1.Active then
          self.Pedido_de_Venda1.Open;

        if (DM.Configuracao1.Empresa = empEletro) and
           (self.Pedido_de_Venda1.EntregaDeposito) and
           (self.Pedido_de_Venda1.CodigoCNC <> 11) and //Pedido feito na Loja
           (DM.Configuracao1.CodigoCNC = 11) then //Dep�sito
        Begin
          if not Transferencia2.Inserir(CentroLocal, 0, self.Item_Pedido_Venda1.RecordCount,
              CentroLocal, self.Pedido_de_Venda1.CodigoCNC,0(*CdFUNOrigem*),0(*CdFUNDestino*),
              'PDV:'+IntToStr(self.Pedido_de_Venda1.CodigoPDV)+' CLI:'+IntToStr(self.Pedido_de_Venda1.CodigoCLI), True, 0(*PCP*), 1(*Processada*), 0(*TipoDoc*), 0(*FormaPag*)) then
          Begin
            ShowMessage('Falha ao gerar Transfer�ncia!');
            raise exception.Create('');
          end;
          iTRFEletro := Transferencia2.SCodigo;
        end;

        with Item_Pedido_Venda1 do
        Begin
          First;
          vTotalServico := 0;
          while not EOF do
          Begin
            EstLocal := 0;
            EstExterno := 0;
            with DM.Produto1 do
            Begin
              Close;
              ParamByName('PRD_CODIGO').asInteger := Item_Pedido_Venda1.CodigoPRD;
              Open;
            end;
            with Item_de_Estoque1 do
            Begin
              Close;
              ParamByName('CNC_CODIGO').asInteger:=CentroLocal;
              ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
              Open;
            end;
            with Item_de_Estoque2 do
            Begin
              Close;
              ParamByName('CNC_CODIGO').asInteger:=CentroExterno;
              ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
              Open;
              if IsEmpty then
              Begin
                if not Inserir(CentroExterno,Item_Pedido_Venda1.CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                    DM.Configuracao1.DataHora,0,0,0,0,0,0) then
                Begin
                  bitConfirmar.Enabled := True;
                  ShowMessage('Falha ao inserir Item de Estoque externo ('+IntToStr(CentroExterno)+')!');
                  Raise exception.Create('');
                end;
                Close;
                ParamByName('CNC_CODIGO').asInteger:=CentroExterno;
                ParamByName('PRD_CODIGO').asInteger:=Item_Pedido_Venda1.CodigoPRD;
                Open;
              end;
            end;

            if DM.Produto1.Servico then
              vTotalServico := vTotalServico + Arredonda(PrecoDesc)
            else
            Begin
              //Definir Pre�o de Servi�o
              if (DM.Configuracao1.Empresa = empLBM) and (ckbServico.Checked) then
              Begin
                PrecoUnitNota := Arredonda(PrecoDesc * 0.60);
                vTotalServicoLBM := vTotalServicoLBM + Arredonda(Quantidade*Arredonda(PrecoDesc-PrecoUnitNota));
                vTotalServico := vTotalServico + Arredonda(Quantidade*Arredonda(PrecoDesc-PrecoUnitNota));
              end
              else
                //Alan 05-05-06 pq no cupom � colocado o preco de venda cheio
                if (DM.Configuracao1.Empresa = empLuciano) and (DM.Produto1.Precovenda > 0) then
                begin
                  if (ckbCupomEsp.Checked) then
                  begin
                    PrecoUnitNota := Arredonda(PrecoSugerido)
                  end
                  else
                    if Item_Pedido_Venda1.FieldByName('IPV_DESCONTO').AsFloat > 0 then
                      PrecoUnitNota := Arredonda(PrecoSugerido)
                    else
                      PrecoUnitNota := Arredonda(PrecoDesc);
                end
                else
                  if ReducaoEletro and (DM.Produto1.Precocompra > 0) then
                    PrecoUnitNota := Arredonda(DM.Produto1.Precocompra*1.25)  //Pre�o de Compra + 25%
                  else
                    if (ckbCupomEsp.Checked) and (DM.Produto1.Precocompra > 0) then
                      PrecoUnitNota := Arredonda(DM.Produto1.Precocompra*1.80)  //Pre�o de Compra + 80%
                    else
                      PrecoUnitNota := Arredonda(PrecoDesc);

              //Preco do produto - 30%
              if (ckbCupomEsp.Checked) then
              begin
                if not Item_Nota_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,NotaFiscal1.SCodigo,
                    CodigoPRD,CodigoLOT,0(*TipoAliquota*),17(*AliquotaICMS*),0(*AliquotaISS*),
                    Quantidade,PrecoUnitNota,(Quantidade*PrecoUnitNota*30/100)(*DescontoUnit�rio*),0(*AliquotaIPI*),
                    Bonificacao,0(*Amostra*),DM.Produto1.Descricao) then
                Begin
                  bitConfirmar.Enabled := True;
                  ShowMessage('Falha ao inserir Item de Nota Fiscal!');
                  Raise exception.Create('');
                end;
              end
              else
              begin
                if (Item_Pedido_Venda1.FieldByName('IPV_DESCONTO').AsFloat > 0 ) then
                begin
                  if not Item_Nota_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,NotaFiscal1.SCodigo,
                      CodigoPRD,CodigoLOT,0(*TipoAliquota*),17(*AliquotaICMS*),0(*AliquotaISS*),
                      Quantidade,PrecoUnitNota,(Quantidade*PrecoUnitNota*Item_Pedido_Venda1.FieldByName('IPV_DESCONTO').AsFloat/100)(*DescontoUnit�rio*),0(*AliquotaIPI*),
                      Bonificacao,0(*Amostra*),DM.Produto1.Descricao) then
                  Begin
                    bitConfirmar.Enabled := True;
                    ShowMessage('Falha ao inserir Item de Nota Fiscal!');
                    Raise exception.Create('');
                  end;
                end
                else
                begin
                  if not Item_Nota_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC,0,NotaFiscal1.SCodigo,
                      CodigoPRD,CodigoLOT,0(*TipoAliquota*),17(*AliquotaICMS*),0(*AliquotaISS*), //
                      Quantidade,PrecoUnitNota,0(*DescontoUnit�rio*),0(*AliquotaIPI*),
                      Bonificacao,0(*Amostra*),DM.Produto1.Descricao) then
                  Begin
                    bitConfirmar.Enabled := True;
                    ShowMessage('Falha ao inserir Item de Nota Fiscal!');
                    Raise exception.Create('');
                  end;
                end;
              end;
            end;

            if (DM.Configuracao1.Empresa = empLBM) then
            Begin
              QuantidadeVendida := Quantidade;
              if QuantidadeVendida <= Item_de_Estoque1.SFiscal then
              Begin
                EstLocal := QuantidadeVendida;
                QuantidadeVendida := 0;
              end
              else if Item_de_Estoque1.SFiscal > 0 then
              Begin
                EstLocal := Item_de_Estoque1.SFiscal;
                QuantidadeVendida := QuantidadeVendida - Item_de_Estoque1.SFiscal;
              end;

              if (QuantidadeVendida > 0) and
                 (QuantidadeVendida <= Item_de_Estoque2.SFiscal) then
              Begin
                EstExterno := QuantidadeVendida;
                QuantidadeVendida := 0;
              end
              else if (QuantidadeVendida > 0) and (Item_de_Estoque1.SFiscal > 0) then
              Begin
                EstExterno := Item_de_Estoque2.SFiscal;
                QuantidadeVendida := QuantidadeVendida - Item_de_Estoque2.SFiscal;
              end;

              if (QuantidadeVendida > 0) and (DM.Configuracao1.CodigoCNC = 1) then
                EstExterno := EstExterno + QuantidadeVendida
              else
                EstLocal := EstLocal + QuantidadeVendida;
            end
            else
            Begin
              EstLocal := Quantidade;
              EstExterno := 0;
            end;

            if (EstExterno > 0) and
               (not DM.Produto1.Servico) then
            Begin
              //Criar a transfer�ncia Autom�tica
              Item_de_Transferencia1.Close;
              Transferencia1.Close;
              Transferencia1.ParamByName('CNC_CODIGO').asInteger:=CentroExterno;
              Transferencia1.ParamByName('INI').asDate:=DM.Configuracao1.Data;
              Transferencia1.ParamByName('FIM').asDate:=DM.Configuracao1.Data+1;
              Transferencia1.Open;
              if Transferencia1.IsEmpty then
              Begin
                if not Transferencia2.Inserir(CentroExterno,0,0,
                    CentroExterno,DM.Configuracao1.CodigoCNC,0(*CdFUNOrigem*),
                    0(*CdFUNDestino*), '',True(*Aut.*), 0(*PCP*), 0(*Sit*),
                    0(*TipoDoc*), 0(*FormaPag*)) then
                Begin
                  bitConfirmar.Enabled := True;
                  ShowMessage('Falha ao inserir Transfer�ncia!');
                  Raise exception.Create('');
                end;
                Transferencia1.Close;
                Transferencia1.ParamByName('CNC_CODIGO').asInteger:=CentroExterno;
                Transferencia1.ParamByName('INI').asDate:=DM.Configuracao1.Data;
                Transferencia1.ParamByName('FIM').asDate:=DM.Configuracao1.Data+1;
                Transferencia1.Open;
              end;
              Item_de_Transferencia1.Open;
              if Item_de_Transferencia1.LocalizarProd(CentroExterno,Transferencia1.CodigoTRF,CodigoPRD) then
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_TRANSFERENCIA SET '+
                  ' ITR_QUANTIDADE=ITR_QUANTIDADE+'+VirgPonto(EstExterno)+
                  ' WHERE CNC_CODIGO='+IntToStr(CentroExterno)+
                  ' AND ITR_CODIGO='+IntToStr(Item_de_Transferencia1.CodigoITR))
              else
              Begin
                if not Item_de_Transferencia2.Inserir(CentroExterno,0,Transferencia1.CodigoTRF,
                  CodigoPRD,CodigoLOT,EstExterno,0) then
                Begin
                  bitConfirmar.Enabled := True;
                  ShowMessage('Falha ao inserir Item de Transfer�ncia!');
                  Raise exception.Create('');
                end;
              end;
            end;


            if (EstLocal > 0) then
            Begin
              // Tipo de Entrada 13: Mov. de Sa�da Fiscal; Tipo de Movimento 361: Venda
              if not DM.Mov_Est_Fiscal1.Inserir(CentroLocal,CodigoPRD,0(*CdFUN*),0,
                 CdCNC,NumeroOficial,361,'S', EstLocal,
                 Item_de_Estoque1.SFiscal,
                 Item_de_Estoque1.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque1.SBonificacaoFiscal, 0(*BonusFiscal*)) then
              Begin
                bitConfirmar.Enabled := True;
                ShowMessage('Falha ao inserir Movimento Fiscal!');
                Raise  exception.Create('');
              end;

              if (DM.Configuracao1.Empresa = empEletro) and
                 (Pedido_de_Venda1.EntregaDeposito) and
                 (Pedido_de_Venda1.CodigoCNC <> 11) and //Pedido feito na Loja
                 (DM.Configuracao1.CodigoCNC = 11) then //Dep�sito
              Begin
                if not Item_de_Transferencia2.Active then
                  Item_de_Transferencia2.Open;
                if not Item_de_Transferencia2.Inserir(CentroLocal,0,iTRFEletro,
                  CodigoPRD,CodigoLOT,Quantidade,0) then
                Begin
                  ShowMessage('Falha ao gerar Item de Transfer�ncia!');
                  raise exception.Create('');
                end;

                //Movimento Comercial
                if not DM.Movimento_Estoque_Comercial1.Inserir(CentroLocal,0,CodigoPRD,0(*CdFUN*),
                  361,CodigoCNC,NumeroOficial, 'S',Quantidade,
                  Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                  Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, Bonificacao) then
                Begin
                  ShowMessage('Falha ao gerar Mov. Estoque Comercial!');
                  raise exception.Create('');
                end;
                //Movimento F�sico
                if not DM.Movimento_Fisico1.Inserir(CentroLocal,0,CodigoPRD,0(*CdFUN*),
                  CodigoCNC,NumeroOficial,361,
                  'S',Quantidade, Item_de_Estoque1.SFisico) then
                Begin
                  ShowMessage('Falha ao gerar Mov. Estoque F�sico!');
                  raise exception.Create('');
                end;
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                    ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
                    ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
                    ',IES_SBONIFICACAO=IES_SBONIFICACAO-'+VirgPonto(Bonificacao)+
                    ',IES_SFISCAL=IES_SFISCAL-'+VirgPonto(Quantidade)+
                    ',IES_SBONIFICACAO_FISCAL=IES_SBONIFICACAO_FISCAL-'+VirgPonto(Bonificacao)+
                    ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                    ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                    ' AND CNC_CODIGO='+IntToStr(CentroLocal));
              end
              else
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SFISCAL=IES_SFISCAL-'+VirgPonto(EstLocal)+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CentroLocal));
            end;

            if (EstExterno > 0) then
            Begin
              if not DM.Mov_Est_Fiscal1.Inserir(CentroExterno,CodigoPRD,0(*CdFUN*),0,
                 CdCNC,NumeroOficial,361,'S', EstExterno,
                 Item_de_Estoque2.SFiscal,
                 Item_de_Estoque2.SAmostraFiscal, 0(*AmostraFiscal*), Item_de_Estoque2.SBonificacaoFiscal, 0(*BonusFiscal*)) then
              Begin
                bitConfirmar.Enabled := True;
                ShowMessage('Falha ao inserir Movimento Fiscal!');
                Raise exception.Create('');
              end;
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SFISCAL=IES_SFISCAL-'+VirgPonto(EstExterno)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE PRD_CODIGO='+IntToStr(CodigoPRD)+
                ' AND CNC_CODIGO='+IntToStr(CentroExterno));
            end;
            Next;
          end;
          if (vTotalServicoLBM > 0) then
          Begin
            if not Item_Nota_Fiscal1.Inserir(DM.Configuracao1.CodigoCNC, 0, NotaFiscal1.SCodigo,
                0(*CodigoPRD*),0(*CodigoLOT*),0(*TipoAliquota*),0(*AliquotaICMS*),DM.Configuracao1.AliquotaISS,
                1(*Quantidade*), Arredonda(vTotalServico), 0, 0(*AliquotaIPI*),0(*Bonifica��o*),0(*Amostra*),
                'PROJETO,MONTAGEM') then
            Begin
              bitConfirmar.Enabled := True;
              ShowMessage('Falha ao inserir item da Nota!');
              Raise exception.Create('');
            end;
          end;
        end;
        // Identifica servi�o
        // Numero da Nota ao inv�s do N�mero do Pedido
        sFiltrarTitulo := ' AND TRC_SITUACAO=0 '; //Somente em Aberto
        if DM.Configuracao1.Empresa = empLBM then
        Begin
          with Titulo_receber5 do
          Begin
            Close;
            ParamByName('PDV_CODIGO').asInteger:=CdPDV;
            Open;
            if not IsEmpty then
            Begin
              //Como � Cupom a data de emiss�o � hoje
              if Trunc(Pagamento) >= Trunc(DM.Configuracao1.Data) then
              Begin
                sFiltrarTitulo := '';
                while not EOF do
                Begin
                  if GerouMovimento then
                    //Mudar CCX_CODIGO,TIT_NUMERO do movimento de caixa
                    ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_CAIXA SET '+
                      ' MVC_TIT_NUMERO="'+IntToStr(NumeroOficial)+'" '+
                      ',CCX_CODIGO=CCX_CODIGO_REC '+
                      ' WHERE MVC_FLAG="1" '+
                      ' AND TIT_CODIGO='+IntToStr(CodigoTRC));
                  Next;
                end;
              end;
            end;
          end;
        end;

        if DM.Configuracao1.Empresa <> empLBM then
          FiltrarCentro := ' AND CNC_CODIGO='+IntToStr(CdCNC)+' '
        else
          FiltrarCentro := '';

        if (DM.Configuracao1.Empresa = empLBM) and ckbServico.Checked then
          ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
            ' TRC_NUMERO="'+IntToStr(NumeroOficial)+'" '+
            ',TRC_NOTA_SERVICO=1 '+
            ',CCX_CODIGO=CCX_CODIGO_REC '+
            ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
            FiltrarCentro+sFiltrarTitulo)
        else
          ExecutaSQL(DM.QR_Comandos,'UPDATE TITULO_A_RECEBER SET '+
            ' TRC_NUMERO="'+IntToStr(NumeroOficial)+'" '+
            ',CCX_CODIGO=CCX_CODIGO_REC '+
            ',TRC_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE PDV_CODIGO='+IntToStr(CdPDV)+
            FiltrarCentro+sFiltrarTitulo);

        If DM.Configuracao1.ControleTransacao then
          Commit;
      except
        If DM.Configuracao1.ControleTransacao then
          if trans then
          Begin
            RollBack;
            ShowMessage('Os dados n�o foram salvos! Anote os c�digos e ligue para o suporte');
          end;
      end;
    End;
//////////////////////////TODO//////////////////////////
}
  end
  else //Nota Fiscal
  Begin
    if (not VerificaCPFCNPJBranco(Cliente1.CPFCGC)) and
       (not ckbManual.Checked) then
    Begin
      bitConfirmar.Enabled := True;
      ShowMessage('Cliente com CPF/CNPJ inv�lido!');
      Exit;
    end;
    Application.CreateForm(TfMxNotaFiscal, fMxNotaFiscal);
    with fMxNotaFiscal do
    Begin
      HelpContext:=6500;
      if (self.Tag = 5) or
         (self.Entidade.CodigoPacote > 0) then //Pedido Motical Remessa
        tag := 4
      else
        tag := 1;
      ShowModal;
    end;
  end;
  if Lib3790 AND Lib3540 AND Lib3830 AND Lib3740 AND Lib3820 AND Lib3930 AND
     Lib6230 AND Lib6240 AND
     (DM.Configuracao1.CodigoUSU = -10) then //Somente para tirar mensagem
    ShowMessage('');


  if tag = 0 then //Pedido de Venda LBM
    //fmxpedidoLBM.CancelarFatura := False
  else if tag = 1 then
    fMxPedidoRapido.CancelarFatura := False
//  else if tag = 2 then
//    fMxPedidoRapido.CancelarFatura := False;
  else if tag in [3,5] then
    fMxPedidoMotCal.CancelarFatura := False
  else if tag = 4 then
    fMxServico.CancelarFatura := False
  else if tag = 6 then
    fMxServicoLBM.CancelarFatura := False
  else if tag in [7,8] then
    fMxPedidoMotCal_2.CancelarFatura := False;

  Close;
end;

procedure TfMxSNotaCupom.FormCreate(Sender: TObject);
begin
  CdCNC    := 0;
  CdPDV    := 0;
  iCdCNCCli := 0;
  CdCLI    := 0;
  CdFPG    := 0;
  CdFUN    := 0;
  CdTipoPag:= 0;
  Entrada  := 0;
  CNPJ_CPF := '';
  SimpRemessa := False;
  Entidade := Pedido_de_Venda1;
  ReducaoEletro := False;
end;

procedure TfMxSNotaCupom.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if (DM.Configuracao1.Empresa <> empLBM) or
     (DM.Configuracao1.CodigoCNC = 3) then
  Begin
    ckbServico.Visible := False;
    ckbServico.Enabled := False;
    if (DM.Configuracao1.Empresa = empMotical) or
       ((DM.Configuracao1.Empresa = empEletro) and
        (DM.Configuracao1.CodigoCNC = 11)) then //Dep�sito
    Begin
      ckbManual.Checked := False;
      ckbManual.Enabled := False;
    end;
  end
  else
  Begin
    ckbServico.Checked := True;
    ckbManual.Checked := False;
    ckbManual.Enabled := False;
  end;
end;

procedure TfMxSNotaCupom.ckbCupomEspClick(Sender: TObject);
begin
  with qrConsultas do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= 'SELECT IPV_DESCONTO FROM ITEM_DE_PEDIDO_DE_VENDA IPV'+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND IPV_FISCAL=1'+
      ' AND PDV_CODIGO='+IntToStr(CdPDV);
    Open;
  end;

  while not (qrConsultas.Eof) do
  begin
    if (qrConsultas.Fields[0].AsFloat <> 0) then
    begin
      ckbCupomEsp.Checked := False;
      Application.MessageBox('N�o � possivel imprimir o cupom especial!!!', 'Informa��o', MB_OK + MB_ICONINFORMATION);
      Break;
    end;
    
    qrConsultas.Next;
  end;
end;

end.
