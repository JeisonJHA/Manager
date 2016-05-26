unit Manager.Source.Core.Host;

interface

uses Forms, Classes, SysUtils, Manager.Source.Core.Intf.Host, Manager.Source.Forms.Main,
  dxRibbonSkins, Manager.Source.Core.Intf.HostLayout,
  Manager.Source.Core.Intf.BasicItem;

type
  TManagerHost = class(TInterfacedObject, IManagerBasicItem, IManagerHost)
  protected
    FMainForm: TfrmMain;
    FLayout: IManagerHostLayout;
  public
    constructor Create(AMainForm: TForm); virtual;
    destructor Destroy; override;
    procedure Execute; virtual;

    property MainForm: TfrmMain read FMainForm;
  end;

implementation

{ TManagerHost }

uses Manager.Source.Core.HostLayout
//{$IF defined(TESTER)}
//  , Manager.Source.Core.HostLayout.Tester
//{$ELSEIF defined(DEVELOPER)}
//  , Manager.Source.Core.HostLayout.Developer
//{$ENDIF}
 , Manager.Source.Consts;

constructor TManagerHost.Create(AMainForm: TForm);
begin
  FMainForm := TfrmMain(AMainForm);
end;

destructor TManagerHost.Destroy;
begin

  inherited;
end;

procedure TManagerHost.Execute;
begin
  Application.Title := APP_TITLE;
  FMainForm.Caption := APP_TITLE;
  FMainForm.Hint := APP_TITLE;

//{$IF defined(TESTER)}
//  layout := TManagerHostLayoutTester.Create(MainForm);
//{$ELSEIF defined(DEVELOPER)}
//  layout := TManagerHostLayoutDeveloper.Create(MainForm);
//{$ENDIF}
  FLayout.InicializarRibbon;
  FLayout.InicializarBarraStatus;
end;

end.
