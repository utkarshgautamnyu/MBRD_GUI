import QtQuick 2.0
import QtQuick.Window 2.5
import QtLocation 5.10
import QtPositioning 5.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

// Text Field Template
TextField {
    id: clearable
    style: TextFieldStyle {
        textColor: "black"
        background: Rectangle {
            radius: 5
            implicitWidth: 250
            implicitHeight: 35
            border.color: "steelblue"
            border.width: 2
        }
    }

    Image {
        anchors {top: parent.top; right: parent.right}
        id: clearText
        fillMode: Image.PreserveAspectFit
        smooth: true;
        visible: clearable.text
        source: "images/clear.svg"
        height: parent.height/2
        width: parent.height/2

        MouseArea {
            id: clear
            anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter }
            height: clearable.height; width: clearable.height
            onClicked: {
                clearable.text = ""
                clearable.forceActiveFocus()
            }
        }
    }
}
