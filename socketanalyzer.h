#ifndef SOCKETANALYZER_H
#define SOCKETANALYZER_H
#include <QString>

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
    QByteArray GetResponseXYZ(){
        return responseXYZ;
    }

    void SetGameSettings(int minutes, int second, int minLevel, int maxLevel, int music);
    int GetTag();


    void SetXYZ(float xMin, float xMax, float xCur, float yMin, float yMax, float yCur, float zMin, float zMax, float zCur);


    protected:
        void ResponseGameSettings(int minutes, int second, int minLevel, int maxLevel, int music);
        void ResponseXYZ(int type, float xMin, float xMax, float xCur, float yMin, float yMax, float yCur, float zMin, float zMax, float zCur);

    private:


        QByteArray response,responseXYZ,responseSet;
        int score;
        volatile int tag;
        int type, minutes, second, minLevel, maxLevel, music;

        void SetIntData(char* data, int value);
        void SetFloatData(char* data, float value);

        float xMin, xMax, xCur, yMin, yMax, yCur, zMin, zMax, zCur;
        float YMin, YMax, YCurrent;
};

#endif // SOCKETANALYZER_H
