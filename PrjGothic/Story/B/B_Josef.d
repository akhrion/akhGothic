func int Josef_IsOrcDog(var C_NPC npc)
{
	if(
		Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(OrcDogAgressive1)
	||	Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(OrcDogAgressive2)
	||	Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(OrcDogAgressive3)
	)
	{
		return true;
	};
	return false;
};
func int Josef_IsOrcDogsDead()
{
	if(
		Npc_IsDead(OrcDogAgressive1)
	&&	Npc_IsDead(OrcDogAgressive2)
	&&	Npc_IsDead(OrcDogAgressive3)
	)
	{
		return true;
	};
	return false;
};
func void Josef_StartOrcDogsFight()
{
	isJosefFightWaitPlayer = false;
	Josef_isOrcDogsFightHappen = true;
	B_ClearImmortal(OrcDogAgressive1);
	B_ClearImmortal(OrcDogAgressive2);
	B_ClearImmortal(OrcDogAgressive3);
	B_ClearImmortal(GRD_238_Gardist);
	B_ClearImmortal(GRD_237_Gardist);
};