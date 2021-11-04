
func void ZS_WaitForPassage()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_WaitForPassage");
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_ObserveIntruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	self.aivar[AIV_MOVINGMOB] = 1;
};

func int ZS_WaitForPassage_Loop()
{
	var string door;
	PrintDebugNpc(PD_ZS_LOOP,"ZS_WaitForPassage_Loop");
	if(Npc_IsWayBlocked(self))
	{
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...Path is no longer blocked!");
		return LOOP_END;
	};
	door = Npc_GetDetectedMob(self);
	PrintDebugNpc(PD_ZS_Check,ConcatStrings("...mob: ",door));
	if(Hlp_StrCmp(door,"DOOR"))
	{
		if(Wld_GetMobState(self,door) == 0)
		{
			Npc_ClearAIQueue(self);
			AI_UseMob(self,door,1);
			AI_UseMob(self,door,-1);
		};
	};
	AI_Wait(self,0.5);
	return LOOP_CONTINUE;
};

func void ZS_WaitForPassage_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_WaitForPassage_End");
	self.aivar[AIV_MOVINGMOB] = 0;
};

