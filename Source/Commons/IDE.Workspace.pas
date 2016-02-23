unit IDE.Workspace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvPageList,
  JvNavigationPane, JvComponentBase, dxSkinsCore, dxSkinsdxBarPainter,
  cxClasses, dxBar, Data.DB, dxBarExtDBItems, Vcl.ActnList, Workspace,
  System.Actions, IDE.IWorkspace, Vcl.ExtCtrls;

type
  TfrmWorkspace = class(TForm, IWorkspace)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    btnSpSQL: TdxBarButton;
    dxBarLookupCombo1: TdxBarLookupCombo;
    DataSource1: TDataSource;
    barAmbiente: TdxBar;
    btnMontarAmbiente: TdxBarSubItem;
    btnExecutarApp: TdxBarSubItem;
    ActionList1: TActionList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FSandbox: TWorkspace;
    function Parser(const ATexto: string): string;
    function Sandbox: TWorkspace;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ASandbox: TWorkspace); overload;
  end;

var
  frmWorkspace: TfrmWorkspace;

implementation

{$R *.dfm}

uses udtmDatabase, Workspace.Action, Winapi.ShellApi,
  Workspace.Constantes;

type
  TSandboxesRecentes = class(TStringList)
  private
    FArquivo: string;
  public
    constructor Create;
    procedure Salvar();
  end;

function TfrmWorkspace.Parser(const ATexto: string): string;
begin
  Exit(StringReplace(ATexto, '{WS_DIR}', FSandbox.Diretorio, [rfReplaceAll]));
end;

function TfrmWorkspace.Sandbox: TWorkspace;
begin
  Exit(FSandbox);
end;

constructor TfrmWorkspace.Create(AOwner: TComponent; ASandbox: TWorkspace);
begin
  inherited Create(AOwner);
  FSandbox := ASandbox;
  Caption := ASandbox.Descricao;
end;

procedure TfrmWorkspace.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWorkspace.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sandboxes: TSandboxesRecentes;
begin
  sandboxes := TSandboxesRecentes.Create;
  try
    sandboxes.Delete(sandboxes.IndexOf(Sandbox.Descricao));
    sandboxes.Salvar;
  finally
    FreeAndNil(sandboxes);
  end;
end;

procedure TfrmWorkspace.FormShow(Sender: TObject);
var
  sandboxes: TSandboxesRecentes;
begin
  sandboxes := TSandboxesRecentes.Create;
  try
    sandboxes.Add(Sandbox.Descricao);
    sandboxes.Salvar;
  finally
    FreeAndNil(sandboxes);
  end;
end;

{ TSandboxesRecentes }

constructor TSandboxesRecentes.Create;
begin
  inherited;
  FArquivo := ExtractFilePath(Application.ExeName) + 'sandbox.list';
  if FileExists(FArquivo) then
    LoadFromFile(FArquivo);
end;

procedure TSandboxesRecentes.Salvar;
begin
  SaveToFile(FArquivo);
end;

end.
