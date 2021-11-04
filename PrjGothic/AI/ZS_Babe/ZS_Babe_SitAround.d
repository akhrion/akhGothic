
func void ZS_Babe_SitAround()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_BabeSitAround");
	AI_UnequipArmor(self);
	B_SetBabeDefaultPerceptions();
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Babe_SitAround_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_BabeSitAround_Loop");
	if(!C_BodyStateContains(self,BS_SIT))
	{
		if(Wld_IsMobAvailable(self,"CHAIR"))
		{
			AI_UseMob(self,"CHAIR",1);
		};
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_Babe_SitAround_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_BabeSitAround_End");
	AI_UseMob(self,"CHAIR",-1);
};

