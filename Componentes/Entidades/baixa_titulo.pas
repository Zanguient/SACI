////////////////////////////////////////////////////////////////////////////////
//============================================================================//
// NOME DO PROJETO.....: PSACI                                                //
//============================================================================//
// REVISÃO.............: 2.0                                                  //
// MÓDULO..............: PSACI                                                //
// UNIT................: Cadastro de Bancos                                   //
// ANALISTA............: Anderson Gonçalves                                   //
// DESENVOLVEDOR.......: Anderson Gonçalves                                   //
// DATA DAS ALTERAÇÕES.: 02/10/2010                                           //
//============================================================================//
// COMENTÁRIOS..:                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//              :                                                             //
//============================================================================//
////////////////////////////////////////////////////////////////////////////////
unit Baixa_Titulo;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Funcoes, Variants;

type
  TBaixa_Titulo = class(TSQuery)
    private
      { Private fields of TBaixa_Titulo }
        { Storage for property CodigoAGF }
        FCodigoAGF : Integer;
        { Storage for property CodigoBOL }
        FCodigoBOL : Integer;
        { Storage for property CodigoBXT }
        FCodigoBXT : Integer;
        { Storage for property CodigoCCX }
        FCodigoCCX : Integer;
        { Storage for property CodigoCCXRecebimento }
        FCodigoCCXRecebimento : Integer;
        { Storage for property CodigoTRC }
        FCodigoTRC : Integer;
        { Storage for property Cred_Cli }
        FCred_Cli : Double;
        { Storage for property DataCadastro }
        FDataCadastro : TDateTime;
        { Storage for property Desconto }
        FDesconto : Double;
        { Storage for property Juros }
        FJuros : Double;
        { Storage for property Numero }
        FNumero : String;
        { Storage for property OBS }
        FOBS : String;
        { Storage for property Pagamento }
        FPagamento : TDateTime;
        { Storage for property Sequencia }
        FSequencia : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property Tipo }
        FTipo : Integer;
        { Storage for property TipoDoc }
        FTipoDoc : Integer;
        { Storage for property TipoPag }
        FTipoPag : Integer;
        { Storage for property TituloCNC }
        FTituloCNC : Integer;
        { Storage for property Valor }
        FValor : Double;
        { Storage for property ValorPG }
        FValorPG : Double;
        { Storage for property Vencimento }
        FVencimento : TDateTime;

      { Private methods of TBaixa_Titulo }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoAGF }
        function GetCodigoAGF : Integer;
        { Read method for property CodigoBOL }
        function GetCodigoBOL : Integer;
        { Read method for property CodigoBXT }
        function GetCodigoBXT : Integer;
        { Read method for property CodigoCCX }
        function GetCodigoCCX : Integer;
        { Read method for property CodigoCCXRecebimento }
        function GetCodigoCCXRecebimento : Integer;
        { Read method for property CodigoTRC }
        function GetCodigoTRC : Integer;
        { Read method for property Cred_Cli }
        function GetCred_Cli : Double;
        { Read method for property DataCadastro }
        function GetDataCadastro : TDateTime;
        { Read method for property Desconto }
        function GetDesconto : Double;
        { Read method for property Juros }
        function GetJuros : Double;
        { Read method for property Numero }
        function GetNumero : String;
        { Read method for property OBS }
        function GetOBS : String;
        { Read method for property Pagamento }
        function GetPagamento : TDateTime;
        { Read method for property Sequencia }
        function GetSequencia : String;
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Read method for property Tipo }
        function GetTipo : Integer;
        { Read method for property TipoDoc }
        function GetTipoDoc : Integer;
        { Read method for property TipoPag }
        function GetTipoPag : Integer;
        { Read method for property TituloCNC }
        function GetTituloCNC : Integer;
        { Read method for property Valor }
        function GetValor : Double;
        { Read method for property ValorPG }
        function GetValorPG : Double;
        { Read method for property Vencimento }
        function GetVencimento : TDateTime;

    protected
      { Protected fields of TBaixa_Titulo }

      { Protected methods of TBaixa_Titulo }

    public
      { Public fields and properties of TBaixa_Titulo }

      { Public methods of TBaixa_Titulo }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        { Insere um Titulo }
        function Inserir(CNCTRC,TRC,AGF,CCX,CCXRec,PTipo,PTipoDoc,PtipoPag,PSit:Integer; PSeq,PNumero,POBS: String; DtVenc,DtPag:TDateTime; PValor,PValorPG,PCred,PDesconto,PJuros:Double):boolean;
        function LocalizarCod(CdBXT, CdCNC:Integer):Boolean;

    published
      { Published properties of TBaixa_Titulo }
        property CodigoAGF : Integer read GetCodigoAGF write FCodigoAGF;
        property CodigoBOL : Integer read GetCodigoBOL write FCodigoBOL;
        property CodigoBXT : Integer read GetCodigoBXT write FCodigoBXT;
        property CodigoCCX : Integer read GetCodigoCCX write FCodigoCCX;
        property CodigoCCXRecebimento : Integer
             read GetCodigoCCXRecebimento write FCodigoCCXRecebimento;
        { Código do Abastecimento }
        property CodigoTRC : Integer read GetCodigoTRC write FCodigoTRC;
        property Cred_Cli : Double read GetCred_Cli write FCred_Cli;
        property DataCadastro : TDateTime
             read GetDataCadastro write FDataCadastro;
        property Desconto : Double read GetDesconto write FDesconto;
        property Juros : Double read GetJuros write FJuros;
        property Numero : String read GetNumero write FNumero;
        property OBS : String read GetOBS write FOBS;
        property Pagamento : TDateTime read GetPagamento write FPagamento;
        property Sequencia : String read GetSequencia write FSequencia;
        property Situacao : Integer read GetSituacao write FSituacao;
        property Tipo : Integer read GetTipo write FTipo;
        property TipoDoc : Integer read GetTipoDoc write FTipoDoc;
        property TipoPag : Integer read GetTipoPag write FTipoPag;
        property TituloCNC : Integer read GetTituloCNC write FTituloCNC;
        property Valor : Double read GetValor write FValor;
        property ValorPG : Double read GetValorPG write FValorPG;
        property Vencimento : TDateTime read GetVencimento write FVencimento;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TBaixa_Titulo with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TBaixa_Titulo]);
end;

{ Method to set variable and property values and create objects }
procedure TBaixa_Titulo.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TBaixa_Titulo.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoAGF }
function TBaixa_Titulo.GetCodigoAGF : Integer;
begin
  try
    Result := Self.fieldByName('AGF_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoBOL }
function TBaixa_Titulo.GetCodigoBOL : Integer;
begin
  try
    Result := Self.fieldByName('BOL_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoBXT }
function TBaixa_Titulo.GetCodigoBXT : Integer;
begin
  try
    Result := Self.fieldByName('BXT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCCX }
function TBaixa_Titulo.GetCodigoCCX : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCCXRecebimento }
function TBaixa_Titulo.GetCodigoCCXRecebimento : Integer;
begin
  try
    Result := Self.fieldByName('CCX_CODIGO_REC').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoTRC }
function TBaixa_Titulo.GetCodigoTRC : Integer;
begin
  try
    Result := Self.fieldByName('TRC_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Cred_Cli }
function TBaixa_Titulo.GetCred_Cli : Double;
begin
  try
    Result := Self.fieldByName('BXT_CREDITO_CLI').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property DataCadastro }
function TBaixa_Titulo.GetDataCadastro : TDateTime;
begin
  try
    Result := Self.fieldByName('BXT_DT_CADASTRO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property Desconto }
function TBaixa_Titulo.GetDesconto : Double;
begin
  try
    Result := Self.fieldByName('BXT_DESCONTO').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Juros }
function TBaixa_Titulo.GetJuros : Double;
begin
  try
    Result := Self.fieldByName('BXT_JUROS').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Numero }
function TBaixa_Titulo.GetNumero : String;
begin
  try
    Result := Self.fieldByName('BXT_NUMERO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property OBS }
function TBaixa_Titulo.GetOBS : String;
begin
  try
    Result := Self.fieldByName('BXT_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Pagamento }
function TBaixa_Titulo.GetPagamento : TDateTime;
begin
  try
    Result := Self.fieldByName('BXT_PAGAMENTO').asDateTime;
  except
    result:= 0;
  end;
end;

{ Read method for property Sequencia }
function TBaixa_Titulo.GetSequencia : String;
begin
  try
    Result := Self.fieldByName('BXT_SEQUENCIA').asString;
  except
    result:='';
  end;
end;

{ Read method for property Situacao }
function TBaixa_Titulo.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('BXT_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Tipo }
function TBaixa_Titulo.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('BXT_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property TipoDoc }
function TBaixa_Titulo.GetTipoDoc : Integer;
begin
  try
    Result := Self.fieldByName('BXT_TIPO_DOC').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property TipoPag }
function TBaixa_Titulo.GetTipoPag : Integer;
begin
  try
    Result := Self.fieldByName('BXT_TIPO_PAG').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property TituloCNC }
function TBaixa_Titulo.GetTituloCNC : Integer;
begin
  try
    Result := Self.fieldByName('CNC_TITULO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Valor }
function TBaixa_Titulo.GetValor : Double;
begin
  try
    Result := Self.fieldByName('BXT_VALOR').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property ValorPG }
function TBaixa_Titulo.GetValorPG : Double;
begin
  try
    Result := Self.fieldByName('BXT_VALOR_PAGO').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Vencimento }
function TBaixa_Titulo.GetVencimento : TDateTime;
begin
  try
    Result := Self.fieldByName('BXT_VENCIMENTO').asDateTime;
  except
    result:= 0;
  end;
end;

constructor TBaixa_Titulo.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'BAIXA_TITULO';

     { Code to perform other tasks when the component is created }

end;

destructor TBaixa_Titulo.Destroy;
begin
     { AutoDestroy, which is generated by Component Create, frees any   }
     { objects created by AutoInitialize.                               }
     AutoDestroy;

     { Here, free any other dynamic objects that the component methods  }
     { created but have not yet freed.  Also perform any other clean-up }
     { operations needed before the component is destroyed.             }

     { Last, free the component by calling the Destroy method of the    }
     { parent class.                                                    }
     inherited Destroy;
end;

{ Insere um Titulo }
function TBaixa_Titulo.Inserir(CNCTRC,TRC,AGF,CCX,CCXRec,PTipo,PTipoDoc,PtipoPag,PSit:Integer; PSeq,PNumero,POBS: String; DtVenc,DtPag:TDateTime; PValor,PValorPG,PCred,PDesconto,PJuros:Double):boolean;
Var
  Cod: Integer;
begin
  result:=false;
  Cod    := ProximoCodigo('BXT_CODIGO');
  If (localizarCod(Cod,CConfiguracao.CodigoCNC)) Then
    ShowMessage('Não foi possível inserir o registro corrente pois o mesmo já existe!')
  Else
  begin
    try
      ExecutaSQL(CConfiguracao.QueryComandos,'INSERT '+Tabela+
        '(CNC_CODIGO,BXT_CODIGO,USU_CODIGO,BXT_DT_CADASTRO '+
        ',CNC_TITULO,TRC_CODIGO,BXT_TIPO,BXT_DT_VENCIMENTO '+
        ',BXT_DT_PAGAMENTO,BXT_TIPO_DOC,BXT_TIPO_PAG,BXT_NUMERO '+
        ',BXT_SEQUENCIA,AGF_CODIGO,CCX_CODIGO,CCX_CODIGO_REC '+
        ',BXT_VALOR,BXT_CREDITO_CLI,BXT_JUROS '+
        ',BXT_DESCONTO,BXT_VALOR_PAGO,BXT_SITUACAO,BXT_OBSERVACAO) VALUES '+
        '( '+IntToStr(CConfiguracao.CodigoCNC)+
        ', '+IntToStr(Cod)+
        ', '+IntToStr(CConfiguracao.CodigoUSU)+
        ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
        ', '+IntToStr(CNCTRC)+
        ', '+IntToStr(TRC)+
        ', '+IntToStr(PTipo)+
        ',"'+MesDiaHora(DtVenc)+'" '+
        ',"'+MesDiaHora(DtPag)+'" '+
        ', '+IntToStr(PTipoDoc)+
        ', '+IntToStr(PTipoPag)+
        ',"'+PNumero+'" '+
        ',"'+PSeq+'" '+
        ', '+IntToStr(AGF)+
        ', '+IntToStr(CCX)+
        ', '+IntToStr(CCXRec)+
        ', '+VirgPonto(PValor)+
        ', '+VirgPonto(PCred)+
        ', '+VirgPonto(PJuros)+
        ', '+VirgPonto(PDesconto)+
        ', '+VirgPonto(PValorPg)+
        ', '+IntToStr(PSit)+
        ',"'+POBS+'") ');
      Result := True;
    except
      ShowMessage('Não foi possível incluir o registro corrente! Verifique se o tipo de dado a ser inserido é igual ao do campo.');
    end;
  end;
end;

function TBaixa_Titulo.LocalizarCod(CdBXT, CdCNC:Integer):Boolean;
begin
  with CConfiguracao.QueryConsultas do
  Begin
    Close;
    SQL.Text := 'SELECT BXT_CODIGO FROM '+Tabela+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND BXT_CODIGO='+IntToStr(CdBXT);
    Open;
    Result := (not isEmpty);
  end;
end;


end.
