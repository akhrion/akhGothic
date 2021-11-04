
instance CS_Eskorte5(Npc_Default)
{
	name[0] = "������5";
	slot = "guard";
	guild = GIL_GRD;
	level = 5;
	flags = 0;
	voice = 11;
	id = 3029;
	attribute[ATR_STRENGTH] = 13;
	attribute[ATR_DEXTERITY] = 9;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 26;
	attribute[ATR_HITPOINTS] = 26;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",18,2,grd_armor_i);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	daily_routine = Rtn_start_3029;
};


func void Rtn_start_3029()
{
	TA_Position(0,0,24,0,"WP_INTRO_WI01");
};

