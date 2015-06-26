unit MxManufaturado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  DBCtrls, Produto, ComCtrls, Manufaturado, Item_de_Manufaturado, Variants,
  Menus, Movimento_Fisico, Movimento_Estoque_Comercial, Item_de_Estoque;

type
  TfMxManufaturado = class(TForm)
    Panel3: TPanel;
    Panel5: TPanel;
    SpeedButton5: TSpeedButton;
    Panel6: TPanel;
    DBGrid5: TDBGrid;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    Produto1: TProduto;
    SB_Processar: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    SB_Novo: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Prim1: TSpeedButton;
    SB_Ant1: TSpeedButton;
    SB_Prox1: TSpeedButton;
    SB_Ult1: TSpeedButton;
    SB_Novo1: TSpeedButton;
    SB_Alt1: TSpeedButton;
    SB_Exc1: TSpeedButton;
    SB_Salva1: TBitBtn;
    SB_Canc1: TBitBtn;
    edtCodigoPRD: TEdit;
    edtProduto: TEdit;
    edtDetalhe: TEdit;
    Edit14: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label18: TLabel;
    ComboBox1: TComboBox;
    Label10: TLabel;
    Edit5: TEdit;
    Label12: TLabel;
    SpeedButton3: TSpeedButton;
    Produto2: TProduto;
    Label13: TLabel;
    Manufaturado1: TManufaturado;
    Item_de_Manufaturado1: TItem_de_Manufaturado;
    DSManufaturado1: TDataSource;
    DSItem_de_Manufaturado1: TDataSource;
    Item_de_Estoque1: TItem_de_Estoque;
    edtCodigoPRD1: TEdit;
    Label2: TLabel;
    edtProduto1: TEdit;
    edtDetalhe1: TEdit;
    Label5: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    edtQuantidade1: TEdit;
    Manufaturado1CNC_CODIGO: TIntegerField;
    Manufaturado1MFA_CODIGO: TIntegerField;
    Manufaturado1PRD_CODIGO: TIntegerField;
    Manufaturado1USU_CODIGO: TIntegerField;
    Manufaturado1MFA_DT_CADASTRO: TDateTimeField;
    Manufaturado1MFA_DT_ALTERADO: TDateTimeField;
    Manufaturado1MFA_QUANTIDADE: TFloatField;
    Manufaturado1MFA_ES: TIntegerField;
    Manufaturado1MFA_SITUACAO: TIntegerField;
    Manufaturado1MFA_OBSERVACAO: TStringField;
    Item_de_Manufaturado1CNC_CODIGO: TIntegerField;
    Item_de_Manufaturado1IMF_CODIGO: TIntegerField;
    Item_de_Manufaturado1MFA_CODIGO: TIntegerField;
    Item_de_Manufaturado1PRD_CODIGO: TIntegerField;
    Item_de_Manufaturado1Produto: TStringField;
    Manufaturado1Produto: TStringField;
    Manufaturado1Detalhe: TStringField;
    Item_de_Manufaturado1Detalhe: TStringField;
    MainMenu1: TMainMenu;
    Fechar1: TMenuItem;
    Manufaturado2: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    ItemdeManufaturado1: TMenuItem;
    Incluir2: TMenuItem;
    Alterar2: TMenuItem;
    Excluir2: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Salvar2: TMenuItem;
    Cancelar2: TMenuItem;
    Item_de_Manufaturado1IMF_QUANTIDADE: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SB_ProcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_ExcClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure SB_Novo1Click(Sender: TObject);
    procedure SB_Alt1Click(Sender: TObject);
    procedure SB_Exc1Click(Sender: TObject);
    procedure SB_Salva1Click(Sender: TObject);
    procedure SB_Canc1Click(Sender: TObject);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_Prim1Click(Sender: TObject);
    procedure SB_Ant1Click(Sender: TObject);
    procedure SB_Prox1Click(Sender: TObject);
    procedure SB_Ult1Click(Sender: TObject);
    procedure edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRDExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Item_Recebimento1AfterScroll(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Item_de_Manufaturado1AfterScroll(DataSet: TDataSet);
    procedure edtCodigoPRD1KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoPRD1Exit(Sender: TObject);
    procedure Manufaturado1AfterScroll(DataSet: TDataSet);
    procedure Manufaturado1BeforeOpen(DataSet: TDataSet);
    procedure Manufaturado1CalcFields(DataSet: TDataSet);
    procedure Item_de_Manufaturado1CalcFields(DataSet: TDataSet);
    procedure Fechar1Click(Sender: TObject);
    procedure Item_de_Manufaturado1AfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TManufaturado;
    ValorAnt:Real;
    FORNECEDORINV:string;
  end;

var
  fMxManufaturado: TfMxManufaturado;

implementation
Uses
  UDM, MxSPediProd, funcoes, MxSPediProdMotCal;
{$R *.DFM}

procedure TfMxManufaturado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

procedure TfMxManufaturado.FormCreate(Sender: TObject);
begin
  Entidade := Manufaturado1;
  Produto1.Active:=true;
  Entidade.open;
  Item_de_Manufaturado1.Open;
end;

procedure TfMxManufaturado.SpeedButton5Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxManufaturado.SB_ProcessarClick(Sender: TObject);
Var
  CdMFA:Integer;
  Trans :Boolean;
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Manufaturado!');
  If Entidade.Situacao>0 then
    Raise Exception.Create('Este Manufaturado já foi processado!');
  if Item_de_Manufaturado1.IsEmpty then
    Raise Exception.Create('Manufaturado sem itens!');
  CdMFA:=Entidade.CodigoMFA;

  Trans:=false;
  with DM.Database2 do
  begin
    try
      If DM.Configuracao1.ControleTransacao then
      Begin
        StartTransaction;
        Trans:=True;
      end;

      With Item_de_Manufaturado1 do
      Begin
        DisableControls;
        First;
        While not EOF do
        Begin
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
          Item_de_Estoque1.Open;
          If Item_de_Estoque1.IsEmpty Then
          Begin
            if not Item_de_Estoque1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                     DM.Configuracao1.DataHora,0,0,0,0,0,0) then
              Raise Exception.Create('');
            Item_de_Estoque1.Close;
            Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
            Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
            Item_de_Estoque1.Open;
          End;
          //Gerar Movimento de estoque comercial do Itens
          if ComboBox1.ItemIndex = 0 then
          Begin
            if not DM.Movimento_Estoque_Comercial1.Inserir(CodigoCNC,0,
                CodigoPRD,0(*CdFUN*),111,CodigoCNC,CodigoMFA,'S', Quantidade,
                Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*)) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;
            if not DM.Movimento_Fisico1.Inserir(CodigoCNC,0,CodigoPRD,0(*CdFUN*),
                CodigoCNC,CodigoMFA,111(*Manufaturado Saida*),'S',
                Quantidade,Item_de_Estoque1.SFisico) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Físico!');
              Raise Exception.Create('');
            end;
          end
          else if ComboBox1.ItemIndex = 1 then
          Begin
            if not DM.Movimento_Estoque_Comercial1.Inserir(CodigoCNC,0,
                CodigoPRD,0(*CdFUN*),110,CodigoCNC,CodigoMFA,'E', Quantidade,
                Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*)) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;
            if not DM.Movimento_Fisico1.Inserir(CodigoCNC,0,CodigoPRD,0(*CdFUN*),
                CodigoCNC,CodigoMFA,110(*ManufaturadoEnt*),'E',
                Quantidade,Item_de_Estoque1.SFisico) then
            Begin
              ShowMessage('Falha ao Gerar Mov. Físico!');
              Raise Exception.Create('');
            end;
          end;

          If ComboBox1.ItemIndex=0 then
             ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
               ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Item_de_Manufaturado1.Quantidade)+
               ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Item_de_Manufaturado1.Quantidade)+
               ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'"'+
               ' WHERE  CNC_CODIGO='+IntToStr(CodigoCNC)+
               ' AND PRD_CODIGO='+IntToStr(CodigoPRD))
          else
             ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
               ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Item_de_Manufaturado1.Quantidade)+
               ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Item_de_Manufaturado1.Quantidade)+
               ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'"'+
               ',IES_SFISCAL=IES_SFISCAL+'+VirgPonto(Item_de_Manufaturado1.Quantidade)+
               ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
               ' AND PRD_CODIGO='+IntToStr(CodigoPRD));
          Next;
        End;
        EnableControls;
        Close;
        Open;
      End;

      //Gerar Movimento de estoque comercial do Manufaturado
      with Entidade do
      Begin
        Item_de_Estoque1.Close;
        Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
        Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
        Item_de_Estoque1.Open;
        If Item_de_Estoque1.IsEmpty Then
        Begin
          if not Item_de_Estoque1.Inserir(CodigoCNC,CodigoPRD,0(*CdFUN*),0,0,0,0,0,
                   DM.Configuracao1.DataHora,0,0,0,0,0,0) then
            Raise Exception.Create('');
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger := CodigoCNC;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger := CodigoPRD;
          Item_de_Estoque1.Open;
        End;
        if ComboBox1.ItemIndex = 0 then
        Begin
          if not DM.Movimento_Estoque_Comercial1.Inserir(CodigoCNC,0,
              CodigoPRD,0(*CdFUN*),110,CodigoCNC,CodigoMFA,'E', Quantidade,
              Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
              Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*)) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Comercial!');
            Raise Exception.Create('');
          end;
          if not DM.Movimento_Fisico1.Inserir(CodigoCNC,0,CodigoPRD,0(*CdFUN*),
              CodigoCNC,CodigoMFA,110(*Manufaturado*),'E',
              Quantidade,Item_de_Estoque1.SFisico) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Físico!');
            Raise Exception.Create('');
          end;
        end
        else
        Begin
          if not DM.Movimento_Estoque_Comercial1.Inserir(CodigoCNC,0,CodigoPRD,0(*CdFUN*),111,
              CodigoCNC,CodigoMFA,'S',Quantidade,
              Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
              Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*)) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Comercial!');
            Raise Exception.Create('');
          end;
          if not DM.Movimento_Fisico1.Inserir(CodigoCNC,0,CodigoPRD,0(*CdFUN*),
              CodigoCNC,CodigoMFA,110(*Manufaturado*),'S',
              Quantidade,Item_de_Estoque1.SFisico) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Físico!');
            Raise Exception.Create('');
          end;
        end;

        If ComboBox1.ItemIndex=0 then
           ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
             ' IES_SCOMERCIAL=IES_SCOMERCIAL+'+VirgPonto(Quantidade)+
             ',IES_SFISICO=IES_SFISICO+'+VirgPonto(Quantidade)+
             ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
             ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
             ' AND PRD_CODIGO='+IntToStr(CodigoPRD))
        else
           ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
             ' IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
             ',IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
             ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
             ' WHERE CNC_CODIGO='+IntToStr(CodigoCNC)+
             ' AND PRD_CODIGO='+IntToStr(CodigoPRD));
      end;
      ExecutaSQL(DM.QR_Comandos,'UPDATE MANUFATURADO SET MFA_SITUACAO=1 '+
             ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
             ' AND MFA_CODIGO='+Edit1.Text);

      If DM.Configuracao1.ControleTransacao then
        if trans then
          Commit;
    except
      If DM.Configuracao1.ControleTransacao then
        if trans then
        Begin
          RollBack;
          ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
        end;
      exit;
    end;
  End;

  Entidade.close;
  Entidade.Open;
  Entidade.LocalizarCod(CdMFA,DM.Configuracao1.CodigoCNC);
  SpeedButton3.Enabled:=True;
end;

procedure TfMxManufaturado.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
end;

procedure TfMxManufaturado.SB_UltClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Last;
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;

procedure TfMxManufaturado.SB_NovoClick(Sender: TObject);
begin
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3850)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir registro!');
  DBGrid5.Enabled:=False;
  Entidade.PreparaInsercao;
  SB_Processar.Enabled:=false;
  SpeedButton3.Enabled:=False;
  SB_Prim1.Enabled:=False;
  SB_Ant1.Enabled:=False;
  SB_Prox1.Enabled:=False;
  SB_Ult1.Enabled:=False;
  SB_Novo1.Enabled:=False;
  SB_Alt1.Enabled:=False;
  SB_Exc1.Enabled:=False;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Incluir1.Enabled:=False;
  Alterar1.Enabled:=False;
  Excluir1.Enabled:=False;
  Salvar1.Enabled:=True;
  Cancelar1.Enabled:=True;
  Incluir2.Enabled:=False;
  Alterar2.Enabled:=False;
  Excluir2.Enabled:=False;
  Salvar2.Enabled:=False;
  Cancelar2.Enabled:=False;
  edtCodigoPRD1.Enabled:=True;
  edtCodigoPRD1.SetFocus;
end;

procedure TfMxManufaturado.SB_AltClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione Registro primeiro!');
  if Entidade.Situacao>0 then
    raise Exception.Create('Manufaturado ja processado!');
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3850)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');
  DBGrid5.Enabled:=False;    
  Entidade.PreparaAlteracao;
  SB_Processar.Enabled:=false;
  SpeedButton3.Enabled:=False;
  SB_Prim1.Enabled:=False;
  SB_Ant1.Enabled:=False;
  SB_Prox1.Enabled:=False;
  SB_Ult1.Enabled:=False;
  SB_Novo1.Enabled:=False;
  SB_Alt1.Enabled:=False;
  SB_Exc1.Enabled:=False;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  Incluir1.Enabled:=False;
  Alterar1.Enabled:=False;
  Excluir1.Enabled:=False;
  Salvar1.Enabled:=True;
  Cancelar1.Enabled:=True;
  Incluir2.Enabled:=False;
  Alterar2.Enabled:=False;
  Excluir2.Enabled:=False;
  Salvar2.Enabled:=False;
  Cancelar2.Enabled:=False;  
  edtCodigoPRD1.Enabled:=True;
  edtCodigoPRD1.SetFocus;
end;

procedure TfMxManufaturado.SB_ExcClick(Sender: TObject);
begin
  if Entidade.IsEmpty then
    raise Exception.Create('Selecione Registro primeiro!');
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3850)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  if Entidade.Situacao > 0 then
    raise Exception.Create('Manufaturado ja processado ou cancelado!');
  if MessageDlg('Tem certeza que você deseja excluir o registro?',
    mtConfirmation, [mbYes, mbNo], 0) in [mrYes, 201] then
  Begin
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM ITEM_DE_MANUFATURADO WHERE CNC_CODIGO='+
      IntToStr(Entidade.CodigoCNC)+' AND MFA_CODIGO='+IntToStr(Entidade.CodigoMFA));
    ExecutaSQL(DM.QR_Comandos,'DELETE FROM MANUFATURADO WHERE CNC_CODIGO='+
      IntToStr(Entidade.CodigoCNC)+' AND MFA_CODIGO='+IntToStr(Entidade.CodigoMFA));
  End;
end;

procedure TfMxManufaturado.SB_SalvaClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
  Begin
    DBGrid5.Enabled:=True;  
    SB_Processar.Enabled:=true;
    SB_Prim1.Enabled:=true;
    SB_Ant1.Enabled:=true;
    SB_Prox1.Enabled:=true;
    SB_Ult1.Enabled:=true;
    SB_Novo1.Enabled:=true;
    SB_Alt1.Enabled:=true;
    SB_Exc1.Enabled:=true;
    SB_Prim.Enabled:=true;
    SB_Ant.Enabled:=true;
    SB_Prox.Enabled:=true;
    SB_Ult.Enabled:=true;
    SB_Novo.Enabled:=true;
    SB_Alt.Enabled:=true;
    SB_Exc.Enabled:=true;
    SB_Salva.Enabled:=false;
    SB_Canc.Enabled:=false;
    Incluir1.Enabled:=True;
    Alterar1.Enabled:=True;
    Excluir1.Enabled:=True;
    Salvar1.Enabled:=False;
    Cancelar1.Enabled:=False;
    Incluir2.Enabled:=True;
    Alterar2.Enabled:=True;
    Excluir2.Enabled:=True;
    Salvar2.Enabled:=False;
    Cancelar2.Enabled:=False;
    edtCodigoPRD1.Enabled:=false;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxManufaturado.SB_CancClick(Sender: TObject);
begin
  DBGrid5.Enabled:=True;
  Entidade.CancelaEdicao;
  SB_Processar.Enabled:=true;
  SB_Prim1.Enabled:=true;
  SB_Ant1.Enabled:=true;
  SB_Prox1.Enabled:=true;
  SB_Ult1.Enabled:=true;
  SB_Novo1.Enabled:=true;
  SB_Alt1.Enabled:=true;
  SB_Exc1.Enabled:=true;
  SB_Prim.Enabled:=true;
  SB_Ant.Enabled:=true;
  SB_Prox.Enabled:=true;
  SB_Ult.Enabled:=true;
  SB_Novo.Enabled:=true;
  SB_Alt.Enabled:=true;
  SB_Exc.Enabled:=true;
  SB_Salva.Enabled:=false;
  SB_Canc.Enabled:=false;
  Incluir1.Enabled:=True;
  Alterar1.Enabled:=True;
  Excluir1.Enabled:=True;
  Salvar1.Enabled:=False;
  Cancelar1.Enabled:=False;
  Incluir2.Enabled:=True;
  Alterar2.Enabled:=True;
  Excluir2.Enabled:=True;
  Salvar2.Enabled:=False;
  Cancelar2.Enabled:=False;
  edtCodigoPRD1.Enabled:=false;
end;

procedure TfMxManufaturado.SB_Novo1Click(Sender: TObject);
begin
  If Entidade.IsEmpty then
    raise Exception.Create('Não foi selecionado um Manufaturado!');
  if Entidade.Situacao>0 then
    raise Exception.Create('Manufaturado ja processado!');
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3850)) < 0 then
    raise Exception.Create('O usuário não tem permissão para inserir registro!');
  DBGrid1.Enabled:=False;
  Item_de_Manufaturado1.PreparaInsercao;
  SB_Processar.Enabled:=false;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Prim1.Enabled:=False;
  SB_Ant1.Enabled:=False;
  SB_Prox1.Enabled:=False;
  SB_Ult1.Enabled:=False;
  SB_Novo1.Enabled:=False;
  SB_Alt1.Enabled:=False;
  SB_Exc1.Enabled:=False;
  SB_Salva1.Enabled:=True;
  SB_Canc1.Enabled:=True;
  Incluir1.Enabled:=False;
  Alterar1.Enabled:=False;
  Excluir1.Enabled:=False;
  Salvar1.Enabled:=False;
  Cancelar1.Enabled:=False;
  Incluir2.Enabled:=False;
  Alterar2.Enabled:=False;
  Excluir2.Enabled:=False;
  Salvar2.Enabled:=True;
  Cancelar2.Enabled:=True;
  edtCodigoPRD.SetFocus;
  ValorAnt:=0;
end;

procedure TfMxManufaturado.SB_Alt1Click(Sender: TObject);
begin
  If Item_de_Manufaturado1.IsEmpty then
    raise Exception.Create('Não foi selecionado um registro!');
  if Entidade.Situacao>0 then
    raise Exception.Create('Manufaturado ja processado!');
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3850)) < 0 then
    raise Exception.Create('O usuário não tem permissão para alterar registro!');
  DBGrid1.Enabled:=False;    
  Item_de_Manufaturado1.PreparaAlteracao;
  SB_Processar.Enabled:=false;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Prim1.Enabled:=False;
  SB_Ant1.Enabled:=False;
  SB_Prox1.Enabled:=False;
  SB_Ult1.Enabled:=False;
  SB_Novo1.Enabled:=False;
  SB_Alt1.Enabled:=False;
  SB_Exc1.Enabled:=False;
  SB_Salva1.Enabled:=True;
  SB_Canc1.Enabled:=True;
  Incluir1.Enabled:=False;
  Alterar1.Enabled:=False;
  Excluir1.Enabled:=False;
  Salvar1.Enabled:=False;
  Cancelar1.Enabled:=False;
  Incluir2.Enabled:=False;
  Alterar2.Enabled:=False;
  Excluir2.Enabled:=False;
  Salvar2.Enabled:=True;
  Cancelar2.Enabled:=True;  
  edtCodigoPRD.SetFocus;
  ValorAnt:=Item_de_Manufaturado1.Quantidade;
end;

procedure TfMxManufaturado.SB_Exc1Click(Sender: TObject);
begin
  If Item_de_Manufaturado1.IsEmpty then
    raise Exception.Create('Não existem itens a serem deletados!');
  if Entidade.Situacao > 0 then
    raise Exception.Create('Manufaturado ja processado!');
  if (DM.Usuario1.CentroDeCusto <> DM.Configuracao1.CodigoCNC) then
    raise Exception.Create('Somente no seu Centro de Custo!');
  If DM.Usuario1.Permissoes.IndexOf(IntToStr(3850)) < 0 then
    raise Exception.Create('O usuário não tem permissão para excluir registro!');
  Item_de_Manufaturado1.Deletarauto;
end;

procedure TfMxManufaturado.SB_Salva1Click(Sender: TObject);
begin
  if Item_de_Manufaturado1.FinalizaEdicao then
  Begin
    DBGrid1.Enabled:=True;  
    SB_Processar.Enabled:=true;
    SB_Prim.Enabled:=true;
    SB_Ant.Enabled:=true;
    SB_Prox.Enabled:=true;
    SB_Ult.Enabled:=true;
    SB_Novo.Enabled:=true;
    SB_Alt.Enabled:=true;
    SB_Exc.Enabled:=true;
    SB_Prim1.Enabled:=true;
    SB_Ant1.Enabled:=true;
    SB_Prox1.Enabled:=true;
    SB_Ult1.Enabled:=true;
    SB_Novo1.Enabled:=true;
    SB_Alt1.Enabled:=true;
    SB_Exc1.Enabled:=true;
    SB_Salva1.Enabled:=false;
    SB_Canc1.Enabled:=false;
    Incluir1.Enabled:=True;
    Alterar1.Enabled:=True;
    Excluir1.Enabled:=True;
    Salvar1.Enabled:=False;
    Cancelar1.Enabled:=False;
    Incluir2.Enabled:=True;
    Alterar2.Enabled:=True;
    Excluir2.Enabled:=True;
    Salvar2.Enabled:=False;
    Cancelar2.Enabled:=False;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxManufaturado.SB_Canc1Click(Sender: TObject);
begin
  DBGrid1.Enabled:=True;
  Item_de_Manufaturado1.CancelaEdicao;
  SB_Processar.Enabled:=true;
  SB_Prim.Enabled:=true;
  SB_Ant.Enabled:=true;
  SB_Prox.Enabled:=true;
  SB_Ult.Enabled:=true;
  SB_Novo.Enabled:=true;
  SB_Alt.Enabled:=true;
  SB_Exc.Enabled:=true;
  SB_Prim1.Enabled:=true;
  SB_Ant1.Enabled:=true;
  SB_Prox1.Enabled:=true;
  SB_Ult1.Enabled:=true;
  SB_Novo1.Enabled:=true;
  SB_Alt1.Enabled:=true;
  SB_Exc1.Enabled:=true;
  SB_Salva1.Enabled:=false;
  SB_Canc1.Enabled:=false;
  Incluir1.Enabled:=True;
  Alterar1.Enabled:=True;
  Excluir1.Enabled:=True;
  Salvar1.Enabled:=False;
  Cancelar1.Enabled:=False;
  Incluir2.Enabled:=True;
  Alterar2.Enabled:=True;
  Excluir2.Enabled:=True;
  Salvar2.Enabled:=False;
  Cancelar2.Enabled:=False;
end;

procedure TfMxManufaturado.SB_PrimClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.First;
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxManufaturado.SB_AntClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 if Entidade.IsEmpty then
   abort;
 If Entidade.bof Then
  begin
    SB_Ant.Enabled:=False;
    SB_Prim.Enabled:=False;
  end
  Else
  begin
    Entidade.Prior;
    If Entidade.bof Then
    begin
     SB_Ant.Enabled:=False;
     SB_Prim.Enabled:=False;
    end;
  end;
  If not Entidade.eof Then
  begin
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
  end;
end;

procedure TfMxManufaturado.SB_ProxClick(Sender: TObject);
begin
 if Entidade.IsEmpty then
   abort;
 if Entidade.IsEmpty then
   abort;
  If Entidade.eof Then
  begin
    SB_Prox.Enabled:=False;
    SB_Ult.Enabled:=False;
  end
  Else
  begin
    Entidade.Next;
    If Entidade.eof Then
    begin
     SB_Prox.Enabled:=False;
     SB_Ult.Enabled:=False;
    end;
  end;
  If not Entidade.bof Then
  begin
    SB_Ant.Enabled:=True;
    SB_Prim.Enabled:=True;
  end;
end;


procedure TfMxManufaturado.SB_Prim1Click(Sender: TObject);
begin
  if Item_de_Manufaturado1.IsEmpty then
   abort;
 if Item_de_Manufaturado1.IsEmpty then
   abort;
 If Item_de_Manufaturado1.bof Then
  begin
    SB_Ant1.Enabled:=False;
    SB_Prim1.Enabled:=False;
  end
  Else
  begin
    Item_de_Manufaturado1.First;
    SB_Ant1.Enabled:=False;
    SB_Prim1.Enabled:=False;
  end;
  If not Item_de_Manufaturado1.eof Then
  begin
    SB_Prox1.Enabled:=True;
    SB_Ult1.Enabled:=True;
  end;
end;

procedure TfMxManufaturado.SB_Ant1Click(Sender: TObject);
begin
  if Item_de_Manufaturado1.IsEmpty then
   abort;
 if Item_de_Manufaturado1.IsEmpty then
   abort;
 If Item_de_Manufaturado1.bof Then
  begin
    SB_Ant1.Enabled:=False;
    SB_Prim1.Enabled:=False;
  end
  Else
  begin
    Item_de_Manufaturado1.Prior;
    If Item_de_Manufaturado1.bof Then
    begin
     SB_Ant1.Enabled:=False;
     SB_Prim1.Enabled:=False;
    end;
  end;
  If not Item_de_Manufaturado1.eof Then
  begin
    SB_Prox1.Enabled:=True;
    SB_Ult1.Enabled:=True;
  end;
end;

procedure TfMxManufaturado.SB_Prox1Click(Sender: TObject);
begin
  if Item_de_Manufaturado1.IsEmpty then
   abort;
 if Item_de_Manufaturado1.IsEmpty then
   abort;
  If Item_de_Manufaturado1.eof Then
  begin
    SB_Prox1.Enabled:=False;
    SB_Ult1.Enabled:=False;
  end
  Else
  begin
    Item_de_Manufaturado1.Next;
    If Item_de_Manufaturado1.eof Then
    begin
     SB_Prox1.Enabled:=False;
     SB_Ult1.Enabled:=False;
    end;
  end;
  If not Item_de_Manufaturado1.bof Then
  begin
    SB_Ant1.Enabled:=True;
    SB_Prim1.Enabled:=True;
  end;
end;

procedure TfMxManufaturado.SB_Ult1Click(Sender: TObject);
begin
  if Item_de_Manufaturado1.IsEmpty then
   abort;
 if Item_de_Manufaturado1.IsEmpty then
   abort;
  If Item_de_Manufaturado1.eof Then
  begin
    SB_Prox1.Enabled:=False;
    SB_Ult1.Enabled:=False;
  end
  Else
  begin
    Item_de_Manufaturado1.Last;
    SB_Prox1.Enabled:=False;
    SB_Ult1.Enabled:=False;
  end;
  If not Item_de_Manufaturado1.bof Then
  begin
    SB_Ant1.Enabled:=True;
    SB_Prim1.Enabled:=True;
  end;
end;

procedure TfMxManufaturado.edtCodigoPRDKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=28;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=28;
        ShowModal;
      end;
    end;
    Edit14.SetFocus;
  End;
end;

procedure TfMxManufaturado.edtCodigoPRDExit(Sender: TObject);
var
  aux :TDataSetNotifyEvent;
begin
  If SB_Canc1.Focused then
    Exit;
  Aux:=Item_de_Manufaturado1.AfterScroll;
  Item_de_Manufaturado1.AfterScroll:=nil;
  If (TEdit(Sender).text<>'') then
  Begin
    if Item_de_Manufaturado1.Locate('MFA_CODIGO;PRD_CODIGO',
    VarArrayof([Edit1.text,edtCodigoPRD.Text]),[]) Then
    Begin
      ShowMessage('Item já cadastrado, corrija a quantidade!');
      Item_de_Manufaturado1.CancelaEdicao;
      Item_de_Manufaturado1.PreparaAlteracao;
      Edit14.SetFocus;
    End
    Else if Trim(edtCodigoPRD.Text) = Trim(edtCodigoPRD1.Text) then
    Begin
      ShowMessage('Erro! Produto que gera igual ao gerado!');
      edtCodigoPRD.Setfocus;
    end
    else
    Begin
      Produto1.Close;
      Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD.Text);
      Produto1.Open;
      if not Produto1.IsEmpty then
      Begin
        edtProduto.text:=Produto1.Descricao;
        edtDetalhe.text:=Produto1.Detalhe;
      End;
    end;
  end
  else
  Begin
    Showmessage('Produto inexistente!');
    TEdit(Sender).SetFocus;
    Exit;
  End;
  Item_de_Manufaturado1.AfterScroll:=Aux;
end;

procedure TfMxManufaturado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If (SB_Salva.Enabled) or (SB_Salva.Enabled) then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxManufaturado.Item_Recebimento1AfterScroll(DataSet: TDataSet);
begin
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_de_Manufaturado1.CodigoPRD;
  Produto1.Open;
  Item_de_Manufaturado1.CarregaDados;
end;

procedure TfMxManufaturado.SpeedButton3Click(Sender: TObject);
begin
{  if Entidade.IsEmpty then
    raise Exception.create('Selecione o Manufaturado!');
  Application.CreateForm(Trpt_Recebimento, rpt_Recebimento);
  rpt_Recebimento.Produto1.Open;
  rpt_Recebimento.CentroCusto1.Open;
  rpt_Recebimento.Recebimento1.ParamByName('CNC_CODIGO').AsInteger := DM.Configuracao1.CodigoCNC;
  rpt_Recebimento.Recebimento1.ParamByName('REC_CODIGO').AsInteger := Entidade.CodigoREC;
  rpt_Recebimento.Recebimento1.Open;
  rpt_Recebimento.Report.Preview;
}
end;

procedure TfMxManufaturado.Item_de_Manufaturado1AfterScroll(
  DataSet: TDataSet);
begin
  Item_de_Manufaturado1.CarregaDados;
  if not Item_de_Manufaturado1.IsEmpty then
  Begin
    edtProduto.Text:=Item_de_Manufaturado1.FieldByName('Produto').asString;
    edtDetalhe.Text:=Item_de_Manufaturado1.FieldByName('Detalhe').asString;
  end
  else
  Begin
    edtProduto.Text:='';
    edtDetalhe.Text:='';
  end;
end;

procedure TfMxManufaturado.edtCodigoPRD1KeyPress(Sender: TObject; var Key: Char);
begin
 If key=chr(32) then
  Begin
    key:=chr(0);
    if DM.Configuracao1.Empresa IN TEmpresasLocProdutoEsp then
    Begin
      Application.CreateForm(TfMxSPedProdMotcal, fMxSPedProdMotcal);
      with fMxSPedProdMotcal do
      Begin
        Tag:=27;
        ShowModal;
      end;
    end
    else
    Begin
      Application.CreateForm(TfMxSPedProd, fMxSPedProd);
      with fMxSPedProd do
      Begin
        Tag:=27;
        ShowModal;
      end;
    end;
    edtQuantidade1.SetFocus;
  End;
end;

procedure TfMxManufaturado.edtCodigoPRD1Exit(Sender: TObject);
begin
  If SB_Canc.Focused then
    Exit;
  If (TEdit(Sender).text<>'') then
  Begin
    Produto1.Close;
    Produto1.ParamByName('PRD_CODIGO').asInteger:=StrToInt(edtCodigoPRD1.Text);
    Produto1.Open;
    if not Produto1.IsEmpty then
    Begin
      edtProduto1.text:=Produto1.Descricao;
      edtDetalhe1.text:=Produto1.Detalhe;
    end
    else
    Begin
      Showmessage('Produto inexistente!');
      TEdit(Sender).SetFocus;
      Exit;
    End;
  end;
end;

procedure TfMxManufaturado.Manufaturado1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
  edtProduto1.Text:=Entidade.FieldByName('Produto').asString;
  edtDetalhe1.Text:=Entidade.FieldByName('Detalhe').asString;
end;

procedure TfMxManufaturado.Manufaturado1BeforeOpen(DataSet: TDataSet);
begin
  Entidade.ParamByName('CNC_CODIGO').asinteger:=DM.Configuracao1.CodigoCNC;
end;

procedure TfMxManufaturado.Manufaturado1CalcFields(DataSet: TDataSet);
begin
  Produto2.Close;
  Produto2.ParamByName('PRD_CODIGO').asInteger:=Entidade.CodigoPRD;
  Produto2.Open;
  Entidade.FieldByName('Produto').asString:=Produto2.Descricao;
  Entidade.FieldByName('Detalhe').asString:=Produto2.Detalhe;
end;

procedure TfMxManufaturado.Item_de_Manufaturado1CalcFields(
  DataSet: TDataSet);
begin
  Produto2.Close;
  Produto2.ParamByName('PRD_CODIGO').asInteger:=Item_de_Manufaturado1.CodigoPRD;
  Produto2.Open;
  Item_de_Manufaturado1.FieldByName('Produto').asString:=Produto2.Descricao;
  Item_de_Manufaturado1.FieldByName('Detalhe').asString:=Produto2.Detalhe;
end;

procedure TfMxManufaturado.Fechar1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxManufaturado.Item_de_Manufaturado1AfterOpen(
  DataSet: TDataSet);
begin
  if Item_de_Manufaturado1.IsEmpty then
  Begin
    edtCodigoPRD.Clear;
    edtProduto.Clear;
    edtDetalhe.Clear;
    Edit14.Clear;
  end;
end;

procedure TfMxManufaturado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxManufaturado.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Item_de_Manufaturado1.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Item_de_Manufaturado1.SOrdemdoGrid(Item_de_Manufaturado1.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxManufaturado.DBGrid1TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
