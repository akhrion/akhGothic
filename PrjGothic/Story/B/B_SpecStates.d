func void B_SpecStates_Bleeding(var C_NPC slf,var C_NPC oth)
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
	if(oth.aivar[AIV_MM_VisualType] == VT_BLOODY)
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
			//��� ���, ��� � 5 ���. ����� ������������.
			//� StateTime �� ���� ����������.. ����� ������� �� ����� ���������� � ������������ �������� ���������
			//���� �������..akh working
		};
	};
};
func void B_SpecStates(var C_NPC slf, var C_NPC oth)
{
	PrintDebug("B_SpecStates..");
	PrintDebug("Should be invoked from any loop.");
	B_SpecStates_Bleeding(slf,oth);
};