
func int Spell_Logic_Fireball(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_Fireball");
	if((manaInvested >= 1) && (manaInvested < SPL_SENDCAST_FIREBALL))
	{
		return SPL_NEXTLEVEL;
	};
	if(manaInvested >= SPL_SENDCAST_FIREBALL)
	{
		Npc_ChangeAttribute(self,ATR_MANA,1);
		return SPL_SENDCAST;
	};
	Npc_ChangeAttribute(self,ATR_MANA,-1);
	return SPL_RECEIVEINVEST;
};

