import QtQuick 2.0
import QtQuick.Window 2.5
import QtLocation 5.10
import QtPositioning 5.6
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.3

// Application landing page
Item {
    width: 512
    height: 512
    visible: true
    Plugin {
        id: mapPlugin
        name: "here"
        PluginParameter { name: "here.app_id"; value: "gcuLPqoUPq9AC7tY2qf5" }
        PluginParameter { name: "here.token"; value: "uM6kDYyx5hm8XNn9kl_W8Q" }
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(37.36, -122.03) // Sunnyvale
        zoomLevel: 12
        gesture.acceptedGestures: MapGestureArea.PanGesture | MapGestureArea.FlickGesture
                                  | MapGestureArea.PinchGesture | MapGestureArea.RotationGesture
                                  | MapGestureArea.TiltGesture
        gesture.flickDeceleration: 3000
        gesture.enabled: true
        focus: true

        MouseArea {
            property var isPopupOpen : false
            id: mouseArea;
            anchors.fill: map
            onDoubleClicked: {
                if (isPopupOpen) {
                    popup.close();
                    isPopupOpen: false
                } else {
                    popup.open()
                    isPopupOpen : true
                }
            }
            hoverEnabled: false
        }
    }
    Overlay {
        id:popup
    }
}








