unit Manager.Core.Forms.Workspace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Manager.Core.API.Workspace, Workspace,
  Manager.Core.Forms.Modelo, Manager.Core.API.Observer, Manager.Core.Forms.Workspace.Controller,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxCustomTileControl, dxTileControl, Vcl.StdCtrls;

type
  TfrmWorkspace2 = class(TfrmModelo, IWorkspace, IObserver)
    dxTileControl1: TdxTileControl;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FController: TWorkspaceController;
    FSandbox: TWorkspace;
    function Sandbox: TWorkspace;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; var ASubject: TObject); override;
    destructor Destroy; override;
    procedure Update(Sender: TObject);
    property Controller: TWorkspaceController read FController;
  end;

var
  frmWorkspace2: TfrmWorkspace2;

implementation

{$R *.dfm}

uses Manager.Core.Forms.Utils;

{ TfrmWorkspace2 }

procedure TfrmWorkspace2.Button1Click(Sender: TObject);
begin
  inherited;
  Controller.Prepare;
end;

constructor TfrmWorkspace2.Create(AOwner: TComponent; var ASubject: TObject);
begin
  inherited Create(AOwner);
  FSandbox := TWorkspace(ASubject);
  FController := TWorkspaceController.Create(Self);
end;

destructor TfrmWorkspace2.Destroy;
begin
  FreeAndNil(FController);
  inherited;
end;

procedure TfrmWorkspace2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmWorkspace2.FormCreate(Sender: TObject);
begin
  inherited;
  Controller.OnCreate(Sender);
end;

procedure TfrmWorkspace2.FormShow(Sender: TObject);
begin
  inherited;
  Controller.OnShow(Sender);
end;

function TfrmWorkspace2.Sandbox: TWorkspace;
begin
  Exit(FSandbox);
end;

procedure TfrmWorkspace2.Update(Sender: TObject);
begin
  Controller.Update(Sender);
end;

initialization
  RegisterForm(TfrmWorkspace2);

end.
