unit uspmFuncoes;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Data.DB,
  Vcl.DBCtrls, Vcl.Mask, JvDBCombobox, System.StrUtils, Winapi.ShellAPI;

procedure AbrirFormulario(poOwner: TComponent; poClasse: TFormClass; var poFormulario);

procedure ValidarCampoObrigatorioSalvamento(poFormulario: TForm);

procedure PegarListaDeDiretorios(const psDiretorio: string; var psListaDiretorios: TStringList);

procedure PegarListaDeArquivos(const psDiretorio: string; var psListaArquivos: TStringList);

procedure LocalizarArquivo(psDiretorio, psPesquisa: string; var psPathArquivo: string);

procedure DeletarArquivo(const psPathArquivo: string);

procedure DeletarDiretorio(phHandle: THandle; const psPath: string; pbConfirm: boolean);

function PegarVersaoAplicacao: string;

implementation

uses
  uspmConstantes;

procedure AbrirFormulario(poOwner: TComponent; poClasse: TFormClass; var poFormulario);
begin
  try
    try
      if TForm(poFormulario) = nil then
      begin
        Application.CreateForm(poClasse, poFormulario);
      end;

//      TForm(poFormulario). Owner := poOwner;
      TForm(poFormulario).Show;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure PegarListaDeDiretorios(const psDiretorio: string; var psListaDiretorios: TStringList);
var
  SearchRec: TSearchRec;
begin
  psListaDiretorios.Clear;

  FindFirst(psDiretorio + '*.*', faDirectory, SearchRec);

  while FindNext(SearchRec) = 0 do
  begin
    if SearchRec.Name <> '..' then
    begin
      if DirectoryExists(psDiretorio + '\' + SearchRec.Name) then
      begin
        psListaDiretorios.Add(' ' + SearchRec.Name);
      end;
    end;
  end;
end;

procedure PegarListaDeArquivos(const psDiretorio: string; var psListaArquivos: TStringList);
var
  i: Integer;
  SearchRec: TSearchRec;
begin
  psListaArquivos.Clear;

  i := FindFirst(psDiretorio, 0, SearchRec);
  while i = 0 do
  begin
    psListaArquivos.Add(SearchRec.Name);
    i := FindNext(SearchRec);
  end;
end;

procedure ValidarCampoObrigatorioSalvamento(poFormulario: TForm);
var
  oComponente: TComponent;
  i: Integer;
  sCamposObrigatorios: TStringList;
begin
  try
    sCamposObrigatorios := TStringList.Create;
    try
      for i := 0 to poFormulario.ComponentCount - 1 do
      begin
        oComponente := poFormulario.Components[i];

        case AnsiIndexStr(UpperCase(oComponente.ClassName), ['TDBEDIT', 'TJVDBCOMBOBOX', 'TDBLOOKUPCOMBOBOX']) of
          0:
            begin
              if TDBEdit(oComponente).Field.Required then
              begin
                if Trim(TDBEdit(oComponente).Text) = sSTRING_INDEFINIDO then
                begin
                  sCamposObrigatorios.Add(TDBEdit(oComponente).Field.DisplayLabel);
                end;
              end;
            end;
          1:
            begin
              if TJvDBComboBox(oComponente).Field.Required then
              begin
                if TJvDBComboBox(oComponente).ItemIndex = -1 then
                begin
                  sCamposObrigatorios.Add(TJvDBComboBox(oComponente).Field.DisplayLabel);
                end;
              end;
            end;
          2:
            begin
              if TDBLookupComboBox(oComponente).Field.Required then
              begin
                if TDBLookupComboBox(oComponente).Text = sSTRING_INDEFINIDO then
                begin
                  sCamposObrigatorios.Add(TDBLookupComboBox(oComponente).Field.DisplayLabel);
                end;
              end;
            end;
        else


        end;
      end;

      if (Trim(sCamposObrigatorios.Text) <> sSTRING_INDEFINIDO) then
      begin
        raise Exception.Create('Os seguintes campos s�o obrigat�rios:' + #13 + sCamposObrigatorios.Text);
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(sCamposObrigatorios);
  end;
end;

procedure LocalizarArquivo(psDiretorio, psPesquisa: string; var psPathArquivo: string);
var
  SearchRec: TSearchRec;
  i: integer;
begin
  i := FindFirst(psDiretorio + '\*.*', faAnyFile or faArchive or faDirectory, SearchRec);

  while i = 0 do
  begin
    if (Trim(SearchRec.Name) = '.') then
    begin
      i := FindNext(SearchRec);
      continue;
    end;

    if (Trim(SearchRec.Name) = '..') then
    begin
      i := FindNext(SearchRec);
      continue;
    end;

    if SearchRec.Attr and faDirectory > 0 then
    begin
      LocalizarArquivo(psDiretorio + '\' + SearchRec.Name, psPesquisa, psPathArquivo);
    end
    else if SameFileName(SearchRec.Name, psPesquisa) then
    begin
      psPathArquivo := psDiretorio + '\' + SearchRec.Name;
      Exit;
    end;

    i := FindNext(SearchRec);
  end;

  FindClose(SearchRec);
end;

procedure DeletarArquivo(const psPathArquivo: string);
var
  SearchRec: TSearchRec;
  nContador: integer;
begin

  if not DirectoryExists(ExtractFilePath(psPathArquivo)) then
  begin
    Exit;
  end;

  nContador := FindFirst(psPathArquivo, faAnyFile, SearchRec);

  while nContador = 0 do
  begin
    if (SearchRec.Attr <> faDirectory) then
    begin
      if FileGetAttr(ExtractFilePath(psPathArquivo) + SearchRec.Name) > 0 then
      begin
        FileSetAttr(ExtractFilePath(psPathArquivo) + SearchRec.Name, 0);
      end;

      DeleteFile(ExtractFilePath(psPathArquivo) + SearchRec.Name);
    end;
    nContador := FindNext(SearchRec);
  end;

  FindClose(SearchRec);
end;

procedure DeletarDiretorio(phHandle: THandle; const psPath: string; pbConfirm: boolean);
var
  OpStruc: TSHFileOpStruct;
  FromBuffer, ToBuffer: array[0..128] of char;
begin
  if not DirectoryExists(psPath) then
  begin
    Exit;
  end;

  FillChar(OpStruc, Sizeof(OpStruc), 0);
  FillChar(FromBuffer, Sizeof(FromBuffer), 0);
  FillChar(ToBuffer, Sizeof(ToBuffer), 0);
  StrPCopy(FromBuffer, psPath);

  with OpStruc do
  begin
    Wnd := phHandle;
    wFunc := FO_DELETE;
    pFrom := @FromBuffer;
    pTo := @ToBuffer;

    if not pbConfirm then
    begin
      fFlags := FOF_NOCONFIRMATION;
    end;

    fAnyOperationsAborted := False;
    hNameMappings := nil;
  end;

  ShFileOperation(OpStruc);
end;

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

