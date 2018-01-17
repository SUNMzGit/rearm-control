#include "reporthandler.h"

Reporthandler::Reporthandler(QObject *parent) : QObject(parent)
{

    this->report = new AssessRecord();
}

int Reporthandler::getShoulderSF(){
    return report->shoulderSF;
}
int Reporthandler::getShoulderSS(){
    return report->shoulderSS;
}
int Reporthandler::getShoulderPF(){
    return report->shoulderPF;
}
int Reporthandler::getShoulderPS(){
    return report->shoulderPS;
}

int Reporthandler::getElbowSF(){
    return report->elbowSF;
}
int Reporthandler::getElbowSS(){
    return report->elbowSS;
}
int Reporthandler::getElbowPF(){
    return report->elbowPF;
}
int Reporthandler::getElbowPS(){
    return report->elbowPS;
}
