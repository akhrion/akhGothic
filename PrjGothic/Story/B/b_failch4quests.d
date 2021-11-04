
func void b_failch4quests()
{
	if(GETNEWGUY_STARTED == TRUE)
	{
		B_LogEntry(CH1_RecruitDusty,"Теперь я не смогу вывести кого-либо из Старого лагеря.");
		Log_SetTopicStatus(CH1_RecruitDusty,LOG_FAILED);
		GETNEWGUY_STARTED = LOG_FAILED;
	};
	if(Npc_KnowsInfo(hero,grd_271_ulbert_trick) && !Npc_KnowsInfo(hero,grd_271_ulbert_angry))
	{
		B_LogEntry(CH2_StorageShed,"В Старой шахте произошел обвал, теперь туда не попасть!");
		Log_SetTopicStatus(CH2_StorageShed,LOG_FAILED);
	};
	if(Npc_KnowsInfo(hero,VLK_584_Snipes_DEAL) && !Npc_KnowsInfo(hero,GRD_262_Aaron_SELLNOW))
	{
		B_LogEntry(CH2_SnipesDeal,"Старая шахта обрушилась! Я не смогу выполнить просьбу Снайпса...");
		Log_SetTopicStatus(CH2_SnipesDeal,LOG_FAILED);
	};
	if(Npc_KnowsInfo(hero,org_801_lares_newlist) && !Npc_KnowsInfo(hero,ORG_801_Lares_BringListBack))
	{
		B_LogEntry(THELISTFORNC,"Список припасов для Старой шахты и план Ларса больше не имеют никакого смысла.");
		Log_SetTopicStatus(THELISTFORNC,LOG_FAILED);
		Lares_BringListBack = LOG_FAILED;
		Diego_BringList = LOG_FAILED;
	};
	if(Npc_KnowsInfo(hero,Info_Diego_BringList_Offer) && !Npc_KnowsInfo(hero,Info_Diego_BringList_Success))
	{
		B_LogEntry(CH1_BringList,"Список припасов для Старой шахты больше не имеет никакого смысла.");
		Log_SetTopicStatus(CH1_BringList,LOG_FAILED);
		Lares_BringListBack = LOG_FAILED;
		Diego_BringList = LOG_FAILED;
	};
	if((Cronos_Messenger == LOG_RUNNING) && !Npc_KnowsInfo(hero,DIA_Milten_NochEinBrief))
	{
		B_LogEntry(KDWLETTER,"Все маги Огня мертвы, я не успел передать им письмо...");
		Log_SetTopicStatus(KDWLETTER,LOG_FAILED);
		Cronos_Messenger = LOG_FAILED;
	};
	if(PYROCAR_MESSENGER == LOG_RUNNING)
	{
		B_LogEntry(KDFLETTER,"Все маги Огня мертвы, я не успел передать им письмо...");
		Log_SetTopicStatus(KDFLETTER,LOG_FAILED);
		PYROCAR_MESSENGER = LOG_FAILED;
	};
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		Dexter_GetKalomsRecipe = LOG_FAILED;
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_FAILED);
		B_LogEntry(CH1_KalomsRecipe,"Не думаю, что теперь Декстеру это нужно.");
	};
	if(Fisk_GetNewHehler == LOG_RUNNING)
	{
		Fisk_GetNewHehler = LOG_FAILED;
		Log_SetTopicStatus(CH1_FiskNewDealer,LOG_FAILED);
		B_LogEntry(CH1_FiskNewDealer,"Теперь между лагерями открытая война, никто не согласится на такое!");
	};
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		Snaf_Zutaten = LOG_FAILED;
		Log_SetTopicStatus(CH1_SnafsRecipe,LOG_FAILED);
		B_LogEntry(CH1_SnafsRecipe,"Теперь лучше не появляться в Старом лагере...");
	};
	if(Thorus_MordragKo == LOG_RUNNING)
	{
		Thorus_MordragKo = LOG_FAILED;
		Log_SetTopicStatus(CH1_MordragKO,LOG_FAILED);
		B_LogEntry(CH1_MordragKO,"Теперь лучше не появляться в Старом лагере...");
	};
};

