#include "MyClient.h"

#include <QHostAddress>

MyClient::MyClient(QSharedPointer<WebcamUi> _ui, QObject* parent):
    QObject(parent),
    _webcamUi{_ui}
{
    socket = new QTcpSocket();
}

MyClient::~MyClient()
{
    delete socket;
}

void MyClient::connect()
{

    //    socket->connectToHost(QHostAddress(QHostAddress::LocalHost), 54321,QIODevice::ReadWrite);
    socket->connectToHost("127.0.0.1", 54321);
    if (socket->waitForConnected(5000))
    {
        qDebug() << "Connected!";
    }
    else
    {
        qDebug() << "Not Connected!";
    }
}

void MyClient::sendData(QString selectedImagePath)
{
    connect();
    //    socket->write("hello server \r\n\r\n");
    QByteArray ba = loadSelectedImage(selectedImagePath);
    socket->write(ba);
    socket->waitForBytesWritten(1000);
    socket->waitForReadyRead(3000);
    //    qDebug() << "reading" << socket->bytesAvailable();
    //    qDebug() << "read all" << socket->readAll();
    socket->close();
}

QByteArray MyClient::loadSelectedImage(QString selectedImagePath)
{
    //    QImage * imageObject = new QImage();
    QImage imageObject;
    QPixmap image;
    QByteArray ba;
    if (imageObject.load(selectedImagePath))
    {
        image = QPixmap::fromImage(imageObject);
        QBuffer buffer(&ba);
        buffer.open(QIODevice::WriteOnly);
        image.save(&buffer, "jpg");
    }
    return ba;
}
