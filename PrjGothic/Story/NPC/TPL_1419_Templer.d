
instance TPL_1419_Templer(Npc_Default)
{
	name[0] = NAME_Templer;
	npcType = npctype_guard;
	guild = GIL_TPL;
	level = 12;
	voice = 8;
	id = 1419;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 184;
	attribute[ATR_HITPOINTS] = 184;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",66,1,tpl_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_01);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = Rtn_start_1419;
};


func void Rtn_start_1419()
{
	TA_Sleep(23,0,6,10,"PSI_34_HUT_IN");
	TA_PracticeSword(6,10,23,0,"PSI_TRAINING_8");
};

func void rtn_remove_1419()
{
	TA_Stay(23,0,16,0,"WP_INTRO01");
	TA_Stay(16,0,23,0,"WP_INTRO01");
};

