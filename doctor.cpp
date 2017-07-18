#include "doctor.h"
#include <QDebug>

void Doctor::setName(QString name){
    this->m_name = name;
}
void Doctor::setGender(QString gender){
    this->m_gender = gender;
}
void Doctor::setAge(int age){
    this->m_age = age;
}

void Doctor::setRank(QString rank){
    this->m_rank = rank;
}
void Doctor::setGood(QString good){
    this->m_good = good;
}
void Doctor::setHosid(int hosid){
    this->m_hosid = hosid;
}


int Doctor::age(){ return this->m_age; }
QString Doctor::name(){ return this->m_name; }
QString Doctor::gender(){ return this->m_gender; }
QString Doctor::rank(){ return this->m_rank; }
QString Doctor::good(){ return this->m_good; }
int Doctor::hosid(){ return this->m_hosid; }
