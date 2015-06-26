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
unit Item_de_Estoque;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Produto, Item_Pedido_Venda, Variants, Funcoes;

type
  TItem_de_Estoque = class(TSQuery)
    private
      { Private fields of TItem_de_Estoque }
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property DHAtualizado }
        FDHAtualizado : Tdatetime;
        { Storage for property Indisponivel }
        FIndisponivel : Double;
        { Storage for property InvComercial }
        FInvComercial : Double;
        { Storage for property InvDtComercial }
        FInvDtComercial : TDateTime;
        { Storage for property InvDtFiscal }
        FInvDtFiscal : TDateTime;
        { Storage for property InvDtFisico }
        FInvDtFisico : TDateTime;
        { Storage for property InvFiscal }
        FInvFiscal : Double;
        { Storage for property InvFisico }
        FInvFisico : Double;
        { Storage for property MaquinaIES }
        FMaquinaIES : Integer;
        { Storage for property SAmostra }
        FSAmostra : Double;
        { Storage for property SAmostraFiscal }
        FSAmostraFiscal : Double;
        { Storage for property SBonificacao }
        FSBonificacao : Double;
        { Storage for property SBonificacaoFiscal }
        FSBonificacaoFiscal : Double;
        { Storage for property SComercial }
        FSComercial : Double;
        { Storage for property SFiscal }
        FSFiscal : Double;
        { Storage for property SFisico }
        FSFisico : Double;
        { Storage for property SLJ4 }
        FSLJ4 : Double;
        { Storage for property SReservado }
        FSReservado : Double;
        { Storage for property SSN }
        FSSN : Double;
        { Storage for property Saldo }
        FSaldo : Double;

      { Private methods of TItem_de_Estoque }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Read method for property DHAtualizado }
        function GetDHAtualizado : Tdatetime;
        { Read method for property Indisponivel }
        function GetIndisponivel : Double;
        { Read method for property InvComercial }
        function GetInvComercial : Double;
        { Read method for property InvDtComercial }
        function GetInvDtComercial : TDateTime;
        { Read method for property InvDtFiscal }
        function GetInvDtFiscal : TDateTime;
        { Read method for property InvDtFisico }
        function GetInvDtFisico : TDateTime;
        { Read method for property InvFiscal }
        function GetInvFiscal : Double;
        { Read method for property InvFisico }
        function GetInvFisico : Double;
        { Read method for property MaquinaIES }
        function GetMaquinaIES : Integer;
        { Read method for property SAmostra }
        function GetSAmostra : Double;
        { Read method for property SAmostraFiscal }
        function GetSAmostraFiscal : Double;
        { Read method for property SBonificacao }
        function GetSBonificacao : Double;
        { Read method for property SBonificacaoFiscal }
        function GetSBonificacaoFiscal : Double;
        { Read method for property SComercial }
        function GetSComercial : Double;
        { Read method for property SFiscal }
        function GetSFiscal : Double;
        { Read method for property SFisico }
        function GetSFisico : Double;
        { Read method for property SLJ4 }
        function GetSLJ4 : Double;
        { Read method for property SReservado }
        function GetSReservado : Double;
        { Read method for property SSN }
        function GetSSN : Double;
        { Read method for property Saldo }
        function GetSaldo : Double;

    protected
      { Protected fields of TItem_de_Estoque }

      { Protected methods of TItem_de_Estoque }

    public
      { Public fields and properties of TItem_de_Estoque }

      { Public methods of TItem_de_Estoque }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        { Insere um Cliente }
        function Inserir(CdCNC, CdPRD, CdFUN:integer; PSComercial, PSFisico, PSReservado, PSFiscal, PIndisponivel:double; PDHAtualizado,PInvDtCom,PInvDtFis,PInvDtFiscal:TDateTime;PInvCom,PInvFis,PInvFiscal:Double):boolean;

    published
      { Published properties of TItem_de_Estoque }
        property CodigoFUN : Integer read GetCodigoFUN write FCodigoFUN;
        { Código do Produto }
        property CodigoPRD : Integer read GetCodigoPRD write FCodigoPRD;
        property DHAtualizado : Tdatetime
             read GetDHAtualizado write FDHAtualizado;
        property Indisponivel : Double
             read GetIndisponivel write FIndisponivel;
        property InvComercial : Double
             read GetInvComercial write FInvComercial;
        property InvDtComercial : TDateTime
             read GetInvDtComercial write FInvDtComercial;
        property InvDtFiscal : TDateTime
             read GetInvDtFiscal write FInvDtFiscal;
        property InvDtFisico : TDateTime
             read GetInvDtFisico write FInvDtFisico;
        property InvFiscal : Double read GetInvFiscal write FInvFiscal;
        property InvFisico : Double read GetInvFisico write FInvFisico;
        property MaquinaIES : Integer read GetMaquinaIES write FMaquinaIES;
        property SAmostra : Double read GetSAmostra write FSAmostra;
        property SAmostraFiscal : Double
             read GetSAmostraFiscal write FSAmostraFiscal;
        property SBonificacao : Double
             read GetSBonificacao write FSBonificacao;
        property SBonificacaoFiscal : Double
             read GetSBonificacaoFiscal write FSBonificacaoFiscal;
        property SComercial : Double read GetSComercial write FSComercial;
        property SFiscal : Double read GetSFiscal write FSFiscal;
        property SFisico : Double read GetSFisico write FSFisico;
        property SLJ4 : Double read GetSLJ4 write FSLJ4;
        property SReservado : Double read GetSReservado write FSReservado;
        property SSN : Double read GetSSN write FSSN;
        property Saldo : Double read GetSaldo write FSaldo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TItem_de_Estoque with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TItem_de_Estoque]);
end;

{ Method to set variable and property values and create objects }
procedure TItem_de_Estoque.AutoInitialize;
begin
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TItem_de_Estoque.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodigoFUN }
function TItem_de_Estoque.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoPRD }
function TItem_de_Estoque.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DHAtualizado }
function TItem_de_Estoque.GetDHAtualizado : Tdatetime;
begin
  try
    if Self.fieldByName('IES_DH_ATUALIZADO').asDateTime > 0 then
      Result := Self.fieldByName('IES_DH_ATUALIZADO').asDateTime
    else
      Result := 0;
  except
    Result := 0;
  end;
end;

{ Read method for property Indisponivel }
function TItem_de_Estoque.GetIndisponivel : Double;
begin
  try
    Result := Self.fieldByName('IES_INDISPONIVEL').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property InvComercial }
function TItem_de_Estoque.GetInvComercial : Double;
begin
  try
    Result := Self.fieldByName('IES_INVENT_COMERCIAL').asFloat;
  except
    result:= 0
  end;
end;


{ Read method for property InvDtComercial }
function TItem_de_Estoque.GetInvDtComercial : TDateTime;
begin
  try
    if Self.fieldByName('IES_INVENT_DATA_COMERCIAL').asDateTime > 0 then
      Result := Self.fieldByName('IES_INVENT_DATA_COMERCIAL').asDateTime
    else
      Result := 0;
  except
    Result := 0;
  end;
end;

{ Read method for property InvDtFiscal }
function TItem_de_Estoque.GetInvDtFiscal : TDateTime;
begin
  try
    if Self.fieldByName('IES_INVENT_DATA_RESERV').asDateTime > 0 then
      Result := Self.fieldByName('IES_INVENT_DATA_RESERV').asDateTime
    else
      Result := 0;
  except
    Result := 0;
  end;
end;

{ Read method for property InvDtFisico }
function TItem_de_Estoque.GetInvDtFisico : TDateTime;
begin
  try
    if Self.fieldByName('IES_INVENT_DATA_FISICO').asDateTime > 0 then
      Result := Self.fieldByName('IES_INVENT_DATA_FISICO').asDateTime
    else
      Result := 0;
  except
    Result := 0;
  end;
end;

{ Read method for property InvFiscal }
function TItem_de_Estoque.GetInvFiscal : Double;
begin
  try
    Result := Self.fieldByName('IES_INVENT_RESERV').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property InvFisico }
function TItem_de_Estoque.GetInvFisico : Double;
begin
  try
    Result := Self.fieldByName('IES_INVENT_FISICO').asFloat;
  except
    result:= 0
  end;
end;


{ Read method for property MaquinaIES }
function TItem_de_Estoque.GetMaquinaIES : Integer;
begin
  try
    Result := Self.fieldByName('IES_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property SAmostra }
function TItem_de_Estoque.GetSAmostra : Double;
begin
  try
    Result := Self.fieldByName('IES_SAMOSTRA').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property SAmostraFiscal }
function TItem_de_Estoque.GetSAmostraFiscal : Double;
begin
  try
    Result := Self.fieldByName('IES_SAMOSTRA_FISCAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property SBonificacao }
function TItem_de_Estoque.GetSBonificacao : Double;
begin
  try
    Result := Self.fieldByName('IES_SBONIFICACAO').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property SBonificacaoFiscal }
function TItem_de_Estoque.GetSBonificacaoFiscal : Double;
begin
  try
    Result := Self.fieldByName('IES_SBONIFICACAO_FISCAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property SComercial }
function TItem_de_Estoque.GetSComercial : Double;
begin
  try
    Result := Self.fieldByName('IES_SCOMERCIAL').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property SFiscal }
function TItem_de_Estoque.GetSFiscal : Double;
begin
  try
    result := Self.fieldByName('IES_SFISCAL').asFloat;
  except
    result := 0;
  end;
end;

{ Read method for property SFisico }
function TItem_de_Estoque.GetSFisico : Double;
begin
  try
    Result := Self.fieldByName('IES_SFISICO').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property SLJ4 }
function TItem_de_Estoque.GetSLJ4 : Double;
begin
  try
    Result := Self.fieldByName('IES_SLJ4').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property SReservado }
function TItem_de_Estoque.GetSReservado : Double;
begin
  try
    if Self.fieldByName('IES_SRESERVADO').asFloat <= 0 then
      result := 0
    else
      Result := Self.fieldByName('IES_SRESERVADO').asFloat;
  except
    result:= 0
  end;
end;

{ Read method for property SSN }
function TItem_de_Estoque.GetSSN : Double;
begin
  try
    Result := Self.fieldByName('IES_SSN').asFloat;
  except
    result:= 0;
  end;
end;

{ Read method for property Saldo }
function TItem_de_Estoque.GetSaldo : Double;
var
  vReserva : Double;
begin
  try
    if Self.fieldByName('IES_SRESERVADO').asFloat <= 0 then
      vReserva := 0
    else
      vReserva := Self.fieldByName('IES_SRESERVADO').asFloat;
    Result := (Self.fieldByName('IES_SCOMERCIAL').asFloat
              - vReserva
              - Self.fieldByName('IES_INDISPONIVEL').asFloat);
  except
    result:= 0
  end;
end;

constructor TItem_de_Estoque.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'ITEM_DE_ESTOQUE';

     { Code to perform other tasks when the component is created }

end;

destructor TItem_de_Estoque.Destroy;
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

{ Insere um Cliente }
function TItem_de_Estoque.Inserir(CdCNC, CdPRD, CdFUN:integer; PSComercial, PSFisico, PSReservado, PSFiscal, PIndisponivel:double; PDHAtualizado,PInvDtCom,PInvDtFis,PInvDtFiscal:TDateTime;PInvCom,PInvFis,PInvFiscal:Double):boolean;
var
  vData: TDateTime;
begin
  result:=False;
  if PDHAtualizado > 0 then
    vData := PDHAtualizado
  else
    vData := CConfiguracao.DataHora;
  if vData <= 0 then
  Begin
    ShowMessage('Problema com a Data!');
    Exit;
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO '+Tabela+
      '(CNC_CODIGO,PRD_CODIGO,FUN_CODIGO,USU_CODIGO,IES_MAQUINA,IES_DH_ATUALIZADO '+
      ',IES_SCOMERCIAL,IES_SFISICO,IES_SRESERVADO,IES_SFISCAL,IES_INDISPONIVEL '+
      ',IES_SSN,IES_SLJ4,IES_SAMOSTRA,IES_SAMOSTRA_FISCAL,IES_SBONIFICACAO,IES_SBONIFICACAO_FISCAL '+
      ',IES_INVENT_COMERCIAL,IES_INVENT_FISICO,IES_INVENT_RESERV '+
      ',IES_INVENT_DATA_COMERCIAL,IES_INVENT_DATA_FISICO,IES_INVENT_DATA_RESERV) VALUES '+
      '( '+IntToStr(CdCNC)+
      ', '+IntToStr(CdPRD)+
      ', '+IntToStr(CdFUN)+      
      ', '+IntToStr(CConfiguracao.CodigoUSU)+      
      ', '+IntToStr(Maquina)+
      ',"'+MesDiaHora(vData)+'" '+
      ', '+VirgPonto(PSComercial)+
      ', '+VirgPonto(PSFisico)+
      ', '+VirgPonto(PSReservado)+
      ', '+VirgPonto(PSFiscal)+
      ', '+VirgPonto(PIndisponivel)+
      ',0'+ //SN
      ',0'+ //LJ4
      ',0'+ //Amostra
      ',0'+ //AmostraFiscal
      ',0'+ //Bonificação
      ',0'+ //BonificaçãoFiscal
      ', '+VirgPonto(PInvCom)+
      ', '+VirgPonto(PInvFis)+
      ', '+VirgPonto(PInvFiscal)+  //Salvo no campo InvetReservado
      ',"'+MesDiaHora(PInvDtCom)+'" '+
      ',"'+MesDiaHora(PInvDtFis)+'" '+
      ',"'+MesDiaHora(PInvDtFiscal)+'") '); //Salvo no campo DataIventReservado
    Result := True;
  except
    ShowMessage('Não foi possível incluir o registro corrente!');
  End;
end;


end.
