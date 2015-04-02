import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
//import QtQuick 1.1


Item {
    anchors.fill: parent
    id:m
    property int handleSize: 65
    signal hideLaunch;
    property int margin:0;
    MouseArea{
        x: -247
        y: -478
        width: 717
        height: 828
        anchors.rightMargin: -470
        anchors.bottomMargin: -350
        anchors.leftMargin: -247
        anchors.topMargin: -478
        anchors.fill: parent;
        onClicked: hideLaunch();
    }
    Image {
                id: launch
                x: -32
                y: -128
                width: 326
                height: 384
                source: "graphics/launch.png"
    }
    Image {
        id: app1
        source: "image://icons/"+apps[1]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:-116
        x:-22
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[1]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app2
        source: "image://icons/"+apps[2]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:-116
        x:58
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[2]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app3
        source: "image://icons/"+apps[3]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:-116
        x:138
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[3]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app4
        source: "image://icons/"+apps[4]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:-116
        x:218
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[4]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app5
        source: "image://icons/"+apps[5]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:-44
        x:-22
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[5]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }

    }
    Image {
        id: app6
        source: "image://icons/"+apps[6]
        width: m.handleSize
        visible:true
        height: m.handleSize
        y:-44
        x:58
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[6]);}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app7
        source: "image://icons/"+apps[7]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:-44
        x:138
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[7]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app8
        source: "image://icons/"+apps[8]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:-44
        x:218
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[8]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app9
        source: "image://icons/"+apps[9]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:30
        x:-22
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[9]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app10
        source: "image://icons/"+apps[10]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:30
        x:58
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[10]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app11
        source: "image://icons/"+apps[11]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:30
        x:138
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[11]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }

    }
    Image {
        id: app12
        source: "image://icons/"+apps[12]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:30
        x:218
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[12]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app13
        source: "image://icons/"+apps[13]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:103
        x:-21
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[13]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }

    Image {
        id: app14
        source: "image://icons/"+apps[14]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:103
        x:58
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[14]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app15
        source: "image://icons/"+apps[15]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:103
        x:138
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[15]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app16
        source: "image://icons/"+apps[16]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:103
        x:218
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[16]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app17
        source: "image://icons/"+apps[17]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:176
        x:-22
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[17]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app18
        source: "image://icons/"+apps[18]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:176
        x:58
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[18]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app19
        source: "image://icons/"+apps[19]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:176
        x:138
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[19]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
    Image {
        id: app0
        source: "image://icons/"+apps[0]
        width: m.handleSize
        height: m.handleSize
        visible: true
        y:176
        x:218
        MouseArea{
            anchors.fill: parent;
            anchors.topMargin: m.margin;
            anchors.bottomMargin: m.margin;
            anchors.leftMargin: m.margin;
            anchors.rightMargin: m.margin;
            onClicked: {application.Hide();application.Launch(apps[0]);hideLaunch();}
            Rectangle{
                anchors.fill: parent
                opacity: 0.5
                color:"black"
                visible: parent.pressed
                radius: 20;
            }
        }
    }
}
