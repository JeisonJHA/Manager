unit Manager.Source.Components.Register;

interface

uses Classes, SysUtils, Manager.Source.Components.ActionList;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Manager', [TManagerActionList]);
end;

end.
