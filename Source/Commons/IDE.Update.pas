unit IDE.Update;

interface

uses Classes, SysUtils, IDE.Inicializador.Intf, Forms, Dialogs, ShellApi,
  Windows;

type
  TUpdate = class(TInterfacedObject, IInicializador)
  public
    procedure Executar();
  end;

implementation

{ TUpdate }

procedure TUpdate.Executar;
var
  handle: THandle;
  updateapp: string;
begin
  updateapp := Format('%s', [ExtractFilePath(Application.ExeName) + 'Updater.exe']);
  ShellExecute(handle, 'open' , PWideChar(updateapp), PWideChar(Chr(34) + Application.ExeName + Chr(34)), String.Empty, SW_SHOWNORMAL);
end;

end.
