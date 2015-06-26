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
unit Comunicacao;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, 
     Forms, Graphics, Squery, Dbtables, Dialogs, Db, Stdctrls, 
     Mask, Dbctrls, Configuracao, Dbgrids, Funcoes, Extctrls, 
     Variants, DateUtils;

type
  TComunicacao = class(TSQuery)
    private
      { Private fields of TComunicacao }
        { Storage for property CodEntrada }
        FCodEntrada : Integer;
        { Storage for property CodEntradaCNC }
        FCodEntradaCNC : Integer;
        { Storage for property CodOrigem }
        FCodOrigem : Integer;
        { Storage for property CodOrigemCNC }
        FCodOrigemCNC : Integer;
        { Storage for property CodPedido }
        FCodPedido : Integer;
        { Storage for property CodPedidoCNC }
        FCodPedidoCNC : Integer;
        { Storage for property CodTitulo }
        FCodTitulo : Integer;
        { Storage for property CodTituloCNC }
        FCodTituloCNC : Integer;
        { Storage for property CodigoCNT }
        FCodigoCNT : Integer;
        { Storage for property CodigoCOM }
        FCodigoCOM : Integer;
        { Storage for property CodigoFUN }
        FCodigoFUN : Integer;
        { Storage for property CodigoPRD }
        FCodigoPRD : Integer;
        { Storage for property CodigoTAR }
        FCodigoTAR : Integer;
        { Storage for property ContatoCNC }
        FContatoCNC : Integer;
        { Storage for property DataAlterado }
        FDataAlterado : TDateTime;
        { Storage for property DataCadastro }
        FDataCadastro : Tdatetime;
        { Storage for property DataComunicacao }
        FDataComunicacao : Tdatetime;
        { Storage for property Detalhe }
        FDetalhe : String;
        { Storage for property ECodEntrada }
        FECodEntrada : TEdit;
        { Storage for property ECodEntradaCNC }
        FECodEntradaCNC : TEdit;
        { Storage for property ECodOrigem }
        FECodOrigem : TEdit;
        { Storage for property ECodOrigemCNC }
        FECodOrigemCNC : TEdit;
        { Storage for property ECodPedido }
        FECodPedido : TEdit;
        { Storage for property ECodPedidoCNC }
        FECodPedidoCNC : TEdit;
        { Storage for property ECodTitulo }
        FECodTitulo : TEdit;
        { Storage for property ECodTituloCNC }
        FECodTituloCNC : TEdit;
        { Storage for property ECodigoCNT }
        FECodigoCNT : TEdit;
        { Storage for property ECodigoCOM }
        FECodigoCOM : TEdit;
        { Storage for property ECodigoFUN }
        FECodigoFUN : TDBLookupComboBox;
        { Storage for property ECodigoPRD }
        FECodigoPRD : TEdit;
        { Storage for property ECodigoTAR }
        FECodigoTAR : TEdit;
        { Storage for property EContatoCNC }
        FEContatoCNC : TEdit;
        { Storage for property EDataAlterado }
        FEDataAlterado : TMaskEdit;
        { Storage for property EDataCadastro }
        FEDataCadastro : TMaskEdit;
        { Storage for property EDataComunicacao }
        FEDataComunicacao : TMaskEdit;
        { Storage for property EDetalhe }
        FEDetalhe : TEdit;
        { Storage for property EMeioDeContato }
        FEMeioDeContato : TDBLookupComboBox;
        { Storage for property EMeioDeContatoDetalhe }
        FEMeioDeContatoDetalhe : TEdit;
        { Storage for property EMotivo }
        FEMotivo : TDBLookupComboBox;
        { Storage for property ENivelAcerto }
        FENivelAcerto : TComboBox;
        { Storage for property EObservacao }
        FEObservacao : TEdit;
        { Storage for property EPergunta1 }
        FEPergunta1 : TDBLookupComboBox;
        { Storage for property EPergunta2 }
        FEPergunta2 : TDBLookupComboBox;
        { Storage for property EPergunta3 }
        FEPergunta3 : TDBLookupComboBox;
        { Storage for property EResposta1 }
        FEResposta1 : TEdit;
        { Storage for property EResposta2 }
        FEResposta2 : TEdit;
        { Storage for property EResposta3 }
        FEResposta3 : TEdit;
        { Storage for property ESituacao }
        FESituacao : TCombobox;
        { Storage for property ETarefaCNC }
        FETarefaCNC : TEdit;
        { Storage for property ETipo }
        FETipo : TComboBox;
        { Storage for property MaquinaCOM }
        FMaquinaCOM : Integer;
        { Storage for property MeioDeContato }
        FMeioDeContato : Integer;
        { Storage for property MeioDeContatoDetalhe }
        FMeioDeContatoDetalhe : String;
        { Storage for property Motivo }
        FMotivo : Integer;
        { Storage for property NivelAcerto }
        FNivelAcerto : Integer;
        { Storage for property Observacao }
        FObservacao : String;
        { Storage for property Pergunta1 }
        FPergunta1 : Integer;
        { Storage for property Pergunta2 }
        FPergunta2 : Integer;
        { Storage for property Pergunta3 }
        FPergunta3 : Integer;
        { Storage for property Resposta1 }
        FResposta1 : String;
        { Storage for property Resposta2 }
        FResposta2 : String;
        { Storage for property Resposta3 }
        FResposta3 : String;
        { Storage for property Situacao }
        FSituacao : Integer;
        { Storage for property TarefaCNC }
        FTarefaCNC : Integer;
        { Storage for property Tipo }
        FTipo : Integer;

      { Private methods of TComunicacao }
        { Method to set variable and property values and create objects }
        procedure AutoInitialize;
        { Method to free any objects created by AutoInitialize }
        procedure AutoDestroy;
        { Read method for property CodEntrada }
        function GetCodEntrada : Integer;
        { Read method for property CodEntradaCNC }
        function GetCodEntradaCNC : Integer;
        { Read method for property CodOrigem }
        function GetCodOrigem : Integer;
        { Read method for property CodOrigemCNC }
        function GetCodOrigemCNC : Integer;
        { Read method for property CodPedido }
        function GetCodPedido : Integer;
        { Read method for property CodPedidoCNC }
        function GetCodPedidoCNC : Integer;
        { Read method for property CodTitulo }
        function GetCodTitulo : Integer;
        { Read method for property CodTituloCNC }
        function GetCodTituloCNC : Integer;
        { Read method for property CodigoCNT }
        function GetCodigoCNT : Integer;
        { Read method for property CodigoCOM }
        function GetCodigoCOM : Integer;
        { Read method for property CodigoFUN }
        function GetCodigoFUN : Integer;
        { Read method for property CodigoPRD }
        function GetCodigoPRD : Integer;
        { Read method for property CodigoTAR }
        function GetCodigoTAR : Integer;
        { Read method for property ContatoCNC }
        function GetContatoCNC : Integer;
        { Read method for property DataAlterado }
        function GetDataAlterado : TDateTime;
        { Read method for property DataCadastro }
        function GetDataCadastro : Tdatetime;
        { Read method for property DataComunicacao }
        function GetDataComunicacao : Tdatetime;
        { Read method for property Detalhe }
        function GetDetalhe : String;
        { Read method for property MaquinaCOM }
        function GetMaquinaCOM : Integer;
        { Read method for property MeioDeContato }
        function GetMeioDeContato : Integer;
        { Read method for property MeioDeContatoDetalhe }
        function GetMeioDeContatoDetalhe : String;
        { Read method for property Motivo }
        function GetMotivo : Integer;
        { Read method for property NivelAcerto }
        function GetNivelAcerto : Integer;
        { Read method for property Observacao }
        function GetObservacao : String;
        { Read method for property Pergunta1 }
        function GetPergunta1 : Integer;
        { Read method for property Pergunta2 }
        function GetPergunta2 : Integer;
        { Read method for property Pergunta3 }
        function GetPergunta3 : Integer;
        { Read method for property Resposta1 }
        function GetResposta1 : String;
        { Read method for property Resposta2 }
        function GetResposta2 : String;
        { Read method for property Resposta3 }
        function GetResposta3 : String;
        { Read method for property Situacao }
        function GetSituacao : Integer;
        { Read method for property TarefaCNC }
        function GetTarefaCNC : Integer;
        { Read method for property Tipo }
        function GetTipo : Integer;

    protected
      { Protected fields of TComunicacao }

      { Protected methods of TComunicacao }
        { Resets prop of component type if referenced component deleted }
        procedure Notification(AComponent : TComponent; Operation : TOperation); override;

    public
      { Public fields and properties of TComunicacao }

      { Public methods of TComunicacao }
        function AlterarAuto:Boolean;
        procedure AtualizaControles(Habilitar:Boolean);
        procedure CancelaEdicao;
        procedure CarregaDados;
        constructor Create(AOwner: TComponent); override;
        function Deletar(CdCNC,CdCOM:Integer):Boolean;
        destructor Destroy; override;
        function FinalizaEdicao:Boolean;
        function InserirAuto:Boolean;
        procedure LimpaCampos;
        { Localiza um cliente }
        function LocalizarCod(CdCOM,CdCNC:Integer):Boolean;
        procedure PreparaAlteracao;
        procedure PreparaInsercao;
        function deletarauto:Boolean;

    published
      { Published properties of TComunicacao }
        property CodEntrada : Integer read GetCodEntrada write FCodEntrada;
        property CodEntradaCNC : Integer
             read GetCodEntradaCNC write FCodEntradaCNC;
        property CodOrigem : Integer read GetCodOrigem write FCodOrigem;
        property CodOrigemCNC : Integer
             read GetCodOrigemCNC write FCodOrigemCNC;
        property CodPedido : Integer read GetCodPedido write FCodPedido;
        property CodPedidoCNC : Integer
             read GetCodPedidoCNC write FCodPedidoCNC;
        property CodTitulo : Integer read GetCodTitulo write FCodTitulo;
        property CodTituloCNC : Integer
             read GetCodTituloCNC write FCodTituloCNC;
        { Código do Contato }
        property CodigoCNT : Integer read GetCodigoCNT write FCodigoCNT;
        property CodigoCOM : Integer read GetCodigoCOM write FCodigoCOM;
        property CodigoFUN : Integer read GetCodigoFUN write FCodigoFUN;
        property CodigoPRD : Integer read GetCodigoPRD write FCodigoPRD;
        property CodigoTAR : Integer read GetCodigoTAR write FCodigoTAR;
        property ContatoCNC : Integer read GetContatoCNC write FContatoCNC;
        property DataAlterado : TDateTime
             read GetDataAlterado write FDataAlterado;
        property DataCadastro : Tdatetime
             read GetDataCadastro write FDataCadastro;
        property DataComunicacao : Tdatetime
             read GetDataComunicacao write FDataComunicacao;
        property Detalhe : String read GetDetalhe write FDetalhe;
        property ECodEntrada : TEdit read FECodEntrada write FECodEntrada;
        property ECodEntradaCNC : TEdit
             read FECodEntradaCNC write FECodEntradaCNC;
        property ECodOrigem : TEdit read FECodOrigem write FECodOrigem;
        property ECodOrigemCNC : TEdit
             read FECodOrigemCNC write FECodOrigemCNC;
        property ECodPedido : TEdit read FECodPedido write FECodPedido;
        property ECodPedidoCNC : TEdit
             read FECodPedidoCNC write FECodPedidoCNC;
        property ECodTitulo : TEdit read FECodTitulo write FECodTitulo;
        property ECodTituloCNC : TEdit
             read FECodTituloCNC write FECodTituloCNC;
        property ECodigoCNT : TEdit read FECodigoCNT write FECodigoCNT;
        property ECodigoCOM : TEdit read FECodigoCOM write FECodigoCOM;
        property ECodigoFUN : TDBLookupComboBox
             read FECodigoFUN write FECodigoFUN;
        property ECodigoPRD : TEdit read FECodigoPRD write FECodigoPRD;
        property ECodigoTAR : TEdit read FECodigoTAR write FECodigoTAR;
        property EContatoCNC : TEdit read FEContatoCNC write FEContatoCNC;
        property EDataAlterado : TMaskEdit
             read FEDataAlterado write FEDataAlterado;
        property EDataCadastro : TMaskEdit
             read FEDataCadastro write FEDataCadastro;
        property EDataComunicacao : TMaskEdit
             read FEDataComunicacao write FEDataComunicacao;
        property EDetalhe : TEdit read FEDetalhe write FEDetalhe;
        property EMeioDeContato : TDBLookupComboBox
             read FEMeioDeContato write FEMeioDeContato;
        property EMeioDeContatoDetalhe : TEdit
             read FEMeioDeContatoDetalhe write FEMeioDeContatoDetalhe;
        property EMotivo : TDBLookupComboBox read FEMotivo write FEMotivo;
        property ENivelAcerto : TComboBox
             read FENivelAcerto write FENivelAcerto;
        property EObservacao : TEdit read FEObservacao write FEObservacao;
        property EPergunta1 : TDBLookupComboBox
             read FEPergunta1 write FEPergunta1;
        property EPergunta2 : TDBLookupComboBox
             read FEPergunta2 write FEPergunta2;
        property EPergunta3 : TDBLookupComboBox
             read FEPergunta3 write FEPergunta3;
        property EResposta1 : TEdit read FEResposta1 write FEResposta1;
        property EResposta2 : TEdit read FEResposta2 write FEResposta2;
        property EResposta3 : TEdit read FEResposta3 write FEResposta3;
        property ESituacao : TCombobox read FESituacao write FESituacao;
        property ETarefaCNC : TEdit read FETarefaCNC write FETarefaCNC;
        property ETipo : TComboBox read FETipo write FETipo;
        property MaquinaCOM : Integer read GetMaquinaCOM write FMaquinaCOM;
        property MeioDeContato : Integer
             read GetMeioDeContato write FMeioDeContato;
        property MeioDeContatoDetalhe : String
             read GetMeioDeContatoDetalhe write FMeioDeContatoDetalhe;
        property Motivo : Integer read GetMotivo write FMotivo;
        property NivelAcerto : Integer read GetNivelAcerto write FNivelAcerto;
        property Observacao : String read GetObservacao write FObservacao;
        property Pergunta1 : Integer read GetPergunta1 write FPergunta1;
        property Pergunta2 : Integer read GetPergunta2 write FPergunta2;
        property Pergunta3 : Integer read GetPergunta3 write FPergunta3;
        property Resposta1 : String read GetResposta1 write FResposta1;
        property Resposta2 : String read GetResposta2 write FResposta2;
        property Resposta3 : String read GetResposta3 write FResposta3;
        property Situacao : Integer read GetSituacao write FSituacao;
        property TarefaCNC : Integer read GetTarefaCNC write FTarefaCNC;
        property Tipo : Integer read GetTipo write FTipo;

  end;

procedure Register;

implementation

procedure Register;
begin
     { Register TComunicacao with Softech as its
       default page on the Delphi component palette }
     RegisterComponents('Softech', [TComunicacao]);
end;

{ Method to set variable and property values and create objects }
procedure TComunicacao.AutoInitialize;
begin
     FECodEntrada := nil;
     FECodEntradaCNC := nil;
     FECodOrigem := nil;
     FECodOrigemCNC := nil;
     FECodPedido := nil;
     FECodPedidoCNC := nil;
     FECodTitulo := nil;
     FECodTituloCNC := nil;
     FECodigoCNT := nil;
     FECodigoCOM := nil;
     FECodigoFUN := nil;
     FECodigoPRD := nil;
     FECodigoTAR := nil;
     FEContatoCNC := nil;
     FEDataAlterado := nil;
     FEDataCadastro := nil;
     FEDataComunicacao := nil;
     FEDetalhe := nil;
     FEMeioDeContato := nil;
     FEMeioDeContatoDetalhe := nil;
     FEMotivo := nil;
     FENivelAcerto := nil;
     FEObservacao := nil;
     FEPergunta1 := nil;
     FEPergunta2 := nil;
     FEPergunta3 := nil;
     FEResposta1 := nil;
     FEResposta2 := nil;
     FEResposta3 := nil;
     FESituacao := nil;
     FETarefaCNC := nil;
     FETipo := nil;
end; { of AutoInitialize }

{ Resets prop of component type if referenced component deleted }
procedure TComunicacao.Notification(AComponent : TComponent; Operation : TOperation);
begin
     inherited Notification(AComponent, Operation);
     if Operation <> opRemove then
        Exit;
     { Has a component referenced by a property of 
       this component been deleted?  If so, update 
       the property. }
     if AComponent = FECodEntrada then
        FECodEntrada := nil;
     if AComponent = FECodEntradaCNC then
        FECodEntradaCNC := nil;
     if AComponent = FECodOrigem then
        FECodOrigem := nil;
     if AComponent = FECodOrigemCNC then
        FECodOrigemCNC := nil;
     if AComponent = FECodPedido then
        FECodPedido := nil;
     if AComponent = FECodPedidoCNC then
        FECodPedidoCNC := nil;
     if AComponent = FECodTitulo then
        FECodTitulo := nil;
     if AComponent = FECodTituloCNC then
        FECodTituloCNC := nil;
     if AComponent = FECodigoCNT then
        FECodigoCNT := nil;
     if AComponent = FECodigoCOM then
        FECodigoCOM := nil;
     if AComponent = FECodigoFUN then
        FECodigoFUN := nil;
     if AComponent = FECodigoPRD then
        FECodigoPRD := nil;
     if AComponent = FECodigoTAR then
        FECodigoTAR := nil;
     if AComponent = FEContatoCNC then
        FEContatoCNC := nil;
     if AComponent = FEDataAlterado then
        FEDataAlterado := nil;
     if AComponent = FEDataCadastro then
        FEDataCadastro := nil;
     if AComponent = FEDataComunicacao then
        FEDataComunicacao := nil;
     if AComponent = FEDetalhe then
        FEDetalhe := nil;
     if AComponent = FEMeioDeContato then
        FEMeioDeContato := nil;
     if AComponent = FEMeioDeContatoDetalhe then
        FEMeioDeContatoDetalhe := nil;
     if AComponent = FEMotivo then
        FEMotivo := nil;
     if AComponent = FENivelAcerto then
        FENivelAcerto := nil;
     if AComponent = FEObservacao then
        FEObservacao := nil;
     if AComponent = FEPergunta1 then
        FEPergunta1 := nil;
     if AComponent = FEPergunta2 then
        FEPergunta2 := nil;
     if AComponent = FEPergunta3 then
        FEPergunta3 := nil;
     if AComponent = FEResposta1 then
        FEResposta1 := nil;
     if AComponent = FEResposta2 then
        FEResposta2 := nil;
     if AComponent = FEResposta3 then
        FEResposta3 := nil;
     if AComponent = FESituacao then
        FESituacao := nil;
     if AComponent = FETarefaCNC then
        FETarefaCNC := nil;
     if AComponent = FETipo then
        FETipo := nil;
end;

{ Method to free any objects created by AutoInitialize }
procedure TComunicacao.AutoDestroy;
begin
     { No objects from AutoInitialize to free }
end; { of AutoDestroy }

{ Read method for property CodEntrada }
function TComunicacao.GetCodEntrada : Integer;
begin
  try
    Result := Self.fieldByName('COM_COD_ENTRADA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodEntradaCNC }
function TComunicacao.GetCodEntradaCNC : Integer;
begin
  try
    Result := Self.fieldByName('COM_CNC_ENTRADA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodOrigem }
function TComunicacao.GetCodOrigem : Integer;
begin
  try
    Result := Self.fieldByName('COM_COD_ORIGEM').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodOrigemCNC }
function TComunicacao.GetCodOrigemCNC : Integer;
begin
  try
    Result := Self.fieldByName('COM_CNC_ORIGEM').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodPedido }
function TComunicacao.GetCodPedido : Integer;
begin
  try
    Result := Self.fieldByName('COM_COD_PEDIDO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodPedidoCNC }
function TComunicacao.GetCodPedidoCNC : Integer;
begin
  try
    Result := Self.fieldByName('COM_CNC_PEDIDO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodTitulo }
function TComunicacao.GetCodTitulo : Integer;
begin
  try
    Result := Self.fieldByName('COM_COD_TITULO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodTituloCNC }
function TComunicacao.GetCodTituloCNC : Integer;
begin
  try
    Result := Self.fieldByName('COM_CNC_TITULO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCNT }
function TComunicacao.GetCodigoCNT : Integer;
begin
  try
    Result := Self.fieldByName('CNT_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoCOM }
function TComunicacao.GetCodigoCOM : Integer;
begin
  try
    Result := Self.fieldByName('COM_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoFUN }
function TComunicacao.GetCodigoFUN : Integer;
begin
  try
    Result := Self.fieldByName('FUN_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoPRD }
function TComunicacao.GetCodigoPRD : Integer;
begin
  try
    Result := Self.fieldByName('PRD_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property CodigoTAR }
function TComunicacao.GetCodigoTAR : Integer;
begin
  try
    Result := Self.fieldByName('TAR_CODIGO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property ContatoCNC }
function TComunicacao.GetContatoCNC : Integer;
begin
  try
    Result := Self.fieldByName('COM_CNC_CONTATO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property DataAlterado }
function TComunicacao.GetDataAlterado : TDateTime;
begin
  try
    Result := Self.fieldByName('COM_DT_ALTERADO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataCadastro }
function TComunicacao.GetDataCadastro : Tdatetime;
begin
  try
    Result := Self.fieldByName('COM_DT_CADASTRO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property DataComunicacao }
function TComunicacao.GetDataComunicacao : Tdatetime;
begin
  try
    Result := Self.fieldByName('COM_DT_COMUNICACAO').asDateTime;
  except
    Result := 0;
  end;
end;

{ Read method for property Detalhe }
function TComunicacao.GetDetalhe : String;
begin
  try
    Result := Self.fieldByName('COM_DETALHE').asString;
  except
    result:= '';
  end;
end;

{ Read method for property MaquinaCOM }
function TComunicacao.GetMaquinaCOM : Integer;
begin
  try
    Result := Self.fieldByName('COM_MAQUINA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property MeioDeContato }
function TComunicacao.GetMeioDeContato : Integer;
begin
  try
    Result := Self.fieldByName('COM_MEIO_DE_CONTATO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property MeioDeContatoDetalhe }
function TComunicacao.GetMeioDeContatoDetalhe : String;
begin
  try
    //Bina do Telefone, EMail utilizado, etc..
    Result := Self.fieldByName('COM_MEIO_DETALHE').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Motivo }
function TComunicacao.GetMotivo : Integer;
begin
  try
    Result := Self.fieldByName('COM_MOTIVO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property NivelAcerto }
function TComunicacao.GetNivelAcerto : Integer;
begin
  try
    Result := Self.fieldByName('COM_NIVEL_ACERTO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Observacao }
function TComunicacao.GetObservacao : String;
begin
  try
    Result := Self.fieldByName('COM_OBSERVACAO').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Pergunta1 }
function TComunicacao.GetPergunta1 : Integer;
begin
  try
    Result := Self.fieldByName('COM_PERGUNTA_1').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Pergunta2 }
function TComunicacao.GetPergunta2 : Integer;
begin
  try
    Result := Self.fieldByName('COM_PERGUNTA_2').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Pergunta3 }
function TComunicacao.GetPergunta3 : Integer;
begin
  try
    Result := Self.fieldByName('COM_PERGUNTA_3').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Resposta1 }
function TComunicacao.GetResposta1 : String;
begin
  try
    Result := Self.fieldByName('COM_RESPOSTA_1').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Resposta2 }
function TComunicacao.GetResposta2 : String;
begin
  try
    Result := Self.fieldByName('COM_RESPOSTA_2').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Resposta3 }
function TComunicacao.GetResposta3 : String;
begin
  try
    Result := Self.fieldByName('COM_RESPOSTA_3').asString;
  except
    result:= '';
  end;
end;

{ Read method for property Situacao }
function TComunicacao.GetSituacao : Integer;
begin
  try
    Result := Self.fieldByName('COM_SITUACAO').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property TarefaCNC }
function TComunicacao.GetTarefaCNC : Integer;
begin
  try
    Result := Self.fieldByName('COM_CNC_TAREFA').asInteger;
  except
    result:= 0;
  end;
end;

{ Read method for property Tipo }
function TComunicacao.GetTipo : Integer;
begin
  try
    Result := Self.fieldByName('COM_TIPO').asInteger;
  except
    result:= 0;
  end;
end;

function TComunicacao.AlterarAuto:Boolean;
var
  CdCNC, CdCOM, CdCodEntradaCNC, CdCodEntrada: integer;
  sPergunta1, sPergunta2, sPergunta3: string;
begin
  Result := False;

  CdCNC := CodigoCNC;
  CdCOM := CodigoCOM;
  CdCodEntradaCNC := StrToInt(ECodEntradaCNC.Text);
  CdCodEntrada    := StrToInt(ECodEntrada.Text);

  try
    sPergunta1 := IntToStr(EPergunta1.KeyValue);
  except
    sPergunta1 := '0';
  end;
  try
    sPergunta2 := IntToStr(EPergunta2.KeyValue);
  except
    sPergunta2 := '0';
  end;
  try
    sPergunta3 := IntToStr(EPergunta3.KeyValue);
  except
    sPergunta3 := '0';
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'UPDATE COMUNICACAO SET '+
      ' COM_DT_ALTERADO="'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ',USU_CODIGO='+IntToStr(CConfiguracao.CodigoUSU)+
      ',COM_MAQUINA='+IntToStr(Maquina)+
      ',COM_DT_COMUNICACAO="'+MesDiaHora(EDataComunicacao.Text)+'" '+
      ',FUN_CODIGO='+IntToStr(ECodigoFUN.KeyValue)+
      ',COM_CNC_ENTRADA='+IntToStr(CdCodEntradaCNC)+
      ',COM_COD_ENTRADA='+IntToStr(CdCodEntrada)+
      ',COM_CNC_CONTATO='+EContatoCNC.Text+
      ',CNT_CODIGO='+ECodigoCNT.Text+
      ',COM_CNC_PEDIDO='+ECodPedidoCNC.Text+
      ',COM_COD_PEDIDO='+ECodPedido.Text+
      ',COM_CNC_TITULO='+ECodTituloCNC.Text+
      ',COM_COD_TITULO='+ECodTitulo.Text+
      ',PRD_CODIGO='+ECodigoPRD.Text+
      ',COM_CNC_ORIGEM='+ECodOrigemCNC.Text+
      ',COM_COD_ORIGEM='+ECodOrigem.Text+
      ',COM_TIPO='+IntToStr(ETipo.ItemIndex)+
      ',COM_MEIO_DE_CONTATO='+IntToStr(EMeioDeContato.KeyValue)+
      ',COM_MEIO_DETALHE="'+EMeioDeContatoDetalhe.Text+'" '+
      ',COM_MOTIVO='+IntToStr(EMotivo.KeyValue)+
      ',COM_PERGUNTA_1='+IntToStr(EPergunta1.KeyValue)+
      ',COM_RESPOSTA_1="'+EResposta1.Text+'" '+
      ',COM_PERGUNTA_2='+IntToStr(EPergunta2.KeyValue)+
      ',COM_RESPOSTA_2="'+EResposta2.Text+'" '+
      ',COM_PERGUNTA_3='+IntToStr(EPergunta3.KeyValue)+
      ',COM_RESPOSTA_3="'+EResposta3.Text+'" '+
      ',COM_CNC_TAREFA='+ETarefaCNC.Text+
      ',TAR_CODIGO='+ECodigoTAR.Text+
      ',COM_DETALHE="'+EDetalhe.Text+'" '+
      ',COM_NIVEL_ACERTO='+IntToStr(ENivelAcerto.ItemIndex)+
      ',COM_SITUACAO='+IntToStr(ESituacao.ItemIndex)+
      ',COM_OBSERVACAO="'+EObservacao.Text+'" '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND COM_CODIGO='+IntToStr(CdCOM));

    GeraLog(8080,CdCodEntradaCNC,CdCodEntrada,'ALT COM:'+PreencheZero(2,CdCNC)+'-'+IntToStr(CdCOM));
    Result:=True;
  except
    ShowMessage('Não foi possível alterar o registro corrente.');
  end;
end;

procedure TComunicacao.AtualizaControles(Habilitar:Boolean);
begin
  Try
    EDbgrid.Enabled        := not Habilitar;
  except
  end;
  Try
    EDataComunicacao.Enabled := Habilitar;
  Except
  End;
  Try
    ECodigoFUN.Enabled     := Habilitar;
  Except
  End;
  Try
    ECodEntrada.Enabled    := Habilitar;
  Except
  End;
  Try
    ECodigoCNT.Enabled     := Habilitar;
  Except
  End;
  Try
    ECodPedido.Enabled     := Habilitar;
  Except
  End;
  Try
    ECodTitulo.Enabled     := Habilitar;
  Except
  End;
  Try
    ECodigoPRD.Enabled     := Habilitar;
  Except
  End;
  Try
    ECodOrigem.Enabled     := Habilitar;
  Except
  End;
  Try
    ETipo.Enabled          := Habilitar;
  Except
  End;
  Try
    EMeioDeContato.Enabled := Habilitar;
  Except
  End;
  Try
    EMeioDeContatoDetalhe.Enabled := Habilitar;
  Except
  End;
  Try
    EMotivo.Enabled        := Habilitar;
  Except
  End;
  Try
    EPergunta1.Enabled     := Habilitar;
  Except
  End;
  Try
    EResposta1.Enabled     := Habilitar;
  Except
  End;
  Try
    EPergunta2.Enabled     := Habilitar;
  Except
  End;
  Try
    EResposta2.Enabled     := Habilitar;
  Except
  End;
  Try
    EPergunta3.Enabled     := Habilitar;
  Except
  End;
  Try
    EResposta3.Enabled     := Habilitar;
  Except
  End;
  Try
    ECodigoTAR.Enabled     := Habilitar;
  Except
  End;
  Try
    EDetalhe.Enabled       := Habilitar;
  Except
  End;
  Try
    ENivelAcerto.Enabled   := Habilitar;
  Except
  End;
  Try
    EObservacao.Enabled    := Habilitar;
  Except
  End;
end;

procedure TComunicacao.CancelaEdicao;
begin
  Estado:=0;
  AtualizaControles(False);
  if not isEmpty then
    CarregaDados
  else
    LimpaCampos;
end;

procedure TComunicacao.CarregaDados;
begin
  Try
    ECodigoCOM.Text       := IntToStr(CodigoCOM);
  Except
  End;
  Try
    if DataCadastro > 0 then
      EDataCadastro.Text := FormatDateTime('DD/MM/YYYY HH:MM:SS',DataCadastro)
    else
      EDataCadastro.Clear;
  Except
  End;
  Try
    if DataAlterado > 0 then
      EDataAlterado.Text := FormatDateTime('DD/MM/YYYY HH:MM:SS',DataAlterado)
    else
      EDataAlterado.Clear;
  Except
  End;
  Try
    if DataComunicacao > 0 then
      EDataComunicacao.Text := FormatDateTime('DD/MM/YYYY HH:MM',DataComunicacao)
    else
      EDataComunicacao.Clear;
  Except
  End;
  Try
    ECodigoFUN.KeyValue    := CodigoFUN;
  Except
  End;
  Try
    ECodEntradaCNC.Text    := IntToStr(CodEntradaCNC);
  Except
  End;
  Try
    ECodEntrada.Text       := IntToStr(CodEntrada);
  Except
  End;
  Try
    EContatoCNC.Text       := IntToStr(ContatoCNC);
  Except
  End;
  Try
    ECodigoCNT.Text        := IntToStr(CodigoCNT);
  Except
  End;
  Try
    ECodPedidoCNC.Text     := IntToStr(CodPedidoCNC);
  Except
  End;
  Try
    ECodPedido.Text        := IntToStr(CodPedido);
  Except
  End;
  Try
    ECodTituloCNC.Text     := IntToStr(CodTituloCNC);
  Except
  End;
  Try
    ECodTitulo.Text        := IntToStr(CodTitulo);
  Except
  End;
  Try
    ECodigoPRD.Text        := IntToStr(CodigoPRD);
  Except
  End;
  Try
    ECodOrigemCNC.Text     := IntToStr(CodOrigemCNC);
  Except
  End;
  Try
    ECodOrigem.Text        := IntToStr(CodOrigem);
  Except
  End;
  Try
    ETipo.ItemIndex        := Tipo;
  Except
  End;
  Try
    EMeioDeContato.KeyValue := MeioDeContato;
  Except
  End;
  Try
    EMeioDeContatoDetalhe.Text := MeioDeContatoDetalhe;
  Except
  End;
  Try
    EMotivo.KeyValue       := Motivo;
  Except
  End;
  Try
    EPergunta1.KeyValue    := Pergunta1;
  Except
  End;
  Try
    EResposta1.Text        := Resposta1;
  Except
  End;
  Try
    EPergunta2.KeyValue    := Pergunta2;
  Except
  End;
  Try
    EResposta2.Text        := Resposta2;
  Except
  End;
  Try
    EPergunta3.KeyValue    := Pergunta3;
  Except
  End;
  Try
    EResposta3.Text        := Resposta3;
  Except
  End;
  Try
    ETarefaCNC.Text        := IntToStr(TarefaCNC);
  Except
  End;
  Try
    ECodigoTAR.Text        := IntToStr(CodigoTAR);
  Except
  End;
  Try
    EDetalhe.Text          := Detalhe;
  Except
  End;
  Try
    ENivelAcerto.ItemIndex := NivelAcerto;
  Except
  End;
  Try
    ESituacao.ItemIndex := Situacao;
  Except
  End;
  Try
    EObservacao.Text       := Observacao;
  Except
  End;
end;

constructor TComunicacao.Create(AOwner: TComponent);
begin
     { Call the Create method of the parent class }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables and      }
     { properties; also, it creates objects for properties of       }
     { standard Delphi object types (e.g., TFont, TTimer,           }
     { TPicture) and for any variables marked as objects.           }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     Tabela := 'COMUNICACAO';

     { Code to perform other tasks when the component is created }

end;

function TComunicacao.Deletar(CdCNC,CdCOM:Integer):Boolean;
begin
  Result := False;
  If not(localizarCod(CdCOM,CdCNC)) Then
    ShowMessage('Não foi possível deletar registro corrente pois o registro não existe!')
  Else
  Begin
    try
      if Delete then
      Begin
        Result := True;
        if TQuery(Self).IsEmpty then
          LimpaCampos;
      end;
    Except
      ShowMessage('Não foi possível deletar registro corrente!');
    End;
  End;
end;

destructor TComunicacao.Destroy;
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

function TComunicacao.FinalizaEdicao:Boolean;
var
  mensagem:String;
begin
  Result:=False;
  mensagem:='';
  if not VerificaInteiroBranco(EContatoCNC.Text) then
    EContatoCNC.Text := '0';
  if not VerificaInteiroBranco(ECodigoCNT.Text) then
    ECodigoCNT.Text := '0';
  if not VerificaInteiroBranco(ECodPedidoCNC.Text) then
    ECodPedidoCNC.Text := '0';
  if not VerificaInteiroBranco(ECodPedido.Text) then
    ECodPedido.Text := '0';
  if not VerificaInteiroBranco(ECodTituloCNC.Text) then
    ECodTituloCNC.Text := '0';
  if not VerificaInteiroBranco(ECodTitulo.Text) then
    ECodTitulo.Text := '0';
  if not VerificaInteiroBranco(ECodigoPRD.Text) then
    ECodigoPRD.Text := '0';
  if not VerificaInteiroBranco(ECodOrigemCNC.Text) then
    ECodOrigemCNC.Text := '0';
  if not VerificaInteiroBranco(ECodOrigem.Text) then
    ECodOrigem.Text := '0';
  if not VerificaInteiroBranco(ETarefaCNC.Text) then
    ETarefaCNC.Text := '0';
  if not VerificaInteiroBranco(ECodigoTAR.Text) then
    ECodigoTAR.Text := '0';


  if not VerificaInteiroBranco(ECodEntrada.Text) then
    mensagem := mensagem + 'Código de Entrada inválido!'+#13;
  if ECodigoFUN.Text = '' then
    mensagem := mensagem + 'Responsável inválido!'+#13;
  if not VerificaDataBranco(EDataComunicacao.Text) then
    mensagem := mensagem + 'Data da Comunicação inválida!'+#13;
  if ETipo.ItemIndex < 0 then
    mensagem := mensagem + 'Tipo inválido!'+#13;
  if EMeioDeContato.Text = '' then
    mensagem := mensagem + 'Meio de Contato inválido!'+#13;
  if EMotivo.Text = '' then
    mensagem := mensagem + 'Motivo inválido!'+#13;
  if ENivelAcerto.ItemIndex < 0 then
    mensagem := mensagem + 'Nível do Acerto inválido!'+#13;

  If mensagem <>'' Then
    ShowMessage(mensagem)
  else
  Begin
    If Estado=1 then
    Begin
      if Inserirauto then
      Begin
        Estado:=0;
        AtualizaControles(False);
        Result:=True;
      end;
    End
    Else If Estado=2 then
    Begin
      if Alterarauto then
      Begin
        Estado:=0;
        AtualizaControles(False);
        Result:=True;
      end;
    End;
  end;
end;

function TComunicacao.InserirAuto:Boolean;
var
  CdCNC, CdCOM, CdCodEntradaCNC, CdCodEntrada: integer;
  sPergunta1, sPergunta2, sPergunta3: string;
begin
  Result := False;

  CdCNC := CConfiguracao.CodigoCNC;
  CdCOM := sCodigo;
  CdCodEntradaCNC := StrToInt(ECodEntradaCNC.Text);
  CdCodEntrada    := StrToInt(ECodEntrada.Text);

  try
    sPergunta1 := IntToStr(EPergunta1.KeyValue);
  except
    sPergunta1 := '0';
  end;
  try
    sPergunta2 := IntToStr(EPergunta2.KeyValue);
  except
    sPergunta2 := '0';
  end;
  try
    sPergunta3 := IntToStr(EPergunta3.KeyValue);
  except
    sPergunta3 := '0';
  end;
  try
    ExecutaSQL(CConfiguracao.QueryComandos,'INSERT INTO COMUNICACAO '+
      '( CNC_ORIGEM,CNC_CODIGO,COM_CODIGO,COM_DT_CADASTRO,USU_CODIGO '+
      ',COM_MAQUINA,COM_DT_COMUNICACAO,FUN_CODIGO '+
      ',COM_CNC_ENTRADA,COM_COD_ENTRADA,COM_CNC_CONTATO,CNT_CODIGO,COM_CNC_PEDIDO '+
      ',COM_COD_PEDIDO,COM_CNC_TITULO,COM_COD_TITULO,PRD_CODIGO,COM_CNC_ORIGEM '+
      ',COM_COD_ORIGEM,COM_TIPO,COM_MEIO_DE_CONTATO,COM_MEIO_DETALHE,COM_MOTIVO '+
      ',COM_PERGUNTA_1,COM_RESPOSTA_1,COM_PERGUNTA_2,COM_RESPOSTA_2,COM_PERGUNTA_3,COM_RESPOSTA_3 '+
      ',COM_CNC_TAREFA,TAR_CODIGO,COM_DETALHE,COM_NIVEL_ACERTO,COM_SITUACAO,COM_OBSERVACAO) VALUES '+
      '( '+IntToStr(CentroDeCusto)+
      ', '+IntToStr(CConfiguracao.CodigoCNC)+
      ', '+IntToStr(CdCOM)+
      ',"'+MesDiaHora(CConfiguracao.DataHora)+'" '+
      ', '+IntToStr(CConfiguracao.CodigoUSU)+
      ', '+IntToStr(Maquina)+
      ',"'+MesDiaHora(EDataComunicacao.Text)+'" '+
      ', '+IntToStr(ECodigoFUN.KeyValue)+
      ', '+IntToStr(CdCodEntradaCNC)+
      ', '+IntToStr(CdCodEntrada)+
      ', '+EContatoCNC.Text+
      ', '+ECodigoCNT.Text+
      ', '+ECodPedidoCNC.Text+
      ', '+ECodPedido.Text+
      ', '+ECodTituloCNC.Text+
      ', '+ECodTitulo.Text+
      ', '+ECodigoPRD.Text+
      ', '+ECodOrigemCNC.Text+
      ', '+ECodOrigem.Text+
      ', '+IntToStr(ETipo.ItemIndex)+
      ', '+IntToStr(EMeioDeContato.KeyValue)+
      ',"'+EMeioDeContatoDetalhe.Text+'" '+
      ', '+IntToStr(EMotivo.KeyValue)+
      ', '+IntToStr(EPergunta1.KeyValue)+
      ',"'+EResposta1.Text+'" '+
      ', '+IntToStr(EPergunta2.KeyValue)+
      ',"'+EResposta2.Text+'" '+
      ', '+IntToStr(EPergunta3.KeyValue)+
      ',"'+EResposta3.Text+'" '+
      ', '+ETarefaCNC.Text+
      ', '+ECodigoTAR.Text+
      ',"'+EDetalhe.Text+'" '+
      ', '+IntToStr(ENivelAcerto.ItemIndex)+
      ', '+IntToStr(ESituacao.ItemIndex)+
      ',"'+EObservacao.Text+'") ');

    GeraLog(8080,CdCodEntradaCNC,CdCodEntrada,'INS COM:'+PreencheZero(2,CdCNC)+'-'+IntToStr(CdCOM));
    Result:=True;
  except
    ShowMessage('Não foi possível alterar o registro corrente.');
  end;
end;

procedure TComunicacao.LimpaCampos;
begin
  Try
    if Estado <> 1 then
      ECodigoCOM.Clear;
  except
  end;
  try
    if Estado <> 1 then
      EDataCadastro.Clear
    else
      EDataCadastro.Text := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
  try
  except
    EDataAlterado.Clear;
  end;
  try
    if Estado <> 1 then
      EDataComunicacao.Clear
    else
      EDataComunicacao.Text := DateTimeToStr(CConfiguracao.DataHora);
  except
  end;
  Try
    ECodigoFUN.KeyValue := 0;
  Except
  End;
  Try
    ECodEntradaCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    ECodEntrada.Clear;
  Except
  End;
  Try
    EContatoCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    ECodigoCNT.Clear;
  Except
  End;
  Try
    ECodPedidoCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado <> 1 then
      ECodPedido.Clear
    else
      ECodPedido.Text := '0';
  Except
  End;
  Try
    ECodTituloCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado <> 1 then
      ECodTitulo.Clear
    else
      ECodTitulo.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoPRD.Clear
    else
      ECodigoPRD.Text := '0';
  Except
  End;
  Try
    ECodOrigemCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado <> 1 then
      ECodOrigem.Clear
    else
      ECodOrigem.Text := '0';
  Except
  End;
  Try
    if Estado <> 1 then
      ETipo.ItemIndex := -1
    else
      ETipo.ItemIndex := 0;
  Except
  End;
  Try
    if Estado <> 1 then
      EMeioDeContato.KeyValue := 0
    else
      EMeioDeContato.KeyValue := 4540; //Telefone
  Except
  End;
  Try
    EMeioDeContatoDetalhe.Clear;
  Except
  End;
  Try
    EMotivo.KeyValue := 0;
  Except
  End;
  Try
    EPergunta1.KeyValue := 0;
  Except
  End;
  Try
    EResposta1.Clear;
  Except
  End;
  Try
    EPergunta2.KeyValue := 0;
  Except
  End;
  Try
    EResposta2.Clear;
  Except
  End;
  Try
    EPergunta3.KeyValue := 0;
  Except
  End;
  Try
    EResposta3.Clear;
  Except
  End;
  Try
    ETarefaCNC.Text := IntToStr(CConfiguracao.CodigoCNC);
  Except
  End;
  Try
    if Estado <> 1 then
      ECodigoTAR.Clear
    else
      ECodigoTAR.Text := '0';
  Except
  End;
  Try
    EDetalhe.Clear;
  Except
  End;
  Try
    if Estado <> 1 then
      ENivelAcerto.ItemIndex := -1
    else
      ENivelAcerto.ItemIndex := 0
  Except
  End;
  try
    if Estado <> 1 then
      ESituacao.ItemIndex := -1
    else
      ESituacao.ItemIndex := 0;
  except
  end;
  Try
    EObservacao.Clear;
  Except
  End;
end;

{ Localiza um cliente }
function TComunicacao.LocalizarCod(CdCOM,CdCNC:Integer):Boolean;
begin
  with CConfiguracao.QueryComandos do
  begin
    close;
    sql.Text:='SELECT * FROM COMUNICACAO '+
      ' WHERE CNC_CODIGO='+IntToStr(CdCNC)+
      ' AND COM_CODIGO='+IntToStr(CdCOM);
    open;
    Result := (not IsEmpty);
  end;
end;

procedure TComunicacao.PreparaAlteracao;
begin
  Estado:=2;
  AtualizaControles(True);
  try
    EDataAlterado.Text := formatDateTime('dd/mm/yyyy hh:mm',CConfiguracao.DataHora);
  except
  end;
end;

procedure TComunicacao.PreparaInsercao;
begin
  ProximoCodigo('COM_CODIGO');
  Estado:=1;
  AtualizaControles(True);
  LimpaCampos;
end;

function TComunicacao.deletarauto:Boolean;
begin
  Result:=False;
  try
    if Delete then
    Begin
      Result:=True;
      if TQuery(Self).IsEmpty then
        LimpaCampos;
    end;
  Except
    ShowMessage('Não foi possível deletar registro corrente!');
  End;
end;


end.
