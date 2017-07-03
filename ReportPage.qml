import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import QtCharts 2.2
import Material 0.3

Item {
    property var romNameModel: ["肩关节前屈","肩关节伸展","肩关节外展","肩关节内收","肩关节水平屈曲","肩关节水平外展","肘关节屈曲","肘关节伸展"]
    property var valueModel: ["180","180","180","45","135","30","145","5"]
    Column {
        id: column
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
                    onTriggered: pageSwitched("Choice");
                }
            }
            Label {
                text: "康复报告"
                style: "headline"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: dp(96)
            }
        } //View
        View {
            width: parent.width
            height: parent.height - headline.height
            backgroundColor: "#eeeeee"
            Label {
                text: "当前用户:"
                anchors.left: trainResult.left
                anchors.top: parent.top
                anchors.topMargin: dp(50)
                style: "headline"
            }
            Label {
                text: "lisi"
                anchors.left: trainResult.left
                anchors.top: parent.top
                anchors.topMargin: dp(50)
                anchors.leftMargin: dp(150)
                style: "headline"
            }
            Label {
                text: "评估结果:"
                anchors.left: trainResult.left
                anchors.bottom: assessResult.top
                anchors.bottomMargin: dp(30)
                style: "headline"
            }
            GridLayout {
                id: assessResult
                anchors.left: trainResult.left
                anchors.top: parent.top
                anchors.topMargin: dp(150)
                flow: Grid.TopToBottom
                rows: 2
                columns: 4
                rowSpacing: 10
                columnSpacing: dp(100)
                Repeater {
                    model: romNameModel.length
                    Rectangle {
                        width: 220
                        height: 32
                        color: "#EEEEEE"
                        LabelLabelBase {
                            title: romNameModel[index]
                            value: valueModel[index]+ "°"
                        }
                    }
                }//Repeater
            }
            Label {
                text: "训练结果:"
                anchors.left: trainResult.left
                anchors.bottom: trainResult.top
                anchors.bottomMargin: dp(130)
                style: "headline"
            }
            GridLayout {
                anchors.left: trainResult.left
                anchors.bottom: trainResult.top
                anchors.bottomMargin: dp(20)
                flow: Grid.TopToBottom
                rows: 2
                columns: 4
                rowSpacing: 10
                columnSpacing: dp(100)
                Repeater {
                    model: romNameModel.length
                    Rectangle {
                        width: 220
                        height: 32
                        color: "#EEEEEE"
                        LabelLabelBase {
                            title: romNameModel[index]
                            value: valueModel[index]+ "°"
                        }
                    }
                }//Repeater
            }
            Row {
                id: trainResult
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: dp(410)
                Repeater {
                    model: 8
                    Rectangle {
                        width: 220
                        height: 320
                        ChartView {
                             title: romNameModel[index]
                             anchors.fill: parent
                             legend.alignment: Qt.AlignBottom
                             antialiasing: true
                             BarSeries {
                                 id: mySeries
                                 axisX: BarCategoryAxis { categories: [" " ] }
                                 BarSet { label: "最大范围"; values: [valueModel[index]] }
                             }
                         }
                    }
                }//Repeater
            }
            Button {
                text: "确定"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: dp(100)
                anchors.horizontalCenter: parent.horizontalCenter
                elevation: 1
                width: dp(200)
                backgroundColor:  "#235063"
            }
        }
    }
}
