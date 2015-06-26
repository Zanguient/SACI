unit MxSelEstoqueAnterior;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables, SQuery, Fornecedor,
  DBCtrls, Grupo, Produto, SubGrupo, Variants;

type
  TfMxSelEstoqueAnterior = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bitOK: TBitBtn;
    bitCancelar: TBitBtn;
    DSGrupo: TDataSource;
    Centro_de_Custo: TQuery;
    DSCentro_de_Custo: TDataSource;
    SubGrupo1: TSubGrupo;
    DSSubGrupo1: TDataSource;
    Panel3: TPanel;
    Label1: TLabel;
    mskDataINI: TMaskEdit;
    Grupo1: TGrupo;
    Fornecedor1: TFornecedor;
    GroupBox1: TGroupBox;
    rdgPreco: TRadioGroup;
    ckbSintetico: TCheckBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edtValorX: TEdit;
    rdgEstoqueDisponivel: TRadioGroup;
    rdbEstoqueFisico: TRadioButton;
    rdbEstoqueComercial: TRadioButton;
    rdbEstoqueFiscal: TRadioButton;
    rdbEstoqueLJ3: TRadioButton;
    GroupBox3: TGroupBox;
    labFornecedor: TLabel;
    edtCodigoPRD: TEdit;
    edtCodigoFOR: TEdit;
    dblCodigoGRP: TDBLookupComboBox;
    dblCentroDeCusto: TDBLookupComboBox;
    ckbCodigCNC: TCheckBox;
    ckbCodigoSGP: TCheckBox;
    dblCodigoSGP: TDBLookupComboBox;
    ckbCodigoPRD: TCheckBox;
    ckbCodigoFOR: TCheckBox;
    ckbCodigoGRP: TCheckBox;
    ckbSomenteDesativados: TCheckBox;
    ckbDetalhe: TCheckBox;
    ckbReferencia: TCheckBox;
    edtReferencia: TEdit;
    cmbDetalhe: TComboBox;
    ckbSomenteAtivados: TCheckBox;
    Label6: TLabel;
    cmbOrdem: TComboBox;
    ckbAgruparFornecedor: TCheckBox;
    ckbSomenteCompraZero: TCheckBox;
    ckbSomenteCustoZero: TCheckBox;
    ckbMalaDireta: TCheckBox;
    edtArquivoMalaDireta: TEdit;
    rdbEstoqueLJ4: TRadioButton;
    procedure bitOKClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton5Click(Sender: TObject);
    procedure ckbCodigCNCClick(Sender: TObject);
    procedure ckbCodigoSGPClick(Sender: TObject);
    procedure dblCodigoGRPClick(Sender: TObject);
    procedure ckbCodigoPRDClick(Sender: TObject);
    procedure ckbCodigoFORClick(Sender: TObject);
    procedure ckbCodigoGRPClick(Sender: TObject);
    procedure ckbDetalheClick(Sender: TObject);
    procedure ckbReferenciaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodigoFORExit(Sender: TObject);
    procedure rdgEstoqueDisponivelClick(Sender: TObject);
    procedure ckbSomenteDesativadosClick(Sender: TObject);
    procedure ckbSomenteAtivadosClick(Sender: TObject);
    procedure ckbMalaDiretaClick(Sender: TObject);
  private

  public
    { Public declarations }
     cDTINI_V1:string;
  end;

var
  fMxSelEstoqueAnterior: TfMxSelEstoqueAnterior;

implementation

uses
  UProduto, funcoes, UDM, MxSPediProd, MxSCotaFor,
  UEstoqueAnterior, MxSPediProdMotCal, SysConst;

{$R *.DFM}


procedure TfMxSelEstoqueAnterior.bitOKClick(Sender: TObject);
var
  mensagem,centro,CdPRD,CdFOR,CdGRP,CdSGP,cRef,cDetalhe,
    cDTINI, cSituacao, sFiltros, sDescricao,
    sCaracteristica, sDetalhe,sReferencia, sMarca,
    sCodigoBarras, sLinha, sRegistro, sCodigoPRD, sProduto1, sCusto, sCompra, sICMS, sOrdem:string;
  vEstoque, vCusto, vCompra, vICMS, vQtdFornecedor, vCustoFornecedor, vCompraFornecedor: Double;
  iQtdRegistros, j, iPRD, iFOR, iFORAnt: integer;
  Arq : TextFile;
  vSalvar: Boolean;
begin
  mensagem:='';
  CdPRD:='';
  CdFOR:='';
  CdGRP:='';
  CdSGP:='';
  cDetalhe:='';
  cRef:='';
  sFiltros:='';
  cDTINI_V1:='';
  cDTINI_V1:='';
  cDtINI:='';
  cSituacao:='';
  sOrdem:='';


  if not VerificaData(mskDataINI.Text) then
    mensagem:=mensagem+'Data inicial digitada incorretamente!'+#13;

  if mensagem<>'' then
    raise exception.Create(mensagem);

  if ckbCodigoPRD.Checked then
    if not VerificaInteiroBranco(edtCodigoPRD.Text) then
      Raise Exception.Create('Código do Produto inválido!')
    else
    Begin
      CdPRD:= ' AND (T2.PRD_CODIGO='+edtCodigoPRD.Text+') ';
      sFiltros := sFiltros + ' (PRD:'+edtCodigoPRD.Text+')';
    end;

  if ckbCodigoFOR.Checked then
    if not VerificaInteiroBranco(edtCodigoFOR.Text) then
      Raise Exception.Create('Código do Fornecedore inválido!')
    else
    Begin
      CdFOR:= ' AND (T2.FOR_CODIGO='+edtCodigoFOR.Text+') ';
      sFiltros := sFiltros + ' (FOR:'+edtCodigoFOR.Text+')';
    end;

  if ckbReferencia.Checked then
  Begin
    cRef:= ' AND (T2.PRD_REFERENCIA="'+edtReferencia.Text+'") ';
    sFiltros := sFiltros + ' (Ref.:'+edtReferencia.Text+')';
  end;

  if ckbCodigoGRP.Checked then
  Begin
    CdGRP:= ' AND (T2.GRP_CODIGO='+IntToStr(dblCodigoGRP.KeyValue)+') ';
    sFiltros := sFiltros + ' (GRP:'+IntToStr(dblCodigoGRP.KeyValue)+'-'+dblCodigoGRP.Text+')';
  end;

  if ckbCodigoSGP.Checked then
  Begin
    CdSGP:= ' AND (T2.SGP_CODIGO='+IntToStr(dblCodigoSGP.KeyValue)+') ';
    sFiltros := sFiltros + ' (SGP:'+IntToStr(dblCodigoSGP.KeyValue)+'-'+dblCodigoSGP.Text+')';
  end;

  if ckbCodigCNC.Checked then
  Begin
    Centro:=' AND (CNC_CODIGO = '+IntToStr(dblCentroDeCusto.KeyValue)+') '; //Não pode ter Alias
    sFiltros := sFiltros + ' (CNC:'+IntToStr(dblCentroDeCusto.KeyValue)+')';
  end;

  if ckbDetalhe.Checked then
  Begin
    if cmbDetalhe.ItemIndex < 0 then
      Raise Exception.Create('Detalhe inválido!')
    else
    Begin
      cDetalhe:= ' AND (T2.PRD_DETALHE="'+Trim(cmbDetalhe.Items[cmbDetalhe.ItemIndex])+'") ';
      sFiltros := sFiltros + ' (Detalhe:'+Trim(cmbDetalhe.Items[cmbDetalhe.ItemIndex])+')';
    end;
  end;

  if ckbSomenteDesativados.Checked then
  Begin
    cSituacao:=' AND (T2.PRD_SITUACAO = 1) ';
    sFiltros := sFiltros + ' (Desativados)';
  end
  else if ckbSomenteAtivados.Checked then
  Begin
    cSituacao:=' AND (T2.PRD_SITUACAO <> 1) ';
    sFiltros := sFiltros + ' (Ativados)';
  end;

  if ckbSomenteCustoZero.Checked then
    sFiltros := sFiltros + '(CustoZero)';
  if ckbSomenteCompraZero.Checked then
    sFiltros := sFiltros + '(CompraZero)';

  if rdbEstoqueFiscal.Checked then
    sFiltros := sFiltros + '(Fisc)'
  else if rdbEstoqueLJ3.Checked then
    sFiltros := sFiltros + '(LJ3)'
  else if rdbEstoqueLJ4.Checked then
    sFiltros := sFiltros + '(LJ4)'
  else if rdbEstoqueFisico.Checked then
    sFiltros := sFiltros + '(Fisico)'
  else if rdbEstoqueComercial.Checked then
    sFiltros := sFiltros + '(Comercial)';

  case rdgEstoqueDisponivel.ItemIndex of
    0: sFiltros := sFiltros + '(<'+edtValorX.Text+') ';
    1: sFiltros := sFiltros + '(='+edtValorX.Text+') ';
    2: sFiltros := sFiltros + '(>'+edtValorX.Text+') ';
    3: sFiltros := sFiltros + '(<='+edtValorX.Text+') ';
    4: sFiltros := sFiltros + '(>='+edtValorX.Text+') ';
    5: sFiltros := sFiltros + '(<>'+edtValorX.Text+') ';
  end;

  if ckbAgruparFornecedor.Checked then
    sOrdem := ' FOR_CODIGO,';
  case cmbOrdem.ItemIndex of
    0: sOrdem := sOrdem + 'PRD_CODIGO';                    //Código
    1: sOrdem := sOrdem + 'PRD_DESCRICAO, PRD_REFERENCIA'; //Descrição
    2: sOrdem := sOrdem + 'PRD_REFERENCIA, PRD_DESCRICAO'; //Referência
  end;

  iFOR := 0;
  if tag = 0 then //Posição de Estoque Anterior
  begin
    if not ckbMalaDireta.Checked then
    Begin
      Application.CreateForm(Trpt_EstoqueAnterior, rpt_EstoqueAnterior);
      with rpt_EstoqueAnterior do
      Begin
        zrbGrupoCodigoFOR.Height := 0;
        zlrFiltros.Caption := sFiltros;
        try
          DataINI := StrToDate(mskDataINI.Text);
        except
          ShowMessage('Data inválida!');
          Exit;
        end;
        if ckbSintetico.Checked then
        Begin
          zrlDescReferencia.Enabled := False;
          zrbDetalhe.Height := 0;
        end;

        if not ckbAgruparFornecedor.Checked then
        Begin
          zrbGrupoCodigoFOR.Expression := '';
          zrbRodapeGrupoCodigoFOR.Height := 0;
        end;

        iCdCNC := dblCentroDeCusto.KeyValue;
        vSomenteCustoZero  := ckbSomenteCustoZero.Checked;
        vSomenteCompraZero := ckbSomenteCompraZero.Checked;
        SZRLabel5.Caption := mskDataINI.Text;

        Entidade.Close;
        Entidade.SQL.Text:='SELECT * '+
          ' FROM Produto T2 '+
          ' WHERE PRD_CODIGO<>-1 '+
          CdPRD+CdFOR+CdGRP+CdSGP+cSituacao+cDetalhe+cRef+
          ' ORDER BY '+sOrdem;
        Entidade.Open;
        if Entidade.isEmpty then
          Raise Exception.Create('Consulta Vazia!');
        report.Preview;
        Close;
      end;
    end
    else //Mala Direta
    Begin
      if Trim(edtArquivoMalaDireta.Text) = '' then
        Raise exception.Create('Nome do Arquivo inválido!');

      with DM.qr_consultas2 do
      Begin
        Close;
        SQL.Text := 'SELECT  * '+
          ' FROM PRODUTO T2 '+
          ' WHERE PRD_CODIGO<>-1 '+
          CdPRD+CdFOR+CdGRP+CdSGP+cSituacao+cDetalhe+cRef+
          ' ORDER BY '+sOrdem;
        Open;
        if IsEmpty then
          Raise Exception.Create('Consulta vazia!');

        iQtdRegistros := 0;
        try
          AssignFile(Arq, edtArquivoMalaDireta.Text);
          Rewrite(Arq);
          Writeln(Arq, 'Produto1;Codigo;CodigoFOR;Descricao;Referencia;Caracteristica;Marca;Detalhe;CodBarras;Quantidade;Custo;Compra;ICMS;TotalCusto;TotalCompra');

          iFORAnt := 0;
          vQtdFornecedor    := 0;
          vCustoFornecedor  := 0;
          vCompraFornecedor := 0;
          while not EOF do
          begin
            vSalvar := True;

            iPRD := FieldByName('PRD_CODIGO').asInteger;
            iFOR := FieldByName('FOR_CODIGO').asInteger;

            vEstoque := 0;
            if rdbEstoqueFisico.Checked then //Estoque Fisico
              vEstoque := SaldoAnteriorFisico(DM.QR_Comandos, dblCentroDeCusto.KeyValue, iPRD, StrToDate(mskDataINI.Text))
            else if rdbEstoqueComercial.Checked then //Estoque Comercial
              vEstoque := SaldoAnteriorComercial(DM.QR_Comandos, dblCentroDeCusto.KeyValue, iPRD, StrToDate(mskDataINI.Text))
            else if rdbEstoqueFiscal.Checked then //Estoque Fiscal
              vEstoque := SaldoAnteriorFiscal(DM.QR_Comandos, dblCentroDeCusto.KeyValue, iPRD, StrToDate(mskDataINI.Text))
            else if rdbEstoqueLJ3.Checked then //Estoque LJ3
              vEstoque := SaldoAnteriorSN(DM.QR_Comandos, dblCentroDeCusto.KeyValue, iPRD, StrToDate(mskDataINI.Text))
            else if rdbEstoqueLJ4.Checked then //Estoque LJ4
              vEstoque := SaldoAnteriorLJ4(DM.QR_Comandos, dblCentroDeCusto.KeyValue, iPRD, StrToDate(mskDataINI.Text));

            case rdgEstoqueDisponivel.ItemIndex of
              0 : if not (vEstoque < 0) then
                    vSalvar := False;
              1 : if not (vEstoque = 0) then
                    vSalvar := False;
              2 : if not (vEstoque > 0) then
                    vSalvar := False;
              3 : if not (vEstoque <= 0) then
                    vSalvar := False;
              4 : if not (vEstoque >= 0) then
                    vSalvar := False;
              5 : if not (vEstoque <> 0) then
                    vSalvar := False;
            end;

            with DM.QR_Consultas do
            Begin
              Close;
              SQL.Text := 'SELECT TOP 1 CUS_VALOR_MEDIO AS CUSTO '+
                ',CUS_VALOR_COMPRA AS COMPRA '+
                ',CUS_ICMS AS ICMS '+
                ' FROM CUSTO '+
                ' WHERE PRD_CODIGO='+IntToStr(iPRD)+
                ' AND CUS_DT_CADASTRO<="'+MesDia(StrToDate(mskDataINI.Text)+1)+'" '+
                ' ORDER BY CUS_DT_CADASTRO DESC ';
              Open;
              if IsEmpty then
              Begin
                vCusto  := 0;
                vCompra := 0;
                vICMS   := 0;
              end
              else
              Begin
                vCompra := Arredonda(FieldByName('COMPRA').asFloat);
                vCusto  := Arredonda(FieldByName('CUSTO').asFloat);
                vICMS   := Arredonda(FieldByName('ICMS').asFloat);
              end;
            end;

            if (ckbSomenteCompraZero.Checked and
                (vCompra <> 0)) or
               (ckbSomenteCustoZero.Checked and
                (vCusto <> 0)) then
               vSalvar := False;

            if vSalvar then
            Begin
              if (iFOR <> iFORAnt) and
                 (iFORAnt > 0) and
                 (ckbAgruparFornecedor.Checked) then
              Begin
                with DM.QR_Consultas do
                Begin
                  Close;
                  SQL.Text := 'SELECT FOR_RZ_SOCIAL AS FORNECEDOR '+
                    ' FROM FORNECEDOR '+
                    ' WHERE FOR_CODIGO='+IntToStr(iFORAnt);
                  Open;
                  sDescricao    := FieldByName('FORNECEDOR').asString;
                end;

                sRegistro := '"";"'+ //sProduto1
                  '";"'+ //CodigoPRD
                  PreencheZero(6, iFORAnt)+'";"'+
                  sDescricao+'";"'+
                  '";"'+ //Referencia
                  '";"'+ //Caracteristica
                  '";"'+ //Marca
                  '";"'+ //Detalhe
                  '";"'+ //Código de Barras
                  Format('%.2f',[vQtdFornecedor])+'";"'+
                  '";"'+ //Custo
                  '";"'+ //Compra
                  '";"'+ //ICMS
                  Format('%.2f',[vCustoFornecedor])+'";"'+ //Se não for agrupado será igual a vCusto*vEstoque
                  Format('%.2f',[vCompraFornecedor])+'"';  //Se não for agrupado será igual a vCompra*vEstoque
                Writeln(Arq, sRegistro);

                inc(iQtdRegistros);

                vQtdFornecedor    := 0;
                vCustoFornecedor  := 0;
                vCompraFornecedor := 0;
              end;

              if ckbAgruparFornecedor.Checked then
              Begin
                iFORAnt := iFOR;
                
                vQtdFornecedor := vQtdFornecedor + Arredonda(vEstoque);

                if vCusto > 0 then
                  vCustoFornecedor := vCustoFornecedor + Arredonda(vEstoque*vCusto);

                if vCompra > 0 then
                  vCompraFornecedor := vCompraFornecedor + Arredonda(vEstoque*vCompra);
              end
              else //Não é agrupar Fornecedor
              Begin
                sDescricao      := FieldByName('PRD_DESCRICAO').asString;
                sCaracteristica := FieldByName('PRD_CARACTERISTICA').asString;
                sReferencia     := FieldByName('PRD_REFERENCIA').asString;
                sDetalhe        := FieldByName('PRD_DETALHE').asString;
                //Código de Barras
                with DM.QR_Consultas do
                Begin
                  Close;
                  SQL.Text := 'SELECT TOP 1 * '+
                    ' FROM CODIGO_DE_BARRAS '+
                    ' WHERE CDB_CODIGO_ENTRADA='+IntToStr(iPRD)+
                    ' AND CDB_TIPO=0 ';
                  Open;
                  sCodigoBarras := FieldByName('CDB_CODIGO_BARRAS').asString;
                end;

                sLinha := IntToStr(iPRD);
                for j:=1 to length(sLinha) do
                Begin
                  if slinha[j]='0' then
                    slinha[j]:='C'
                  else if slinha[j]='6' then
                    slinha[j]:='D';
                end;
                sProduto1 := PreencheEspacoEsq(6, sLinha, 'C');
                sCodigoPRD := PreencheZero(6, iPRD);
                sCusto  := Format('%.2f',[vCusto]);
                sCompra := Format('%.2f',[vCompra]);
                sICMS   := Format('%.2f',[vICMS]);
                vQtdFornecedor    := vEstoque;
                vCustoFornecedor  := vCusto*vEstoque;
                vCompraFornecedor := vCompra*vEstoque;

                sRegistro := '"'+sProduto1+'";"'+
                  sCodigoPRD+'";"'+
                  PreencheZero(6, iFOR)+'";"'+
                  sDescricao+'";"'+
                  sReferencia+'";"'+
                  sCaracteristica+'";"'+
                  sMarca+'";"'+
                  sDetalhe+'";"'+
                  sCodigoBarras+'";"'+
                  Format('%.2f',[vQtdFornecedor])+'";"'+
                  sCusto+'";"'+
                  sCompra+'";"'+
                  sICMS+'";"'+
                  Format('%.2f',[vCustoFornecedor])+'";"'+ //Se não for agrupado será igual a vCusto*vEstoque
                  Format('%.2f',[vCompraFornecedor])+'"';  //Se não for agrupado será igual a vCompra*vEstoque
                Writeln(Arq, sRegistro);

                inc(iQtdRegistros);
              end;
            end;
            Next;
          end;
          if ckbAgruparFornecedor.Checked then
          Begin
            //Terminou último registro mas não foi impresso por não ter iFOR<>iFORAnt

            with DM.QR_Consultas do
            Begin
              Close;
              SQL.Text := 'SELECT FOR_RZ_SOCIAL AS FORNECEDOR '+
                ' FROM FORNECEDOR '+
                ' WHERE FOR_CODIGO='+IntToStr(iFOR);
              Open;
              sDescricao    := FieldByName('FORNECEDOR').asString;
            end;

            sRegistro := '"";"'+ //sProduto1
              '";"'+ //CodigoPRD
              PreencheZero(6, iFOR)+'";"'+
              sDescricao+'";"'+
              '";"'+ //Referencia
              '";"'+ //Caracteristica
              '";"'+ //Marca
              '";"'+ //Detalhe
              '";"'+ //Código de Barras
              Format('%.2f',[vQtdFornecedor])+'";"'+
              '";"'+ //Custo
              '";"'+ //Compra
              '";"'+ //ICMS
              Format('%.2f',[vCustoFornecedor])+'";"'+ //Se não for agrupado será igual a vCusto*vEstoque
              Format('%.2f',[vCompraFornecedor])+'"';  //Se não for agrupado será igual a vCompra*vEstoque
            Writeln(Arq, sRegistro);

            inc(iQtdRegistros);
          end;
        finally
          CloseFile(Arq);
          if iQtdRegistros > 0 then
            ShowMessage('Gerado '+IntToStr(iQtdRegistros)+' registros(s)!')
          else
            ShowMessage('Não foi gerado nenhum registro!');
        end;
      end;
      Exit;
    end;
  end;
end;

procedure TfMxSelEstoqueAnterior.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfMxSelEstoqueAnterior.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then 
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=52;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=52;
        ShowModal;
      end;
    end;
    edtCodigoPRD.SetFocus;
  End;
end;

procedure TfMxSelEstoqueAnterior.edtCodigoFORKeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    Application.CreateForm(TfMxSCotaFor, fMxSCotaFor);
    fMxSCotaFor.Fornecedor1.Close;
    fMxSCotaFor.Fornecedor1.SQL.Text:='SELECT * FROM FORNECEDOR ORDER BY FOR_RZ_SOCIAL';
    fMxSCotaFor.Fornecedor1.Open;
    fMxSCotaFor.tag:=30;
    fMxSCotaFor.ShowModal;
    edtCodigoFORExit(sender);
  end;
end;

procedure TfMxSelEstoqueAnterior.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Grupo1.Close;
  SubGrupo1.Close;
  Centro_de_Custo.Close;
  Action := caFree;  
end;


procedure TfMxSelEstoqueAnterior.RadioButton5Click(Sender: TObject);
begin
  edtCodigoPRD.Color:=AlteraCorComponentes;
  edtCodigoPRD.Enabled:=False;
  edtCodigoFOR.Color:=AlteraCorComponentes;
  edtCodigoFOR.Enabled:=False;
  Centro_de_Custo.Open;
  dblCodigoGRP.Enabled:=False;
  dblCodigoGRP.Color:=AlteraCorComponentes;
  dblCentroDeCusto.Enabled:=True;
  dblCentroDeCusto.Color:=clWindow;
  dblCentroDeCusto.SetFocus;
end;


procedure TfMxSelEstoqueAnterior.ckbCodigCNCClick(Sender: TObject);
begin
  if ckbCodigCNC.Checked then
  begin
    Centro_de_Custo.Open;
    dblCentroDeCusto.Enabled:=True;
    dblCentroDeCusto.Color:=clWindow;
    dblCentroDeCusto.KeyValue:=DM.Configuracao1.CodigoCNC;
    dblCentroDeCusto.SetFocus;
  end
  else
  begin
    dblCentroDeCusto.Enabled:=False;
    dblCentroDeCusto.Color:=AlteraCorComponentes;
    dblCentroDeCusto.KeyValue:=-1;
  end;
end;

procedure TfMxSelEstoqueAnterior.ckbCodigoSGPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    if not (dblCodigoGRP.KeyValue > 0)then
    Begin
      ShowMessage('Selecione primeiro o grupo!');
      ckbCodigoSGP.Checked:=False;
      exit;
    end
    else
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
      dblCodigoSGP.Enabled:=True;
      dblCodigoSGP.color:=clWindow;
      dblCodigoSGP.KeyValue:=SubGrupo1.CodigoSGP;
    end;
  end
  else
  Begin
      dblCodigoSGP.Enabled:=False;
      dblCodigoSGP.color:=AlteraCorComponentes;
      dblCodigoSGP.KeyValue:=0;
  end;
end;

procedure TfMxSelEstoqueAnterior.dblCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoSGP.Checked then
  Begin
    if dblCodigoGRP.KeyValue > 0 then
    Begin
      SubGrupo1.Close;
      SubGrupo1.ParamByName('GRP_CODIGO').asInteger:=dblCodigoGRP.KeyValue;
      SubGrupo1.Open;
    end;
  end;
end;

procedure TfMxSelEstoqueAnterior.ckbCodigoPRDClick(Sender: TObject);
begin
  if ckbCodigoPRD.Checked then
  Begin
    edtCodigoPRD.Color:=clWindow;
    edtCodigoPRD.Enabled:=True;
    edtCodigoPRD.SetFocus;
  end
  else
  Begin
    edtCodigoPRD.Color:=AlteraCorComponentes;
    edtCodigoPRD.Enabled:=False;
    edtCodigoPRD.Clear;
  end;
end;

procedure TfMxSelEstoqueAnterior.ckbCodigoFORClick(Sender: TObject);
begin
  if ckbCodigoFOR.Checked then
  Begin
    edtCodigoFOR.Color:=clWindow;
    edtCodigoFOR.Enabled:=True;
    edtCodigoFOR.SetFocus;
  end
  else
  Begin
    edtCodigoFOR.Color:=AlteraCorComponentes;
    edtCodigoFOR.Enabled:=False;
    edtCodigoFOR.Clear;
  end;
end;

procedure TfMxSelEstoqueAnterior.ckbCodigoGRPClick(Sender: TObject);
begin
  if ckbCodigoGRP.Checked then
  Begin
    Grupo1.Open;
    dblCodigoGRP.Enabled:=True;
    dblCodigoGRP.Color:=clWindow;
    dblCodigoGRP.KeyValue:=Grupo1.CodigoGRP;
    ckbCodigoSGP.Enabled:=True;
    dblCodigoGRP.SetFocus;
  end
  else
  Begin
    Grupo1.Close;
    dblCodigoGRP.Enabled:=False;
    dblCodigoGRP.Color:=AlteraCorComponentes;
    ckbCodigoSGP.Enabled:=False;
    dblCodigoGRP.KeyValue := 0;
  end;
end;

procedure TfMxSelEstoqueAnterior.ckbDetalheClick(Sender: TObject);
begin
  if ckbDetalhe.Checked then
  Begin
    cmbDetalhe.Enabled:=True;
    cmbDetalhe.Color:=clWindow;
    if cmbDetalhe.Items.Count <= 1 then
    Begin
      cmbDetalhe.Clear;
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text := 'SELECT DISTINCT PRD_DETALHE FROM PRODUTO '+
          ' ORDER BY PRD_DETALHE ';
        Open;
        while not EOF do
        Begin
          cmbDetalhe.Items.Add(FieldByName('PRD_DETALHE').asString);
          Next;
        end;
      end;
    end;
    cmbDetalhe.ItemIndex := 0;
    cmbDetalhe.SetFocus;
  end
  else
  Begin
    cmbDetalhe.Enabled:=False;
    cmbDetalhe.Color:=AlteraCorComponentes;
    cmbDetalhe.ItemIndex := -1;
  end;
end;

procedure TfMxSelEstoqueAnterior.ckbReferenciaClick(Sender: TObject);
begin
  if ckbReferencia.Checked then
  Begin
    edtReferencia.Color:=clWindow;
    edtReferencia.Enabled:=True;
    edtReferencia.SetFocus;
  end
  else
  Begin
    edtReferencia.Color:=AlteraCorComponentes;
    edtReferencia.Enabled:=False;
    edtReferencia.Clear;
  end;
end;

procedure TfMxSelEstoqueAnterior.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if Tag <> 0 then
  Begin
    ckbSomenteCustoZero.Enabled := False;
    ckbSomenteCompraZero.Enabled := False;
  end;
  ckbCodigCNC.Enabled := False;
  ckbCodigCNC.Checked := True;
  cmbOrdem.ItemIndex := 1;
  mskDataINI.SetFocus;
end;

procedure TfMxSelEstoqueAnterior.edtCodigoFORExit(Sender: TObject);
begin
  labFornecedor.Caption := '';
  with Fornecedor1 do
  Begin
    try
      if StrToInt(edtCodigoFOR.Text) <> CodigoFOR then
      Begin
        Close;
        ParamByName('FOR_CODIGO').asInteger := StrToInt(edtCodigoFOR.Text);
        Open;
      end;
      if IsEmpty then
        labFornecedor.Caption := '.'
      else
        labFornecedor.Caption := RazaoSocial;
    except
    end;
  end;
end;

procedure TfMxSelEstoqueAnterior.rdgEstoqueDisponivelClick(Sender: TObject);
begin
  if not edtValorX.Enabled then
  Begin
    edtValorX.Enabled := True;
    edtValorX.Text := '0';
  end;
end;

procedure TfMxSelEstoqueAnterior.ckbSomenteDesativadosClick(
  Sender: TObject);
begin
  if ckbSomenteDesativados.Checked then
    ckbSomenteAtivados.Checked := False;
end;

procedure TfMxSelEstoqueAnterior.ckbSomenteAtivadosClick(Sender: TObject);
begin
  if ckbSomenteAtivados.Checked then
    ckbSomenteDesativados.Checked := False;
end;

procedure TfMxSelEstoqueAnterior.ckbMalaDiretaClick(Sender: TObject);
begin
  if ckbMalaDireta.Checked then
  Begin
    edtArquivoMalaDireta.Enabled:=True;
    edtArquivoMalaDireta.Color:=clWindow;
    edtArquivoMalaDireta.Text := 'C:\SIAC_PosicaoAnterior.txt';
    edtArquivoMalaDireta.SetFocus;
  end
  else
  Begin
    edtArquivoMalaDireta.Enabled:=False;
    edtArquivoMalaDireta.Color:=AlteraCorComponentes;
    edtArquivoMalaDireta.Clear;
  end;
end;

end.
