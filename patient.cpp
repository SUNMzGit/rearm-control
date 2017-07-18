#include "patient.h"
#include <QDebug>

void Patient::setName(QString name){
    this->m_name = name;
}
void Patient::setGender(QString gender){
    this->m_gender = gender;
}
void Patient::setAge(int age){
    this->m_age = age;
}

void Patient::setAffect(QString affect){
    this->m_affect = affect;
}
void Patient::setHeight(int height){
    this->m_height = height;
}
void Patient::setWeight(int weight){
    this->m_weight = weight;
}
void Patient::setUplen(int uplen){
    this->m_uplen = uplen;
}
void Patient::setForelen(int forelen){
    this->m_forelen = forelen;
}
void Patient::setDoc(QString doctor){
    this->m_doctor = doctor;
}
void Patient::setTip(QString tip){
    this->m_tip = tip;
}

int Patient::age(){ return this->m_age; }
QString Patient::name(){ return this->m_name; }
QString Patient::gender(){ return this->m_gender; }
QString Patient::affect(){ return this->m_affect; }
int Patient::height(){ return this->m_height; }
int Patient::weight(){ return this->m_weight; }
int Patient::uplen(){ return this->m_uplen; }
int Patient::forelen(){ return this->m_forelen; }
QString Patient::doctor(){ return this->m_doctor; }
QString Patient::tip(){ return this->m_tip; }
