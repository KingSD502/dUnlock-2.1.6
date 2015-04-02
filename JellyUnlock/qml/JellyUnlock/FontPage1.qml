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
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            }
       }
    function openTab1(){
        tb1.checked=true;
        tb2.checked=false;
        tabGroup.currentTab=tab1content;
    }
    function openTab2(){
        tb2.checked=true;
        tb1.checked=false;
        tabGroup.currentTab=tab2content;
    }
    TabBar {
        id: tabBar
        platformInverted: toolBar.platformInverted
        anchors { left: parent.left; right: parent.right; top: parent.top }
        TabButton { tab: tab1content; text: strings[104]; platformInverted: toolBar.platformInverted; id: tb1;}
        TabButton { tab: tab2content; text: strings[216]; platformInverted: toolBar.platformInverted; id: tb2;}
    }
    TabGroup {
        id: tabGroup
        anchors { left: parent.left; right: parent.right; top: tabBar.bottom; bottom: parent.bottom }

        // define the content for tab 1
        Page {
            id: tab1content
          Column{
                spacing: 3;
                id:c;
                anchors.right: parent.right
                anchors.left: parent.left
                    Text {
                        anchors.leftMargin: 5;
                        id: title
                        anchors.left: parent.left
                        text: strings[107]
                        font.pixelSize: 20;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: imagestdpril
                        width: 340
                        height: 224
                        source: "screen/Do.png"
                    }
                    Text {
                        anchors.leftMargin: 5;
                        id: title1
                        anchors.left: parent.left
                        text: strings[108]
                        font.pixelSize: 20;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: imagestdpril1
                        width: 340
                        height: 233
                        source: "screen/Posle.png"
                    }
           }
        }

        Page {
            id: tab2content
               Column{
                    spacing: 3;
                    id:c1;
                    anchors.right: parent.right
                    anchors.left: parent.left
                        Text {
                            anchors.leftMargin: 5;
                            id: title2
                            anchors.left: parent.left
                            text: strings[107]
                            font.pixelSize: 20;
                            font.bold: true;
                            color:"white"
                        }
                        Image {
                            anchors.horizontalCenter: parent.horizontalCenter
                            id: imagestdpril2
                            width: 340
                            height: 224
                            source: "screen/Do1.png"
                        }
                        Text {
                            anchors.leftMargin: 5;
                            id: title3
                            anchors.left: parent.left
                            text: strings[108]
                            font.pixelSize: 20;
                            font.bold: true;
                            color:"white"
                        }
                        Image {
                            anchors.horizontalCenter: parent.horizontalCenter
                            id: imagestdpril3
                            width: 340
                            height: 233
                            source: "screen/Posle1.png"
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

