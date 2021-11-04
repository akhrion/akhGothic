
func void ZS_Babe_Sleep()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_BabeSleep");
	AI_UnequipArmor(self);
	B_SetBabeDefaultPerceptions();
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"BED",1);
		AI_UseMob(self,"BEDHIGH",1);
		AI_UseMob(self,"BEDLOW",1);
	};
};

func void ZS_Babe_Sleep_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_BabeSleep_Loop");
	Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	AI_Wait(self,1);
};

func void ZS_Babe_Sleep_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_BabeSleep_End");
	AI_UseMob(self,"BED",-1);
	AI_UseMob(self,"BEDHIGH",-1);
	AI_UseMob(self,"BEDLOW",-1);
	B_ResetFaceExpression(self);
};

