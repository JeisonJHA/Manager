unit Manager.Core.Forms.Workspace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Manager.Core.API.Workspace, Workspace,
  Manager.Core.Forms.Modelo, Manager.Core.API.Observer, Manager.Core.Forms.Workspace.Controller,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxCustomTileControl, dxTileControl, Vcl.StdCtrls, Manager.Core.IDE.Constants,
  dxSkinLilian, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmWorkspace2 = class(TfrmModelo, IWorkspace, IObserver)
    dxTileControl1: TdxTileControl;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FController: TWorkspaceController;
    FSandbox: TWorkspace;
    function Sandbox: TWorkspace;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; var ASubject: TObject); override;
    destructor Destroy; override;
    procedure Update(Sender: TObject; ATipoAcao: TTipoAcao);
    property Controller: TWorkspaceController read FController;
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
  FController := TWorkspaceController.Create(Self);
end;

destructor TfrmWorkspace2.Destroy;
begin
  FreeAndNil(FController);
  inherited;
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

procedure TfrmWorkspace2.Update(Sender: TObject; ATipoAcao: TTipoAcao);
begin
  Controller.Update(Sender, ATipoAcao);
end;

initialization
  RegisterForm(TfrmWorkspace2);

end.
