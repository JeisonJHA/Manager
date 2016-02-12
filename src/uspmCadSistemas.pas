unit uspmCadSistemas;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, uspmFormCadPadrao,
  Vcl.StdCtrls, Vcl.DBCtrls, JvDBCheckBox, JvGroupBox, Data.DB, JvExStdCtrls,
  Vcl.Mask, System.Actions, Vcl.ActnList, Vcl.ImgList, JvLabel, JvDBControls,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls, JvExControls,
  JvButton, JvTransparentButton, Vcl.ExtCtrls;

type
  TspmCadSistemas = class(TspmFormCadPadrao)
    Label1: TLabel;
    edDescricao: TDBEdit;
    JvGroupBox1: TJvGroupBox;
    cbPRO: TJvDBCheckBox;
    Label2: TLabel;
    cbSGC: TJvDBCheckBox;
    cbARC: TJvDBCheckBox;
    cbPSS: TJvDBCheckBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    edListaExecPRO: TDBEdit;
    Label6: TLabel;
    edListaExecSGC: TDBEdit;
    Label7: TLabel;
    edListaExecARC: TDBEdit;
    Label8: TLabel;
    edListaExecPSS: TDBEdit;
    Label9: TLabel;
    edListaExecExt: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbPROChange(Sender: TObject);
    procedure cbSGCChange(Sender: TObject);
    procedure cbARCChange(Sender: TObject);
    procedure cbPSSChange(Sender: TObject);
    procedure acAlterarExecute(Sender: TObject);
  private
    procedure DefinirPropriedadesCamposListaExec;
  public
    { Public declarations }
  end;

var
  spmCadSistemas: TspmCadSistemas;

implementation

{$R *.dfm}

procedure TspmCadSistemas.FormCreate(Sender: TObject);
begin
  try
    try
      inherited;

      Self.FoFormulario := Self;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadSistemas.FormDestroy(Sender: TObject);
begin
  try
    try
      inherited;

      spmCadSistemas := nil;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadSistemas.cbPSSChange(Sender: TObject);
begin
  try
    try
      Self.DefinirPropriedadesCamposListaExec;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadSistemas.acAlterarExecute(Sender: TObject);
begin
  try
    try
      inherited;

      Self.DefinirPropriedadesCamposListaExec;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadSistemas.cbARCChange(Sender: TObject);
begin
  try
    try
      Self.DefinirPropriedadesCamposListaExec;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadSistemas.cbSGCChange(Sender: TObject);
begin
  try
    try
      Self.DefinirPropriedadesCamposListaExec;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadSistemas.DefinirPropriedadesCamposListaExec;
begin
  try
    try
      Self.edListaExecPRO.Enabled := Self.cbPRO.Checked;
      Self.edListaExecPRO.Field.Required := Self.edListaExecPRO.Enabled;

      Self.edListaExecPSS.Enabled := Self.cbPSS.Checked;
      Self.edListaExecPSS.Field.Required := Self.edListaExecPSS.Enabled;

      Self.edListaExecARC.Enabled := Self.cbARC.Checked;
      Self.edListaExecARC.Field.Required := Self.edListaExecARC.Enabled;

      Self.edListaExecSGC.Enabled := Self.cbSGC.Checked;
      Self.edListaExecSGC.Field.Required := Self.edListaExecSGC.Enabled;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmCadSistemas.cbPROChange(Sender: TObject);
begin
  try
    try
      Self.DefinirPropriedadesCamposListaExec;
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

