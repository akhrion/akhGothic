
func void B_CheckDeadMissionNPCs()
{
	if(Hlp_GetInstanceID(Org_844_Lefty) == Hlp_GetInstanceID(self))
	{
		if(Lefty_Mission == LOG_RUNNING)
		{
			B_LogEntry(CH1_CarryWater,"После смерти Лефти проблема с водой была решена. Этот тип все равно был невыносим.");
			Log_SetTopicStatus(CH1_CarryWater,LOG_SUCCESS);
			LeftyDead = TRUE;
		};
	};
	if(Hlp_GetInstanceID(BAU_935_Homer) == Hlp_GetInstanceID(self))
	{
		if(Homer_DamLurker == LOG_RUNNING)
		{
			Homer_DamLurker = LOG_FAILED;
			Log_SetTopicStatus(CH1_DamLurker,LOG_FAILED);
		};
	};
	if(Hlp_GetInstanceID(SLD_753_Baloro) == Hlp_GetInstanceID(self))
	{
		if((SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING) && (FMTaken == FALSE))
		{
			SLD_753_Baloro_SC_besorgt_den_Kram = LOG_FAILED;
			Log_SetTopicStatus(Baloros_Waffe,LOG_FAILED);
		};
	};
	if(Hlp_GetInstanceID(VLK_581_Snaf) == Hlp_GetInstanceID(self))
	{
		if(Snaf_Zutaten == LOG_RUNNING)
		{
			Snaf_Zutaten = LOG_FAILED;
			Log_SetTopicStatus(CH1_SnafsRecipe,LOG_FAILED);
		};
	};
};

