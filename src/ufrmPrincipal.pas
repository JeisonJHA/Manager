unit ufrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, dxSkinsCore,
  dxRibbonCustomizationForm, dxSkinsdxBarPainter, cxContainer, cxEdit,
  dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery,
  dxGalleryControl, dxRibbonBackstageViewGalleryControl, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, cxTextEdit, Vcl.StdCtrls, Vcl.Buttons, cxPC,
  dxSkinscxPCPainter, dxBarBuiltInMenu, dxTabbedMDI, Workspace.Action,
  Vcl.ExtCtrls, cxMaskEdit, cxSpinEdit, cxSpinButton, JvExControls, JvPageList,
  JvNavigationPane, dxSkinsdxDockControlPainter, dxDockControl, dxDockPanel,
  Workspace.Utils, Workspace.Config, Data.DB, Vcl.Grids, Vcl.DBGrids,
  MdDsCustom, MdDsList, MdDsObjects, Workspace, Datasnap.DBClient, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TfrmPrincipal = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbon1: TdxRibbon;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxRibbonBackstageViewGalleryControl1: TdxRibbonBackstageViewGalleryControl;
    cxLabel1: TcxLabel;
    dxRibbonBackstageViewGalleryControl1Group1
      : TdxRibbonBackstageViewGalleryGroup;
    dxSkinController1: TdxSkinController;
    dxRibbonBackstageViewGalleryControl1Group1Item1
      : TdxRibbonBackstageViewGalleryItem;
    ActionList1: TActionList;
    actOpcoes: TAction;
    btnOpcoes: TdxBarLargeButton;
    ribbonGerenciamento: TdxRibbonTab;
    barCadastros: TdxBar;
    actCadSistemas: TAction;
    actCadBaseDados: TAction;
    actCadAplicacoes: TAction;
    btnCadSistemas: TdxBarLargeButton;
    btnCadBaseDados: TdxBarLargeButton;
    btnCadAplicacoes: TdxBarLargeButton;
    tabOpcoes: TdxRibbonBackstageViewTabSheet;
    barAplicacoes: TdxBar;
    regStorage: TJvAppRegistryStorage;
    cxTextEdit1: TcxTextEdit;
    Label1: TLabel;
    cxLabel2: TcxLabel;
    SpeedButton1: TSpeedButton;
    dxTabbedMDIManager1: TdxTabbedMDIManager;
    dxDockingManager1: TdxDockingManager;
    dxDockSite1: TdxDockSite;
    dxDockPanel1: TdxDockPanel;
    Panel1: TPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    MdObjDataSet1: TMdObjDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure actCadSistemasExecute(Sender: TObject);
    procedure actCadBaseDadosExecute(Sender: TObject);
    procedure actCadAplicacoesExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FWorkspaceList: TWorkspaceList;
    procedure Teste;
    procedure CarregarAplicacoes;
    procedure CarregarVersao;
    procedure OnExecutarAplicativoClick(Sender: TObject);
    procedure InicializarWorkspaceList;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses JvTypes, uspmFuncoes, uspmCadSistemas, uspmCadBaseDados, uspmCadAplicacoes,
  ufrmWorkspace, ZDataset, Winapi.ShellApi, uspmDados, Workspace.Constantes;

{ TForm1 }

procedure TfrmPrincipal.actCadAplicacoesExecute(Sender: TObject);
begin
  uspmFuncoes.AbrirFormulario(Self, TspmCadAplicacoes, spmCadAplicacoes);
end;

procedure TfrmPrincipal.actCadBaseDadosExecute(Sender: TObject);
begin
  uspmFuncoes.AbrirFormulario(Self, TspmCadBaseDados, spmCadBaseDados);
end;

procedure TfrmPrincipal.actCadSistemasExecute(Sender: TObject);
begin
  uspmFuncoes.AbrirFormulario(Self, TspmCadSistemas, spmCadSistemas);
end;

procedure TfrmPrincipal.OnExecutarAplicativoClick(Sender: TObject);
var
  handle: THandle;
begin
  try
    ShellExecute(handle, nil, PChar(TWorkspaceAction(Sender).Executavel),
      PChar(TWorkspaceAction(Sender).Parametros), '', SW_SHOWNORMAL);
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmPrincipal.CarregarAplicacoes;
var
  Qry: TZQuery;
  BIL: TdxBarItemLink;
  Act: TWorkspaceAction;
begin
  Qry := TZQuery.Create(nil);
  try
    Qry.Connection := dmDados.dmConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add
      ('SELECT AP.* FROM CADAPLICACOES AP WHERE FLWORKSPACE = :FLWORKSPACE');
    Qry.ParamByName('FLWORKSPACE').AsString := 'N';
    Qry.Open;

    Qry.First;
    while not Qry.Eof do
    begin
      Act := TWorkspaceAction.Create(ActionList1);
      Act.Category := 'Aplicacoes';
      Act.Caption := Qry.FieldByName('DEAPLICACOES').AsString;
      Act.ImageIndex := Qry.FieldByName('CDICON').AsInteger;
      Act.OnExecute := OnExecutarAplicativoClick;
      Act.Executavel := Qry.FieldByName('DEEXECUTAVEL').AsString;
      Act.Parametros := Qry.FieldByName('DEPARAMETROS').AsString;
      Act.Tipo := TTipoAcao(Qry.FieldByName('CDACAO').AsInteger);

      BIL := barAplicacoes.ItemLinks.Add;
      BIL.Item := TdxBarLargeButton.Create(dxBarManager1);
      BIL.Item.Action := Act;
      BIL.Item.Category := dxBarManager1.Categories.IndexOf('Default');

      Qry.Next;
    end;

  finally
    FreeAndNil(Qry);
  end;
end;

procedure TfrmPrincipal.CarregarVersao;
begin
  try
    dxRibbonStatusBar1.Panels[2].Text := 'Versão: ' + PegarVersaoAplicacao;
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmPrincipal.DBGrid1DblClick(Sender: TObject);
begin
  if not Assigned(MdObjDataSet1.CurrentObject) then
    Exit;

  with TfrmWorkspace.Create(Self, TWorkspace(MdObjDataSet1.CurrentObject)) do
  begin
    Show;
  end;
end;

procedure TfrmPrincipal.InicializarWorkspaceList;
var
  utils: TWorkspaceUtils;
  config: TWorkspaceConfig;
  I: integer;
  sandbox: TWorkspace;
begin
  MdObjDataSet1.ObjClass := TWorkspace;
  config := TWorkspaceConfig.Create(nil);
  try
    with TWorkspaceUtils.Create(config) do
    begin
      Sandboxes(MdObjDataSet1);
      Free;
    end;
    MdObjDataSet1.Refresh;
  finally
    FreeAndNil(config);
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FWorkspaceList);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  DisableAero := True;
  FWorkspaceList := TWorkspaceList.Create;
  InicializarWorkspaceList;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Teste;
  CarregarAplicacoes;
  CarregarVersao;
  dxRibbonStatusBar1.Panels[0].Text := dmDados.dmConexao.Database;
end;

procedure TfrmPrincipal.Teste;
const
  BaseKey = 'SCM\Workspace';
  TheKey = 'Software\Softplan\Manager';
begin
  with regStorage do
  begin
    { This is not needed in this example since it is the default
      RootKey is HKEY_CURRENT_USER. If you needed to change
      the RootKey, this is where to do it. }

    Root := TheKey;

    { Now we can open the "key" <Control Panel\Colors> to
      access the "value" <ButtonFace>. You do not need to
      check if the "key" was opened, although it is wise
      to do so. }

    cxTextEdit1.Text := ReadString(BaseKey, '');
  end;
end;

end.
