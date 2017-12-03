import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls.Material 2.1
import Material 0.2
import com.mysqlhandler 1.0

Dialog{

    id: addpatDialog
    title: "增加患者"
    hasActions: true
    positiveButtonText: "保存"
    negativeButtonText: "取消"
    height: dp(800)
    width: dp(550)

    property alias name: name.text
    property alias age: age.text
    property alias gender: gender.currentText
    property alias arch: arch.currentText
    property alias pheight: pheight.text
    property alias weight: weight.text
    property alias uplen: uplen.text
    property alias forelen: forelen.text
    property alias doctorName: doctor.currentText
    property alias tip: tip.text

    GridLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: dp(50)
        columnSpacing : dp(50)
        rowSpacing : dp(26)
        rows : 10
        columns : 2

        Text {
            text: qsTr("姓名")
            font.pixelSize: dp(22)
        }
        TextField {
            id: name
        }
        Text {
            text: qsTr("年龄")
            font.pixelSize: dp(22)
        }
        TextField {
            id: age
        }
        Text {
            text: qsTr("性别")
            font.pixelSize: dp(22)
        }
        ComboBox {
            id: gender
            model:["男","女"]
        }
        Text {
            text: qsTr("患侧")
            font.pixelSize: dp(22)
        }
        ComboBox {
            id: arch
            model:["右侧","左侧"]
        }
        Text {
            text: qsTr("身高")
            font.pixelSize: dp(22)
        }
        TextField {
            id: pheight
        }
        Text {
            text: qsTr("体重")
            font.pixelSize: dp(22)
        }
        TextField {
            id: weight
        }
        Text {
            text: qsTr("上臂长度")
            font.pixelSize: dp(22)
        }
        TextField {
            id: uplen
        }
        Text {
            text: qsTr("前臂长度")
            font.pixelSize: dp(22)
        }
        TextField {
            id: forelen
        }
        Text {
            text: qsTr("主治医师")
            font.pixelSize: dp(22)
        }
        ComboBox {
            id: doctor
            model: ["章程","郭恒","周茂"]
        }
        Text {
            text: qsTr("注意事项")
            font.pixelSize: dp(22)
        }
        TextField {
            id: tip
        }
    }
    Component.onCompleted: {
        //console.info(docModel[0])
    }

}

