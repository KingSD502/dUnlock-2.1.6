import QtQuick 1.1
import com.nokia.symbian 1.1

PageStackWindow {
    id: pgs
    //platformSoftwareInputPanelEnabled: true
    initialPage: mainPage

    showStatusBar: true
    showToolBar: true
    MainPage{
        id: mainPage
        onAppsPage:{pgs.pageStack.replace(appPage);} // где у тебя страница то?
        onAppsPage1:{pgs.pageStack.replace(appPage1);}
        onAppsPage2:{pgs.pageStack.replace(appPage2);}
        onCameraPage:{pgs.pageStack.replace(cameraPage);}
        onMusicPage:{pgs.pageStack.replace(musicPage);}
        onSetingsPage:{pgs.pageStack.replace(setingsPage);}
        onNotificationsPage: {pgs.pageStack.replace (notificationsPage);}
        onStatusPage: {pgs.pageStack.replace (statusPage);}
        onFontPage: {pgs.pageStack.replace (fontPage);}
        onSubstratePage:{pgs.pageStack.replace (substratePage);}
        onAnimPage: {pgs.pageStack.replace (animPage);}
        onThemPage: {pgs.pageStack.replace (themPage);}
        onStylePage: {pgs.pageStack.replace (stylePage);}
        onIosPage: {pgs.pageStack.replace (iosPage);}
        onNotePage: {pgs.pageStack.replace (notePage);}
        onSwypeunlockPage: {pgs.pageStack.replace (swypeunlockPage);}
        onInformationPage: {pgs.pageStack.replace (informationPage)}
    }
    InformationPage{
        onUpdatePage1: {pgs.pageStack.replace (updatePage1);}
        onUpdatePage2: {pgs.pageStack.replace (updatePage2);}
        onUpdatePage3: {pgs.pageStack.replace (updatePage3);}
        onUpdatePage4: {pgs.pageStack.replace (updatePage4);}
        onUpdatePage5: {pgs.pageStack.replace (updatePage5);}
        onHelpPage1: {pgs.pageStack.replace (helpPage1);}
        onHelpPage2: {pgs.pageStack.replace (helpPage2);}
        onHelpPage3: {pgs.pageStack.replace (helpPage3);}
        onHelpPage4: {pgs.pageStack.replace (helpPage4);}
        onContactPage: {pgs.pageStack.replace (contactPage);}
        id: informationPage
        onBack:pgs.pageStack.replace(mainPage);
        }
    AnimPage{
        onAnimPage1: {pgs.pageStack.replace (animPage1);}
        id: animPage
        onBack:pgs.pageStack.replace(mainPage);
    }
    AnimPage1{
        id: animPage1
        onBack:pgs.pageStack.replace(animPage);
    }
    AppsPage{
        id: appPage
        onBack:pgs.pageStack.replace(mainPage);
    }
    AppsPage1{
        id: appPage1
        onBack:pgs.pageStack.replace(mainPage);
    }
    AppsPage2{
        id: appPage2
        onBack:pgs.pageStack.replace(mainPage);
    }
    CameraPage{
        id: cameraPage
        onBack:pgs.pageStack.replace(mainPage);
    }
    FontPage{
        onFontPage1: {pgs.pageStack.replace (fontPage1);}
        onFontPage2: {pgs.pageStack.replace (fontPage2);}
        onGoToFontPage1Tab1: {pgs.pageStack.replace (fontPage1); fontPage1.openTab1();}
        onGoToFontPage1Tab2: {pgs.pageStack.replace (fontPage1); fontPage1.openTab2();}
        id: fontPage
        onBack:pgs.pageStack.replace(mainPage);
    }
    FontPage1{
        id: fontPage1
        onBack:pgs.pageStack.replace(fontPage);

    }
    FontPage2{
        id: fontPage2
        onBack:pgs.pageStack.replace(fontPage);
    }
    MusicPage{
        id: musicPage
        onBack:pgs.pageStack.replace(mainPage);
    }
    SetingsPage{
        id: setingsPage
        onBack:pgs.pageStack.replace(mainPage);
    }
    StatusPage{
        id: statusPage
        onBack:pgs.pageStack.replace(mainPage);
    }
    SubstratePage{
        id: substratePage
        onBack:pgs.pageStack.replace(mainPage);
    }
    SwypeunlockPage{
        id: swypeunlockPage
        onBack:pgs.pageStack.replace(mainPage);
    }
    StylePage{
        id: stylePage
        onBack:pgs.pageStack.replace(mainPage);
    }
    IosPage{
       id: iosPage
       onBack:pgs.pageStack.replace(mainPage);
    }
    ThemPage{
        id: themPage
        onBack:pgs.pageStack.replace(mainPage);
    }
    NotificationsPage{
        id: notificationsPage
        onBack:pgs.pageStack.replace(mainPage);
    }
    NotePage{
        id: notePage
        onBack:pgs.pageStack.replace(mainPage);
    }
    UpdatePage1{
        id: updatePage1
        onBack:pgs.pageStack.replace(informationPage);
    }
    UpdatePage2{
        id: updatePage2
        onBack:pgs.pageStack.replace(informationPage);
    }
    UpdatePage3{
        id: updatePage3
        onBack:pgs.pageStack.replace(informationPage);
    }
    UpdatePage4{
        id: updatePage4
        onBack:pgs.pageStack.replace(informationPage);
    }
    UpdatePage5{
        id: updatePage5
        onBack:pgs.pageStack.replace(informationPage);
    }
    HelpPage1{
        id: helpPage1
        onBack:pgs.pageStack.replace(informationPage);
    }
    HelpPage2{
        id: helpPage2
        onBack:pgs.pageStack.replace(informationPage);
    }
    HelpPage3{
        id: helpPage3
        onBack:pgs.pageStack.replace(informationPage);
    }
    HelpPage4{
        id: helpPage4
        onBack:pgs.pageStack.replace(informationPage);
    }
}


