
func void ZS_Speech()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Speech");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"SPEECH"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"SPEECH"))
	{
		AI_GotoFP(self,"SPEECH");
	};
	AI_AlignToFP(self);
};

func void ZS_Speech_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Speech_Loop");
	npc_main_loop(self);
	AI_Wait(self,1);
};

func void ZS_Speech_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Speech_End");
};

