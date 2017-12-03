#ifndef SOCKETANALYZER_H
#define SOCKETANALYZER_H
#include <QString>
#include <QtDebug>

static float xCur=0;
static float yCur=0;
static float zCur=0;
class GamePackage {

public:
    int len;
    uchar data[50];
    bool SetOriginalData(QByteArray data, int len);//用于接收指令数据处理
};

class socketAnalyzer
{
public:
    socketAnalyzer();
    ~socketAnalyzer();

    void DataAnalyze(QByteArray data,int reqLen);
    QByteArray GetResponse(){
        return response;
    }
    QByteArray GetResponseSet(){
        return responseSet;
    }
    QByteArray GetResponseXYZ();

    void SetGameSettings(int minutes, int second, int minLevel, int maxLevel, int music);
    int GetTag();


    void SetXYZ(float xMin, float xMax, float xCur, float yMin, float yMax, float yCur, float zMin, float zMax, float zCur);
    void ResponseXYZ(int type, float xMin, float xMax, float xCur, float yMin, float yMax, float yCur, float zMin, float zMax, float zCur);

protected:
    void ResponseGameSettings(int minutes, int second, int minLevel, int maxLevel, int music);

private:



    int score;
    volatile int tag;
    int type, minutes, second, minLevel, maxLevel, music;

    void SetIntData(char* data, int value);
    void SetFloatData(char* data, float value);
public:
    float xMin, xMax, yMin, yMax, zMin, zMax;
     QByteArray response,responseSet,responseValue;
};

#endif // SOCKETANALYZER_H
