import QtQuick 1.0

MouseArea{
    id: m;
    smooth: true
    width: 60;
    height: 60
    signal press;
    signal release;
    signal longPress;
    property string icon: ""
    property string iconPressed:"graphics/"+icon+"-pressed.png"
    onClicked: {press();}
    onPressAndHold: {longPress();}
    onReleased: {release();}
    onPressedChanged: {proxy.MovingChanged(pressed);}
    onExited: {release();}
    Image{
        anchors.centerIn: parent
        width: 40;
        height: 40;
        source: m.pressed?m.iconPressed:"graphics/"+m.icon+".png"
    }
    }
