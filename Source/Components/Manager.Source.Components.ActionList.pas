unit Manager.Source.Components.ActionList;

interface

uses System.Actions, Vcl.ActnList, Manager.Source.Components.Action;

type
  TManagerActionList = class(TActionList)
  public
    function Add: TManagerAction;
  end;

implementation

{ TManagerActionList }

function TManagerActionList.Add: TManagerAction;
var
  action: TManagerAction;
begin
  action := TManagerAction.Create(Self);
  AddAction(action);
  Exit(action);
end;

end.
