#include "middledata.h"

Middledata::Middledata()
{

}
//从数据库中取得患者信息
QList<Patient*> Middledata::getPatientList() {
    QList<Patient*> list;
    QSqlQuery query("SELECT * FROM patient p left join doctor d on p.d_id=d.did");
//    QSqlRecord result = query.record();
//    qDebug() << result;
    while(query.next()){

        QString name = query.value(1).toString();
        qDebug() << name;
        int age = query.value(2).toInt();
        QString gender = query.value(3).toString();

        QString tip = query.value(4).toString();
        int uplen = query.value(5).toInt();
        int forelen = query.value(6).toInt();

        QString affect = query.value(7).toString();
        int height = query.value(8).toInt();
        int weight = query.value(9).toInt();
        QString doctor = query.value(12).toString();
        qDebug() << doctor;

        Patient* patient = new Patient();
        patient->setName(name);
        patient->setAge(age);
        patient->setGender(gender);
        patient->setAffect(affect);
        patient->setHeight(height);
        patient->setWeight(weight);
        patient->setUplen(uplen);
        patient->setForelen(forelen);
        patient->setDoc(doctor);
        patient->setTip(tip);

        list.append(patient);
    }

    return list;
}
//从数据库中取得医生信息
QList<Doctor*> Middledata::getDoctorList() {
    QList<Doctor*> list;
    QSqlQuery query("SELECT * FROM doctor");
    while(query.next()){
        QString name = query.value(1).toString();

        int age = query.value(2).toInt();
        QString gender = query.value(3).toString();

        QString rank = query.value(4).toString();
        QString good = query.value(5).toString();

        int hosid = query.value(6).toInt();
        Doctor* doctor = new Doctor();
        doctor->setName(name);
        doctor->setAge(age);
        doctor->setGender(gender);
        doctor->setRank(rank);
        doctor->setGood(good);
        doctor->setHosid(hosid);
        list.append(doctor);
    }
    return list;
}
