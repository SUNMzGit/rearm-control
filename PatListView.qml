import QtQuick 2.0
import QtQuick 2.5
import QtQuick.Layouts 1.2
import Material 0.3
//import "../JavaScript/main.js" as Script


//后期优化把复用率高的Label text写成 labelTextBase.qml @SUNMz_2017/6/6

Rectangle {
    width: dp(1600)
    height: dp(667)
    color: "#EEEEEE"

    ListView {
        id: patinfoListView
        anchors.fill: parent
        clip: true
        spacing: dp(1)

        header: headerComponent
        delegate: infoComponent
        model: 6//patsModel

        Component {
            id: headerComponent
            Rectangle {
                width: parent.width
                height: dp(56)
                color: "#2196f3"

                RowLayout {
                    width: 0.9 * parent.width
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: 0.03 * parent.width
                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "title"
                        text: "编号"
                        color: "white"
                    }
                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "title"
                        text: "姓名"
                        color: "white"
                    }

                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "title"
                        text: "性别"
                        color: "white"
                    }
                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "title"
                        text: "年龄"
                        color: "white"
                    }
                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "title"
                        text: "身高"
                        color: "white"
                    }
                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "title"
                        text: "体重"
                        color: "white"
                    }

                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "title"
                        text: "上臂长度"
                        color: "white"
                    }
                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "title"
                        text: "前臂长度"
                        color: "white"
                    }

                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "title"
                        text: "主治医师"
                        color: "white"
                    }
                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "title"
                        text: "注意事项"
                        color: "white"
                    }

                }
            }
        }//headerComponent
        Component {
            id: infoComponent

            Rectangle {
                id: wrapper
                width: parent.width
                height: dp(56)
                color: wrapper.ListView.isCurrentItem ? "#F5FAFF" : "white"
                border.width: dp(0.5)
                border.color: "#F5FAFF"
                z: -1

                RowLayout {
                    width: 0.9 * parent.width
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: 0.03 * parent.width
                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "dialog"
                        text: "2017060401"//patsModel[index].name
                    }
                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "dialog"
                        text: "张丹"//patsModel[index].name
                    }

                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "dialog"
                        text: "女"//patsModel[index].gender
                    }

                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "dialog"
                        text: "57"//patsModel[index].age
                    }

                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "dialog"
                        text: "165"//patsModel[index].acheArm
                    }

                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "dialog"
                        text: "55"//patsModel[index].illness
                    }
                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "dialog"
                        text: "27"//patsModel[index].name
                    }

                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "dialog"
                        text: "27"//patsModel[index].gender
                    }

                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "dialog"
                        text: "张医师"//patsModel[index].age
                    }

                    Label {
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: 0.1 * parent.width
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        style: "dialog"
                        text: "易痉挛"//patsModel[index].illness
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    //enabled: !wrapper.ListView.isCurrentItem
                    onClicked: {
                        patinfoListView.forceActiveFocus();
                        patinfoListView.currentIndex = index;
                    }
                }
            }//wrapper
        } //infoComponent
    } //ListView
    ListModel {
        id: patsModel
    }
}

