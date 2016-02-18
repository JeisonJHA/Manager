unit Workspace;

interface

uses Classes, SysUtils;

type
  TWorkspace = class(TPersistent)
  private
    FDescricao: string;
    FDiretorio: string;
  published
    property Descricao: string read FDescricao write FDescricao;
    property Diretorio: string read FDiretorio write FDiretorio;
  end;

implementation

end.
