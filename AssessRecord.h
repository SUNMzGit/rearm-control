#pragma once
class AssessRecord
{
public:
	AssessRecord();
	~AssessRecord();

public:

	int shoulderSF; //肩关节矢状面屈曲角度
	int shoulderSS; //肩关节矢状面伸展角度

	int shoulderPF; //肩关节水平面屈曲角度
	int shoulderPS; //肩关节水平面伸展角度

	int elbowSF; //肘关节矢状面屈曲角度
	int elbowSS; //肘关节矢状面伸展角度
	int elbowPF; //肘关节水平面屈曲角度
	int elbowPS; //肘关节水平面伸展角度
	
	//肩关节矢状面被动伸展、屈曲角度
	int shoulderPSS; 
	int shoulderPSF;
	//肘关节矢状面被动伸展、屈曲角度
	int elbowPSS;
	int elbowPSF;

	int wristUL;   //腕关节尺偏角度
	int wristRD;   //腕关节桡偏角度

	int shoulderMaxUpAM;  //肩关节向上最大主动肌力
	int shoulderMaxDownAM; //肩关节向下最大主动肌力
	int elbowMaxUpAM; //肘关节向上最大主动肌力
	int elbowMaxDownAM; //肘关节向下最大主动肌力

	int cognitionScore;  //认知评估得分

	void setElbowMaxDownAM(int tempValue);
	void setElbowMaxUpAM(int tempValue);
	void setShoulderMaxDownAM(int tempValue);
	void setShoulderMaxUpAM(int tempValue);
	void setShoulderSFSS(int tempValue);

    void setShoulderPSPF(int tempValue);

	void setElbowSFSS(int tempValue);
	void setElbowPFPS(int tempValue);
	void setWristULRD(int tempValue);

	void setShoulderPSFPSS(int tempValue);
	void setElbowPSFPSS(int tempValue);

	int getMaxValue(int tempValue, int compareValue);
	int getMinValue(int tempValue, int compareValue);
};

