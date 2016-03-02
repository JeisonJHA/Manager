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
  ShellExecute(handle, 'open' , PWideChar(updateapp), PWideChar(Application.ExeName), String.Empty, SW_SHOWNORMAL);
end;

end.
