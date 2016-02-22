unit Acao.Controller;

interface

uses Classes, SysUtils, InstantPresentation, Controls, cxGridDBTableView;

type
  TAcaoController = class helper for TInstantSelector
  public
    function Escolher(): TObject;
  end;

implementation

{ TAcaoController }

uses Formulario.Escolha;

function TAcaoController.Escolher: TObject;
var
  form: TfrmFormularioEscolha;
  column: TcxGridDBColumn;
begin
  form := TfrmFormularioEscolha.Create(nil);
  try
    column := form.cxGrid1DBTableView1.CreateColumn;
    column.DataBinding.FieldName := 'Descricao';

    form.dtsMestre.DataSet := Self;
    if form.ShowModal = mrOk then
      Exit(Self.CurrentObject);
    Exit(nil);
  finally
    FreeAndNil(form);
  end;
end;

end.
