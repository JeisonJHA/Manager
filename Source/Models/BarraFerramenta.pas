unit BarraFerramenta;

interface

uses
  InstantPersistence, InstantTypes, Acao;

type
  TBarraFerramenta = class(TInstantObject)
  {IOMETADATA stored;
    Descricao: String(255);
    Acao: References(TAcao) external 'BarraFerramenta_Acao'; }
    _Acao: TInstantReferences;
    _Descricao: TInstantString;
  private
    function GetAcao(Index: Integer): TAcao;
    function GetAcoesCount: Integer;
    function GetDescricao: string;
    procedure SetAcao(Index: Integer; Value: TAcao);
    procedure SetDescricao(const Value: string);
  public
    function AddAcoes(Acoes: TAcao): Integer;
    procedure ClearAcao;
    procedure DeleteAcoes(Index: Integer);
    function IndexOfAcoes(Acoes: TAcao): Integer;
    procedure InsertAcoes(Index: Integer; Acoes: TAcao);
    function RemoveAcoes(Acoes: TAcao): Integer;
    property Acao[Index: Integer]: TAcao read GetAcao write SetAcao;
    property AcoesCount: Integer read GetAcoesCount;
  published
    property Descricao: string read GetDescricao write SetDescricao;
  end;

implementation

uses
  InstantMetadata;

{ TBarraFerramenta }

function TBarraFerramenta.AddAcoes(Acoes: TAcao): Integer;
begin
  Result := _Acao.Add(Acoes);
end;

procedure TBarraFerramenta.ClearAcao;
begin
  _Acao.Clear;
end;

procedure TBarraFerramenta.DeleteAcoes(Index: Integer);
begin
  _Acao.Delete(Index);
end;

function TBarraFerramenta.GetAcao(Index: Integer): TAcao;
begin
  Result := _Acao[Index] as TAcao;
end;

function TBarraFerramenta.GetAcoesCount: Integer;
begin
  Result := _Acao.Count;
end;

function TBarraFerramenta.GetDescricao: string;
begin
  Result := _Descricao.Value;
end;

function TBarraFerramenta.IndexOfAcoes(Acoes: TAcao): Integer;
begin
  Result := _Acao.IndexOf(Acoes);
end;

procedure TBarraFerramenta.InsertAcoes(Index: Integer; Acoes: TAcao);
begin
  _Acao.Insert(Index, Acoes);
end;

function TBarraFerramenta.RemoveAcoes(Acoes: TAcao): Integer;
begin
  Result := _Acao.Remove(Acoes);
end;

procedure TBarraFerramenta.SetAcao(Index: Integer; Value: TAcao);
begin
  _Acao[Index] := Value;;
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
