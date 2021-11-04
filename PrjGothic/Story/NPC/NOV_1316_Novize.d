
instance NOV_1316_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 3;
	voice = 2;
	id = 1316;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 76;
	attribute[ATR_HITPOINTS] = 76;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",32,1,nov_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1H_Hatchet_01);
	CreateInvItem(self,ItMw_1H_Sledgehammer_01);
	daily_routine = Rtn_start_1316;
};


func void Rtn_start_1316()
{
	TA_StandAround(7,50,8,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(8,20,8,30,"PSI_SMITH_01");
	TA_Smith_Anvil(8,30,8,40,"PSI_SMITH_01");
	TA_Smith_Cool(8,40,8,50,"PSI_SMITH_01");
	TA_Smith_Sharp(8,50,8,55,"PSI_SMITH_01");
	TA_StandAround(8,55,9,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(9,20,9,30,"PSI_SMITH_01");
	TA_Smith_Anvil(9,30,9,40,"PSI_SMITH_01");
	TA_Smith_Cool(9,40,9,50,"PSI_SMITH_01");
	TA_Smith_Sharp(9,50,9,55,"PSI_SMITH_01");
	TA_StandAround(9,55,10,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(10,20,10,30,"PSI_SMITH_01");
	TA_Smith_Anvil(10,30,10,40,"PSI_SMITH_01");
	TA_Smith_Cool(10,40,10,50,"PSI_SMITH_01");
	TA_Smith_Sharp(10,50,10,55,"PSI_SMITH_01");
	TA_StandAround(10,55,11,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(11,20,11,30,"PSI_SMITH_01");
	TA_Smith_Anvil(11,30,11,40,"PSI_SMITH_01");
	TA_Smith_Cool(11,40,11,50,"PSI_SMITH_01");
	TA_Smith_Sharp(11,50,11,55,"PSI_SMITH_01");
	TA_StandAround(11,55,12,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(12,20,12,30,"PSI_SMITH_01");
	TA_Smith_Anvil(12,30,12,40,"PSI_SMITH_01");
	TA_Smith_Cool(12,40,12,50,"PSI_SMITH_01");
	TA_Smith_Sharp(12,50,12,55,"PSI_SMITH_01");
	TA_StandAround(12,55,13,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(13,20,13,30,"PSI_SMITH_01");
	TA_Smith_Anvil(13,30,13,40,"PSI_SMITH_01");
	TA_Smith_Cool(13,40,13,50,"PSI_SMITH_01");
	TA_Smith_Sharp(13,50,13,55,"PSI_SMITH_01");
	TA_StandAround(13,55,14,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(14,20,14,30,"PSI_SMITH_01");
	TA_Smith_Anvil(14,30,14,40,"PSI_SMITH_01");
	TA_Smith_Cool(14,40,14,50,"PSI_SMITH_01");
	TA_Smith_Sharp(14,50,14,55,"PSI_SMITH_01");
	TA_StandAround(14,55,15,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(15,20,15,30,"PSI_SMITH_01");
	TA_Smith_Anvil(15,30,15,40,"PSI_SMITH_01");
	TA_Smith_Cool(15,40,15,50,"PSI_SMITH_01");
	TA_Smith_Sharp(15,50,15,55,"PSI_SMITH_01");
	TA_StandAround(15,55,16,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(16,20,16,30,"PSI_SMITH_01");
	TA_Smith_Anvil(16,30,16,40,"PSI_SMITH_01");
	TA_Smith_Cool(16,40,16,50,"PSI_SMITH_01");
	TA_Smith_Sharp(16,50,16,55,"PSI_SMITH_01");
	TA_StandAround(16,55,17,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(17,20,17,30,"PSI_SMITH_01");
	TA_Smith_Anvil(17,30,17,40,"PSI_SMITH_01");
	TA_Smith_Cool(17,40,17,50,"PSI_SMITH_01");
	TA_Smith_Sharp(17,50,17,55,"PSI_SMITH_01");
	TA_StandAround(17,55,18,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(18,20,18,30,"PSI_SMITH_01");
	TA_Smith_Anvil(18,30,18,40,"PSI_SMITH_01");
	TA_Smith_Cool(18,40,18,50,"PSI_SMITH_01");
	TA_Smith_Sharp(18,50,18,55,"PSI_SMITH_01");
	TA_StandAround(18,55,19,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(19,20,19,30,"PSI_SMITH_01");
	TA_Smith_Anvil(19,30,19,40,"PSI_SMITH_01");
	TA_Smith_Cool(19,40,19,50,"PSI_SMITH_01");
	TA_Smith_Sharp(19,50,19,55,"PSI_SMITH_01");
	TA_StandAround(19,55,20,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(20,20,20,30,"PSI_SMITH_01");
	TA_Smith_Anvil(20,30,20,40,"PSI_SMITH_01");
	TA_Smith_Cool(20,40,20,50,"PSI_SMITH_01");
	TA_Smith_Sharp(20,50,20,55,"PSI_SMITH_01");
	TA_StandAround(20,55,21,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(21,20,21,30,"PSI_SMITH_01");
	TA_Smith_Anvil(21,30,21,40,"PSI_SMITH_01");
	TA_Smith_Cool(21,40,21,50,"PSI_SMITH_01");
	TA_Smith_Sharp(21,50,21,55,"PSI_SMITH_01");
	TA_StandAround(21,55,22,20,"PSI_SMITH_1_2");
	TA_Smith_Fire(22,20,22,30,"PSI_SMITH_01");
	TA_Smith_Anvil(21,30,21,40,"PSI_SMITH_01");
	TA_Smith_Cool(21,40,21,50,"PSI_SMITH_01");
	TA_Smith_Sharp(21,50,21,55,"PSI_SMITH_01");
	TA_StandAround(21,55,22,40,"PSI_SMITH_1_2");
	TA_Sleep(22,40,7,50,"PSI_22_HUT_IN");
};

func void Rtn_PrepareRitual_1316()
{
};

func void Rtn_OMFull_1316()
{
};

func void Rtn_FMTaken_1316()
{
};

func void Rtn_OrcAssault_1316()
{
};

