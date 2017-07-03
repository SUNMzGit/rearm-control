import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import Material 0.3

Item {
    width: dp(1920)
    Rectangle {
        id: trackRect
        width: dp(1150)
        height: dp(850)
        anchors.top: parent.top
        anchors.topMargin: dp(80)
        anchors.left: parent.left
        anchors.leftMargin: dp(110)

        View {
            width: parent.width * 0.8
            height: dp(780)
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: dp(80)
            anchors.leftMargin: dp(96)
            Image {
                id: name
                source: "images/passbk.png"
            }
            Label {  //训练倒计时
                anchors.centerIn: parent
                text: "5:00"
                font.pixelSize: dp(72)
                color: "white"
            }
        }
    }
    Rectangle {
        width: dp(1)
        height: trackRect.height
        anchors.left: trackRect.right
        anchors.leftMargin: dp(50)
        anchors.top: trackRect.top
        color: "gray"
    }
    Rectangle {
        width: dp(400)
        height: trackRect.height
        anchors.left: trackRect.right
        anchors.leftMargin: dp(100)
        anchors.top: trackRect.top
        TimePicker {
            x: dp(50)
            y: dp(39)
        }
       Column {
           anchors.horizontalCenter: parent.horizontalCenter
           anchors.top: parent.top
           anchors.topMargin: dp(486)
           spacing: dp(20)

           Label {
               text: "轨迹线型"
               style: "title"
           }

           Image {
               id: trackPic
               source: "images/assess.png"
           }
           Label {
               width: dp(100)
               height: dp(30)
           }
           Label {
               text: "训练时长"
               style: "title"
           }

           Slider {
               Layout.alignment: Qt.AlignCenter
               value: 10
               focus: true
               tickmarksEnabled: true
               numericValueLabel: true
               stepSize: 5
               minimumValue: 5
               maximumValue: 15
               activeFocusOnPress: true
               color: "#235063"
           }

       }

    }
}
