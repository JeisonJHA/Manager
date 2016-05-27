unit Manager.Core.Forms.Cadastro.Acao.Exclusao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Acao.Executar, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, Data.DB, cxContainer, cxEdit,
  InstantPresentation, System.Actions, Vcl.ActnList, cxCheckBox, cxDBEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, cxPC, Vcl.ExtCtrls, dxSkinBlack, dxSkinBlue,
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
  TfrmCadastroAcaoExclusao = class(TfrmCadastroAcaoExecutar)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoExclusao: TfrmCadastroAcaoExclusao;

implementation

uses Manager.Source.Core.FormUtils;

{$R *.dfm}

initialization
  RegisterForm(TfrmCadastroAcaoExclusao);

end.
