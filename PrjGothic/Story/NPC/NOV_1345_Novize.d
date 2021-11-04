
instance NOV_1345_Novize(Npc_Default)
{
	name[0] = NAME_Novize;
	npcType = npctype_ambient;
	guild = GIL_NOV;
	level = 9;
	voice = 5;
	id = 1345;
	attribute[ATR_STRENGTH] = 15;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 148;
	attribute[ATR_HITPOINTS] = 148;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",22,1,nov_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Axe_Old_01);
	daily_routine = Rtn_start_1345;
};


func void Rtn_start_1345()
{
	TA_Sleep(2,0,7,10,"PSI_24_HUT_IN");
	TA_Listen(7,10,2,0,"PSI_TEACH_CADAR");
};

func void rtn_remove_1345()
{
	TA_Stay(23,0,7,45,"WP_INTRO01");
	TA_Stay(7,45,23,0,"WP_INTRO01");
};

