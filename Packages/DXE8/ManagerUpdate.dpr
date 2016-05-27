program ManagerUpdate;

uses
  Vcl.Forms,
  Manager.Source.Components.Update.HttpDownload in '..\..\Source\Components\Update\Manager.Source.Components.Update.HttpDownload.pas',
  Manager.Source.Components.Update in '..\..\Source\Components\Update\Manager.Source.Components.Update.pas',
  Manager.Source.Components.Update.Forms.Main in '..\..\Source\Components\Update\Forms\Manager.Source.Components.Update.Forms.Main.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
