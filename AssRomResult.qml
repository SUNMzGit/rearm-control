import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.2
import QtCharts 2.2
import Material 0.3
Item {
    width: dp(1920)
    //肩关节前屈/肩关节伸展/肩关节外展/肩关节内收/肩关节水平屈曲/肩关节水平外展/肘关节屈曲/肘关节伸展
    property var romNameModel: ["肩关节前屈","肩关节伸展","肩关节外展","肩关节内收","肩关节水平屈曲","肩关节水平外展","肘关节屈曲","肘关节伸展"]
    property var bestRangeModel: ["180","180","180","45","135","30","145","5"]
    property var currRangeModel: ["120","120","150","30","110","10","100","2"]
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
                    onTriggered: pageSwitched("Choice");
                }
            }
            Label {
                text: "活动范围"
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
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: dp(150)
                Repeater {
                    model: 8
                    Rectangle {
                        width: 220
                        height: 450
                        ChartView {
                             title: romNameModel[index]
                             anchors.fill: parent
                             legend.alignment: Qt.AlignBottom
                             antialiasing: true
                             BarSeries {
                                 id: mySeries
                                 axisX: BarCategoryAxis { categories: [" " ] }
                                 BarSet { label: "当前"; values: [bestRangeModel[index]] }
                                 BarSet { label: "最佳"; values: [currRangeModel[index]] }
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
                onClicked: {

                    pageSwitched("ChoicePage");
                    //console.log("pageswitch")

                }
            }
        }
    }
}
