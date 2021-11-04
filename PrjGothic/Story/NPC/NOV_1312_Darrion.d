
instance NOV_1312_Darrion(Npc_Default)
{
	name[0] = "Даррион";
	npcType = npctype_main;
	guild = GIL_NOV;
	level = 9;
	voice = 11;
	id = 1312;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_Bald",6,0,nov_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	B_Give_DarrionChapter1Weapons();
	EquipItem(self,tr_m_darrion);
	daily_routine = Rtn_start_1312;
};


func void Rtn_start_1312()
{
	TA_StandAround(6,10,8,30,"PSI_SMITH_03");
	TA_Smith_Fire(8,30,8,40,"PSI_SMITH_03");
	TA_Smith_Anvil(8,40,8,50,"PSI_SMITH_03");
	TA_Smith_Cool(8,50,9,0,"PSI_SMITH_03");
	TA_Smith_Sharp(9,0,9,10,"PSI_SMITH_03");
	TA_StandAround(9,10,9,30,"PSI_SMITH_03");
	TA_Smith_Fire(9,30,9,40,"PSI_SMITH_03");
	TA_Smith_Anvil(9,40,9,50,"PSI_SMITH_03");
	TA_Smith_Cool(9,50,10,0,"PSI_SMITH_03");
	TA_Smith_Sharp(10,0,10,10,"PSI_SMITH_03");
	TA_StandAround(10,10,10,30,"PSI_SMITH_03");
	TA_Smith_Fire(10,30,10,40,"PSI_SMITH_03");
	TA_Smith_Anvil(10,40,10,50,"PSI_SMITH_03");
	TA_Smith_Cool(10,50,11,0,"PSI_SMITH_03");
	TA_Smith_Sharp(11,0,11,10,"PSI_SMITH_03");
	TA_StandAround(11,10,11,30,"PSI_SMITH_03");
	TA_Smith_Fire(11,30,11,40,"PSI_SMITH_03");
	TA_Smith_Anvil(11,40,11,50,"PSI_SMITH_03");
	TA_Smith_Cool(11,50,12,0,"PSI_SMITH_03");
	TA_Smith_Sharp(12,0,12,10,"PSI_SMITH_03");
	TA_StandAround(12,10,12,30,"PSI_SMITH_03");
	TA_Smith_Fire(12,30,12,40,"PSI_SMITH_03");
	TA_Smith_Anvil(12,40,12,50,"PSI_SMITH_03");
	TA_Smith_Cool(12,50,13,0,"PSI_SMITH_03");
	TA_Smith_Sharp(13,0,13,10,"PSI_SMITH_03");
	TA_StandAround(13,10,13,30,"PSI_SMITH_03");
	TA_Smith_Fire(13,30,13,40,"PSI_SMITH_03");
	TA_Smith_Anvil(13,40,13,50,"PSI_SMITH_03");
	TA_Smith_Cool(13,50,14,0,"PSI_SMITH_03");
	TA_Smith_Sharp(14,0,14,10,"PSI_SMITH_03");
	TA_StandAround(14,10,14,30,"PSI_SMITH_03");
	TA_Smith_Fire(14,30,14,40,"PSI_SMITH_03");
	TA_Smith_Anvil(14,40,14,50,"PSI_SMITH_03");
	TA_Smith_Cool(14,50,15,0,"PSI_SMITH_03");
	TA_Smith_Sharp(15,0,15,10,"PSI_SMITH_03");
	TA_StandAround(15,10,15,30,"PSI_SMITH_03");
	TA_Smith_Fire(15,30,15,40,"PSI_SMITH_03");
	TA_Smith_Anvil(15,40,15,50,"PSI_SMITH_03");
	TA_Smith_Cool(15,50,16,0,"PSI_SMITH_03");
	TA_Smith_Sharp(16,0,16,10,"PSI_SMITH_03");
	TA_StandAround(16,10,16,30,"PSI_SMITH_03");
	TA_Smith_Fire(16,30,16,40,"PSI_SMITH_03");
	TA_Smith_Anvil(16,40,16,50,"PSI_SMITH_03");
	TA_Smith_Cool(16,50,17,0,"PSI_SMITH_03");
	TA_Smith_Sharp(17,0,17,10,"PSI_SMITH_03");
	TA_StandAround(17,10,17,30,"PSI_SMITH_03");
	TA_Smith_Fire(17,30,17,40,"PSI_SMITH_03");
	TA_Smith_Anvil(17,40,17,50,"PSI_SMITH_03");
	TA_Smith_Cool(17,50,18,0,"PSI_SMITH_03");
	TA_Smith_Sharp(18,0,18,10,"PSI_SMITH_03");
	TA_StandAround(18,10,18,30,"PSI_SMITH_03");
	TA_Smith_Fire(18,30,18,40,"PSI_SMITH_03");
	TA_Smith_Anvil(18,40,18,50,"PSI_SMITH_03");
	TA_Smith_Cool(18,50,19,0,"PSI_SMITH_03");
	TA_Smith_Sharp(19,0,19,10,"PSI_SMITH_03");
	TA_StandAround(19,10,19,30,"PSI_SMITH_03");
	TA_Smith_Fire(19,30,19,40,"PSI_SMITH_03");
	TA_Smith_Anvil(19,40,19,50,"PSI_SMITH_03");
	TA_Smith_Cool(19,50,20,0,"PSI_SMITH_03");
	TA_Smith_Sharp(20,0,20,10,"PSI_SMITH_03");
	TA_StandAround(20,10,20,30,"PSI_SMITH_03");
	TA_Smith_Fire(20,30,20,40,"PSI_SMITH_03");
	TA_Smith_Anvil(20,40,20,50,"PSI_SMITH_03");
	TA_Smith_Cool(20,50,21,0,"PSI_SMITH_03");
	TA_Smith_Sharp(21,0,21,10,"PSI_SMITH_03");
	TA_StandAround(21,10,21,30,"PSI_SMITH_03");
	TA_Smith_Fire(21,30,21,40,"PSI_SMITH_03");
	TA_Smith_Anvil(21,40,21,50,"PSI_SMITH_03");
	TA_Smith_Cool(21,50,22,0,"PSI_SMITH_03");
	TA_Smith_Sharp(22,0,22,10,"PSI_SMITH_03");
	TA_StandAround(22,10,22,30,"PSI_SMITH_03");
	TA_Smith_Fire(22,30,22,40,"PSI_SMITH_03");
	TA_Smith_Anvil(22,40,22,50,"PSI_SMITH_03");
	TA_Smith_Cool(22,50,23,0,"PSI_SMITH_03");
	TA_Smith_Sharp(23,0,23,10,"PSI_SMITH_03");
	TA_StandAround(23,10,23,30,"PSI_SMITH_03");
	TA_Sleep(23,30,6,10,"PSI_26_HUT_IN");
};

func void Rtn_PrepareRitual_1312()
{
};

func void Rtn_OMFull_1312()
{
};

func void Rtn_FMTaken_1312()
{
};

func void Rtn_OrcAssault_1312()
{
};

