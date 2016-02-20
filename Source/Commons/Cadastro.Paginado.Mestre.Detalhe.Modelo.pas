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
  cxGrid, cxPC, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCadastroPaginadoMestreDetalheModelo = class(TfrmCadastroPaginadoModelo)
    GroupBox1: TGroupBox;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    ioeDetalhe: TInstantExposer;
    dtsDetalhe: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPaginadoMestreDetalheModelo: TfrmCadastroPaginadoMestreDetalheModelo;

implementation

{$R *.dfm}

end.
