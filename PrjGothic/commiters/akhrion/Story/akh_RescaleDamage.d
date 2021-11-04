func void akh_RescaleMeleeDamage(var C_NPC npc, var C_ITEM wpn)
{
};
func void akh_RescaleBowDamage(var C_Npc npc_, var C_Item bow_)
{
	bow_.damage[DAM_INDEX_POINT] =
		npc_.attribute[ATR_DEXTERITY] * bow_.cond_value[1];
};
func void akh_RescaleCrossBowDamage()
{
};
func void akh_RescaleDamage(var c_npc npc_)
{
	if(C_NpcIsInFightMode(npc_))
	{
		var C_Item wpn;
		wpn = Npc_GetReadiedWeapon(npc_);
															msgI(wpn.damagetype,10,40);
															msgI(wpn.flags,10,42);
															msgI(ITEM_BOW,10,44);
															msg("STARTED", 10, 48);
															msgSI(
																"Return: ",
																isFlagsContainCategorie
																(
																	wpn.flags,
																	ITEM_BOW
																),10,46
															);

															msgSI(
																"Ret: ",
																t(
																	wpn.flags,
																	ITEM_BOW
																), 10, 50
															);


		if(Wld_DetectItem(npc_, ITEM_BOW))
		{
															msg("wld_detectItem ",11,44);
															msg(item.name, 11,45);
			
		};
		if(
			isFlagsContainCategorie(wpn.flags,ITEM_BOW) ||
			isFlagsContainCategorie(wpn.flags,ITEM_CROSSBOW)
		)
		{
															msg("inside",10,44);
			akh_RescaleBowDamage(npc_, wpn);
		};
	};
};
func void akh_DamageSystem()
{
};