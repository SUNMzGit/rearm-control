#pragma once
class AssessRecord
{
public:
	AssessRecord();
	~AssessRecord();

public:

	int shoulderSF; //��ؽ�ʸ״�������Ƕ�
	int shoulderSS; //��ؽ�ʸ״����չ�Ƕ�

	int shoulderPF; //��ؽ�ˮƽ�������Ƕ�
	int shoulderPS; //��ؽ�ˮƽ����չ�Ƕ�

	int elbowSF; //��ؽ�ʸ״�������Ƕ�
	int elbowSS; //��ؽ�ʸ״����չ�Ƕ�
	int elbowPF; //��ؽ�ˮƽ�������Ƕ�
	int elbowPS; //��ؽ�ˮƽ����չ�Ƕ�
	
	//��ؽ�ʸ״�汻����չ�������Ƕ�
	int shoulderPSS; 
	int shoulderPSF;
	//��ؽ�ʸ״�汻����չ�������Ƕ�
	int elbowPSS;
	int elbowPSF;

	int wristUL;   //��ؽڳ�ƫ�Ƕ�
	int wristRD;   //��ؽ���ƫ�Ƕ�

	int shoulderMaxUpAM;  //��ؽ����������������
	int shoulderMaxDownAM; //��ؽ����������������
	int elbowMaxUpAM; //��ؽ����������������
	int elbowMaxDownAM; //��ؽ����������������

	int cognitionScore;  //��֪�����÷�

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

