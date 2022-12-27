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
    ~MyClient();
    ///
    /// \brief connect
    ///This function init connection of client
    void connect();
    ///
    /// \brief sendData
    /// This function will send a selected image to a server.
    /// \param selectedImagePath: full path of selected image.
    ///
    void sendData(QString selectedImagePath);
    ///
    /// \brief loadSelectedImage
    /// This function load the selected image form it's directory
    /// \param selectedImagePath
    /// \return QByteArray of selected image
    ///
    QByteArray loadSelectedImage(QString selectedImagePath);


private:
    QTcpSocket* socket;
    QSharedPointer<WebcamUi> _webcamUi;



};

#endif // MYCLIENT_H
