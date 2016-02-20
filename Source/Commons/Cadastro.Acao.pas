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
  cxMaskEdit, cxDropDownEdit, cxImageComboBox;

type
  TfrmCadastroAcao = class(TfrmCadastroPaginadoModelo)
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxGrid1DBTableView1Descricao: TcxGridDBColumn;
    iosSelecionadorDescricao: TStringField;
    iosSelecionadorIcone: TIntegerField;
    iosSelecionadorSelf: TIntegerField;
    ioeMestreDescricao: TStringField;
    ioeMestreIcone: TIntegerField;
    lblIcone: TLabel;
    cbxIcone: TcxDBImageComboBox;
    procedure FormShow(Sender: TObject);
  private
    procedure CarregarComboIcones;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcao: TfrmCadastroAcao;

implementation

{$R *.dfm}

uses udtmDatabase;

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
