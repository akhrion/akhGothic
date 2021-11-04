
instance GRD_253_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 253;
	attribute[ATR_STRENGTH] = 35;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",14,1,grd_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = Rtn_start_253;
};


func void Rtn_start_253()
{
	TA_Guard(0,0,1,0,"OCR_OUTSIDE_HUT_63");
	TA_Guard(1,0,2,0,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Guard(2,0,3,0,"OCR_OUTSIDE_HUT_63");
	TA_Guard(3,0,4,0,"OCR_OUTSIDE_HUT_77_INSERT");
	TA_Sleep(4,0,10,0,"OCR_MAINGATE_GUARDROOM");
	TA_Smalltalk(10,0,0,0,"OCR_AT_HUT_3");
};

func void Rtn_FMTaken_253()
{
	TA_StayNeutral(7,0,20,0,"OCR_MAINGATE_OUTSIDE");
	TA_StayNeutral(20,0,7,0,"OCR_MAINGATE_OUTSIDE");
};

func void Rtn_FMTaken2_253()
{
	TA_Stay(7,0,20,0,"OCR_MAINGATE_OUTSIDE");
	TA_Stay(20,0,7,0,"OCR_MAINGATE_OUTSIDE");
};

