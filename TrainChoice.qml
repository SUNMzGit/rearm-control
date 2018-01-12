import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.2
import Material 0.3

Item {
    width: dp(1920)

    signal pageSwitched( var name );

    Column {
        id: column
        //anchors.fill: parent
        height: dp(1000)
        width: parent.width
        View {
            id: headline
            width: parent.width
            height: dp(100)
            backgroundColor: "#dddddd"
            ActionButton {
                iconName: "action/action/toll"
                backgroundColor: headline.backgroundColor
                isMiniSize: true
                anchors {
                    left: parent.left
                    leftMargin: dp(32)
                    verticalCenter: parent.verticalCenter
                }
                action: Action {
                    id: back
                    onTriggered: pageSwitched("ChoicePage");
                }
            }
            Label {
                text: "康复训练"
                style: "headline"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: dp(96)
            }
        } //View

        Rectangle {
            width: parent.width
            anchors.verticalCenter: parent.verticalCenter
            height: dp(360)
            color: "#5ba0c0"

            Row {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: dp(100)
                Rectangle {
                    width: dp(312)
                    height: dp(186)
                    color: "#2b7da3"
                   Row  {
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.horizontalCenter: parent.horizontalCenter
                       Label {
                           text: "被动训练"
                           style: "display1"
                           color: "white"
                           anchors.verticalCenter: parent.verticalCenter
                       }
                       Image {
                           id: userImage
                           source: "images/train.png"
                       }
                   }
                   MouseArea {
                       anchors.fill: parent
                       onClicked: { pageSwitched("PassTrain");serialHandler.openPort();}
                   }
                }
                Rectangle {
                   width: dp(312)
                   height: dp(186)
                   color: "#2b7da3"
                   Row  {
                       anchors.verticalCenter: parent.verticalCenter
                       anchors.horizontalCenter: parent.horizontalCenter
                       Label {
                           text: "主动训练"
                           style: "display1"
                           color: "white"
                           anchors.verticalCenter: parent.verticalCenter
                       }
                       Image {
                           id: assessImage
                           source: "images/train.png"
                       }
                   }
                   MouseArea {
                       anchors.fill: parent
                       onClicked: { pageSwitched("RehabPage");}
                   }
                }
            }
        }
    }
}
