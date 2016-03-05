unit IDE.Update;

interface

uses Classes, SysUtils, IDE.Inicializador.Intf, Forms, Dialogs, ShellApi,
  Windows, System.UITypes, Vcl.ActnList, Updater.Core, Vcl.ExtCtrls;

type
  TUpdate = class(TTimer, IInicializador)
  private
    FUpdater: TUpdaterCore;
    FUpdateAvailable: boolean;
    procedure OnExecute(Sender: TObject);
    procedure OnUpdate(Sender: TObject);
  public
    constructor Create(AAction: TAction);
    destructor Destroy; override;
    procedure Executar();
    function UpdateAvailable: boolean;
  end;

implementation

{ TUpdate }

const
  MESSAGE_UPDATE = 'Uma nova versão (%s) do %s foi encontrado. Você quer baixar e instalar?';

constructor TUpdate.Create(AAction: TAction);
begin
  inherited Create(AAction);
  if Assigned(AAction) then
  begin
    AAction.OnExecute := OnExecute;
    AAction.OnUpdate := OnUpdate;
  end;
  FUpdater := TUpdaterCore.Create;
  FUpdater.ApplicationFileName := Application.ExeName;
  FUpdateAvailable := FUpdater.UpdateAvailable;
end;

destructor TUpdate.Destroy;
begin
  FreeAndNil(FUpdater);
  inherited;
end;

procedure TUpdate.Executar;
begin
  if not FUpdater.UpdateAvailable then
    Exit;

  if MessageDlg(Format(MESSAGE_UPDATE,[FUpdater.RemoteVersion, FUpdater.ApplicationName]),  mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  Application.Terminate;

  OnExecute(Owner);
end;

procedure TUpdate.OnExecute(Sender: TObject);
var
  handle: THandle;
  updateapp: string;
begin
  if not FUpdater.UpdateAvailable then
    Exit;

  if MessageDlg(Format(MESSAGE_UPDATE,[FUpdater.RemoteVersion, FUpdater.ApplicationName]),  mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  Application.Terminate;

  updateapp := Format('%s', [ExtractFilePath(Application.ExeName) + 'Updater.exe']);
  ShellExecute(handle, 'open' , PWideChar(updateapp), PWideChar(Chr(34) + Application.ExeName + Chr(34)), String.Empty, SW_SHOWNORMAL);
end;

procedure TUpdate.OnUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := FUpdateAvailable;
end;

function TUpdate.UpdateAvailable: boolean;
begin
  Exit(FUpdater.UpdateAvailable);
end;

end.
