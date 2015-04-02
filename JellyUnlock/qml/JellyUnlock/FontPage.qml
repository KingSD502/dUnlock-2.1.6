// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
Page{
    Rectangle {
        id: background
        x: 0
        y: 0
        width: 640
        height: 640
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#2f2f30"
            }
            GradientStop {
                position: 0.25
                color: "#3d3d3d"
            }
            GradientStop {
                position: 0.37
                color: "#484848"
            }
            GradientStop {
                position: 0.50
                color: "#565555"
            }
            GradientStop {
                position: 0.62
                color: "#626162"
            }
            GradientStop {
                position: 0.75
                color: "#706f70"
            }
            GradientStop {
                position: 0.87
                color: "#7d7d7d"
            }
            GradientStop {
                position: 1
                color: "#8c8c8c"
            }
        }
    }
    anchors.fill: parent
    signal back;
    signal fontPage1;
    signal fontPage2;
    signal goToFontPage1Tab1;
    signal goToFontPage1Tab2;
    //....
    Connections{
        target:application
        onColorFontChanged:{colorfont.checked=newstate;} //В блокировщике обрабатывается как settings[17] (цвет шрифта часов)
        onUseSystemFontChanged:{systemfont.checked=newstate;}//В блокировщике обрабатывается как settings[6] (Родной шрифт или KitKat)
        onHideClockBgChanged:{hideclockbg.checked=newstate;} //В блокировщике обрабатывается как settings[13] (подложка часов)
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            }
       }
    TabBar {
        id: tabBar
        platformInverted: toolBar.platformInverted
        anchors { left: parent.left; right: parent.right; top: parent.top }
        TabButton { tab: tab1content; text: strings[215]; platformInverted: toolBar.platformInverted}
        TabButton { tab: tab2content; text: strings[214]; platformInverted: toolBar.platformInverted}
        //TabButton { tab: tab3content; text: strings[168] }
    }
    TabGroup {
        id: tabGroup
        anchors { left: parent.left; right: parent.right; top: tabBar.bottom; bottom: parent.bottom }

        // define the content for tab 1
        Page {
            id: tab1content
            Column{
                spacing: 10;
                id:c;
                anchors.right: parent.right
                anchors.left: parent.left
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: logo3
                        source: "image/FontPage.png"
                    }
                    Row{
                        id:r3;
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 25;
                        anchors.rightMargin: 22;
                        Text{
                            text: strings[182]
                            color:"white"
                            font.pixelSize: 20
                            anchors.verticalCenter: hideclockbg.verticalCenter
                        }
                        Switch{
                            id: hideclockbg;
                            onCheckedChanged:{application.ChangeSetting("zzzzhideclockbg",checked);}
                            anchors.right: parent.right
                        }
                    }
                    Button{
                        platformInverted: toolBar.platformInverted
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: mainPage.width * 0.3
                        text: strings[103]
                        onClicked: {informationDialog.open();}
                    }
                    Button{
                        platformInverted: toolBar.platformInverted
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: mainPage.width * 0.7
                        text: strings[104]
                        onClicked: {goToFontPage1Tab1();}//Здесь должен быть tab1content из fontPage1.qml
                    }
            }
     }
        Page {
            id: tab2content
            Column{
                    spacing: 10;
                    id:c1;
                    anchors.right: parent.right
                    anchors.left: parent.left
                        Image {
                            anchors.horizontalCenter: parent.horizontalCenter
                            id: logo2
                            source: "image/FontPage.png"
                        }
                    Row{
                        id:r7;
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 25;
                        anchors.rightMargin: 22;
                        Text{
                            text: strings[101]
                            color:"white"
                            font.pixelSize: 20
                            wrapMode: Text.WordWrap
                            anchors.left: parent.left
                            anchors.right: systemfont.left
                            anchors.verticalCenter: systemfont.verticalCenter
                        }
                        Switch{
                            id:systemfont;
                            onCheckedChanged:{application.ChangeSetting("zusesystemfont",checked);}
                            anchors.right: parent.right
                        }
                    }

                    Row{
                        id:r5;
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 25;
                        anchors.rightMargin: 22;

                        Text{
                            text: strings[102]
                            color:"white"
                            anchors.verticalCenter: colorfont.verticalCenter
                            font.pixelSize: 20
                        }
                        Switch{
                            id: colorfont;
                            onCheckedChanged:{application.ChangeSetting("zzzzzzcolorfont",checked);}
                            //height:key.height-10;
                            anchors.right: parent.right
                        }
                        visible:!hideclockbg.checked
                    }

                    Button{
                        platformInverted: toolBar.platformInverted
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: mainPage.width * 0.9
                        text: strings[216]
                        onClicked: {goToFontPage1Tab2();}//а здесь tab2content из fontaPage1.qml
                    }
            }
          }
        }
        QueryDialog{
            id: informationDialog

            platformInverted: toolBar.platformInverted

            titleText: strings[105]
            icon: "image/note_info.svg"
            message: strings[106]

            acceptButtonText: "Ok"
        }
        Image {
            id: statusBar
            opacity: 0
        }
    ToolBar {
        id: toolBar
        anchors.bottom: parent.bottom
        tools: ToolBarLayout {
            id: toolBarLayout
            ToolButton {
                flat: true
                id:backbtn;
                platformInverted: toolBar.platformInverted
                iconSource: "toolbar-back.png"
                onClicked: {back();}
            }
            ToolButton {
                flat: true
                iconSource: "image/ovi.png"
                onClicked: {Qt.openUrlExternally("http://store.ovi.com/publisher/Alexander+Fokin/");}
            }
            ToolButton {
                flat: true
                iconSource: "image/VK1.png"
                onClicked: {Qt.openUrlExternally("http://vk.com/symbian_zone/");}
        }
        }
    }
}

