import QtQuick 1.0

Item {
    visible: true
    id: itemContainer
    width: 360
    height: contentHeight();
    x:0;y:0;
    property int type: -1
    property alias itemSummary: summaryText.text
    property alias itemBody: contentText.text
    property alias timestamp: timestampText.text
    property alias typeIcon: notificationIcon.source

    function contentHeight() {
        return timestampText.y+timestampText.height+5;
    }

    Image {
        id: image1
        x: 0
        y: 3
        width: 360
        height: 106
        smooth: false
        opacity: 0.880
        source: "notify/bg.png"
    }

    Rectangle{
        id:border;
        anchors.margins: {top:3;left:3;right:3;}
        anchors.fill:parent
        color: "transparent";
        opacity: 0.7
        radius: 3;
    }

    Item {
        id: panelSize
        property int baseSize: itemContainer.width
        property int oneHalf: Math.round(baseSize/2)
        property int oneThird: Math.round(baseSize/3)
        property int oneFourth: Math.round(baseSize/4)
        property int oneSixth: Math.round(baseSize/6)
        property int oneEigth: Math.round(baseSize/8)
        property int oneTenth: Math.round(baseSize/10)
        property int oneTwentieth: Math.round(baseSize/20)
        property int oneTwentyFifth: Math.round(baseSize/25)
        property int oneThirtieth: Math.round(baseSize/30)
        property int oneSixtieth: Math.round(baseSize/60)
        property int oneEightieth: Math.round(baseSize/80)
        property int oneHundredth: Math.round(baseSize/100)
    }

    Image {
        id: notificationIcon
        source: icon
        anchors.top: parent.top
        anchors.topMargin: panelSize.oneThirtieth
        anchors.left: parent.left
        anchors.leftMargin: panelSize.oneThirtieth
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }
    Text {
        id: summaryText
        x: 3
        y: 40
        width: 324
        height: 20
        color: "#ffffff"
        anchors.right: parent.right
        anchors.top: notificationIcon.top
        anchors.topMargin: 28
        anchors.left: notificationIcon.right
        font.bold: false
        font.pixelSize: 15
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        clip:false
        elide: Text.ElideRight
        text: notifText
        opacity: 1
        font.underline: false
        font.italic: true
        anchors.rightMargin: 33
        anchors.leftMargin: -9
    }

    Text {
        id: contentText
        x: 76
        y: 12
        width: summaryText.width
        height: 25
        anchors.top: summaryText.top
        anchors.left: summaryText.left
        font.pixelSize: 19
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        clip:true;
        color: "#ffffff"
        text: from
        font.bold: true
        font.underline: true
        font.italic: false
        anchors.leftMargin: 73
        anchors.topMargin: -28
    }

    Text {
        id: timestampText
        x: 163
        y: 71
        width: contentText.width
        height: 18
        anchors.top: notificationIcon.top
        anchors.left: notificationIcon.right
        //notificationIcon.width/2
        anchors.bottomMargin: 20
        font.pixelSize: 15
        color:"#e4dfdf"
        wrapMode: Text.NoWrap
        elide: Text.ElideRight
        text:notifTime
        anchors.leftMargin: 151
        anchors.topMargin: 59
    }
    MouseArea{
    anchors.fill: itemContainer
    onClicked: {notify.openViewer(index);}
    }

}
