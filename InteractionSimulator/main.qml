import QtQuick 2.6
import QtQuick.Window 2.2
import QtLocation 5.10
import QtPositioning 5.6
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.3

Rectangle {
    implicitWidth: 350
    implicitHeight: 350
    color: "#343434"
    radius: 5
    opacity: 1

    MouseArea {
        id: mouseArea;
        anchors.fill: parent
        onDoubleClicked: communication.generateEvent(1,mouseX,mouseY,0)
        onWheel: {
            if (wheel.modifiers & Qt.ControlModifier)
                communication.generateEvent(3,mouseX,mouseY,wheel.angleDelta.y);
            else if (wheel.modifiers & Qt.ShiftModifier)
                communication.generateEvent(4,mouseX,mouseY,wheel.angleDelta.y)
            else
                communication.generateEvent(2,mouseX,mouseY,wheel.angleDelta.y)
        }

        onPositionChanged: {
            communication.generateEvent(5,mouseX,mouseY,0)
        }
    }

    MultiPointTouchArea {
        anchors.fill: parent
        mouseEnabled: false
        minimumTouchPoints: 1
        maximumTouchPoints: 2
        touchPoints: [
            TouchPoint { id: touch1 },
            TouchPoint { id: touch2 }
        ]
        PinchArea {
            anchors.fill: parent
            onPinchStarted: {
                if (pinch.rotation > pinch.angle) {
                    communication.generateEvent(4,pinch.center.x,pinch.center.y,pinch.rotation)
                } else {
                    communication.generateEvent(2,pinch.center.x,pinch.center.y,pinch.angle)
                }
            }
            onPinchUpdated: {
                if (pinch.rotation > pinch.angle) {
                    communication.generateEvent(4,pinch.center.x,pinch.center.y,pinch.rotation)
                } else {
                    communication.generateEvent(2,pinch.center.x,pinch.center.y,pinch.angle)
                }
            }
        }
    }
}



