
func void B_Story_SentToNC()
{
	var C_Npc gorn;
	gorn = Hlp_GetNpc(PC_Fighter);
	PrintDebugNpc(PD_MISSION,gorn.name);
	Npc_ExchangeRoutine(gorn,"NCWAIT");
	AI_ContinueRoutine(gorn);
	CreateInvItem(self,itarrune_1_5_teleport5);
	B_GiveInvItems(self,hero,itarrune_1_5_teleport5,1);
};

