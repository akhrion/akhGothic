
func void b_failch4quests()
{
	if(GETNEWGUY_STARTED == TRUE)
	{
		B_LogEntry(CH1_RecruitDusty,"������ � �� ����� ������� ����-���� �� ������� ������.");
		Log_SetTopicStatus(CH1_RecruitDusty,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	if(Npc_KnowsInfo(hero,grd_271_ulbert_trick) && !Npc_KnowsInfo(hero,grd_271_ulbert_angry))
	{
		B_LogEntry(CH2_StorageShed,"� ������ ����� ��������� �����, ������ ���� �� �������!");
		Log_SetTopicStatus(CH2_StorageShed,LOG_FAILED);
	};
	if(Npc_KnowsInfo(hero,VLK_584_Snipes_DEAL) && !Npc_KnowsInfo(hero,GRD_262_Aaron_SELLNOW))
	{
		B_LogEntry(CH2_SnipesDeal,"������ ����� ����������! � �� ����� ��������� ������� �������...");
		Log_SetTopicStatus(CH2_SnipesDeal,LOG_FAILED);
	};
	if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,ORG_801_Lares_BringListBack))
	{
		B_LogEntry(THELISTFORNC,"������ �������� ��� ������ ����� � ���� ����� ������ �� ����� �������� ������.");
		Log_SetTopicStatus(THELISTFORNC,LOG_FAILED);
		Lares_BringListBack = LOG_FAILED;
		Diego_BringList = LOG_FAILED;
	};
	if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer) && !Npc_KnowsInfo(hero,Info_Diego_BringList_Success))
	{
		B_LogEntry(CH1_BringList,"������ �������� ��� ������ ����� ������ �� ����� �������� ������.");
		Log_SetTopicStatus(CH1_BringList,LOG_FAILED);
		Lares_BringListBack = LOG_FAILED;
		Diego_BringList = LOG_FAILED;
	};
	if((Cronos_Messenger == LOG_RUNNING) && !Npc_KnowsInfo(hero,DIA_Milten_NochEinBrief))
	{
		B_LogEntry(KDWLETTER,"��� ���� ���� ������, � �� ����� �������� �� ������...");
		Log_SetTopicStatus(KDWLETTER,LOG_FAILED);
		Cronos_Messenger = LOG_FAILED;
	};
	if(PYROCAR_MESSENGER == LOG_RUNNING)
	{
		B_LogEntry(KDFLETTER,"��� ���� ���� ������, � �� ����� �������� �� ������...");
		Log_SetTopicStatus(KDFLETTER,LOG_FAILED);
		PYROCAR_MESSENGER = LOG_FAILED;
	};
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		Dexter_GetKalomsRecipe = LOG_FAILED;
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_FAILED);
		B_LogEntry(CH1_KalomsRecipe,"�� �����, ��� ������ �������� ��� �����.");
	};
	if(Fisk_GetNewHehler == LOG_RUNNING)
	{
		Fisk_GetNewHehler = LOG_FAILED;
		Log_SetTopicStatus(CH1_FiskNewDealer,LOG_FAILED);
		B_LogEntry(CH1_FiskNewDealer,"������ ����� �������� �������� �����, ����� �� ���������� �� �����!");
	};
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		Snaf_Zutaten = LOG_FAILED;
		Log_SetTopicStatus(CH1_SnafsRecipe,LOG_FAILED);
		B_LogEntry(CH1_SnafsRecipe,"������ ����� �� ���������� � ������ ������...");
	};
	if(Thorus_MordragKo == LOG_RUNNING)
	{
		Thorus_MordragKo = LOG_FAILED;
		Log_SetTopicStatus(CH1_MordragKO,LOG_FAILED);
		B_LogEntry(CH1_MordragKO,"������ ����� �� ���������� � ������ ������...");
	};
};

