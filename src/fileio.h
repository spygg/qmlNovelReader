#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QObject>
#include <QTextStream>
#include <QFile>


class FileIO : public QObject
{
    Q_OBJECT
public:
    explicit FileIO(QObject *parent = nullptr);

    Q_PROPERTY(QString source
               WRITE setSource
               NOTIFY sourceChanged)


    Q_INVOKABLE QString readAll();
    Q_INVOKABLE QString readPage(int iPage);
    //Q_INVOKABLE bool write(const QString& data);



public slots:
    void setSource(const QString szFileName);

signals:
    void sourceChanged(const QString& szFileName);
    void error(const QString& msg);

private:
    QString m_szFileName;
    int m_iPage;
    qint64 m_iCurrentPos;
};

#endif // FILEIO_H
