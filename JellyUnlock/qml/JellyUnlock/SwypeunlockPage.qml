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
        onHorSenseChanged:{slider.value1=1-sense;}
        onVerSenseChanged:{slider.value2=1-sense;}
        onGestureChanged:{gestures.selectedIndex=newstate;gesture.subTitle=gestures.model[newstate];}
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
                    text: strings[230]
                    font.pixelSize: 30;
                    font.bold: true;
                    color:"white"
                }
                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: logo3
                        source: "image/SwypePage.png"
                    }
                    SelectionListItem {
                        id: sensevity
                        platformInverted: toolBar.platformInverted
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 15;
                        anchors.rightMargin: 5;
                        title: strings[231]
                        subTitle: ""
                        onClicked: {
                            slider.val1_store=slider.value1;
                            slider.val2_store=slider.value2;
                            slider.open();
                        }
                        SliderDialog{
                            platformInverted: toolBar.platformInverted
                            titleText: strings[231]
                            id: slider
                            onAccepted: {
                                application.ChangeSetting("zzzzzzzzzzzzzzhorsense",1-value1);
                                application.ChangeSetting("zzzzzzzzzzzzzzversense",1-value2);
                                }
                            }
                        }
                    /*Rectangle{
                        id: line
                        x: 17
                        width: 330
                        height: 0.5
                        color: "#2f2f30"
                    }*/
                    SelectionListItem {
                        id: gesture
                        platformInverted: toolBar.platformInverted
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 15;
                        anchors.rightMargin: 5;
                        title: strings[237]
                        subTitle: gestures.model[gestures.selectedIndex]
                        onClicked: {gestures.open();}
                        SelectionDialog {
                            id: gestures
                            platformInverted: toolBar.platformInverted
                            titleText: strings[237]
                            model: gesturelist
                            selectedIndex:0
                            onSelectedIndexChanged: {gesture.subTitle=gestures.model[gestures.selectedIndex];application.ChangeSetting("zzzzzzzzzzzzzzgesture",selectedIndex);}
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

