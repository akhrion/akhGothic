
instance STT_304_Schatten(Npc_Default)
{
	name[0] = NAME_Schatten;
	npcType = npctype_ambient;
	guild = GIL_STT;
	level = 5;
	voice = 10;
	id = 304;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Bald",14,2,stt_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_COWARD;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_Short_02);
	EquipItem(self,ItRw_Bow_Small_01);
	CreateInvItems(self,ItAmArrow,4);
	CreateInvItem(self,ItFo_Potion_Water_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItKeLockpick,2);
	daily_routine = Rtn_start_304;
};


func void Rtn_start_304()
{
	TA_Sleep(0,0,7,0,"OCR_HUT_6");
	TA_Smoke(7,0,9,0,"OCR_HUT_6");
	TA_Guard(9,0,10,0,"OCR_AT_HUT_3");
	TA_Smalltalk(10,0,0,0,"OCR_TO_HUT_6");
};

