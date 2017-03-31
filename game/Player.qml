import QtQuick 2.0

Item {
    focus: true
    property int maxY: 0
//    onYChanged: {
//            if (y > maxY)
//                y=maxY
//            else if (y < 0)
//                y = 0
//    }
    Image {

        id: player
        source: "assets/Player/bird.png"
        anchors.fill: parent
    }


    Timer {
        id: gravity
        repeat: true
        interval: 1000
        running: true

        onTriggered: {
            player.y += 20
        }
    }
    Keys.onSpacePressed: y = 50



    Behavior on y {
        NumberAnimation {duration: 1000}
    }
}

