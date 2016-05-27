unit Manager.Source.Core.IDE.Update;

interface

uses Classes, SysUtils, Forms, Dialogs, ShellApi, DateUtils,
  Windows, System.UITypes, Vcl.ActnList, Manager.Source.Components.Update, Vcl.ExtCtrls,
  Manager.Source.Core.Intf.BasicItem, Manager.Source.Core.Messages;

type
  TUpdate = class(TTimer, IManagerBasicItem)
  private
    FUpdater: TUpdater;
    FUpdateAvailable: boolean;
    FAction: TAction;
    procedure OnExecute(Sender: TObject);
    procedure OnUpdate(Sender: TObject);
    function GetApplicationName: string;
    function GetApplicationVersion: string;
    procedure SetAction(const Value: TAction);
    procedure OnUpdateTimer(Sender: TObject);
    function PodeVerificarAtualizacao: boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;
    function HasUpdateAvailable: boolean;
    property Action: TAction read FAction write SetAction;
    property ApplicationName: string read GetApplicationName;
    property ApplicationVersion: string read GetApplicationVersion;
  end;

implementation

{ TUpdate }

uses Manager.Source.Core.AplicationHelper, Manager.Source.Consts;

var
  _LastUpdateVerification: TDateTime;

constructor TUpdate.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  _LastUpdateVerification := 0;
  FUpdater := TUpdater.Create;
  FUpdater.ApplicationFileName := Application.ExeName;
  FUpdater.Silent := True;
  FUpdateAvailable := HasUpdateAvailable;
end;

destructor TUpdate.Destroy;
begin
  FreeAndNil(FUpdater);
  inherited;
end;

procedure TUpdate.Execute;
const
  intMSec = 60 * 1000; // o equivalente a 1 milisegundo
begin
  Self.OnTimer := OnUpdateTimer;
  Self.Interval := Trunc(Application.IDE.Config.App.TempoVerificaoAtualizacaoAuto * intMSec);

  Self.Enabled := Application.IDE.Config.App.VerificarAtualizacaoAuto;
  if Self.Enabled and PodeVerificarAtualizacao then
  begin
    Self.OnTimer(Self);
  end;
end;

procedure TUpdate.OnUpdateTimer(Sender: TObject);
begin
  if not TUpdate(Sender).HasUpdateAvailable then
    Exit;

  Application.IDE.Alert(Self.ApplicationName, Format(MSG_ALERT_UPDATE, [Self.ApplicationVersion, APP_TITLE]));
end;

function TUpdate.PodeVerificarAtualizacao: boolean;
var
  pode: boolean;
begin
  pode := IncMinute(_LastUpdateVerification, Application.IDE.Config.App.TempoVerificaoAtualizacaoAuto) < (Date + Time);
  if pode then
    _LastUpdateVerification := (Date + Time);

  Exit(pode);
end;

function TUpdate.GetApplicationName: string;
begin
  Exit(FUpdater.ApplicationName);
end;

function TUpdate.GetApplicationVersion: string;
begin
  Exit(FUpdater.RemoteVersion);
end;

procedure TUpdate.OnExecute(Sender: TObject);
var
  handle: THandle;
  updateapp: string;
begin
  if not HasUpdateAvailable then
    Exit;

  if MessageDlg(Format(MSG_ALERT_UPDATE,[FUpdater.RemoteVersion, FUpdater.ApplicationName]),  mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  Application.Terminate;

  updateapp := Format('%s', [ExtractFilePath(Application.ExeName) + 'Updater.exe']);
  ShellExecute(handle, 'open' , PWideChar(updateapp), PWideChar(Chr(34) + Application.ExeName + Chr(34)), String.Empty, SW_SHOWNORMAL);
end;

procedure TUpdate.OnUpdate(Sender: TObject);
begin
  TAction(Sender).Visible := FUpdateAvailable;
end;

procedure TUpdate.SetAction(const Value: TAction);
begin
  FAction := Value;
  if Assigned(FAction) then
  begin
    FAction.OnExecute := OnExecute;
    FAction.OnUpdate := OnUpdate;
  end;
end;

function TUpdate.HasUpdateAvailable: boolean;
begin
  try
    Exit(FUpdater.UpdateAvailable);
  except
    Exit(False);
  end;
end;

end.
