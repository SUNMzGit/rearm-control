#ifndef MYSQLHANDLER_H
#define MYSQLHANDLER_H

#include "patient.h"
#include <QObject>
#include "middledata.h"

class Mysqlhandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QObject*> getPatientModel READ getPatientModel)
    Q_PROPERTY(QList<QObject*> getDoctorModel READ getDoctorModel)

    public:
        Mysqlhandler();
        Q_INVOKABLE uchar connect();
        Q_INVOKABLE void deletePat( QString pname);
        Q_INVOKABLE int getDidFromName(QString docName);
        Q_INVOKABLE int updatePat(); //更新患者列表
        Q_INVOKABLE int updateDoc(); //更新医生列表
        Q_INVOKABLE void insertPat( QString strSql);

        QList<QObject*> getPatientModel(){ return this->patientList; };
        QList<QObject*> getDoctorModel(){ return this->doctorList; };

    signals:

    public slots:

    private:
        //@TODO:记录日志，QML中使用QList的方法，将原型降级为QObject即可
        QList<QObject*> patientList;
        QList<QObject*> doctorList;
        Middledata* middle;

};
#endif // MYSQLHANDLER_H
