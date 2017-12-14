import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.2
import Material 0.2

Popup {
     id: popup
     x: 500
     y: -30
     width: 500
     height: 500
     modal: true
     focus: true
     closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
     ColumnLayout {
         anchors.horizontalCenter: parent.horizontalCenter
         spacing: 10

         Label {
             text: "被动训练"
             style: "title"

         }
         Label {
             text: "被动训练进行中，如有不适请告知治疗师！"
             font.pixelSize: 22
         }
         Circle{
             //anchors.fill: parent
             x: 500
             y: -30
         }
     }

     Component.onCompleted: {
         circleAnim.start();
     }
}


