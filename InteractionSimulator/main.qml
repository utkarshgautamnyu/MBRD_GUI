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
        onReleased: communication.generateEvent(0,mouseX,mouseY,0)
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
            communication.generateEvent(0,mouseX,mouseY,0)
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

        onPressed: {
            if (touch1.pressed && !touch2.pressed) {
                communication.detectDoubleTap(touch1.x,touch1.y);
            } else if (touch2.pressed && !touch1.pressed) {
                communication.detectDoubleTap(touch2.x,touch2.y);
            } else {
                communication.generateTouchEvent(touch1.x,touch1.y,touch2.x,touch2.y,touch1.rotation,touch2.rotation)
            }
        }
        onTouchUpdated:  {
            if (touch1.pressed && !touch2.pressed) {
                communication.generateEvent(5,touch1.sceneX,touch2.sceneY,0);
            } else {
                communication.generateTouchEvent(touch1.x,touch1.y,touch2.x,touch2.y,touch1.rotation,touch2.rotation)
            }
        }
    }
}



