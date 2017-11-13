import QtQuick 2.0
import QtQuick 2.5
import QtQuick.Layouts 1.2
import Material 0.3

//后期优化需要把复用率高的Label text写成 labelTextBase.qml @SUNMz_2017/6/6
Item {
    property alias model: patinfoListView.model
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
            model: patientsModel

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
                            text: "患侧"
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
                            text: patientsModel.get(index).name
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text:  patientsModel.get(index).gender
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text:  patientsModel.get(index).age
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text:  patientsModel.get(index).arch
                        }
                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text:  patientsModel.get(index).pheight
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text:  patientsModel.get(index).weight
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text:  patientsModel.get(index).uparmlength
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text:  patientsModel.get(index).forearmlength
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text:  patientsModel.get(index).doctor
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text:  patientsModel.get(index).tip
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        //enabled: !wrapper.ListView.isCurrentItem
                        onClicked: {
                            patinfoListView.forceActiveFocus();
                            patinfoListView.currentIndex = index;
                            currentUser = patientsModel.get(index).name
                        }
                    }
                }//wrapper
            } //infoComponent
        } //ListView
    }
}
