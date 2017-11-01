import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import Material 0.3
import Material.ListItems 0.1 as ListItem
import Material.Extras 0.1
Item {
    id: root
    //implicitHeight: dp(1080)
    implicitWidth: dp(1920)

    signal pageSwitched( var name );

    Rectangle {
        id: rect1
        width: dp(600)
        height: dp(200)
        color: "#2b7da3"
        anchors.bottom: rect2.top
        anchors.left: parent.left
        anchors.leftMargin: dp(700)
        Label{
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: dp(70)
            anchors.leftMargin: dp(55)
            Text {
                text: "上肢康复功能评定与训练系统"
                font.pixelSize: dp(30)
                color: "#FFFFFF"
            }
        }
        Label{
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: dp(60)
            anchors.bottomMargin: dp(16)
            Text {
                text: "PLEASE　LOGIN"
                font.pixelSize: dp(26)
                color: "#FFFFFF"
            }
        }
    }
    Rectangle{
        id: rect2
        width: parent.width
        height: dp(600)
        color: "#235063"
        anchors.bottom: parent.bottom

        Rectangle{

            width: dp(600)
            height: dp(237)
            color: "#FFFFFF"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: dp(700)


            Icon {
                id: iconname
                name: "awesome/user"
                size: dp(32)
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: dp(190)
                anchors.topMargin: dp(30)
            }
            Icon {
                id: iconpass
                name: "awesome/lock"
                size: dp(32)
                anchors.top: iconname.bottom
                anchors.left: iconname.left
                anchors.topMargin: dp(26)
            }
            ColumnLayout {
               id: grid
               anchors.top: parent.top
               anchors.topMargin: dp(30)
               anchors.horizontalCenter: parent.horizontalCenter
               spacing: dp(32)
               TextField {
                   id: username
                   text: "USST"
                   placeholderText: "在此输入用户名"
                   helperText: "Hint: user name."
                   anchors.horizontalCenter: parent.horizontalCenter
                   width: dp(200)
               }

               TextField {
                   id: password
                   text: "123456"
                   placeholderText: "在此输入密码"
                   echoMode: TextInput.Password
                   helperText: "Hint: password."
                   anchors.horizontalCenter: parent.horizontalCenter
               }
            }

            Button {
                id: loginBtn
                text: "登 录"
                elevation: 1
                width: dp(200)
                backgroundColor:  "#235063"
                anchors.top: grid.bottom
                anchors.topMargin: dp(56)
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    pageSwitched("PatInfo");
                    //console.log("pageswitch")
                }
            } //Button
        }
    }
}
