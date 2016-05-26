unit Manager.Source.Core.HostLayout;

interface

uses Forms, Classes, SysUtils, Manager.Source.Core.Intf.HostLayout,
  Manager.Source.Forms.Main, dxRibbon, dxStatusBar;

type
  TManagerHostLayout = class(TInterfacedObject, IManagerHostLayout)
  protected
    FMainForm: TfrmMain;
  public
    constructor Create(AMainForm: TForm);
    procedure InicializarRibbon; virtual;
    procedure InicializarBarraStatus; virtual;

    property MainForm: TfrmMain read FMainForm;
  end;

implementation

{ TManagerHostLayout }

constructor TManagerHostLayout.Create(AMainForm: TForm);
begin
  FMainForm := TfrmMain(AMainForm);
end;

procedure TManagerHostLayout.InicializarBarraStatus;
var
  panel: TdxStatusBarPanel;
begin
  panel := MainForm.dxRibbonStatusBar1.Panels.Add;
  panel.Text := 'Hello World';
end;

procedure TManagerHostLayout.InicializarRibbon;
var
  tab: TdxRibbonTab;
begin
  tab := MainForm.dxRibbon1.Tabs.Add;
  tab.Caption := 'HELLO WORLD';
end;

end.
