unit Configuracao.Inicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGraphics, cxLookAndFeelPainters, cxLookAndFeels,
  dxCustomWizardControl, dxWizardControl, dxWizardControlForm, dxSkinsCore,
  Vcl.StdCtrls, FileCtrl, Manager.Core.Configuration;

type
  TfrmConfiguracaoInicial = class(TdxWizardControlForm)
    dxWizardControl1: TdxWizardControl;
    dxWizardControlPage1: TdxWizardControlPage;
    btnCodigoFonte: TButton;
    edtCodigoFonte: TEdit;
    dxWizardControlPage3: TdxWizardControlPage;
    lstArqINI: TListBox;
    btnAdicionarArqINI: TButton;
    btnExcluirArqINI: TButton;
    edtArqINI: TEdit;
    dxWizardControlPage4: TdxWizardControlPage;
    OpenDialog1: TOpenDialog;
    edtAppDBM: TEdit;
    btnAppDBM: TButton;
    procedure btnCodigoFonteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarArqINIClick(Sender: TObject);
    procedure btnExcluirArqINIClick(Sender: TObject);
    procedure lstArqINIClick(Sender: TObject);
    procedure btnAppDBMClick(Sender: TObject);
    procedure dxWizardControl1ButtonClick(Sender: TObject;
      AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FConfig: TConfiguration;
    procedure Finalizar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracaoInicial: TfrmConfiguracaoInicial;

implementation

{$R *.dfm}

procedure TfrmConfiguracaoInicial.btnAdicionarArqINIClick(Sender: TObject);
begin
  lstArqINI.Items.Append(edtArqINI.Text);
  edtArqINI.Clear;
end;

procedure TfrmConfiguracaoInicial.btnAppDBMClick(Sender: TObject);
begin
  OpenDialog1.Execute();
  if not String(OpenDialog1.FileName).IsEmpty then
    edtAppDBM.Text := OpenDialog1.FileName;
end;

procedure TfrmConfiguracaoInicial.btnCodigoFonteClick(Sender: TObject);
var
  options : TSelectDirOpts;
  chosenDirectory : string;
begin
  if SelectDirectory(chosenDirectory, options, 0) then
    edtCodigoFonte.Text := chosenDirectory;
end;

procedure TfrmConfiguracaoInicial.btnExcluirArqINIClick(Sender: TObject);
begin
  lstArqINI.Items.Delete(lstArqINI.ItemIndex);
end;

procedure TfrmConfiguracaoInicial.dxWizardControl1ButtonClick(Sender: TObject;
  AKind: TdxWizardControlButtonKind; var AHandled: Boolean);
begin
  case AKind of
    wcbkBack: ;
    wcbkNext: ;
    wcbkCancel: ;
    wcbkHelp: ;
    wcbkFinish: Finalizar;
  end;
end;

procedure TfrmConfiguracaoInicial.Finalizar;
var
  ini: string;
begin
  lstArqINI.Items.Delimiter := ';';
  ini := StringReplace(lstArqINI.Items.CommaText, ',', ';', [rfReplaceAll]);
  FConfig.Sandbox.ArquivosIni := ini;
  FConfig.SpSQL := edtAppDBM.Text;
  FConfig.Diretorio := edtCodigoFonte.Text;
  FConfig.PrimeiraExecucao := False;
  Self.Close;
end;

procedure TfrmConfiguracaoInicial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FConfig);
end;

procedure TfrmConfiguracaoInicial.FormCreate(Sender: TObject);
begin
  FConfig := TConfiguration.Create(nil);
  lstArqINI.Items.Add('{WS_DIR}bin\spCfg.ini');
  lstArqINI.Items.Add('{WS_DIR}bin\pro\spCfg.ini');
  lstArqINI.Items.Add('{WS_DIR}bin\sgc\spCfg.ini');
end;

procedure TfrmConfiguracaoInicial.lstArqINIClick(Sender: TObject);
begin
  if lstArqINI.ItemIndex > -1 then
    edtArqINI.Text := lstArqINI.Items.Strings[lstArqINI.ItemIndex];
end;

end.
