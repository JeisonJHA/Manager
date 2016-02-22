unit Cadastro.Acao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Paginado.Modelo, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  InstantPresentation, System.Actions, Vcl.ActnList, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Vcl.StdCtrls, Vcl.ExtCtrls, cxContainer, cxTextEdit, cxDBEdit,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, IDE.Aplicacao;

type
  TfrmCadastroAcao = class(TfrmCadastroPaginadoModelo)
    Label1: TLabel;
    cxGrid1DBTableView1Descricao: TcxGridDBColumn;
    iosSelecionadorDescricao: TStringField;
    iosSelecionadorIcone: TIntegerField;
    iosSelecionadorSelf: TIntegerField;
    ioeMestreDescricao: TStringField;
    ioeMestreIcone: TIntegerField;
    lblIcone: TLabel;
    cbxIcone: TcxDBImageComboBox;
    edtDescricao: TcxDBTextEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarComboIcones;
  protected
    procedure CarregarChaves(AComboBoxes: array of TcxDBComboBox); overload;
    procedure CarregarChaves(AComboBox: TcxDBComboBox); overload;
  public
    { Public declarations }
  end;

var
  frmCadastroAcao: TfrmCadastroAcao;

implementation

{$R *.dfm}

uses udtmDatabase;

procedure TfrmCadastroAcao.CarregarChaves(AComboBox: TcxDBComboBox);
var
  I: Integer;
  chaves: TStrings;
begin
  chaves := TStringList.Create;
  try
    Application.Parser.Chaves(chaves);
    for I := 0 to chaves.Count -1 do
      AComboBox.Properties.Items.Add(Trim(chaves.Strings[I]));
    chaves.Clear;
  finally
    FreeAndNil(chaves);
  end;
end;

procedure TfrmCadastroAcao.CarregarChaves(AComboBoxes: array of TcxDBComboBox);
var
  I: Integer;
begin
  for I := Low(AComboBoxes) to High(AComboBoxes) do
    CarregarChaves(AComboBoxes[I])
end;

procedure TfrmCadastroAcao.CarregarComboIcones;
var
  I: Integer;
  item: TcxImageComboBoxItem;
begin
  inherited;
  for I := 0 to udtmDatabase.dtmDatabase.SmallImageList.Count -1 do
  begin
    item := cbxIcone.Properties.Items.Add;
    item.ImageIndex := I;
    item.Value := I;
  end;
end;

procedure TfrmCadastroAcao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarComboIcones;
end;

end.
