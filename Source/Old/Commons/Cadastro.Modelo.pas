unit Cadastro.Modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Manager.Core.Forms.Modelo, Data.DB, cxImageComboBox,
  InstantPresentation, Vcl.ExtCtrls, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  cxDBEdit, Manager.Core.IDE;

type
  TfrmCadastroModeloClass = class of TfrmCadastroModelo;

  TfrmCadastroModelo = class(TfrmModelo)
    Panel1: TPanel;
    Panel2: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    Bevel1: TBevel;
    actCancelar: TAction;
    actConfirmar: TAction;
    procedure actConfirmarUpdate(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure CarregarComboIcones(AComboBoxes: array of TcxDBImageComboBox);
  public
    { Public declarations }
  end;

var
  frmCadastroModelo: TfrmCadastroModelo;

implementation

{$R *.dfm}

uses udtmDatabase;

procedure TfrmCadastroModelo.actCancelarExecute(Sender: TObject);
begin
  inherited;
  ioeMestre.Cancel;
  Self.Close;
end;

procedure TfrmCadastroModelo.actConfirmarExecute(Sender: TObject);
begin
  inherited;
  if AtribuicaoExterna then
    Exit;

  ioeMestre.Post;
  ioeMestre.PostChanges;
end;

procedure TfrmCadastroModelo.actConfirmarUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := ioeMestre.State in [dsInsert, dsEdit];
end;

procedure TfrmCadastroModelo.CarregarComboIcones(AComboBoxes: array of TcxDBImageComboBox);
var
  I: Integer;
  item: TcxImageComboBoxItem;
  X: Integer;
begin
  inherited;
  for X := Low(AComboBoxes) to High(AComboBoxes) do
    for I := 0 to udtmDatabase.dtmDatabase.SmallImageList.Count -1 do
    begin
      item := AComboBoxes[X].Properties.Items.Add;
      item.ImageIndex := I;
      item.Value := I;
    end;
end;

procedure TfrmCadastroModelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Notify;
  inherited;
end;

end.
