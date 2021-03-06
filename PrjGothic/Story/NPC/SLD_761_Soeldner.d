
instance SLD_761_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	npcType = NpcType_MINE_Guard;
	guild = GIL_SLD;
	level = 18;
	voice = 3;
	id = 761;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 256;
	attribute[ATR_HITPOINTS] = 256;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Bald",107,1,sld_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	EquipItem(self,ItMw_1H_Mace_War_03);
	EquipItem(self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItem(self,ItMi_Stuff_Mug_01);
	daily_routine = Rtn_FMCstart_761;
};


func void Rtn_FMCstart_761()
{
	TA_GuardPassage(1,0,13,0,"FMC_PATH27");
	TA_GuardPassage(13,0,1,0,"FMC_PATH27");
};

