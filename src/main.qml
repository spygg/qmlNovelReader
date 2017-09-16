import QtQuick 2.6
import QtQuick.Window 2.2
import "utilitys.js" as Utilitys
import FileIO 1.0

Window {
    id: mainWindow

    flags: Qt.Window | Qt.FramelessWindowHint

    width: Utilitys.getScreenWidth()
    height: Utilitys.getScreenHeight()

    visible: true
    color: "#666666"

    Rectangle{
        anchors.centerIn: parent;
        width: mainWindow.width;
        height: mainWindow.height;
        radius: 5

        TitleBar{
            id: titleBar;
            visible: Utilitys.osType()
            mainWindow: mainWindow;
            width: parent.width;
            height: 32;
        }

        MainWidget{
            anchors.top: titleBar.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.bottom:parent.bottom;
        }

        Component.onCompleted: {
            //console.log(height)
        }
    }


}
