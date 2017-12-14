#include "sockethandler.h"
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

        timer->start(1000);
        socket->waitForBytesWritten(20);

    }
}

void SocketHandler::timeoutslot(){

    socket->write(sockanalyzer->GetResponseXYZ());

    socket->waitForBytesWritten(20);

}

void SocketHandler::game(){



    QString program;
//    switch(i){//选择游戏1
//    case 1:
//        program = "D:\\RehabGame\\NumberArithmetic\\numberArithmetic.exe";
//        break;
//    case 2://选择游戏2
//        program = "D:\\RehabGame\\FruitLeftRight718\\fruitLeftRight_dialog_disable.exe";
//        break;
//    case 3:
//        program = "D:\\RehabGame\\";
//        break;
//    case 4://选择游戏2
//        program = "D:\\RehabGame\\";
//        break;
//    default:
//        break;
//    }

    QStringList arguments;
    arguments << "-style" << "fusion";
    QProcess *myProcess = new QProcess();
    myProcess->startDetached(program, arguments);
    sockanalyzer->SetGameSettings(3, 0, 3, 5, 0);
    //sockanalyzer->SetXYZ(0,1,2,3,4,5,6,7,8);

}
