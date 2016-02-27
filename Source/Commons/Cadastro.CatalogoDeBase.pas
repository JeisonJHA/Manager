unit Cadastro.CatalogoDeBase;

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
  Vcl.ExtCtrls, JvExControls, JvSpeedButton;

type
  TfrmCadastroCatalogoDeBase = class(TfrmCadastroAcao)
    ioeMestreSelf: TIntegerField;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    JvSpeedButton1: TJvSpeedButton;
    JvSpeedButton2: TJvSpeedButton;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1Descricao: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
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
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    iosSelecionadorComandos: TDataSetField;
    iosSelecionadorTipoAcao: TStringField;
    iosComandos: TInstantSelector;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    ioeComandos: TInstantExposer;
    dtsComandos: TDataSource;
    ioeComandosAplicativo: TStringField;
    ioeComandosDescricao: TStringField;
    ioeComandosIcone: TIntegerField;
    ioeComandosIsAdmin: TBooleanField;
    ioeComandosParametros: TStringField;
    ioeComandosSelf: TIntegerField;
    ioeComandosTipoAcao: TStringField;
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
  frmCadastroCatalogoDeBase: TfrmCadastroCatalogoDeBase;

implementation

{$R *.dfm}

uses Acao.Controller, AcaoCatalogoDeBases, Acao, Formulario.Escolha;

procedure TfrmCadastroCatalogoDeBase.actAddDetalheUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(iosSelecionador.CurrentObject);
end;

procedure TfrmCadastroCatalogoDeBase.actDelDetalheUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := not ioeMestre.IsEmpty;
end;

procedure TfrmCadastroCatalogoDeBase.btnAddComandoClick(Sender: TObject);
var
  objeto: TObject;
  catalogo: TAcaoCatalogoDeBases;
begin
  inherited;
  catalogo := TAcaoCatalogoDeBases(iosSelecionador.CurrentObject);
  objeto := iosComandos.Escolher();
  if not Assigned(objeto) then
    Exit;

  catalogo.AddComando(TAcaoExecutar(objeto));
  catalogo.Store();
end;

procedure TfrmCadastroCatalogoDeBase.btnDelComandoClick(Sender: TObject);
var
  objeto: TObject;
  catalogo: TAcaoCatalogoDeBases;
begin
  inherited;

  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  catalogo := TAcaoCatalogoDeBases(iosSelecionador.CurrentObject);
  objeto := ioeComandos.CurrentObject;
  if not Assigned(objeto) then
    Exit;

  catalogo.RemoveComando(TAcaoExecutar(objeto));
  catalogo.Store();
end;

procedure TfrmCadastroCatalogoDeBase.JvSpeedButton1Click(Sender: TObject);
var
  objeto: TObject;
  catalogo: TAcaoCatalogoDeBases;
begin
  inherited;
  catalogo := TAcaoCatalogoDeBases(iosSelecionador.CurrentObject);
  objeto := iosAcoes.Escolher();
  if not Assigned(objeto) then
    Exit;

  catalogo.AddAcao(TAcaoConfigurarBaseDeDados(objeto));
  catalogo.Store();
end;

procedure TfrmCadastroCatalogoDeBase.JvSpeedButton2Click(Sender: TObject);
var
  objeto: TObject;
  catalogo: TAcaoCatalogoDeBases;
begin
  inherited;

  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  catalogo := TAcaoCatalogoDeBases(iosSelecionador.CurrentObject);
  objeto := ioeMestre.CurrentObject;
  if not Assigned(objeto) then
    Exit;

  catalogo.RemoveAcao(TAcaoConfigurarBaseDeDados(objeto));
  catalogo.Store();
end;

end.
