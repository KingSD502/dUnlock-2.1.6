import QtQuick 1.1
import com.nokia.symbian 1.1
Page{
    anchors.fill: parent
    signal back;
    signal helpPage1;
    signal helpPage2;
    signal helpPage3;
    signal helpPage4;
    signal updatePage1;
    signal updatePage2;
    signal updatePage3;
    signal updatePage4;
    signal updatePage5;
    signal contactPage;
    Connections{
        target:application
        onWhiteThemeChanged:{toolBar.platformInverted=newstate;}
    }

 // define a tab bar with three buttons and link them to the content
         TabBar {
             id: tabBar
             platformInverted: toolBar.platformInverted
             anchors { left: parent.left; right: parent.right; top: parent.top }
             TabButton { tab: tab1content; text: strings[149]; platformInverted: toolBar.platformInverted} //strings[149]
             TabButton { tab: tab2content; text: strings[148]; platformInverted: toolBar.platformInverted} //strings[148]
             TabButton { tab: tab3content; text: strings[150]; platformInverted: toolBar.platformInverted} //strings[150]
             TabButton { tab: tab4content; text: strings[151]; platformInverted: toolBar.platformInverted} //strings[151]
         }
         // define a blank tab group so we can add the pages of content later
         TabGroup {
             id: tabGroup
             anchors { left: parent.left; right: parent.right; top: tabBar.bottom; bottom: parent.bottom }

             // define the content for tab 1
             Page {
                 id: tab1content
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
                 Flickable {
                     anchors.fill: parent
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
             }
             // define the content for tab 2
             Page {
                 id: tab2content
                 Rectangle {
                     id: background1
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
                         id:c1
                         spacing: 10;
                         anchors.top: parent.top//statusBar.bottom;
                         //anchors.bottom: parent.bottom//toolBar.top;
                         anchors.left: parent.left;
                         anchors.right: parent.right
                         anchors.topMargin: 2;
                         anchors.verticalCenter: parent.verticalCenter
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
    }
             Page {
                 Rectangle {
                     id: background2
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
                         id:c2
                         spacing: 10;
                         anchors.top: parent.top//statusBar.bottom;
                         //anchors.bottom: parent.bottom//toolBar.top;
                         anchors.left: parent.left;
                         anchors.right: parent.right
                         anchors.topMargin: 2;
                         anchors.verticalCenter: parent.verticalCenter
                         Text {
                             anchors.leftMargin: 5;
                             id: title1
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
                             id: txt
                             text:"Разработчики: Даниил Стулов<br>
             Twitter: <a href=http://twitter.com/kingsd502>@kingsd502</a><br>
             VK: <a href=http://vk.com/kingsd502>http://vk.com/kingsd502</a><br>
             <br>
             Слава Морозов<br>
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
                     }
                 }
             }
             Page {
                 id: tab4content
                 Rectangle {
                     id: background3
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
                         id:c3
                         spacing: 10;
                         anchors.top: parent.top//statusBar.bottom;
                         //anchors.bottom: parent.bottom//toolBar.top;
                         anchors.left: parent.left;
                         anchors.right: parent.right
                         anchors.topMargin: 2;
                         anchors.verticalCenter: parent.verticalCenter
                         Text {
                             anchors.leftMargin: 5;
                             id: title2
                             anchors.left: parent.left
                             text: strings[109]
                             font.pixelSize: 30;
                             font.bold: true;
                             color:"white"
                         }
                         Image {
                             anchors.horizontalCenter: parent.horizontalCenter
                             id: logo4
                             source: "image/HelpPage.png"
                         }
                         Button{
                             platformInverted: toolBar.platformInverted
                             anchors.horizontalCenter: parent.horizontalCenter
                             width: mainPage.width * 0.85
                             text: strings[110]
                             onClicked: {helpPage1();}
                         }
                         Button{
                             platformInverted: toolBar.platformInverted
                             anchors.horizontalCenter: parent.horizontalCenter
                             width: mainPage.width * 0.75
                             text: strings[111]
                             onClicked: {helpPage2();}
                         }
                         Button{
                             platformInverted: toolBar.platformInverted
                             anchors.horizontalCenter: parent.horizontalCenter
                             width: mainPage.width * 0.75
                             text: strings[112]
                             onClicked: {helpPage3();}
                         }
                     }
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
    Image{
        id: rectMe
        opacity: 0
    }
    Image{
        id:rectFriends
        opacity: 0
    }
    ToolBar {
        id: toolBar
        anchors.bottom: parent.bottom
        tools:
            ToolBarLayout {
               id: toolBarLayout
            ToolButton {
                platformInverted: toolBar.platformInverted
                flat: true
                id:backbtn;
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

