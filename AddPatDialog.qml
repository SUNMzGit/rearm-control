import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import Material 0.2
import Material.ListItems 0.1 as ListItem
import Material.Extras 0.1

Dialog{

    id: addpatDialog

    hasActions: true
    positiveButtonText: "保存"
    negativeButtonText: "取消"
    height: dp(900)
    width: dp(550)
    property var operation: "ADD"

    property alias age_: p_age.text
    property alias name_: p_name.text
    property alias body_height_: p_height.text
    property alias body_weight_: p_weight.text
    property alias arm_length_: p_armLength.text

    property alias gender_t_: p_gender.selectedText
    property alias department_t_: p_department.selectedText

    property alias ache_arm_t_: p_acheArm.selectedText

    property alias strength_level_t_: p_muscleStrength.selectedText
    property alias tone_level_t_: p_muscleTone.selectedText

    property alias doctor_t_: p_docname.selectedText
    property alias type_t_: p_patientType.selectedText
    property alias illness_: p_illness.text

    property var doctorMenu: new Array()
    property var muscleMenu: ["1","2","3","4","5"]
    property var muscleToneMenu: ["1","2","3","4","5"]

    property var departmentMenu: ["康复科", "骨科", "外科"]
    property var typeMenu: ["门诊","住院"]
    property var genderMenu: ["男", "女"]
    property var acheMenu: ["左侧", "右侧", "双侧"]

    title: "添加患者信息"

    ColumnLayout {
        spacing: dp(16)

        RowLayout {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(110)
            Label {
                text: "姓名"
                font.pixelSize: dp(20)
            }
            TextField {
                id: p_name
                placeholderText: qsTr("必填")
                text : operation == "EDIT" ? curPatientObj.name :""
                floatingLabel: true
            }
        }
        RowLayout {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(110)
            Label {
                text: "医师"
                font.pixelSize: dp(20)
            }
            MenuField {
                id: p_docname
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: dp(200)
                model: doctorMenu
                selectedIndex: operation == "EDIT" ? text2index(doctorMenu, curPatientObj.doctorName): 0

            }
        }

        RowLayout {  //
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(110)
            Label {
                text: "性别"
                font.pixelSize: dp(20)
            }
            MenuField {
                id: p_gender
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: dp(200)
                model: genderMenu
                selectedIndex: operation == "EDIT" ? text2index(genderMenu, curPatientObj.gender): 0

            }
        }
        RowLayout {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(110)
            Label {
                text: "年龄"
                font.pixelSize: dp(20)
            }

            TextField {
                id: p_age
                placeholderText: qsTr("必填")
                width: dp(60)
                text : operation == "EDIT" ? curPatientObj.age :""
            }
        }

        Row {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(70)
            Label {
                text: "身高体重"
                font.pixelSize: dp(20)
            }
            TextField {
                id: p_height
                width: dp(60)
                text : operation == "EDIT" ? curPatientObj.height :""
            }

            Label {
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: 0.15 * parent.width
                text: "CM"
            }
            TextField {
                id: p_weight
                width: dp(60)
                text : operation == "EDIT" ? curPatientObj.weight :""
            }
            Label {
                text: "KG"
            }
        }
        //
        RowLayout {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(110)
            Label {
                text: "患侧"
                font.pixelSize: dp(20)
            }

            MenuField {
                id: p_acheArm
                model: acheMenu
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: dp(200)
                selectedIndex: operation == "EDIT" ? text2index(acheMenu, curPatientObj.acheArm) : 0

            }
        }
        RowLayout {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(110)
            Label {
                text: "臂长"
                font.pixelSize: dp(20)
            }
            TextField {
                id: p_armLength
                width: dp(60)
                text : operation == "EDIT" ? curPatientObj.armLength :""
            }
            Label {
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: 0.15 * parent.width
                text: "CM"
            }
        }
        RowLayout {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(110)
            Label {
                text: "科室"
                font.pixelSize: dp(20)
            }
            MenuField {
                id: p_department
                model: departmentMenu
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: dp(200)
                selectedIndex: operation == "EDIT" ? text2index(departmentMenu, curPatientObj.department) : 0

            }
        }
        RowLayout {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(110)
            Label {
                text: "类别"
                font.pixelSize: dp(20)
            }
            MenuField {
                id: p_patientType
                model: typeMenu
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: dp(200)
                selectedIndex: operation == "EDIT" ? text2index(typeMenu, curPatientObj.patientType) : 0
            }
        }
        RowLayout {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(110)
            Label {
                text: "肌力"
                font.pixelSize: dp(20)
            }
            MenuField {
                id: p_muscleStrength
                model: muscleMenu
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: dp(200)
                selectedIndex: operation == "EDIT" ? text2index(muscleMenu, curPatientObj.muscleStrength) : 0
            }
        }
        RowLayout {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(90)
            Label {
                text: "肌张力"
                font.pixelSize: dp(20)
            }

            MenuField {
                id: p_muscleTone
                model: muscleToneMenu
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: dp(200)
                selectedIndex: operation == "EDIT" ? text2index(muscleMenu, curPatientObj.muscleTone) : 0
            }
        }
        RowLayout {
            spacing: dp(20)
            anchors.left: parent.left
            anchors.leftMargin: dp(70)
            Label {
                text: "病症描述"
                font.pixelSize: dp(20)
            }
            TextField {
                id: p_illness
                placeholderText: qsTr("必填")
                text : operation == "EDIT" ? curPatientObj.illness :""
            }
        }
    }
    function text2index(  model,  field )
    {
        var modell = model;
        var i = 0;
        for(  i = 0; i < modell.length; i++ )
        {
            if( field == modell[i] )
            {
                return i;
            }
        }
        if( i >= modell.length ){ return 0 }
    }
}

