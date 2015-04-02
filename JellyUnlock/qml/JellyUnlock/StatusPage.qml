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
                color: "#051407"
            }

            GradientStop {
                position: 0.25
                color: "#071b0b"
            }

            GradientStop {
                position: 0.37
                color: "#0a260f"
            }

            GradientStop {
                position: 0.50
                color: "#0e3313"
            }

            GradientStop {
                position: 0.62
                color: "#124219"
            }

            GradientStop {
                position: 0.75
                color: "#154f1e"
            }

            GradientStop {
                position: 0.87
                color: "#185a22"
            }

            GradientStop {
                position: 1
                color: "#1c6827"
            }
        }
    }
    signal back;
    Connections{
        target:application
        onHideStatusBarChanged:{hidestatusbar.checked=newstate;} //В блокировщике обрабатывается как settings[15]
        onColorStatusBarChanged:{colorstatusbar.checked=newstate;} //В блокировщике обрабатывается как settings[16]
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
                text: strings[173]
                font.pixelSize: 30;
                font.bold: true;
                color:"white"
            }
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                id: logo
                source: "image/StatusPage.png"
            }
            ListHeading {
            ListItemText {
            anchors.centerIn: parent
            role: "Heading"
            text: strings[174]}
            }
            Row{
                id:r5;
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 25;
                anchors.rightMargin: 22;
                Text{
                    text: strings[175]
                    color:"white"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    anchors.left: parent.left
                    anchors.right: hidestatusbar.left
                    anchors.verticalCenter: hidestatusbar.verticalCenter
                }
                Switch{
                    id:hidestatusbar;
                    onCheckedChanged:{application.ChangeSetting("zzzzhidestatusbar",checked);}
                    anchors.right: parent.right
                }
            }
            ListHeading {
            ListItemText {
            anchors.centerIn: parent
            role: "Heading"
            text: strings[176]}
            }
            Row{
                id:r4;
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 25;
                anchors.rightMargin: 22;
                Text{
                    text: strings[177]
                    color:"white"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    anchors.left: parent.left
                    anchors.right: colorstatusbar.left
                    anchors.verticalCenter: colorstatusbar.verticalCenter
                }
                Switch{
                    id:colorstatusbar;
                    onCheckedChanged:{application.ChangeSetting("zzzzzcolorstatusbar",checked);}
                    anchors.right: parent.right
                }
            }
            Button{
                platformInverted: toolBar.platformInverted
                anchors.horizontalCenter: parent.horizontalCenter
                width: mainPage.width * 0.5
                text: strings[178]
                onClicked: {informationDialog.open();}
            }
        }
}
    QueryDialog{
        id: informationDialog

        platformInverted: toolBar.platformInverted

        titleText: strings[179]
        icon: "image/note_info.svg"
        message: strings[180]

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

