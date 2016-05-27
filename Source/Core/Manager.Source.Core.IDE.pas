unit Manager.Source.Core.IDE;

interface

uses Forms, Classes, SysUtils, Manager.Source.Core.Intf.BasicItem,
  Manager.Source.Core.Config, Manager.Source.Core.IDE.Update;

type
  TManagerIDE = class(TObject)
  private
    FInitialize: TManagerBasicItemList;
    FSplash: TForm;
    FConfig: TManagerConfig;
    FUpdate: TUpdate;
    constructor Create;
  public
    class function GetInstance: TManagerIDE;
    destructor Destroy; override;
    procedure ExecuteInitialization;
    procedure Alert(const ACaption, AMessage: string);
    property Initialize: TManagerBasicItemList read FInitialize;
    property Splash: TForm read FSplash;
    property Config: TManagerConfig read FConfig;
    property Update: TUpdate read FUpdate;
  end;

implementation

uses Manager.Source.Forms.Splash, Manager.Source.Forms.Main;

var
  _IDE: TManagerIDE;

{ TManagerIDE }

procedure TManagerIDE.Alert(const ACaption, AMessage: string);
begin
  TfrmMain(Application.MainForm).msgAlertMessages.Show(ACaption, AMessage);
end;

constructor TManagerIDE.Create;
begin
  FUpdate := TUpdate.Create(Application.MainForm);
  FInitialize := TManagerBasicItemList.Create;
  FConfig := TManagerConfig.Create(nil);
  FSplash := TfrmSplash.Create(Application.MainForm);
  FSplash.Show;
  FSplash.Repaint;
  Sleep(3000);
end;

destructor TManagerIDE.Destroy;
begin
  FreeAndNil(FConfig);
  FreeAndNil(FInitialize);
  FreeAndNil(FUpdate);
  inherited;
end;

procedure TManagerIDE.ExecuteInitialization;
var
  I: Integer;
begin
  for I := 0 to FInitialize.Count -1 do
    FInitialize.Items[I].Execute;
end;

class function TManagerIDE.GetInstance: TManagerIDE;
begin
  if not Assigned(_IDE) then
    _IDE := TManagerIDE.Create;

  Exit(_IDE);
end;

initialization

finalization
  FreeAndNil(_IDE);

end.
