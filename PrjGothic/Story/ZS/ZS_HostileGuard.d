
func void ZS_HostileGuard()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_HostileGuard");
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	GuardPerception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	self.senses_range = 1000;//zdes bylo "npc" -> "Error: Unknown identifier: NPC" polagau "npc" dolzhno bylo raskryvatsja v g_const
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	B_InitArmor();
};

func void ZS_HostileGuard_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_HostileGuard_Loop");
	npc_main_loop(self);
	B_GotoFP(self,"GUARD");
	B_PlayArmor();
	AI_Wait(self,0.5);
};

func void ZS_HostileGuard_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_HostileGuard_End");
	B_ExitArmor();
};

