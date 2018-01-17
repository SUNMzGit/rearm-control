import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2

import Material 0.3
import Material.ListItems 0.1 as ListItem

import com.reporthandler 1.0

Item {
    signal pageSwitched( var name );
    property var count : 1
    property var countROM : 1
    property var tempScore : 0
    property var conScore : 0
    property var musLevel : 0
    property var scoreModel : ["0 分", "1 分", "2 分 ","3 分","4 分","5 分"]
    property var colorRect: ["#339900", "#006699", "#FF6600", "#FFFF33", "#FF0000", "#006699"]
    property var levelModel: ["0 级", "1 级", "2 级 ","3 级","4 级","5 级"]
    property var standardText: ["无可测知的肌肉收缩 ", "有轻微收缩，但不能引起关节运动", "在减重状态下能作关节全范围运动 ","能杭重力作关节全范围运动，但不能抗阻力","能抗重力、抗一定阻力运动","能抗重力、抗充分阻力运动"]
    property var nameText: ["零（Zero，０）", "微缩（Trace，Ｔ）", "差（Poor，P） ","可（Fair，F）","良好（Good，G）","正常（Norlna1，N）"]

    Column {   //整体布局
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
                text: "康复评估"
                style: "headline"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: dp(96)
            }
        } //View

        Component.onCompleted: {
            tabView.addTab("认知评定",tabContent_cong);
            tabView.addTab("肌力评定",tabContent_muscle);
            tabView.addTab("ROM评定",tabContent_rom);
        }

        TabView {
              id: tabView
              anchors{
                top: parent.top
                topMargin: dp(136)
                horizontalCenter: parent.horizontalCenter
              }
              width: dp(1500)
              height: dp(700)

              style: TabViewStyle {
                  tab: Rectangle {
                      color: styleData.selected ? "#FFFFFF" :"#EEEEEE"

                      implicitWidth: dp(200)
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
    Connections {
        target: tabView;
        onCurrentIndexChanged: {
            console.log(tabView.currentIndex+" is clicked!");
            if(tabView.currentIndex==2){
                serialHandler.openPort();
            }
        }
    }
    Component {
        id: tabContent_rom
        Rectangle {
            anchors.fill: parent
            color: "#FFFFFF"

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: dp(20)
                spacing: dp(20)
                Icon {
                    name: "awesome/list_ul"
                    size: dp(28)
                    color: Theme.accentColor
                }

                Text {
                    id: name
                    text: qsTr("1 / 5")
                    font.pixelSize: dp(22)
                }
            }
            Rectangle {
                id: rect
                width: dp(500)
                height: dp(500)
                x: dp(160)
                y: dp(89)
                Column {
                    anchors.centerIn: parent
                    spacing: dp(68)
                    Label {
                        id: romText
                        text: "肩关节屈曲/伸展"
                        style: "title"
                    }
                    Image {
                        id: romPic
                        width: dp(320)
                        height: dp(320)
                        source: "images/SH1.png"

                    }
                }
            }
            GridLayout {
                id: romResult
                anchors.left: rect.right
                anchors.leftMargin: dp(100)
                anchors.top: rect.top
                anchors.topMargin: dp(80)
                width: dp(500)
                rows: 6
                columns: 2
                rowSpacing: dp(5)

                Label {
                    text: "肩关节屈曲"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    color: colorRect[0]
                    value: reporthandler.getShoulderSF
                }

                Label {
                    text: "肩关节伸展"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    color: colorRect[1]
                    value: reporthandler.getShoulderSS
                }
                Label {
                    text: "肩关节外展"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    color: colorRect[2]
                    value: reporthandler.getShoulderPF
                }
                Label {
                    text: "肩关节内收"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    color: colorRect[3]
                    value: reporthandler.getShoulderPS
                }
                Label {
                    text: "肘关节屈曲"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    color: colorRect[4]
                    value: reporthandler.getElbowSF
                }
                Label {
                    text: "肘关节伸展"
                    style: "title"
                }
                Slider {
                    numericValueLabel: true
                    stepSize: 1
                    minimumValue: 0
                    maximumValue: 100
                    alwaysShowValueLabel: true
                    knobLabel: value
                    color: colorRect[5]
                    value: reporthandler.getElbowSS
                }

            }
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                IconButton {
                    iconName: "awesome/angle_left"
                    size: dp(56)
                    onClicked: {
                        if(countROM==1)
                        {
                            tipmess.text = "这是第一个测试哦"
                            tipmess.open();
                            return;
                        }
                        if(countROM==2)
                        {
                            countROM--;
                            romPic.source="images/SH1.png";
                            romText.text = "肘关节屈曲/伸展"
                            return;
                        }
                        if(countROM==3)
                        {
                            countROM--;
                            romPic.source ="images/SH2.png";
                            romText.text = "肩关节内收/外展"
                            return;
                        }
                    }
                }
            }
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 60
                IconButton {
                    iconName: "awesome/angle_right"
                    size: dp(56)
                    onClicked: {
                        if(countROM==1)
                        {
                            countROM++;
                            romPic.source ="images/SH2.png";
                            romText.text = "肩关节内收/外展"
                            return;
                        }
                        if(countROM==2)
                        {
                            countROM++;
                            romPic.source="images/EL1.png";
                            romText.text = "肘关节屈曲/伸展"
                            return;
                        }
                        if(countROM==3)
                        {
                            tipmess.text = "这是最后测试哦"
                            tipmess.open();
                        }
                    }
                }
            }
        }
    }//tabContent_rom

    Component {
        id: tabContent_muscle
        Rectangle {
            width: dp(800)
            height: dp(500)
            anchors.fill: parent
            color: "#FFFFFF"

            Label {
                anchors.top: parent.top
                anchors.topMargin: dp(100)
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Lovett 分级法评定标准"
                style: "title"
            }

            Column {
                id: radioBtn
                anchors.left: parent.left
                anchors.leftMargin: dp(300)
                anchors.top: parent.top
                anchors.topMargin: dp(200)
                spacing: dp(10)

                ExclusiveGroup { id: optionGroup }
                Repeater {
                    model: 6
                    RadioButton {
                        checked: false
                        text: levelModel[index]
                        exclusiveGroup: optionGroup
                        color: colorRect[index]
                        onClicked: musLevel= index;
                    }
                }
            } //radioBtn Column
            Column {
                id: colorTip
                anchors.left: radioBtn.right
                anchors.leftMargin: dp(30)
                anchors.top: parent.top
                anchors.topMargin: dp(200)
                spacing: dp(10)
                Repeater {
                    model: 6
                    Rectangle {
                        width: dp(5); height: dp(48)
                        radius: dp(2)
                        color: colorRect[index]
                    }
                }
            }//colorTip Column

            Column {
                id: nameTip
                anchors.left: colorTip.right
                anchors.leftMargin: dp(20)
                anchors.top: parent.top
                anchors.topMargin: dp(220)
                spacing: dp(38)
                Repeater {
                    model: 6
                    Label {
                        text: nameText[index]//standardText
                        style: "title"
                    }
                }
            }//nameTip Column

            Column {
                id: standardTip
                anchors.left: nameTip.right
                anchors.leftMargin: dp(50)
                anchors.top: parent.top
                anchors.topMargin: dp(220)
                spacing: dp(38)
                Repeater {
                    model: 6
                    Label {
                        text: standardText[index]//standardText
                        style: "title"
                    }
                }
            }//nameTip Column
        }

//        MusComponent {
//            anchors.fill: parent
//        }
    }//tabContent_muscle


    Component {
        id: tabContent_cong
        Rectangle {
            anchors.fill: parent
            color: "#FFFFFF"
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: dp(20)
                spacing: dp(20)
                Icon {
                    name: "awesome/list_ul"
                    size: dp(28)
                    color: Theme.accentColor
                }

                Text {
                    id: name
                    text: qsTr(count+" / 12")
                    font.pixelSize: dp(22)
                    color: Theme.accentColor
                }
            }
            Label {
                id: context
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: dp(150)
                text: "请说出今年的年份\n\n现在是什么季节\n\n现在是几月份\n\n今天是几号\n\n今天是星期几"
                style: "title"
            }
            Image {
                id: pic
                anchors.top: context.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                visible: count == 12? true: false
                source: "images/shape.bmp"
            }
            Row {
                id: radioCon
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 120
                spacing: dp(10)

                ExclusiveGroup { id: optioncConGroup }
                Repeater {
                    model: 6
                    RadioButton {
                        checked: false
                        text: scoreModel[index]
                        exclusiveGroup: optioncConGroup
                        color: colorRect[index]
                        onClicked: tempScore= index;
                    }
                }
            }
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                IconButton {
                    iconName: "awesome/angle_left"
                    size: dp(56)
                    onClicked: {
                        conScore -= tempScore;
                        if(count ==1){
                            tipmess.text = "这是第一题哦"
                            tipmess.open();
                            return;
                        }
                        if(count ==2){
                            count--;
                            context.text = "请说出今年的年份\n\n现在是什么季节\n\n现在是几月份\n\n今天是几号\n\n今天是星期几"
                            return;
                        }
                        if(count ==3){
                            count--;
                            context.text = "这是什么城市（名）\n\n这是什么区(城区名)\n\n这是什么医院(医院名或胡同名)?\n\n这是第几层楼\n\n这是什么地方(地址、门牌号)"
                            return;
                        }
                        if(count ==4){
                            count--;
                            context.text = "现在我告诉您三种东西的名称，我说完后请您重复一遍。\n\n请您记住这三种东西，过一会儿我还要问您(请说清楚。每样东西一秒钟)。\n\n 例如告诉这三种东西是：“树”、“钟”、“汽车”。请您重复"
                            return;
                        }
                        if(count ==5){
                            count--;
                            context.text = "现在请您算一算，从100 中减去7，然后从所得的数算下去，\n\n请您将每减一个7后的答案告诉我，直到我说“停”为止。"
                            return;
                        }
                        if(count ==6){
                            count--;
                            context.text = "现在请您说出刚才我让您记住的是哪三种东西?\n\n每正确说出一样得1分"
                            return;
                        }
                        if(count ==7){
                            count--;
                            context.text = "检查者出示手表问患者这是什么?\n\n能正确说出得1分，不能正确说出0分。"
                            return;
                        }
                        if(count ==8){
                            count--;
                            context.text = "检查者出示铅笔问患者这是什么?能正确说出得1分，不能正确说出0分。"
                            return;
                        }
                        if(count ==9){
                            count--;
                            context.text = "请您跟我说“四十四只石狮子”\n\n能正确说出得1分，不能正确说出0分。"
                            return;
                        }
                        if(count ==10){
                            count--;
                            context.text = "检查者给受试者一张卡片,上面写着“请闭上您的眼睛”，\n\n请您念一念这句话，并按上面的意思去做。\n\n能正确说出并能做到得1分，不正确说出，也不能做到0分"
                            return;
                        }
                        if(count ==11){
                            count--;
                            context.text = "我给您一张纸，请您按我说的去做。现在开始：\n\n用右手那拿着这张纸；\n\n用两只手把它对折起来；\n\n放在您的左腿上\n\n"
                            return;
                        }
                        if(count ==12){
                            count--;
                            context.text = "请您给我写一个完整的句子"
                            return;
                        }
                    }
                }
            }
            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 60
                IconButton {
                    iconName: "awesome/angle_right"
                    size: dp(56)
                    onClicked: {
                        conScore += tempScore;
                        if(count ==1){
                            count++;
                            context.text = "这是什么城市（名）\n\n这是什么区(城区名)\n\n这是什么医院(医院名或胡同名)?\n\n这是第几层楼\n\n这是什么地方(地址、门牌号)"
                            return;
                        }
                        if(count ==2){
                            count++;
                            context.text = "现在我告诉您三种东西的名称，我说完后请您重复一遍。\n\n请您记住这三种东西，过一会儿我还要问您(请说清楚。每样东西一秒钟)。\n\n 例如告诉这三种东西是：“树”、“钟”、“汽车”。请您重复"
                            return;
                        }
                        if(count ==3){
                            count++;
                            context.text = "现在请您算一算，从100 中减去7，然后从所得的数算下去，\n\n请您将每减一个7后的答案告诉我，直到我说“停”为止。"
                            return;
                        }
                        if(count ==4){
                            count++;
                            context.text = "现在请您说出刚才我让您记住的是哪三种东西?\n\n每正确说出一样得1分"
                            return;
                        }
                        if(count ==5){
                            count++;
                            context.text = "检查者出示手表问患者这是什么?\n\n能正确说出得1分，不能正确说出0分。"
                            return;
                        }
                        if(count ==6){
                            count++;
                            context.text = "检查者出示铅笔问患者这是什么?\n\n能正确说出得1分，不能正确说出0分。"
                            return;
                        }
                        if(count ==7){
                            count++;
                            context.text = "请您跟我说“四十四只石狮子”\n\n能正确说出得1分，不能正确说出0分。"
                            return;
                        }
                        if(count ==8){
                            count++;
                            context.text = "检查者给受试者一张卡片,上面写着“请闭上您的眼睛”，\n\n请您念一念这句话，并按上面的意思去做。\n\n能正确说出并能做到得1分，不正确说出，也不能做到0分"
                            return;
                        }
                        if(count ==9){
                            count++;
                            context.text = "我给您一张纸，请您按我说的去做。现在开始：\n\n用右手那拿着这张纸；\n\n用两只手把它对折起来；\n\n放在您的左腿上\n\n"
                            return;
                        }
                        if(count ==10){
                            count++;
                            context.text = "请您给我写一个完整的句子"
                            return;
                        }
                        if(count ==11){
                            count++;
                            context.text = "请您照着图案样子把它画下来。\n\n（只有绘出两个五边形的图案，交叉处形成1个小四边形，才算对）"
                            return;
                        }
                        if(count ==12){
                            console.info("conScore");
                            console.info(conScore);
                            tipmess.text = "本次MMSE得分"+conScore+"分";
                            tipmess.open();
                            return;
                        }
                    }
                }
            }
        }
    }//tabContent_cong
    Dialog {
        id: tipmess
        text : "已经是最后一题"
    }

    Button {
        text: "结束评定"
        anchors{
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: dp(100)
        }
        width: dp(150)
        backgroundColor: Theme.accentColor
        onClicked: {
           console.info("结束评定");
           pageSwitched("AssRomResult");
            //if(tabView.currentIndex == 1)
            //else if(tabView.currentIndex == 2)
       }
    }
}
