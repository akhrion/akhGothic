
func int Spell_Logic_Trf_Meatbug(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_Transform");
	if(manaInvested >= SPL_SENDCAST_TRF_MEATBUG)
	{
		Npc_SetActiveSpellInfo(self,Meatbug);
		if(Npc_KnowsInfo(hero,Info_Gorn_RUINWALL))
		{
			TRF_MEATBUG_USED = TRUE;
		};
		return SPL_SENDCAST;
	};
	return SPL_NEXTLEVEL;
};

