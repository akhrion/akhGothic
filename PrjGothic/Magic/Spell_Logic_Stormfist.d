
func int Spell_Logic_Stormfist(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_Stormfist");
	if((manaInvested >= 1) && (manaInvested < SPL_SENDCAST_STORMFIST))
	{
		return SPL_NEXTLEVEL;
	};
	if(manaInvested >= SPL_SENDCAST_STORMFIST)
	{
		Npc_ChangeAttribute(self,ATR_MANA,1);
		return SPL_SENDCAST;
	};
	Npc_ChangeAttribute(self,ATR_MANA,-1);
	return SPL_RECEIVEINVEST;
};

