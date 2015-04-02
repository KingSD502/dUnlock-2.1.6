// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Item {
    Connections{
        target:application
        onWhiteThemeChanged:{
            slider.platformInverted=newstate;
            }
       }
    id: root
    property alias label: label.text
    property alias slider: slider.value
    property alias extra: line2.text
    signal clicked
    opacity: appEnabled
    width: parent.width
    height: appEnabled ? 150 : 0
    Behavior on opacity { NumberAnimation { duration: 200 } }
    Behavior on height { NumberAnimation { duration: 200 } }
    Column {
        id: column
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5
        Text {
            id: label
            anchors.left: parent.left
            anchors.leftMargin: 10
            color: "white"
        }
        Rectangle {
            height: slider.height
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 20
            radius: 10
            color: "gray"

            Slider {
                platformInverted: slider.platformInverted
                id: slider
                anchors.fill: parent
                minimumValue: 0
                maximumValue: 100
                stepSize: 10
                onPressedChanged: {
                    if(!pressed) root.clicked()
      "black" }
                    }
        }
        Text {
            id: line2
            anchors.left: parent.left
            anchors.leftMargin: 20
            color: "white"
        }
    }
}
