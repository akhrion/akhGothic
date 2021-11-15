func int C_Npc_GetRange_Hear_F(var C_NPC npc)
{
	return ((npc.senses_range / 10000000) % 100);
};
func int C_Npc_GetRange_Hear_L(var C_NPC npc)
{
	return (npc.senses_range / 1000000 % 10);
};
func int Npc_GetRange_Hear(var C_NPC npc)
{
	return expon(
		C_Npc_GetRange_Hear_F(npc),
		C_Npc_GetRange_Hear_L(npc)
	);
};

func int C_Npc_GetRange_See_F(var C_NPC npc)
{
	return ((npc.senses_range / 10000) % 100);
};
func int C_Npc_GetRange_See_L(var C_NPC npc)
{
	return (npc.senses_range / 1000 % 10);
};
func int Npc_GetRange_See(var C_NPC npc)
{
	return expon(
		C_Npc_GetRange_See_F(npc),
		C_Npc_GetRange_See_L(npc)
	);
};

func int C_Npc_GetRange_Smell_F(var C_NPC npc)
{
	return ((npc.senses_range / 10) % 100);
};
func int C_Npc_GetRange_Smell_L(var C_NPC npc)
{
	return (npc.senses_range % 10);
};
func int Npc_GetRange_Smell(var C_NPC npc)
{
	return expon(
		C_Npc_GetRange_Smell_F(npc),
		C_Npc_GetRange_Smell_L(npc)
	);
};
