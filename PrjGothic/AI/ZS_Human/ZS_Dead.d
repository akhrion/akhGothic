func void ZS_Dead()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Dead");
	PrintGlobals(PD_ZS_Check);
	C_ZSInit();
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
		Npc_IsPlayer(other) ||
		(
			C_NpcIsHuman(other) &&
			other.aivar[AIV_PARTYMEMBER]
		) ||
		(
			C_NpcIsMonster(other) &&
			other.aivar[AIV_MM_PARTYMEMBER]
		)
	)
	{
		B_DeathXP();
		if(
			Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MineCrawler) ||
			Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MinecrawlerQueen)
		)
		{
			isSCKillOMCrawler = true;
		};
	};
//	PrintSI("zs_dead isBurned: ",Npc_IsBurned(self));
//	PrintSI("zs_dead dmgReciv: ",C_Npc_GetDamageRecieved(self,DAM_INDEX_FIRE));
//	msgSI("zs_dead isBurned: ",Npc_IsBurned(self),70,60);
//	msgSI("zs_dead dmgReciv: ",C_Npc_GetDamageRecieved(self,DAM_INDEX_FIRE),70,62);
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
	//���� ������������ �����������
	//������ ���� ������ �� �����������. ������ ������ �� ������ ���������
	//�� ���� ���������� ���������, �� ����������� ZS_Dead_End ��� �������� ��
	//��, ��� ������ �� ���������, ������ � ���� ZS_Dead_Loop �� ��������� ������ �������
	// ����� ���� ������ ���������� ���������; ����� ������� �� �������� � ������, ��� ZS_Dead_Loop
	//������������ ������ � ������, � �� �������� �� ��������������.
/*
	if(self.attribute[ATR_HITPOINTS] == 0)//����� ����������� �����������.. �������� ;(  ;)) ���� ��: ��� ����� ������.. ��������� ���-���� ���! ��������� �����.
	{
		msg("�����",90,70);
		return LOOP_CONTINUE;
	};
	msg("���������",90,70);
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