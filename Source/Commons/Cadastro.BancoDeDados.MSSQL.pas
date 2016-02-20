unit Cadastro.BancoDeDados.MSSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro.BancoDeDados, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  InstantPresentation, System.Actions, Vcl.ActnList, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxDBEdit,
  Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxPC, Vcl.ExtCtrls;

type
  TfrmCadastroBancoDeDadosMSSQL = class(TfrmCadastroBancoDeDados)
    ioeMestreInstancia: TStringField;
    Label6: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    iosSelecionadorInstancia: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBancoDeDadosMSSQL: TfrmCadastroBancoDeDadosMSSQL;

implementation

{$R *.dfm}

end.
