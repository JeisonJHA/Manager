unit uspmDados;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, ZConnection, ZAbstractConnection,
  Data.DB, ZDataset, ZSqlUpdate, ZAbstractRODataset, ZAbstractDataset,
  InstantPersistence, InstantBrokers, InstantZeosDBO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  InstantFireDAC, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.Controls, cxGraphics;

type
  TdmDados = class(TDataModule)
    dmConexao: TZConnection;
    qrCadBaseDados: TZQuery;
    qrCadBaseDadosCDBASEDADOS: TLargeintField;
    qrCadBaseDadosDEBASEDADOS: TWideStringField;
    qrCadBaseDadosDEINSTANCIA: TWideStringField;
    qrCadBaseDadosDEUSUARIO: TWideStringField;
    qrCadBaseDadosDESENHA: TWideStringField;
    qrCadBaseDadosCDSISTEMA: TLargeintField;
    upCadBaseDados: TZUpdateSQL;
    qrCadSistemas: TZQuery;
    upCadSistemas: TZUpdateSQL;
    qrCadSistemasCDSISTEMA: TLargeintField;
    qrCadSistemasDESISTEMA: TWideStringField;
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
    qrCadBaseDadosTPBASEDADOS: TWideStringField;
    qrCadBaseDadosCC_DETPBASEDADOS: TWideMemoField;
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> refs/remotes/origin/DelphiXE8
    SmallImageList: TcxImageList;
    LargeImageList: TcxImageList;
    MediumImageList: TcxImageList;
    qrCadAplicacoesCDICON: TLargeintField;
    qrCadAplicacoesFLWORKSPACE: TWideStringField;
<<<<<<< HEAD
=======
>>>>>>> origin/master
=======
    qrCadAplicacoesCDACAO: TLargeintField;
>>>>>>> refs/remotes/origin/DelphiXE8
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
  sNOME_BANCO_DADOS = 'data.db';
  sNOME_DLL = 'sqlite.dll';
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
        raise Exception.Create('Não foi possível conectar com o banco de dados:' + E.Message);
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
        raise Exception.Create('Não foi possível abrir uma tabela. Erro: ' + E.Message);
      end;
    end;
  finally

  end;
end;

end.

