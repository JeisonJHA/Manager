unit IDE.Aplicacao;

interface

uses Classes, SysUtils, Forms, IDE.Controller.Parser, IDE.IWorkspace, dxTabbedMDI;

type
  TIDEAplicacao = class helper for TApplication
  private
    function GetCurrentWorkspace: IWorkspace;
  public
    function Parser: TIDEControllerParser;
    procedure TabbedMDIManager(ATabbedMDIManager: TdxTabbedMDIManager);
    property CurrentWorkspace: IWorkspace read GetCurrentWorkspace;
  end;

implementation

type
  TAplicacao = class(TObject)
  private
    FParser: TIDEControllerParser;
    FTabbedMDIManager: TdxTabbedMDIManager;
    function GetCurrentWorkspace: IWorkspace;
  public
    constructor Create;
    destructor Destroy; override;
  published
    function Parser: TIDEControllerParser;
    procedure TabbedMDIManager(ATabbedMDIManager: TdxTabbedMDIManager);
    property CurrentWorkspace: IWorkspace read GetCurrentWorkspace;
  end;

var
  _aplicacao: TAplicacao;

{ TAplicacao }

constructor TAplicacao.Create;
begin
  FParser := TIDEControllerParser.Create;
end;

destructor TAplicacao.Destroy;
begin
  FreeAndNil(FParser);
  inherited;
end;

function TAplicacao.GetCurrentWorkspace: IWorkspace;
var
  I: Integer;
  workspace: IWorkspace;
  form: TForm;
begin
  if not Assigned(FTabbedMDIManager) then
    Exit(nil);

  if not Assigned(FTabbedMDIManager.TabProperties.ActivePage) then
    Exit(nil);

  form := FTabbedMDIManager.TabProperties.ActivePage.MDIChild;
  form.GetInterface(IWorkspace, workspace);
  if Assigned(workspace) then
    Exit(workspace);

  Exit(nil);
end;

function TAplicacao.Parser: TIDEControllerParser;
begin
  Exit(_aplicacao.FParser);
end;

procedure TAplicacao.TabbedMDIManager(ATabbedMDIManager: TdxTabbedMDIManager);
begin
  FTabbedMDIManager := ATabbedMDIManager;
end;

{ TIDEAplicacao }

function TIDEAplicacao.GetCurrentWorkspace: IWorkspace;
begin
  if not Assigned(_aplicacao.CurrentWorkspace) then
    Exit(nil);
  Exit(_aplicacao.CurrentWorkspace);
end;

function TIDEAplicacao.Parser: TIDEControllerParser;
begin
  Exit(_aplicacao.Parser);
end;

procedure TIDEAplicacao.TabbedMDIManager(ATabbedMDIManager: TdxTabbedMDIManager);
begin
  _aplicacao.TabbedMDIManager(ATabbedMDIManager);
end;

initialization
  _aplicacao := TAplicacao.Create;

finalization
  FreeAndNil(_aplicacao);

end.
