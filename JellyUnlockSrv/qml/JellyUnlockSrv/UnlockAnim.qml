// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

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
