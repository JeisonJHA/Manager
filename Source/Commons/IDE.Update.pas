unit IDE.Update;

interface

uses Classes, SysUtils, IDE.Inicializador.Intf, Forms, Dialogs, ShellApi,
  Windows, System.UITypes;

type
  TUpdate = class(TInterfacedObject, IInicializador)
  private
    procedure InternalExecute;
  public
    procedure Executar();
  end;

implementation

{ TUpdate }

uses Updater.Core;

procedure TUpdate.Executar;
const
  text = 'Uma nova versão (%s) do %s foi encontrado. Você quer baixar e instalar?';

var
  updater: TUpdaterCore;

begin
  updater := TUpdaterCore.Create;
  try
    updater.ApplicationFileName := Application.ExeName;
    if not updater.UpdateAvailable then
      Exit;

    if MessageDlg(Format(text,[updater.RemoteVersion, updater.ApplicationName]),  mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;

    Application.Terminate;

    InternalExecute;
  finally
    FreeAndNil(updater);
  end;
end;

procedure TUpdate.InternalExecute;
var
  handle: THandle;
  updateapp: string;
begin
  updateapp := Format('%s', [ExtractFilePath(Application.ExeName) + 'Updater.exe']);
  ShellExecute(handle, 'open' , PWideChar(updateapp), PWideChar(Chr(34) + Application.ExeName + Chr(34)), String.Empty, SW_SHOWNORMAL);
end;

end.
