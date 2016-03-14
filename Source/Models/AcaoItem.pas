unit AcaoItem;

interface

uses
  InstantPersistence, InstantTypes, Acao;

type
  TAcaoItem = class(TInstantObject)
  {IOMETADATA stored;
    Acao: Reference(TAcao);
    Ordenacao: Integer; }
    _Acao: TInstantReference;
    _Ordenacao: TInstantInteger;
  private
    function GetAcao: TAcao;
    function GetOrdenacao: Integer;
    procedure SetAcao(Value: TAcao);
    procedure SetOrdenacao(Value: Integer);
  published
    property Acao: TAcao read GetAcao write SetAcao;
    property Ordenacao: Integer read GetOrdenacao write SetOrdenacao;
  end;

implementation

uses
  InstantMetadata;

{ TAcaoItem }

function TAcaoItem.GetAcao: TAcao;
begin
  Result := _Acao.Value as TAcao;
end;

function TAcaoItem.GetOrdenacao: Integer;
begin
  Result := _Ordenacao.Value;
end;

procedure TAcaoItem.SetAcao(Value: TAcao);
begin
  _Acao.Value := Value;;
end;

procedure TAcaoItem.SetOrdenacao(Value: Integer);
begin
  _Ordenacao.Value := Value;;
end;

initialization
  InstantRegisterClasses([
    TAcaoItem
  ]);

end.
