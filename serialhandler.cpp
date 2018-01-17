#include "serialhandler.h"
#include <QtDebug>
#include <QDataStream>
#include <AssessRecord.h>

#include"windows.h"
SerialHandler::Settings currentsetting;//定义设定值结构体的结构体变量
QSerialPort serialport;
AssessRecord assessrecord;
socketAnalyzer socketanalyzer;
SerialHandler::SerialHandler(QObject *parent) : QObject(parent)
{

    QObject::connect(&serialport, SIGNAL(readyRead()),this, SLOT(receivefrom()));//将端口收到数据产生的信号绑定receivefrom()函数;
    currentsetting.name = "COM4";
    currentsetting.baudRate=9600;
    currentsetting.dataBits=QSerialPort::Data8;
    currentsetting.parity=QSerialPort::NoParity;
    currentsetting.stopBits=QSerialPort::OneStop;
    currentsetting.flowControl=QSerialPort::NoFlowControl;

    serialport.setPortName(currentsetting.name);

    //socketanalyzer=new socketAnalyzer();

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


////////////////////接收数据//////////////////////////////
void SerialHandler::receivefrom()//由readyRead()消息出发（在前边进行绑定），当串口收到数据此消息被激活）
{
    receiveArray=  serialport.readAll();
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
    if (request.at(1) == 0x03 ) { //读指令，需要解析数据
        if(request.at(2) == 0x07 ){ //读评估数据
            assessrecord.setElbowPFPS((int)request[3]);
            assessrecord.setElbowSFSS((int)request[3]);
            qDebug()<< assessrecord.elbowSF;  //数据测试
            qDebug()<< assessrecord.elbowSS;
        }
        if(request.at(2) == 0x12 ){//读训练数据
            qDebug()<< (float)request[3]<<(float)request[4];  //这里验证读取x轴和y轴数据
            socketanalyzer.SetXYZ(0,65,(float)request[3],30,150,(float)request[4],0,0,0);
        }
    }
}

////////////////////关闭端口//////////////////////////////
void SerialHandler::closePort()//由按钮触发
{
    serialport.close();
    qDebug()<< "close port sucess";
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
    case 2://训练模式
        data[0] = uchar(0x3A);
        data[1] = uchar(0x03);
        data[2] = uchar(0x12);
        data[3] = uchar(0x00);
        data[4] = uchar(0x00);
        data[5] = uchar(0x02);
        data[6] = uchar(0x3A);
        break;
    case 3://示教模式

        break;
    case 4://停止训练
        data[0] = uchar(0x3A);
        data[1] = uchar(0x10);
        data[2] = uchar(0x12);
        data[3] = uchar(0x00);
        data[4] = uchar(0x00);
        data[5] = uchar(0x1C);
        data[6] = uchar(0x3A);
        break;
    case 10://被动训练一
        data[0] = uchar(0x3A);
        data[1] = uchar(0x10);
        data[2] = uchar(0x12);
        data[3] = uchar(0x00);
        data[4] = uchar(0x00);
        data[5] = uchar(0x0A);
        data[6] = uchar(0x3A);
        break;
    case 11://被动训练二
        data[0] = uchar(0x3A);
        data[1] = uchar(0x10);
        data[2] = uchar(0x12);
        data[3] = uchar(0x00);
        data[4] = uchar(0x00);
        data[5] = uchar(0x0B);
        data[6] = uchar(0x3A);
        break;
    case 12://被动训练三
        data[0] = uchar(0x3A);
        data[1] = uchar(0x10);
        data[2] = uchar(0x12);
        data[3] = uchar(0x00);
        data[4] = uchar(0x00);
        data[5] = uchar(0x0C);
        data[6] = uchar(0x3A);
        break;
    case 13://被动训练四
        data[0] = uchar(0x3A);
        data[1] = uchar(0x10);
        data[2] = uchar(0x12);
        data[3] = uchar(0x00);
        data[4] = uchar(0x00);
        data[5] = uchar(0x0D);
        data[6] = uchar(0x3A);
        break;
    default:
        break;
    }
    serialport.write(data);
}
