import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
//import QtQuick 1.1


  Rectangle {
     id: container
     x: 0
     y: -170
     width: 360; height: 200
     color: "transparent"

     Rectangle {
         id: rect
         x: 0
         y: -446
         width: 360; height: 641
         color: "transparent"
         opacity: (600.0 - rect.y) / 600

         MouseArea {
             x: 0
             y: 603
             width: 360
             height: 55
             anchors.rightMargin: 0
             anchors.bottomMargin: -17
             anchors.leftMargin: 0
             anchors.topMargin: 603
             anchors.fill: parent
             drag.target: rect
             drag.axis: Drag.YAxis
             drag.minimumX: 0
             drag.maximumX: container.width - rect.width
         }

         BorderImage {
             id: notimage
             x: 0
             y: 0
             width: 360
             height: 641
             source: "notify/notifpanel.png"
             opacity:  600 / (600.0 - rect.y)
         }
     }
   }

