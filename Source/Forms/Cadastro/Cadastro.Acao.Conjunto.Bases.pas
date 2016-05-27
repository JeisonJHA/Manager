unit Cadastro.Acao.Conjunto.Bases;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Acao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, InstantPresentation,
  System.Actions, Vcl.ActnList, cxMaskEdit, cxDropDownEdit, cxImageComboBox,
  cxDBEdit, cxTextEdit, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxPC,
  Vcl.ExtCtrls, JvExControls, JvSpeedButton, Vcl.Grids, Vcl.DBGrids,
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
  dxSkinXmas2008Blue;

type
  TfrmCadastroAcaoConjuntoBases = class(TfrmCadastroAcao)
    ioeMestreSelf: TIntegerField;
    iosAcoes: TInstantSelector;
    iosAcoesDescricao: TStringField;
    iosAcoesIcone: TIntegerField;
    iosSelecionadorAcoes: TDataSetField;
    iosAcoesSelf: TIntegerField;
    actAddDetalhe: TAction;
    actDelDetalhe: TAction;
    iosAcoesTipoAcao: TStringField;
    cxTabSheet1: TcxTabSheet;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    btnAddComando: TJvSpeedButton;
    btnDelComando: TJvSpeedButton;
    Panel6: TPanel;
    iosSelecionadorTipoAcao: TStringField;
    iosCatalogo: TInstantSelector;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    ioeCatalogos: TInstantExposer;
    dtsCatalogos: TDataSource;
    ioeCatalogosAplicativo: TStringField;
    ioeCatalogosDescricao: TStringField;
    ioeCatalogosIcone: TIntegerField;
    ioeCatalogosIsAdmin: TBooleanField;
    ioeCatalogosParametros: TStringField;
    ioeCatalogosSelf: TIntegerField;
    ioeCatalogosTipoAcao: TStringField;
    iosSelecionadorCatalogos: TDataSetField;
    cxTabSheet2: TcxTabSheet;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    JvSpeedButton1: TJvSpeedButton;
    JvSpeedButton2: TJvSpeedButton;
    Panel4: TPanel;
    cxGrid3: TDBGrid;
    cxGrid2: TDBGrid;
    procedure JvSpeedButton1Click(Sender: TObject);
    procedure actAddDetalheUpdate(Sender: TObject);
    procedure actDelDetalheUpdate(Sender: TObject);
    procedure JvSpeedButton2Click(Sender: TObject);
    procedure btnAddComandoClick(Sender: TObject);
    procedure btnDelComandoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoConjuntoBases: TfrmCadastroAcaoConjuntoBases;

implementation

{$R *.dfm}

uses AcaoConjuntoDeBases, Acao,
  AcaoCatalogoDeBases, Manager.Source.Core.FormUtils,
  Manager.Source.Core.InstantSelectorHelper;

procedure TfrmCadastroAcaoConjuntoBases.actAddDetalheUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(iosSelecionador.CurrentObject);
end;

procedure TfrmCadastroAcaoConjuntoBases.actDelDetalheUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := not ioeMestre.IsEmpty;
end;

procedure TfrmCadastroAcaoConjuntoBases.btnAddComandoClick(Sender: TObject);
var
  objeto: TObject;
  catalogo: TAcaoConjuntoDeBases;
begin
  inherited;
  catalogo := TAcaoConjuntoDeBases(iosSelecionador.CurrentObject);
  objeto := iosCatalogo.Escolher(['TipoAcao','Descricao']);
  if not Assigned(objeto) then
    Exit;

  catalogo.AddCatalogo(TAcaoCatalogoDeBases(objeto));
  catalogo.Store();
end;

procedure TfrmCadastroAcaoConjuntoBases.btnDelComandoClick(Sender: TObject);
var
  objeto: TObject;
  catalogo: TAcaoConjuntoDeBases;
begin
  inherited;

  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  catalogo := TAcaoConjuntoDeBases(iosSelecionador.CurrentObject);
  objeto := ioeCatalogos.CurrentObject;
  if not Assigned(objeto) then
    Exit;

  catalogo.RemoveCatalogo(TAcaoCatalogoDeBases(objeto));
  catalogo.Store();
end;

procedure TfrmCadastroAcaoConjuntoBases.JvSpeedButton1Click(Sender: TObject);
var
  objeto: TObject;
  catalogo: TAcaoConjuntoDeBases;
begin
  inherited;
  catalogo := TAcaoConjuntoDeBases(iosSelecionador.CurrentObject);
  objeto := iosAcoes.Escolher(['TipoAcao','Descricao']);
  if not Assigned(objeto) then
    Exit;

  catalogo.AddAcao(TAcaoConfigurarBaseDeDados(objeto));
  catalogo.Store();
end;

procedure TfrmCadastroAcaoConjuntoBases.JvSpeedButton2Click(Sender: TObject);
var
  objeto: TObject;
  catalogo: TAcaoConjuntoDeBases;
begin
  inherited;

  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  catalogo := TAcaoConjuntoDeBases(iosSelecionador.CurrentObject);
  objeto := ioeMestre.CurrentObject;
  if not Assigned(objeto) then
    Exit;

  catalogo.RemoveAcao(TAcaoConfigurarBaseDeDados(objeto));
  catalogo.Store();
end;

initialization
  RegisterForm(TfrmCadastroAcaoConjuntoBases);

end.
