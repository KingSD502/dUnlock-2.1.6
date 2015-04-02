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
    //....
    Connections{
        target:application
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            }
    }
    TabBar {
        id: tabBar
        platformInverted: toolBar.platformInverted
        anchors { left: parent.left; right: parent.right; top: parent.top }
        TabButton { tab: tab1content; text: "2.1"; platformInverted: toolBar.platformInverted }
        TabButton { tab: tab2content; text: "2.1.1"; platformInverted: toolBar.platformInverted }
        TabButton { tab: tab3content; text: "2.1.2"; platformInverted: toolBar.platformInverted }
        TabButton { tab: tab4content; text: "2.1.3"; platformInverted: toolBar.platformInverted }

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
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: logo
                    source: "image/UpdatePage.png"
                }
                Text {
                    anchors.top: versionTxt.bottom
                    anchors.topMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.leftMargin: 5
                    anchors.rightMargin: 5
                    width: parent.width
                    text: strings[200]
                    font.pointSize: 8
                    font.bold: false
                    color: "white"
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignLeft
                }
                        }
                     }
                 }


        // define the content for tab 2
        Page {
            id: tab2content
            Flickable {
                id: flickArea1
                anchors.fill: parent
                anchors.top: statusBar.bottom;
                anchors.bottom: toolBar.top;
                anchors.left: parent.left;
                anchors.right: parent.right
                contentWidth: parent.width; contentHeight: c1.height
                flickableDirection: Flickable.VerticalFlick
                clip: true
            Column{
                spacing: 3;
                id:c1;
                anchors.right: parent.right
                anchors.left: parent.left
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: logo1
                    source: "image/UpdatePage.png"
                }
                Text {
                    anchors.top: versionTxt.bottom
                    anchors.topMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.leftMargin: 5
                    anchors.rightMargin: 5
                    width: parent.width
                    text: strings[201]
                    font.pointSize: 8
                    font.bold: false
                    color: "white"
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignLeft
                }
                        }
                     }
        }
        Page {
            id: tab3content
            Flickable {
                id: flickArea2
                anchors.fill: parent
                anchors.top: statusBar.bottom;
                anchors.bottom: toolBar.top;
                anchors.left: parent.left;
                anchors.right: parent.right
                contentWidth: parent.width; contentHeight: c2.height
                flickableDirection: Flickable.VerticalFlick
                clip: true
            Column{
                spacing: 3;
                id:c2;
                anchors.right: parent.right
                anchors.left: parent.left
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: logo2
                    source: "image/UpdatePage.png"
                }
                Text {
                    anchors.top: versionTxt.bottom
                    anchors.topMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.leftMargin: 5
                    anchors.rightMargin: 5
                    width: parent.width
                    text: strings[202]
                    font.pointSize: 8
                    font.bold: false
                    color: "white"
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignLeft
                }
                        }
                     }
                 }
        Page {
            id: tab4content
            Flickable {
                id: flickArea3
                anchors.fill: parent
                anchors.top: statusBar.bottom;
                anchors.bottom: toolBar.top;
                anchors.left: parent.left;
                anchors.right: parent.right
                contentWidth: parent.width; contentHeight: c3.height
                flickableDirection: Flickable.VerticalFlick
                clip: true
            Column{
                spacing: 3;
                id:c3;
                anchors.right: parent.right
                anchors.left: parent.left
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id: logo3
                    source: "image/UpdatePage.png"
                }
                Text {
                    anchors.top: versionTxt.bottom
                    anchors.topMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    anchors.leftMargin: 5
                    anchors.rightMargin: 5
                    width: parent.width
                    text: strings[203]
                    font.pointSize: 8
                    font.bold: false
                    color: "white"
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignLeft
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
