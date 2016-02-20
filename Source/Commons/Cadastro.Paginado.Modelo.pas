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
  cxGrid;

type
  TfrmCadastroPaginadoModelo = class(TfrmCadastroModelo)
    cxPageControl1: TcxPageControl;
    tabGrade: TcxTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    iosSelecionador: TInstantSelector;
    dtsSelecionador: TDataSource;
    tabDetalhes: TcxTabSheet;
    btnNovo: TButton;
    actNovo: TAction;
    btnExcluir: TButton;
    actExcluir: TAction;
    procedure actNovoExecute(Sender: TObject);
    procedure actNovoUpdate(Sender: TObject);
    procedure actConfirmarUpdate(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure actExcluirUpdate(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
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
  if (ioeMestre.State in [dsInsert, dsEdit]) then
    ioeMestre.Cancel;
  Close;
end;

procedure TfrmCadastroPaginadoModelo.actConfirmarExecute(Sender: TObject);
begin
  ioeMestre.Post;
  ioeMestre.ApplyChanges;
  if iosSelecionador.IndexOfObject(ioeMestre.Subject) < 0 then
    iosSelecionador.AddObject(ioeMestre.Subject);
end;

procedure TfrmCadastroPaginadoModelo.actConfirmarUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ioeMestre.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadastroPaginadoModelo.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  iosSelecionador.Delete;
  iosSelecionador.PostChanges;
  cxPageControl1.ActivePageIndex := PAGE_PRINCIPAL;
end;

procedure TfrmCadastroPaginadoModelo.actExcluirUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := (not iosSelecionador.IsEmpty) and (ioeMestre.State in [dsBrowse]);
end;

procedure TfrmCadastroPaginadoModelo.actNovoExecute(Sender: TObject);
begin
  ioeMestre.Subject := ioeMestre.CreateObject;
  cxPageControl1.ActivePageIndex := PAGE_DETALHE;
end;

procedure TfrmCadastroPaginadoModelo.actNovoUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (ioeMestre.State in [dsBrowse]);
end;

procedure TfrmCadastroPaginadoModelo.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if iosSelecionador.IsEmpty then
    Exit;
  ioeMestre.Subject := iosSelecionador.CurrentObject;
  cxPageControl1.ActivePageIndex := PAGE_DETALHE;
end;

procedure TfrmCadastroPaginadoModelo.cxPageControl1Change(Sender: TObject);
begin
  inherited;
  case TcxPageControl(Sender).ActivePageIndex of
    PAGE_PRINCIPAL: iosSelecionador.Refresh;
    PAGE_DETALHE:
    begin
      if iosSelecionador.IndexOfObject(ioeMestre.Subject) > -1 then
        ioeMestre.Subject := iosSelecionador.CurrentObject;
    end;
  end;
end;

procedure TfrmCadastroPaginadoModelo.FormShow(Sender: TObject);
begin
  inherited;
  cxPageControl1.ActivePageIndex := PAGE_PRINCIPAL;
  ioeMestre.Open;
end;

end.
