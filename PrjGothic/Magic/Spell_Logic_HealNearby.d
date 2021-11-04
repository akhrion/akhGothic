
func int Spell_Logic_HealNearby(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_HealNearby");
	Spell_HealNearby.targetCollectRange = 10 * self.attribute[ATR_MANA_MAX];
	if(Npc_GetTarget(self))
	{
		if(other.attribute[ATR_HITPOINTS] == other.attribute[ATR_HITPOINTS_MAX])
		{
			return SPL_SENDSTOP;
		}
		else if(manaInvested >= 1)
		{
			if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
			{
				Npc_ChangeAttribute(other,ATR_HITPOINTS,SPL_HEALING_HP_PER_MP);
				return SPL_NEXTLEVEL;
			};
		};
	};
	return SPL_RECEIVEINVEST;
};
func int Spell_Logic_HealNearby2(var int manaInvested)
{
	PrintDebugNpc(PD_MAGIC,"Spell_Logic_HealNearby");
	Spell_HealNearby.targetCollectRange = 1 * self.attribute[ATR_MANA_MAX];
	if(Npc_GetTarget(self))
	{
		if(other.attribute[ATR_HITPOINTS] == other.attribute[ATR_HITPOINTS_MAX])
		{
			return SPL_SENDSTOP;
		}
		else if(manaInvested >= 1)
		{
			if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
			{
				Npc_ChangeAttribute(other,ATR_HITPOINTS,SPL_HEALING_HP_PER_MP);
				return SPL_NEXTLEVEL;
			};
		};
	};
	return SPL_RECEIVEINVEST;
};

