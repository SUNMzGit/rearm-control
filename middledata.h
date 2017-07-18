#ifndef MIDDLEDATA_H
#define MIDDLEDATA_H

#include <QDebug>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlDriver>
#include <QtSql/QSqlError>
#include <QString>
#include <QList>
#include "doctor.h"
#include "patient.h"
class Middledata
{
public:
    Middledata();
    QList<Patient*>  getPatientList();
    QList<Doctor*>  getDoctorList();
};

#endif // MIDDLEDATA_H
