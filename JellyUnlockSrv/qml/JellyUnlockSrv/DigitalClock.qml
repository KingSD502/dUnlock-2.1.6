import Qt 4.7

Item {
    id: clock
    width : parent.width
    height : columnLayout.height
    //property color textColor : "black"
    property color textColor : settings[17]==0 ? 'black' : 'white'
    property int fontSize : 85
    property int fontSizeDate: 22
    property variant hours : "00:00"
    property variant minutes : "00"
    property variant seconds : ""

    property string date: ""
    property variant shift : 0
    property bool showSeconds : true
    property bool showDate : true
    property int customfont: 0;
    function changeCharging(charge, percent)
    {
        if (charge)
        {
            charging.visible=true;
            charging.text=strings[34]+", "+percent+"%";
            columnLayout.spacing=7;
            charging.height=charging.paintedHeight;
        }
        else
        {
            charging.visible=true;
            charging.text=strings[60]+", "+percent+"%";
            columnLayout.spacing=7;
            charging.height=charging.paintedHeight;
        }

    }

    function timeChanged() {
        // To be fixed to fit locale
        var Month = new Array(strings[7], strings[8], strings[9], strings[10],strings[11], strings[12],strings[13],strings[14], strings[15],strings[16], strings[17],strings[18]);
        var Days = new Array(strings[6],strings[0], strings[1], strings[2], strings[3],strings[4], strings[5],"gg");
        var d = new Date;
        timer.interval=calcSecsToMin()*1000;
        var h=application.getTime();
        clock.hours=h.toString().split(" ")[0];
        var t=h.toString().split(" ")[1];
        amText.text=t?t:" ";
        amText.font.pixelSize=t?clock.fontSize/4:1;
        date=lang!=16?application.GetDate():Days[d.getDay()]+", "+d.getDate() + " " + Month[d.getMonth()] + " " + d.getFullYear();
    }

    function checkTime(i) {
        return (i<10) ? "0"+i : i;
    }
    function calcSecsToMin(){
    var d = new Date;
    console.log(60-d.getSeconds())
    return 60-d.getSeconds();
    }

    Timer {
        id: timer;
        interval: calcSecsToMin()*1000; running: true; repeat: true;
        onTriggered: clock.timeChanged()
    }
    FontLoader { id: fixedFont; source: "AndroidClock.ttf" }
    FontLoader { id: dateFont; source: "DroidSans.ttf" }
    FontLoader { id: fixedFont1; source: "AndroidClock1.ttf" }
    FontLoader { id: dateFont1; source: "DroidSans1.ttf" }
    Column {
        anchors.right: clock.right
            id: columnLayout
            spacing: 10;
            Text {
                id: amText
                text: " "
                width: paintedWidth
                height: hoursText.paintedHeight-10;
                color: clock.textColor
                font { family: settings[6]==0 ? dateFont.name : dateFont1.name; bold: true; pixelSize: clock.fontSize; italic: false; capitalization: Font.SmallCaps }
                anchors.right: parent.right
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignBottom
                clip: false;
                Text {
                    id: hoursText
                    text: clock.hours
                    width: clock.width
                    color: clock.textColor
                    font { family: settings[6]==0 ? fixedFont.name : fixedFont1.name; bold: true; pixelSize: clock.fontSize; italic: false; capitalization: Font.SmallCaps }
                    anchors.right: amText.left
                    anchors.rightMargin: 17;
                    horizontalAlignment: Text.AlignRight
                }
            }
    }
            Text {
                id : dateText
        anchors.left: parent.left
        anchors.leftMargin:13
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 377
                text: clock.date
                horizontalAlignment: Text.AlignRight
                color: "white"
                //font.pixelSize: 0
                font { family: settings[6]==0?dateFont.name:proxy.GetFont(); bold: false; pixelSize: 0; italic: false;}
                visible : false
                Component.onCompleted: {timeChanged();}
            }
}

/*
                font.bold: true;
                font.pixelSize: clock.fontSize;
                font.italic: false;
                font.capitalization: Font.SmallCaps
                font.family: settings[6]==0?fixedFont.name:proxy.GetFont();
 */
