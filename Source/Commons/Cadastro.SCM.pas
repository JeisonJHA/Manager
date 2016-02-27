unit Cadastro.SCM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Modelo, Data.DB,
  System.Actions, Vcl.ActnList, InstantPresentation, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, FileCtrl;

type
  TfrmCadastroSCM = class(TfrmCadastroModelo)
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    btnSubscrever: TButton;
    btnAdicionar: TButton;
    btnExcluir: TButton;
    btnExcluirInvalidos: TButton;
    lstPath: TListBox;
    btnDiretorio: TSpeedButton;
    edtPath: TEdit;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSubscreverClick(Sender: TObject);
    procedure actConfirmarUpdate(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure btnDiretorioClick(Sender: TObject);
    procedure lstPathClick(Sender: TObject);
    procedure btnExcluirInvalidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Configurar(const APath: string): string;
    class function Pegar: string;
    class function Guardar(const APath: string): string;
  end;

var
  frmCadastroSCM: TfrmCadastroSCM;

implementation

{$R *.dfm}

uses Workspace.Config;

{ TfrmCadastroSCM }

procedure TfrmCadastroSCM.actCancelarExecute(Sender: TObject);
begin
  Exit;
end;

procedure TfrmCadastroSCM.actConfirmarExecute(Sender: TObject);
begin
  Exit;
end;

procedure TfrmCadastroSCM.actConfirmarUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (lstPath.Count > 0);
end;

procedure TfrmCadastroSCM.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  lstPath.Items.Append(edtPath.Text);
  edtPath.Clear;
end;

procedure TfrmCadastroSCM.btnDiretorioClick(Sender: TObject);
var
  options : TSelectDirOpts;
  chosenDirectory : string;
begin
  if SelectDirectory(chosenDirectory, options, 0) then
    edtPath.Text := chosenDirectory;
end;

procedure TfrmCadastroSCM.btnExcluirClick(Sender: TObject);
begin
  inherited;
  lstPath.Items.Delete(lstPath.ItemIndex);
end;

procedure TfrmCadastroSCM.btnExcluirInvalidosClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := lstPath.Items.Count -1 downto 0 do
    if not DirectoryExists(lstPath.Items.Strings[I]) then
      lstPath.Items.Delete(I);
end;

procedure TfrmCadastroSCM.btnSubscreverClick(Sender: TObject);
begin
  inherited;
  lstPath.Items.Strings[lstPath.ItemIndex] := edtPath.Text;
  edtPath.Clear;
end;

class function TfrmCadastroSCM.Configurar(const APath: string): string;
var
  form: TfrmCadastroSCM;
begin
  form := TfrmCadastroSCM.Create(nil);
  try
    form.lstPath.Items.StrictDelimiter := True;
    form.lstPath.Items.Delimiter := ';';
    form.lstPath.Items.DelimitedText := APath;

    if (form.ShowModal = mrOk) then
      TfrmCadastroSCM.Guardar(StringReplace(form.lstPath.Items.CommaText, ',', ';', [rfReplaceAll]));

    Exit(TfrmCadastroSCM.Pegar);
  finally
    FreeAndNil(form);
  end;
end;

class function TfrmCadastroSCM.Guardar(const APath: string): string;
var
  config: TWorkspaceConfig;
begin
  config := TWorkspaceConfig.Create(nil);
  try
    config.Diretorio := APath;
  finally
    FreeAndNil(config);
  end;
end;

procedure TfrmCadastroSCM.lstPathClick(Sender: TObject);
begin
  inherited;
  if lstPath.ItemIndex > -1 then
    edtPath.Text := lstPath.Items.Strings[lstPath.ItemIndex];
end;

class function TfrmCadastroSCM.Pegar: string;
var
  config: TWorkspaceConfig;
begin
  config := TWorkspaceConfig.Create(nil);
  try
    Exit(config.Diretorio);
  finally
    FreeAndNil(config);
  end;
end;

end.
