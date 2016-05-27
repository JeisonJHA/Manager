unit Manager.Source.Core.IDE;

interface

uses Forms, Classes, SysUtils, Manager.Source.Core.Intf.BasicItem,
  Manager.Source.Core.Config, Manager.Source.Core.IDE.Update,
  Manager.Source.Core.Intf.Observer, Generics.Collections,
  Manager.Source.Core.Intf.Workspace, Manager.Source.Core.ParserControl;

type
  TObservadores = class(TList<IManagerObserver>);

  TManagerIDE = class(TInterfacedObject, IManagerSubject)
  private
    FInitialize: TManagerBasicItemList;
    FSplash: TForm;
    FConfig: TManagerConfig;
    FUpdate: TUpdate;
    FObservadores: TObservadores;
    FParser: TManagerParserControl;
    constructor Create;
    function GetWorkspace: IWorkspace;
  public
    class function GetInstance: TManagerIDE;
    destructor Destroy; override;
    procedure ExecuteInitialization;
    procedure Alert(const ACaption, AMessage: string);

    procedure Register(AObserver: IManagerObserver);
    procedure Remove(AObserver: IManagerObserver);
    procedure Notify;

    property Initialize: TManagerBasicItemList read FInitialize;
    property Splash: TForm read FSplash;
    property Config: TManagerConfig read FConfig;
    property Update: TUpdate read FUpdate;
    property CurrentWorkspace: IWorkspace read GetWorkspace;
    property Parser: TManagerParserControl read FParser;
  end;

implementation

uses Manager.Source.Forms.Splash, Manager.Source.Forms.Main, dxTabbedMDI;

var
  _IDE: TManagerIDE;

{ TManagerIDE }

procedure TManagerIDE.Alert(const ACaption, AMessage: string);
begin
  TfrmMain(Application.MainForm).msgAlertMessages.Show(ACaption, AMessage);
end;

constructor TManagerIDE.Create;
begin
  FParser := TManagerParserControl.Create;
  FObservadores := TObservadores.Create;
  FUpdate := TUpdate.Create(Application.MainForm);
  FInitialize := TManagerBasicItemList.Create;
  FConfig := TManagerConfig.Create(nil);
  FSplash := TfrmSplash.Create(Application);
  FSplash.Show;
  FSplash.Repaint;
end;

destructor TManagerIDE.Destroy;
begin
  FreeAndNil(FConfig);
  FreeAndNil(FInitialize);
  FreeAndNil(FObservadores);
  FreeAndNil(FParser);
  inherited;
end;

procedure TManagerIDE.ExecuteInitialization;
var
  I: Integer;
  gauge: integer;
begin
  Sleep(500);
  gauge := Trunc(100/FInitialize.Count);
  for I := 0 to FInitialize.Count -1 do
  begin
    TfrmSplash(FSplash).Gauge1.Progress := Trunc(gauge * I);
    FSplash.Repaint;
    FInitialize.Items[I].Execute;
  end;

  TfrmSplash(FSplash).Gauge1.Progress := 100;
  FSplash.Repaint;
  Sleep(500);
end;

class function TManagerIDE.GetInstance: TManagerIDE;
begin
  if not Assigned(_IDE) then
    _IDE := TManagerIDE.Create;

  Exit(_IDE);
end;

function TManagerIDE.GetWorkspace: IWorkspace;
var
  I: Integer;
  workspace: IWorkspace;
  form: TForm;
  page: TdxTabbedMDIPage;
  manager: TdxTabbedMDIManager;
begin
  manager := TfrmMain(Application.MainForm).tabMDIManager;
  page :=  manager.TabProperties.Pages[manager.TabProperties.PageIndex];
  if not Assigned(page) then
    Exit(nil);

  workspace := (page.MDIChild as IWorkspace);
  if Assigned(workspace) then
    Exit(workspace);

  Exit(nil);
end;

procedure TManagerIDE.Notify;
var
  item: IManagerObserver;
begin
  for item in FObservadores do
    item.Update(Self);
end;

procedure TManagerIDE.Register(AObserver: IManagerObserver);
begin
  FObservadores.Add(AObserver);
end;

procedure TManagerIDE.Remove(AObserver: IManagerObserver);
begin
  FObservadores.Remove(AObserver);
end;

end.
