
func void B_Story_AccessToXardas()
{
	CreateInvItem(hero,itarrune_1_6_teleport3);
	B_LogEntry(CH4_FindXardas,"� ����� ������ ���� ���� ������� � ����� �� ������-���������. ������ �� ��� ��� ���� ������������. ���������, ���� ��� ���� ���������.");
	B_GiveXP(XP_DeliveredGolemhearts);
	FindGolemHearts = 4;
};

