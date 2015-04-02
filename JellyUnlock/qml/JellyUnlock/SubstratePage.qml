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
                color: "#002928"
            }
            GradientStop {
                position: 0.25
                color: "#003e3d"
            }
            GradientStop {
                position: 0.37
                color: "#004d4c"
            }
            GradientStop {
                position: 0.50
                color: "#005e5d"
            }
            GradientStop {
                position: 0.62
                color: "#006f6e"
            }
            GradientStop {
                position: 0.75
                color: "#008381"
            }
            GradientStop {
                position: 0.87
                color: "#009291"
            }
            GradientStop {
                position: 1
                color: "#00a2a0"
            }
        }
    }
    anchors.fill: parent
    signal back;
    signal fontPage1;
    //....
    Connections{
        target:application
        //onHideClockBgChanged:{hideclockbg.checked=newstate;} //В блокировщике обрабатывается как settings[13] (подложка часов)
        onHideDateBgChanged:{hidedatebg.checked=newstate;} //В блокировщике обрабатывается как settings[14] (подложка плеера)
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            }
    }
        Flickable {
            id: flickArea
            //anchors.fill: parent
            anchors.top: statusBar.bottom;
            anchors.bottom: toolBar.top;
            anchors.left: parent.left;
            anchors.right: parent.right
            contentWidth: parent.width; contentHeight: c.height
            flickableDirection: Flickable.VerticalFlick
            clip: true
            Column{
                spacing: 10;
                id:c;
                anchors.right: parent.right
                anchors.left: parent.left
                    Text {
                        anchors.leftMargin: 5;
                        id: title
                        anchors.left: parent.left
                        text: strings[181]
                        font.pixelSize: 30;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: logo3
                        source: "image/SubstratePage.png"
                    }
                    /*Row{
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
                    }*/
                    Row{
                        id:r4;
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 25;
                        anchors.rightMargin: 22;

                        Text{
                            text: strings[183]
                            color:"white"
                            anchors.verticalCenter: hidedatebg.verticalCenter
                            font.pixelSize: 20
                        }
                        Switch{
                            id: hidedatebg;
                            onCheckedChanged:{application.ChangeSetting("zzzzhidedatebg",checked);}
                            //height:key.height-10;
                            anchors.right: parent.right
                        }
                    }
                    Button{
                        platformInverted: toolBar.platformInverted
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: mainPage.width * 0.3
                        text: strings[184]
                        onClicked: {informationDialog.open();}
                    }
            }
        }
        QueryDialog{
            id: informationDialog

            platformInverted: toolBar.platformInverted

            titleText: strings[185]
            icon: "image/note_info.svg"
            message: strings[186]

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

