import QtQuick 1.1
import com.nokia.symbian 1.1

Page{
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
    Connections{
        target:application
        onApp1Changed:{app1.subTitle=app;}
        //onApp2Changed:{app2.subTitle=app;}
        //onApp3Changed:{app3.subTitle=app;}
        //onApp4Changed:{app4.subTitle=app;}
        //onApp5Changed:{app5.subTitle=app;}
        //onApp6Changed:{app6.subTitle=app;}
        //onApp7Changed:{app7.subTitle=app;}
        //onApp8Changed:{app8.subTitle=app;}
        //onApp9Changed:{app9.subTitle=app;}
        //onApp10Changed:{app10.subTitle=app;}
        //onApp11Changed:{app11.subTitle=app;}
        //onApp12Changed:{app12.subTitle=app;}
        //onApp13Changed:{app13.subTitle=app;}
        onApp14Changed:{app14.subTitle=app;}
        onApp15Changed:{app15.subTitle=app;}
        onApp16Changed:{app16.subTitle=app;}
        //onApp17Changed:{app17.subTitle=app;}
        onApp18Changed:{app18.subTitle=app;}
        onApp19Changed:{app19.subTitle=app;}
        onApp20Changed:{app20.subTitle=app;}
        onApp21Changed:{app21.subTitle=app;}
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            menu.platformInverted=newstate;
            app1.platformInverted=newstate;
            app1d.platformInverted=newstate;
            app14.platformInverted=newstate;
            app14d.platformInverted=newstate;
            app15.platformInverted=newstate;
            app15d.platformInverted=newstate;
            app16.platformInverted=newstate;
            app16d.platformInverted=newstate;
            app18.platformInverted=newstate;
            app18d.platformInverted=newstate;
            app19.platformInverted=newstate;
            app19d.platformInverted=newstate;
            app20.platformInverted=newstate;
            app20d.platformInverted=newstate;
            app21.platformInverted=newstate;
            app21d.platformInverted=newstate;
        }
        //onHideLaunchAreaChanged:{hideapppanel.checked=newstate;} //В блокировщике обрабатывается как settings[9] (скрытие лаунчера)
    }
    // define a tab bar with three buttons and link them to the content
         TabBar {
             y: 10
             id: tabBar
             platformInverted: toolBar.platformInverted
             anchors { left: parent.left; right: parent.right; top: parent.top }
             //TabButton { tab: tab1content; text: strings[87] }
             //TabButton { tab: tab2content; text: strings[88] }
             //TabButton { tab: tab3content; text: strings[89] }
             TabButton { tab: tab4content; text: strings[90]; platformInverted: toolBar.platformInverted}
             TabButton { tab: tab5content; text: strings[91]; platformInverted: toolBar.platformInverted}
             //TabButton { tab: tab6content; text: strings[92] }
         }

         // define a blank tab group so we can add the pages of content later
         TabGroup {
             id: tabGroup
             anchors { left: parent.left; right: parent.right; top: tabBar.bottom; bottom: parent.bottom }

             // define content for tab 4
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
                     spacing: 10;
                     id:c3;
                     anchors.right: parent.right
                     anchors.left: parent.left
                      Image {
                          anchors.horizontalCenter: parent.horizontalCenter
                          id: logo4
                          source: "image/LaunchArea.png"
                      }
                 SelectionListItem {
                      id: app14
                      platformInverted: app14.platformInverted
                      anchors.left: parent.left
                      anchors.right: parent.right
                      anchors.leftMargin: 15;
                      anchors.rightMargin: 5;
                      title: strings[49]
                      subTitle: app14d.model[app14d.selectedIndex]
                      onClicked: {app14d.open();}
                      AppDialog {
                          id: app14d
                          platformInverted: app14d.platformInverted
                          titleText: strings[49]
                          model: appModel
                          selectedIndex:0
                          onAccepted: {app14.subTitle=app14d.model[app14d.selectedIndex];application.ChangeSetting("app14",selectedIndex);}
                           }
                      }
                 SelectionListItem {
                      id: app15
                      platformInverted: app15.platformInverted
                      anchors.left: parent.left
                      anchors.right: parent.right
                      anchors.leftMargin: 15;
                      anchors.rightMargin: 5;
                      title: strings[50]
                      subTitle: app15d.model[app15d.selectedIndex]
                      onClicked: {app15d.open();}
                      AppDialog {
                          id: app15d
                          platformInverted: app15d.platformInverted
                          titleText: strings[50]
                          model: appModel
                          selectedIndex:0
                          onAccepted: {app15.subTitle=app15d.model[app15d.selectedIndex];application.ChangeSetting("app15",selectedIndex);}
                           }
                      }
                 SelectionListItem {
                      id: app16
                      platformInverted: app16.platformInverted
                      anchors.left: parent.left
                      anchors.right: parent.right
                      anchors.leftMargin: 15;
                      anchors.rightMargin: 5;
                      title: strings[51]
                      subTitle: app16d.model[app16d.selectedIndex]
                      onClicked: {app16d.open();}
                      AppDialog {
                          id: app16d
                          platformInverted: app16d.platformInverted
                          titleText: strings[51]
                          model: appModel
                          selectedIndex:0
                          onAccepted: {app16.subTitle=app16d.model[app16d.selectedIndex];application.ChangeSetting("app16",selectedIndex);}
                           }
                      }
                 SelectionListItem {
                      id: app18
                      platformInverted: app18.platformInverted
                      anchors.left: parent.left
                      anchors.right: parent.right
                      anchors.leftMargin: 15;
                      anchors.rightMargin: 5;
                      title: strings[52]
                      subTitle: app18d.model[app18d.selectedIndex]
                      onClicked: {app18d.open();}
                      AppDialog {
                          id: app18d
                          platformInverted: app18d.platformInverted
                          titleText: strings[52]
                          model: appModel
                          selectedIndex:0
                          onAccepted: {app18.subTitle=app18d.model[app18d.selectedIndex];application.ChangeSetting("app18",selectedIndex);}
                           }
                      }
                    }
             }
          }
             // define content for tab 5
             Page {
                 id: tab5content
                 Flickable {
                     id: flickArea4
                     anchors.fill: parent
                     anchors.top: statusBar.bottom;
                     anchors.bottom: toolBar.top;
                     anchors.left: parent.left;
                     anchors.right: parent.right
                     contentWidth: parent.width; contentHeight: c4.height
                     flickableDirection: Flickable.VerticalFlick
                     clip: true
                 Column{
                     spacing: 10;
                     id:c4;
                     anchors.right: parent.right
                     anchors.left: parent.left
                      Image {
                          anchors.horizontalCenter: parent.horizontalCenter
                          id: logo5
                          source: "image/LaunchArea.png"
                      }
                 SelectionListItem {
                      id: app19
                      platformInverted: app19.platformInverted
                      anchors.left: parent.left
                      anchors.right: parent.right
                      anchors.leftMargin: 15;
                      anchors.rightMargin: 5;
                      title: strings[49]
                      subTitle: app19d.model[app19d.selectedIndex]
                      onClicked: {app19d.open();}
                      AppDialog {
                          id: app19d
                          platformInverted: app19.platformInverted
                          titleText: strings[49]
                          model: appModel
                          selectedIndex:0
                          onAccepted: {app19.subTitle=app19d.model[app19d.selectedIndex];application.ChangeSetting("app19",selectedIndex);}
                           }
                      }
                 SelectionListItem {
                      id: app20
                      platformInverted: app20.platformInverted
                      anchors.right: parent.right
                      anchors.leftMargin: 15;
                      anchors.rightMargin: 5;
                      title: strings[50]
                      subTitle: app20d.model[app20d.selectedIndex]
                      onClicked: {app20d.open();}
                      AppDialog {
                          id: app20d
                          platformInverted: app20d.platformInverted
                          titleText: strings[50]
                          model: appModel
                          selectedIndex:0
                          onAccepted: {app20.subTitle=app20d.model[app20d.selectedIndex];application.ChangeSetting("app20",selectedIndex);}
                           }
                      }
                 SelectionListItem {
                      id: app21
                      platformInverted: app21.platformInverted
                      anchors.left: parent.left
                      anchors.right: parent.right
                      anchors.leftMargin: 15;
                      anchors.rightMargin: 5;
                      title: strings[51]
                      subTitle: app21d.model[app21d.selectedIndex]
                      onClicked: {app21d.open();}
                      AppDialog {
                          id: app21d
                          platformInverted: app21d.platformInverted
                          titleText: strings[51]
                          model: appModel
                          selectedIndex:0
                          onAccepted: {app21.subTitle=app21d.model[app21d.selectedIndex];application.ChangeSetting("app21",selectedIndex);}
                           }
                      }
                 SelectionListItem {
                      id: app1
                      platformInverted: app1.platformInverted
                      anchors.left: parent.left
                      anchors.right: parent.right
                      anchors.leftMargin: 15;
                      anchors.rightMargin: 5;
                      title: strings[52]
                      subTitle: app1d.model[app1d.selectedIndex]
                      onClicked: {app1d.open();}
                      AppDialog {
                          id: app1d
                          platformInverted: app1.platformInverted
                          titleText: strings[52]
                          model: appModel
                          selectedIndex:0
                          onAccepted: {app1.subTitle=app1d.model[app1d.selectedIndex];application.ChangeSetting("app1",selectedIndex);}
                           }
                        }
                    }
             }
         }
             // define content for tab 6
             Page {
                 id: tab6content
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
                          id: logo3
                          source: "image/LaunchArea.png"
                             }
                     Row{
                          id:r5;
                          anchors.left: parent.left
                          anchors.right: parent.right
                          anchors.leftMargin: 25;
                          anchors.rightMargin: 22;
                          Text{
                             text: strings[93]
                             color:"white"
                             font.pixelSize: 20
                             wrapMode: Text.WordWrap
                             anchors.left: parent.left
                             anchors.right: hideapppanel.left
                             anchors.verticalCenter: hideapppanel.verticalCenter
                          }
                         Switch{
                             id: hideapppanel;
                             onCheckedChanged:{application.ChangeSetting("zzzhidelaunch",checked);}
                             anchors.right: parent.right
                                 }
                             }
                          }
                      }
                }
      }
         Menu {
             id: menu

             platformInverted: menu.platformInverted

             MenuLayout {
                 MenuItem {
                     platformInverted: menu.platformInverted
                     text: strings[158]
                     onClicked: {Qt.quit();}
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
                ToolButton {
                    flat: true
                    id:aboutbtn;
                    platformInverted: toolBar.platformInverted
                    iconSource: "toolbar-menu.png"
                    onClicked: menu.open()
                }
            }
        }
    }



