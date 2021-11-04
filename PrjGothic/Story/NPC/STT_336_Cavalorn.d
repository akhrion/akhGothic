
instance STT_336_Cavalorn(Npc_Default)
{
	name[0] = "Кавалорн";
	npcType = npctype_main;
	guild = GIL_STT;
	level = 5;
	voice = 12;
	id = 336;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 15;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,3,"Hum_Head_Psionic",10,2,stt_armor_m);
	B_Scale(self);
	Mdl_SetModelFatness(self,-1);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	B_Give_CavalornChapter1Weapons();
	EquipItem(self,tr_m_cavalorn);
	EquipItem(self,tr_r_cavalorn);
	CreateInvItems(self,ItAmArrow,16);
	CreateInvItem(self,ItFo_Potion_Water_01);
	CreateInvItem(self,ItFoApple);
	CreateInvItems(self,ItKeLockpick,5);
	daily_routine = Rtn_start_336;
};


func void Rtn_start_336()
{
	TA_Sleep(23,0,6,30,"OW_SAWHUT_SLEEP_01");
	TA_StandAround(6,30,21,0,"OW_SAWHUT_SLEEP_01");
	TA_SitCampfire(21,0,23,0,"OW_CAVALORN_01");
};

