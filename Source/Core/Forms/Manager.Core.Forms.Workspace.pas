unit Manager.Core.Forms.Workspace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Manager.Core.API.Workspace, Workspace,
  Manager.Core.Forms.Modelo;

type
  TfrmWorkspace2 = class(TfrmModelo, IWorkspace)
  private
    { Private declarations }
    FSandbox: TWorkspace;
    function Sandbox: TWorkspace;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; var ASubject: TObject); override;
  end;

var
  frmWorkspace2: TfrmWorkspace2;

implementation

{$R *.dfm}

uses Manager.Core.Forms.Utils;

{ TfrmWorkspace2 }

constructor TfrmWorkspace2.Create(AOwner: TComponent; var ASubject: TObject);
begin
  inherited Create(AOwner);
  FSandbox := TWorkspace(ASubject);
end;

function TfrmWorkspace2.Sandbox: TWorkspace;
begin
  Exit(FSandbox);
end;

initialization
  RegisterForm(TfrmWorkspace2);

end.
