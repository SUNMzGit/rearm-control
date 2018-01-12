import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2
import Material 0.2
import com.mysqlhandler 1.0


/* 系统高级设置窗口 */
Item {
    id: root
    width: parent.width


    signal pageSwitched( var name );

    Column {
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
                    onTriggered: pageSwitched("ChoicePage");
                }
            }
            Label {
                text: "系统设置"
                style: "headline"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: dp(96)
            }
        } //View

        Component.onCompleted: {
            tabView.addTab("机构信息", tabContent_owner);
            tabView.addTab("机械限位", tabContent_limit);
            tabView.addTab("串口配置", tabContent_port);
            tabView.addTab("软件信息", tabContent_soft);

            updateDocModel();
        }


        TabView {
            id: tabView
            anchors.top: parent.top
            anchors.topMargin: dp(136)
            anchors.horizontalCenter: parent.horizontalCenter
            width: dp(1100)
            height: dp(700)

            style: TabViewStyle {
                tab: Rectangle {
                    color: styleData.selected ? "#FFFFFF" :"#EEEEEE"
                    implicitWidth: dp(130)
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
        id: tabContent_owner
        Rectangle {
            id: ownerInfo
            color: "#FFFFFF"
            Column{
                id: col_title
                spacing: dp(8)
                anchors {
                    top: parent.top
                    left: parent.left
                    leftMargin: dp(260)
                    topMargin: dp(60)
                }
                Label {
                    text: "机构名称"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "机构性质"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "机构地址"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "治疗师数"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "详细信息"
                    font.pixelSize: dp(20)
                }

            }
            Column {
                id: col_content
                spacing: dp(8)
                anchors {
                    top: parent.top
                    left: col_title.right
                    leftMargin: dp(50)
                    topMargin: dp(60)
                }
                Label {
                    text: "上海理工大学康复工程与技术研究所"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "高校研究院"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "上海市杨浦区军工路516号"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "6"
                    font.pixelSize: dp(20)
                }
            }
            DocListView {
                id: docListView
                x:dp(260)
                y: dp(220)
                model: doctorModel

            }
            Button {
                id: editBtn
                text: "增加治疗师"
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: dp(50)
                }
                backgroundColor: Theme.accentColor
                onClicked: {

                }
            }
        }

    }//tabContent_owner

    Component {
        id: tabContent_limit
        Rectangle {
            width: dp(1100)
            height: dp(800)
            anchors.centerIn: parent
            color: "#FFFFFF"
            Column{
                id: col_title
                spacing: dp(8)
                anchors {
                    top: parent.top
                    left: parent.left
                    leftMargin: dp(360)
                    topMargin: dp(80)
                }
                Label {
                    text: "肩关节屈曲伸展"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "肘关节屈曲伸展"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "肩关节屈曲伸展"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "肘关节屈曲伸展"
                    font.pixelSize: dp(20)
                }

            }
            Column {
                id: col_content
                spacing: dp(8)
                anchors {
                    top: parent.top
                    left: col_title.right
                    leftMargin: dp(50)
                    topMargin: dp(80)
                }
                Label {
                    text: "90"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "130"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "50"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "60"
                    font.pixelSize: dp(20)
                }
            }
            Row {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: dp(50)
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: dp(50)
                Button {
                    text: "重置"
                    backgroundColor: Theme.accentColor
                    onClicked: {

                    }
                }
                Button {
                    text: "Save"
                    backgroundColor: Theme.accentColor
                    onClicked: {

                    }
                }
            }
        }
    }//tabContent_limit

    Component {
        id: tabContent_port
        Rectangle {
            width: dp(1100)
            height: dp(800)
            anchors.centerIn: parent
            color: "#FFFFFF"

            GridLayout {
                columns: 2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 100

                Layout.rowSpan: 50
                Label {
                    text: "串口号"
                    font.pixelSize: dp(26)
                }  MenuField {
                    width: 200
                    model: [ "COM1", "COM2", "COM3"]
                }

                Label {
                    text: "波特率"
                    font.pixelSize: dp(26)
                }
                MenuField {
                    width: 200
                    model: [ "115200", "9600", "COM3"]
                }

                Label {
                    text: "校验位"
                    font.pixelSize: dp(26)
                }
                MenuField {
                    width: 200
                    model: [ "无校验", "奇校验", "偶校验"]
                }

                Label {
                    text: "数据位"
                    font.pixelSize: dp(26)
                }
                MenuField {
                    width: 200
                    model: [ "8位", "16位", "8位"]
                }

                Label {
                    text: "停止位"
                    font.pixelSize: dp(26)
                }
                MenuField {
                    width: 200
                    model: [ "1位", "1.5位", "2位"]
                }



            }

//            Column{
//                id: col_title3
//                spacing: dp(26)
//                anchors {
//                    top: parent.top
//                    left: parent.left
//                    leftMargin: dp(360)
//                    topMargin: dp(70)
//                }

//                Label {
//                    text: "串口号"
//                    font.pixelSize: dp(20)
//                }
//                Label {
//                    text: "波特率"
//                    font.pixelSize: dp(20)
//                }
//                Label {
//                    text: "校验位"
//                    font.pixelSize: dp(20)
//                }
//                Label {
//                    text: "数据位"
//                    font.pixelSize: dp(20)
//                }
//                Label {
//                    text: "停止位"
//                    font.pixelSize: dp(20)
//                }

//            }
//            Column {
//                id: col_content3
//                //spacing: dp(8)
//                anchors {
//                    top: parent.top
//                    left: col_title3.right
//                    leftMargin: dp(50)
//                    topMargin: dp(55)
//                }
//                MenuField {
//                    width: 200
//                    model: [ "COM1", "COM2", "COM3"]
//                }
//                MenuField {
//                    width: 200
//                    model: [ "9600", "115200", "COM3"]
//                }
//                MenuField {
//                    width: 200
//                    model: [ "无校验", "奇校验", "偶校验"]
//                }
//                MenuField {
//                    width: 200
//                    model: [ "8位", "16位", "8位"]
//                }
//                MenuField {
//                    width: 200
//                    model: [ "1位", "1.5位", "2位"]
//                }
//            }


            Button {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: dp(50)
                anchors.horizontalCenter: parent.horizontalCenter
                text: "重置"

                backgroundColor: Theme.accentColor
                onClicked: {
                        //MessageDialog tip

                }
            }

        }
    }//tabContent_port

    Component {
        id: tabContent_soft
        Rectangle {
            width: dp(1100)
            height: dp(800)
            anchors.centerIn: parent
            color: "#FFFFFF"
            Column{
                id: col_title
                spacing: dp(8)
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: dp(80)
                Image {
                    id: robotPic
                    source: "images/robot.jpg"
                }

                Label {
                    text: "Rearm上肢康复功能评估和训练系统"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "Copyright©2017 上海理工大学康复工程与技术研究所"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "v1.2.0.20170901_beta"
                    font.pixelSize: dp(20)
                }
                Label {
                    text: "中文简体"
                    font.pixelSize: dp(20)
                }
            }
        }
    }//tabContent_soft

    ListModel {
        id: doctorModel
    }

    function updateDocModel(){
        console.info("更新医生列表");
        doctorModel.clear();
        for(var i=0; i<mysqlHandler.getDoctorModel.length; i++) {
            doctorModel.append ({
                 name:mysqlHandler.getDoctorModel[i].name,
                 gender:mysqlHandler.getDoctorModel[i].gender,
                 age:mysqlHandler.getDoctorModel[i].age,
                 rank:mysqlHandler.getDoctorModel[i].rank,
                 good:mysqlHandler.getDoctorModel[i].good
            })
        }

    }

}
