unit Manager.Core.TrayIconMenu;

interface

uses Classes, SysUtils, Forms, InstantPresentation, InstantPersistence,
  Manager.Core.IDE, BarraFerramenta, Acao, Manager.Core.Workspace.Action,
  Vcl.Menus, Manager.Core.IDE.Menu;

type
  TTrayIconMenu = class(TIDEMenu)
  protected
    procedure PrepararConjuntoDeBases(const ACaption: string; const AImageIndex: integer); override;
    procedure PrepararCatalogoDeBases(const ACaption: string; const AImageIndex: integer); override;
    procedure PrepararBarraFerramenta; override;
    procedure PrepararBarraBasica; override;

    procedure OnFecharClick(Sender: TObject);
  public
    procedure Load; override;
  end;

implementation

{ TTrayIconMenu }

uses udtmDatabase, AcaoCatalogoDeBases;

procedure TTrayIconMenu.PrepararConjuntoDeBases(const ACaption: string; const AImageIndex: integer);
var
  I: integer;
  item: TMenuItem;
  itemBase: TMenuItem;
  acao: TAcao;
  action: TWorkspaceAction;
begin
  itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
  itemBase.Caption := ACaption;
  itemBase.ImageIndex := AImageIndex;
  Application.Main.TrayIcon.PopupMenu.Items.Insert(0, itemBase);

  item := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
  item.Caption := '-';
  Application.Main.TrayIcon.PopupMenu.Items.Insert(0, item);

  for I := 0 to Pred(FConjuntoDeBases.ObjectCount) do
  begin
    acao := BuscarAcao(FConjuntoDeBases.Objects[I] as TAcao);

    action := TWorkspaceAction.Create(Application.Main.ActionList);
    action.Acao := acao;
    action.Caption := acao.Descricao;
    action.ImageIndex := acao.Icone;

    item := TMenuItem.Create(itemBase);
    item.Action := action;
    item.Caption := acao.Descricao;
    itemBase.Insert(0, item);
  end;
end;

procedure TTrayIconMenu.PrepararCatalogoDeBases(const ACaption: string; const AImageIndex: integer);
var
  I: integer;
  item: TMenuItem;
  itemBase: TMenuItem;
  acao: TAcao;
  action: TWorkspaceAction;
begin
  FCatalogoDeBases.Refresh;
  itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
  itemBase.Caption := ACaption;
  itemBase.ImageIndex := AImageIndex;
  Application.Main.TrayIcon.PopupMenu.Items.Insert(0, itemBase);

  item := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
  item.Caption := '-';
  Application.Main.TrayIcon.PopupMenu.Items.Insert(0, item);

  for I := 0 to Pred(FCatalogoDeBases.ObjectCount) do
  begin
    acao := BuscarAcao(FCatalogoDeBases.Objects[I] as TAcao);

    action := TWorkspaceAction.Create(Application.Main.ActionList);
    action.Acao := acao;
    action.Caption := acao.Descricao;
    action.ImageIndex := acao.Icone;

    item := TMenuItem.Create(itemBase);
    item.Action := action;
    item.Caption := acao.Descricao;
    itemBase.Insert(0, item);
  end;
end;

procedure TTrayIconMenu.OnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TTrayIconMenu.PrepararBarraBasica;
var
  itemBase: TMenuItem;
begin
  inherited;
  itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
  itemBase.Caption := 'Fechar';
  itemBase.ImageIndex := 38;
  itemBase.OnClick := OnFecharClick;
  Application.Main.TrayIcon.PopupMenu.Items.Insert(0, itemBase);

  itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
  itemBase.Caption := '-';
  Application.Main.TrayIcon.PopupMenu.Items.Insert(0, itemBase);
end;

procedure TTrayIconMenu.PrepararBarraFerramenta;
var
  I: integer;
  Y: integer;
  item: TMenuItem;
  itemBase: TMenuItem;
  acao: TAcao;
  action: TWorkspaceAction;
begin
  for I := 0 to Pred(FBarraFerramenta.ObjectCount) do
  begin
    itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
    itemBase.Caption := TBarraFerramenta(FBarraFerramenta.Objects[I]).Descricao;
    itemBase.ImageIndex := 17;
    Application.Main.TrayIcon.PopupMenu.Items.Insert(0, itemBase);

    for Y := 0 to TBarraFerramenta(FBarraFerramenta.Objects[I]).AcaoCount -1 do
    begin
      if TBarraFerramenta(FBarraFerramenta.Objects[I]).Acoes[Y].InheritsFrom(TAcaoCatalogoDeBases) then
        Continue;

      acao := BuscarAcao(TBarraFerramenta(FBarraFerramenta.Objects[I]).Acoes[Y] as TAcao);

      action := TWorkspaceAction.Create(Application.Main.ActionList);
      action.Acao := acao;
      action.Caption := acao.Descricao;
      action.ImageIndex := acao.Icone;

      item := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
      item.Action := action;
      item.Caption := acao.Descricao;
      itemBase.Insert(0, item);
    end;
  end;
  if Application.Main.TrayIcon.PopupMenu.Items.IndexOf(itemBase) > 0 then
  begin
    itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
    itemBase.Caption := '-';
    Application.Main.TrayIcon.PopupMenu.Items.Insert(0, itemBase);
  end;
end;

procedure TTrayIconMenu.Load;
begin
  Application.Main.TrayIcon.PopupMenu.Items.Clear;
  inherited Load;
end;

end.
