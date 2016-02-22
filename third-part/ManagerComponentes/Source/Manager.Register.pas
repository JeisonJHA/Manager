unit Manager.Register;

interface

uses Classes, SysUtils;

  procedure Register;

implementation

uses Manager.PromptCommand;

procedure Register;
begin
  RegisterComponents('Manager', [TManagerPromptCommand]);
end;

end.
