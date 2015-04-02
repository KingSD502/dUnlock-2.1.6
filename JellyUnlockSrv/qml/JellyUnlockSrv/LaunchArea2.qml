import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
//import QtQuick 1.1

    Rectangle {
        id: container
        x: -88
        y: 0
        width: 205; height: 640
        color: "transparent"

        Rectangle{
            id: downfill
            x: 89
            y: 0
            width: 388
            height: 640
            color: "black"
            anchors.rightMargin: -272
            anchors.bottomMargin: 0
            anchors.leftMargin: 89
            anchors.topMargin: 0
            opacity: 500 / (900.0 - rect.y)
            anchors.fill: parent;
            visible: rect.x>20;
            MouseArea{
                width: 388
                height: 640
                onClicked:{
                    left.start();
                }

            }
        }
        ParallelAnimation{
            id: left;
            NumberAnimation {target: rect; property: "x"; to: -21; duration: 400;easing.type: Easing.OutQuad }
        }
        Rectangle {
            id: rect
            x: -21
            y: 0
            width: 98; height: 640
            color: "transparent"

            MouseArea {
                x: 53
                y: 211
                width: 80
                height: 80
                anchors.leftMargin: 53
                anchors.topMargin: 211
                anchors.rightMargin: -71
                anchors.bottomMargin: 211
                anchors.fill: parent
                drag.target: rect
                drag.axis: Drag.XAxis
                drag.minimumX: 0
                drag.maximumX: container.width - rect.width

                BorderImage {
                    id: border_image1
                    x: -162
                    y: -211
                    width: 226
                    height: 640
                    source: "panel.png"
                    opacity: (800 - rect.x) / 900
                }
                onPressedChanged: {
                    proxy.MovingChanged(pressed);

                }
                Flickable {
                    id: flickArea
                    x: -43
                    y: -211
                    width: 102
                    height: 1648
                    anchors.rightMargin: 57
                    anchors.leftMargin: -43
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
                        x: 0
                        y: 38
                        width: 84
                        height: 578
                        anchors.rightMargin: 32
                        anchors.leftMargin: 0
                        anchors.right: parent.right
                        anchors.left: parent.left

                        Image {
                            id: files
                            width: 80
                            height: 80
                            MouseArea {
                                anchors.topMargin: m.margin
                                anchors.fill: parent

                                Rectangle {
                                    color: "#000000"
                                    radius: 30
                                    anchors.fill: parent
                                    visible: parent.pressed
                                    opacity: 0.500
                                }

                                anchors.rightMargin: m.margin
                                anchors.bottomMargin: m.margin
                                anchors.leftMargin: m.margin
                                onClicked: {application.Hide();application.Launch("0x101f84eb");rect.x=-21;}
                            }
                            source: "panel/files manager 1.png"
                            visible: true
                        }

                        Image {
                            id: diler
                            width: 80
                            height: 80
                            MouseArea {
                                anchors.fill: parent
                                anchors.topMargin: m.margin
                                Rectangle {
                                    x: 0
                                    y: 0
                                    color: "#000000"
                                    radius: 30
                                    anchors.rightMargin: 0
                                    anchors.bottomMargin: 0
                                    anchors.leftMargin: 0
                                    anchors.topMargin: 0
                                    anchors.fill: parent
                                    visible: parent.pressed
                                    opacity: 0.500
                                }
                                anchors.rightMargin: m.margin
                                anchors.bottomMargin: m.margin
                                anchors.leftMargin: m.margin
                                onClicked: {application.Hide();application.Launch("0x2005EC20");rect.x=-21;}
                            }
                            source: "panel/phone ziz.png"
                            visible: true
                        }

                        Image {
                            id: sms
                            width: 80
                            height: 80
                            MouseArea {
                                anchors.fill: parent
                                anchors.topMargin: m.margin
                                Rectangle {
                                    color: "#000000"
                                    radius: 30
                                    anchors.fill: parent
                                    visible: parent.pressed
                                    opacity: 0.500
                                }
                                anchors.rightMargin: m.margin
                                anchors.bottomMargin: m.margin
                                anchors.leftMargin: m.margin
                                onClicked: {rect.x=-21;application.Hide();application.Launch("0x100058c5");}
                            }
                            source: "panel/email.png"
                            visible: true
                        }

                        Image {
                            id: contact
                            width: 80
                            height: 80
                            MouseArea {
                                anchors.fill: parent
                                anchors.topMargin: m.margin
                                Rectangle {
                                    color: "#000000"
                                    radius: 30
                                    anchors.fill: parent
                                    visible: parent.pressed
                                    opacity: 0.500
                                }
                                anchors.rightMargin: m.margin
                                anchors.bottomMargin: m.margin
                                anchors.leftMargin: m.margin
                                onClicked: {application.Hide();application.Launch("0x101f4cce");rect.x=-21;}
                            }
                            source: "panel/contacts ziz.png"
                            visible: true
                        }

                        Image {
                            id: music
                            width: 80
                            height: 80
                            MouseArea {
                                anchors.fill: parent
                                anchors.topMargin: m.margin
                                Rectangle {
                                    color: "#000000"
                                    radius: 30
                                    anchors.fill: parent
                                    visible: parent.pressed
                                    opacity: 0.500
                                }
                                anchors.rightMargin: m.margin
                                anchors.bottomMargin: m.margin
                                anchors.leftMargin: m.margin
                                onClicked: {application.Hide();application.Launch("0x102072c3");rect.x=-21;}
                            }
                            source: "panel/play music.png"
                            visible: true
                        }

                        Image {
                            id: setting
                            width: 80
                            height: 80
                            MouseArea {
                                anchors.fill: parent
                                anchors.topMargin: m.margin
                                Rectangle {
                                    color: "#000000"
                                    radius: 30
                                    anchors.fill: parent
                                    visible: parent.pressed
                                    opacity: 0.500
                                }
                                anchors.rightMargin: m.margin
                                anchors.bottomMargin: m.margin
                                anchors.leftMargin: m.margin
                                onClicked: {application.Hide();application.Launch("0x100058ec");rect.x=-21;}
                            }
                            source: "panel/settings 2.png"
                            visible: true
                        }

                        Image {
                            id: gallery
                            width: 80
                            height: 80
                            MouseArea {
                                anchors.fill: parent
                                anchors.topMargin: m.margin
                                Rectangle {
                                    color: "#000000"
                                    radius: 30
                                    anchors.fill: parent
                                    visible: parent.pressed
                                    opacity: 0.500
                                }
                                anchors.rightMargin: m.margin
                                anchors.bottomMargin: m.margin
                                anchors.leftMargin: m.margin
                                onClicked: {application.Hide();application.Launch("0x200009ee");rect.x=-21;}
                            }
                            source: "panel/gallery.png"
                            visible: true
                        }

                        Image {
                            id: theme
                            width: 80
                            height: 80
                            MouseArea {
                                anchors.fill: parent
                                anchors.topMargin: m.margin
                                Rectangle {
                                    color: "#000000"
                                    radius: 30
                                    anchors.fill: parent
                                    visible: parent.pressed
                                    opacity: 0.500
                                }
                                anchors.rightMargin: m.margin
                                anchors.bottomMargin: m.margin
                                anchors.leftMargin: m.margin
                                onClicked: {application.Hide();application.Launch("0x10005a32");rect.x=-21;}
                            }
                            source: "panel/theme.png"
                            visible: true
                        }
                    }
        }
            }
            SequentialAnimation{
                id:hideAnim;
                ParallelAnimation{
                    //NumberAnimation { target: tb.anchors; property: "bottomMargin"; to: -60; duration: 200; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: topbg.anchors; property: "topMargin"; duration: 200; to:-topbg.height+mAreaToHide.height+timer.height; easing.type: Easing.InOutQuad; }
                    //NumberAnimation { target: mAreaToHide; property: "height"; duration: 200; to:30+timer.height; easing.type: Easing.InOutQuad }
                }
                ParallelAnimation{
                    NumberAnimation { target: c; property: "opacity"; duration: 1; to: 0; easing.type: Easing.InOutQuad; }
                    NumberAnimation { target: timer; property: "opacity"; to:1; duration: 1; easing.type: Easing.InOutQuad; }
                    NumberAnimation { target: listView; property: "opacity"; duration: 1; to:0.0; easing.type: Easing.InOutQuad; }
                }
            }
            SequentialAnimation{
                id:showAnim;
                ParallelAnimation{
                    NumberAnimation { target: c; property: "opacity"; duration: 1; to: 1; easing.type: Easing.InOutQuad; }
                    NumberAnimation { target: player; property: "opacity"; to:0; duration: 1; easing.type: Easing.InOutQuad; }
                    NumberAnimation { target: listView; property: "opacity"; duration: 1; to:1; easing.type: Easing.InOutQuad; }
                }
                ParallelAnimation{
                    //NumberAnimation { target: tb.anchors; property: "bottomMargin"; to: 0; duration: 200; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: topbg.anchors; property: "topMargin"; duration: 200; to:0; easing.type: Easing.InOutQuad; }
                    //NumberAnimation { target: mAreaToHide; property: "height"; duration: 200; to:30; easing.type: Easing.InOutQuad }
                }

            }

        }
    }
