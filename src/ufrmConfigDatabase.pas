unit ufrmConfigDatabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxGraphics, cxLookAndFeelPainters, cxLookAndFeels,
  dxCustomWizardControl, dxWizardControl, dxWizardControlForm, dxSkinsCore;

type
  TfrmConfigDatabase = class(TdxWizardControlForm)
    dxWizardControl1: TdxWizardControl;
    dxWizardControlPage1: TdxWizardControlPage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigDatabase: TfrmConfigDatabase;

implementation

{$R *.dfm}

end.
