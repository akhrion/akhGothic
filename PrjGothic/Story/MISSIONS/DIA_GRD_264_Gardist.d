
instance Grd_264_Gardist_GARDEAUFNAHME(C_Info)
{
	npc = GRD_264_Gardist;
	condition = Grd_264_Gardist_GARDEAUFNAHME_Condition;
	information = Grd_264_Gardist_GARDEAUFNAHME_Info;
	important = 1;
	permanent = 0;
};


func int Grd_264_Gardist_GARDEAUFNAHME_Condition()
{
	if((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) && (Npc_GetTrueGuild(hero) == GIL_STT) && !Npc_KnowsInfo(hero,Grd_260_Drake_GARDEAUFNAHME))
	{
		return TRUE;
	};
};

func void Grd_264_Gardist_GARDEAUFNAHME_Info()
{
	AI_Output(self,other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_01");	//��, �������� ������. �� ����������� � ���������! �� ������� ���� ����� �� ����������! �� ��� ��������.
	AI_Output(self,other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_02");	//��� � ������ ������ � �������� � �������.
	Log_CreateTopic(GE_BecomeGuard,LOG_NOTE);
	B_LogEntry(GE_BecomeGuard,"����� � ������ ���� �������� �� �����, �� ������ ���� ���������� � �������. ����� ����, �� �������� ���� � ���� ����������.");
};

