
func int Spell_Logic_FirerainInv(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_FirerainInv");
	var int npcCircle;
	npcCircle = Npc_GetTalentSkill(self,NPC_TALENT_MAGE);
	if(npcCircle)
	{
		if(Npc_GetActiveSpellLevel(self) < 2)
		{
			SPL_DAMAGE_FIRERAIN = 100;
		};
		if(manaInvested >= SPL_SENDCAST_FIRERAIN)
		{
			Spell_FireRainInv.damage_per_level = SPL_DAMAGE_FIRERAIN;
			return SPL_SENDCAST;
		};
		if((manaInvested >= 1) && (manaInvested < SPL_SENDCAST_FIRERAIN))
		{
			SPL_DAMAGE_FIRERAIN += 100;
			return SPL_NEXTLEVEL;
		};
	}
	else
	{
		if(manaInvested == 1)
		{
			return SPL_NEXTLEVEL;
		};
		if(manaInvested >= SPL_SENDCAST_FIRERAIN)
		{
			return SPL_SENDCAST;
		};
	};
	return SPL_RECEIVEINVEST;
};

