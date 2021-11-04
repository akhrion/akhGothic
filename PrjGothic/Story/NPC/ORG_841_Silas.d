
instance ORG_841_Silas(Npc_Default)
{
	name[0] = "Силас";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 15;
	voice = 6;
	id = 841;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",5,1,org_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	b_give_silaschapter1food();
	EquipItem(self,Silas_Axt);
	daily_routine = Rtn_start_841;
};


func void Rtn_start_841()
{
	TA_Boss(10,0,3,0,"NC_TAVERN_ROOM04");
	TA_Sleep(3,0,10,0,"NC_TAVERN_BACKROOM09");
};

