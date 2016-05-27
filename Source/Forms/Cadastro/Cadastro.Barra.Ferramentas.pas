unit Cadastro.Barra.Ferramentas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Paginado.Mestre.Detalhe.Modelo,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  InstantPresentation, System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, cxContainer, cxTextEdit,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.DBActns, Vcl.Buttons, InstantPersistence,
  JvExControls, JvSpeedButton, Vcl.Grids, Vcl.DBGrids, dxSkinBlack, dxSkinBlue,
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
  TfrmCadastroBarraFerramentas = class(TfrmCadastroPaginadoMestreDetalheModelo)
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    ioeMestreDescricao: TStringField;
    ioeMestreSelf: TIntegerField;
    ioeDetalheDescricao: TStringField;
    ioeDetalheIcone: TIntegerField;
    ioeDetalheSelf: TIntegerField;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    ioeMestreAcoes: TDataSetField;
    iosSelecionadorAcoes: TDataSetField;
    iosSelecionadorDescricao: TStringField;
    iosSelecionadorSelf: TIntegerField;
    iosSelecaoDeAcoes: TInstantSelector;
    iosSelecaoDeAcoesDescricao: TStringField;
    iosSelecaoDeAcoesIcone: TIntegerField;
    iosSelecaoDeAcoesTipoAcao: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure actDelDetalheExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBarraFerramentas: TfrmCadastroBarraFerramentas;

implementation

{$R *.dfm}

uses Acao, BarraFerramenta, Manager.Source.Core.FormUtils,
  Manager.Source.Core.InstantSelectorHelper;

procedure TfrmCadastroBarraFerramentas.actDelDetalheExecute(Sender: TObject);
var
  objeto: TObject;
  barra: TBarraFerramenta;
begin
  inherited;

  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  barra := TBarraFerramenta(iosSelecionador.CurrentObject);
  objeto := ioeDetalhe.CurrentObject;
  if not Assigned(objeto) then
    Exit;

  barra.RemoveAcao(TAcao(objeto));
  barra.Store();
end;

procedure TfrmCadastroBarraFerramentas.SpeedButton1Click(Sender: TObject);
var
  objeto: TObject;
  barra: TBarraFerramenta;
begin
  inherited;
  barra := TBarraFerramenta(iosSelecionador.CurrentObject);
  objeto := iosSelecaoDeAcoes.Escolher(['TipoAcao','Descricao']);
  if not Assigned(objeto) then
    Exit;

  barra.AddAcao(TAcao(objeto));
  barra.Store();
end;

initialization
  RegisterForm(TfrmCadastroBarraFerramentas);

end.
