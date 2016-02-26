; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Manager"
#define MyAppVersion "1.0"
#define MySoftHouseName "Softplan"
#define MyAppPublisher "Softplan"
#define MyAppURL "http://www.softplan.com.br/"
#define MyAppExeName "manager.exe"
#define MyAppDatabaseName "DATA.FDB"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{DF5F7691-6987-4431-85C0-2B73329902C5}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MySoftHouseName}\{#MyAppName}\{#MyAppVersion}
DefaultGroupName={#MyAppName} {#MyAppVersion}
LicenseFile=.\docs\readme.txt
InfoBeforeFile=.\docs\before_install.txt
InfoAfterFile=.\docs\after_install.txt
OutputDir=..\install
OutputBaseFilename=manager_install
Compression=lzma
SolidCompression=true

[Languages]
Name: english; MessagesFile: compiler:Default.isl
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Dirs]
Name: {app}; Permissions: everyone-modify; Flags: uninsalwaysuninstall

[Files]
Source: ..\bin\Manager.exe; DestDir: {app}; Permissions: everyone-modify; Flags: ignoreversion; DestName: manager.exe
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: ..\bin\data.fdb; DestDir: {commonappdata}\{#MySoftHouseName}\{#MyAppName}\{#MyAppVersion}\Data; Permissions: everyone-modify; Flags: uninsneveruninstall onlyifdoesntexist
; ### Firebird Embeded ###
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\aliases.conf; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\fbembed.dll; DestDir: {app}; DestName: gds32.dll
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\firebird.conf; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\firebird.msg; DestDir: {app}\fb
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\ib_util.dll; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\icudt30.dll; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\icuin30.dll; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\icuuc30.dll; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\IDPLicense.txt; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\IPLicense.txt; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\Microsoft.VC80.CRT.manifest; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\msvcp80.dll; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\msvcr80.dll; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\Readme.txt; DestDir: {app}
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\intl\fbintl.conf; DestDir: {app}\fb\intl
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\intl\fbintl.dll; DestDir: {app}\fb\intl
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\udf\fbudf.dll; DestDir: {app}\fb\udf
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\udf\fbudf.sql; DestDir: {app}\fb\udf
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\udf\fbudf.txt; DestDir: {app}\fb\udf
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\udf\ib_udf.dll; DestDir: {app}\fb\udf
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\udf\ib_udf.sql; DestDir: {app}\fb\udf
Source: Recursos\Firebird-2.5.2.26540-0_Win32_embed\udf\ib_udf2.sql; DestDir: {app}\fb\udf
; ### Firebird Embeded End ###
Source: Recursos\midas.dll; DestDir: {app}
Source: Recursos\style.ini; DestDir: {app}
Source: Recursos\sandbox.list; DestDir: {app}
Source: Recursos\config.ini; DestDir: {app}
Source: Templates\DB\DB2\PG\pg.template; DestDir: {app}\Templates\DB\DB2\PG
Source: Templates\DB\DB2\PG\pro.template; DestDir: {app}\Templates\DB\DB2\PG
Source: Templates\DB\DB2\PG\sgc.template; DestDir: {app}\Templates\DB\DB2\PG
Source: Templates\DB\MSSQL\PG\pg.template; DestDir: {app}\Templates\DB\MSSQL\PG
Source: Templates\DB\MSSQL\PG\pro.template; DestDir: {app}\Templates\DB\MSSQL\PG
Source: Templates\DB\MSSQL\PG\sgc.template; DestDir: {app}\Templates\DB\MSSQL\PG
Source: Templates\DB\Oracle\PG\pg.template; DestDir: {app}\Templates\DB\Oracle\PG
Source: Templates\DB\Oracle\PG\pro.template; DestDir: {app}\Templates\DB\Oracle\PG
Source: Templates\DB\Oracle\PG\sgc.template; DestDir: {app}\Templates\DB\Oracle\PG


[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}
Name: {group}\{cm:UninstallProgram,{#MyAppName}}; Filename: {uninstallexe}
Name: {commondesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon

[Run]
Filename: {app}\{#MyAppExeName}; Description: {cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}; Flags: nowait postinstall skipifsilent
[Registry]
Root: HKCU; Subkey: SOFTWARE\{#MySoftHouseName}\{#MyAppName}\{#MyAppVersion}\Database\; ValueType: string; ValueName: DatabaseName; ValueData: {commonappdata}\{#MySoftHouseName}\{#MyAppName}\{#MyAppVersion}\Data\{#MyAppDatabaseName}; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCU; Subkey: SOFTWARE\{#MySoftHouseName}\{#MyAppName}\{#MyAppVersion}\SCM\; ValueType: string; ValueName: Workspace; Flags: createvalueifdoesntexist uninsdeletekey; ValueData: c:\
Root: HKCU; Subkey: SOFTWARE\{#MySoftHouseName}\{#MyAppName}\{#MyAppVersion}\; ValueType: string; ValueName: Caminho; ValueData: {app}; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKCU; Subkey: SOFTWARE\{#MySoftHouseName}\{#MyAppName}\{#MyAppVersion}\Sandbox\; ValueType: string; ValueName: ArquivosIni; Flags: createvalueifdoesntexist uninsdeletekey
