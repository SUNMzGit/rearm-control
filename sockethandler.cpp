﻿#include "sockethandler.h"
#include <QProcess>

SocketHandler::SocketHandler(QObject *parent) : QObject(parent)
{
    connect(&server,SIGNAL(newConnection()),this,SLOT(acceptConnection()));
    timer=new QTimer(this);
    connect(timer,SIGNAL(timeout()),this,SLOT(timeoutslot()));//timeoutslot()为自定义槽

    server.listen(QHostAddress::Any,8000);

    sockanalyzer=new socketAnalyzer();

}
void SocketHandler::acceptConnection()
{
    socket = server.nextPendingConnection();

    connect(socket,SIGNAL(readyRead()),
            this,SLOT(startRead()));

}

void SocketHandler::startRead()
{
    while(socket->bytesAvailable())
    {
        receivedData = socket->readAll();
    }

    sockanalyzer->DataAnalyze(receivedData,receivedData.size());

    if(sockanalyzer->GetTag() == 1){
        if(timer->isActive()){
                timer->stop();
        }
        Sleep(500);
        socket->write(sockanalyzer->GetResponse());
        socket->waitForBytesWritten(20);
    }else if(sockanalyzer->GetTag() == 3){
        if(timer->isActive()){
                timer->stop();
        }
        Sleep(500);
        socket->write(sockanalyzer->GetResponseSet());
        socket->waitForBytesWritten(20);
    }else if(sockanalyzer->GetTag() == 2){

        timer->start(50);
        socket->waitForBytesWritten(20);

    }
}

void SocketHandler::timeoutslot(){

    socket->write(sockanalyzer->GetResponseXYZ());
    socket->waitForBytesWritten(20);

}

void SocketHandler::game(int i){



    QString program;
    //program = "D:\\RehabGame\\NumberArithmetic\\numberArithmetic.exe";  //test
    switch(i){//选择游戏1
    case 0:
        program = "D:\\RehabGame\\NumberArithmetic\\numberArithmetic.exe";
        break;
    case 1://选择游戏2
        program = "D:\\RehabGame\\BirdAllDirection\\birdAllDiection201611261901.exe";
        break;
    case 2://选择游戏3
        program = "D:\\RehabGame\\Memory\\Memory.exe";
        break;
    case 3://选择游戏4
        program = "D:\\RehabGame\\"; //虚拟现实游戏待添加
        break;
    default:
        break;
    }

    QStringList arguments;
    arguments << "-style" << "fusion";
    QProcess *myProcess = new QProcess();
    myProcess->startDetached(program, arguments);
    sockanalyzer->SetGameSettings(5, 0, 3, 5, 0);
    //sockanalyzer->SetXYZ(0,1,2,3,4,5,6,7,8);

}
