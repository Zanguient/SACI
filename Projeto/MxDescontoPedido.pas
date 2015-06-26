unit MxDescontoPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Db, DBTables, SQuery, Item_Pedido_Venda,
  Tabela_de_precos, Produto;

type
  TfMxDescontoPedido = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bitConfirmar: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Tabela_de_Precos1: TTabela_de_Precos;
    Produto1: TProduto;
    labDescValor: TLabel;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitConfirmarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Cancelar:Boolean;
    Entidade:TItem_Pedido_Venda;
    { Public declarations }
  end;

var
  fMxDescontoPedido: TfMxDescontoPedido;

implementation

uses UDM, DigSenha, funcoes, MxPedidoRapido, MxPedidoMotCal;

{$R *.DFM}

procedure TfMxDescontoPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfMxDescontoPedido.bitConfirmarClick(Sender: TObject);
var
  Desc,ValorComDesc,Resultado,TotPed : Double;
  PRM1,PRM2,PRM3,PRM4,PRM5,Pend:integer;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
    Raise Exception.Create('Somente um dos campos pode ser preenchido!');
  //PRM1 = 3540 - Liberar Juros Total
  //PRM2 = 3740 - Venda Abaixo do Preço Mínimo
  //PRM3 = 1810 - Liberar Desconto Especial
  //PRM4 = 3600 - Liberar Desconto Especial a Prazo
  //PRM5 = 3800 - Liberar Desconto Simples
  PRM1:=0;
  PRM2:=0;
  PRM3:=0;
  PRM4:=0;
  PRM5:=0;
  Pend:=0;
  if not VerificaFloatBranco(Edit1.Text) then
    if VerificaFloatBranco(Edit2.Text) then
    Begin
      with Entidade do
      Begin
        TotPed:=0;
        First;
        while not EOF do
        Begin
          if PrecoDesc > 0 then
            TotPed:=TotPed+Arredonda(Arredonda(PrecoDesc)*Quantidade)
          else
            TotPed:=TotPed+Arredonda(Arredonda(Preco)*Quantidade);
          Next;
        end;
        if StrToFloat(Edit2.Text) = 0 then
          Edit1.Text:='0'
        else
          Edit1.Text:=format('%.6f',[StrToFloat(Edit2.Text)/TotPed*100]);
        Desc:=StrToFloat(Edit1.Text);
      end;
    end
    else
      Raise Exception.Create('Desconto inválido!')
  else
    Desc := StrToFloat(Edit1.Text);

  if (Desc >= 100) then
    Raise Exception.Create('Desconto inválido!')
  else if Desc = 0 then
  Begin
    with Entidade do
    Begin
      First;
      while not EOF do
      Begin
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          'IPV_DESCONTO=0 '+
          ',IPV_PRECO_DESC=IPV_PRECO_SUGERIDO '+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND IPV_CODIGO='+IntToStr(CodigoIPV));
        Next;
      end;
    end;
    if self.tag = 0 then
    Begin
      fMxPedidoRapido.Item_Pedido_Venda1.Close;
      fMxPedidoRapido.Pedido_de_Venda1.Close;
      fMxPedidoRapido.Pedido_de_Venda1.Open;
      fMxPedidoRapido.Item_Pedido_Venda1.Open;
      fMxPedidoRapido.SB_SalvarPedidoClick(sender); //Salvar Pedido
    end
    else if self.tag = 1 then
    Begin
      //O pedido será salvo na tela do pedido
    end
    else if self.tag = 2 then
    Begin
      fMxPedidoMotCal.Item_Pedido_Venda1.Close;
      fMxPedidoMotCal.Pedido_de_Venda1.Close;
      fMxPedidoMotCal.Pedido_de_Venda1.Open;
      fMxPedidoMotCal.Item_Pedido_Venda1.Open;
      fMxPedidoMotCal.SB_SalvarPedidoClick(sender); //Salvar Pedido
    end;
    Close;
    Exit;
  end;

  if self.Tag = 0 then //Pedido Rápido
  Begin
    with Entidade do
    Begin
      First;
      while not Eof do
      Begin
        if PrecoDesc > 0 then
          ValorComDesc := PrecoDesc - (PrecoDesc*Desc/100)
        else
          ValorComDesc := Preco - (Preco*Desc/100);
        Resultado := Desc + Desconto;
        Produto1.Close;
        Produto1.ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
        Produto1.Open;

        if ValorComDesc < Arredonda(Produto1.Precomedio) then
        Begin
          If (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) and
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
            PRM2:=3740;
        End;

      // Sendo Tabela de Preço verifica Permissão para o desconto. PS: Verificação do prazo já foi feita...
        if CodigoTBP > 0 then
        Begin
      // Verifica Desconto
          Tabela_de_Precos1.Close;
          Tabela_de_Precos1.SQL.Text:='SELECT * FROM TABELA_DE_PRECO '+
            'WHERE TBP_CODIGO='+IntToStr(CodigoTBP)+
            ' AND (CNC_CODIGO=0 OR CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+') ';
          Tabela_de_Precos1.Open;
          if (Resultado>Tabela_de_Precos1.DescontoSimples)and(Resultado<Tabela_de_Precos1.DescontoEspecial)and
             ((fMxPedidoRapido.Forma_de_Pagamento1.Prazo='0')or(fMxPedidoRapido.Forma_de_Pagamento1.Prazo=''))Then
          Begin
            If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) then
              PRM3:=1810;
          end
          else if Resultado>Tabela_de_Precos1.DescontoEspecial then
            PRM1:=3540
          else if (fMxPedidoRapido.Forma_de_Pagamento1.Prazo<>'0')and(fMxPedidoRapido.Forma_de_Pagamento1.Prazo<>'') Then
          Begin
            if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3600)) < 0) then
              PRM4:=3600;
          end;
        end;
      // Verifica se o usuário tem permissão para liberar desconto
        If (Resultado>DM.Configuracao1.JurosNorm)and(Resultado<=DM.Configuracao1.JurosEsp)AND
           ((fMxPedidoRapido.Forma_de_Pagamento1.Prazo='0')or(fMxPedidoRapido.Forma_de_Pagamento1.Prazo=''))Then
        Begin
          If (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
             (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
            PRM3:=1810;
        End
        Else If (Resultado>DM.Configuracao1.JurosEsp) then
        Begin
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
            PRM1:=3540;
        end
        else if (fMxPedidoRapido.Forma_de_Pagamento1.Prazo <> '0') and (Resultado > 0) then
        Begin
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
             (not ((DM.Usuario1.Permissoes.IndexOf(IntToStr(3600)) > 0) and
                  (Resultado<DM.Configuracao1.JurosEsp))) then
            PRM4:=3600;
        end
        Else If (Resultado>0) and (Resultado<=DM.Configuracao1.JurosNorm) then
        Begin
          if (DM.Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) then
            PRM5:=3800;
        end;
        Next;
      end;

      if PRM1 > 0 then
      Begin
        ShowMessage('É necessário Permissão de Liberar Juros Total!');
        Application.CreateForm(TDigitaSenha, DigitaSenha);
        With DigitaSenha do
        Begin
          onClose:=nil;
          Tag:=21;
          Cancelar:=False;
          Showmodal;
          If not cancelar Then
          Begin
            if Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0 then
            begin
              free;
              raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
            end;
          end
          else
          begin
            free;
            exit;
          end;
          free;
        End;
      end
      else
      Begin
        if (PRM2 > 0) and (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
        Begin
          ShowMessage('É necessário Permissão de Venda abaixo do Preço Mínimo!');
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=21;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0 then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
              end;
            end
            else
            begin
              free;
              exit;
            end;
            free;
          End;
        end
        else if (PRM4 > 0) and (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
        Begin
          ShowMessage('É Necessário Permissão de Desconto a Prazo!');
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=21;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if Usuario1.Permissoes.IndexOf(IntToStr(3600)) < 0 Then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
              end;
            end
            else
            begin
              free;
              exit;
            end;
            free;
          End;
        end
        else if (PRM3 > 0) and (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) then
        Begin
          ShowMessage('É Necessário Permissão de Desconto Especial!');
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=21;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0 Then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
              end;
            end
            else
            begin
              free;
              exit;
            end;
            free;
          End;
        end
        else if (PRM5 > 0) and (DM.Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                               (DM.Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
                               (DM.Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) then
        Begin
          ShowMessage('É Necessário Permissão de Desconto Simples!');
          Application.CreateForm(TDigitaSenha, DigitaSenha);
          With DigitaSenha do
          Begin
            onClose:=nil;
            Tag:=21;
            Cancelar:=False;
            Showmodal;
            If not cancelar Then
            Begin
              if (Usuario1.Permissoes.IndexOf(IntToStr(3800)) < 0) and
                 (Usuario1.Permissoes.IndexOf(IntToStr(3540)) < 0) and
                 (Usuario1.Permissoes.IndexOf(IntToStr(1810)) < 0) and
                 (Usuario1.Permissoes.IndexOf(IntToStr(3740)) < 0) Then
              begin
                free;
                raise Exception.Create('O usuário não tem permissão para liberar o desconto!');
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
      end;
    end;
  end;
  with Entidade do
  Begin
    First;
    while not EOF do
    Begin
      if self.tag = 1 then
      Begin
        if PrecoDesc > 0 then
          ValorComDesc := PrecoDesc - (PrecoDesc*Desc/100)
        else
          ValorComDesc := Preco - (Preco*Desc/100);

        Produto1.Close;
        Produto1.ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
        Produto1.Open;

        if ValorComDesc < Arredonda(Produto1.Precomedio) then
          Pend:=1
        else if trunc(PrecoSugerido*100)>trunc(ValorComDesc*100) then
          Pend:=1;
        if Pend = 1 then
        Begin
          if Pendencia = 2 then
            Pend:=3
          else if Pendencia = 3 then
            Pend:=3;
        end
        else
          if Pendencia = 2 then
            Pend:=2
          else if Pendencia = 3 then
            Pend:=3;
      end;
      if self.tag <> 1 then //PedidoLBM
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_DESCONTO='+VirgPonto(Desconto+Desc)+
          ',IPV_PRECO_DESC=IPV_PRECO_SUGERIDO-(IPV_PRECO_SUGERIDO*'+VirgPonto(Desconto+Desc)+')/100 '+
          ',IPV_PENDENCIA='+IntToStr(Pend)+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND IPV_CODIGO='+IntToStr(CodigoIPV))
      else
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_PEDIDO_DE_VENDA SET '+
          ' IPV_DESCONTO=ROUND(100-((IPV_PRECO_DESC-(IPV_PRECO_DESC*'+VirgPonto(Desc)+')/100)/IPV_PRECO*100)'+',4) '+
          ',IPV_PRECO_DESC=ROUND(IPV_PRECO_DESC-(IPV_PRECO_DESC*'+VirgPonto(Desc)+')/100,2) '+
          ',IPV_PENDENCIA='+IntToStr(Pend)+
          ',IPV_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
          ' AND IPV_CODIGO='+IntToStr(CodigoIPV));
      Next;
    end;
  end;
  if self.tag = 0 then
  Begin
    fMxPedidoRapido.Item_Pedido_Venda1.Close;
    fMxPedidoRapido.Pedido_de_Venda1.Close;
    fMxPedidoRapido.Pedido_de_Venda1.Open;
    fMxPedidoRapido.Item_Pedido_Venda1.Open;
    fMxPedidoRapido.SB_SalvarPedidoClick(sender); //Salvar Pedido
  end
  (*else if self.tag = 1 then
  Begin
    fMxPedidoLBM.Item_Pedido_Venda1.Close;
    fMxPedidoLBM.Pedido_de_Venda1.Close;
    fMxPedidoLBM.Pedido_de_Venda1.Open;
    fMxPedidoLBM.Item_Pedido_Venda1.Open;
    fMxPedidoLBM.RecalcularPrecoSugerido;
  end*)
  else if self.tag = 2 then
  Begin
    fMxPedidoMotCal.Item_Pedido_Venda1.Close;
    fMxPedidoMotCal.Pedido_de_Venda1.Close;
    fMxPedidoMotCal.Pedido_de_Venda1.Open;
    fMxPedidoMotCal.Item_Pedido_Venda1.Open;
    fMxPedidoMotCal.SB_SalvarPedidoClick(Sender);
  end;
  Close;
end;

procedure TfMxDescontoPedido.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxDescontoPedido.FormCreate(Sender: TObject);
begin
  Entidade:=Item_Pedido_Venda1;
end;

procedure TfMxDescontoPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close
  else if ((Edit2.Focused)or(Edit2.Focused))and(Key = '.') then
    Key := ',';
end;

procedure TfMxDescontoPedido.FormShow(Sender: TObject);
begin
  DM.Usuario1.AlteraCorComponentes(self);
  if self.tag = 1 then //PedidoLBM
  Begin
    labDescValor.Visible := False;
    Edit2.Visible := False;
  end;
end;

end.
