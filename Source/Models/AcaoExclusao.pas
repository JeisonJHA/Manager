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
begin
  if FindFirst(Aplicativo, faAnyFile, F) = 0 then
  begin
    try
      repeat
        if (F.Attr and faDirectory <> 0) then
        begin
          if (F.Name <> '.') and (F.Name <> '..') then
          begin
            RemoveDir(Aplicativo + '\' + F.Name);
          end;
        end else
        begin
          DeleteFile(Aplicativo + '\' + F.Name);
        end;
      until FindNext(F) <> 0;
    finally
      FindClose(F);
    end;
    if ARemoveDir then
      RemoveDir(Aplicativo);
  end;
end;

procedure TAcaoExclusaoArquivo.DeleteUniqueFile(const APath: string);
begin
  if FileExists(APath) then
    DeleteFile(Aplicativo);
end;

procedure TAcaoExclusaoArquivo.InternalAfterExecute;
begin
  Application.Notify(taExcluir);
end;

procedure TAcaoExclusaoArquivo.InternalExecute;
begin
  inherited InternalExecute;
  case VerificarTipoExclusao(Aplicativo) of
    teFile: DeleteUniqueFile(Aplicativo);
    teAllFiles: DeleteDirectory(Aplicativo, False);
    teDirectory: DeleteDirectory(Aplicativo);
  end;
end;

initialization
  InstantRegisterClasses([
    TAcaoExclusaoArquivo,
    TAcaoExclusaoDiretorio
  ]);

end.
