import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.2
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2

import Material 0.3
import Material.ListItems 0.1 as ListItem
Item {
    property var trainModel: ["被动训练", "主动训练", "助力训练"]
    property var colorRect: ["#009966", "#FFCC00", "#CC3366"]
    property var targetModel : ["ROM训练", "认知训练", "ADL训练"]
    property var primaryColor: "#235063"
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
        View {
            width: parent.width
            height: parent.height - headline.height
            backgroundColor: "#eeeeee"

            Card {
                id: setCard
                width: dp(300)
                height: dp(780)
                x: dp(111)
                y: dp(50)

                Column {
                    id: setColumn
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: dp(20)

                    ExclusiveGroup { id: optionGroup1 }

                    Label {
                        text: "训练类型"
                        style: "title"
                    }
                    Column {
                        Repeater {
                            model: 3
                            RadioButton {
                                checked: flase
                                text: trainModel[index]
                                exclusiveGroup: optionGroup1
                                color: colorRect[index]
                            }
                        }
                    }
                    Label {
                        height: dp(50)
                        width: dp(200)
                    }

                    Label {
                        text: "训练时长"
                        style: "title"
                    }

                    Slider {
                        Layout.alignment: Qt.AlignCenter
                        value: 5
                        focus: true
                        tickmarksEnabled: true
                        numericValueLabel: true
                        stepSize: 5
                        minimumValue: 5
                        maximumValue: 15
                        activeFocusOnPress: true
                        color: primaryColor
                    }
                    Label {
                        text: "游戏等级"
                        style: "title"
                    }

                    Slider {
                        Layout.alignment: Qt.AlignCenter
                        value: 1
                        focus: true
                        tickmarksEnabled: true
                        numericValueLabel: true
                        stepSize: 1
                        minimumValue: 1
                        maximumValue: 3
                        activeFocusOnPress: true
                        color: primaryColor
                    }
                    Label {
                        text: "助力百分比"
                        style: "title"
                    }

                    Slider {
                        Layout.alignment: Qt.AlignCenter
                        value: 20
                        focus: true
                        tickmarksEnabled: true
                        numericValueLabel: true
                        stepSize: 20
                        minimumValue: 20
                        maximumValue: 100
                        activeFocusOnPress: true
                        color: primaryColor
                    }

                    Row {
                        spacing: dp(100)
                        Label {
                            text: "音效"
                            style: "title"
                        }
                        Switch {
                            checked: true
                        }
                    }
                }
            }
            Rectangle {
                width: dp(1)
                height: setCard.height
                anchors.left: setCard.right
                anchors.leftMargin: dp(20)
                anchors.top: setCard.top
                color: "gray"
            }
            RowLayout {
                anchors.left: setCard.right
                anchors.leftMargin: dp(50)
                anchors.top: setCard.top
                spacing: dp(20)
                Label {
                    text: "治疗目标"
                    style: "title"

                }
                MenuField {
                    model: targetModel
                    Layout.preferredWidth: dp(150)
                }

                Label {
                    width: dp(500)
                    height: dp(40)
                }
                Button {
                    text: "添加"
                    width: dp(100)
                    height: dp(52)
                    backgroundColor: primaryColor
                }
            }
            Rectangle {
                width: dp(930)
                height: dp(690)
                anchors.left: setCard.right
                anchors.leftMargin: dp(50)
                anchors.top: setCard.top
                anchors.topMargin: dp(92)
                color: "#EEEEEE"

                ListView {
                    id: trainDatabaseListView
                    anchors.fill: parent
                    clip: true
                    spacing: dp(1)

                    delegate: infoComponent
                    model: 6//trainDatabase
                    Component {
                        id: infoComponent

                        Rectangle {
                            id: wrapper
                            width: parent.width
                            height: dp(110)
                            color: wrapper.ListView.isCurrentItem ? "lightblue" : "#EEEEEE"//"white"
                            border.width: dp(0.5)
                            border.color: "#F5FAFF"
                            z: -1

                            RowLayout {
                                width: 0.9 * parent.width
                                height: parent.height
                                anchors.left: parent.left
                                anchors.leftMargin: 0.03 * parent.width
                                spacing: dp(20)
                                Image {
                                    id: name
                                    anchors.verticalCenter: parent.verticalCenter
                                    source: "images/assess.png"

                                }
                                Label {
                                    Layout.alignment: Qt.AlignLeft
                                    Layout.preferredWidth: 0.1 * parent.width
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    style: "title"
                                    text: "画直线"//patsModel[index].name
                                }
                                Label {
                                    Layout.alignment: Qt.AlignLeft
                                    Layout.preferredWidth: 0.6 * parent.width
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    style: "title"
                                    text: "训练意义和训练方法介绍训练意义和训练方法介绍训练意义和训练方法"//patsModel[index].acheArm
                                }
                            }
                            MouseArea {
                                anchors.fill: parent
                                //enabled: !wrapper.ListView.isCurrentItem
                                onClicked: {
                                    trainDatabaseListView.forceActiveFocus();
                                    trainDatabaseListView.currentIndex = index;
                                }
                            }
                        }//wrapper
                    } //infoComponent
                } //ListView
            }
            ListModel {
                id: trainDatabase
            }

            Rectangle {
                width: dp(1)
                height: setCard.height
                anchors.left: setCard.right
                anchors.leftMargin: dp(1020)
                anchors.top: setCard.top
                color: "gray"
            }
            Rectangle {
                anchors.left: setCard.right
                anchors.leftMargin: dp(1050)
                anchors.top: setCard.top
                width: dp(360)
                height: setCard.height
                color: "#eeeeee"
                Column {
                    spacing: dp(20)
                    anchors.horizontalCenter: parent.horizontalCenter
                    Label {
                        width: dp(200)
                        height: dp(30)
                    }
                    Label {
                        text: " 治疗计划"
                        style: "title"
                    }
                    Card {
                        width: dp(300)
                        height: dp(180)
                        ColumnLayout {
                            spacing: dp(20)
                            Rectangle {
                                id: type
                                width: 300
                                height: dp(46)
                                color: colorRect[0]
                                Label {
                                    text: "主动"
                                    font.pixelSize: dp(26)
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: dp(20)
                                }
                            }
                            Label {
                                text: "章鱼大作战"
                                font.pixelSize: dp(26)
                                anchors.left: parent.left
                                anchors.leftMargin: dp(20)
                                anchors.top: type.bottom
                                anchors.topMargin: dp(20)
                            }
                            Rectangle {
                                width: 300
                                height: dp(1)
                                color: "gray"
                            }

                            Row {
                                spacing: dp(150)
                                anchors.horizontalCenter: parent.horizontalCenter
                                Label {
                                    text: "10分钟"
                                    style: "title"
                                }
                                Icon {
                                    name: "awesome/odnoklassniki"
                                    size: dp(46)
                                }
                            }
                        }
                    }
                    Card {
                        width: dp(300)
                        height: dp(180)
                        ColumnLayout {
                            spacing: dp(20)
                            Rectangle {
                                id: type2
                                width: 300
                                height: dp(46)
                                color: colorRect[1]
                                Label {
                                    text: "助力"
                                    font.pixelSize: dp(26)
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: dp(20)
                                }
                            }
                            Label {
                                text: "章鱼大作战"
                                font.pixelSize: dp(26)
                                anchors.left: parent.left
                                anchors.leftMargin: dp(20)
                                anchors.top: type2.bottom
                                anchors.topMargin: dp(20)
                            }
                            Rectangle {
                                width: 300
                                height: dp(1)
                                color: "gray"
                            }

                            Row {
                                spacing: dp(150)
                                anchors.horizontalCenter: parent.horizontalCenter
                                Label {
                                    text: "10分钟"
                                    style: "title"
                                }
                                Icon {
                                    name: "awesome/odnoklassniki"
                                    size: dp(46)
                                }
                            }
                        }
                    }

                    Card {
                        width: dp(300)
                        height: dp(180)
                        ColumnLayout {
                            spacing: dp(20)
                            Rectangle {
                                id: type3
                                width: 300
                                height: dp(46)
                                color: colorRect[2]
                                Label {
                                    text: "被动"
                                    font.pixelSize: dp(26)
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: dp(20)
                                }
                            }
                            Label {
                                text: "画X轴直线"
                                font.pixelSize: dp(26)
                                anchors.left: parent.left
                                anchors.leftMargin: dp(20)
                                anchors.top: type3.bottom
                                anchors.topMargin: dp(20)
                            }
                            Rectangle {
                                width: 300
                                height: dp(1)
                                color: "gray"
                            }

                            Row {
                                spacing: dp(150)
                                anchors.horizontalCenter: parent.horizontalCenter
                                Label {
                                    text: "10分钟"
                                    style: "title"
                                }
                                Icon {
                                    name: "awesome/odnoklassniki"
                                    size: dp(46)
                                }
                            }
                        }
                    }
                }
                Button {
                    text: "开始训练"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: dp(10)
                    backgroundColor: primaryColor
                    onClicked: {serialHandler.openPort(); serialHandler.sendto(2);}//pageSwitched("PassTrain");
                }
            }
        }
    }
}
