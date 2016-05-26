unit Manager.Source.Core.AplicationHelper;

interface

uses Classes, SysUtils, Forms, Manager.Source.Core.IDE;

type
  TAplicationHelper = class helper for TApplication
  private
    function GetIDE: TManagerIDE;
  public
    property IDE: TManagerIDE read GetIDE;
  end;

implementation

{ TAplicationHelper }

function TAplicationHelper.GetIDE: TManagerIDE;
begin
  Exit(TManagerIDE.GetInstance);
end;

end.
