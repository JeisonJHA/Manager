unit Manager.Source.Forms.Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxRibbonCustomizationForm, dxSkinsdxBarPainter,
  cxContainer, cxEdit, dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxLabel,
  dxGallery, dxGalleryControl, dxRibbonBackstageViewGalleryControl,
  Manager.Source.Core.Intf.Host, System.Actions, Vcl.ActnList,
  Manager.Source.Components.ActionList, Manager.Source.Core.AplicationHelper;

type
  TfrmMain = class(TdxRibbonForm)
    bmToolBars: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbon1: TdxRibbon;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxRibbonBackstageViewGalleryControl1: TdxRibbonBackstageViewGalleryControl;
    cxLabel1: TcxLabel;
    dxRibbonBackstageViewGalleryControl1Group1: TdxRibbonBackstageViewGalleryGroup;
    dxSkinController1: TdxSkinController;
    dxRibbonBackstageViewGalleryControl1Group1Item1: TdxRibbonBackstageViewGalleryItem;
    aclAcoes: TManagerActionList;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FManagerHost: IManagerHost;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce; override;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Manager.Source.Core.Host;

{ TForm1 }

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  DisableAero := True;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Application.IDE.Splash.Hide;
end;

end.
