
instance GUR_1204_BaalNamib(Npc_Default)
{
	name[0] = "Идол Намиб";
	npcType = npctype_main;
	guild = GIL_GUR;
	level = 29;
	flags = NPC_FLAG_IMMORTAL;
	voice = 2;
	id = 1204;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 55;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 388;
	attribute[ATR_HITPOINTS] = 388;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",20,1,gur_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	CreateInvItem(self,itarrune_5_2_sleep);
	EquipItem(self,Namibs_Keule);
	daily_routine = Rtn_Start_1204;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void Rtn_Start_1204()
{
	TA_Smalltalk(8,0,20,0,"PSI_PATH_1");
	TA_Smalltalk(20,0,8,0,"PSI_PATH_1");
};

func void rtn_startch2_1204()
{
	TA_Smalltalk(8,0,23,0,"PSI_PATH_1");
	TA_Sleep(23,0,8,0,"PSI_GUARD_TREE_IN");
};

func void rtn_wait_1204()
{
	TA_Stay(8,0,20,0,"PSI_TEMPLE_IN_1");
	TA_Stay(20,0,8,0,"PSI_TEMPLE_IN_1");
};

func void rtn_yberion_1204()
{
	TA_SitAround(8,0,13,0,"PSI_TEMPLE_ROOMS_IN_02");
	TA_ReadBook(13,0,8,0,"PSI_TEMPLE_ROOMS_IN_02");
};

func void rtn_ritual_1204()
{
	TA_Stay(8,0,13,0,"PSI_CEREMONY_NEW6");
	TA_Stay(13,0,8,0,"PSI_CEREMONY_NEW6");
};

