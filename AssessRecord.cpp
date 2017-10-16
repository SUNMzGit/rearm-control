
#include "AssessRecord.h"


AssessRecord::AssessRecord()
{
	shoulderSF = 130; //��ؽ�ʸ״�������Ƕ�0
	shoulderSS = 0; //��ؽ�ʸ״����չ�Ƕ�130

	shoulderPF  = 90; //��ؽ�ˮƽ�������Ƕ�-45
	shoulderPS = -45; //��ؽ�ˮƽ����չ�Ƕ�90

	elbowSF = 110; //��ؽ�ʸ״�������Ƕ�0
	elbowSS = 0; //��ؽ�ʸ״����չ�Ƕ�110

	elbowPF = 0; //��ؽ�ˮƽ�������Ƕ�-110
 	elbowPS = -110; //��ؽ�ˮƽ����չ�Ƕ�0

    //��ؽ�ʸ״�汻����չ�������Ƕ�
	 shoulderPSS = 0;
	 shoulderPSF = 130;
	//��ؽ�ʸ״�汻����չ�������Ƕ�
	 elbowPSS = 0;
	 elbowPSF = 110;

	 wristUL = -30;   //��ؽڳ�ƫ�Ƕ�30
	 wristRD = 30 ;   //��ؽ���ƫ�Ƕ�-30

	 shoulderMaxUpAM = 0;  //��ؽ����������������
	 shoulderMaxDownAM = 0;//��ؽ����������������
	 elbowMaxUpAM = 0; //��ؽ����������������
	 elbowMaxDownAM = 0; //��ؽ����������������
}

AssessRecord::~AssessRecord()
{
}

void AssessRecord::setElbowMaxDownAM(int tempValue) {
	elbowMaxDownAM = getMaxValue(tempValue, elbowMaxDownAM);
}
void AssessRecord::setElbowMaxUpAM(int tempValue) {
	elbowMaxUpAM = getMaxValue(tempValue, elbowMaxUpAM);
}
void AssessRecord::setShoulderMaxDownAM(int tempValue) {
	shoulderMaxDownAM = getMaxValue(tempValue, shoulderMaxDownAM);
}
void AssessRecord::setShoulderMaxUpAM(int tempValue) {
	shoulderMaxUpAM = getMaxValue(tempValue, shoulderMaxUpAM);
}

void AssessRecord::setShoulderSFSS(int tempValue) {
	shoulderSF = getMinValue(tempValue, shoulderSF);
	shoulderSS = getMaxValue(tempValue, shoulderSS);
}

void AssessRecord::setShoulderPSPF(int tempValue) {
    shoulderPF = getMinValue(tempValue, shoulderPF);
    shoulderPS = getMaxValue(tempValue, shoulderPS);
}

void AssessRecord::setElbowSFSS(int tempValue) {
	elbowSF = getMinValue(tempValue, elbowSF);
	elbowSS = getMaxValue(tempValue, elbowSS);
}
void AssessRecord::setElbowPFPS(int tempValue) {
	elbowPF = getMinValue(tempValue, elbowPF);
	elbowPS = getMaxValue(tempValue, elbowPS);
}
void AssessRecord::setShoulderPSFPSS(int tempValue) {
	shoulderPSF = getMinValue(tempValue, shoulderPSF);
	shoulderPSS = getMaxValue(tempValue, shoulderPSS);
}
void AssessRecord::setElbowPSFPSS(int tempValue) {
	elbowPSF = getMinValue(tempValue, elbowPSF);
	elbowPSS = getMaxValue(tempValue, elbowPSS);
}
void AssessRecord::setWristULRD(int tempValue) {
	wristRD = getMinValue(tempValue, wristRD);
	wristUL = getMaxValue(tempValue, wristUL);
}


int AssessRecord::getMaxValue(int tempValue,int compareValue) {
	if (tempValue > compareValue) {
		return tempValue;
	}
	return compareValue;
}
int AssessRecord::getMinValue(int tempValue, 
	  int compareValue) {
	if (tempValue < compareValue) {
		return tempValue;
	}
	return compareValue;
}
