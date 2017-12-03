import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import Material 0.3

Item {
    width: dp(1920)
    signal pageSwitched( var name );
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
                    text: "水平运动"
                    font.pixelSize: 38
                    anchors.centerIn: parent
                    color: "white"
                }
            }
            Image {
                id: name
                source: "images/x.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    serialHandler.sendto(10);
                }
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
                    text: "垂直运动"
                    font.pixelSize: 38
                    anchors.centerIn: parent
                    color: "white"
                }
            }
            Image {
                source: "images/y.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    serialHandler.sendto(11);
                }
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
                    text: "画圆"
                    font.pixelSize: 38
                    anchors.centerIn: parent
                    color: "white"
                }

            }
            Image {
                source: "images/circle.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    serialHandler.sendto(12);
                }
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
                source: "images/water.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    serialHandler.sendto(13);
                }
            }
        }
    }
    Button {
        id: gameBtn
        text: "游戏训练"
        elevation: 1
        width: dp(200)
        backgroundColor:  "#235063"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            pageSwitched("RehabPage");
        }
    } //Button
}
