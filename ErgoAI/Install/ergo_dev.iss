; Script generated by the Inno Setup Script Wizard.
; Modified from xsb.iss and flora2bundle.iss
; Double click on this file to run with inno, then build-menu, compile.
; A compiled version of Ergo must exist at the location pointed to
; by the ErgoBaseDir variable below.
; A compiled version of XSB must exist at the location of XSBBaseDir

#define MyAppName "Coherent ErgoAI (development)"
#define ErgoAIVersion "3.0"

#define ErgoVersion "3.0"
#define StudioVersion "1.0"
#define XSBVersion "5.0"
#define MyAppVerName "Ergo  v. "+ErgoVersion+" (Philo), ErgoAI Studio "+StudioVersion+", and XSB "+XSBVersion
#define MyAppPublisher "Coherent Knowledge Systems"
#define MyAppURL "http://coherentknowledge.com/"
#define MyAppUrlName "ErgoAI Web Site.url"
#define FlrLicenseURL "http://www.apache.org/licenses/LICENSE-2.0"
#define FlrLicenseUrlName "Apache License Web Site.url"
#define XSBLicenseURL "http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html"
#define XSBLicenseUrlName "LGPL 2.0 License Web Site.url"
#define InstallYear 2023

;;#define ERGOAI_DIR "{reg:HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment,ERGOAI_DEV_DIR|{pf}\Coherent\ERGOAI-dev}"
#define ERGOAI_DIR "{reg:HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment,ERGOAI_DEV_DIR|{%USERPROFILE}\Coherent\ERGOAI-dev}"
;; Change H:\ERGOAI as appropriate
#define ErgoBaseDir "H:\ERGOAI\ErgoEngine\ErgoAI"
#define XSBBaseDir "H:\ERGOAI\XSB"
;;#define ErgoAIBaseDir "H:\ERGOAI"

#define ergoapp   "{app}\ErgoEngine\ErgoAI"
#define xsbapp    "{app}\XSB"
#define ergoAIapp "{app}"

[Setup]
AppName={#MyAppName}
AppVersion={#ErgoAIVersion}
AppId={#MyAppName} {#ErgoAIVersion}

AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ChangesEnvironment=yes
DefaultDirName={#ERGOAI_DIR}-{#ErgoAIVersion}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile={#ErgoBaseDir}\Install\LICENSE_ergo
InfoBeforeFile={#ErgoBaseDir}\Install\InstallMessage_ergo
OutputBaseFilename=ergoAI_dev_{#ErgoAIVersion}
Compression=lzma
SolidCompression=yes
PrivilegesRequired=none
TouchTime=none

VersionInfoVersion={#ErgoVersion}
VersionInfoCopyright=� The Research Foundation of SUNY, 1999 - {#InstallYear}; Coherent Knowledge Systems, 2013 - {#InstallYear}
VersionInfoCompany=Coherent Knowledge Systems

AllowRootDirectory=yes
UninstallFilesDir="{userdocs}\ErgoAI uninstaller"

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
Name: "default"; Description: "Standard ErgoAI installation"

[Components]
Name: "base"; Description: "Base system"; Types: full; Flags: disablenouninstallwarning
Name: "base\sources"; Description: "Base system plus the source files"; Types: full; Flags: disablenouninstallwarning
Name: "documentation"; Description: "Documentation"; Types: full; Flags: disablenouninstallwarning

[Tasks]
Name: website; Description: "&Visit Coherent Knowledge Web site"; Components: base; Flags: unchecked
Name: shortcut; Description: "&Create a desktop shortcut to run ErgoAI"; Components: base

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
BeveledLabel=ErgoAI {#ErgoVersion} � Coherent Knowledge Systems, 2013 - {#InstallYear}

[Dirs]
Name: "{#ergoAIapp}" ; Permissions: users-modify users-full
Name: "{userdocs}\ErgoAI uninstaller"

[Files]
Source: "{#ErgoBaseDir}\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\"; Components: base; Flags: ignoreversion recursesubdirs
Source: "{#ErgoBaseDir}\ergo_sanity_check.bat"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\"; Components: base; Flags: ignoreversion recursesubdirs
Source: "{#ErgoBaseDir}\runergo.bat"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\"; Components: base; Flags: ignoreversion recursesubdirs

Source: "{#ErgoBaseDir}\LICENSE_ergo"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\"; Components: base; Flags: ignoreversion recursesubdirs
Source: "{#ErgoBaseDir}\rlwrap_keywords.txt"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\"; Components: base; Flags: ignoreversion

Source: "{#ErgoBaseDir}\etc\ergoAI-desktop-*.ico"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\etc"; Components: base; Flags: ignoreversion recursesubdirs

Source: "{#ErgoBaseDir}\*.P"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\*.H"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\makeergo.bat"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\.ergo_buildinfo.P"; Excludes: "CVS"; DestDir: "{#ergoapp}\"; Components: base; Flags: ignoreversion recursesubdirs 

Source: "{#ErgoBaseDir}\AT\*.flr"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\AT"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\AT\include\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\AT\include"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\AT\prolog\*.P"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\AT\prolog"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\AT\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\AT"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\closure\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\closure"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\closure\*.fli"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\closure"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\closure\*.inc"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\closure"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\closure\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\closure"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\closure\extensions\*.inc"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\closure\extensions"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\datatypes\*.P"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\datatypes"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\datatypes\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\datatypes"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\debugger\*.dat"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\debugger"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\debugger\*.P"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\debugger"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\debugger\*.in"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\debugger"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\debugger\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\debugger"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\demos\*.flr"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\demos"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\demos\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\demos"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\demos\sgml\*.flr"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\demos\sgml"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\demos\xpath\*.flr"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\demos\xpath"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\demos\sgml\expectedoutput"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\demos\expectedoutput"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\demos\xpath\expectedoutput"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\xpath\expectedoutput"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\demos\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\demos"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

;; Not distributing Ergo manuals any more
;;Source: "{#ErgoBaseDir}\docs\*.pdf"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\docs"; Components: documentation; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\docs\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\docs"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\emacs\*.el*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\emacs"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\emacs\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\emacs"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\emacs\README"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\emacs"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\flrincludes\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\flrincludes"; Components: base; Flags: ignoreversion recursesubdirs 

Source: "{#ErgoBaseDir}\genincludes\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\genincludes"; Components: base; Flags: ignoreversion recursesubdirs 

Source: "{#ErgoBaseDir}\genincludes\*.fli"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\genincludes"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\genincludes\*.inc"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\genincludes"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\genincludes\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\genincludes"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\headerinc\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\headerinc"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\includes\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\includes"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs


Source: "{#ErgoBaseDir}\lib\*.flr"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\lib"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\lib\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\lib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\lib\include\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\lib\include"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\libinc\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\libinc"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\ergo_libinc\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\ergo_libinc"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs


Source: "{#ErgoBaseDir}\cc\*.P"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\cc"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\cc\prolog2hilog.*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\cc"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\cc\flora_ground.*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\cc"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\cc\flora_cc_prefix.h"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\cc"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\cc\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\cc"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\cc\NMakefile64.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\cc"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\cc\windows64\*.dll"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\cc\windows64"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\cc\windows64\*.exp"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\cc\windows64"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\cc\windows64\*.lib"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\cc\windows64"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\cc\C_calling_Ergo\*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\cc\C_calling_Ergo"; Components: base; Flags: ignoreversion recursesubdirs 

Source: "{#ErgoBaseDir}\pkgs\*.flr"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\pkgs"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\pkgs\include\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\pkgs\include"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\pkgs\prolog\*.P"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\pkgs\prolog"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\pkgs\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\pkgs"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\pkgsinc\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\pkgsinc"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\syslib\*.P"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\syslib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\syslib\*.H"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\syslib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\syslib\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\syslib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\ergo_syslib\*.P"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\ergo_syslib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\ergo_syslib\*.H"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\ergo_syslib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\ergo_syslib\NMakefile.mak"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\ergo_syslib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\syslibinc\*.flh"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\syslibinc"; Components: base; Flags: ignoreversion recursesubdirs 

Source: "{#ErgoBaseDir}\java\*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\java"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

;;;;;;;; Ergo specific subdirs ;;;;;;;;;;

Source: "{#ErgoBaseDir}\extensions\*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\extensions"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\opt\*.P"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\opt"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#ErgoBaseDir}\ergo_lib\*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\ergo_lib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\ergo_pkgs\*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\ergo_pkgs"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#ErgoBaseDir}\ergo_demos\*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\ergo_demos"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs


;; copy python interface
Source: "{#ErgoBaseDir}\python\*.py"; Excludes: ".*,*~"; DestDir: "{#ergoapp}\python"; Components: base; Flags: ignoreversion
Source: "{#ErgoBaseDir}\python\*.bat"; Excludes: ".*,*~"; DestDir: "{#ergoapp}\python"; Components: base; Flags: ignoreversion
Source: "{#ErgoBaseDir}\python\pyergo\*.py"; Excludes: ".*,*~"; DestDir: "{#ergoapp}\python\pyergo"; Components: base; Flags: ignoreversion
Source: "{#ErgoBaseDir}\python\pyxsb\*.py"; Excludes: ".*,*~"; DestDir: "{#ergoapp}\python\pyxsb"; Components: base; Flags: ignoreversion


;;;; .xwam's are at the end so they will have later time stamps ;;;;;;

Source: "{#ErgoBaseDir}\opt\*.xwam"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\opt"; Components: base; Flags: ignoreversion touch recursesubdirs createallsubdirs


;; XSB files
Source: "{#XSBBaseDir}\README"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\"; Components: base; Flags: ignoreversion
Source: "{#XSBBaseDir}\LICENSE"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\"; Components: base; Flags: ignoreversion

Source: "{#XSBBaseDir}\bin\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\bin"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\build\*"; Excludes: ".*,CVS,*.cache"; DestDir: "{#xsbapp}\build"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\config\x64-pc-windows\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\config\x64-pc-windows"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\pthreads\Pre-built\lib\pthreadVSE1.dll"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\config\i686-pc-cygwin-mt\bin"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#XSBBaseDir}\syslib\*.xwam"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\syslib"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\cmplib\*.xwam"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\cmplib"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\lib\*.xwam"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\lib"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\prolog-commons\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\prolog-commons"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\prolog_includes\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\prolog_includes"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\emu\*.h"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\emu"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\emu\debugs\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\emu\debugs"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\emu\orastuff\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\emu\orastuff"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#XSBBaseDir}\syslib\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\syslib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\cmplib\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\cmplib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\lib\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\lib"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\prolog-commons\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\prolog-commons"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\prolog_includes\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\prolog_includes"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\emu\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\emu"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\etc\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\etc"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\gpp\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\gpp"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs

;; Not distributing XSB manuals any more
;;Source: "{#XSBBaseDir}\docs\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\docs"; Components: documentation; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\examples\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\examples"; Components: base\sources; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\packages\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\packages"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#XSBBaseDir}\pthreads\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\pthreads"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\prolog-commons\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\prolog-commons"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\docs\userman\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\docs\userman"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#XSBBaseDir}\docs\JupyterNotebooks\*"; Excludes: ".*,CVS,*~"; DestDir: "{#xsbapp}\docs\JupyterNotebooks"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs


;;;;;;;; ErgoAI specific subdirs ;;;;;;;;;;

Source: "{#ErgoBaseDir}\Studio_scripts\*.exe"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoAIapp}"; Components: base; Flags: ignoreversion

Source: "{#ErgoBaseDir}\Install\*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\Install"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

;;; OWL/SPARQL tools
Source: "{#ErgoBaseDir}\Tools\jena\*"; Excludes: ".*,CVS,*~"; DestDir: "{#ergoapp}\Tools\jena"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs


[INI]
Filename: "{#ergoAIapp}\{#MyAppUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#MyAppURL}"; Components: base
Filename: "{#ergoAIapp}\{#FlrLicenseUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#FlrLicenseURL}"; Components: base
Filename: "{#ergoAIapp}\{#XSBLicenseUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#XSBLicenseURL}"; Components: base


[Icons]
Name: "{userdesktop}\ErgoAI Studio (dev)"; Filename: "{#ergoAIapp}\runErgoAI.exe" ; Comment: "Runs ErgoAI"; WorkingDir: "{userdocs}"; Components: base; IconFilename: "{#ergoapp}\etc\ergoAI-desktop-studio.ico"; Tasks: shortcut

Name: "{userdesktop}\ErgoAI Reasoner (dev)"; Filename: "cmd"; Parameters: "/k """"{#ergoapp}\runergo.bat""""" ; Comment: "Runs ErgoAI in batch mode"; WorkingDir: "{userdocs}"; Components: base; IconFilename: "{#ergoapp}\etc\ergoAI-desktop-reasoner.ico"; Tasks: shortcut

Name: "{group}\ErgoAI Studio (dev)"; Filename: "{#ergoAIapp}\runErgoAI.exe" ; Comment: "Runs ErgoAI"; WorkingDir: "{userdocs}"; Components: base; IconFilename: "{#ergoapp}\etc\ergoAI-desktop-studio.ico"

Name: "{group}\ErgoAI Reasoner (dev)"; Filename: "cmd"; Parameters: "/k """"{#ergoapp}\runergo.bat""""" ; Comment: "Runs ErgoAI in batch mode"; WorkingDir: "{userdocs}"; Components: base; IconFilename: "{#ergoapp}\etc\ergoAI-desktop-reasoner.ico"; Tasks: shortcut

Name: "{group}\ErgoAI License"; Filename: "{#FlrLicenseURL}"; Components: base

Name: "{group}\Web Site"; Filename: "{#MyAppURL}"; Components: base

Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; Components: base

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "ERGOAI_DEV_DIR"; ValueData: "{#ergoAIapp}"; Components: base; Flags: deletevalue uninsdeletevalue

[Run]
; If we are on x64, will use xsb64.bat
Filename: "cmd" ; Parameters: "/c """"{#ergoapp}\ergo_sanity_check.bat"" ""{#xsbapp}\bin\xsb64"""""; WorkingDir: "{#ergoapp}"; Check: Is64BitInstallMode
; Otherwise, will use xsb.bat
Filename: "cmd" ; Parameters: "/c """"{#ergoapp}\ergo_sanity_check.bat"" ""{#xsbapp}\bin\xsb"""""; WorkingDir: "{#ergoapp}"; Check: not Is64BitInstallMode

Filename: "{#ergoAIapp}\{#MyAppUrlName}"; Flags: shellexec nowait; Tasks: website

[UninstallDelete]
Type: filesandordirs; Name: "{#ergoAIapp}"; Components: base
Type: filesandordirs; Name: "{group}"; Components: base



;;; Local Variables: 
;;; eval: (auto-fill-mode 0)
;;; End:
