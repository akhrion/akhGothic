
func void B_Story_ReturnedFromUrShak()
{
	var C_Npc riordian;
	B_LogEntry(CH4_FindOrcShaman,"Кажется, Ксардасу пригодилась история, рассказанная Ур-Шаком. Теперь я должен пойти в Свободную шахту, чтобы найти друга Ур-Шака.");
	Log_SetTopicStatus(CH4_FindOrcShaman,LOG_SUCCESS);
	Log_CreateTopic(CH4_EnterTemple,LOG_MISSION);
	Log_SetTopicStatus(CH4_EnterTemple,LOG_RUNNING);
	B_LogEntry(CH4_EnterTemple,"Я понимаю, что хочет Ксардас. Я попросил его, чтобы он помог нам разрушить Барьер. Он предложил мне один способ, который оказался никак не связан с рудной горой. Он потребовал найти вход в подземный храм Спящего.");
	B_GiveXP(XP_ReturnedFromUrShak);
	riordian = Hlp_GetNpc(KDW_605_Riordian);
	Npc_ExchangeRoutine(riordian,"FoundUrShak");
	UrShak_SpokeOfUluMulu = TRUE;
};

