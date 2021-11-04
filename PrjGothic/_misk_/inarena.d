
func int inarena(var C_Npc who)
{
	if(Npc_GetDistToWP(who,"OCR_ARENABATTLE") < 500)
	{
		return 1;
	};
	return 0;
};

func void zs_afight()
{
	AI_SetWalkMode(self,NPC_RUN);
	if(!Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self,self.wp);
	};
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_CombatReactToDamage);
	if((self.id == 251) && !Npc_HasItems(self,itmw_kirgo) && !Npc_HasItems(self,ItMw_1H_Sword_01))
	{
		CreateInvItem(self,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	if((self.id == 729) && !Npc_HasItems(self,itmw_kharim) && !Npc_HasItems(self,ItMw_1H_Sword_01))
	{
		CreateInvItem(self,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	if((self.id == 1422) && !Npc_HasItems(self,itmw_gorhanis) && !Npc_HasItems(self,ItMw_1H_Sword_01))
	{
		CreateInvItem(self,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(self);
	};
	self.attribute[ATR_HITPOINTS] = 1000;
	self.attribute[ATR_HITPOINTS_MAX] = 1000;
	self.flags = NPC_FLAG_IMMORTAL;
	B_ExchangeRoutine(grd_998_gardist,"START");
};

func int zs_afight_loop()
{
	if((self.id == 251) && Wld_IsTime(19,10,20,18) && (PLAYERINARENA == FALSE))
	{
		Npc_SetTarget(self,Sld_729_Kharim);
	};
	if((self.id == 251) && Wld_IsTime(20,20,21,40) && (PLAYERINARENA == FALSE))
	{
		Npc_SetTarget(self,Tpl_1422_GorHanis);
	};
	if((self.id == 729) && Wld_IsTime(19,10,20,18) && (PLAYERINARENA == FALSE))
	{
		Npc_SetTarget(self,GRD_251_Kirgo);
	};
	if((self.id == 729) && Wld_IsTime(21,40,22,58) && (PLAYERINARENA == FALSE))
	{
		Npc_SetTarget(self,Tpl_1422_GorHanis);
	};
	if((self.id == 1422) && Wld_IsTime(20,20,21,40) && (PLAYERINARENA == FALSE))
	{
		Npc_SetTarget(self,GRD_251_Kirgo);
	};
	if((self.id == 1422) && Wld_IsTime(21,40,22,58) && (PLAYERINARENA == FALSE))
	{
		Npc_SetTarget(self,Sld_729_Kharim);
	};
	AI_StartState(self,ZS_Attack,1,"");
	return LOOP_CONTINUE;
};

func void zs_afight_end()
{
	B_FullStop(self);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,other));
	B_RemoveWeapon(self);
};

