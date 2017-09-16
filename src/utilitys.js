//.pragma library

function getScreenWidth()
{
    if (Qt.platform.os === "android" || Qt.platform.os === "ios")
    {
        return Screen.width;
    }
    else if(Qt.platform.os === "windows" ||
            Qt.platform.os === "linux" ||
            Qt.platform.os === "osx")
    {
        return 320;
    }
}


function getScreenHeight()
{
    if (Qt.platform.os === "android" || Qt.platform.os === "ios")
    {
        return Screen.height;
    }
    else if(Qt.platform.os === "windows" ||
                 Qt.platform.os === "linux" ||
                 Qt.platform.os === "osx")
    {

        return 600;
    }
}


function osType()
{
    if (Qt.platform.os === "android" || Qt.platform.os === "ios")
    {
        return 0;
    }
    else if(Qt.platform.os === "windows" ||
            Qt.platform.os === "linux" ||
            Qt.platform.os === "osx")
    {
        return 1;
    }
}


