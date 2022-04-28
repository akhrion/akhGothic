func void ZS_Dead()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Dead");
	PrintGlobals(PD_ZS_Check);
	if(!Npc_IsCompletelyDead(self)){return;};
	if(Npc_WasConvertedIntoDeadMan(other)){return;};
	Npc_SetDeadTime(self);
	C_ZSInit();
	if(Hlp_GetInstanceID(other) == -1)
	{
		other = Hlp_GetNpc(hero);
	};
	self.aivar[AIV_PLUNDERED] = FALSE;
	if(Npc_HasReadiedRangedWeapon(other))
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = true;
	};
	if((self.id == 251) && (PLAYERINARENA == TRUE))
	{
		PLAYERINARENA = FALSE;
		Wld_SendTrigger("OC_ARENA_GATE");
		B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
		B_ExchangeRoutine(Sld_729_Kharim,"START");
	};
	if((self.id == 729) && (PLAYERINARENA == TRUE))
	{
		PLAYERINARENA = FALSE;
		Wld_SendTrigger("OC_ARENA_GATE");
		B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
		B_ExchangeRoutine(GRD_251_Kirgo,"START");
	};
	if((self.id == 1422) && (PLAYERINARENA == TRUE))
	{
		PLAYERINARENA = FALSE;
		Wld_SendTrigger("OC_ARENA_GATE");
		B_ExchangeRoutine(GRD_251_Kirgo,"START");
		B_ExchangeRoutine(Sld_729_Kharim,"START");
	};
	if(Npc_IsPlayer(self) && (PLAYERINARENA == TRUE))
	{
		PLAYERINARENA = FALSE;
		Wld_SendTrigger("OC_ARENA_GATE");
		B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
		B_ExchangeRoutine(GRD_251_Kirgo,"START");
		B_ExchangeRoutine(Sld_729_Kharim,"START");
	};
	if(
		Npc_IsPlayer(other)
	||	(
			C_NpcIsHuman(other) &&
			other.aivar[AIV_PARTYMEMBER]
		)
	||	(
			C_NpcIsMonster(other) &&
			other.aivar[AIV_MM_PARTYMEMBER]
		)
	)
	{
		Game_CheckOneShotCounters(self);
		B_DeathXP();
		if(
			Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MineCrawler) ||
			Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MinecrawlerQueen)
		)
		{
			isSCKillOMCrawler = true;
		};
	};
	Achieve_Savior(self);
	if(C_NpcIsMonster(self))
	{
		SaveReceivedDamage_Monster();
		SetVisualType(self);
		B_GiveDeathInv();
	};
	if(self.guild == GIL_ORCSHAMAN)
	{
		Npc_RemoveInvItem(self,itarrune_2_2_fireball);
	};
	B_DeathCounter();
	B_CheckDeadMissionNPCs();
	B_Respawn();
	msgSI("zs_dead recDmgHash: ",self.aivar[AIV_MM_DamageRecieved_Hash],70,70);
	msgSI("zs_dead recDmgWar: ",C_Npc_GetDamageRecieved(self,DAM_INDEX_EDGE),70,72);
	msgSI("zs_dead recDmgFire: ",C_Npc_GetDamageRecieved(self,DAM_INDEX_FIRE),70,74);
	msgSI("zs_dead recDmgMgc: ",C_Npc_GetDamageRecieved(self,DAM_INDEX_MAGIC),70,76);
	msgSI("zs_dead recDmgHunt: ",C_Npc_GetDamageRecieved(self,DAM_INDEX_POINT),70,78);
};
func int ZS_Dead_Loop()
{
	//Цикл отрабатывает некорректно
	//Спустя пару секунд он завершается. Видимо ссылка на Объект удаляется
	//Но если воскресить персонажа, то выполняется ZS_Dead_End что намекает на
	//то, что ссылка не удаляется, однако в цикл ZS_Dead_Loop мы находимся только секунду
	// после чего всякая активность пропадает; таким образом мы приходим к выводу, что ZS_Dead_Loop
	//отрабатывает только в движке, а из скриптов не подлавливается.
/*
	if(self.attribute[ATR_HITPOINTS] == 0)//Можно реализовать воскрешение.. очевидно ;(  ;)) хотя хз: рот будет открыт.. пофиксите кто-нить рот! Заглотусу этому.
	{
		msg("Мертв",90,70);
		return LOOP_CONTINUE;
	};
	msg("Воскрешен",90,70);
*/
//	if(C_NpcIsMonster(self))
//	{
//		Print("aaaaaaaaaaaaaaaaaaa");
//		if(Npc_GetStateTime(self) > 0)
//		{
//			SetVisualType(self);
//			B_GiveDeathInv();
//		};
//	};
	return LOOP_CONTINUE;
};
func void ZS_Dead_End()
{
};