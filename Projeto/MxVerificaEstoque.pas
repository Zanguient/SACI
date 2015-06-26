unit MxVerificaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, StdCtrls, Gauges, ExtCtrls, SQuery, Custo,
  Pedido_de_Compra, Mov_Est_Fiscal, Movimento_Fisico, Movimento_Estoque_SN,
  Movimento_Estoque_Comercial;

type
  TfMxVerificaEstoque = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Gauge1: TGauge;
    bitConfirmar: TButton;
    bitParar: TButton;
    edtCodigoCNC: TEdit;
    Label2: TLabel;
    edtCodigoPRD: TEdit;
    Label3: TLabel;
    edtTotalVerificado: TEdit;
    Label4: TLabel;
    edtTotalRegistrado: TEdit;
    Label5: TLabel;
    sqlProduto1: TQuery;
    sqlAux: TQuery;
    ckbOficial: TCheckBox;
    bitTabelaCusto: TButton;
    Custo1: TCusto;
    Custo2: TCusto;
    btnMovCompra: TButton;
    Pedido_de_Compra1: TPedido_de_Compra;
    bitMovimentoComercial: TButton;
    bitMovimentoFisico: TButton;
    procedure bitConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitPararClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ckbOficialClick(Sender: TObject);
    procedure bitTabelaCustoClick(Sender: TObject);
    procedure btnMovCompraClick(Sender: TObject);
    procedure bitMovimentoComercialClick(Sender: TObject);
    procedure bitMovimentoFisicoClick(Sender: TObject);
  private
    vParar: Boolean;
  public
    { Public declarations }
  end;

var
  fMxVerificaEstoque: TfMxVerificaEstoque;

implementation
uses Funcoes, UDM;
{$R *.dfm}

procedure TfMxVerificaEstoque.bitConfirmarClick(Sender: TObject);
var
  CdINV, CdPRD: integer;
  vTotalInventario,
    vTotalVendas,
    vTotalRecebimentos, //Compras e Transferências
    vTotalTRFSaida,
    vTotalIndisponivel, //Assistência + Emprestimo
    vTotalAvulsoEntrada, vTotalAvulsoSaida,
    vEstoqueFisico, vEstoqueComercial, vEstoqueFiscal,
    vSaldo,
    vNotasEntrada,vNotasSaida,
    vEstoqueEntrada,vEstoqueSaida: double;
  sCNC_I1, sCNC_I2,sCNC_I1_Outro, sCNC_I2_Outro,sNomeArquivo, sLinha, sDescricao: string;
  F1: TextFile;
  vDataInicial: TDateTime;
  vSemMovimento: Boolean;
begin
  if not VerificaInteiro(edtCodigoCNC.Text) then
    Raise exception.Create('Centro de Custo inválido!');
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Raise exception.Create('Código do Produto inválido!');
  Gauge1.Progress := 0;

  Caption := 'Verifica Movimento de Estoque Comercial Especial';

  if VerificaInteiroBranco(edtCodigoCNC.Text) then
  Begin
    edtCodigoCNC.Text := IntToStr(StrToInt(edtCodigoCNC.Text));
    sCNC_I1 := ' AND I1.CNC_CODIGO='+edtCodigoCNC.Text+' ';
    sCNC_I2 := ' AND I2.CNC_CODIGO='+edtCodigoCNC.Text+' ';
    if edtCodigoCNC.Text = '1' then
    Begin
      sCNC_I1_Outro := ' AND I1.CNC_CODIGO=2 ';
      sCNC_I2_Outro := ' AND I2.CNC_CODIGO=2 ';
    end
    else
    Begin
      sCNC_I1_Outro := ' AND I1.CNC_CODIGO=1 ';
      sCNC_I2_Outro := ' AND I2.CNC_CODIGO=1 ';
    end;
  end
  else
  Begin
    edtCodigoCNC.Clear;
    sCNC_I1 := '';
    sCNC_I2 := '';
  end;

  vParar := False;
  edtTotalVerificado.Text := '0';
  edtTotalRegistrado.Text := '0';
  sNomeArquivo := 'C:\VerificacaoLoja'+PreencheZero(2,edtCodigoCNC.Text)+'_'+
    formatDateTime('YYYY_MM_DD_HH_MM',DM.Configuracao1.DataHora)+'.txt';
  sqlProduto1.Close;
  try
    if StrToInt(edtCodigoPRD.Text) > 0 then
      sqlProduto1.SQL.Text := 'SELECT PRD_CODIGO,PRD_DESCRICAO,PRD_REFERENCIA '+
        ' FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+edtCodigoPRD.Text;
    sqlProduto1.Open;
  except
    Raise exception.Create('Código do Produto inválido!');
  end;
  AssignFile(F1, sNomeArquivo);
  try
    Rewrite(F1);
    if edtCodigoPRD.Text <> '0' then
      Writeln(F1, 'Produto:'+edtCodigoPRD.Text+'-'+
                  sqlProduto1.FieldByName('PRD_DESCRICAO').asString+' '+
                  sqlProduto1.FieldByName('PRD_REFERENCIA').asString);
    if ckbOficial.Checked then
      sLinha := 'CODIGO;'+PreencheEspaco(40, 'DESCRICAO')+
                ';  Saldo;NotaEnt;Est.Ent;NotaSai;Est.Sai;Inventa;DataInvent'
    else
      sLinha := 'CODIGO;'+PreencheEspaco(40, 'DESCRICAO')+
                ';  Saldo;EstFisi;EstCome;Indispo; Vendas;AvulEnt;AvulSai;'+
                'Recebim;Transfe;Inventa;DataInvent';
    Writeln(F1, sLinha);
    if edtCodigoPRD.Text = '0' then
    Begin
      sqlAux.Close;
      sqlAux.SQL.Text := 'SELECT COUNT(PRD_CODIGO) as TOTAL '+
                         ' FROM PRODUTO '+
                         ' WHERE PRD_SITUACAO<>1 ';
      sqlAux.Open;
      Gauge1.MaxValue := sqlAux.FieldByName('TOTAL').asInteger;
      sqlAux.Close;
    end
    else
      Gauge1.MaxValue := 1;

    Gauge1.Refresh;
    bitMovimentoComercial.Enabled := False;
    bitMovimentoFisico.Enabled := False;
    bitConfirmar.Enabled := False;
    bitParar.Enabled := True;
    while not sqlProduto1.Eof do
    Begin
      vSaldo := 0;
      vSemMovimento := False;
      vTotalTRFSaida := 0;
      vTotalRecebimentos := 0;
      CdPRD := sqlProduto1.FieldByName('PRD_CODIGO').asInteger;
      sDescricao := sqlProduto1.FieldByName('PRD_DESCRICAO').asString+' '+
                    sqlProduto1.FieldByName('PRD_REFERENCIA').asString;
      Application.ProcessMessages;
      if vParar then
      Begin
        ShowMessage('Processo Cancelado!');
        Writeln(F1, 'Processo Cancelado! '+DateTimeToStr(Now));
        Break;
      end;
      Gauge1.Progress := Gauge1.Progress+1;
      Gauge1.Refresh;
      edtTotalVerificado.Text := IntToStr(StrToInt(edtTotalVerificado.Text)+1);
      edtTotalVerificado.Refresh;
      with sqlAux do
      Begin
        //Data do Último Inventário Processado
        vDataInicial := 0;
        Close;
        SQL.Text := 'SELECT MAX(I1.INV_CODIGO) as CODIGO_INV '+
          ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
          ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND I1.INV_SITUACAO=1 '+
          sCNC_I1+
          ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
          ' AND I1.INV_CODIGO=I2.INV_CODIGO';
        Open;
        CdINV := FieldByName('CODIGO_INV').AsInteger;
        if CdINV > 0 then
        Begin
          //Quantidade Inventariada
          Close;
          SQL.Text := 'SELECT I1.INV_DATA AS DATA, I2.IIV_QUANT_INF as TOTAL '+
            ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
            ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I2+
            ' AND I2.INV_CODIGO='+IntToStr(CdINV)+
            ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
            ' AND I1.INV_CODIGO=I2.INV_CODIGO';
          Open;
          vDataInicial     := FieldByName('DATA').AsDateTime;
          vTotalInventario := FieldByName('TOTAL').AsInteger;
        end
        else
        Begin
          vTotalInventario := 0;
          if DM.Configuracao1.Empresa = empLBM then
          Begin
            //Pegar o Saldo Anterior ao primeiro movimento
            //Matriz
            SQL.Text := 'SELECT TOP 1 MEC_SALDO_ANT AS TOTAL'+
              ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
              ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND I1.CNC_CODIGO=1 '+
              ' ORDER BY I1.MEC_DATA_HORA ASC, I1.MEC_CODIGO ASC ';
            Open;
            if IsEmpty then
            Begin
              Close;
              SQL.Text := 'SELECT SUM(IES_SCOMERCIAL) as TOTAL '+
                ' FROM ITEM_DE_ESTOQUE I1 '+
                ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND I1.CNC_CODIGO=1 ';
              Open;
            end;
            vSaldo := FieldByName('TOTAL').asFloat;

            //Filial
            Close;
            SQL.Text := 'SELECT TOP 1 MEC_SALDO_ANT as TOTAL '+
              ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
              ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND I1.CNC_CODIGO=2 '+
              ' ORDER BY I1.MEC_DATA_HORA ASC, I1.MEC_CODIGO ASC ';
            Open;
            if IsEmpty then
            Begin
              Close;
              SQL.Text := 'SELECT SUM(IES_SCOMERCIAL) as TOTAL '+
                ' FROM ITEM_DE_ESTOQUE I1 '+
                ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND I1.CNC_CODIGO=2 ';
              Open;
            end;
            vSaldo := vSaldo + FieldByName('TOTAL').asFloat;
          end;
        end;


        //Não Oficial
        if not ckbOficial.Checked then
        Begin
          //Somar Vendas
          Close;
          SQL.Text := 'SELECT SUM(IPV_QUANTIDADE) as TOTAL '+
            ' FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1+
            ' AND I1.PDV_CODIGO IN '+
            ' (SELECT PDV_CODIGO FROM PEDIDO_DE_VENDA I2 '+
            ' WHERE I2.PDV_SITUACAO=4 '+
            sCNC_I2;
          if vDataInicial > 0 then
            SQL.Text := SQL.Text+' AND I2.PDV_DT_ENTREGA>'+QuotedStr(MesDiaHora(vDataInicial))+') '
          else
            SQL.Text := SQL.Text+') ';
          Open;
          vTotalVendas := FieldByName('TOTAL').asFloat;

  {        //Somar Recebimentos (Compras e TRF de Entrada)
          Close;
          SQL.Text := 'SELECT SUM(IRC_QUANTIDADE) as TOTAL '+
            ' FROM ITEM_DE_RECEBIMENTO I1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1+
            ' AND I1.REC_CODIGO IN '+
            ' (SELECT I2.REC_CODIGO FROM RECEBIMENTO I2 '+
            ' WHERE I2.REC_SITUACAO<>3 '+
            sCNC_I2;
          if vDataInicial > 0 then
            SQL.Text := SQL.Text+' AND I2.REC_DATA>'+QuotedStr(MesDiaHora(vDataInicial))+') '
          else
            SQL.Text := SQL.Text+') ';
          Open;
          vTotalRecebimentos := FieldByName('TOTAL').asFloat;
  }

          //Somar Compras(LBM)
          if DM.Configuracao1.Empresa = empLBM then
          Begin
            Close;
            SQL.Text := 'SELECT SUM(IPC_QUANTIDADE) as TOTAL '+
              ' FROM ITEM_DE_PEDIDO_DE_COMPRA I1 '+
              ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
              sCNC_I1+
              ' AND I1.PCP_CODIGO IN '+
              ' (SELECT I2.PCP_CODIGO FROM PEDIDO_DE_COMPRA I2 '+
              ' WHERE I2.PCP_SITUACAO=2 '+
              sCNC_I2;
            if vDataInicial > 0 then
              SQL.Text := SQL.Text+' AND I2.PCP_DT_ENTREGA>'+QuotedStr(MesDiaHora(vDataInicial))+') '
            else
              SQL.Text := SQL.Text+') ';
            Open;
            vTotalRecebimentos := FieldByName('TOTAL').asFloat;
          end;

          //Somar Transferencia (Saida)
          if (DM.Configuracao1.Empresa <> empLBM) or
             (Trim(edtCodigoCNC.Text) <> '') then
          Begin
            Close;
            SQL.Text := 'SELECT SUM(ITR_QUANTIDADE) as TOTAL '+
              ' FROM ITEM_DE_TRANSFERENCIA I1 '+
              ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
              sCNC_I1+
              ' AND I1.TRF_CODIGO IN '+
              ' (SELECT I2.TRF_CODIGO FROM TRANSFERENCIA I2 '+
              ' WHERE I2.TRF_SITUACAO=1 '+
              sCNC_I2;
            if vDataInicial > 0 then
              SQL.Text := SQL.Text+' AND I2.TRF_DATA>'+QuotedStr(MesDiaHora(vDataInicial))+') '
            else
              SQL.Text := SQL.Text+') ';
            Open;
            vTotalTRFSaida := FieldByName('TOTAL').asFloat;

            //Notas de Entrada
            if DM.Configuracao1.Empresa = empLBM then
            Begin
              //Transferencia de Entrada (LBM)
              Close;
              SQL.Text := 'SELECT SUM(ITR_QUANTIDADE) as TOTAL '+
                ' FROM ITEM_DE_TRANSFERENCIA I1 '+
                ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                sCNC_I1_Outro+
                ' AND I1.TRF_CODIGO IN '+
                ' (SELECT I2.TRF_CODIGO FROM TRANSFERENCIA I2 '+
                ' WHERE I2.TRF_SITUACAO=1 '+
                sCNC_I2_Outro;
              if vDataInicial > 0 then
                SQL.Text := SQL.Text+' AND I2.TRF_DATA>'+QuotedStr(MesDiaHora(vDataInicial))+') '
              else
                SQL.Text := SQL.Text+') ';
              Open;
              vTotalTRFSaida := vTotalTRFSaida - FieldByName('TOTAL').asFloat;
            end;
          end;

          //Somar Assitência e Emprestimos não devolvidos
          Close;
          SQL.Text := 'SELECT SUM(I1.IES_INDISPONIVEL) as TOTAL '+
            ' FROM ITEM_DE_ESTOQUE I1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1;
          Open;
          vTotalIndisponivel := FieldByName('TOTAL').asFloat;

          //Deduzir Devoluções de Compra
          Close;
          SQL.Text := 'SELECT SUM(MEC_QUANTIDADE) as TOTAL '+
            ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
            ' WHERE I1.MEC_ES='+QuotedStr('S')+
            ' AND I1.MEC_TIPO_MOV=362 '+ //Devolução
            ' AND I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1;
          if vDataInicial > 0 then
            SQL.Text := SQL.Text+' AND I1.MEC_DATA_HORA>'+QuotedStr(MesDiaHora(vDataInicial));
          Open;
          vTotalRecebimentos := vTotalRecebimentos - FieldByName('TOTAL').asFloat;

          //Somar Devoluções de Compra Canceladas
          Close;
          SQL.Text := 'SELECT SUM(MEC_QUANTIDADE) as TOTAL '+
            ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
            ' WHERE I1.MEC_ES='+QuotedStr('E')+
            ' AND I1.MEC_TIPO_MOV=362 '+ //Devolução
            ' AND I1.PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND I1.MEC_OBSERVACAO='+QuotedStr('NOTA/CUPOM CANCELADA')+
            sCNC_I1;
          if vDataInicial > 0 then
            SQL.Text := SQL.Text+' AND I1.MEC_DATA_HORA>'+QuotedStr(MesDiaHora(vDataInicial));
          Open;
          vTotalRecebimentos := vTotalRecebimentos + FieldByName('TOTAL').asFloat;

          //Deduzir Vendas Extornadas
          Close;
          SQL.Text := 'SELECT SUM(MEC_QUANTIDADE) as TOTAL '+
            ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
            ' WHERE I1.MEC_ES='+QuotedStr('E')+
            ' AND I1.MEC_TIPO_MOV=374 '+ //Extorno de Venda
            ' AND I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1;
          if vDataInicial > 0 then
            SQL.Text := SQL.Text+' AND I1.MEC_DATA_HORA>'+QuotedStr(MesDiaHora(vDataInicial));
          Open;
          if FieldByName('TOTAL').asFloat > 0 then
          Begin
            //Se teve extorno de Venda (Reabertura) então não considerar o pedido e sim os movimentos de Venda e Extorno
            vTotalVendas := (-1) * FieldByName('TOTAL').asFloat;
            Close;
            SQL.Text := 'SELECT SUM(MEC_QUANTIDADE) as TOTAL '+
              ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
              ' WHERE I1.MEC_ES='+QuotedStr('S')+
              ' AND I1.MEC_TIPO_MOV=361 '+ //Venda
              ' AND I1.PRD_CODIGO='+IntToStr(CdPRD)+
              sCNC_I1;
            if vDataInicial > 0 then
              SQL.Text := SQL.Text+' AND I1.MEC_DATA_HORA>'+QuotedStr(MesDiaHora(vDataInicial));
            Open;
            vTotalVendas := vTotalVendas + FieldByName('TOTAL').asFloat;
            Close;
            SQL.Text := 'SELECT SUM(MEC_QUANTIDADE) as TOTAL '+
              ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
              ' WHERE I1.MEC_ES='+QuotedStr('E')+
              ' AND I1.MEC_TIPO_MOV=362 '+ //Venda
              ' AND I1.PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND (I1.MEC_OBSERVACAO IS NULL '+
              '  OR I1.MEC_OBSERVACAO<>'+QuotedStr('NOTA/CUPOM CANCELADA')+')'+
              sCNC_I1;
            if vDataInicial > 0 then
              SQL.Text := SQL.Text+' AND I1.MEC_DATA_HORA>'+QuotedStr(MesDiaHora(vDataInicial));
            Open;
            vTotalVendas := vTotalVendas - FieldByName('TOTAL').asFloat;
          end;

          //Somar Avulso Entrada
          Close;
          SQL.Text := 'SELECT SUM(MEC_QUANTIDADE) as TOTAL '+
            ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
            ' WHERE I1.MEC_ES='+QuotedStr('E')+
            ' AND I1.MEC_TIPO_MOV=380 '+
            ' AND I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1;
          if vDataInicial > 0 then
            SQL.Text := SQL.Text+' AND I1.MEC_DATA_HORA>'+QuotedStr(MesDiaHora(vDataInicial));
          Open;
          vTotalAvulsoEntrada := FieldByName('TOTAL').asFloat;

          //Somar Avulso Saida
          Close;
          SQL.Text := 'SELECT SUM(I1.MEC_QUANTIDADE) as TOTAL '+
            ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
            ' WHERE I1.MEC_ES='+QuotedStr('S')+
            ' AND I1.MEC_TIPO_MOV=385 '+
            ' AND I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1;
          if vDataInicial > 0 then
            SQL.Text := SQL.Text+' AND I1.MEC_DATA_HORA>'+QuotedStr(MesDiaHora(vDataInicial));
          Open;
          vTotalAvulsoSaida := FieldByName('TOTAL').asFloat;

          //Estoque Fisico
          Close;
          SQL.Text := 'SELECT SUM(IES_SFISICO) as TOTAL '+
            ' FROM ITEM_DE_ESTOQUE I1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1;
          Open;
          vEstoqueFisico := FieldByName('TOTAL').asFloat;

          //Estoque Comercial
          Close;
          SQL.Text := 'SELECT SUM(IES_SCOMERCIAL-IES_INDISPONIVEL-IES_SRESERVADO) as TOTAL '+
            ' FROM ITEM_DE_ESTOQUE I1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1;
          Open;
          vEstoqueComercial := FieldByName('TOTAL').asFloat;

          vSaldo := vSaldo+vTotalInventario+vTotalRecebimentos+vTotalAvulsoEntrada-
                   (vTotalVendas+vTotalTRFSaida+vTotalIndisponivel+
                    vTotalAvulsoSaida);

          if (vEstoqueFisico<>vEstoqueComercial) or
             (vEstoqueFisico<>vSaldo) then
          Begin
            edtTotalRegistrado.Text := IntToStr(StrToInt(edtTotalRegistrado.Text)+1);
            edtTotalRegistrado.Refresh;
            sLinha := PreencheZero(6,CdPRD)+';'+
                      PreencheEspaco(40, sDescricao)+';'+
                      //Estoque Saldo
                      PreencheEspacoEsq(7, format('%.2f',[vSaldo]))+';'+
                      //Estoque Fisico
                      PreencheEspacoEsq(7, format('%.2f',[vEstoqueFisico]))+';'+
                      //Estoque Comercial
                      PreencheEspacoEsq(7, format('%.2f',[vEstoqueComercial]))+';'+
                      //Indisponível
                      PreencheEspacoEsq(7, format('%.2f',[vTotalIndisponivel]))+';'+
                      //TotalVendas
                      PreencheEspacoEsq(7, format('%.2f',[vTotalVendas]))+';'+
                      //TotalAvulso Entrada
                      PreencheEspacoEsq(7, format('%.2f',[vTotalAvulsoEntrada]))+';'+
                      //TotalAvulso Saida
                      PreencheEspacoEsq(7, format('%.2f',[vTotalAvulsoSaida]))+';'+
                      //TotalRecebimentos
                      PreencheEspacoEsq(7, format('%.2f',[vTotalRecebimentos]))+';'+
                      //TotalTransferencia
                      PreencheEspacoEsq(7, format('%.2f',[vTotalTRFSaida]))+';'+
                      //TotalInventário
                      PreencheEspacoEsq(7, format('%.2f',[vTotalInventario]));
            //DataInventário
            if vDataInicial > 0 then
              sLinha := sLinha + ';'+DateToStr(vDataInicial)
            else
              sLinha := sLinha + ';          ';
            Writeln(F1, sLinha);
          end;
        end
        else //Oficial
        Begin
          //Verifica a existência de Movimento
          Close;
          SQL.Text := 'SELECT TOP 1 I1.NTF_CODIGO '+
            ' FROM ITEM_DE_NOTA_FISCAL I1, NOTA_FISCAL N1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND N1.NTF_DT_EMISSAO>="01/01/2003" '+
            sCNC_I1+
            ' AND I1.CNC_ORIGEM=N1.CNC_ORIGEM '+
            ' AND I1.CNC_CODIGO=N1.CNC_CODIGO '+
            ' AND I1.NTF_CODIGO=N1.NTF_CODIGO ';
          Open;
          if IsEmpty then
          Begin
            vSemMovimento := True;
            vNotasEntrada := 0;
            vNotasSaida := 0;
          end
          else
          Begin
            //Notas Diferente de Simples Remessa e Correção de Nota de Entrada
            Close;
            SQL.Text := 'SELECT SUM(INF_QUANTIDADE) as TOTAL '+
              ' FROM ITEM_DE_NOTA_FISCAL I1, NOTA_FISCAL N1 '+
              ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND N1.NTF_TIPO_NOTA<>363 '+
              ' AND N1.NTF_TIPO_NOTA<>364 '+
              ' AND (N1.NTF_TIPO_NOTA<>365 '+ //Transferência
              ' OR N1.NTF_PEDIDO NOT IN (SELECT TR.TRF_CODIGO FROM TRANSFERENCIA TR '+
              ' WHERE TR.TRF_AUTOMATICA=1)) '+  //TRF AUTOMATICA NAO GERA MOVIMENTO
              ' AND ((N1.NTF_SITUACAO=2 '+
              ' AND N1.NTF_ENTRADA_SAIDA=0) '+
              ' OR (N1.NTF_ENTRADA_SAIDA=1 '+
              ' AND N1.NTF_SITUACAO=3)) '+
              ' AND N1.NTF_DT_EMISSAO>="01/01/2003" '+
              ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
              ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND N1.NTF_CODIGO=I1.NTF_CODIGO '+
              sCNC_I1;
            Open;
            vNotasEntrada := FieldByName('TOTAL').asFloat;

            //Somar Notas Canceladas
            Close;
            SQL.Text := 'SELECT SUM(INF_QUANTIDADE) as TOTAL '+
              ' FROM ITEM_DE_NOTA_FISCAL I1, NOTA_FISCAL N1 '+
              ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND N1.NTF_TIPO_NOTA<> 363 '+
              ' AND N1.NTF_TIPO_NOTA<> 364 '+
              ' AND (N1.NTF_TIPO_NOTA<>365 '+ //Transferência
              ' OR N1.NTF_PEDIDO NOT IN (SELECT TR.TRF_CODIGO FROM TRANSFERENCIA TR '+
              ' WHERE TR.TRF_AUTOMATICA=1)) '+  //TRF AUTOMATICA NAO GERA MOVIMENTO
              ' AND N1.NTF_ENTRADA_SAIDA=0 '+
              ' AND N1.NTF_SITUACAO=3 '+
              ' AND N1.NTF_DT_EMISSAO>="01/01/2003" '+
              ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
              ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND N1.NTF_CODIGO=I1.NTF_CODIGO '+
              sCNC_I1;
            Open;
            vNotasEntrada := vNotasEntrada + FieldByName('TOTAL').asFloat;

            //Notas Diferente de Simples Remessa e Correção de Nota de Saída
            Close;
            SQL.Text := 'SELECT SUM(INF_QUANTIDADE) as TOTAL '+
              ' FROM ITEM_DE_NOTA_FISCAL I1, NOTA_FISCAL N1 '+
              ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND N1.NTF_TIPO_NOTA<> 363 '+
              ' AND N1.NTF_TIPO_NOTA<> 364 '+
              ' AND (N1.NTF_TIPO_NOTA<>365 '+ //Transferência
              ' OR N1.NTF_PEDIDO NOT IN (SELECT TR.TRF_CODIGO FROM TRANSFERENCIA TR '+
              ' WHERE TR.TRF_AUTOMATICA=1)) '+  //TRF AUTOMATICA NAO GERA MOVIMENTO
              ' AND ((N1.NTF_SITUACAO=2 '+
              ' AND N1.NTF_ENTRADA_SAIDA=1) '+
              ' OR (N1.NTF_ENTRADA_SAIDA=0 '+
              ' AND N1.NTF_SITUACAO=3)) '+
              ' AND N1.NTF_DT_EMISSAO>="01/01/2003" '+
              ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
              ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND N1.NTF_CODIGO=I1.NTF_CODIGO '+
              sCNC_I1;
            Open;
            vNotasSaida := FieldByName('TOTAL').asFloat;

            //Notas Diferente de Simples Remessa e Correção de Nota de Saída
            Close;
            SQL.Text := 'SELECT SUM(INF_QUANTIDADE) as TOTAL '+
              ' FROM ITEM_DE_NOTA_FISCAL I1, NOTA_FISCAL N1 '+
              ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND N1.NTF_TIPO_NOTA<> 363 '+
              ' AND N1.NTF_TIPO_NOTA<> 364 '+
              ' AND (N1.NTF_TIPO_NOTA<>365 '+ //Transferência
              ' OR N1.NTF_PEDIDO NOT IN (SELECT TR.TRF_CODIGO FROM TRANSFERENCIA TR '+
              ' WHERE TR.TRF_AUTOMATICA=1)) '+  //TRF AUTOMATICA NAO GERA MOVIMENTO
              ' AND N1.NTF_ENTRADA_SAIDA=1 '+
              ' AND N1.NTF_SITUACAO=3 '+
              ' AND N1.NTF_DT_EMISSAO>="01/01/2003" '+
              ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
              ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
              ' AND N1.NTF_CODIGO=I1.NTF_CODIGO '+
              sCNC_I1;
            Open;
            vNotasSaida := vNotasSaida + FieldByName('TOTAL').asFloat;
          end;

          //Movimentação de Entrada
          Close;
          SQL.Text := 'SELECT SUM(MES_QUANTIDADE) as TOTAL '+
            ' FROM MOVIMENTO_DE_ESTOQUE_FISCAL I1 '+
            ' WHERE I1.MES_ES='+QuotedStr('E')+
            ' AND I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1;
          if vDataInicial > 0 then
            SQL.Text := SQL.Text+' AND I1.MES_DATA_HORA>'+QuotedStr(MesDiaHora(vDataInicial));
          Open;
          vEstoqueEntrada := FieldByName('TOTAL').asFloat;

          //Movimentação de Saída
          Close;
          SQL.Text := 'SELECT SUM(MES_QUANTIDADE) as TOTAL '+
            ' FROM MOVIMENTO_DE_ESTOQUE_FISCAL I1 '+
            ' WHERE I1.MES_ES='+QuotedStr('S')+
            ' AND I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1;
          if vDataInicial > 0 then
            SQL.Text := SQL.Text+' AND I1.MES_DATA_HORA>'+QuotedStr(MesDiaHora(vDataInicial));
          Open;
          vEstoqueSaida := FieldByName('TOTAL').asFloat;

          if (vEstoqueEntrada <> 0) or
             (vEstoqueSaida <> 0) then
            vSemMovimento := False;

          //Estoque Fiscal
          Close;
          SQL.Text := 'SELECT SUM(IES_SFISCAL) as TOTAL '+
            ' FROM ITEM_DE_ESTOQUE I1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            sCNC_I1;
          Open;
          vEstoqueFiscal := FieldByName('TOTAL').asFloat;

          if vSemMovimento then
            vSaldo := vEstoqueFiscal
          else
          Begin
            with DM.QR_Consultas do
            Begin
              Close;
              if sCNC_I1 = '' then
              Begin
                //Matriz
                SQL.Text := 'SELECT TOP 1 MES_SALDO_ANT AS TOTAL'+
                  ' FROM MOVIMENTO_DE_ESTOQUE_FISCAL I1 '+
                  ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND I1.CNC_CODIGO=1 '+
                  ' ORDER BY I1.MES_DATA_HORA ';
                Open;
                if IsEmpty then
                Begin
                  Close;
                  SQL.Text := 'SELECT SUM(IES_SFISCAL) as TOTAL '+
                    ' FROM ITEM_DE_ESTOQUE I1 '+
                    ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                    ' AND I1.CNC_CODIGO=1 ';
                  Open;
                end;
                vSaldo := FieldByName('TOTAL').asFloat+vTotalInventario+vNotasEntrada-vNotasSaida;

                //Filial
                Close;
                SQL.Text := 'SELECT TOP 1 MES_SALDO_ANT as TOTAL '+
                  ' FROM MOVIMENTO_DE_ESTOQUE_FISCAL I1 '+
                  ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND I1.CNC_CODIGO=2 '+
                  ' ORDER BY I1.MES_DATA_HORA ';
                Open;
                if IsEmpty then
                Begin
                  Close;
                  SQL.Text := 'SELECT SUM(IES_SFISCAL) as TOTAL '+
                    ' FROM ITEM_DE_ESTOQUE I1 '+
                    ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                    ' AND I1.CNC_CODIGO=2 ';
                  Open;
                end;
                vSaldo := vSaldo + FieldByName('TOTAL').asFloat;
              end
              else
              Begin
                SQL.Text := 'SELECT TOP 1 MES_SALDO_ANT AS TOTAL '+
                  ' FROM MOVIMENTO_DE_ESTOQUE_FISCAL I1 '+
                  ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                  sCNC_I1+
                  ' ORDER BY I1.MES_DATA_HORA ';
                Open;
                if IsEmpty then
                Begin
                  Close;
                  SQL.Text := 'SELECT SUM(IES_SFISCAL) as TOTAL '+
                    ' FROM ITEM_DE_ESTOQUE I1 '+
                    ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                    sCNC_I1;
                  Open;
                end;
                vSaldo := FieldByName('TOTAL').asFloat+vTotalInventario+vNotasEntrada-vNotasSaida
              end;
            end;
          end;

          if (vNotasEntrada<>vEstoqueEntrada) or
             (vNotasSaida<>vEstoqueSaida) or
             (vEstoqueFiscal<>vSaldo) then
          Begin
            edtTotalRegistrado.Text := IntToStr(StrToInt(edtTotalRegistrado.Text)+1);
            edtTotalRegistrado.Refresh;
            sLinha := PreencheZero(6,CdPRD)+';'+
                      PreencheEspaco(40, sDescricao)+';'+
                      //Estoque Saldo
                      PreencheEspacoEsq(7, format('%.2f',[vSaldo]))+';'+
                      //Notas Entrada
                      PreencheEspacoEsq(7, format('%.2f',[vNotasEntrada]))+';'+
                      //Estoque Entrada
                      PreencheEspacoEsq(7, format('%.2f',[vEstoqueEntrada]))+';'+
                      //Notas Saída
                      PreencheEspacoEsq(7, format('%.2f',[vNotasSaida]))+';'+
                      //Estoque Saída
                      PreencheEspacoEsq(7, format('%.2f',[vEstoqueSaida]))+';'+
                      //TotalInventário
                      PreencheEspacoEsq(7, format('%.2f',[vTotalInventario]));
            //DataInventário
            if vDataInicial > 0 then
              sLinha := sLinha + ';'+DateToStr(vDataInicial)
            else
              sLinha := sLinha + ';          ';
            Writeln(F1, sLinha);
          end;
        end;
      end;
      if sqlProduto1.Eof then
        Break;
      sqlProduto1.Next;
    end;
    ShowMessage('Arquivo Gerado!');
  finally
    CloseFile(F1);
    btnMovCompra.Enabled := True;
    bitParar.Enabled := False;
    bitMovimentoComercial.Enabled := True;
    bitMovimentoFisico.Enabled := True;
    bitConfirmar.Enabled := True;
    bitTabelaCusto.Enabled := True;
  end;
end;

procedure TfMxVerificaEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlProduto1.Close;
  Action := caFree;
end;

procedure TfMxVerificaEstoque.bitPararClick(Sender: TObject);
begin
  bitMovimentoComercial.Enabled := True;
  bitMovimentoFisico.Enabled := True;
  bitConfirmar.Enabled := True;
  bitParar.Enabled := False;
  vParar := True;
end;

procedure TfMxVerificaEstoque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    if bitParar.Enabled then
    Begin
      bitParar.SetFocus;
      bitPararClick(sender);
    end
    else
      Close;
end;

procedure TfMxVerificaEstoque.FormShow(Sender: TObject);
begin
  edtCodigoCNC.Text := IntToStr(DM.Configuracao1.CodigoCNC);
end;

procedure TfMxVerificaEstoque.ckbOficialClick(Sender: TObject);
begin
  if ckbOficial.Checked then
  Begin
    edtCodigoCNC.Clear;
    edtCodigoCNC.Enabled := False;
  end
  else
    edtCodigoCNC.Enabled := True;
end;

procedure TfMxVerificaEstoque.bitTabelaCustoClick(Sender: TObject);
var
  CdCNCEntrega,CdCUS, CdPRD, CdPCP, Cont: integer;
  vQuantidade, vCompra, vCusto, vICMS, vFrete, vICMSFrete, vIPI, vCustoMedio,
    vQtdAnterior, vCustoAnterior: Double;
  sPRD, sNomeArquivo, sLinha, sFiltroConsulta: string;
  F1: TextFile;
  DtCadastro: TDateTime;
begin
  sPRD := '';
  vParar := False;
  bitTabelaCusto.Enabled := False;
  bitMovimentoComercial.Enabled := False;
  bitMovimentoFisico.Enabled := False;
  bitConfirmar.Enabled := False;
  bitParar.Enabled := True;
  Gauge1.Progress := 0;

  If MessageDlg('ATENÇÃO!!!'+#13+#13+
                'Não execute esse procedimento sem autorização!!!'+#13+#13+
                'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    edtCodigoPRD.Text := '0';

  if StrToInt(edtCodigoPRD.Text) > 0 then
     sPRD := ' AND (PRD_CODIGO='+edtCodigoPRD.Text+') ';

  sNomeArquivo := 'C:\AcertoTabelaCusto_'+formatDateTime('YYYYMMDD',Now)+'_'+formatDateTime('HHMMSS',Now)+'.txt';

  AssignFile(F1, sNomeArquivo);
  try
    Rewrite(F1);
    sLinha := 'Acerto Tabela de Custo';
    Writeln(F1, sLinha);
    sLinha := '';
    Writeln(F1, sLinha);
    sLinha := 'Produto'+
              PreencheEspacoEsq(12,'Compra_INI')+
              PreencheEspacoEsq(12,'Compra_FIM')+
              PreencheEspacoEsq(12,'IPI_INI')+
              PreencheEspacoEsq(12,'IPI_FIM')+
              PreencheEspacoEsq(12,'ICMS_INI')+
              PreencheEspacoEsq(12,'ICMS_FIM')+
              PreencheEspacoEsq(12,'Frete_INI')+
              PreencheEspacoEsq(12,'Frete_FIM')+
              PreencheEspacoEsq(12,'ICMSF_INI')+
              PreencheEspacoEsq(12,'ICMSF_FIM')+
              PreencheEspacoEsq(12,'Custo_INI')+
              PreencheEspacoEsq(12,'Custo_FIM')+
              PreencheEspacoEsq(12,'Media_INI')+
              PreencheEspacoEsq(12,'Media_FIM')+
              PreencheEspacoEsq(12,'Quantidade')+
              PreencheEspacoEsq(12,'QtdAnt.')+
              PreencheEspacoEsq(12,'CustoAnt');
    Writeln(F1, sLinha);
    sLinha := '';
    Writeln(F1, sLinha);
//    CloseFile(F1);
  except
  end;

  sqlAux.Close;
  sqlAux.SQL.Text := 'SELECT COUNT(CUS_CODIGO) as TOTAL '+
     ' FROM CUSTO '+
     ' WHERE CUS_DT_CADASTRO>"01/01/2003" '+
     ' AND CUS_QUANTIDADE>0 '+
     sPRD;
  sqlAux.Open;
  Gauge1.MaxValue := sqlAux.FieldByName('TOTAL').asInteger;
  Gauge1.Refresh;

  with Custo1 do
  Begin
    Close;
    SQL.Text := 'SELECT * FROM CUSTO '+
                ' WHERE CUS_DT_CADASTRO>"01/01/2003" '+
                ' AND CUS_QUANTIDADE>0 '+
                sPRD+
                ' ORDER BY CUS_CODIGO ';
    Open;
    Cont := 0;
    while not Eof do
    Begin
      Application.ProcessMessages;
      if vParar then
      Begin
        ShowMessage('Cancelado!');
        Exit;
      end;
      Gauge1.Progress := Gauge1.Progress+1;
      Gauge1.Refresh;

//      CdCNC := CodigoCNC;
      CdCUS := CodigoCUS;
      CdPRD := CodigoPRD;
      CdPCP := CodigoPCP;
      DtCadastro := DataCadastro;
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT * '+
          ' FROM NOTA_FISCAL N1, ITEM_DE_NOTA_FISCAL I1 '+
          ' WHERE N1.NTF_PEDIDO='+IntToStr(CdPCP)+
//          ' AND N1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND N1.NTF_TIPO_NOTA=360 '+                      //Compra
          ' AND I1.PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND N1.CNC_ORIGEM=I1.CNC_ORIGEM '+
          ' AND N1.CNC_CODIGO=I1.CNC_CODIGO '+
          ' AND N1.NTF_CODIGO=I1.NTF_CODIGO ';
        Open;
        if not isEmpty then
        Begin
          CdCNCEntrega:= FieldByName('CNC_CODIGO').asInteger;
          vCompra     := FieldByName('INF_PRECO').asFloat-
                         FieldByName('INF_DESCONTO').asFloat;
          vICMS       := FieldByName('INF_ALIQUOTA').asFloat;
          vIPI        := FieldByName('INF_ALIQUOTA_IPI').asFloat;
          vFrete      := FieldByName('NTF_FRETE').asFloat;
          vICMSFrete  := FieldByName('NTF_ICMS_FRETE').asFloat;
          vQuantidade := FieldByName('INF_QUANTIDADE').asFloat;
          vCusto      := vCompra+
                         Arredonda(vCompra*vIPI/100,4)+
                         Arredonda(vCompra*vFrete/100,4)-
                         Arredonda(vCompra*vICMS/100,4)-
                         Arredonda(vCompra*vICMSFrete/100,4);

          //Verificar movimento gerado pela compra
          //Estou usando A tabela de Mov. Est. Comercial somente para pegar a datahora do movimento
          with DM.QR_Consultas do
          Begin
            Close;
            SQL.Text := 'SELECT * FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNCEntrega)+
              ' AND PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND MEC_TIPO_MOV=14 '+ //Compra
              ' AND MEC_ENT_CODIGO='+IntToStr(CdPCP);
            Open;
            sFiltroConsulta := '';
            if isEmpty then
              ShowMessage('Movimento não encontrado: PCP='+IntToStr(CdPCP)+' PRD='+IntToStr(CdPRD))
            else
              sFiltroConsulta := ' AND (MES_DATA_HORA<"'+MesDiaHora(FieldByName('MEC_DATA_HORA').asDateTime)+'") ';
          end;


          //Matriz
          vQtdAnterior := SaldoAnteriorFiscal(DM.QR_Comandos, 1, CdPRD, DtCadastro, sFiltroConsulta);
          //Filial
          vQtdAnterior := vQtdAnterior + SaldoAnteriorFiscal(DM.QR_Comandos, 2, CdPRD, DtCadastro, sFiltroConsulta);

          Custo2.Close;
          Custo2.ParamByName('PRD_CODIGO').asInteger:=CdPRD; //Custo do Produto
          Custo2.ParamByName('DT_CADASTRO').AsDateTime:=DtCadastro; //Custo anterior ao atual
          Custo2.Open;
          vCustoAnterior := Custo2.PrecoCusto;
          if (not Custo2.IsEmpty) and (vQtdAnterior > 0) then
            vCustoMedio := (vCusto*vQuantidade + vCustoAnterior*vQtdAnterior)/(vQuantidade+vQtdAnterior)
          else
            vCustoMedio := vCusto;

          if (Arredonda(PrecoCompra,4) <> Arredonda(vCompra,4)) or
             (Arredonda(IPI,4) <> Arredonda(vIPI,4)) or
             (Arredonda(ICMS,4) <> Arredonda(vICMS,4)) or
             (Arredonda(Frete,4) <> Arredonda(vFrete,4)) or
             (Arredonda(ICMSFrete,4) <> Arredonda(vICMSFrete,4)) or
             (Arredonda(PrecoCusto,4) <> Arredonda(vCusto,4)) or
             (Arredonda(PrecoMedio,4) <> Arredonda(vCustoMedio,4)) or
             (Arredonda(QuantidadeAnterior,4) <> Arredonda(vQtdAnterior,4)) or
             (Arredonda(CustoAnterior,4) <> Arredonda(vCustoAnterior,4)) then
          Begin
            try
              sLinha :=          PreencheEspacoEsq(7,IntToStr(CdPRD));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(PrecoCompra));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vCompra));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(IPI));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vIPI));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(ICMS));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vICMS));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(Frete));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vFrete));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(ICMSFrete));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vICMSFrete));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(PrecoCusto));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vCusto));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(PrecoMedio));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vCustoMedio));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vQuantidade));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vQtdAnterior));
              sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vCustoAnterior));              
//              Reset(F1);
              Writeln(F1, sLinha);
//              CloseFile(F1);
            except
            end;
            inc(Cont);
            ExecutaSQL(DM.QR_Comandos,'UPDATE CUSTO SET '+
              ' CUS_QUANTIDADE='+VirgPonto(vQuantidade)+
              ',CUS_QUANTIDADE_ANT='+VirgPonto(vQtdAnterior)+
              ',CUS_CUSTO_ANT='+VirgPonto(vCustoAnterior)+
              ',CUS_VALOR_COMPRA='+VirgPonto(vCompra)+
              ',CUS_ICMS='+VirgPonto(vICMS)+
              ',CUS_IPI='+VirgPonto(vIPI)+
              ',CUS_FRETE='+VirgPonto(vFrete)+
              ',CUS_ICMS_FRETE='+VirgPonto(vICMSFrete)+
              ',CUS_VALOR_CUSTO='+VirgPonto(vCusto)+
              ',CUS_VALOR_MEDIO='+VirgPonto(vCustoMedio)+
              ' WHERE CUS_CODIGO='+IntToStr(CdCUS));
  //            ' AND CNC_CODIGO='+IntToStr(CdCNC));
          end;
        end
        else
        Begin
          ShowMessage('Não encontrou a Nota do Custo '+IntToStr(CdCUS)+' !');
        end;
      end;
      Next;
    end;
  end;
  if Cont > 0 then
    ShowMessage('Foram alterado '+IntToStr(Cont)+' preços de produtos!')
  else
    ShowMessage('Nenhum produto alterado!');
  try
    Writeln(F1, 'Finalizado');
    CloseFile(F1);
    btnMovCompra.Enabled := True;
    bitParar.Enabled := False;
    bitMovimentoComercial.Enabled := True;
    bitMovimentoFisico.Enabled := True;
    bitConfirmar.Enabled := True;
    bitTabelaCusto.Enabled := True;
  except
  end;
end;

procedure TfMxVerificaEstoque.btnMovCompraClick(Sender: TObject);
var
  CdCNC, CdPRD, CdCNCPCP, CdPCP, Cont: integer;
  sPRD, sNomeArquivo, sLinha: string;
  vData: TDateTime;
  vQtdAnt, vQuantidade: Double;
  F1: TextFile;
  Trans:Boolean;
begin
  sPRD := '';
  vParar := False;
  bitTabelaCusto.Enabled := False;
  bitMovimentoComercial.Enabled := False;
  bitMovimentoFisico.Enabled := False;
  bitConfirmar.Enabled := False;
  bitParar.Enabled := True;
  Gauge1.Progress := 0;

  If MessageDlg('ATENÇÃO!!!'+#13+#13+
                'Não execute esse procedimento sem autorização!!!'+#13+#13+
                'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    edtCodigoPRD.Text := '0';

  if StrToInt(edtCodigoPRD.Text) > 0 then
     sPRD := ' AND (PRD_CODIGO='+edtCodigoPRD.Text+') ';

  sNomeArquivo := 'C:\AcertoMovCompra_'+formatDateTime('YYYYMMDD',Now)+'_'+formatDateTime('HHMMSS',Now)+'.txt';

  AssignFile(F1, sNomeArquivo);
  try
    Rewrite(F1);
    sLinha := 'Acerto Movimento de Compra';
    Writeln(F1, sLinha);
    sLinha := '';
    Writeln(F1, sLinha);
    sLinha := 'Produto'+
              PreencheEspacoEsq(12,'PCP')+
              PreencheEspacoEsq(12,'CADASTRO')+
              PreencheEspacoEsq(12,'ALTERADO')+
              PreencheEspacoEsq(12,'QtdCompra')+
              PreencheEspacoEsq(12,'QtdMov');
    Writeln(F1, sLinha);
    sLinha := '';
    Writeln(F1, sLinha);
  except
  end;

  sqlAux.Close;
  sqlAux.SQL.Text := 'SELECT COUNT(IPC_CODIGO) as TOTAL '+
     ' FROM PEDIDO_DE_COMPRA P1, ITEM_DE_PEDIDO_DE_COMPRA I1 '+
     ' WHERE P1.PCP_SITUACAO=2 '+
     ' AND (P1.CNC_CODIGO=P1.CNC_ENTREGA '+
     ' OR (P1.CNC_CODIGO=1 AND P1.CNC_ENTREGA=2)) '+
     sPRD+
     ' AND P1.PCP_DT_CADASTRO>="01/01/2004" '+
     ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
     ' AND P1.PCP_CODIGO=I1.PCP_CODIGO ';
  sqlAux.Open;
  Gauge1.MaxValue := sqlAux.FieldByName('TOTAL').asInteger;
  Gauge1.Refresh;

  with Pedido_de_Compra1 do
  Begin
    Close;
    SQL.Text := 'SELECT * '+
       ' FROM PEDIDO_DE_COMPRA P1, ITEM_DE_PEDIDO_DE_COMPRA I1 '+
       ' WHERE P1.PCP_SITUACAO=2 '+
       ' AND (P1.CNC_CODIGO=P1.CNC_ENTREGA '+
       ' OR (P1.CNC_CODIGO=1 AND P1.CNC_ENTREGA=2)) '+
       sPRD+
       ' AND P1.PCP_DT_CADASTRO>="01/01/2004" '+
       ' AND P1.CNC_CODIGO=I1.CNC_CODIGO '+
       ' AND P1.PCP_CODIGO=I1.PCP_CODIGO '+
       ' ORDER BY P1.PCP_CODIGO DESC ';
    Open;
    Cont := 0;
    while not Eof do
    Begin
      Application.ProcessMessages;
      if vParar then
      Begin
        ShowMessage('Cancelado!');
        Exit;
      end;
      Gauge1.Progress := Gauge1.Progress+1;
      Gauge1.Refresh;

      CdCNC := CNCEntrega;
      CdPRD := FieldByName('PRD_CODIGO').asInteger;
      CdCNCPCP := CodigoCNC;
      CdPCP    := CodigoPCP;
      vQuantidade := Pedido_de_Compra1.FieldByName('IPC_QUANTIDADE').asFloat;
      if DataAlterado > 0 then
        vData := DataAlterado
      else
        vData := DataCadastro;
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT * '+
          ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL '+
          ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
          ' AND CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND MEC_TIPO_MOV=14 '+
          ' AND MEC_ENT_CODIGO='+IntToStr(CdPCP);
        Open;
        if isEmpty then
        Begin
          sLinha :=          PreencheEspacoEsq(7,IntToStr(CdPRD));
          sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(CdPCP));
          sLinha := sLinha + PreencheEspacoEsq(12,DateToStr(DataCadastro));
          sLinha := sLinha + PreencheEspacoEsq(12,DateToStr(DataAlterado));
          sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vQuantidade));
          sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(FieldByName('MEC_QUANTIDADE').asFloat));
          Writeln(F1, sLinha);
          inc(Cont);

          Trans:=false;
          with DM.Database2 do
          begin
            try
              If DM.Configuracao1.ControleTransacao then
              Begin
                StartTransaction;
                Trans:=True;
              end;

              //Movimento Físico
              //Corrigir o Saldo anterior dos movimento seguintes
              ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_ESTOQUE_FISICO SET '+
                ' MEF_SALDO_ANT=MEF_SALDO_ANT+'+VirgPonto((vQuantidade))+
                ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND MEF_DATA>"'+MesDiaHora(vData)+'" ');

              //Gerar Movimento Físico
              vQtdAnt := SaldoAnteriorFisico(DM.QR_Comandos,CdCNC, CdPRD, vData);
              if not DM.Movimento_Fisico1.Inserir(CdCNC, 0, CdPRD, 0(*CdFUN*),CdCNCPCP, CdPCP, 14 (*Compra*), 'E',
                 vQuantidade, vQtdAnt, 'CORRECAO MOVIMENTO - Admin',vData) then
              Begin
                ShowMessage('Falha ao gerar Movimento Fisico!');
                Raise exception.Create('');
              end;

              /////////////////////////////////////////

              //Movimento Comercial
              //Corrigir o Saldo anterior dos movimento seguintes
              ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_ESTOQUE_COMERCIAL SET '+
                ' MEC_SALDO_ANT=MEC_SALDO_ANT+'+VirgPonto((vQuantidade))+
                ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND MEC_DATA_HORA>"'+MesDiaHora(vData)+'" ');

              //Gerar Movimento Comercial
              vQtdAnt := SaldoAnteriorComercial(DM.QR_Comandos,CdCNC, CdPRD, vData);
              if not DM.Movimento_Estoque_Comercial1.Inserir(CdCNC, 0, CdPRD, 0(*CdFUN*),360(*Compra*),
                 CdCNCPCP, CdPCP, 'E', vQuantidade,
                 vQtdAnt, 0(*ATENÇÃO*), 0(*ATENÇÃO*),
                 0(*ATENÇÃO*), 0(*ATENÇÃO*), 0(*ATENCAO*), 0(*ATENÇÃO*),
                 'CORRECAO MOVIMENTO - Admin',vData) then
              Begin
                ShowMessage('Falha ao gerar Movimento Fisico!');
                Raise exception.Create('');
              end;

              /////////////////////////////////////////

              if Pedido_de_Compra1.NotaFiscal = -2 then //LJ4
              Begin
                //Movimento LJ4
                //Corrigir o Saldo anterior dos movimento seguintes
                ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_ESTOQUE_LJ4 SET '+
                  ' ML4_SALDO_ANT=ML4_SALDO_ANT+'+VirgPonto((vQuantidade))+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND ML4_DATA_HORA>"'+MesDiaHora(vData)+'" ');

                //Gerar Movimento LJ4
                vQtdAnt := SaldoAnteriorLJ4(DM.QR_Comandos,CdCNC, CdPRD, vData);
                if not DM.Movimento_Estoque_LJ41.Inserir(CdCNC, CdPRD, 0(*CdFUN*),360(*Compra*), CdCNCPCP, CdPCP, 'E',
                   vQuantidade, vQtdAnt, 'CORRECAO MOVIMENTO - Admin',vData) then
                Begin
                  ShowMessage('Falha ao gerar Movimento Fisico!');
                  Raise exception.Create('');
                end;

                //Acertar o Estoque
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto((vQuantidade))+
                  ',IES_SFISICO=IES_SFISICO+'+VirgPonto((vQuantidade))+
                  ',IES_SLJ4=IES_SLJ4+'+VirgPonto((vQuantidade))+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC));
              end
              else if Pedido_de_Compra1.NotaFiscal = -1 then //SN
              Begin
                //Movimento SN
                //Corrigir o Saldo anterior dos movimento seguintes
                ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_ESTOQUE_SN SET '+
                  ' MSN_SALDO_ANT=MSN_SALDO_ANT+'+VirgPonto((vQuantidade))+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND MSN_DATA_HORA>"'+MesDiaHora(vData)+'" ');

                //Gerar Movimento SN
                vQtdAnt := SaldoAnteriorSN(DM.QR_Comandos,CdCNC, CdPRD, vData);
                if not DM.Movimento_Estoque_SN1.Inserir(CdCNC, CdPRD, 0(*CdFUN*),360(*Compra*), CdCNCPCP, CdPCP, 'E',
                   vQuantidade, vQtdAnt, 'CORRECAO MOVIMENTO - Admin',vData) then
                Begin
                  ShowMessage('Falha ao gerar Movimento Fisico!');
                  Raise exception.Create('');
                end;

                //Acertar o Estoque
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto((vQuantidade))+
                  ',IES_SFISICO=IES_SFISICO+'+VirgPonto((vQuantidade))+
                  ',IES_SSN=IES_SSN+'+VirgPonto((vQuantidade))+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC));
              end
              else //Nota
              Begin
                //Movimento Fiscal
                //Corrigir o Saldo anterior dos movimento seguintes
                ExecutaSQL(DM.QR_Comandos,'UPDATE MOVIMENTO_DE_ESTOQUE_FISCAL SET '+
                  ' MES_SALDO_ANT=MES_SALDO_ANT+'+VirgPonto((vQuantidade))+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC)+
                  ' AND MES_DATA_HORA>"'+MesDiaHora(vData)+'" ');

                //Gerar Movimento Fiscal
                vQtdAnt := SaldoAnteriorFiscal(DM.QR_Comandos,CdCNC, CdPRD, vData);
                if not DM.Mov_Est_Fiscal1.Inserir(CdCNC, CdPRD, 0(*CdFUN*),0, CdCNC, Pedido_de_Compra1.NotaFiscal, 14(*Compra*), 'E',
                   vQuantidade,
                   vQtdAnt,
                   0(*ATENÇÃO*), 0(*ATENÇÃO*), 0(*ATENÇÃO*), 0(*ATENÇÃO*),
                   'CORRECAO MOVIMENTO - Admin',vData) then
                Begin
                  ShowMessage('Falha ao gerar Movimento Fisico!');
                  Raise exception.Create('');
                end;

                //Acertar o Estoque
                ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                  ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto((vQuantidade))+
                  ',IES_SFISICO=IES_SFISICO+'+VirgPonto((vQuantidade))+
                  ',IES_SFISCAL=IES_SFISCAL+'+VirgPonto((vQuantidade))+
                  ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                  ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND CNC_CODIGO='+IntToStr(CdCNC));
              end;

              If DM.Configuracao1.ControleTransacao then
                Commit;
              Trans := False;
            except
              If DM.Configuracao1.ControleTransacao then
                if trans then
                Begin
                  RollBack;
                  ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
                  Exit;
                end;
            end;
          End;
        end
        else if Arredonda(FieldByName('MEC_QUANTIDADE').asFloat) <> Arredonda(vQuantidade) then
        Begin
          sLinha :=          PreencheEspacoEsq(7,IntToStr(CdPRD));
          sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(CdPCP));
          sLinha := sLinha + PreencheEspacoEsq(12,DateToStr(DataCadastro));
          sLinha := sLinha + PreencheEspacoEsq(12,DateToStr(DataAlterado));
          sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(vQuantidade));
          sLinha := sLinha + PreencheEspacoEsq(12,FloatToStr(FieldByName('MEC_QUANTIDADE').asFloat));
          sLinha := sLinha + '(Quantidade) MEC:'+FieldByName('MEC_CODIGO').asString;
          Writeln(F1, sLinha);
          inc(Cont);
        end;
      end;
      Next;
    end;
  end;
  if Cont > 0 then
    ShowMessage('Produtos com problema '+IntToStr(Cont))
  else
    ShowMessage('Nenhum produto com problema!');
  try
    Writeln(F1, 'Finalizado');
    CloseFile(F1);
    btnMovCompra.Enabled := True;
    bitParar.Enabled := False;
    bitMovimentoComercial.Enabled := True;
    bitMovimentoFisico.Enabled := True;
    bitConfirmar.Enabled := True;
    bitTabelaCusto.Enabled := True;
  except
  end;
end;

procedure TfMxVerificaEstoque.bitMovimentoComercialClick(Sender: TObject);
var
  i, CdINV, CdPRD, CdCNC, iCNCFinal: integer;
  vSaldoAnt: double;
  sNomeArquivo, sLinha, sDescricao, sFalha: string;
  F1: TextFile;
  vDataInicial: TDateTime;
begin
  if not VerificaInteiro(edtCodigoCNC.Text) then
    Raise exception.Create('Centro de Custo inválido!');
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Raise exception.Create('Código do Produto inválido!');
  Gauge1.Progress := 0;

  Caption := 'Verifica Movimento de Estoque Comercial';

  if VerificaInteiroBranco(edtCodigoCNC.Text) then
  Begin
    edtCodigoCNC.Text := IntToStr(StrToInt(edtCodigoCNC.Text));
    CdCNC     := StrToInt(edtCodigoCNC.Text);
    iCNCFinal := StrToInt(edtCodigoCNC.Text);
  end
  else
  Begin
    edtCodigoCNC.Clear;
    CdCNC := 0;
    iCNCFinal := 2;
  end;

  vParar := False;
  edtTotalVerificado.Text := '0';
  edtTotalRegistrado.Text := '0';
  sNomeArquivo := 'C:\VerificacaoMECLoja'+PreencheZero(2,edtCodigoCNC.Text)+'_'+
    formatDateTime('YYYY_MM_DD_HH_MM',DM.Configuracao1.DataHora)+'.txt';
  sqlProduto1.Close;
  try
    if StrToInt(edtCodigoPRD.Text) > 0 then
      sqlProduto1.SQL.Text := 'SELECT PRD_CODIGO,PRD_DESCRICAO,PRD_REFERENCIA '+
        ' FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+edtCodigoPRD.Text;
    sqlProduto1.Open;
  except
    Raise exception.Create('Código do Produto inválido!');
  end;
  AssignFile(F1, sNomeArquivo);
  try
    Rewrite(F1);
    if edtCodigoPRD.Text <> '0' then
      Writeln(F1, 'Produto:'+edtCodigoPRD.Text+'-'+
                  sqlProduto1.FieldByName('PRD_DESCRICAO').asString+' '+
                  sqlProduto1.FieldByName('PRD_REFERENCIA').asString);
    sLinha := 'CODIGO;'+PreencheEspaco(40, 'DESCRICAO')+
              ';   Data; Codigo';
    Writeln(F1, sLinha);
    if edtCodigoPRD.Text = '0' then
    Begin
      sqlAux.Close;
      sqlAux.SQL.Text := 'SELECT COUNT(PRD_CODIGO) as TOTAL '+
                         ' FROM PRODUTO '+
                         ' WHERE PRD_SITUACAO<>1 ';
      sqlAux.Open;
      Gauge1.MaxValue := sqlAux.FieldByName('TOTAL').asInteger;
      sqlAux.Close;
    end
    else
      Gauge1.MaxValue := 1;

    Gauge1.Refresh;
    bitMovimentoComercial.Enabled := False;
    bitMovimentoFisico.Enabled := False;    
    bitConfirmar.Enabled := False;
    bitParar.Enabled := True;
    while not sqlProduto1.Eof do
    Begin
      CdPRD := sqlProduto1.FieldByName('PRD_CODIGO').asInteger;
      sDescricao := sqlProduto1.FieldByName('PRD_DESCRICAO').asString+' '+
                    sqlProduto1.FieldByName('PRD_REFERENCIA').asString;
      Application.ProcessMessages;
      if vParar then
      Begin
        ShowMessage('Processo Cancelado!');
        Writeln(F1, 'Processo Cancelado! '+DateTimeToStr(Now));
        Break;
      end;
      Gauge1.Progress := Gauge1.Progress+1;
      Gauge1.Refresh;
      edtTotalVerificado.Text := IntToStr(StrToInt(edtTotalVerificado.Text)+1);
      edtTotalVerificado.Refresh;
      for i:=CdCNC to iCNCFinal do
      Begin
        with sqlAux do
        Begin
          if DM.Configuracao1.Empresa = empEletro then
          Begin
            vDataInicial := StrToDate('01/01/2004');
            vSaldoAnt    := SaldoAnteriorComercial(DM.QR_Consultas, i, CdPRD, vDataInicial);
          end
          else
          Begin
            //Data do Último Inventário Processado
            vDataInicial := 0;
            Close;
            SQL.Text := 'SELECT MAX(I1.INV_CODIGO) as CODIGO_INV '+
              ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
              ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND I1.INV_SITUACAO=1 '+
              ' AND I1.CNC_CODIGO='+IntToStr(i)+
              ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
              ' AND I1.INV_CODIGO=I2.INV_CODIGO';
            Open;
            CdINV := FieldByName('CODIGO_INV').AsInteger;
            if CdINV > 0 then
            Begin
              //Quantidade Inventariada pelo Movimento
              Close;
  {            SQL.Text := 'SELECT MEC_DATA_HORA AS DATA, MEC_ES AS ES, MEC_SALDO_ANT AS QTD_ANT, MEC_QUANTIDADE AS QTD '+
                ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL '+
                ' WHERE PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND CNC_CODIGO='+IntToStr(i)+
                ' AND MEC_ENT_CODIGO='+IntToStr(CdINV)+
                ' AND MEC_TIPO_MOV=1010 ';
  }
              SQL.Text := 'SELECT I1.INV_DATA AS DATA, I2.IIV_QUANT_INF as QTD '+
                ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
                ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND I1.CNC_CODIGO='+IntToStr(i)+
                ' AND I1.INV_CODIGO='+IntToStr(CdINV)+
                ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
                ' AND I1.INV_CODIGO=I2.INV_CODIGO';
              Open;
              vDataInicial := FieldByName('DATA').AsDateTime+StrToTime('23:59:59');
              vSaldoAnt    := Arredonda(FieldByName('QTD').AsInteger);
  {            if FieldByName('ES').asString = 'E' then
                vSaldoAnt    := Arredonda(FieldByName('QTD_ANT').AsInteger+FieldByName('QTD').AsInteger)
              else
                vSaldoAnt    := Arredonda(FieldByName('QTD_ANT').AsInteger-FieldByName('QTD').AsInteger);
  }
            end
            else //Não foi inventariado
            Begin
              //Pegar o Saldo Anterior ao primeiro movimento
              //Matriz
              SQL.Text := 'SELECT TOP 1 MEC_SALDO_ANT AS TOTAL'+
                ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
                ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND I1.CNC_CODIGO='+IntToStr(i)+
                ' ORDER BY I1.MEC_DATA_HORA ASC, I1.MEC_CODIGO ASC ';
              Open;
              if IsEmpty then
              Begin
                Close;
                SQL.Text := 'SELECT SUM(IES_SCOMERCIAL) as TOTAL '+
                  ' FROM ITEM_DE_ESTOQUE I1 '+
                  ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND I1.CNC_CODIGO='+IntToStr(i);
                Open;
              end;
              vSaldoAnt := Arredonda(FieldByName('TOTAL').asFloat);
            end;
          end;

          Close;
          SQL.Text := 'SELECT MEC_CODIGO AS CODIGO '+
            ',MEC_SALDO_ANT AS SALDO_ANT '+
            ',MEC_DATA_HORA AS DATA '+
            ',MEC_QUANTIDADE AS QTD '+
            ',MEC_ES AS TIPO '+
            ' FROM MOVIMENTO_DE_ESTOQUE_COMERCIAL I1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND I1.CNC_CODIGO='+IntToStr(i);
          if vDataInicial > 0 then
            SQL.Add(' AND I1.MEC_DATA_HORA>'+QuotedStr(MesDiaHora(vDataInicial)));
          SQL.Add(' ORDER BY MEC_DATA_HORA ASC, MEC_CODIGO ASC ');
          Open;
          sFalha := '';
          while not Eof do
          Begin
            if sFalha = '.' then //Não mostrar o nome do produto para itens do mesmo produto
              sDescricao := '';
            if (not isEmpty) and
               (vSaldoAnt<>Arredonda(FieldByName('SALDO_ANT').asFloat)) then
            Begin
              sFalha := '.';
              sLinha := PreencheZero(6,CdPRD)+';'+
                        PreencheEspaco(40, sDescricao)+';'+
                        PreencheZero(7, FieldByName('CODIGO').asInteger)+';'+
                        PreencheEspacoEsq(10, FormatDateTime('DD/MM/YYYY', FieldByName('DATA').asDateTime));
              Writeln(F1, sLinha);
            end;
            if FieldByName('TIPO').asString = 'S' then
              vSaldoAnt := Arredonda(FieldByName('SALDO_ANT').asFloat)-Arredonda(FieldByName('QTD').asFloat)
            else
              vSaldoAnt := Arredonda(FieldByName('SALDO_ANT').asFloat)+Arredonda(FieldByName('QTD').asFloat);
            Next;
          end;
          if sFalha = '.' then //Não mostrar o nome do produto para itens do mesmo produto
            sDescricao := '';
          //Verifica Saldo Atual
          Close;
          SQL.Text := 'SELECT * FROM ITEM_DE_ESTOQUE I1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND I1.CNC_CODIGO='+IntToStr(i);
          Open;
          if Arredonda(FieldByName('IES_SCOMERCIAL').asFloat) <> vSaldoAnt then
            sFalha := sFalha + '(Est.Comercial<>MEC)';
          if Arredonda(FieldByName('IES_SCOMERCIAL').asFloat-FieldByName('IES_INDISPONIVEL').asFloat) <>
             Arredonda(FieldByName('IES_SFISICO').asFloat) then
            sFalha := sFalha + '(Comercial<>Fisico)';
          if (sFalha <> '') and
             (sFalha <> '.') then
          Begin
            sLinha := PreencheZero(6,CdPRD)+';'+
                      PreencheEspaco(40, sDescricao)+';'+
                      sFalha;
            Writeln(F1, sLinha);
          end;
          if sFalha <> '' then
          Begin
            edtTotalRegistrado.Text := IntToStr(StrToInt(edtTotalRegistrado.Text)+1);
            edtTotalRegistrado.Refresh;
          end;
        end;
      end;
      if sqlProduto1.Eof then
        Break;
      sqlProduto1.Next;
    end;
    ShowMessage('Arquivo Gerado!');
  finally
    CloseFile(F1);
    btnMovCompra.Enabled := True;
    bitParar.Enabled := False;
    bitMovimentoComercial.Enabled := True;
    bitMovimentoFisico.Enabled := True;
    bitConfirmar.Enabled := True;
    bitTabelaCusto.Enabled := True;
  end;
end;

procedure TfMxVerificaEstoque.bitMovimentoFisicoClick(Sender: TObject);
var
  i, CdINV, CdPRD, CdCNC, iCNCFinal: integer;
  vSaldoAnt: double;
  sNomeArquivo, sLinha, sDescricao, sFalha: string;
  F1: TextFile;
  vDataInicial: TDateTime;
begin
  if not VerificaInteiro(edtCodigoCNC.Text) then
    Raise exception.Create('Centro de Custo inválido!');
  if not VerificaInteiroBranco(edtCodigoPRD.Text) then
    Raise exception.Create('Código do Produto inválido!');
  Gauge1.Progress := 0;

  Caption := 'Verifica Movimento de Estoque Físico';

  if VerificaInteiroBranco(edtCodigoCNC.Text) then
  Begin
    edtCodigoCNC.Text := IntToStr(StrToInt(edtCodigoCNC.Text));
    CdCNC     := StrToInt(edtCodigoCNC.Text);
    iCNCFinal := StrToInt(edtCodigoCNC.Text);
  end
  else
  Begin
    edtCodigoCNC.Clear;
    CdCNC := 0;
    iCNCFinal := 2;
  end;

  vParar := False;
  edtTotalVerificado.Text := '0';
  edtTotalRegistrado.Text := '0';
  sNomeArquivo := 'C:\VerificacaoMEFLoja'+PreencheZero(2,edtCodigoCNC.Text)+'_'+
    formatDateTime('YYYY_MM_DD_HH_MM',DM.Configuracao1.DataHora)+'.txt';
  sqlProduto1.Close;
  try
    if StrToInt(edtCodigoPRD.Text) > 0 then
      sqlProduto1.SQL.Text := 'SELECT PRD_CODIGO,PRD_DESCRICAO,PRD_REFERENCIA '+
        ' FROM PRODUTO '+
        ' WHERE PRD_CODIGO='+edtCodigoPRD.Text;
    sqlProduto1.Open;
  except
    Raise exception.Create('Código do Produto inválido!');
  end;
  AssignFile(F1, sNomeArquivo);
  try
    Rewrite(F1);
    if edtCodigoPRD.Text <> '0' then
      Writeln(F1, 'Produto:'+edtCodigoPRD.Text+'-'+
                  sqlProduto1.FieldByName('PRD_DESCRICAO').asString+' '+
                  sqlProduto1.FieldByName('PRD_REFERENCIA').asString);
    sLinha := 'CODIGO;'+PreencheEspaco(40, 'DESCRICAO')+
              ';   Data; Codigo';
    Writeln(F1, sLinha);
    if edtCodigoPRD.Text = '0' then
    Begin
      sqlAux.Close;
      sqlAux.SQL.Text := 'SELECT COUNT(PRD_CODIGO) as TOTAL '+
                         ' FROM PRODUTO '+
                         ' WHERE PRD_SITUACAO<>1 ';
      sqlAux.Open;
      Gauge1.MaxValue := sqlAux.FieldByName('TOTAL').asInteger;
      sqlAux.Close;
    end
    else
      Gauge1.MaxValue := 1;

    Gauge1.Refresh;
    bitMovimentoComercial.Enabled := False;
    bitMovimentoFisico.Enabled := False;
    bitConfirmar.Enabled := False;
    bitParar.Enabled := True;
    while not sqlProduto1.Eof do
    Begin
      CdPRD := sqlProduto1.FieldByName('PRD_CODIGO').asInteger;
      sDescricao := sqlProduto1.FieldByName('PRD_DESCRICAO').asString+' '+
                    sqlProduto1.FieldByName('PRD_REFERENCIA').asString;
      Application.ProcessMessages;
      if vParar then
      Begin
        ShowMessage('Processo Cancelado!');
        Writeln(F1, 'Processo Cancelado! '+DateTimeToStr(Now));
        Break;
      end;
      Gauge1.Progress := Gauge1.Progress+1;
      Gauge1.Refresh;
      edtTotalVerificado.Text := IntToStr(StrToInt(edtTotalVerificado.Text)+1);
      edtTotalVerificado.Refresh;
      for i:=CdCNC to iCNCFinal do
      Begin
        with sqlAux do
        Begin
          if DM.Configuracao1.Empresa = empEletro then
          Begin
            vDataInicial := StrToDate('01/01/2004');
            vSaldoAnt    := SaldoAnteriorFisico(DM.QR_Consultas, i, CdPRD, vDataInicial);
          end
          else
          Begin
            //Data do Último Inventário Processado
            vDataInicial := 0;
            Close;
            SQL.Text := 'SELECT MAX(I1.INV_CODIGO) as CODIGO_INV '+
              ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
              ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
              ' AND I1.INV_SITUACAO=1 '+
              ' AND I1.CNC_CODIGO='+IntToStr(i)+
              ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
              ' AND I1.INV_CODIGO=I2.INV_CODIGO';
            Open;
            CdINV := FieldByName('CODIGO_INV').AsInteger;
            if CdINV > 0 then
            Begin
              //Quantidade Inventariada
              Close;
              SQL.Text := 'SELECT I1.INV_DATA AS DATA, I2.IIV_QUANT_INF as TOTAL '+
                ' FROM INVENTARIO I1, ITEM_DE_INVENTARIO I2 '+
                ' WHERE I2.PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND I1.CNC_CODIGO='+IntToStr(i)+
                ' AND I1.INV_CODIGO='+IntToStr(CdINV)+
                ' AND I1.CNC_CODIGO=I2.CNC_CODIGO '+
                ' AND I1.INV_CODIGO=I2.INV_CODIGO';
              Open;
              vDataInicial := FieldByName('DATA').AsDateTime;
              vSaldoAnt    := Arredonda(FieldByName('TOTAL').AsInteger);
            end
            else //Não foi inventariado
            Begin
              //Pegar o Saldo Anterior ao primeiro movimento
              //Matriz
              SQL.Text := 'SELECT TOP 1 MEF_SALDO_ANT AS TOTAL'+
                ' FROM MOVIMENTO_DE_ESTOQUE_FISICO I1 '+
                ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                ' AND I1.CNC_CODIGO='+IntToStr(i)+
                ' ORDER BY I1.MEF_DATA ASC, I1.MEF_CODIGO ASC ';
              Open;
              if IsEmpty then
              Begin
                Close;
                SQL.Text := 'SELECT SUM(IES_SFISICO) as TOTAL '+
                  ' FROM ITEM_DE_ESTOQUE I1 '+
                  ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
                  ' AND I1.CNC_CODIGO='+IntToStr(i);
                Open;
              end;
              vSaldoAnt := Arredonda(FieldByName('TOTAL').asFloat);
            end;
          end;

          Close;
          SQL.Text := 'SELECT MEF_CODIGO AS CODIGO '+
            ',MEF_SALDO_ANT AS SALDO_ANT '+
            ',MEF_DATA AS DATA '+
            ',MEF_QUANTIDADE AS QTD '+
            ',MEF_ES AS TIPO '+
            ' FROM MOVIMENTO_DE_ESTOQUE_FISICO I1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND I1.CNC_CODIGO='+IntToStr(i);
          if vDataInicial > 0 then
            SQL.Add(' AND I1.MEF_DATA>'+QuotedStr(MesDiaHora(vDataInicial)));
          SQL.Add(' ORDER BY MEF_DATA ASC, MEF_CODIGO ASC ');
          Open;
          sFalha := '';
          while not Eof do
          Begin
            if sFalha = '.' then //Não mostrar o nome do produto para itens do mesmo produto
              sDescricao := '';
            if (not isEmpty) and
               (vSaldoAnt<>Arredonda(FieldByName('SALDO_ANT').asFloat)) then
            Begin
              sFalha := '.';
              sLinha := PreencheZero(6,CdPRD)+';'+
                        PreencheEspaco(40, sDescricao)+';'+
                        PreencheZero(7, FieldByName('CODIGO').asInteger)+';'+
                        PreencheEspacoEsq(10, FormatDateTime('DD/MM/YYYY', FieldByName('DATA').asDateTime));
              Writeln(F1, sLinha);
            end;
            if FieldByName('TIPO').asString = 'S' then
              vSaldoAnt := Arredonda(FieldByName('SALDO_ANT').asFloat)-Arredonda(FieldByName('QTD').asFloat)
            else
              vSaldoAnt := Arredonda(FieldByName('SALDO_ANT').asFloat)+Arredonda(FieldByName('QTD').asFloat);
            Next;
          end;
          if sFalha = '.' then //Não mostrar o nome do produto para itens do mesmo produto
            sDescricao := '';
          //Verifica Saldo Atual
          Close;
          SQL.Text := 'SELECT * FROM ITEM_DE_ESTOQUE I1 '+
            ' WHERE I1.PRD_CODIGO='+IntToStr(CdPRD)+
            ' AND I1.CNC_CODIGO='+IntToStr(i);
          Open;
          if Arredonda(FieldByName('IES_SFISICO').asFloat) <> vSaldoAnt then
            sFalha := sFalha + '(Est.Fisico<>MEF)';
          if Arredonda(FieldByName('IES_SCOMERCIAL').asFloat-FieldByName('IES_INDISPONIVEL').asFloat) <>
             Arredonda(FieldByName('IES_SFISICO').asFloat) then
            sFalha := sFalha + '(Comercial<>Fisico)';
          if (sFalha <> '') and
             (sFalha <> '.') then
          Begin
            sLinha := PreencheZero(6,CdPRD)+';'+
                      PreencheEspaco(40, sDescricao)+';'+
                      sFalha;
            Writeln(F1, sLinha);
          end;
          if (sFalha <> '') then
          Begin
            edtTotalRegistrado.Text := IntToStr(StrToInt(edtTotalRegistrado.Text)+1);
            edtTotalRegistrado.Refresh;
          end;
        end;
      end;
      if sqlProduto1.Eof then
        Break;
      sqlProduto1.Next;
    end;
    ShowMessage('Arquivo Gerado!');
  finally
    CloseFile(F1);
    btnMovCompra.Enabled := True;
    bitParar.Enabled := False;
    bitMovimentoComercial.Enabled := True;
    bitMovimentoFisico.Enabled := True;
    bitConfirmar.Enabled := True;
    bitTabelaCusto.Enabled := True;
  end;
end;

end.


