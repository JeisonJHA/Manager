unit AcaoExecutar;

interface

uses InstantPersistence, InstantTypes, AcaoComando, Winapi.ShellApi, Classes,
  SysUtils, Winapi.Windows, Forms, IDE.Aplicacao;

type
  TAcaoExecutar = class;

  TAcaoExecutar = class(TAcaoComando)
  {IOMETADATA stored;
    Parametros: String(255);
    Aplicativo: String(255);
    IsAdmin: Boolean; }
    _Aplicativo: TInstantString;
    _IsAdmin: TInstantBoolean;
    _Parametros: TInstantString;
  private
    function GetAplicativo: string;
    function GetIsAdmin: Boolean;
    function GetParametros: string;
    procedure SetAplicativo(const Value: string);
    procedure SetIsAdmin(Value: Boolean);
    procedure SetParametros(const Value: string);
    function RunAsAdmin(hWnd: HWND; filename: string; Parameters: string): Boolean;
  protected
    function GetTipoAcao: string; override;
  public
    procedure Executar; override;
  published
    property Aplicativo: string read GetAplicativo write SetAplicativo;
    property IsAdmin: Boolean read GetIsAdmin write SetIsAdmin;
    property Parametros: string read GetParametros write SetParametros;
  end;

implementation

{ TAcaoExecutar }

procedure TAcaoExecutar.Executar;
var
  handle: THandle;
begin
  try
    inherited Executar;

    if Aplicativo.IsEmpty then
      Exit();

    if IsAdmin then
    begin
      RunAsAdmin(handle, Application.Parser.ParserText(Aplicativo), Application.Parser.ParserText(Parametros));
      Exit;
    end;

    ShellExecute(handle, nil, PChar(Application.Parser.ParserText(Aplicativo)),
      PChar(Application.Parser.ParserText(Parametros)), String.Empty, SW_SHOWNORMAL);
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

function TAcaoExecutar.GetAplicativo: string;
begin
  Result := _Aplicativo.Value;
end;

function TAcaoExecutar.GetIsAdmin: Boolean;
begin
  Result := _IsAdmin.Value;
end;

function TAcaoExecutar.GetParametros: string;
begin
  Result := _Parametros.Value;
end;

function TAcaoExecutar.GetTipoAcao: string;
begin
  Exit('Executar');
end;

function TAcaoExecutar.RunAsAdmin(hWnd: HWND; filename,
  Parameters: string): Boolean;
{
    See Step 3: Redesign for UAC Compatibility (UAC)
    http://msdn.microsoft.com/en-us/library/bb756922.aspx
}
var
    sei: TShellExecuteInfo;
begin
    ZeroMemory(@sei, SizeOf(sei));
    sei.cbSize := SizeOf(TShellExecuteInfo);
    sei.Wnd := hwnd;
    sei.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
    sei.lpVerb := PChar('runas');
    sei.lpFile := PChar(Filename); // PAnsiChar;
    if not parameters.IsEmpty then
        sei.lpParameters := PChar(parameters); // PAnsiChar;
    sei.nShow := SW_SHOWNORMAL; //Integer;

    Result := ShellExecuteEx(@sei);
end;

procedure TAcaoExecutar.SetAplicativo(const Value: string);
begin
  _Aplicativo.Value := Value;;
end;

procedure TAcaoExecutar.SetIsAdmin(Value: Boolean);
begin
  _IsAdmin.Value := Value;;
end;

procedure TAcaoExecutar.SetParametros(const Value: string);
begin
  _Parametros.Value := Value;;
end;

initialization
  InstantRegisterClasses([
    TAcaoExecutar
  ]);

end.
