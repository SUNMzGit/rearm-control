import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2

import Material 0.3
import Material.ListItems 0.1 as ListItem

Item {

    property var colorRect: ["#339900", "#006699", "#FF6600", "#FFFF33", "#FF0000", "#006699"]
    property var levelModel: ["0 级", "1 级", "2 级 ","3 级","4 级","5 级"]
    property var standardText: ["无可测知的肌肉收缩 ", "有轻微收缩，但不能引起关节运动", "在减重状态下能作关节全范围运动 ","能杭重力作关节全范围运动，但不能抗阻力","能抗重力、抗一定阻力运动","能抗重力、抗充分阻力运动"]
    property var nameText: ["零（Zero，０）", "微缩（Trace，Ｔ）", "差（Poor，P） ","可（Fair，F）","良好（Good，G）","正常（Norlna1，N）"]
    Column {   //整体布局
        id: column
        height: parent.height
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
                text: "康复评估"
                style: "headline"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: dp(96)
            }
        } //View

        Component.onCompleted: {

            tabView.addTab("ROM评定",tabContent_rom);
            tabView.addTab("肌力评定",tabContent_muscle);
            tabView.addTab("认知评定",tabContent_cong);
        }

        TabView {
              id: tabView
              anchors{
                top: parent.top
                topMargin: dp(136)
                horizontalCenter: parent.horizontalCenter
              }
              width: dp(1500)
              height: dp(800)

              style: TabViewStyle {
                  tab: Rectangle {
                      color: styleData.selected ? "#FFFFFF" :"#EEEEEE"

                      implicitWidth: dp(200)
                      implicitHeight: dp(49)
                      radius: dp(5)
                      Text {
                          id: text
                          anchors.centerIn: parent
                          text: styleData.title
                          color: "steelblue"
                          font.family: "微软雅黑"
                          font.pointSize: dp(14)
                      }
                  }

                  tabBar: Rectangle { //"#EEEEEE"
                      height: dp(60)
                      width: dp(80)
                      color: "#EEEEEE"
                  }
                 tabsAlignment: Qt.AlignHCenter
              }
          }
    }
    Component {
        id: tabContent_rom
        Rectangle {
            anchors.fill: parent
            color: "#FFFFFF"

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: dp(20)
                spacing: dp(20)
                Icon {
                    name: "awesome/list_ul"
                    size: dp(28)
                    color: Theme.accentColor
                }

                Text {
                    id: name
                    text: qsTr("1 / 5")
                    font.pixelSize: dp(22)
                }
            }
            Rectangle {
                id: rect
                width: dp(500)
                height: dp(500)
                x: dp(160)
                y: dp(89)
                Column {
                    anchors.centerIn: parent
                    spacing: dp(68)
                    Label {
                        id: romText
                        text: "肩关节屈曲/伸展"
                        style: "title"
                    }
                    Image {
                        id: romPic
                        width: dp(320)
                        height: dp(320)
                        source: "images/FM13.png"

                    }
                }
            }
            GridLayout {
                id: romResult
                anchors.left: rect.right
                anchors.leftMargin: dp(100)
                anchors.top: rect.top
                anchors.topMargin: dp(80)
                width: dp(500)
                rows: 6
                columns: 2
                rowSpacing: dp(10)

                Label {
                    text: "肩关节屈曲"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    color: colorRect[0]
                }

                Label {
                    text: "肩关节伸展"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    color: colorRect[1]
                }
                Label {
                    text: "肩关节外展"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    color: colorRect[2]
                }
                Label {
                    text: "肩关节内收"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    darkBackground: index == 1
                    color: colorRect[3]
                }
                Label {
                    text: "肘关节屈曲"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    color: colorRect[4]
                }
                Label {
                    text: "肘关节伸展"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    darkBackground: index == 1
                    color: colorRect[5]
                }

            }
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                IconButton {
                    iconName: "awesome/angle_left"
                    size: dp(56)

                }
            }
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                IconButton {
                    iconName: "awesome/angle_right"
                    size: dp(56)

                }
            }

            Button {
                text: "结束评定"
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: dp(36)
                }
                width: dp(150)
                backgroundColor: Theme.accentColor
                onClicked: {
                   console.info("结束评定");
                    //if(tabView.currentIndex == 1)
                    //else if(tabView.currentIndex == 2)
               }
            }



        }
    }//tabContent_rom

    Component {
        id: tabContent_muscle
        Rectangle {
            width: dp(800)
            height: dp(500)
            anchors.fill: parent
            color: "#FFFFFF"

            Label {
                anchors.top: parent.top
                anchors.topMargin: dp(100)
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Lovett 分级法评定标准"
                style: "title"
            }

            Column {
                id: radioBtn
                anchors.left: parent.left
                anchors.leftMargin: dp(300)
                anchors.top: parent.top
                anchors.topMargin: dp(200)
                spacing: dp(10)

                ExclusiveGroup { id: optionGroup }
                Repeater {
                    model: 6
                    RadioButton {
                        checked: flase
                        text: levelModel[index]
                        exclusiveGroup: optionGroup
                        color: colorRect[index]
                    }
                }
            } //radioBtn Column
            Column {
                id: colorTip
                anchors.left: radioBtn.right
                anchors.leftMargin: dp(30)
                anchors.top: parent.top
                anchors.topMargin: dp(200)
                spacing: dp(10)
                Repeater {
                    model: 6
                    Rectangle {
                        width: dp(5); height: dp(48)
                        radius: dp(2)
                        color: colorRect[index]
                    }
                }
            }//colorTip Column

            Column {
                id: nameTip
                anchors.left: colorTip.right
                anchors.leftMargin: dp(20)
                anchors.top: parent.top
                anchors.topMargin: dp(220)
                spacing: dp(38)
                Repeater {
                    model: 6
                    Label {
                        text: nameText[index]//standardText
                        style: "title"
                    }
                }
            }//nameTip Column

            Column {
                id: standardTip
                anchors.left: nameTip.right
                anchors.leftMargin: dp(50)
                anchors.top: parent.top
                anchors.topMargin: dp(220)
                spacing: dp(38)
                Repeater {
                    model: 6
                    Label {
                        text: standardText[index]//standardText
                        style: "title"
                    }
                }
            }//nameTip Column


            Button {
                text: "结束评定"
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: dp(36)
                }
                width: dp(150)
                backgroundColor: Theme.accentColor
                onClicked: {
                   console.info("结束评定");
                    //if(tabView.currentIndex == 1)
                    //else if(tabView.currentIndex == 2)
               }
            }
        }

//        MusComponent {
//            anchors.fill: parent
//        }
    }//tabContent_muscle


    Component {
        id: tabContent_cong
        Rectangle {
            anchors.fill: parent
            color: "#FFFFFF"
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: dp(20)
                spacing: dp(20)
                Icon {
                    name: "awesome/list_ul"
                    size: dp(28)
                    color: Theme.accentColor
                }

                Text {
                    id: name
                    text: qsTr("1 / 20")
                    font.pixelSize: dp(22)
                }
            }


            Button {
                text: "结束评定"
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: dp(36)
                }
                width: dp(150)
                backgroundColor: Theme.accentColor
                onClicked: {
                   console.info("结束评定");
                    //if(tabView.currentIndex == 1)
                    //else if(tabView.currentIndex == 2)
               }
            }

        }
    }//tabContent_cong


}
