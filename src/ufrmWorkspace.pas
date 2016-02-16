unit ufrmWorkspace;

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
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSandbox: TWorkspace;
    procedure CarregarAmbientes;
    procedure CarregarAplicativos;
    procedure OnExecutarAmbienteClick(Sender: TObject);
    function Parser(const ATexto: string): string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ASandbox: TWorkspace); overload;
  end;

var
  frmWorkspace: TfrmWorkspace;

implementation

{$R *.dfm}

uses uspmDados, ZDataset, Workspace.Action, Winapi.ShellApi,
  Workspace.Constantes;

function TfrmWorkspace.Parser(const ATexto: string): string;
begin
  Exit(StringReplace(ATexto, '{WS_DIR}', FSandbox.Diretorio, [rfReplaceAll]));
end;

procedure TfrmWorkspace.OnExecutarAmbienteClick(Sender: TObject);
var
  handle: THandle;
begin
  try
    case TWorkspaceAction(Sender).Tipo of
      actCopy:
        begin
          CopyFile(PChar(''), PChar(''), true)
        end;
      actExecute:
        begin
          ShellExecute(handle, nil,
            PChar(Parser(TWorkspaceAction(Sender).Executavel)),
            PChar(TWorkspaceAction(Sender).Parametros), '', SW_SHOWNORMAL);
        end;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TfrmWorkspace.CarregarAmbientes;
var
  Qry: TZQuery;
  BIL: TdxBarItemLink;
begin
  Qry := TZQuery.Create(nil);
  try
    Qry.Connection := dmDados.dmConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT A.* FROM CADAMBIENTE A');
    Qry.Open;

    Qry.First;
    while not Qry.Eof do
    begin
      BIL := btnMontarAmbiente.ItemLinks.Add;
      BIL.Item := TdxBarButton.Create(dxBarManager1);
      BIL.Item.OnClick := OnExecutarAmbienteClick;
      BIL.Item.Tag := Qry.FieldByName('CDAMBIENTE').AsInteger;
      BIL.Item.Caption := Qry.FieldByName('DEAMBIENTE').AsString;
      BIL.Item.ImageIndex := 8;
      BIL.Item.Category := dxBarManager1.Categories.IndexOf('Default');

      Qry.Next;
    end;

  finally
    FreeAndNil(Qry);
  end;
end;

procedure TfrmWorkspace.CarregarAplicativos;
var
  Qry: TZQuery;
  BIL: TdxBarItemLink;
  Action: TWorkspaceAction;
begin
  Qry := TZQuery.Create(nil);
  try
    Qry.Connection := dmDados.dmConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add
      ('SELECT AP.* FROM CADAPLICACOES AP WHERE FLWORKSPACE = :FLWORKSPACE');
    Qry.ParamByName('FLWORKSPACE').AsString := 'S';
    Qry.Open;

    Qry.First;
    while not Qry.Eof do
    begin
      Action := TWorkspaceAction.Create(ActionList1);
      Action.OnExecute := OnExecutarAmbienteClick;
      Action.Tag := Qry.FieldByName('CDAPLICACOES').AsInteger;
      Action.Caption := Qry.FieldByName('DEAPLICACOES').AsString;
      Action.Executavel := Qry.FieldByName('DEEXECUTAVEL').AsString;
      Action.Parametros := Qry.FieldByName('DEPARAMETROS').AsString;
      Action.Tipo := TTipoAcao(Qry.FieldByName('CDACAO').AsInteger);
      Action.ImageIndex := 11;

      BIL := btnExecutarApp.ItemLinks.Add;
      BIL.Item := TdxBarButton.Create(dxBarManager1);
      BIL.Item.Action := Action;
      BIL.Item.Category := dxBarManager1.Categories.IndexOf('Default');

      Qry.Next;
    end;

  finally
    FreeAndNil(Qry);
  end;
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

procedure TfrmWorkspace.FormShow(Sender: TObject);
begin
  CarregarAmbientes;
  CarregarAplicativos;
end;

end.
