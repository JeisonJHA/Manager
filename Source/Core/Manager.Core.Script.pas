unit Manager.Core.Script;

interface

uses Forms, Dialogs, Classes, SysUtils, udtmDatabase, Manager.Core.API.Prepare,
  IBX.IBScript;

type
  TManagerScript = class(TInterfacedObject, IPrepare)
  private
    FDiretorio: string;
    FArquivos: TStrings;
    procedure CarregarScripts(ALista: TStrings);
    procedure ExecutarScripts(ALista: TStrings);
    procedure OnSQLParseError(Sender: TObject; Error: string; SQLText: string; LineIndex: Integer);
    function GetIBScript: TIBScript;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Executar();
    property Diretorio: string read FDiretorio;
    property IBScript: TIBScript read GetIBScript;
  end;

implementation

const
  FOLDER_NAME = 'Scripts';
{ TManagerScript }

procedure TManagerScript.CarregarScripts(ALista: TStrings);
var
  SR: TSearchRec;
  I: integer;
begin
  ALista.Clear;
  I := FindFirst(Diretorio + '*.sql', faAnyFile, SR);
  while I = 0 do
  begin
    ALista.Add(Diretorio + sr.Name);
    I := FindNext(SR);
  end;
end;

constructor TManagerScript.Create;
begin
  FArquivos := TStringList.Create;
  FDiretorio := IncludeTrailingBackslash(ExtractFilePath(Application.ExeName) + FOLDER_NAME);
  IBScript.OnParseError := OnSQLParseError;
  IBScript.Terminator := ';';
  IBScript.AutoDDL := True;
end;

destructor TManagerScript.Destroy;
begin
  FArquivos.Clear;
  FreeAndNil(FArquivos);
  inherited;
end;

procedure TManagerScript.Executar;
begin
  if not DirectoryExists(Diretorio) then
    Exit;

  CarregarScripts(FArquivos);
  if FArquivos.Count <= 0 then
    Exit;

  ExecutarScripts(FArquivos);
end;

procedure TManagerScript.ExecutarScripts(ALista: TStrings);
var
  I: Integer;
begin
  for I := 0 to ALista.Count -1 do
  begin
    IBScript.Script.Clear;
    IBScript.Script.LoadFromFile(ALista.Strings[I]);
    if not IBScript.ValidateScript then
      Continue;
    IBScript.ExecuteScript;
    DeleteFile(ALista.Strings[I]);
  end;

  if DirectoryExists(Diretorio) then
  begin
    RemoveDir(Diretorio);
  end;
end;

function TManagerScript.GetIBScript: TIBScript;
begin
  Exit(dtmDatabase.IBScript1);
end;

procedure TManagerScript.OnSQLParseError(Sender: TObject; Error,
  SQLText: string; LineIndex: Integer);
begin
  ShowMessage(SQLText);
end;

end.
