program HanJosa;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  DM.Hangul in 'DM.Hangul.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
