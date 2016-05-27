unit Cadastro.Modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, cxImageComboBox,
  InstantPresentation, Vcl.ExtCtrls, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  cxDBEdit, Manager.Source.Forms.Modelo;

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
    procedure actCancelarUpdate(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  protected
    procedure AoCancelar(Sender: TObject); virtual;
    procedure CarregarComboIcones(AComboBoxes: array of TcxDBImageComboBox);
  public
    { Public declarations }
  end;

var
  frmCadastroModelo: TfrmCadastroModelo;

implementation

{$R *.dfm}

uses Manager.Source.Core.AplicationHelper,
  Manager.Source.Forms.DataModule.Database,
  Manager.Source.Forms.DataModule.Resources;

procedure TfrmCadastroModelo.actCancelarExecute(Sender: TObject);
begin
  AoCancelar(Sender);
end;

procedure TfrmCadastroModelo.actCancelarUpdate(Sender: TObject);
begin
  inherited;
  if ioeMestre.State in (dsEditModes) then
  begin
    TAction(Sender).Caption := 'Cancelar';
    Exit;
  end;
  TAction(Sender).Caption := 'Fechar';
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

procedure TfrmCadastroModelo.actFecharExecute(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmCadastroModelo.AoCancelar(Sender: TObject);
begin
  if ioeMestre.State in (dsEditModes) then
  begin
    if (MessageDlg('Existe modificações realizadas, deseja realmente cancelar a operação?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    begin
      ModalResult := mrNone;
      Abort;
    end;
    ioeMestre.Cancel;
    ModalResult := mrCancel;
  end
  else
  begin
    ModalResult := mrOk;
    Application.IDE.Notify;
  end;
  Self.Close;
end;

procedure TfrmCadastroModelo.CarregarComboIcones(AComboBoxes: array of TcxDBImageComboBox);
var
  I: Integer;
  item: TcxImageComboBoxItem;
  X: Integer;
begin
  inherited;
  for X := Low(AComboBoxes) to High(AComboBoxes) do
    for I := 0 to dtmResources.SmallImageList.Count -1 do
    begin
      item := AComboBoxes[X].Properties.Items.Add;
      item.ImageIndex := I;
      item.Value := I;
    end;
end;

procedure TfrmCadastroModelo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  actCancelarExecute(actCancelar);
end;

end.
