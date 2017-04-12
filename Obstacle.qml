import QtQuick 2.0


Item {
    id: obstacle
   //property bool collision: false

    property int playerX: 0
    property int playerY: 0
    property int playerW: 0
    property int playerH: 0

    onXChanged: {
        if (x + rocket.width <= playerX && x >= playerX
         && y + rocket.height <= playerY && y >= playerY)
            console.log("Boom")
    }

    Image {
        id: rocket
        width: 100;   height: 80; rotation: -90
        source: "assets/Obstacles/rocket.png"
    }

    Text {
        text: obstacle.x + " : " + obstacle.y
        font.pixelSize: 40
    }

//    Timer{
//        running: true
//        repeat: true
//        id: rocketT
//        interval: 500

//        onTriggered: {
//            parent.x -= 300
//        }
//    }

//    Behavior on x{
//        NumberAnimation{duration: 1000}
//    }
}
