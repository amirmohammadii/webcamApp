#ifndef MYCLIENT_H
#define MYCLIENT_H

#include <QObject>
#include <WebcamUi.h>
#include <QTcpSocket>
#include <QImage>
#include <QPixmap>
#include <QBuffer>



class MyClient: public QObject
{
    Q_OBJECT
public:
    explicit MyClient(QSharedPointer<WebcamUi> _ui, QObject* parent = nullptr);
    void connect();
    void sendData(QString selectedImagePath);
    QByteArray loadSelectedImage(QString selectedImagePath);


signals:

public slots:

private:
    QTcpSocket* socket;
    QSharedPointer<WebcamUi> _webcamUi;
//    WebcamUi* _webcamUi;



};

#endif // MYCLIENT_H
