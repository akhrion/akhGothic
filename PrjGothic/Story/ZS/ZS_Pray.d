
func void ZS_Pray()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Pray");
	B_SetPerception(self);
	if(!C_BodyStateContains(self,BS_MOBINTERACT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
		AI_UseMob(self,"IDOL",1);
	};
};

func void ZS_Pray_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Pray_Loop");
	npc_main_loop(self);
	AI_Wait(self,1);
};

func void ZS_Pray_End()
{
	AI_UseMob(self,"IDOL",-1);
	PrintDebugNpc(PD_TA_FRAME,"ZS_Pray_End");
};

