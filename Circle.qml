import QtQuick 2.6


Canvas {
    width: 400
    height: 400
    property var rCircle: 100
    property alias circleAnim: circleAnim
    onPaint: {
        var ctx = getContext("2d");
        ctx.lineWidth = 5;
        ctx.strokeStyle = "gray";
        ctx.beginPath();
        ctx.arc(200, 200, rCircle, Math.PI * 2, 0, false);
        ctx.stroke();
    }
    Rectangle {
        id: rect
        width: 20
        height: 20
        radius: 10
        color: "orange"
        x: 200-rCircle-10
        y: 200

        MouseArea {
            anchors.fill: parent
            id: mouseArea
            onClicked: circleAnim.start();
        }
        PathAnimation {
            id: circleAnim
            target: rect
            duration: 6000
            anchorPoint: "10,10"  //目标对象的哪一个点锚定在路径上
            orientationEntryDuration: 200  //用于设定完成这个旋转的时间周期
            orientationExitDuration: 200
            loops: Animation.Infinite
            orientation: PathAnimation.Fixed
            path: Path {
                startX: 200-rCircle;
                startY: 200;
                PathArc {

                    x: 200-rCircle
                    y: 199
                    useLargeArc: true;
                    radiusX: rCircle;
                    radiusY: rCircle;
                    direction: PathArc.Counterclockwise;
                }
            }
        }

    }
}
