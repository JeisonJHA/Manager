unit Aplicacao;

interface

uses
  InstantPersistence, InstantTypes, Sistema;

type
  TAplicacao = class(TInstantObject)
  {IOMETADATA stored;
    Descricao: String(255);
    DiretorioBuild: String(255);
    SubDiretorioBuild: String(255);
    Sistema: Reference(TSistema); }
    _Descricao: TInstantString;
    _DiretorioBuild: TInstantString;
    _Sistema: TInstantReference;
    _SubDiretorioBuild: TInstantString;
  private
    function GetDescricao: string;
    function GetDiretorioBuild: string;
    function GetSistema: TSistema;
    function GetSubDiretorioBuild: string;
    procedure SetDescricao(const Value: string);
    procedure SetDiretorioBuild(const Value: string);
    procedure SetSistema(Value: TSistema);
    procedure SetSubDiretorioBuild(const Value: string);
  published
    property Descricao: string read GetDescricao write SetDescricao;
    property DiretorioBuild: string read GetDiretorioBuild write SetDiretorioBuild;
    property Sistema: TSistema read GetSistema write SetSistema;
    property SubDiretorioBuild: string read GetSubDiretorioBuild write SetSubDiretorioBuild;
  end;

implementation

uses
  InstantMetadata;

{ TAplicacao }

function TAplicacao.GetDescricao: string;
begin
  Result := _Descricao.Value;
end;

function TAplicacao.GetDiretorioBuild: string;
begin
  Result := _DiretorioBuild.Value;
end;

function TAplicacao.GetSistema: TSistema;
begin
  Result := _Sistema.Value as TSistema;
end;

function TAplicacao.GetSubDiretorioBuild: string;
begin
  Result := _SubDiretorioBuild.Value;
end;

procedure TAplicacao.SetDescricao(const Value: string);
begin
  _Descricao.Value := Value;;
end;

procedure TAplicacao.SetDiretorioBuild(const Value: string);
begin
  _DiretorioBuild.Value := Value;;
end;

procedure TAplicacao.SetSistema(Value: TSistema);
begin
  _Sistema.Value := Value;;
end;

procedure TAplicacao.SetSubDiretorioBuild(const Value: string);
begin
  _SubDiretorioBuild.Value := Value;;
end;

initialization
  InstantRegisterClasses([
    TAplicacao
  ]);

end.
