import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

//Overlay Template
Dialog {
    id: popup
    parent: Overlay.overlay
    background: Rectangle {
        implicitWidth: 350
        implicitHeight: 320
        radius: 10
        color: "#343434"
        opacity: 0.8
    }
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    modal: true
    focus: true
    enter: Transition {
        NumberAnimation {
            property: "opacity";
            from: 0.0;
            to: 1.0
        }
    }
    exit: Transition {
        NumberAnimation {
            property: "opacity";
            from: 1.0;
            to: 0.0
        }
    }
    ColumnLayout {
        Layout.margins: 20
        spacing: 25
        anchors {
            top: parent.top;
            left: parent.left;
            right: parent.right;
        }
        InputText {
            id: destination;
            placeholderText: "Where to?"
            Layout.fillWidth: true;
            font.pointSize: 14;
            font.family: "Helvetica"
        }
        InputText {
            id: start;
            placeholderText: "Your location";
            Layout.fillWidth: true;
            font.pointSize: 14;
            font.family: "Helvetica"
        }
        GoButton{
            x: start.x + 110;
            y: start.y + 50;
            text: "Start"
        }
    }

    ColumnLayout {
        Layout.margins: 10
        spacing: 25
        anchors {
            left: parent.left;
            right: parent.right;
        }
        y:start.y+100
        InputText {
            id: search;
            placeholderText: "Search Places of Interest";
            Layout.fillWidth: true;
            font.pointSize: 14;
            font.family: "Helvetica"
        }

        GoButton{
            x: start.x + 110;
            y: start.y + 2;
            text: "Search"
        }
    }
}


