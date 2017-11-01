import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.2
import Material 0.3
import Material.ListItems 0.1 as ListItem
import Material.Extras 0.1

Item {
    width: dp(1920)
    property var trainModel: ["被动训练", "主动训练", "助力训练"]
    property var colorRect: ["#339900", "#006699", "#FF6600"]
    property var targetModel : ["ROM训练", "认知训练", "ADL训练"]
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
                text: "计划设定"
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
                           text: "康复评估"
                           style: "display1"
                           color: "white"
                           anchors.verticalCenter: parent.verticalCenter
                       }
                       Image {
                           id: assessImage
                           source: "images/assess.png"
                       }
                   }
                   MouseArea {
                       anchors.fill: parent
                       onClicked: { serialHandler.openPort();pageSwitched("AssessPage");}
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
                           text: "康复训练"
                           style: "display1"
                           color: "white"
                           anchors.verticalCenter: parent.verticalCenter
                       }
                       Image {
                           id: trainImage
                           source: "images/train.png"
                       }
                   }
                   MouseArea {
                       anchors.fill: parent
                       onClicked: { pageSwitched("PassTrain");}//pageSwitched("RehabPage")
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
                           text: "康复报告"
                           style: "display1"
                           color: "white"
                           anchors.verticalCenter: parent.verticalCenter
                       }

                       Image {
                           id: reportImage
                           source: "images/report.png"
                       }
                   }
                   MouseArea {
                       anchors.fill: parent
                       onClicked: { pageSwitched("ReportPage");  }
                   }
                }
            }
        }
    }
}
