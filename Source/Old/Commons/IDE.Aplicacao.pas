unit IDE.Aplicacao;

interface

uses Classes, SysUtils, Forms, Manager.Core.Parser.Manager, IDE.IWorkspace, dxTabbedMDI,
  DosCommand, ActiveX, adshlp, ActiveDs_Tlb, System.Win.ComObj, Manager.Core.Configuration,
  Manager.Core.IDE.Prepare;

type
  TIDEAplicacao = class helper for TApplication
  private
    function GetCurrentWorkspace: IWorkspace;
    function GetPromptCommand: TDosCommand;
    function GetConfiguracoes: TConfiguration;
  public
    procedure Inicializar;
    function Parser: TParserManager;
    function Inicializador: TIDEPrepare;
    procedure TabbedMDIManager(ATabbedMDIManager: TdxTabbedMDIManager);
    function Login(const AUsuario: string; const ASenha: string; ADominio: string): boolean;
    property CurrentWorkspace: IWorkspace read GetCurrentWorkspace;
    property PromptCommand: TDosCommand read GetPromptCommand;
    property Configuracoes: TConfiguration read GetConfiguracoes;
  end;

  procedure Console(ATexto: string);

implementation

uses Formulario.Workspace, Workspace, Configuracao.Inicial;

procedure Console(ATexto: string);
begin
  Application.PromptCommand.OutputLines.Add(Format('%s %s',[FormatDateTime('[dd/MM/yyyy hh:mm:ss]', Date+Time),ATexto]));
end;

type
  TAplicacao = class(TObject)
  private
    FInicializador: TIDEPrepare;
    FParser: TParserManager;
    FTabbedMDIManager: TdxTabbedMDIManager;
    FPromptCommand: TDosCommand;
    FadObject: IADs;
    FConfiguracoes: TConfiguration;
    function GetCurrentWorkspace: IWorkspace;
  public
    constructor Create;
    destructor Destroy; override;
    function Login(const AUsuario: string; const ASenha: string; ADominio: string): boolean;
  published
    function Parser: TParserManager;
    function Inicializador: TIDEPrepare;
    procedure TabbedMDIManager(ATabbedMDIManager: TdxTabbedMDIManager);
    property CurrentWorkspace: IWorkspace read GetCurrentWorkspace;
    property PromptCommand: TDosCommand read FPromptCommand;
    property Configuracoes: TConfiguration read FConfiguracoes;
  end;

var
  _aplicacao: TAplicacao;

{ TAplicacao }

constructor TAplicacao.Create;
begin
  FInicializador := TIDEPrepare.Create;
  FParser := TParserManager.Create;
  FPromptCommand := TDosCommand.Create(nil);
  FConfiguracoes := TConfiguration.Create(nil);
end;

destructor TAplicacao.Destroy;
begin
  FreeAndNil(FConfiguracoes);
  FreeAndNil(FPromptCommand);
  FreeAndNil(FParser);
  FreeAndNil(FInicializador);
  inherited;
end;

function TAplicacao.GetCurrentWorkspace: IWorkspace;
var
  I: Integer;
  workspace: IWorkspace;
  form: TForm;
  page: TdxTabbedMDIPage;
begin
  if not Assigned(FTabbedMDIManager) then
    Exit(nil);

  page := FTabbedMDIManager.TabProperties.Pages[FTabbedMDIManager.TabProperties.PageIndex];
  if not Assigned(page) then
    Exit(nil);

  workspace := (page.MDIChild as IWorkspace);
  if Assigned(workspace) then
    Exit(workspace);

  Exit(nil);
end;

function TAplicacao.Inicializador: TIDEPrepare;
begin
  Exit(_aplicacao.FInicializador);
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

function TAplicacao.Parser: TParserManager;
begin
  Exit(_aplicacao.FParser);
end;

procedure TAplicacao.TabbedMDIManager(ATabbedMDIManager: TdxTabbedMDIManager);
begin
  FTabbedMDIManager := ATabbedMDIManager;
end;

{ TIDEAplicacao }

function TIDEAplicacao.GetConfiguracoes: TConfiguration;
begin
  Exit(_aplicacao.Configuracoes);
end;

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

function TIDEAplicacao.Inicializador: TIDEPrepare;
begin
  Exit(_aplicacao.Inicializador);
end;

procedure TIDEAplicacao.Inicializar;
var
  config: TConfiguration;
begin
  Inicializador.Executar;
  config := TConfiguration.Create(nil);
  try
    if config.PrimeiraExecucao then
      with TfrmConfiguracaoInicial.Create(nil) do
      begin
        ShowModal;
        Free;
      end;
  finally
    FreeAndNil(config);
  end;
end;

function TIDEAplicacao.Login(const AUsuario, ASenha: string;
  ADominio: string): boolean;
begin
  Exit(_aplicacao.Login(AUsuario, ASenha, ADominio));
end;

function TIDEAplicacao.Parser: TParserManager;
begin
  Exit(_aplicacao.Parser);
end;

procedure TIDEAplicacao.TabbedMDIManager(ATabbedMDIManager: TdxTabbedMDIManager);
begin
  _aplicacao.TabbedMDIManager(ATabbedMDIManager);
end;

//initialization
//  _aplicacao := TAplicacao.Create;
//
//finalization
//  FreeAndNil(_aplicacao);

end.
