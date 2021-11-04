
instance TPL_1401_GORNAKOSH_PSI(Npc_Default)
{
	name[0] = "��� �� ���";
	npcType = npctype_main;
	guild = GIL_TPL;
	level = 17;
	flags = 0;
	voice = 13;
	id = 14011;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 244;
	attribute[ATR_HITPOINTS] = 244;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",15,2,tpl_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_2H_Sword_Light_02);
	CreateInvItem(self,ItFoSoup);
	CreateInvItem(self,ItMiJoint_1);
	daily_routine = rtn_start_14011;
};


func void rtn_start_14011()
{
	TA_Smalltalk(0,0,12,0,"PSI_24_HUT_EX_SMALLTALK");
	TA_Smalltalk(12,0,24,0,"PSI_24_HUT_EX_SMALLTALK");
};


instance INFO_GORNAKOSH_EXIT(C_Info)
{
	npc = tpl_1401_gornakosh_psi;
	nr = 999;
	condition = info_raeubers_exit_condition;
	information = info_raeubers_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};

