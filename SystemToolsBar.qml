import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2
import Material 0.3

/* 设备工具状态栏*/
Item {
    id: bar
    property alias homeBtn: homeBtn
    property alias setBtn: setBtn

    property var locale: Qt.locale()
    property date currentDate: new Date()
    property string dateString
    property string timeString

    signal pageSwitched( var name );

    width: dp(1860)
    height: parent.height

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: timeChanged()
    }

    Label {
        text: "上肢康复功能评定与训练系统"
        color: "white"
        style: "headline"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }


    Row {
        spacing: dp(18)
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Text {
            text: dateString+timeString
            color: "white"
            font.pixelSize: dp(24)
            anchors.verticalCenter: parent.verticalCenter
        }
        Label {
            width: dp(50)
        }
        IconButton {
            id: homeBtn
            size: dp(32)
            iconName: "action/action/home"
            color: "white"
        }
        IconButton {
            id: setBtn
            size: dp(32)
            iconName: "action/settings"
            color: "white"
        }
        IconButton {
            size: dp(32)
            iconName: "action/action/settings_power"
            color: "white"
            onClicked: quitComfirm.open();
        }//
    }

    function timeChanged() {
        var date = new Date;
        dateString = date.toLocaleDateString();
        timeString = date.toLocaleTimeString(Qt.locale("zh_CN"), "HH:mm:ss");
    }
    Dialog {
        id: quitComfirm
        title: "关闭确认"
        text: "是否退出并关闭应用程序?"
        hasActions: true
        positiveButtonText: "是"
        negativeButtonText: "否"
        onAccepted: Qt.quit();

    }

}
