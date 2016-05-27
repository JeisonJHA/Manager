unit Manager.Source.Core.Host.Developer;

interface

uses Forms, Classes, SysUtils, Manager.Source.Core.Intf.Host, Manager.Source.Core.Host,
  dxRibbonSkins;

type
  TManagerHostDeveloper = class(TManagerHost)
  public
    constructor Create(AMainForm: TForm); override;
    procedure Execute; override;
  end;

implementation

{ TManagerHostDeveloper }

uses Manager.Source.Consts, Manager.Source.Core.HostLayout.Developer;

constructor TManagerHostDeveloper.Create(AMainForm: TForm);
begin
  inherited Create(AMainForm);
  FLayout := TManagerHostLayoutDeveloper.Create(AMainForm);
end;

procedure TManagerHostDeveloper.Execute;
begin
  FMainForm.mnuRibbon.ColorSchemeAccent := rcsaBlue;
  inherited Execute;
end;

end.
