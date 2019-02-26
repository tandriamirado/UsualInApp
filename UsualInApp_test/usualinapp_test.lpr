program usualinapp_test;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms
  { you can add units after this }, uusualinapp_test, usualinapp;

{$IFDEF WINDOWS}{$R appsimpleutils_test.rc}{$ENDIF}

{$R *.res}

begin
  Application.Title := 'UsualInApp-Test';
  Application.Initialize;
  Application.CreateForm(TFUsualInApp_Test, FUsualInApp_Test);
  Application.Run;
end.

