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
                color: "#000a11"
            }
            GradientStop {
                position: 0.25
                color: "#001220"
            }
            GradientStop {
                position: 0.37
                color: "#001a2d"
            }
            GradientStop {
                position: 0.50
                color: "#00233b"
            }
            GradientStop {
                position: 0.62
                color: "#002d4e"
            }
            GradientStop {
                position: 0.75
                color: "#00365d"
            }
            GradientStop {
                position: 0.87
                color: "#004270"
            }
            GradientStop {
                position: 1
                color: "#004d82"
            }
        }
    }
    anchors.fill: parent
    signal back;
    signal helpPage1;
    //....
    Connections{
        target:application
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
                        text: strings[114]
                        font.pixelSize: 20;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: imagestdpril
                        width: 320
                        height: 600
                        source: "screen/std pril launch.png"
                    }
                    Text {
                        anchors.top: versionTxt.bottom
                        anchors.topMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 5
                        anchors.leftMargin: 5
                        anchors.rightMargin: 5
                        width: parent.width
                        text: strings[115]
                        font.pointSize: 10
                        font.bold: false
                        color: "white"
                        wrapMode: Text.Wrap
                        horizontalAlignment: Text.AlignLeft
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
