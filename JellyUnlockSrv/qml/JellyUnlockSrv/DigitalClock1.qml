import Qt 4.7

Item {
    id: clock
    width : parent.width
    height : columnLayout.height
    property color textColor : "white"
    property int fontSize : 80
    property int fontSizeDate: 60
    property variant hours : "00:00"
    property variant minutes : ""
    property variant seconds : ""

    property string date: ""
   property string weekDay:""
    property variant shift : 0
    property bool showSeconds : true
    property bool showDate : true
    function timeChanged() {
        // To be fixed to fit locale
        var Month = new Array(strings[7], strings[8], strings[9], strings[10],strings[11], strings[12],strings[13],strings[14], strings[15],strings[16], strings[17],strings[18]);
        var Days = new Array(strings[6],strings[0], strings[1], strings[2], strings[3],strings[4], strings[5],"gg");
        var t = new Date;
        timer.interval=calcSecsToMin()*1000;
        clock.hours=application.getTime();
        clock.weekDay=Days[t.getDay()];
        date=lang!=16?application.GetDateDrop():t.getDate() + " " + Month[t.getMonth()] + " " + t.getFullYear();
    }

    function checkTime(i) {
        return (i<10) ? "0"+i : i;
    }
    function calcSecsToMin(){
    var t = new Date;
    console.log(60-t.getSeconds())
    return 60-t.getSeconds();
    }

    Timer {
        id: timer;
        interval: calcSecsToMin()*1000; running: true; repeat: true;
        onTriggered: clock.timeChanged()
    }

    Column {
        anchors.right: clock.right
        id: columnLayout
        Text {
            id: hoursText
            x: 0
            text: clock.hours
            color: clock.textColor
            font.pixelSize: clock.fontSize
        }
      Text {
            id: weekDaytext
            text: clock.weekDay
            color: clock.textColor
            font.pixelSize: 20
            x: 120
            anchors.top: parent.top
        anchors.topMargin: 8
        }
      Text {
            id: datetext
            text: clock.date
            color: clock.textColor
            font.pixelSize: 17
            x: 120
            anchors.top: parent.top
        anchors.topMargin: 30
        }
    }
}   
