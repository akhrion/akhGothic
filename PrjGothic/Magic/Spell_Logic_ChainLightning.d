
func int Spell_Logic_ChainLightning(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_ChainLightning");
	if(manaInvested >= 1)
	{
		return SPL_NEXTLEVEL;
	};
	return SPL_RECEIVEINVEST;
};

