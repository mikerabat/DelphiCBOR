program CBORTest;

uses
  Forms,
  ufrmCBORTest in 'ufrmCBORTest.pas' {frmCBORTest},
  cbor in '..\cbor.pas',
  cborExamples in 'cborExamples.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCBORTest, frmCBORTest);
  Application.Run;
end.
