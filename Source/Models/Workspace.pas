unit Workspace;

interface

uses
  InstantPersistence, InstantTypes;

type
  TWorkspace = class(TInstantObject)
  {IOMETADATA stored;
    Descricao: String(255);
    Diretorio: String(255); }
    _Descricao: TInstantString;
    _Diretorio: TInstantString;
  private
    function GetDescricao: string;
    function GetDiretorio: string;
    procedure SetDescricao(const Value: string);
    procedure SetDiretorio(const Value: string);
  published
    property Descricao: string read GetDescricao write SetDescricao;
    property Diretorio: string read GetDiretorio write SetDiretorio;
  end;

implementation

uses
  InstantMetadata;

{ TWorkspace }

function TWorkspace.GetDescricao: string;
begin
  Result := _Descricao.Value;
end;

function TWorkspace.GetDiretorio: string;
begin
  Result := _Diretorio.Value;
end;

procedure TWorkspace.SetDescricao(const Value: string);
begin
  _Descricao.Value := Value;;
end;

procedure TWorkspace.SetDiretorio(const Value: string);
begin
  _Diretorio.Value := Value;;
end;

initialization
  InstantRegisterClasses([
    TWorkspace
  ]);

end.
