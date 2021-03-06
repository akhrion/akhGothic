
instance GRD_220_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 10;
	voice = 7;
	id = 220;
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
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	EquipItem(self,ItMw_1H_Sword_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItMiNugget,10);
	daily_routine = Rtn_start_220;
};


func void Rtn_start_220()
{
	TA_PracticeSword(7,35,20,5,"OCC_CENTER_4_TRAIN2");
	TA_StandAround(20,5,0,5,"OCC_SHADOWS_CORNER_MOVEMENT");
	TA_Sleep(0,5,7,35,"OCC_MERCS_UPPER_RIGHT_ROOM_BED1");
};

func void Rtn_OT_220()
{
	TA_Guard(7,0,20,0,"OCC_CHAPEL_UPSTAIRS_LEFT");
	TA_Guard(20,0,7,0,"OCC_CHAPEL_UPSTAIRS_LEFT");
};

