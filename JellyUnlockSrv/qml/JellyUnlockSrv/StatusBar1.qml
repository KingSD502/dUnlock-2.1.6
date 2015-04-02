import QtQuick 1.0
Rectangle {
    id:root;
    property bool clickedOpensStatusPanel: symbian.s60Version == Symbian.SV_S60_5_2 ? true : true
    color:"transparent"
    height: 26;
    signal changeOperator(string opsos);
    signal changeCharging(int charge, int percent);
    property int rightSide:clockex.paintedWidth
    Text {
        visible:false;
        id: clockex
        text: cl.hours
        font.pixelSize: 18;
    }
     Connections{
     target: application;
    onUpdateStatusBar:{
        var bat=(Math.floor(battery/1));
        switch (bat){
            case 0: imgbattery.source="status-icons1/battery/stat_sys_battery_0.png";break;
            case 1: imgbattery.source="status-icons1/battery/stat_sys_battery_1.png";break;
            case 2: imgbattery.source="status-icons1/battery/stat_sys_battery_2.png";break;
            case 3: imgbattery.source="status-icons1/battery/stat_sys_battery_3.png";break;
            case 4: imgbattery.source="status-icons1/battery/stat_sys_battery_4.png";break;
            case 5: imgbattery.source="status-icons1/battery/stat_sys_battery_5.png";break;
            case 6: imgbattery.source="status-icons1/battery/stat_sys_battery_6.png";break;
            case 7: imgbattery.source="status-icons1/battery/stat_sys_battery_7.png";break;
            case 8: imgbattery.source="status-icons1/battery/stat_sys_battery_8.png";break;
            case 9: imgbattery.source="status-icons1/battery/stat_sys_battery_9.png";break;
            case 10: imgbattery.source="status-icons1/battery/stat_sys_battery_10.png";break;
            case 11: imgbattery.source="status-icons1/battery/stat_sys_battery_11.png";break;
            case 12: imgbattery.source="status-icons1/battery/stat_sys_battery_12.png";break;
            case 13: imgbattery.source="status-icons1/battery/stat_sys_battery_13.png";break;
            case 14: imgbattery.source="status-icons1/battery/stat_sys_battery_14.png";break;
            case 15: imgbattery.source="status-icons1/battery/stat_sys_battery_15.png";break;
            case 16: imgbattery.source="status-icons1/battery/stat_sys_battery_16.png";break;
            case 17: imgbattery.source="status-icons1/battery/stat_sys_battery_17.png";break;
            case 18: imgbattery.source="status-icons1/battery/stat_sys_battery_18.png";break;
            case 19: imgbattery.source="status-icons1/battery/stat_sys_battery_19.png";break;
            case 20: imgbattery.source="status-icons1/battery/stat_sys_battery_20.png";break;
            case 21: imgbattery.source="status-icons1/battery/stat_sys_battery_21.png";break;
            case 22: imgbattery.source="status-icons1/battery/stat_sys_battery_22.png";break;
            case 23: imgbattery.source="status-icons1/battery/stat_sys_battery_23.png";break;
            case 24: imgbattery.source="status-icons1/battery/stat_sys_battery_24.png";break;
            case 25: imgbattery.source="status-icons1/battery/stat_sys_battery_25.png";break;
            case 26: imgbattery.source="status-icons1/battery/stat_sys_battery_26.png";break;
            case 27: imgbattery.source="status-icons1/battery/stat_sys_battery_27.png";break;
            case 28: imgbattery.source="status-icons1/battery/stat_sys_battery_28.png";break;
            case 29: imgbattery.source="status-icons1/battery/stat_sys_battery_29.png";break;
            case 30: imgbattery.source="status-icons1/battery/stat_sys_battery_30.png";break;
            case 31: imgbattery.source="status-icons1/battery/stat_sys_battery_31.png";break;
            case 32: imgbattery.source="status-icons1/battery/stat_sys_battery_32.png";break;
            case 33: imgbattery.source="status-icons1/battery/stat_sys_battery_33.png";break;
            case 34: imgbattery.source="status-icons1/battery/stat_sys_battery_34.png";break;
            case 35: imgbattery.source="status-icons1/battery/stat_sys_battery_35.png";break;
            case 36: imgbattery.source="status-icons1/battery/stat_sys_battery_36.png";break;
            case 37: imgbattery.source="status-icons1/battery/stat_sys_battery_37.png";break;
            case 38: imgbattery.source="status-icons1/battery/stat_sys_battery_38.png";break;
            case 39: imgbattery.source="status-icons1/battery/stat_sys_battery_39.png";break;
            case 40: imgbattery.source="status-icons1/battery/stat_sys_battery_40.png";break;
            case 41: imgbattery.source="status-icons1/battery/stat_sys_battery_41.png";break;
            case 42: imgbattery.source="status-icons1/battery/stat_sys_battery_42.png";break;
            case 43: imgbattery.source="status-icons1/battery/stat_sys_battery_43.png";break;
            case 44: imgbattery.source="status-icons1/battery/stat_sys_battery_44.png";break;
            case 45: imgbattery.source="status-icons1/battery/stat_sys_battery_45.png";break;
            case 46: imgbattery.source="status-icons1/battery/stat_sys_battery_46.png";break;
            case 47: imgbattery.source="status-icons1/battery/stat_sys_battery_47.png";break;
            case 48: imgbattery.source="status-icons1/battery/stat_sys_battery_48.png";break;
            case 49: imgbattery.source="status-icons1/battery/stat_sys_battery_49.png";break;
            case 50: imgbattery.source="status-icons1/battery/stat_sys_battery_50.png";break;
            case 51: imgbattery.source="status-icons1/battery/stat_sys_battery_51.png";break;
            case 52: imgbattery.source="status-icons1/battery/stat_sys_battery_52.png";break;
            case 53: imgbattery.source="status-icons1/battery/stat_sys_battery_53.png";break;
            case 54: imgbattery.source="status-icons1/battery/stat_sys_battery_54.png";break;
            case 55: imgbattery.source="status-icons1/battery/stat_sys_battery_55.png";break;
            case 56: imgbattery.source="status-icons1/battery/stat_sys_battery_56.png";break;
            case 57: imgbattery.source="status-icons1/battery/stat_sys_battery_57.png";break;
            case 58: imgbattery.source="status-icons1/battery/stat_sys_battery_58.png";break;
            case 59: imgbattery.source="status-icons1/battery/stat_sys_battery_59.png";break;
            case 60: imgbattery.source="status-icons1/battery/stat_sys_battery_60.png";break;
            case 61: imgbattery.source="status-icons1/battery/stat_sys_battery_61.png";break;
            case 62: imgbattery.source="status-icons1/battery/stat_sys_battery_62.png";break;
            case 63: imgbattery.source="status-icons1/battery/stat_sys_battery_63.png";break;
            case 64: imgbattery.source="status-icons1/battery/stat_sys_battery_64.png";break;
            case 65: imgbattery.source="status-icons1/battery/stat_sys_battery_65.png";break;
            case 66: imgbattery.source="status-icons1/battery/stat_sys_battery_66.png";break;
            case 67: imgbattery.source="status-icons1/battery/stat_sys_battery_67.png";break;
            case 68: imgbattery.source="status-icons1/battery/stat_sys_battery_68.png";break;
            case 69: imgbattery.source="status-icons1/battery/stat_sys_battery_69.png";break;
            case 70: imgbattery.source="status-icons1/battery/stat_sys_battery_70.png";break;
            case 71: imgbattery.source="status-icons1/battery/stat_sys_battery_71.png";break;
            case 72: imgbattery.source="status-icons1/battery/stat_sys_battery_72.png";break;
            case 73: imgbattery.source="status-icons1/battery/stat_sys_battery_73.png";break;
            case 74: imgbattery.source="status-icons1/battery/stat_sys_battery_74.png";break;
            case 75: imgbattery.source="status-icons1/battery/stat_sys_battery_75.png";break;
            case 76: imgbattery.source="status-icons1/battery/stat_sys_battery_76.png";break;
            case 77: imgbattery.source="status-icons1/battery/stat_sys_battery_77.png";break;
            case 78: imgbattery.source="status-icons1/battery/stat_sys_battery_78.png";break;
            case 79: imgbattery.source="status-icons1/battery/stat_sys_battery_79.png";break;
            case 80: imgbattery.source="status-icons1/battery/stat_sys_battery_80.png";break;
            case 81: imgbattery.source="status-icons1/battery/stat_sys_battery_81.png";break;
            case 82: imgbattery.source="status-icons1/battery/stat_sys_battery_82.png";break;
            case 83: imgbattery.source="status-icons1/battery/stat_sys_battery_83.png";break;
            case 84: imgbattery.source="status-icons1/battery/stat_sys_battery_84.png";break;
            case 85: imgbattery.source="status-icons1/battery/stat_sys_battery_85.png";break;
            case 86: imgbattery.source="status-icons1/battery/stat_sys_battery_86.png";break;
            case 87: imgbattery.source="status-icons1/battery/stat_sys_battery_87.png";break;
            case 88: imgbattery.source="status-icons1/battery/stat_sys_battery_88.png";break;
            case 89: imgbattery.source="status-icons1/battery/stat_sys_battery_89.png";break;
            case 90: imgbattery.source="status-icons1/battery/stat_sys_battery_90.png";break;
            case 91: imgbattery.source="status-icons1/battery/stat_sys_battery_91.png";break;
            case 92: imgbattery.source="status-icons1/battery/stat_sys_battery_92.png";break;
            case 93: imgbattery.source="status-icons1/battery/stat_sys_battery_93.png";break;
            case 94: imgbattery.source="status-icons1/battery/stat_sys_battery_94.png";break;
            case 95: imgbattery.source="status-icons1/battery/stat_sys_battery_95.png";break;
            case 96: imgbattery.source="status-icons1/battery/stat_sys_battery_96.png";break;
            case 97: imgbattery.source="status-icons1/battery/stat_sys_battery_97.png";break;
            case 98: imgbattery.source="status-icons1/battery/stat_sys_battery_98.png";break;
            case 99: imgbattery.source="status-icons1/battery/stat_sys_battery_99.png";break;
            case 100: imgbattery.source="status-icons1/battery/stat_sys_battery_100.png";break;
        }
        changeCharging(charging,battery);
        if (charging){imgbattery.source="status-icons1/battery/stat_sys_battery_charge_animfull.png";}
        var sig=Math.floor(network_signal/15);
        switch (sig){
            case 0:imgsignal.source="status-icons1/icon-s-status-no-gsm-connection.png";break;
            case 1:imgsignal.source="status-icons1/icon-s-status-network2.png";break;
            case 2:imgsignal.source="status-icons1/icon-s-status-network2.png";break;
            case 3:imgsignal.source="status-icons1/icon-s-status-network3.png";break;
            case 4:imgsignal.source="status-icons1/icon-s-status-network3.png";break;
            case 5:imgsignal.source="status-icons1/icon-s-status-network4.png";break;
            case 6:imgsignal.source="status-icons1/icon-s-status-network5.png";break;
        }
        switch (mode){
            case 0: imggsm.source="status-icons1/icon-s-status-gsm-active.png";break;
            case 1: imggsm.source="status-icons1/icon-s-status-3g-active.png";break;
        }
        if (mode==2) imgwlan.source="status-icons1/icon-s-status-wlan.png";
        else imgwlan.source="";
        switch (profile){
            case 1: imgprofile.source="status-icons1/icon-s-status-silent.png";break;
            case 5: imgprofile.source="status-icons1/icon-s-status-offline.png";break;
            default: imgprofile.source="";break;
        }
        if (bt){imgbt.source="status-icons1/icon-s-status-bluetooth.png";}
        else {imgbt.source="";}
        changeOperator(opsos);
    }
    }
    Row{
        spacing:3
        anchors.rightMargin: 0;
        anchors.right: root.right

        Image{
            id:imgbt
            source:""
        }
        Image{
            id:imgprofile
            y: 5
            source:""
        }
        Image {
            id: imgwlan
            y: 4
            source: ""
        }
        Image{
            id:imgsignal;
            y: 4
            source: ""
            Image {
                id: imggsm
                source: ""
                anchors.fill: imgsignal
            }
        }
        Image{
            id:imgbattery;
            source: "";
        }
        SmallClock{
            id: cl;
            showDate: false
            showSeconds: false
            fontSize: 18;
            width: clockex.paintedWidth;
            textColor: "white"
        }
    }
}
