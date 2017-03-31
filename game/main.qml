import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    id:root
    visible: true
    width: 1600
    height: 600
    title: qsTr("Run game")

    property bool initialized: false
    signal birdPositionChanged
//    property int maxY: 0

    Background {
        id: background
        width: background.width
        anchors.fill: parent
    }

    Ground {
        anchors.fill: parent
    }

    Player {

        x: root.width / 2
        y: root.height / 2
        width: 34
        height: 24
        maxY: root.height - height - 10
    }

}
