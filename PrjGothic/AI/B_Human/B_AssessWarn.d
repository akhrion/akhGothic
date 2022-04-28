
func void B_AssessWarn()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessWarn");
	PrintGlobals(PD_ZS_Check);
	PrintAttitudes(PD_ZS_Check);
	Npc_PercDisable(self,PERC_ASSESSWARN);
	if(!C_NpcIsHuman(other))
	{
		PrintDebugNpc(PD_ZS_Check,"B_AssessWarn Monster attack someone");
		B_AssessMonster(self,other);
	}
	else if(!C_NpcIsHuman(victim))
	{
		PrintDebugNpc(PD_ZS_Check,"B_AssessWarn Human attack Monster");
		B_AssessMonster(self,victim);
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"B_AssessWarn Human attack Human");
		B_FullStop(self);
		AI_StartState(self,ZS_AssessWarn,0,"");
	};
};

