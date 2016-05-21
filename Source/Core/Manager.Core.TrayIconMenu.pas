unit Manager.Core.TrayIconMenu;

interface

uses Classes, SysUtils, Forms, InstantPresentation, InstantPersistence,
  Manager.Core.IDE, BarraFerramenta, Acao, Manager.Core.Workspace.Action,
  Vcl.Menus, Manager.Core.IDE.Menu;

type
  TTrayIconMenu = class(TIDEMenu)
  private
    procedure CarregarItens(const ADataset: TInstantSelector;
      const ACaption: string; const AImageIndex: integer);
  protected
    procedure PrepararConjuntoDeBases(const ACaption: string; const AImageIndex: integer); override;
    procedure PrepararCatalogoDeBases(const ACaption: string; const AImageIndex: integer); override;
    procedure PrepararBarraFerramenta; override;
    procedure PrepararBarraBasica; override;
    procedure OnFecharClick(Sender: TObject);
  end;

implementation

{ TTrayIconMenu }

uses udtmDatabase, AcaoCatalogoDeBases, Manager.Core.IDE.ActionList;

procedure TTrayIconMenu.PrepararConjuntoDeBases(const ACaption: string; const AImageIndex: integer);
begin
  CarregarItens(FConjuntoDeBases, ACaption, AImageIndex);
end;

procedure TTrayIconMenu.CarregarItens(const ADataset: TInstantSelector; const ACaption: string; const AImageIndex: integer);
var
  I: integer;
  item: TMenuItem;
  itemBase: TMenuItem;
  acao: TAcao;
  action: TWorkspaceAction;
begin
  itemBase := Application.Main.TrayIcon.PopupMenu.Items.Find(ACaption);
  if not Assigned(itemBase) then
  begin
    itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
    itemBase.Caption := ACaption;
    itemBase.ImageIndex := AImageIndex;
    Application.Main.TrayIcon.PopupMenu.Items.Add(itemBase);

    item := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
    item.Caption := '-';
    Application.Main.TrayIcon.PopupMenu.Items.Add(item);
  end;

  for I := 0 to Pred(ADataset.ObjectCount) do
  begin
    action := Application.Main.ActionList.GetInternalAction(TAcao(ADataset.Objects[I]).Id);
    if not Assigned(action) then
    begin
      acao := BuscarAcao(ADataset.Objects[I] as TAcao);

      action := Application.Main.ActionList.Add;
      action.Acao := acao;
    end
    else
    begin
      action.Refresh;
    end;

    if not Assigned(itemBase.Find(action.Acao.Descricao)) then
    begin
      item := TMenuItem.Create(itemBase);
      item.Action := action;
      itemBase.Add(item);
    end;
  end;
end;

procedure TTrayIconMenu.PrepararCatalogoDeBases(const ACaption: string; const AImageIndex: integer);
begin
  CarregarItens(FCatalogoDeBases, ACaption, AImageIndex);
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
  itemBase := Application.Main.TrayIcon.PopupMenu.Items.Find('Fechar');
  if not Assigned(itemBase) then
  begin
    itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
    itemBase.Caption := 'Fechar';
    itemBase.ImageIndex := 38;
    itemBase.OnClick := OnFecharClick;
    Application.Main.TrayIcon.PopupMenu.Items.Insert(0, itemBase);

    itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
    itemBase.Caption := '-';
    Application.Main.TrayIcon.PopupMenu.Items.Insert(0, itemBase);
  end;
end;

procedure TTrayIconMenu.PrepararBarraFerramenta;
var
  I: integer;
  Y: integer;
  item: TMenuItem;
  itemBase: TMenuItem;
  acao: TAcao;
  barra: TBarraFerramenta;
  action: TWorkspaceAction;
begin
  for I := 0 to Pred(FBarraFerramenta.ObjectCount) do
  begin
    barra := TBarraFerramenta(FBarraFerramenta.Objects[I]);

    itemBase := Application.Main.TrayIcon.PopupMenu.Items.Find(barra.Descricao);
    if not Assigned(itemBase) then
    begin
      itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
      itemBase.Caption := barra.Descricao;
      itemBase.ImageIndex := 17;
      Application.Main.TrayIcon.PopupMenu.Items.Add(itemBase);
    end;

    for Y := 0 to barra.AcaoCount -1 do
    begin
      acao := barra.Acoes[Y];
      if acao.InheritsFrom(TAcaoCatalogoDeBases) then
        Continue;

      action := Application.Main.ActionList.GetInternalAction(acao.Id);
      if not Assigned(action) then
      begin
        acao := BuscarAcao(acao as TAcao);

        action := Application.Main.ActionList.Add;
        action.Acao := acao;
      end
      else
      begin
        action.Refresh;
      end;

      if not Assigned(itemBase.Find(action.Acao.Descricao)) then
      begin
        item := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
        item.Action := action;
        itemBase.Add(item);
      end;
    end;
  end;
  if Application.Main.TrayIcon.PopupMenu.Items.IndexOf(itemBase) > 0 then
  begin
    itemBase := TMenuItem.Create(Application.Main.TrayIcon.PopupMenu);
    itemBase.Caption := '-';
    Application.Main.TrayIcon.PopupMenu.Items.Insert(0, itemBase);
  end;
end;

end.
