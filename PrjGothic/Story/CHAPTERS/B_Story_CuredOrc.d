
func void B_Story_CuredOrc()
{
	B_LogEntry(CH4_UluMulu,"� ����� ����-���� ������� �������� �����, � �� ������, ��� ������ ��� ������.");
	B_GiveXP(XP_CuredOrcSlave);
	FreemineOrc_SuchePotion = LOG_SUCCESS;
	FreemineOrc_LookingUlumulu = LOG_RUNNING;
	b_learn_trophies_ulumulu();
};

