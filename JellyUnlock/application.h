#ifndef APPLICATION_H
#define APPLICATION_H

#include <QObject>
#include <localizer.h>
#include <QSettings>
#include <QDeclarativeContext>
#include <qmlapplicationviewer.h>

#ifdef Q_OS_SYMBIAN
#include <e32base.h>
#include <SplashControl.h>
struct TApplicationInfo
{
        TFileName iCaption;
        TUid iUid;
        static TInt Compare(const TApplicationInfo& aInfo1, const TApplicationInfo& aInfo2)
        {
                return aInfo1.iCaption.CompareC(aInfo2.iCaption);
        }
};
#endif

class Application : public QObject
{
    Q_OBJECT
public:
#ifdef Q_OS_SYMBIAN
    CSplashScreen* splash;
#endif
    explicit Application(QmlApplicationViewer& v,QObject *parent = 0);
    Localizer* loc;
    QSettings* settings;
    void ReadSettings();
    bool isFirstStart;
    QmlApplicationViewer& viewer;
    Q_INVOKABLE void ChangeSetting(QString id, QVariant value);
    int countScans;
    Q_INVOKABLE void EditPic();
    Q_INVOKABLE void Exit();
    Q_INVOKABLE int isKeyChecked(int index);
    Q_INVOKABLE int keysLen();
    Q_INVOKABLE void checkKey(int key, bool checked);
    QList<int> keys;
    QMap<int,int> keyMap;
    QStringList appModel;
#ifdef Q_OS_SYMBIAN
    RArray<TApplicationInfo> apps;
    RArray<TApplicationInfo> fullApps;
#endif
signals:
    void appWorkChanged(int newstate);
    void autostartChanged(int newstate);
    void pictureChanged(QString newpic);
    void playerAlbumChanged(int newstate);
    void zoomChanged(int newstate);
    void useWallpaperChanged(int newstate);
    void app1Changed(QString app);
    void app2Changed(QString app);
    void app3Changed(QString app);
    void app4Changed(QString app);
    void app5Changed(QString app);
    void app6Changed(QString app);
    void app7Changed(QString app);
    void app8Changed(QString app);
    void app9Changed(QString app);
    void app10Changed(QString app);
    void app11Changed(QString app);
    void app12Changed(QString app);
    void app13Changed(QString app);
    void app14Changed(QString app);
    void app15Changed(QString app);
    void app16Changed(QString app);
    void app17Changed(QString app);
    void app18Changed(QString app);
    void app19Changed(QString app);
    void app20Changed(QString app);
    void app21Changed(QString app);
    void cameraAppChanged(QString app);
    void useSystemFontChanged(int newstate);
    void notificationsChanged(int newstate);
    void orientationChanged(int newstate);
    void showAppPanelNotification(int newstate);
    void hidePlayerChanged(bool newstate);
    void hideNotificationsChanged(int newstate);
    void hideSMSChanged(int newstate);
    void hideLaunchAreaChanged(int newstate);
    void hideClockBgChanged(int newstate);
    void hideDateBgChanged(int newstate);
    void hideStatusBarChanged(int newstate);
    void colorStatusBarChanged(int newstate);
    void colorFontChanged(int newstate);
    void animWorkChanged(int newstate);
    void whiteThemeChanged(int newstate);
    void soundUnlockChanged(int newstate);
    void soundVolumeChanged(int newstate);
    void skinChanged(int newstate);
    void textUnlockChanged(QString newstate);
    void vibrationChanged(int newstate);
    void noteHideChanged(int newstate);
    void noteTextChanged(QString newstate);
    void horSenseChanged(float sense);
    void verSenseChanged(float sense);
    void gestureChanged(int newstate);
public slots:
    void SortApps(QString filter);
    void KillAnotherLockScreens();
    void KillLockScreen(QString name);
    int GetAnotherLockscreens();
    int isLockScreenLaunched(QString name);
    void HideSplash();

};

#endif // APPLICATION_H
