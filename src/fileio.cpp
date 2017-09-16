#include "fileio.h"

FileIO::FileIO(QObject *parent) : QObject(parent)
{
    m_iCurrentPos = 0;
}


QString FileIO::readAll()
{
    if (m_szFileName.isEmpty()){
        emit error("source is empty");
        return QString();
    }

    QFile file(m_szFileName);
    QString szFileContent;
    if ( file.open(QIODevice::ReadOnly) )
    {
        QString line;
        QTextStream t( &file );
        do
        {
            line = t.readLine();
            szFileContent += line;
            szFileContent += "\n";

        } while (!line.isNull());

        file.close();
    }
    else
    {
        emit error("Unable to open the file");
        return QString();
    }

    return szFileContent;
}


QString FileIO::readPage(int iPage)
{
    if (m_szFileName.isEmpty()){
        emit error("source is empty");
        return QString();
    }

    QFile file(m_szFileName);
    QString szFileContent;
    if ( file.open(QIODevice::ReadOnly) )
    {
        file.seek(m_iCurrentPos);
        QString line;
        QTextStream t( &file );

        //行
        for(int i = 0; i < 8; i++)
        {
            line = t.readLine();
            szFileContent += line;
            szFileContent += "\n";

        }

        m_iCurrentPos = file.pos();

        file.close();
    }
    else
    {
        emit error("Unable to open the file");
        return QString();
    }

    return szFileContent;

}

QString FileIO::readAWord()
{
    if (m_szFileName.isEmpty()){
        emit error("source is empty");
        return QString();
    }

    QFile file(m_szFileName);
    QString szFileContent;
    if ( file.open(QIODevice::ReadOnly) )
    {
        file.seek(m_iCurrentPos);
        QString line;
        QTextStream t( &file );

        //行
        for(int i = 0; i < 8; i++)
        {
            line = t.readLine();
            szFileContent += line;
            szFileContent += "\n";

        }

        m_iCurrentPos = file.pos();

        file.close();
    }
    else
    {
        emit error("Unable to open the file");
        return QString();
    }

    return szFileContent;
}

void FileIO::setFileName(const QString szFileName)
{
    m_szFileName = szFileName;
    m_iCurrentPos = 0;
}

QString FileIO::getFileName()
{
    return m_szFileName;
}
