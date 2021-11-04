
func int Spell_Logic_Windfist(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_Windfist");
	if((manaInvested >= 1) && (manaInvested < SPL_SENDCAST_WINDFIST))
	{
		return SPL_NEXTLEVEL;
	};
	if(manaInvested >= SPL_SENDCAST_WINDFIST)
	{
		Npc_ChangeAttribute(self,ATR_MANA,1);
		return SPL_SENDCAST;
	};
	Npc_ChangeAttribute(self,ATR_MANA,-1);
	return SPL_RECEIVEINVEST;
};

