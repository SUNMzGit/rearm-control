#include "socketanalyzer.h"

//判断收到的数据包协议格式
bool GamePackage::SetOriginalData(QByteArray data, int len) {

    qDebug()<< "SetOriginalData";
    if (data.at(0) != 0x3F || data.at(len-1) != 0x3F) {
        return false;
    }
    if (len < 4) {
        return false;
    }
    this->len = data.at(1);
    if (this->len + 3 != len) {
        return false;
    }

    for (int i = 0; i < this->len; i++) {
        this->data[i] = (uchar)data.at(i+2);
    }
    return true;
}


socketAnalyzer::socketAnalyzer()
{
    score = 0;
    type = minutes = second = minLevel = maxLevel = music = 0x00;
    xMin= xMax= xCur= yMin= yMax= yCur= zMin= zMax= zCur = 0x00;
    tag = 1;//1、3发一次 2一直发

}


socketAnalyzer::~socketAnalyzer()
{

}

//根据请求指令响应
void socketAnalyzer:: DataAnalyze(QByteArray request,int reqLen ){
    GamePackage requestPackage;
    if (!requestPackage.SetOriginalData(request, reqLen)) {
         qDebug() << "wrong data";
    }
    char command = requestPackage.data[0];
    switch (command) {
    case 0x01:
        response[0] = uchar(0x3f);
        response[1] = uchar(0x01);
        response[2] = uchar(0x02);
        response[3] = uchar(0x3f);
        tag = 1;
        break;
    case 0x03:
        tag = 3;
        ResponseGameSettings(minutes, second, minLevel, maxLevel, music);
        break;
    case 0x05:
        if (requestPackage.len > 1)
        type = requestPackage.data[1];
        ResponseXYZ(type, xMin, xMax, xCur, yMin, yMax, yCur, zMin, zMax, zCur);
        tag = 2;
        break;
    case 0x07:
        tag = 1;
        response[0] = uchar(0x3f);
        response[1] = uchar(0x01);
        response[2] = uchar(0x08);
        response[3] = uchar(0x3f);
        break;
    case 0x09:
        score = (requestPackage.data[1] << 8) | (requestPackage.data[2] & 0xff);
        ////////对分数进行存储/显示////////

        //
        response[0] = uchar(0x3f);
        response[1] = uchar(0x01);
        response[2] = uchar(0x0A);
        response[3] = uchar(0x3f);
        tag = 1;
        break;
    case 0x0B:
        //Sleep(3000);
        tag = 1;
    default:
        tag = 1;
    }
}




int socketAnalyzer::GetTag() {
    return tag;
}



//设置各关节角度信息数据包
void socketAnalyzer::SetXYZ(float xMin1, float xMax1, float xCur1, float yMin1, float yMax1, float yCur1, float zMin1, float zMax1, float zCur1) {
    qDebug()<<"进入SetXYZ函数"<<xCur1<<yCur1;
    this->xMin = xMin1;
    this->xMax = xMax1;
    xCur = xCur1;
    this->yMin = yMin1;
    this->yMax = yMax1;
    yCur = yCur1;
    this->zMin = zMin1;
    this->zMax = zMax1;
    zCur = zCur1;
}

//设置游戏时间、音效、难度等级
void socketAnalyzer::SetGameSettings(int minutes, int second, int minLevel, int maxLevel, int music) {
    this->minutes = minutes;
    this->second = second;
    this->minLevel = minLevel;
    this->maxLevel = maxLevel;
    this->music = music;
}

//响应游戏设置，将游戏设置数据和数据长度组包，以便发送
void socketAnalyzer::ResponseGameSettings(int minutes, int second, int minLevel, int maxLevel, int music) {
    responseSet[0] = uchar(0x3f);
    responseSet[1] = uchar(0x06);
    responseSet[2] = uchar(0x04);
    responseSet[3] = uchar(minutes);
    responseSet[4] = uchar(second);
    responseSet[5] = uchar(minLevel);
    responseSet[6] = uchar(maxLevel);
    responseSet[7] = uchar(music);
    responseSet[8] = uchar(0x3f);
}

//响应各关节角度信息，将数据组包
void socketAnalyzer::ResponseXYZ(int type, float xMin, float xMax, float xCur, float yMin, float yMax, float yCur, float zMin, float zMax, float zCur) {

    responseValue[0] = uchar(0x3f);
    responseValue[1] = uchar(0x14);
    responseValue[2] = uchar(0x06);
    responseValue[3] = uchar(type);
    responseValue[4] = uchar(0x00);
    responseValue[5] = uchar(0x00);//(this->xMin);
    responseValue[6] = uchar(0x00);
    responseValue[7] = uchar(0x41);//(this->xMax);
    responseValue[8] = uchar(0x00);
    responseValue[9] = uchar(xCur);
    responseValue[10] = uchar(0x00);
    responseValue[11] = uchar(0x10);//(this->yMin);
    responseValue[12] = uchar(0x00);
    responseValue[13] = uchar(0x96);//(this->yMax);
    responseValue[14] = uchar(0x00);
    responseValue[15] = uchar(yCur);
    responseValue[16] = uchar(0x00);
    responseValue[17] = uchar(zMin);//(this->zMin);
    responseValue[18] = uchar(0x00);
    responseValue[19] = uchar(zMax);//(this->zMax);
    responseValue[20] = uchar(0x00);
    responseValue[21] = uchar(zCur);//(this->zCur);
    responseValue[22] = uchar(0x3f);
}



void socketAnalyzer::SetIntData(char* data, int value) {
    data[0] = (value >> 8)&0xff;
    data[1] = value & 0xff;
}

//数据*100处理
void socketAnalyzer::SetFloatData(char* data, float value) {
    SetIntData(data, value);
}
QByteArray socketAnalyzer::GetResponseXYZ() {
    qDebug()<<"GetResponseXYZ- this->xCur"<< xCur;
    ResponseXYZ(type, xMin, xMax, xCur, yMin, yMax, yCur, zMin, zMax, zCur);
    return responseValue;
}
