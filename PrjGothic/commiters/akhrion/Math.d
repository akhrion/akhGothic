//��������.
//exp - expression, r1 - ����������, ���� ������� �����, r2 - ���� �� �����.
func int tern(var int exp, var int r1, var int r2)
{
	if(exp)
	{
		return r1;
	};
	return r2;
};

//���������� ������������� �����.
func int abs(var int i)
{
	return tern(i < 0,i * -1,i);
};

func int expon_cb(var int i, var int e, var int sum)
{
	if(e>1)
	{return expon_cb(i,e-1,sum*i);};
	if(e == 0)
	{return 1;};
	return sum;
};
//���������� � �������:
//i - int ����� ���������� � �������, e - exponent �������.
func int expon(var int i,var int e)
{
	return expon_cb(i,e,i);
};

//���������� ���������* ��������� �������������� ���� �� ��� � ��������� �������:
//*��������� ����������� � ������ �������
//integer - ����� �����; pseudoFloat - ������� �� 100� ��������� ����� ������ �����.
//������: 20 * 50 = 10;   20 * 100 = 20; 20 * 155 = 31;
//������: 20 * 700 = 140; 20 * 10 = 2;   20 * 4 = 0,8 = 0;
func int MultiplicateIntOnFloat(var int integer, var int pseudoFloat){
	return integer * (pseudoFloat / 100) +
	(integer * (pseudoFloat / 10 % 10)) / 10 +
	(integer * (pseudoFloat % 10)) / 100;
};
//���������� � ������� ������� - � ���������: ���������� MultiplicateIntOnFloat �������.. ������������ ������.. � ������ - � �� ��������.. ��-�� ;) �� ��� � ����� ������ ��������� � �����? ..... ��� ��� �� ������ - � ������ �������.. � �� ��������...... � ��� ��... �� ���� ��� ����������� ������� � ������� "��� ��� ��� �������� ���������.." ��?..... �� ������ ���! ;p
func int MultiplicateIntOnFloatU(var int integer, var int pseudoFloat){
	return integer * (pseudoFloat / 100) +
	tern(
		pseudoFloat % 10,
		(integer * (pseudoFloat / 10 % 10)) / 10 +
		tern(
			integer * (pseudoFloat % 10) % 100,
			integer * (pseudoFloat % 10) / 100 + 1,
			integer * (pseudoFloat % 10) / 100
		),
		tern(
			(integer * (pseudoFloat / 10 % 10)) % 10,
			(integer * (pseudoFloat / 10 % 10)) / 10 + 1,
			(integer * (pseudoFloat / 10 % 10)) / 10
		)
	);
};

//integer - ����� �����; f1,f2,f3 - �����, ������� � ����� ����� ���������� ��������.
func int MultiplicateIntOnFloat_a(var int integer, var int f1, var int f2, var int f3){
	return (integer * f1) + ((integer * f2) / 10) + ((integer * f3) / 100);
};

//���������� ������� percent �� ����� integer
//������: 8 40 = 3,2 = 3; 24 100 = 24; 33 13 = 4,29 = 4;
func int getPercentFromInteger(var int integer, var int percent)
{
	return integer * percent / 100;
};

//////////////////////////////////////////
//������� ����, �����������.//////////////
//AKH WORKING ��������� ������������� �������.
//� 20210908 ������ �� �����. �������� ���������.
//������. ������������ �������� �������� ���������� ��� ��������� _cb - ����������� �.
func int isFlagsContainCategorie_cb(var int flags_, var int cat_, var int bndl_, var int lvl_)
{
	if((bndl_ - 1) == flags_)
	{
		return true;
	};
	if((bndl_ - 1) > flags_)
	{//����� �������� �� -+ ������, � ���������� ��������� lvl_ � �� 31 ������ ���� ��� ����� ?? ��? ������-���:
		// (bndl_ - 1) / 2 - ������� ��������� ����� ������.. ��� ��������� ��������� ����� ����� � �� �����?
		//		����� ������������ �� ��������� ������� �������.. � ����� "��� ����"
		bndl_ = (bndl_ - 1) / 2 + 1;	//������ ������� ����, ���-�� ������� ����� �������������.. 
		if(bndl_ == cat_)		//��� ���������� ������������� �� 31 �����, �.�. ��������� ������� ���� int..
		{		//��� ���� �������� ��������� �� ������������� ������� �� ������� �� ������ �� 31 �����..
			return true;
		};
		flags_ = flags_ - bndl_;
		if(flags_ <= 0)
		{
			return false;
		};
		return isFlagsContainCategorie_cb(flags_, cat_, 1 << 1, 1);
	};
	return isFlagsContainCategorie_cb(flags_, cat_, bndl_ << 1, lvl_ + 1);
};

//AKH WORKING
//� 20210908 ������ �� �����. �������� ���������. �� �������� �� ���������� �������.
//���������� true ���� �� ������ flags_ ���������� ��������� cat_
//flags_ - ��������� ��������� ������������ ���������. ������ ���� ��� "_" ������� � ��������� instance
//cat_ - ��������� ����� �� ���������. ���������� �� ��� ����� � ����� _Intern\constants.d
func int isFlagsContainCategorie(var int flags_, var int cat_)
{
	if(flags_ > cat_)
	{
		return isFlagsContainCategorie_cb(flags_, cat_, 1 << 1, 1);
	} else if(flags_ == cat_)
	{
		return true;
	};
	return false;
};

func int getFlagsCount_cb(var int flags_, var int bndl_, var int counter_)
{
	if(flags_ == 0)
	{
		return counter_;
	};
	if(bndl_ < flags_)
	{
		if(bndl_ < 0)
		{
			bndl_ = -1 * (bndl_ / 2);
		}
		else
		{
		return getFlagsCount_cb(flags_, bndl_ << 1, counter_);
		};
	};
	if(bndl_ == flags_)
	{
		return counter_ + 1;
	};
	return getFlagsCount_cb(flags_ - (bndl_ / 2), 1 << 1, counter_ + 1);
};

//AKH WORKING
//� 20210908 ������ �� �����. �������� ���������. �� �������� �� ���������� �������.
//���������� true ���� �� ������ flags_ ���������� ��������� cat_
//flags_ - ��������� ��������� ������������ ���������. ������ ���� ��� "_" ������� � ��������� instance
//cat_ - ��������� ����� �� ���������. ���������� �� ��� ����� � ����� _Intern\constants.d
func int getFlagsCount(var int flags_)
{
	return getFlagsCount_cb(flags_, 1 << 1, 0);
};


//AKH WORKING
//��� �� ������� �������..
//��� ������ ���� ���������� ������� ������� isFlagsContainCategorie_cb
//�� ���� ��� �� ��������.. � ��.. �� ���� ���.
//���������� ��������
func int t_cb(var int flags_, var int cat_, var int bndl_, var int lvl_)
{
	PrintDebug(IntToString(flags_));
	if(bndl_ < 0)
	{
		bndl_ = ((bndl_ / 2) * -1);//20210913 ������� ������ (bndl_ / 2) �� ����������
		if(bndl_ == cat_)
		{
			return 1;//��������
		} else {
			Print("overflow");
			return 2;//������: ������������ ���� - ������� �� ���������.. � ������.
			//���� ��������� - ������ ��� ������� �������� ���:
			//�� ���� ��������� ��� ��������, �� � ������������ �� ����, ��� �������� ��.
			//��������� ��������, ��� ���� ������ �����, � ����� �����?
			//�� �������-�� �� ������� � ��, ��� ��� ������������� �������������� �����
			//�� � ����� ������� �������������.. ��, � ��� ��� �������� ����..
		};
	};
	if(bndl_ == flags_){
		return 0;//�� ��������
	};
	if((bndl_ - 1) == flags_)
	{
		return 1;//��������
	};
	if(bndl_ < flags_)
	{
		return t_cb(flags_, cat_, bndl_ << 1, lvl_ + 1);
	};
	bndl_ = bndl_ / 2;
	if(bndl_ == cat_)
	{
		return 1;//��������
	};
	flags_ = flags_ - bndl_;
	if(flags_ == 0)
	{
//		Print(IntToString(flags_));
		return 0;//�� ��������
	};
	return t_cb(flags_, cat_, 1 << 1, 1);
};

//��� �� ������� �������.. ��� ������ ����..
func int t(var int flags_, var int cat_)
{
	if(flags_ > cat_)
	{
		var int ret;
		ret = t_cb(flags_, cat_, 1 << 1, 1);
		if(!ret)
		{
			//cat_ �� ������� �� flags_
			return 0;
		} else if(ret == 1)
		{
			//cat_ �������
			return 1;
		};
		//�� ������� ���������� ������� cat_ �� flags_ - �������� ��� ����� ����� �����.. � �������� �������.
		return 2;
	} else if(flags_ == cat_)
	{
		//cat_ �������
		return 1;
	};
	//cat_ �� �������
	return 0;
};

//������� ����, ����� �������
