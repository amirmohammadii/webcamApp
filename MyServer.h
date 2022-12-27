#ifndef MYSERVER_H
#define MYSERVER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>

class MyServer: public QObject
{
    Q_OBJECT
public:
    explicit MyServer( QObject* parent = nullptr);
    ~MyServer();

signals:
public slots:
    void newConnection();

private:
    QTcpServer* _server;
    QTcpSocket* _socket;


};

#endif // MYSERVER_H
