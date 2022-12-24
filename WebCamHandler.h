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
   explicit WebCamHandler(QSharedPointer<WebcamUi> _ui, QObject* parent = nullptr);

    ///
    /// \brief readImages
    /// \param dir: direcoty that contains captured photos.
    /// \return a list of captured images.
    ///
    QStringList readImages(QDir dir);
    ///
    /// \brief createPath
    /// \return return the created a directory that images will save in it.
    ///
    QDir createPath();

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

private:
    WebcamUi* _webcamui;
    MyClient*  _client;

};

#endif // WEBCAMHANDLER_H
