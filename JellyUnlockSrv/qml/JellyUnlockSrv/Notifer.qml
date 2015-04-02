import QtQuick 1.0

Rectangle {
    id:root
    anchors.left: parent.left
    anchors.right: parent.right
    height: c.height
    color:"transparent"
    Connections{
        target: notify
        onAddNotifier:{
        if (settings[10]==0) // вот оно
        {
            var txt=text;
            var auth=from; // это видимо настройка скрытия смс
            if (type==2&&settings[12]==1) txt=strings[217];
            model.insert(0,{"notifTime": time, "notifText":txt,"from":auth,"icon":icon});
            console.log("from text:"+auth);
            if (r.count>4) model.remove(4);
        }
        }
        onUpdateNotifier:{
            model.remove(index);
            console.log("onupdatenotifier "+from);
            var txt=text;
            var auth=from;
            if (type==2&&settings[12]==1) txt=strings[217];
            model.insert(0,{"notifTime": time, "notifText":txt,"from":auth,"icon":icon});
        }

        onRemoveNotifier:{
            model.remove(index);
        }
    }

    ListModel{
        id: model;
    }
    Column{
        spacing: 5;
        id:c
        anchors.left: parent.left;
        anchors.right: parent.right
        anchors.top: parent.top
        Repeater{
            id:r;
            model: model;
            delegate: Component{
                NotiferDelegate{
                    id:del
                }
            }
        }
    }
}
