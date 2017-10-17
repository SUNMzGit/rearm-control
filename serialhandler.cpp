#include "serialhandler.h"
#include <QtDebug>
#include <QDataStream>
#include <AssessRecord.h>

SerialHandler::Settings currentsetting;//定义设定值结构体的结构体变量
QSerialPort serialport;
AssessRecord assessrecord;
SerialHandler::SerialHandler(QObject *parent) : QObject(parent)
{

    QObject::connect(&serialport, SIGNAL(readyRead()),this, SLOT(receivefrom()));//将端口收到数据产生的信号绑定receivefrom()函数;
    currentsetting.name = "COM1";
    currentsetting.baudRate=115200;
    currentsetting.dataBits=QSerialPort::Data8;
    currentsetting.parity=QSerialPort::NoParity;
    currentsetting.stopBits=QSerialPort::OneStop;
    currentsetting.flowControl=QSerialPort::NoFlowControl;

    serialport.setPortName(currentsetting.name);

}
////////////////////打开端口//////////////////////////////
void SerialHandler::openPort()//由按钮触发
{
    if (serialport.open(QIODevice::ReadWrite))//打开这一端口
    {
         qDebug()<<"open port sucess";

        if(serialport.setBaudRate(currentsetting.baudRate)//设置各项信息
              && serialport.setDataBits(currentsetting.dataBits)
              && serialport.setParity(currentsetting.parity)
              && serialport.setStopBits(currentsetting.stopBits)
              && serialport.setFlowControl(currentsetting.flowControl))
         {
               qDebug()<<"set sucess";
         }
     }
}

////////////////////发送数据//////////////////////////////
void SerialHandler::sendto(int flag)//此函数由qml里的send按钮触发
{
    //if(send);
    //发送测试指令
    QByteArray data; //要发送的数据
    switch (flag) {
    case 1: //评估指令
        data[0] = uchar(0x3A);
        data[1] = uchar(0x03);
        data[2] = uchar(0x07);
        data[3] = uchar(0x00);
        data[4] = uchar(0x00);
        data[5] = uchar(0x01);
        data[6] = uchar(0x3A);
        break;
    case 2:

        break;
    case 3:

        break;
    case 4:

        break;
    case 5:

        break;
    default:
        break;
    }

    serialport.write(data);
}
////////////////////接收数据//////////////////////////////
void SerialHandler::receivefrom()//由readyRead()消息出发（在前边进行绑定），当串口收到数据此消息被激活（对于串口，每发送出去一个字节，都会将此字节返回，触发readyread消息，当芯片有特殊指令时，收到的信息更多，比如对sim900，发送0000，芯片就会受到0000，但是发送AT，会受到 AT OK）
{
    receiveArray=  serialport.readAll();
    qDebug() << "==========receivefrom=========";
    analysis(receiveArray,receiveArray.size());
}

void SerialHandler::analysis(QByteArray request,int reqLen){

    //在这里对接收到的串口数据进行处理
    qDebug() << "==========analysis=========";
    if (request.at(0) != 0x3A || request.at(reqLen-1) != 0x3A) {
        qDebug()<< "Serial Wrong Data";
    }
    if (reqLen < 4) {
        qDebug()<< "Serial Wrong Data";
    }
    assessrecord.setElbowPFPS(request[3]);
    qDebug()<< assessrecord.elbowSF;
}

////////////////////关闭端口//////////////////////////////
void SerialHandler::closePort()//由按钮触发
{
    serialport.close();
    qDebug()<< "close port sucess";
}
