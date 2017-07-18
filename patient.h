#ifndef PATIENT_H
#define PATIENT_H

#include <QObject>
#include <QString>


class Patient : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(int age READ age WRITE setAge)
    Q_PROPERTY(QString gender READ gender WRITE setGender)
    Q_PROPERTY(QString affect READ affect WRITE setAffect)
    Q_PROPERTY(QString doctor READ doctor WRITE setDoc)
    Q_PROPERTY(QString tip READ tip WRITE setTip)
    Q_PROPERTY(int height READ height WRITE setHeight)
    Q_PROPERTY(int weight READ weight WRITE setWeight)
    Q_PROPERTY(int uplen READ uplen WRITE setUplen)
    Q_PROPERTY(int forelen READ forelen WRITE setForelen)
public:

    void setName(QString);
    void setAge(int);
    void setGender(QString);
    void setAffect(QString);
    void setHeight(int);
    void setWeight(int);
    void setUplen(int);
    void setForelen(int);
    void setDoc(QString);
    void setTip(QString);


    QString name();
    int age();
    QString gender();
    QString affect();
    int height();
    int weight();
    int uplen();
    int forelen();
    QString doctor();
    QString tip();

private:
    int m_age;
    QString m_name;
    QString m_gender;
    QString m_affect;
    int m_height;
    int m_weight;
    int m_uplen;
    int m_forelen;
    QString m_doctor;
    QString m_tip;

};
Q_DECLARE_METATYPE(Patient*)

#endif // PATIENT_H
