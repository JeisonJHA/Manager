unit Workspace;

interface

uses Classes, SysUtils, Generics.Collections;

type
  TWorkspace = class(TPersistent)
  private
    FDescricao: string;
    FDiretorio: string;
    function GetDiretorio: string;
  published
    property Descricao: string read FDescricao write FDescricao;
    property Diretorio: string read GetDiretorio write FDiretorio;
  end;

  TWorkspaceList = class(TList<TWorkspace>)
  public
    destructor Destroy; override;
  end;

implementation

{ TWorkspaceList }

destructor TWorkspaceList.Destroy;
var
  I: integer;
  Obj: TObject;
begin
  for I := Count -1 downto 0 do
  begin
    Obj := Items[I];
    Remove(TWorkspace(Obj));
    FreeAndNil(Obj);
  end;
  inherited;
end;

{ TWorkspace }

function TWorkspace.GetDiretorio: string;
begin
  Exit(IncludeTrailingBackslash(FDiretorio));
end;

end.
