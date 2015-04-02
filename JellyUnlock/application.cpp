#include "application.h"
#include <const.h>
#include <QDebug>
#ifdef Q_OS_SYMBIAN
 #include <MGFetch.h>
 #include <e32debug.h>
 #include <f32file.h>
 #include <eikenv.h>
 #include <apgcli.h>
#include <apgtask.h>
#endif
#include <QFile>

Application::Application(QmlApplicationViewer& v,QObject *parent) :
    QObject(parent),viewer(v)
{
#ifdef Q_OS_SYMBIAN
    TBuf<255> p1(_L("C:\\System\\JellyUnlock\\splash_h.jpg"));
    TBuf<255> p2(_L("C:\\System\\JellyUnlock\\splash_v.jpg"));
    splash=CSplashScreen::NewL(p2,p1);
#endif
int lang=1;
#ifdef Q_OS_SYMBIAN
lang=User::Language();
#endif
loc=new Localizer(lang,this);
QFile fs(KFirstStart);
isFirstStart=false;
if (fs.exists())
{
    fs.remove();
    QFile file(KConfigFile);
    if (file.exists()){file.remove();}
    isFirstStart=true;
}

settings=new QSettings(KConfigFile,QSettings::IniFormat);

keyMap.clear();
keyMap.insert(0,180); // menu
keyMap.insert(1,179); // lock
keyMap.insert(2,166); // power
keyMap.insert(3,196); // green
keyMap.insert(4,197); // red
keyMap.insert(5,171); // camera
keyMap.insert(6,226); // light camera


keys.clear();
settings->beginGroup("keys");
QStringList sets=settings->allKeys();
for (int i=0;i<sets.length();i++)
{
    keys.append(settings->value(sets[i],-1).toInt());
}
settings->endGroup();
if (keys.length()==0){keys.append(180);}

#ifdef Q_OS_SYMBIAN
RApaLsSession AppSession;
AppSession.Connect();
TApaAppInfo appInfo;
AppSession.GetAllApps();
TBuf<255> UidTxt;
while (AppSession.GetNextApp(appInfo)==KErrNone)
{
    HBufC* fn;
    if (AppSession.GetAppIcon(appInfo.iUid,fn)!=KErrNone){continue;}
    if (fn){delete fn;}
    if (appInfo.iCaption.Length()<2){continue;}
    TApplicationInfo info;
    info.iCaption=appInfo.iCaption;
    info.iUid=appInfo.iUid;
    apps.Append(info);
    fullApps.Append(info);
}
AppSession.Close();
TLinearOrder<TApplicationInfo> sortOrder(TApplicationInfo::Compare);
fullApps.Sort(sortOrder);
apps.Sort(sortOrder);
for (int i=0; i<fullApps.Count();i++)
{
appModel<<QString::fromRawData(reinterpret_cast<const QChar*>(apps[i].iCaption.Ptr()),apps[i].iCaption.Length());
}
#else
for (int i=0; i<20;i++)
{
appModel<<QString::number(i);
}
#endif
}
void Application::ReadSettings()
{
emit appWorkChanged(settings->value("settings/appwork",KWork).toBool());
emit autostartChanged(settings->value("settings/autostart",KAutostart).toBool());
#ifdef Q_OS_SYMBIAN
TParse parse;
QString file=settings->value("settings/picture",KPicture).toString();
file=file.replace("file:///","");
TPtrC file1 (reinterpret_cast<const TText*>(file.constData()),file.length());
CEikonEnv::Static()->FsSession().Parse(file1,parse);
TBuf<255> a=parse.NameAndExt();
file=QString::fromRawData(reinterpret_cast<const QChar*>(a.Ptr()),a.Length());
emit pictureChanged(file);

RApaLsSession ls;
ls.Connect();
TApaAppInfo info;
bool ok;
QString name;

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app1",app1).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app1Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app2",app2).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app2Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app3",app3).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app3Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app4",app4).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app4Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app5",app5).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app5Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app6",app6).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app6Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app7",app7).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app7Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app8",app8).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app8Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app9",app9).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app9Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app10",app10).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app10Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app11",app11).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app11Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app12",app12).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app12Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app13",app13).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app13Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app14",app14).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app14Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app15",app15).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app15Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app16",app16).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app16Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app17",app17).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app17Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app18",app18).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app18Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app19",app19).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app19Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app20",app20).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app20Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("apps/app21",app21).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
app21Changed(name);

ls.GetAppInfo(info, TUid::Uid((TUint32)settings->value("settings/zcamapp",camapp).toString().toULong(&ok,16)));
name=QString::fromRawData(reinterpret_cast<const QChar*>(info.iCaption.Ptr()),info.iCaption.Length());
cameraAppChanged(name);
#endif

emit zoomChanged(settings->value("settings/zoom",KZoom).toInt());
emit playerAlbumChanged(settings->value("settings/playeralbum",KPlayer).toInt());
emit useWallpaperChanged(settings->value("settings/zusewallpaper",0).toInt());
emit useSystemFontChanged(settings->value("settings/zusesystemfont",0).toInt());
emit orientationChanged(settings->value("settings/zzorientation",0).toInt());

emit hidePlayerChanged(settings->value("settings/zzzhideplayer",KHidePlayerAfterClosing).toInt());
emit hideNotificationsChanged(settings->value("settings/zzzhidenotifs",KHideNotifications).toInt());
emit hideSMSChanged(settings->value("settings/zzzhidesms",KHideSMS).toInt());
emit hideLaunchAreaChanged(settings->value("settings/zzzhidelaunch",KHideAppPanel).toInt());

emit hideClockBgChanged(settings->value("settings/zzzzhideclockbg",KHideClockBg).toInt());
emit hideDateBgChanged(settings->value("settings/zzzzhidedatebg",KHideDateBg).toInt());
emit hideStatusBarChanged(settings->value("settings/zzzzhidestatusbar",KHideStatusBar).toInt());

emit colorStatusBarChanged(settings->value("settings/zzzzzcolorstatusbar",KColorStatusBar).toInt());
emit colorFontChanged(settings->value("settings/zzzzzzcolorfont",KColorFont).toInt());
emit animWorkChanged(settings->value("settings/zzzzzzzanimwork",KAnimWork).toInt());

emit whiteThemeChanged(settings->value("settings/zzzzzzzzwhitetheme",KWhiteTheme).toInt());
emit soundUnlockChanged(settings->value("settings/zzzzzzzzzsoundunlock",KSoundUnlock).toInt());
emit soundVolumeChanged(settings->value("settings/zzzzzzzzzzsoundvolume",KSoundVolume).toInt());
emit skinChanged(settings->value("settings/zzzzzzzzzzzskin",KSkin).toInt());
emit textUnlockChanged(settings->value("settings/zzzzzzzzzzzztextunlock",KTextUnlock).toString());
emit vibrationChanged(settings->value("settings/zzzzzzzzzzzzvibratio",KVibration).toInt());
emit noteHideChanged(settings->value("settings/zzzzzzzzzzzzznotehide",KNoteHide).toInt());
emit noteTextChanged(settings->value("settings/zzzzzzzzzzzzznotetext",KNoteText).toString());

emit gestureChanged(settings->value("settings/zzzzzzzzzzzzzzgesture",KGesture).toInt());
emit horSenseChanged(settings->value("settings/zzzzzzzzzzzzzzhorsense",KVerSensevity).toFloat());
emit verSenseChanged(settings->value("settings/zzzzzzzzzzzzzzversense",KHorSensevity).toFloat());

settings->beginGroup("keys");
QStringList sets=settings->allKeys();
for (int i=0;i<sets.length();i++) settings->remove(sets[i]);
for (int i=0;i<keys.length();i++) settings->setValue(QString::number(i),keys[i]);
settings->endGroup();

settings->beginGroup("settings");
qDebug()<<settings->allKeys();
settings->endGroup();
}

void Application::ChangeSetting(QString id, QVariant value)
{
#ifdef Q_OS_SYMBIAN
    TRAPD(err,
            {
            TBuf<255> a;
            a.Append(KMyServer);
            a.Append(_L("*"));
            TFindProcess processFinder(a); // by name, case-sensitive
            TFullName result;
            RProcess processHandle;
            while ( processFinder.Next(result) == KErrNone)
            {
               User::LeaveIfError(processHandle.Open ( processFinder, EOwnerThread));
               processHandle.Kill(KErrNone);
               processHandle.Close();
            }
            });
TRAPD(err2,
        {
        TBuf<255> a;
        a.Append(KMyServerStarter);
        a.Append(_L("*"));
        TFindProcess processFinder(a); // by name, case-sensitive
        TFullName result;
        RProcess processHandle;
        while ( processFinder.Next(result) == KErrNone)
        {
           User::LeaveIfError(processHandle.Open ( processFinder, EOwnerThread));
           processHandle.Kill(KErrNone);
           processHandle.Close();
        }
        });
#endif
if (id!="")
{
if (id=="zcamapp")
{
    qDebug()<<"change camapp "<<value.toInt()<<QString::number((TUint32)apps[value.toInt()].iUid.iUid,16);
    settings->setValue("settings/"+id,QString::number((TUint32)apps[value.toInt()].iUid.iUid,16));
}
else if (id.contains(QRegExp("app."))&&id!="appwork")
{
#ifdef Q_OS_SYMBIAN
    qDebug()<<"change app "<<value.toInt()<<QString::number((TUint32)apps[value.toInt()].iUid.iUid,16);
    settings->setValue("apps/"+id,QString::number((TUint32)apps[value.toInt()].iUid.iUid,16));
#endif
}
else settings->setValue("settings/"+id,value);
settings->sync();
settings->setValue("settings/appwork",settings->value("settings/appwork",KWork).toBool());
settings->setValue("settings/autostart",settings->value("settings/autostart",KAutostart).toBool());
settings->setValue("settings/picture",settings->value("settings/picture",KPicture).toString());
settings->setValue("settings/zoom",settings->value("settings/zoom",KZoom).toInt());
settings->setValue("settings/playeralbum",settings->value("settings/playeralbum",KPlayer).toInt());
settings->setValue("settings/zusewallpaper",settings->value("settings/zusewallpaper",0).toInt());
settings->setValue("settings/zusesystemfont",settings->value("settings/zusesystemfont",0).toInt());
settings->setValue("settings/zzorientation",settings->value("settings/zzorientation",0).toInt());

settings->setValue("settings/zzzhideplayer",settings->value("settings/zzzhideplayer",KHidePlayerAfterClosing).toInt());
settings->setValue("settings/zzzhidenotifs",settings->value("settings/zzzhidenotifs",KHideNotifications).toInt());
settings->setValue("settings/zzzhidesms",settings->value("settings/zzzhidesms",KHideSMS).toInt());
settings->setValue("settings/zzzhidelaunch",settings->value("settings/zzzhidelaunch",KHideAppPanel).toInt());

settings->setValue("settings/zzzzhideclockbg",settings->value("settings/zzzzhideclockbg",KHideClockBg).toInt());
settings->setValue("settings/zzzzhidedatebg",settings->value("settings/zzzzhidedatebg",KHideDateBg).toInt());
settings->setValue("settings/zzzzhidestatusbar",settings->value("settings/zzzzhidestatusbar",KHideStatusBar).toInt());

settings->setValue("settings/zzzzzcolorstatusbar",settings->value("settings/zzzzzcolorstatusbar",KColorStatusBar).toInt());
settings->setValue("settings/zzzzzzcolorfont",settings->value("settings/zzzzzzcolorfont",KColorFont).toInt());
settings->setValue("settings/zzzzzzzanimwork",settings->value("settings/zzzzzzzanimwork",KAnimWork).toInt());

settings->setValue("settings/zzzzzzzzwhitetheme",settings->value("settings/zzzzzzzzwhitetheme",KWhiteTheme).toInt());
if (id=="zzzzzzzzwhitetheme") emit whiteThemeChanged(settings->value("settings/zzzzzzzzwhitetheme",KWhiteTheme).toInt());
settings->setValue("settings/zzzzzzzzzsoundunlock",settings->value("settings/zzzzzzzzzsoundunlock",KSoundUnlock).toInt());
settings->setValue("settings/zzzzzzzzzzsoundvolume",settings->value("settings/zzzzzzzzzzsoundvolume",KSoundVolume).toInt());
settings->setValue("settings/zzzzzzzzzzzskin",settings->value("settings/zzzzzzzzzzzskin",KSkin).toInt());
settings->setValue("settings/zzzzzzzzzzzztextunlock",settings->value("settings/zzzzzzzzzzzztextunlock",KTextUnlock).toString());
settings->setValue("settings/zzzzzzzzzzzzvibratio",settings->value("settings/zzzzzzzzzzzzvibratio",KVibration).toInt());
settings->setValue("settings/zzzzzzzzzzzzznotehide",settings->value("settings/zzzzzzzzzzzzznotehide",KNoteHide).toInt());
settings->setValue("settings/zzzzzzzzzzzzznotetext",settings->value("settings/zzzzzzzzzzzzznotetext",KNoteText).toString());
settings->setValue("settings/zzzzzzzzzzzzzzgesture",settings->value("settings/zzzzzzzzzzzzzzgesture",KGesture).toInt());
settings->setValue("settings/zzzzzzzzzzzzzzhorsense",settings->value("settings/zzzzzzzzzzzzzzhorsense",KHorSensevity).toFloat());
settings->setValue("settings/zzzzzzzzzzzzzzversense",settings->value("settings/zzzzzzzzzzzzzzversense",KVerSensevity).toFloat());
settings->setValue("apps/app1",settings->value("apps/app1",app1).toString());
settings->setValue("apps/app2",settings->value("apps/app2",app2).toString());
settings->setValue("apps/app3",settings->value("apps/app3",app3).toString());
settings->setValue("apps/app4",settings->value("apps/app4",app4).toString());
settings->setValue("apps/app5",settings->value("apps/app5",app5).toString());
settings->setValue("apps/app6",settings->value("apps/app6",app6).toString());
settings->setValue("apps/app7",settings->value("apps/app7",app7).toString());
settings->setValue("apps/app8",settings->value("apps/app8",app8).toString());
settings->setValue("apps/app9",settings->value("apps/app9",app9).toString());
settings->setValue("apps/app10",settings->value("apps/app10",app10).toString());
settings->setValue("apps/app11",settings->value("apps/app11",app11).toString());
settings->setValue("apps/app12",settings->value("apps/app12",app12).toString());
settings->setValue("spps/app13",settings->value("apps/app13",app13).toString());
settings->setValue("apps/app14",settings->value("apps/app14",app14).toString());
settings->setValue("spps/app15",settings->value("apps/app15",app15).toString());
settings->setValue("apps/app16",settings->value("apps/app16",app16).toString());
settings->setValue("spps/app17",settings->value("apps/app17",app17).toString());
settings->setValue("apps/app18",settings->value("apps/app18",app18).toString());
settings->setValue("spps/app19",settings->value("apps/app19",app19).toString());
settings->setValue("apps/app20",settings->value("apps/app20",app20).toString());
settings->setValue("apps/app21",settings->value("apps/app21",app21).toString());
settings->setValue("settings/zcamapp",settings->value("settings/zcamapp",camapp).toString());
settings->sync();
}
#ifdef Q_OS_SYMBIAN
if (settings->value("settings/appwork",KWork).toBool())
{
    RApaLsSession session;
    session.Connect();
    CApaCommandLine* cmdLine = CApaCommandLine::NewLC();
    cmdLine->SetExecutableNameL(KMyServer);
    cmdLine->SetCommandL(EApaCommandRun);
    cmdLine->SetCommandL(EApaCommandBackground);
    User::LeaveIfError( session.StartApp(*cmdLine) );
    CleanupStack::PopAndDestroy(cmdLine);
    session.Close();
}
#endif

}


void Application::EditPic()
{
#ifdef Q_OS_SYMBIAN
CDesCArray* arr=new CDesCArrayFlat(3);
MGFetch::RunL(*arr,EImageFile,EFalse);
if (arr->Count()>0)
{
    QString file=QString::fromRawData(reinterpret_cast<const QChar*>(arr->MdcaPoint(0).Ptr()),arr->MdcaPoint(0).Length());
    file="file:///"+file;
    ChangeSetting("picture",file);
    file=file.replace("file:///","");
    TParse parse;
    TPtrC file1 (reinterpret_cast<const TText*>(file.constData()),file.length());
    CEikonEnv::Static()->FsSession().Parse(file1,parse);
    TBuf<255> a=parse.NameAndExt();
    file=QString::fromRawData(reinterpret_cast<const QChar*>(a.Ptr()),a.Length());
    emit pictureChanged(file);
}
#endif
}

void Application::Exit()
{

}

int Application::isKeyChecked(int index)
{
int key=keyMap.value(index,-1);
qDebug()<<"checking key "<<key<<keys.contains(key);
if (keys.contains(key)&&key!=-1) return 1;
else return 0;
}

void Application::checkKey(int index, bool checked)
{
int key=keyMap.value(index,-1);
if (checked)
{
if (!keys.contains(key)) keys.append(key);
}
else keys.removeOne(key);
settings->beginGroup("keys");
QStringList sets=settings->allKeys();
for (int i=0;i<sets.length();i++) settings->remove(sets[i]);
for (int i=0;i<keys.length();i++) settings->setValue(QString::number(i),keys[i]);
settings->endGroup();
settings->sync();
}

int Application::keysLen()
{
    return keys.length();
}

void Application::SortApps(QString filter)
{
#ifdef Q_OS_SYMBIAN
    apps.Reset();
    appModel.clear();
    QString name;
    for (int i=0;i<fullApps.Count();i++)
    {
        name=QString::fromRawData(reinterpret_cast<const QChar*>(fullApps[i].iCaption.Ptr()),fullApps[i].iCaption.Length());
       if (name.toLower().startsWith(filter.toLower()))
       {
       apps.Append(fullApps[i]);
       appModel.append(name);
       }
    }
    viewer.rootContext()->setContextProperty("appModel",appModel);
#endif
}

void Application::KillAnotherLockScreens()
{
    QStringList list;
    list<<"SwipeUnlock";
    list<<"7Unlock";
    for (int i=0;i<list.length();i++)
        KillLockScreen(list[i]);
}

void Application::KillLockScreen(QString name)
{
    TPtrC n (static_cast<const TUint16*>(name.utf16()), name.length());
    TRAPD(err,
            {
            TBuf<255> a;
            a.Append(n);
            a.Append(_L("Srv.exe"));
            a.Append(_L("*"));
            TFindProcess processFinder(a); // by name, case-sensitive
            TFullName result;
            RProcess processHandle;
            while ( processFinder.Next(result) == KErrNone)
            {
               User::LeaveIfError(processHandle.Open ( processFinder, EOwnerThread));
               processHandle.Kill(KErrNone);
               processHandle.Close();
            }
            });
    TRAPD(err2,
        {
        TBuf<255> a;
        a.Append(n);
        a.Append(_L("Starter.exe"));
        a.Append(_L("*"));
        TFindProcess processFinder(a); // by name, case-sensitive
        TFullName result;
        RProcess processHandle;
        while ( processFinder.Next(result) == KErrNone)
        {
           User::LeaveIfError(processHandle.Open ( processFinder, EOwnerThread));
           processHandle.Kill(KErrNone);
           processHandle.Close();
        }
        });
    QString configPath;
    if (name=="SwipeUnlock") name="SwypeUnlock";
    configPath="C:\\System\\Apps\\"+name+"\\config.ini";
    QSettings* lockSettings=new QSettings(configPath,QSettings::IniFormat);
    lockSettings->setValue("settings/autostart",false);
    lockSettings->setValue("settings/appwork",false);
    lockSettings->sync();
    delete lockSettings;
    }

int Application::GetAnotherLockscreens()
    {
    int results=0;
    QStringList list;
    list<<"SwipeUnlock";
    list<<"7Unlock";
    for (int i=0;i<list.length();i++)
        if (isLockScreenLaunched(list[i])) results++;
    return results;
    }

int Application::isLockScreenLaunched(QString name)
    {
     TPtrC n (static_cast<const TUint16*>(name.utf16()), name.length());
     int err1=-1;
        TRAP(err1,
            {
            TBuf<255> a;
            a.Append(n);
            a.Append(_L("Srv.exe"));
            a.Append(_L("*"));
            TFindProcess processFinder(a); // by name, case-sensitive
            TFullName result;
            RProcess processHandle;
            User::LeaveIfError(processFinder.Next(result));
            User::LeaveIfError(processHandle.Open ( processFinder, EOwnerThread));
            processHandle.Close();
            });
    qDebug()<<name<<err1;
    if (err1==KErrNotFound) return 0;
    else return 1;
    }
void Application::HideSplash()
        {
        qDebug()<<"Hide splash";
        splash->Hide();
        }
