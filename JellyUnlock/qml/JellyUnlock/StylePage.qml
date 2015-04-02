// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
Page{
    anchors.fill: parent
    signal back;
    Rectangle {
        id: background
        x: 0
        y: 0
        width: 640
        height: 640
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#320100"
            }
            GradientStop {
                position: 0.25
                color: "#400001"
            }
            GradientStop {
                position: 0.37
                color: "#510102"
            }
            GradientStop {
                position: 0.50
                color: "#600201"
            }
            GradientStop {
                position: 0.62
                color: "#720202"
            }
            GradientStop {
                position: 0.75
                color: "#830202"
            }
            GradientStop {
                position: 0.87
                color: "#910202"
            }
            GradientStop {
                position: 1
                color: "#a10303"
            }
        }
    }

    //....
    Connections{
        target:application
        onSkinChanged: {styles.selectedIndex=newstate;style.subTitle=styles.model[newstate];}
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            }
    }
    TabBar {
        id: tabBar
        platformInverted: toolBar.platformInverted
        anchors { left: parent.left; right: parent.right; top: parent.top }
        TabButton { tab: tab1content; text: strings[219]; platformInverted: toolBar.platformInverted}
        TabButton { tab: tab2content; text: strings[220]; platformInverted: toolBar.platformInverted}
    }

    // define a blank tab group so we can add the pages of content later
    TabGroup {
        id: tabGroup
        anchors { left: parent.left; right: parent.right; top: tabBar.bottom; bottom: parent.bottom }

        // define the content for tab 1
        Page {
            id: tab1content
            Flickable {
                id: flickArea
                anchors.fill: parent
                anchors.top: tabBar.bottom;
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
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: logo3
                        source: "image/StylePage.png"
                    }
                    SelectionListItem {
                        id: style
                        platformInverted: toolBar.platformInverted
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 15;
                        anchors.rightMargin: 5;
                        title: strings[221]
                        subTitle: styles.model[styles.selectedIndex]
                        onClicked: {styles.open();}
                        SelectionDialog {
                            id: styles
                            platformInverted: toolBar.platformInverted
                            titleText: strings[221]
                            model: stylelist
                            selectedIndex:0
                            onSelectedIndexChanged: {style.subTitle=styles.model[styles.selectedIndex];application.ChangeSetting("zzzzzzzzzzzskin",selectedIndex);}
                        }

                    }
                }
          }
        }
        Page {
            id: tab2content
            Flickable {
                id: flickArea1
                anchors.fill: parent
                anchors.top: tabBar.bottom;
                //anchors.bottom: toolBar.top;
                anchors.left: parent.left;
                anchors.right: parent.right
                contentWidth: parent.width; contentHeight: c1.height
                flickableDirection: Flickable.VerticalFlick
                clip: true
            Column{
                spacing: 10;
                id:c1;
                anchors.right: parent.right
                anchors.left: parent.left
                    Text {
                        anchors.leftMargin: 5;
                        id: title2
                        anchors.left: parent.left
                        text: strings[222]
                        font.pixelSize: 20;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: imagestdpril2
                        /*width: 340
                        height: 224*/
                        source: "screen/dUnlock.png"
                    }
                    Text {
                        anchors.leftMargin: 5;
                        id: title3
                        anchors.left: parent.left
                        text: strings[223]
                        font.pixelSize: 20;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: imagestdpril3
                        /*width: 340
                        height: 233*/
                        source: "screen/IOS7.png"
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

