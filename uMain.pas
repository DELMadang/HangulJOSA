unit uMain;

interface

uses
  System.SysUtils,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    eSource: TEdit;
    eTarget: TEdit;
    btnExecute: TButton;
    eType: TComboBox;
    procedure btnExecuteClick(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  DM.Hangul;

procedure TfrmMain.btnExecuteClick(Sender: TObject);
begin
  case etype.ItemIndex of
  0:
    eTarget.Text := Thangul.Ul(eSource.Text);
  1:
    eTarget.Text := Thangul.Iga(eSource.Text);
  2:
    eTarget.Text := Thangul.Ro(eSource.Text);
  end;
end;

end.
