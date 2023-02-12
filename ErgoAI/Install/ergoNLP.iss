; Script generated by the Inno Setup Script Wizard.
; Modified from ergo_dev.iss
; Double click on this file to run with inno, then build-menu, compile.
; A compiled version of Stanford CoreNLP must exist at the location pointed to
; by the SCNBaseDir variable below.

#define MyAppName "Coherent ErgoNLP Plugin"
#define SCNVersion "3.3"

#define MyAppPublisher "Coherent Knowledge Systems"
#define MyAppURL "http://nlp.stanford.edu/software/corenlp.shtml"
#define MyAppUrlName "Stanford CoreNLP Web Site.url"
#define SCNLicenseURL "http://www.gnu.org/licenses/gpl-2.0.html"
#define SCNLicenseUrlName "GNU General Public License, version 2 or later"

#define ERGOAI_DIR "{reg:HKLM\SYSTEM\CurrentControlSet\Control\Session
#Manager\Environment,ERGOAI_NLP_DIR|{pf}\Coherent\ErgoAI}"
#define ErgoBaseDir "H:\FLORA\ergoAI\Ergo"
#define ErgoNLPBaseDir "H:\FLORA\ergoAI\NLP"

#define ergoNLPapp   "{app}\NLP"
#define ergoAIapp      "{app}"

[Setup]
AppName={#MyAppName}
AppVersion={#SCNVersion}
AppId={#MyAppName} {#SCNVersion}

AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ChangesEnvironment=yes
DefaultDirName={#ERGOAI_DIR}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile={#ErgoBaseDir}\ergosuite\install\LICENSE_SCN
InfoBeforeFile={#ErgoBaseDir}\ergosuite\install\InstallMessage_SCN
OutputBaseFilename=ergoNLP
Compression=lzma
SolidCompression=yes
PrivilegesRequired=none
TouchTime=none

VersionInfoCompany=Coherent Knowledge Systems

AllowRootDirectory=yes
UninstallFilesDir="{userdocs}\ErgoNLP uninstaller"

MinVersion=0,5.1

; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
; On all other architectures it will install in "32-bit mode".
ArchitecturesInstallIn64BitMode=x64
; Note: We don't set ProcessorsAllowed because we want this
; installation to run on all architectures (including Itanium,
; since it's capable of running 32-bit code too).

[Types]
Name: "full"; Description: "Full ErgoNLP Plugin installation"

[Components]
Name: "base"; Description: "Base system"; Types: full; Flags: disablenouninstallwarning
; Name: "documentation"; Description: "Documentation"; Types: full; Flags: disablenouninstallwarning

[Tasks]
Name: website; Description: "&Visit Stanford CoreNLP Web site"; Components: base; Flags: unchecked

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
BeveledLabel=Standord CoreNLP {#SCNVersion} � The Stanford Natural Language Processing Group

[Dirs]
Name: "{#ergoAIapp}" ; Permissions: users-modify users-full
Name: "{userdocs}\ErgoNLP uninstaller"

[Files]
Source: "{#ErgoNLPBaseDir}\*.jar"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoNLPapp}\"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

[INI]
Filename: "{#ergoAIapp}\{#MyAppUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#MyAppURL}"; Components: base
Filename: "{#ergoAIapp}\{#SCNLicenseUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#SCNLicenseURL}"; Components: base


[Icons]
Name: "{group}\Stanford CoreNLP License"; Filename: "{#SCNLicenseURL}"; Components: base

Name: "{group}\Web Site"; Filename: "{#MyAppURL}"; Components: base

Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; Components: base

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "ERGOAI_NLP_DIR"; ValueData: "{#ergoNLPapp}"; Components: base; Flags: deletevalue uninsdeletevalue

[Run]
Filename: "{#ergoAIapp}\{#MyAppUrlName}"; Flags: shellexec nowait; Tasks: website

[UninstallDelete]
Type: filesandordirs; Name: "{#ergoNLPapp}"; Components: base
Type: filesandordirs; Name: "{group}"; Components: base

