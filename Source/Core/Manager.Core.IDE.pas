unit Manager.Core.IDE;

interface

uses
  Forms, Manager.Core.API.Main, Manager.Core.Configuration;

type
  IDE = class helper for TApplication
  public
    function Main: IMain;
  end;

implementation

{ IDE }

function IDE.Main: IMain;
begin
  Exit(Self.MainForm as IMain);
end;

end.
