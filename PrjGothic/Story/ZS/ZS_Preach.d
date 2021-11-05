
func void ZS_Preach()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Preach");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"PREACH"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"PREACH"))
	{
		AI_GotoFP(self,"PREACH");
		AI_AlignToFP(self);
	};
};

func void ZS_Preach_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Preach_Loop");
	npc_main_loop(self);
	AI_Wait(self,1);
};

func void ZS_Preach_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Preach_End");
};

