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
    anchors.fill: parent
    signal back;
    //....
    Connections{
        target:application
        onPlayerAlbumChanged:{playeralbum.checked=newstate;}
        onSoundUnlockChanged:{volumesound.checked=newstate;}
        onWhiteThemeChanged:{
            toolBar.platformInverted=newstate;
            }
        onSoundVolumeChanged:{soundSlider.slider=(newstate);}
       }
    // define a tab bar with three buttons and link them to the content
         TabBar {
             id: tabBar
             platformInverted: toolBar.platformInverted
             anchors { left: parent.left; right: parent.right; top: parent.top }
             TabButton { tab: tab1content; text: strings[159];platformInverted: toolBar.platformInverted }
             TabButton { tab: tab2content; text: strings[160];platformInverted: toolBar.platformInverted }

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
                          id: logo3
                          source: "image/musicPage.png"
                             }
                     Row{
                          id:r5;
                          anchors.left: parent.left
                          anchors.right: parent.right
                          anchors.leftMargin: 25;
                          anchors.rightMargin: 22;
                          Text{
                             text: strings[23]
                             color:"white"
                             font.pixelSize: 20
                             wrapMode: Text.WordWrap
                             anchors.left: parent.left
                             anchors.right: playeralbum.left
                             anchors.verticalCenter: playeralbum.verticalCenter
                          }
                         Switch{
                             id: playeralbum;
                             onCheckedChanged:{application.ChangeSetting("playeralbum",checked);}
                             anchors.right: parent.right
                                 }
                             }
                          }
                      }
                }

             // define the content for tab 2
             Page {
                 id: tab2content
                 Image {
                     anchors.horizontalCenter: parent.horizontalCenter
                     id: logo4
                     source: "image/musicPage.png"
                 }

                 Row{
                      y: 83
                      id:r1;
                      anchors.left: parent.left
                      anchors.right: parent.right
                      anchors.leftMargin: 25;
                      anchors.rightMargin: 22;
                      Text{
                         text: strings[160]
                         color:"white"
                         font.pixelSize: 20
                         wrapMode: Text.WordWrap
                         anchors.left: parent.left
                         anchors.right: volumesound.left
                         anchors.verticalCenter: volumesound.verticalCenter
                      }
                     Switch{
                         id: volumesound;
                         onCheckedChanged:{application.ChangeSetting("zzzzzzzzzsoundunlock",checked);}
                         anchors.right: parent.right
                             }
                         }
                 CustomSlider {
                     id: soundSlider
                     y: 220
                     label: strings[161] + (slider === 0 ? strings[162] : slider + "%")
                     extra: strings[218]
                     //slider: sound
                     onSliderChanged: {application.ChangeSetting("zzzzzzzzzzsoundvolume",(slider));}
                     //onClicked: sound = slider
                     visible:volumesound.checked
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
