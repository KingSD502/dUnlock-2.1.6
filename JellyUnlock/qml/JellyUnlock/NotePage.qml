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
        onNoteHideChanged:{notehide.checked=newstate;} //В блокировщике обрабатывается как settings[15]
        onNoteTextChanged:{notetext.text=newstate;} //В блокировщике обрабатывается как settings[16]
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
                text: strings[227]
                font.pixelSize: 30;
                font.bold: true;
                color:"white"
            }
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                id: logo
                source: "image/NotePage.png"
            }
            Row{
                id:r5;
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 25;
                anchors.rightMargin: 22;
                Text{
                    text: strings[229]
                    color:"white"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    anchors.left: parent.left
                    anchors.right: notehide.left
                    anchors.verticalCenter: notehide.verticalCenter
                }
                Switch{
                    id:notehide;
                    onCheckedChanged:{application.ChangeSetting("zzzzzzzzzzzzznotehide",checked);}
                    anchors.right: parent.right
                }
            }
            ListHeading {
               visible: notehide.checked
               ListItemText {
               anchors.centerIn: parent
               role: "Heading"
               text: strings[228]}
            }
            TextArea {
                id: notetext
                visible: notehide.checked
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.leftMargin: 10
                anchors.rightMargin: 10;
                height: 200; width: 340
                placeholderText: strings[225]
                focus: true
                onTextChanged:{application.ChangeSetting("zzzzzzzzzzzzznotetext",text);}
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
