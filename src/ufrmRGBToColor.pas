unit ufrmRGBToColor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmRGBToColor = class(TForm)
    edtR: TEdit;
    edtG: TEdit;
    edtB: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtResultado: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRGBToColor: TfrmRGBToColor;

implementation

{$R *.dfm}

function RGBToColor(const R, G, B: Byte): Integer;
begin
  Result := R or (G shl 8) or (B shl 16);
end;

procedure TfrmRGBToColor.Button1Click(Sender: TObject);
begin
  edtResultado.Text := IntToStr(RGBToColor(StrToIntDef(edtR.Text,0),StrToIntDef(edtG.Text,0),StrToIntDef(edtB.Text,0)));
end;

end.
