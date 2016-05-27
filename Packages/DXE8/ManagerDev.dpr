program ManagerDev;

uses
  SysUtils,
  Vcl.Forms,
  ShellApi,
  Messages,
  Windows,
  Manager.Source.Forms.Main in '..\..\Source\Forms\Manager.Source.Forms.Main.pas' {frmMain},
  Manager.Source.Core.Intf.Host in '..\..\Source\Core\Manager.Source.Core.Intf.Host.pas',
  Manager.Source.Core.Host in '..\..\Source\Core\Manager.Source.Core.Host.pas',
  Manager.Source.Core.Intf.HostLayout in '..\..\Source\Core\Manager.Source.Core.Intf.HostLayout.pas',
  Manager.Source.Core.HostLayout in '..\..\Source\Core\Manager.Source.Core.HostLayout.pas',
  Manager.Source.Consts in '..\..\Source\Developer\Manager.Source.Consts.pas',
  Manager.Source.Core.Host.Developer in '..\..\Source\Core\Manager.Source.Core.Host.Developer.pas',
  Manager.Source.Core.HostLayout.Developer in '..\..\Source\Core\Manager.Source.Core.HostLayout.Developer.pas',
  Manager.Source.Forms.Splash in '..\..\Source\Forms\Manager.Source.Forms.Splash.pas' {frmSplash},
  Manager.Source.Core.AplicationHelper in '..\..\Source\Core\Manager.Source.Core.AplicationHelper.pas',
  Manager.Source.Core.IDE in '..\..\Source\Core\Manager.Source.Core.IDE.pas',
  Manager.Source.Core.Intf.BasicItem in '..\..\Source\Core\Manager.Source.Core.Intf.BasicItem.pas',
  Manager.Source.Core.FormUtils in '..\..\Source\Core\Manager.Source.Core.FormUtils.pas',
  Manager.Source.Forms.Modelo in '..\..\Source\Forms\Manager.Source.Forms.Modelo.pas' {frmModelo},
  Manager.Source.Core.IDE.Update in '..\..\Source\Core\Manager.Source.Core.IDE.Update.pas',
  Manager.Source.Core.IDE.Consts in '..\..\Source\Core\Manager.Source.Core.IDE.Consts.pas',
  Manager.Source.Core.Config in '..\..\Source\Core\Manager.Source.Core.Config.pas',
  Manager.Source.Core.Messages in '..\..\Source\Core\Manager.Source.Core.Messages.pas',
  Manager.Source.Forms.DataModule.Database in '..\..\Source\Forms\Manager.Source.Forms.DataModule.Database.pas' {dtmDatabase: TDataModule},
  Manager.Source.Forms.DataModule.Resources in '..\..\Source\Forms\Manager.Source.Forms.DataModule.Resources.pas' {dtmResources: TDataModule};

{$R *.res}

begin
  CreateMutex(nil, False, APP_GUID);
  if GetLastError = ERROR_ALREADY_EXISTS Then
  begin
    SendMessage(HWND_BROADCAST,
    RegisterWindowMessage(APP_GUID),0,0);
    Halt(0);
  end;

  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmDatabase, dtmDatabase);
  Application.CreateForm(TdtmResources, dtmResources);
  Application.CreateForm(TfrmMain, frmMain);
  Application.IDE.Initialize.Add(Application.IDE.Update);
  Application.IDE.Initialize.Add(TManagerHostDeveloper.Create(Application.MainForm));
  Application.IDE.ExecuteInitialization;
  Application.Run;
end.
