unit IDE.Utils;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Data.DB,
  Vcl.DBCtrls, Vcl.Mask, JvDBCombobox, System.StrUtils, Winapi.ShellAPI;

function PegarVersaoAplicacao: string;

implementation

function PegarVersaoAplicacao: string;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  sHandle: Dword;
  nLen: Longint;
  sData: Pchar;
  oBuffer: Pointer;
  sTamanho: Dword;
  sArquivo: Pchar;
  sNomeAplicacao: string;
begin
  sNomeAplicacao := Application.ExeName;
  sArquivo := StrAlloc(Length(sNomeAplicacao) + 1);
  StrPcopy(sArquivo, sNomeAplicacao);
  nLen := GetFileVersionInfoSize(sArquivo, sHandle);
  Result := '';
  if nLen > 0 then
  begin
    sData := StrAlloc(nLen + 1);
    if GetFileVersionInfo(sArquivo, sHandle, nLen, sData) then
    begin
      VerQueryValue(sData, '\', oBuffer, sTamanho);
      F := PFFI(oBuffer);
      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs), LoWord(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs), Loword(F^.dwFileVersionLs)]);
    end;
    StrDispose(sData);
  end;
  StrDispose(sArquivo);
end;

end.
