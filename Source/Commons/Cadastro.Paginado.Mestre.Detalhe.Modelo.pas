unit Cadastro.Paginado.Mestre.Detalhe.Modelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.Paginado.Modelo, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  InstantPresentation, System.Actions, Vcl.ActnList, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, JvExControls,
  JvSpeedButton;

type
  TfrmCadastroPaginadoMestreDetalheModelo = class(TfrmCadastroPaginadoModelo)
    GroupBox1: TGroupBox;
    ioeDetalhe: TInstantExposer;
    dtsDetalhe: TDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    JvSpeedButton1: TJvSpeedButton;
    JvSpeedButton2: TJvSpeedButton;
    actAddDetalhe: TAction;
    actDelDetalhe: TAction;
    procedure actAddDetalheUpdate(Sender: TObject);
    procedure actDelDetalheUpdate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPaginadoMestreDetalheModelo: TfrmCadastroPaginadoMestreDetalheModelo;

implementation

{$R *.dfm}

uses udtmDatabase;

procedure TfrmCadastroPaginadoMestreDetalheModelo.actAddDetalheUpdate(
  Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(iosSelecionador.CurrentObject);
end;

procedure TfrmCadastroPaginadoMestreDetalheModelo.actDelDetalheUpdate(
  Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := not ioeDetalhe.IsEmpty;
end;

end.
