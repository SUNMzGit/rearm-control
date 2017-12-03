#ifndef SOCKETHANDLER_H
#define SOCKETHANDLER_H
#include <windows.h>
#include <QObject>
#include "socketanalyzer.h"
#include <QDebug>
#include <QTcpServer>
#include <QTcpSocket>
#include <QString>
#include <QTimer>

class SocketHandler : public QObject
{
    Q_OBJECT
public:
    explicit SocketHandler(QObject *parent = nullptr);

    Q_INVOKABLE void game();

signals:

public slots:
    void startRead();
    void acceptConnection();
    void timeoutslot();

private:
    QTcpServer  server;
    QTcpSocket *socket;
    socketAnalyzer *sockanalyzer;
    QByteArray receivedData;
    QString strtemp[4];
    int temp = 0;

    QTimer *timer;

};

#endif // SOCKETHANDLER_H
