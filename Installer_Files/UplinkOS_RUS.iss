;##########################################################
;#``     https://kesha4.github.io/UplinkOS_rus/         ``#
;##########################################################

;Задаем требуемую версию игры
#define NeedVers "1.6"

[Setup]
AppName=UplinkOS RUS
AppVersion=21.04
AppVerName=UplinkOS RUS 21.04
DefaultDirName={code:GetAppDir}
DefaultGroupName=UplinkOS RUS
DirExistsWarning=no
AllowNoIcons=true
AppPublisher=by kesha4
AppPublisherURL=https://kesha4.github.io/UplinkOS_rus/
AppCopyright=Introversion Software, TUDOR C. STAMAT, Sergey kesha4 Makarov
OutputBaseFilename=UplinkOS_RUS_21.04_setup
WizardImageFile=InstallFiles\WizardImage.bmp
WizardSmallImageFile=InstallFiles\WizardSmallImage.bmp
SetupIconFile=InstallFiles\icon.ico
EnableDirDoesntExistWarning=true
InternalCompressLevel=ultra
Compression=lzma/ultra64

[Languages]
Name: "rus"; MessagesFile: "compiler:Languages\Russian.isl"

#include "Modules\CustomMessages.iss"
      
[Types]
Name: "full"; Description: "Полная установка"
Name: "custom"; Description: "Выборочная установка"; Flags: iscustom

[Components]
Name: "UplinkOS_RUS_noexe"; Description: "Основные файлы UplinkOS_RUS"; Types: full custom; Flags: fixed
Name: "ExeFiles"; Description: "Выберите издателя игры Uplink"; Types: full custom; Flags: fixed
Name: "ExeFiles\gog"; Description: "GOG.com"; Types: full custom; Flags: exclusive
;Name: "ExeFiles\steam"; Description: "Steam"; Types: full custom; Flags: exclusive

[Icons]                                                                                                 
Name: "{commondesktop}\UplinkOS_RUS"; Filename: "{app}\UplinkOS_RUS.exe"; IconFilename: "{app}\gfw_high.ico"
Name: "{group}\Запуск UplinkOS_RUS"; FileName: "{app}\UplinkOS_RUS.exe"; Comment: "UplinkOS_RUS.exe"; IconFilename: "{app}\gfw_high.ico"
Name: "{group}\{cm:UninstallProgram,{#SetupSetting("AppName")}}"; Filename: "{uninstallexe}"; IconFilename: "{app}\uninstall.ico"; Comment: "Удалить {#SetupSetting("AppName")} с компьютера";

[Files]
;Файлы распаковываемые в папку с игрой. Необходимы для деинсталлятора
Source: "InstallFiles\isskin.dll"; DestDir: "{app}"; Flags: ignoreversion; Attribs: hidden system;
Source: "InstallFiles\Tiger.cjstyles"; DestDir: "{app}"; Flags: ignoreversion; Attribs: hidden system;
Source: "InstallFiles\WizardImage.bmp"; DestDir: "{app}"; Flags: ignoreversion; Attribs: hidden system;
Source: "InstallFiles\WizardSmallImage.bmp"; DestDir: "{app}"; Flags: ignoreversion; Attribs: hidden system;

Source: "UplinkOS_RUS_noexe\*"; DestDir: "{app}"; Components: UplinkOS_RUS_noexe; Flags: recursesubdirs
Source: "ExeFiles\gog\*"; DestDir: "{app}"; Components: ExeFiles\gog;
;Source: "ExeFiles\steam\*"; DestDir: "{app}"; Components: ExeFiles\steam;

[Registry]
Root: HKLM; Subkey: "Software\UplinkOS RUS\Version"; ValueType: string; ValueName: "Version"; ValueData: "21.03"; Flags: uninsdeletekey

[Code]
var
  SystemPage: TWizardPage;
  ModNameLabel: TNewStaticText;
  MouseLabel, SiteLabel: TLabel;
  
  GamePathPanel, GameVersPanel: TPanel;
  FindGamePath, FindGameVers, ReqSatisfy, ModNoReq: TNewStaticText;
  GamePathMemo, GameVersMemo, GamePathFindMemo, GameVersFindMemo: TPanel;
  RenameCheckBox: TNewCheckBox;

//процедуры, для использования скина (Tiger.cjstyles)
procedure LoadSkin(lpszPath: PAnsiChar; lpszIniFileName: PAnsiChar); external 'LoadSkin@{tmp}\isskin.dll stdcall delayload';
procedure UnloadSkin; external 'UnloadSkin@{tmp}\isskin.dll stdcall delayload';
function ShowWindow(hWnd: Integer; uType: Integer): Integer; external 'ShowWindow@user32.dll stdcall';

//процедуры, которые выполняются при наведении на ссылку (левый нижний угол)
procedure SiteLabelOnClick(Sender: TObject); var ErrorCode: Integer;
begin
  ShellExec('open', 'https://kesha4.github.io/UplinkOS_rus/', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure SiteLabelMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SiteLabel.Font.Color := $00DF8600;
end;

procedure SiteLabelMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SiteLabel.Font.Color := WizardForm.Font.Color;
end;

procedure SiteLabelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  SiteLabel.Font.Color := $00FFAA2B;
end;

procedure SiteLabelMouseMove2(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  SiteLabel.Font.Color := WizardForm.Font.Color;
end;

//Ищем в реестре место расположения игры (доработать для 32 бит) (Software\WOW6432Node\GOG.com\Games\1207659033) (Software\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 1510)
function GetAppDir(Path: String): String;
begin
  if RegKeyExists(HKLM, 'Software\WOW6432Node\GOG.com\Games\1207659033') then                     // GOG для 64 битных систем
  begin
    RegQueryStringValue(HKLM, 'Software\WOW6432Node\GOG.com\Games\1207659033', 'path', Path);
    Result := Path 
  end else if RegKeyExists(HKLM, 'Software\GOG.com\Games\1207659033') then                        // GOG для 32 битных систем
  begin
    RegQueryStringValue(HKLM, 'Software\GOG.com\Games\1207659033', 'path', Path);
    Result := Path 
  end else
    Result := ExpandConstant('{pf}\GOG Galaxy\Games\Uplink')
end;

//Выполняем проверку системы на соответсвтвие моду
procedure CheckRequirements(CurPageID: Integer);
var
  Path, Vers: String;
begin
  if CurPageID=SystemPage.ID then
  begin
    //Ищем папку с игрой
    if RegValueExists(HKLM, 'Software\WOW6432Node\GOG.com\Games\1207659033', 'path') then          // GOG для 64 битных систем
    begin
      RegQueryStringValue(HKLM, 'Software\WOW6432Node\GOG.com\Games\1207659033', 'path', Path)
      GamePathFindMemo.Caption := ExpandConstant('{cm:GameDetected}');
      GamePathFindMemo.Color := $1F301E;
    end else if RegValueExists(HKLM, 'Software\GOG.com\Games\1207659033', 'path') then            // GOG для 32 битных систем
    begin
      RegQueryStringValue(HKLM, 'Software\GOG.com\Games\1207659033', 'path', Path)
      GamePathFindMemo.Caption := ExpandConstant('{cm:GameDetected}');
      GamePathFindMemo.Color := $1F301E;
    end else
    begin
      GamePathFindMemo.Caption := ExpandConstant('{cm:GameNotDetected}');
      GamePathFindMemo.Color := $191948;
      ReqSatisfy.Caption := ExpandConstant('{cm:NotReqSatisfy}');
    end;

    //Ищем и проверяем версию игры
    if RegValueExists(HKLM, 'Software\WOW6432Node\GOG.com\Games\1207659033', 'ver') then           // GOG для 64 битных систем
    begin
      RegQueryStringValue(HKLM, 'Software\WOW6432Node\GOG.com\Games\1207659033', 'ver', Vers)
      if Vers = ExpandConstant('{#NeedVers}') then
      begin
        GameVersFindMemo.Caption := ExpandConstant('{cm:GameVersDetected} ') + Vers;
        GameVersFindMemo.Color := $1F301E;
      end else begin
        GameVersFindMemo.Caption := ExpandConstant('{cm:GameVers} ') + Vers + ExpandConstant(' {cm:GameVersNotSatisfy}');
        GameVersFindMemo.Color := $191948;
        ReqSatisfy.Caption := ExpandConstant('{cm:NotReqSatisfy}');
      end
    end else if RegValueExists(HKLM, 'Software\GOG.com\Games\1207659033', 'ver') then              // GOG для 32 битных систем
    begin
      RegQueryStringValue(HKLM, 'Software\GOG.com\Games\1207659033', 'ver', Vers)
      if Vers = ExpandConstant('{#NeedVers}') then
      begin
        GameVersFindMemo.Caption := ExpandConstant('{cm:GameVersDetected} ') + Vers;
        GameVersFindMemo.Color := $1F301E;
      end else begin
        GameVersFindMemo.Caption := ExpandConstant('{cm:GameVers} ') + Vers + ExpandConstant(' {cm:GameVersNotSatisfy}');
        GameVersFindMemo.Color := $191948;
        ReqSatisfy.Caption := ExpandConstant('{cm:NotReqSatisfy}');
      end
    end else
    begin
      GameVersFindMemo.Caption := ExpandConstant('{cm:GameVersNotDetected}');
      GameVersFindMemo.Color := $191948;
      ReqSatisfy.Caption := ExpandConstant('{cm:NotReqSatisfy}');
    end;
  end;
end;

procedure RedesignWizardForm;
begin
  with WizardForm do
  begin
    Color := $000B0B0B;
    WelcomePage.Color := $000B0B0B;
    FinishedPage.Color := $000B0B0B;
    Font.Color := clWhite;
    Font.Style := [fsBold];
    Font.Size := 9;
    ClientWidth := ScaleX(690);
    ClientHeight := ScaleY(459);
    Caption := ExpandConstant('{#SetupSetting("AppName")}');
    Center;
  end;

  with WizardForm.OuterNotebook do
  begin
    SetBounds(ScaleX(223), ScaleY(60), ScaleX(467), ScaleY(350));
  end;

  with WizardForm.InnerNotebook do
  begin
    SetBounds(WizardForm.InnerNotebook.Left - ScaleX(25), ScaleY(50), ScaleX(420), ScaleY(260));
  end;

  with WizardForm.InnerPage do
  begin
    Color := $000B0B0B;
  end;
  
  with WizardForm.Bevel do
  begin
    SetBounds(ScaleX(0), ScaleY(410), ScaleX(690), ScaleY(2));
  end;

  with WizardForm.Bevel1 do
  begin
    Parent := WizardForm;
    SetBounds(ScaleX(0), ScaleY(58), ScaleX(690), ScaleY(2));
  end;
  
  with WizardForm.MainPanel do
  begin
    Parent := WizardForm;
    SetBounds(ScaleX(0), ScaleY(0), ScaleX(690), ScaleY(58));
  end;
  
  with WizardForm.WizardSmallBitmapImage do
  begin
    Left := ScaleX(633);
  end;
  
  with WizardForm.CancelButton do
  begin
    Left := ScaleX(590);
    Top := ScaleY(425);
    Font.Name := 'Tahoma';
    Font.Size := 8;
    Font.Style := [];
  end;

  with WizardForm.NextButton do
  begin
    Left := ScaleX(500);
    Top := ScaleY(425);
    Font.Name := 'Tahoma';
    Font.Size := 8;
    Font.Style := [];
  end;

  with WizardForm.BackButton do
  begin
    Left := ScaleX(410);
    Top := ScaleY(425);
    Font.Name := 'Tahoma';
    Font.Size := 8;
    Font.Style := [];
  end;

  with WizardForm.ReadyMemo do
  begin
    SetBounds(ScaleX(0), ScaleY(30), ScaleX(417), ScaleY(220));
  end;

  ModNameLabel := TNewStaticText.Create(WizardForm);
  with ModNameLabel do
  begin
    Parent := WizardForm.MainPanel;
    Font.Size := 22;
    Font.Name := 'Courier New';
    Font.Style := [fsBold];
    Font.Color := clWindowText;
    SetBounds(ScaleX(50), ScaleY(15), ScaleX(200), ScaleY(50));
    Caption := ExpandConstant('{#SetupSetting("AppName")}');
  end;
  
  MouseLabel := TLabel.Create(WizardForm);
  with MouseLabel do
  begin
    Parent := WizardForm;
    Width := WizardForm.Width;
    Height := WizardForm.Height;
    Autosize := False;
    Transparent := True;
    OnMouseMove := @SiteLabelMouseMove2;
  end;

  SiteLabel := TLabel.Create(WizardForm);
  with SiteLabel do
  begin
    Caption := ExpandConstant('{#SetupSetting("AppPublisherURL")}');
    Parent := WizardForm;
    Left := ScaleX(15);
    Top := ScaleY(425);
    Font.Name := 'Courier New';
    Cursor := crHand;
    OnClick := @SiteLabelOnClick;
    OnMouseDown := @SiteLabelMouseDown;
    OnMouseUp := @SiteLabelMouseUp;
    OnMouseMove := @SiteLabelMouseMove;
  end;
end;

//************************************************ [Начало - Компоненты страниц] ***************************************************//

////////////////////// WelcomePage //////////////////////

procedure CreatePageComponents;
begin

  with WizardForm.WizardBitmapImage do
  begin
    Parent := WizardForm;
    SetBounds(ScaleX(0), ScaleY(60), ScaleX(223), ScaleY(350));
  end;

  with TLabel.Create(WizardForm) do
  begin
    Caption := WizardForm.WelcomeLabel1.Caption;
    Parent := WizardForm.WelcomePage;
    Alignment := taCenter;
    AutoSize := False;
    Wordwrap := True;
    Font.Name := 'Courier New';
    Font.Size := 14;
    Font.Style := [fsBold];
    Transparent := True;
    SetBounds(ScaleX(30), ScaleY(45), ScaleX(407), ScaleY(45));
  end;

  with WizardForm.WelcomeLabel2 do
  begin
    Font.Name := 'Courier New';
    SetBounds(ScaleX(30), ScaleY(140), ScaleX(407), ScaleY(239));
  end;

////////////////////// WelcomePage //////////////////////
  
  with WizardForm.PageNameLabel do
  begin
    Height := ScaleY(20);
    Font.Name := 'Courier New';
    Font.Size := 12;
    Font.Color := WizardForm.Font.Color;
  end;

  with WizardForm.PageDescriptionLabel do
  begin
    Top := WizardForm.PageDescriptionLabel.Top + ScaleY(8);
    Height := ScaleY(15);
    Width := ScaleX(500);
    Font.Name := 'Courier New';
  end;

////////////////////// SystemPage //////////////////////

  SystemPage := CreateCustomPage(wpWelcome, ExpandConstant('{cm:SystemPageName}'), ExpandConstant('{cm:SystemPageDescription}'));

  ReqSatisfy := TNewStaticText.Create(WizardForm);
  with ReqSatisfy do
  begin
    Caption := ExpandConstant('{cm:ReqSatisfy}');
    Parent := SystemPage.Surface;
    Font.Name := 'Courier New';
    SetBounds(ScaleX(0), ScaleY(0), ScaleX(420), ScaleY(30));
  end;
  
  GamePathPanel := TPanel.Create(WizardForm);
  with GamePathPanel do
  begin
    Parent := SystemPage.Surface;
    Font.Name := 'Courier New';
    SetBounds(ScaleX(0), ScaleY(42), ScaleX(417), ScaleY(49));
    BevelInner := bvLowered;
  end;

  FindGamePath := TNewStaticText.Create(WizardForm);
  with FindGamePath do
  begin
    Parent := SystemPage.Surface;
    Caption := ExpandConstant('{cm:FindGamePath}');
    Font.Name := 'Courier New';
    Font.Size := 8;
    Font.Color := clWindowText;
    SetBounds(ScaleX(8), ScaleY(35), ScaleX(70), ScaleY(14));
  end;

  GamePathMemo := TPanel.Create(WizardForm);
  with GamePathMemo do
  begin
    Caption := ExpandConstant('{cm:GamePathMemo}');
    Parent := GamePathPanel;
    BevelInner := bvLowered;
    Font.Name := 'Courier New';
    Font.Size := 8;
    ParentBackground := False;
    SetBounds(ScaleX(8), ScaleY(14), ScaleX(115), ScaleY(22));
  end;

  GamePathFindMemo := TPanel.Create(WizardForm);
  with GamePathFindMemo do
  begin
    Parent := GamePathPanel;
    BevelInner := bvLowered;
    ParentBackground := False;
    Font.Name := 'Tahoma';
    Font.Size := 8;
    Font.Height := -11;
    Font.Style := [];
    SetBounds(ScaleX(130), ScaleY(14), ScaleX(279), ScaleY(22));
  end;
  
  GameVersPanel := TPanel.Create(WizardForm);
  with GameVersPanel do
  begin
    Parent := SystemPage.Surface;
    Font.Name := 'Courier New';
    SetBounds(ScaleX(0), ScaleY(106), ScaleX(417), ScaleY(49));
    BevelInner := bvLowered;
  end;

  FindGameVers := TNewStaticText.Create(WizardForm);
  with FindGameVers do
  begin
    Parent := SystemPage.Surface;
    Caption := ExpandConstant('{cm:FindGameVers}');
    Font.Name := 'Courier New';
    Font.Size := 8;
    Font.Color := clWindowText;
    SetBounds(ScaleX(8), ScaleY(99), ScaleX(85), ScaleY(14));
  end;

  GameVersMemo := TPanel.Create(WizardForm);
  with GameVersMemo do
  begin
    Caption := ExpandConstant('{cm:GameVersMemo} ') + ExpandConstant('{#NeedVers}');
    Parent := GameVersPanel;
    BevelInner := bvLowered;
    Font.Name := 'Courier New';
    Font.Size := 8;
    ParentBackground := False;
    SetBounds(ScaleX(8), ScaleY(14), ScaleX(115), ScaleY(22));
  end;

  GameVersFindMemo := TPanel.Create(WizardForm);
  with GameVersFindMemo do
  begin
    Parent := GameVersPanel;
    BevelInner := bvLowered;
    ParentBackground := False;
    Font.Name := 'Tahoma';
    Font.Size := 8;
    Font.Height := -11;
    Font.Style := [];
    SetBounds(ScaleX(130), ScaleY(14), ScaleX(279), ScaleY(22));
  end;
  
  RenameCheckBox := TNewCheckBox.Create(WizardForm);
  with RenameCheckBox do
  begin
    Caption := ExpandConstant('{cm:RenameMod}');
    Parent := SystemPage.Surface;
    Checked := True;
    Font.Name := 'Courier New';
    SetBounds(ScaleX(10), ScaleY(180), ScaleX(360), ScaleY(14));
  end;
  
  
  ModNoReq := TNewStaticText.Create(WizardForm);
  with ModNoReq do
  begin
    Caption := ExpandConstant('{cm:ModNoReq}');
    Parent := SystemPage.Surface;
    Font.Name := 'Courier New';
    SetBounds(ScaleX(0), ScaleY(245), ScaleX(460), ScaleY(14));
  end;
  
////////////////////// SystemPage //////////////////////

////////////////////// SelectDirPage //////////////////////

  WizardForm.SelectDirLabel.Font.Name := 'Courier New';

  with WizardForm.SelectDirBrowseLabel do
  begin
    Height := ScaleY(30);
    Font.Name := 'Courier New';
  end;
  
  with WizardForm.DirEdit do
  begin
    Top := ScaleY(100);
    Font.Name := 'Courier New';
    Font.Size := 8;
  end;

  with WizardForm.DirBrowseButton do
  begin
    Top := ScaleY(99);
    Font.Name := 'Tahoma';
    Font.Size := 8;
    Font.Style := [];
  end;

  with WizardForm.DiskSpaceLabel do
  begin
    Top := ScaleY(245);
    Font.Name := 'Courier New';
  end;
  
////////////////////// SelectDirPage //////////////////////

////////////////////// SelectComponentsPage //////////////////////

  with WizardForm.SelectComponentsLabel do
  begin
    Height := ScaleY(30);
    Font.Name := 'Courier New';
  end;
  
  with WizardForm.TypesCombo do
  begin
    Top := ScaleY(45);
    Font.Name := 'Courier New';
  end;

  with WizardForm.ComponentsList do
  begin
    Top := ScaleY(80);
    Height := ScaleY(155);
    Font.Name := 'Tahoma';
    Font.Size := 8;
    Font.Style := [];
  end;

  with WizardForm.ComponentsDiskSpaceLabel do
  begin
    Top := ScaleY(80);
    Font.Name := 'Courier New';
  end;
  
////////////////////// SelectComponentsPage //////////////////////

////////////////////// SelectProgramGroupPage //////////////////////

  with WizardForm.SelectStartMenuFolderLabel do
  begin
    Font.Name := 'Courier New';
  end;

  with WizardForm.SelectStartMenuFolderBrowseLabel do
  begin
    Height := ScaleY(30);
    Font.Name := 'Courier New';
  end;

  with WizardForm.GroupEdit do
  begin
    Top := ScaleY(100);
    Font.Name := 'Courier New';
    Font.Size := 8;
  end;

  with WizardForm.GroupBrowseButton do
  begin
    Top := ScaleY(99);
    Font.Name := 'Tahoma';
    Font.Size := 8;
    Font.Style := [];
  end;

  with WizardForm.NoIconsCheck do
  begin
    Top := ScaleY(245);
    Font.Name := 'Courier New';
    Width := ScaleX(250);
  end;
  
////////////////////// SelectProgramGroupPage //////////////////////

////////////////////// ReadyPage //////////////////////

  WizardForm.ReadyLabel.Font.Name := 'Courier New';
  WizardForm.ReadyMemo.Font.Name := 'Courier New';
  
////////////////////// ReadyPage //////////////////////

////////////////////// InstallingPage //////////////////////

  WizardForm.StatusLabel.Font.Name := 'Courier New';
  WizardForm.ProgressGauge.SetBounds(ScaleX(0), ScaleY(60), ScaleX(417), ScaleY(30));

  with WizardForm.FilenameLabel do
  begin
    Top := ScaleY(20);
    Font.Name := 'Courier New';
    Font.Style := [];
  end;

////////////////////// InstallingPage //////////////////////

////////////////////// FinishedPage //////////////////////

  with WizardForm.WizardBitmapImage2 do
  begin
    Parent := WizardForm;
    SetBounds(ScaleX(0), ScaleY(60), ScaleX(223), ScaleY(350));
  end;

  with TLabel.Create(WizardForm) do
  begin
    Caption := WizardForm.FinishedHeadingLabel.Caption;
    Parent := WizardForm.FinishedPage;
    Alignment := taCenter;
    AutoSize := False;
    Wordwrap := True;
    Font.Name := 'Courier New';
    Font.Size := 14;
    Font.Style := [fsBold];
    Transparent := True;
    SetBounds(ScaleX(30), ScaleY(45), ScaleX(407), ScaleY(45));
  end;

  with WizardForm.FinishedLabel do
  begin
    Font.Name := 'Courier New';
    SetBounds(ScaleX(30), ScaleY(130), ScaleX(407), ScaleY(239));
  end;
end;

////////////////////// FinishedPage //////////////////////

////////////////////// UninstallingPage //////////////////////

procedure RedesignUninstallProgressForm;
var
  UninstallBitmapImage: TBitmapImage;
begin
  with UninstallProgressForm do
  begin
    Color := $000B0B0B;
    Font.Color := clWhite;
    Font.Style := [fsBold];
    Font.Name := 'Courier New';
    Font.Size := 9;
    ClientWidth := ScaleX(690);
    ClientHeight := ScaleY(459);
    Caption := ExpandConstant('{#SetupSetting("AppName")}');
    Center;
  
    OuterNotebook.SetBounds(ScaleX(223), ScaleY(60), ScaleX(467), ScaleY(351));
    InnerNotebook.SetBounds(UninstallProgressForm.InnerNotebook.Left - ScaleX(25), ScaleY(50), ScaleX(460), ScaleY(260));
    InnerPage.Color := $000B0B0B;
    Bevel.SetBounds(ScaleX(0), ScaleY(410), ScaleX(690), ScaleY(2));
    StatusLabel.Top := ScaleY(0);
    ProgressBar.SetBounds(UninstallProgressForm.StatusLabel.Left, ScaleY(50), ScaleX(417), ScaleY(30));
  end;

  with UninstallProgressForm.PageNameLabel do
  begin
    Height := ScaleY(20);
    Font.Name := UninstallProgressForm.Font.Name;
    Font.Size := 12;
    Font.Color := UninstallProgressForm.Font.Color;
  end;

  with UninstallProgressForm.PageDescriptionLabel do
  begin
    Top := UninstallProgressForm.PageDescriptionLabel.Top + ScaleY(8);
    Height := ScaleY(15);
    Width := ScaleX(500);
  end;
  
  UninstallBitmapImage := TBitmapImage.Create(UninstallProgressForm);
  with UninstallBitmapImage do
  begin
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\WizardImage.bmp'));
    Parent := UninstallProgressForm;
    SetBounds(ScaleX(0), ScaleY(60), ScaleX(223), ScaleY(350));
  end;

  with UninstallProgressForm.WizardSmallBitmapImage do
  begin
    Bitmap.LoadFromFile(ExpandConstant('{tmp}\WizardSmallImage.bmp'));
    Left := ScaleX(633);
  end;
  
  with UninstallProgressForm.Bevel1 do
  begin
    Parent := UninstallProgressForm;
    SetBounds(ScaleX(0), ScaleY(58), ScaleX(690), ScaleY(2));
  end;

  with UninstallProgressForm.MainPanel do
  begin
    Parent := UninstallProgressForm;
    SetBounds(ScaleX(0), ScaleY(0), ScaleX(690), ScaleY(58));
  end;

  with UninstallProgressForm.CancelButton do
  begin
    Left := ScaleX(590);
    Top := ScaleY(425);
    Font.Name := 'Tahoma';
    Font.Size := 8;
    Font.Style := [];
  end;
end;

////////////////////// UninstallingPage //////////////////////

//************************************************ [Конец - Компоненты страниц] ***************************************************//

procedure ShowComponents(CurPageID: Integer);
begin
  WizardForm.PageNameLabel.Show;
  WizardForm.PageDescriptionLabel.Show;
  ModNameLabel.Hide;
  WizardForm.WelcomeLabel1.Hide;
  WizardForm.FinishedHeadingLabel.Hide;
  
  case CurPageID of
    wpWelcome:
    begin
      WizardForm.PageNameLabel.Hide;
      WizardForm.PageDescriptionLabel.Hide;
      ModNameLabel.Show;
    end;
    wpFinished:
    begin
      WizardForm.PageNameLabel.Hide;
      WizardForm.PageDescriptionLabel.Hide;
      ModNameLabel.Show;
      WizardForm.NextButton.Left := ScaleX(590);
    end;
  end;
end;

function InitializeSetup: Boolean;
begin
  ExtractTemporaryFile('isskin.dll');
  ExtractTemporaryFile('Tiger.cjstyles');

  LoadSkin(ExpandConstant('{tmp}\Tiger.cjstyles'), '');
  Result:=True;
end;

procedure InitializeWizard();
begin
  RedesignWizardForm;
  CreatePageComponents;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  ShowComponents(CurPageID);
  CheckRequirements(CurPageID);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  case CurStep of
    ssInstall: begin
      //Если в папке с игрой имеются сохранения, то переименовываем их, они не совместимы (users в users-norus)
      if RenameCheckBox.Checked then
      RenameFile(ExpandConstant('{app}\users'), ExpandConstant('{app}\users-norus'));
    end;
  end;
end;

procedure DeinitializeSetup;
begin
  ShowWindow(StrToInt(ExpandConstant('{wizardhwnd}')), 0);
  UnloadSkin;
end;

function InitializeUninstall: Boolean;
begin
  FileCopy(ExpandConstant('{app}\isskin.dll'), ExpandConstant('{tmp}\isskin.dll'), False);
  FileCopy(ExpandConstant('{app}\Tiger.cjstyles'), ExpandConstant('{tmp}\Tiger.cjstyles'), False);
  FileCopy(ExpandConstant('{app}\WizardImage.bmp'), ExpandConstant('{tmp}\WizardImage.bmp'), False);
  FileCopy(ExpandConstant('{app}\WizardSmallImage.bmp'), ExpandConstant('{tmp}\WizardSmallImage.bmp'), False);
  LoadSkin(ExpandConstant('{tmp}\Tiger.cjstyles'), '');
  Result:=True;
end;

procedure InitializeUninstallProgressForm;
begin
  RedesignUninstallProgressForm;
end;

procedure DeinitializeUninstall;
begin
  UnloadSkin;
end;

[InnoIDE_PreCompile]
Name: G:\GAMES\UplinkOS_rus\Installer_Files\PreCompile.bat;
