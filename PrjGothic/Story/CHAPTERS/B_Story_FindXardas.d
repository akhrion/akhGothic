
func void B_Story_FindXardas()
{
	Log_CreateTopic(CH4_FindXardas,LOG_MISSION);
	Log_SetTopicStatus(CH4_FindXardas,LOG_RUNNING);
	B_LogEntry(CH4_FindXardas,"����� �������� ����� ����� ���� ������� ��� ���� ������ �������� ������ ����. ������� ������, ��� ������ ��������� ���������� �����, � �� ����������, ��� ��� ������.");
	B_LogEntry(CH4_FindXardas,"������������ ���� ����� �������. ������ �� ����� � ������ �����, � ����� �����. � �������� ����� ��� � ��������� � ������.");
	Wld_InsertNpc(XardasDemon,"DT_E1_06");
	Wld_InsertNpc(KDF_404_Xardas,"DT_E3_07");
	B_Give_XardasChapter4Runes();
	FindXardas = TRUE;
};

