#ifndef REPORTHANDLER_H
#define REPORTHANDLER_H

#include <QObject>
#include "AssessRecord.h"

class Reporthandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int getShoulderSF READ getShoulderSF)
    Q_PROPERTY(int getShoulderSS READ getShoulderSS)
    Q_PROPERTY(int getShoulderPF READ getShoulderPF)
    Q_PROPERTY(int getShoulderPS READ getShoulderPS)

    Q_PROPERTY(int getElbowSF READ getElbowSF)
    Q_PROPERTY(int getElbowSS READ getElbowSS)
    Q_PROPERTY(int getElbowPF READ getElbowPF)
    Q_PROPERTY(int getElbowPS READ getElbowPS)

public:
    explicit Reporthandler(QObject *parent = nullptr);

    int getShoulderSF(); //肩关节矢状面屈曲角度
    int getShoulderSS(); //肩关节矢状面伸展角度
    int getShoulderPF(); //肩关节外展
    int getShoulderPS(); //肩关节内收


    int getElbowSF(); //肘关节矢状面屈曲角度
    int getElbowSS(); //肘关节矢状面伸展角度
    int getElbowPF(); //肘关节水平面屈曲角度
    int getElbowPS(); //肘关节水平面伸展角度

signals:

public slots:
private:
    //@TODO:记录日志，QML中使用QList的方法，将原型降级为QObject即可
    AssessRecord* report;
};

#endif // REPORTHANDLER_H
