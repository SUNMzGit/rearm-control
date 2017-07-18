import QtQuick 2.0
import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.2
import Material 0.2
Item {
    property alias model: docinfoListView.model
    Rectangle {
        width: dp(700)
        height: dp(330)
        ListView {
            id: docinfoListView
            anchors.fill: parent
            clip: true
            spacing: dp(1)
            header: headerComponent
            delegate: infoComponent
            model: doctorModel
            Component {
                id: headerComponent
                Rectangle {
                    width: parent.width
                    height: dp(46)
                    color: "lightblue"

                    RowLayout {
                        width: 0.9 * parent.width
                        height: parent.height
                        anchors.left: parent.left
                        anchors.leftMargin: 0.05 * parent.width
                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "title"
                            text: "姓名"
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "title"
                            text: "性别"
                        }
                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "title"
                            text: "年龄"
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "title"
                            text: "职级"
                        }
                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "title"
                            text: "主治方向"
                        }
                    }
                }
            }//headerComponent
            Component {
                id: infoComponent

                Rectangle {
                    id: wrapper
                    width: parent.width
                    height: dp(46)
                    color: wrapper.ListView.isCurrentItem ? "#F5FAFF" : "white"
                    border.width: dp(0.5)
                    border.color: "#F5FAFF"
                    z: -1

                    RowLayout {
                        width: 0.9 * parent.width
                        height: parent.height
                        anchors.left: parent.left
                        anchors.leftMargin: 0.05 * parent.width

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text: doctorModel.get(index).name
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text: doctorModel.get(index).gender
                        }

                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text: doctorModel.get(index).age
                        }
                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text: doctorModel.get(index).rank
                        }
                        Label {
                            Layout.alignment: Qt.AlignLeft
                            Layout.preferredWidth: 0.1 * parent.width
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            style: "dialog"
                            text: doctorModel.get(index).good
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        enabled: !wrapper.ListView.isCurrentItem
                        onClicked: {
                            docinfoListView.forceActiveFocus();
                            docinfoListView.currentIndex = index;
                        }
                    }
                }//wrapper
            } //infoComponent
        }
    }
}
