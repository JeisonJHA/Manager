unit Cadastro.Paginado.Modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Modelo, System.Actions,
  Vcl.ActnList, Data.DB, InstantPresentation, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, InstantPersistence, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroPaginadoModelo = class(TfrmCadastroModelo)
    cxPageControl1: TcxPageControl;
    tabGrade: TcxTabSheet;
    iosSelecionador: TInstantSelector;
    dtsSelecionador: TDataSource;
    tabDetalhes: TcxTabSheet;
    btnNovo: TButton;
    actNovo: TAction;
    btnExcluir: TButton;
    actExcluir: TAction;
    cxGrid1: TDBGrid;
    procedure actNovoExecute(Sender: TObject);
    procedure actNovoUpdate(Sender: TObject);
    procedure actConfirmarUpdate(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actExcluirUpdate(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure cxGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  PAGE_PRINCIPAL = 0;
  PAGE_DETALHE = 1;

implementation

{$R *.dfm}

procedure TfrmCadastroPaginadoModelo.actCancelarExecute(Sender: TObject);
begin
  if (iosSelecionador.State in [dsInsert, dsEdit]) then
    iosSelecionador.Cancel;
  Close;
end;

procedure TfrmCadastroPaginadoModelo.actConfirmarExecute(Sender: TObject);
begin
  iosSelecionador.PostChanges;
end;

procedure TfrmCadastroPaginadoModelo.actConfirmarUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (iosSelecionador.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadastroPaginadoModelo.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  iosSelecionador.Delete;
  cxPageControl1.ActivePageIndex := PAGE_PRINCIPAL;
end;

procedure TfrmCadastroPaginadoModelo.actExcluirUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := (not iosSelecionador.IsEmpty);
end;

procedure TfrmCadastroPaginadoModelo.actNovoExecute(Sender: TObject);
begin
  iosSelecionador.Insert;
  cxPageControl1.ActivePageIndex := PAGE_DETALHE;
end;

procedure TfrmCadastroPaginadoModelo.actNovoUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (iosSelecionador.State in [dsBrowse]);
end;

procedure TfrmCadastroPaginadoModelo.cxGrid1DblClick(Sender: TObject);
begin
  inherited;
  cxPageControl1.ActivePageIndex := PAGE_DETALHE;
end;

procedure TfrmCadastroPaginadoModelo.FormShow(Sender: TObject);
begin
  inherited;
  cxPageControl1.ActivePageIndex := PAGE_PRINCIPAL;
end;

end.
