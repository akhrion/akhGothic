
instance GRD_275_Brueckenwache(Npc_Default)
{
	name[0] = NAME_Brueckenwache;
	npcType = npctype_ow_guard;
	guild = GIL_GRD;
	level = 10;
	voice = 6;
	id = 275;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,1,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	aivar[AIV_IMPORTANT] = TRUE;
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	EquipItem(self,ItMw_1H_Sword_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = Rtn_start_275;
};


func void Rtn_start_275()
{
	TA_Guard(6,0,21,0,"OW_PATH_1_1");
	TA_Guard(21,0,6,0,"OW_PATH_1_1");
};

func void rtn_fmtaken_275()
{
	TA_Guard(6,0,21,0,"OW_PATH_1_16");
	TA_Guard(21,0,6,0,"OW_PATH_1_16");
};

