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
        Row {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: dp(60)
            anchors.leftMargin: dp(110)
            spacing: dp(20)
            Icon {
                id: icontime
                name: "awesome/hourglass_half"
                color: "#2196f3"
                size: dp(32)
            }
            Label {
                text: "05:00"
                style: "headline"
            }
            Label {
                width: dp(150)
                height: dp(32)
            }
            Label {
                text: "被动训练"
                style: "headline"
            }
        }
        View {
            width: parent.width * 0.8
            height: dp(780)
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: dp(160)
            anchors.leftMargin: dp(96)
            Image {
                id: name
                source: "images/passbk.png"
            }
            Image {
                id: hand
                width: dp(64)
                height: dp(64)
                source: "images/hand.png"
                x: 210
                y: 350
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
