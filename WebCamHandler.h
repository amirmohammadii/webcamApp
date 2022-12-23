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

    QStringList readImages(QDir dir);
    QDir createPath();

public slots:
    void onBtnCaptureClicked();
    void onBtnSendClicked();

private:
    WebcamUi* _webcamui;
    MyClient*  _client;

};

#endif // WEBCAMHANDLER_H
