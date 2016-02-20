unit IDE.Controller.MainMenu;

interface

uses Classes, SysUtils, dxRibbon, dxBar, InstantPresentation, Vcl.ActnList;

type
  TIDEControllerMainMenu = class(TPersistent)
  private
    FRibbon: TdxRibbon;
    FBarManager: TdxBarManager;
    FActionList: TActionList;
  public
    constructor Create(ARibbon: TdxRibbon; ABarManager: TdxBarManager; AActionList: TActionList);
    procedure CarregarBarrasFerramentas(ATab: TdxRibbonTab);
  end;

implementation

uses BarraFerramenta, Acao, udtmDatabase, Workspace.Action;

{ TIDEControllerMainMenu }

procedure TIDEControllerMainMenu.CarregarBarrasFerramentas(ATab: TdxRibbonTab);
var
  I: Integer;
  II: Integer;
  barra: TBarraFerramenta;
  acao: TAcao;
  group: TdxRibbonTabGroup;
  bar: TdxBar;
  link: TdxBarItemLink;
  action: TWorkspaceAction;
begin
  with TInstantSelector.Create(nil) do
  try
    Connector := dtmDatabase.InstantIBXConnector1;
    Command.Text := 'SELECT * FROM TBarraFerramenta';
    Open;
    for I := 0 to Pred(ObjectCount) do
    begin
      barra := Objects[I] as TBarraFerramenta;

      { Cria a barra de ferramentas }
      bar := FBarManager.Bars.Add;
      bar.Caption := barra.Descricao;
      bar.IsMainMenu := True;
      bar.Visible := True;
      bar.DockingStyle := dsTop;

      { Cria o grupo para a barra de ferramenta }
      group := ATab.Groups.Add;
      group.Caption := barra.Descricao;
      group.ToolBar := bar;

      for II := 0 to barra.AcoesCount -1 do
      begin
        acao := barra.Acao[II];

        if acao.InheritsFrom(TAcaoExecutar) then
        begin
          action := TWorkspaceActionExecute.Create(FActionList);
          TWorkspaceActionExecute(action).Executavel := TAcaoExecutar(acao).Aplicativo;
          TWorkspaceActionExecute(action).Parametros := TAcaoExecutar(acao).Parametros;
        end
        else
        if acao.InheritsFrom(TAcaoCopiar) then
        begin
          action := TWorkspaceActionCopy.Create(FActionList);
          TWorkspaceActionCopy(action).Origem := TAcaoCopiar(acao).Origem;
          TWorkspaceActionCopy(action).Destino := TAcaoCopiar(acao).Destino;
        end
        else
        begin
          action := TWorkspaceAction.Create(FActionList);
        end;

        action.Category := barra.Descricao;
        action.Caption := acao.Descricao;
        action.ImageIndex := acao.Icone;

        link := bar.ItemLinks.Add;
        link.Item := TdxBarLargeButton.Create(FBarManager);
        link.Item.Action := action;
        link.Item.Category := FBarManager.Categories.IndexOf('Default');
      end;
    end;
  finally
    Free;
  end;
end;


constructor TIDEControllerMainMenu.Create(ARibbon: TdxRibbon; ABarManager: TdxBarManager; AActionList: TActionList);
begin
  FRibbon := ARibbon;
  FBarManager := ABarManager;
  FActionList := AActionList;
end;

end.
