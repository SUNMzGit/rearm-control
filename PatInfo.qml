import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.2
import Material 0.3
import com.mysqlhandler 1.0


Item {
    property var docModel: []  //currentPatients

    property var currentUser: ""

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
                text: "患者管理"
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
            ColumnLayout {
                width: dp(1600)
                height: dp(790)
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: dp(32)
                }

                RowLayout {
                    id: row
                    spacing: dp(16)
                    width: dp(500)
                    //anchors.right: parent.right
                    Icon {
                        id: iconuser
                        name: "awesome/odnoklassniki"
                        color: "#2196f3"
                        size: dp(46)

                    }
                    Label {
                        text: "当前用户: "
                        style: "subheading"
                    }
                    Label {
                        id: current
                        text: currentUser
                        style: "subheading"
                    }
                    Label {
                        width: dp(900)
                    }
                    TextField {
                        id: searchName
                        placeholderText: ""
                        helperText: "提示: 按姓名搜索."
                    }

                    Button {
                        id: searchPat
                        backgroundColor: "#2196f3"
                        text: "搜索"
                    }
                    Button {
                        id: newPat
                        backgroundColor: "#2196f3"
                        text: "新增"
                        onClicked: addpat.show();
                    }
                    Button {
                        id: delPat
                        backgroundColor: "#2196f3"
                        text: "删除"
                        onClicked: delComfirm.open();
                    }
                }//RowLayout
                Rectangle {
                    width: parent.width
                    height: dp(667)
                    color: "#FFFFFF"
                    PatListView {
                        id: patlistview
                        anchors.fill: parent
                        model: patientsModel
                    }
                }
                Button {
                    text: " 确 定 "
                    width: dp(200)
                    elevation: 1
                    backgroundColor: "#235063"
                    anchors.horizontalCenter: parent.horizontalCenter

                    onClicked: {
                        pageSwitched("ChoicePage");
                    }
                }
            } //column
        }
    } //column

    Dialog {
        id: delComfirm
        title: "删除确认"
        text: "是否删除选中患者?"
        hasActions: true
        positiveButtonText: "是"
        negativeButtonText: "否"
        onAccepted: {
             mysqlHandler.deletePat(currentUser);
             updateModel();
        }
    }
    AddPatDialog {
        id: addpat
        onAccepted: {
            var docid = mysqlHandler.getDidFromName(addpat.doctorName)
            console.info(docid)
            //var strSql = insertUrl(name,age,gender,tip,uplen,forelen,arch,pheight,weight,docid);
            mysqlHandler.insertPat(name,age,gender,tip,uplen,forelen,arch,pheight,weight,docid);
            updateModel();
        }
    }
    ListModel {
        id: patientsModel
    }



    Component.onCompleted: {
        mysqlHandler.connect();
        updateModel();
        updateDocModel();
    }


    //组织插入语句//insert into table(col2, col3) values('1', '2')
    function insertUrl(name, age, gender, tip, uplen, forelen, arch, height, weight,docid) {
        var request = "INSERT INTO patient(name,age,gender,illness,upperArmLength,foreArmLength,affectedSide,height,weight,d_id) ";
        request += "VALUES (";
        request += String(name+","+age+","+gender+","+tip+","+uplen+","+forelen+","+arch+","+height+","+weight+","+docid);
        request += ")"
        return request;
    }

    function updateModel(){
        patientsModel.clear();
        mysqlHandler.updatePat();
        patientsModel.clear();
        for(var i=0; i<mysqlHandler.getPatientModel.length; i++) {
            patientsModel.append ({
                 name:mysqlHandler.getPatientModel[i].name,
                 gender:mysqlHandler.getPatientModel[i].gender,
                 age:mysqlHandler.getPatientModel[i].age,
                 arch:mysqlHandler.getPatientModel[i].affect,
                 uparmlength:mysqlHandler.getPatientModel[i].uplen,
                 forearmlength:mysqlHandler.getPatientModel[i].forelen,
                 pheight:mysqlHandler.getPatientModel[i].height,
                 weight:mysqlHandler.getPatientModel[i].weight,
                 doctor:mysqlHandler.getPatientModel[i].doctor,
                 tip:mysqlHandler.getPatientModel[i].tip
            })
        }
    }
    function updateDocModel(){

        mysqlHandler.updateDoc();
        for(var i=0; i<mysqlHandler.getDoctorModel.length; i++) {
            docModel[i]  = mysqlHandler.getDoctorModel[i].name;
            console.info( docModel[i]);
        }
    }
}
