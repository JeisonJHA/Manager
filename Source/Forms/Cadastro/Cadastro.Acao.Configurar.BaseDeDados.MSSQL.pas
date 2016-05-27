unit Cadastro.Acao.Configurar.BaseDeDados.MSSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Acao.Configurar.BaseDeDados,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  InstantPresentation, System.Actions, Vcl.ActnList, cxSpinEdit, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxTextEdit, Vcl.StdCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxPC, Vcl.ExtCtrls, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue;

type
  TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL = class(TfrmCadastroAcaoConfigurarBaseDeDados)
    ioeMestreInstancia: TStringField;
    iosSelecionadorInstancia: TStringField;
  private
    { Private declarations }
  protected
    function PegarCaminhoTemplate: string; override;
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoConfigurarBaseDeDadosMSSQL: TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL;

implementation

{$R *.dfm}

uses Manager.Source.Core.FormUtils;

{ TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL }

function TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL.PegarCaminhoTemplate: string;
begin
  Exit(inherited PegarCaminhoTemplate + 'MSSQL\');
end;

initialization
  RegisterForm(TfrmCadastroAcaoConfigurarBaseDeDadosMSSQL);

end.
