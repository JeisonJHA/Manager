unit AcaoCopiar;

interface

uses InstantPersistence, InstantTypes, AcaoComando, Winapi.ShellApi, Classes,
  SysUtils, Winapi.Windows, Forms, IDE.Aplicacao;

type
  TAcaoCopiar = class;

  TAcaoCopiar = class(TAcaoComando)
  {IOMETADATA stored;
    Origem: String(255);
    Destino: String(255); }
    _Destino: TInstantString;
    _Origem: TInstantString;
  private
    function GetDestino: string;
    function GetOrigem: string;
    procedure SetDestino(const Value: string);
    procedure SetOrigem(const Value: string);
  protected
    path_destino_tmp: string;
    function GetTipoAcao: string; override;
  public
    procedure Executar; override;
  published
    property Destino: string read GetDestino write SetDestino;
    property Origem: string read GetOrigem write SetOrigem;
  end;

implementation

{ TAcaoCopiar }

procedure TAcaoCopiar.Executar;
var
  shellinfo: TSHFileOpStructW;
  path_origem: string;
begin
  inherited Executar;
  path_origem := Application.Parser.ParserText(Origem);
  path_destino_tmp := Application.Parser.ParserText(Destino);
  try

    if Length(ExtractFileExt(path_destino_tmp)) <= 0 then
      path_destino_tmp := IncludeTrailingBackslash(path_destino_tmp) + ExtractFileName(path_origem);

    if not DirectoryExists(ExtractFilePath(path_destino_tmp)) then
      ForceDirectories(ExtractFilePath(path_destino_tmp));

    if path_origem.IsEmpty then
      Exit;

    if not FileExists(path_origem) then
      Exit;

    CopyFile(PWideChar(path_origem), PWideChar(path_destino_tmp), True);
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

function TAcaoCopiar.GetDestino: string;
begin
  Result := _Destino.Value;
end;

function TAcaoCopiar.GetOrigem: string;
begin
  Result := _Origem.Value;
end;

function TAcaoCopiar.GetTipoAcao: string;
begin
  Exit('Copiar');
end;

procedure TAcaoCopiar.SetDestino(const Value: string);
begin
  _Destino.Value := Value;;
end;

procedure TAcaoCopiar.SetOrigem(const Value: string);
begin
  _Origem.Value := Value;;
end;

initialization
  InstantRegisterClasses([
    TAcaoCopiar
  ]);

end.
