unit IDE.IWorkspace;

interface

uses Classes, SysUtils, Forms, Workspace;

type
  IWorkspace = interface
  ['{D03750D6-7AF8-45FD-A88E-BB8F2FA900C5}']
    function Sandbox: TWorkspace;
  end;

implementation

end.
