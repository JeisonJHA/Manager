unit Manager.Core.IDE;

interface

uses
  Classes, SysUtils, Forms, Manager.Core.API.Main, Manager.Core.Configuration, Windows,
  Manager.Core.IDE.Content, Manager.Core.API.Observer, ShellApi,
  Manager.Core.Parser.Manager, Manager.Core.IDE.Prepare, Messages,
  Manager.Core.API.Workspace, dxTabbedMDI, Manager.Core.PromptCommand,
  Manager.Core.IDE.Constants;

type
  IDE = class helper for TApplication
  private
    function GetParserManager: TParserManager;
    function GetPrepare: TIDEPrepare;
    function GetCurrentWorkspace: IWorkspace;
    function GetPromptCommand: TDosCommand;
    function GetConfiguration: TConfiguration;
    function GetUltimaVerifAtualizacao: TDateTime;
    procedure SetUltimaVerifAtualizacao(const Value: TDateTime);
  public
    function Main: IMain;
    procedure Register(AObserver: IObserver);
    procedure Remove(AObserver: IObserver);
    procedure Notify(ATipoAcao: TTipoAcao = taIndefinido);
    property Parser: TParserManager read GetParserManager;
    property Prepare: TIDEPrepare read GetPrepare;
    property CurrentWorkspace: IWorkspace read GetCurrentWorkspace;
    property PromptCommand: TDosCommand read GetPromptCommand;
    property Configuration: TConfiguration read GetConfiguration;
    property UltimaVerificacaoAtualizacao: TDateTime read GetUltimaVerifAtualizacao write SetUltimaVerifAtualizacao;

    procedure RegisterUniqueInstance(AId: PWideChar);
    procedure UnregisterUniqueInstance;

    procedure ExecCommand(ACommand: string);
  end;

implementation

var
  _OldWindowProc: Pointer;
  _MyMsg: LongInt;
  _UltimaVerifAtualizacao: TDateTime;

function NewWindowProc(WH: hWnd; Msg,PW,PL:LongInt):LongInt stdcall;
begin
  if Msg = _MyMsg Then
  begin
    SendMessage(Application.Handle,WM_SYSCOMMAND,SC_RESTORE,0);
    SetForegroundWindow(Application.Handle);
    Result := 0;
    Exit;
  end;
  Result := CallWindowProc(_OldWindowProc, WH, Msg, PW, PL);
end;

{ IDE }

procedure IDE.ExecCommand(ACommand: string);
begin
  if not Assigned(Application.PromptCommand.OutputLines) then
    Exit;
  Application.PromptCommand.OutputLines.Add(Format('%s %s',[FormatDateTime('[dd/MM/yyyy hh:mm:ss]', Date+Time), ACommand]));
end;

function IDE.GetConfiguration: TConfiguration;
begin
  Exit(TIDEContent.GetInstance.Configuration);
end;

function IDE.GetCurrentWorkspace: IWorkspace;
var
  I: Integer;
  workspace: IWorkspace;
  form: TForm;
  page: TdxTabbedMDIPage;
begin
  if not Assigned(Application.Main.MDIManager) then
    Exit(nil);

  page := Application.Main.MDIManager.TabProperties.Pages[Application.Main.MDIManager.TabProperties.PageIndex];
  if not Assigned(page) then
    Exit(nil);

  workspace := (page.MDIChild as IWorkspace);
  if Assigned(workspace) then
    Exit(workspace);

  Exit(nil);
end;

function IDE.GetParserManager: TParserManager;
begin
  Exit(TIDEContent.GetInstance.ParserManager);
end;

function IDE.GetPrepare: TIDEPrepare;
begin
  Exit(TIDEContent.GetInstance.Prepare);
end;

function IDE.GetPromptCommand: TDosCommand;
begin
  Exit(TIDEContent.GetInstance.PromptCommand);
end;

function IDE.GetUltimaVerifAtualizacao: TDateTime;
begin
  Exit(_UltimaVerifAtualizacao);
end;

function IDE.Main: IMain;
begin
  Exit(Self.MainForm as IMain);
end;

procedure IDE.Notify(ATipoAcao: TTipoAcao);
begin
  TIDEContent.GetInstance.Observers.Notify(ATipoAcao);
end;

procedure IDE.Register(AObserver: IObserver);
begin
  TIDEContent.GetInstance.Observers.Register(AObserver);
end;

procedure IDE.RegisterUniqueInstance(AId: PWideChar);
begin
  _MyMsg := RegisterWindowMessage(AId);
  _OldWindowProc := Pointer(SetWindowLong(Handle, GWL_WNDPROC, LongInt(@NewWindowProc)));
end;

procedure IDE.Remove(AObserver: IObserver);
begin
  TIDEContent.GetInstance.Observers.Remove(AObserver);
end;

procedure IDE.SetUltimaVerifAtualizacao(const Value: TDateTime);
begin
  _UltimaVerifAtualizacao := Value;
end;

procedure IDE.UnregisterUniqueInstance;
begin
  SetWindowLong(Handle, GWL_WNDPROC, LongInt(_OldWindowProc));
end;

initialization
  _UltimaVerifAtualizacao := 0;

end.
