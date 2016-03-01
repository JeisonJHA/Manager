unit Manager.PromptCommand;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DosCommand;

type
  TManagerPromptCommand = class(TMemo)
  private
    FDosCommand: TDosCommand;
    procedure KeyPress(Sender: TObject; var Key: Char);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

const
  CONSOLE_TEXT = 'manager/>';

{ TManagerPromptCommand }

constructor TManagerPromptCommand.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  OnKeyPress := KeyPress;
end;

procedure TManagerPromptCommand.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  FDosCommand := TDosCommand.Create(nil);
//
//  FDosCommand.OutputLines := Self.Lines;
//  FDosCommand.InputToOutput := True;
  Lines.Delete(0);
  Lines.Insert(0, CONSOLE_TEXT);
  Font.Color := clWhite;
  Font.Name := 'Courier New';
  Color := clBlack;

end;

destructor TManagerPromptCommand.Destroy;
begin
  FreeAndNil(FDosCommand);
  inherited;
end;

procedure TManagerPromptCommand.KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Lines.Add('manager/>');
    Abort;
  end;

  if Key = #8 then
    Abort;
end;

end.
