#include <QMessageBox>
#include <QApplication>
#include <QDebug>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlDriver>
#include <QtSql/QSqlError>

#include <QThread>

#include "mysqlhandler.h"

Mysqlhandler::Mysqlhandler()
{
   this->middle = new Middledata();
}
uchar Mysqlhandler::connect(){
    qDebug() << QCoreApplication::libraryPaths();
    qDebug() << QSqlDatabase::drivers()<<endl; /*列出qt可用的数据库*/

    /*
     * 链接mysql数据库
     */

    QSqlDatabase db(QSqlDatabase::addDatabase("QMYSQL"));
    db.setHostName("127.0.0.1");
    db.setDatabaseName("micydata");
    db.setUserName("root");
    db.setPassword("123456");

    if (!db.open()) /*测试数据库是否链接成功*/
    {
       QMessageBox::critical(0, QObject::tr("Databse Error"), db.lastError().text());
       qDebug()<<db.lastError()<<endl;
       return 0;
    }
    else
    {
       qDebug()<<"success connection"<<endl;
       return 1;
    }
}

//删除patient表中选中记录
void Mysqlhandler::deletePat( QString pname){
    QString strSql =  QString("delete from patient where name ='%1'").arg(pname);
    QSqlQuery query;
    query.exec(strSql);
}

//查找patient表中所有数据
int Mysqlhandler::updatePat(){
    QList<Patient*> list = middle->getPatientList();
    //还原，并添加到内存模型
    for(int i = 0; i < list.length();i++){
        this->patientList.append(list.at(i));
        qDebug() <<this->patientList.at(i)->property("name").toString();
    }
    return 0;
}

//向patient表中插入数据insert into table(col2, col3) values('1', '2');
void Mysqlhandler::insertPat( QString strSql){
    QSqlQuery query;
    qDebug() <<strSql;
    query.exec(strSql);
    qDebug() <<"向patient表中插入数据";
}

//查找doctor表中所有数据
int Mysqlhandler::updateDoc(){
    QList<Doctor*> list = middle->getDoctorList();

    for(int i = 0; i < list.length();i++){
        this->doctorList.append(list.at(i));
        qDebug() <<this->doctorList.at(i)->property("name").toString();
    }
     qDebug() <<doctorList.length();
    return 0;
}
//根据姓名获取医生id
int Mysqlhandler::getDidFromName(QString docName)  {
    QSqlQuery query;
    QString strSql = QString("SELECT did FROM doctor where name = '%1'").arg(docName);
    query.exec(strSql);
    if(query.next())
    {
        int did = query.value(0).toInt();
        return did;
    }else {
        return 0;
    }
}
//根据姓名获取患者id
int Mysqlhandler::getPidFromName(QString patName)  {
    QSqlQuery query;
    QString strSql = QString("SELECT did FROM patient where name = '%1'").arg(patName);
    query.exec(strSql);
    if(query.next())
    {
        int pid = query.value(0).toInt();
        return pid;
    }else {
        return 0;
    }
}
