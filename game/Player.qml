<<<<<<< HEAD
import QtQuick 2.0
Item {
    id: player
    focus: true

    property int collision: 0
    property int maxY: 0
    property int  valY: 0
    //signal stop()


    signal boomSignal()
    onBoomSignal: {


        collision++
        console.log("player"+collision)

    }

    onYChanged: {

        if (collision == 3){
            player.state = "Death"

            //console.log("умер"+collision)
        }

        valY = y
        if (y > maxY) {y=maxY}
        else if (y < 0) {y = 0}

//Невозможно передать переменную collision в Player'а
    }
    //Состояния
    states:
        State{
        name:"Death"
        when: Obstacle.collision > 0//mArea.pressed === true//сравнивание координат игрока и ракеты.
        PropertyChanges {
//            target: player
//            x:50
//            rotation:960
            target: person
            source:"assets/Person/deadbird.png"
            x:50
            rotation:760
            }
        }
        State{
        name:"Alive"

        PropertyChanges {

            target: person
            source:"assets/Person/bird.png"


            }
        }
    //Переходы состояний
    transitions: Transition {
        from: ""
        to: "Death"
        reversible: false
        ParallelAnimation{
            NumberAnimation{
                properties: "x,rotation"
                duration: 1000
                easing.type: Easing.InOutBounce
            }
        }
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
            parent.y += 200
        }

    }
    Keys.onSpacePressed: y -= 200

    Behavior on y {
        NumberAnimation {duration: 1000}
    }

    Text {
        text: player.x + " : " + player.y
        font.pixelSize: 40
    }
    function restart() {


        player.y = 300
        player.state = "Alive"

    }
}

=======
import QtQuick 2.0
Item {
    focus: true
    property int maxY: 0
    onYChanged: {
        if (y > maxY)
            y=maxY
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
}
>>>>>>> origin/Alexey
