{ **uspCriptografia.pas
  Esta unit define funções utilitárias para criptografia de
  dados. }
unit Manager.Core.Utils;

interface

uses
  Classes, Windows;

{ **setaChave@string
  Define o valor da variável sChave. }
procedure setaChave(strChave: string);
{ **setaChave2@string
  Define o valor da variável sChave2. }
procedure setaChave2(strChave: string);
{ **CriptografaPalavra@string
  Criptografa um string.

  Usa a chave sChave2 para gerar uma chave MD5 que por sua vez
  será utilizada em conjunto com um algoritmo RDL para
  criptografar o texto de entrada. }
function CriptografaPalavra(psPalavra: string): string;
{ **DecriptografaPalavra@string
  Decriptografa um string previamente criptografado com a
  função CriptografaPalavra. }
function DecriptografaPalavra(psPalavra: string): string;

implementation

uses
  SysUtils, LbString, LbCipher;

type
  ArrayOfBytes = array of byte;

var
  { **sChave
    Armazena uma das chaves de criptografia utilizadas pelas
    classes SP4, na forma de um string contendo os caracteres
    ASCII da chave.

    Esta variável é definida com um valor padrão através da seção
    INITIALIZATION da unit uspCriptografia. }
  sChave: String;
  { **sChave2
    Armazena uma das chaves de criptografia utilizadas pelas
    classes SP4, na forma de um string contendo uma sequência de
    números.

    Esta variável é definida com um valor padrão através da seção
    INITIALIZATION da unit uspCriptografia. }
  sChave2: String;

  { ** Caso a string seja menor que o tamanho desejado, adiciona espaços
    no final da string para que ela fique com o tamanho desejado,
    e a retorna.

    @param strIni String inicial
    @param size   Tamanho desejado para a string }
function CompletaString(strIni: String; Size: byte): String;
begin
  while Length(strIni) < Size do
    strIni := strIni + ' ';
  result := strIni;
end;

{ ** Define o tamanho da string desembaralhada como 20, e troca os
  caracteres de 4 em 4, colocando-os de trás pra frente. }
function Embaralha(strDesembaralhada: String): String;
var
  strEmbaralhada, strAux: String;
  i: integer;
begin
  strEmbaralhada := String.Empty;
  strAux := CompletaString(strDesembaralhada, 20);
  i := 1;
  while i <= 20 do
  begin
    strEmbaralhada := strEmbaralhada + Copy(strAux, i + 3, 1);
    strEmbaralhada := strEmbaralhada + Copy(strAux, i + 2, 1);
    strEmbaralhada := strEmbaralhada + Copy(strAux, i + 1, 1);
    strEmbaralhada := strEmbaralhada + Copy(strAux, i, 1);
    i := i + 4;
  end;
  result := strEmbaralhada;
end;

{ ** Soma cada caracterda da [strEntrada], que deve ter o tamanho 20, com o
  respectivo caracter da chave. }
function Soma(strEntrada: String): String;
var
  strSomada, strAux, strChave: String;
  i: integer;
begin
  strAux := strEntrada;
  strChave := sChave;
  i := 1;
  while i <= 20 do
  begin
    strSomada := strSomada + Chr(Ord(strAux[i]) + Ord(strChave[i]));
    i := i + 1;
  end;
  result := strSomada;
end;

{ ** Realiza o processo inverso da função 'soma' (ver!). }
function Subtrai(strEntrada: String): String;
var
  strSubtraida, strAux, strChave: String;
  i: integer;
begin
  result := String.Empty;
  if (trim(strEntrada) <> String.Empty) then
  begin
    strSubtraida := String.Empty;
    strAux := strEntrada;
    strChave := sChave;
    i := 1;
    while i <= 20 do
    begin
      strSubtraida := strSubtraida + Chr(Ord(strAux[i]) - Ord(strChave[i]));
      i := i + 1;
    end;
    Exit(strSubtraida);
  end;
  Exit(String.Empty);
end;

{ ** Define a variável [sChave], já com o tamanho certinho (20 chars). }
procedure setaChave(strChave: String);
begin
  sChave := CompletaString(strChave, 20);
end;

function encripta(strDescript: String): String;
var
  strCript: String;
begin
  strCript := Embaralha(strDescript);
  strCript := Soma(strCript);
  result := strCript;
end;

function desencripta(strCript: String): String;
var
  strDescript: string;
begin
  strDescript := Subtrai(strCript);
  strDescript := Embaralha(strDescript);
  result := trim(strDescript);
end;

{ ** Tranforma uma string que contenha caracteres representando um número
  em hexadecimal em inteiro. Se a quantidade de caracteres for maior que
  8 então a função retorna -1. }
function hexaParaInteiro(sHexa: string): integer;
var
  nPotencia, nCont, nCaracter: integer;

begin
  nPotencia := 1;
  sHexa := ansiUpperCase(sHexa);
  result := 0;
  if Length(sHexa) <= 8 then
  begin
    for nCont := Length(sHexa) downto 1 do
    begin
      nCaracter := Ord(sHexa[nCont]) - 48;
      if nCaracter > 16 then
        nCaracter := nCaracter - 7;
      result := result + nCaracter * nPotencia;
      nPotencia := nPotencia * 16;
    end;
  end
  else
    result := -1;
end;

{ **encriptadoParaHexa@string
  Transforma um sequência de caracteres ASCII encriptados na
  sua representação em hexadecimal na forma string. }
function encriptadoParaHexa(sEncriptado: string): string;
var
  nCont: integer;
begin
  result := '';
  for nCont := 1 to Length(sEncriptado) do
    result := result + intToHex(Ord(sEncriptado[nCont]), 2);
end;

{ **hexaParaEncriptado@string
  Transforma a representação hexadecimal nos seus respectivos
  caracteres ASCII. }
function hexaParaEncriptado(sHexa: string): string;
var
  nCont: integer;
begin
  result := '';
  for nCont := 1 to (Length(sHexa) div 2) do
    result := result +
      Chr(hexaParaInteiro(sHexa[nCont * 2 - 1] + sHexa[nCont * 2]));
end;

function anterior(numero, limite: integer): integer;
begin
  if numero = 1 then
    result := limite
  else
    result := numero - 1;
end;

{ **codificaSenha@string@boolean
  Codifica uma string usando sempre caractes ASCII que possam
  ser usados como senha de usuário no banco de dados. Se o
  parâmetro 'bConverteNumeros' for 'true', os números também
  são convertidos.

  O valor default é 'false'. }
function codificaSenha(sSenha: string; bConverteNumeros: boolean): string;
var
  palavra: array [1 .. 100] of integer;
  limite: integer;
  senha: string;
  constante: longint;
  b: integer;
begin
  senha := sSenha;
  constante := 0;

  for b := 1 to Length(senha) do
    constante := constante + (Ord(senha[b]) mod 52);
  constante := constante mod 52;

  if Length(senha) > 100 then
    limite := 100
  else
    limite := Length(senha);

  for b := 1 to limite do
  begin
    // if not (senha[b] in ['0'..'9']) then
    if not(senha[b] in ['0' .. '9']) or bConverteNumeros then
      palavra[b] := (Ord(senha[b]) + Ord(senha[anterior(b, limite)]) + b +
        constante) mod 52
    else
      palavra[b] := Ord(senha[b]) - 65;

    if palavra[b] > 25 then
      senha[b] := Chr(palavra[b] - 26 + 97)
    else
      senha[b] := Chr(palavra[b] + 65);
  end;
  result := ansilowercase(senha);
end;

procedure setaChave2(strChave: string);
begin
  sChave2 := strChave;
end;

function CriptografaPalavra(psPalavra: string): string;
var
  resp: AnsiString;
  chave: TKey128;
begin
  FillChar(chave, SizeOf(chave), 0);
  GenerateMD5Key(chave, sChave2);
  RDLEncryptString(psPalavra, resp, chave, SizeOf(chave), true);
  result := resp;
end;

function DecriptografaPalavra(psPalavra: string): string;
var
  resp: AnsiString;
  chave: TKey128;
begin
  if not (trim(psPalavra) = String.Empty) then
  begin
    FillChar(chave, SizeOf(chave), 0);
    GenerateMD5Key(chave, sChave2);
    RDLEncryptString(psPalavra, resp, chave, SizeOf(chave), false);
    Exit(resp);
  end;
  Exit(String.Empty);
end;

initialization

setaChave('49ytvlfjewrfbqt67trg');
setaChave2('070823303253122433363957');

end.
