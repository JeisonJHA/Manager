unit AcaoExclusao;

interface

uses
  Forms, SysUtils, ShellAPI, FileCtrl, Acao, InstantPersistence, InstantTypes;

type
  TAcaoExclusaoArquivo = class;
  TAcaoExclusaoDiretorio = class;

  TAcaoExclusaoArquivo = class(TAcaoExecutar)
  {IOMETADATA stored; }
  protected
    procedure DeleteUniqueFile(const APath: string);
    procedure DeleteDirectory(const APath: string; ARemoveDir: boolean = True);
    procedure InternalExecute; override;
    procedure InternalAfterExecute; override;
  end;

  TAcaoExclusaoDiretorio = class(TAcaoExclusaoArquivo)
  {IOMETADATA stored; }
  end;

implementation

uses
  InstantMetadata, Manager.Core.IDE.Constants, Manager.Core.IDE;

{ TAcaoExclusaoArquivo }

type
  TTipoExclusao = (teFile, teAllFiles, teDirectory);

function VerificarTipoExclusao(const APath: string): TTipoExclusao;
begin
  if (ExtractFileName(APath) = '*.*') or (ExtractFileName(APath) = '*') then
    Exit(teAllFiles);

  if DirectoryExists(APath) then
    Exit(teDirectory);

  Exit(teFile);
end;

procedure TAcaoExclusaoArquivo.DeleteDirectory(const APath: string; ARemoveDir: boolean);
var
  F: TSearchRec;
  path: string;
begin
  path := StringReplace(APath, '\*.*', '', [rfReplaceAll]);
  path := StringReplace(path, '\*', '', [rfReplaceAll]);

  if FindFirst(path + '\*.*', faAnyFile, F) = 0 then
  begin
    try
      repeat
        if (F.Attr and faDirectory <> 0) then
        begin
          if (F.Name <> '.') and (F.Name <> '..') then
          begin
            RemoveDir(path + '\' + F.Name);
          end;
        end else
        begin
          DeleteFile(path + '\' + F.Name);
        end;
      until FindNext(F) <> 0;
    finally
      FindClose(F);
    end;
    if ARemoveDir then
      RemoveDir(path);
  end;
end;

procedure TAcaoExclusaoArquivo.DeleteUniqueFile(const APath: string);
begin
  if FileExists(APath) then
    DeleteFile(APath);
end;

procedure TAcaoExclusaoArquivo.InternalAfterExecute;
begin
  Application.Notify(taExcluir);
end;

procedure TAcaoExclusaoArquivo.InternalExecute;
var
  path: string;
begin
  path := Application.Parser.ParserText(Aplicativo);
  case VerificarTipoExclusao(path) of
    teFile: DeleteUniqueFile(path);
    teAllFiles: DeleteDirectory(path, False);
    teDirectory: DeleteDirectory(path);
  end;
end;

initialization
  InstantRegisterClasses([
    TAcaoExclusaoArquivo,
    TAcaoExclusaoDiretorio
  ]);

end.
