import QtQuick 1.0

MouseArea{
    id: m;
    width: 45;
    height: 40;
    signal press;
    signal release;
    signal longPress;
    property string icon: ""
    property string iconPressed:"player/"+icon+"-pressed.png"
    onClicked: {press();}
    onPressAndHold: {longPress();}
    onReleased: {release();}
    onPressedChanged: {proxy.MovingChanged(pressed);}
    onExited: {release();}
    Image{
        anchors.centerIn: parent
        width: 60;
        height: 60;
        source: m.pressed?m.iconPressed:"player/"+m.icon+".png"
    }
    }
