unit UTelaCalculaFrete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRCtrls, ZReport, Db, DBTables, SQuery, Cliente, StdCtrls, Grupo, funcoes;

type
  Trpt_TelaCalculaFrete = class(TForm)
    report: TSZReport;
    ZRBand1: TSZRBand;
    ZRLabel2: TSZRLabel;
    ZRSysData2: TSZRSysData;
    ZRLabel3: TSZRLabel;
    ZRLabel5: TSZRLabel;
    ZRLabel1: TSZRLabel;
    ZRLabel6: TSZRLabel;
    zrlTotalFrete: TSZRLabel;
    ZRLabel9: TSZRLabel;
    ZRLabel10: TSZRLabel;
    zrlTotalICMS: TSZRLabel;
    SZRLabel7: TSZRLabel;
    SZRLabel8: TSZRLabel;
    SZRLabel150: TSZRLabel;
    zrlEdit1: TSZRLabel;
    zrlEdit52: TSZRLabel;
    zrlEdit13: TSZRLabel;
    zrlEdit64: TSZRLabel;
    zrlEdit35: TSZRLabel;
    zrlEdit2: TSZRLabel;
    zrlEdit53: TSZRLabel;
    zrlEdit14: TSZRLabel;
    zrlEdit70: TSZRLabel;
    zrlEdit36: TSZRLabel;
    zrlEdit3: TSZRLabel;
    zrlEdit54: TSZRLabel;
    SZRLabel1: TSZRLabel;
    SZRLabel2: TSZRLabel;
    SZRLabel4: TSZRLabel;
    SZRLabel5: TSZRLabel;
    zrlEdit15: TSZRLabel;
    zrlEdit71: TSZRLabel;
    zrlEdit37: TSZRLabel;
    zrlEdit4: TSZRLabel;
    zrlEdit55: TSZRLabel;
    zrlEdit16: TSZRLabel;
    zrlEdit72: TSZRLabel;
    zrlEdit38: TSZRLabel;
    zrlEdit5: TSZRLabel;
    zrlEdit56: TSZRLabel;
    zrlEdit17: TSZRLabel;
    zrlEdit73: TSZRLabel;
    zrlEdit39: TSZRLabel;
    zrlEdit6: TSZRLabel;
    zrlEdit57: TSZRLabel;
    zrlEdit18: TSZRLabel;
    zrlEdit74: TSZRLabel;
    zrlEdit40: TSZRLabel;
    zrlEdit7: TSZRLabel;
    zrlEdit58: TSZRLabel;
    zrlEdit19: TSZRLabel;
    zrlEdit75: TSZRLabel;
    zrlEdit41: TSZRLabel;
    zrlEdit8: TSZRLabel;
    zrlEdit59: TSZRLabel;
    zrlEdit20: TSZRLabel;
    zrlEdit76: TSZRLabel;
    zrlEdit42: TSZRLabel;
    zrlEdit9: TSZRLabel;
    zrlEdit60: TSZRLabel;
    zrlEdit21: TSZRLabel;
    zrlEdit77: TSZRLabel;
    zrlEdit43: TSZRLabel;
    zrlEdit10: TSZRLabel;
    zrlEdit61: TSZRLabel;
    zrlEdit22: TSZRLabel;
    zrlEdit78: TSZRLabel;
    zrlEdit44: TSZRLabel;
    zrlEdit11: TSZRLabel;
    zrlEdit62: TSZRLabel;
    zrlEdit23: TSZRLabel;
    zrlEdit79: TSZRLabel;
    zrlEdit45: TSZRLabel;
    zrlEdit12: TSZRLabel;
    zrlEdit63: TSZRLabel;
    zrlEdit24: TSZRLabel;
    zrlEdit80: TSZRLabel;
    zrlEdit46: TSZRLabel;
    zrlTotalFreteCalculado: TSZRLabel;
    zrlTotalICMSCalculado: TSZRLabel;
    SZRLabel71: TSZRLabel;
    zrlEdit25: TSZRLabel;
    zrlEdit26: TSZRLabel;
    zrlEdit27: TSZRLabel;
    zrlEdit28: TSZRLabel;
    zrlEdit29: TSZRLabel;
    zrlEdit30: TSZRLabel;
    zrlEdit31: TSZRLabel;
    zrlEdit32: TSZRLabel;
    zrlEdit33: TSZRLabel;
    zrlEdit68: TSZRLabel;
    zrlEdit65: TSZRLabel;
    zrlEdit66: TSZRLabel;
    zrlEdit67: TSZRLabel;
    zrlEdit34: TSZRLabel;
    zrlEdit81: TSZRLabel;
    zrlEdit82: TSZRLabel;
    zrlEdit83: TSZRLabel;
    zrlEdit84: TSZRLabel;
    zrlEdit85: TSZRLabel;
    zrlEdit47: TSZRLabel;
    zrlEdit48: TSZRLabel;
    zrlEdit49: TSZRLabel;
    zrlEdit50: TSZRLabel;
    zrlEdit51: TSZRLabel;
    zrlEdit69: TSZRLabel;
    ZRLabel4: TSZRLabel;
    zrlUsuario: TSZRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZRLabel3BeforePrint(Sender: TObject; var DoPrint: Boolean);
    procedure ZRBand1BeforePrint(Sender: TObject; var DoPrint: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpt_TelaCalculaFrete: Trpt_TelaCalculaFrete;

implementation
uses
  UDM, MxCalculaFrete;

{$R *.DFM}

procedure Trpt_TelaCalculaFrete.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := cafree;
end;

procedure Trpt_TelaCalculaFrete.ZRLabel3BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
end;

procedure Trpt_TelaCalculaFrete.ZRBand1BeforePrint(Sender: TObject;
  var DoPrint: Boolean);
begin
  ZRLabel1.Caption:=DM.CentroCusto1.RazaoSocial;
  ZRLabel3.Caption:=DM.Configuracao1.LojaNome;
  ZRLabel4.Caption   := EmpresaDesenvolvedora;  
  with fMxCalculaFrete do
  Begin
    zrlTotalFrete.Caption:= edtTotalFrete.Text;
    zrlTotalICMS.Caption := edtICMSFrete.Text;
    zrlTotalFreteCalculado.Caption:= edtFreteCalculado.Text;
    zrlTotalICMSCalculado.Caption := edtICMSCalculado.Text;
    zrlEdit1.Caption := Edit1.Text;
    zrlEdit2.Caption := Edit2.Text;
    zrlEdit3.Caption := Edit3.Text;
    zrlEdit4.Caption := Edit4.Text;
    zrlEdit5.Caption := Edit5.Text;
    zrlEdit6.Caption := Edit6.Text;
    zrlEdit7.Caption := Edit7.Text;
    zrlEdit8.Caption := Edit8.Text;
    zrlEdit9.Caption := Edit9.Text;
    zrlEdit10.Caption:= Edit10.Text;
    zrlEdit11.Caption:= Edit11.Text;
    zrlEdit12.Caption:= Edit12.Text;
    zrlEdit13.Caption:= Edit13.Text;
    zrlEdit14.Caption:= Edit14.Text;
    zrlEdit15.Caption:= Edit15.Text;
    zrlEdit16.Caption:= Edit16.Text;
    zrlEdit17.Caption:= Edit17.Text;
    zrlEdit18.Caption:= Edit18.Text;
    zrlEdit19.Caption:= Edit19.Text;
    zrlEdit20.Caption:= Edit20.Text;
    zrlEdit21.Caption:= Edit21.Text;
    zrlEdit22.Caption:= Edit22.Text;
    zrlEdit23.Caption:= Edit23.Text;
    zrlEdit24.Caption:= Edit24.Text;
    zrlEdit25.Caption:= Edit25.Text;
    zrlEdit26.Caption:= Edit26.Text;
    zrlEdit27.Caption:= Edit27.Text;
    zrlEdit28.Caption:= Edit28.Text;
    zrlEdit29.Caption:= Edit29.Text;
    zrlEdit30.Caption:= Edit30.Text;
    zrlEdit31.Caption:= Edit31.Text;
    zrlEdit32.Caption:= Edit32.Text;
    zrlEdit33.Caption:= Edit33.Text;
    zrlEdit34.Caption:= Edit34.Text;
    zrlEdit35.Caption:= Edit35.Text;
    zrlEdit36.Caption:= Edit36.Text;
    zrlEdit37.Caption:= Edit37.Text;
    zrlEdit38.Caption:= Edit38.Text;
    zrlEdit39.Caption:= Edit39.Text;
    zrlEdit40.Caption:= Edit40.Text;
    zrlEdit41.Caption:= Edit41.Text;
    zrlEdit42.Caption:= Edit42.Text;
    zrlEdit43.Caption:= Edit43.Text;
    zrlEdit44.Caption:= Edit44.Text;
    zrlEdit45.Caption:= Edit45.Text;
    zrlEdit46.Caption:= Edit46.Text;
    zrlEdit47.Caption:= Edit47.Text;
    zrlEdit48.Caption:= Edit48.Text;
    zrlEdit49.Caption:= Edit49.Text;
    zrlEdit50.Caption:= Edit50.Text;
    zrlEdit51.Caption:= Edit51.Text;
    zrlEdit52.Caption:= Edit52.Text;
    zrlEdit53.Caption:= Edit53.Text;
    zrlEdit54.Caption:= Edit54.Text;
    zrlEdit55.Caption:= Edit55.Text;
    zrlEdit56.Caption:= Edit56.Text;
    zrlEdit57.Caption:= Edit57.Text;
    zrlEdit58.Caption:= Edit58.Text;
    zrlEdit59.Caption:= Edit59.Text;
    zrlEdit60.Caption:= Edit60.Text;
    zrlEdit61.Caption:= Edit61.Text;
    zrlEdit62.Caption:= Edit62.Text;
    zrlEdit63.Caption:= Edit63.Text;
    zrlEdit64.Caption:= Edit64.Text;
    zrlEdit65.Caption:= Edit65.Text;
    zrlEdit66.Caption:= Edit66.Text;
    zrlEdit67.Caption:= Edit67.Text;
    zrlEdit68.Caption:= Edit68.Text;
    zrlEdit69.Caption:= Edit69.Text;
    zrlEdit70.Caption:= Edit70.Text;
    zrlEdit71.Caption:= Edit71.Text;
    zrlEdit72.Caption:= Edit72.Text;
    zrlEdit73.Caption:= Edit73.Text;
    zrlEdit74.Caption:= Edit74.Text;
    zrlEdit75.Caption:= Edit75.Text;
    zrlEdit76.Caption:= Edit76.Text;
    zrlEdit77.Caption:= Edit77.Text;
    zrlEdit78.Caption:= Edit78.Text;
    zrlEdit79.Caption:= Edit79.Text;
    zrlEdit80.Caption:= Edit80.Text;
    zrlEdit81.Caption:= Edit81.Text;
    zrlEdit82.Caption:= Edit82.Text;
    zrlEdit83.Caption:= Edit83.Text;
    zrlEdit84.Caption:= Edit84.Text;
    zrlEdit85.Caption:= Edit85.Text;
  end;

  zrlUsuario.Caption := 'Usuario: '+UpperCase(DM.NomeUsuario(DM.Configuracao1.CodigoUSU));
end;

end.
