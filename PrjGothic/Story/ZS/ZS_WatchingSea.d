
func void ZS_WatchIngSea()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Stay");
	B_SetPerception(self);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	if(Npc_HasReadiedWeapon(self))
	{
		AI_SetWalkMode(self,NPC_RUN);
	}
	else
	{
		AI_SetWalkMode(self,NPC_WALK);
	};
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func void ZS_WatchIngSea_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Stay_Loop");
	npc_main_loop(self);
	AI_Wait(self,1);
};

func void ZS_WatchIngSea_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Stay_End");
	self.senses = hero.senses;
	C_StopLookAt(self);
};

