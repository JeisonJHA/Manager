unit Manager.Core.Script;

interface

uses Forms, Dialogs, Classes, SysUtils, udtmDatabase, Manager.Core.API.Prepare,
  IBX.IBScript, IBX.IBQuery, IB;

type
  TManagerScript = class(TInterfacedObject, IPrepare)
  private
    FDiretorio: string;
    FArquivos: TStrings;
    procedure CarregarScripts(ALista: TStrings);
    procedure ExecutarScripts(ALista: TStrings);
    procedure OnSQLParseError(Sender: TObject; Error: string; SQLText: string; LineIndex: Integer);
    function GetIBScript: TIBScript;
    function GetIBQuery: TIBQuery;
    function ScriptJaRodado(const AScriptName: string): boolean;
    procedure RegistrarScript(const AScriptName: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Executar();
    property Diretorio: string read FDiretorio;
    property IBScript: TIBScript read GetIBScript;
    property IBQuery: TIBQuery read GetIBQuery;
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
  FindClose(SR);
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
  filename: string;
begin
  for I := 0 to ALista.Count -1 do
  begin
    IBScript.Script.Clear;
    IBScript.Script.LoadFromFile(ALista.Strings[I]);

    {$IFNDEF DEBUG}
    if not IBScript.ValidateScript then
      Continue;
    {$ENDIF}

    filename := AnsiUpperCase(ExtractFileName(ALista.Strings[I]));
    if not ScriptJaRodado(filename) then
    begin
      IBScript.ExecuteScript;
      IBScript.Transaction.Commit;
      RegistrarScript(filename);
      IBScript.Transaction.Commit;
    end;
    DeleteFile(ALista.Strings[I]);
  end;

  if DirectoryExists(Diretorio) then
  begin
    RemoveDir(Diretorio);
  end;
end;

function TManagerScript.GetIBQuery: TIBQuery;
begin
  Exit(dtmDatabase.IBQuery1);
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

procedure TManagerScript.RegistrarScript(const AScriptName: string);
begin
  IBQuery.SQL.Clear;
  IBQuery.SQL.Add('INSERT INTO SCRIPT (FILENAME, UPDATEAT) VALUES (:FILENAME, :UPDATEAT)');
  IBQuery.ParamByName('FILENAME').AsString := AScriptName;
  IBQuery.ParamByName('UPDATEAT').AsDateTime := Date + Time;
  IBQuery.ExecSQL;
end;

function TManagerScript.ScriptJaRodado(const AScriptName: string): boolean;
begin
  try
    IBQuery.SQL.Clear;
    IBQuery.SQL.Add('SELECT * FROM SCRIPT WHERE FILENAME = :FILENAME');
    IBQuery.ParamByName('FILENAME').AsString := AScriptName;
    IBQuery.Open;

    Exit(not IBQuery.IsEmpty);
  except
    on e: EIBInterBaseError do
    begin
      if (e.Message.Contains('Table unknown') and e.Message.Contains('SCRIPT')) then
        Exit(False);

      raise EIBInterBaseError.Create(e.Message);
    end;
  end;
end;

end.
