
#include "AssessRecord.h"


AssessRecord::AssessRecord()
{
	shoulderSF = 130; //肩关节矢状面屈曲角度0
	shoulderSS = 0; //肩关节矢状面伸展角度130

	shoulderPF  = 90; //肩关节水平面屈曲角度-45
	shoulderPS = -45; //肩关节水平面伸展角度90

	elbowSF = 110; //肘关节矢状面屈曲角度0
	elbowSS = 0; //肘关节矢状面伸展角度110

	elbowPF = 0; //肘关节水平面屈曲角度-110
 	elbowPS = -110; //肘关节水平面伸展角度0

    //肩关节矢状面被动伸展、屈曲角度
	 shoulderPSS = 0;
	 shoulderPSF = 130;
	//肘关节矢状面被动伸展、屈曲角度
	 elbowPSS = 0;
	 elbowPSF = 110;

	 wristUL = -30;   //腕关节尺偏角度30
	 wristRD = 30 ;   //腕关节桡偏角度-30

	 shoulderMaxUpAM = 0;  //肩关节向上最大主动肌力
	 shoulderMaxDownAM = 0;//肩关节向下最大主动肌力
	 elbowMaxUpAM = 0; //肘关节向上最大主动肌力
	 elbowMaxDownAM = 0; //肘关节向下最大主动肌力
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
