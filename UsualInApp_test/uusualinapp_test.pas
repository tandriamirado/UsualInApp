unit uusualinapp_test;

//{$mode objfpc}{$H+}
{$ifdef fpc}{$mode delphi}{$H+}{$endif}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  UsualInApp, uusualinapp, ExtCtrls, ComCtrls;

type

  { TFUsualInApp_Test }

  TFUsualInApp_Test = class(TForm)
    UsualInApp1: TUsualInApp;
    LabeledEditUserFirebirdFilename: TLabeledEdit;
    LabeledEditSystemConfigDir: TLabeledEdit;
    LabeledEditSystemConfigFile: TLabeledEdit;
    LabeledEditUserConfigDir: TLabeledEdit;
    LabeledEditUserConfigFile: TLabeledEdit;
    LabeledEditUserConfigFileSubdir: TLabeledEdit;
    LabeledEditUserDataDir: TLabeledEdit;
    LabeledEditUserDbDir: TLabeledEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FUsualInApp_Test: TFUsualInApp_Test;

implementation

{ TFUsualInApp_Test }

procedure TFUsualInApp_Test.FormCreate(Sender: TObject);
begin
  LabeledEditSystemConfigDir.Text := UsualInApp1.SystemConfigDir;
  LabeledEditUserConfigDir.Text := UsualInApp1.UserConfigDir;
  LabeledEditSystemConfigFile.Text := UsualInApp1.SystemConfigFile;
  LabeledEditUserConfigFile.Text := UsualInApp1.UserConfigFile;
  LabeledEditUserConfigFileSubdir.Text:= UsualInApp1.UserConfigFileSubdir;
  LabeledEditUserDataDir.Text := UsualInApp1.UserDataDir;
  LabeledEditUserDbDir.Text := UsualInApp1.UserDbDir;
  LabeledEditUserFirebirdFilename.Text := UsualInApp1.UserFirebirdFilename;
end;

initialization
  {$I uusualinapp_test.lrs}

end.

