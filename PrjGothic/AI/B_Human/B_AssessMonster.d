func void B_AssessMonster(var C_Npc slf, var C_Npc oth)
{
	if(C_NpcIsDangerousMonster(slf,oth))
	{
		AI_Standup(slf);
		Npc_SetTarget(slf,oth);
		Npc_GetTarget(slf);
		AI_StartState(slf,ZS_AssessMonster,0,"");
	};
};