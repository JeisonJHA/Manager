unit Manager.Source.Forms.Opcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FileCtrl,
  System.Actions, Vcl.ActnList, InstantPresentation, JvExControls, JvPageList,
  Vcl.ComCtrls, JvExComCtrls, JvPageListTreeView, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, cxCheckBox, Manager.Source.Core.Config, cxTextEdit,
  cxMaskEdit, cxSpinEdit, Manager.Source.Forms.Modelo, dxSkinBlack, dxSkinBlue,
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
  TfrmOpcoes = class(TfrmModelo)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    JvPageListTreeView1: TJvPageListTreeView;
    JvPageList1: TJvPageList;
    Panel4: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    pageDiretorios: TJvStandardPage;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Panel6: TPanel;
    btnDiretorio: TSpeedButton;
    btnSubscrever: TButton;
    btnAdicionar: TButton;
    btnExcluir: TButton;
    btnExcluirInvalidos: TButton;
    edtPath: TEdit;
    lstPath: TListBox;
    pageAtualizacao: TJvStandardPage;
    Panel7: TPanel;
    cbxVerificarAtualizacaoAuto: TcxCheckBox;
    pageBancoDeDados: TJvStandardPage;
    Panel8: TPanel;
    SpeedButton1: TSpeedButton;
    edtAplicacaoSQL: TcxTextEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    Label3: TLabel;
    edtTempoVerificacaoAtualizacao: TcxSpinEdit;
    Panel9: TPanel;
    cbxEstruturaTFS: TCheckBox;
    cbxJazzOnly: TCheckBox;
    procedure lstPathClick(Sender: TObject);
    procedure btnSubscreverClick(Sender: TObject);
    procedure btnExcluirInvalidosClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnDiretorioClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FConfig: TManagerConfig;

    { Private declarations }
    procedure WorkspaceSave;
    procedure WorkspaceLoad;

    procedure AplicacaoSave;
    procedure AplicacaoLoad;

    procedure BancoDeDadosSave;
    procedure BancoDeDadosLoad;
  public
    { Public declarations }
    procedure SaveAll;
    procedure LoadAll;
  end;

var
  frmOpcoes: TfrmOpcoes;

implementation

{$R *.dfm}

uses Manager.Source.Core.FormUtils,
  Manager.Source.Core.AplicationHelper;

procedure TfrmOpcoes.AplicacaoLoad;
begin
  cbxVerificarAtualizacaoAuto.Checked := FConfig.App.VerificarAtualizacaoAuto;
  edtTempoVerificacaoAtualizacao.Value := FConfig.App.TempoVerificaoAtualizacaoAuto;
end;

procedure TfrmOpcoes.AplicacaoSave;
begin
  FConfig.App.VerificarAtualizacaoAuto := cbxVerificarAtualizacaoAuto.Checked;
  FConfig.App.TempoVerificaoAtualizacaoAuto := edtTempoVerificacaoAtualizacao.Value;
end;

procedure TfrmOpcoes.BancoDeDadosLoad;
begin
  edtAplicacaoSQL.Text := FConfig.SpSQL;
end;

procedure TfrmOpcoes.BancoDeDadosSave;
begin
  FConfig.SpSQL := edtAplicacaoSQL.Text;
end;

procedure TfrmOpcoes.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  lstPath.Items.Append(edtPath.Text);
  edtPath.Clear;
end;

procedure TfrmOpcoes.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  SaveAll;
end;

procedure TfrmOpcoes.btnDiretorioClick(Sender: TObject);
var
  options : TSelectDirOpts;
  chosenDirectory : string;
begin
  inherited;
  if SelectDirectory(chosenDirectory, options, 0) then
    edtPath.Text := chosenDirectory;
end;

procedure TfrmOpcoes.btnExcluirClick(Sender: TObject);
begin
  inherited;
  lstPath.Items.Delete(lstPath.ItemIndex);
end;

procedure TfrmOpcoes.btnExcluirInvalidosClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := lstPath.Items.Count -1 downto 0 do
    if not DirectoryExists(lstPath.Items.Strings[I]) then
      lstPath.Items.Delete(I);
end;

procedure TfrmOpcoes.btnSubscreverClick(Sender: TObject);
begin
  inherited;
  lstPath.Items.Strings[lstPath.ItemIndex] := edtPath.Text;
  edtPath.Clear;
end;

procedure TfrmOpcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.IDE.Notify;
  FreeAndNil(FConfig);
  inherited;
end;

procedure TfrmOpcoes.FormCreate(Sender: TObject);
begin
  inherited;
  FConfig := TManagerConfig.Create(Self);
end;

procedure TfrmOpcoes.FormShow(Sender: TObject);
begin
  inherited;
  LoadAll;
  JvPageList1.ActivePage := pageDiretorios;
end;

procedure TfrmOpcoes.LoadAll;
begin
  WorkspaceLoad;
  AplicacaoLoad;
  BancoDeDadosLoad;
end;

procedure TfrmOpcoes.WorkspaceLoad;
begin
  lstPath.Items.DelimitedText := FConfig.Diretorio;
  cbxEstruturaTFS.Checked := FConfig.Workspace.EstruturaTFS;
  cbxJazzOnly.Checked := FConfig.Workspace.JazzOnly;
end;

procedure TfrmOpcoes.lstPathClick(Sender: TObject);
begin
  inherited;
  if lstPath.ItemIndex > -1 then
    edtPath.Text := lstPath.Items.Strings[lstPath.ItemIndex];
end;

procedure TfrmOpcoes.SaveAll;
begin
  WorkspaceSave;
  AplicacaoSave;
  BancoDeDadosSave;
end;

procedure TfrmOpcoes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.Execute();
  if not String(OpenDialog1.FileName).IsEmpty then
    edtAplicacaoSQL.Text := OpenDialog1.FileName;
end;

procedure TfrmOpcoes.WorkspaceSave;
begin
  Fconfig.Diretorio := lstPath.Items.CommaText;
  FConfig.Workspace.EstruturaTFS := cbxEstruturaTFS.Checked;
  FConfig.Workspace.JazzOnly := cbxJazzOnly.Checked;
end;

initialization
  RegisterForm(TfrmOpcoes);

end.
