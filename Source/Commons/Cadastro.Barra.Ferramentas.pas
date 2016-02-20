unit Cadastro.Barra.Ferramentas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Paginado.Mestre.Detalhe.Modelo,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  InstantPresentation, System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.ExtCtrls, cxContainer, cxTextEdit,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.DBActns;

type
  TfrmCadastroBarraFerramentas = class(TfrmCadastroPaginadoMestreDetalheModelo)
    cxGrid1DBTableView1Descricao: TcxGridDBColumn;
    iosSelecaoDeAcoes: TInstantSelector;
    dtsSelecaoDeAcoes: TDataSource;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label2: TLabel;
    btnNovaAcao: TButton;
    actAdicionarAcao: TAction;
    cbxSelecaoDeAcao: TcxLookupComboBox;
    iosSelecionadorAcao: TDataSetField;
    iosSelecionadorDescricao: TStringField;
    iosSelecionadorSelf: TIntegerField;
    iosSelecaoDeAcoesDescricao: TStringField;
    iosSelecaoDeAcoesIcone: TIntegerField;
    iosSelecaoDeAcoesSelf: TIntegerField;
    ioeMestreAcao: TDataSetField;
    ioeMestreDescricao: TStringField;
    ioeMestreSelf: TIntegerField;
    ioeDetalheDescricao: TStringField;
    ioeDetalheIcone: TIntegerField;
    ioeDetalheSelf: TIntegerField;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    Button1: TButton;
    cxGrid2DBTableView1Descricao: TcxGridDBColumn;
    procedure actAdicionarAcaoUpdate(Sender: TObject);
    procedure actAdicionarAcaoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBarraFerramentas: TfrmCadastroBarraFerramentas;

implementation

{$R *.dfm}

uses Acao, BarraFerramenta;

procedure TfrmCadastroBarraFerramentas.actAdicionarAcaoExecute(Sender: TObject);
begin
  inherited;
  ioeMestre.Edit;
  ioeDetalhe.AddObject(iosSelecaoDeAcoes.CurrentObject);
  ioeMestre.Post;
  ioeMestre.PostChanges;
end;

procedure TfrmCadastroBarraFerramentas.actAdicionarAcaoUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := (cbxSelecaoDeAcao.Text <> '');
end;

end.
