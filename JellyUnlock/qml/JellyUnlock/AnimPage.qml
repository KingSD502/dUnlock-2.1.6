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
    signal animPage1;
    //....
    Connections{
        target:application
        onAnimWorkChanged:{animwork.checked=newstate;} //В блокировщике обрабатывается как settings[18] (Анимация)
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            but.platformInverted=newstate;}
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
                        text: strings[77]
                        font.pixelSize: 30;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: logo3
                        source: "image/AnimPage.png"
                    }
                    Row{
                        id:r1;
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 25;
                        anchors.rightMargin: 22;
                        Text{
                            text: strings[78]
                            color:"white"
                            font.pixelSize: 20
                            anchors.verticalCenter: animwork.verticalCenter
                        }
                        Switch{
                            id: animwork;
                            onCheckedChanged:{application.ChangeSetting("zzzzzzzanimwork",checked);}
                            anchors.right: parent.right
                        }
                    }
                    Button{
                        id: but
                        anchors.horizontalCenter: parent.horizontalCenter
                        platformInverted: but.platformInverted
                        width: mainPage.width * 0.6
                        text: strings[79]
                        onClicked: {animPage1();}
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

