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
    anchors.fill: parent
    signal back;
    signal updatePage1;
    signal updatePage2;
    signal updatePage3;
    signal updatePage4;
    signal updatePage5;
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
                spacing: 10;
                id:c;
                anchors.right: parent.right
                anchors.left: parent.left
                    Text {
                        anchors.leftMargin: 5;
                        id: title
                        anchors.left: parent.left
                        text: strings[193]
                        font.pixelSize: 30;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: logo3
                        source: "image/UpdatePage.png"
                    }

                    Button{
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: mainPage.width * 0.75
                        platformInverted: toolBar.platformInverted
                        text: strings[194]
                        onClicked: {updatePage1();}
                    }
                    Button{
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: mainPage.width * 0.75
                        platformInverted: toolBar.platformInverted
                        text: strings[195]
                        onClicked: {sortSubMenu.open()}
                    }
                    Button{
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: mainPage.width * 0.75
                        platformInverted: toolBar.platformInverted
                        text: strings[196]
                        onClicked: {updatePage3();}
                    }
                    Button{
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: mainPage.width * 0.75
                        platformInverted: toolBar.platformInverted
                        text: strings[197]
                        onClicked: {updatePage4();}
                    }


           }
}
        Menu {
            id: menu
            platformInverted: toolBar.platformInverted
            MenuLayout {
              ContextMenu {
                 id: sortSubMenu
                 platformInverted: toolBar.platformInverted
                 MenuLayout {
                   MenuItem {
                      platformInverted: toolBar.platformInverted
                      text: "2.1 - 2.1.3"
                      onClicked: {updatePage2();}
                        }
                   MenuItem {
                      platformInverted: toolBar.platformInverted
                      text: "2.1.4 - 2.1.7"
                      onClicked: {updatePage5();}
                        }
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
