import QtQuick 2.0
Item {
    id: player
    property int  valY: 0

    focus: true
    property int maxY: 0
    onYChanged: {
        valY = y
        if (y > maxY){

            y=maxY}
        else if (y < 0)
            y = 0
    }

    Image {
        id: person
        source: "assets/Person/bird.png"
        anchors.fill: parent
    }

    Timer {
        id: gravity
        repeat: true
        interval: 1000
        running: true

        onTriggered: {
            parent.y += 50
        }
    }
    Keys.onSpacePressed: y-=100

    Behavior on y {
        NumberAnimation {duration: 1000}
    }

    Text {
        text: player.x + " : " + player.y
        font.pixelSize: 40
    }
}
