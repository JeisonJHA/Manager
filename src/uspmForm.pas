unit uspmForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TspmForm = class(TForm)
  private
    { Private declarations }
  public
    procedure PassarParametro(const psParametro: string; const pvValor: variant); virtual;
  end;

var
  spmForm: TspmForm;

implementation

{$R *.dfm}

{ TspmForm }


{ TspmForm }

procedure TspmForm.PassarParametro(const psParametro: string;
  const pvValor: variant);
begin
//
end;

end.
