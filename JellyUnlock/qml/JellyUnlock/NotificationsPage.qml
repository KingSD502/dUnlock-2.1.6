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
                color: "#332000"
            }
            GradientStop {
                position: 0.25
                color: "#452b00"
            }
            GradientStop {
                position: 0.37
                color: "#4f3200"
            }
            GradientStop {
                position: 0.50
                color: "#643f00"
            }
            GradientStop {
                position: 0.62
                color: "#744a00"
            }
            GradientStop {
                position: 0.75
                color: "#845400"
            }
            GradientStop {
                position: 0.87
                color: "#955f00"
            }
            GradientStop {
                position: 1
                color: "#b07000"
            }
        }
    }
    anchors.fill: parent
    signal back;
    //....
    Connections{
        target:application
        onHideSMSChanged:{hidesms.checked=newstate;}
        onHideNotificationsChanged:{notif.checked=newstate;}
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
                spacing: 3;
                id:c;
                anchors.right: parent.right
                anchors.left: parent.left
                    Text {
                        anchors.leftMargin: 5;
                        id: title
                        anchors.left: parent.left
                        text: strings[163]
                        font.pixelSize: 25;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: logo3
                        source: "image/SMS.png"
                    }
                    Row{
                        id:r4;
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 25;
                        anchors.rightMargin: 22;
                        Text{
                            text: strings[164]
                            color:"white"
                            font.pixelSize: 20
                            anchors.verticalCenter: notif.verticalCenter
                        }
                        Switch{
                            id: notif;
                            onCheckedChanged:{application.ChangeSetting("zzzhidenotifs",checked);}
                            anchors.right: parent.right
                        }
                    }

                    Row{
                        id:r3;
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 25;
                        anchors.rightMargin: 22;
                        Text{
                            text: strings[165]
                            color:"white"
                            font.pixelSize: 20
                            anchors.verticalCenter: hidesms.verticalCenter
                        }
                        Switch{
                            id: hidesms;
                            onCheckedChanged:{application.ChangeSetting("zzzhidesms",checked);}
                            anchors.right: parent.right
                        }
                    }

   }
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
