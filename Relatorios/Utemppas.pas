unit Utemppas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DBTables, Db, dclDQuery;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Database1: TDatabase;
    confRel: TDuckQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
Uses
 UAgencia, UBancos, UAgen_Financeiro, UAplic_Financeira, UAutorizada,
  UAvalista, UCaixa, UCateg_de_produtos, UCentro_de_custo,
  UConsorciado, UConta_bancaria, UConta_contabil, UContato,
  UForma_de_pagamento,  UGrupo_consorcio, UIndex_economico, ULivro_caixa,
  UOperacao_sistema, UOrigem_fiscal, UParametro, URegistro_procura, USecao,
  USol_pecas_rep, USubclass_fiscal, USubgrupo, USubtarefas, UTipo_parametro,
  UUsuario, UInform_de_credito, UTarefa,  UFuncionario, USol_de_garantia,
  UTransportadoras, UBeneficiario, UCliente, UVendedor, UProduto, Umodulo,
  UProcura_Mercadoria, UPendencia_reposicao, URel_Fiscal ;
{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
//  rpt_fiscal.report.Preview;
  confRel.OpenFile('p:\eletro guerra\relatorios\agencia.dqf');
  confRel.Editor(0, 'Configuração do relatório de agências');
end;

end.
