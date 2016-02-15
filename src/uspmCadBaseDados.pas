unit uspmCadBaseDados;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Controls, Vcl.Forms,
  uspmFormCadPadrao, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls, JvDBCombobox, ZDataset,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, JvExStdCtrls,
  JvCombobox, Vcl.Mask, System.Actions, Vcl.ActnList, Vcl.ImgList, JvLabel,
  JvDBControls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls,
  JvExControls, JvButton, JvTransparentButton, Vcl.ExtCtrls, System.ImageList;

type
  TspmCadBaseDados = class(TspmFormCadPadrao)
    Label2: TLabel;
    edDescricao: TDBEdit;
    Label5: TLabel;
    edInstancia: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    cbTipo: TJvDBComboBox;
    Label1: TLabel;
    cbSistema: TDBLookupComboBox;
    dsCadSistema: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    edAliasPRO: TDBEdit;
    Label9: TLabel;
    edAliasSGC: TDBEdit;
    Label10: TLabel;
    edAliasARC: TDBEdit;
    Label11: TLabel;
    edALiasPSS: TDBEdit;
    tbCadSistema: TZTable;
    tbCadSistemaCDSISTEMA: TLargeintField;
    tbCadSistemaDESISTEMA: TWideStringField;
    tbCadSistemaFLUSAPRO: TWideStringField;
    tbCadSistemaFLUSASGC: TWideStringField;
    tbCadSistemaFLUSAARC: TWideStringField;
    tbCadSistemaFLUSAPSS: TWideStringField;
    Label12: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure acIncluirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbSistemaClick(Sender: TObject);
    procedure acAlterarExecute(Sender: TObject);
  private
    procedure DefinirPropriedadesCamposSistema;
  public
    { Public declarations }
  end;

var
  spmCadBaseDados: TspmCadBaseDados;

implementation

{$R *.dfm}

uses
  uspmConstantes;

procedure TspmCadBaseDados.FormCreate(Sender: TObject);
begin
  try
    try
      inherited;

      Self.FoFormulario := Self;

      Self.tbCadSistema.Open;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadBaseDados.FormDestroy(Sender: TObject);
begin
  try
    try
      inherited;

      spmCadBaseDados := nil;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadBaseDados.acAlterarExecute(Sender: TObject);
begin
  try
    try
      inherited;

      Self.tbCadSistema.Refresh;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadBaseDados.acIncluirExecute(Sender: TObject);
begin
  try
    try
      inherited;

      Self.tbCadSistema.Refresh;

      Self.cbTipo.ItemIndex := 1;
      Self.dsFormCadPadrao.DataSet.FieldByName('TPBASEDADOS').AsString := sTIPO_BASE_DADOS_DB2;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadBaseDados.cbSistemaClick(Sender: TObject);
begin
  try
    try
      inherited;

      if (Self.dsFormCadPadrao.DataSet.State in [dsInsert, dsEdit]) then
      begin
        Self.DefinirPropriedadesCamposSistema;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadBaseDados.DefinirPropriedadesCamposSistema;
begin
  try
    try
      inherited;

      Self.dsCadSistema.DataSet.Locate('CDSISTEMA', Self.dsFormCadPadrao.DataSet.FieldByName('CDSISTEMA').AsInteger, []);

      Self.edAliasARC.Enabled := Self.dsCadSistema.DataSet.FieldByName('FLUSAARC').AsString = sFLAG_SIM;
      Self.edAliasARC.Field.Required := Self.edAliasARC.Enabled;
      if not Self.edAliasARC.Enabled then
      begin
        Self.edAliasARC.Field.Clear;
      end;

      Self.edAliasPRO.Enabled := Self.dsCadSistema.DataSet.FieldByName('FLUSAPRO').AsString = sFLAG_SIM;
      Self.edAliasPRO.Field.Required := Self.edAliasPRO.Enabled;
      if not Self.edAliasPRO.Enabled then
      begin
        Self.edAliasPRO.Field.Clear;
      end;

      Self.edALiasPSS.Enabled := Self.dsCadSistema.DataSet.FieldByName('FLUSAPSS').AsString = sFLAG_SIM;
      Self.edALiasPSS.Field.Required := Self.edALiasPSS.Enabled;
      if not Self.edALiasPSS.Enabled then
      begin
        Self.edALiasPSS.Field.Clear;
      end;

      Self.edAliasSGC.Enabled := Self.dsCadSistema.DataSet.FieldByName('FLUSASGC').AsString = sFLAG_SIM;
      Self.edAliasSGC.Field.Required := Self.edAliasSGC.Enabled;
      if not Self.edAliasSGC.Enabled then
      begin
        Self.edAliasSGC.Field.Clear;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

end.

