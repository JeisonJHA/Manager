unit Manager.Core.IDE.ActionList;

interface

uses Classes, Forms, Vcl.ActnList, Manager.Core.Workspace.Action, Manager.Core.IDE,
  Acao;

type
  TIDEActionListHelper = class helper for TActionList
  public
    function ExisteAcao(const AId: string): boolean;
    function GetInternalAction(const AId: string): TWorkspaceAction;
    function GetWorkspaceAcao(const AId: string): TAcao;
    function Add: TWorkspaceAction;
  end;

implementation

{ TIDEActionListHelper }

function TIDEActionListHelper.Add: TWorkspaceAction;
var
  act: TWorkspaceAction;
begin
  act := TWorkspaceAction.Create(Self);
  AddAction(act);
  Exit(act);
end;

function TIDEActionListHelper.ExisteAcao(const AId: string): boolean;
var
  action: TWorkspaceAction;
begin
  action := GetInternalAction(AId);
  if Assigned(action) then
    Exit(True);
  Exit(False);
end;

function TIDEActionListHelper.GetInternalAction(const AId: string): TWorkspaceAction;
var
  I: Integer;
begin
  for I := 0 to Application.Main.ActionList.ActionCount -1 do
    if Application.Main.ActionList.Actions[I].InheritsFrom(TWorkspaceAction) then
      if TWorkspaceAction(Application.Main.ActionList.Actions[I]).Acao.Id = AId then
        Exit(TWorkspaceAction(Application.Main.ActionList.Actions[I]));
  Exit(nil);
end;

function TIDEActionListHelper.GetWorkspaceAcao(const AId: string): TAcao;
var
  action: TWorkspaceAction;
begin
  action := GetInternalAction(AId);
  if Assigned(action) then
    Exit(action.Acao);
  Exit(nil);
end;

end.
