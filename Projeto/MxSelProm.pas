unit MxSelProm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Mask, Inifiles;

type
  TfmxSelProm = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bitConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    rdgPromissoria: TRadioButton;
    rdgContrato: TRadioButton;
    rdgBoleto: TRadioButton;
    Edit1: TEdit;
    Catraca: TQuery;
    rdgCarneGrafico: TRadioButton;
    rdgCarneCompleto: TRadioButton;
    Bevel1: TBevel;
    procedure bitConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Entrada: Boolean;
    NaoFinalizado : String;
  end;

var
  fmxSelProm: TfmxSelProm;

implementation

uses UDM, funcoes, UPromissoria, MxPedidoRapido, UPromissoria2, MxSPediLocImpPromis,
  UBoletoBancario, UCarnetCont, UCarnet, UBoletoBancarioLBM,
  MxPedidoMotCal, MxPacoteVenda, Pedido_de_Venda, UCarnetMotical,
  UPapeletaDeRecebimento, MxSelPromissoriaRecibo, UCarnetLuciano,
  MxLocalizarPacoteVenda, UBoletoBancarioLuciano, MxPedidoMotCal_2;

{$R *.DFM}


procedure TfmxSelProm.bitConfirmarClick(Sender: TObject);
var
  CdCNC, CdPDV, CdFPECNC, CdFPE, QTDTIT, iSituacao:integer;
  vDataEmissao: TDateTime;
  sPedido,sIntervaloPDV,sIntervaloPDVCNC,sAux: string;
  vTotalTitulo: Double;
begin
  NaoFinalizado := '';
  CdCNC        := 0;
  CdPDV        := 0;
  CdFPE        := 0;
  CdFPECNC     := 0;
  vDataEmissao := 0;
  iSituacao := 4; //Padrão Pedidos Finalizados
  if tag = 0 then  //Pedido Rápido
  begin
    CdCNC        := fmxPedidoRapido.Entidade.CodigoCNC;
    CdPDV        := fmxPedidoRapido.Entidade.CodigoPDV;
    CdFPE        := fmxPedidoRapido.Entidade.CodigoFPE;
    CdFPECNC     := fmxPedidoRapido.Entidade.FaturamentoCNC;
    vDataEmissao := fmxPedidoRapido.Entidade.DataEmissaoVenda;
    iSituacao    := fmxPedidoRapido.Entidade.Situacao;
    sIntervaloPDV    := IntToStr(CdPDV);
    sIntervaloPDVCNC := IntToStr(CdCNC);
  end
  else if tag = 2 then
  Begin
    sAux := fMxSPedLocImpPromis.edtLocalizar.Text;
    CdCNC        := fMxSPedLocImpPromis.Entidade.CodigoCNC;
    CdPDV        := fMxSPedLocImpPromis.Entidade.CodigoPDV;
    CdFPE        := fMxSPedLocImpPromis.Entidade.CodigoFPE;
    CdFPECNC     := fMxSPedLocImpPromis.Entidade.FaturamentoCNC;
    vDataEmissao := fMxSPedLocImpPromis.Entidade.DataEmissaoVenda;
    iSituacao    := fMxSPedLocImpPromis.Entidade.Situacao;
    if (DM.Configuracao1.Empresa = empMotical) and
       (VerificaIntervaloInteiroBranco(sAux)) and  //Definido um Intervalo de Nota
       (rdgCarneGrafico.checked) then
    Begin
      with DM.QR_Consultas do
      Begin
        Close;
        SQL.Text:='SELECT CNC_CODIGO,PDV_CODIGO,FPE_CODIGO,CNC_FATURAMENTO_PENDENTE '+
          ' FROM PEDIDO_DE_VENDA P1 '+
          ' WHERE P1.PDV_SITUACAO=4 '+
          ' AND P1.PDV_EM_USO<>1 '+
          ' AND P1.PDV_NOTA_FISCAL>='+Copy(sAux,1,Pos('-',sAux)-1)+
          ' AND P1.PDV_NOTA_FISCAL<='+Copy(sAux,Pos('-',sAux)+1,Length(sAux)-Pos('-',sAux))+
          ' AND P1.PDV_NOTA_FISCAL IS NOT NULL '+
          ' AND EXISTS (SELECT TRC_CODIGO FROM TITULO_A_RECEBER T1 '+
          ' WHERE T1.PDV_CODIGO=P1.PDV_CODIGO)';
        Open;
        sIntervaloPDV    := '';
        sIntervaloPDVCNC := '';
        while not Eof do
        Begin
          if sIntervaloPDV <> '' then
          Begin
            sIntervaloPDV    := sIntervaloPDV    + ',';
            sIntervaloPDVCNC := sIntervaloPDVCNC + ',';
          end;
          sIntervaloPDV    := sIntervaloPDV    + FieldByName('PDV_CODIGO').asString;
          sIntervaloPDVCNC := sIntervaloPDVCNC + FieldByName('CNC_CODIGO').asString;
          Next;
        end;
      end;
    end
    else
    Begin
      sIntervaloPDV    := IntToStr(CdPDV);
      sIntervaloPDVCNC := IntToStr(CdCNC);
    end;
  end
  else if tag = 4 then
  Begin
    (*
    CdCNC        := fmxPedidoLBM.Entidade.CodigoCNC;
    CdPDV        := fmxPedidoLBM.Entidade.CodigoPDV;
    CdFPE        := fmxPedidoLBM.Entidade.CodigoFPE;
    CdFPECNC     := fmxPedidoLBM.Entidade.FaturamentoCNC;
    vDataEmissao := fmxPedidoLBM.Entidade.DataEmissaoVenda;
    iSituacao    := fmxPedidoLBM.Entidade.Situacao;
    sIntervaloPDV    := IntToStr(CdPDV);
    sIntervaloPDVCNC := IntToStr(CdCNC);
    *)
  end
  else if tag = 5 then
  Begin
    CdCNC        := fmxPedidoMotCal.Entidade.CodigoCNC;
    CdPDV        := fmxPedidoMotCal.Entidade.CodigoPDV;
    CdFPE        := fmxPedidoMotCal.Entidade.CodigoFPE;
    CdFPECNC     := fmxPedidoMotCal.Entidade.FaturamentoCNC;
    vDataEmissao := fmxPedidoMotCal.Entidade.DataEmissaoVenda;
    iSituacao    := fmxPedidoMotCal.Entidade.Situacao;
    sIntervaloPDV    := IntToStr(CdPDV);
    sIntervaloPDVCNC := IntToStr(CdCNC);
  end
  else if tag = 6 then
  Begin
    CdCNC        := fmxPacoteVenda.Entidade.CodigoCNC;
    CdPDV        := fmxPacoteVenda.Entidade.CodigoPDV;
    vDataEmissao := fmxPacoteVenda.Entidade.DataEmissaoVenda;
    iSituacao    := fmxPacoteVenda.Entidade.Situacao;
    sIntervaloPDV    := IntToStr(CdPDV);
    sIntervaloPDVCNC := IntToStr(CdCNC);
  end
  else if tag = 7 then
  Begin
    CdCNC        := fMxSelPromissoriaRecibo.CdCNC;
    CdPDV        := fMxSelPromissoriaRecibo.CdPDV;
    vDataEmissao := 0;
    iSituacao    := fMxSelPromissoriaRecibo.iSituacao;
    sIntervaloPDV    := IntToStr(CdPDV);
    sIntervaloPDVCNC := IntToStr(CdCNC);
  end
  else if tag = 8 then //Localizar Pacote
  Begin
    CdCNC        := fMxLocalizarPacoteVenda.Entidade.CodigoCNC;
    CdPDV        := fMxLocalizarPacoteVenda.Entidade.CodigoPDV;
    vDataEmissao := fMxLocalizarPacoteVenda.Entidade.DataEmissaoVenda;
    iSituacao    := fMxLocalizarPacoteVenda.Entidade.Situacao;
    sIntervaloPDV    := IntToStr(CdPDV);
    sIntervaloPDVCNC := IntToStr(CdCNC);
  end
  else if tag = 9 then
  Begin
    CdCNC        := fmxPedidoMotCal_2.Entidade.CodigoCNC;
    CdPDV        := fmxPedidoMotCal_2.Entidade.CodigoPDV;
    CdFPE        := fmxPedidoMotCal_2.Entidade.CodigoFPE;
    CdFPECNC     := fmxPedidoMotCal_2.Entidade.FaturamentoCNC;
    vDataEmissao := fmxPedidoMotCal_2.Entidade.DataEmissaoVenda;
    iSituacao    := fmxPedidoMotCal_2.Entidade.Situacao;
    sIntervaloPDV    := IntToStr(CdPDV);
    sIntervaloPDVCNC := IntToStr(CdCNC);
  end
  else if tag = 6 then
  Begin
    CdCNC        := fmxPacoteVenda.Entidade.CodigoCNC;
    CdPDV        := fmxPacoteVenda.Entidade.CodigoPDV;
    vDataEmissao := fmxPacoteVenda.Entidade.DataEmissaoVenda;
    iSituacao    := fmxPacoteVenda.Entidade.Situacao;
    sIntervaloPDV    := IntToStr(CdPDV);
    sIntervaloPDVCNC := IntToStr(CdCNC);
  end;

  if rdgPromissoria.Checked then
  Begin
    if CdFPE > 0 then
    Begin
      Application.CreateForm(Trpt_PapeletaDeRecebimento, rpt_PapeletaDeRecebimento);
      with rpt_PapeletaDeRecebimento do
      Begin
        if DM.Configuracao1.Empresa IN [empMotical, empLuciano] then //Motical - Meia Folha
          report.Options.PageLength := 32;
        Tag := 0;
        with DM.QR_Consultas do
        Begin
          Close;
          SQL.Text := 'SELECT P1.PDV_CODIGO, P1.PDV_DOCUMENTO, '+
            ' (SELECT SUM(ROUND(I1.IPV_PRECO_DESC,2)*(I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)) '+
            ' FROM ITEM_DE_PEDIDO_DE_VENDA I1 '+
            ' WHERE I1.CNC_CODIGO=P1.CNC_CODIGO '+
            ' AND I1.PDV_CODIGO=P1.PDV_CODIGO) AS TOTAL '+
            ' FROM PEDIDO_DE_VENDA P1 '+
            ' WHERE P1.CNC_FATURAMENTO_PENDENTE='+IntToStr(CdFPECNC)+
            ' AND P1.FPE_CODIGO='+IntToStr(CdFPE)+
            ' AND P1.PDV_SITUACAO=4 ';
          Open;
          sPedido := '';
          vTotalTitulo := 0;
          while not Eof do
          Begin
            vTotalTitulo := vTotalTitulo + Arredonda(FieldByName('TOTAL').asFloat);
            if sPedido <> '' then
              sPedido := sPedido + ';';
            sPedido := sPedido + FieldByName('PDV_CODIGO').asString;
            Next;
          end;

          //Somar Frete
          Close;
          SQL.Text := 'SELECT SUM(P1.PDV_FRETE) AS TotalFrete '+
            ' FROM PEDIDO_DE_VENDA P1 '+
            ' WHERE P1.CNC_FATURAMENTO_PENDENTE='+IntToStr(CdFPECNC)+
            ' AND P1.FPE_CODIGO='+IntToStr(CdFPE);
          Open;
          vTotalTitulo := vTotalTitulo + FieldByName('TotalFrete').asFloat;

          zrlPedidos.Caption := sPedido;
        end;
        zrlTotalPedido.Caption := format('%.2f',[vTotalTitulo]);
        Entidade.Close;
        Entidade.ParamByName('CNC_CODIGO').asInteger := CdCNC;
        Entidade.ParamByName('PDV_CODIGO').asInteger := CdPDV;
        Entidade.Open;
        if Entidade.IsEmpty then
          Raise exception.Create('Consulta vazia!');
        report.Preview;
        Close;
      end;
    end
    else
    Begin
      Application.CreateForm(Trpt_Promissoria,rpt_Promissoria);
      with rpt_Promissoria do
      Begin
        if DM.Configuracao1.Empresa IN [empMotical, empLuciano] then //Motical - Meia Folha
          report.Options.PageLength := 32;
        Titulo_receber1.Close;
        Titulo_receber1.ParamByName('PEDCOD').AsInteger     := CdPDV;
        Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
        Titulo_receber1.open;
        if Titulo_receber1.IsEmpty then
          Raise Exception.Create('Consulta vazia!');
        report.Preview;
        Close;
      end;
    end;
  end
  else if rdgContrato.Checked then
  Begin
    Application.CreateForm(Trpt_Promissoria2,rpt_Promissoria2);
    with rpt_Promissoria2 do
    Begin
      if DM.Configuracao1.Empresa IN [empMotical, empLuciano] then //Motical - Meia Folha
        report.Options.PageLength := 32;
      Titulo_receber1.Close;
      if (DM.Configuracao1.Empresa = empEletro) or //Não é permitido imprimir antes de finalizar
         (iSituacao = 4) then
        Titulo_receber1.SQL.Text := 'SELECT t1.*,t2.* '+
          ' FROM Titulo_a_receber T1,  Cliente T2 '+
          ' WHERE T1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND T1.PDV_CODIGO='+IntToStr(CdPDV)+
          ' AND T1.TRC_SITUACAO=0 '+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND T1.CLI_CODIGO=T2.CLI_CODIGO '+
          ' ORDER BY  T1.TRC_SEQUENCIA '
      else
        Titulo_receber1.SQL.Text := 'SELECT t1.*,t2.* '+
          ' FROM TRCTEMP T1,  Cliente T2 '+
          ' WHERE T1.CNC_CODIGO='+IntToStr(CdCNC)+
          ' AND T1.PDV_CODIGO='+IntToStr(CdPDV)+
          ' AND T1.TRC_SITUACAO=0 '+
          ' AND T2.CNC_CODIGO=T1.CNC_CLIENTE '+
          ' AND T1.CLI_CODIGO=T2.CLI_CODIGO '+
          ' ORDER BY  T1.TRC_SEQUENCIA ';
      Titulo_receber1.open;
      if Titulo_receber1.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      report.Preview;
      Close;
    end;
  end
  else if rdgCarneGrafico.Checked then
  Begin
    if DM.Configuracao1.Empresa = empMotical then
    Begin
      Application.CreateForm(Trpt_carnetMotical, rpt_carnetMotical);
      with rpt_carnetMotical do
      Begin
        with DM.QR_Consultas do
        Begin
          Close;
          if CdFPE = 0 then
          Begin
            if self.tag = 8 then //Localizar Pacote
              SQL.Text := 'SELECT SUM(ROUND(IPC_QUANTIDADE*IPC_PRECO_DESCONTO,2)) AS TOTAL '+
                ' FROM ITEM_DE_PACOTE_DE_VENDA '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
                ' AND PDV_CODIGO='+IntToStr(CdPDV)
            else
              SQL.Text := 'SELECT SUM(ROUND((IPV_QUANTIDADE-IPV_BONIFICACAO)*IPV_PRECO_DESC,2)) AS TOTAL '+
                ' FROM ITEM_DE_PEDIDO_DE_VENDA '+
                ' WHERE CNC_CODIGO IN ('+sIntervaloPDVCNC+')'+
                ' AND PDV_CODIGO IN ('+sIntervaloPDV+')';
          end
          else
            SQL.Text := 'SELECT MIN(P1.PDV_CODIGO) AS PEDIDO '+
              ',SUM(ROUND(I1.IPV_PRECO_DESC,2)*(I1.IPV_QUANTIDADE-I1.IPV_BONIFICACAO)) AS TOTAL '+
              ' FROM PEDIDO_DE_VENDA P1, ITEM_DE_PEDIDO_DE_VENDA I1 '+
              ' WHERE P1.CNC_FATURAMENTO_PENDENTE='+IntToStr(CdFPECNC)+
              ' AND P1.FPE_CODIGO='+IntToStr(CdFPE)+
              ' AND P1.PDV_SITUACAO=4 '+
              ' AND I1.CNC_CODIGO=P1.CNC_CODIGO '+
              ' AND I1.PDV_CODIGO=P1.PDV_CODIGO ';
          Open;
          if VerificaIntervaloInteiroBranco(sAux) then
            vTotalPDV := -999                 //O Total do Pedido tem que ser calculado na Promissória
          else
            vTotalPDV := FieldByName('TOTAL').asFloat;
          if CdFPE > 0 then
          Begin
            if not VerificaIntervaloInteiroBranco(sAux) then
              sIntervaloPDV := FieldByName('PEDIDO').AsString;
          end
        end;
        Entidade.Close;
        Entidade.SQL.Text := 'SELECT * '+
          ' FROM TITULO_A_RECEBER T1 '+
          ' WHERE (T1.PDV_CODIGO IN ('+sIntervaloPDV+')) '+
          ' AND (T1.CNC_CODIGO IN ('+sIntervaloPDVCNC+')) '+
          ' ORDER BY T1.TRC_NUMERO,T1.TRC_SEQUENCIA ';
        Entidade.open;
        if Titulo_receber1.IsEmpty then
          Raise Exception.Create('Consulta vazia!');
        vDataEmi  := vDataEmissao;
        report.preview;
        Close;
      end;
    end
    else if DM.Configuracao1.Empresa = empLuciano then
    Begin
      Application.CreateForm(Trpt_carnetLuciano, rpt_carnetLuciano);
      with rpt_carnetLuciano do
      Begin
        Parametro1.Open;
        Titulo_receber1.Close;
        Titulo_receber1.ParamByName('PDV').AsInteger := CdPDV;
        Titulo_receber1.ParamByName('CNC').AsInteger := CdCNC;
        //antes (caso dê algum problema excluir essa linha e voltar a query anterior no formulario)
        Titulo_receber1.ParamByName('CNC_EXTERNO').AsInteger := DM.Configuracao1.CodigoCNC;
        //
        Titulo_receber1.open;
        if Titulo_receber1.IsEmpty then
        begin
           If MessageDlg('Pedido de Venda ainda NÃO Finalizado.'+#13+'Deseja Continuar?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
             Exit;
           //if (DM.Configuracao1.Empresa = empLuciano) and (iSituacao=3) then  // caso dê algum erro observar essa linha
           if (DM.Configuracao1.Empresa = empLuciano) then  //Salvo
           begin
              Titulo_receber1.Close;
              //
              Titulo_receber1.SQL.Text := 'SELECT T1.*, '+
                ' T3.CLI_CODIGO,T3.CLI_RZ_SOCIAL,T3.CLI_ENDERECO,T3.CLI_CIDADE, '+
                ' T3.CLI_BAIRRO,T3.CNC_CODIGO,T3.CLI_LOGRADOURO '+
                ' FROM  TRCTEMP T1, '+ // caso dê algum erro observar essa linha
                //' FROM  TITULO_A_RECEBER T1, '+
                ' CLIENTE T3 '+
                ' WHERE '+
                ' (T1.PDV_CODIGO=:PDV) AND '+
                ' (T1.CNC_CODIGO=:CNC) AND '+
                ' (T1.TRC_SITUACAO<>5) AND '+
                ' (T3.CNC_CODIGO=T1.CNC_CODIGO) AND '+
                ' (T3.CLI_CODIGO=T1.CLI_CODIGO) '+
                ' ORDER BY '+
                ' T1.TRC_SEQUENCIA';
              //
              Titulo_receber1.ParamByName('PDV').AsInteger := CdPDV;
              Titulo_receber1.ParamByName('CNC').AsInteger := CdCNC;
              Titulo_receber1.open;
              NaoFinalizado := ' / PEDIDO NAO FINALIZADO';
              if Titulo_receber1.IsEmpty then
                 Raise Exception.Create('Consulta vazia!');
           end
           else
             Raise Exception.Create('Consulta vazia!');
        end;
        report.preview;
        Close;
      end;
    end
    else
    Begin
      Application.CreateForm(Trpt_carnetCont, rpt_carnetCont);
      with rpt_carnetCont do
      Begin
        Parametro1.Open;
        Titulo_receber1.Close;
        Titulo_receber1.ParamByName('PDV').AsInteger := CdPDV;
        Titulo_receber1.ParamByName('CNC').AsInteger := CdCNC;
        Titulo_receber1.open;
        if Titulo_receber1.IsEmpty then
          Raise Exception.Create('Consulta vazia!');
        report.preview;
        Close;
      end;
    end;
  end
  else if rdgCarneCompleto.Checked then
  Begin
    Application.CreateForm(Trpt_carnet, rpt_carnet);
    with rpt_Carnet do
    Begin
      Titulo_receber1.Close;
      Titulo_receber1.ParamByName('PDV').AsInteger := CdPDV;
      Titulo_receber1.ParamByName('CNC').AsInteger := CdCNC;
      //antes (caso dê algum problema excluir essa linha e voltar a query anterior no formulario)
      Titulo_receber1.ParamByName('CNC_EXTERNO').AsInteger := DM.Configuracao1.CodigoCNC;
      //
      Titulo_receber1.open;
      if Titulo_receber1.IsEmpty then
        Raise Exception.Create('Consulta vazia!');
      report.preview;
      Close;
    end;
  end
  else if rdgBoleto.Checked then
  begin
    if not VerificaInteiroBranco(Edit1.Text) then
      raise Exception.Create('Número do Boleto inválido!');
    if DM.Configuracao1.Empresa = empLBM then
    Begin
      Application.CreateForm(Trpt_BoletoBancarioLBM,rpt_BoletoBancarioLBM);
      with rpt_BoletoBancarioLBM do
      Begin
        Entrada := fmxSelProm.Entrada;
        Titulo_receber1.Close;
        Titulo_receber1.ParamByName('PEDCOD').AsInteger     := CdPDV;
        Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
        Titulo_receber1.open;
        if Titulo_receber1.IsEmpty then
          Raise Exception.Create('Consulta vazia!');
        if vDataEmissao > 0 then
          zrlEmissaoVenda.Caption:=DateToStr(vDataEmissao)
        else
          zrlEmissaoVenda.Caption:='';
        report.Preview;
        Close;
      end;
    end
    else
    Begin
      if DM.Configuracao1.Empresa = empLuciano then
      begin
        Application.CreateForm(Trpt_BoletoBancarioLuciano,rpt_BoletoBancarioLuciano);

        with rpt_BoletoBancarioLuciano do
        begin
          Titulo_receber1.Close;
          Titulo_receber1.ParamByName('PEDCOD').AsInteger     := CdPDV;
          Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
          Titulo_receber1.open;

          if Titulo_receber1.IsEmpty then
            Raise Exception.Create('Consulta vazia!');

          codPDV := 0;
          QTDTIT := Titulo_receber1.RecordCount;
          zrlDataEmissao.Caption := DateToStr(fMxPedidoMotCal.Entidade.DataEntrega);
          zrlData.Caption := zrlDataEmissao.Caption;
          codPDV := CdPDV;

          zrlValorTitulo.Caption:=Format('%.2f',[Titulo_receber1.Valor]);

          report.Preview;
          Close;

          try
            ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
              ' CTR_BOLETO=CTR_BOLETO+'+IntToStr(QTDTIT));
          except
          end;
        end;
      end
      else
      begin
        Application.CreateForm(Trpt_BoletoBancario,rpt_BoletoBancario);
        with rpt_BoletoBancario do
        Begin
          Titulo_receber1.Close;
          Titulo_receber1.ParamByName('PEDCOD').AsInteger     := CdPDV;
          Titulo_receber1.ParamByName('CNC_CODIGO').AsInteger := CdCNC;
          Titulo_receber1.open;
          if Titulo_receber1.IsEmpty then
            Raise Exception.Create('Consulta vazia!');
          QTDTIT:=Titulo_receber1.RecordCount;
          zrlDataEmissao.Caption := DateToStr(vDataEmissao);
          zrlData.Caption        := zrlDataEmissao.Caption;
          zrlValorTitulo.Caption:=Format('%.2f',[Titulo_receber1.Valor]);
          report.Preview;
          Close;
          try
            ExecutaSQL(DM.QR_Comandos,'UPDATE CATRACA SET '+
              ' CTR_BOLETO=CTR_BOLETO+'+IntToStr(QTDTIT));
          except
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmxSelProm.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  try
    Catraca.Open;
  except
  end;
  try
    Edit1.Text:=Catraca.FieldByName('CTR_BOLETO').asString;
  except
    Edit1.Text:='Erro Número do Boleto';
  end;
end;

procedure TfmxSelProm.bitCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfmxSelProm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Catraca.Close;
  action:=cafree;
end;

procedure TfmxSelProm.FormCreate(Sender: TObject);
begin
  Entrada := False;
end;

end.
