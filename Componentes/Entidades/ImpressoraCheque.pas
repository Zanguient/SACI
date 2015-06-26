unit ImpressoraCheque;

interface
Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls;

// Função para abrir a porta de comunicação.
function Bematech_DP_IniciaPorta(Porta: string): integer; stdcall; far; external 'BemaDP32.dll';
// Função para fechar a porta de comunicação.
function Bematech_DP_FechaPorta: integer; stdcall; far; external 'BemaDP32.dll';
// Função para imprimir o cheque.
function Bematech_DP_ImprimeCheque(Banco: string; Valor: string; Favorecido: string; Cidade: string; Data: string; Mensagem: string): integer; stdcall; far; external 'BemaDP32.dll';
// Função para imprimir o cheque transferência.
function Bematech_DP_ImprimeChequeTransferencia(Banco: string; Valor: string; Agencia: string; Conta: string; Cidade: string; Data: string; Mensagem: string): integer; stdcall; far; external 'BemaDP32.dll';
// Função para imprimir a cópia do cheque.
function Bematech_DP_ImprimeCopiaCheque: integer; stdcall; far; external 'BemaDP32.dll';
// Função para travar o documento.
function Bematech_DP_TravaDocumento(Trava: integer): integer; stdcall; far; external 'BemaDP32.dll';
// Função para imprimir texto comum, sem formatação.
function Bematech_DP_ImprimeTexto(Texto: string; AvancaLinha: integer): integer; stdcall; far; external 'BemaDP32.dll';
// Função para imprimir texto formatado: itálico, expandido, negrito.
function Bematech_DP_FormataTexto (Texto: string; Letra: string; Italico: integer; Expandido: integer; Negrito: integer): integer; stdcall; far; external 'BemaDP32.dll';
// Função para incluir o nome da cidade e do favorecido no arquivo bemadp32.ini.
function Bematech_DP_IncluiCidadeFavorecido (Cidade: string; Favorecido: string): integer; stdcall; far; external 'BemaDP32.dll';
// Função para incluir e alterar o banco e suas coordenadas no arquivo bemadp32.ini.
function Bematech_DP_IncluiAlteraBanco (Banco: string; Coordenadas: string): integer; stdcall; far; external 'BemaDP32.dll';
// Função para programar moeda na impressora com teclado
function Bematech_DP_ProgramaMoeda (MoedaSingular: string; MoedaPlural: string): integer; stdcall; far; external 'BemaDP32.dll';
// Função para programar favorecido na impressora com teclado.
function Bematech_DP_ProgramaFavorecido (CodiFavorecido: string; NomeFavorecido: string): integer; stdcall; far; external 'BemaDP32.dll';
// Função para desprogramar favorecido na impressora com teclado.
function Bematech_DP_DesprogramaFavorecido (CodiFavorecido: string): integer; stdcall; far; external 'BemaDP32.dll';
// Função para programa o banco e suas coordenadas na impressora com teclado.
function Bematech_DP_ProgramaBanco (Banco: string; Coordenadas: string): integer; stdcall; far; external 'BemaDP32.dll';
// Função para excluir um banco do arquivo bemadp.ini
function Bematech_DP_ExcluiBanco (Banco: string): integer; stdcall; far; external 'BemaDP32.dll';
// Função para enviar comandos para a impressora
function Bematech_DP_EnviaComando (Comando: string): integer;  stdcall; far; external 'BemaDP32.dll';
// Função para configurações especiais na impressora com teclado.
function Bematech_DP_ConfiguraImpressora (LinhaChancela: integer; Preenchimento: integer; Velocidade: integer; NumeroBits: integer; Paridade: integer; Centavos: integer): integer; stdcall; far; external 'BemaDP32.dll';
// Função para configurar o modelo da impressora.
function Bematech_DP_ConfiguraModeloImpressora (ModeloImpressora: integer): integer; stdcall; far; external 'BemaDP32.dll';
// Função para reinicializar a configuração de memória da impressora com teclado.
function Bematech_DP_ReinicializaConfiguracao: integer; stdcall; far; external 'BemaDP32.dll';
// Função para Cancelamento de Relatórios.
function Bematech_DP_CancelaRelatorio (Opcao: string): integer; stdcall; far; external 'BemaDP32.dll';

implementation

end.
