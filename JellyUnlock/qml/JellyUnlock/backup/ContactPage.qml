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
                color: "#2c0035"
            }
            GradientStop {
                position: 0.25
                color: "#360043"
            }
            GradientStop {
                position: 0.37
                color: "#440053"
            }
            GradientStop {
                position: 0.50
                color: "#520063"
            }
            GradientStop {
                position: 0.62
                color: "#5f0073"
            }
            GradientStop {
                position: 0.75
                color: "#6e0086"
            }
            GradientStop {
                position: 0.87
                color: "#7a0094"
            }
            GradientStop {
                position: 1
                color: "#8f00ad"
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
                        text: strings[97]
                        font.pixelSize: 30;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: logo2
                        source: "image/ContactPage.png"
                    }
                    Text{
                        text:strings[98];
                        color:"white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        horizontalAlignment: Text.AlignHCenter;
                        anchors.left: parent.left;
                        anchors.right: parent.right
                        font.pixelSize: 40;
                        wrapMode: Text.WordWrap
                    }
                    Text{
                        text:"Разработчики: Даниил Стулов<br>
        Twitter: <a href=http://twitter.com/kingsd502>@kingsd502</a><br>
        VK: <a href=http://vk.com/kingsd502>http://vk.com/kingsd502</a><br>
        Слава Морозов<br>
        <br>
        VK: <a href=http://vk.com/id223415293>http://vk.com/DZzz001</a><br>
        <br>
        <br>
        Специально для Symbian Zone<br>
        <a href=http://vk.com/symbian_zone>http://vk.com/symbian_zone</a>";
                        color:"white"
                        onLinkActivated: Qt.openUrlExternally(link);
                        textFormat: Text.RichText
                        anchors.horizontalCenter: parent.horizontalCenter
                        horizontalAlignment: Text.AlignHCenter;
                        anchors.left: parent.left;
                        anchors.right: parent.right
                        font.pixelSize: 25;
                        wrapMode: Text.WordWrap
                    }
                    /*Image {
                        id: imageVKPage
                        x: 135
                        y: 200
                        width: 100
                        height: 100
                        anchors.top: parent.top
                        anchors.topMargin: 180
                        anchors.horizontalCenter: rectMe.horizontalCenter
                        source: "image/VK.svg"

                    MouseArea {
                         id: mouseVKPage
                         x: -10
                         y: -10
                         width: parent.width +20
                         height: parent.height +20
                         anchors.verticalCenterOffset: 5
                         anchors.horizontalCenterOffset: -10
                         anchors.centerIn: parent
                         onClicked: {Qt.openUrlExternally("http://vk.com/id223415293");}
                    }
                         anchors.verticalCenter: rectMe.verticalCenter
                         opacity: 1
                    }
                    Text{
                        text:strings[99];
                        color:"white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        horizontalAlignment: Text.AlignHCenter;
                        anchors.left: parent.left;
                        anchors.right: parent.right
                        font.pixelSize: 40;
                        wrapMode: Text.WordWrap
                    }
                    Image {
                        id: imageVK1Page
                        x: 135
                        y: 200
                        width: 100
                        height: 100
                        anchors.top: parent.top
                        anchors.topMargin: 330
                        anchors.horizontalCenter: rectMe.horizontalCenter
                        source: "image/VK.svg"

                    MouseArea {
                         id: mouseVK1Page
                         x: -10
                         y: -10
                         width: parent.width +20
                         height: parent.height +20
                         anchors.verticalCenterOffset: 5
                         anchors.horizontalCenterOffset: -10
                         anchors.centerIn: parent
                         onClicked: {Qt.openUrlExternally("http://vk.com/kingsd502");}
                    }
                         anchors.verticalCenter: rectMe.verticalCenter
                         opacity: 1
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

