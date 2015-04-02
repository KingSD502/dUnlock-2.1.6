#ifndef CONST_H
#define CONST_H
#ifdef Q_OS_SYMBIAN
   #define KLangSettingFile "C:\\system\\apps\\JellyUnlock\\lang\\lang.setting"
   #define KLangFile "C:\\system\\apps\\JellyUnlock\\lang\\strings.l"
   #define KConfigFile "C:\\System\\Apps\\JellyUnlock\\config.ini"
   #define KFirstStart "C:\\System\\Apps\\JellyUnlock\\firststart"
#else
   #define KLangSettingFile "D:\\Symbian\\QtSDK\\workspace\\JellyUnlock\\lang\\lang.setting"
   #define KLangFile "D:\\Symbian\\QtSDK\\workspace\\JellyUnlock\\lang\\strings.l"
   #define KConfigFile "config.ini"
   #define KFirstStart "firststart"
#endif
#ifdef Q_OS_SYMBIAN
_LIT(KMyServer,"JellyUnlockSrv.exe");
_LIT(KMyServerStarter,"JellyUnlockStarter.exe");
#endif


const bool KAutostart=true;
const bool KWork=true;
const int KPlayer=1;
#define KPicture "file:///C:\\Data\\Images\\Android.png"
const int KZoom=1;
const int KUseSystemFont=0;
const int KHideAppPanel=0;
const int KHideNotifications=0;
const int KHideSMS=0;
const int KHidePlayerAfterClosing=0;
const int KHideClockBg=1;
const int KHideDateBg=1;
const int KHideStatusBar=0;
const int KColorStatusBar=0;
const int KColorFont=0;
const int KAnimWork=1;
const int KWhiteTheme=0;
const int KSoundUnlock=1;
const int KSoundVolume=50;
const int KSkin=0;
const QString KTextUnlock=QString::fromUtf8("Разблокировать");
const int KVibration=1;
const int KNoteHide=1;
const QString KNoteText=QString::fromUtf8("Привет! Это поле для заметок!");
const float KHorSensevity=0.5;
const float KVerSensevity=0.5;
const int KGesture=0;
const QString app1="101F4CCE";
const QString app2="101F4CD5";
const QString app3="10005901";
const QString app4="102072C3";
const QString app5="10008D39";
const QString app6="10005902";
const QString app7="101F4CCE";
const QString app8="101F4CD5";
const QString app9="10005901";
const QString app10="102072C3";
const QString app11="10008D39";
const QString app12="10005902";
const QString app13="2005EC20";
const QString app14="100058c5";
const QString app15="10005901";
const QString app16="102072C3";
const QString app17="10008D39";
const QString app18="10005902";
const QString app19="2005EC20";
const QString app20="100058c5";
const QString app21="100058c5";
const QString camapp="101F857A";
#endif // CONST_H
