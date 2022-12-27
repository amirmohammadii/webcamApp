#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <WebcamUi.h>
#include <WebCamHandler.h>
#include <QSharedPointer>

int main(int argc, char *argv[])
{
    //    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QString savingDirectory = "/home/amir/WebcamImages"; // Change this directory according to your username

    QSharedPointer<WebcamUi> _view;
    _view = QSharedPointer<WebcamUi>::create();
    WebCamHandler _handler(_view, savingDirectory);

    QQuickView view;
    view.rootContext()->setContextProperty("bridge", _view.data());
    view.setSource(QUrl("qrc:/main.qml"));
    view.show();

    return app.exec();
}
