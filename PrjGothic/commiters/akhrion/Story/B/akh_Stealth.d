//AKH IMPROVE
//�������� ����� �������
//������� ������� ����������� - ��� ��������� �� �������� ���������� �����, � �� �� �������� ���������� ����������.
//�� ����� ����������� ������ �� ��������� � ������.. ���� ��������� ���������� ����� ������� � ������� ������.
//slf - is a npc, which sense will be fixed
//oth - is the Player
func int akh_Stealth(var C_Npc slf, var C_Npc oth)
{
	if(Npc_IsPlayer(oth))
	{
		if(
			(slf.guild < GIL_SEPERATOR_HUM) ||
			(slf.guild > GIL_SEPERATOR_ORC)
		)
		{
			//��� ��� ��� ���
			if(
				slf.senses_range - oth.attribute[ATR_DEXTERITY] * 10 <
				Npc_GetDistToNpc(slf,oth)
			)
			{
				//��� �� �����, �� ������, �� ���� ������
				return true;
			};
		}
		else
		{
			//��� �������
			if(
				(
					slf.aivar[AIV_PCISSTRONGER] - 
					(
						Npc_GetTalentSkill(oth,NPC_TALENT_FIREMASTER) * 200 +
						oth.attribute[ATR_DEXTERITY] * 2
					)
				) <	Npc_GetDistToNpc(slf,oth)
			)
			{
				//����� ��� ���� �������.. �� ����������, ��� ���� �������, �� ���� �������, ��� ���� ������� ��� ��! ps. ����������, ��� ��� �� ���������� ������ ���������, �-�� ��������� � � ��������� ��� �������.. �� ������ ����� ���������� ���� ��� ��������� �� ��� ����� ����? ��� ��� ���? �����
				return true;
			};
		};
	};	
	return false;
};
