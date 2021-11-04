
instance TPL_1400_GORNABAR_PSI(Npc_Default)
{
	name[0] = "Гор На Бар";
	npcType = npctype_main;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 9;
	id = 14001;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,2,"Hum_Head_FatBald",16,1,tpl_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	CreateInvItem(self,ItMi_Amulet_Psi_01);
	EquipItem(self,ItMw_2H_Sword_Light_03);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_3);
	CreateInvItem(self,ItLsTorch);
	daily_routine = rtn_start_14001;
};


func void rtn_start_14001()
{
	TA_Smalltalk(8,0,23,0,"PSI_24_HUT_EX_SMALLTALK");
	TA_Smalltalk(23,0,8,0,"PSI_24_HUT_EX_SMALLTALK");
};

func void rtn_namib_14001()
{
	TA_Smalltalk(8,0,23,0,"PSI_GUARD_TREE_EX");
	TA_Smalltalk(23,0,8,0,"PSI_GUARD_TREE_EX");
};


instance INFO_GORNABAR_EXIT(C_Info)
{
	npc = tpl_1400_gornabar_psi;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

