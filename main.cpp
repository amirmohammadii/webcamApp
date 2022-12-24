#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <WebcamUi.h>
#include <WebCamHandler.h>

int main(int argc, char *argv[])
{
    //    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QSharedPointer<WebcamUi> _view;
    _view = QSharedPointer<WebcamUi>::create();
    WebCamHandler* _handler;
    _handler = new WebCamHandler(_view);
    QQuickView view;
    view.rootContext()->setContextProperty("bridge", _view.data());
    view.setSource(QUrl("qrc:/main.qml"));
    view.show();

    return app.exec();
}
