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
  cxDBLookupComboBox, Vcl.DBActns, Vcl.Buttons, InstantPersistence,
  JvExControls, JvSpeedButton, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroBarraFerramentas = class(TfrmCadastroPaginadoMestreDetalheModelo)
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    ioeMestreDescricao: TStringField;
    ioeMestreSelf: TIntegerField;
    ioeDetalheDescricao: TStringField;
    ioeDetalheIcone: TIntegerField;
    ioeDetalheSelf: TIntegerField;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    ioeMestreAcoes: TDataSetField;
    iosSelecionadorAcoes: TDataSetField;
    iosSelecionadorDescricao: TStringField;
    iosSelecionadorSelf: TIntegerField;
    iosSelecaoDeAcoes: TInstantSelector;
    iosSelecaoDeAcoesDescricao: TStringField;
    iosSelecaoDeAcoesIcone: TIntegerField;
    iosSelecaoDeAcoesTipoAcao: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure actDelDetalheExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBarraFerramentas: TfrmCadastroBarraFerramentas;

implementation

{$R *.dfm}

uses Acao, BarraFerramenta, Acao.Controller, Formulario.Utils;

procedure TfrmCadastroBarraFerramentas.actDelDetalheExecute(Sender: TObject);
var
  objeto: TObject;
  barra: TBarraFerramenta;
begin
  inherited;

  if (MessageDlg('Deseja realmente excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  barra := TBarraFerramenta(iosSelecionador.CurrentObject);
  objeto := ioeDetalhe.CurrentObject;
  if not Assigned(objeto) then
    Exit;

  barra.RemoveAcao(TAcao(objeto));
  barra.Store();
end;

procedure TfrmCadastroBarraFerramentas.SpeedButton1Click(Sender: TObject);
var
  objeto: TObject;
  barra: TBarraFerramenta;
begin
  inherited;
  barra := TBarraFerramenta(iosSelecionador.CurrentObject);
  objeto := iosSelecaoDeAcoes.Escolher();
  if not Assigned(objeto) then
    Exit;

  barra.AddAcao(TAcao(objeto));
  barra.Store();
end;

initialization
  RegisterForm(TfrmCadastroBarraFerramentas);

end.
