unit Manager.Source.Core.Host.Tester;

interface

uses Forms, Classes, SysUtils, Manager.Source.Core.Intf.Host, Manager.Source.Core.Host,
  dxRibbonSkins;

type
  TManagerHostTester = class(TManagerHost)
  public
    constructor Create(AMainForm: TForm); override;
    procedure Execute; override;
  end;

implementation

{ TManagerHostTester }

uses Manager.Source.Consts, Manager.Source.Core.HostLayout.Tester;

constructor TManagerHostTester.Create(AMainForm: TForm);
begin
  inherited Create(AMainForm);
  FLayout := TManagerHostLayoutTester.Create(AMainForm);
end;

procedure TManagerHostTester.Execute;
begin
  FMainForm.mnuRibbon.ColorSchemeAccent := rcsaPurple;
  inherited Execute;
end;

end.
