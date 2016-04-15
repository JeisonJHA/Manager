unit Manager.Core.Forms.Workspace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Manager.Core.API.Workspace;

type
  TfrmWorkspace2 = class(TForm, IWorkspace)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWorkspace2: TfrmWorkspace2;

implementation

{$R *.dfm}

end.
