import QtQuick 2.5
import QtQuick.Window 2.2




Window {

    id: game
    visible: true
    width: 800
    height: 600
    title: qsTr("Run2.0")
    property bool initialized: false
    property int globalX: bg.x
    property int collision: 0
    property int count: 0

    signal restartobstacle()
    signal boomSignal()
    onBoomSignal: {
        collision++
        obstacles.clear()
        console.log("boomSignal в main работает "+collision)
        if (collision == 3){
            bg.stop()
            console.log("останавливаем экран при 3 столкновении")
        }
    }

    /*signal stop()

    onStop: {
        bg.stop()
        console.log("конец "+collision)
}*/

    Background {
        id: bg
    }
    /*Obstacle {
        id: obs
        visible: false
    }*/

    Text{
        text: collision + " столкновений"
        color: "white"
        font.pixelSize: 40
        x: 900
        y: 10
    }
    ListModel {
        id: obstacles
        /*ListElement {ox: 1000; oy: 0; speed: 1; source1: "assets/Obstacles/rocket2.png"}
        ListElement {ox: 1000; oy: 100; speed: 2; source1: "assets/Obstacles/rocket.png"}
        ListElement {ox: 2000; oy: 200; speed: 5; source1: "assets/Obstacles/rocket2.png"}
        ListElement {ox: 3000; oy: 300; speed: 3; source1: "assets/Obstacles/rocket4.png"}
        ListElement {ox: 4000; oy: 400; speed: 8; source1: "assets/Obstacles/rocket.png"}*/
    }



    Repeater {
        model: obstacles
        Obstacle {

            x: ox + globalX*speed
            y: oy

            playerX: player.x
            playerY: player.y
            playerW: player.width
            playerH: player.height
            source: source1



            Component.onCompleted: {
                boomSignal.connect(player.boomSignal)
                boomSignal.connect(game.boomSignal)
                game.restartobstacle.connect(restartobstacle)
                //restartobstacle.connect(game.restartobstacle)
                //stop.connect(player.stop)


            }
        }
    }

    Timer{
             running: true
             repeat: true
             id: rocketT
             interval: 1000
             onTriggered: {obstacles.append({"ox": 1000 * count , "oy": player.y, speed: 2, source1: "assets/Obstacles/rocket2.png"} ), count+=1}
         }



    Player {
        id: player
        y: game.height/2
        width: 50
        height: 50
        maxY: game.height - height
        collision: game.collision


    }

    Text {
        text: globalX
        color: "white"
        font.pixelSize: 64
    }

    /*MouseArea {
        id:mArea
        anchors.fill: parent
        onClicked: {
            bg.stop()


        }

    }*/



    Rectangle {
        id: rect
        width: 100; height: 100
        x: 400
        y: 10
        color: "black"
        border.color:  "black"
        Text{
            text: "Restart!"
            color: "white"
            font.pixelSize: 20
            x: 15
            y: 35

        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onClicked: {
                console.log("Restart!")
                restart()
                //game.
            }
            onEntered: {
                console.log("цвет1")
                parent.border.color = "white"

            }
            onExited: {
                console.log("цвет2")
                parent.border.color = "black"
            }
        }
    }




    function restart(){
        //game.initialized = true
        //game.globalX = bg.x
        game.collision = 0
        bg.restart()
        //obs.restart()
        //player.restart()
        player.y = 300
        //obs.restart()
        restartobstacle()
        count = 0
        obstacles.clear()








    }



}

