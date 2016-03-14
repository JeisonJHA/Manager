unit Cadastro.Acao.Comando;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Acao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, InstantPresentation,
  System.Actions, Vcl.ActnList, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, Vcl.StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, Vcl.ExtCtrls, Acao.Controller, JvExControls,
  JvSpeedButton;

type
  TfrmCadastroAcaoComando = class(TfrmCadastroAcao)
    cxTabSheet1: TcxTabSheet;
    iosSelecionadorPosAcoes: TDataSetField;
    iosSelecionadorPreAcoes: TDataSetField;
    iosSelecionadorTipoAcao: TStringField;
    iosSelecaoDeAcoes: TInstantSelector;
    iosSelecaoDeAcoesDescricao: TStringField;
    iosSelecaoDeAcoesIcone: TIntegerField;
    iosSelecaoDeAcoesTipoAcao: TStringField;
    ioePreAcoes: TInstantExposer;
    dtsPreAcoes: TDataSource;
    ioePosAcoes: TInstantExposer;
    dtsPosAcoes: TDataSource;
    ioePreAcoesAcao: TIntegerField;
    ioePreAcoesAcaoDescricao: TStringField;
    ioePreAcoesAcaoIcone: TIntegerField;
    ioePreAcoesAcaoTipoAcao: TStringField;
    ioePreAcoesOrdenacao: TIntegerField;
    ioePreAcoesSelf: TIntegerField;
    ioePosAcoesAcao: TIntegerField;
    ioePosAcoesAcaoDescricao: TStringField;
    ioePosAcoesAcaoIcone: TIntegerField;
    ioePosAcoesAcaoTipoAcao: TStringField;
    ioePosAcoesOrdenacao: TIntegerField;
    ioePosAcoesSelf: TIntegerField;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    btnAddPreAcao: TJvSpeedButton;
    btnDelPreAcao: TJvSpeedButton;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    btnAddPosAcao: TJvSpeedButton;
    btnDelPosAcao: TJvSpeedButton;
    Panel6: TPanel;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1AcaoDescricao: TcxGridDBColumn;
    cxGrid2DBTableView1AcaoDescricao: TcxGridDBColumn;
    procedure btnAddPreAcaoClick(Sender: TObject);
    procedure btnDelPreAcaoClick(Sender: TObject);
    procedure btnAddPosAcaoClick(Sender: TObject);
    procedure btnDelPosAcaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAcaoComando: TfrmCadastroAcaoComando;

implementation

{$R *.dfm}

uses Acao, AcaoItem, AcaoComando;

procedure TfrmCadastroAcaoComando.btnAddPosAcaoClick(Sender: TObject);
var
  acao: TAcao;
  comando: TAcaoComando;
  item: TAcaoItem;
begin
  inherited;
  comando := TAcaoComando(iosSelecionador.CurrentObject);
  acao := TAcao(iosSelecaoDeAcoes.Escolher());
  if not Assigned(acao) then
    Exit;

  item := TAcaoItem.Create;
  item.Acao := acao;
  item.Ordenacao := comando.PosAcaoCount + 1;

  comando.AddPosAcao(item);
  comando.Store();
end;

procedure TfrmCadastroAcaoComando.btnAddPreAcaoClick(Sender: TObject);
var
  acao: TAcao;
  comando: TAcaoComando;
  item: TAcaoItem;
begin
  inherited;
  comando := TAcaoComando(iosSelecionador.CurrentObject);
  acao := TAcao(iosSelecaoDeAcoes.Escolher());
  if not Assigned(acao) then
    Exit;

  item := TAcaoItem.Create;
  item.Acao := acao;
  item.Ordenacao := comando.PreAcaoCount + 1;

  comando.AddPreAcao(item);
  comando.Store();
end;

procedure TfrmCadastroAcaoComando.btnDelPosAcaoClick(Sender: TObject);
var
  item: TAcaoItem;
  comando: TAcaoComando;
begin
  inherited;

  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  comando := TAcaoComando(iosSelecionador.CurrentObject);
  item := TAcaoItem(ioePosAcoes.CurrentObject);
  if not Assigned(item) then
    Exit;

  comando.RemovePosAcao(item);
  comando.Store();
end;

procedure TfrmCadastroAcaoComando.btnDelPreAcaoClick(Sender: TObject);
var
  item: TAcaoItem;
  comando: TAcaoComando;
begin
  inherited;

  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  comando := TAcaoComando(iosSelecionador.CurrentObject);
  item := TAcaoItem(ioePreAcoes.CurrentObject);
  if not Assigned(item) then
    Exit;

  comando.RemovePreAcao(item);
  comando.Store();
end;

end.
