import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
Item {

    property var title: "title"
    property var value: "value"

    RowLayout {
        spacing: 20
        Label {
            text: title
            font.pixelSize: 26
        }
        TextField {
            text: value
            font.pixelSize: 24
            Layout.preferredWidth: 80
        }
    }
}
