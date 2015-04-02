QT += xml
# Add more folders to ship with the application, here
folder_01.source = qml/JellyUnlock
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

qt_components.pkg_prerules += "(0x200346DE), 1, 0, 0, {\"Qt Components\"}"
symbian:DEPLOYMENT += qt_components
mob.pkg_prerules += "(0x2002AC89), 1, 1, 3, {\"QtMobility\"}"
symbian:DEPLOYMENT += mob
TARGET="JellyUnlock"
symbian:DEPLOYMENT.display_name="dUnlock"
symbian:TARGET.UID3 = 0x20067B14
symbian:TARGET.CAPABILITY += WriteDeviceData ReadDeviceData ReadUserData PowerMgmt
CONFIG += qt-components

symbian:INCLUDEPATH+=D:/Symbian/QtSDK112/Symbian/SDKs/Symbian3Qt473/epoc32/include/mw
symbian:INCLUDEPATH+=D:\Symbian\QtSDK112\Symbian\SDKs\Symbian3Qt473\epoc32\include

locs.source=C:\workspace\dUnlock-master\JellyUnlock\lang
locs.target = C:\system\apps\JellyUnlock
symbian:DEPLOYMENTFOLDERS+=locs


wp1 =  "\"C:\\workspace\\dUnlock-master\\JellyUnlock\\meego.png\"		  -\"C:\\Data\\Images\\Android.png\" \
\"C:\\workspace\\dUnlock-master\\JellyUnlock\\IOS7.png\"		  -\"C:\\Data\\Images\\IOS7.png\" \
\"C:\\workspace\\dUnlock-master\\JellyUnlock\\SwypeUnlock.jpg\"		  -\"C:\\Data\\Images\\SwypeUnlock.jpg\" \
\"C:\\workspace\\dUnlock-master\\JellyUnlock\\splash_v.jpg\"		  -\"C:\\System\\JellyUnlock\\splash_v.jpg\" \
\"C:\\workspace\\dUnlock-master\\JellyUnlock\\splash_h.jpg\"		  -\"C:\\System\\JellyUnlock\\splash_h.jpg\" "
wp.pkg_postrules = wp1
symbian:DEPLOYMENT += wp
symbian:ICON="JellyUnlock.svg"
symbian:TARGET.EPOCHEAPSIZE = 0x19000 0x4000000
#qml.source=D:\Symbian\QtSDK\workspace\JellyUnlockSrv\qml
#qml.target = !:\\private\e48dd893\qml
#symbian:DEPLOYMENTFOLDERS+=qml

vendorinfo =  "%{\"Symbian Zone\"}" \
    ":\"Symbian Zone\""
vendor.pkg_prerules = vendorinfo
symbian:DEPLOYMENT += vendor

packageheader = "$${LITERAL_HASH}{\"dUnlock\"}, (0x20067B13), 2, 1, 6, TYPE=SA"
info.pkg_prerules=packageheader
symbian:DEPLOYMENT+=info

symbian:LIBS+=-lmgfetch -lbafl -lefsrv
symbian:LIBS+=-leikcore
symbian:LIBS+=-lavkon
symbian:LIBS+=-leiksrv
symbian:LIBS+=-lcone
symbian:LIBS+=-lapparc
symbian:LIBS+=-lapgrfx
symbian:LIBS+=-lbitgdi -lapmime -limageconversion -lws32 -lfbscli -lgdi


SOURCES += main.cpp localizer.cpp \
    application.cpp
HEADERS += localizer.h \
    application.h \
    const.h
symbian:HEADERS+=SplashControl.h
symbian:SOURCES+=SplashControl.cpp
# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

srv =  "\"C:/QtSDK/Symbian/SDKs/SymbianSR1Qt474/epoc32/release/$(PLATFORM)/$(TARGET)/JellyUnlockSrv.exe\" - \"!:\sys\bin\JellyUnlockSrv.exe\" \
\"C:/workspace/dUnlock-master/JellyUnlock/sis/resource/apps/JellyUnlockSrv.rsc\" - \"!:\resource\apps\JellyUnlockSrv.rsc\" \
\"C:/workspace/dUnlock-master/JellyUnlock/sis/resource/apps/JellyUnlockSrv.mif\" - \"!:\resource\apps\JellyUnlockSrv.mif\" \
\"C:/workspace/dUnlock-master/JellyUnlock/sis/private/10003a3f/import/apps/JellyUnlockSrv_reg.rsc\" - \"!:\private\10003a3f\import\apps\JellyUnlockSrv_reg.rsc\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/Arrow.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\Arrow.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/AndroidClock.ttf\" - \"!:\private\20067B13\qml\JellyUnlockSrv\AndroidClock.ttf\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/AndroidClock1.ttf\" - \"!:\private\20067B13\qml\JellyUnlockSrv\AndroidClock1.ttf\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/big_circle.svg\" - \"!:\private\20067B13\qml\JellyUnlockSrv\big_circle.svg\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/Button.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\Button.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/Button1.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\Button1.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/Button2.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\Button2.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/call_activated.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\call_activated.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/call_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\call_normal.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/clockbg.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\clockbg.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/datebg.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\datebg.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/camera_activated.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\camera_activated.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/camera_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\camera_normal.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/DigitalClock.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\DigitalClock.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/DigitalClock1.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\DigitalClock1.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/DroidSans.ttf\" - \"!:\private\20067B13\qml\JellyUnlockSrv\DroidSans.ttf\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/DroidSans1.ttf\" - \"!:\private\20067B13\qml\JellyUnlockSrv\DroidSans1.ttf\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/handle_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\handle_normal.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/handle_normal.svg\" - \"!:\private\20067B13\qml\JellyUnlockSrv\handle_normal.svg\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/handle_pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\handle_pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/handle_pressed.svg\" - \"!:\private\20067B13\qml\JellyUnlockSrv\handle_pressed.svg\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/Launch.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\Launch.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/main.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\main.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/Notifer.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\Notifer.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/NotiferDelegate.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\NotiferDelegate.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/Notifpanel.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\Notifpanel.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/notebg.svg\" - \"!:\private\20067B13\qml\JellyUnlockSrv\notebg.svg\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/Player.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\Player.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/playerbg.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\playerbg.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SmallClock.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SmallClock.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/shadow.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\shadow.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/sms_activated.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\sms_activated.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/sms_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\sms_normal.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/StatusBar.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\StatusBar.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/StatusBar1.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\StatusBar1.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/unlock_activated.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\unlock_activated.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/unlock_activated.svg\" - \"!:\private\20067B13\qml\JellyUnlockSrv\unlock_activated.svg\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/unlock_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\unlock_normal.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/launch_normal.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\launch_normal.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/launch_activated.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\launch_activated.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/sb.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\sb.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/LaunchArea.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\LaunchArea.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/LaunchArea1.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\LaunchArea1.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/LaunchArea2.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\LaunchArea2.qml\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/wallpaper.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\wallpaper.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/UnlockAnim.qml\" - \"!:\private\20067B13\qml\JellyUnlockSrv\UnlockAnim.qml\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/sound/unlock.mp3\" - \"!:\private\20067B13\qml\JellyUnlockSrv\sound\unlock.mp3\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/9.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\9.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/arrow-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\arrow-pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/arrow.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\arrow.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/camera-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\camera-pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/camera.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\camera.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/gd_menu_more_overflow.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\gd_menu_more_overflow.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/launch.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\launch.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/removeN-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\removeN-pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/removen.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\removen.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/settings-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\settings-pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/graphics/settings.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\graphics\settings.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/notify/call.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\notify\call.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/notify/background.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\notify\background.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/notify/bg.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\notify\bg.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/notify/sms.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\notify\sms.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/notify/email.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\notify\email.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/notify/notifpanel.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\notify\notifpanel.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/IOS7/slider.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\IOS7\slider.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/IOS7/sliderp.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\IOS7\sliderp.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/apex launcher.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\apex launcher.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/calculator 1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\calculator 1.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/calendar.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\calendar.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/clock.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\clock.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/camera.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\camera.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/contacts ziz.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\contacts ziz.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/email.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\email.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/exDialer TEL LARGE.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\exDialer TEL LARGE.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/files manager 1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\files manager 1.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/gallery.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\gallery.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/hololock.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\hololock.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/microphone.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\microphone.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/month calendar.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\month calendar.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/moviestudio.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\moviestudio.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/mxplayer.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\mxplayer.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/phone ziz.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\phone ziz.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/photo editor.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\photo editor.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/play music.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\play music.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/settings 2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\settings 2.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/panel/theme.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\panel\theme.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/next-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\next-pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/next_pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\next_pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/next.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\next.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/pause_pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\pause_pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/pause.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\pause.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/play-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\play-pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/play_pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\play_pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/play.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\play.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/playerbg.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\playerbg.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/prev-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\prev-pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/prev_pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\prev_pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/prev.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\prev.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/stop-pressed.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\stop-pressed.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/player/stop.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\player\stop.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/sound/unlock.mp3\" - \"!:\private\20067B13\qml\JellyUnlockSrv\sound\unlock.mp3\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-3g-active.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-3g-active.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-battery-low.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery-low.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-battery-verylow.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery-verylow.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-battery1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery1.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-battery2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery2.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-battery3.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery3.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-battery4.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery4.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-battery5.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery5.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-battery6.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery6.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-battery7.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery7.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-battery8.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-battery8.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-bluetooth.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-bluetooth.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-charger.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-charger.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-flight-mode.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-flight-mode.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-gsm-active.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-gsm-active.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-network0.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network0.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-network1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network1.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-network2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network2.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-network3.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network3.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-network4.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network4.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-network5.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-network5.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-no-gsm-connection.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-no-gsm-connection.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-offline.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-offline.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-silent.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-silent.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-wlan-active.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-wlan-active.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-wlan.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\icon-s-status-wlan.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_0.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_0.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_1.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_2.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_3.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_3.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_4.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_4.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_5.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_5.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_6.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_6.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_7.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_7.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_8.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_8.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_9.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_9.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_10.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_10.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_11.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_11.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_12.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_12.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_13.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_13.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_14.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_14.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_15.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_15.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_16.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_16.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_17.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_17.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_18.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_18.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_19.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_19.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_20.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_20.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_21.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_21.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_22.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_22.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_23.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_23.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_24.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_24.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_25.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_25.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_26.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_26.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_27.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_27.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_28.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_28.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_29.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_29.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_30.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_30.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_31.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_31.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_32.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_32.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_33.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_33.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_34.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_34.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_35.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_35.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_36.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_36.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_37.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_37.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_38.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_38.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_39.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_39.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_40.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_40.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_41.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_41.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_42.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_42.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_43.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_43.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_44.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_44.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_45.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_45.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_46.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_46.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_47.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_47.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_48.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_48.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_49.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_49.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_50.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_50.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_51.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_51.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_52.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_52.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_53.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_53.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_54.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_54.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_55.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_55.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_56.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_56.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_57.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_57.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_58.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_58.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_59.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_59.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_60.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_60.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_61.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_61.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_62.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_62.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_63.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_63.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_64.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_64.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_65.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_65.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_66.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_66.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_67.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_67.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_68.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_68.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_69.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_69.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_70.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_70.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_71.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_71.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_72.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_72.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_73.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_73.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_74.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_74.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_75.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_75.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_76.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_76.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_77.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_77.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_78.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_78.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_79.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_79.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_80.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_80.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_81.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_81.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_82.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_82.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_83.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_83.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_84.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_84.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_85.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_85.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_86.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_86.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_87.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_87.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_88.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_88.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_89.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_89.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_90.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_90.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_91.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_91.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_92.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_92.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_93.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_93.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_94.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_94.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_95.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_94.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_96.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_96.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_97.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_97.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_98.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_98.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_99.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_99.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_100.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_100.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim0.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim0.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim1.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim2.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim3.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim3.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim4.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim4.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim5.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim5.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim6.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim6.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim7.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim7.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim8.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim8.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim9.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim9.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim10.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim10.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim11.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim11.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim12.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim12.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim13.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim13.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim14.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim14.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim15.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim15.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim16.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim16.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim17.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim17.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim18.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim18.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim19.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim19.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim20.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim20.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim21.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim21.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim22.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim22.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim23.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim23.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim24.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim24.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim25.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim25.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim26.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim26.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim27.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim27.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim28.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim28.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim29.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim29.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim30.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim30.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim31.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim31.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim32.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim32.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim33.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim33.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim34.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim34.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim35.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim35.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim36.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim36.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim37.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim37.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim38.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim38.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim39.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim39.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim40.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim40.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim41.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim41.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim42.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim42.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim43.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim43.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim44.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim44.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim45.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim45.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim46.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim46.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim47.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim47.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim48.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim48.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim49.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim49.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim50.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim50.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim51.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim51.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim52.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim52.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim53.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim53.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim54.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim54.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim55.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim55.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim56.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim56.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim57.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim57.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim58.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim58.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim59.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim59.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim60.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim60.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim61.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim61.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim62.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim62.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim63.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim63.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim64.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim64.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim65.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim65.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim66.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim66.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim67.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim67.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim68.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim68.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim69.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim69.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim70.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim70.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim71.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim71.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim72.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim72.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim73.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim73.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim74.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim74.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim75.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim75.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim76.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim76.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim77.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim77.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim78.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim78.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim79.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim79.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim80.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim80.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim81.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim81.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim82.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim82.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim83.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim83.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim84.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim84.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim85.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim85.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim86.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim86.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim87.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim87.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim88.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim88.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim89.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim89.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim90.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim90.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim91.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim91.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim92.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim92.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim93.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim93.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim94.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim94.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim95.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim94.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim96.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim96.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim97.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim97.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim98.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim98.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim99.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim99.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_anim100.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_anim100.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_charge_animfull.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_charge_animfull.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-3g-active.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-3g-active.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-battery-low.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-battery-low.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-battery-verylow.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-battery-verylow.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-battery1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-battery1.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-battery2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-battery2.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-battery3.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-battery3.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-battery4.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-battery4.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-battery5.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-battery5.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-battery6.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-battery6.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-battery7.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-battery7.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-battery8.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-battery8.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-bluetooth.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-bluetooth.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-charger.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-charger.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-flight-mode.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-flight-mode.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-gsm-active.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-gsm-active.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-network0.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-network0.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/icon-s-status-network1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-network1.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-network2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-network2.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-network3.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-network3.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-network4.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-network4.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-network5.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-network5.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-no-gsm-connection.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-no-gsm-connection.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-offline.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-offline.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-silent.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-silent.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-wlan-active.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-wlan-active.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/icon-s-status-wlan.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\icon-s-status-wlan.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_0.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_0.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_1.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_2.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_3.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_3.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_4.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_4.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_5.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_5.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_6.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_6.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_7.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_7.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_8.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_8.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_9.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_9.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_10.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_10.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_11.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_11.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_12.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_12.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_13.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_13.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_14.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_14.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_15.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_15.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_16.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_16.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_17.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_17.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_18.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_18.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_19.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_19.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_20.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_20.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_21.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_21.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_22.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_22.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_23.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_23.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_24.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_24.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_25.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_25.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_26.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_26.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_27.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_27.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_28.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_28.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_29.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_29.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_30.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_30.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_31.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_31.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_32.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_32.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_33.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_33.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_34.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_34.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_35.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_35.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_36.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_36.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_37.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_37.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_38.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_38.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_39.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_39.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_40.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_40.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_41.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_41.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_42.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_42.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_43.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_43.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_44.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_44.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_45.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_45.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_46.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_46.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_47.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_47.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_48.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_48.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_49.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_49.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_50.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_50.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_51.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_51.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_52.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_52.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_53.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_53.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_54.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_54.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_55.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_55.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_56.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_56.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_57.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_57.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_58.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_58.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_59.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_59.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_60.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_60.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_61.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_61.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_62.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_62.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_63.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_63.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_64.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_64.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_65.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_65.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_66.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_66.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_67.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_67.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_68.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_68.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_69.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_69.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_70.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_70.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_71.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_71.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_72.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_72.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_73.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_73.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_74.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_74.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_75.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_75.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_76.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_76.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_77.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_77.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_78.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_78.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_79.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_79.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_80.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_80.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_81.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_81.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_82.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_82.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_83.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_83.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_84.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_84.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_85.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_85.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_86.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_86.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_87.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_87.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_88.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_88.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_89.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_89.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_90.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_90.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_91.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_91.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_92.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_92.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_93.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_93.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_94.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_94.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_95.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_94.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_96.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_96.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_97.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_97.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_98.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_98.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_99.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_99.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_100.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_100.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons1/battery/stat_sys_battery_charge_animfull.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons1\battery\stat_sys_battery_charge_animfull.png\" \
#\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/status-icons/battery/stat_sys_battery_full.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\status-icons\battery\stat_sys_battery_full.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/0.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\0.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/1.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\1.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/2.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\2.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/3.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\3.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/4.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\4.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/5.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\5.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/6.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\6.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/7.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\7.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/8.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\8.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/9.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\9.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/10.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\10.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/11.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\11.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/12.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\12.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/13.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\13.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/14.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\14.png\" \
\"C:/workspace/dUnlock-master/JellyUnlockSrv/qml/JellyUnlockSrv/SVG/15.png\" - \"!:\private\20067B13\qml\JellyUnlockSrv\SVG\15.png\" \
#\"C:\workspace\dUnlock-master\JellyUnlock/qml/JellyUnlock/logo_small.png\" - \"C:\System\Apps\JellyUnlock\firststart\" \
\"C:/workspace/dUnlock-master/JellyUnlock/sis/sys/bin/JellyUnlockAnim.dll\" - \"!:\sys\bin\JellyUnlockAnim.dll\" \
\"C:/workspace/dUnlock-master/JellyUnlock/sis/C_sys/bin/JellyUnlockStarter.exe\" - \"C:\sys\bin\JellyUnlockStarter.exe\" \
\"C:/workspace/dUnlock-master/JellyUnlock/sis/C_private/101f875a/import/[20067B13].rsc\" - \"C:/private/101f875a/import/[20067B13].rsc\""
srv1.pkg_postrules = srv
symbian:DEPLOYMENT += srv1

symbian:DEPLOYMENT.installer_header = "$${LITERAL_HASH}{\"dUnlock\"},(0x2002CCCF),1,1,0"


MMP_RULES+="DEBUGGABLE"

#show .qml fils only in QtCreator, not in .sis build
OTHER_FILES += qml/*.* \
    lang/strings.l16 \
    lang/strings.l1 \
    lang/lang.setting

RESOURCES += \
    JellyUnlock.qrc
