unit Manager.Source.Core.InstantSelectorHelper;

interface

uses Classes, SysUtils, InstantPresentation, Controls, cxGridDBTableView;

type
  TAcaoController = class helper for TInstantSelector
  public
    function Escolher(const Values: array of String): TObject;
  end;

implementation

uses Manager.Source.Forms.Selecao;

{ TAcaoController }

function TAcaoController.Escolher(const Values: array of String): TObject;
var
  form: TfrmSelecao;
  column: TcxGridDBColumn;
  I: integer;
begin
  form := TfrmSelecao.Create(Self);
  try
    for I := low(Values) to high(Values) do
    begin
      column := form.cxGrid1DBTableView1.CreateColumn;
      column.DataBinding.FieldName := Values[I];
    end;

    form.dtsMestre.DataSet := Self;
    if form.ShowModal = mrOk then
      Exit(Self.CurrentObject);
    Exit(nil);
  finally
    FreeAndNil(form);
  end;
end;

end.
