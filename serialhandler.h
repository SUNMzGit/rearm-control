#ifndef SERIALHANDLER_H
#define SERIALHANDLER_H

#include <QObject>
#include <QtSerialPort/QSerialPort>
class SerialHandler : public QObject
{
    Q_OBJECT
    // Q_PROPERTY(QString receivedata READ receivedata WRITE setreceivedata NOTIFY receivedataChanged)//从串口收到的数据
public:
    explicit SerialHandler(QObject *parent = nullptr);

    struct Settings {//端口设定结构体
        QString name;
        qint32 baudRate;
        QSerialPort::DataBits dataBits;
        QSerialPort::Parity parity;
        QSerialPort::StopBits stopBits;
        QSerialPort::FlowControl flowControl;
    };


//    QString receivedata(void);
//    void setreceivedata(QString receivedata);

    void analysis(QByteArray request,int reqLen);

    Q_INVOKABLE void closePort();//关闭端口;
    Q_INVOKABLE void openPort();//打开端口;
    Q_INVOKABLE void sendto(int flag);//发送数据;


signals:
    void receivedataChanged();

public slots:
    void receivefrom();//信号（收到数据激发的信号）响应函数

private:
    QByteArray receiveArray;

};

#endif // SERIALHANDLER_H
