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
    //....
    Connections{
        target:application
        //onApp17Changed:{app17.subTitle=app;}
        onCameraAppChanged:{camapp.subTitle=app;}
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            camapp.platformInverted=newstate;
            camappd.platformInverted=newstate;}
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
                        text: strings[96]
                        font.pixelSize: 30;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: logo2
                        source: "image/cameraPage.png"
                    }
                    SelectionListItem {
                        id: camapp
                        platformInverted: camapp.platformInverted
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 15;
                        anchors.rightMargin: 5;
                        title: strings[36]
                        subTitle: camappd.model[camappd.selectedIndex]
                        onClicked: {camappd.open();}
                        AppDialog {
                            id: camappd
                            platformInverted: camappd.platformInverted
                            titleText: strings[36]
                            model: appModel
                            selectedIndex:0
                            onAccepted: {camapp.subTitle=camappd.model[camappd.selectedIndex];application.ChangeSetting("zcamapp",selectedIndex);}
                            }
                        }
                    /*SelectionListItem {
                        id: app17
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 15;
                        anchors.rightMargin: 5;
                        title: strings[75]
                        subTitle: app17d.model[app17d.selectedIndex]
                        onClicked: {app17d.open();}
                        AppDialog {
                            id: app17d
                            titleText: strings[75]
                            model: appModel
                            selectedIndex:0
                            onAccepted: {app17.subTitle=app17d.model[app17d.selectedIndex];application.ChangeSetting("app17",selectedIndex);}
                            }
                        }*/

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
