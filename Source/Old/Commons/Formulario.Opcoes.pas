unit Formulario.Opcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Manager.Core.Forms.Modelo, Data.DB, FileCtrl,
  System.Actions, Vcl.ActnList, InstantPresentation, JvExControls, JvPageList,
  Vcl.ComCtrls, JvExComCtrls, JvPageListTreeView, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, cxCheckBox, Manager.Core.Configuration, cxTextEdit,
  cxMaskEdit, cxSpinEdit, dxSkinLilian, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmFormularioOpcoes = class(TfrmModelo)
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
    cbxEstruturaRTC: TCheckBox;
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
    FConfig: TConfiguration;

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
  frmFormularioOpcoes: TfrmFormularioOpcoes;

implementation

{$R *.dfm}

uses Manager.Core.Forms.Utils, Manager.Core.IDE;

procedure TfrmFormularioOpcoes.AplicacaoLoad;
begin
  cbxVerificarAtualizacaoAuto.Checked := FConfig.Aplicacao.VerificarAtualizacaoAuto;
  edtTempoVerificacaoAtualizacao.Value := FConfig.Aplicacao.TempoVerificaoAtualizacaoAuto;
end;

procedure TfrmFormularioOpcoes.AplicacaoSave;
begin
  FConfig.Aplicacao.VerificarAtualizacaoAuto := cbxVerificarAtualizacaoAuto.Checked;
  FConfig.Aplicacao.TempoVerificaoAtualizacaoAuto := edtTempoVerificacaoAtualizacao.Value;
end;

procedure TfrmFormularioOpcoes.BancoDeDadosLoad;
begin
  edtAplicacaoSQL.Text := FConfig.SpSQL;
end;

procedure TfrmFormularioOpcoes.BancoDeDadosSave;
begin
  FConfig.SpSQL := edtAplicacaoSQL.Text;
end;

procedure TfrmFormularioOpcoes.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  lstPath.Items.Append(edtPath.Text);
  edtPath.Clear;
end;

procedure TfrmFormularioOpcoes.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  SaveAll;
end;

procedure TfrmFormularioOpcoes.btnDiretorioClick(Sender: TObject);
var
  options : TSelectDirOpts;
  chosenDirectory : string;
begin
  inherited;
  if SelectDirectory(chosenDirectory, options, 0) then
    edtPath.Text := chosenDirectory;
end;

procedure TfrmFormularioOpcoes.btnExcluirClick(Sender: TObject);
begin
  inherited;
  lstPath.Items.Delete(lstPath.ItemIndex);
end;

procedure TfrmFormularioOpcoes.btnExcluirInvalidosClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := lstPath.Items.Count -1 downto 0 do
    if not DirectoryExists(lstPath.Items.Strings[I]) then
      lstPath.Items.Delete(I);
end;

procedure TfrmFormularioOpcoes.btnSubscreverClick(Sender: TObject);
begin
  inherited;
  lstPath.Items.Strings[lstPath.ItemIndex] := edtPath.Text;
  edtPath.Clear;
end;

procedure TfrmFormularioOpcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Notify;
  FreeAndNil(FConfig);
  inherited;
end;

procedure TfrmFormularioOpcoes.FormCreate(Sender: TObject);
begin
  inherited;
  FConfig := TConfiguration.Create(Self);
end;

procedure TfrmFormularioOpcoes.FormShow(Sender: TObject);
begin
  inherited;
  LoadAll;
  JvPageList1.ActivePage := pageDiretorios;
end;

procedure TfrmFormularioOpcoes.LoadAll;
begin
  WorkspaceLoad;
  AplicacaoLoad;
  BancoDeDadosLoad;
end;

procedure TfrmFormularioOpcoes.WorkspaceLoad;
begin
  lstPath.Items.DelimitedText := FConfig.Diretorio;
  cbxEstruturaTFS.Checked := FConfig.Workspace.EstruturaTFS;
  cbxJazzOnly.Checked := FConfig.Workspace.JazzOnly;
  cbxEstruturaRTC.Checked := FConfig.Workspace.EstruturaRTC;
end;

procedure TfrmFormularioOpcoes.lstPathClick(Sender: TObject);
begin
  inherited;
  if lstPath.ItemIndex > -1 then
    edtPath.Text := lstPath.Items.Strings[lstPath.ItemIndex];
end;

procedure TfrmFormularioOpcoes.SaveAll;
begin
  WorkspaceSave;
  AplicacaoSave;
  BancoDeDadosSave;
end;

procedure TfrmFormularioOpcoes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.Execute();
  if not String(OpenDialog1.FileName).IsEmpty then
    edtAplicacaoSQL.Text := OpenDialog1.FileName;
end;

procedure TfrmFormularioOpcoes.WorkspaceSave;
begin
  Fconfig.Diretorio := lstPath.Items.CommaText;
  FConfig.Workspace.EstruturaTFS := cbxEstruturaTFS.Checked;
  FConfig.Workspace.JazzOnly := cbxJazzOnly.Checked;
  FConfig.Workspace.EstruturaRTC := cbxEstruturaRTC.Checked;
end;

initialization
  RegisterForm(TfrmFormularioOpcoes);

end.
