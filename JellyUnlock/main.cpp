#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <application.h>
#include <QDeclarativeContext>
#include <QFile>
#include <QtDebug>
#include <QTextStream>
#include <QUrl>

#ifdef Q_OS_SYMBIAN
#include <e32debug.h>
#endif

void myMessageHandler(QtMsgType type, const char *msg)
{
        QString txt;
        switch (type) {
        case QtDebugMsg:
                txt = QString("Debug: %1").arg(msg);
                break;
        case QtWarningMsg:
                txt = QString("Warning: %1").arg(msg);
        break;
        case QtCriticalMsg:
                txt = QString("Critical: %1").arg(msg);
        break;
        case QtFatalMsg:
                txt = QString("Fatal: %1").arg(msg);
                abort();
        }
        QFile outFile("D:\\swypeunlock.txt");
        outFile.open(QIODevice::WriteOnly | QIODevice::Append);
        QTextStream ts(&outFile);
        ts << txt << endl;
#ifdef Q_OS_SYMBIAN
        TPtrC des (reinterpret_cast<const TText*>(txt.constData()),txt.length());
        RDebug::Print(des);
#endif
}


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    QScopedPointer<QmlApplicationViewer> viewer(QmlApplicationViewer::create());
    QCoreApplication::setAttribute(Qt::AA_S60DisablePartialScreenInputMode, false);
#ifdef Q_OS_SYMBIAN
    QFile file("D:\\swypeunlock.txt");
    if (file.exists()){file.remove();}
    qInstallMsgHandler(myMessageHandler);
    qDebug()<<"app obj created";
#endif
    Application* myapp=new Application(*viewer.data());
    viewer->rootContext()->setContextProperty("application",myapp);
    qDebug()<<"3 - "<<myapp<<myapp->loc;
    QStringList gestures,strings,keys,zoom,style,orient,time,playershow;
    strings=myapp->loc->GetStringsAsList();
    qDebug()<<"3.5 -"<<strings.count();
    gestures<<strings[240]<<strings[238]<<strings[239];
    keys<<strings[38]<<strings[39]<<strings[40]<<strings[41]<<strings[42]<<strings[43]<<strings[44];
    zoom<<strings[32]<<strings[33];
    style<<strings[222]<<strings[223]<<strings[230];;
    time<<strings[36]<<strings[35];
    orient<<strings[46]<<strings[59]<<strings[47];

    qDebug()<<"4";
    viewer->rootContext()->setContextProperty("strings",strings);
    viewer->rootContext()->setContextProperty("keyslist",keys);
    viewer->rootContext()->setContextProperty("zoomlist",zoom);
    viewer->rootContext()->setContextProperty("stylelist",style);
    viewer->rootContext()->setContextProperty("timelist",time);
    viewer->rootContext()->setContextProperty("gesturelist",gestures);
    viewer->rootContext()->setContextProperty("orientlist",orient);
    viewer->rootContext()->setContextProperty("appModel",myapp->appModel);
    viewer->rootContext()->setContextProperty("firstLaunch",myapp->isFirstStart);
    viewer->rootContext()->setContextProperty("lockscreens",myapp->GetAnotherLockscreens());
    qDebug()<<5;
    //myapp->ReadSettings();
    viewer->setSource(QUrl("qrc:///qml/JellyUnlock/main.qml"));
    qDebug()<<6;
    myapp->ReadSettings();
    qDebug()<<7;
    viewer->showExpanded();
    qDebug()<<"ok";
    return app->exec();
}
