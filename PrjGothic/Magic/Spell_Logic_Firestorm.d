
func int Spell_Logic_Firestorm(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_Firestorm");
	if((manaInvested >= 1) && (manaInvested < SPL_SENDCAST_FIRESTORM))
	{
		return SPL_NEXTLEVEL;
	};
	if(manaInvested >= SPL_SENDCAST_FIRESTORM)
	{
		Npc_ChangeAttribute(self,ATR_MANA,1);
		return SPL_SENDCAST;
	};
	Npc_ChangeAttribute(self,ATR_MANA,-1);
	return SPL_RECEIVEINVEST;
};

