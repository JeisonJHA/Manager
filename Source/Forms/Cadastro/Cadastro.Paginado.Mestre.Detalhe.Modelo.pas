unit Cadastro.Paginado.Mestre.Detalhe.Modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Paginado.Modelo, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  InstantPresentation, System.Actions, Vcl.ActnList, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, JvExControls,
  JvSpeedButton, Vcl.Grids, Vcl.DBGrids, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  TfrmCadastroPaginadoMestreDetalheModelo = class(TfrmCadastroPaginadoModelo)
    GroupBox1: TGroupBox;
    ioeDetalhe: TInstantExposer;
    dtsDetalhe: TDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    actAddDetalhe: TAction;
    actDelDetalhe: TAction;
    btnAdd: TJvSpeedButton;
    btnDel: TJvSpeedButton;
    cxGrid2: TDBGrid;
    procedure actAddDetalheUpdate(Sender: TObject);
    procedure actDelDetalheUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPaginadoMestreDetalheModelo: TfrmCadastroPaginadoMestreDetalheModelo;

implementation

{$R *.dfm}

procedure TfrmCadastroPaginadoMestreDetalheModelo.actAddDetalheUpdate(
  Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(iosSelecionador.CurrentObject);
end;

procedure TfrmCadastroPaginadoMestreDetalheModelo.actDelDetalheUpdate(
  Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := not ioeDetalhe.IsEmpty;
end;

end.
