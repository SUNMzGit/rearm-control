import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import Material 0.3

Item {
    width: dp(1920)
    RowLayout {
        anchors.centerIn: parent
        spacing: 20
        TimePicker {
        }
        Rectangle {
            width: dp(300)
            height: dp(390)
            Rectangle{
                width: parent.width
                height: dp(90)
                color: "#006699"
                Label{
                    text: "画圆"
                    font.pixelSize: 38
                    anchors.centerIn: parent
                    color: "white"
                }
            }
            Image {
                id: name
                source: "images/hand.png"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: dp(300)
            height: dp(390)
            Rectangle{
                width: parent.width
                height: dp(90)
                color: "#006699"
                Label{
                    text: "水平运动"
                    font.pixelSize: 38
                    anchors.centerIn: parent
                    color: "white"
                }

            }
            Image {
                source: "images/hand.png"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: dp(300)
            height: dp(390)
            Rectangle{
                width: parent.width
                height: dp(90)
                color: "#006699"
                Label{
                    text: "喝水"
                    font.pixelSize: 38
                    anchors.centerIn: parent
                    color: "white"
                }

            }
            Image {
                source: "images/hand.png"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            width: dp(300)
            height: dp(390)
            Rectangle{
                width: parent.width
                height: dp(90)
                color: "#006699"
                Label{
                    text: "矢状面运动"
                    font.pixelSize: 38
                    anchors.centerIn: parent
                    color: "white"
                }
            }
            Image {
                source: "images/hand.png"
                anchors.centerIn: parent
            }
        }
    }
}
