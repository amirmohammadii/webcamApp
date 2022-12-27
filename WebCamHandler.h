#ifndef WEBCAMHANDLER_H
#define WEBCAMHANDLER_H
#include <QDir>
#include <QDebug>
#include <QSharedPointer>
#include <QObject>
#include <WebcamUi.h>
#include <MyClient.h>
#include <MyServer.h>

class WebCamHandler:public QObject
{
    Q_OBJECT
public:
    explicit WebCamHandler(QSharedPointer<WebcamUi> _ui, QString myPath, QObject* parent = nullptr);
    ~WebCamHandler();
    ///
    /// \brief readImages
    /// \param dir: direcoty that contains captured photos.
    /// \return a list of captured images.
    ///
    QStringList readImages(QDir dir);
    ///
    /// \brief createDir
    /// \return return the created a directory that images will save in it.
    ///
    QDir createDir(QString myPath);
    ///
    /// \brief path
    /// Getter for get the directory witch images will save in it.
    /// \return
    ///
    QString path() {return _path;}

public slots:
    ///
    /// \brief onBtnCaptureClicked
    ///This function call when the "Take Photo" clicked
    ///
    void onBtnCaptureClicked();
    ///
    /// \brief onBtnSendClicked
    ///This function call will "Send" button  clicked
    void onBtnSendClicked();
    ///
    /// \brief onRadioBtnGalleryclicked
    /// This function will reload stored images to show in "Gallery" tab
    void onRadioBtnGalleryclicked();

private:
    //    WebcamUi* _webcamui;
    //    MyClient*  _client;
    QString _path;
    QSharedPointer<MyClient> _client;
    QSharedPointer<WebcamUi> _webcamui;

};

#endif // WEBCAMHANDLER_H
