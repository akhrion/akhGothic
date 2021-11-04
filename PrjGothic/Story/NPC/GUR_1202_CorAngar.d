
instance GUR_1202_CorAngar(Npc_Default)
{
	name[0] = "Кор Ангар";
	npcType = npctype_friend;
	guild = GIL_TPL;
	level = 50;
	flags = NPC_FLAG_IMMORTAL;
	voice = 8;
	id = 1202;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 65;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,3,"Hum_Head_Bald",11,0,tpl_armor_h);
	B_Scale(self);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,4);
	CreateInvItem(self,itarrune_5_2_sleep);
	CreateInvItem(self,Roter_Wind);
	CreateInvItem(self,ItMi_Amulet_Psi_01);
	daily_routine = Rtn_start_1202;
	fight_tactic = FAI_HUMAN_MAGE;
};


func void Rtn_start_1202()
{
	TA_Sleep(1,0,5,0,"PSI_17_HUT_IN");
	TA_Boss(5,0,1,0,"PSI_TRAINING_TEACHER");
};

func void Rtn_CallSleeper_1202()
{
	TA_Stay(23,0,21,0,"PSI_TEMPLE_STAIRS_LEFT");
	TA_Stay(21,0,23,0,"PSI_TEMPLE_STAIRS_LEFT");
};

func void rtn_care_1202()
{
	TA_Guard(23,0,21,0,"PSI_TEMPLE_ROOMS_IN_02");
	TA_Guard(21,0,23,0,"PSI_TEMPLE_ROOMS_IN_02");
};

func void rtn_after_1202()
{
	ta_meditate_corangar(23,0,21,0,"PSI_TEMPLE_ROOMS_IN_02");
	ta_meditate_corangar(21,0,23,0,"PSI_TEMPLE_ROOMS_IN_02");
};

func void rtn_wait_1202()
{
	TA_Stay(1,0,5,0,"PSI_TEMPLE_ROOMS_04");
	TA_Stay(5,0,1,0,"PSI_TEMPLE_ROOMS_04");
};

func void rtn_guru_1202()
{
	TA_ReadBook(8,0,13,0,"PSI_TEMPLE_ROOMS_IN_02");
	TA_SitAround(13,0,19,0,"PSI_TEMPLE_SITTING_PRIEST");
	TA_Stay(19,0,22,0,"PSI_TEMPLE_STAIRS_02");
	TA_SitAround(22,0,8,0,"PSI_TEMPLE_ROOMS_IN_02");
};

