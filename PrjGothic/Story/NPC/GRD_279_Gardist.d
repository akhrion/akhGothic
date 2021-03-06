
instance GRD_279_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	npcType = npctype_guard;
	guild = GIL_GRD;
	level = 15;
	voice = 13;
	id = 279;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",13,1,grd_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
	EquipItem(self,ItMw_1H_Sword_02);
	CreateInvItem(self,ItFoCheese);
	CreateInvItem(self,ItFoApple);
	CreateInvItem(self,itke_weaponry);
	CreateInvItems(self,ItMiNugget,10);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_start_279;
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};


func void Rtn_start_279()
{
	TA_Guard(4,0,23,0,"OCC_BARONS_LEFT_ROOM_FRONT");
	TA_StandAround(23,0,0,0,"OCC_BARONS_RIGHT_ROOM_TABLE");
	TA_Guard(0,0,3,0,"OCC_BARONS_LEFT_ROOM_FRONT");
	TA_StandAround(3,0,4,0,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT");
};

