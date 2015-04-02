import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
//import QtQuick 1.1
import QtMultimediaKit 1.1
import QtMobility.feedback 1.1

Rectangle {
    id:root;
    width: 360
    height: 640
    color: "transparent"
    property int smsCount:0;
    property int callsCount:0;
    property int coverDisplay: 0;

    Audio {
            id: playMusic
          //playing: settings[21]==1
            source: "sound/unlock.mp3"
            volume: settings[21]/100.0;
            Component.onCompleted:{console.log("vol="+volume);}
        }
    HapticsEffect {
            id: rumbleEffect
            attackIntensity: 0.5
            attackTime: 50
            intensity: 0.3
            duration: 100 // set up the duration here, in millisecond
            fadeTime: 200
            fadeIntensity: 0.0
        }
    HapticsEffect {
            id: rumbleEffect1
            attackIntensity: 0.0
            attackTime: 200
            intensity: 0.5
            duration: 200 // set up the duration here, in millisecond
            fadeTime: 200
            fadeIntensity: 0.0
        }

    Connections{
        target:application
        onSetToZero:{
            handle.x=handle.centerX;
            handle.y=handle.centerY;
            toup.start();
            handle.source="handle_normal.svg";
            handle.visible=true;
            mainContainer.opacity=1;
            playerwidget.opacity=1;
            arrow.opacity=1;
            launcher.opacity=0
            unlockAnim.currentImage=16;
            unlockAnim.source="svg/15.png";

        }
        onUpdateWallpaper:{
            console.log("set wallpaper "+wallpaper)
            if (wallpaper.length<9){errtxt.visible=true; errcolor.color="black"; console.log("image error"); errtxt.text=strings[48];}
            else
            {
               if (!coverDisplay) wp.source=wallpaper;
               errtxt.visible=false;
               errcolor.color="transparent";
               console.log("no err in wallpaper");
            }
        }

        onChangeSize:{
            root.width=w;
            root.height=h;
            if (h>w){ // portrait
                clock.anchors.right=clock.parent.right;
                clock.anchors.left=undefined;
                playerwidget.anchors.right=playerwidget.parent.right;
                playerwidget.anchors.left=playerwidget.parent.left;
                playerwidget.anchors.leftMargin=10
                playerwidget.anchors.rightMargin=10
                m.anchors.verticalCenter=undefined;
                m.anchors.top=undefined;
                m.anchors.left=root.left
                m.anchors.leftMargin=camera.width/2+5;
                m.anchors.right=root.right
                m.anchors.rightMargin=unlock.width/2+5;
                m.anchors.bottom=root.bottom;
                m.anchors.horizontalCenter=root.horizontalCenter;
                m.anchors.bottomMargin=35;
                m.height=m.width;
                handle.x=handle.centerX;
                handle.y=handle.centerY;
                handle.source="handle_normal.svg";
                handle.visible=true;
                mainContainer.opacity=1;
                launchContainer.opacity=0;
            }
            else{ //landscape
                clock.anchors.left=clock.parent.left;
                clock.anchors.right=clock.parent.horizontalCenter;
                playerwidget.anchors.right=clock.right;
                playerwidget.anchors.left=playerwidget.parent.left;
                playerwidget.anchors.leftMargin=10
                playerwidget.anchors.rightMargin=10
                m.anchors.bottom=undefined;
                m.anchors.horizontalCenter=undefined;
                m.anchors.left=clock.right
                m.anchors.leftMargin=camera.width/2-5;
                m.anchors.right=root.right
                m.anchors.rightMargin=35
                m.anchors.verticalCenter=root.verticalCenter
                m.anchors.verticalCenterOffset=camera.width/2-5;
                m.width=m.height;
                //m.anchors.top=root.top;
                //m.anchors.topMargin=camera.width+5;
                m.anchors.bottomMargin=undefined;
                //m.anchors.Margin:35;
                handle.x=handle.centerX;
                handle.y=handle.centerY;
                handle.source="handle_normal.svg";
                handle.visible=true;
                mainContainer.opacity=1;
                launchContainer.opacity=0;
            }
        }

    }
    Connections{
        target: notify
        onUpdateCallCount:{
            root.callsCount=count;
        }
        onUpdateSMSCount:{
            root.smsCount=count;
        }
    }

    Connections{
         target: player;
         onPlayerStarted:{
             playerwidget.visible=true;
             if (!pl)
             {
                 coverDisplay=0;
                 wp.source=wallpaper;
                 playerblack.visible=false;
                 wp.fillMode=settings[5]==0?Image.Stretch:Image.PreserveAspectCrop;
             }
         }
         onPlayerClosed:{
             playerwidget.visible=false;
             wp.source=wallpaper;
             playerblack.visible=false;
             coverDisplay=0;
         }
         onUpdateAlbumArt:{
             console.log("update cover");
             if (show&&settings[3]==1) {
                 wp.source="image://album/"+Math.random(10);
                 playerblack.visible=settings[11]==0
                 //wp.fillMode=Image.PreserveAspectCrop;
                 wp.fillMode=settings[5]==0?Image.Stretch:Image.PreserveAspectCrop;
                 coverDisplay=1;
             }
             else {
                 wp.source=wallpaper;
                 playerblack.visible=false;
                 wp.fillMode=settings[5]==0?Image.Stretch:Image.PreserveAspectCrop;
                 coverDisplay=0;
             }
         }
         }

    function collision(a, b) {
        var c = Math.abs((a.x+a.width/2) - (b.x+b.width/2)),
            d =Math.abs((a.y+a.height/2) - (b.y+b.height/2)),
            e =Math.max(a.height,a.width)/2 + Math.max(b.height,b.width)/2;
        return Math.sqrt(c * c + d * d) <= e*(1-0.7)&&a.visible&&b.visible
    }

    Rectangle{
        anchors.fill: parent
        id: errcolor;
        color:"transparent"
        Text {
            id: errtxt
            visible: false
            text: strings[48]
            font.pixelSize: 20;
            width: parent.width
            wrapMode: Text.WordWrap;
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            color:"white"
        }
    }
    Image {
        id:wp;
        asynchronous: true;
        anchors.fill: parent
        clip:true
        sourceSize.height: root.height==640?root.height:0//640;
        sourceSize.width: root.height==640?0:root.width//360;
        Component.onCompleted: {
            fillMode=settings[5]==0?Image.Stretch:Image.PreserveAspectCrop;
            source=wallpaper;
            console.log("image ready");
        }
        onStatusChanged: {
        console.log("image status"+wp.status);
        if (wp.status==Image.Ready) console.log("image ready");
        if (wp.status==Image.Error||wp.status==Image.Null) {errtxt.visible=true; errcolor.color="black"; console.log("image error");}
        else {errtxt.visible=false; errcolor.color="transparent"; console.log("no err in image");}
        }
    }
    Rectangle{
        id:playerblack
        x: 0
        y: 0
        opacity: 0.7
        visible: false
        anchors.fill: parent;
        color:"black"
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
    }
    FontLoader { id: opFont; source: "DroidSans.ttf" }
    FontLoader { id: opFont1; source: "DroidSans1.ttf" }
    /*Image {
       anchors.left: parent.left
       anchors.leftMargin: 0
       anchors.top: wp.top;
       anchors.topMargin: 0
       id: datebg
       visible: settings[11]==1
       x: 0
       y: 0
       width: 640
       height: 640
       source: "datebg.png"
       opacity:0.8
    }*/
    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 360
        height: 640
        color: "#000000"
        opacity: 0.6
        visible: settings[11]==1
    }

    Image {
       anchors.left: parent.left
       anchors.leftMargin: 0
       anchors.bottom: parent.bottom
       anchors.bottomMargin: 0
       id:shadow
       source: "shadow.png"
       opacity:1.0
       width: 360
       height: 70
    }

    Arrow{
       anchors.horizontalCenter: parent.horizontalCenter
       anchors.top: parent.top
       anchors.topMargin: 590
       visible:settings[9]==0;
       id:arrow
       x: 151
       y: 590
       icon:"arrow";
       width: 60
       height: 60
       anchors.horizontalCenterOffset: 1
       onPress:{
           if (settings[9]==0){ showLauncher.start(); handle.visible=false;}
       }
       onLongPress:{
           if (settings[9]==0){ showLaunch1.start(); handle.visible=false;}
       }
    }
    Image {
       anchors.left: parent.left
       anchors.leftMargin: 10
       anchors.top: wp.top;
       anchors.topMargin: 26
       visible: settings[13]==1
       id: clockbg
       x: 10
       y: 26
       width: 340
       height: 190
       source: "clockbg.png"
       opacity:1.0
    }
    DigitalClock{
        id:clock
        fontSize:75
        showDate:true
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.top: sb.bottom;
        anchors.topMargin: 50;
    }
    Player{
        id:playerwidget
        anchors.right: parent.right
        anchors.rightMargin:10
        anchors.left: parent.left
        anchors.leftMargin:10
        anchors.top: clock.bottom;
        anchors.topMargin: 62;
    }
    Image {
        id: noteimage
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: wp.top;
        anchors.topMargin: 225;
        visible: settings [25]==1 && playerwidget.visible==false;
        source: "notebg.svg"
        width: 300
        height: 100
        opacity: 0.9
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 2
            id: notetxt;
            text: strings[227]
            color: "white"
            font.pixelSize: 18
        }
        Text {
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            y: 22
            id: notetxt1;
            text: settings [26]
            color: "white"
            font.pixelSize: 15
            wrapMode: notetxt1.WordWrap
        }
    }
    MouseArea{
        id:m
        visible:settings[22]==0
        anchors.left: root.left
        anchors.leftMargin: camera.width/2+5;
        anchors.right: root.right
        anchors.rightMargin: unlock.width/2+5;
        anchors.bottom: root.bottom;
        anchors.bottomMargin:35;
        //width:  250;
        height: width;
        ParallelAnimation{
            id: toCenter;
            NumberAnimation {target: handle; property: "x"; to: handle.centerX; duration: 200; easing.type: Easing.OutQuad }
            NumberAnimation {target: handle; property: "y"; to: handle.centerY; duration: 200;easing.type: Easing.OutQuad }
        }

        ParallelAnimation{
            id: showLaunch;
            NumberAnimation {target: mainContainer; property: "opacity"; to: 0; duration: 500; easing.type: Easing.OutQuad }
            NumberAnimation {target: playerwidget; property: "opacity"; to: 0; duration: 500; easing.type: Easing.OutQuad }
            NumberAnimation {target: arrow; property: "opacity"; to: 0; duration: 500; easing.type: Easing.OutQuad }
            NumberAnimation {target: launch1Container; property: "opacity"; to: 1; duration: 500;easing.type: Easing.OutQuad }
        }
        ParallelAnimation{
            id: hideLaunch;
            NumberAnimation {target: mainContainer; property: "opacity"; to: 1; duration: 500; easing.type: Easing.OutQuad }
            NumberAnimation {target: playerwidget; property: "opacity"; to: 1; duration: 500; easing.type: Easing.OutQuad }
            NumberAnimation {target: arrow; property: "opacity"; to: 1; duration: 500; easing.type: Easing.OutQuad }
            NumberAnimation {target: launch1Container; property: "opacity"; to: 0; duration: 500;easing.type: Easing.OutQuad }
        }

        ParallelAnimation{
            id: showLauncher;
            NumberAnimation {target: mainContainer; property: "opacity"; to: 0; duration: 300; easing.type: Easing.OutQuad }
            NumberAnimation {target: playerwidget; property: "opacity"; to: 0; duration: 300; easing.type: Easing.OutQuad }
            NumberAnimation {target: arrow; property: "opacity"; to: 0; duration: 300; easing.type: Easing.OutQuad }
            NumberAnimation {target: launcher; property: "opacity"; to: 1; duration: 300;easing.type: Easing.OutQuad }
        }
        ParallelAnimation{
            id: hideLauncher;
            NumberAnimation {target: mainContainer; property: "opacity"; to: 1; duration: 300; easing.type: Easing.OutQuad }
            NumberAnimation {target: playerwidget; property: "opacity"; to: 1; duration: 300; easing.type: Easing.OutQuad }
            NumberAnimation {target: arrow; property: "opacity"; to: 1; duration: 300; easing.type: Easing.OutQuad }
            NumberAnimation {target: launcher; property: "opacity"; to: 0; duration: 300;easing.type: Easing.OutQuad }
        }
        anchors.horizontalCenter: parent.horizontalCenter
        drag.target: handle
        drag.axis: Drag.XandYAxis;
        drag.onActiveChanged: {
            if (!drag.active) toCenter.start();

        }
        onPressedChanged: {
            if (pressed) {handle.source="handle_pressed.svg";timer.start();
                if (settings [24]==1) rumbleEffect.start();}
            else handle.source="handle_normal.svg";
            proxy.MovingChanged(pressed);
            m.drag.minimumX=-100500;
            m.drag.maximumX=100500;
            m.drag.minimumY=-100500;
            m.drag.maximumY=100500;
            if (!pressed){
                //if (collision(handle,camera)) application.Hide();
                if ((Math.pow(handle.x+handle.width/2-handle.centerX,2)+Math.pow(handle.y+handle.height/2-handle.centerY,2)>=Math.pow(round.width/2,2))) application.Hide();
            }
        }

        Image {
            id: round
            source: "round.png"
            anchors.fill: m;
            visible: launchContainer.visible?true:m.pressed;
        }
        /*
        AnimatedImage {
            id: animation;
            anchors.fill: m;
            source: "image/2.gif"
            visible: launchContainer.visible?true:m.pressed;
        }
        */
        UnlockAnim{
            id: unlockAnim
            anchors.fill: m;
            running: settings[18]==0?m.pressed: false
        }
        Image {
            visible: timer.running
            smooth: true
            source: "svg/15.png"
            id: throbberItem
            property int currentImage: 16
            property int imageCount: 16
            property bool small: false
            property alias running: timer.running

            Timer {
                id: timer;
                interval: 15;
                running: false
                repeat: true
                onTriggered: {

                    var nextImage = (throbberItem.currentImage + 1) % (throbberItem.imageCount+1)
                    if (nextImage<0) {timer.stop();}
                    if (nextImage>=throbberItem.imageCount) {timer.stop();}
                    throbberItem.source = "svg/"+nextImage+".png"
                    throbberItem.currentImage = nextImage
                }
            }

        }

        Image {
             id: round1
             source: "big_circle.svg"
             anchors.fill: m;
             visible: launchContainer.visible?true:m.pressed;
        }
        Item{
            visible: opacity!=0;
            opacity: 1;
            id: mainContainer;
            x: 0
            y: 0
            width: 265
            height: 265
            anchors.leftMargin: 0
            anchors.fill: m


            Image {
                id: unlock
                x: 260
                y: 90
                source: "unlock_normal.png"
                width: handle.width
                height: handle.height
                opacity: 0
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 38
                visible:m.pressed
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.right
            }

            Image {
                id: launch
                source: "unlock_normal.png"
                opacity: 0
                width: handle.width
                height: handle.height
                visible:m.pressed
                anchors.verticalCenter: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }


            Image {
                id: camera
                x: -80
                y: 90
                source: "camera_normal.png"
                width: handle.width
                height: handle.height
                opacity: 0
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: -37
                visible:m.pressed
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.left

            }



            Image{
                id: handle
                source:"handle_normal.svg"
                width:85
                height:85;
                property int centerX: parent.width/2-width/2;
                property int centerY: parent.height/2-height/2;
                x: 91
                y: 90
                onXChanged: handleMove(x,y);
                onYChanged: handleMove(x,y);
                function handleMove(x,y){
                    if ((Math.pow(handle.x+handle.width/2-handle.centerX,2)+Math.pow(handle.y+handle.height/2-handle.centerY,2)>=Math.pow(round.width/2,2)))
                    {
                        handle.source="unlock_activated.svg";
                        if (settings [24]==1) rumbleEffect1.start();
                        if (settings[20]==1) playMusic.play();
                    }
                    if (collision(handle,camera))
                        camera.source="camera_activated.png";
                    else camera.source="camera_normal.png";
                    if (collision(handle,sms))
                        sms.source="sms_activated.png";
                    else sms.source="sms_normal.png";
                    if (collision(handle,calls))
                        calls.source="call_activated.png";
                    else calls.source="call_normal.png";
                    if (collision(handle,launch))
                        launch.source="launch_activated.png";
                    else launch.source="launch_normal.png";
                    if (collision(handle,launch1))
                        launch1.source="launch_activated.png";
                    else launch1.source="launch_normal.png";

                }
                Component.onCompleted: {

                }
            }
        }

        LaunchArea{
            id:launchContainer;
            anchors.fill: m;
            visible: opacity!=0;
            opacity: 0;
            //handleSize: handle.width
            onHideLaunch: {
                handle.source="handle_normal.svg";
                handle.visible=true;
                handle.x=handle.centerX;
                handle.y=handle.centerY;
                hideLaunch.start();
            }
        }

        LaunchArea1{
            id:launch1Container;
            anchors.fill: m;
            visible: opacity!=0;
            opacity: 0;
            //handleSize: handle.width
            onHideLaunch: {
                handle.source="handle_normal.svg";
                handle.visible=true;
                handle.x=handle.centerX;
                handle.y=handle.centerY;
                hideLaunch1.start();
            }
        }

    }

    Button1{

        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 590
        visible:true;
        id:next
        x: 295
        y: 590
        icon:"camera";
        width: 60
        height: 60
        onPress:{ playMusic.play(); if (settings [24]==1) rumbleEffect.start(); application.Hide(); application.Launch(settings[4]);}
        onLongPress:{application.Hide(); application.Launch(settings[20]);}
    }
    Item {
        anchors.fill: parent
        id:launcher
        property int handleSize: 65
        signal hideLaunch;
        property int margin:0;
        opacity: 0
        MouseArea{
            x: 0
            y: 0
            width: 360
            height: 640
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent;
            onClicked: {hideLauncher.start(); handle.visible=true;}
        }
        Image {
                     anchors.horizontalCenter: parent.horizontalCenter
                     anchors.top: wp.top;
                     anchors.topMargin: -90;
                    id: bg
                    x: 12
                    y: 201
                    width: 336
                    height: 402
                    source: "graphics/launch.png"
                    smooth: true
                    anchors.horizontalCenterOffset: 0
                     opacity:1.0
        }
        Image {
            id: app1
            x: 27
            y: 215
            source: "image://icons/"+apps[1]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[1]);}
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
            x: 106
            y: 215
            source: "image://icons/"+apps[2]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[2]);}
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
            x: 184
            y: 215
            source: "image://icons/"+apps[3]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[3]);}
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
            x: 267
            y: 215
            source: "image://icons/"+apps[4]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[4]);}
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
            x: 27
            y: 293
            source: "image://icons/"+apps[5]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[5]);}
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
            x: 106
            y: 293
            source: "image://icons/"+apps[6]
            width: 65
            height: 65
            visible:true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[6]);}
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
            x: 184
            y: 293
            source: "image://icons/"+apps[7]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[7]);hideLaunch();}
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
            x: 267
            y: 293
            source: "image://icons/"+apps[8]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[8]);hideLaunch();}
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
            x: 27
            y: 370
            source: "image://icons/"+apps[9]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[9]);hideLaunch();}
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
            x: 106
            y: 370
            source: "image://icons/"+apps[10]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[10]);hideLaunch();}
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
            x: 184
            y: 370
            source: "image://icons/"+apps[11]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[11]);hideLaunch();}
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
            x: 267
            y: 370
            source: "image://icons/"+apps[12]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[12]);hideLaunch();}
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
            x: 27
            y: 447
            source: "image://icons/"+apps[13]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[13]);hideLaunch();}
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
            x: 106
            y: 447
            source: "image://icons/"+apps[14]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[14]);hideLaunch();}
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
            x: 184
            y: 447
            source: "image://icons/"+apps[15]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[15]);hideLaunch();}
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
            x: 267
            y: 447
            source: "image://icons/"+apps[16]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[16]);hideLaunch();}
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
            x: 27
            y: 525
            source: "image://icons/"+apps[17]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[17]);hideLaunch();}
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
            x: 106
            y: 525
            source: "image://icons/"+apps[18]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[18]);hideLaunch();}
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
            x: 184
            y: 525
            source: "image://icons/"+apps[19]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[19]);hideLaunch();}
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
            x: 267
            y: 525
            source: "image://icons/"+apps[0]
            width: 65
            height: 65
            visible: true
            MouseArea{
                anchors.fill: parent;
                anchors.topMargin: m.margin;
                anchors.bottomMargin: m.margin;
                anchors.leftMargin: m.margin;
                anchors.rightMargin: m.margin;
                onClicked: {rumbleEffect.start();application.Hide();application.Launch(apps[0]);hideLaunch();}
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
    Text {
                id : dateText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 173
                text: clock.date
                horizontalAlignment: Text.AlignRight
                color: "white"
                //font.pixelSize: 14
                font { family: settings[6]==0?dateFont.name:proxy.GetFont(); bold: false; pixelSize: 21; italic: false;}
                visible : true
                Component.onCompleted: {timeChanged();}
    }

    LaunchArea2 {
        id: launchpanel
        y:0

        anchors.right: parent.right
        anchors.rightMargin: 270
    }
    Rectangle{
        id: downfill
        x: 1
        y: 0
        width: 358
        height: 640
        color: "transparent"
        anchors.rightMargin: 1
        anchors.bottomMargin: 0
        anchors.leftMargin: 1
        anchors.topMargin: 0
        anchors.fill: parent;
        visible: rect.y>=-580
        MouseArea  {
            anchors.fill: parent
            onClicked:  {
            }

        }
    }

    Rectangle {
       id: container
       x: 1
       y: -30
       width: 360; height: 248
       color: "transparent"


       Rectangle {
           id: rect
           x: 0
           y: -628
           width: 360; height: 657
           color: "transparent"
           opacity: (600.0 - rect.y) / 600

           ParallelAnimation{
               id: todown;
               NumberAnimation {target: rect; property: "y"; to: container.width - rect.width; duration: 400;easing.type: Easing.OutQuad }
           }
           ParallelAnimation{
               id: toup;
               NumberAnimation {target: rect; property: "y"; to: -628; duration: 400;easing.type: Easing.OutQuad }
           }
           MouseArea {
               x: 0
               y: 580
               width: 360
               height: 98
               anchors.rightMargin: 0
               anchors.bottomMargin: -37
               anchors.leftMargin: 0
               anchors.topMargin: 580
               anchors.fill: parent
               drag.target: rect
               drag.axis: Drag.YAxis
               drag.minimumX: 0
               drag.maximumY: container.width - rect.width


               onPressedChanged: {
                   proxy.MovingChanged(pressed);

               }

               onReleased: {
                   if (rect.y<=-291) {toup.start();  rumbleEffect.start();}
                   else {todown.start(); rumbleEffect.start();}
               }
           }
           BorderImage {
               id: notimage
               x: -6
               y: 5
               width: 366
               height: 662
               source: "notify/notifpanel.png"
               opacity:  1000 / (900.0 - rect.y)

               Button2 {
                   id: set1
                   x: 286
                   y: 45
                   width: 80
                   height: 74
                   icon: "settings"
                   onPress:{unlock_music.play(); rumbleEffect.start();application.Hide(); application.Launch("0x100058ec");}
               }
           }

           Image {
               id: img1
               x: 130
               y: 117
               width: 225
               height: 9
               source: "graphics/9.png"
           }
           Notifer {
               x: 1
               y: 144
               width: 359
               height: 67
               anchors.bottom: wp.bottom
               anchors.rightMargin: 0
               anchors.bottomMargin: 252
               z: 1
               anchors.leftMargin: 1

           }
           Text {
               id: text
               x: 29
               y: 114
               font.pixelSize: 15;
               width: 71
               height: 9
               color: "#bebebe"
               text: strings[111]
               styleColor: "#000000"
           }
           Image {
               id: img
               x: 137
               y: 609
               source: "graphics/gd_menu_more_overflow.png"
           }
           DigitalClock1{
               id:clock1
               x: -230
               y: 55
               fontSize:45
               showDate:true
           }

           Text {
                  id : charging
          anchors.horizontalCenter: parent.horizontalCenter
                  y: 600
                  text: ""
                  horizontalAlignment: Text.AlignRight
                  color: "white"
                  //font.pixelSize: 10
                  font {family: settings[6]==0?dateFont.name:proxy.GetFont(); bold: false; pixelSize: 15; italic: false;}
                  visible : false
       }
       }
    }

  Image {
      id: shadow1
      x: -12
      y: 0
      width: 386
      height: 34
      rotation: -180
      source: "shadow.png"
      anchors.bottom: parent.bottom
      anchors.bottomMargin: 606
      anchors.leftMargin: -12
      opacity: 1
      anchors.left: parent.left
  }

  Image {
      id: statusbg
      source:"sb.png"
      visible:settings[15]==0;
      x: 0
      y: 0
  }


  StatusBar{
        id: sb;
        anchors.left: root.left
        anchors.right: root.right
        anchors.top: root.top
        visible:settings[16]==0;
        onChangeOperator: operator.text=opsos;
        onChangeCharging: {clock.changeCharging(charge,percent);}

        Image {
            id: calls
            x: 124
            y: -16
            width: 60
            height: 60
            source: "call_normal.png"
            visible:root.callsCount!=0;
        }
        Image {
            id: sms
            x: 164
            y: -16
            width: 60
            height: 60
            source: "sms_normal.png"
            visible: root.smsCount!=0
        }
        Text {
            id: operator
            anchors.left: parent.left
            anchors.leftMargin:3
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
            text: ""
            color: "#3791b3"
            font { family: settings[6]==0?opFont.name:proxy.GetFont(); bold: false; pixelSize: 17; italic: false;}

    }
    }
    StatusBar1{
              id: sb1;
              anchors.left: root.left
              anchors.right: root.right
              anchors.top: root.top
              visible:settings[16]==1;
              onChangeOperator: operator1.text=opsos;
              onChangeCharging: {clock.changeCharging(charge,percent);}

              Image {
                  id: calls1
                  x: 124
                  y: -16
                  width: 60
                  height: 60
                  source: "call_normal.png"
                  visible:root.callsCount!=0;
              }
              Image {
                  id: sms1
                  x: 164
                  y: -16
                  width: 60
                  height: 60
                  source: "sms_normal.png"
                  visible: root.smsCount!=0
              }
              Text {
                  id: operator1
                  anchors.left: parent.left
                  anchors.leftMargin:3
                  anchors.bottom: parent.bottom
                  anchors.bottomMargin: 2
                  text: ""
                  color: "white"
                  font { family: settings[6]==0?opFont.name:proxy.GetFont(); bold: false; pixelSize: 17; italic: false;}

    }
    }
    Rectangle {
            id: slideunock
            color: "transparent"
            visible: settings[22]==1
            anchors.horizontalCenter: parent.horizontalCenter
            y: 540
            width: 300; height: 50
            ParallelAnimation{
                id: left;
                NumberAnimation {target: slider; property: "x"; to: 0; duration: 600; easing.type: Easing.OutQuad }
            }
            MouseArea {
                id: unlock1
                x: 251
                y: 0
                width: 49
                height: 50
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                y: 6
                id: unlocktext;
                text: settings[23]
                color: "white"
                SequentialAnimation on color {
                    loops: Animation.Infinite
                    PropertyAnimation { to: "white"; duration: 1000; }
                    PropertyAnimation { to: "grey"; duration: 1000; }
                }
                opacity: (400.0 - slider.x) / 1000
                font.pixelSize: 25

                /*color: "grey"
                style: Text.Outline; styleColor: "white"*/
            }
            Image{
                id: slider
                x: 0
                y: 0
                width: 28
                height: 50
                source:"IOS7/slider.png"

                MouseArea {
                    x: -17
                    y: -15
                    width: 54
                    height: 80
                    anchors.leftMargin: -17
                    anchors.topMargin: -15
                    anchors.rightMargin: -9
                    anchors.bottomMargin: -15
                    anchors.fill: parent
                    drag.target: slider
                    drag.axis: Drag.XAxis
                    drag.minimumX: 0
                    drag.maximumX: slideunock.width - slider.width
                    drag.onActiveChanged: {
                        if (!drag.active) left.start();}
                    onPressedChanged: {
                        if (pressed)  {slider.source="IOS7/sliderp.png"; if (settings [24]==1) rumbleEffect.start();}
                        else slider.source="IOS7/slider.png";
                        proxy.MovingChanged(pressed);
                        if (!pressed){
                            if (collision(slider,unlock1)){playMusic.play(); if (settings [24]==1) rumbleEffect1.start(); application.Hide();}
                        }
                    }
                }
            }


        }
}
