func void B_SpecStateInit_Bleeding(var C_NPC slf,var C_NPC oth)
{
	if(slf.aivar[AIV_MM_REAL_ID] == ID_WOLF)
	{
		if(Hlp_Random(2))
		{
			PrintDebug("50%\50% Bleeding wound by Wolf");
			if(!isFlagsContainCategorie(oth.aivar[AIV_MM_VisualType],VT_BLOODY))
			{
				oth.aivar[AIV_MM_VisualType] += VT_BLOODY;
			};
		};
	};
};
func void B_SpecStateLoop_Bleeding(var C_NPC slf)
{
	if(slf.aivar[AIV_MM_VisualType] == VT_BLOODY)
	{
		//����� ��������� ��������� ���� ������� � �����-��������� ��� ��������
		//������ ���� � AI_StartState, �� �������� ������ � AI_StartState
		//���������� ������ ����������� � ������� ��������� �������..
		//�.�. ���� �� ������, �� �� ������ ���������� �������
		//���� ������, �������, ����������, �� ������ ��� ���������� ������
		//��� ����.
		//�.�. ������� ������ ��� ����� ����������:
		//ZS_Bleeding + Attack|StandAround|Run|Walk + _Loop
		//� ����� ������ �������� ����, �� ��������� �� ������ �� ���� ��������� � ���������� � ��������� Bleeding
		//�������� � ���, ��� ������ ������������ � ������� ����� ���� �������������� ������������ ���������
		//� ����� ������� ���-�� �������������� ���� ���������� ����������.. ������.
		//���� ���� ������ ������.. ����� ��������� �������� (������� �� %)
		if(!Npc_GetStateTime(slf) % 5)
		{
			PrintDebug("One time in each 5 sec.");
			//��� ���, ��� � 5 ���. ����� ������������.
			//� StateTime �� ���� ����������.. ����� ������� �� ����� ���������� � ������������ �������� ���������
			//���� �������..akh working
			if(!Hlp_Random(100))
			{
				slf.attribute[ATR_HITPOINTS] -=1;
			};
			//��� ������� ������ ���������� � ����� zs_.._loop
			//�� ������, �� ��� ��� ���� ������ ������, ��� ���� �������� �� �������..
			//����� �������.. ������ ����������, ������ ����������� ��������. �� �������� ;)
			//���.. ����� � ������� ������� ������� ����������� ����� � ��������
			//��� �������� � ������������ ������ ������-�����. ����� ������� ����� ������� ������ ��������.
			//���� �������, ����� ������ ������ �������� ����� ��� ���� �������. �� ��� ����������.
		};
	};
};
func void B_SpecStatesInit(var C_NPC slf, var C_NPC oth)
{
	PrintDebug("B_SpecStates..");
	PrintDebug("Should be invoked from any loop.");
	B_SpecStateInit_Bleeding(slf,oth);
};
func void B_SpecStatesLoop(var C_NPC slf)
{
	B_SpecStateLoop_Bleeding(slf);
};
