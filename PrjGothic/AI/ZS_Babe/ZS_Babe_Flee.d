
func void ZS_Babe_Flee()
{
	B_FullStop(self);
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Babe_Flee");
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	AI_SetWalkMode(self,NPC_RUN);
	B_Say(self,NULL,"$HELP");
	AI_UnequipArmor(self);
	if(!Hlp_IsValidNpc(other))
	{
		PrintDebugNpc(PD_ZS_Check,"Other nicht Valid.");
		AI_ContinueRoutine(self);
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"Ich hau lieber ab.");
		Npc_SetTarget(self,other);
		Npc_GetTarget(self);
		AI_Flee(self);
	};
};

func void ZS_Babe_Flee_Loop()
{
	var int state_time;
	var string state_time_str;
	PrintDebugNpc(PD_ZS_LOOP,"ZS_Babe_Flee_Loop");
	AI_Flee(self);
	state_time = Npc_GetStateTime(self);
	state_time_str = IntToString(state_time);
	if(Npc_GetStateTime(self) >= 5)
	{
		AI_ContinueRoutine(self);
	};
};

func void ZS_Babe_Flee_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Babe_Flee_End");
};

