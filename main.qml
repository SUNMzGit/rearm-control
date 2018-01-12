import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2

import Material 0.2

ApplicationWindow {
    visible: true
    width: 1920
    height: 1080
    title: qsTr("ArmTrianer")
    flags: Qt.FramelessWindowHint

    property string selectedComponent: "RehabPage"//"Login"//"TrainChoice"//"AssessPage"//"PatInfo"//"PassTrain"//

    initialPage: Page {
        id: page
        title: "上肢康复训练和评估系统"

        actionBar {
            backgroundColor: "#006699"
            // You can also set a custom content view instead of the title
            customContent: SystemToolsBar {
                id: stateBar
                anchors { left: parent.left;  }
                homeBtn.onClicked: selectedComponent = "ChoicePage";
                setBtn.onClicked: selectedComponent = "SystemSeting";
            }
        }

        Flickable {
            id: flickable
            anchors.fill: parent
            property alias example: example
            clip: true
            contentHeight: Math.max(example.implicitHeight + 40, height)
            Loader {
                id: example
                anchors.fill: parent
                asynchronous: true
                visible: status == Loader.Ready
                // selectedComponent will always be valid, as it defaults to the first component
                source: {
                        return Qt.resolvedUrl("%.qml").arg(selectedComponent.replace(" ", ""))
                }
            }
            // self define!!
            Connections {
                target: example.item;
                onPageSwitched: {
                    //这里直接调用会有问题的，需要根据selectedComponent游戏规则来
                    selectedComponent = name;
                }
            }
        }
    }
}
