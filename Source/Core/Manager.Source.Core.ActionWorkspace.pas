unit Manager.Source.Core.ActionWorkspace;

interface

uses
  Classes, SysUtils, Vcl.ActnList, Winapi.ShellApi,
  Winapi.Windows, Forms, Acao, BarraFerramenta, dxBar,
  Manager.Source.Components.Action;

type
  TWorkspaceAction = class(TManagerAction)
  private
    FAcao: TAcao;
    FBarraFerramenta: TBarraFerramenta;
    FLink: TdxBarItemLink;
    procedure InternalOnExecute(Sender: TObject);
    procedure InternalOnUpdate(Sender: TObject);
    procedure SetAcao(const Value: TAcao);
    procedure SetBarraFerramenta(const Value: TBarraFerramenta);
    procedure RefreshAcao(const AAcao: TAcao);
    procedure RefreshBarraFerramenta(const ABarraFerramenta: TBarraFerramenta);
    procedure SetLink(const Value: TdxBarItemLink);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Acao: TAcao read FAcao write SetAcao;
    property BarraFerramenta: TBarraFerramenta read FBarraFerramenta write SetBarraFerramenta;
    property Link: TdxBarItemLink read FLink write SetLink;
    procedure Refresh;
  end;

  TWorkspaceActionExecute = class(TWorkspaceAction);

  TWorkspaceActionCopy = class(TWorkspaceAction);

implementation

{ TWorkspaceAction }

uses Manager.Source.Consts, Manager.Source.Core.IDE.Consts,
  Manager.Source.Core.AplicationHelper;

constructor TWorkspaceAction.Create(AOwner: TComponent);
begin
  inherited;
  OnExecute := InternalOnExecute;
  OnUpdate := InternalOnUpdate;
end;

destructor TWorkspaceAction.Destroy;
begin
  if Assigned(FAcao) then
    FreeAndNil(FAcao);
  inherited;
end;

procedure TWorkspaceAction.InternalOnExecute(Sender: TObject);
begin
  try
    Acao.Executar;
  except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

procedure TWorkspaceAction.InternalOnUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(Application.IDE.CurrentWorkspace);
end;

procedure TWorkspaceAction.Refresh;
begin
  if Assigned(Acao) then
    RefreshAcao(Acao);

  if Assigned(BarraFerramenta) then
    RefreshBarraFerramenta(BarraFerramenta);
end;

procedure TWorkspaceAction.RefreshAcao(const AAcao: TAcao);
begin
  AAcao.Refresh;
  Caption := AAcao.Descricao;
  ImageIndex := AAcao.Icone;
end;

procedure TWorkspaceAction.RefreshBarraFerramenta(const ABarraFerramenta: TBarraFerramenta);
begin
  ABarraFerramenta.Refresh;
  Category := ABarraFerramenta.Descricao;
end;

procedure TWorkspaceAction.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
  RefreshAcao(Acao);
end;

procedure TWorkspaceAction.SetBarraFerramenta(const Value: TBarraFerramenta);
begin
  FBarraFerramenta := Value;
  RefreshBarraFerramenta(Value);
end;

procedure TWorkspaceAction.SetLink(const Value: TdxBarItemLink);
begin
  FLink := Value;
end;

end.
