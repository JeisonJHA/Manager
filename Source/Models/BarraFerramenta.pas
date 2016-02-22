unit BarraFerramenta;

interface

uses
  InstantPersistence, InstantTypes, Acao;

type
  TBarraFerramenta = class(TInstantObject)
  {IOMETADATA stored;
    Descricao: String(255);
    Acoes: References(TAcao) external 'BarraFerramenta_Acoes'; }
    _Acoes: TInstantReferences;
    _Descricao: TInstantString;
  private
    function GetAcaoCount: Integer;
    function GetAcoes(Index: Integer): TAcao;
    function GetDescricao: string;
    procedure SetAcoes(Index: Integer; Value: TAcao);
    procedure SetDescricao(const Value: string);
  public
    function AddAcao(Acao: TAcao): Integer;
    procedure ClearAcoes;
    procedure DeleteAcao(Index: Integer);
    function IndexOfAcao(Acao: TAcao): Integer;
    procedure InsertAcao(Index: Integer; Acao: TAcao);
    function RemoveAcao(Acao: TAcao): Integer;
    property AcaoCount: Integer read GetAcaoCount;
    property Acoes[Index: Integer]: TAcao read GetAcoes write SetAcoes;
  published
    property Descricao: string read GetDescricao write SetDescricao;
  end;

implementation

uses
  InstantMetadata;

{ TBarraFerramenta }

function TBarraFerramenta.AddAcao(Acao: TAcao): Integer;
begin
  Result := _Acoes.Add(Acao);
end;

procedure TBarraFerramenta.ClearAcoes;
begin
  _Acoes.Clear;
end;

procedure TBarraFerramenta.DeleteAcao(Index: Integer);
begin
  _Acoes.Delete(Index);
end;

function TBarraFerramenta.GetAcaoCount: Integer;
begin
  Result := _Acoes.Count;
end;

function TBarraFerramenta.GetAcoes(Index: Integer): TAcao;
begin
  Result := _Acoes[Index] as TAcao;
end;

function TBarraFerramenta.GetDescricao: string;
begin
  Result := _Descricao.Value;
end;

function TBarraFerramenta.IndexOfAcao(Acao: TAcao): Integer;
begin
  Result := _Acoes.IndexOf(Acao);
end;

procedure TBarraFerramenta.InsertAcao(Index: Integer; Acao: TAcao);
begin
  _Acoes.Insert(Index, Acao);
end;

function TBarraFerramenta.RemoveAcao(Acao: TAcao): Integer;
begin
  Result := _Acoes.Remove(Acao);
end;

procedure TBarraFerramenta.SetAcoes(Index: Integer; Value: TAcao);
begin
  _Acoes[Index] := Value;;
end;

procedure TBarraFerramenta.SetDescricao(const Value: string);
begin
  _Descricao.Value := Value;;
end;

initialization
  InstantRegisterClasses([
    TBarraFerramenta
  ]);

end.
