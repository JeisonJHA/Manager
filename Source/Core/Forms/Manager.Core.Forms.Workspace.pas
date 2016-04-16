unit Manager.Core.Forms.Workspace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Manager.Core.API.Workspace, Workspace,
  Manager.Core.Forms.Modelo, Manager.Core.API.Observer;

type
  TfrmWorkspace2 = class(TfrmModelo, IWorkspace, IObserver)
  private
    { Private declarations }
    FSandbox: TWorkspace;
    function Sandbox: TWorkspace;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; var ASubject: TObject); override;
    procedure Update(Sender: TObject);
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

procedure TfrmWorkspace2.Update(Sender: TObject);
begin
  ShowMessage('Ops! Tenho atualizar os dados da tela.');
end;

initialization
  RegisterForm(TfrmWorkspace2);

end.
