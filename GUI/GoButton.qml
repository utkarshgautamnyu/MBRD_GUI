import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

// Button Template
Rectangle {
    id: gobutton
    signal clicked
    property string text

    BorderImage {
        id: buttonImage
        opacity: 0.5
        border.left: 15
        border.top: 4
        border.bottom: 4
        border.right: 15
        source: "images/toolbutton.png"
        width: 100; height:25
    }

    BorderImage {
        id: pressed
        opacity: 0
        border.left: 15
        border.top: 4
        border.bottom: 4
        border.right: 15
        source: "images/toolbutton.png"
        width: 100; height: 25
    }

    MouseArea {
        id: mouseRegion
        anchors.fill: buttonImage
        onClicked: {popup.close();}
    }

    Text {
        color: "white"
        anchors.centerIn: buttonImage; font.bold: true; font.pixelSize: 15
        text:gobutton.text;
        style: Text.Raised;
        styleColor: "black"
    }

    states: [
        State {
            name: "Pressed"
            when: mouseRegion.pressed === true
            PropertyChanges { target: pressed; opacity: 1 }
        }
    ]
}

