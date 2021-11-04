
func int Spell_Logic_Thunderball(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_Thunderball");
	if((manaInvested >= 1) && (manaInvested < SPL_SENDCAST_THUNDERBALL))
	{
		return SPL_NEXTLEVEL;
	};
	if(manaInvested >= SPL_SENDCAST_THUNDERBALL)
	{
		Npc_ChangeAttribute(self,ATR_MANA,1);
		return SPL_SENDCAST;
	};
	Npc_ChangeAttribute(self,ATR_MANA,-1);
	return SPL_RECEIVEINVEST;
};

