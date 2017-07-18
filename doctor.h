#ifndef DOCTOR_H
#define DOCTOR_H
#include <QObject>
#include <QString>


class Doctor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(int age READ age WRITE setAge)
    Q_PROPERTY(QString gender READ gender WRITE setGender)
    Q_PROPERTY(QString rank READ rank WRITE setRank)
    Q_PROPERTY(QString good READ good WRITE setGood)
    Q_PROPERTY(int hosid READ hosid WRITE setHosid)
public:

    void setName(QString);
    void setAge(int);
    void setGender(QString);
    void setRank(QString);
    void setGood(QString);
    void setHosid(int);

    QString name();
    int age();
    QString gender();
    QString rank();
    QString good();
    int hosid();

private:
    int m_age;
    QString m_name;
    QString m_gender;
    QString m_rank;
    QString m_good;
    int m_hosid;

};
Q_DECLARE_METATYPE(Doctor*)
#endif // DOCTOR_H
