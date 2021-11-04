
func void B_SetBabeDefaultPerceptions()
{
	Npc_PercEnable(self,PERC_ASSESSTALK,B_Babe_RefuseTalk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_babe_assessdamage);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_babe_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,b_babe_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_babe_assessfighter);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
};

func void b_babe_assessfighter()
{
	if(Npc_IsInFightMode(other,FMODE_FIST) && Npc_CanSeeNpcFreeLOS(self,other))
	{
		PrintDebugNpc(PD_ZS_Check,"...Fighter hat nur Fäuste 'gezogen'!");
		return;
	}
	else if(Npc_CanSeeNpcFreeLOS(self,other))
	{
		Npc_ClearAIQueue(self);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_PlayAni(self,"T_CHAIR_STANDUP_QUICK");
		}
		else if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{
			if(Npc_IsInState(self,ZS_Babe_Sleep))
			{
				AI_PlayAni(self,"T_BABEBED_STANDUP_QUICK");
			};
		};
		AI_StandupQuick(self);
		AI_StartState(self,ZS_Babe_Flee,0,"");
	};
};

func void b_babe_assessdamage()
{
	Npc_ClearAIQueue(self);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_CHAIR_STANDUP_QUICK");
	}
	else if(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		if(Npc_IsInState(self,ZS_Babe_Sleep))
		{
			AI_PlayAni(self,"T_BABEBED_STANDUP_QUICK");
		};
	};
	AI_StandupQuick(self);
	AI_StartState(self,ZS_Babe_Flee,0,"");
};

