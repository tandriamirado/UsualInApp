unit uusualinapp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs,
  FileUtil;

type

  { TUsualInApp }

  TUsualInApp = class(TComponent)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    SystemConfigDir, UserConfigDir, SystemConfigFile, UserConfigFile,
      UserConfigFileSubdir, UserDataDir, UserDbDir, UserFirebirdFilename: String;
    ApplicationName: String;
    TmpDir: String;
    //TmpDir: PChar;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetApp;
    procedure SetConfigPaths;
  published
    { Published declarations }
    function SetTemporaries(): String;  // Needs an explicit call!
    function GetTmpFilename(FileNamePrefix: String; DestDir: String = ''): String;
  end;

procedure Register;

implementation

procedure Register;
begin
  //RegisterComponents('Netsika',[TUsualInApp]);
  RegisterComponents('System',[TUsualInApp]);
end;

{ TUsualInApp }

constructor TUsualInApp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  TmpDir := '';

  SetConfigPaths;
  SetApp;
end;

destructor TUsualInApp.Destroy;
begin
  if (TmpDir <> '') and DirectoryExists(TmpDir) then
     // if DeleteDirectory(TmpDir, True) then RemoveDirUTF8(TmpDir);
     if DeleteDirectory(TmpDir, True) then RemoveDir(TmpDir);
  inherited Destroy;
end;

procedure TUsualInApp.SetApp;
begin
  // ApplicationName := ChangeFileExt(ExtractFileName(Paramstr(0)),'');
  ApplicationName := OnGetApplicationName();
end;

procedure TUsualInApp.SetConfigPaths;
begin
  SystemConfigDir := GetAppConfigDir(true);
  UserConfigDir := GetAppConfigDir(false);
  SystemConfigFile := GetAppConfigFile(true);
  UserConfigFile := GetAppConfigFile(false);
  //UserConfigFile := UserConfigDir + ApplicationName + '.cfg';

  // Forced:
  //UserConfigFileSubdir := UserConfigDir + ApplicationName + '.cfg';
  UserConfigFileSubdir := GetAppConfigFile(false, true);

  // UserFirebirdFilename := UserConfigDir + ApplicationName + '.fdb';

  //UserDataDir := GetUserDir + '.' + ApplicationName + PathDelim + 'data' + PathDelim;
  UserDataDir := GetAppConfigDir(false) + 'datas';

  //UserDbDir := GetUserDir + '.' + ApplicationName + PathDelim + 'db' + PathDelim;
  UserDbDir := UserDataDir + PathDelim + 'db';

  //UserFirebirdFilename := UserDataDir + ApplicationName + '.fdb';
  UserFirebirdFilename := UserDbDir + ApplicationName + '.fdb';

end;

function TUsualInApp.SetTemporaries(): String;
//function TUsualInApp.SetTemporaries(): PChar;
begin
  TmpDir := GetTempFilename(GetTempDir(False), 'ntk') + PathDelim;
//TmpDir := PChar(GetTempFilename(GetTempDir(False), 'vdk') + PathDelim);
  //TmpDir := TmpDirRoot + TmpSubDirName + PathDelim;
  if not ForceDirectories(TmpDir) then
     ShowMessage('ERROR: Couldn''t create the temporary directory!');

  Result := TmpDir;
end;

function TUsualInApp.GetTmpFilename(FileNamePrefix: String; DestDir: String
  ): String;
var
  TmpDirStr, FilePrefix: String;
begin
  TmpDirStr := '';
  if (FileNamePrefix = '') then FilePrefix := 'ntk' else FilePrefix := FileNamePrefix;

  //if TmpDir = '' then TmpDirStr := GetTempDir(False)
  //   else TmpDirStr := TmpDir;
  if DestDir = '' then begin
     if TmpDir = '' then TmpDirStr := GetTempDir(False)
     else TmpDirStr := TmpDir;
  end else TmpDirStr := DestDir;

  Result := GetTempFilename(TmpDirStr, FilePrefix);
end;

end.
