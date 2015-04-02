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
    anchors.fill: parent
    signal back;
    //....
    Connections{
        target:application
        onApp1Changed:{app1.subTitle=app;}
        onApp2Changed:{app2.subTitle=app;}
        onApp3Changed:{app3.subTitle=app;}
        onApp4Changed:{app4.subTitle=app;}
        onApp5Changed:{app5.subTitle=app;}
        onApp6Changed:{app6.subTitle=app;}
        onApp7Changed:{app7.subTitle=app;}
        onApp8Changed:{app8.subTitle=app;}
        onApp9Changed:{app9.subTitle=app;}
        onApp10Changed:{app10.subTitle=app;}
        onApp11Changed:{app11.subTitle=app;}
        onApp12Changed:{app12.subTitle=app;}
        onApp13Changed:{app13.subTitle=app;}
        onApp14Changed:{app14.subTitle=app;}
        onApp15Changed:{app15.subTitle=app;}
        onApp16Changed:{app16.subTitle=app;}
        //onApp17Changed:{app17.subTitle=app;}
        onApp18Changed:{app18.subTitle=app;}
        onApp19Changed:{app19.subTitle=app;}
        onApp20Changed:{app20.subTitle=app;}
        onApp21Changed:{app21.subTitle=app;}
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
                        text: strings[187]
                        font.pixelSize: 30;
                        font.bold: true;
                        color:"white"
                    }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: logo1
                        source: "image/LaunchArea.png"
                    }

                    ListHeading {
                    ListItemText {
                        anchors.centerIn: parent
                        role: "Heading"
                        text: strings[188]}}
                    SelectionListItem {
                         id: app2
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[49]
                         subTitle: app2d.model[app2d.selectedIndex]
                         onClicked: {app2d.open();}
                         AppDialog {
                             id: app2d
                             titleText: strings[49]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app2.subTitle=app2d.model[app2d.selectedIndex];application.ChangeSetting("app2",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app3
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[50]
                         subTitle: app3d.model[app3d.selectedIndex]
                         onClicked: {app3d.open();}
                         AppDialog {
                             id: app3d
                             titleText: strings[50]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app3.subTitle=app3d.model[app3d.selectedIndex];application.ChangeSetting("app3",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app4
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[51]
                         subTitle: app4d.model[app4d.selectedIndex]
                         onClicked: {app4d.open();}
                         AppDialog {
                             id: app4d
                             titleText: strings[51]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app4.subTitle=app4d.model[app4d.selectedIndex];application.ChangeSetting("app4",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app5
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[52]
                         subTitle: app5d.model[app5d.selectedIndex]
                         onClicked: {app5d.open();}
                         AppDialog {
                             id: app5d
                             titleText: strings[52]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app5.subTitle=app5d.model[app5d.selectedIndex];application.ChangeSetting("app5",selectedIndex);}
                             }
                         }
                     ListHeading {
                     ListItemText {
                         anchors.centerIn: parent
                         role: "Heading"
                         text: strings[189]}}
                     SelectionListItem {
                         id: app6
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[49]
                         subTitle: app6d.model[app5d.selectedIndex]
                         onClicked: {app6d.open();}
                         AppDialog {
                             id: app6d
                             titleText: strings[49]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app6.subTitle=app6d.model[app6d.selectedIndex];application.ChangeSetting("app6",selectedIndex);}
                             }
                        }
                     SelectionListItem {
                         id: app7
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[50]
                         subTitle: app7d.model[app7d.selectedIndex]
                         onClicked: {app7d.open();}
                         AppDialog {
                             id: app7d
                             titleText: strings[50]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app7.subTitle=app7d.model[app7d.selectedIndex];application.ChangeSetting("app7",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app8
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[51]
                         subTitle: app8d.model[app8d.selectedIndex]
                         onClicked: {app8d.open();}
                         AppDialog {
                             id: app8d
                             titleText: strings[51]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app8.subTitle=app8d.model[app8d.selectedIndex];application.ChangeSetting("app8",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app9
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[52]
                         subTitle: app9d.model[app9d.selectedIndex]
                         onClicked: {app9d.open();}
                         AppDialog {
                             id: app9d
                             titleText: strings[52]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app9.subTitle=app9d.model[app9d.selectedIndex];application.ChangeSetting("app9",selectedIndex);}
                             }
                         }
                     ListHeading {
                     ListItemText {
                         anchors.centerIn: parent
                         role: "Heading"
                         text: strings[190]}}
                     SelectionListItem {
                         id: app10
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[49]
                         subTitle: app10d.model[app10d.selectedIndex]
                         onClicked: {app10d.open();}
                         AppDialog {
                             id: app10d
                             titleText: strings[49]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app10.subTitle=app10d.model[app10d.selectedIndex];application.ChangeSetting("app10",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app11
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[50]
                         subTitle: app11d.model[app11d.selectedIndex]
                         onClicked: {app11d.open();}
                         AppDialog {
                             id: app11d
                             titleText: strings[50]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app11.subTitle=app11d.model[app11d.selectedIndex];application.ChangeSetting("app11",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app12
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[51]
                         subTitle: app12d.model[app12d.selectedIndex]
                         onClicked: {app12d.open();}
                         AppDialog {
                             id: app12d
                             titleText: strings[51]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app12.subTitle=app12d.model[app12d.selectedIndex];application.ChangeSetting("app12",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app13
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[52]
                         subTitle: app13d.model[app13d.selectedIndex]
                         onClicked: {app13d.open();}
                         AppDialog {
                             id: app13d
                             titleText: strings[52]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app13.subTitle=app13d.model[app13d.selectedIndex];application.ChangeSetting("app13",selectedIndex);}
                             }
                         }
                     ListHeading {
                     ListItemText {
                         anchors.centerIn: parent
                         role: "Heading"
                         text: strings[191]}}
                     SelectionListItem {
                         id: app14
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[49]
                         subTitle: app14d.model[app14d.selectedIndex]
                         onClicked: {app14d.open();}
                         AppDialog {
                             id: app14d
                             titleText: strings[49]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app14.subTitle=app14d.model[app14d.selectedIndex];application.ChangeSetting("app14",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app15
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[50]
                         subTitle: app15d.model[app15d.selectedIndex]
                         onClicked: {app15d.open();}
                         AppDialog {
                             id: app15d
                             titleText: strings[50]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app15.subTitle=app15d.model[app15d.selectedIndex];application.ChangeSetting("app15",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app16
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[51]
                         subTitle: app16d.model[app16d.selectedIndex]
                         onClicked: {app16d.open();}
                         AppDialog {
                             id: app16d
                             titleText: strings[51]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app16.subTitle=app16d.model[app16d.selectedIndex];application.ChangeSetting("app16",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app18
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[52]
                         subTitle: app18d.model[app18d.selectedIndex]
                         onClicked: {app18d.open();}
                         AppDialog {
                             id: app18d
                             titleText: strings[52]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app18.subTitle=app18d.model[app18d.selectedIndex];application.ChangeSetting("app18",selectedIndex);}
                             }
                         }
                     ListHeading {
                     ListItemText {
                         anchors.centerIn: parent
                         role: "Heading"
                         text: strings[192]}}
                     SelectionListItem {
                         id: app19
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[49]
                         subTitle: app19d.model[app19d.selectedIndex]
                         onClicked: {app19d.open();}
                         AppDialog {
                             id: app19d
                             titleText: strings[49]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app19.subTitle=app19d.model[app19d.selectedIndex];application.ChangeSetting("app19",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app20
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[50]
                         subTitle: app20d.model[app20d.selectedIndex]
                         onClicked: {app20d.open();}
                         AppDialog {
                             id: app20d
                             titleText: strings[50]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app20.subTitle=app20d.model[app20d.selectedIndex];application.ChangeSetting("app20",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                         id: app21
                         anchors.left: parent.left
                         anchors.right: parent.right
                         anchors.leftMargin: 15;
                         anchors.rightMargin: 5;
                         title: strings[51]
                         subTitle: app21d.model[app21d.selectedIndex]
                         onClicked: {app21d.open();}
                         AppDialog {
                             id: app21d
                             titleText: strings[51]
                             model: appModel
                             selectedIndex:0
                             onAccepted: {app21.subTitle=app21d.model[app21d.selectedIndex];application.ChangeSetting("app21",selectedIndex);}
                             }
                         }
                     SelectionListItem {
                          id: app1
                          anchors.left: parent.left
                          anchors.right: parent.right
                          anchors.leftMargin: 15;
                          anchors.rightMargin: 5;
                          title: strings[52]
                          subTitle: app1d.model[app1d.selectedIndex]
                          onClicked: {app1d.open();}
                          AppDialog {
                              id: app1d
                              titleText: strings[52]
                              model: appModel
                              selectedIndex:0
                              onAccepted: {app1.subTitle=app1d.model[app1d.selectedIndex];application.ChangeSetting("app1",selectedIndex);}
                              }
                          }
   }
}
    StatusBar {
        id: statusBar
        y:0
        x:0
    }

    ToolBar {
        id: toolBar
        anchors.bottom: parent.bottom
        tools: ToolBarLayout {
            id: toolBarLayout
            ToolButton {
                flat: true
                id:backbtn;
                iconSource: "toolbar-back.png"
                onClicked: {pageStack.replace(Qt.resolvedUrl("MainPage.qml"))}
            }
            ToolButton {
                flat: true
                iconSource: "image/ovi.png"
                onClicked: {Qt.openUrlExternally("http://store.ovi.com/publisher/Alexander+Fokin/");}
            }
        }
    }
}
