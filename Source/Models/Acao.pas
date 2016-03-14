unit Acao;

interface

uses
  InstantPersistence, InstantTypes, Winapi.ShellApi, Classes, SysUtils,
  Winapi.Windows, Forms, IDE.Aplicacao;

type
  TAcao = class;
  TAcaoMontarAmbiente = class;

  TAcao = class(TInstantObject)
  {IOMETADATA stored;
    Descricao: String(255);
    Icone: Integer; }
    _Descricao: TInstantString;
    _Icone: TInstantInteger;
  private
    function GetIcone: Integer;
    procedure SetIcone(Value: Integer);
  protected
    function GetTipoAcao: string; virtual;
    function GetDescricao: string; virtual;
    procedure SetDescricao(const Value: string); virtual;
  public
    procedure Executar; virtual;
  published
    property Descricao: string read GetDescricao write SetDescricao;
    property Icone: Integer read GetIcone write SetIcone;
    property TipoAcao: string read GetTipoAcao;
  end;

  TAcaoMontarAmbiente = class(TAcao)
  {IOMETADATA stored;
    Acoes: References(TAcao) external 'AcaoMontarAmbiente_Acoes'; }
    _Acoes: TInstantReferences;
  private
    function GetAcaoCount: Integer;
    function GetAcoes(Index: Integer): TAcao;
    procedure SetAcoes(Index: Integer; Value: TAcao);
  protected
    function GetTipoAcao: string; override;
  public
    procedure Executar; override;
    function AddAcao(Acao: TAcao): Integer;
    procedure ClearAcoes;
    procedure DeleteAcao(Index: Integer);
    function IndexOfAcao(Acao: TAcao): Integer;
    procedure InsertAcao(Index: Integer; Acao: TAcao);
    function RemoveAcao(Acao: TAcao): Integer;
    property AcaoCount: Integer read GetAcaoCount;
    property Acoes[Index: Integer]: TAcao read GetAcoes write SetAcoes;
  end;

implementation

uses
  InstantMetadata;

{ TAcao }

procedure TAcao.Executar;
begin
  Console(Application.Parser.ParserText(Descricao));
end;

function TAcao.GetDescricao: string;
begin
  Result := _Descricao.Value;
end;

function TAcao.GetIcone: Integer;
begin
  Result := _Icone.Value;
end;

function TAcao.GetTipoAcao: string;
begin
  Exit('Indefinida');
end;

procedure TAcao.SetDescricao(const Value: string);
begin
  _Descricao.Value := Value;;
end;

procedure TAcao.SetIcone(Value: Integer);
begin
  _Icone.Value := Value;;
end;

{ TAcaoMontarAmbiente }

function TAcaoMontarAmbiente.AddAcao(Acao: TAcao): Integer;
begin
  Result := _Acoes.Add(Acao);
end;

procedure TAcaoMontarAmbiente.ClearAcoes;
begin
  _Acoes.Clear;
end;

procedure TAcaoMontarAmbiente.DeleteAcao(Index: Integer);
begin
  _Acoes.Delete(Index);
end;

procedure TAcaoMontarAmbiente.Executar;
var
  I: Integer;
begin
  inherited Executar;
  for I := 0 to AcaoCount -1 do
    Acoes[I].Executar;
end;

function TAcaoMontarAmbiente.GetAcaoCount: Integer;
begin
  Result := _Acoes.Count;
end;

function TAcaoMontarAmbiente.GetAcoes(Index: Integer): TAcao;
begin
  Result := _Acoes[Index] as TAcao;
end;

function TAcaoMontarAmbiente.GetTipoAcao: string;
begin
  Exit('Montagem de ambiente');
end;

function TAcaoMontarAmbiente.IndexOfAcao(Acao: TAcao): Integer;
begin
  Result := _Acoes.IndexOf(Acao);
end;

procedure TAcaoMontarAmbiente.InsertAcao(Index: Integer; Acao: TAcao);
begin
  _Acoes.Insert(Index, Acao);
end;

function TAcaoMontarAmbiente.RemoveAcao(Acao: TAcao): Integer;
begin
  Result := _Acoes.Remove(Acao);
end;

procedure TAcaoMontarAmbiente.SetAcoes(Index: Integer; Value: TAcao);
begin
  _Acoes[Index] := Value;;
end;

initialization
  InstantRegisterClasses([
    TAcao,
    TAcaoMontarAmbiente
  ]);

end.
