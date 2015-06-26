unit MxEmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Buttons, Db, DBTables, SQuery, StdCtrls, Mask,
  Transportadora, DBCtrls, Parametro, Vendedor, Pedido_de_Venda,
  Item_Pedido_Venda, Produto, CentroCusto, Item_de_Embarque, Embarque,
  Menus, Movimento_Fisico, Item_de_Estoque, Funcionario, Item_de_Transferencia,
  Recebimento, Item_Recebimento;

type
  TfMxEmbarque = class(TForm)
    Panel3: TPanel;
    Label20: TLabel;
    Label10: TLabel;
    Memo2: TMemo;
    Label27: TLabel;
    Panel5: TPanel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    DBGrid5: TDBGrid;
    Label23: TLabel;
    Label19: TLabel;
    Edit7: TEdit;
    Label12: TLabel;
    Label6: TLabel;
    Edit20: TEdit;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Embarque1: TEmbarque;
    Item_de_Embarque1: TItem_de_Embarque;
    Item_de_Embarque2: TItem_de_Embarque;
    DSItem_de_Embarque1: TDataSource;
    DSItem_de_Embarque2: TDataSource;
    DSEmbarque1: TDataSource;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Item_Recebimento1: TItem_Recebimento;
    Recebimento1: TRecebimento;
    Item_de_Embarque1IEB_CODIGO: TIntegerField;
    Item_de_Embarque1CNC_CODIGO: TIntegerField;
    Item_de_Embarque1PRD_CODIGO: TIntegerField;
    Item_de_Embarque1EMB_CODIGO: TIntegerField;
    Item_de_Embarque1IEB_QUANTIDADE: TFloatField;
    Item_de_Embarque1IEB_TIPO_ENT: TIntegerField;
    Item_de_Embarque1IEB_CNC_CODIGO_ENT: TIntegerField;
    Item_de_Embarque1IEB_ENT_CODIGO: TIntegerField;
    Item_de_Embarque1IEB_DESTINO: TStringField;
    Produto1: TProduto;
    CentroCusto1: TCentroCusto;
    Item_de_Embarque2IEB_CODIGO: TIntegerField;
    Item_de_Embarque2CNC_CODIGO: TIntegerField;
    Item_de_Embarque2PRD_CODIGO: TIntegerField;
    Item_de_Embarque2EMB_CODIGO: TIntegerField;
    Item_de_Embarque2IEB_QUANTIDADE: TFloatField;
    Item_de_Embarque2IEB_TIPO_ENT: TIntegerField;
    Item_de_Embarque2IEB_CNC_CODIGO_ENT: TIntegerField;
    Item_de_Embarque2IEB_ENT_CODIGO: TIntegerField;
    Item_de_Embarque2IEB_DESTINO: TStringField;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Embarques1: TMenuItem;
    Incluir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Localizar1: TMenuItem;
    Itens1: TMenuItem;
    Adicionar1: TMenuItem;
    AdicionarTodos1: TMenuItem;
    Excluir2: TMenuItem;
    ExcluirTodos1: TMenuItem;
    Item_Pedido_Venda1: TItem_Pedido_Venda;
    Item_de_Estoque1: TItem_de_Estoque;
    DBLookupComboBox3: TDBLookupComboBox;
    DS_Funcionario1: TDataSource;
    Funcionario1: TFuncionario;
    Transportadora1: TTransportadora;
    DS_Transportadora: TDataSource;
    Funcionario2: TFuncionario;
    DS_Funcionario2: TDataSource;
    Item_de_Transferencia1: TItem_de_Transferencia;
    SpeedButton4: TSpeedButton;
    Item_de_Embarque2IEB_SITUACAO: TIntegerField;
    Item_de_Embarque1IEB_SITUACAO: TIntegerField;
    SpeedButton9: TSpeedButton;
    SB_Prim: TSpeedButton;
    SB_Ant: TSpeedButton;
    SB_Prox: TSpeedButton;
    SB_Ult: TSpeedButton;
    SB_Novo: TSpeedButton;
    SB_Alt: TSpeedButton;
    SB_Exc: TSpeedButton;
    SB_Salva: TBitBtn;
    SB_Canc: TBitBtn;
    SB_Loc: TSpeedButton;
    Edit11: TEdit;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Label2: TLabel;
    SpeedButton10: TSpeedButton;
    Label9: TLabel;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label7: TLabel;
    Edit2: TEdit;
    Label8: TLabel;
    Item_de_Embarque1Produto: TStringField;
    Item_de_Embarque1Referencia: TStringField;
    Item_de_Embarque1CentrodeCusto: TStringField;
    Item_de_Embarque2Produto: TStringField;
    Item_de_Embarque2Referencia: TStringField;
    Item_de_Embarque2CentroDeCusto: TStringField;
    SpeedButton2: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_ExcClick(Sender: TObject);
    procedure EntidadeAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Embarque1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure SB_PrimClick(Sender: TObject);
    procedure SB_AntClick(Sender: TObject);
    procedure SB_ProxClick(Sender: TObject);
    procedure SB_UltClick(Sender: TObject);
    procedure SB_NovoClick(Sender: TObject);
    procedure SB_AltClick(Sender: TObject);
    procedure SB_SalvaClick(Sender: TObject);
    procedure SB_CancClick(Sender: TObject);
    procedure SB_LocClick(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Item_de_Embarque1CalcFields(DataSet: TDataSet);
    procedure Item_de_Embarque2CalcFields(DataSet: TDataSet);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    Entidade:TEmbarque;
    Cancelar:Boolean;
    QtdEmbarque:Double;
  end;

var
  fMxEmbarque: TfMxEmbarque;

implementation
Uses
  UDM, MxConfEmb,funcoes, URel_Embar, MxSelQtdEmbarque;
{$R *.DFM}



procedure TfMxEmbarque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Entidade.Active:=false;

  Item_de_Embarque1.Active:=False;
  Item_de_Embarque2.Active:=False;

  Action:=Cafree;
end;

procedure TfMxEmbarque.SB_ExcClick(Sender: TObject);
begin
  If Item_de_Embarque2.IsEmpty then
    Raise Exception.Create('Não existe nenhum item para ser deletado!');
  If Entidade.Situacao <> 0 then
    Raise Exception.Create('Embarque já Processado!');
//  Entidade.deletarauto;
  if MessageDlg('Tem certeza que você deseja excluir o registro?',
    mtConfirmation, [mbYes, mbNo], 0) in [mrYes, 201] then
    Try
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
        ' EMB_CODIGO=NULL '+
        ',IEB_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
        ' WHERE EMB_CODIGO='+IntToStr(Entidade.CodigoEMB));
      Entidade.Delete;
    Except
    End;
end;

procedure TfMxEmbarque.EntidadeAfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxEmbarque.FormShow(Sender: TObject);
begin
  DM.Usuario1.ConfiguraTela(self);
  Entidade.Active:=True;
  Item_de_Embarque1.Active:=True;
  Item_de_Embarque2.Active:=True;
  Funcionario1.Open;
  Funcionario2.Open;
  Transportadora1.Open;
  ComboBox2.ItemIndex := 1;
  Edit11.Setfocus;  
end;

procedure TfMxEmbarque.Embarque1AfterScroll(DataSet: TDataSet);
begin
  Entidade.CarregaDados;
end;

procedure TfMxEmbarque.FormCreate(Sender: TObject);
begin
  Entidade:=Embarque1;
end;

procedure TfMxEmbarque.SB_PrimClick(Sender: TObject);
begin
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

procedure TfMxEmbarque.SB_AntClick(Sender: TObject);
begin
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

procedure TfMxEmbarque.SB_ProxClick(Sender: TObject);
begin
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

procedure TfMxEmbarque.SB_UltClick(Sender: TObject);
begin
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

procedure TfMxEmbarque.SB_NovoClick(Sender: TObject);
begin
  Entidade.PreparaInsercao;
  RadioGroup1.Enabled := True;
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Localizar1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  DbGrid5.Enabled:=False;
  Edit11.Enabled:=False;
  Edit11.Color:=AlteraCorComponentes;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=AlteraCorComponentes;
  SpeedButton6.Enabled:=false;
  SpeedButton7.Enabled:=false;
  SpeedButton1.Enabled:=false;
  SpeedButton3.Enabled:=false;
  SpeedButton4.Enabled:=false;
  SpeedButton9.Enabled:=false;
  RadioGroup1.ItemIndex:=0;
end;

procedure TfMxEmbarque.SB_AltClick(Sender: TObject);
begin
  If Item_de_Embarque2.IsEmpty then
    Raise Exception.Create('Não existe nenhum item para ser alterado!');
  If Entidade.Situacao <> 0 then
    Raise Exception.Create('Embarque já processado!');
  Entidade.PreparaAlteracao;
  RadioGroup1.Enabled := True;      
  Incluir1.Enabled:=false;
  Alterar1.Enabled:=false;
  Excluir1.Enabled:=false;
  Localizar1.Enabled:=false;
  Salvar1.Enabled:=true;
  Cancelar1.Enabled:=true;
  SB_Prim.Enabled:=False;
  SB_Ant.Enabled:=False;
  SB_Prox.Enabled:=False;
  SB_Ult.Enabled:=False;
  SB_Novo.Enabled:=False;
  SB_Loc.Enabled:=False;
  SB_Alt.Enabled:=False;
  SB_Exc.Enabled:=False;
  SB_Salva.Enabled:=True;
  SB_Canc.Enabled:=True;
  DbGrid5.Enabled:=False;
  Edit11.Enabled:=False;
  Edit11.Color:=AlteraCorComponentes;
  ComboBox2.Enabled:=False;
  ComboBox2.Color:=AlteraCorComponentes;
  SpeedButton6.Enabled:=false;
  SpeedButton7.Enabled:=false;
  SpeedButton1.Enabled:=false;
  SpeedButton3.Enabled:=false;
  SpeedButton4.Enabled:=false;
  SpeedButton9.Enabled:=false;
  DBLookupComboBox1.Enabled := true;
end;

procedure TfMxEmbarque.SB_SalvaClick(Sender: TObject);
begin
  if Entidade.FinalizaEdicao then
  Begin
    RadioGroup1.Enabled := False;
    Incluir1.Enabled:=true;
    Alterar1.Enabled:=true;
    Excluir1.Enabled:=true;
    Localizar1.Enabled:=true;
    Salvar1.Enabled:=false;
    Cancelar1.Enabled:=false;
    SB_Prim.Enabled:=True;
    SB_Ant.Enabled:=True;
    SB_Prox.Enabled:=True;
    SB_Ult.Enabled:=True;
    SB_Novo.Enabled:=True;
    SB_Loc.Enabled:=True;
    SB_Alt.Enabled:=True;
    SB_Exc.Enabled:=True;
    SB_Salva.Enabled:=False;
    SB_Canc.Enabled:=False;
    DbGrid5.Enabled:=True;
    Edit11.Enabled:=True;
    Edit11.Color:=clWindow;
    ComboBox2.Enabled:=True;
    ComboBox2.Color:=clWindow;
    SpeedButton6.Enabled:=true;
    SpeedButton7.Enabled:=true;
    SpeedButton1.Enabled:=true;
    SpeedButton3.Enabled:=true;
    SpeedButton4.Enabled:=True;
    SpeedButton9.Enabled:=True;
    DBLookupComboBox1.Enabled:=false;
    DBLookupComboBox2.Enabled:=false;
  end
  else
    ShowMessage('As alterações não foram salvas!');
end;

procedure TfMxEmbarque.SB_CancClick(Sender: TObject);
begin
  Entidade.CancelaEdicao;
  RadioGroup1.Enabled := False;
  Incluir1.Enabled:=true;
  Alterar1.Enabled:=true;
  Excluir1.Enabled:=true;
  Localizar1.Enabled:=true;
  Salvar1.Enabled:=false;
  Cancelar1.Enabled:=false;
  SB_Prim.Enabled:=True;
  SB_Ant.Enabled:=True;
  SB_Prox.Enabled:=True;
  SB_Ult.Enabled:=True;
  SB_Novo.Enabled:=True;
  SB_Loc.Enabled:=True;
  SB_Alt.Enabled:=True;
  SB_Exc.Enabled:=True;
  SB_Salva.Enabled:=False;
  SB_Canc.Enabled:=False;
  DbGrid5.Enabled:=True;
  Edit11.Enabled:=True;
  Edit11.Color:=clWindow;
  ComboBox2.Enabled:=True;
  ComboBox2.Color:=clWindow;
  SpeedButton6.Enabled:=true;
  SpeedButton7.Enabled:=true;
  SpeedButton1.Enabled:=true;
  SpeedButton3.Enabled:=true;
  SpeedButton4.Enabled:=True;
  SpeedButton9.Enabled:=True;
  DBLookupComboBox1.Enabled:=false;
  DBLookupComboBox2.Enabled:=false;
end;

procedure TfMxEmbarque.SB_LocClick(Sender: TObject);
begin
 If ComboBox2.ItemIndex=0 then
    if not VerificaInteiroBranco(Edit11.Text) then
      raise Exception.create('Código a ser localizado inválido!');
 Item_de_Embarque1.Localizar;
end;

procedure TfMxEmbarque.ComboBox2Enter(Sender: TObject);
begin
  Combobox2.Text:='';
end;

procedure TfMxEmbarque.SpeedButton6Click(Sender: TObject);
var
  CdIEB:integer;
  QtdAnt : Double;
begin
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existe nenhum embarque para ser adicionado um item!');
  If Item_de_Embarque1.IsEmpty then
    Raise Exception.Create('Não existe nenhum item para adicionar!');
  //Verifica se o embarque já está pronto
  If Entidade.Situacao <> 0 Then
  Begin
    ShowMessage('O embarque já foi processado!');
    Exit;
  End;

  QtdEmbarque := 0;
  Application.CreateForm(TfMxSelQtdEmbarque, fMxSelQtdEmbarque);
  fMxSelQtdEmbarque.Edit2.Text := format('%.2f',[Item_de_Embarque1.Quantidade]);
  fMxSelQtdEmbarque.ShowModal;

  if not (QtdEmbarque > 0) then
    Raise Exception.Create('Quantidade inválida!');

  with DM.Database2 do
  begin
    try
      CdIEB:=Item_de_Embarque1.CodigoIEB;
      StartTransaction;           // Transação Obrigatória
      if format('%.2f',[QtdEmbarque]) <> format('%.2f',[Item_de_Embarque1.Quantidade]) then
      Begin
        QtdAnt:=Item_de_Embarque1.Quantidade;
        with Item_de_Embarque1 do
          if not Item_de_Embarque1.Inserir(CodigoCNC,0,CodigoPRD,Entidade.CodigoEMB,
              TipoEnt,CNC_Codigo_Ent,CodigoENT,QtdEmbarque,Destino,Situacao) then
            Raise Exception.Create('');

        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
          ' IEB_QUANTIDADE='+VirgPonto(QtdAnt-QtdEmbarque)+
          ',IEB_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(Item_de_Embarque1.CodigoCNC)+
          ' AND IEB_CODIGO='+IntToStr(CdIEB));
      end
      else
        ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
          ' EMB_CODIGO='+IntToStr(Entidade.CodigoEMB)+
          ',IEB_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
          ' WHERE CNC_CODIGO='+IntToStr(Item_de_Embarque1.CodigoCNC)+
          ' AND IEB_CODIGO='+IntToStr(CdIEB));

      Commit;
    except
      RollBack;
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
    end;
  end;
  Item_de_Embarque2.close;
  Item_de_Embarque2.open;
  Item_de_Embarque1.close;
  Item_de_Embarque1.open;

  ExecutaSQL(DM.QR_Comandos,'UPDATE EMBARQUE SET '+
    ' EMB_TOT_ITENS='+IntToStr(Item_de_Embarque2.RecordCount)+
    ' WHERE CNC_CODIGO='+IntToStr(DM.Configuracao1.CodigoCNC)+
    ' AND EMB_CODIGO='+Edit7.Text);

  Edit1.Text := IntToStr(Item_de_Embarque2.RecordCount);
end;

procedure TfMxEmbarque.SpeedButton1Click(Sender: TObject);
begin
  If Item_de_Embarque2.IsEmpty then
    Raise Exception.Create('Não existe nenhum item para remover!');
//Verifica se o embarque já está pronto
  If Entidade.Situacao <> 0 Then
  Begin
    ShowMessage('O embarque já foi processado!');
    Exit;
  End;

  ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
    ' EMB_CODIGO=0 '+
    ',IEB_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+    
    ' WHERE CNC_CODIGO='+IntToStr(Item_de_Embarque2.CodigoCNC)+
    ' AND IEB_CODIGO='+IntToStr(Item_de_Embarque2.CodigoIEB));

  Item_de_Embarque2.close;
  Item_de_Embarque2.open;
  Item_de_Embarque1.close;
  Item_de_Embarque1.open;

  ExecutaSQL(DM.QR_Comandos,'UPDATE EMBARQUE SET EMB_TOT_ITENS='+
    IntToStr(Item_de_Embarque2.RecordCount)+' WHERE CNC_CODIGO='+IntToStr(Item_de_Embarque1.CodigoCNC)+
    ' AND EMB_CODIGO='+Edit7.Text);

  Edit1.Text := IntToStr(Item_de_Embarque2.RecordCount);  
end;

procedure TfMxEmbarque.SpeedButton7Click(Sender: TObject);
var posicao:TBookmark;
begin
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existe nenhum embarque para ser adicionado um item!');
  If Item_de_Embarque1.IsEmpty then
    Raise Exception.Create('Não existe nenhum item para adicionar!');
//Verifica se o embarque já está pronto
  If Entidade.Situacao <> 0 Then
  Begin
    ShowMessage('O embarque já foi processado!');
    Exit;
  End;

  With Item_de_Embarque1 do
  Begin
    Posicao:=GetBookmark;
    DisableControls;
    First;
    While not eof do
    Begin
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
        ' EMB_CODIGO='+IntToStr(Entidade.CodigoEMB)+
        ',IEB_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+        
        ' WHERE CNC_CODIGO='+IntToStr(Item_de_Embarque1.CodigoCNC)+
        ' AND IEB_CODIGO='+IntToStr(Item_de_Embarque1.CodigoIEB));
      Next;
    End;
    EnableControls;
    GotoBookmark(Posicao);
    FreeBookmark(Posicao);
  End;

  Item_de_Embarque2.close;
  Item_de_Embarque2.open;
  Item_de_Embarque1.close;
  Item_de_Embarque1.open;

  ExecutaSQL(DM.QR_Comandos,'UPDATE EMBARQUE SET EMB_TOT_ITENS='+
    IntToStr(Item_de_Embarque2.RecordCount)+' WHERE CNC_CODIGO='+IntToStr(Item_de_Embarque1.CodigoCNC)+
    ' AND EMB_CODIGO='+Edit7.Text);

  Edit1.Text := IntToStr(Item_de_Embarque2.RecordCount);
end;

procedure TfMxEmbarque.SpeedButton3Click(Sender: TObject);
var posicao:TBookmark;
begin
  If Item_de_Embarque2.IsEmpty then
    Raise Exception.Create('Não existe nenhum item para remover!');
//Verifica se o embarque já está pronto
  If Entidade.Situacao <> 0 Then
  Begin
    ShowMessage('O embarque já foi processado!');
    Exit;
  End;

  With Item_de_Embarque2 do
  Begin
    Posicao:=GetBookmark;
    DisableControls;
    First;
    While not eof do
    Begin
      ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
        ' EMB_CODIGO=0 '+
        ',IEB_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+        
        ' WHERE CNC_CODIGO='+IntToStr(Item_de_Embarque2.CodigoCNC)+
        ' AND IEB_CODIGO='+IntToStr(Item_de_Embarque2.CodigoIEB));
      Next;
    End;
    EnableControls;
    GotoBookmark(Posicao);
    FreeBookmark(Posicao);
  End;
  Item_de_Embarque2.close;
  Item_de_Embarque2.open;
  Item_de_Embarque1.close;
  Item_de_Embarque1.open;

  ExecutaSQL(DM.QR_Comandos,'UPDATE EMBARQUE SET EMB_TOT_ITENS='+
    IntToStr(Item_de_Embarque2.RecordCount)+' WHERE CNC_CODIGO='+IntToStr(Item_de_Embarque1.CodigoCNC)+
    ' AND EMB_CODIGO='+Edit7.Text);

  Edit1.Text := IntToStr(Item_de_Embarque2.RecordCount);  
end;


procedure TfMxEmbarque.Sair1Click(Sender: TObject);
begin
 Close;
end;

procedure TfMxEmbarque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If SB_Salva.Enabled then
  Begin
    Showmessage('Salve seus dados antes de fechar a tela!');
    Canclose:=False;
  End;
end;

procedure TfMxEmbarque.RadioGroup1Click(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex=0) and (SB_Salva.Enabled) then
  begin
    DBLookupComboBox1.Enabled:=true;
    DBLookupComboBox2.Enabled:=false;
    DBLookupComboBox2.KeyValue:=0;
  end
  else if (RadioGroup1.ItemIndex=1) and (SB_Salva.Enabled) then
  begin
    DBLookupComboBox2.Enabled:=true;
    DBLookupComboBox1.Enabled:=false;
    DBLookupComboBox1.KeyValue:=0;
  end
  else
  Begin
    DBLookupComboBox1.Enabled:=False;
    if (SB_Salva.Enabled) then
      DBLookupComboBox1.KeyValue:=0;
    DBLookupComboBox2.Enabled:=False;
    if (SB_Salva.Enabled) then
      DBLookupComboBox2.KeyValue:=0;
  end;
end;




procedure TfMxEmbarque.SpeedButton4Click(Sender: TObject);
Var
  CdCNCLocal,CdEMB:Integer;
begin
  If Entidade.IsEmpty then
    Raise Exception.Create('Não existe nenhum embarque para ser processado!');
  If Entidade.Situacao <> 0 then
    raise Exception.Create('O embarque já foi processado!');
  If Item_de_Embarque2.IsEmpty then
    raise Exception.Create('Adicione os itens ao embarque antes de processar!');
  if MessageDlg('Deseja Processar esse Embarque?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;

  CdCNCLocal:=Dm.Configuracao1.CodigoCNC;
  CdEMB:=Entidade.CodigoEMB;
  Item_de_Embarque2.DisableControls;

  with DM.Database2 do
  begin
    try
      // Transação Obrigatória
      StartTransaction;
      //Mudar situacao dos itens de pedido de venda para embarcados
      With Item_de_Embarque2 do
      Begin
        First;
        While not EOF do
        Begin
          //Gerar MEF
          Item_de_Estoque1.Close;
          Item_de_Estoque1.ParamByName('CNC_CODIGO').asInteger:=CdCNCLocal;
          Item_de_Estoque1.ParamByName('PRD_CODIGO').asInteger:=CodigoPRD;
          Item_de_Estoque1.Open;
          //Para Eletro Guerra é necessário alterar também Estoque Comercial
          if (DM.Configuracao1.Empresa = 1) then
          Begin
            If Item_de_Estoque1.IsEmpty then
            Begin
              //Gerar Item de Estoque com Fisico Negativo
              if not Item_de_Estoque1.Inserir(CdCNCLocal,CodigoPRD,0(*CdFUN*),-Quantidade,-Quantidade,0,
                   0,0,DM.Configuracao1.DataHora,0,0,0,0,0,0) then
                Raise Exception.Create('');
            end
            else
              //Excluir estoque físico
              ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
                ' IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
                ',IES_SCOMERCIAL=IES_SCOMERCIAL-'+VirgPonto(Quantidade)+
                ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
                ' WHERE CNC_CODIGO='+IntToStr(CdCNCLocal)+
                ' AND PRD_CODIGO='+IntToStr(CodigoPRD));
            //Gerar Movimento Comercial
            If not DM.Movimento_Estoque_Comercial1.Inserir(CdCNCLocal,0,
                CodigoPRD,0(*CdFUN*),4100(*Embarque*), CdCNCLocal,CdEMB,'S', Quantidade,
                Item_de_Estoque1.SComercial,Item_de_Estoque1.SReservado,Item_de_Estoque1.Indisponivel,
                Item_de_Estoque1.SAmostra, 0(*Amostra*), Item_de_Estoque1.SBonificacao, 0(*Bonus*),
                'EMBARQUE') Then
            Begin
              ShowMessage('Falha ao Gerar Mov. Comercial!');
              Raise Exception.Create('');
            end;

            //Gerar Registro na Tabela de Envia_Dados_Embarque
            ExecutaSQL(DM.QR_Comandos,'INSERT INTO ENVIA_DADOS_EMBARQUE '+
              ' (CNC_CODIGO, CDE_CODIGO, CNC_DESTINO, USU_CODIGO, '+
              ' CDE_DT_CADASTRO, PDV_CODIGO, IEB_CODIGO, CDE_SITUACAO, '+
              ' CDE_OBSERVACAO) VALUES '+
              '( '+IntToStr(CdCNCLocal)+
              ', '+IntToStr(DM.Configuracao1.ProximoCodigo('CDE_CODIGO'))+
              ', '+IntToStr(CodigoCNC)+ //Centro de Custo do Item de Embarque
              ', '+IntToStr(DM.Configuracao1.CodigoUSU)+
              ',"'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ', '+IntToStr(CdEMB)+
              ', '+IntToStr(CodigoIEB)+
              ',0,"")'); //Situação e Observação
          end
          else If Item_de_Estoque1.IsEmpty then
          Begin
            //Gerar Item de Estoque com Fisico Negativo
            if not Item_de_Estoque1.Inserir(CdCNCLocal,CodigoPRD,0(*CdFUN*),0,-Quantidade,0,
                 0,0,DM.Configuracao1.DataHora,0,0,0,0,0,0) then
              Raise Exception.Create('');
          end
          else
            //Excluir estoque físico
            ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_ESTOQUE SET '+
              ' IES_SFISICO=IES_SFISICO-'+VirgPonto(Quantidade)+
              ',IES_DH_ATUALIZADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
              ' WHERE CNC_CODIGO='+IntToStr(CdCNCLocal)+
              ' AND PRD_CODIGO='+IntToStr(CodigoPRD));

          If not DM.Movimento_Fisico1.Inserir(CdCNCLocal,0,
              CodigoPRD, 0(*CdFUN*),CdCNCLocal,CdEMB,4100(*Embarque*),'S',
              Quantidade,Item_de_Estoque1.SFisico) then
          Begin
            ShowMessage('Falha ao Gerar Mov. Físico!');
            Raise Exception.Create('');
          end;

          //Situação do item de embarque fica embarcado
          ExecutaSQL(DM.QR_Comandos,'UPDATE ITEM_DE_EMBARQUE SET '+
            ' IEB_SITUACAO=1 '+
            ',IEB_DT_ALTERADO="'+MesDiaHora(DM.Configuracao1.DataHora)+'" '+
            ' WHERE CNC_CODIGO='+IntToStr(CdCNCLocal)+
            ' AND IEB_CODIGO='+IntToStr(CodigoIEB));
          next;
        End;
      End;
      //Situação do embarque fica embarcado
      ExecutaSQL(DM.QR_Comandos,'UPDATE EMBARQUE SET '+
        ' EMB_SITUACAO=2 '+
        ' WHERE CNC_CODIGO='+IntToStr(CdCNCLocal)+
        ' AND EMB_CODIGO='+IntToStr(CdEMB));
      Commit;
    except
      RollBack;
      ShowMessage('Os dados não foram salvos! Anote os códigos e ligue para o suporte');
    end;
  end;

  Item_de_Embarque2.EnableControls;
  Item_de_Embarque1.Close;
  Item_de_Embarque1.Open;
  Item_de_Embarque2.Close;
  Item_de_Embarque2.Open;

  Entidade.Close;
  Entidade.Open;
  Entidade.LocalizarCod(CdEmb,CdCNCLocal);
end;

procedure TfMxEmbarque.SpeedButton9Click(Sender: TObject);
begin
  Close;
end;

procedure TfMxEmbarque.SpeedButton10Click(Sender: TObject);
begin
  if Entidade.IsEmpty then
    Raise Exception.Create('Selecione o Embarque!');
  if Item_de_Embarque2.IsEmpty then
    Raise Exception.Create('Embarque sem itens!');
  if Entidade.Situacao <> 2 then
    Raise Exception.Create('Embarque ainda não processado!');

  Application.CreateForm(Trpt_embarque, rpt_embarque);
  rpt_embarque.Embarque1.Close;
  rpt_embarque.Embarque1.ParamByName('CNC_CODIGO').AsInteger := Embarque1.CodigoCNC;
  rpt_embarque.Embarque1.ParamByName('EMB_CODIGO').AsInteger := Embarque1.CodigoEMB;
  rpt_embarque.Embarque1.Open;
  rpt_embarque.Report.Preview;
end;

procedure TfMxEmbarque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If key=chr(27) then
    Close;
end;

procedure TfMxEmbarque.Item_de_Embarque1CalcFields(DataSet: TDataSet);
begin
  with Produto1 do
  Begin
    if CodigoPRD <> Item_de_Embarque1.CodigoPRD then
    Begin
      Close;
      ParamByName('PRD_CODIGO').asInteger := Item_de_Embarque1.CodigoPRD;
      Open;
    end;
    Item_de_Embarque1.FieldByName('Produto').asString := Trim(Descricao+' '+Caracteristica);
    Item_de_Embarque1.FieldByName('Referencia').asString := Referencia;
  end;

  with CentroCusto1 do
  Begin
    if CodigoCNC <> Item_de_Embarque1.CNC_Codigo_Ent then
    Begin
      Close;
      ParamByName('CNC_CODIGO').asInteger := Item_de_Embarque1.CNC_Codigo_Ent;
      Open;
    end;
    Item_de_Embarque1.FieldByName('CentrodeCusto').asString := RazaoSocial;
  end;
end;

procedure TfMxEmbarque.Item_de_Embarque2CalcFields(DataSet: TDataSet);
begin
  Produto1.Close;
  Produto1.ParamByName('PRD_CODIGO').asInteger:=Item_de_Embarque2.CodigoPRD;
  Produto1.Open;
  Item_de_Embarque2.FieldByName('Produto').asString:=Trim(Produto1.Descricao+' '+Produto1.Caracteristica);
  Item_de_Embarque2.FieldByName('Referencia').asString:=Produto1.Referencia;
  CentroCusto1.Close;
  CentroCusto1.ParamByName('CNC_CODIGO').asInteger:=Item_de_Embarque2.CNC_Codigo_Ent;
  CentroCusto1.Open;
  Item_de_Embarque2.FieldByName('CentrodeCusto').asString:=CentroCusto1.RazaoSocial;
end;

procedure TfMxEmbarque.DBGrid5TitleClick(Column: TColumn);
begin
  try
    if Item_de_Embarque2.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Item_de_Embarque2.SOrdemdoGrid(Item_de_Embarque2.EDbgrid,Column,'');
  except
  end;
end;

procedure TfMxEmbarque.DBGrid1TitleClick(Column: TColumn);
begin
  try
    if Entidade.FieldByName(Column.FieldName).FieldKind <> fkData then
      Exit;
    Entidade.SOrdemdoGrid(Entidade.EDbgrid,Column,'');
  except
  end;
end;

end.
