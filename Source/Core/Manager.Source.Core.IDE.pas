unit Manager.Source.Core.IDE;

interface

uses Forms, Classes, SysUtils, Manager.Source.Core.Intf.BasicItem;

type
  TManagerIDE = class(TObject)
  private
    FInitialize: TManagerBasicItemList;
    FSplash: TForm;
    constructor Create;
  public
    class function GetInstance: TManagerIDE;
    destructor Destroy; override;
    procedure ExecuteInitialization;
    property Initialize: TManagerBasicItemList read FInitialize;
    property Splash: TForm read FSplash;
  end;

implementation

uses Manager.Source.Forms.Splash;

var
  _IDE: TManagerIDE;

{ TManagerIDE }

constructor TManagerIDE.Create;
begin
  FInitialize := TManagerBasicItemList.Create;
  FSplash := TfrmSplash.Create(Application.MainForm);
  FSplash.Show;
  FSplash.Repaint;
  Sleep(3000);
end;

destructor TManagerIDE.Destroy;
begin
  FreeAndNil(FInitialize);
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
