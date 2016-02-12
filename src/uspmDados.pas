unit uspmDados;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, ZConnection, ZAbstractConnection,
  Data.DB, ZDataset, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset;

type
  TdmDados = class(TDataModule)
    dmConexao: TZConnection;
    qrCadBaseDados: TZQuery;
    qrCadBaseDadosCDBASEDADOS: TLargeintField;
    qrCadBaseDadosDEBASEDADOS: TWideStringField;
    qrCadBaseDadosTPBASEDADOS: TWideStringField;
    qrCadBaseDadosDEINSTANCIA: TWideStringField;
    qrCadBaseDadosDEUSUARIO: TWideStringField;
    qrCadBaseDadosDESENHA: TWideStringField;
    qrCadBaseDadosCDSISTEMA: TLargeintField;
    upCadBaseDados: TZUpdateSQL;
    qrCadSistemas: TZQuery;
    upCadSistemas: TZUpdateSQL;
    qrCadSistemasCDSISTEMA: TLargeintField;
    qrCadSistemasDESISTEMA: TWideStringField;
    qrCadBaseDadosCC_DETPBASEDADOS: TWideStringField;
    qrCadBaseDadosCC_DESISTEMA: TWideStringField;
    qrCadAplicacoes: TZQuery;
    upCadAplicacoes: TZUpdateSQL;
    qrCadAplicacoesCDAPLICACOES: TLargeintField;
    qrCadAplicacoesDEAPLICACOES: TWideStringField;
    qrCadAplicacoesDEEXECUTAVEL: TWideStringField;
    qrCadAplicacoesBLICONE: TBlobField;
    qrCadAplicacoesDEPARAMETROS: TWideStringField;
    qrCadBaseDadosDEALIAS: TWideStringField;
    qrCadBaseDadosDEALIASPRO: TWideStringField;
    qrCadBaseDadosDEALIASSGC: TWideStringField;
    qrCadBaseDadosDEALIASARC: TWideStringField;
    qrCadBaseDadosDEALIASPSS: TWideStringField;
    qrCadSistemasFLUSAPRO: TWideStringField;
    qrCadSistemasFLUSASGC: TWideStringField;
    qrCadSistemasFLUSAARC: TWideStringField;
    qrCadSistemasFLUSAPSS: TWideStringField;
    qrCadBaseDadosCC_FLUSAPRO: TWideStringField;
    qrCadBaseDadosCC_FLUSASGC: TWideStringField;
    qrCadBaseDadosCC_FLUSAARC: TWideStringField;
    qrCadBaseDadosCC_FLUSAPSS: TWideStringField;
    qrCadSistemasDEDIRREFER: TWideStringField;
    qrCfgManager: TZQuery;
    upCfgManager: TZUpdateSQL;
    qrCfgManagerDEPATHREFER: TWideStringField;
    qrCfgManagerDEWSPADRAO: TWideStringField;
    qrCadSistemasDELISTAEXE: TWideStringField;
    qrCadSistemasDELISTAEXEPRO: TWideStringField;
    qrCadSistemasDELISTAEXESGC: TWideStringField;
    qrCadSistemasDELISTAEXEARC: TWideStringField;
    qrCadSistemasDELISTAEXEPSS: TWideStringField;
    qrCadSistemasDELISTAEXEEXT: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure Conectar;
    procedure AbrirTabelas;
  public
    function PegarDados(poQueryOrigem: TZQuery; var poQueryDestino: TZQuery): boolean;
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  Self.Conectar;
  Self.AbrirTabelas;
end;

function TdmDados.PegarDados(poQueryOrigem: TZQuery; var poQueryDestino: TZQuery): boolean;
begin
  try
    try
      poQueryDestino.Connection := poQueryOrigem.Connection;
      poQueryDestino.SQL.Text := poQueryOrigem.SQL.Text;
      poQueryDestino.IndexFieldNames := poQueryOrigem.IndexFieldNames;
      poQueryDestino.Open;

      result := not poQueryDestino.IsEmpty;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TdmDados.Conectar;
const
  sNOME_BANCO_DADOS = 'SPManager.sqlite3';
  sNOME_DLL = 'sqlite3.dll';
var
  sPathAplicacao: string;
begin
  try
    try
      sPathAplicacao := ExtractFilePath(Application.ExeName);

      Self.dmConexao.Connected := False;
      Self.dmConexao.Database := sPathAplicacao + sNOME_BANCO_DADOS;
      Self.dmConexao.LibraryLocation := sPathAplicacao + sNOME_DLL;
      Self.dmConexao.Connected := True;
    except
      on E: Exception do
      begin
        raise Exception.Create('N�o foi poss�vel conectar com o banco de dados:' + E.Message);
      end;
    end;
  finally

  end;
end;

procedure TdmDados.AbrirTabelas;
var
  i: integer;
begin
  try
    try
      for i := 0 to Self.ComponentCount - 1 do
      begin
        if ((Self.Components[i]) is TZQuery) then
        begin
          TZQuery(Self.Components[i]).Active := False;
          TZQuery(Self.Components[i]).Active := True;
        end;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create('N�o foi poss�vel abrir uma tabela. Erro: ' + E.Message);
      end;
    end;
  finally

  end;
end;

end.

