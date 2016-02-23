unit IDE.Aplicacao;

interface

uses Classes, SysUtils, Forms, IDE.Controller.Parser, IDE.IWorkspace, dxTabbedMDI,
  DosCommand, ActiveX, adshlp, ActiveDs_Tlb, System.Win.ComObj;

type
  TIDEAplicacao = class helper for TApplication
  private
    function GetCurrentWorkspace: IWorkspace;
    function GetPromptCommand: TDosCommand;
  public
    function Parser: TIDEControllerParser;
    procedure TabbedMDIManager(ATabbedMDIManager: TdxTabbedMDIManager);
    function Login(const AUsuario: string; const ASenha: string; ADominio: string): boolean;
    property CurrentWorkspace: IWorkspace read GetCurrentWorkspace;
    property PromptCommand: TDosCommand read GetPromptCommand;
  end;

  procedure Console(ATexto: string);

implementation

procedure Console(ATexto: string);
begin
  Application.PromptCommand.OutputLines.Add(Format('%s %s',[FormatDateTime('[dd/MM/yyyy hh:mm:ss]', Date+Time),ATexto]));
end;

type
  TAplicacao = class(TObject)
  private
    FParser: TIDEControllerParser;
    FTabbedMDIManager: TdxTabbedMDIManager;
    FPromptCommand: TDosCommand;
    FadObject: IADs;
    function GetCurrentWorkspace: IWorkspace;
  public
    constructor Create;
    destructor Destroy; override;
    function Login(const AUsuario: string; const ASenha: string; ADominio: string): boolean;
  published
    function Parser: TIDEControllerParser;
    procedure TabbedMDIManager(ATabbedMDIManager: TdxTabbedMDIManager);
    property CurrentWorkspace: IWorkspace read GetCurrentWorkspace;
    property PromptCommand: TDosCommand read FPromptCommand;
  end;

var
  _aplicacao: TAplicacao;

{ TAplicacao }

constructor TAplicacao.Create;
begin
  FParser := TIDEControllerParser.Create;
  FPromptCommand := TDosCommand.Create(nil);
end;

destructor TAplicacao.Destroy;
begin
  FreeAndNil(FPromptCommand);
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

function TAplicacao.Login(const AUsuario, ASenha: string;
  ADominio: string): boolean;
begin
  ///Inicialização do COM
  CoInitialize(nil);
  try
    ADsOpenObject(Format('LDAP://%s',[ADominio]), LowerCase(AUsuario), ASenha, ADS_SECURE_AUTHENTICATION, IADs, FadObject);
    Exit(True);
  except
    on e: EOleException do
    begin
      if Pos('Falha de logon', e.Message) > 0 then
        raise Exception.Create('Login inválido!');
      raise Exception.Create(e.Message);
    end;
  end;
  CoUninitialize;
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

function TIDEAplicacao.GetPromptCommand: TDosCommand;
begin
  Exit(_aplicacao.PromptCommand);
end;

function TIDEAplicacao.Login(const AUsuario, ASenha: string;
  ADominio: string): boolean;
begin
  Exit(_aplicacao.Login(AUsuario, ASenha, ADominio));
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
