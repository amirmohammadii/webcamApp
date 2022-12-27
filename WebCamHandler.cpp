#include "WebCamHandler.h"
#include <QStringList>

WebCamHandler::WebCamHandler(QSharedPointer<WebcamUi> _ui, QString myPath, QObject* parent):
    _webcamui{_ui},
    QObject(parent),
    _path{myPath}
{
    // ### connect signals and slots ### //
    connect(_webcamui.data(), &WebcamUi::btnCaptureClicked, this, &WebCamHandler::onBtnCaptureClicked);
    connect(_webcamui.data(), &WebcamUi::btnSendClicked, this, &WebCamHandler::onBtnSendClicked);
    connect(_webcamui.data(), &WebcamUi::radioBtnGalleryClicked, this, &WebCamHandler::onRadioBtnGalleryclicked);

    QDir dir = createDir(this->path());
    _webcamui->setImagesPath(dir.absolutePath());
    QStringList  images =  readImages(dir);
    _webcamui->setImagesList(images);
}

WebCamHandler::~WebCamHandler()
{
    //    delete _webcamui;
    //    delete _client;
}

QStringList WebCamHandler::readImages(QDir dir)
{
    QStringList images = dir.entryList(QStringList() << "*.jpg" << "*.JPG", QDir::Files);
    return  images;
}

QDir WebCamHandler::createDir(QString myPath)
{
    QDir dir(myPath);
    if (!dir.exists())
    {
        dir.mkdir(".");
        dir.mkpath(myPath);
    }
    return dir;
}

void WebCamHandler::onBtnCaptureClicked()
{
    _webcamui->setPhotoCounter(_webcamui->photoCounter()+1);
}

void WebCamHandler::onBtnSendClicked()
{
    _client->sendData(_webcamui->selectedImagePath());
}

void WebCamHandler::onRadioBtnGalleryclicked()
{
    QStringList images = readImages(this->path());
    _webcamui->setImagesList(images);
}
