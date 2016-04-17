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
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, Manager.Core.IDE, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmCadastroAcao = class(TfrmCadastroPaginadoModelo)
    Label1: TLabel;
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
    procedure FitGrid(Grid: TDBGrid);
    { Private declarations }
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

procedure TfrmCadastroAcao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarComboIcones([cbxIcone]);
end;

procedure TfrmCadastroAcao.FitGrid(Grid: TDBGrid);
const
  C_Add = 3;
var
  ds: TDataSet;
  bm: TBookmark;
  i: Integer;
  w: Integer;
  a: array of Integer;
begin
  ds := Grid.DataSource.DataSet;

  if not Assigned(ds) then
    exit;

  if Grid.Columns.Count = 0 then
    exit;

  ds.DisableControls;
  bm := ds.GetBookmark;
  try
    ds.First;
    SetLength(a, Grid.Columns.Count);
    for i := 0 to Grid.Columns.Count - 1 do
      if Assigned(Grid.Columns[i].Field) then
        a[i] := Grid.Canvas.TextWidth(Grid.Columns[i].FieldName);

    while not ds.Eof do
    begin

      for i := 0 to Grid.Columns.Count - 1 do
      begin
        if not Assigned(Grid.Columns[i].Field) then
          continue;

        w := Grid.Canvas.TextWidth(ds.FieldByName(Grid.Columns[i].Field.FieldName).DisplayText);

        if a[i] < w then
          a[i] := w;
      end;
      ds.Next;
    end;

    w := 0;
    for i := 0 to Grid.Columns.Count - 1 do
    begin
      Grid.Columns[i].Width := a[i] + C_Add;
      inc(w, a[i] + C_Add);
    end;

    w := (Grid.ClientWidth - w - 20) div (Grid.Columns.Count);

    if w > 0 then
      for i := 0 to Grid.Columns.Count - 1 do
        Grid.Columns[i].Width := Grid.Columns[i].Width + w;


    ds.GotoBookmark(bm);
  finally
    ds.FreeBookmark(bm);
    ds.EnableControls;
  end;
end;

end.
