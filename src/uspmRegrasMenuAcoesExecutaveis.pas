unit uspmRegrasMenuAcoesExecutaveis;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ImgList, Winapi.ShellApi,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, System.StrUtils;

type
  TspmRegrasMenuAcoesExecutaveis = class
    procedure acExecutarAcaoPadrao(Sender: TObject);
  private
    FoFormMenu: TForm;
    FoActionList: TActionList;
    FoToolBar: TToolbar;
  public
    constructor Create(poActionList: TActionList; poImageList: TImageList; poToolBar: TToolbar);
    procedure CriarAcoesExecutaveis;
  end;

implementation

{ TspmRegrasMenuAcoesExecutaveis }

uses
  uspmDados, uspmConstantes;

constructor TspmRegrasMenuAcoesExecutaveis.Create(poActionList: TActionList; poImageList: TImageList; poToolBar: TToolbar);
begin
  try
    try
      Self.FoActionList := poActionList;
      Self.FoActionList.Images := poImageList;
      Self.FoToolBar := poToolBar;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmRegrasMenuAcoesExecutaveis.acExecutarAcaoPadrao(Sender: TObject);
var
  oHandle: THandle;
  sExecutavel: PChar;
begin
  try
    try
      case AnsiIndexStr(UpperCase(Sender.ClassName), ['TTOOLBUTTON', 'TACTION']) of
        0:
          begin
            sExecutavel := PChar(TToolButton(Sender).Hint);
          end;
        1:
          begin
            sExecutavel := PChar(TAction(Sender).Hint);
          end;
      end;

      ShellExecute(oHandle, nil, sExecutavel, sSTRING_INDEFINIDO, sSTRING_INDEFINIDO, SW_SHOWNORMAL);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

procedure TspmRegrasMenuAcoesExecutaveis.CriarAcoesExecutaveis;
var
  oCloneAplicacoes: TZQuery;
  oIcone: TPicture;
  oStream: TMemoryStream;
  oAcao: TAction;
  oBotao: TToolButton;
begin
  oCloneAplicacoes := TZQuery.Create(nil);
  oIcone := TPicture.Create;
  oStream := TMemoryStream.Create;
  try
    try
      if not dmDados.PegarDados(dmDados.qrCadAplicacoes, oCloneAplicacoes) then
      begin
        Exit;
      end;

      oBotao := TToolButton.Create(Self.FoToolBar);
      oBotao.Style := tbsSeparator;
      oBotao.Width := 5;
      oBotao.Parent := Self.FoToolBar;

      oCloneAplicacoes.First;
      while not oCloneAplicacoes.Eof do
      begin
        oStream.Seek(0, soFromBeginning);
        TBlobField(oCloneAplicacoes.FieldByName('BLICONE')).SaveToStream(oStream);
        oStream.Position := 0;
        oIcone.Icon.LoadFromStream(oStream);

        oAcao := TAction.Create(Self.FoActionList);
        oAcao.Name := 'acExecutavel' + oCloneAplicacoes.FieldByName('CDAPLICACOES').AsString;
        oAcao.ActionList := Self.FoActionList;
        oAcao.Category := 'Aplicacoes';
        oAcao.Hint := oCloneAplicacoes.FieldByName('DEEXECUTAVEL').AsString + ' ' + oCloneAplicacoes.FieldByName('DEPARAMETROS').AsString;
        oAcao.ImageIndex := Self.FoActionList.Images.AddIcon(oIcone.Icon);
        oAcao.OnExecute := acExecutarAcaoPadrao;

        oBotao := TToolButton.Create(Self.FoToolBar);
        oBotao.Style := tbsButton;
        oBotao.Parent := Self.FoToolBar;
        oBotao.Name := 'btExecutavel' + oCloneAplicacoes.FieldByName('CDAPLICACOES').AsString;
        oBotao.Action := oAcao;
        oBotao.ImageIndex := oAcao.ImageIndex;
        oBotao.ShowHint := false;

        oCloneAplicacoes.Next;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(oCloneAplicacoes)
  end;
end;

end.

