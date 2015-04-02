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
                color: "#051407"
            }

            GradientStop {
                position: 0.25
                color: "#071b0b"
            }

            GradientStop {
                position: 0.37
                color: "#0a260f"
            }

            GradientStop {
                position: 0.50
                color: "#0e3313"
            }

            GradientStop {
                position: 0.62
                color: "#124219"
            }

            GradientStop {
                position: 0.75
                color: "#154f1e"
            }

            GradientStop {
                position: 0.87
                color: "#185a22"
            }

            GradientStop {
                position: 1
                color: "#1c6827"
            }
        }
    }
    Connections{
        target:application
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            menu.platformInverted=newstate;}
    }
    anchors.fill: parent
    signal appsPage;
    signal appsPage1;
    signal appsPage2;
    signal cameraPage;
    signal informationPage;
    signal musicPage;
    signal setingsPage;
    signal about;
    signal notificationsPage;
    signal statusPage;
    signal fontPage;
    signal substratePage;
    signal animPage;
    signal themPage;
    signal stylePage;
    signal iosPage;
    signal notePage;
    signal swypeunlockPage;
    // define a tab bar with three buttons and link them to the content
         TabBar {
             id: tabBar
             platformInverted: toolBar.platformInverted
             anchors { left: parent.left; right: parent.right; top: parent.top }
             TabButton { tab: tab1content; text: strings[136];platformInverted: toolBar.platformInverted}
             TabButton { tab: tab2content; text: strings[137];platformInverted: toolBar.platformInverted}
             TabButton { tab: tab3content; text: strings[219];platformInverted: toolBar.platformInverted}
             //TabButton { tab: tab4content; text: strings[138];platformInverted: toolBar.platformInverted}

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
                  Column {
                     id: c
                     spacing: 10
                     anchors.top: parent.top
                     anchors.topMargin: 0
                       Text {
                         id: title
                         color: "#ffffff"
                         text: "dUnlock"
                         font.pixelSize: 25
                         font.bold: true
                         anchors.leftMargin: 5
                         anchors.left: parent.left
                     }

                  Image {
                     id: logo
                     anchors.horizontalCenter: parent.horizontalCenter
                     width: 130
                     height: 130
                     source: "image/logo.png"
                     }
             //Первый ряд
                  Image {
                     id: imageLaunchArea
                     x: 25
                     width: 100
                     height: 100
                     anchors.horizontalCenter: rectFriends.horizontalCenter
                     source: "image/LaunchArea.svg"
                     Text {
                       id: title1
                       color: "#ffffff"
                       text: strings[139]
                       font.pixelSize: 15
                       x: 25
                       y: 93
                   }
                     MouseArea {
                         id: mouseLaunchArea
                         x: -10
                         y: -20
                         width: parent.width +20
                         height: parent.height +20
                         anchors.verticalCenterOffset: -10
                         anchors.horizontalCenterOffset: 0
                         anchors.centerIn: parent
                         onClicked: {sortSubMenu1.open()}
                         }
                         anchors.verticalCenter: rectFriends.verticalCenter
                         opacity: 1
                     }

                     Image {
                       id: imageMusicPage
                       x: 25
                       y: 300
                       width: 100
                       height: 100
                       anchors.horizontalCenter: rectMe.horizontalCenter
                       source: "image/musicPage.svg"
                       Text {
                         id: title2
                         color: "#ffffff"
                         text: strings[140]
                         font.pixelSize: 15
                         x: 25
                         y: 95
                     }
                       MouseArea {
                         id: mouseMusicPage
                         x: -20
                         y: -5
                         width: parent.width +20
                         height: parent.height +20
                         anchors.verticalCenterOffset: 5
                         anchors.horizontalCenterOffset: -10
                         anchors.centerIn: parent
                         onClicked: {musicPage();}
                     }
                         anchors.verticalCenter: rectMe.verticalCenter
                         opacity: 1
                     }

                     //Второй ряд
                     Image {
                       id: imageCameraPage
                       x: 135
                       anchors.top: parent.top
                       anchors.topMargin: 181
                       width: 100
                       height: 100
                       anchors.horizontalCenter: rectFriends.horizontalCenter
                       source: "image/cameraPage.svg"
                       Text {
                         id: title3
                         color: "#ffffff"
                         text: strings[141]
                         font.pixelSize: 15
                         x: 25
                         y: 95
                     }
                     MouseArea {
                         id: mouseCameraPage
                         x: -10
                         y: -20
                         width: parent.width +20
                         height: parent.height +20
                         anchors.verticalCenterOffset: -10
                         anchors.horizontalCenterOffset: 0
                         anchors.centerIn: parent
                         onClicked: {cameraPage();}
                     }
                         anchors.verticalCenter: rectFriends.verticalCenter
                         opacity: 1
                     }

                     Image {
                         id: imageSetingsPage
                         x: 135
                         y: 220
                         width: 100
                         height: 100
                         anchors.top: parent.top
                         anchors.topMargin: 290
                         anchors.horizontalCenter: rectMe.horizontalCenter
                         source: "image/SetingsPage.svg"
                         Text {
                           id: title4
                           color: "#ffffff"
                           text: strings[142]
                           font.pixelSize: 15
                           x: 13
                           y: 95
                       }
                     MouseArea {
                          id: mouseSetingsPage
                          x: -10
                          y: -10
                          width: parent.width +20
                          height: parent.height +20
                          anchors.verticalCenterOffset: 5
                          anchors.horizontalCenterOffset: -10
                          anchors.centerIn: parent
                          onClicked: {setingsPage();}
                     }
                          anchors.verticalCenter: rectMe.verticalCenter
                          opacity: 1
                     }

                     //Третий ряд
                     Image {
                       id: imageNotificationsPage
                       x: 245
                       anchors.top: parent.top
                       anchors.topMargin: 181
                       width: 100
                       height: 100
                       anchors.horizontalCenter: rectFriends.horizontalCenter
                       source: "image/SMSPage.svg"
                       Text {
                         id: title5
                         color: "#ffffff"
                         text: strings[143]
                         font.pixelSize: 15
                         x: 3
                         y: 95
                     }
                     MouseArea {
                         id: mouseNotificationsPage
                         x: -10
                         y: -20
                         width: parent.width +20
                         height: parent.height +20
                         anchors.verticalCenterOffset: -10
                         anchors.horizontalCenterOffset: 0
                         anchors.centerIn: parent
                         onClicked: {notificationsPage();}
                     }
                         anchors.verticalCenter: rectFriends.verticalCenter
                         opacity: 1
                     }

                    //anchors.verticalCenter: parent.verticalCenter
                      anchors.right: parent.right
                      anchors.left: parent.left
                 }
              }
                }
             // define the content for tab 2
             Page {
                 id: tab2content
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
                  Column {
                     id: c2
                     spacing: 10
                     anchors.top: parent.top
                     anchors.topMargin: 0
                       Text {
                         id: title10
                         color: "#ffffff"
                         text: "dUnlock"
                         font.pixelSize: 25
                         font.bold: true
                         anchors.leftMargin: 5
                         anchors.left: parent.left
                     }

                  Image {
                     id: logo2
                     anchors.horizontalCenter: parent.horizontalCenter
                     width: 130
                     height: 130
                     source: "image/logo.png"
                     }
             //Первый ряд
                  Image {
                       id: imageStatusPage
                       x: 25
                       y: 450
                       width: 100
                       height: 100
                       anchors.horizontalCenter: rectFriends.horizontalCenter
                       source: "image/StatusPage.svg"
                       Text {
                         id: title11
                         color: "#ffffff"
                         text: strings[144]
                         font.pixelSize: 15
                         x: 18
                         y: 95
                     }
                       MouseArea {
                           id: mouseStatusArea
                           x: -10
                           y: -20
                           width: parent.width +20
                           height: parent.height +20
                           anchors.verticalCenterOffset: -10
                           anchors.horizontalCenterOffset: 0
                           anchors.centerIn: parent
                           onClicked: {statusPage()}
                           }
                           anchors.verticalCenter: rectFriends.verticalCenter
                           opacity: 1
                       }
                  Image {
                    id: imageAnimPage
                    x: 25
                    y: 300
                    width: 100
                    height: 100
                    anchors.horizontalCenter: rectMe.horizontalCenter
                    source: "image/AnimPage.svg"
                    Text {
                      id: title15
                      color: "#ffffff"
                      text: strings[145]
                      font.pixelSize: 15
                      x: 18
                      y: 95
                  }
                    MouseArea {
                      id: mouseAnimPage
                      x: -20
                      y: -5
                      width: parent.width +20
                      height: parent.height +20
                      anchors.verticalCenterOffset: 5
                      anchors.horizontalCenterOffset: -10
                      anchors.centerIn: parent
                      onClicked: {animPage();}
                  }
                      anchors.verticalCenter: rectMe.verticalCenter
                      opacity: 1
                  }
                     //Второй ряд
                     Image {
                         id: imageFontPage
                         x: 135
                         y: 450
                         width: 100
                         height: 100
                         anchors.top: parent.top
                         anchors.topMargin: 181
                         anchors.horizontalCenter: rectMe.horizontalCenter
                         source: "image/FontPage.svg"
                         Text {
                           id: title12
                           color: "#ffffff"
                           text: strings[146]
                           font.pixelSize: 15
                           x: 33
                           y: 95
                       }
                     MouseArea {
                          id: mouseFontPage
                          x: -10
                          y: -10
                          width: parent.width +20
                          height: parent.height +20
                          anchors.verticalCenterOffset: 5
                          anchors.horizontalCenterOffset: -10
                          anchors.centerIn: parent
                          onClicked: {fontPage();}
                     }
                          anchors.verticalCenter: rectMe.verticalCenter
                          opacity: 1
                     }
                     Image {
                         id: imageThemPage
                         x: 135
                         y: 220
                         width: 100
                         height: 100
                         anchors.top: parent.top
                         anchors.topMargin: 290
                         anchors.horizontalCenter: rectMe.horizontalCenter
                         source: "image/ThemPage.svg"
                         Text {
                           id: title16
                           color: "#ffffff"
                           text: strings[212]
                           font.pixelSize: 15
                           x: 34
                           y: 95
                       }
                     MouseArea {
                          id: mouseThemPage
                          x: -10
                          y: -10
                          width: parent.width +20
                          height: parent.height +20
                          anchors.verticalCenterOffset: 5
                          anchors.horizontalCenterOffset: -10
                          anchors.centerIn: parent
                          onClicked: {themPage();}
                     }
                          anchors.verticalCenter: rectMe.verticalCenter
                          opacity: 1
                     }
                     //Третий ряд
                     Image {
                       id: imageSubstratePage
                       x: 245
                       anchors.top: parent.top
                       anchors.topMargin: 181
                       width: 100
                       height: 100
                       anchors.horizontalCenter: rectFriends.horizontalCenter
                       source: "image/SubstratePage.svg"
                       Text {
                         id: title14
                         color: "#ffffff"
                         text: strings[147]
                         font.pixelSize: 15
                         x: 15
                         y: 95
                     }
                     MouseArea {
                         id: mouseSubstratePage
                         x: -10
                         y: -20
                         width: parent.width +20
                         height: parent.height +20
                         anchors.verticalCenterOffset: -10
                         anchors.horizontalCenterOffset: 0
                         anchors.centerIn: parent
                         onClicked: {substratePage();}
                     }
                         anchors.verticalCenter: rectFriends.verticalCenter
                         opacity: 1
                     }
                     Image {
                         id: imageNotePage
                         x: 245
                         y: 220
                         width: 100
                         height: 100
                         anchors.top: parent.top
                         anchors.topMargin: 290
                         anchors.horizontalCenter: rectMe.horizontalCenter
                         source: "image/NotePage.svg"
                         Text {
                           id: title20
                           color: "#ffffff"
                           text: strings[227]
                           font.pixelSize: 15
                           x: 24
                           y: 95
                       }
                     MouseArea {
                          id: mouseNotePage
                          x: -10
                          y: -10
                          width: parent.width +20
                          height: parent.height +20
                          anchors.verticalCenterOffset: 5
                          anchors.horizontalCenterOffset: -10
                          anchors.centerIn: parent
                          onClicked: {notePage();}
                     }
                          anchors.verticalCenter: rectMe.verticalCenter
                          opacity: 1
                     }
                      //anchors.verticalCenter: parent.verticalCenter
                      anchors.right: parent.right
                      anchors.left: parent.left
                 }
              }
             }
             Page {
                 id: tab3content
                 Rectangle {
                     id: background1
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
                  Column {
                     id: c3
                     spacing: 10
                     anchors.top: parent.top
                     anchors.topMargin: 0
                       Text {
                         id: title17
                         color: "#ffffff"
                         text: strings[219]
                         font.pixelSize: 25
                         font.bold: true
                         anchors.leftMargin: 5
                         anchors.left: parent.left
                     }

                  Image {
                     id: logo3
                     anchors.horizontalCenter: parent.horizontalCenter
                     width: 130
                     height: 130
                     source: "image/StylePage_logo.png"
                 }
             //Первый ряд
                  Image {
                     id: imageStyleArea
                     x: 25
                     width: 100
                     height: 100
                     anchors.horizontalCenter: rectFriends.horizontalCenter
                     source: "image/StylePage.svg"
                     Text {
                       id: title18
                       color: "#ffffff"
                       text: strings[142]
                       font.pixelSize: 15
                       x: 13
                       y: 95
                   }
                     MouseArea {
                         id: mouseStyleArea
                         x: -10
                         y: -20
                         width: parent.width +20
                         height: parent.height +20
                         anchors.verticalCenterOffset: -10
                         anchors.horizontalCenterOffset: 0
                         anchors.centerIn: parent
                         onClicked: {stylePage();}
                         }
                         anchors.verticalCenter: rectFriends.verticalCenter
                         opacity: 1
                     }
                  //Второй ряд
                  Image {
                    id: imageIOSPage
                    x: 135
                    y: 450
                    width: 100
                    height: 100
                    anchors.top: parent.top
                    anchors.topMargin: 181
                    anchors.horizontalCenter: rectFriends.horizontalCenter
                    source: "image/IOSPage.svg"
                    Text {
                      id: title19
                      color: "#ffffff"
                      text: strings[223]
                      font.pixelSize: 15
                      x: 36
                      y: 95
                  }
                  MouseArea {
                      id: mouseIOSPage
                      x: -10
                      y: -20
                      width: parent.width +20
                      height: parent.height +20
                      anchors.verticalCenterOffset: -10
                      anchors.horizontalCenterOffset: 0
                      anchors.centerIn: parent
                      onClicked: {iosPage();}
                  }
                      anchors.verticalCenter: rectFriends.verticalCenter
                      opacity: 1
                  }
                  //Третий ряд
                  Image {
                    id: imageSwypeUnlockPage
                    x: 245
                    anchors.top: parent.top
                    anchors.topMargin: 181
                    width: 100
                    height: 100
                    anchors.horizontalCenter: rectFriends.horizontalCenter
                    source: "image/SwypeUnlock.svg"
                    Text {
                      id: title21
                      color: "#ffffff"
                      text: "SwypeUnlock"
                      font.pixelSize: 15
                      x: 9
                      y: 95
                  }
                  MouseArea {
                      id: mouseSwypeUnlockPage
                      x: -10
                      y: -20
                      width: parent.width +20
                      height: parent.height +20
                      anchors.verticalCenterOffset: -10
                      anchors.horizontalCenterOffset: 0
                      anchors.centerIn: parent
                      onClicked: {swypeunlockPage();}
                  }
                      anchors.verticalCenter: rectFriends.verticalCenter
                      opacity: 1
                  }

                    //anchors.verticalCenter: parent.verticalCenter
                      anchors.right: parent.right
                      anchors.left: parent.left
                 }
              }
                }
             // define the content for tab 4
             /*Page {
                 id: tab4content
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
                  Column {
                     id: c1
                     spacing: 10
                     anchors.top: parent.top
                     anchors.topMargin: 0
                       Text {
                         id: title13
                         color: "#ffffff"
                         text: "dUnlock"
                         font.pixelSize: 25
                         font.bold: true
                         anchors.leftMargin: 5
                         anchors.left: parent.left
                     }

                  Image {
                     id: logo1
                     anchors.horizontalCenter: parent.horizontalCenter
                     width: 130
                     height: 130
                     source: "image/logo.png"
                     }
             //Первый ряд
                  Image {
                       id: imageUpdatePage
                       x: 25
                       y: 450
                       width: 100
                       height: 100
                       anchors.horizontalCenter: rectMe.horizontalCenter
                       source: "image/Update.svg"
                       Text {
                         id: title7
                         color: "#ffffff"
                         text: strings[148]
                         font.pixelSize: 15
                         x: 12
                         y: 93
                     }
                       MouseArea {
                         id: mouseUpdatePage
                         x: -20
                         y: -5
                         width: parent.width +20
                         height: parent.height +20
                         anchors.verticalCenterOffset: 5
                         anchors.horizontalCenterOffset: -10
                         anchors.centerIn: parent
                         onClicked: {updatePage();}
                     }
                         anchors.verticalCenter: rectMe.verticalCenter
                         opacity: 1
                     }
                  Image {
                    id: imageAboutPage
                    x: 25
                    y: 300
                    width: 100
                    height: 100
                    anchors.horizontalCenter: rectMe.horizontalCenter
                    source: "image/about.svg"
                    Text {
                      id: title6
                      color: "#ffffff"
                      text: strings[149]
                      font.pixelSize: 15
                      x: 30
                      y: 95
                  }
                    MouseArea {
                      id: mouseAboutPage
                      x: -10
                      y: -10
                      width: parent.width +20
                      height: parent.height +20
                      anchors.verticalCenterOffset: 5
                      anchors.horizontalCenterOffset: -10
                      anchors.centerIn: parent
                      onClicked: {about();}
                 }
                      anchors.verticalCenter: rectMe.verticalCenter
                      opacity: 1
                 }
                  //Второй ряд
                     Image {
                         id: imageContactPage
                         x: 135
                         y: 450
                         width: 100
                         height: 100
                         anchors.top: parent.top
                         anchors.topMargin: 181
                         anchors.horizontalCenter: rectMe.horizontalCenter
                         source: "image/ContactPage.svg"
                         Text {
                           id: title8
                           color: "#ffffff"
                           text: strings[150]
                           font.pixelSize: 15
                           x: 25
                           y: 93
                       }
                     MouseArea {
                          id: mouseContactPage
                          x: -10
                          y: -10
                          width: parent.width +20
                          height: parent.height +20
                          anchors.verticalCenterOffset: 5
                          anchors.horizontalCenterOffset: -10
                          anchors.centerIn: parent
                          onClicked: {contactPage();}
                     }
                          anchors.verticalCenter: rectMe.verticalCenter
                          opacity: 1
                     }
                     //Третий ряд
                     Image {
                          id: imageHelpPage
                          x: 245
                          y: 450
                          width: 100
                          height: 100
                          anchors.top: parent.top
                          anchors.topMargin: 181
                          anchors.horizontalCenter: rectMe.horizontalCenter
                          source: "image/HelpPage.svg"
                     Text {
                       id: title9
                       color: "#ffffff"
                       text: strings[151]
                       font.pixelSize: 15
                       x: 22
                       y: 93
                   }
                 MouseArea {
                      id: mouseHelpPage
                      x: -10
                      y: -10
                      width: parent.width +20
                      height: parent.height +20
                      anchors.verticalCenterOffset: 5
                      anchors.horizontalCenterOffset: -10
                      anchors.centerIn: parent
                      onClicked: {helpPage();}
                 }
                      anchors.verticalCenter: rectMe.verticalCenter
                      opacity: 1
                 }
                      //anchors.verticalCenter: parent.verticalCenter
                      anchors.right: parent.right
                      anchors.left: parent.left
                 }
              }
             }*/
    }
         ContextMenu {
               id: sortSubMenu1
               platformInverted: menu.platformInverted
               MenuLayout {
                  MenuItem {
                       platformInverted: menu.platformInverted
                       text: strings[152]
                       onClicked: {appsPage();}
                         }
                         MenuItem {
                             platformInverted: menu.platformInverted
                             text: strings[153]
                             onClicked: {appsPage1();}
                         }
                         MenuItem {
                             platformInverted: menu.platformInverted
                             text: strings[154]
                             onClicked: {appsPage2();}
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

                flat: true
                id:backbtn;
                platformInverted: toolBar.platformInverted
                iconSource: "toolbar-back.png"
                onClicked: {Qt.quit();}
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
                iconSource: "image/info.png"
                onClicked: {informationPage();}
            }
        }
    }
    Component.onCompleted: application.HideSplash();
}

