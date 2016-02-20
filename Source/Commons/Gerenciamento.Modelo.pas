unit Gerenciamento.Modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Formulario.Modelo, System.Actions,
  Vcl.ActnList, Data.DB, InstantPresentation, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, Cadastro.Modelo,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Menus, cxGridCustomPopupMenu, cxGridPopupMenu;

type
  TfrmGerenciamentoModelo = class(TfrmModelo)
    Panel1: TPanel;
    Panel2: TPanel;
    btnAdicionar: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    actAdicionar: TAction;
    iosSelecionador: TInstantSelector;
    DataSource1: TDataSource;
    actEditar: TAction;
    cxGridPopupMenu1: TcxGridPopupMenu;
    PopupMenu1: TPopupMenu;
    actExcluir: TAction;
    Excluir1: TMenuItem;
    procedure actAdicionarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actExcluirExecute(Sender: TObject);
  private
    FCadastroFormClass: TfrmCadastroModeloClass;
    { Private declarations }
  public
    { Public declarations }
    property CadastroFormClass: TfrmCadastroModeloClass read FCadastroFormClass write FCadastroFormClass;
  end;

implementation

{$R *.dfm}

procedure TfrmGerenciamentoModelo.actAdicionarExecute(Sender: TObject);
var
  Subject: TObject;
begin
  inherited;
  Subject := iosSelecionador.CreateObject;
  with CadastroFormClass.Create(nil, Subject) do
  begin
    if ShowModal = mrCancel then
    begin
      iosSelecionador.Cancel;
      Subject.Free;
      Exit;
    end;
  end;
  iosSelecionador.InsertObject(Subject);
  iosSelecionador.ApplyChanges;
  iosSelecionador.Refresh;
end;

procedure TfrmGerenciamentoModelo.actEditarExecute(Sender: TObject);
var
  Subject: TObject;
begin
  inherited;
  Subject := iosSelecionador.CurrentObject;
  with CadastroFormClass.Create(nil, Subject) do
  begin
    AtribuicaoExterna := False;
    if ShowModal = mrCancel then
    begin
      iosSelecionador.Cancel;
      Exit;
    end;
  end;
  iosSelecionador.Refresh;
end;

procedure TfrmGerenciamentoModelo.actExcluirExecute(Sender: TObject);
begin
  inherited;
  iosSelecionador.Delete;
  iosSelecionador.ApplyChanges;
end;

procedure TfrmGerenciamentoModelo.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actEditarExecute(Sender);
end;

end.
