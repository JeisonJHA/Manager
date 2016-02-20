unit IDE.Workspace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvPageList,
  JvNavigationPane, JvComponentBase, dxSkinsCore, dxSkinsdxBarPainter,
  cxClasses, dxBar, Data.DB, dxBarExtDBItems, Vcl.ActnList, Workspace,
  System.Actions;

type
  TfrmWorkspace = class(TForm)
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
  private
    { Private declarations }
    FSandbox: TWorkspace;
    function Parser(const ATexto: string): string;
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

function TfrmWorkspace.Parser(const ATexto: string): string;
begin
  Exit(StringReplace(ATexto, '{WS_DIR}', FSandbox.Diretorio, [rfReplaceAll]));
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

end.
