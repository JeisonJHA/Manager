unit AcaoComando;

interface

uses
  Acao, InstantPersistence, InstantTypes, AcaoItem;

type
  TAcaoComando = class(TAcao)
  {IOMETADATA stored;
    PreAcoes: Parts(TAcaoItem) external 'AcaoComando_PreAcoes';
    PosAcoes: Parts(TAcaoItem) external 'AcaoComando_PosAcoes'; }
    _PosAcoes: TInstantParts;
    _PreAcoes: TInstantParts;
  private
    function GetPosAcaoCount: Integer;
    function GetPosAcoes(Index: Integer): TAcaoItem;
    function GetPreAcaoCount: Integer;
    function GetPreAcoes(Index: Integer): TAcaoItem;
    procedure SetPosAcoes(Index: Integer; Value: TAcaoItem);
    procedure SetPreAcoes(Index: Integer; Value: TAcaoItem);
  public
    function AddPosAcao(PosAcao: TAcaoItem): Integer;
    function AddPreAcao(PreAcao: TAcaoItem): Integer;
    procedure ClearPosAcoes;
    procedure ClearPreAcoes;
    procedure DeletePosAcao(Index: Integer);
    procedure DeletePreAcao(Index: Integer);
    function IndexOfPosAcao(PosAcao: TAcaoItem): Integer;
    function IndexOfPreAcao(PreAcao: TAcaoItem): Integer;
    procedure InsertPosAcao(Index: Integer; PosAcao: TAcaoItem);
    procedure InsertPreAcao(Index: Integer; PreAcao: TAcaoItem);
    function RemovePosAcao(PosAcao: TAcaoItem): Integer;
    function RemovePreAcao(PreAcao: TAcaoItem): Integer;
    property PosAcaoCount: Integer read GetPosAcaoCount;
    property PosAcoes[Index: Integer]: TAcaoItem read GetPosAcoes write SetPosAcoes;
    property PreAcaoCount: Integer read GetPreAcaoCount;
    property PreAcoes[Index: Integer]: TAcaoItem read GetPreAcoes write SetPreAcoes;
  end;

implementation

uses
  InstantMetadata;

{ TAcaoComando }

function TAcaoComando.AddPosAcao(PosAcao: TAcaoItem): Integer;
begin
  Result := _PosAcoes.Add(PosAcao);
end;

function TAcaoComando.AddPreAcao(PreAcao: TAcaoItem): Integer;
begin
  Result := _PreAcoes.Add(PreAcao);
end;

procedure TAcaoComando.ClearPosAcoes;
begin
  _PosAcoes.Clear;
end;

procedure TAcaoComando.ClearPreAcoes;
begin
  _PreAcoes.Clear;
end;

procedure TAcaoComando.DeletePosAcao(Index: Integer);
begin
  _PosAcoes.Delete(Index);
end;

procedure TAcaoComando.DeletePreAcao(Index: Integer);
begin
  _PreAcoes.Delete(Index);
end;

function TAcaoComando.GetPosAcaoCount: Integer;
begin
  Result := _PosAcoes.Count;
end;

function TAcaoComando.GetPosAcoes(Index: Integer): TAcaoItem;
begin
  Result := _PosAcoes[Index] as TAcaoItem;
end;

function TAcaoComando.GetPreAcaoCount: Integer;
begin
  Result := _PreAcoes.Count;
end;

function TAcaoComando.GetPreAcoes(Index: Integer): TAcaoItem;
begin
  Result := _PreAcoes[Index] as TAcaoItem;
end;


function TAcaoComando.IndexOfPosAcao(PosAcao: TAcaoItem): Integer;
begin
  Result := _PosAcoes.IndexOf(PosAcao);
end;

function TAcaoComando.IndexOfPreAcao(PreAcao: TAcaoItem): Integer;
begin
  Result := _PreAcoes.IndexOf(PreAcao);
end;

procedure TAcaoComando.InsertPosAcao(Index: Integer; PosAcao: TAcaoItem);
begin
  _PosAcoes.Insert(Index, PosAcao);
end;

procedure TAcaoComando.InsertPreAcao(Index: Integer; PreAcao: TAcaoItem);
begin
  _PreAcoes.Insert(Index, PreAcao);
end;

function TAcaoComando.RemovePosAcao(PosAcao: TAcaoItem): Integer;
begin
  Result := _PosAcoes.Remove(PosAcao);
end;

function TAcaoComando.RemovePreAcao(PreAcao: TAcaoItem): Integer;
begin
  Result := _PreAcoes.Remove(PreAcao);
end;

procedure TAcaoComando.SetPosAcoes(Index: Integer; Value: TAcaoItem);
begin
  _PosAcoes[Index] := Value;;
end;

procedure TAcaoComando.SetPreAcoes(Index: Integer; Value: TAcaoItem);
begin
  _PreAcoes[Index] := Value;;
end;

initialization
  InstantRegisterClasses([
    TAcaoComando
  ]);

end.
