
instance NOV_997_ALCHEMIST(Npc_Default)
{
	name[0] = "Труп";
	npcType = npctype_main;
	guild = GIL_NOV;
	level = 10;
	voice = 7;
	id = 997;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,1,"Hum_Head_Bald",26,3,nov_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItem(self,alchemy_egg);
	CreateInvItem(self,ItMw_1H_Sickle_01);
	CreateInvItems(self,ItFo_Plants_Herb_02,3);
	CreateInvItems(self,ItFo_Plants_Herb_03,6);
	CreateInvItems(self,ItFo_Plants_Nightshadow_01,5);
	CreateInvItems(self,ItMiNugget,129);
	daily_routine = rtn_start_997;
};


func void rtn_start_997()
{
	TA_Stand(8,0,20,0,"AM_024");
	TA_Stand(20,0,8,0,"AM_024");
};

