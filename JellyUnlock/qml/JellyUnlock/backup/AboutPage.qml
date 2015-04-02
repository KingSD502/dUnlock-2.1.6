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
                color: "#393c01"
            }
            GradientStop {
                position: 0.25
                color: "#4a4d00"
            }
            GradientStop {
                position: 0.37
                color: "#5c5f01"
            }
            GradientStop {
                position: 0.50
                color: "#6c7001"
            }
            GradientStop {
                position: 0.62
                color: "#7e8302"
            }
            GradientStop {
                position: 0.75
                color: "#8e9302"
            }
            GradientStop {
                position: 0.87
                color: "#999e02"
            }
            GradientStop {
                position: 1
                color: "#aeb502"
            }
        }
    }
    signal back;
    Connections{
        target:application
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;}
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
            id:c
            spacing: 10;
            anchors.top: parent.top//statusBar.bottom;
            //anchors.bottom: parent.bottom//toolBar.top;
            anchors.left: parent.left;
            anchors.right: parent.right
            anchors.topMargin: 20;
            anchors.verticalCenter: parent.verticalCenter
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                id: logo
                source: "image/logo.png"
            }
            Text{
                text:"dUnlock 2.1.6";
                color:"white"
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter;
                anchors.left: parent.left;
                anchors.right: parent.right
                font.pixelSize: 35;
                wrapMode: Text.WordWrap
            }

            Text{
                text:strings[30];
                color:"white"
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter;
                anchors.left: parent.left;
                anchors.right: parent.right
                font.pixelSize: 20;
                wrapMode: Text.WordWrap

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

