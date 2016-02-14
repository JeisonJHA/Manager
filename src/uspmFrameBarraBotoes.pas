unit uspmFrameBarraBotoes;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.ActnList, Data.DB, System.Actions,
  Vcl.ImgList, System.StrUtils, Winapi.ShellApi, Winapi.Windows, Vcl.ToolWin,
  System.ImageList;

type
  TspmFrameBarraBotoes = class(TFrame)
    tbBarraBotoes: TToolBar;
    imBarraBotoes: TImageList;
    alBarraBotoes: TActionList;
    procedure OnExecutarAcaoClick(Sender: TObject);
  private
  public
    procedure InicializarBarraBotoes;
  end;

implementation

{$R *.dfm}

uses
  uspmDados, uspmConstantes;

{ TsmpFrameBarraBotoes }

procedure TspmFrameBarraBotoes.InicializarBarraBotoes;
var
  qrCadAplicacoes: TZQuery;
  oIcone: TPicture;
  oStream: TMemoryStream;
  oAcao: TAction;
  oBotao: TToolButton;
begin
  while Self.tbBarraBotoes.ButtonCount > 0 do
  begin
    Self.tbBarraBotoes.Buttons[0].Destroy;
    Self.alBarraBotoes.Actions[0].Destroy;
  end;

  qrCadAplicacoes := TZQuery.Create(nil);
  oIcone := TPicture.Create;
  oStream := TMemoryStream.Create;
  try
    try
      if not dmDados.PegarDados(dmDados.qrCadAplicacoes, qrCadAplicacoes) then
      begin
        Exit;
      end;

      qrCadAplicacoes.First;
      while not qrCadAplicacoes.Eof do
      begin
        oStream.Seek(0, soFromBeginning);
        TBlobField(qrCadAplicacoes.FieldByName('BLICONE')).SaveToStream(oStream);
        oStream.Position := 0;
        oIcone.Icon.LoadFromStream(oStream);

        oAcao := TAction.Create(Self.alBarraBotoes);
        oAcao.Name := 'acExecutavel' + qrCadAplicacoes.FieldByName('CDAPLICACOES').AsString;
        oAcao.ActionList := Self.alBarraBotoes;
        oAcao.Category := 'Aplicacoes';
        oAcao.ImageIndex := Self.alBarraBotoes.Images.AddIcon(oIcone.Icon);
        oAcao.OnExecute := OnExecutarAcaoClick;
        oAcao.Caption := qrCadAplicacoes.FieldByName('DEEXECUTAVEL').AsString;
        oAcao.HelpKeyword := qrCadAplicacoes.FieldByName('DEPARAMETROS').AsString;
        oAcao.Hint := qrCadAplicacoes.FieldByName('DEAPLICACOES').AsString;

        oBotao := TToolButton.Create(Self.tbBarraBotoes);
        oBotao.Style := tbsButton;
        oBotao.Parent := Self.tbBarraBotoes;
        oBotao.Name := 'btExecutavel' + qrCadAplicacoes.FieldByName('CDAPLICACOES').AsString;
        oBotao.Action := oAcao;
        oBotao.ImageIndex := oAcao.ImageIndex;
        oBotao.Caption := oAcao.Caption;
        oBotao.HelpKeyword := oAcao.HelpKeyword;
        oBotao.ShowHint := True;

        qrCadAplicacoes.Next;
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(qrCadAplicacoes)
  end;
end;

procedure TspmFrameBarraBotoes.OnExecutarAcaoClick(Sender: TObject);
var
  oHandle: THandle;
  sExecutavel: PChar;
  sParametro : PChar;
begin
  try
    try
      case AnsiIndexStr(UpperCase(Sender.ClassName), ['TTOOLBUTTON', 'TACTION']) of
        0:
          begin
            sExecutavel := PChar(TToolButton(Sender).Caption);
            sParametro := PChar(TToolButton(Sender).HelpKeyword);
          end;
        1:
          begin
            sExecutavel := PChar(TAction(Sender).Caption);
            sParametro := PChar(TAction(Sender).HelpKeyword);
          end;
      end;

      ShellExecute(oHandle, nil, sExecutavel, sParametro, sSTRING_INDEFINIDO, SW_SHOWNORMAL);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally

  end;
end;

end.

