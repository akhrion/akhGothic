
instance NOV_1341_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 14;
	flags = 0;
	voice = 2;
	id = 1341;
	attribute[ATR_STRENGTH] = 30;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 208;
	attribute[ATR_HITPOINTS] = 208;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",27,1,nov_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Mace_01);
	daily_routine = Rtn_start_1341;
};


func void Rtn_start_1341()
{
	TA_Meditate(6,27,23,52,"PSI_TEMPLE_NOVIZE_PR4_MOVEMENT");
	TA_Sleep(23,52,6,27,"PSI_8_HUT_IN");
};

func void Rtn_Ritual_1341()
{
	TA_Stay(18,0,21,0,"PSI_TEMPLE_NOVIZE_PR2");
	TA_Stay(21,0,18,0,"PSI_TEMPLE_NOVIZE_PR2");
};

