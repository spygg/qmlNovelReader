import QtQuick 2.6
import QtQuick.Window 2.0

Rectangle{
    id: titleRect;
    height: 32
    width: parent.width
    color: "#666";
    property Window mainWindow: null;

    FontLoader { id: localFont; source: "qrc:/fonts/fontawesome-webfont.ttf" }//加载本地字体

    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton //只处理鼠标左键
        property point clickPos: "0,0"
        onPressed: { //接收鼠标按下事件
            clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged: { //鼠标按下后改变位置
            if(mainWindow == null || mainWindow.visibility == Window.FullScreen)
                return;
            //鼠标偏移量
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)

            //如果mainwindow继承自QWidget,用setPos
            mainWindow.setX(mainWindow.x+delta.x)
            mainWindow.setY(mainWindow.y+delta.y)
        }
        onDoubleClicked: {
            if(mainWindow.visibility == Window.Maximized)
            {
                mainWindow.showNormal();
            }
            else
            {
               mainWindow.visibility = Window.Maximized;
            }
        }
    }

//    Image{
//        id: titleImg
//        cache: true;
//        sourceSize.width: titleImg.width;
//        sourceSize.height: titleImg.height;
//        anchors.top: parent.top;
//        anchors.topMargin: 2;
//        anchors.left: parent.left;
//        anchors.leftMargin: 3

//        height: parent.height - 2
//        width: height


//        source:"qrc:/img/img/logo.png"
//    }


    Text{
        id:logo
        text: "\uf02d"
        color: "#0000FF"
        font.pixelSize: 22
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: 10
    }

    Text{
        id:tiltle
        text: "阅读器"
        color: "white"
        font.pixelSize: 16
        font.family: "Ubuntu"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: logo.right
        anchors.leftMargin: 10
    }

    Row{
        id: btnWindow
        spacing: 4;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.right: parent.right;
        anchors.rightMargin: 20;

        //min Button
        Rectangle{
            width : 20
            height: 20
            color: "#666"/*"#C62F2F"*/;
            Text{
                id: btnMin
                text : "\uf2d1"

                anchors.centerIn: parent
                font.pixelSize: 20
                font.family: localFont.name
                color: minArea.containsMouse ? "#FFFFFF" : "#00FF00";
            }
//            Rectangle{
//                id: btnMin
//                anchors.centerIn: parent
//                width: 15
//                height: 1
//                border.width: 1
//                border.color:  minArea.containsMouse ? "#FFFFFF" : "#E29595";
//                color: "#C62F2F";
//                radius: 2;
//            }

            MouseArea{
                id: minArea
                anchors.fill: parent;
                hoverEnabled: true;
                onReleased: {
                    console.log("min clicked!")
                    if(mainWindow == null)
                        return;
                     mainWindow.visibility = Window.Minimized;
                }
            }
        }

        //max button
        Rectangle{
            width : 20
            height: 20
            color: "#666";
            Text{
                id: btnMax
                text : mainWindow.visibility == Window.Maximized ? "\uf2d2" : "\uf2d0"

                anchors.centerIn: parent
                font.pixelSize: 20
                font.family: localFont.name
                color: maxArea.containsMouse ? "#FFFFFF" : "#00FF00";
            }
//            Rectangle{
//                id: btnMax
//                anchors.centerIn: parent
//                width: 15
//                height: 10
//                border.width: 1
//                border.color:  maxArea.containsMouse ? "#FFFFFF" : "#E29595";
//                color: "#C62F2F";
//                radius: 2;
//            }

            MouseArea{
                id: maxArea
                anchors.fill: parent;
                hoverEnabled: true

                onReleased: {

                    if(mainWindow == null)
                        return;
                    if(mainWindow.visibility == Window.Maximized)
                    {
                        console.log("show normal")
                        mainWindow.showNormal();
                    }
                    else
                    {
                        console.log("show Max")
//                        mainWindow.showMaximized();
                        mainWindow.visibility = Window.Maximized;
                    }
                }
            }
        }

        //close button
        Rectangle{
            width : 20
            height: 20
            color: "#666";
            Text{
                id: btnClose
                text : "\uf00d"

                anchors.centerIn: parent
                font.pixelSize: 26
                font.family: localFont.name
                color: closeArea.containsMouse ? "#FFFFFF" : "#999";
            }

            MouseArea{
                id: closeArea
                anchors.fill: parent;
                hoverEnabled: true;
                onReleased: {
                    console.log("close clicked!")
                    mainWindow.close();
                }
            }
        }
    }



}

